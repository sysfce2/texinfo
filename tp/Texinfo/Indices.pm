# Indices.pm: merge and sort indices
#
# Copyright 2010-2023 Free Software Foundation, Inc.
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3 of the License,
# or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
# Original author: Patrice Dumas <pertusus@free.fr>
# Parts (also from Patrice Dumas) come from texi2html.pl.

package Texinfo::Indices;

use 5.00405;

# See comment at start of HTML.pm
use if $] >= 5.012, feature => 'unicode_strings';

use strict;
# Can be used to check that there is no incorrect autovivfication
# no autovivification qw(fetch delete exists store strict);

# Cannot do that because of sort_indices_by_letter, probably for uc().
# stop \s from matching non-ASCII spaces, etc.  \p{...} can still be
# used to match Unicode character classes.
#use if $] >= 5.014, re => '/a';

use Carp qw(cluck confess);

use Unicode::Normalize;

use Texinfo::IndicesXS;

use Texinfo::XSLoader;

use Texinfo::Common;

use Texinfo::Convert::Text;

require Exporter;
use vars qw($VERSION @ISA @EXPORT_OK %EXPORT_TAGS);
@ISA = qw(Exporter);

%EXPORT_TAGS = ( 'all' => [ qw(
  merge_indices
  sort_indices_by_index
  sort_indices_by_letter
) ] );

@EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

$VERSION = '7.1dev';

# XS parser and not explicitely unset
my $XS_structuring = ((not defined($ENV{TEXINFO_XS})
                        or $ENV{TEXINFO_XS} ne 'omit')
                       and (not defined($ENV{TEXINFO_XS_PARSER})
                            or $ENV{TEXINFO_XS_PARSER} eq '1')
                       and (not defined($ENV{TEXINFO_XS_STRUCTURE})
                            or $ENV{TEXINFO_XS_STRUCTURE} ne '0'));

my $XS_convert = 0;
$XS_convert = 1 if ($XS_structuring
                    and defined $ENV{TEXINFO_XS_CONVERT}
                    and $ENV{TEXINFO_XS_CONVERT} eq '1');

# used in conversion only, and should only be loaded with XS converters
my %XS_convert_overrides = (

  "Texinfo::Indices::index_entry_element_sort_string"
    => "Texinfo::IndicesXS::index_entry_element_sort_string",
  "Texinfo::Indices::setup_index_entry_keys_formatting",
    => "Texinfo::IndicesXS::setup_index_entry_keys_formatting",

);

our $module_loaded = 0;
sub import {
  if (!$module_loaded) {
    if ($XS_convert) {
      for my $sub (keys %XS_convert_overrides) {
        Texinfo::XSLoader::override ($sub, $XS_convert_overrides{$sub});
      }
    }
    $module_loaded = 1;
  }
  # The usual import method
  goto &Exporter::import;
}

sub _sort_key($$)
{
  my $a = shift;
  my $b = shift;
  my ($a_value, $a_alpha) = @$a;
  my ($b_value, $b_alpha) = @$b;
  if ($a_alpha == $b_alpha) {
    return ($a_value cmp $b_value);
  }
  return $a_alpha <=> $b_alpha;
}

sub _sort_index_entries($$)
{
  my $key1 = shift;
  my $key2 = shift;

  my $key_index = 0;
  # the keys array corresponds to the main entry and subentries
  foreach my $key1_str (@{$key1->{'keys'}}) {
    my $res = _sort_key($key1_str,
                           $key2->{'keys'}->[$key_index]);
    if ($res != 0) {
      return $res;
    }
    $key_index ++;
    if (scalar(@{$key2->{'keys'}}) <= $key_index) {
      last;
    }
  }
  my $res = (scalar(@{$key1->{'keys'}}) <=> scalar(@{$key2->{'keys'}}));
  if ($res == 0) {
    $res = ($key1->{'number'} <=> $key2->{'number'});
  }
  # This may happen if 2 indices are merged as the number is per
  # index name.
  if ($res == 0) {
    $res = ($key1->{'index_name'} cmp $key2->{'index_name'});
  }
  return $res;
}

sub _collator_sort_string($$$)
{
  my $a = shift;
  my $b = shift;
  my $collator = shift;
  return (($a =~ /^[[:alpha:]]/ and $b =~ /^[[:alpha:]]/)
              or ($a !~ /^[[:alpha:]]/ and $b !~ /^[[:alpha:]]/))
                 ? ($collator->cmp ($a, $b))
                 : (($a =~ /^[[:alpha:]]/ && 1) || -1);
}

# This is a duplicate of the functions above, for efficiency
sub _collator_sort_key($$$)
{
  my $a = shift;
  my $b = shift;
  my $collator = shift;
  my ($a_value, $a_alpha) = @$a;
  my ($b_value, $b_alpha) = @$b;
  if ($a_alpha == $b_alpha) {
    return $collator->cmp($a_value, $b_value);
  }
  return $a_alpha <=> $b_alpha;
}

sub _collator_sort_index_entries($$$)
{
  my $key1 = shift;
  my $key2 = shift;
  my $collator = shift;

  my $key_index = 0;
  # the keys array corresponds to th emain entry and subentries
  foreach my $key1_str (@{$key1->{'keys'}}) {
    my $res = _collator_sort_key($key1_str,
                                    $key2->{'keys'}->[$key_index],
                                    $collator);
    if ($res != 0) {
      return $res;
    }
    $key_index ++;
    if (scalar(@{$key2->{'keys'}}) <= $key_index) {
      last;
    }
  }
  my $res = (scalar(@{$key1->{'keys'}}) <=> scalar(@{$key2->{'keys'}}));
  if ($res == 0) {
    $res = ($key1->{'number'} <=> $key2->{'number'});
  }
  # This may happen if 2 indices are merged as the number is per
  # index name.
  if ($res == 0) {
    $res = ($key1->{'index_name'} cmp $key2->{'index_name'});
  }
  return $res;
}

sub setup_index_entry_keys_formatting($)
{
  my $customization_info = shift;

  my $additional_options = {};

  if (not $customization_info->get_conf('ENABLE_ENCODING')
      or lc($customization_info->get_conf('OUTPUT_ENCODING_NAME')) ne 'utf-8') {
    $additional_options->{'sort_string'} = 1;
  }

  my $text_options
    = Texinfo::Convert::Text::copy_options_for_convert_text($customization_info,
                                                           $additional_options);
  return $text_options;
}

# can be used for subentries.
# $DOCUMENT_INFO is used in XS to retrieve the document.
sub index_entry_element_sort_string($$$$;$)
{
  my $document_info = shift;
  my $main_entry = shift;
  my $index_entry_element = shift;
  my $options = shift;
  my $prefer_reference_element = shift;

  my $sort_string;
  if ($index_entry_element->{'extra'}
      and defined($index_entry_element->{'extra'}->{'sortas'})) {
    $sort_string = $index_entry_element->{'extra'}->{'sortas'};
  } else {
    my $entry_tree_element
      = Texinfo::Common::index_content_element($index_entry_element,
                                               $prefer_reference_element);
    $sort_string = Texinfo::Convert::Text::convert_to_text(
                              $entry_tree_element, $options);
    # FIXME do that for sortas too?
    if (defined($main_entry->{'entry_element'}
                       ->{'extra'}->{'index_ignore_chars'})) {
      my $ignore_chars = quotemeta($main_entry->{'entry_element'}
                                  ->{'extra'}->{'index_ignore_chars'});
      if ($ignore_chars ne '') {
        $sort_string =~ s/[$ignore_chars]//g;
      }
    }
  }
  return $sort_string;
}

sub _index_entry_element_sort_string_key($$$$$;$)
{
  my $document_info = shift;
  my $main_entry = shift;
  my $index_entry_element = shift;
  my $options = shift;
  my $collator = shift;
  my $prefer_reference_element = shift;

  my $sort_string = index_entry_element_sort_string ($document_info,
                               $main_entry, $index_entry_element,
                               $options, $prefer_reference_element);

  # This avoids varying results depending on whether the string is
  # represented internally in UTF-8.  See 'the "Unicode bug"' in the
  # "perlunicode" man page.
  utf8::upgrade($sort_string);
  my $sort_key;
  if ($collator) {
    $sort_key = $collator->getSortKey(uc($sort_string));
  } else {
    $sort_key = uc($sort_string);
  }

  return ($sort_string, $sort_key);
}

# This is a stub for the Unicode::Collate module.  Although this module is
# a core Perl module, some distributions may install a stripped-down Perl
# that doesn't include it, so providing this fall-back allows texi2any
# to run in such cases.  Using this fall-back will change index sorting,
# especially of punctuation characters and in non-English manuals.
#
# This fall-back also allows checking the performance impact of
# Unicode::Collate (last checked as about a 5% increase in runtime for
# typical Info output).

package Texinfo::CollateStub;

sub new($%) {
  my $class = shift;
  my %options = @_;

  my $self = {};
  bless $self, $class;
  return $self;
}

sub getSortKey($$) {
  my $self = shift;
  my $string = shift;

  return $string;
}

sub cmp($$$) {
  my ($self, $a, $b) = @_;

  return ($a cmp $b);
}

package Texinfo::Indices;

# if true pre-set collating keys
#my $default_preset_keys = 0;
my $default_preset_keys = 1;

# this is needed here, as the code can be called both from the main
# context, with a registrar and customization information, and from
# a converter
sub _converter_or_registrar_line_warn($$$$)
{
  my $registrar = shift;
  my $customization_information = shift;
  my $text = shift;
  my $error_location_info = shift;

  if (defined($registrar)) {
    $registrar->line_warn($customization_information, $text,
                          $error_location_info);
  } else {
    $customization_information->converter_line_warn($text,
                                                    $error_location_info);
  }
}

# There is no neeed for document information in Perl, however, in XS
# it is needed to retrieve the Tree elements in the C structures.
# $CUSTOMIZATION_INFORMATION is used as the source of document
# information.  It should already be set if it is a converter based
# on Texinfo::Convert::Converter, but otherwise it should be set by
# the caller, setting 'document_descriptor' to document->document_descriptor().
# If $PRESET_KEYS is set, the entries sort keys are set with a collator help
# and the default sort function can be directly used.  If unset, no collator
# is passed to the functions setting the sort key, but a collator is used for
# sorting.  In practice $PRESET_KEYS is always set, as the default
# $default_preset_keys, which set to 1 is always used in calling functions
# to determine the value of $PRESET_KEYS.
sub setup_sortable_index_entries($$$$$)
{
  my $registrar = shift;
  my $customization_information = shift;
  my $index_entries = shift;
  my $indices_information = shift;
  my $preset_keys = shift;

  # The 'Non-Ignorable' for variable collation elements means that they are
  # treated as normal characters.   This allows to have spaces and punctuation
  # marks sort before letters.
  # http://www.unicode.org/reports/tr10/#Variable_Weighting
  my %collate_options = ( 'variable' => 'Non-Ignorable' );

  # TODO Unicode::Collate has been in perl core long enough, but
  # Unicode::Collate::Locale is present since perl major version 5.14 only,
  # released in 2011.  So probably better to use Unicode::Collate until 2031
  # (and if documentlanguage is not set) and switch to Unicode::Collate::Locale
  # at this date.
  #my $collator = Unicode::Collate::Locale->new('locale' => $documentlanguage,
  #                                             %collate_options);

  # The Unicode::Collate sorting changes often, based on the UCA version.
  # To test the result with a specific version, the UCA_Version should be set,
  # and, more importantly the table should correspond to that version.
  # To test a specific table, in tp, do
  # wget -N http://www.unicode.org/Public/UCA/6.2.0/allkeys.txt
  # mkdir -p Unicode/Collate/
  # mv allkeys.txt Unicode/Collate/allkeys-6.2.0.txt
  # The table argument leads to a very important slowdown, so the argument
  # should only be used for checks.
  # The test results seem to be consistent with 6.2.0, corresponding
  # to the perl 5.18.0 Unicode::Collate

  # to test for 6.2.0
  #%collate_options = (%collate_options,
  #                    'UCA_Version' => 24,
  #                    'table' => 'allkeys-6.2.0.txt');
  # To test files affected for UCA corresponding to perl 5.8.1
  # wget -N http://www.unicode.org/Public/UCA/3.1.1/allkeys-3.1.1.txt
  #%collate_options = (%collate_options,
  #                   'UCA_Version' => 9,
  #                   'table' => 'allkeys-3.1.1.txt');

  my $use_unicode_collation
    = $customization_information->get_conf('USE_UNICODE_COLLATION');

  my $collator;
  if (!(defined($use_unicode_collation)
        and !$use_unicode_collation)) {
    eval { require Unicode::Collate; Unicode::Collate->import; };
    my $unicode_collate_loading_error = $@;
    if ($unicode_collate_loading_error eq '') {
      $collator = Unicode::Collate->new(%collate_options);
    }
  }
  # Fall back to stub if Unicode::Collate not wanted or not available.
  $collator = Texinfo::CollateStub->new() if (!defined($collator));

  my $entries_collator;
  $entries_collator = $collator if $preset_keys;
  my $index_sortable_index_entries;
  my $index_entries_sort_strings = {};
  return $index_sortable_index_entries, $collator, $index_entries_sort_strings
    unless ($index_entries);

  my $convert_text_options
    = setup_index_entry_keys_formatting($customization_information);
  $index_sortable_index_entries = {};
  foreach my $index_name (keys(%$index_entries)) {
    my $sortable_index_entries = [];
    foreach my $index_entry (@{$index_entries->{$index_name}}) {
      my $entry_index_name = $index_entry->{'index_name'};
      my $main_entry_element = $index_entry->{'entry_element'};
      my $in_code = $indices_information->{$entry_index_name}->{'in_code'};
      if ($in_code) {
        Texinfo::Convert::Text::set_options_code($convert_text_options);
      }
      my ($entry_key, $sort_entry_key)
        = _index_entry_element_sort_string_key($customization_information,
                                   $index_entry, $main_entry_element,
                                   $convert_text_options, $entries_collator);
      my @entry_keys;
      my @sort_entry_keys;
      if ($entry_key !~ /\S/) {
        my $entry_cmdname = $main_entry_element->{'cmdname'};
        $entry_cmdname
          = $main_entry_element->{'extra'}->{'original_def_cmdname'}
           if (!defined($entry_cmdname));
        _converter_or_registrar_line_warn($registrar,
                                   $customization_information,
                       sprintf(__("empty index key in \@%s"),
                                  $entry_cmdname),
                               $main_entry_element->{'source_info'});
        push @entry_keys, '';
        push @sort_entry_keys, '';
      } else {
        push @entry_keys, $entry_key;
        push @sort_entry_keys, $sort_entry_key;
      }
      my $subentry_nr = 0;
      my $subentry = $main_entry_element;
      while ($subentry->{'extra'} and $subentry->{'extra'}->{'subentry'}) {
        $subentry_nr ++;
        $subentry = $subentry->{'extra'}->{'subentry'};
        my ($subentry_key, $sort_subentry_key)
              = _index_entry_element_sort_string_key($customization_information,
                             $index_entry, $subentry, $convert_text_options,
                                $entries_collator);
        if ($subentry_key !~ /\S/) {
          my $entry_cmdname = $main_entry_element->{'cmdname'};
          $entry_cmdname
            = $main_entry_element->{'extra'}->{'original_def_cmdname'}
              if (!defined($entry_cmdname));
          _converter_or_registrar_line_warn($registrar,
                                $customization_information,
                         sprintf(__("empty index sub entry %d key in \@%s"),
                                    $subentry_nr, $entry_cmdname),
                                  $main_entry_element->{'source_info'});
          push @entry_keys, '';
          push @sort_entry_keys, '';
        } else {
          push @entry_keys, $subentry_key;
          push @sort_entry_keys, $sort_subentry_key;
        }
      }
      foreach my $sub_entry_key (@sort_entry_keys) {
        if ($sub_entry_key ne '') {
          my @keys_and_alpha;
          for (my $i = 0; $i < scalar (@entry_keys); $i++) {
            my $alpha = 0;
            if ($entry_keys[$i] =~ /^[[:alpha:]]/) {
              $alpha = 1;
            }
            push @keys_and_alpha, [$sort_entry_keys[$i], $alpha];
          }
          my $sortable_entry = {'entry' => $index_entry,
                                'keys' => \@keys_and_alpha,
                                'entry_keys' => \@entry_keys,
                                'number' => $index_entry->{'entry_number'},
                                'index_name' => $entry_index_name};
          push @{$sortable_index_entries}, $sortable_entry;
          last;
        }
      }
      if ($in_code) {
        Texinfo::Convert::Text::reset_options_code($convert_text_options);
      }
      $index_entries_sort_strings->{$index_entry} = join(', ', @entry_keys);
    }
    $index_sortable_index_entries->{$index_name} = $sortable_index_entries;
  }
  return ($index_sortable_index_entries, $collator, $index_entries_sort_strings);
}

sub sort_indices_by_index($$$$;$)
{
  my $registrar = shift;
  my $customization_information = shift;
  my $index_entries = shift;
  my $indices_information = shift;
  my $preset_keys = shift;
  $preset_keys = $default_preset_keys if (!defined($preset_keys));

  my $sorted_index_entries;
  my ($index_sortable_index_entries, $collator, $index_entries_sort_strings)
    = setup_sortable_index_entries($registrar, $customization_information,
                       $index_entries, $indices_information, $preset_keys);

  if (!$index_sortable_index_entries) {
    return ($sorted_index_entries, $index_entries_sort_strings);
  }

  $sorted_index_entries = {};
  foreach my $index_name (keys(%$index_sortable_index_entries)) {
    my $sortable_index_entries = $index_sortable_index_entries->{$index_name};
    if ($preset_keys) {
      $sorted_index_entries->{$index_name} = [
        map {$_->{'entry'}} sort {_sort_index_entries($a, $b)}
                                                @{$sortable_index_entries}
       ];
    } else {
      $sorted_index_entries->{$index_name} = [
    map {$_->{'entry'}} sort {_collator_sort_index_entries($a, $b, $collator)}
                                                @{$sortable_index_entries}
      ];
    }
  }
  return ($sorted_index_entries, $index_entries_sort_strings);
}

sub sort_indices_by_letter($$$$;$)
{
  my $registrar = shift;
  my $customization_information = shift;
  my $index_entries = shift;
  my $indices_information = shift;
  my $preset_keys = shift;
  $preset_keys = $default_preset_keys if (!defined($preset_keys));

  my $sorted_index_entries;
  my ($index_sortable_index_entries, $collator, $index_entries_sort_strings)
    = setup_sortable_index_entries($registrar, $customization_information,
                       $index_entries, $indices_information, $preset_keys);

  if (!$index_sortable_index_entries) {
    return ($sorted_index_entries, $index_entries_sort_strings);
  }

  $sorted_index_entries = {};
  foreach my $index_name (keys(%$index_sortable_index_entries)) {
    my $sortable_index_entries = $index_sortable_index_entries->{$index_name};
    my $index_letter_hash = {};
    foreach my $sortable_entry (@{$sortable_index_entries}) {
      my $entry_key = $sortable_entry->{'entry_keys'}->[0];

      # the following line leads to each accented letter being separate
      # $letter = uc(substr($entry_key, 0, 1));
      my $letter_string = uc(substr($entry_key, 0, 1));
      # determine main letter by decomposing and removing diacritics
      my $letter = Unicode::Normalize::NFKD($letter_string);
      $letter =~ s/\p{NonspacingMark}//g;
      # following code is less good, as the upper-casing may lead to
      # two letters in case of the german Eszett that becomes SS.  So
      # it is better to upper-case first and remove diacritics after.
      #my $normalized_string = Unicode::Normalize::NFKD(uc($entry_key));
      #$normalized_string =~ s/\p{NonspacingMark}//g;
      #$letter = substr($normalized_string, 0, 1);

      push @{$index_letter_hash->{$letter}}, $sortable_entry;
    }
    # need to use directly the collator here as there is no
    # separate sort keys.
    my @sorted_letters = sort {_collator_sort_string($a, $b, $collator)}
                                             (keys %$index_letter_hash);
    foreach my $letter (@sorted_letters) {
      my @sorted_letter_entries;
      if ($preset_keys) {
        @sorted_letter_entries
         = map {$_->{'entry'}} sort {_sort_index_entries($a, $b)}
                                            @{$index_letter_hash->{$letter}};
      } else {
        @sorted_letter_entries
         = map {$_->{'entry'}} sort {_collator_sort_index_entries($a, $b, $collator)}
                                            @{$index_letter_hash->{$letter}};
      }
      push @{$sorted_index_entries->{$index_name}},
        { 'letter' => $letter, 'entries' => \@sorted_letter_entries };
    }
  }
  return ($sorted_index_entries, $index_entries_sort_strings);
}

sub merge_indices($)
{
  my $indices_information = shift;

  my $merged_index_entries;
  foreach my $index_name (keys(%$indices_information)) {
    my $index_info = $indices_information->{$index_name};
    if ($index_info->{'index_entries'}) {
      $merged_index_entries = {} if (! $merged_index_entries);
      my $in_idx_name = $index_name;
      if ($index_info->{'merged_in'}) {
        my $ultimate_idx = Texinfo::Common::ultimate_index($indices_information,
                                                           $index_info);
        $in_idx_name = $ultimate_idx->{'name'};
      }
      push @{$merged_index_entries->{$in_idx_name}},
        @{$index_info->{'index_entries'}};
    }
  }
  return $merged_index_entries;
}


1;

__END__

=head1 NAME

Texinfo::Indices - sorting and merging indices in Texinfo

=head1 SYNOPSIS

  use Texinfo::Indices qw(merge_indices sort_indices_by_letter
                          sort_indices_by_index);

  # $document is a parsed Texinfo::Document document, $parser is
  # a Texinfo::Parser object. $config is an object implementing the
  # get_conf() method.
  my $registrar = $parser->registered_errors();

  my $indices_information = $document->indices_information();
  my $merged_index_entries
     = merge_indices($indices_information);
  my $index_entries_sorted;
  if ($sort_by_letter) {
    $index_entries_sorted = sort_indices_by_letter($registrar, $config,
                             $merged_index_entries, $indices_information);
  } else {
    $index_entries_sorted = sort_indices_by_index($registrar, $config,
                             $merged_index_entries, $indices_information);
  }


=head1 NOTES

The Texinfo Perl module main purpose is to be used in C<texi2any> to convert
Texinfo to other formats.  There is no promise of API stability.

=head1 DESCRIPTION

C<merge_indices> may be used to merge indices, which may be sorted
with C<sort_indices_by_index> or C<sort_indices_by_letter>.


=head1 METHODS

No method is exported in the default case.

Some methods takes a L<Texinfo::Report> C<$registrar> as argument for
error reporting.  Some also require Texinfo customization variables
information, which means an object implementing the C<get_conf> method, in
practice the main program configuration or a converter
(L<Texinfo::Convert::Converter/Getting and setting customization
variables>).  Other common input arguments such as indices information
are obtained from a parsed document, see L<Texinfo::Document>.

=over

=item $sort_string = index_entry_element_sort_string($document_info, $main_entry, $index_entry_element, $options, $prefer_reference_element)
X<C<index_entry_element_sort_string>>

Return a string suitable as a sort string, for index entries.
I<$document_info> is used by C code to retrieve the document data,
using the C<document_descriptor> key.  I<$document_info> can be a
converter based on L<Texinfo::Convert::Converter>, otherwise
C<document_descriptor> need, in general, to be set up explicitely.
The tree element index entry processed is I<$index_entry_element>,
and can be a C<@subentry>.  I<$main_entry> is the main index entry
that can be used to gather information.  The I<$options> are options
used for Texinfo to text conversion for the generation of the sort
string, typically obtained from
L<setup_index_entry_keys_formatting|/$option = setup_index_entry_keys_formatting($customization_information)>.
If I<$prefer_reference_element> is set, prefer an untranslated
element for the formatting as sort string.

=item $merged_entries = merge_indices($indices_information)
X<C<merge_indices>>

Using information returned by L<< C<Texinfo::Document::indices_information>|Texinfo::Document/$indices_information = $document->indices_information() >>,
a structure holding all the index entries by index name is returned,
with all the entries of merged indices merged with those of the indice
merged into.

The I<$merged_entries> returned is a hash reference whose
keys are the index names and values arrays of index entry structures
described in details in L<Texinfo::Document/index_entries>.

=item $option = setup_index_entry_keys_formatting($customization_information)
X<C<setup_index_entry_keys_formatting>>

Return options for conversion of Texinfo to text relevant for index keys sorting.

=item ($index_entries_sorted, $index_entries_sort_strings) = sort_indices_by_index($registrar, $customization_information, $merged_index_entries, $indices_information)

=item ($index_entries_sorted, $index_entries_sort_strings) = sort_indices_by_letter($registrar, $customization_information, $merged_index_entries, $indices_information)
X<C<sort_indices_by_index>> X<C<sort_indices_by_letter>>

C<sort_indices_by_letter> sorts by index and letter, while
C<sort_indices_by_index> sort all entries of an index together.
In both cases, a hash reference with index names as keys I<$index_entries_sorted>
is returned.

When sorting by letter, an array reference of letter hash references is
associated with each index name.  Each letter hash reference has two
keys, a I<letter> key with the letter, and an I<entries> key with an array
reference of sorted index entries beginning with the letter.

When simply sorting, the array of the sorted index entries is associated
with the index name.

I<$index_entries_sort_strings> is a hash reference associating the index
entries with the strings that were used to sort them.

Register errors in I<$registrar>.

=back

=head1 SEE ALSO

L<Texinfo manual|http://www.gnu.org/s/texinfo/manual/texinfo/>,
L<Texinfo::Document>.

=head1 AUTHOR

Patrice Dumas, E<lt>pertusus@free.frE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright 2010- Free Software Foundation, Inc.  See the source file for
all copyright years.

This library is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 3 of the License, or (at
your option) any later version.

=cut
