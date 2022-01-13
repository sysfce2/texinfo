# HTML.pm: output tree as HTML.
#
# Copyright 2011-2021 Free Software Foundation, Inc.
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
#
# The following categories of formatting functions can be replaced
# by the user.  The associated hash with defaults is also shown:
#  * command tree element formatting functions defaults in
#    %default_commands_conversion
#  * command tree element opening functions defaults in
#    %default_commands_open
#  * type tree element (element without @-command) formatting
#    functions, defaults in %default_types_conversion
#  * type tree element opening functions defaults in
#    %default_types_open
#  * other formatting functions, defaults in
#    %default_formatting_references
#
# The functions used in the default case for all the functions
# that may be replaced should not have side effects, such that
# users can overrides them independently without risking unwanted
# results.  Also in formatting functions, the state of the
# converter should only be accessed through functions, such
# as in_math, in_preformatted, preformatted_classes_stack and
# similar functions.
#
# In most formatting functions, the case where $self->in_string() is
# true should be handled explicitely and the simplest formatting should be
# done in that case, without any HTML element such that the result
# can be in an attribute or in a comment.
#
# FIXME: there are already cases with side effects, with the
# variables $html_menu_entry_index, $foot_lines.
# 
# Original author: Patrice Dumas <pertusus@free.fr>

package Texinfo::Convert::HTML;

use 5.00405;

# See 'The "Unicode Bug"' under 'perlunicode' man page.  This means
# that regular expressions will treat characters 128-255 in a Perl string
# the same regardless of whether the string is using a UTF-8 encoding.
#  For older Perls, you can use utf8::upgrade on the strings, where the
# difference matters.
use if $] >= 5.012, feature => 'unicode_strings';

use strict;

use Carp qw(cluck confess);

use File::Copy qw(copy);

use Storable;

use Texinfo::Common;
use Texinfo::Structuring;
use Texinfo::Convert::Unicode;
use Texinfo::Convert::Utils;
use Texinfo::Convert::Texinfo;
use Texinfo::Convert::Text;
use Texinfo::Convert::Converter;
use Texinfo::Convert::NodeNameNormalization;

use Texinfo::Config;

require Exporter;
use vars qw($VERSION @ISA);
@ISA = qw(Texinfo::Convert::Converter);

$VERSION = '6.8dev';


# misc commands that are of use for formatting.
my %formatted_misc_commands = %Texinfo::Common::formatted_misc_commands;
my %formattable_misc_commands = %Texinfo::Common::formattable_misc_commands;
my %no_brace_commands = %Texinfo::Common::no_brace_commands;
my %accent_commands = %Texinfo::Common::accent_commands;
my %misc_commands = %Texinfo::Common::misc_commands;
my %sectioning_commands = %Texinfo::Common::sectioning_commands;
my %def_commands = %Texinfo::Common::def_commands;
my %ref_commands = %Texinfo::Common::ref_commands;
my %brace_commands = %Texinfo::Common::brace_commands;
my %block_commands = %Texinfo::Common::block_commands;
my %menu_commands = %Texinfo::Common::menu_commands;
my %root_commands = %Texinfo::Common::root_commands;
my %preformatted_commands = %Texinfo::Common::preformatted_commands;
my %math_commands = %Texinfo::Common::math_commands;
my %explained_commands = %Texinfo::Common::explained_commands;
my %item_container_commands = %Texinfo::Common::item_container_commands;
my %raw_commands = %Texinfo::Common::raw_commands;
my %format_raw_commands = %Texinfo::Common::format_raw_commands;
my %inline_commands = %Texinfo::Common::inline_commands;
my %inline_format_commands = %Texinfo::Common::inline_format_commands;
my %code_style_commands       = %Texinfo::Common::code_style_commands;
my %regular_font_style_commands = %Texinfo::Common::regular_font_style_commands;
my %preformatted_code_commands = %Texinfo::Common::preformatted_code_commands;
my %default_index_commands = %Texinfo::Common::default_index_commands;
my %style_commands = %Texinfo::Common::style_commands;
my %align_commands = %Texinfo::Common::align_commands;
my %region_commands = %Texinfo::Common::region_commands;
my %context_brace_commands = %Texinfo::Common::context_brace_commands;
my %letter_no_arg_commands = %Texinfo::Common::letter_no_arg_commands;

my %small_alias;
for my $cmd ('example', 'display', 'format', 'lisp', 'quotation',
             'indentedblock') {
  $small_alias{'small'.$cmd} = $cmd;
};

foreach my $def_command (keys(%def_commands)) {
  $formatted_misc_commands{$def_command} = 1 if ($misc_commands{$def_command});
}

# FIXME remove raw commands?
my %format_context_commands = (%block_commands, %root_commands);

foreach my $misc_context_command('tab', 'item', 'itemx', 'headitem') {
  $format_context_commands{$misc_context_command} = 1;
}

my %composition_context_commands = (%preformatted_commands, %root_commands,
  %menu_commands, %align_commands);
$composition_context_commands{'float'} = 1;

my %pre_class_types;

# FIXME allow customization? (also in DocBook)
my %upper_case_commands = ( 'sc' => 1 );

# API for html formatting

sub _collect_css_element_class($$)
{
  my $self = shift;
  my $element_class = shift;
  
  #if (not defined($self->{'current_filename'})) {
  #  cluck "CFND";
  #}
  if (defined($self->{'css_map'}->{$element_class})) {
    if ($self->{'document_global_context'}) {
      $self->{'document_global_context_css'}->{$element_class} = 1;
    } elsif (defined($self->{'current_filename'})) {
      $self->{'file_css'}->{$self->{'current_filename'}}->{$element_class} = 1;
    }
  }
}

# $extra_classes should be an array reference or undef
sub html_attribute_class($$$;$)
{
  my $self = shift;
  my $element = shift;
  my $class = shift;
  my $extra_classes = shift;

  if (!defined($class) or $class eq '' or $self->get_conf('NO_CSS')) {
    if ($element eq 'span') {
      return '';
    } else {
      return "<$element";
    }
  }

  my $style = '';

  my @all_classes = ($class);
  if (defined($extra_classes)) {
    push @all_classes, @$extra_classes;
  }
  if ($self->get_conf('INLINE_CSS_STYLE')) {
    my @styles = ();
    foreach my $style_class (@all_classes) {
      if (defined($self->{'css_map'}->{"$element.$style_class"})) {
        push @styles, $self->{'css_map'}->{"$element.$style_class"};
      }
    }
    if (scalar(@styles) >  0) {
      $style = ' style="'.join(';', @styles).'"';
    }
  } else {
    foreach my $style_class (@all_classes) {
      $self->_collect_css_element_class("$element.$style_class");
    }
  }
  my $class_str = join(' ', map {$self->_protect_class_name($_)} @all_classes);
  return "<$element class=\"$class_str\"$style";
}

# those rules cannot be collected during document output since they
# are not associated with a class attribute element setting
my %css_rules_not_collected = (
);

sub html_get_css_elements_classes($;$)
{
  my $self = shift;
  my $filename = shift;

  my %css_elements_classes = %css_rules_not_collected;
  if ($self->{'document_global_context_css'}) {
    %css_elements_classes = ( %css_elements_classes,
                              %{$self->{'document_global_context_css'}} );
  }

  if (defined($filename) and $self->{'file_css'}->{$filename}) {
    %css_elements_classes = ( %css_elements_classes,
                              %{$self->{'file_css'}->{$filename}} );
  }

  if ($css_elements_classes{'a.copiable-link'}) {
    $css_elements_classes{'span:hover a.copiable-link'} = 1;
  }

  return sort(keys(%css_elements_classes));
}

sub close_html_lone_element($$) {
  my $self = shift;
  my $html_element = shift;
  if ($self->get_conf('USE_XML_SYNTAX')) {
    return $html_element . '/>';
  }
  return $html_element .'>';
}

sub html_non_breaking_space($)
{
  my $self = shift;
  return $self->{'non_breaking_space'};
}

my $xml_numeric_entity_nbsp = '&#'.hex('00A0').';';
my $xml_named_entity_nbsp = '&nbsp;';

my $html_default_entity_nbsp = $xml_named_entity_nbsp;

sub substitute_html_non_breaking_space($$)
{
  my $self = shift;
  my $text = shift;

  my $non_breaking_space = $self->html_non_breaking_space();
  # using \Q \E on the substitution leads to spurious \
  $text =~ s/\Q$html_default_entity_nbsp\E/$non_breaking_space/g;
  return $text;
}

sub html_line_break_element($)
{
  my $self = shift;

  return $self->{'line_break_element'};
}

my @image_files_extensions = ('.png', '.jpg', '.jpeg', '.gif');

# this allows init files to get the location of the image files
# which cannot be determined from the result, as the file
# location is not used in the element output.
sub html_image_file_location_name($$$$)
{
  my $self = shift;
  my $cmdname = shift;
  my $command = shift;
  my $args = shift;

  my @extensions = @image_files_extensions;

  my $image_file;
  my $image_basefile;
  my $image_extension;
  my $image_path;
  if (defined($args->[0]->{'monospacetext'}) and $args->[0]->{'monospacetext'} ne '') {
    $image_basefile = $args->[0]->{'monospacetext'};
    my $extension;
    if (defined($args->[4]) and defined($args->[4]->{'monospacetext'})) {
      $extension = $args->[4]->{'monospacetext'};
      unshift @extensions, ("$extension", ".$extension");
    }
    foreach my $extension (@extensions) {
      my $located_image_path
           = $self->Texinfo::Common::locate_include_file($image_basefile.$extension);
      if (defined($located_image_path) and $located_image_path ne '') {
        $image_path = $located_image_path;
        # use the @-command argument and not the file found using the
        # include paths.  It is considered that the files in include paths
        # will be moved by the caller anyway.
        $image_file = $image_basefile.$extension;
        $image_extension = $extension;
        last;
      }
    }
    if (!defined($image_file) or $image_file eq '') {
      if (defined($extension) and $extension ne '') {
        $image_file = $image_basefile.$extension;
        $image_extension = $extension;
      } else {
        $image_file = "$image_basefile.jpg";
        $image_extension = 'jpg';
      }
    }
  }
  return ($image_file, $image_basefile, $image_extension, $image_path);
}

my %default_css_string_commands_conversion;
my %default_css_string_types_conversion;
my %default_css_string_formatting_references;

sub html_convert_css_string($$;$)
{
  my $self = shift;
  my $element = shift;
  my $explanation = shift;

  my $saved_commands = {};
  my $saved_types = {};
  my $saved_formatting_references = {};
  foreach my $cmdname (keys(%default_css_string_commands_conversion)) {
    $saved_commands->{$cmdname} = $self->{'commands_conversion'}->{$cmdname};
    $self->{'commands_conversion'}->{$cmdname} = $default_css_string_commands_conversion{$cmdname};
  }
  foreach my $type (keys(%default_css_string_types_conversion)) {
    $saved_types->{$type} = $self->{'types_conversion'}->{$type};
    $self->{'types_conversion'}->{$type} = $default_css_string_types_conversion{$type};
  }
  foreach my $formatting_reference (keys(%default_css_string_formatting_references)) {
    $saved_formatting_references->{$formatting_reference} = $self->{$formatting_reference};
    $self->{$formatting_reference}
      = $default_css_string_formatting_references{$formatting_reference};
  }

  my $result = $self->convert_tree_new_formatting_context({'type' => '_string',
                                                           'contents' => [$element]},
                                                          'css_string', $explanation);
  foreach my $cmdname (keys (%default_css_string_commands_conversion)) {
    $self->{'commands_conversion'}->{$cmdname} = $saved_commands->{$cmdname};
  }
  foreach my $type (keys(%default_css_string_types_conversion)) {
    $self->{'types_conversion'}->{$type} = $saved_types->{$type};
  }
  foreach my $formatting_reference (keys(%default_css_string_formatting_references)) {
    $self->{$formatting_reference}
     = $saved_formatting_references->{$formatting_reference};
  }
  return $result;
}

my %special_list_bullet_css_string_no_arg_command = (
# tried to use HYPHEN BULLET \2043 for use as in a bullet list, but, at least
# with my test of firefox the result is very different from a bullet.
# hyphen minus or hyphen \2010 are even smaller than hyphen bullet.
# Use the Unicode codepoint used normally is for a mathematical minus \2212
# even though it is too large, but the others are too short...
# (which is actually the default, but this could change).
  #'minus' => '-',
  #'minus' => '\2010 ',
  'minus' => '\2212 ',
);

sub html_convert_css_string_for_list_bullet($$;$)
{
  my $self = shift;
  my $element = shift;
  my $explanation = shift;

  my $saved_css_string_no_arg_command = {};
  foreach my $command (keys(%special_list_bullet_css_string_no_arg_command)) {
    $saved_css_string_no_arg_command->{$command}
      = $self->{'no_arg_commands_formatting'}->{'css_string'}->{$command};
    $self->{'no_arg_commands_formatting'}->{'css_string'}->{$command}
      = $special_list_bullet_css_string_no_arg_command{$command};
  }
  my $result = $self->html_convert_css_string($element, $explanation);
  foreach my $command (keys(%special_list_bullet_css_string_no_arg_command)) {
    $self->{'no_arg_commands_formatting'}->{'css_string'}->{$command}
      = $saved_css_string_no_arg_command->{$command};
  }
  return $result;
}

# API to access converter state for customization code

sub in_math($)
{
  my $self = shift;
  return $self->{'document_context'}->[-1]->{'math'};
}

# set if in menu or preformatted command
sub in_preformatted($)
{
  my $self = shift;
  my $context = $self->{'document_context'}->[-1]->{'composition_context'}->[-1];
  if ($preformatted_commands{$context}
      or $pre_class_types{$context}
      or ($menu_commands{$context} and $self->_in_preformatted_in_menu())) {
    return $context;
  } else {
    return undef;
  }
}

sub in_upper_case($)
{
  my $self = shift;
  return $self->{'document_context'}->[-1]->{'formatting_context'}->[-1]->{'upper_case'};
}

sub in_space_protected($)
{
  my $self = shift;
  return $self->{'document_context'}->[-1]->{'formatting_context'}->[-1]->{'space_protected'};
}

sub in_code($)
{
  my $self = shift;
  return $self->{'document_context'}->[-1]->{'monospace'}->[-1];
}

sub in_string($)
{
  my $self = shift;
  return $self->{'document_context'}->[-1]->{'string'};
}

sub in_verbatim($)
{
  my $self = shift;
  return $self->{'document_context'}->[-1]->{'verbatim'};
}

sub in_raw($)
{
  my $self = shift;
  return $self->{'document_context'}->[-1]->{'raw'};
}

sub paragraph_number($)
{
  my $self = shift;
  return $self->{'document_context'}->[-1]->{'formatting_context'}->[-1]->{'paragraph_number'};
}

sub preformatted_number($)
{
  my $self = shift;
  return $self->{'document_context'}->[-1]->{'formatting_context'}->[-1]->{'preformatted_number'};
}

sub count_elements_in_filename($$)
{
  my $self = shift;
  my $filename = shift;
  
  if (defined($self->{'elements_in_file_count'}->{$filename})) {
    return $self->{'elements_in_file_count'}->{$filename};
  }
  return undef;
}

sub top_format($)
{
  my $self = shift;
  return $self->{'document_context'}->[-1]->{'formats'}->[-1];
}

sub commands_stack($)
{
  my $self = shift;
  return @{$self->{'document_context'}->[-1]->{'commands'}};
}

sub preformatted_classes_stack($)
{
  my $self = shift;
  return @{$self->{'document_context'}->[-1]->{'preformatted_classes'}};
}

sub in_align($)
{  
  my $self = shift;
  my $context 
       = $self->{'document_context'}->[-1]->{'composition_context'}->[-1];
  if ($align_commands{$context}) {
    return $context;
  } else {
    return undef;
  }
}

# the main data structure of the element target API is a hash reference, called
# the target information.
# The 'target' and 'filename' keys should be set for every type of element,
# but the other keys will only be set on some elements.
#
# The following keys can be set:
#
# Strings
#
#   'target': A unique string representing the target.  Used as argument to
#             'id' attribute.
#   'contents_target': A unique string representing the target to the location
#                      of the element in the table of content.
#   'shortcontents_target': A unique string representing the target to the location
#                      of the element in the short table of contents
#   'node_filename': the file name deriving from the element node name
#   'section_filename': the file name deriving from the element section name
#   'special_element_filename': the file name of special elements (separate contents, about...)
#   'filename': the file name the element content is output to
#   'text', 'text_nonumber': a textual representation of the element where there is
#                   no restriction on the text formatting (ie HTML elements can be used).
#                   With _nonumber, no section number.
#   'string', 'string_nonumber': a textual representation of the element with restrictions
#                   on the available formatting, in practice no HTML elements, only entities
#                   to be able to use in attributes. With _nonumber, no section number.
#
# Other types
#
#   'tree', 'tree_nonumber: a Texinfo tree element which conversion should correspond to
#                   the element name.  With _nonumber, no section number.
#   'root_command': the top level element associated with the target element.
#
# Some functions cache their results in these hashes.

# $COMMAND should be a tree element which is a possible target of a link.
# return the target information.
sub _get_target($$)
{
  my $self = shift;
  my $command = shift;
  my $target;
  if (!defined($command)) {
    cluck("_get_target command not defined");
  }
  if ($self->{'targets'}->{$command}) {
    $target = $self->{'targets'}->{$command};
  } elsif ($command->{'cmdname'}
    # This should only happen for @*heading*, root_commands targets should
    # already be set.
            and $sectioning_commands{$command->{'cmdname'}}
            and !$root_commands{$command->{'cmdname'}}) {
    $target = $self->_new_sectioning_command_target($command);
  }
  return $target;
}

# API for elemnts directions formatting

# This returns the id specific of the $COMMAND tree element
sub command_id($$)
{
  my $self = shift;
  my $command = shift;
  my $target = $self->_get_target($command);
  if ($target) {
    return $target->{'target'};
  } else {
    return undef;
  }
}

sub command_contents_target($$$)
{
  my $self = shift;
  my $command = shift;
  my $contents_or_shortcontents = shift;
  $contents_or_shortcontents = 'shortcontents'
    if ($contents_or_shortcontents eq 'summarycontents');

  my $target = $self->_get_target($command);
  if ($target) {
    return $target->{$contents_or_shortcontents .'_target'};
  } else {
    return undef;
  }
}

# Return href target for linking to this command
sub command_target($$)
{
  my $self = shift;
  my $command = shift;

  if ($command->{'extra'}
      and $command->{'extra'}->{'associated_node'}) {
    $command = $command->{'extra'}->{'associated_node'};
  }
  my $target = $self->_get_target($command);
  if ($target) {
    return $target->{'target'};
  } else {
    return undef;
  }
}

sub command_filename($$)
{
  my $self = shift;
  my $command = shift;

  my $target = $self->_get_target($command);
  if ($target) {
    if (defined($target->{'filename'})) {
      return $target->{'filename'};
    }
    my ($root_element, $root_command)
           = $self->_html_get_tree_root_element($command, 1);

    if (defined($root_command)) {
      $target->{'root_command'} = $root_command;
    }
    if (defined($root_element)) {
      $target->{'filename'}
        = $root_element->{'structure'}->{'unit_filename'};
      return $root_element->{'structure'}->{'unit_filename'};
    }
  }
  return undef;
}

sub command_root_element_command($$)
{
  my $self = shift;
  my $command = shift;

  my ($root_element, $root_command) = $self->_html_get_tree_root_element($command);
  if ($root_element and $root_element->{'extra'}) {
    return $root_element->{'extra'}->{'unit_command'};
  }
  return undef;
}

sub element_command($$)
{
  my $self = shift;
  my $element = shift;

  if ($element and $element->{'extra'}) {
    if ($element->{'extra'}->{'unit_command'}) {
      return $element->{'extra'}->{'unit_command'};
    } elsif (defined($element->{'type'})
             and $element->{'type'} eq 'special_element') {
      return $element;
    }
  }
  return undef;
}

sub command_node($$)
{
  my $self = shift;
  my $command = shift;

  my $target = $self->_get_target($command);
  if ($target) {
    $self->command_filename($command);
    my $root_command = $target->{'root_command'};
    if (defined($root_command)) {
      if ($root_command->{'cmdname'} and $root_command->{'cmdname'} eq 'node') {
        return $root_command;
      }
      if ($root_command->{'extra'} and $root_command->{'extra'}->{'associated_node'}) {
        return $root_command->{'extra'}->{'associated_node'};
      }
    }
  }
  return undef;
}

# Return string for linking to $COMMAND with <a href>
sub command_href($$;$$)
{
  my $self = shift;
  my $command = shift;
  my $source_filename = shift;
  my $link_command = shift;

  $source_filename = $self->{'current_filename'} if (!defined($source_filename));

  if ($command->{'manual_content'}) {
    return $self->_external_node_href($command, $source_filename, $link_command);
  }

  my $target = $self->command_target($command);
  return '' if (!defined($target));
  my $href = '';

  my $target_filename = $self->command_filename($command);
  if (!defined($target_filename)) {
    # Happens if there are no pages, for example if OUTPUT is set to ''
    # as in the test cases.  Also for things in @titlepage when
    # titlepage is not output.
    if ($self->{'tree_units'} and $self->{'tree_units'}->[0]
       and defined($self->{'tree_units'}->[0]->{'structure'}->{'unit_filename'})) {
      # In that case use the first page.
      $target_filename = $self->{'tree_units'}->[0]->{'structure'}->{'unit_filename'};
    }
  }
  if (defined($target_filename)) { 
    if (!defined($source_filename) 
         or $source_filename ne $target_filename) {
      $href .= $target_filename;
      # omit target if the command is an element command, there is only
      # one element in file and there is a file in the href
      my $command_root_element_command = $self->command_root_element_command($command);
      if (defined($source_filename)
          and defined($command_root_element_command)
          and ($command_root_element_command eq $command
            or (defined($command_root_element_command->{'extra'})
              and defined($command_root_element_command->{'extra'}->{'associated_section'})
              and $command_root_element_command->{'extra'}->{'associated_section'}
                    eq $command))) {
        my $count_elements_in_file = $self->count_elements_in_filename($target_filename);
        if (defined($count_elements_in_file) and $count_elements_in_file == 1) {
          $target = '';
        }
      }
    }
  }
  $href .= '#' . $target if ($target ne '');
  return $href;
}

my %contents_command_element_type = (
  'contents' => 'contents',
  'shortcontents' => 'shortcontents',
  'summarycontents' => 'shortcontents',
);

# Return string for linking to $CONTENTS_OR_SHORTCONTENTS associated
# element from $COMMAND with <a href>
sub command_contents_href($$$$)
{
  my $self = shift;
  my $command = shift;
  my $contents_or_shortcontents = shift;
  my $source_filename = shift;

  my $href;
  my $special_element_type
    = $contents_command_element_type{$contents_or_shortcontents};
  my $special_element_direction
       = $self->get_conf('SPECIAL_ELEMENTS_DIRECTIONS')->{$special_element_type};
  my $target = $self->command_contents_target($command, $contents_or_shortcontents);

  my $target_element = $self->special_element($special_element_direction);
  my $target_filename;
  # !defined happens when called as convert() and not output()
  if (defined($target_element)) {
    $target_filename = $self->command_filename($target_element);
  }
  if (defined($target_filename) and
      (!defined($source_filename)
       or $source_filename ne $target_filename)) {
    $href .= $target_filename;
  }
  $href .= '#' . $target if ($target ne '');
  return $href;
}

# Return text to be used for a hyperlink to $COMMAND.
# $TYPE refers to the type of value returned from this function:
#  'text' - return text
#  'tree' - return a tree
#  'tree_nonumber' - return tree representing text without a chapter number
#                    being included.
#  'string' - return simpler text that can be used in element attributes
sub command_text($$;$)
{
  my $self = shift;
  my $command = shift;
  my $type = shift;

  if (!defined($type)) {
    $type = 'text';
  }
  if (!defined($command)) {
    cluck "in command_text($type) command not defined";
  }

  if ($command->{'manual_content'}) {
    my $node_content = [];
    $node_content = $command->{'node_content'}
      if (defined($command->{'node_content'}));
    my $tree;
    if ($command->{'manual_content'}) {
      $tree = {'type' => '_code',
          'contents' => [{'text' => '('}, @{$command->{'manual_content'}},
                         {'text' => ')'}, @$node_content]};
    } else {
      $tree = {'type' => '_code',
          'contents' => $node_content};
    }
    if ($type eq 'tree') {
      return $tree;
    } else {
      if ($type eq 'string') {
        $tree = {'type' => '_string',
                 'contents' => [$tree]};
      }
      my $result = $self->convert_tree_new_formatting_context(
        # FIXME check if $document_global_context argument is really needed
            $tree, $command->{'cmdname'}, 'command_text manual_content');
      return $result;
    }
  }

  my $target = $self->_get_target($command);
  if ($target) {
    my $explanation;
    $explanation = "command_text:$type \@$command->{'cmdname'}"
       if ($command->{'cmdname'});
    if (defined($target->{$type})) {
      return $target->{$type};
    }
    my $tree;
    if (!$target->{'tree'}) {
      if (defined($command->{'type'})
          and $command->{'type'} eq 'special_element') {
        my $special_element_type = $command->{'extra'}->{'special_element_type'};
        $tree = $self->get_conf('SPECIAL_ELEMENTS_HEADING')->{$special_element_type};
        $explanation = "command_text $special_element_type";
      } elsif ($command->{'cmdname'} and ($command->{'cmdname'} eq 'node' 
                                          or $command->{'cmdname'} eq 'anchor')) {
        $tree = {'type' => '_code',
                 'contents' => $command->{'extra'}->{'node_content'}};
      } elsif ($command->{'cmdname'} and ($command->{'cmdname'} eq 'float')) {
        $tree = $self->float_type_number($command);
      } elsif ($command->{'extra'}->{'missing_argument'}) {
        if ($type eq 'tree' or $type eq 'tree_nonumber') {
          return {};
        } else {
          return '';
        }
      } else {
        if (!$command->{'args'}->[0]->{'contents'}) {
          cluck "No misc_content: "
            .Texinfo::Common::debug_print_element($command);
        }
        if (defined($command->{'structure'}->{'section_number'})
            and ($self->get_conf('NUMBER_SECTIONS')
                 or !defined($self->get_conf('NUMBER_SECTIONS')))) {
          if ($command->{'cmdname'} eq 'appendix'
              and $command->{'structure'}->{'section_level'} == 1) {
            $tree = $self->gdt('Appendix {number} {section_title}',
                             {'number'
                                => {'text' => $command->{'structure'}->{'section_number'}},
                              'section_title'
                                => {'contents' 
                                    => $command->{'args'}->[0]->{'contents'}}});
          } else {
            $tree = $self->gdt('{number} {section_title}',
                             {'number'
                                => {'text' => $command->{'structure'}->{'section_number'}},
                              'section_title'
                                => {'contents' 
                                    => $command->{'args'}->[0]->{'contents'}}});
          }
        } else {
          $tree = {'contents' => [@{$command->{'args'}->[0]->{'contents'}}]};
        }

        $target->{'tree_nonumber'} 
          = {'contents' => $command->{'args'}->[0]->{'contents'}};
      }
      $target->{'tree'} = $tree;
    } else {
      $tree = $target->{'tree'};
    }
    return $target->{'tree_nonumber'} if ($type eq 'tree_nonumber' 
                                          and $target->{'tree_nonumber'});
    return $tree if ($type eq 'tree' or $type eq 'tree_nonumber');
    
    $self->_new_document_context($command->{'cmdname'}, $explanation);

    if ($type eq 'string') {
      $tree = {'type' => '_string',
               'contents' => [$tree]};
    }
    
    if ($type =~ /^(.*)_nonumber$/) {
      $tree = $target->{'tree_nonumber'} 
        if (defined($target->{'tree_nonumber'}));
    }
    $self->{'ignore_notice'}++;
    $target->{$type} = $self->_convert($tree, $explanation);
    $self->{'ignore_notice'}--;

    $self->_pop_document_context();
    return $target->{$type};
  }
  return undef;
}

# Return the element in the tree that $LABEL refers to.
sub label_command($$)
{
  my $self = shift;
  my $label = shift;
  return $self->{'labels'}->{$label};
}

sub special_element($$)
{
  my $self = shift;
  my $direction = shift;
  return $self->{'special_elements_directions'}->{$direction};
}

sub global_element($$)
{
  my $self = shift;
  my $type = shift;
  return $self->{'global_target_elements_directions'}->{$type};
}

my %valid_direction_return_type = (
  # a string that can be used in a href linking to the direction
  'href' => 1,
  # a string representing the direction that can be used in
  # context where only entities are available (attributes)
  'string' => 1,
  # a string representing the direction to be used in contexts
  # not restricted in term of available formatting (ie with HTML elements)
  'text' => 1,
  # Texinfo tree element representing the direction
  'tree' => 1,
  # string representing the target, typically used as id and in href
  'target' => 1,
  # same as 'text', but select node in priority
  'node' => 1,
  # same as 'text_nonumber' but select section in priority
  'section' => 1
);

foreach my $no_number_type ('text', 'tree', 'string') {
  # without section number
  $valid_direction_return_type{$no_number_type .'_nonumber'} = 1;
}

# sub from_element_direction($SELF, $SOURCE_ELEMENT, $DIRECTION, $TYPE, $SOURCE_FILENAME)
#
# Return text used for linking from $SOURCE_ELEMENT in direction $DIRECTION.  The
# text returned depends on $TYPE.
#
# This is used both for tree unit elements and external nodes
#
# $SOURCE_ELEMENT can be undef.
# $SOURCE_ELEMENT undef happens at least when there is no output file, or for
# the table of content when frames are used.  That call would result
# for instance from from_element_direction being called from _get_links,
# itself called from 'format_begin_file' which, in the default case
# points to _default_format_begin_file.
# TODO are there other cases?
sub from_element_direction($$$$;$)
{
  my $self = shift;
  my $source_element = shift;
  my $direction = shift;
  my $type = shift;
  my $source_filename = shift;

  my $target_element;
  my $command;
  my $target;

  $source_filename = $self->{'current_filename'} if (!defined($source_filename));
 
  if (!$valid_direction_return_type{$type}) {
    print STDERR "Incorrect type $type in from_element_direction call\n";
    return undef;
  }
  if ($self->global_element($direction)) {
    $target_element = $self->global_element($direction);
  } elsif ($source_element and $source_element->{'extra'}
      and $source_element->{'structure'}->{'directions'}
      and $source_element->{'structure'}->{'directions'}->{$direction}) {
    $target_element
      = $source_element->{'structure'}->{'directions'}->{$direction};
  # output TOP_NODE_UP related infos even if element is not
  # defined which should mostly correspond to cases when there is no
  # output file, for example in the tests.
  } elsif ((not defined($source_element)
            or ($source_element and $self->element_is_tree_unit_top($source_element)))
           and defined($self->get_conf('TOP_NODE_UP_URL'))
           and ($direction eq 'Up' or $direction eq 'NodeUp')) {
    if ($type eq 'href') {
      return $self->get_conf('TOP_NODE_UP_URL');
    } elsif ($type eq 'text' or $type eq 'node' or $type eq 'string' or $type eq 'section') {
      return $self->get_conf('TOP_NODE_UP');
    } else {
      cluck("type $type not available for TOP_NODE_UP\n");
      return '';
    }
  }

  if ($target_element) {
    ######## debug
    if (!$target_element->{'type'}) {
      die "No type for element_target $direction $target_element: "
       . Texinfo::Common::debug_print_element_details($target_element)
       . "directions :"
           . Texinfo::Structuring::print_element_directions($source_element);
    }
    ########
    if ($target_element->{'type'} eq 'external_node') {
      my $external_node = $target_element->{'extra'};
      #print STDERR "FROM_ELEMENT_DIRECTION ext node $type $direction\n"
      #  if ($self->get_conf('DEBUG'));
      if ($type eq 'href') {
        return $self->command_href($external_node, $source_filename);
      } elsif ($type eq 'text' or $type eq 'node') {
        return $self->command_text($external_node);
      } elsif ($type eq 'string') {
        return $self->command_text($external_node, $type);
      }
    } elsif ($type eq 'node') {
      if ($target_element->{'extra'}->{'unit_command'}) {
        if ($target_element->{'extra'}->{'unit_command'}->{'cmdname'} eq 'node') {
          $command = $target_element->{'extra'}->{'unit_command'};
        } elsif ($target_element->{'extra'}->{'unit_command'}->{'extra'}->{'associated_node'}) {
          $command = $target_element->{'extra'}->{'unit_command'}->{'extra'}->{'associated_node'};
        }
      }
      $target = $self->{'targets'}->{$command} if ($command);
      $type = 'text';
    } elsif ($type eq 'section') {
      if ($target_element->{'extra'}->{'unit_command'}) {
        if ($target_element->{'extra'}->{'unit_command'}->{'cmdname'} ne 'node') {
          $command = $target_element->{'extra'}->{'unit_command'};
        } elsif ($target_element->{'extra'}->{'unit_command'}->{'extra'}->{'associated_section'}) {
          $command = $target_element->{'extra'}->{'unit_command'}->{'extra'}->{'associated_section'};
        }
      }
      $target = $self->{'targets'}->{$command} if ($command);
      $type = 'text_nonumber';
    } else {
      if (defined($target_element->{'type'})
          and $target_element->{'type'} eq 'special_element') {
        $command = $target_element;
      } else {
        $command = $target_element->{'extra'}->{'unit_command'};
      }
      if ($type eq 'href') {
        if (defined($command)) {
          return $self->command_href($command, $source_filename);
        } else {
          return '';
        }
      }
      $target = $self->{'targets'}->{$command} if ($command);
    }
  } elsif ($self->special_element($direction)) {
    $target_element = $self->special_element($direction);
    $command = $target_element;
    if ($type eq 'href') {
      return $self->command_href($target_element, $source_filename);
    }
    $target = $self->{'targets'}->{$target_element};
  } else {
    return undef;
  }

  if (exists($target->{$type})) {
    return $target->{$type};
  } elsif ($type eq 'target') {
    return undef;
  } elsif ($command) {
    #print STDERR "FROM_ELEMENT_DIRECTION $type $direction\n"
    #  if ($self->get_conf('DEBUG'));
    return $self->command_text($command, $type);
  }
}

# API for misc useful functions for customization files

# it is considered 'top' only if element corresponds to @top or
# element is a node
sub element_is_tree_unit_top($$)
{
  my $self = shift;
  my $element = shift;
  my $top_element = $self->global_element('Top');
  return (defined($top_element) and $top_element eq $element
          and $element->{'extra'}
          and $element->{'extra'}->{'unit_command'}
          and ($element->{'extra'}->{'unit_command'}->{'cmdname'} eq 'node'
               or $element->{'extra'}->{'unit_command'}->{'cmdname'} eq 'top'));
}

sub default_formatting_function($$)
{
  my $self = shift;
  my $format = shift;
  return $self->{'default_formatting_functions'}->{$format};
}

# Return the default for the function references used for
# the formatting of commands, in case a user still wants to call
# default @-commands formatting functions when replacing functions,
# using code along
# &{$self->default_commands_conversion($cmdname)}($self, $cmdname, $command, $content)
my %default_commands_conversion;

sub default_commands_conversion($$)
{
  my $self = shift;
  my $command = shift;
  return $default_commands_conversion{$command};
}

my %default_commands_open;

sub default_commands_open($$)
{
  my $self = shift;
  my $command = shift;
  return $default_commands_open{$command};
}

# used for customization only (in t2h_singular.init)
sub get_value($$)
{
  my $self = shift;
  my $value = shift;
  if (defined($self->{'parser'}) 
      and exists ($self->{'parser'}->{'values'}->{$value})) {
    return $self->{'parser'}->{'values'}->{$value};
  } else {
    return undef;
  }
}

# API to register, cancel and get inline content that should be output
# when in an inline situation, mostly in a paragraph or preformatted
sub register_pending_formatted_inline_content($$$)
{
  my $self = shift;
  my $category = shift;
  my $inline_content = shift;

  if (not defined($self->{'pending_inline_content'})) {
    $self->{'pending_inline_content'} = [];
  }
  push @{$self->{'pending_inline_content'}}, [$category, $inline_content];
}

sub cancel_pending_formatted_inline_content($$$)
{
  my $self = shift;
  my $category = shift;

  if (defined($self->{'pending_inline_content'})) {
    my @other_category_contents = ();
    while (@{$self->{'pending_inline_content'}}) {
      my $category_inline_content = pop @{$self->{'pending_inline_content'}};
      if ($category_inline_content->[0] eq $category) {
        push @{$self->{'pending_inline_content'}}, @other_category_contents;
        return $category_inline_content->[1];
      }
      unshift @other_category_contents, $category_inline_content;
    }
    push @{$self->{'pending_inline_content'}}, @other_category_contents;
  }
  return undef;
}

sub get_pending_formatted_inline_content($) {
  my $self = shift;

  if (not defined($self->{'pending_inline_content'})) {
    return '';
  } else {
    my $result = '';
    foreach my $category_inline_content (@{$self->{'pending_inline_content'}}) {
      if (defined($category_inline_content->[1])) {
        $result .= $category_inline_content->[1];
      }
    }
    $self->{'pending_inline_content'} = undef;
    return $result;
  }
}

# API to associate inline content to an element, typically
# paragraph or preformatted.  Allows to associate the pending
# content to the first inline element.
sub associate_pending_formatted_inline_content($$$) {
  my $self = shift;
  my $element = shift;
  my $inline_content = shift;

  if (not $self->{'associated_inline_content'}->{$element}) {
    $self->{'associated_inline_content'}->{$element} = '';
  }
  $self->{'associated_inline_content'}->{$element} .= $inline_content;
}

sub get_associated_formatted_inline_content($$) {
  my $self = shift;
  my $element = shift;

  if ($self->{'associated_inline_content'}->{$element}) {
    my $result = $self->{'associated_inline_content'}->{$element};
    delete $self->{'associated_inline_content'}->{$element};
    return $result;
  }
  return '';
}

# API to register an information to a file and get it.  To be able to
# set an information during conversion and get it back during headers
# and footers conversion
sub register_file_information($$;$)
{
  my $self = shift;
  my $key = shift;
  my $value = shift;

  $self->{'file_informations'}->{$self->{'current_filename'}}->{$key} = $value;
}

sub get_file_information($$;$)
{
  my $self = shift;
  my $key = shift;
  my $filename = shift;

  if (not defined($filename)) {
    $filename = $self->{'current_filename'};
  }
  if (not exists($self->{'file_informations'}->{$self->{'current_filename'}}->{$key})) {
    return (0, undef);
  }
  return (1, $self->{'file_informations'}->{$self->{'current_filename'}}->{$key})
}

# This function should be used in formatting functions when some
# Texinfo tree need to be converted.
sub convert_tree_new_formatting_context($$;$$)
{
  my $self = shift;
  my $tree = shift;
  my $context_string = shift;
  my $multiple_pass = shift;
  my $document_global_context = shift;

  my $context_string_str = '';
  if (defined($context_string)) {
    $self->_new_document_context($context_string, $document_global_context);
    $context_string_str = "C($context_string)";
  }
  my $multiple_pass_str = '';
  if ($multiple_pass) {
    $self->{'ignore_notice'}++;
    push @{$self->{'multiple_pass'}}, $multiple_pass;
    $multiple_pass_str = '|M'
  }
  print STDERR "new_fmt_ctx ${context_string_str}${multiple_pass_str}\n"
        if ($self->get_conf('DEBUG'));
  my $result = $self->convert_tree($tree, "new_fmt_ctx ${context_string_str}");
  if (defined($context_string)) {
    $self->_pop_document_context();
  }
  if ($multiple_pass) {
    $self->{'ignore_notice'}--;
    pop @{$self->{'multiple_pass'}};
  }
  return $result;
}

# see http://www.w3.org/TR/REC-html40/types.html#type-links
my %BUTTONS_REL =
(
 'Top',         'start',
 'Contents',    'contents',
 'Overview',    '',
 'Index',       'index',
 'This',        '',
 'Back',        'prev',
 'FastBack',    '',
 'Prev',        'prev',
 'Up',          'up',
 'Next',        'next',
 'NodeUp',      'up',
 'NodeNext',    'next',
 'NodePrev',    'prev',
 'NodeForward', '',
 'NodeBack',    '',
 'Forward',     'next',
 'FastForward', '',
 'About' ,      'help',
 'First',       '',
 'Last',        '',
 'NextFile',    'next',
 'PrevFile',    'prev',
);

my %BUTTONS_ACCESSKEY =
(
 'Top',         '',
 'Contents',    '',
 'Overview',    '',
 'Index',       '',
 'This',        '',
 'Back',        'p',
 'FastBack',    '',
 'Prev',        'p',
 'Up',          'u',
 'Next',        'n',
 'NodeUp',      'u',
 'NodeNext',    'n',
 'NodePrev',    'p',
 'NodeForward', '',
 'NodeBack',    '',
 'Forward',     'n',
 'FastForward', '',
 'About' ,      '',
 'First',       '',
 'Last',        '',
 'NextFile',    '',
 'PrevFile',    '',
);

my %BUTTONS_EXAMPLE =
    (
     'Top',         ' '.$html_default_entity_nbsp.' ',
     'Contents',    ' '.$html_default_entity_nbsp.' ',
     'Overview',    ' '.$html_default_entity_nbsp.' ',
     'Index',       ' '.$html_default_entity_nbsp.' ',
     'This',        '1.2.3',
     'Back',        '1.2.2',
     'FastBack',    '1',
     'Prev',        '1.2.2',
     'Up',          '1.2',
     'Next',        '1.2.4',
     'NodeUp',      '1.2',
     'NodeNext',    '1.2.4',
     'NodePrev',    '1.2.2',
     'NodeForward', '1.2.4',
     'NodeBack',    '1.2.2',
     'Forward',     '1.2.4',
     'FastForward', '2',
     'About',       ' '.$html_default_entity_nbsp.' ',
     'First',       '1.',
     'Last',        '1.2.4',
     'NextFile',    ' '.$html_default_entity_nbsp.' ',
     'PrevFile',    ' '.$html_default_entity_nbsp.' ',
    );


# insert here name of icon images for buttons
# Icons are used, if ICONS and resp. value are set
my %ACTIVE_ICONS = (
     'Top',         '',
     'Contents',    '',
     'Overview',    '',
     'Index',       '',
     'This',        '',
     'Back',        '',
     'FastBack',    '',
     'Prev',        '',
     'Up',          '',
     'Next',        '',
     'NodeUp',      '',
     'NodeNext',    '',
     'NodePrev',    '',
     'NodeForward', '',
     'NodeBack',    '',
     'Forward',     '',
     'FastForward', '',
     'About' ,      '',
     'First',       '',
     'Last',        '',
     'NextFile',    '',
     'PrevFile',    '',
     ' ',           '',
);

# insert here name of icon images for these, if button is inactive
my %PASSIVE_ICONS = (
     'Top',         '',
     'Contents',    '',
     'Overview',    '',
     'Index',       '',
     'This',        '',
     'Back',        '',
     'FastBack',    '',
     'Prev',        '',
     'Up',          '',
     'Next',        '',
     'NodeUp',      '',
     'NodeNext',    '',
     'NodePrev',    '',
     'NodeForward', '',
     'NodeBack',    '',
     'Forward',     '',
     'FastForward', '',
     'About',       '',
     'First',       '',
     'Last',        '',
     'NextFile',    '',
     'PrevFile',    '',
);

my (%BUTTONS_TEXT, %BUTTONS_GOTO, %BUTTONS_NAME, %SPECIAL_ELEMENTS_HEADING);

my %defaults = (
  'ENABLE_ENCODING'      => 0,
  'FORMAT_MENU'           => 'sectiontoc',
  'OUTPUT_ENCODING_NAME'  => 'utf-8',
  'OUTFILE'              => undef,
  'SUBDIR'               => undef,
  'USE_NODES'            => 1,
  'USE_NODE_DIRECTIONS'  => undef,
  'CONTENTS_OUTPUT_LOCATION' => 'after_top',
  'SPLIT'                => 'node',
# if set style is added in attribute.
  'INLINE_CSS_STYLE'     => 0,
# if set, no css is used.
  'NO_CSS'               => 0,
  'JS_WEBLABELS'         => 'generate',
  'JS_WEBLABELS_FILE'    => 'js_licenses.html', # no clash with node name
  'OPEN_QUOTE_SYMBOL'    => undef,
  'CLOSE_QUOTE_SYMBOL'   => undef,
  'USE_ISO'              => 1,
  'TOP_FILE'             => 'index.html', # ignores EXTENSION
  'EXTENSION'            => 'html',
  'TOP_NODE_FILE_TARGET' => 'index.html', # ignores EXTENSION
  'USE_LINKS'            => 1,
  'DATE_IN_HEADER'       => 0,
  'AVOID_MENU_REDUNDANCY' => 0,
  'HEADERS'              => 1,
  'DO_ABOUT'             => 0,
  'USE_ACCESSKEY'        => 1,
  'USE_REL_REV'          => 1,
  'NODE_NAME_IN_MENU'    => 1,
  'NODE_NAME_IN_INDEX'   => 1,
  'XREF_USE_NODE_NAME_ARG' => undef,
  'XREF_USE_FLOAT_LABEL'   => 0,
  'SHORT_TOC_LINK_TO_TOC' => 1,
  'NO_CUSTOM_HTML_ATTRIBUTE' => 0,
  'COMPLEX_FORMAT_IN_TABLE' => 0,
  'WORDS_IN_PAGE'        => 300,
  # _default_panel_button_dynamic_direction use nodes direction based on USE_NODE_DIRECTIONS
  # or USE_NODES if USE_NODE_DIRECTIONS is undefined
  'SECTION_BUTTONS'      => [[ 'Next', \&_default_panel_button_dynamic_direction ],
                             [ 'Prev', \&_default_panel_button_dynamic_direction ],
                             [ 'Up', \&_default_panel_button_dynamic_direction ], ' ',
                             'Contents', 'Index'],
  'SECTION_FOOTER_BUTTONS' => [[ 'Next', \&_default_panel_button_dynamic_direction_section_footer ],
                              [ 'Prev', \&_default_panel_button_dynamic_direction_section_footer ],
                              [ 'Up', \&_default_panel_button_dynamic_direction_section_footer ], ' ',
                              'Contents', 'Index'],
  'LINKS_BUTTONS'        => ['Top', 'Index', 'Contents', 'About', 
                              'NodeUp', 'NodeNext', 'NodePrev'],
  'NODE_FOOTER_BUTTONS'  => [[ 'Next', \&_default_panel_button_dynamic_direction_node_footer ],
                             [ 'Prev', \&_default_panel_button_dynamic_direction_node_footer ],
                             [ 'Up', \&_default_panel_button_dynamic_direction_node_footer ],
                             ' ', 'Contents', 'Index'],
  'special_elements_targets'   => {
                             'shortcontents' => 'SEC_Shortcontents',
                             'contents' => 'SEC_Contents',
                             'footnotes' => 'SEC_Footnotes',
                             'about' => 'SEC_About',
                             'Top' => 'SEC_Top',
                            },
  'special_elements_file_string' => {
                              'contents' => '_toc',
                              'shortcontents' => '_ovr',
                              'footnotes' => '_fot',
                              'about' => '_abt',
                            },
  'frame_pages_file_string' => {
                              'Frame' => '_frame',
                              'Toc_Frame' => '_toc_frame',
                              },
  'special_elements_order'  => ['footnotes', 'contents', 'shortcontents', 'about'],
  'DOCTYPE'              => '<!DOCTYPE html>',
  'FRAMESET_DOCTYPE'     => '<!DOCTYPE html>',
  'DEFAULT_RULE'         => '<hr>',
  'BIG_RULE'             => '<hr>',
  'MENU_SYMBOL'          => undef,
  'MENU_ENTRY_COLON'     => ':',
  'INDEX_ENTRY_COLON'    => ':',
  'BODYTEXT'             => undef,
  'documentlanguage'     => 'en',
  'xrefautomaticsectiontitle' => 'on',
  'SHOW_TITLE'           => 1,
  'SECTION_NAME_IN_TITLE' => 0,
  'USE_TITLEPAGE_FOR_TITLE' => 0,
  'MONOLITHIC'           => 1,
  'CHAPTER_HEADER_LEVEL' => 2,
  'MAX_HEADER_LEVEL'     => 4,
  'FOOTNOTE_END_HEADER_LEVEL' => 4,
  'FOOTNOTE_SEPARATE_HEADER_LEVEL' => 4,
  
  'BUTTONS_REL'          => \%BUTTONS_REL,
  'BUTTONS_ACCESSKEY'    => \%BUTTONS_ACCESSKEY,
  'BUTTONS_EXAMPLE'      => \%BUTTONS_EXAMPLE,
  'BUTTONS_GOTO'         => \%BUTTONS_GOTO,
  'BUTTONS_NAME'         => \%BUTTONS_NAME,
  'BUTTONS_TEXT'         => \%BUTTONS_TEXT,
  'ACTIVE_ICONS'         => \%ACTIVE_ICONS,
  'PASSIVE_ICONS'        => \%PASSIVE_ICONS,
  'SPECIAL_ELEMENTS_HEADING' => \%SPECIAL_ELEMENTS_HEADING,
  'SPECIAL_ELEMENTS_CLASS' => {
    'about'       => 'about',
    'contents'    => 'contents',
    'shortcontents'    => 'shortcontents',
    'footnotes'   => 'footnotes',
  },
  'SPECIAL_ELEMENTS_DIRECTIONS' => {
     'about'       => 'About',
     'contents'    => 'Contents',
     'shortcontents'    => 'Overview',
     'footnotes'   => 'Footnotes',
  },
  'jslicenses' => {},         # for outputting licences file
  'jslicenses_math' => {},    # MathJax scripts
  'jslicenses_infojs' => {},  # info.js scripts
  'COPIABLE_LINKS' => 1,
 
  'output_format'        => 'html',
);

foreach my $buttons ('CHAPTER_BUTTONS', 'MISC_BUTTONS', 'TOP_BUTTONS') {
  $defaults{$buttons} = [@{$defaults{'SECTION_BUTTONS'}}];
}

foreach my $buttons ('SECTION_FOOTER_BUTTONS', 'CHAPTER_FOOTER_BUTTONS') {
  $defaults{$buttons} = [@{$defaults{'SECTION_FOOTER_BUTTONS'}}];
}


my @global_directions = ('First', 'Last', 'Index', 'Top');
my %global_and_special_directions;
foreach my $global_direction (@global_directions) {
  $global_and_special_directions{$global_direction} = 1;
}
foreach my $special_element_type (keys %{$defaults{'SPECIAL_ELEMENTS_DIRECTIONS'}}) {
  $global_and_special_directions{$defaults{'SPECIAL_ELEMENTS_DIRECTIONS'}->{$special_element_type}} = 1;
}

foreach my $hash (\%BUTTONS_REL, \%BUTTONS_ACCESSKEY,
                  \%ACTIVE_ICONS, \%PASSIVE_ICONS) {
  foreach my $button (grep {not exists($global_and_special_directions{$_}) and $_ ne ' '} keys %$hash) {
    $hash->{'FirstInFile'.$button} = $hash->{$button};
  }
}

sub _translate_names($)
{
  my $self = shift;
  print STDERR "\nTRANSLATE_NAMES encoding_name: ".$self->get_conf('OUTPUT_ENCODING_NAME')
    ." documentlanguage: ".$self->get_conf('documentlanguage')."\n"
   if ($self->get_conf('DEBUG'));


  %BUTTONS_TEXT = (
     'Top',         $self->gdt('Top'),
     'Contents',    $self->gdt('Contents'),
     'Overview',    $self->gdt('Overview'),
     'Index',       $self->gdt('Index'),
     ' ',           ' '.$self->html_non_breaking_space().' ',
     'This',        $self->gdt('current'),
     'Back',        ' &lt; ',
     'FastBack',    ' &lt;&lt; ',
     'Prev',        $self->gdt('Prev'),
     'Up',          $self->gdt(' Up '),
     'Next',        $self->gdt('Next'),
     #'NodeUp',      $self->gdt('Node up'),
     'NodeUp',      $self->gdt('Up'),
     #'NodeNext',    $self->gdt('Next node'),
     'NodeNext',    $self->gdt('Next'),
     #'NodePrev',    $self->gdt('Previous node'),
     'NodePrev',    $self->gdt('Previous'),
     'NodeForward', $self->gdt('Forward node'),
     'NodeBack',    $self->gdt('Back node'),
     'Forward',     ' &gt; ',
     'FastForward', ' &gt;&gt; ',
     'About',       ' ? ',
     'First',       ' |&lt; ',
     'Last',        ' &gt;| ',
     'NextFile',    $self->gdt('Next file'),
     'PrevFile',    $self->gdt('Previous file'),
  );

  foreach my $button (grep {not exists($global_and_special_directions{$_}) and $_ ne ' '} keys %BUTTONS_TEXT) {
    $BUTTONS_TEXT{'FirstInFile'.$button} = $BUTTONS_TEXT{$button};
  }

  %BUTTONS_GOTO = (
     'Top',         $self->gdt('Cover (top) of document'),
     'Contents',    $self->gdt('Table of contents'),
     'Overview',    $self->gdt('Short table of contents'),
     'Index',       $self->gdt('Index'),
     'This',        $self->gdt('Current section'),
     'Back',        $self->gdt('Previous section in reading order'),
     'FastBack',    $self->gdt('Beginning of this chapter or previous chapter'),
     'Prev',        $self->gdt('Previous section on same level'),
     'Up',          $self->gdt('Up section'),
     'Next',        $self->gdt('Next section on same level'),
     'NodeUp',      $self->gdt('Up node'),
     'NodeNext',    $self->gdt('Next node'),
     'NodePrev',    $self->gdt('Previous node'),
     'NodeForward', $self->gdt('Next node in node reading order'),
     'NodeBack',    $self->gdt('Previous node in node reading order'),
     'Forward',     $self->gdt('Next section in reading order'),
     'FastForward', $self->gdt('Next chapter'),
     'About' ,      $self->gdt('About (help)'),
     'First',       $self->gdt('First section in reading order'),
     'Last',        $self->gdt('Last section in reading order'),
     'NextFile',    $self->gdt('Forward section in next file'),
     'PrevFile',    $self->gdt('Back section in previous file'),
  );

  foreach my $button (grep {not exists($global_and_special_directions{$_}) and $_ ne ' '} keys %BUTTONS_GOTO) {
    $BUTTONS_GOTO{'FirstInFile'.$button} = $BUTTONS_GOTO{$button};
  }

  %BUTTONS_NAME = (
     'Top',         $self->gdt('Top'),
     'Contents',    $self->gdt('Contents'),
     'Overview',    $self->gdt('Overview'),
     'Index',       $self->gdt('Index'),
     ' ',           ' ',
     'This',        $self->gdt('This'),
     'Back',        $self->gdt('Back'),
     'FastBack',    $self->gdt('FastBack'),
     'Prev',        $self->gdt('Prev'),
     'Up',          $self->gdt('Up'),
     'Next',        $self->gdt('Next'),
     'NodeUp',      $self->gdt('NodeUp'),
     'NodeNext',    $self->gdt('NodeNext'),
     'NodePrev',    $self->gdt('NodePrev'),
     'NodeForward', $self->gdt('NodeForward'),
     'NodeBack',    $self->gdt('NodeBack'),
     'Forward',     $self->gdt('Forward'),
     'FastForward', $self->gdt('FastForward'),
     'About',       $self->gdt('About'),
     'First',       $self->gdt('First'),
     'Last',        $self->gdt('Last'),
     'NextFile',    $self->gdt('NextFile'),
     'PrevFile',    $self->gdt('PrevFile'),
  );

  foreach my $button (grep {not exists($global_and_special_directions{$_}) and $_ ne ' '} keys %BUTTONS_NAME) {
    $BUTTONS_NAME{'FirstInFile'.$button} = $BUTTONS_NAME{$button};
  }

  %SPECIAL_ELEMENTS_HEADING = (
    'about'       => $self->gdt('About This Document'),
    'contents'    => $self->gdt('Table of Contents'),
    'shortcontents'    => $self->gdt('Short Table of Contents'),
    'footnotes'   => $self->gdt('Footnotes'),
  );

  # delete the tree and formatted results for special elements
  # such that they are redone with the new tree when needed.
  foreach my $special_element_type (keys (%SPECIAL_ELEMENTS_HEADING)) {
    my $special_element_direction
       = $self->get_conf('SPECIAL_ELEMENTS_DIRECTIONS')->{$special_element_type};
    if ($self->special_element($special_element_direction) and
        $self->{'targets'}->{$self->special_element($special_element_direction)}) {
      my $target
        = $self->{'targets'}->{$self->special_element($special_element_direction)};
      foreach my $key ('text', 'string', 'tree') {
        delete $target->{$key};
      }
    }
  }
  
  foreach my $hash (\%BUTTONS_TEXT, \%BUTTONS_GOTO, \%BUTTONS_NAME) {
    foreach my $button (keys (%$hash)) {
      if (ref($hash->{$button})) {
        $hash->{$button} = $self->convert_tree_new_formatting_context(
                   $hash->{$button}, "button $button", undef, "button $button");
      }
    }
  }
  if ($self->{'commands_translation'}) {
    my %translated_commands;
    foreach my $context ('normal', 'preformatted', 'string') {
      foreach my $command (keys(%{$self->{'commands_translation'}->{$context}})) {
        $translated_commands{$command} = 1;
        delete $self->{'no_arg_commands_formatting'}->{$context}->{$command}->{'text'};
        if (defined($self->{'commands_translation'}->{$context}->{$command})) {
          $self->{'no_arg_commands_formatting'}->{$context}->{$command}->{'text'}
           = $self->gdt($self->{'commands_translation'}->{$context}->{$command},
                        undef, 'translated_text');
        }
      }
    }
    foreach my $command (keys(%translated_commands)) {
      $self->_complete_no_arg_commands_formatting($command);
    }
  }

  print STDERR "END TRANSLATE_NAMES\n\n" if ($self->get_conf('DEBUG'));
}


sub converter_defaults($$)
{
  my $self = shift;
  my $conf = shift;
  if (defined($conf->{'TEXI2HTML'})) {
    _set_variables_texi2html();
  }
  return %defaults;
}

my %css_map = (
     %css_rules_not_collected,

     'ul.toc-numbered-mark'   => 'list-style: none',
     'pre.menu-comment-preformatted' => 'font-family: serif',
     # using display: inline is an attempt to avoid a line break when in
     # preformatted in menu.  In 2022 it does not seems to work in firefox, there
     # is still a line break.
     'pre.menu-entry-description-preformatted' => 'font-family: serif; display: inline',
     'pre.menu-preformatted'  => 'font-family: serif',
     'a.summary-letter-printindex'  => 'text-decoration: none',
     'pre.display-preformatted'     => 'font-family: inherit',
     'span.program-in-footer' => 'font-size: smaller', # used with PROGRAM_NAME_IN_FOOTER
     'span.sansserif'     => 'font-family: sans-serif; font-weight: normal',
     'span.r'             => 'font-family: initial; font-weight: normal',
     'span.w-nolinebreak-text'   => 'white-space: nowrap',
     'kbd.key'            => 'font-style: normal',
     'kbd.kbd'            => 'font-style: oblique',
     'p.flushleft-paragraph'   => 'text-align:left',
     'p.flushright-paragraph'  => 'text-align:right',
     'h1.centerchap'      => 'text-align:center',
     'h2.centerchap'      => 'text-align:center',
     'h3.centerchap'      => 'text-align:center',
     'h1.settitle'        => 'text-align:center',
     'h1.shorttitlepage'  => 'text-align:center',
     'h3.subtitle'        => 'text-align:right',
     'h4.centerchap'      => 'text-align:center',
     'div.center'         => 'text-align:center',
     'blockquote.indentedblock' => 'margin-right: 0em',

     # The anchor element is wrapped in a <span> rather than a block level
     # element to avoid it appearing unless the mouse pointer is directly
     # over the text, as it is annoying for anchors to flicker when
     # you are moving your pointer elsewhere. "line-height: 0em" stops the
     # invisible text from changing vertical spacing.
     'a.copiable-link' => 'visibility: hidden; '
                           .'text-decoration: none; line-height: 0em',
     'span:hover a.copiable-link'         => 'visibility: visible',
);

$css_map{'pre.format-preformatted'} = $css_map{'pre.display-preformatted'};

my %preformatted_commands_context = %preformatted_commands;
$preformatted_commands_context{'verbatim'} = 1;

my %pre_class_commands;
foreach my $preformatted_command (keys(%preformatted_commands_context)) {
  # no class for the @small* variants
  if ($small_alias{$preformatted_command}) {
    $pre_class_commands{$preformatted_command} = $small_alias{$preformatted_command};
  } else {
    $pre_class_commands{$preformatted_command} = $preformatted_command;
  }
}
$pre_class_commands{'menu'} = 'menu';
$pre_class_types{'menu_comment'} = 'menu-comment';

my %indented_preformatted_commands;
foreach my $indented_format ('example', 'display', 'lisp') {
  $indented_preformatted_commands{$indented_format} = 1;
  $indented_preformatted_commands{"small$indented_format"} = 1;

  $css_map{"div.$indented_format"} = 'margin-left: 3.2em';
}
delete $css_map{"div.lisp"}; # output as div.example instead

# types that are in code style in the default case.  '_code' is not
# a type that can appear in the tree built from Texinfo code, it is used
# to format a tree fragment as if it was in a @code @-command.
my %default_code_types = (
 '_code' => 1,
);

# default specification of arguments formatting
my %default_commands_args = (
  'email' => [['monospace', 'monospacestring'], ['normal']],
  'anchor' => [['monospacestring']],
  'uref' => [['monospacestring'], ['normal'], ['normal']],
  'url' => [['monospacestring'], ['normal'], ['normal']],
  'printindex' => [[]],
  'sp' => [[]],
  'inforef' => [['monospace'],['normal'],['monospacetext']],
  'xref' => [['monospace'],['normal'],['normal'],['monospacetext'],['normal']],
  'pxref' => [['monospace'],['normal'],['normal'],['monospacetext'],['normal']],
  'ref' => [['monospace'],['normal'],['normal'],['monospacetext'],['normal']],
  'image' => [['monospacetext'],['monospacetext'],['monospacetext'],['string', 'normal'],['monospacetext']],
  # FIXME shouldn't it better not to convert if later ignored?
  'inlinefmt' => [['monospacetext'],['normal']],
  'inlinefmtifelse' => [['monospacetext'],['normal'],['normal']],
  'inlineraw' => [['monospacetext'],['raw']],
  'inlineifclear' => [['monospacetext'],['normal']],
  'inlineifset' => [['monospacetext'],['normal']],
  'item' => [[]],
  'itemx' => [[]],
);

foreach my $explained_command (keys(%explained_commands)) {
  $default_commands_args{$explained_command} 
     = [['normal'], ['string']];
}

# intercept warning and error messages to take 'ignore_notice' into
# account
sub _noticed_line_warn($$$)
{
  my $self = shift;
  my $text = shift;
  my $line_nr = shift;
  return if ($self->{'ignore_notice'});
  return $self->line_warn($self, $text, $line_nr);
}

my %kept_misc_commands;

my @informative_global_commands = ('documentlanguage', 'footnotestyle',
  'xrefautomaticsectiontitle', 'deftypefnnewline');

my @contents_commands = ('contents', 'shortcontents', 'summarycontents');

foreach my $misc_command (@informative_global_commands,
        @contents_commands, keys(%formattable_misc_commands),
        keys(%formatted_misc_commands),
        keys(%default_index_commands)) {
  $kept_misc_commands{$misc_command} = 1;
}

foreach my $misc_command (keys(%misc_commands)) {
  $default_commands_conversion{$misc_command} = undef
    unless ($kept_misc_commands{$misc_command});
}

# formatted/formattable @-commands that are not of converted in
# HTML in the default case.
$default_commands_conversion{'page'} = undef;
$default_commands_conversion{'need'} = undef;
$default_commands_conversion{'vskip'} = undef;

foreach my $ignored_brace_commands ('caption', 'shortcaption', 
  'hyphenation', 'sortas') {
  $default_commands_conversion{$ignored_brace_commands} = undef;
}

# commands that leads to advancing the paragraph number.  This is mostly
# used to determine the first line, in fact.
my %advance_paragraph_count_commands;
foreach my $command (keys(%block_commands)) {
  next if ($menu_commands{$command} 
            or $block_commands{$command} eq 'raw');
  $advance_paragraph_count_commands{$command} = 1;
}

foreach my $ignored_block_commands ('ignore', 'macro', 'rmacro', 'copying',
  'documentdescription', 'titlepage', 'direntry') {
  $default_commands_conversion{$ignored_block_commands} = undef;
};

# Formatting of commands without args

# The hash holding the defaults for the formatting of
# most commands without args.  It has three contexts as keys,
# 'normal' in normal text, 'preformatted' in @example and similar
# commands, and 'string' for contexts where HTML elements should not
# be used.
my %default_no_arg_commands_formatting;

foreach my $command (keys(%Texinfo::Convert::Converter::xml_text_entity_no_arg_commands_formatting)) {
  $default_no_arg_commands_formatting{'normal'}->{$command}->{'text'} =
    $Texinfo::Convert::Converter::xml_text_entity_no_arg_commands_formatting{$command};
}

$default_no_arg_commands_formatting{'normal'}->{' '}->{'text'} = '&nbsp;';
$default_no_arg_commands_formatting{'normal'}->{"\t"}->{'text'} = '&nbsp;';
$default_no_arg_commands_formatting{'normal'}->{"\n"}->{'text'} = '&nbsp;';

my %default_commands_translation;
# possible example of use, right now not used, as
# the generic Converter customization is directly used through
# the call to Texinfo::Convert::Utils::translated_command_tree().
#$default_commands_translation{'normal'}->{'error'}->{'text'} = 'error--&gt;';
## This is used to have gettext pick up the chain to be translated
#if (0) {
#  my $not_existing;
#  $not_existing->gdt('error--&gt;');
#}

$default_no_arg_commands_formatting{'normal'}->{'enddots'}
    = {'element' => 'small', 'text' => '...'};
$default_no_arg_commands_formatting{'preformatted'}->{'enddots'}->{'text'} = '...';
$default_no_arg_commands_formatting{'normal'}->{'*'}->{'text'} = '<br>';
# this is used in math too, not sure that it is the best
# in that context, '<br>' could be better.
$default_no_arg_commands_formatting{'preformatted'}->{'*'}->{'text'} = "\n";

# escaped code points in CSS
# https://www.w3.org/TR/css-syntax/#consume-escaped-code-point
# Consume as many hex digits as possible, but no more than 5. Note that this means 1-6 hex digits have been consumed in total. If the next input code point is whitespace, consume it as well. Interpret the hex digits as a hexadecimal number.

foreach my $no_brace_command (keys(%no_brace_commands)) {
  $default_no_arg_commands_formatting{'css_string'}->{$no_brace_command}->{'text'}
   = $no_brace_commands{$no_brace_command};
}

foreach my $command (keys(%{$default_no_arg_commands_formatting{'normal'}})) {
  if (defined($Texinfo::Convert::Unicode::unicode_map{$command})
      and $Texinfo::Convert::Unicode::unicode_map{$command} ne '') {
    my $char_nr = hex($Texinfo::Convert::Unicode::unicode_map{$command});
    my $css_string;
    if ($char_nr < 128) { # 7bit ascii
      $css_string = chr($char_nr);
    } else {
      $css_string = "\\$Texinfo::Convert::Unicode::unicode_map{$command} ";
    }
    $default_no_arg_commands_formatting{'css_string'}->{$command}->{'text'} = $css_string;
  } elsif ($default_no_arg_commands_formatting{'preformatted'}->{$command}) {
    $default_no_arg_commands_formatting{'css_string'}->{$command}->{'text'} =
      $default_no_arg_commands_formatting{'preformatted'}->{$command}->{'text'};
  } elsif ($default_no_arg_commands_formatting{'normal'}->{$command}->{'text'}) {
    $default_no_arg_commands_formatting{'css_string'}->{$command}->{'text'} =
      $default_no_arg_commands_formatting{'normal'}->{$command}->{'text'};
  } elsif (exists($no_brace_commands{$command})
           and $no_brace_commands{$command} eq '') {
    # @- @/ @/ @|
    $default_no_arg_commands_formatting{'css_string'}->{$command}->{'text'} = '';
  } else {
    warn "BUG: $command: no css_string\n";
  }
}

# replace the default to force using only translation and also
# prevent using a fixed CSS.
$default_no_arg_commands_formatting{'css_string'}->{'error'} = {};

$default_no_arg_commands_formatting{'css_string'}->{'*'}->{'text'} = '\A ';

$default_no_arg_commands_formatting{'css_string'}->{' '}->{'text'} = ' ';
$default_no_arg_commands_formatting{'css_string'}->{"\t"}->{'text'} = ' ';
$default_no_arg_commands_formatting{'css_string'}->{"\n"}->{'text'} = ' ';
$default_no_arg_commands_formatting{'css_string'}->{'tie'}->{'text'} = ' ';

# w not in css_string, set the corresponding css_map especially,
# which also has none and not w in the class
$css_map{'ul.mark-none'} = 'list-style-type: none';

# setup css_map for mark commands based on css strings
foreach my $mark_command (keys(%{$default_no_arg_commands_formatting{'css_string'}})) {
  if (defined($brace_commands{$mark_command})) {
    my $css_string;
    if ($mark_command eq 'bullet') {
      $css_string = 'disc';
    } elsif ($default_no_arg_commands_formatting{'css_string'}->{$mark_command}
             and $default_no_arg_commands_formatting{'css_string'}->{$mark_command}->{'text'}) {
      if ($special_list_bullet_css_string_no_arg_command{$mark_command}) {
        $css_string = $special_list_bullet_css_string_no_arg_command{$mark_command};
      } else {
        $css_string = $default_no_arg_commands_formatting{'css_string'}->{$mark_command}->{'text'};
      }
      $css_string =~ s/^(\\[A-Z0-9]+) $/$1/;
      $css_string = '"'.$css_string.'"';
    }
    if (defined($css_string)) {
      $css_map{"ul.mark-$mark_command"} = "list-style-type: $css_string";
    }
  }
}

# used to show the built-in CSS rules
sub builtin_default_css_text()
{
  my $css_text = '';
  foreach my $css_rule (sort(keys(%css_map))) {
    if ($css_map{$css_rule} ne '') {
      $css_text .= "$css_rule {$css_map{$css_rule}}\n";
    }
  }
  return $css_text;
}

sub _text_element_conversion($$$)
{
  my $self = shift;
  my $specification = shift;
  my $command = shift;

  my $text = '';
  # note that there could be elements in text
  if (exists($specification->{'text'})) {
    $text = $specification->{'text'};
  }

  if (exists($specification->{'element'})) {
    return $self->html_attribute_class($specification->{'element'}, $command)
               .'>'. $text . '</'.$specification->{'element'}.'>';
  } else {
    return $text;
  }
}

sub _convert_no_arg_command($$$)
{
  my $self = shift;
  my $cmdname = shift;
  my $command = shift;

  if ($cmdname eq 'click' and $command->{'extra'} 
      and exists($command->{'extra'}->{'clickstyle'})) {
    my $click_cmdname = $command->{'extra'}->{'clickstyle'};
    if (($self->in_preformatted() or $self->in_math()
         and $self->{'no_arg_commands_formatting'}->{'preformatted'}->{$click_cmdname})
        or ($self->in_string() and 
            $self->{'no_arg_commands_formatting'}->{'string'}->{$click_cmdname})
        or ($self->{'no_arg_commands_formatting'}->{'normal'}->{$click_cmdname})) {
      $cmdname = $click_cmdname;
    }
  }
  if ($self->in_upper_case() and $letter_no_arg_commands{$cmdname}
      and $self->{'no_arg_commands_formatting'}->{'normal'}->{uc($cmdname)}) {
    $cmdname = uc($cmdname);
  }

  my $result;
  
  my $translated_tree = Texinfo::Convert::Utils::translated_command_tree($self,
                                                                       $cmdname);
  if ($translated_tree) {
    return $self->convert_tree($translated_tree, "convert no arg $cmdname translated");
  }
  if ($self->in_preformatted() or $self->in_math()) {
    $result = $self->_text_element_conversion(
      $self->{'no_arg_commands_formatting'}->{'preformatted'}->{$cmdname}, $cmdname);
  } elsif ($self->in_string()) {
    $result = $self->_text_element_conversion(
      $result = $self->{'no_arg_commands_formatting'}->{'string'}->{$cmdname}, $cmdname);
  } else {
    $result = $self->_text_element_conversion(
      $result = $self->{'no_arg_commands_formatting'}->{'normal'}->{$cmdname}, $cmdname);
  }

  return $result;
}

foreach my $command(keys(%{$default_no_arg_commands_formatting{'normal'}})) {
  $default_commands_conversion{$command} = \&_convert_no_arg_command;
}

sub _css_string_convert_no_arg_command($$$)
{
  my $self = shift;
  my $cmdname = shift;
  my $command = shift;

  if ($cmdname eq 'click' and $command->{'extra'}
      and exists($command->{'extra'}->{'clickstyle'})) {
    my $click_cmdname = $command->{'extra'}->{'clickstyle'};
    if ($self->{'no_arg_commands_formatting'}->{'css_string'}->{$click_cmdname}) {
      $cmdname = $click_cmdname;
    }
  }
  if ($self->in_upper_case() and $letter_no_arg_commands{$cmdname}
      and $self->{'no_arg_commands_formatting'}->{'css_string'}->{uc($cmdname)}) {
    $cmdname = uc($cmdname);
  }

  my $result;

  my $translated_tree = Texinfo::Convert::Utils::translated_command_tree($self,
                                                                       $cmdname);
  if ($translated_tree) {
    return $self->convert_tree($translated_tree, "convert no arg $cmdname translated");
  }
  $result = $self->{'no_arg_commands_formatting'}->{'css_string'}->{$cmdname}->{'text'};
}

foreach my $command(keys(%{$default_no_arg_commands_formatting{'normal'}})) {
  $default_css_string_commands_conversion{$command} = \&_css_string_convert_no_arg_command;
}

sub _convert_today_command($$$)
{
  my $self = shift;
  my $cmdname = shift;
  my $command = shift;

  my $tree = $self->Texinfo::Convert::Utils::expand_today();
  return $self->convert_tree($tree, 'convert today');
}

$default_commands_conversion{'today'} = \&_convert_today_command;

# style commands

my %quoted_style_commands;
foreach my $quoted_command ('samp') {
  $quoted_style_commands{$quoted_command} = 1;
}

my %style_commands_element;
$style_commands_element{'normal'} = {
      'b'           => 'b',
      'cite'        => 'cite',
      'code'        => 'code',
      'command'     => 'code',
      'dfn'         => 'em',
      'dmn'         => 'span',
      'emph'        => 'em',
      'env'         => 'code',
      'file'        => 'samp',
      'headitemfont' => 'b', # the @multitable prototypes are ignored
                             # and headitem are in <th> rather than <td>.
                             # The mapping is based on style used in other formats.
      'i'           => 'i',
      'slanted'     => 'i',
      'sansserif'   => 'span',
      'kbd'         => 'kbd',
      'key'         => 'kbd',
      'option'      => 'samp',
      'r'           => 'span',
      'samp'        => 'samp',
      'sc'          => 'small',
      'strong'      => 'strong',
      'sub'         => 'sub',
      'sup'         => 'sup',
      't'           => 'code',
      'var'         => 'var',
      'verb'        => 'tt',
};

my %style_commands_formatting;

# this weird construct does like uniq, it avoids duplicates.
# it is required since math is not in the %style_commands as it is 
# in context command.
my @all_style_commands = keys %{{ map { $_ => 1 } 
    (keys(%style_commands), keys(%{$style_commands_element{'normal'}})) }};

foreach my $command(@all_style_commands) {
  # default is no attribute.
  if ($style_commands_element{'normal'}->{$command}) {
    $style_commands_formatting{'normal'}->{$command}->{'attribute'}
     = $style_commands_element{'normal'}->{$command};
    $style_commands_formatting{'preformatted'}->{$command}->{'attribute'}
     = $style_commands_element{'normal'}->{$command};
  }
  if ($style_commands_element{'preformatted'}->{$command}) {
    $style_commands_formatting{'preformatted'}->{$command}->{'attribute'} =
      $style_commands_element{'preformatted'}->{$command}; 
  }
  if ($quoted_style_commands{$command}) {
    foreach my $context ('normal', 'string', 'preformatted') {
      $style_commands_formatting{$context}->{$command}->{'quote'} = 1;
    }
  }
  $default_commands_conversion{$command} = \&_convert_style_command;
}

$style_commands_formatting{'preformatted'}->{'sc'}->{'attribute'} = 'span';

# currently unused, could be re-used if there is a need to have attributes
# specified in %style_commands_element
sub _parse_attribute($)
{
  my $element = shift;
  return ('', '', '') if (!defined($element));
  my ($class, $attributes) = ('', '');
  if ($element =~ /^(\w+)(\s+.*)/)
  {
    $element = $1;
    $attributes = $2;
    if ($attributes =~ s/^\s+class=\"([^\"]+)\"//) {
      $class = $1;
    }
  }
  return ($element, $class, $attributes);
}

sub _convert_style_command($$$$)
{
  my $self = shift;
  my $cmdname = shift;
  my $command = shift;
  my $args = shift;

  my $text = $args->[0]->{'normal'};
  if (!defined($text)) {
    # happens with bogus @-commands without argument, like @strong something
    #cluck "text not defined in _convert_style_command";
    return '';
  }
  my @additional_classes = ();
  # handle the effect of kbdinputstyle
  if ($cmdname eq 'kbd' and $command->{'extra'} 
      and $command->{'extra'}->{'code'}) {
    $cmdname = 'code';
    push @additional_classes, 'as-code-kbd';
  }

  my $attribute_hash = {};
  if ($self->in_preformatted()) {
    $attribute_hash = $self->{'style_commands_formatting'}->{'preformatted'};
  } elsif (!$self->in_string()) {
    $attribute_hash = $self->{'style_commands_formatting'}->{'normal'};
  }
  if (defined($attribute_hash->{$cmdname})) {
    my $attribute_text = '';
    my $style;
    if (defined($attribute_hash->{$cmdname}->{'attribute'})) {
      # the commented out code is useful only if there are attributes in
      # style_commands_element
      #my $class;
      #($style, $class, $attribute_text)
      #  = _parse_attribute($attribute_hash->{$cmdname}->{'attribute'});
      #if (defined($class) and $class ne '') {
      #  push @additional_classes, $class;
      #}
      my $style = $attribute_hash->{$cmdname}->{'attribute'};
      my $open = $self->html_attribute_class($style, $cmdname, \@additional_classes);
      if ($open ne '') {
        $text = $open . '>' . $text . "</$style>";
      #  $text = $open . "$attribute_text>" . $text . "</$style>";
      #} elsif ($attribute_text ne '') {
      #  $text = "<$style $attribute_text>". $text . "</$style>";
      }
    }
    if (defined($attribute_hash->{$cmdname}->{'quote'})) {
      $text = $self->get_conf('OPEN_QUOTE_SYMBOL') . $text
                . $self->get_conf('CLOSE_QUOTE_SYMBOL');
    }
  }
  return $text;
}

sub _convert_w_command($$$$)
{
  my $self = shift;
  my $cmdname = shift;
  my $command = shift;
  my $args = shift;
  my $text = $args->[0]->{'normal'};
  if (!defined($text)) {
    $text = '';
  }
  if ($self->in_string()) {
    return $text;
  } else {
    return $text . '<!-- /@w -->';
  }
}
$default_commands_conversion{'w'} = \&_convert_w_command;

sub _convert_value_command($$$$)
{
  my $self = shift;
  my $cmdname = shift;
  my $command = shift;
  my $args = shift;

  return $self->convert_tree($self->gdt('@{No value for `{value}\'@}',
                                       {'value' => $command->{'type'}}));
}

$default_commands_conversion{'value'} = \&_convert_value_command;

sub _convert_email_command($$$$)
{
  my $self = shift;
  my $cmdname = shift;
  my $command = shift;
  my $args = shift;

  my $mail_arg = shift @$args;
  my $text_arg = shift @$args;
  my $mail = '';
  my $mail_string = '';
  if (defined($mail_arg)) {
    $mail = $mail_arg->{'monospace'};
    $mail_string = $mail_arg->{'monospacestring'};
  }
  my $text = '';
  if (defined($text_arg)) {
    $text = $text_arg->{'normal'};
  }
  $text = $mail unless ($text ne '');
  return $text if ($mail eq '');
  if ($self->in_string()) {
    return "$mail_string ($text)";
  } else {
    return $self->html_attribute_class('a', $cmdname)
                        ." href=\"mailto:$mail_string\">$text</a>";
  }
}

$default_commands_conversion{'email'} = \&_convert_email_command;

sub _convert_explained_command($$$$)
{
  my $self = shift;
  my $cmdname = shift;
  my $command = shift;
  my $args = shift;

  my $with_explanation;
  my $explanation_result;
  my $explanation_string;
  my $normalized_type
    = Texinfo::Convert::NodeNameNormalization::normalize_node(
    {'contents' => $command->{'args'}->[0]->{'contents'}});

  if ($args->[1] and defined($args->[1]->{'string'}) 
                 and $args->[1]->{'string'} =~ /\S/) {
    $with_explanation = 1;
    $explanation_string = $args->[1]->{'string'};

    # Convert the explanation of the acronym.  Must do this before we save
    # the explanation for the future, otherwise we get infinite recursion
    # for recursively-defined acronyms.
    $explanation_result = $self->convert_tree($args->[1]->{'tree'},
                                              "convert $cmdname explanation");

    $self->{'explained_commands'}->{$cmdname}->{$normalized_type} =
       $command->{'args'}->[1]->{'contents'};
  } elsif ($command->{'extra'}->{'explanation_contents'}) {
    if (@{$command->{'extra'}->{'explanation_contents'}}) {
      $explanation_string = $self->convert_tree_new_formatting_context(
        {'type' => '_string', 
         'contents' => $command->{'extra'}->{'explanation_contents'}},
        $cmdname, $cmdname);
    }
  } elsif ($self->{'explained_commands'}->{$cmdname}->{$normalized_type}) {
    $explanation_string = $self->convert_tree_new_formatting_context(
      {'type' => '_string', 
       'contents' => $self->{'explained_commands'}
                       ->{$cmdname}->{$normalized_type}},
    $cmdname, $cmdname);

    $command->{'extra'}->{'explanation_contents'} 
       = $self->{'explained_commands'}->{$cmdname}->{$normalized_type};
  } else {
    # Avoid ever giving an explanation for this element.  This prevents
    # infinite recursion for a recursively-defined acronym, when an
    # @acronym within the explanation could end up referring to the
    # containing @acronym.

    $command->{'extra'}->{'explanation_contents'} = [];
  }
  my $result = $args->[0]->{'normal'};
  if (!$self->in_string()) {
    my $explanation = '';
    $explanation = " title=\"$explanation_string\""
      if (defined($explanation_string));
    my $html_element = $cmdname;
    $result = $self->html_attribute_class($html_element, $cmdname)
         ."${explanation}>".$result."</$html_element>";
  }
  if ($with_explanation) {
    $result = $self->convert_tree($self->gdt('{explained_string} ({explanation})',
          {'explained_string' => {'type' => '_converted',
                   'text' => $result},
           'explanation' => {'type' => '_converted',
                   'text' => $explanation_result}}), "convert explained $cmdname");
  }

  return $result;
}

foreach my $explained_command (keys(%explained_commands)) {
  $default_commands_conversion{$explained_command} 
    = \&_convert_explained_command;
}

sub _convert_anchor_command($$$$)
{
  my $self = shift;
  my $cmdname = shift;
  my $command = shift;
  my $args = shift;

  my $id = $self->command_id($command);
  if (defined($id) and $id ne '' and !@{$self->{'multiple_pass'}}
      and !$self->in_string()) {
    return &{$self->{'format_separate_anchor'}}($self, $id, 'anchor');
  }
  return '';
}

$default_commands_conversion{'anchor'} = \&_convert_anchor_command;

my $foot_num;
my $foot_lines;
my $NO_NUMBER_FOOTNOTE_SYMBOL = '*';

my $footid_base = 'FOOT';
my $docid_base = 'DOCF';

# to avoid duplicate names, use a prefix that cannot happen in anchors
my $target_prefix = "t_h";
my %footnote_id_numbers;
sub _convert_footnote_command($$$$)
{
  my $self = shift;
  my $cmdname = shift;
  my $command = shift;
  my $args = shift;

  my $number_in_doc;
  $foot_num++;
  if ($self->get_conf('NUMBER_FOOTNOTES')) {
    $number_in_doc = $foot_num;
  } else {
    $number_in_doc = $NO_NUMBER_FOOTNOTE_SYMBOL;
  }
  
  return "($number_in_doc)" if ($self->in_string());
  #print STDERR "FOOTNOTE $command\n";
  my $footid = $self->command_target($command);

  # happens for bogus footnotes
  if (!defined($footid)) {
    return '';
  }

  # ID for linking back to the main text from the footnote.
  my $docid = $footid;
  $docid =~ s/^$footid_base/$docid_base/;

  my $document_filename;
  my $footnote_filename;
  if ($self->get_conf('footnotestyle') eq 'separate') {
    $footnote_filename = $self->command_filename($command);
    $document_filename = $self->{'current_filename'};
    $footnote_filename = '' if (!defined($footnote_filename));
    $document_filename = '' if (!defined($document_filename));

    if ($document_filename eq $footnote_filename) {
      $document_filename = $footnote_filename = '';
    }
  } else {
    $document_filename = $footnote_filename = '';
  }
  my $footnote_text;
  if ($args->[0]) {
    $footnote_text = $args->[0]->{'normal'};
  } else {
    $footnote_text = '';
  }
  chomp ($footnote_text);
  $footnote_text .= "\n";

  if (@{$self->{'multiple_pass'}}) {
    $footid = $target_prefix.$self->{'multiple_pass'}->[-1].'_'.$footid.'_'.$foot_num;
    $docid = $target_prefix.$self->{'multiple_pass'}->[-1].'_'.$docid.'_'.$foot_num;
  } else {
    if (!defined($footnote_id_numbers{$footid})) {
      $footnote_id_numbers{$footid} = $foot_num;
    } else {
      # This should rarely happen, except for @footnote in @copying and
      # multiple @insertcopying...
      # Here it is not checked that there is no clash with another anchor. 
      # However, unless there are more than 1000 footnotes this should not 
      # happen.
      $footid .= '_'.$foot_num;
      $docid .= '_'.$foot_num;
    }
  }

  $foot_lines .= '<h5>' .
   "<a id=\"$footid\" href=\"$document_filename#$docid\">($number_in_doc)</a></h5>\n"
   . $footnote_text;

  my $footnote_number_text;
  if ($self->in_preformatted()) {
    $footnote_number_text = "($number_in_doc)";
  } else {
    $footnote_number_text = "<sup>$number_in_doc</sup>";
  }
  return $self->html_attribute_class('a', $cmdname)
    ." id=\"$docid\" href=\"$footnote_filename#$footid\">$footnote_number_text</a>";
}
$default_commands_conversion{'footnote'} = \&_convert_footnote_command;

sub _convert_uref_command($$$$)
{
  my $self = shift;
  my $cmdname = shift;
  my $command = shift;
  my $args = shift;

  my @args = @$args;
  my $url_arg = shift @args;
  my $text_arg = shift @args;
  my $replacement_arg = shift @args;

  my ($url, $text, $replacement);
  $url = $url_arg->{'monospacestring'} if defined($url_arg);
  $text = $text_arg->{'normal'} if defined($text_arg);
  $replacement = $replacement_arg->{'normal'} if defined($replacement_arg);

  $text = $replacement if (defined($replacement) and $replacement ne '');
  $text = $url if (!defined($text) or $text eq '');
  return $text if (!defined($url) or $url eq '');
  return "$text ($url)" if ($self->in_string());
  return $self->html_attribute_class('a', $cmdname)." href=\"$url\">$text</a>";
}

$default_commands_conversion{'uref'} = \&_convert_uref_command;
$default_commands_conversion{'url'} = \&_convert_uref_command;

sub _convert_image_command($$$$)
{
  my $self = shift;
  my $cmdname = shift;
  my $command = shift;
  my $args = shift;

  if (defined($args->[0]->{'monospacetext'}) and $args->[0]->{'monospacetext'} ne '') {
    my $basefile = $args->[0]->{'monospacetext'};
    return $basefile if ($self->in_string());
    my ($image_file, $image_basefile, $image_extension, $image_path)
      = $self->html_image_file_location_name($cmdname, $command, $args);
    if (not defined($image_path)) {
      $self->_noticed_line_warn(sprintf(
              __("\@image file `%s' (for HTML) not found, using `%s'"),
                         $image_basefile, $image_file), $command->{'line_nr'});
    }
    if (defined($self->get_conf('IMAGE_LINK_PREFIX'))) {
      $image_file = $self->get_conf('IMAGE_LINK_PREFIX') . $image_file;
    }
    my $alt_string;
    if (defined($args->[3]) and defined($args->[3]->{'string'})) {
      $alt_string = $args->[3]->{'string'};
    }
    if (!defined($alt_string) or ($alt_string eq '')) {
      $alt_string = $self->protect_text($basefile);
    }
    return $self->close_html_lone_element(
      $self->html_attribute_class('img', $cmdname).
         " src=\"".$self->protect_text($image_file)."\" alt=\"$alt_string\"");
  }
  return '';
}

$default_commands_conversion{'image'} = \&_convert_image_command;

sub _convert_math_command($$$$)
{
  my $self = shift;
  my $cmdname = shift;
  my $command = shift;
  my $args = shift;

  my $arg = $args->[0]->{'normal'};

  my $math_type = $self->get_conf('HTML_MATH');
  if ($math_type and $math_type eq 'mathjax') {
    # MathJax won't handle tags in code
    # TODO: instead convert inside $command to LaTeX, when such a conversion
    # becomes possible
    if ($arg !~ /</) {
      $self->register_file_information('mathjax', 1);
      return $self->html_attribute_class('em', $cmdname, ['tex2jax_process'])
                                           .">\\($arg\\)</em>";
    }
  }
  return $self->html_attribute_class('em', $cmdname).">$arg</em>";
}

$default_commands_conversion{'math'} = \&_convert_math_command;

sub _convert_accent_command($$$$)
{
  my $self = shift;
  my $cmdname = shift;
  my $command = shift;
  my $args = shift;

  return $self->xml_accents($command, $self->in_upper_case());
}

foreach my $command (keys(%accent_commands)) {
  $default_commands_conversion{$command} = \&_convert_accent_command;
}

sub _css_string_accent($$$;$)
{
  my $self = shift;
  my $text = shift;
  my $command = shift;
  my $in_upper_case = shift;

  my $accent = $command->{'cmdname'};

  if ($in_upper_case and $text =~ /^\w$/) {
    $text = uc ($text);
  }
  if (exists($Texinfo::Convert::Unicode::unicode_accented_letters{$accent})
      and exists($Texinfo::Convert::Unicode::unicode_accented_letters{$accent}->{$text})) {
    return '\\' .
      $Texinfo::Convert::Unicode::unicode_accented_letters{$accent}->{$text}. ' ';
  }
  if (exists($Texinfo::Convert::Unicode::unicode_diacritics{$accent})) {
    my $diacritic = '\\'
       .$Texinfo::Convert::Unicode::unicode_diacritics{$accent}. ' ';
    if ($accent ne 'tieaccent') {
      return $text . $diacritic;
    } else {
      # tieaccent diacritic is naturally and correctly composed
      # between two characters
      my $remaining_text = $text;
      # we consider that letters are either characters or escaped characters
      if ($remaining_text =~ s/^([\p{L}\d]|\\[a-zA-Z0-9]+ )([\p{L}\d]|\\[a-zA-Z0-9]+ )(.*)$/$3/) {
        return $1.$diacritic.$2 . $remaining_text;
      } else {
        return $text . $diacritic;
      }
    }
  }
  # should never happen, there are diacritics for every accent command
  return Texinfo::Convert::Text::ascii_accent($text, $command);
}

sub _css_string_convert_accent_command($$$$)
{
  my $self = shift;
  my $cmdname = shift;
  my $command = shift;
  my $args = shift;

  my $format_accents = \&_css_string_accent;
  return $self->convert_accents($command, $format_accents, $self->in_upper_case());
}

foreach my $command (keys(%accent_commands)) {
  $default_css_string_commands_conversion{$command} = \&_css_string_convert_accent_command;
}

# argument is formatted as code since indicateurl is in code_style_commands
sub _convert_indicateurl_command($$$$)
{
  my $self = shift;
  my $cmdname = shift;
  my $command = shift;
  my $args = shift;

  my $text = $args->[0]->{'normal'};
  if (!defined($text)) {
    # happens with bogus @-commands without argument, like @strong something
    return '';
  }
  if (!$self->in_string()) {
    return $self->get_conf('OPEN_QUOTE_SYMBOL').
        $self->html_attribute_class('code', $cmdname).'>'.$text
                .'</code>'.$self->get_conf('CLOSE_QUOTE_SYMBOL');
  } else {
    return $self->get_conf('OPEN_QUOTE_SYMBOL').$text.
              $self->get_conf('CLOSE_QUOTE_SYMBOL');
  }
}

$default_commands_conversion{'indicateurl'} = \&_convert_indicateurl_command;


sub _convert_titlefont_command($$$$)
{
  my $self = shift;
  my $cmdname = shift;
  my $command = shift;
  my $args = shift;

  my $text = $args->[0]->{'normal'};
  if (!defined($text)) {
    # happens with bogus @-commands without argument, like @strong something
    return '';
  }
  return &{$self->{'format_heading_text'}}($self, $cmdname, $cmdname,
                                           $text, 0);
}
$default_commands_conversion{'titlefont'} = \&_convert_titlefont_command;

sub _convert_U_command($$$$)
{
  my $self = shift;
  my $cmdname = shift;
  my $command = shift;
  my $args = shift;

  my $arg = $args->[0]->{'normal'};
  my $res;
  if (defined($arg) && $arg) {
    # checks on the value already done in Parser, just output it here.
    $res = "&#x$arg;";
  } else {
    $res = '';
  }
  return $res;
}
$default_commands_conversion{'U'} = \&_convert_U_command;

sub _default_format_comment($$) {
  my $self = shift;
  my $text = shift;
  return $self->xml_comment(' '.$text);
}

sub protect_text($$) {
  my $self = shift;
  my $text = shift;
  return &{$self->{'format_protect_text'}}($self, $text);
}

sub _default_format_protect_text($$) {
  my $self = shift;
  my $text = shift;
  my $result = $self->xml_protect_text($text);
  $result =~ s/\f/&#12;/g;
  return $result;
}

sub _default_css_string_format_protect_text($$) {
  my $self = shift;
  my $text = shift;
  $text =~ s/\\/\\\\/g;
  $text =~ s/\'/\\'/g;
  return $text;
}

# can be called on root commands, tree units, special elements
# and title elements.  $cmdname can be undef for special elements.
sub _default_format_heading_text($$$$$;$$$)
{
  my $self = shift;
  my $cmdname = shift;
  my $class = shift;
  my $text = shift;
  my $level = shift;
  my $id = shift;
  my $additional_classes = shift;
  my $element = shift;

  return '' if ($text !~ /\S/ and not defined($id));

  # This should seldom happen.
  if ($self->in_string()) {
    $text .= "\n" unless (defined($cmdname) and $cmdname eq 'titlefont');
    return $text;
  }

  if ($level < 1) {
    $level = 1;
  } elsif ($level > $self->get_conf('MAX_HEADER_LEVEL')) {
    $level = $self->get_conf('MAX_HEADER_LEVEL');
  }
  my $id_str = '';
  if (defined($id)) {
    $id_str = " id=\"$id\"";
  }
  my $result = $self->html_attribute_class("h$level", $class, $additional_classes)
                    ."${id_str}>$text</h$level>";
  # titlefont appears inline in text, so no end of line is
  # added. The end of line should be added by the user if needed.
  $result .= "\n" unless (defined($cmdname) and $cmdname eq 'titlefont');
  $result .= $self->get_conf('DEFAULT_RULE') . "\n"
     if (defined($cmdname) and $cmdname eq 'part'
         and defined($self->get_conf('DEFAULT_RULE'))
         and $self->get_conf('DEFAULT_RULE') ne '');
  return $result;
}

sub _default_format_separate_anchor($$;$)
{
  my $self = shift;
  my $id = shift;
  my $class = shift;

  # html_attribute_class would not work with span, so if span is
  # used, html_attribute_class should not be used
  return $self->html_attribute_class('a', $class)." id=\"$id\"></a>";
}

# Associated to a button.  Return text to use for a link in button bar.
# Depending on USE_NODE_DIRECTIONS and xrefautomaticsectiontitle
# use section or node for link direction and string.
sub _default_panel_button_dynamic_direction($$;$$)
{
  my $self = shift;
  my $direction = shift;
  my $omit_rel = shift;
  my $use_first_element_in_file_directions = shift;
  
  my $result = undef;

  if ((defined($self->get_conf('USE_NODE_DIRECTIONS'))
       and $self->get_conf('USE_NODE_DIRECTIONS'))
      or (not defined($self->get_conf('USE_NODE_DIRECTIONS'))
          and $self->get_conf('USE_NODES'))) {
    $direction = 'Node'.$direction;
  }

  if ($use_first_element_in_file_directions) {
    $direction = 'FirstInFile'.$direction;
  }

  my $href = $self->from_element_direction($self->{'current_root_element'},
                                           $direction, 'href');
  my $node;


  if ($self->get_conf('xrefautomaticsectiontitle') eq 'on') {
    $node = $self->from_element_direction($self->{'current_root_element'},
                                             $direction, 'section');
  }

  if (!defined($node)) {
    $node = $self->from_element_direction($self->{'current_root_element'},
                                      $direction, 'node');
  }

  my $anchor;
  if (defined($href) and defined($node) and $node =~ /\S/) {
    my $anchor_attributes = $omit_rel ? ''
      : $self->_direction_href_attributes($direction);
    $anchor = "<a href=\"$href\"${anchor_attributes}>$node</a>";
  }
  if (defined($anchor)) {
    # i18n
    $result = $self->get_conf('BUTTONS_TEXT')->{$direction}.": $anchor";
  }
  # 1 to communicate that a delimiter is needed for that button
  return ($result, 1);
}

# Used for button bar at the foot of a node, with "rel" and "accesskey"
# attributes omitted.
sub _default_panel_button_dynamic_direction_node_footer($$)
{
  my $self = shift;
  my $direction = shift;

  return _default_panel_button_dynamic_direction($self, $direction, 1);
}

# used for button bar at the foot of a section or chapter with
# directions of first element in file used instead of the last
# element directions.
sub _default_panel_button_dynamic_direction_section_footer($$) {
  my $self = shift;
  my $direction = shift;

  return _default_panel_button_dynamic_direction($self, $direction, undef, 1);
}

# Only used if ICONS is set and the button is active.
sub _default_format_button_icon_img($$$;$)
{
  my $self = shift;
  my $button = shift;
  my $icon = shift;
  my $name = shift;

  return '' if (!defined($icon));
  $button = '' if (!defined ($button));
  $name = '' if (!defined($name));
  my $alt = '';
  if ($name ne '') {
    if ($button ne '') {
      $alt = "$button: $name";
    } else {
      $alt = $name;
    }
  } else {
    $alt = $button;
  }
  return $self->close_html_lone_element(
    "<img src=\"$icon\" border=\"0\" alt=\"$alt\" align=\"middle\"");
}

sub _direction_href_attributes($$)
{
  my $self = shift;
  my $direction = shift;

  my $href_attributes = '';
  if ($self->get_conf('USE_ACCESSKEY') 
      and $self->get_conf('BUTTONS_ACCESSKEY')) {
    my $accesskey = $self->get_conf('BUTTONS_ACCESSKEY')->{$direction};
    if (defined($accesskey) and ($accesskey ne '')) {
      $href_attributes = " accesskey=\"$accesskey\"";
    }
  }
  if ($self->get_conf('USE_REL_REV') and $self->get_conf('BUTTONS_REL')) {
    my $button_rel = $self->get_conf('BUTTONS_REL')->{$direction};
    if (defined($button_rel) and ($button_rel ne '')) {
      $href_attributes .= " rel=\"$button_rel\"";
    }
  }
  return $href_attributes;
}

my %html_default_node_directions;
foreach my $node_directions ('NodeNext', 'NodePrev', 'NodeUp') {
  $html_default_node_directions{$node_directions} = 1;
}

sub _default_format_button($$)
{
  my $self = shift;
  my $button = shift;

  my ($active, $passive, $need_delimiter);
  if (ref($button) eq 'CODE') {
    ($active, $need_delimiter) = &$button($self);
  } elsif (ref($button) eq 'SCALAR') {
    $active = "$$button" if defined($$button);
    $need_delimiter = 1;
  } elsif (ref($button) eq 'ARRAY' and scalar(@$button == 2)) {
    my $text = $button->[1];
    my $direction = $button->[0];
    # $direction is simple text and $text is a reference
    if (defined($direction) and ref($direction) eq ''
        and defined($text) and (ref($text) eq 'SCALAR') and defined($$text)) {
      # use given text
      my $href = $self->from_element_direction(
                   $self->{'current_root_element'}, $direction, 'href');
      if ($href) {
        my $anchor_attributes = $self->_direction_href_attributes($direction);
        $active = "<a href=\"$href\"${anchor_attributes}>$$text</a>";
      } else {
        $passive = $$text;
      }
      $need_delimiter = 1;
    # $direction is simple text and $text is a reference on code
    } elsif (defined($direction) and ref($direction) eq ''
             and defined($text) and (ref($text) eq 'CODE')) {
      ($active, $need_delimiter) = &$text($self, $direction);
    # $direction is simple text and $text is also a simple text
    } elsif (defined($direction) and ref($direction) eq ''
             and defined($text) and ref($text) eq '') {
      if ($text =~ s/^->\s*//) {
        # this case is mostly for tests, to test the direction type $text
        # with the direction $direction
        $active = $self->from_element_direction(
                    $self->{'current_root_element'}, $direction, $text);
      } else {
        my $href = $self->from_element_direction(
                      $self->{'current_root_element'}, $direction, 'href');
        my $text_formatted = $self->from_element_direction(
                     $self->{'current_root_element'}, $direction, $text);
        if ($href) {
          my $anchor_attributes = $self->_direction_href_attributes($direction);
          $active = "<a href=\"$href\"${anchor_attributes}>$text_formatted</a>";
        } else {
          $passive = $text_formatted;
        }
      }
      $need_delimiter = 1;
    }
  } elsif ($button eq ' ') {
    # handle space button
    if ($self->get_conf('ICONS') and $self->get_conf('ACTIVE_ICONS')
        and defined($self->get_conf('ACTIVE_ICONS')->{$button})
        and $self->get_conf('ACTIVE_ICONS')->{$button} ne '') {
      my $button_name = $self->get_conf('BUTTONS_NAME')->{$button};
      $active = &{$self->{'format_button_icon_img'}}($self, $button_name, 
                                       $self->get_conf('ACTIVE_ICONS')->{' '});
    } else {
      $active = $self->get_conf('BUTTONS_TEXT')->{$button};
    }
    $need_delimiter = 0;
  } else {
    my $href = $self->from_element_direction($self->{'current_root_element'},
                                         $button, 'href');
    if ($href) {
      # button is active
      my $btitle = '';
      if ($self->get_conf('BUTTONS_GOTO') 
          and defined($self->get_conf('BUTTONS_GOTO')->{$button})) {
        $btitle = ' title="' . $self->get_conf('BUTTONS_GOTO')->{$button} . '"';
      }
      if ($self->get_conf('USE_ACCESSKEY') and $self->get_conf('BUTTONS_ACCESSKEY')) {
        my $accesskey = $self->get_conf('BUTTONS_ACCESSKEY')->{$button};
        if (defined($accesskey) and $accesskey ne '') {
          $btitle .= " accesskey=\"$accesskey\"";
        }
      }
      if ($self->get_conf('USE_REL_REV') and ($self->get_conf('BUTTONS_REL'))) {
        my $button_rel = $self->get_conf('BUTTONS_REL')->{$button};
        if (defined($button_rel) and $button_rel ne '') {
          $btitle .= " rel=\"$button_rel\"";
        }
      }
      my $use_icon;
      if ($self->get_conf('ICONS') and $self->get_conf('ACTIVE_ICONS')
          and $self->get_conf('BUTTONS_NAME')) {
        my $active_icon = $self->get_conf('ACTIVE_ICONS')->{$button};
        my $button_name = $self->get_conf('BUTTONS_NAME')->{$button};
        if (defined($active_icon) and $active_icon ne '' 
            and defined($button_name)) {
          # use icon
          $active = "<a href=\"$href\"${btitle}>".
             &{$self->{'format_button_icon_img'}}($self, $button_name, $active_icon,
                      $self->from_element_direction(
                                           $self->{'current_root_element'},
                                           $button, 'string')) ."</a>";
          $use_icon = 1;
        }
      }
      if (!$use_icon) {
        # use text
        $active = '[' . "<a href=\"$href\"${btitle}>".
          $self->get_conf('BUTTONS_TEXT')->{$button}."</a>" . ']';
      }
    } else {
      # button is passive
      my $use_icon;
      if ($self->get_conf('ICONS') and $self->get_conf('PASSIVE_ICONS')
          and $self->get_conf('BUTTONS_NAME')) {
        my $passive_icon = $self->get_conf('PASSIVE_ICONS')->{$button};
        my $button_name = $self->get_conf('BUTTONS_NAME')->{$button};
        if ($passive_icon and $passive_icon ne '') {
          $passive = &{$self->{'format_button_icon_img'}}($self, $button_name, 
                                                   $passive_icon,
                      $self->from_element_direction(
                                             $self->{'current_root_element'},
                                             $button, 'string'));
          $use_icon = 1;
        }
      }
      if (!$use_icon) {
        $passive =  '[' . $self->get_conf('BUTTONS_TEXT')->{$button} . ']';
      }
    }
    $need_delimiter = 0;
  }
  # FIXME chose another option among those proposed in comments below?
  if (not defined($need_delimiter)) {
    # option 1: be forgiving if $need_delimiter is not set
    # if ($html_default_node_directions{$button}) {
    #   $need_delimiter = 1;
    # } else {
    #   $need_delimiter = 0;
    # }
    # option 2: be somewhat forgiving but show a backtrace
    #cluck ("need_delimiter not defined");
    # $need_delimiter = 0;
    # option3: no pity
    confess ("need_delimiter not defined");
  }
  return ($active, $passive, $need_delimiter);
}

# called for special elements and tree units
sub _default_format_navigation_panel($$$$;$)
{
  my $self = shift;
  my $buttons = shift;
  my $cmdname = shift;
  my $element = shift;
  my $vertical = shift;

  # if VERTICAL_HEAD_NAVIGATION, the buttons are in a vertical table which
  # is itself in the first column of a table opened in header_navigation
  #my $vertical = $self->get_conf('VERTICAL_HEAD_NAVIGATION');

  my $result = '';
  if ($self->get_conf('HEADER_IN_TABLE')) {
    $result .= $self->html_attribute_class('table', 'nav-panel')
        .' cellpadding="1" cellspacing="1" border="0">'."\n";
    $result .= "<tr>" unless $vertical;
  } else {
    $result .= $self->html_attribute_class('div', 'nav-panel').">\n<p>\n";
  }

  my $first_button = 1;
  foreach my $button (@$buttons) {
    if ($self->get_conf('HEADER_IN_TABLE')) {
      $result .= qq{<tr valign="top" align="left">\n} if $vertical;
      $result .=  qq{<td valign="middle" align="left">};
    }
    my $direction;
    if (ref($button) eq 'ARRAY'
        and defined($button->[0]) and ref($button->[0]) eq '') {
      $direction = $button->[0];
    } elsif (defined($button) and ref($button) eq '') {
      $direction = $button;
    }

    my ($active, $passive, $need_delimiter) = &{$self->{'format_button'}}($self, $button);
    if ($self->get_conf('HEADER_IN_TABLE')) {
      if (defined($active)) {
        $result .= $active;
      } elsif (defined($passive)) {
        $result .= $passive;
      }
      $result .= "</td>\n";
      $result .= "</tr>\n" if $vertical;
      $first_button = 0 if ($first_button);
    } elsif (defined($active)) {
      # only active buttons are print out when not in table
      if ($need_delimiter and !$first_button) {
        $active = ', ' .$active;
      }
      $result .= $active;
      $first_button = 0 if ($first_button);
    }
  }
  if ($self->get_conf('HEADER_IN_TABLE')) {
    $result .= "</tr>" unless $vertical;
    $result .= "</table>\n";
  } else {
     $result .= "</p>\n</div>\n";
  }
  return $result;
}

sub _default_format_navigation_header($$$$)
{
  my $self = shift;
  my $buttons = shift;
  my $cmdname = shift;
  my $element = shift;

  my $result = '';
  if ($self->get_conf('VERTICAL_HEAD_NAVIGATION')) {
    $result .= '<table border="0" cellpadding="0" cellspacing="0">
<tr valign="top">
<td align="left">
';
  }
  $result .= &{$self->{'format_navigation_panel'}}($self, $buttons,
                                                   $cmdname, $element,
                                   $self->get_conf('VERTICAL_HEAD_NAVIGATION'));
  if ($self->get_conf('VERTICAL_HEAD_NAVIGATION')) {
    $result .= '</td>
<td align="left">
';
  } elsif ($self->get_conf('SPLIT') eq 'node') {
    $result .= $self->get_conf('DEFAULT_RULE')."\n";
  }
  return $result;
}

# this can only be called on root commands and associated tree units
sub _default_format_element_header($$$$)
{
  my $self = shift;
  my $cmdname = shift;
  my $command = shift;
  my $tree_unit = shift;

  my $result = '';
   
  print STDERR "FORMAT elt header $tree_unit (@{$tree_unit->{'contents'}}) ".
     Texinfo::Structuring::root_or_external_element_cmd_texi($tree_unit) ."\n"
        if ($self->get_conf('DEBUG'));

  # Do the heading if the command is the first command in the element
  if (($tree_unit->{'contents'}->[0] eq $command
       or (!$tree_unit->{'contents'}->[0]->{'cmdname'}
            and $tree_unit->{'contents'}->[1] eq $command))
      # and there is more than one element
      and ($tree_unit->{'structure'}->{'unit_next'} or $tree_unit->{'structure'}->{'unit_prev'})) {
    my $is_top = $self->element_is_tree_unit_top($tree_unit);
    my $first_in_page = (defined($tree_unit->{'structure'}->{'unit_filename'})
           and $self->{'counter_in_file'}->{$tree_unit->{'structure'}->{'unit_filename'}} == 1);
    my $previous_is_top = ($tree_unit->{'structure'}->{'unit_prev'}
                   and $self->element_is_tree_unit_top($tree_unit->{'structure'}->{'unit_prev'}));

    print STDERR "Header ($previous_is_top, $is_top, $first_in_page): "
      .Texinfo::Convert::Texinfo::root_element_command_to_texinfo($command)."\n"
        if ($self->get_conf('DEBUG'));

    if ($is_top) {
      # use TOP_BUTTONS for top.
      $result .= &{$self->{'format_navigation_header'}}($self,
               $self->get_conf('TOP_BUTTONS'), $cmdname, $command)
        if ($self->get_conf('SPLIT') or $self->get_conf('HEADERS'));
    } else {
      if ($first_in_page and !$self->get_conf('HEADERS')) {
        if ($self->get_conf('SPLIT') eq 'chapter') {
          $result .= &{$self->{'format_navigation_header'}}($self,
                $self->get_conf('CHAPTER_BUTTONS'), $cmdname, $command);

          $result .= $self->get_conf('DEFAULT_RULE') ."\n"
            if (defined($self->get_conf('DEFAULT_RULE'))
                and !$self->get_conf('VERTICAL_HEAD_NAVIGATION'));
        } elsif ($self->get_conf('SPLIT') eq 'section') {
          $result .= &{$self->{'format_navigation_header'}}($self,
                $self->get_conf('SECTION_BUTTONS'), $cmdname, $command);
        }
      }
      if (($first_in_page or $previous_is_top)
           and $self->get_conf('HEADERS')) {
        $result .= &{$self->{'format_navigation_header'}}($self,
                $self->get_conf('SECTION_BUTTONS'), $cmdname, $command);
      } elsif($self->get_conf('HEADERS') or $self->get_conf('SPLIT') eq 'node') {
        # got to do this here, as it isn't done otherwise since 
        # navigation_header is not called
        $result .= &{$self->{'format_navigation_panel'}}($self,
                $self->get_conf('SECTION_BUTTONS'), $cmdname, $command);
      }
    }
  }
  return $result;
}

sub register_opened_section_level($$$)
{
  my $self = shift;
  my $level = shift;
  my $close = shift;
  while (@{$self->{'pending_closes'}} < $level) {
      push(@{$self->{'pending_closes'}}, "");
  }
  push(@{$self->{'pending_closes'}}, $close);
}

sub close_registered_sections_level($$)
{
  my $self = shift;
  my $level = shift;
  if (not defined($level)) {
    cluck 'close_registered_sections_level $level not defined';
  }
  my @closed_elements;
  my $result = '';
  while (@{$self->{'pending_closes'}} > $level) {
      my $close = pop @{$self->{'pending_closes'}};
      push(@closed_elements, $close)
        if ($close);
  }
  return @closed_elements;
}

sub _convert_heading_command($$$$$)
{
  my $self = shift;
  my $cmdname = shift;
  my $element = shift;
  my $args = shift;
  my $content = shift;

  my $result = '';

  # not clear that it may really happen
  if ($self->in_string()) {
    $result .= $self->command_string($element) ."\n" if ($cmdname ne 'node');
    $result .= $content if (defined($content));
    return $result;
  }

  my $element_id = $self->command_id($element);

  my @additional_heading_classes;
  my $level_corrected_cmdname = $cmdname;
  if (defined $element->{'structure'}->{'section_level'}) {
    # if the level was changed, use a consistent command name
    $level_corrected_cmdname
      = Texinfo::Structuring::section_level_adjusted_command_name($element);
    if ($level_corrected_cmdname ne $cmdname) {
      push @additional_heading_classes,
            "${cmdname}-level-set-${level_corrected_cmdname}";
    }
  }

  # find the section starting here, can be through the associated node
  # preceding the section, or the section itself
  my $opening_section;
  my $level_corrected_opening_section_cmdname;
  if ($cmdname eq 'node' and $element->{'extra'}->{'associated_section'}) {
    $opening_section = $element->{'extra'}->{'associated_section'};
    $level_corrected_opening_section_cmdname
     = Texinfo::Structuring::section_level_adjusted_command_name($opening_section);
  } elsif ($cmdname ne 'node'
           # if there is an associated node, it is not a section opening
           # the section was opened before when the node was encountered
           and not $element->{'extra'}->{'associated_node'}
           # to avoid *heading* @-commands
           and $Texinfo::Common::root_commands{$cmdname}) {
    $opening_section = $element;
    $level_corrected_opening_section_cmdname = $level_corrected_cmdname;
  }

  print STDERR "CONVERT elt heading $element "
        .Texinfo::Convert::Texinfo::root_element_command_to_texinfo($element)."\n"
          if ($self->get_conf('DEBUG'));
  my $tree_unit;
  if ($Texinfo::Common::root_commands{$element->{'cmdname'}}
      and $element->{'structure'}->{'associated_unit'}) {
    $tree_unit = $element->{'structure'}->{'associated_unit'};
  }
  my $element_header = '';
  if ($tree_unit) {
    $element_header = &{$self->{'format_element_header'}}($self, $cmdname,
                                            $element, $tree_unit);
  }

  # $heading not defined may happen if the command is a @node, for example
  # if there is an error in the node.
  my $heading = $self->command_text($element);
  my $heading_level;
  # node is used as heading if there is nothing else.
  if ($cmdname eq 'node') {
    # FIXME what to do if the $tree_unit extra does not contain any
    # unit_command, but tree_unit is defined (it can contain only 'first_in_page')
    if ((!$tree_unit # or !$tree_unit->{'extra'}
         # or !$tree_unit->{'extra'}->{'unit_command'}
         or ($tree_unit->{'extra'}->{'unit_command'}
             and $tree_unit->{'extra'}->{'unit_command'} eq $element
             and not $element->{'extra'}->{'associated_section'}))
        and defined($element->{'extra'}->{'normalized'})) {
      if ($element->{'extra'}->{'normalized'} eq 'Top') {
        $heading_level = 0;
      } else {
        $heading_level = 3;
      }
    }
  } elsif (defined $element->{'structure'}->{'section_level'}) {
    $heading_level = $element->{'structure'}->{'section_level'};
  } else {
    # for *heading* @-commands which do not have a level
    # in the document as they are not associated with the
    # sectioning tree, but still have a $heading_level
    $heading_level = Texinfo::Structuring::section_level($element);
  }
 
  my $do_heading = (defined($heading) and $heading ne ''
                    and defined($heading_level));

  # if set, the id is associated to the heading text
  my $heading_id;
  if ($opening_section) {
    my $level = $opening_section->{'structure'}->{'section_level'};
    $result .= join('', $self->close_registered_sections_level($level));
    $self->register_opened_section_level($level, "</div>\n");

    # use a specific class name to mark that this is the start of
    # the section extent. It is not necessary where the section is.
    $result .= $self->html_attribute_class('div',
                 "${level_corrected_opening_section_cmdname}-level-extent");
    $result .= " id=\"$element_id\""
        if (defined($element_id) and $element_id ne '');
    $result .= ">\n";
  } elsif (defined($element_id) and $element_id ne '') {
    if ($element_header ne '') {
      # case of a @node without sectioning command and with a header.
      # put the node element anchor before the header.
      # Set the class name to the command name if there is no heading,
      # else the class will be with the heading element.
      my $id_class = $cmdname;
      if ($do_heading) {
        $id_class = "${cmdname}-id";
      }
      $result .= &{$self->{'format_separate_anchor'}}($self, $element_id,
                                                      $id_class);
    } else {
      $heading_id = $element_id;
    }
  }

  $result .= $element_header;


  if ($do_heading) {
    if ($self->get_conf('TOC_LINKS')
        and $Texinfo::Common::root_commands{$cmdname}
        and $Texinfo::Common::sectioning_commands{$cmdname}) {
      my $content_href = $self->command_contents_href($element, 'contents',
                                        $self->{'current_filename'});
      if ($content_href) {
        $heading = "<a href=\"$content_href\">$heading</a>";
      }
    }

    if ($self->in_preformatted()) {
      my $id_str = '';
      if (defined($heading_id)) {
        $id_str = " id=\"$heading_id\"";
      }
      $result .= "<strong${id_str}>".$heading.'</strong>'."\n";
    } else {
      my $heading_class = $level_corrected_cmdname;
      $result .= &{$self->{'format_heading_text'}}($self,
                     $level_corrected_cmdname, $heading_class, $heading,
                     $heading_level +$self->get_conf('CHAPTER_HEADER_LEVEL') -1,
                     $heading_id, \@additional_heading_classes, $element);
    }
  } elsif (defined($heading_id)) {
    # case of a lone node and no header, and case of an empty @top
    $result .= &{$self->{'format_separate_anchor'}}($self, $heading_id,
                                                    $cmdname);
  }
  $result .= $content if (defined($content));

  my $table_of_contents_was_output = 0.;
  if ($self->get_conf('CONTENTS_OUTPUT_LOCATION') eq 'after_top'
      and $cmdname eq 'top'
      and $self->{'structuring'} and $self->{'structuring'}->{'sectioning_root'}
      and scalar(@{$self->{'structuring'}->{'sections_list'}}) > 1) {
    foreach my $content_command_name ('contents', 'shortcontents') {
      if ($self->get_conf($content_command_name)) {
        my $contents_text
          = $self->_contents_inline_element($content_command_name, undef);
        if ($contents_text ne '') {
          $result .= $contents_text;
          $table_of_contents_was_output = 1;
        }
      }
    }
  }
  if (not $table_of_contents_was_output
      and $self->get_conf('FORMAT_MENU') eq 'sectiontoc'
      and $sectioning_commands{$cmdname}) {
    $result .= _mini_toc($self, $element);
  }
  return $result;
}

foreach my $command (keys(%sectioning_commands), 'node') {
  $default_commands_conversion{$command} = \&_convert_heading_command;
}

sub _convert_raw_command($$$$)
{
  my $self = shift;
  my $cmdname = shift;
  my $command = shift;
  my $content = shift;

  if ($cmdname eq $self->{'output_format'}) {
    return $content;
  }
  $self->_noticed_line_warn(sprintf(__("raw format %s is not converted"),
                                   $cmdname), $command->{'line_nr'});
  return $self->protect_text($content);
}

foreach my $command (keys(%format_raw_commands)) {
  $default_commands_conversion{$command} = \&_convert_raw_command;
}

sub _convert_inline_command($$$$)
{
  my $self = shift;
  my $cmdname = shift;
  my $command = shift;
  my $args = shift;

  my $format_arg = shift @$args;

  my $format;
  if (defined($format_arg)) {
    $format = $format_arg->{'monospacetext'};
  }
  return '' if (!defined($format) or $format eq '');

  my $arg_index = undef;
  if ($inline_format_commands{$cmdname}) {
    if ($cmdname eq 'inlinefmtifelse' 
        and ! $self->{'expanded_formats_hash'}->{$format}) {
      $arg_index = 1;
    } elsif ($self->{'expanded_formats_hash'}->{$format}) {
      $arg_index = 0;
    }
  } elsif (defined($command->{'extra'}->{'expand_index'})) {
    $arg_index = 0;
  }
  if (defined($arg_index) and $arg_index < scalar(@$args)) {
    my $text_arg = $args->[$arg_index];
    if ($text_arg) {
      if ($text_arg->{'normal'}) {
        return $text_arg->{'normal'};
      } elsif ($text_arg->{'raw'}) {
        return $text_arg->{'raw'};
      }
    }
  }
  return '';
}

foreach my $command (keys(%inline_commands)) {
  $default_commands_conversion{$command} = \&_convert_inline_command;
}

sub _indent_with_table($$$)
{
  my $self = shift;
  my $cmdname = shift;
  my $content = shift;

  return $self->html_attribute_class('table', $cmdname)
         .'><tr><td>'.$self->html_non_breaking_space().'</td><td>'.$content
                ."</td></tr></table>\n";
}

my $html_menu_entry_index = 0;
sub _convert_preformatted_command($$$$)
{
  my $self = shift;
  my $cmdname = shift;
  my $command = shift;
  my $content = shift;
  my $extra_classes;

  # this is mainly for classes as there are purprosely no classes 
  # for small*
  my $main_cmdname;
  if ($small_alias{$cmdname}) {
    $main_cmdname = $small_alias{$cmdname};
  } else {
    $main_cmdname = $cmdname;
  }

  if ($cmdname eq 'menu') {
    $html_menu_entry_index = 0;
  } elsif ($cmdname eq 'example') {
    if ($command->{'args'}) {
      $extra_classes = [];
      for my $example_arg (@{$command->{'args'}}) {
        # convert or remove all @-commands, using simple ascii and unicode 
        # characters
        my $converted_arg = Texinfo::Convert::NodeNameNormalization::convert($example_arg);
        if ($converted_arg ne '') {
          push @$extra_classes, $converted_arg;
        }
      }
    }
  } elsif ($main_cmdname eq 'lisp') {
    $main_cmdname = 'example';
    $extra_classes = ['lisp'];
  }

  if ($content ne '' and !$self->in_string()) {
    if ($self->get_conf('COMPLEX_FORMAT_IN_TABLE')
        and $indented_preformatted_commands{$cmdname}) {
      return _indent_with_table($self, $cmdname, $content);
    } else {
      return $self->html_attribute_class('div', $main_cmdname, $extra_classes)
                                                 .">\n".$content.'</div>'."\n";
    }
  } else {
    return $content;
  }
}

foreach my $preformatted_command (keys(%preformatted_commands)) {
  $default_commands_conversion{$preformatted_command} 
    = \&_convert_preformatted_command;
}

sub _convert_indented_command($$$$)
{
  my $self = shift;
  my $cmdname = shift;
  my $command = shift;
  my $content = shift;

  # no class for @small* variants
  $cmdname = $small_alias{$cmdname}
    if $small_alias{$cmdname};
  
  if ($content ne '' and !$self->in_string()) {
    if ($self->get_conf('COMPLEX_FORMAT_IN_TABLE')) {
      return _indent_with_table($self, $cmdname, $content);
    } else {
      return $self->html_attribute_class('blockquote', $cmdname).">\n"
             .$content.'</blockquote>'."\n";
    }
  } else {
    return $content;
  }
}

$default_commands_conversion{'indentedblock'} = \&_convert_indented_command;

sub _convert_verbatim_command($$$$)
{
  my $self = shift;
  my $cmdname = shift;
  my $command = shift;
  my $content = shift;

  if (!$self->in_string) {
    return $self->html_attribute_class('pre', $cmdname).'>'
          .$content . '</pre>';
  } else {
    return $content;
  }
}

$default_commands_conversion{'verbatim'} = \&_convert_verbatim_command;

sub _convert_displaymath_command($$$$)
{
  my $self = shift;
  my $cmdname = shift;
  my $command = shift;
  my $content = shift;

  if ($self->in_string) {
    return $content;
  }

  my $result = '';
  $result .= $self->html_attribute_class('div', $cmdname).'>';
  if ($self->get_conf('HTML_MATH')
        and $self->get_conf('HTML_MATH') eq 'mathjax') {
    $self->register_file_information('mathjax', 1);
    $result .= $self->html_attribute_class('em', 'tex2jax_process').'>'
          ."\\[$content\\]".'</em>';
  } else {
    $result .= $self->html_attribute_class('em').'>'."$content".'</em>';
  }
  $result .= '</div>';
  return $result;
}

$default_commands_conversion{'displaymath'} = \&_convert_displaymath_command;

sub _convert_verbatiminclude_command($$$$)
{
  my $self = shift;
  my $cmdname = shift;
  my $command = shift;
  my $args = shift;

  my $verbatim_include_verbatim 
    = Texinfo::Convert::Utils::expand_verbatiminclude($self, $self, $command);
  if (defined($verbatim_include_verbatim)) {
    return $self->convert_tree($verbatim_include_verbatim, 'convert verbatiminclude');
  } else {
    return '';
  }
}

$default_commands_conversion{'verbatiminclude'} 
  = \&_convert_verbatiminclude_command;

sub _convert_command_simple_block($$$$)
{
  my $self = shift;
  my $cmdname = shift;
  my $command = shift;
  my $content = shift;

  return $self->html_attribute_class('div', $cmdname).'>'
        .$content.'</div>';
}

$default_commands_conversion{'raggedright'} = \&_convert_command_simple_block;
$default_commands_conversion{'flushleft'} = \&_convert_command_simple_block;
$default_commands_conversion{'flushright'} = \&_convert_command_simple_block;
$default_commands_conversion{'group'} = \&_convert_command_simple_block;

sub _convert_sp_command($$$$)
{
  my $self = shift;
  my $cmdname = shift;
  my $command = shift;
  my $args = shift;

  if (defined($command->{'extra'}->{'misc_args'}->[0])) {
    my $sp_nr = $command->{'extra'}->{'misc_args'}->[0];
    if ($self->in_preformatted() or $self->in_string()) {
      return "\n" x $sp_nr;
    } else {
      return ($self->html_line_break_element()."\n") x $sp_nr;
    }
  }
}

$default_commands_conversion{'sp'} = \&_convert_sp_command;

sub _convert_exdent_command($$$$)
{
  my $self = shift;
  my $cmdname = shift;
  my $command = shift;
  my $args = shift;


  my $arg = $self->get_pending_formatted_inline_content().$args->[0]->{'normal'};

  if ($self->in_string()) {
    return $arg ."\n";
  }

  # FIXME do something with CSS?  Currently nothing is defined for exdent

  my $preformatted = $self->in_preformatted();
  
  if ($self->in_preformatted()) {
    return $self->html_attribute_class('pre', $cmdname).'>'.$arg ."\n</pre>";
  } else {
    return $self->html_attribute_class('p', $cmdname).'>'.$arg ."\n</p>";
  }
}

$default_commands_conversion{'exdent'} = \&_convert_exdent_command;

sub _convert_center_command($$$$)
{
  my $self = shift;
  my $cmdname = shift;
  my $command = shift;
  my $args = shift;

  if ($self->in_string()) {
    return $args->[0]->{'normal'}."\n";
  } else {
    return $self->html_attribute_class('div', $cmdname).">"
                                 .$args->[0]->{'normal'}."\n</div>";
  }
}

$default_commands_conversion{'center'} = \&_convert_center_command;

sub _convert_author_command($$$$)
{
  my $self = shift;
  my $cmdname = shift;
  my $command = shift;
  my $args = shift;

  return '' if (!$args->[0] or !$command->{'extra'}->{'titlepage'});
  if (!$self->in_string()) {
    return $self->html_attribute_class('strong', $cmdname)
                .">$args->[0]->{'normal'}</strong>"
                .$self->html_line_break_element()."\n";
  } else {
    return $args->[0]->{'normal'} . "\n";
  }
}

$default_commands_conversion{'author'} = \&_convert_author_command;

sub _convert_title_command($$$$)
{
  my $self = shift;
  my $cmdname = shift;
  my $command = shift;
  my $args = shift;
  return '' if (!$args->[0]);
  if (!$self->in_string()) {
    return $self->html_attribute_class('h1', $cmdname)
                            .">$args->[0]->{'normal'}</h1>\n";
  } else {
    return $args->[0]->{'normal'};
  }
}
$default_commands_conversion{'title'} = \&_convert_title_command;

sub _convert_subtitle_command($$$$)
{
  my $self = shift;
  my $cmdname = shift;
  my $command = shift;
  my $args = shift;
  return '' if (!$args->[0]);
  if (!$self->in_string()) {
    return $self->html_attribute_class('h3', $cmdname)
                            .">$args->[0]->{'normal'}</h3>\n";
  } else {
    return $args->[0]->{'normal'};
  }
}
$default_commands_conversion{'subtitle'} = \&_convert_subtitle_command;

sub _convert_insertcopying_command($$$$)
{
  my $self = shift;
  my $cmdname = shift;
  my $command = shift;

  if ($self->{'global_commands'} and $self->{'global_commands'}->{'copying'}) {
    return $self->convert_tree({'contents' 
               => $self->{'global_commands'}->{'copying'}->{'contents'}},
                               'convert insertcopying');
  }
  return '';
}
$default_commands_conversion{'insertcopying'} 
   = \&_convert_insertcopying_command;

sub _convert_listoffloats_command($$$$)
{
  my $self = shift;
  my $cmdname = shift;
  my $command = shift;
  my $args = shift;

  if (!$self->in_string()
      and $command->{'extra'} and $command->{'extra'}->{'type'}
      and defined($command->{'extra'}->{'type'}->{'normalized'})
      and $self->{'floats'}
      and $self->{'floats'}->{$command->{'extra'}->{'type'}->{'normalized'}}
      and @{$self->{'floats'}->{$command->{'extra'}->{'type'}->{'normalized'}}}) { 
    my $listoffloats_name = $command->{'extra'}->{'type'}->{'normalized'};
    my $result = $self->html_attribute_class('dl', $cmdname).">\n" ;
    foreach my $float (@{$self->{'floats'}->{$listoffloats_name}}) {
      my $float_href = $self->command_href($float);
      next if (!$float_href);
      $result .= '<dt>';
      my $float_text = $self->command_text($float);
      if (defined($float_text) and $float_text ne '') {
        if ($float_href) {
          $result .= "<a href=\"$float_href\">$float_text</a>";
        } else {
          $result .= $float_text;
        }
      }
      $result .= '</dt>';
      my $caption;
      my $caption_cmdname;
      if ($float->{'extra'}->{'shortcaption'}) {
        $caption = $float->{'extra'}->{'shortcaption'};
        $caption_cmdname = 'shortcaption';
      } elsif ($float->{'extra'}->{'caption'}) {
        $caption = $float->{'extra'}->{'caption'};
        $caption_cmdname = 'caption';
      }

      my $caption_text;
      my $caption_class;
      if ($caption) {
        $caption_text = $self->convert_tree_new_formatting_context(
          $caption->{'args'}->[0], $cmdname, 'listoffloats');
        $caption_class = "${caption_cmdname}-in-${cmdname}";
      } else {
        $caption_text = '';
      }
      $result .= $self->html_attribute_class('dd', $caption_class).'>'
                                           .$caption_text.'</dd>'."\n";
    }
    return $result . "</dl>\n";
  } else {
    return '';
  }
}
$default_commands_conversion{'listoffloats'} = \&_convert_listoffloats_command;

sub _in_preformatted_in_menu($)
{
  my $self = shift;
  return 1 if ($self->get_conf('SIMPLE_MENU'));
  my @pre_classes = $self->preformatted_classes_stack();
  foreach my $pre_class (@pre_classes) {
    return 1 if ($preformatted_commands{$pre_class});
  }
  return 0;
}

sub _convert_menu_command($$$$)
{
  my $self = shift;
  my $cmdname = shift;
  my $command = shift;
  my $content = shift;

  return $content if ($cmdname eq 'detailmenu');

  $html_menu_entry_index = 0;
  if ($content !~ /\S/) {
    return '';
  }
  # This can probably only happen with incorrect input,
  # for instance menu in copying
  # FIXME check?
  if ($self->in_string()) {
    return $content;
  }

  if ($self->get_conf('SIMPLE_MENU')) {
    return $self->html_attribute_class('div', $cmdname).'>'
       .$content ."</div>\n";
  }
  my $begin_row = '';
  my $end_row = '';
  if ($self->_in_preformatted_in_menu()) {
    $begin_row = '<tr><td>';
    $end_row = '</td></tr>';
  }
  return $self->html_attribute_class('table', $cmdname)
    ." border=\"0\" cellspacing=\"0\">${begin_row}\n"
      . $content . "${end_row}</table>\n";
}
$default_commands_conversion{'menu'} = \&_convert_menu_command;
$default_commands_conversion{'detailmenu'} = \&_convert_menu_command;

sub _convert_float_command($$$$$)
{
  my $self = shift;
  my $cmdname = shift;
  my $command = shift;
  my $args = shift;
  my $content = shift;

  my ($caption, $prepended)
     = Texinfo::Convert::Converter::float_name_caption($self, $command);
  my $caption_command_name;
  if (defined($caption)) {
    $caption_command_name = $caption->{'cmdname'};
  }
  if ($self->in_string()) {
    my $prepended_text;
    if ($prepended) {
      $prepended_text = $self->convert_tree_new_formatting_context(
        $prepended, 'float prepended');
    } else {
      $prepended_text = '';
    }
    my $caption_text = '';
    if ($caption) {
      $caption_text = $self->convert_tree_new_formatting_context(
        {'contents' => $caption->{'args'}->[0]->{'contents'}}, 
        'float caption');
    }
    return $prepended.$content.$caption_text;
  }

  my $id = $self->command_id($command);
  my $id_str = '';;
  if (defined($id) and $id ne '') {
    $id_str = " id=\"$id\"";
  }

  my $prepended_text;
  my $caption_text = '';
  if ($prepended) {
    # FIXME add a span with a class name for the prependend information
    # if not empty?
    $prepended_text = $self->convert_tree_new_formatting_context(
                               {'cmdname' => 'strong',
                                'args' => [{'type' => 'brace_command_arg',
                                            'contents' => [$prepended]}]},
                               'float number type');
    if ($caption) {
      # register the converted prepended tree to be prepended to
      # the first paragraph in caption formatting
      $self->register_pending_formatted_inline_content($caption_command_name,
                                                       $prepended_text);
      $caption_text = $self->convert_tree_new_formatting_context(
               $caption->{'args'}->[0], 'float caption');
      my $cancelled_prepended
        = $self->cancel_pending_formatted_inline_content($caption_command_name);
      $prepended_text = '' if (not defined($cancelled_prepended));
    }
    if ($prepended_text ne '') {
      $prepended_text = '<p>'.$prepended_text.'</p>';
    }
  } else {
    $caption_text = $self->convert_tree_new_formatting_context(
      $caption->{'args'}->[0], 'float caption');
  }
  
  my $float_type_number_caption = '';
  if ($caption_text ne '') {
    $float_type_number_caption
      = $self->html_attribute_class('div',$caption_command_name). '>'
                       .$caption_text.'</div>';
  } elsif (defined($prepended) and $prepended_text ne '') {
    $float_type_number_caption
      = $self->html_attribute_class('div','type-number-float'). '>'
                       . $prepended_text .'</div>';
  }
  return $self->html_attribute_class('div',$cmdname). "${id_str}>\n".$content.
     $float_type_number_caption . '</div>';
}
$default_commands_conversion{'float'} = \&_convert_float_command;

sub _convert_quotation_command($$$$$)
{
  my $self = shift;
  my $cmdname = shift;
  my $command = shift;
  my $args = shift;
  my $content = shift;

  $self->cancel_pending_formatted_inline_content($cmdname);

  my $attribution = '';
  if ($command->{'extra'} and $command->{'extra'}->{'authors'}) {
    # FIXME there is no easy way to mark with a class the @author
    # @-command.  Add a span or a div (@center is in a div)?
    foreach my $author (@{$command->{'extra'}->{'authors'}}) {
      my $centered_author = $self->gdt("\@center --- \@emph{{author}}\n",
         {'author' => $author->{'args'}->[0]->{'contents'}});
      $centered_author->{'parent'} = $command;
      $attribution .= $self->convert_tree($centered_author, 'convert quotation author');
    }
  }

  if (!$self->in_string()) {
    return $self->html_attribute_class('blockquote', $cmdname)
                          .">\n" . $content . "</blockquote>\n" . $attribution;
  } else {
    return $content.$attribution;
  }
}
$default_commands_conversion{'quotation'} = \&_convert_quotation_command;

sub _convert_cartouche_command($$$$)
{
  my $self = shift;
  my $cmdname = shift;
  my $command = shift;
  my $content = shift;

  if ($content =~ /\S/ and !$self->in_string()) {
    return $self->html_attribute_class('table', $cmdname)
       ." border=\"1\"><tr><td>\n". $content ."</td></tr></table>\n";
  }
  return $content;
}

$default_commands_conversion{'cartouche'} = \&_convert_cartouche_command;

sub _convert_itemize_command($$$$)
{
  my $self = shift;
  my $cmdname = shift;
  my $command = shift;
  my $content = shift;

  if ($self->in_string()) {
    return $content;
  }
  my $command_as_argument_name;
  my $mark_class_name;
  if (defined($command->{'extra'})
      and defined($command->{'extra'}->{'command_as_argument'})) {
    my $command_as_argument = $command->{'extra'}->{'command_as_argument'};
    if ($command_as_argument->{'cmdname'} eq 'click'
        and $command_as_argument->{'extra'}->{'clickstyle'}) {
      $command_as_argument_name = $command_as_argument->{'extra'}->{'clickstyle'};
    } else {
      $command_as_argument_name = $command_as_argument->{'cmdname'};
    }

    if ($command_as_argument_name eq 'w') {
      $mark_class_name = 'none';
    } else {
      $mark_class_name = $command_as_argument_name;
    }
  }

  # FIXME API?
  if (defined($mark_class_name)
      and defined($self->{'css_map'}->{'ul.mark-'.$mark_class_name})) {
    return $self->html_attribute_class('ul', $cmdname, ['mark-'.$mark_class_name])
        .">\n" . $content. "</ul>\n";
  } elsif ($self->get_conf('NO_CSS')) {
    return $self->html_attribute_class('ul', $cmdname).">\n" . $content. "</ul>\n";
  } else {
    my $css_string
      = $self->html_convert_css_string_for_list_bullet($command->{'args'}->[0],
                                                      'itemize arg');
    if ($css_string ne '') {
      return $self->html_attribute_class('ul', $cmdname)
        ." style=\"list-style-type: '".$self->protect_text($css_string)."'\">\n"
        . $content. "</ul>\n";
    } else {
      return $self->html_attribute_class('ul', $cmdname)
        .">\n" . $content. "</ul>\n";
    }
  }
}

$default_commands_conversion{'itemize'} = \&_convert_itemize_command;

sub _convert_enumerate_command($$$$)
{
  my $self = shift;
  my $cmdname = shift;
  my $command = shift;
  my $content = shift;

  if ($self->in_string()) {
    return $content;
  }
  if ($content eq '') {
    return '';
  }
  my $type_attribute = '';
  my $start_attribute = '';
  my $specification = $command->{'extra'}->{'enumerate_specification'};
  if (defined $specification) {
    my ($start, $type);
    if ($specification =~ /^\d*$/ and $specification ne '1') {
      $start = $specification;
    } elsif ($specification =~ /^[A-Z]$/) {
      $start = 1 + ord($specification) - ord('A');
      $type = 'A';
    } elsif ($specification =~ /^[a-z]$/) {
      $start = 1 + ord($specification) - ord('a');
      $type = 'a';
    }
    $type_attribute = " type=\"$type\"" if (defined($type));
    $start_attribute = " start=\"$start\"" if (defined($start));
  }
  return $self->html_attribute_class('ol', $cmdname).$type_attribute
       .$start_attribute.">\n" . $content . "</ol>\n";
}

$default_commands_conversion{'enumerate'} = \&_convert_enumerate_command;

sub _convert_multitable_command($$$$)
{
  my $self = shift;
  my $cmdname = shift;
  my $command = shift;
  my $content = shift;

  if ($self->in_string()) {
    return $content;
  }
  if ($content =~ /\S/) {
    return $self->html_attribute_class('table', $cmdname).">\n"
                                     . $content . "</table>\n";
  } else {
    return '';
  }
}

$default_commands_conversion{'multitable'} = \&_convert_multitable_command;

sub _convert_xtable_command($$$$)
{
  my $self = shift;
  my $cmdname = shift;
  my $command = shift;
  my $content = shift;

  if ($self->in_string()) {
    return $content;
  }
  if ($content ne '') {
    return $self->html_attribute_class('dl', $cmdname).">\n"
      . $content . "</dl>\n";
  } else {
    return '';
  }
}
$default_commands_conversion{'table'} = \&_convert_xtable_command;
$default_commands_conversion{'ftable'} = \&_convert_xtable_command;
$default_commands_conversion{'vtable'} = \&_convert_xtable_command;

sub _convert_item_command($$$$)
{
  my $self = shift;
  my $cmdname = shift;
  my $command = shift;
  my $content = shift;

  if ($self->in_string()) {
    return $content;
  }
  if ($command->{'parent'}->{'cmdname'} 
      and $command->{'parent'}->{'cmdname'} eq 'itemize') {
    if ($content =~ /\S/) {
      return '<li>' . $content . '</li>';
    } else {
      return '';
    }
  } elsif ($command->{'parent'}->{'cmdname'}
      and $command->{'parent'}->{'cmdname'} eq 'enumerate') {
    if ($content =~ /\S/) {
      return '<li>' . ' ' . $content . '</li>';
    } else {
      return '';
    }
  } elsif ($command->{'parent'}->{'type'}
           and $command->{'parent'}->{'type'} eq 'table_term') {
    my $args = $content;
    if ($args->[0]) {
      my $table_item_tree = $self->table_item_content_tree($command,
                                                [$args->[0]->{'tree'}]);
      my $result = $self->convert_tree($table_item_tree, 'convert table_item_tree');
      foreach my $command_name (reverse($self->commands_stack())) {
        if ($preformatted_code_commands{$command_name}) {
          $result = '<tt>' .$result. '</tt>';
          last;
        }
      }
      my $index_id = $self->command_id($command);
      my $anchor;
      my $anchor_span_open = '';
      my $anchor_span_close = '';
      if (defined($index_id)) {
        $anchor = $self->_get_copiable_anchor($index_id);
        $index_id = " id='$index_id'";
        if ($anchor ne '') {
          $anchor_span_open = '<span>';
          $anchor_span_close = '</span>';
        }
      } else {
        $anchor = '';
        $index_id = '';
      }
    
      return "<dt${index_id}>$anchor_span_open$result$anchor$anchor_span_close</dt>\n";
    } else {
      return '';
    }
  } elsif ($command->{'parent'}->{'type'} 
           and $command->{'parent'}->{'type'} eq 'row') {
    return $self->_convert_tab_command ($cmdname, $command, $content);
  }
  return '';
}
$default_commands_conversion{'item'} = \&_convert_item_command;
$default_commands_conversion{'headitem'} = \&_convert_item_command;
$default_commands_conversion{'itemx'} = \&_convert_item_command;

sub _convert_tab_command ($$$$)
{
  my $self = shift;
  my $cmdname = shift;
  my $command = shift;
  my $content = shift;
  
  my $cell_nr = $command->{'extra'}->{'cell_number'};
  my $row = $command->{'parent'};
  my $row_cmdname = $row->{'contents'}->[0]->{'cmdname'};
  my $multitable = $row->{'parent'}->{'parent'};

  my $fractions = '';
  my $cf = $multitable->{'extra'}->{'columnfractions'};
  if ($cf) {
    if (exists($cf->{'extra'}->{'misc_args'}->[$cell_nr-1])) {
      my $fraction = sprintf('%d',
                             100*$cf->{'extra'}->{'misc_args'}->[$cell_nr-1]);
      $fractions = " width=\"$fraction%\"";
    }
  }

  $content =~ s/^\s*//;
  $content =~ s/\s*$//;

  if ($self->in_string()) {
    return $content;
  }
  if ($row_cmdname eq 'headitem') {
    return "<th${fractions}>" . $content . '</th>';
  } else {
    return "<td${fractions}>" . $content . '</td>';
  }
}
$default_commands_conversion{'tab'} = \&_convert_tab_command;

sub _convert_xref_commands($$$$)
{
  my $self = shift;
  my $cmdname = shift;
  my $root = shift;
  my $args = shift;

  my $tree;
  my $name;
  if ($cmdname ne 'inforef'
      and defined($args->[2]->{'normal'}) and $args->[2]->{'normal'} ne '') {
    $name = $args->[2]->{'normal'};
  } elsif (defined($args->[1]->{'normal'}) and $args->[1]->{'normal'} ne '') {
    $name = $args->[1]->{'normal'}
  }

  if ($cmdname eq 'inforef') {
    $args->[3] = $args->[2];
    $args->[2] = undef;
  }

  my $file_arg_tree;
  my $file = '';
  if (defined($args->[3]->{'monospacetext'}) 
              and $args->[3]->{'monospacetext'} ne '') {
    $file_arg_tree = $args->[3]->{'tree'};
    $file = $args->[3]->{'monospacetext'};
  }

  my $book = '';
  $book = $args->[4]->{'normal'} if (defined($args->[4]->{'normal'}));

  # internal reference
  if ($cmdname ne 'inforef' and $book eq '' and $file eq ''
      and $root->{'extra'}->{'node_argument'}
      and defined($root->{'extra'}->{'node_argument'}->{'normalized'})
      and !$root->{'extra'}->{'node_argument'}->{'manual_content'}
      and $self->{'labels'}
      and $self->{'labels'}->{$root->{'extra'}->{'node_argument'}->{'normalized'}}) {
    my $node 
     = $self->label_command($root->{'extra'}->{'node_argument'}->{'normalized'}); 
    # This is the node if USE_NODES, otherwise this may be the sectioning 
    # command (if the sectioning command is really associated to the node)
    my $command = $self->command_root_element_command($node);
    $command = $node if (!$node->{'extra'}->{'associated_section'}
                         or $node->{'extra'}->{'associated_section'} ne $command);

    my $href = $self->command_href($command, undef, $root);

    if (!defined($name)) {
      if ($self->get_conf('xrefautomaticsectiontitle') eq 'on'
         and $node->{'extra'}->{'associated_section'}) {
        $command = $node->{'extra'}->{'associated_section'};
        $name = $self->command_text($command, 'text_nonumber');
      } elsif ($node->{'cmdname'} eq 'float') {
        if (!$self->get_conf('XREF_USE_FLOAT_LABEL')) {
          $name = $self->command_text($command);
        }
        if (!defined($name) or $name eq '') {
          if (defined($args->[0]->{'monospace'})) {
            $name = $args->[0]->{'monospace'};
          } else {
            $name = '';
          }
        }
      } elsif (!$self->get_conf('XREF_USE_NODE_NAME_ARG')
               and (defined($self->get_conf('XREF_USE_NODE_NAME_ARG'))
                    or !$self->in_preformatted())) {
        $name = $self->command_text($command, 'text_nonumber');
        #die "$command $command->{'normalized'}" if (!defined($name));
      } elsif (defined($args->[0]->{'monospace'})) {
        $name = $args->[0]->{'monospace'};
      } else {
        $name = '';
      }
    }
    my $reference = $name;
    $reference = $self->html_attribute_class('a', $cmdname)
                      ." href=\"$href\">$name</a>" if ($href ne ''
                                                       and !$self->in_string());

    # maybe use {'extra'}->{'node_argument'}?
    my $is_section = ($command->{'cmdname'} ne 'node' 
                      and $command->{'cmdname'} ne 'anchor'
                      and $command->{'cmdname'} ne 'float');
    if ($cmdname eq 'pxref') {
      $tree = $self->gdt('see {reference_name}', 
        { 'reference_name' => {'type' => '_converted', 'text' => $reference} });
    } elsif ($cmdname eq 'xref' or $cmdname eq 'inforef') {
      $tree = $self->gdt('See {reference_name}',
        { 'reference_name' => {'type' => '_converted', 'text' => $reference} });
    } elsif ($cmdname eq 'ref') {
      $tree = $self->gdt('{reference_name}',
         { 'reference_name' => {'type' => '_converted', 'text' => $reference} });
    }
  } else {
    # external reference
    my $node_entry = {};
    $node_entry->{'node_content'} = $root->{'extra'}->{'node_argument'}->{'node_content'}
      if ($root->{'extra'}->{'node_argument'}
          and $root->{'extra'}->{'node_argument'}->{'node_content'});
    $node_entry->{'normalized'} = $root->{'extra'}->{'node_argument'}->{'normalized'} 
      if ($root->{'extra'}->{'node_argument'} 
          and exists($root->{'extra'}->{'node_argument'}->{'normalized'}));

    # file argument takes precedence over the file in the node (file)node entry
    if (defined($file_arg_tree) and $file ne '') {
      $node_entry->{'manual_content'} = $file_arg_tree->{'contents'};
    } elsif ($root->{'extra'}->{'node_argument'}
             and $root->{'extra'}->{'node_argument'}->{'manual_content'}) {
      $node_entry->{'manual_content'}
        = $root->{'extra'}->{'node_argument'}->{'manual_content'};
      my $file_with_node_tree = {'type' => '_code', 
                                  'contents' => [@{$node_entry->{'manual_content'}}]};
      $file = $self->convert_tree($file_with_node_tree, 'node file in ref');
    }
    my $href = $self->command_href($node_entry, undef, $root);

    if ($book eq '') {
      if (!defined($name)) {
        my $node_name = $self->command_text($node_entry);
        $name = $node_name;
      } elsif ($file ne '') {
        $name = "($file)$name";
      }
    } elsif (!defined($name) and $node_entry->{'node_content'}) {
      my $node_no_file_tree = {'type' => '_code',
                               'contents' => [@{$node_entry->{'node_content'}}]};
      my $node_name = $self->convert_tree($node_no_file_tree, 'node in ref');
      if (defined($node_name) and ($self->get_conf('KEEP_TOP_EXTERNAL_REF')
                                   or $node_name ne 'Top')) {
        $name = $node_name;
      }
    }

    # not exactly sure when it happens.  Something like @ref{(file),,,Manual}?
    $name = $args->[0]->{'monospace'} 
       if (!defined($name)
           # FIXME could it really be Top?
           and ($self->get_conf('KEEP_TOP_EXTERNAL_REF')
                or $args->[0]->{'monospace'} ne 'Top'));
      
    $name = '' if (!defined($name));
    my $reference = $name;
    my $book_reference = '';
    if (!$self->in_string() and $href ne '') {
      # attribute to distiguish links to Texinfo manuals from other links
      # and to provide manual name of target
      my $manual_name_attribute = '';
      if ($file) {
        if (not $self->get_conf('NO_CUSTOM_HTML_ATTRIBUTE')) {
          $manual_name_attribute = "data-manual=\"".$self->protect_text($file)."\" ";
        }
      }
      if ($name ne '') {
        $reference = "<a ${manual_name_attribute}href=\"$href\">$name</a>";
      } elsif ($book ne '') {
        $book_reference = "<a ${manual_name_attribute}href=\"$href\">$book</a>";
      }
    }
    if ($cmdname eq 'pxref') {
      if (($book ne '') and ($href ne '') and ($reference ne '')) {
        $tree = $self->gdt('see {reference} in @cite{{book}}', 
            { 'reference' => {'type' => '_converted', 'text' => $reference}, 
              'book' => {'type' => '_converted', 'text' => $book }});
      } elsif ($book_reference ne '') {
        $tree = $self->gdt('see @cite{{book_reference}}', 
            { 'book_reference' => {'type' => '_converted', 
                                   'text' => $book_reference }});
      } elsif (($book ne '') and ($reference ne '')) {
        $tree = $self->gdt('see `{section}\' in @cite{{book}}', 
            { 'section' => {'type' => '_converted', 'text' => $reference}, 
              'book' => {'type' => '_converted', 'text' => $book }});
      } elsif ($book ne '') { # should seldom or even never happen
        $tree = $self->gdt('see @cite{{book}}', 
              {'book' => {'type' => '_converted', 'text' => $book }});
      } elsif ($href ne '') {
        $tree = $self->gdt('see {reference}', 
             { 'reference' => {'type' => '_converted', 'text' => $reference} });
      } elsif ($reference ne '') {
        $tree = $self->gdt('see `{section}\'', {
              'section' => {'type' => '_converted', 'text' => $reference} });
      }
    } elsif ($cmdname eq 'xref' or $cmdname eq 'inforef') {
      if (($book ne '') and ($href ne '') and ($reference ne '')) {
        $tree = $self->gdt('See {reference} in @cite{{book}}', 
            { 'reference' => {'type' => '_converted', 'text' => $reference}, 
              'book' => {'type' => '_converted', 'text' => $book }});
      } elsif ($book_reference ne '') {
        $tree = $self->gdt('See @cite{{book_reference}}', 
            { 'book_reference' => {'type' => '_converted', 
                                   'text' => $book_reference }});
      } elsif (($book ne '') and ($reference ne '')) {
        $tree = $self->gdt('See `{section}\' in @cite{{book}}', 
            { 'section' => {'type' => '_converted', 'text' => $reference}, 
              'book' => {'type' => '_converted', 'text' => $book }});
      } elsif ($book ne '') { # should seldom or even never happen
        $tree = $self->gdt('See @cite{{book}}', 
              {'book' => {'type' => '_converted', 'text' => $book }});
      } elsif ($href ne '') {
        $tree = $self->gdt('See {reference}', 
             { 'reference' => {'type' => '_converted', 'text' => $reference} });
      } elsif ($reference ne '') {
        $tree = $self->gdt('See `{section}\'', {
              'section' => {'type' => '_converted', 'text' => $reference} });
      }
    } else {
      if (($book ne '') and ($href ne '') and ($reference ne '')) {
        $tree = $self->gdt('{reference} in @cite{{book}}', 
            { 'reference' => {'type' => '_converted', 'text' => $reference}, 
              'book' => {'type' => '_converted', 'text' => $book }});
      } elsif ($book_reference ne '') {
        $tree = $self->gdt('@cite{{book_reference}}', 
            { 'book_reference' => {'type' => '_converted', 
                                   'text' => $book_reference }});
      } elsif (($book ne '') and ($reference ne '')) {
        $tree = $self->gdt('`{section}\' in @cite{{book}}', 
            { 'section' => {'type' => '_converted', 'text' => $reference}, 
              'book' => {'type' => '_converted', 'text' => $book }});
      } elsif ($book ne '') { # should seldom or even never happen
        $tree = $self->gdt('@cite{{book}}', 
              {'book' => {'type' => '_converted', 'text' => $book }});
      } elsif ($href ne '') {
        $tree = $self->gdt('{reference}', 
             { 'reference' => {'type' => '_converted', 'text' => $reference} });
      } elsif ($reference ne '') {
        $tree = $self->gdt('`{section}\'', {
              'section' => {'type' => '_converted', 'text' => $reference} });
      }
    } 
    if (!defined($tree)) {
      # May happen if there is no argument
      #die "external: $cmdname, ($args), '$name' '$file' '$book' '$href' '$reference'. tree undef";
      return '';
    }
  }
  return $self->convert_tree($tree, "convert xref $cmdname");
}
foreach my $command(keys(%ref_commands)) {
  $default_commands_conversion{$command} = \&_convert_xref_commands;
}

# note that $cmdname is always cindex, in particular to make
# customization possible, the actual @-command could be any index entry
# @-command.
sub _convert_index_command($$$$)
{
  my $self = shift;
  my $cmdname = shift;
  my $command = shift;
  my $args = shift;

  my $index_id = $self->command_id($command);
  if (defined($index_id) and $index_id ne '' 
      and !@{$self->{'multiple_pass'}} 
      and !$self->in_string()) {
    my $result = &{$self->{'format_separate_anchor'}}($self, $index_id,
                                                      'index-entry-id');
    $result .= "\n" unless ($self->in_preformatted());
    return $result;
  }
  return '';
}
$default_commands_conversion{'cindex'} = \&_convert_index_command;

my %formatted_index_entries;

sub _convert_printindex_command($$$$)
{
  my $self = shift;
  my $cmdname = shift;
  my $command = shift;
  my $args = shift;

  my $index_name;
  if ($command->{'extra'} and $command->{'extra'}->{'misc_args'}
      and defined($command->{'extra'}->{'misc_args'}->[0])) {
    $index_name = $command->{'extra'}->{'misc_args'}->[0];
  } else {
    return '';
  }
  if (!$self->{'index_entries_by_letter'} 
      or !$self->{'index_entries_by_letter'}->{$index_name}
      or !@{$self->{'index_entries_by_letter'}->{$index_name}}) {
    return '';
  }

  #foreach my $letter_entry (@{$self->{'index_entries_by_letter'}->{$index_name}}) {
  #  print STDERR "IIIIIII $letter_entry->{'letter'}\n";
  #  foreach my $index_entry (@{$letter_entry->{'entries'}}) {
  #    print STDERR "   ".join('|', keys(%$index_entry))."||| $index_entry->{'key'}\n";
  #  }
  #}
  return '' if ($self->in_string());

  $self->_new_document_context($cmdname);

  # First do the summary letters linking to the letters done below
  my %letter_id;
  my @non_alpha = ();
  my @alpha = ();
  # collect the links
  my $symbol_idx = 0;
  foreach my $letter_entry (@{$self->{'index_entries_by_letter'}->{$index_name}}) {
    my $letter = $letter_entry->{'letter'};
    my $index_element_id = $self->from_element_direction(
                         $self->{'current_root_element'}, 'This', 'target');
    if (!defined($index_element_id)) {
      $index_element_id = $target_prefix;
    }
    my $is_symbol = $letter !~ /^[[:alpha:]]/;
    my $identifier;
    if ($is_symbol) {
      $symbol_idx++;
      $identifier = $index_element_id . "_${index_name}_symbol-$symbol_idx";
    } else {
      $identifier = $index_element_id . "_${index_name}_letter-${letter}";
    }
    $letter_id{$letter} = $identifier;
    
    my $summary_letter_link = $self->html_attribute_class('a', "summary-letter-$cmdname")
       ." href=\"#$identifier\"><b>".$self->protect_text($letter).'</b></a>';
    if ($is_symbol) {
      push @non_alpha, $summary_letter_link;
    } else {
      push @alpha, $summary_letter_link;
    }
  }
  # Format the summary letters
  my $join = '';
  my $non_alpha_text = '';
  my $alpha_text = '';
  my $non_breaking_space = $self->html_non_breaking_space();
  $join = " $non_breaking_space \n".$self->html_line_break_element()."\n"
     if (@non_alpha and @alpha);
  if (@non_alpha) {
    $non_alpha_text = join("\n $non_breaking_space \n", @non_alpha) . "\n";
  }
  if (@alpha) {
    $alpha_text = join("\n $non_breaking_space \n", @alpha)
                    . "\n $non_breaking_space \n";
  }
  my $result = $self->html_attribute_class('div', $cmdname,
                                           ["$index_name-$cmdname"]).">\n";
  # format the summary
  my $summary_header = $self->html_attribute_class('table',
                 "$index_name-letters-header-$cmdname")."><tr><th valign=\"top\">"
    . $self->convert_tree($self->gdt('Jump to')) .": $non_breaking_space </th><td>" .
    $non_alpha_text . $join . $alpha_text . "</td></tr></table>\n";


  $result .= $summary_header;

  # now format the index entries
  $result .= $self->html_attribute_class('table', "$index_name-entries-$cmdname")
    ." border=\"0\">\n" . "<tr><td></td><th align=\"left\">"
    . $self->convert_tree($self->gdt('Index Entry'))
    . "</th><td>$non_breaking_space</td><th align=\"left\"> "
    .  $self->convert_tree($self->gdt('Section'))
    ."</th></tr>\n" . "<tr><td colspan=\"4\"> ".$self->get_conf('DEFAULT_RULE')
    ."</td></tr>\n";
  foreach my $letter_entry (@{$self->{'index_entries_by_letter'}->{$index_name}}) {
    my $letter = $letter_entry->{'letter'};
    my $entries_text = '';
    my $entry_nr = -1;
    foreach my $index_entry_ref (@{$letter_entry->{'entries'}}) {
      $entry_nr++;
      # to avoid double error messages set ignore_notice if an entry was
      # already formatted once, for example if there are multiple printindex.
      my $already_formatted;
      if (!$formatted_index_entries{$index_entry_ref}) {
        $formatted_index_entries{$index_entry_ref} = 1;
      } else {
        $already_formatted = 1;
        $self->{'ignore_notice'}++;
      }

      my $entry;
      if ($index_entry_ref->{'in_code'}) {
        $entry = $self->convert_tree({'type' => '_code',
                                      'contents' => $index_entry_ref->{'content'}},
                                      "index $index_name l $letter index entry $entry_nr");
      } else {
        $entry = $self->convert_tree({'contents' => $index_entry_ref->{'content'}},
                                      "index $index_name l $letter index entry $entry_nr");
      }
      # cannot introduce a _code type element, since convert_index_subentries
      # expects an index command directly as argument.
      if ($index_entry_ref->{'in_code'}) {
        push @{$self->{'document_context'}->[-1]->{'monospace'}}, 1;
      }
      $entry .= $self->convert_index_subentries($index_entry_ref);
      if ($index_entry_ref->{'in_code'}) {
        pop @{$self->{'document_context'}->[-1]->{'monospace'}};
      }
      if ($already_formatted) {
        $self->{'ignore_notice'}--;
      }

      next if ($entry !~ /\S/);
      $entry = '<code>' .$entry .'</code>' if ($index_entry_ref->{'in_code'});
      my $entry_href = $self->command_href($index_entry_ref->{'command'});
      my $associated_command;
      if ($self->get_conf('NODE_NAME_IN_INDEX')) {
        $associated_command = $index_entry_ref->{'node'};
        if (!defined($associated_command)) {
          $associated_command
            = $self->command_node($index_entry_ref->{'command'});
        }
      }
      if (!$associated_command) {
        $associated_command
          = $self->command_root_element_command($index_entry_ref->{'command'});
        if (!$associated_command) {
          # Use Top if not associated command found
          $associated_command
            = $self->element_command($self->global_element('Top'));
        }
      }
      my ($associated_command_href, $associated_command_text);
      if ($associated_command) {
        $associated_command_href = $self->command_href($associated_command);
        $associated_command_text = $self->command_text($associated_command);
      }
      
      $entries_text .= '<tr><td></td><td valign="top">'
         . "<a href=\"$entry_href\">$entry</a>" .
          $self->get_conf('INDEX_ENTRY_COLON') .
        '</td><td>'.$self->html_non_breaking_space().'</td><td valign="top">';
      $entries_text .= "<a href=\"$associated_command_href\">$associated_command_text</a>"
         if ($associated_command_href);
       $entries_text .= "</td></tr>\n";
    }
    # a letter and associated indice entries
    $result .= '<tr>' .
          "<th id=\"$letter_id{$letter}\">".$self->protect_text($letter)
          .  "</th><td></td><td></td></tr>\n" . $entries_text .
           "<tr><td colspan=\"4\"> ".$self->get_conf('DEFAULT_RULE')."</td></tr>\n";

  }
  $result .= "</table>\n";
  
  $self->_pop_document_context();
  
  my $summary_footer = $self->html_attribute_class('table',
                 "$index_name-letters-footer-$cmdname")."><tr><th valign=\"top\">"
    . $self->convert_tree($self->gdt('Jump to')) .": $non_breaking_space </th><td>" .
    $non_alpha_text . $join . $alpha_text . "</td></tr></table>\n";
  return $result .$summary_footer . "</div>\n";
}
$default_commands_conversion{'printindex'} = \&_convert_printindex_command;

sub _contents_inline_element($$$)
{
  my $self = shift;
  my $cmdname = shift;
  my $command = shift;

  print STDERR "CONTENTS_INLINE $cmdname\n" if ($self->get_conf('DEBUG'));
  my $content = &{$self->{'format_contents'}}($self, $cmdname, $command);
  if ($content) {
    my $special_element_type = $contents_command_element_type{$cmdname};
    my $special_element_direction
      = $self->get_conf('SPECIAL_ELEMENTS_DIRECTIONS')->{$special_element_type};
    my $special_element
      = $self->special_element($special_element_direction);
    my $class = $self->get_conf('SPECIAL_ELEMENTS_CLASS')->{$special_element_type};
    # FIXME is element- the best prefix?
    my $result = $self->html_attribute_class('div', "element-${class}");
    my $heading;
    if ($special_element) {
      my $id = $self->command_id($special_element);
      if ($id ne '') {
        $result .= " id=\"$id\"";
      }
      $heading = $self->command_text($special_element);
    } else {
      # happens when called as convert() and not output()
      #cluck "$cmdname special element not defined";
      $heading 
        = $self->convert_tree($self->get_conf('SPECIAL_ELEMENTS_HEADING')->{$special_element_type},
                              "convert $cmdname special heading");
    }
    $result .= ">\n";
    $result .= &{$self->{'format_heading_text'}}($self, $cmdname, $class.'-heading',
                       $heading, $self->get_conf('CHAPTER_HEADER_LEVEL'))."\n";
    $result .= $content . "</div>\n";
    return $result;
  }
  return '';
}

sub _convert_informative_command($$$$)
{
  my $self = shift;
  my $cmdname = shift;
  my $command = shift;

  return '' if ($self->in_string());

  $self->set_informative_command_value($command);

  if ($cmdname eq 'documentlanguage') {
    $self->_translate_names();
  }
  return '';
}

foreach my $informative_command (@informative_global_commands) {
  $default_commands_conversion{$informative_command}
    = \&_convert_informative_command;
}

sub _convert_contents_command
{
  my $self = shift;
  my $cmdname = shift;
  my $command = shift;

  return '' if ($self->in_string());
  $cmdname = 'shortcontents' if ($cmdname eq 'summarycontents');

  $self->set_informative_command_value($command);

  if ($self->get_conf('CONTENTS_OUTPUT_LOCATION') eq 'inline'
      and ($cmdname eq 'contents' or $cmdname eq 'shortcontents')
      and $self->get_conf($cmdname)
      and $self->{'structuring'} and $self->{'structuring'}->{'sectioning_root'}
      and scalar(@{$self->{'structuring'}->{'sections_list'}}) > 1) {
    return $self->_contents_inline_element($cmdname, $command);
  }
  return '';
}

foreach my $contents_comand (@contents_commands) {
  $default_commands_conversion{$contents_comand} = \&_convert_contents_command;
}

# associate same formatting function for @small* command
# as for the associated @-command
foreach my $small_command (keys(%small_alias)) {
  $default_commands_conversion{$small_command}
    = $default_commands_conversion{$small_alias{$small_command}};
}

sub _open_quotation_command($$$)
{
  my $self = shift;
  my $cmdname = shift;
  my $command = shift;

  my $formatted_quotation_arg_to_prepend;
  if ($command->{'args'} and $command->{'args'}->[0]
      and $command->{'args'}->[0]->{'contents'}
      and @{$command->{'args'}->[0]->{'contents'}}) {
    $formatted_quotation_arg_to_prepend
     = $self->convert_tree($self->gdt('@b{{quotation_arg}:} ',
             {'quotation_arg' => $command->{'args'}->[0]->{'contents'}}),
                           "open $cmdname prepended arg");
  }
  $self->register_pending_formatted_inline_content($cmdname,
                                 $formatted_quotation_arg_to_prepend);
  return '';
}

$default_commands_open{'quotation'} = \&_open_quotation_command;

# associate same opening function for @small* command
# as for the associated @-command
foreach my $small_command (keys(%small_alias)) {
  if (exists($default_commands_open{$small_alias{$small_command}})) {
    $default_commands_open{$small_command}
      = $default_commands_open{$small_alias{$small_command}};
  }
}

# Keys are tree element types, values are function references to convert
# elements of that type.  Can be overridden accessing
# Texinfo::Config::GNUT_get_types_conversion, setup by
# Texinfo::Config::texinfo_register_type_formatting()
my %default_types_conversion;

sub default_types_conversion($$)
{
  my $self = shift;
  my $type = shift;
  return $default_types_conversion{$type};
}

my %default_types_open;

sub default_types_open($$)
{
  my $self = shift;
  my $type = shift;
  return $default_types_open{$type};
}


# Ignored commands
foreach my $type ('empty_line_after_command', 'preamble_before_beginning',
            'preamble_before_setfilename',
            'empty_spaces_after_command', 'spaces_at_end',
            'empty_spaces_before_argument', 'empty_spaces_before_paragraph',
            'empty_spaces_after_close_brace') {
  $default_types_conversion{$type} = undef;
}

sub _convert_paragraph_type($$$$)
{
  my $self = shift;
  my $type = shift;
  my $element = shift;
  my $content = shift;

  $content = $self->get_associated_formatted_inline_content($element).$content;

  if ($self->paragraph_number() == 1) {
    my $in_format = $self->top_format();
    if ($in_format) {
      # no first paragraph in those environment to avoid extra spacing
      if ($in_format eq 'itemize' 
          or $in_format eq 'enumerate'
          or $in_format eq 'multitable') {
        return $content; 
      }
    }
  }
  return $content if ($self->in_string());

  if ($content =~ /\S/) {
    my $align = $self->in_align();
    if ($align and $align_commands{$align}) {
      return $self->html_attribute_class('p', $align.'-paragraph').">"
                             .$content."</p>";
    } else {
      return "<p>".$content."</p>";
    }
  } else {
    return '';
  }
}

$default_types_conversion{'paragraph'} = \&_convert_paragraph_type;


sub _open_inline_container_type($$$)
{
  my $self = shift;
  my $type = shift;
  my $element = shift;

  my $pending_formatted = $self->get_pending_formatted_inline_content();

  if (defined($pending_formatted)) {
    $self->associate_pending_formatted_inline_content($element, $pending_formatted);
  }
  return '';
}

$default_types_open{'paragraph'} = \&_open_inline_container_type;
$default_types_open{'preformatted'} = \&_open_inline_container_type;


sub _preformatted_class()
{
  my $self = shift;
  my $pre_class;
  my @pre_classes = $self->preformatted_classes_stack();
  foreach my $class (@pre_classes) {
    # FIXME maybe add   or $pre_class eq 'menu'  to override
    # 'menu' with 'menu-comment'?
    $pre_class = $class unless ($pre_class 
                           and $preformatted_code_commands{$pre_class}
                           and !($preformatted_code_commands{$class}
                                 or $class eq 'menu'));
  }
  return $pre_class.'-preformatted';
}

sub _convert_preformatted_type($$$$)
{
  my $self = shift;
  my $type = shift;
  my $element = shift;
  my $content = shift;

  if (!defined($content)) {
    cluck "content undef in _convert_preformatted_type " 
       .Texinfo::Common::debug_print_element($element);
  }

  $content = $self->get_associated_formatted_inline_content($element).$content;

  return '' if ($content eq '');

  my $pre_class = $self->_preformatted_class();

  if ($self->top_format() eq 'multitable') {
    $content =~ s/^\s*//;
    $content =~ s/\s*$//;
  }

  # menu_entry_description is always in a preformatted container
  # in the tree, as the whole menu is meant to be an
  # environment where spaces and newlines are preserved.
  if ($element->{'parent'}->{'type'}
      and $element->{'parent'}->{'type'} eq 'menu_entry_description') {
    if (!$self->_in_preformatted_in_menu()) {
      # If not in preformatted block command (nor in SIMPLE_MENU),
      # we don't preserve spaces and newlines in menu_entry_description,
      # instead the whole menu_entry is in a table, so no <pre> in that situation
      return $content;
    } else {
      # if directly in description, we want to avoid the linebreak that
      # comes with pre being a block level element, so set a special class
      $pre_class = 'menu-entry-description-preformatted';
    }
  }

  if ($self->in_string()) {
    return $content;
  }
  $content =~ s/^\n/\n\n/; # a newline immediately after a <pre> is ignored.
  my $result = $self->html_attribute_class('pre', $pre_class).">".$content."</pre>";

  # this may happen with lines without textual content
  # between a def* and def*x.
  if ($element->{'parent'}->{'cmdname'}
      and $element->{'parent'}->{'cmdname'} =~ /^def/) {
    $result = '<dd>'.$result.'</dd>';
  }
  return $result;
}

$default_types_conversion{'preformatted'} = \&_convert_preformatted_type;

sub _convert_bracketed_type($$$$) {
  my $self = shift;
  my $type = shift;
  my $command = shift;
  my $content = shift;
#print STDERR "$self $type $command $content\n";

  return '{'.$content.'}';
}

$default_types_conversion{'bracketed'} = \&_convert_bracketed_type;

sub _convert_definfoenclose_type($$$$) {
  my $self = shift;
  my $type = shift;
  my $command = shift;
  my $content = shift;

  # FIXME add a span to mark the original command as a class?
  return $self->protect_text($command->{'extra'}->{'begin'}) . $content
         .$self->protect_text($command->{'extra'}->{'end'});
}

$default_types_conversion{'definfoenclose_command'} 
  = \&_convert_definfoenclose_type;

sub _convert_text($$$)
{
  my $self = shift;
  my $type = shift;
  my $command = shift;
  my $text = shift;

  if ($self->in_verbatim()) {
    return $self->protect_text($text);
  }
  return $text if ($self->in_raw());
  $text = uc($text) if ($self->in_upper_case());
  $text = $self->protect_text($text);
  if ($self->get_conf('ENABLE_ENCODING')
      and $self->get_conf('OUTPUT_ENCODING_NAME')
      and $self->get_conf('OUTPUT_ENCODING_NAME') eq 'utf-8') {
    $text = Texinfo::Convert::Unicode::unicode_text($text,
                                        ($self->in_code() or $self->in_math()));
  } elsif (!$self->in_code() and !$self->in_math()) { 
    if ($self->get_conf('USE_NUMERIC_ENTITY')) {
      $text = $self->xml_format_text_with_numeric_entities($text);
    } elsif ($self->get_conf('USE_ISO')) {
      $text =~ s/---/\&mdash\;/g;
      $text =~ s/--/\&ndash\;/g;
      $text =~ s/``/\&ldquo\;/g;
      $text =~ s/''/\&rdquo\;/g;
      $text =~ s/'/\&rsquo\;/g;
      $text =~ s/`/\&lsquo\;/g;
    } else {
      $text =~ s/``/&quot;/g;
      $text =~ s/''/&quot;/g;
      $text =~ s/---/\x{1F}/g;
      $text =~ s/--/-/g;
      $text =~ s/\x{1F}/--/g;
    }
  }
  $text = $self->_protect_space($text);
  return $text;
}

$default_types_conversion{'text'} = \&_convert_text;

sub _css_string_convert_text($$$)
{
  my $self = shift;
  my $type = shift;
  my $command = shift;
  my $text = shift;

  $text = uc($text) if ($self->in_upper_case());

  # need to hide \ otherwise it is protected in protect_text
  if (!$self->in_code() and !$self->in_math()) {
    $text =~ s/---/\x{1F}2014 /g;
    $text =~ s/--/\x{1F}2013 /g;
    $text =~ s/``/\x{1F}201C /g;
    $text =~ s/''/\x{1F}201D /g;
    $text =~ s/'/\x{1F}2019 /g;
    $text =~ s/`/\x{1F}2018 /g;
  }

  $text = $self->protect_text($text);
  $text =~ s/\x{1F}/\\/g;

  return $text;
}
$default_css_string_types_conversion{'text'} = \&_css_string_convert_text;

sub _simplify_text_for_comparison($)
{
  my $text = shift;
  $text =~ s/[^\w]//g;
  return $text;
}

sub _convert_row_type($$$$) {
  my $self = shift;
  my $type = shift;
  my $command = shift;
  my $content = shift;

  return $content if ($self->in_string());
  if ($content =~ /\S/) {
    my $result = '<tr>' . $content . '</tr>';
    my $row_cmdname = $command->{'contents'}->[0]->{'cmdname'};
    if ($row_cmdname ne 'headitem') {
      # if headitem, end of line added in _convert_multitable_head_type
      $result .= "\n";
    }
    return $result;
  } else {
    return '';
  }
}
$default_types_conversion{'row'} = \&_convert_row_type;

sub _convert_multitable_head_type($$$$) {
  my $self = shift;
  my $type = shift;
  my $command = shift;
  my $content = shift;

  return $content if ($self->in_string());
  if ($content =~ /\S/) {
    return '<thead>' . $content . '</thead>' . "\n";
  } else {
    return '';
  }
}

$default_types_conversion{'multitable_head'} = \&_convert_multitable_head_type;

sub _convert_multitable_body_type($$$$) {
  my $self = shift;
  my $type = shift;
  my $command = shift;
  my $content = shift;

  return $content if ($self->in_string());
  if ($content =~ /\S/) {
    return '<tbody>' . $content . '</tbody>' . "\n";
  } else {
    return '';
  }
}

$default_types_conversion{'multitable_body'} = \&_convert_multitable_body_type;

sub _convert_menu_entry_type($$$)
{
  my $self = shift;
  my $type = shift;
  my $command = shift;
  
  my $href;
  my $rel = '';
  my $section;
  my $node_entry = $command->{'extra'}->{'menu_entry_node'};
  # external node
  my $external_node;
  if ($node_entry->{'manual_content'}) {
    $href = $self->command_href($node_entry, undef, $command); 
    $external_node = 1;
  } else {
    my $node = $self->label_command($node_entry->{'normalized'});
    # if !NODE_NAME_IN_MENU, we pick the associated section, except if 
    # the node is the element command
    if ($node->{'extra'}->{'associated_section'} 
      and !$self->get_conf('NODE_NAME_IN_MENU')
      and !($self->command_root_element_command($node) eq $node)) {
      $section = $node->{'extra'}->{'associated_section'};
      $href = $self->command_href($section, undef, $command);
    } else {
      $href = $self->command_href($node, undef, $command);
    }
    if ($node->{'extra'}->{'isindex'}) {
      # Mark the target as an index.  See
      # http://microformats.org/wiki/existing-rel-values#HTML5_link_type_extensions
      $rel = ' rel="index"';
    }
  }

  $html_menu_entry_index++;
  my $accesskey = '';
  $accesskey = " accesskey=\"$html_menu_entry_index\"" 
    if ($self->get_conf('USE_ACCESSKEY') and $html_menu_entry_index < 10);

  my $MENU_SYMBOL = $self->get_conf('MENU_SYMBOL');
  my $MENU_ENTRY_COLON = $self->get_conf('MENU_ENTRY_COLON');

  my $in_string = $self->in_string();
  if ($self->_in_preformatted_in_menu() or $in_string) {
    my $result_name_node = '';
    my $i = 0;
    my @args = @{$command->{'args'}};
    while (@args) {
      last if ($args[0]->{'type'} 
               and $args[0]->{'type'} eq 'menu_entry_description');
      my $arg = shift @args;
      if ($arg->{'type'} and $arg->{'type'} eq 'menu_entry_node') {
        my $name = $self->convert_tree(
           {'type' => '_code', 'contents' => $arg->{'contents'}},
                         "menu_arg menu_entry_node preformatted [$i]");
        if ($href ne '' and !$in_string) {
          $result_name_node .= "<a href=\"$href\"$rel$accesskey>".$name."</a>";
        } else {
          $result_name_node .= $name;
        }
      } elsif ($arg->{'type'} and $arg->{'type'} eq 'menu_entry_leading_text') {
        my $text = $arg->{'text'};
         
        $text =~ s/\*/$MENU_SYMBOL/;
        $result_name_node .= $text;
      } else {
        $result_name_node .= $self->convert_tree($arg, "menu_arg preformatted [$i]");
      }
      $i++;
    }
    my $description = '';
    foreach my $arg (@args) {
      $description .= $self->convert_tree($arg, "menu_arg preformatted [$i]");
      $i++;
    }

    if (!$self->get_conf('SIMPLE_MENU') and not $in_string) {
      my $pre_class = $self->_preformatted_class();
      $result_name_node = $self->html_attribute_class('pre', $pre_class).">"
                                                 .$result_name_node."</pre>";
    }
    return $result_name_node . $description;
  }

  my $name;
  my $name_no_number;
  if ($section) {
    $name = $self->command_text($section);
    $name_no_number = $self->command_text($section, 'text_nonumber');
    if ($href ne '' and $name ne '') {
      $name = "<a href=\"$href\"$rel$accesskey>".$name."</a>";
    }
  }
  if (!defined($name) or $name eq '') {
    if ($command->{'extra'}->{'menu_entry_name'}) {
      $name = $self->convert_tree($command->{'extra'}->{'menu_entry_name'},
                                  'convert menu_entry_name');
    }
    if (!defined($name) or $name eq '') {
      if ($node_entry->{'manual_content'}) {
        $name = $self->command_text($node_entry);
      } else {
        $name = $self->convert_tree({'type' => '_code',
                          'contents' => $node_entry->{'node_content'}},
                          "menu_arg name");
      }
    }
    $name =~ s/^\s*//;
    $name_no_number = $name;
    if ($href ne '') {
      $name = "<a href=\"$href\"$rel$accesskey>".$name."</a>";
    }
    $name = "$MENU_SYMBOL ".$name;
  }
  my $description = '';
  if ($command->{'extra'}->{'menu_entry_description'}) {
    $description = $self->convert_tree($command->{'extra'}->{'menu_entry_description'},
                                        "menu_arg description");
    if ($self->get_conf('AVOID_MENU_REDUNDANCY')) {
      $description = '' if (_simplify_text_for_comparison($name_no_number) 
                           eq _simplify_text_for_comparison($description));
    }
  }
  my $non_breaking_space = $self->html_non_breaking_space();
  return "<tr><td align=\"left\" valign=\"top\">$name$MENU_ENTRY_COLON</td>"
    ."<td>${non_breaking_space}${non_breaking_space}</td><td align=\"left\" valign=\"top\">$description</td></tr>\n";
}

$default_types_conversion{'menu_entry'} = \&_convert_menu_entry_type;

sub _convert_menu_comment_type($$$$)
{
  my $self = shift;
  my $type = shift;
  my $command = shift;
  my $content = shift;

  if ($self->_in_preformatted_in_menu() or $self->in_string()) {
    return $content;
  } else {
    return "<tr><th colspan=\"3\" align=\"left\" valign=\"top\">".$content
       ."</th></tr>";
  }
}

$default_types_conversion{'menu_comment'} = \&_convert_menu_comment_type;

sub _convert_before_item_type($$$$)
{
  my $self = shift;
  my $type = shift;
  my $command = shift;
  my $content = shift;

  return '' if ($content !~ /\S/);
  return $content if ($self->in_string());
  my $top_format = $self->top_format();
  if ($top_format eq 'itemize' or $top_format eq 'enumerate') {
    return '<li>'. $content .'</li>';
  } elsif ($top_format eq 'table' or $top_format eq 'vtable' 
           or $top_format eq 'ftable') {
    return '<dd>'. $content .'</dd>'."\n";
  } elsif ($top_format eq 'multitable') {
    $content =~ s/^\s*//;
    $content =~ s/\s*$//;

    return '<tr><td>'.$content.'</td></tr>'."\n";
  }
}

$default_types_conversion{'before_item'} = \&_convert_before_item_type;

sub _convert_def_line_type($$$$)
{
  my $self = shift;
  my $type = shift;
  my $command = shift;
  my $content = shift;

  if ($self->in_string()) {
    return $self->protect_text(Texinfo::Convert::Text::convert_to_text(
       $command, Texinfo::Convert::Text::copy_options_for_convert_text($self)));
  }

  my $index_label = '';
  my $index_id = $self->command_id($command);
  if (defined($index_id) and $index_id ne '' and !@{$self->{'multiple_pass'}}) {
    $index_label = " id=\"$index_id\"";
  }
  my $arguments
    = Texinfo::Convert::Utils::definition_arguments_content($command);

  my @additional_classes = ();
  my $command_name;
  if ($Texinfo::Common::def_aliases{$command->{'extra'}->{'def_command'}}) {
    $command_name = $Texinfo::Common::def_aliases{$command->{'extra'}->{'def_command'}};
  } else {
    $command_name = $command->{'extra'}->{'def_command'};
  }
  my $original_command_name;
  if ($Texinfo::Common::def_aliases{$command->{'extra'}->{'original_def_cmdname'}}) {
    my $original_def_cmdname = $command->{'extra'}->{'original_def_cmdname'};
    $original_command_name = $Texinfo::Common::def_aliases{$original_def_cmdname};
    push @additional_classes, "$original_def_cmdname-alias-$original_command_name";
  } else {
    $original_command_name = $command->{'extra'}->{'original_def_cmdname'};
  }
  if ($command_name ne $original_command_name) {
    push @additional_classes, "def-cmd-$command_name";
  }

  if (!$self->get_conf('DEF_TABLE')) {
    my $tree;
    my $name;
    if ($command->{'extra'}->{'def_parsed_hash'}->{'name'}) {
      $name = $command->{'extra'}->{'def_parsed_hash'}->{'name'};
    } else {
      $name = '';
    }
    my $category = $command->{'extra'}->{'def_parsed_hash'}->{'category'};
    my $category_result = '';
    my $category_tree;
    if ($category) {
      $category_tree
        = {'type' => '_code',
           'contents'=>[$self->gdt("{category}: ", {'category' => $category})]
          };
      # NB perhaps the category shouldn't be in_code.
    } else {
      $category = '';
    }
    # no type
    if ($command_name eq 'deffn'
        or $command_name eq 'defvr'
        or $command_name eq 'deftp'
        or (($command_name eq 'deftypefn'
             or $command_name eq 'deftypevr')
            and !$command->{'extra'}->{'def_parsed_hash'}->{'type'})
        or (($command_name eq 'defop'
             or ($command_name eq 'deftypeop'
                 and !$command->{'extra'}->{'def_parsed_hash'}->{'type'})
             or $command_name eq 'defcv'
             or ($command_name eq 'deftypecv'
                 and !$command->{'extra'}->{'def_parsed_hash'}->{'type'}))
            and !$command->{'extra'}->{'def_parsed_hash'}->{'class'})) {
      $category_result = $self->convert_tree($category_tree);
      if ($arguments) {
        $tree = $self->gdt("\@strong{{name}} \@emph{{arguments}}", {
                'name' => $name,
                'arguments' => $arguments});
      } else {
        $tree = $self->gdt("\@strong{{name}}", {'name' => $name});
      }
    # with a type
    } elsif ($command_name eq 'deftypefn'
             or $command_name eq 'deftypevr'
             or (($command_name eq 'deftypeop'
                  or $command_name eq 'deftypecv')
                 and !$command->{'extra'}->{'def_parsed_hash'}->{'class'})) {
      if ($arguments) {
        my $strings = {
                'name' => $name,
                'type' => $command->{'extra'}->{'def_parsed_hash'}->{'type'},
                'arguments' => $arguments};
        # FIXME if in @def* in @example and with @deftypefnnewline on
        # there is no effect of @deftypefnnewline on, as @* in preformatted
        # environment becomes an end of line, but the def* line is not in a preformatted
        # environment.  There should be an explicit <br> in that case.  Probably
        # requires changing the conversion of @* in a @def* line in preformatted,
        # nothing really specific of @deftypefnnewline on.
        if ($self->get_conf('deftypefnnewline') eq 'on') {
          $category_tree
            = {'type' => '_code',
               'contents'
                  => [$self->gdt("{category}:\@* ", {'category' => $category})]
              };
          $tree 
             = $self->gdt("\@emph{{type}}\@* \@strong{{name}} \@emph{{arguments}}", 
                          $strings);
        } else {
          $tree 
             = $self->gdt("\@emph{{type}} \@strong{{name}} \@emph{{arguments}}", 
                          $strings);
        }
      } else {
        my $strings = {
                'type' => $command->{'extra'}->{'def_parsed_hash'}->{'type'},
                'name' => $name};
        if ($self->get_conf('deftypefnnewline') eq 'on') {
          $category_tree
            = {'type' => '_code',
               'contents'
                  => [$self->gdt("{category}:\@* ", {'category' => $category})]
              };
          $tree = $self->gdt("\@emph{{type}}\@* \@strong{{name}}",
                  $strings);
        } else {
          $tree = $self->gdt("\@emph{{type}} \@strong{{name}}",
                  $strings);
        }
      }
      $category_result = $self->convert_tree($category_tree);
    # with a class, no type
    } elsif ($command_name eq 'defcv'
             or ($command_name eq 'deftypecv'
                 and !$command->{'extra'}->{'def_parsed_hash'}->{'type'})) {
      if ($arguments) {
        $tree = $self->gdt("{category} of {class}: \@strong{{name}} \@emph{{arguments}}", {
                'category' => $category,
                'name' => $name,
                'class' => $command->{'extra'}->{'def_parsed_hash'}->{'class'},
                'arguments' => $arguments});
      } else {
        $tree = $self->gdt("{category} of {class}: \@strong{{name}}", {
                'category' => $category,
                'class' => $command->{'extra'}->{'def_parsed_hash'}->{'class'},
                'name' => $name});
      }
    } elsif ($command_name eq 'defop'
             or ($command_name eq 'deftypeop'
                 and !$command->{'extra'}->{'def_parsed_hash'}->{'type'})) {
      if ($arguments) {
        $tree = $self->gdt("{category} on {class}: \@strong{{name}} \@emph{{arguments}}", {
                'category' => $category,
                'name' => $name,
                'class' => $command->{'extra'}->{'def_parsed_hash'}->{'class'},
                'arguments' => $arguments});
      } else {
        $tree = $self->gdt("{category} on {class}: \@strong{{name}}", {
                'category' => $category,
                'class' => $command->{'extra'}->{'def_parsed_hash'}->{'class'},
                'name' => $name});
      }
    # with a class and a type
    } elsif ($command_name eq 'deftypeop') {
      if ($arguments) {
        my $strings = {
                'category' => $category,
                'name' => $name,
                'class' => $command->{'extra'}->{'def_parsed_hash'}->{'class'},
                'type' => $command->{'extra'}->{'def_parsed_hash'}->{'type'},
                'arguments' => $arguments};
        if ($self->get_conf('deftypefnnewline') eq 'on') {
          $tree 
            = $self->gdt("{category} on {class}:\@* \@emph{{type}}\@* \@strong{{name}} \@emph{{arguments}}", 
                         $strings);
        } else {
          $tree 
            = $self->gdt("{category} on {class}: \@emph{{type}} \@strong{{name}} \@emph{{arguments}}", 
                         $strings);
        }
      } else {
        my $strings = {
                'category' => $category,
                'type' => $command->{'extra'}->{'def_parsed_hash'}->{'type'},
                'class' => $command->{'extra'}->{'def_parsed_hash'}->{'class'},
                'name' => $name};
        if ($self->get_conf('deftypefnnewline') eq 'on') {
          $tree 
            = $self->gdt("{category} on {class}:\@* \@emph{{type}}\@* \@strong{{name}}", 
                         $strings);
        } else {
          $tree 
            = $self->gdt("{category} on {class}: \@emph{{type}} \@strong{{name}}", 
                         $strings);
        }
      }
    } elsif ($command_name eq 'deftypecv') {
      if ($arguments) {
        my $strings = {
                'category' => $category,
                'name' => $name,
                'class' => $command->{'extra'}->{'def_parsed_hash'}->{'class'},
                'type' => $command->{'extra'}->{'def_parsed_hash'}->{'type'},
                'arguments' => $arguments};
        if ($self->get_conf('deftypefnnewline') eq 'on') {
          $tree 
            = $self->gdt("{category} of {class}:\@* \@emph{{type}}\@* \@strong{{name}} \@emph{{arguments}}",
                         $strings);
        } else {
          $tree 
            = $self->gdt("{category} of {class}: \@emph{{type}} \@strong{{name}} \@emph{{arguments}}",
                         $strings);
        }
      } else {
        my $strings = {
                'category' => $category,
                'type' => $command->{'extra'}->{'def_parsed_hash'}->{'type'},
                'class' => $command->{'extra'}->{'def_parsed_hash'}->{'class'},
                'name' => $name};
        if ($self->get_conf('deftypefnnewline') eq 'on') {
          $tree 
            = $self->gdt("{category} of {class}:\@* \@emph{{type}}\@* \@strong{{name}}",
                         $strings);
        } else {
          $tree 
            = $self->gdt("{category} of {class}: \@emph{{type}} \@strong{{name}}",
                         $strings);
        }
      }
    }

    if ($category_result ne '') {
      my $open = $self->html_attribute_class('span', 'category-def');
      if ($open ne '') {
        $category_result = $open.'>'.$category_result.'</span>';
      }
    }
    my $anchor_span_open = '';
    my $anchor_span_close = '';
    my $anchor = $self->_get_copiable_anchor($index_id);
    if ($anchor ne '') {
      $anchor_span_open = '<span>';
      $anchor_span_close = '</span>';
    }
    return $self->html_attribute_class('dt', $original_command_name,
                                       \@additional_classes)
         . "$index_label>" . $category_result . $anchor_span_open
         . $self->convert_tree({'type' => '_code', 'contents' => [$tree]})
         . "$anchor$anchor_span_close</dt>\n";
  } else {
    my $category_prepared = '';
    if ($command->{'extra'} and $command->{'extra'}->{'def_parsed_hash'}
        and %{$command->{'extra'}->{'def_parsed_hash'}}) {
      my $parsed_definition_category 
         = Texinfo::Convert::Utils::definition_category ($self, $command);
      if ($parsed_definition_category) {
        $category_prepared = $self->convert_tree({'type' => '_code',
                   'contents' => [$parsed_definition_category]});
      }
    }
  
    my $arguments_text = '';
    if ($arguments) {
      $arguments_text = $self->convert_tree({'type' => '_code',
                   'contents' => $arguments});
      $arguments_text = '<em> ' . $arguments_text . '</em>' 
        if ($arguments_text =~ /\S/);
    }

  
    my $def_type = '';
    my $type_name = '';
    if ($command->{'extra'}->{'def_parsed_hash'}->{'type'}) {
      $def_type = $self->convert_tree({'type' => '_code',
          'contents' => [$command->{'extra'}->{'def_parsed_hash'}->{'type'}]});
    }
    $type_name = " <em>$def_type</em>" if ($def_type ne '');
    my $name = '';
    if ($command->{'extra'}->{'def_parsed_hash'}->{'name'}) {
      $name = $self->convert_tree({'type' => '_code',
          'contents' => [$command->{'extra'}->{'def_parsed_hash'}->{'name'}]});
    }
    $type_name .= ' <strong>' . $name . '</strong>' if ($name ne '');
    $type_name .= $arguments_text;

    return $self->html_attribute_class('tr', $original_command_name,
                                       \@additional_classes)
       . "$index_label><td align=\"left\">" . $type_name .
       "</td><td align=\"right\">" . $category_prepared . "</td></tr>\n";
  }
}

sub _get_copiable_anchor {
  my ($self, $id) = @_;
  my $result = '';
  if ($id and $self->get_conf('COPIABLE_LINKS')) {
    my $paragraph_symbol = $self->{'paragraph_symbol'};
    $result = $self->html_attribute_class('a', 'copiable-link')
        ." href='#$id'> $paragraph_symbol</a>";
  }
  return $result;
}

$default_types_conversion{'def_line'} = \&_convert_def_line_type;

sub _convert_def_item_type($$$$)
{
  my $self = shift;
  my $type = shift;
  my $command = shift;
  my $content = shift;

  return $content if ($self->in_string());
  if ($content =~ /\S/) {
    if (! $self->get_conf('DEF_TABLE')) {
      return '<dd>' . $content . '</dd>';
    } else {
      return '<tr><td colspan="2">' . $content . '</td></tr>';
    }
  }
}

$default_types_conversion{'def_item'} = \&_convert_def_item_type;
$default_types_conversion{'inter_def_item'} = \&_convert_def_item_type;

sub _convert_def_command($$$$) {
  my $self = shift;
  my $cmdname = shift;
  my $command = shift;
  my $content = shift;

  return $content if ($self->in_string());

  my @additional_classes;
  my $command_name;
  if ($Texinfo::Common::def_aliases{$cmdname}) {
    $command_name = $Texinfo::Common::def_aliases{$cmdname};
    push @additional_classes, "first-$cmdname-alias-first-$command_name";
  } else {
    $command_name = $cmdname;
  }
  my $class = "first-$command_name";

  if (!$self->get_conf('DEF_TABLE')) {
    return $self->html_attribute_class('dl', $class, \@additional_classes)
                                              .">\n". $content ."</dl>\n";
  } else {
    return $self->html_attribute_class('table', $class, \@additional_classes)
                    ." width=\"100%\">\n" . $content . "</table>\n";
  }
}

foreach my $command (keys(%def_commands)) {
  $default_commands_conversion{$command} = \&_convert_def_command;
}

sub _convert_table_item_type($$$$)
{
  my $self = shift;
  my $type = shift;
  my $command = shift;
  my $content = shift;

  return $content if ($self->in_string());
  if ($content =~ /\S/) {
    return '<dd>' . $content . '</dd>'."\n";
  }
}

$default_types_conversion{'table_item'} = \&_convert_table_item_type;
$default_types_conversion{'inter_item'} = \&_convert_table_item_type;

sub _contents_shortcontents_in_title($)
{
  my $self = shift;

  my $result = '';

  if ($self->{'structuring'} and $self->{'structuring'}->{'sectioning_root'}
      and scalar(@{$self->{'structuring'}->{'sections_list'}}) > 1
      and $self->get_conf('CONTENTS_OUTPUT_LOCATION') eq 'after_title') {
    foreach my $command ('contents', 'shortcontents') {
      if ($self->get_conf($command)) {
        my $contents_text = $self->_contents_inline_element($command, undef);
        if ($contents_text ne '') {
          $result .= $contents_text . $self->get_conf('DEFAULT_RULE')."\n";
        }
      }
    }
  }
  return $result;
}

# Convert @titlepage.  Falls back to simpletitle.
sub _default_format_titlepage($)
{
  my $self = shift;

  my $titlepage_text;
  if ($self->{'global_commands'}->{'titlepage'}) {
    $titlepage_text = $self->convert_tree({'contents'
               => $self->{'global_commands'}->{'titlepage'}->{'contents'}},
                                          'convert titlepage');
  } elsif ($self->{'simpletitle_tree'}) {
    my $title_text = $self->convert_tree_new_formatting_context(
     $self->{'simpletitle_tree'}, "$self->{'simpletitle_command_name'} simpletitle");
    $titlepage_text = &{$self->{'format_heading_text'}}($self,
                  $self->{'simpletitle_command_name'},
                  $self->{'simpletitle_command_name'}, $title_text, 0);
  }
  my $result = '';
  $result .= $titlepage_text.$self->get_conf('DEFAULT_RULE')."\n"
    if (defined($titlepage_text));
  $result .= $self->_contents_shortcontents_in_title();
  return $result;
}

sub _print_title($)
{
  my $self = shift;

  my $result = '';
  if ($self->get_conf('SHOW_TITLE')) {
    if ($self->get_conf('USE_TITLEPAGE_FOR_TITLE')) {
      $result .= &{$self->{'format_titlepage'}}($self);
    } else {
      if ($self->{'simpletitle_tree'}) {
        my $title_text = $self->convert_tree_new_formatting_context(
         $self->{'simpletitle_tree'}, "$self->{'simpletitle_command_name'} simpletitle");
        $result .= &{$self->{'format_heading_text'}}($self,
                  $self->{'simpletitle_command_name'},
                  $self->{'simpletitle_command_name'}, $title_text, 0);
      }
      $result .= $self->_contents_shortcontents_in_title();
    }
  }
  return $result;
}

# Function for converting special elements
sub _convert_special_element_type($$$$)
{
  my $self = shift;
  my $type = shift;
  my $element = shift;
  my $content = shift;

  if ($self->in_string()) {
    return '';
  }

  my $result = '';

  my $special_element_type = $element->{'extra'}->{'special_element_type'};
  $result .= join('', $self->close_registered_sections_level(0));
  my $id = $self->command_id($element);
  my $class = $self->get_conf('SPECIAL_ELEMENTS_CLASS')->{$special_element_type};
  $result .= $self->html_attribute_class('div', "element-${class}");
  if ($id ne '') {
    $result .= " id=\"$id\"";
  }
  $result .= ">\n";
  if ($self->get_conf('HEADERS')
      # first in page
      or $self->{'counter_in_file'}->{$element->{'structure'}->{'unit_filename'}} == 1) {
    $result .= &{$self->{'format_navigation_header'}}($self,
               $self->get_conf('MISC_BUTTONS'), undef, $element);
  }
  my $heading = $self->command_text($element);
  my $level = $self->get_conf('CHAPTER_HEADER_LEVEL');
  if ($special_element_type eq 'footnotes') {
    $level = $self->get_conf('FOOTNOTE_SEPARATE_HEADER_LEVEL');
  }
  $result .= &{$self->{'format_heading_text'}}($self, undef, $class.'-heading',
                     $heading, $level)."\n";

  my $special_element_body .= &{$self->{'format_special_element_body'}}
                                  ($self, $special_element_type, $element);

  # This may happen with footnotes in regions that are not expanded,
  # like @copying or @titlepage
  if ($special_element_body eq '') {
    return '';
  }
  $result .= $special_element_body . '</div>';
  $result .= &{$self->{'format_element_footer'}}($self, $type,
                                                 $element, $content);
  return $result;
}

$default_types_conversion{'special_element'} = \&_convert_special_element_type;

# Function for converting the top-level elements in the conversion corresponding to
# a section or a node.  The node and associated section appear together in
# the tree unit top-level element.  $ELEMENT was created in this module (in
# _prepare_conversion_tree_units), with type 'unit' (it's not a tree element created
# by the parser).  $CONTENT is the contents of the node/section, already converted.
sub _convert_tree_unit_type($$$$)
{
  my $self = shift;
  my $type = shift;
  my $element = shift;
  my $content = shift;

  if ($self->in_string()) {
    if (defined($content)) {
      return $content;
    } else {
      return '';
    }
  }
  my $result = '';
  my $tree_unit = $element;
  if (!$tree_unit->{'structure'}->{'unit_prev'}) {
    $result .= $self->_print_title();
    if (!$tree_unit->{'structure'}->{'unit_next'}) {
      # only one unit, use simplified formatting
      $result .= $content;
      # if there is one unit it also means that there is no formatting
      # of footnotes in a separate unit.  And if footnotestyle is end
      # the footnotes won't be done in format_element_footer either.
      $result .= &{$self->{'format_footnotes_text'}}($self);
      $result .= $self->get_conf('DEFAULT_RULE') ."\n"
        if ($self->get_conf('PROGRAM_NAME_IN_FOOTER')
          and defined($self->get_conf('DEFAULT_RULE')));
      # do it here, as it is won't be done at end of page in format_element_footer
      $result .= join('', $self->close_registered_sections_level(0));
      return $result;
    }
  }
  $result .= $content;
  $result .= &{$self->{'format_element_footer'}}($self, $type,
                                                 $element, $content);
  return $result;
}

$default_types_conversion{'unit'} = \&_convert_tree_unit_type;

# for tree unit elements and special elements
sub _default_format_element_footer($$$$)
{
  my $self = shift;
  my $type = shift;
  my $element = shift;
  my $content = shift;

  my $result = '';
  my $is_top = $self->element_is_tree_unit_top($element);
  my $next_is_top = ($element->{'structure'}->{'unit_next'}
                     and $self->element_is_tree_unit_top($element->{'structure'}->{'unit_next'}));
  my $next_is_special = (defined($element->{'structure'}->{'unit_next'})
                   and defined($element->{'structure'}->{'unit_next'}->{'type'})
                   and $element->{'structure'}->{'unit_next'}->{'type'} eq 'special_element');

  my $end_page = (!$element->{'structure'}->{'unit_next'}
       or (defined($element->{'structure'}->{'unit_filename'})
           and $element->{'structure'}->{'unit_filename'}
               ne $element->{'structure'}->{'unit_next'}->{'structure'}->{'unit_filename'}
           and $self->{'file_counters'}->{$element->{'structure'}->{'unit_filename'}} == 1));

  my $is_special = (defined($element->{'type'})
                    and $element->{'type'} eq 'special_element');

  if (($end_page or $next_is_top or $next_is_special or $is_top)
       and $self->get_conf('VERTICAL_HEAD_NAVIGATION')
       and ($self->get_conf('SPLIT') ne 'node' 
            or $self->get_conf('HEADERS') or $is_special or $is_top)) {
   $result .= "</td>
</tr>
</table>"."\n";
  }

  my $rule = '';
  my $buttons;

  if ($end_page) {
    $result .= join('', $self->close_registered_sections_level(0));

    # setup buttons for navigation footer
    if (($is_top or $is_special)
        and ($self->get_conf('SPLIT') or !$self->get_conf('MONOLITHIC'))
        and (($self->get_conf('HEADERS')
                or ($self->get_conf('SPLIT') and $self->get_conf('SPLIT') ne 'node')))) {
      if ($is_top) {
        $buttons = $self->get_conf('TOP_BUTTONS');
      } else {
        $buttons = $self->get_conf('MISC_BUTTONS');
      }
    } elsif ($self->get_conf('SPLIT') eq 'section') {
      $buttons = $self->get_conf('SECTION_FOOTER_BUTTONS');
    } elsif ($self->get_conf('SPLIT') eq 'chapter') {
      $buttons = $self->get_conf('CHAPTER_FOOTER_BUTTONS');
    } elsif ($self->get_conf('SPLIT') eq 'node') {
      if ($self->get_conf('HEADERS')) {
        my $no_footer_word_count;
        if ($self->get_conf('WORDS_IN_PAGE')) {
          my @cnt = split(/\W*\s+\W*/, $content);
          if (scalar(@cnt) < $self->get_conf('WORDS_IN_PAGE')) {
            $no_footer_word_count = 1;
          }
        }
        $buttons = $self->get_conf('NODE_FOOTER_BUTTONS')
           unless ($no_footer_word_count);
      }
    }
  }
  # FIXME the following condition is almost a duplication of the
  # condition appearing in end_page except that the file counter
  # needs not to be 1
  if ((!$element->{'structure'}->{'unit_next'}
       or (defined($element->{'structure'}->{'unit_filename'})
           and $element->{'structure'}->{'unit_filename'}
               ne $element->{'structure'}->{'unit_next'}->{'structure'}->{'unit_filename'}))
      and $self->get_conf('footnotestyle') eq 'end') {
    $result .= &{$self->{'format_footnotes_text'}}($self);
  }

  if (!$buttons or $is_top or $is_special
     or ($end_page and ($self->get_conf('SPLIT') eq 'chapter'
                       or $self->get_conf('SPLIT') eq 'section'))
     or ($self->get_conf('SPLIT') eq 'node' and $self->get_conf('HEADERS'))) {
    $rule = $self->get_conf('DEFAULT_RULE');
  }

  if (!$end_page and ($is_top or $next_is_top or ($next_is_special 
                                                 and !$is_special))) {
    $rule = $self->get_conf('BIG_RULE');
  }

  if ($buttons or !$end_page or $self->get_conf('PROGRAM_NAME_IN_FOOTER')) {
    $result .= "$rule\n" if ($rule);
  }
  if ($buttons) {
    $result .= &{$self->{'format_navigation_panel'}}($self, $buttons,
                                                     undef, $element);
  }
  
  return $result;
}

# if $document_global_context is set, it means that the formatting
# is not done within the document formatting flow, but the formatted
# output may still end up in the document.  In particular for
# command_text() which caches its computations.
sub _new_document_context($$;$)
{
  my $self = shift;
  my $cmdname = shift;
  my $document_global_context = shift;

  push @{$self->{'document_context'}},
          {'cmdname' => $cmdname,
           'formatting_context' => [{'cmdname' => $cmdname}],
           'composition_context' => [''],
           'formats' => [],
           'monospace' => [0],
           'document_global_context' => $document_global_context,
          };
  if (defined($document_global_context)) {
    $self->{'document_global_context'}++;
  }
}

sub _pop_document_context($)
{
  my $self = shift;

  my $context = pop @{$self->{'document_context'}};
  if (defined($context->{'document_global_context'})) {
    $self->{'document_global_context'}--;
  }
}

# Functions accessed with e.g. 'format_heading_text'.
# used in Texinfo::Config
our %default_formatting_references = (
     'format_heading_text' => \&_default_format_heading_text,
     'format_comment' => \&_default_format_comment,
     'format_protect_text' => \&_default_format_protect_text,
     'format_css_lines' => \&_default_format_css_lines,
     'format_begin_file' => \&_default_format_begin_file,
     'format_node_redirection_page' => \&_default_format_node_redirection_page,
     'format_end_file' => \&_default_format_end_file,
     'format_special_element_body' => \&_default_format_special_element_body,
     'format_footnotes_text' => \&_default_format_footnotes_text,
     'format_program_string' => \&_default_format_program_string,
     'format_titlepage' => \&_default_format_titlepage,
     'format_navigation_header' => \&_default_format_navigation_header,
     'format_navigation_panel' => \&_default_format_navigation_panel,
     'format_element_header' => \&_default_format_element_header,
     'format_element_footer' => \&_default_format_element_footer,
     'format_button' => \&_default_format_button,
     'format_button_icon_img' => \&_default_format_button_icon_img,
     'format_separate_anchor' => \&_default_format_separate_anchor,
     'format_contents' => \&_default_format_contents,
     'format_frame_files' => \&_default_format_frame_files,
);

%default_css_string_formatting_references = (
  'format_protect_text' => \&_default_css_string_format_protect_text,
);

sub _complete_no_arg_commands_formatting($$)
{
  my $self = shift;
  my $command = shift;
  if (!defined ($self->{'no_arg_commands_formatting'}->{'normal'}->{$command})) {
    $self->{'no_arg_commands_formatting'}->{'normal'}->{$command} = '';
  }
  if (!defined ($self->{'no_arg_commands_formatting'}->{'preformatted'}->{$command})) {
    $self->{'no_arg_commands_formatting'}->{'preformatted'}->{$command} =
      $self->{'no_arg_commands_formatting'}->{'normal'}->{$command};
  }
  if (!defined ($self->{'no_arg_commands_formatting'}->{'string'}->{$command})) {
    $self->{'no_arg_commands_formatting'}->{'string'}->{$command} =
      $self->{'no_arg_commands_formatting'}->{'preformatted'}->{$command};
  }
  if (!defined ($self->{'no_arg_commands_formatting'}->{'css_string'}->{$command})) {
    $self->{'no_arg_commands_formatting'}->{'css_string'}->{$command} =
      $self->{'no_arg_commands_formatting'}->{'string'}->{$command};
  }
}

sub _set_non_breaking_space($$)
{
  my $self = shift;
  my $non_breaking_space = shift;
  $self->{'non_breaking_space'} = $non_breaking_space;
}

# transform <hr> to <hr/>
sub _xhtml_re_close_lone_element($)
{
  my $element = shift;
  $element =~ s/^(<[a-zA-Z]+[^>]*)>$/$1\/>/;
  return $element;
}

my %htmlxref_entries = (
 'node' => [ 'node', 'section', 'chapter', 'mono' ],
 'section' => [ 'section', 'chapter','node', 'mono' ],
 'chapter' => [ 'chapter', 'section', 'node', 'mono' ],
 'mono' => [ 'mono', 'chapter', 'section', 'node' ],
);

sub _parse_htmlxref_files($$)
{
  my $self = shift;
  my $files = shift;
  my $htmlxref;

  foreach my $file (@$files) {
    my ($fname) = $file;
    if ($self->get_conf('TEST')) {
      $fname =~ s/([^\/]+\/)*//; # strip directories for out-of-source builds
    }
    print STDERR "html refs config file: $file\n" if ($self->get_conf('DEBUG'));
    unless (open (HTMLXREF, $file)) {
      $self->document_warn($self, 
        sprintf(__("could not open html refs config file %s: %s"),
          $file, $!));
      next;
    }
    my $line_nr = 0;
    my %variables;
    while (my $hline = <HTMLXREF>) {
      my $line = $hline;
      $line_nr++;
      next if $hline =~ /^\s*#/;
      #$hline =~ s/[#]\s.*//;
      $hline =~ s/^\s*//;
      next if $hline =~ /^\s*$/;
      chomp ($hline);
      if ($hline =~ s/^\s*(\w+)\s*=\s*//) {
        # handle variables
        my $var = $1;
        my $re = join '|', map { quotemeta $_ } keys %variables;
        $hline =~ s/\$\{($re)\}/defined $variables{$1} ? $variables{$1} 
                                                       : "\${$1}"/ge;
        $variables{$var} = $hline;
        next;
      }
      my @htmlxref = split /\s+/, $hline;
      my $manual = shift @htmlxref;
      my $split_or_mono = shift @htmlxref;
      #print STDERR "$split_or_mono $Texi2HTML::Config::htmlxref_entries{$split_or_mono} $line_nr\n";
      if (!defined($split_or_mono)) {
        $self->file_line_warn(__("missing type"),
                                        $fname, $line_nr);
        next;
      } elsif (!defined($htmlxref_entries{$split_or_mono})) {
        $self->file_line_warn(
                               sprintf(__("unrecognized type: %s"), 
                                    $split_or_mono), $fname, $line_nr);
        next;
      }
      my $href = shift @htmlxref;
      next if (exists($htmlxref->{$manual}->{$split_or_mono}));

      if (defined($href)) { # substitute 'variables'
        my $re = join '|', map { quotemeta $_ } keys %variables;
        $href =~ s/\$\{($re)\}/defined $variables{$1} ? $variables{$1} 
                                                      : "\${$1}"/ge;
        $href =~ s/\/*$// if ($split_or_mono ne 'mono');
      }
      $htmlxref->{$manual}->{$split_or_mono} = $href;
    }
    if (!close (HTMLXREF)) {
      $self->document_warn($self, sprintf(__(
                       "error on closing html refs config file %s: %s"),
                             $file, $!));
    }
  }
  return $htmlxref;
}

sub _load_htmlxref_files {
  my ($self) = @_;

  my @htmlxref_dirs = ();
  if ($self->get_conf('TEST')) {
    my $curdir = File::Spec->curdir();
    # to have reproducible tests, do not use system or user
    # directories if TEST is set.
    @htmlxref_dirs = File::Spec->catdir($curdir, '.texinfo');

    if (defined($self->{'parser_info'})
        and defined($self->{'parser_info'}->{'input_directory'})) {
      my $input_directory = $self->{'parser_info'}->{'input_directory'};
      if ($input_directory ne '.' and $input_directory ne '') {
        unshift @htmlxref_dirs, $input_directory;
      }
    }
  } elsif ($self->{'language_config_dirs'}
            and @{$self->{'language_config_dirs'}}) {
    @htmlxref_dirs = @{$self->{'language_config_dirs'}};
  }
  unshift @htmlxref_dirs, '.';

  my @texinfo_htmlxref_files;
  my $init_file_from_conf = $self->get_conf('HTMLXREF');
  if ($init_file_from_conf) {
    if (!$self->get_conf('TEST')) {
      @texinfo_htmlxref_files = ( $init_file_from_conf );
    } else {
      @texinfo_htmlxref_files 
      = Texinfo::Common::locate_init_file ($init_file_from_conf,
        \@htmlxref_dirs, 1);
    }
  } elsif (!$self->get_conf('TEST')) {
    @texinfo_htmlxref_files 
      = Texinfo::Common::locate_init_file ('htmlxref.cnf',
                                           \@htmlxref_dirs, 1);
  }
  $self->{'htmlxref_files'} = \@texinfo_htmlxref_files;

  $self->{'htmlxref'} = {};
  if ($self->{'htmlxref_files'}) {
    $self->{'htmlxref'} = _parse_htmlxref_files($self,
                                                $self->{'htmlxref_files'});
  }
}

# converter state
#  css_map
#  targets         for directions.  Keys are elements references, values are
#                  target information hash references described above before
#                  the API functions used to access those informations.
#  htmlxref
#  out_filepaths
#  file_counters
#  paragraph_symbol
#  line_break_element
#
#  simpletitle_tree
#  simpletitle_command_name
#  
#  commands_conversion

my %special_characters = (
  'paragraph_symbol' => ['&para;', '00B6'],
  'left_quote' => ['&lsquo;', '2018'],
  'right_quote' => ['&rsquo;', '2019'],
  'bullet' => ['&bull;', '2022'],
  'non_breaking_space' => [undef, '00A0'],
);

sub converter_initialize($)
{
  my $self = shift;

  $foot_num = 0;
  $foot_lines = '';
  %formatted_index_entries = ();
  %footnote_id_numbers = ();

  %{$self->{'css_map'}} = %css_map;

  _load_htmlxref_files($self);

  # duplicate such as not to modify the defaults
  my $conf_default_no_arg_commands_formatting_normal
    = Storable::dclone($default_no_arg_commands_formatting{'normal'});

  my %special_characters_set;

  my $output_encoding = $self->get_conf('OUTPUT_ENCODING_NAME');

  foreach my $special_character (keys(%special_characters)) {
    my ($default_entity, $unicode_point) = @{$special_characters{$special_character}};
    if ($self->get_conf('ENABLE_ENCODING')
        and $output_encoding
        and ($output_encoding eq 'utf-8'
             or ($Texinfo::Encoding::eight_bit_encoding_aliases{$output_encoding}
                 and $Texinfo::Convert::Unicode::unicode_to_eight_bit{$Texinfo::Encoding::eight_bit_encoding_aliases{$output_encoding}}->{$unicode_point}))) {
      $special_characters_set{$special_character} = chr(hex($unicode_point));
    } elsif ($self->get_conf('USE_NUMERIC_ENTITY')) {
      $special_characters_set{$special_character} = '&#'.hex($unicode_point).';';
    } else {
      $special_characters_set{$special_character} = $default_entity;
    }
  }

  if (defined($special_characters_set{'non_breaking_space'})) {
    my $non_breaking_space = $special_characters_set{'non_breaking_space'};
    $self->_set_non_breaking_space($non_breaking_space);
    foreach my $command (keys(%Texinfo::Convert::Unicode::unicode_entities)) {
      $conf_default_no_arg_commands_formatting_normal->{$command}->{'text'}
       = $Texinfo::Convert::Unicode::unicode_entities{$command};
    }
    foreach my $space_command (' ', "\t", "\n") {
      $conf_default_no_arg_commands_formatting_normal->{$space_command}->{'text'}
        = $self->html_non_breaking_space();
    }
    $conf_default_no_arg_commands_formatting_normal->{'tie'}->{'text'}
      = $self->substitute_html_non_breaking_space(
           $default_no_arg_commands_formatting{'normal'}->{'tie'}->{'text'});
  } else {
    $self->_set_non_breaking_space($xml_named_entity_nbsp);
  }
  $self->{'paragraph_symbol'} = $special_characters_set{'paragraph_symbol'};

  if (not defined($self->get_conf('OPEN_QUOTE_SYMBOL'))) {
    $self->set_conf('OPEN_QUOTE_SYMBOL', $special_characters_set{'left_quote'});
  }
  if (not defined($self->get_conf('CLOSE_QUOTE_SYMBOL'))) {
    $self->set_conf('CLOSE_QUOTE_SYMBOL', $special_characters_set{'right_quote'});
  }
  if (not defined($self->get_conf('MENU_SYMBOL'))) {
    $self->set_conf('MENU_SYMBOL', $special_characters_set{'bullet'});
  }

  if ($self->get_conf('USE_NUMERIC_ENTITY')) {
    foreach my $command (keys(%Texinfo::Convert::Unicode::unicode_entities)) {
      $conf_default_no_arg_commands_formatting_normal->{$command}->{'text'}
       = $Texinfo::Convert::Unicode::unicode_entities{$command};
    }
  }

  if ($self->get_conf('USE_XML_SYNTAX')) {
    foreach my $customization_variable ('BIG_RULE', 'DEFAULT_RULE') {
      my $variable_value = $self->get_conf($customization_variable);
      if (defined($variable_value)) {
        my $closed_lone_element = _xhtml_re_close_lone_element($variable_value);
        if ($closed_lone_element ne $variable_value) {
          $self->force_conf($customization_variable, $closed_lone_element);
        }
      }
    }
    $self->{'line_break_element'} = '<br/>';
  } else {
    $self->{'line_break_element'} = '<br>';
  }
  $conf_default_no_arg_commands_formatting_normal->{'*'}->{'text'}
    = $self->html_line_break_element();

  my $customized_types_conversion = Texinfo::Config::GNUT_get_types_conversion();
  foreach my $type (keys(%default_types_conversion)) {
    if (exists($customized_types_conversion->{$type})) {
      $self->{'types_conversion'}->{$type}
          = $customized_types_conversion->{$type};
    } else {
      $self->{'types_conversion'}->{$type} 
          = $default_types_conversion{$type};
    }
  }

  my $customized_types_open
     = Texinfo::Config::GNUT_get_types_open();
  foreach my $type (keys(%default_types_conversion)) {
    if (exists($customized_types_open->{$type})) {
      $self->{'types_open'}->{$type}
          = $customized_types_open->{$type};
    } elsif (exists($default_types_open{$type})) {
      $self->{'types_open'}->{$type}
           = $default_types_open{$type};
    }
  }

  # FIXME API with a function call?  Used in cvs.init.
  foreach my $type (keys(%default_code_types)) {
    $self->{'code_types'}->{$type} = $default_code_types{$type};
  }
  if ($Texinfo::Config::texinfo_code_types) {
    foreach my $type (keys(%$Texinfo::Config::texinfo_code_types)) {
      $self->{'code_types'}->{$type}
        = $Texinfo::Config::texinfo_code_types->{$type};
    }
  }

  # FIXME put value in a category in Texinfo::Common?
  my $customized_commands_conversion
     = Texinfo::Config::GNUT_get_commands_conversion();
  foreach my $command (keys(%misc_commands), keys(%brace_commands),
     keys (%block_commands), keys(%no_brace_commands), 'value') {
    if (exists($customized_commands_conversion->{$command})) {
      $self->{'commands_conversion'}->{$command}
          = $customized_commands_conversion->{$command};
    } else {
      if ($self->get_conf('FORMAT_MENU') ne 'menu'
           and ($command eq 'menu' or $command eq 'detailmenu')) {
        $self->{'commands_conversion'}->{$command} = undef;
      } elsif ($format_raw_commands{$command}
               and !$self->{'expanded_formats_hash'}->{$command}) {
      } elsif (exists($default_commands_conversion{$command})) {
        $self->{'commands_conversion'}->{$command}
           = $default_commands_conversion{$command};
      }
    }
  }

  my $customized_commands_open
     = Texinfo::Config::GNUT_get_commands_open();
  foreach my $command (keys(%misc_commands), keys(%brace_commands),
     keys (%block_commands), keys(%no_brace_commands), 'value') {
    if (exists($customized_commands_open->{$command})) {
      $self->{'commands_open'}->{$command}
          = $customized_commands_open->{$command};
    } elsif (exists($default_commands_open{$command})) {
      $self->{'commands_open'}->{$command}
           = $default_commands_open{$command};
    }
  }

  foreach my $context ('normal', 'preformatted', 'string', 'css_string') {
    foreach my $command (keys(%{$default_no_arg_commands_formatting{'normal'}})) {
      my $no_arg_command_customized_formatting
        = Texinfo::Config::GNUT_get_no_arg_command_formatting($command, $context);
      if (defined($no_arg_command_customized_formatting)) {
        $self->{'no_arg_commands_formatting'}->{$context}->{$command}
           = $no_arg_command_customized_formatting;
      } else {
        my $context_default_default_no_arg_commands_formatting
          = $default_no_arg_commands_formatting{$context};
        if ($context eq 'normal') {
          $context_default_default_no_arg_commands_formatting
           = $conf_default_no_arg_commands_formatting_normal;
        }
        if (defined($context_default_default_no_arg_commands_formatting->{$command})) {
          if ($self->get_conf('ENABLE_ENCODING') 
              and Texinfo::Convert::Unicode::brace_no_arg_command(
                             $command, $self->get_conf('OUTPUT_ENCODING_NAME'))) {
            $self->{'no_arg_commands_formatting'}->{$context}->{$command}
              = { 'text' => Texinfo::Convert::Unicode::brace_no_arg_command(
                           $command, $self->get_conf('OUTPUT_ENCODING_NAME'))};
            # reset CSS for itemize command arguments
            if ($context eq 'css_string'
                and exists($brace_commands{$command})
                and $command ne 'bullet' and $command ne 'w'
                and not $special_list_bullet_css_string_no_arg_command{$command}) {
              my $css_string
                = $self->{'no_arg_commands_formatting'}->{$context}->{$command}->{'text'};
              $css_string = '"'.$css_string.'"';
              $self->{'css_map'}->{"ul.mark-$command"} = "list-style-type: $css_string";
            }
          } else {
            $self->{'no_arg_commands_formatting'}->{$context}->{$command}
              = $context_default_default_no_arg_commands_formatting->{$command};
          }
        }
      }
      if (exists ($Texinfo::Config::commands_translation{$context}->{$command})) {
        $self->{'commands_translation'}->{$context}->{$command} 
           = $Texinfo::Config::commands_translation{$context}->{$command};
        delete $self->{'translated_commands'}->{$command};
        # note that %default_commands_translation is empty for now
      } elsif (defined($default_commands_translation{$context}->{$command})) {
        $self->{'commands_translation'}->{$context}->{$command}
          = $default_commands_translation{$context}->{$command};
        delete $self->{'translated_commands'}->{$command};
      }
    }
  }

  # set sane defaults in case there is none and the default formatting
  # function is used
  foreach my $command (keys(%{$default_no_arg_commands_formatting{'normal'}})) {
    if ($self->{'commands_conversion'}->{$command} 
        and $self->{'commands_conversion'}->{$command} 
            eq $default_commands_conversion{$command}) {
      $self->_complete_no_arg_commands_formatting($command);
    }
  }

  foreach my $context (keys(%style_commands_formatting)) {
    foreach my $command (keys(%{$style_commands_formatting{$context}})) {
      my $style_commands_formatting_info
        = Texinfo::Config::GNUT_get_style_command_formatting($command, $context);
      if (defined($style_commands_formatting_info)) {
        $self->{'style_commands_formatting'}->{$context}->{$command} 
           = $style_commands_formatting_info;
      } elsif (exists($style_commands_formatting{$context}->{$command})) {
        $self->{'style_commands_formatting'}->{$context}->{$command} 
           = $style_commands_formatting{$context}->{$command};
      }
    }
  }

  foreach my $command (keys %{$self->{'commands_conversion'}}) {
    if (exists($default_commands_args{$command})) {
      $self->{'commands_args'}->{$command} = $default_commands_args{$command};
    }
  }

  my $customized_formatting_references = Texinfo::Config::GNUT_get_formatting_references();
  # first check that all the customized_formatting_references
  # are in default_formatting_references
  foreach my $customized_formatting_reference
       (sort(keys(%{$customized_formatting_references}))) {
    if (!$default_formatting_references{$customized_formatting_reference}) {
      $self->document_warn($self, sprintf(__("Unknown formatting function: %s"),
                                          $customized_formatting_reference));
    }
  }
  foreach my $formatting_reference (keys(%default_formatting_references)) {
    $self->{'default_formatting_functions'}->{$formatting_reference}
       = $default_formatting_references{$formatting_reference};
    if (defined($customized_formatting_references->{$formatting_reference})) {
      $self->{$formatting_reference} 
       =  $customized_formatting_references->{$formatting_reference};
    } else {
      $self->{$formatting_reference} 
       = $default_formatting_references{$formatting_reference};
    }
  }

  $self->{'document_context'} = [];
  $self->{'multiple_pass'} = [];
  $self->{'pending_closes'} = [];
  $self->_new_document_context('_toplevel_context');

  if ($self->get_conf('SPLIT') and $self->get_conf('SPLIT') ne 'chapter'
      and $self->get_conf('SPLIT') ne 'section'
      and $self->get_conf('SPLIT') ne 'node') {
    $self->force_conf('SPLIT', 'node');
  }

  return $self;
}

# the entry point for _convert
sub convert_tree($$;$)
{
  my $self = shift;
  my $tree = shift;
  my $explanation = shift;

  # when formatting accents, goes through xml_accent without
  # explanation, as explanation is not in the standard API, but
  # otherwise the coverage of explanations should be pretty good
  #cluck if (! defined($explanation));
  #print STDERR "CONVERT_TREE".(defined($explanation) ? " ".$explanation : '')."\n"
  #    if ($self->get_conf('DEBUG'));
  return $self->_convert($tree, $explanation);
}

sub _normalized_to_id($)
{
  my $id = shift;
  if (!defined($id)) {
    cluck "_normalized_to_id id not defined";
    return '';
  }
  $id =~ s/^([0-9_])/g_t$1/;
  return $id;
}

sub _default_format_css_lines($;$)
{
  my $self = shift;
  my $filename = shift;

  return '' if ($self->get_conf('NO_CSS'));

  my $css_refs = $self->get_conf('CSS_REFS');

  my @css_rules = $self->html_get_css_elements_classes($filename);

  return '' if (!@{$self->{'css_import_lines'}} and !@{$self->{'css_rule_lines'}}
             and !keys(%{$self->{'css_map'}}) and !@$css_refs);

  my $css_text = "<style type=\"text/css\">\n<!--\n";
  $css_text .= join('',@{$self->{'css_import_lines'}}) . "\n" 
    if (@{$self->{'css_import_lines'}});
  #foreach my $css_rule (sort(keys(%{$self->{'css_map'}}))) {
  foreach my $css_rule (@css_rules) {
    next unless ($self->{'css_map'}->{$css_rule});
    $css_text .= "$css_rule {$self->{'css_map'}->{$css_rule}}\n";
  }
  $css_text .= join('',@{$self->{'css_rule_lines'}}) . "\n" 
    if (@{$self->{'css_rule_lines'}});
  $css_text .= "-->\n</style>\n";
  foreach my $ref (@$css_refs) {
    $css_text .= $self->close_html_lone_element(
         "<link rel=\"stylesheet\" type=\"text/css\" href=\"$ref\"")."\n";
  }
  return $css_text;
}

sub _process_css_file($$$)
{
  my $self = shift;
  my $fh =shift;
  my $file = shift;
  my $in_rules = 0;
  my $in_comment = 0;
  my $in_import = 0;
  my $in_string = 0;
  my $rules = [];
  my $imports = [];
  my $line_nr = 0;
  while (my $line = <$fh>) {
    $line_nr++;
    #print STDERR "Line: $line";
    if ($in_rules) {
      push @$rules, $line;
      next;
    }
    my $text = '';
    while (1) {
      #sleep 1;
      #print STDERR "${text}!in_comment $in_comment in_rules $in_rules in_import $in_import in_string $in_string: $line";
      if ($in_comment) {
        if ($line =~ s/^(.*?\*\/)//) {
          $text .= $1;
          $in_comment = 0;
        } else {
          push @$imports, $text . $line;
          last;
        }
      } elsif (!$in_string and $line =~ s/^\///) {
        if ($line =~ s/^\*//) {
          $text .= '/*';
          $in_comment = 1;
        } else {
          push (@$imports, $text. "\n") if ($text ne '');
          push (@$rules, '/' . $line);
          $in_rules = 1;
          last;
        }
      } elsif (!$in_string and $in_import and $line =~ s/^([\"\'])//) { 
        # strings outside of import start rules
        $text .= "$1";
        $in_string = quotemeta("$1");
      } elsif ($in_string and $line =~ s/^(\\$in_string)//) {
        $text .= $1;
      } elsif ($in_string and $line =~ s/^($in_string)//) {
        $text .= $1;
        $in_string = 0;
      } elsif ((! $in_string and !$in_import) 
              and ($line =~ s/^([\\]?\@import)$// 
                   or $line =~ s/^([\\]?\@import\s+)//)) {
        $text .= $1;
        $in_import = 1;
      } elsif (!$in_string and $in_import and $line =~ s/^\;//) {
        $text .= ';';
        $in_import = 0;
      } elsif (($in_import or $in_string) and $line =~ s/^(.)//) {
        $text .= $1;
      } elsif (!$in_import and $line =~ s/^([^\s])//) {
        push (@$imports, $text. "\n") if ($text ne '');
        push (@$rules, $1 . $line);
        $in_rules = 1;
        last;
      } elsif ($line =~ s/^(\s)//) {
        $text .= $1;
      } elsif ($line eq '') {
        push (@$imports, $text);
        last;
      }
    }
  }
  $self->file_line_warn(
                        sprintf(__("string not closed in css file"), 
                        $file, $line_nr)) if ($in_string);
  $self->file_line_warn(
                        sprintf(__("--css-include ended in comment"), 
                        $file, $line_nr)) if ($in_comment);
  $self->file_line_warn(
                        sprintf(__("\@import not finished in css file"), 
                        $file, $line_nr)) 
    if ($in_import and !$in_comment and !$in_string);
  return ($imports, $rules);
}

sub _prepare_css($)
{
  my $self = shift;
  
  return if ($self->get_conf('NO_CSS'));

  my @css_import_lines;
  my @css_rule_lines;

  my $css_files = $self->get_conf('CSS_FILES');
  foreach my $file (@$css_files) {
    my $css_file_fh;
    my $css_file;
    if ($file eq '-') {
      $css_file_fh = \*STDIN;
      $css_file = '-';
    } else {
      $css_file = $self->Texinfo::Common::locate_include_file($file);
      unless (defined($css_file)) {
        $self->document_warn($self, sprintf(
               __("CSS file %s not found"), $file));
        next;
      }
      unless (open (CSSFILE, $css_file)) {
        $self->document_warn($self, sprintf(__(
             "could not open --include-file %s: %s"), 
              $css_file, $!));
        next;
      }
      $css_file_fh = \*CSSFILE;
    }
    my ($import_lines, $rules_lines);
    ($import_lines, $rules_lines) 
      = $self->_process_css_file ($css_file_fh, $css_file);
    if (!close($css_file_fh)) {
      $self->document_warn($self,
            sprintf(__("error on closing CSS file %s: %s"),
                                   $css_file, $!));
    }
    push @css_import_lines, @$import_lines;
    push @css_rule_lines, @$rules_lines;

  }
  if ($self->get_conf('DEBUG')) {
    if (@css_import_lines) {
      print STDERR "# css import lines\n";
      foreach my $line (@css_import_lines) {
        print STDERR "$line";
      }
    }
    if (@css_rule_lines) {
      print STDERR "# css rule lines\n";
      foreach my $line (@css_rule_lines) {
        print STDERR "$line";
      }
    }
  }
  $self->{'css_import_lines'} = \@css_import_lines;
  $self->{'css_rule_lines'} = \@css_rule_lines;
}

# Get the name of a file containing a label, as well as the identifier within
# that file to link to that label.  Argument is the 'extra' value on
# an element hash, or something that looks like it.  Labels are typically
# associated to @node, @anchor or @float.
sub _normalized_label_id_file($$)
{
  my $self = shift;
  my $label_info = shift;

  my $target;
  my $normalized;
  if ($label_info->{'normalized'}) {
    $normalized = $label_info->{'normalized'};
  } elsif ($label_info->{'node_content'}) {
    $normalized = Texinfo::Convert::NodeNameNormalization::normalize_node(
      { 'contents' => $label_info->{'node_content'} });
  }

  if (defined($normalized)) {
    $target = _normalized_to_id($normalized);
  } else {
    $target = '';
  }
  # to find out the Top node, one could check $label_info->{'normalized'}
  # FIXME change name?  It is not only for nodes
  if (defined($Texinfo::Config::node_target_name)) {
    $target = &$Texinfo::Config::node_target_name($label_info, $target);
  }

  my $filename = $self->node_information_filename($label_info);

  return ($filename, $target);
}

sub _new_sectioning_command_target($$)
{
  my $self = shift;
  my $command = shift;

  my ($normalized_name, $filename)
    = $self->normalized_sectioning_command_filename($command);

  my $target_base = _normalized_to_id($normalized_name);
  if ($target_base !~ /\S/ and $command->{'cmdname'} eq 'top'
      and defined($self->{'special_elements_targets'}->{'Top'})) {
    $target_base = $self->{'special_elements_targets'}->{'Top'};
  }
  my $nr=1;
  my $target = $target_base;
  if ($target ne '') {
    while ($self->{'seen_ids'}->{$target}) {
      $target = $target_base.'-'.$nr;
      $nr++;
      # Avoid integer overflow
      die if ($nr == 0);
    }
  }

  # These are undefined if the $target is set to ''.
  my $target_contents;
  my $target_shortcontents;
  if ($Texinfo::Common::sectioning_commands{$command->{'cmdname'}}) {
    if ($target ne '') {
      my $target_base_contents = $target;
      $target_base_contents =~ s/^g_t//;
      $target_contents = 'toc-'.$target_base_contents;
      my $toc_nr = $nr -1;
      while ($self->{'seen_ids'}->{$target_contents}) {
        $target_contents = 'toc-'.$target_base_contents.'-'.$toc_nr;
        $toc_nr++;
        # Avoid integer overflow
        die if ($toc_nr == 0);
      }

      $target_shortcontents = 'stoc-'.$target_base_contents;
      my $target_base_shortcontents = $target_base;
      $target_base_shortcontents =~ s/^g_t//;
      my $stoc_nr = $nr -1;
      while ($self->{'seen_ids'}->{$target_shortcontents}) {
        $target_shortcontents = 'stoc-'.$target_base_shortcontents
                                   .'-'.$stoc_nr;
        $stoc_nr++;
        # Avoid integer overflow
        die if ($stoc_nr == 0);
      }
    }
  }

  if (defined($Texinfo::Config::sectioning_command_target_name)) {
    ($target, $target_contents,
     $target_shortcontents, $filename)
        = &$Texinfo::Config::sectioning_command_target_name($self,
                                     $command, $target,
                                     $target_contents,
                                     $target_shortcontents,
                                     $filename);
  }
  if ($self->get_conf('DEBUG')) {
    print STDERR "Register $command->{'cmdname'} $target\n";
  }
  $self->{'targets'}->{$command} = {
                           'target' => $target,
                           'section_filename' => $filename,
                          };
  $self->{'seen_ids'}->{$target} = 1;
  if (defined($target_contents)) {
    $self->{'targets'}->{$command}->{'contents_target'} = $target_contents;
  } else {
    $self->{'targets'}->{$command}->{'contents_target'} = '';
  }
  if (defined($target_shortcontents)) {
    $self->{'targets'}->{$command}->{'shortcontents_target'}
       = $target_shortcontents;
  } else {
    $self->{'targets'}->{$command}->{'shortcontents_target'} = '';
  }
  return $self->{'targets'}->{$command};
}

# This set with two different codes
#  * the target information, id and normalized filename of 'labels',
#    ie everything that may be the target of a ref, like @node, @float, @anchor...
#  * The target informations of sectioning elements by going through tree units
# @node and section commands targets are therefore both set.
#
# conversion to HTML is done on-demand, upon call to command_text
# and similar functions.
# Note that 'node_filename', which is set here for Top target information
# too, is not used later for Top anchors or links, see the NOTE below.
sub _set_root_commands_targets_node_files($$)
{
  my $self = shift;
  my $tree_units = shift;

  my $no_unidecode;
  $no_unidecode = 1 if (defined($self->get_conf('USE_UNIDECODE'))
                        and !$self->get_conf('USE_UNIDECODE'));

  my $extension = '';
  $extension = '.'.$self->get_conf('EXTENSION')
            if (defined($self->get_conf('EXTENSION'))
                and $self->get_conf('EXTENSION') ne '');
  if ($self->{'labels'}) {
    foreach my $label_element (values(%{$self->{'labels'}})) {
      my ($filename, $target)
        = $self->_normalized_label_id_file($label_element->{'extra'});
      $filename .= $extension;
      if (defined($Texinfo::Config::node_file_name)) {
        $filename = &$Texinfo::Config::node_file_name($self, $label_element,
                                                     $filename);
      }
      if ($self->get_conf('DEBUG')) {
        print STDERR "Label($label_element) \@$label_element->{'cmdname'} $target, $filename\n";
      }
      $self->{'targets'}->{$label_element} = {'target' => $target,
                                             'node_filename' => $filename};
      $self->{'seen_ids'}->{$target} = 1;
    }
  }

  if ($tree_units) {
    foreach my $tree_unit (@$tree_units) {
      foreach my $root_element(@{$tree_unit->{'contents'}}) {
        # this happens for types which would precede the root commands.
        # The target may already be set for the top node tree unit.
        next if (!defined($root_element->{'cmdname'})
                 or $self->{'targets'}->{$root_element});
        if ($Texinfo::Common::sectioning_commands{$root_element->{'cmdname'}}) {
          $self->_new_sectioning_command_target($root_element);
        }
      }
    }
  }
}

sub _html_get_tree_root_element($$;$);

# If $find_container is set, the element that holds the command is found,
# otherwise the element that holds the command content is found.  This is
# mostly relevant for footnote only.
# If no known root element type is found, the returned root element is undef, and not
# set to the element at the tree root
sub _html_get_tree_root_element($$;$)
{
  my $self = shift;
  my $command = shift;
  my $find_container = shift;

  # can be used to debug/understand what is going on
  #my $debug = 0;

  my $current = $command;
  #print STDERR "START ".Texinfo::Common::debug_print_element_short($current)."\n" if ($debug);

  my ($root_element, $root_command);
  while (1) {
    if ($current->{'type'}) {
      if ($current->{'type'} eq 'unit' or $current->{'type'} eq 'special_element') {
        #print STDERR "ROOT ELEMENT $current->{'type'}\n" if ($debug);
        return ($current, $root_command);
      }
    }
    if ($current->{'cmdname'}) {
      if ($root_commands{$current->{'cmdname'}}) {
        $root_command = $current;
        #print STDERR "CMD ROOT $current->{'cmdname'}\n" if ($debug);
        return ($root_element, $root_command) if defined($root_element);
      } elsif ($region_commands{$current->{'cmdname'}}) {
        if ($current->{'cmdname'} eq 'copying' 
            and $self->{'global_commands'}
            and $self->{'global_commands'}->{'insertcopying'}) {
          foreach my $insertcopying(@{$self->{'global_commands'}->{'insertcopying'}}) {
            #print STDERR "INSERTCOPYING\n" if ($debug);
            my ($root_element, $root_command)
              = $self->_html_get_tree_root_element($insertcopying, $find_container);
            return ($root_element, $root_command)
              if (defined($root_element) or defined($root_command));
          }
        } elsif ($current->{'cmdname'} eq 'titlepage'
                 and $self->get_conf('USE_TITLEPAGE_FOR_TITLE')
                 and $self->get_conf('SHOW_TITLE')
                 and $self->{'tree_units'}->[0]) {
          #print STDERR "FOR titlepage tree_units [0]\n" if ($debug);
          return ($self->{'tree_units'}->[0],
                  $self->{'tree_units'}->[0]->{'extra'}->{'unit_command'});
        }
        die "Problem $root_element, $root_command" if (defined($root_element)
                                                  or defined($root_command));
        return (undef, undef);
      } elsif ($current->{'cmdname'} eq 'footnote' 
           and $self->special_element('Footnotes')
           and $find_container) {
           # in that case there is no root_command
          #print STDERR "SPECIAL footnote\n" if ($debug);
          $root_element = $self->special_element('Footnotes');
          return ($root_element);
      }
    }
    if ($current->{'structure'}->{'associated_unit'}) {
      #print STDERR "ASSOCIATED_UNIT ".Texinfo::Common::debug_print_element_short($current->{'structure'}->{'associated_unit'})."\n" if ($debug);
      $current = $current->{'structure'}->{'associated_unit'};
    } elsif ($current->{'parent'}) {
      #print STDERR "PARENT ".Texinfo::Common::debug_print_element_short($current->{'parent'})."\n" if ($debug);
      $current = $current->{'parent'};
    } else {
      #print STDERR "UNKNOWN ROOT ".Texinfo::Common::debug_print_element_short($current)."\n" if ($debug);
      return (undef, $root_command);
    }
  }
}

sub _html_set_pages_files($$$$$$$$)
{
  my $self = shift;
  my $tree_units = shift;
  my $special_elements = shift;
  my $output_file = shift;
  my $destination_directory = shift;
  my $output_filename = shift;
  my $document_name = shift;

  # Ensure that the document has pages
  return undef if (!defined($tree_units) or !@$tree_units);

  my $extension = '';
  $extension = '.'.$self->get_conf('EXTENSION') 
            if (defined($self->get_conf('EXTENSION')) 
                and $self->get_conf('EXTENSION') ne '');

  if (!$self->get_conf('SPLIT')) {
    foreach my $tree_unit (@$tree_units) {
      if (!defined($tree_unit->{'structure'}->{'unit_filename'})) {
        $tree_unit->{'structure'}->{'unit_filename'} = $output_filename;
        $self->{'out_filepaths'}->{$output_filename} = $output_file;
      }
    }
  } else {
    my $node_top;
    $node_top = $self->{'labels'}->{'Top'} if ($self->{'labels'});
  
    my $top_node_filename = $self->top_node_filename($document_name);
    # first determine the top node file name.
    if ($node_top and defined($top_node_filename)) {
      my ($node_top_tree_unit) = $self->_html_get_tree_root_element($node_top);
      die "BUG: No element for top node" if (!defined($node_top));
      $self->set_tree_unit_file($node_top_tree_unit, $top_node_filename,
                               $destination_directory);
    }
    my $file_nr = 0;
    my $previous_page;
    foreach my $tree_unit (@$tree_units) {
      # For Top node.
      next if (defined($tree_unit->{'structure'}->{'unit_filename'}));
      if (!$tree_unit->{'extra'}->{'first_in_page'}) {
        cluck ("No first_in_page for $tree_unit\n");
      }
      if (!defined($tree_unit->{'extra'}->{'first_in_page'}->{'structure'}->{'unit_filename'})) {
        my $file_tree_unit = $tree_unit->{'extra'}->{'first_in_page'};
        foreach my $root_command (@{$file_tree_unit->{'contents'}}) {
          if ($root_command->{'cmdname'} 
              and $root_command->{'cmdname'} eq 'node') {
            my $node_filename;
            # double node are not normalized, they are handled here
            if (!defined($root_command->{'extra'}->{'normalized'})
                or !defined($self->{'labels'}->{$root_command->{'extra'}->{'normalized'}})) {
              $node_filename = 'unknown_node';
              $node_filename .= $extension;
            } else {
              if (!defined($self->{'targets'}->{$root_command})
                  or !defined($self->{'targets'}->{$root_command}->{'node_filename'})) {
                # Could have been a double node, thus use equivalent node.
                # However since double nodes are not normalized, in fact it 
                # never happens.
                $root_command
                  = $self->{'labels'}->{$root_command->{'extra'}->{'normalized'}};
              }
              $node_filename 
                = $self->{'targets'}->{$root_command}->{'node_filename'};
            }
            $self->set_tree_unit_file($file_tree_unit, $node_filename,
                                      $destination_directory);
            last;
          }
        }
        if (!defined($file_tree_unit->{'structure'}->{'unit_filename'})) {
          # use section to do the file name if there is no node
          my $command = $self->element_command($file_tree_unit);
          if ($command) {
            if ($command->{'cmdname'} eq 'top' and !$node_top
                and defined($top_node_filename)) {
              $self->set_tree_unit_file($file_tree_unit, $top_node_filename,
                                        $destination_directory);
            } else {
              $self->set_tree_unit_file($file_tree_unit,
                 $self->{'targets'}->{$command}->{'section_filename'},
                                        $destination_directory);
            }
          } else {
            # when everything else has failed
            if ($file_nr == 0 and !$node_top 
                and defined($top_node_filename)) {
              $self->set_tree_unit_file($file_tree_unit, $top_node_filename,
                                        $destination_directory);
            } else {
              my $filename = $document_name . "_$file_nr";
              $filename .= $extension;
              $self->set_tree_unit_file($tree_unit, $filename,
                                        $destination_directory);
            }
            $file_nr++;
          }
        }
      }
      $tree_unit->{'structure'}->{'unit_filename'}
         = $tree_unit->{'extra'}->{'first_in_page'}->{'structure'}->{'unit_filename'};
    }
  }

  foreach my $tree_unit (@$tree_units) {
    if (defined($Texinfo::Config::element_file_name)) {
      # NOTE the information that it is associated with @top or @node Top
      # may be determined with $self->element_is_tree_unit_top($tree_unit);
      my $filename = &$Texinfo::Config::element_file_name($self, $tree_unit,
                                       $tree_unit->{'structure'}->{'unit_filename'});
      $self->set_tree_unit_file($tree_unit, $filename, $destination_directory)
         if (defined($filename));
    }
    $self->{'file_counters'}->{$tree_unit->{'structure'}->{'unit_filename'}}++;
    print STDERR "Page $tree_unit "
      .Texinfo::Structuring::root_or_external_element_cmd_texi($tree_unit)
      .": $tree_unit->{'structure'}->{'unit_filename'}($self->{'file_counters'}->{$tree_unit->{'structure'}->{'unit_filename'}})\n"
      if ($self->get_conf('DEBUG'));
  }
  if ($special_elements) {
    my $previous_tree_unit = $tree_units->[-1];
    foreach my $special_element (@$special_elements) {
      my $filename 
       = $self->{'targets'}->{$special_element}->{'special_element_filename'};
      if (defined($filename)) {
        $self->set_tree_unit_file($special_element, $filename, $destination_directory);
        $self->{'file_counters'}->{$special_element->{'structure'}->{'unit_filename'}}++;
        print STDERR "Special page $special_element: $special_element->{'structure'}->{'unit_filename'}($self->{'file_counters'}->{$special_element->{'structure'}->{'unit_filename'}})\n"
          if ($self->get_conf('DEBUG'));
      }
      $special_element->{'structure'}->{'unit_prev'} = $previous_tree_unit;
      $previous_tree_unit->{'structure'}->{'unit_next'} = $special_element;
      $previous_tree_unit = $special_element;
    }
  }
}

# $ROOT is a parsed Texinfo tree.  Return a list of the "elements" we need to
# output in the HTML file(s).  Each "element" is what can go in one HTML file,
# such as the content between @node lines in the Texinfo source.
# Also do some conversion setup that is to be done in both convert() and output().
sub _prepare_conversion_tree_units($$$$)
{
  my $self = shift;
  my $root = shift;
  my $destination_directory = shift;
  my $document_name = shift;

  my $tree_units;

  if ($self->get_conf('USE_NODES')) {
    $tree_units = Texinfo::Structuring::split_by_node($root);
  } else {
    $tree_units = Texinfo::Structuring::split_by_section($root);
  }

  $self->{'tree_units'} = $tree_units
    if (defined($tree_units));

  # This may be done as soon as tree units are available.
  $self->_prepare_tree_units_global_targets($tree_units);

  # the presence of contents elements in the document is used in diverse
  # places, set it once for all here
  my @contents_elements_options = grep {Texinfo::Common::valid_option($_)}
                                         keys(%contents_command_element_type);
  $self->set_global_document_commands('last', \@contents_elements_options);

  # configuration used to determine if a special element is to be done
  # (in addition to contents)
  my @conf_for_special_elements = ('footnotestyle');
  $self->set_global_document_commands('last', \@conf_for_special_elements);
  # Do that before the other elements, to be sure that special page ids
  # are registered before elements id are.
  my $special_elements
    = $self->_prepare_special_elements($tree_units, $destination_directory,
                                       $document_name);
  # reset to the default
  $self->set_global_document_commands('before', \@conf_for_special_elements);

  #if ($tree_units) {
  #  foreach my $element(@{$tree_units}) {
  #    print STDERR "ELEMENT $element->{'type'}: $element\n";
  #  }
  #}

  $self->_set_root_commands_targets_node_files($tree_units);

  # setup untranslated strings
  $self->_translate_names();

  return ($tree_units, $special_elements);
}

sub _prepare_special_elements($$$$)
{
  my $self = shift;
  my $tree_units = shift;
  my $destination_directory = shift;
  my $document_name = shift;

  my %do_special;
  if ($self->{'structuring'} and $self->{'structuring'}->{'sectioning_root'}
      and scalar(@{$self->{'structuring'}->{'sections_list'}}) > 1) {
    foreach my $cmdname ('contents', 'shortcontents') {
      my $element_type = $contents_command_element_type{$cmdname};
      if ($self->get_conf($cmdname)) {
        if ($self->get_conf('CONTENTS_OUTPUT_LOCATION')
            eq 'separate_element') {
          $do_special{$element_type} = 1;
        }
      }
    }
  }
  if ($self->{'global_commands'}->{'footnote'}
      and $self->get_conf('footnotestyle') eq 'separate'
      and $tree_units and scalar(@$tree_units) > 1) {
    $do_special{'footnotes'} = 1;
  }

  if ((!defined($self->get_conf('DO_ABOUT')) 
       and $tree_units and scalar(@$tree_units) > 1
           and ($self->get_conf('SPLIT') or $self->get_conf('HEADERS')))
       or ($self->get_conf('DO_ABOUT'))) {
    $do_special{'about'} = 1;
  }

  my $extension = '';
  $extension = $self->get_conf('EXTENSION') 
    if (defined($self->get_conf('EXTENSION')));

  my $special_elements = [];
  foreach my $element_type (@{$self->{'special_elements_order'}}) {
    next unless ($do_special{$element_type});

    my $element = {'type' => 'special_element',
                   'extra' => {'special_element_type' => $element_type,
                               }};
    $element->{'structure'}->{'directions'}->{'This'} = $element;
    my $special_element_direction
       = $self->get_conf('SPECIAL_ELEMENTS_DIRECTIONS')->{$element_type};
    $self->{'special_elements_directions'}->{$special_element_direction}
       = $element;
    push @$special_elements, $element;

    my $target = $self->{'special_elements_targets'}->{$element_type};
    my $default_filename;
    if ($self->get_conf('SPLIT') or !$self->get_conf('MONOLITHIC')) {
      $default_filename = $document_name.
        $self->{'special_elements_file_string'}->{$element_type};
      $default_filename .= '.'.$extension if (defined($extension));
    } else {
      $default_filename = undef;
    }

    my $filename;
    if (defined($Texinfo::Config::special_element_target_file_name)) {
      ($target, $filename) 
                 = &$Texinfo::Config::special_element_target_file_name(
                                                            $self,
                                                            $element,
                                                            $target,
                                                            $default_filename);
    }
    $filename = $default_filename if (!defined($filename));

    if ($self->get_conf('DEBUG')) {
      my $fileout = $filename;
      $fileout = 'UNDEF' if (!defined($fileout));
      print STDERR "Add special $element $element_type: target $target,\n".
        "    filename $fileout\n" 
    }
    if ($self->get_conf('SPLIT') or !$self->get_conf('MONOLITHIC')
        or (defined($filename) ne defined($default_filename))
        or (defined($filename) and $filename ne $default_filename)) {
      $self->set_tree_unit_file($element, $filename, $destination_directory);
      print STDERR "NEW page for $element_type ($filename)\n" if ($self->get_conf('DEBUG'));
    }
    $self->{'targets'}->{$element} = {'target' => $target,
                                      'special_element_filename' => $filename,
                                     };
    $self->{'seen_ids'}->{$target} = 1;
  }
  if ($self->get_conf('FRAMES')) {
    foreach my $element_type (keys(%{$self->{'frame_pages_file_string'}})) {
      my $default_filename;
      $default_filename = $document_name.
        $self->{'frame_pages_file_string'}->{$element_type};
      $default_filename .= '.'.$extension if (defined($extension));

      my $element = {'type' => 'special_element',
                   'extra' => {'special_element_type' => $element_type,
                               }};

      # only the filename is used
      my ($target, $filename);
      if (defined($Texinfo::Config::special_element_target_file_name)) {
        ($target, $filename) 
                 = &$Texinfo::Config::special_element_target_file_name(
                                                            $self,
                                                            $element,
                                                            $target,
                                                            $default_filename);
      }
      $filename = $default_filename if (!defined($filename));
      $self->{'frame_pages_filenames'}->{$element_type} = $filename;
    }
  }
  return $special_elements;
}

sub _prepare_contents_elements($)
{
  my $self = shift;

  if ($self->{'structuring'} and $self->{'structuring'}->{'sectioning_root'}
      and scalar(@{$self->{'structuring'}->{'sections_list'}}) > 1) {
    foreach my $cmdname ('contents', 'shortcontents') {
      my $element_type = $contents_command_element_type{$cmdname};
      if ($self->get_conf($cmdname)) {
        my $default_filename;
        if ($self->get_conf('CONTENTS_OUTPUT_LOCATION') eq 'after_title') {
          if ($self->{'tree_units'}) {
            $default_filename
              = $self->{'tree_units'}->[0]->{'structure'}->{'unit_filename'};
          }
        } elsif ($self->get_conf('CONTENTS_OUTPUT_LOCATION') eq 'after_top') {
          my $section_top = undef;
          if ($self->{'global_commands'} and $self->{'global_commands'}->{'top'}) {
             $section_top = $self->{'global_commands'}->{'top'};
             $default_filename = $self->command_filename($section_top)
          }
        } elsif ($self->get_conf('CONTENTS_OUTPUT_LOCATION') eq 'inline') {
          if ($self->{'global_commands'}
              and $self->{'global_commands'}->{$cmdname}) {
            foreach my $command(@{$self->{'global_commands'}->{$cmdname}}) {
              my ($root_element, $root_command)
                = $self->_html_get_tree_root_element($command);
              if (defined($root_element)) {
                $default_filename
                   = $root_element->{'structure'}->{'unit_filename'};
                last;
              }
            }
          } else {
            next;
          }
        } else { # in this case, there should already be a special element
                 # if needed, done together with the other special elements.
          next;
        }

        my $contents_element = {'type' => 'special_element',
                        'extra' => {'special_element_type' => $element_type}};
        my $special_element_direction
         = $self->get_conf('SPECIAL_ELEMENTS_DIRECTIONS')->{$element_type};
        $self->{'special_elements_directions'}->{$special_element_direction}
           = $contents_element;
        my $target = $self->{'special_elements_targets'}->{$element_type};
        my $filename;
        if (defined($Texinfo::Config::special_element_target_file_name)) {
          ($target, $filename)
               = &$Texinfo::Config::special_element_target_file_name(
                                                          $self,
                                                          $contents_element,
                                                          $target,
                                                          $default_filename);
        }
        $filename = $default_filename if (!defined($filename));
        if ($self->get_conf('DEBUG')) {
          my $str_filename = $filename;
          $str_filename = 'UNDEF' if (not defined($str_filename));
          print STDERR "Add content $contents_element $element_type: target $target,\n".
             "    filename $str_filename\n";
        }
        $self->{'targets'}->{$contents_element} = {'target' => $target,
                                                   'special_element_filename' => $filename,
                                                   'filename' => $filename,
                                                  };
      }
    }
  }
}

# Associate tree units with the global targets, First, Last, Top, Index.
sub _prepare_tree_units_global_targets($$)
{
  my $self = shift;
  my $tree_units = shift;

  $self->{'global_target_elements_directions'}->{'First'} = $tree_units->[0];
  $self->{'global_target_elements_directions'}->{'Last'} = $tree_units->[-1];
  # It is always the first printindex, even if it is not output (for example
  # it is in @copying and @titlepage, which are certainly wrong constructs).
  if ($self->{'global_commands'} and $self->{'global_commands'}->{'printindex'}) {
    # Here root_element can only be a tree unit, or maybe undef if there
    # are no tree unit at all
    my ($root_element, $root_command)
     = $self->_html_get_tree_root_element($self->{'global_commands'}->{'printindex'}->[0]);
    if (defined($root_element)) {
      if ($root_command and $root_command->{'cmdname'} eq 'node' 
          and $root_command->{'extra'}->{'associated_section'}) {
        $root_command = $root_command->{'extra'}->{'associated_section'};
      }
      # find the first level 1 sectioning element to associate the printindex with
      if ($root_command and $root_command->{'cmdname'} ne 'node') {
        while ($root_command->{'structure'}->{'section_level'} > 1
               and $root_command->{'structure'}->{'section_up'}
               and $root_command->{'structure'}->{'section_up'}
                                        ->{'structure'}->{'associated_unit'}) {
          $root_command = $root_command->{'structure'}->{'section_up'};
          $root_element = $root_command->{'structure'}->{'associated_unit'};
        }
      }
      $self->{'global_target_elements_directions'}->{'Index'} = $root_element;
    }
  }

  my $node_top;
  $node_top = $self->{'labels'}->{'Top'} if ($self->{'labels'});
  my $section_top;
  $section_top = $self->{'global_commands'}->{'top'} if ($self->{'global_commands'});
  if ($section_top) {
    $self->{'global_target_elements_directions'}->{'Top'} = $section_top->{'structure'}->{'associated_unit'};
  } elsif ($node_top) {
    my $tree_unit_top = $node_top->{'structure'}->{'associated_unit'};
    if (!$tree_unit_top) {
      die "No parent for node_top: ".Texinfo::Common::debug_print_element($node_top);
    }
    $self->{'global_target_elements_directions'}->{'Top'} = $tree_unit_top;
  } else {
    $self->{'global_target_elements_directions'}->{'Top'} = $tree_units->[0];
  }
  
  if ($self->get_conf('DEBUG')) {
    print STDERR "GLOBAL DIRECTIONS:\n";
    foreach my $global_direction (@global_directions) {
      if (defined($self->global_element($global_direction))) {
        my $global_element = $self->global_element($global_direction);
        print STDERR "$global_direction($global_element): ".
          Texinfo::Structuring::root_or_external_element_cmd_texi($global_element)."\n";
      }
    }
  }
}

sub _prepare_index_entries($)
{
  my $self = shift;

  if ($self->{'parser'}) {
    my $no_unidecode;
    $no_unidecode = 1 if (defined($self->get_conf('USE_UNIDECODE'))
                          and !$self->get_conf('USE_UNIDECODE'));

    my $index_names = $self->{'parser'}->indices_information();
    $self->{'index_names'} = $index_names;
    my $merged_index_entries 
        = Texinfo::Structuring::merge_indices($index_names);
    my $index_entries_sort_strings;
    ($self->{'index_entries_by_letter'}, $index_entries_sort_strings)
            = Texinfo::Structuring::sort_indices($self->{'parser'}, $self,
                               $self, $merged_index_entries, 'by_letter');
    $self->{'index_entries'} = $merged_index_entries;

    foreach my $index_name (sort(keys(%$index_names))) {
      foreach my $index_entry (@{$index_names->{$index_name}->{'index_entries'}}) {
        my $region = '';
        $region = "$index_entry->{'region'}->{'cmdname'}-" 
          if (defined($index_entry->{'region'}));
        my @contents = @{$index_entry->{'content_normalized'}};
        my $trimmed_contents 
          = Texinfo::Common::trim_spaces_comment_from_content(\@contents);
        my $normalized_index =
          Texinfo::Convert::NodeNameNormalization::transliterate_texinfo(
            {'contents' => \@contents}, $no_unidecode);
        my $target_base = "index-" . $region .$normalized_index;
        my $nr=1;
        my $target = $target_base;
        while ($self->{'seen_ids'}->{$target}) {
          $target = $target_base.'-'.$nr;
          $nr++;
          # Avoid integer overflow
          die if ($nr == 0);
        }
        $self->{'seen_ids'}->{$target} = 1;
        $self->{'targets'}->{$index_entry->{'command'}} = {'target' => $target,
                                                        };
      }
    }
  }
}

sub _prepare_footnotes($)
{
  my $self = shift;

  if ($self->{'global_commands'}->{'footnote'}) {
    my $footnote_nr = 0;
    foreach my $footnote (@{$self->{'global_commands'}->{'footnote'}}) {
      $footnote_nr++;
      my $nr = $footnote_nr;
      my $footid = $footid_base.$nr;
      my $docid = $docid_base.$nr;
      while ($self->{'seen_ids'}->{$docid} or $self->{'seen_ids'}->{$footid}) {
        $nr++;
        $footid = $footid_base.$nr;
        $docid = $docid_base.$nr;
        # Avoid integer overflow
        die if ($nr == 0);
      }
      $self->{'seen_ids'}->{$footid} = 1;
      $self->{'seen_ids'}->{$docid} = 1;
      $self->{'targets'}->{$footnote} = { 'target' => $footid };
      print STDERR "Enter footnote $footnote: target $footid, nr $footnote_nr\n"
       .Texinfo::Convert::Texinfo::convert_to_texinfo($footnote)."\n"
        if ($self->get_conf('DEBUG'));
    }
  }
}

# TODO this encapsulates some information.
# The encapsulation and API should be more consistent for
# the overall module.
sub _htmlxref($$)
{
  my $self = shift;
  my $file = shift;

  return $self->{'htmlxref'}->{$file};
}

sub _external_node_href($$$$)
{
  my $self = shift;
  my $external_node = shift;
  my $filename = shift;
  my $link_command = shift;
  
  #print STDERR "external_node: ".join('|', keys(%$external_node))."\n";
  my ($target_filebase, $target)
      = $self->_normalized_label_id_file($external_node);

  my $xml_target = _normalized_to_id($target);

  my $default_target_split = $self->get_conf('EXTERNAL_CROSSREF_SPLIT');

  # FIXME it makes sense to have something different from the
  # EXTENSION, for external manuals, but it would be better to
  # be able to change it nonetheless.
  my $external_file_extension = '.html';

  my $target_split;
  my $file;
  if ($external_node->{'manual_content'}) {
    my $manual_name = Texinfo::Convert::Text::convert_to_text(
       {'contents' => $external_node->{'manual_content'}}, 
       { 'code' => 1, 
         Texinfo::Convert::Text::copy_options_for_convert_text($self)});
    my $manual_base = $manual_name;
    $manual_base =~ s/\.info*$//;
    $manual_base =~ s/^.*\///;
    my $document_split = $self->get_conf('SPLIT');
    $document_split = 'mono' if (!$document_split);
    my $split_found;
    my $href;
    my $htmlxref_info = $self->_htmlxref($manual_base);
    if ($htmlxref_info) {
      foreach my $split_ordered (@{$htmlxref_entries{$document_split}}) {
        if (defined($htmlxref_info->{$split_ordered})) {
          $split_found = $split_ordered;
          $href = $htmlxref_info->{$split_ordered};
          last;
        }
      }
    }
    if (defined($split_found)) {
      $target_split = 1 unless ($split_found eq 'mono');
    } else { # nothing specified for that manual, use default
      $target_split = $default_target_split;
      if ($self->get_conf('CHECK_HTMLXREF')) {
        if (defined($link_command) and $link_command->{'line_nr'}) {
          $self->line_warn($self, sprintf(__(
              "no htmlxref.cnf entry found for `%s'"), $manual_name),
            $link_command->{'line_nr'});
        } elsif (!$self->{'check_htmlxref_already_warned'}->{$manual_name}) {
          $self->document_warn($self, sprintf(__(
            "no htmlxref.cnf entry found for `%s'"), $manual_name),
            );
        }
        $self->{'check_htmlxref_already_warned'}->{$manual_name} = 1;
      }
    }

    if ($target_split) {
      if (defined($href)) {
        $file = $href;
      } elsif (defined($self->get_conf('EXTERNAL_DIR'))) {
        $file = $self->get_conf('EXTERNAL_DIR')."/$manual_base";
      } elsif ($self->get_conf('SPLIT')) {
        $file = "../$manual_base";
      }
      $file .= "/";
    } else {# target not split
      if (defined($href)) {
        $file = $href;
      } else {
        if (defined($self->get_conf('EXTERNAL_DIR'))) {
          $file = $self->get_conf('EXTERNAL_DIR')."/$manual_base";
        } elsif ($self->get_conf('SPLIT')) {
          $file = "../$manual_base";
        } else {
          $file = $manual_base;
        }
        $file .= $external_file_extension;
      }
    }
  } else {
    $file = '';
    $target_split = $default_target_split;
  }

  if ($target eq '') {
    if ($target_split) {
      if (defined($self->get_conf('TOP_NODE_FILE_TARGET'))) {
        return $file . $self->get_conf('TOP_NODE_FILE_TARGET');
      } else {
        return $file;# . '#Top';
      }
    } else {
      return $file . '#Top';
    }
  }

  if (! $target_split) {
    return $file . '#' . $xml_target;
  } else {
    my $file_name;
    if ($target eq 'Top' and defined($self->get_conf('TOP_NODE_FILE_TARGET'))) {
      $file_name = $self->get_conf('TOP_NODE_FILE_TARGET');
    } else {
      $file_name = $target_filebase . $external_file_extension;
    }
    return $file . $file_name . '#' . $xml_target;
  }
}

# Output a list of the nodes immediately below this one
sub _mini_toc
{
  my ($self, $command) = @_;

  my $filename = $self->{'current_filename'};
  my $result = '';
  my $entry_index = 0;
  my $accesskey;

  if ($command->{'structure'}->{'section_childs'}
      and @{$command->{'structure'}->{'section_childs'}}) {
    $result .= $self->html_attribute_class('ul', 'mini-toc').">\n";

    foreach my $section (@{$command->{'structure'}->{'section_childs'}}) {
      my $tree = $self->command_text($section, 'tree_nonumber');
      my $text = $self->_convert($tree, "mini_toc \@$section->{'cmdname'}");

      $entry_index++;
      $accesskey = '';
      $accesskey = " accesskey=\"$entry_index\"" 
        if ($self->get_conf('USE_ACCESSKEY') and $entry_index < 10);

      my $href = $self->command_href($section, $filename);
      if ($text ne '') {
        if ($href ne '') {
          my $href_attribute = '';
          if ($href ne '') {
            $href_attribute = " href=\"$href\"";
          }
          $result .= "<li><a${href_attribute}$accesskey>$text</a>";
        } else {
          $result .= "<li>$text";
        }
        $result .= "</li>\n";
      }
    }
    $result .= "</ul>\n";
  }
  return $result;
}

sub _default_format_contents($$;$$)
{
  my $self = shift;
  my $cmdname = shift;
  my $command = shift;
  my $filename = shift;
  $filename = $self->{'current_filename'} if (!defined($filename));

  return ''
   if (!$self->{'structuring'} or !$self->{'structuring'}->{'sectioning_root'});

  my $section_root = $self->{'structuring'}->{'sectioning_root'};
  my $contents;
  $contents = 1 if ($cmdname eq 'contents');

  my $min_root_level = $section_root->{'structure'}->{'section_childs'}->[0]
                                             ->{'structure'}->{'section_level'};
  my $max_root_level = $section_root->{'structure'}->{'section_childs'}->[0]
                                              ->{'structure'}->{'section_level'};
  foreach my $top_section (@{$section_root->{'structure'}->{'section_childs'}}) {
    $min_root_level = $top_section->{'structure'}->{'section_level'}
      if ($top_section->{'structure'}->{'section_level'} < $min_root_level);
    $max_root_level = $top_section->{'structure'}->{'section_level'}
      if ($top_section->{'structure'}->{'section_level'} > $max_root_level);
  }
  # chapter level elements are considered top-level here.
  $max_root_level = 1 if ($max_root_level < 1);
  #print STDERR "ROOT_LEVEL Max: $max_root_level, Min: $min_root_level\n";
  my $ul_class = '';
  $ul_class = 'toc-numbered-mark' if ($self->get_conf('NUMBER_SECTIONS'));

  my $result = '';
  if ($contents and !defined($self->get_conf('BEFORE_TOC_LINES'))
      or (!$contents and !defined($self->get_conf('BEFORE_SHORT_TOC_LINES')))) {
    $result .= $self->html_attribute_class('div', $cmdname).">\n";
  } elsif($contents) {
    $result .= $self->get_conf('BEFORE_TOC_LINES');
  } else {
    $result .= $self->get_conf('BEFORE_SHORT_TOC_LINES');
  }

  my $toplevel_contents;
  if (@{$section_root->{'structure'}->{'section_childs'}} > 1) {
    $result .= $self->html_attribute_class('ul', $ul_class) .">\n";
    $toplevel_contents = 1;
  }

  my $link_to_toc = (!$contents and $self->get_conf('SHORT_TOC_LINK_TO_TOC')
                     and ($self->get_conf('contents'))
                     and ($self->get_conf('CONTENTS_OUTPUT_LOCATION') ne 'inline'
                          or $self->_has_contents_or_shortcontents()));
  foreach my $top_section (@{$section_root->{'structure'}->{'section_childs'}}) {
    my $section = $top_section;
 SECTION:
    while ($section) {
      if ($section->{'cmdname'} ne 'top') {
        my $text = $self->command_text($section);
        my $href;
        if ($link_to_toc) {
          $href = $self->command_contents_href($section, 'contents', $filename);
        } else {
          $href = $self->command_href($section, $filename);
        }
        my $toc_id = $self->command_contents_target($section, $cmdname);
        if ($text ne '') {
          # no indenting for shortcontents
          $result .= (' ' x (2*($section->{'structure'}->{'section_level'} - $min_root_level)))
            if ($contents);
          if ($toc_id ne '' or $href ne '') {
            my $toc_name_attribute = '';
            if ($toc_id ne '') {
              $toc_name_attribute = " id=\"$toc_id\"";
            }
            my $href_attribute = '';
            if ($href ne '') {
              $href_attribute = " href=\"$href\"";
            }
            my $rel = '';
            if ($section->{'extra'}
                and $section->{'extra'}->{'associated_node'}
                and $section->{'extra'}->{'associated_node'}->{'extra'}->{'isindex'}) {
              $rel = ' rel="index"';
            }
            $result .= "<li><a${toc_name_attribute}${href_attribute}$rel>$text</a>";
          } else {
            $result .= "<li>$text";
          }
        }
      } elsif ($section->{'structure'}->{'section_childs'}
               and @{$section->{'structure'}->{'section_childs'}}
               and $toplevel_contents) {
        $result .= "<li>";
      }
      # for shortcontents don't do child if child is not toplevel
      if ($section->{'structure'}->{'section_childs'}
          and ($contents or $section->{'structure'}->{'section_level'} < $max_root_level)) {
        # no indenting for shortcontents
        $result .= "\n". ' ' x (2*($section->{'structure'}->{'section_level'} - $min_root_level))
          if ($contents);
        $result .= $self->html_attribute_class('ul', $ul_class) .">\n";
        $section = $section->{'structure'}->{'section_childs'}->[0];
      } elsif ($section->{'structure'}->{'section_next'}
               and $section->{'cmdname'} ne 'top') {
        $result .= "</li>\n";
        last if ($section eq $top_section);
        $section = $section->{'structure'}->{'section_next'};
      } else {
        #last if ($section eq $top_section);
        if ($section eq $top_section) {
          $result .= "</li>\n" unless ($section->{'cmdname'} eq 'top');
          last;
        }
        while ($section->{'structure'}->{'section_up'}) {
          $section = $section->{'structure'}->{'section_up'};
          $result .= "</li>\n". ' ' x (2*($section->{'structure'}->{'section_level'} - $min_root_level))
            . "</ul>";
          if ($section eq $top_section) {
            $result .= "</li>\n" if ($toplevel_contents);
            last SECTION;
          }
          if ($section->{'structure'}->{'section_next'}) {
            $result .= "</li>\n";
            $section = $section->{'structure'}->{'section_next'};
            last;
          }
        }
      }
    }
  }
  if (@{$section_root->{'structure'}->{'section_childs'}} > 1) {
    $result .= "\n</ul>";
  }
  if ($contents and !defined($self->get_conf('AFTER_TOC_LINES'))
      or (!$contents and !defined($self->get_conf('AFTER_SHORT_TOC_LINES')))) {
    $result .= "\n</div>\n";
  } elsif($contents) {
    $result .= $self->get_conf('AFTER_TOC_LINES');
  } else {
    $result .= $self->get_conf('AFTER_SHORT_TOC_LINES');
  }
  return $result;
}

sub _default_format_program_string($)
{
  my $self = shift;
  if (defined($self->get_conf('PROGRAM'))
      and $self->get_conf('PROGRAM') ne ''
      and defined($self->get_conf('PACKAGE_URL'))) {
    return $self->convert_tree(
      $self->gdt('This document was generated on @emph{@today{}} using @uref{{program_homepage}, @emph{{program}}}.',
         { 'program_homepage' => $self->get_conf('PACKAGE_URL'),
           'program' => $self->get_conf('PROGRAM') }));
  } else {
    return $self->convert_tree(
      $self->gdt('This document was generated on @emph{@today{}}.'));
  }
}

sub _default_format_end_file($$)
{
  my $self = shift;
  my $filename = shift;

  my $program_text = '';
  if ($self->get_conf('PROGRAM_NAME_IN_FOOTER')) {
    my $program_string = &{$self->{'format_program_string'}}($self);
    my $open = $self->html_attribute_class('span', 'program-in-footer');
    if ($open ne '') {
      $program_string = $open.'>'.$program_string.'</span>';
    }
    $program_text .= "<p>
  $program_string
</p>";
  }
  my $pre_body_close = $self->get_conf('PRE_BODY_CLOSE');
  $pre_body_close = '' if (!defined($pre_body_close));

  # jlicenses for the current element.  Note that 'jslicenses_infojs'
  # and 'jslicenses_math' will only be set with some customization variables
  my %jslicenses_element;
  for my $key (keys %{$self->{'jslicenses_infojs'}}) {
    $jslicenses_element{$key} = $self->{'jslicenses_infojs'}->{$key};
  }
 
  if ($self->get_file_information('mathjax', $filename)
      # FIXME do we really want the script element if no math was seen?
      or !$self->get_conf('SPLIT')) {
    for my $key (keys %{$self->{'jslicenses_math'}}) {
      $jslicenses_element{$key} = $self->{'jslicenses_math'}->{$key};
    }
  }
  my $js_setting = $self->get_conf('JS_WEBLABELS');
  my $js_path = $self->get_conf('JS_WEBLABELS_FILE');
  if (defined($js_setting) and defined($js_path)
        and ($js_setting eq 'generate' or $js_setting eq 'reference')
             and %jslicenses_element) {
    $pre_body_close .=
      "<a href='$js_path' rel='jslicense'><small>"
      .$self->convert_tree($self->gdt('JavaScript license information'))
      .'</small></a>';
  }

  return "${program_text}

$pre_body_close
</body>
</html>
";
}

sub _root_html_element_attributes_string($)
{
  my $self = shift;
  if (defined($self->get_conf('HTML_ROOT_ELEMENT_ATTRIBUTES'))
      and $self->get_conf('HTML_ROOT_ELEMENT_ATTRIBUTES') ne '') {
    return ' '.$self->get_conf('HTML_ROOT_ELEMENT_ATTRIBUTES');
  }
  return '';
}

# This is used for normal output files and other files, like
# redirection file headers.  $COMMAND is the tree element for
# a @node that is being output in the file.
sub _file_header_informations($$;$)
{
  my $self = shift;
  my $command = shift;
  my $filename = shift;
  
  my $title;
  if ($command) {
    my $command_string = 
      $self->command_text($command, 'string');
    if (defined($command_string) 
        and $command_string ne $self->{'title_string'}) {
      my $element_tree;
      if ($self->get_conf('SECTION_NAME_IN_TITLE')
          and $command->{'extra'}
          and $command->{'extra'}->{'associated_section'}
          and $command->{'extra'}->{'associated_section'}->{'args'}
          and $command->{'extra'}->{'associated_section'}->{'args'}->[0]) {
        $element_tree = $command->{'extra'}->{'associated_section'}->{'args'}->[0];
      } else {
        $element_tree = $self->command_text($command, 'tree');
      }
      my $title_tree = $self->gdt('{element_text} ({title})',
                   { 'title' => $self->{'title_tree'}, 
                     'element_text' => $element_tree });
      $title = $self->convert_tree_new_formatting_context(
          {'type' => '_string', 'contents' => [$title_tree]}, 
          $command->{'cmdname'}, 'element_title');
    }
  }
  $title = $self->{'title_string'} if (!defined($title));

  my $description;
  if ($self->{'documentdescription_string'}) {
    $description = $self->{'documentdescription_string'};
  } else {
    $description = $title;
  }
  $description = $self->close_html_lone_element(
    "<meta name=\"description\" content=\"$description\"" )
      if ($description ne '');
  my $encoding = '';
  $encoding 
     = $self->close_html_lone_element(
        "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=".
          $self->get_conf('OUTPUT_ENCODING_NAME')."\"" )
    if (defined($self->get_conf('OUTPUT_ENCODING_NAME')) 
        and ($self->get_conf('OUTPUT_ENCODING_NAME') ne ''));

  my $date = '';
  if ($self->get_conf('DATE_IN_HEADER')) {
    my $today = $self->convert_tree_new_formatting_context(
            {'cmdname' => 'today'}, 'DATE_IN_HEADER');
    $date =
      $self->close_html_lone_element(
        "<meta name=\"date\" content=\"$today\"")."\n";
  }

  my $css_lines = &{$self->{'format_css_lines'}}($self, $filename);

  my $doctype = $self->get_conf('DOCTYPE');
  my $root_html_element_attributes = $self->_root_html_element_attributes_string();
  my $bodytext = $self->get_conf('BODYTEXT');
  if ($self->get_conf('HTML_MATH') and $self->get_conf('HTML_MATH') eq 'mathjax'
      and $self->get_file_information('mathjax', $filename)) {
    $bodytext .= ' class="tex2jax_ignore"';
  }
  my $copying_comment = '';
  $copying_comment = $self->{'copying_comment'} 
    if (defined($self->{'copying_comment'}));
  my $after_body_open = '';
  $after_body_open = $self->get_conf('AFTER_BODY_OPEN')
    if (defined($self->get_conf('AFTER_BODY_OPEN')));
  my $extra_head = '';
  $extra_head = $self->get_conf('EXTRA_HEAD')
    if (defined($self->get_conf('EXTRA_HEAD')));
  my $program_and_version = $self->get_conf('PACKAGE_AND_VERSION');
  my $program_homepage = $self->get_conf('PACKAGE_URL');
  my $program = $self->get_conf('PROGRAM');
  my $generator = '';
  if (defined($program) and $program ne '') {
    $generator =
      $self->close_html_lone_element(
        "<meta name=\"Generator\" content=\"$program\"") . "\n";
  }

  if (defined($self->get_conf('INFO_JS_DIR'))) {
    if (!$self->get_conf('SPLIT')) {
      $self->document_error($self, 
        sprintf(__("%s not meaningful for non-split output"),
                   'INFO_JS_DIR'));
    } else {
      my $jsdir = $self->get_conf('INFO_JS_DIR');
      if ($jsdir eq '.') {
        $jsdir = '';
      } else {
        $jsdir =~ s,/*$,/,; # append a single slash
      }

      $extra_head .= $self->close_html_lone_element(
        '<link rel="stylesheet" type="text/css" href="'.$jsdir.'info.css"')."\n".
'<script src="'.$jsdir.'modernizr.js" type="text/javascript"></script>
<script src="'.$jsdir.'info.js" type="text/javascript"></script>';
    }
  }
  if ((defined($self->get_conf('HTML_MATH'))
       and $self->get_conf('HTML_MATH') eq 'mathjax')
      and ($self->get_file_information('mathjax', $filename)
            # FIXME do we really want the script element if no math was seen?
            or !$self->get_conf('SPLIT'))) {
    my $mathjax_script = $self->get_conf('MATHJAX_SCRIPT');

    $extra_head .=
"<script type='text/javascript'>
MathJax = {
  options: {
    skipHtmlTags: {'[-]': ['pre']},
    ignoreHtmlClass: 'tex2jax_ignore',
    processHtmlClass: 'tex2jax_process'
  },
};
</script>"
.'<script type="text/javascript" id="MathJax-script" async
  src="'.$mathjax_script.'">
</script>';

  }

  return ($title, $description, $encoding, $date, $css_lines, 
          $doctype, $root_html_element_attributes, $bodytext, $copying_comment,
          $after_body_open, $extra_head, $program_and_version, $program_homepage,
          $program, $generator);
}

sub _get_links ($$$)
{
  my $self = shift;
  my $filename = shift;
  my $element = shift;

  my $links = '';
  if ($self->get_conf('USE_LINKS')) {
    my $link_buttons = $self->get_conf('LINKS_BUTTONS');
    foreach my $link (@$link_buttons) {
      my $link_href = $self->from_element_direction($element,
                                          $link, 'href', $filename);
      #print STDERR "$link -> $link_href \n";
      if ($link_href and $link_href ne '') {
        my $link_string = $self->from_element_direction($element,
                                          $link, 'string');
        my $link_title = '';
        $link_title = " title=\"$link_string\"" if (defined($link_string));
        my $rel = '';
        $rel = " rel=\"".$self->get_conf('BUTTONS_REL')->{$link}.'"' 
           if (defined($self->get_conf('BUTTONS_REL')->{$link}));
        $links .= $self->close_html_lone_element(
                    "<link href=\"$link_href\"${rel}${link_title}")."\n";
      }
    }
  }
  return $links;
}

sub _default_format_begin_file($$$)
{
  my $self = shift;
  my $filename = shift;
  my $element = shift;
  
  my $command;
  if ($element and $self->get_conf('SPLIT')) {
    $command = $self->element_command($element);
  }

  my ($title, $description, $encoding, $date, $css_lines, 
          $doctype, $root_html_element_attributes, $bodytext, $copying_comment,
          $after_body_open, $extra_head, $program_and_version, $program_homepage,
          $program, $generator) = $self->_file_header_informations($command, $filename);

  my $links = $self->_get_links ($filename, $element);

  my $result = "$doctype
<html${root_html_element_attributes}>
<!-- Created by $program_and_version, $program_homepage -->
<head>
$encoding
$copying_comment<title>$title</title>

$description\n".
    $self->close_html_lone_element(
      "<meta name=\"keywords\" content=\"$title\"")."\n".
    $self->close_html_lone_element(
      "<meta name=\"resource-type\" content=\"document\"")."\n".
     $self->close_html_lone_element(
      "<meta name=\"distribution\" content=\"global\"") . "\n" .
    ${generator} . ${date} .
    $self->close_html_lone_element(
      "<meta name=\"viewport\" content=\"width=device-width,initial-scale=1\"")."\n".
"
${links}$css_lines
$extra_head
</head>

<body $bodytext>
$after_body_open";

  return $result;
}

sub _default_format_node_redirection_page($$)
{
  my $self = shift;
  my $command = shift;

  my ($title, $description, $encoding, $date, $css_lines,
          $doctype, $root_html_element_attributes, $bodytext, $copying_comment,
          $after_body_open, $extra_head, $program_and_version, $program_homepage,
          $program, $generator) = $self->_file_header_informations($command);

  my $name = $self->command_text($command);
  my $href = $self->command_href($command);
  my $direction = "<a href=\"$href\">$name</a>";
  my $string = $self->convert_tree(
    $self->gdt('The node you are looking for is at {href}.',
      { 'href' => {'type' => '_converted', 'text' => $direction }}));
  my $result = "$doctype
<html${root_html_element_attributes}>
<!-- Created by $program_and_version, $program_homepage -->
<!-- This file redirects to the location of a node or anchor -->
<head>
$encoding
$copying_comment<title>$title</title>

$description\n".
   $self->close_html_lone_element(
     "<meta name=\"keywords\" content=\"$title\"")."\n".
   $self->close_html_lone_element(
     "<meta name=\"resource-type\" content=\"document\"")."\n".
   $self->close_html_lone_element(
     "<meta name=\"distribution\" content=\"global\"") . "\n" .
   ${generator} . ${date} . "$css_lines\n".
   $self->close_html_lone_element(
     "<meta http-equiv=\"Refresh\" content=\"0; url=$href\"")."\n".
   $self->close_html_lone_element(
     "<meta name=\"viewport\" content=\"width=device-width,initial-scale=1\"")."\n".
"$extra_head
</head>

<body $bodytext>
$after_body_open
<p>$string</p>
</body>
";
  return $result;
}

sub _default_format_footnotes_text($)
{
  my $self = shift;
  return '' if (!$foot_lines);
  my $result = $self->html_attribute_class('div', 'footnote').">\n";
  $result .= $self->get_conf('DEFAULT_RULE') . "\n" 
     if (defined($self->get_conf('DEFAULT_RULE')) 
         and $self->get_conf('DEFAULT_RULE') ne '');
  my $footnote_heading 
    = $self->convert_tree($self->get_conf('SPECIAL_ELEMENTS_HEADING')->{'footnotes'},
                          'convert footnotes special heading');
  my $class = $self->get_conf('SPECIAL_ELEMENTS_CLASS')->{'footnotes'};
  my $level = $self->get_conf('FOOTNOTE_END_HEADER_LEVEL');
  $result .= &{$self->{'format_heading_text'}}($self, undef, $class.'-heading',
                                        $footnote_heading, $level)."\n";
  $result .= &{$self->{'format_special_element_body'}}($self, 'footnotes',
                                              $self->{'current_root_element'});
  $result .= "</div>\n";
  return $result;
}

sub _default_format_special_element_body($$$)
{
  my $self = shift;
  my $special_type = shift;
  my $element = shift;

  if ($special_type eq 'about') {
    my $about = "<p>\n";
    my $PRE_ABOUT = $self->get_conf('PRE_ABOUT');
    if (defined($PRE_ABOUT)) {
      if (ref($PRE_ABOUT) eq 'CODE') {
        $about .= &$PRE_ABOUT($self, $element);
      } else {
        $about .= $PRE_ABOUT;
      }
    } else {
      $about .= '  '.&{$self->{'format_program_string'}}($self) ."\n";
    }
    $about .= <<EOT;
</p>
<p>
EOT
    $about .= $self->convert_tree($self->gdt('  The buttons in the navigation panels have the following meaning:')) . "\n";
    $about .= <<EOT;
</p>
<table border="1">
  <tr>
EOT
    $about .= '    <th> ' . $self->convert_tree($self->gdt('Button')) . " </th>\n" .
     '    <th> ' . $self->convert_tree($self->gdt('Name')) . " </th>\n" .
     '    <th> ' . $self->convert_tree($self->gdt('Go to')) . " </th>\n" .
     '    <th> ' . $self->convert_tree($self->gdt('From 1.2.3 go to')) . "</th>\n" . "  </tr>\n";

    foreach my $button (@{$self->get_conf('SECTION_BUTTONS')}) {
      next if ($button eq ' ' or ref($button) eq 'CODE' or ref($button) eq 'SCALAR' 
                or ref($button) eq 'ARRAY');
      my $button_name = $self->get_conf('BUTTONS_NAME')->{$button};
      $about .= "  <tr>\n    <td align=\"center\">";
      $about .=
            ($self->get_conf('ICONS') && $self->get_conf('ACTIVE_ICONS')->{$button} ?
             &{$self->{'format_button_icon_img'}}($self, $button_name, 
                                       $self->get_conf('ACTIVE_ICONS')->{$button}) :
             ' [' . $self->get_conf('BUTTONS_TEXT')->{$button} . '] ');
      $about .= "</td>\n";
      $about .= 
"    <td align=\"center\">".$button_name."</td>
    <td>".$self->get_conf('BUTTONS_GOTO')->{$button}."</td>
    <td>".$self->substitute_html_non_breaking_space(
               $self->get_conf('BUTTONS_EXAMPLE')->{$button})."</td>
  </tr>
";
    }

    $about .= <<EOT;
</table>

<p>
EOT
    $about .= $self->convert_tree($self->gdt('  where the @strong{ Example } assumes that the current position is at @strong{ Subsubsection One-Two-Three } of a document of the following structure:')) . "\n";

#  where the <strong> Example </strong> assumes that the current position
#  is at <strong> Subsubsection One-Two-Three </strong> of a document of
#  the following structure:
    $about .= <<EOT;
</p>

<ul>
EOT
    my $non_breaking_space = $self->html_non_breaking_space();
    $about .= '  <li> 1. ' . $self->convert_tree($self->gdt('Section One')) . "\n" .
"    <ul>\n" .
'      <li>1.1 ' . $self->convert_tree($self->gdt('Subsection One-One')) . "\n";
    $about .= <<EOT;
        <ul>
          <li>...</li>
        </ul>
      </li>
EOT
    $about .= '      <li>1.2 ' . $self->convert_tree($self->gdt('Subsection One-Two')) . "\n" .
"        <ul>\n" .
'          <li>1.2.1 ' . $self->convert_tree($self->gdt('Subsubsection One-Two-One')) . "</li>\n" .
'          <li>1.2.2 ' . $self->convert_tree($self->gdt('Subsubsection One-Two-Two')) . "</li>\n" .
'          <li>1.2.3 ' . $self->convert_tree($self->gdt('Subsubsection One-Two-Three'))
                  . " $non_breaking_space $non_breaking_space\n"
.
'            <strong>&lt;== ' . $self->convert_tree($self->gdt('Current Position')) . " </strong></li>\n" .
'          <li>1.2.4 ' . $self->convert_tree($self->gdt('Subsubsection One-Two-Four')) . "</li>\n" .
"        </ul>\n" .
"      </li>\n" .
'      <li>1.3 ' . $self->convert_tree($self->gdt('Subsection One-Three')) . "\n";
    $about .= <<EOT;
        <ul>
          <li>...</li>
        </ul>
      </li>
EOT
    $about .= '      <li>1.4 ' . $self->convert_tree($self->gdt('Subsection One-Four')) . "</li>\n";

    my $AFTER_ABOUT = '';
    if (defined($self->get_conf('AFTER_ABOUT'))) {
      $AFTER_ABOUT = $self->get_conf('AFTER_ABOUT');
    }
    $about .= <<EOT;
    </ul>
  </li>
</ul>
$AFTER_ABOUT
EOT
    return $about;
  } elsif ($special_type eq 'contents') {
    return &{$self->{'format_contents'}}($self, 'contents', undef);
  } elsif ($special_type eq 'shortcontents') {
    return &{$self->{'format_contents'}}($self, 'shortcontents', undef);
  } elsif ($special_type eq 'footnotes') {
    my $result = $foot_lines;
    $foot_lines = '';
    return $result;
  }
}

sub _do_jslicenses_file {
  my $self = shift;
  my $destination_directory = shift;

  my $setting = $self->get_conf('JS_WEBLABELS');
  my $path = $self->get_conf('JS_WEBLABELS_FILE');

  # Possible settings:
  #   'generate' - create file at JS_WEBLABELS_FILE
  #   'reference' - reference file at JS_WEBLABELS_FILE but do not create it
  #   'omit' - do nothing
  return if (!$setting or $setting ne 'generate');

  my $doctype = $self->get_conf('DOCTYPE');
  my $root_html_element_attributes = $self->_root_html_element_attributes_string();
  my $a = $doctype . "\n" .
"<html${root_html_element_attributes}>".'<head><title>jslicense labels</title></head>
<body>
<table id="jslicense-labels1">
';
  my $h = $self->{'jslicenses'};

  for my $file (sort(keys %{$self->{'jslicenses'}})) {
    $a .= "<tr>\n";
    $a .= "<td><a href=\"$file\">$file</a></td>\n";
    $a .= "<td><a href=\"$h->{$file}->[1]\">$h->{$file}->[0]</a></td>\n";
    $a .= "<td><a href=\"$h->{$file}->[2]\">$h->{$file}->[2]</a></td>\n";
    $a .= "</tr>\n";
  }

  $a .= "</table>\n</body></html>\n";

  if (File::Spec->file_name_is_absolute($path) or $path =~ /^[A-Za-z]*:/) {
    $self->document_warn($self, sprintf(
__("cannot use absolute path or URL `%s' for JS_WEBLABELS_FILE when generating web labels file"), $path));
    return;
  }
  my $license_file = File::Spec->catdir($destination_directory,
                                        $path);
  my $fh = Texinfo::Common::output_files_open_out(
                 $self->output_files_information(), $self, $license_file);
  if (defined($fh)) {
    print $fh $a;
    Texinfo::Common::output_files_register_closed(
                  $self->output_files_information(), $license_file);
    if (!close ($fh)) {
      $self->document_error($self,
               sprintf(__("error on closing %s: %s"),
                                    $license_file, $!));
    }
  } else {
    $self->document_error($self,
           sprintf(__("could not open %s for writing: %s"),
                                  $license_file, $!));
  }
}

# FIXME the file opening should be done in main program, only
# the formatting should be done in customization function.  Frames
# are deprecated in HTML, however, and therefore there is no point
# in investing time in better code to produce them.
sub _default_format_frame_files($$)
{
  my $self = shift;
  my $destination_directory = shift;

  my $frame_file = $self->{'frame_pages_filenames'}->{'Frame'};
  my $frame_outfile;
  if (defined($destination_directory) and $destination_directory ne '') {
    $frame_outfile = File::Spec->catfile($destination_directory,
                                         $frame_file);
  } else {
    $frame_outfile = $frame_file;
  }
  
  my $toc_frame_file = $self->{'frame_pages_filenames'}->{'Toc_Frame'};
  my $toc_frame_outfile;
  if (defined($destination_directory) and $destination_directory ne '') {
    $toc_frame_outfile = File::Spec->catfile($destination_directory,
                                             $toc_frame_file);
  } else {
    $toc_frame_outfile = $toc_frame_file;
  }
  
  my $frame_fh = Texinfo::Common::output_files_open_out(
                     $self->output_files_information(), $self, $frame_outfile);
  if (defined($frame_fh)) {
    my $doctype = $self->get_conf('FRAMESET_DOCTYPE');
    my $root_html_element_attributes = $self->_root_html_element_attributes_string();
    my $top_file = '';
    if ($self->global_element('Top')) {
      my $top_element = $self->global_element('Top');
      $top_file = $top_element->{'structure'}->{'unit_filename'};
    }
    my $title = $self->{'title_string'};
    print $frame_fh <<EOT;
$doctype
<html${root_html_element_attributes}>
<head><title>$title</title></head>
<frameset cols="140,*">
  <frame name="toc" src="$toc_frame_file">
  <frame name="main" src="$top_file">
</frameset>
</html>
EOT

    Texinfo::Common::output_files_register_closed(
                  $self->output_files_information(), $frame_outfile);
    if (!close ($frame_fh)) {
      $self->document_error($self,
          sprintf(__("error on closing frame file %s: %s"),
                                    $frame_outfile, $!));
      return 0;
    }
  } else {
    $self->document_error($self,
           sprintf(__("could not open %s for writing: %s"),
                                  $frame_outfile, $!));
    return 0;
  }

  my $toc_frame_fh = Texinfo::Common::output_files_open_out(
                      $self->output_files_information(), $self, $toc_frame_outfile);
  if (defined($toc_frame_fh)) {

    # this is needed to collect CSS rules.
    $self->{'current_filename'} = $toc_frame_file;
    my $shortcontents = 
      &{$self->{'format_contents'}}($self, 'shortcontents', undef);
    $shortcontents =~ s/\bhref=/target="main" href=/g;
    my $header = &{$self->{'format_begin_file'}}($self, $toc_frame_file, undef);
    print $toc_frame_fh $header;
    print $toc_frame_fh '<h2>Content</h2>'."\n";
    print $toc_frame_fh $shortcontents;
    print $toc_frame_fh "</body></html>\n";

    $self->{'current_filename'} = undef;

    Texinfo::Common::output_files_register_closed(
                  $self->output_files_information(), $toc_frame_outfile);
    if (!close ($toc_frame_fh)) {
      $self->document_error($self,
            sprintf(__("error on closing TOC frame file %s: %s"),
                                    $toc_frame_outfile, $!));
      return 0;
    }
  } else {
    $self->document_error($self,
           sprintf(__("could not open %s for writing: %s"),
                                  $toc_frame_outfile, $!));
    return 0;
  }
  return 1;
}

sub _has_contents_or_shortcontents($)
{
  my $self = shift;
  foreach my $cmdname ('contents', 'shortcontents') {
    if ($self->{'global_commands'} and $self->{'global_commands'}->{$cmdname}) {
      return 1;
    }
  }
  return 0;
}

sub convert($$)
{
  my $self = shift;
  my $root = shift;

  my $result = '';

  # This should return undef if called on a tree without node or sections.
  #
  # FIXME the document_name and destination_directory arguments are undef.
  # If a converter is reused, it could be possible to set before and reuse
  # here something like $self->{'document_name'}
  # but it is unclear if it is correct or not.
  my ($tree_units, $special_elements)
    = $self->_prepare_conversion_tree_units($root, undef, undef);

  $self->_prepare_index_entries();
  $self->_prepare_footnotes();

  if (!defined($tree_units)) {
    print STDERR "\nC NO UNIT\n" if ($self->get_conf('DEBUG'));
    $result = $self->_convert($root, 'convert no unit');
    $result .= &{$self->{'format_footnotes_text'}}($self);
  } else {
    my $unit_nr = 0;
    # TODO there is no rule before the footnotes special element in
    # case of separate footnotes in the default formatting style.
    # Not sure if it is an issue.
    foreach my $tree_unit (@$tree_units, @$special_elements) {
      print STDERR "\nC UNIT $unit_nr\n" if ($self->get_conf('DEBUG'));
      my $tree_unit_text = $self->_convert($tree_unit, "convert unit $unit_nr");
      $result .= $tree_unit_text;
      $unit_nr++;
    }
  }

  return $result;
}

# This is called from the main program on the converter.
sub output_internal_links($)
{
  my $self = shift;
  my $out_string = '';
  if ($self->{'tree_units'}) {
    foreach my $tree_unit (@{$self->{'tree_units'}}) {
      my $text;
      my $href;
      my $command = $self->element_command($tree_unit);
      if (defined($command)) {
        # Use '' for filename, to force a filename in href.
        $href = $self->command_href($command, '');
        my $tree = $self->command_text($command, 'tree');
        if ($tree) {
          $text = Texinfo::Convert::Text::convert_to_text($tree, 
               {Texinfo::Convert::Text::copy_options_for_convert_text($self)});
        }
      }
      if (defined($href) or defined($text)) {
        $out_string .= $href if (defined($href));
        $out_string .= "\ttoc\t";
        $out_string .= $text if (defined($text));
        $out_string .= "\n";
      }
    }
  }
  if ($self->{'parser'}) {
    my %options = Texinfo::Convert::Text::copy_options_for_convert_text($self);
    foreach my $index_name (sort(keys (%{$self->{'index_entries_by_letter'}}))) {
      foreach my $letter_entry (@{$self->{'index_entries_by_letter'}->{$index_name}}) {
        foreach my $index_entry (@{$letter_entry->{'entries'}}) {
          my $href;
          $href = $self->command_href($index_entry->{'command'}, '');
          # Obtain term by converting to text
          my $converter_options = {%options};
          $converter_options->{'code'} = $index_entry->{'in_code'};
          my $index_term = Texinfo::Convert::Text::convert_to_text(
               {'contents' => $index_entry->{'content'}}, $converter_options);
          if (defined($index_term) and $index_term =~ /\S/) {
            $out_string .= $href if (defined($href));
            $out_string .= "\t$index_name\t";
            $out_string .= $index_term;
            $out_string .= "\n";
          }
        }
      }
    }
  }
  if ($out_string ne '') {
    return $out_string;
  } else {
    return undef;
  }
}

sub run_stage_handlers($$$)
{
  my $converter = shift;
  my $root = shift;
  my $stage = shift;

  my $stage_handlers = Texinfo::Config::GNUT_get_stage_handlers();
  return 1 if (!defined($stage_handlers->{$stage}));

  my @sorted_priorities = sort keys(%{$stage_handlers->{$stage}});
  foreach my $priority (@sorted_priorities) {
    foreach my $handler (@{$stage_handlers->{$stage}->{$priority}}) {
      if ($converter->get_conf('DEBUG')) {
        print STDERR "HANDLER($stage) , priority $priority: $handler\n";
      }
      my $status = &{$handler}($converter, $root, $stage);
      if (!$status) {
        #if ($converter->get_conf('VERBOSE')) {
        #  print STDERR "Handler $handler of $stage($priority) failed\n";
        #}
        $converter->document_error($converter,
             sprintf(__("handler %s of stage %s priority %s failed"),
                        $handler, $stage, $priority));
        return $status;
      }
    }
  }
  return 1;
}

# Main function for outputting a manual in HTML.
# $SELF is the output converter object of class Texinfo::Convert::HTML (this 
# module), and $ROOT is the Texinfo tree from the parser.
sub output($$)
{
  my $self = shift;
  my $root = shift;

  # no splitting when writing to the null device or to stdout or returning
  # a string
  if (defined($self->get_conf('OUTFILE'))
      and ($Texinfo::Common::null_device_file{$self->get_conf('OUTFILE')}
           or $self->get_conf('OUTFILE') eq '-'
           or $self->get_conf('OUTFILE') eq '')) {
    $self->force_conf('SPLIT', 0);
    $self->force_conf('MONOLITHIC', 1);
    $self->force_conf('FRAMES', 0);
  }
  if ($self->get_conf('SPLIT')) {
    $self->set_conf('NODE_FILES', 1);
  }
  if ($self->get_conf('FRAMES')) {
    $self->set_conf('shortcontents', 1);
  }
  $self->set_conf('EXTERNAL_CROSSREF_SPLIT', $self->get_conf('SPLIT'));

  if ($self->get_conf('HTML_MATH')
        and $self->get_conf('HTML_MATH') eq 'mathjax') {
    # See https://www.gnu.org/licenses/javascript-labels.html
    #
    # The link to the source for mathjax does not strictly follow the advice
    # there: instead we link to instructions for obtaining the full source in
    # its preferred form of modification.
 
    my $mathjax_script = $self->get_conf('MATHJAX_SCRIPT');
    if (! defined($mathjax_script)) {
      $mathjax_script = 'https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-svg.js';
      $self->set_conf('MATHJAX_SCRIPT', $mathjax_script);
    }

    my $mathjax_source = $self->get_conf('MATHJAX_SOURCE');
    if (! defined($mathjax_source)) {
      $mathjax_source = 'http://docs.mathjax.org/en/latest/web/hosting.html#getting-mathjax-via-git';
      $self->set_conf('MATHJAX_SOURCE', $mathjax_source);
    }
  }

  # the configuration has potentially been modified for
  # this output file especially.  Set a corresponding initial
  # configuration.
  $self->{'output_init_conf'} = { %{$self->{'conf'}} };

  my $setup_status = $self->run_stage_handlers($root, 'setup');
  return undef unless($setup_status);

  $self->_prepare_css();

  # this sets OUTFILE, to be used if not split, but also
  # 'destination_directory' and 'output_filename' that are useful when split.
  my ($output_file, $destination_directory, $output_filename,
              $document_name) = $self->determine_files_and_directory();
  my ($succeeded, $created_directory)
    = $self->create_destination_directory($destination_directory);
  return undef unless $succeeded;

  # set for init files
  # FIXME use an api
  $self->{'document_name'} = $document_name;
  $self->{'destination_directory'} = $created_directory;

  # Get the list of "elements" to be processed, i.e. nodes or sections.
  # This should return undef if called on a tree without node or sections.
  my ($tree_units, $special_elements)
    = $self->_prepare_conversion_tree_units($root, $destination_directory, $document_name);

  Texinfo::Structuring::split_pages($tree_units, $self->get_conf('SPLIT'));

  # determine file names associated with the different pages, and setup
  # the counters for special element pages.
  if ($output_file ne '') {
    $self->_html_set_pages_files($tree_units, $special_elements, $output_file,
                  $destination_directory, $output_filename, $document_name);
  }

  $self->_prepare_contents_elements();

  # do tree units directions.
  Texinfo::Structuring::elements_directions($self, $self->{'labels'}, $tree_units);

  # do element directions related to files.
  # FIXME do it here or before?  Here it means that
  # PrevFile and NextFile can be set.
  Texinfo::Structuring::elements_file_directions($tree_units);

  # Associate the special elements that have no page with the main page.
  # This may only happen if not split.
  if ($special_elements
      and $tree_units and $tree_units->[0]
      and defined($tree_units->[0]->{'structure'}->{'unit_filename'})) {
    foreach my $special_element (@$special_elements) {
      if (!defined($special_element->{'structure'}->{'unit_filename'})) {
        $special_element->{'structure'}->{'unit_filename'}
           = $tree_units->[0]->{'structure'}->{'unit_filename'};
        $self->{'file_counters'}->{$special_element->{'structure'}->{'unit_filename'}}++;
      }
    }
  }

  $self->_prepare_index_entries();
  $self->_prepare_footnotes();
  
  # 'file_counters' is dynamic, decreased when the element is encountered
  # 'elements_in_file_count' is not modified afterwards
  foreach my $filename (keys(%{$self->{'file_counters'}})) {
    $self->{'elements_in_file_count'}->{$filename} = $self->{'file_counters'}->{$filename};
  }

  my $structure_status = $self->run_stage_handlers($root, 'structure');
  return undef unless($structure_status);

  my $default_document_language = $self->get_conf('documentlanguage');

  $self->set_global_document_commands('preamble', ['documentlanguage']);

  my $preamble_document_language = $self->get_conf('documentlanguage');
  $self->set_conf('BODYTEXT',
                  'lang="' . $preamble_document_language . '"');

  if ($default_document_language ne $preamble_document_language) {
    $self->_translate_names();
  }

  # prepare title.  fulltitle uses more possibility than simpletitle for
  # title, including @-commands found in @titlepage only.  Therefore
  # simpletitle is more in line with what makeinfo in C does.
  my $fulltitle;
  foreach my $fulltitle_command('settitle', 'title', 
     'shorttitlepage', 'top') {
    if ($self->{'global_commands'}->{$fulltitle_command}) {
      my $command = $self->{'global_commands'}->{$fulltitle_command};
      next if (!$command->{'args'}
               or (!$command->{'args'}->[0]->{'contents'}
                   or $command->{'extra'}->{'missing_argument'}));
      print STDERR "Using $fulltitle_command as title\n"
        if ($self->get_conf('DEBUG'));
      $fulltitle = {'contents' => $command->{'args'}->[0]->{'contents'}};
      last;
    }
  }
  if (!$fulltitle and $self->{'global_commands'}->{'titlefont'}
      and $self->{'global_commands'}->{'titlefont'}->[0]->{'args'}
      and defined($self->{'global_commands'}->{'titlefont'}->[0]->{'args'}->[0])
      and @{$self->{'global_commands'}->{'titlefont'}->[0]->{'args'}->[0]->{'contents'}}) {
    $fulltitle = $self->{'global_commands'}->{'titlefont'}->[0];
  }
  # prepare simpletitle
  foreach my $simpletitle_command ('settitle', 'shorttitlepage') {
    if ($self->{'global_commands'}->{$simpletitle_command}) {
      my $command = $self->{'global_commands'}->{$simpletitle_command};
      next if ($command->{'extra'} 
               and $command->{'extra'}->{'missing_argument'});
      $self->{'simpletitle_tree'} = 
         {'contents' => $command->{'args'}->[0]->{'contents'}};
      $self->{'simpletitle_command_name'} = $simpletitle_command;
      last;
    }
  }

  my $html_title_string;
  if ($fulltitle) {
    $self->{'title_tree'} = $fulltitle;
    $html_title_string = $self->convert_tree_new_formatting_context(
          {'type' => '_string', 'contents' => [$self->{'title_tree'}]}, 
          'title_string');
  }
  if (!defined($html_title_string) or $html_title_string !~ /\S/) {
    my $default_title = $self->gdt('Untitled Document');
    $self->{'title_tree'} = $default_title;
    $self->{'title_string'} = $self->convert_tree_new_formatting_context(
          {'type' => '_string', 'contents' => [$self->{'title_tree'}]}, 
          'title_string');
    $self->file_line_warn(__(
                         "must specify a title with a title command or \@top"),
                         $self->{'parser_info'}->{'input_file_name'});
  } else {
    $self->{'title_string'} = $html_title_string;
  }

  # copying comment
  if ($self->{'global_commands'}->{'copying'}) {
    my $copying_comment = Texinfo::Convert::Text::convert_to_text(
     {'contents' => $self->{'global_commands'}->{'copying'}->{'contents'}},
     {Texinfo::Convert::Text::copy_options_for_convert_text($self)});
    if ($copying_comment ne '') {
      $self->{'copying_comment'}
        = &{$self->{'format_comment'}}($self, $copying_comment);
    }
  }
  $self->set_global_document_commands('before', ['documentlanguage']);

  if ($default_document_language ne $preamble_document_language) {
    $self->_translate_names();
  }

  # documentdescription
  if (defined($self->get_conf('documentdescription'))) {
    $self->{'documentdescription_string'} 
      = $self->get_conf('documentdescription');
  } elsif ($self->{'global_commands'}->{'documentdescription'}) {
    $self->{'documentdescription_string'} 
      = $self->convert_tree_new_formatting_context(
       {'type' => '_string',
        'contents' =>
            $self->{'global_commands'}->{'documentdescription'}->{'contents'}},
       'documentdescription');
    chomp($self->{'documentdescription_string'});
  }

  my $init_status = $self->run_stage_handlers($root, 'init');
  return undef unless($init_status);

  if ($self->get_conf('FRAMES')) {
    my $status = &{$self->{'format_frame_files'}}($self, $created_directory);
    return undef if (!$status);
  }

  if ($self->get_conf('HTML_MATH')
        and $self->get_conf('HTML_MATH') eq 'mathjax') {
    # See https://www.gnu.org/licenses/javascript-labels.html

    my $mathjax_script = $self->get_conf('MATHJAX_SCRIPT');
    my $mathjax_source = $self->get_conf('MATHJAX_SOURCE');

    $self->{'jslicenses_math'}->{$mathjax_script} =
        [ 'Apache License, Version 2.0.',
          'https://www.apache.org/licenses/LICENSE-2.0',
          $mathjax_source ];
    # append to hash
    %{$self->{'jslicenses'}} = ( %{$self->{'jslicenses'}},
                                 %{$self->{'jslicenses_math'}} );

  }
  if ($self->get_conf('INFO_JS_DIR')) {
    $self->{'jslicenses_infojs'}->{'js/info.js'} =
      [ 'GNU General Public License 3.0 or later',
        'http://www.gnu.org/licenses/gpl-3.0.html',
        'js/info.js' ];

    $self->{'jslicenses_infojs'}->{'js/modernizr.js'} =
      [ 'Expat',
        'http://www.jclark.com/xml/copying.txt',
        'js/modernizr.js' ];
    %{$self->{'jslicenses'}} = ( %{$self->{'jslicenses'}},
                                 %{$self->{'jslicenses_infojs'}} );
  }

  my $fh;
  my $output = '';

  if (!$tree_units
      or !defined($tree_units->[0]->{'structure'}->{'unit_filename'})) {
    # no page
    my $no_page_out_filepath;
    if ($output_file ne '') {
      my $no_page_output_filename;
      if ($self->get_conf('SPLIT')) {
        $no_page_output_filename = $self->top_node_filename($document_name);
        if (defined($created_directory) and $created_directory ne '') {
          $no_page_out_filepath = File::Spec->catfile($created_directory,
                                                    $no_page_output_filename);
        } else {
          $no_page_out_filepath = $no_page_output_filename;
        }
      } else {
        $no_page_out_filepath = $output_file;
        $no_page_output_filename = $output_filename;
      }
      $fh = Texinfo::Common::output_files_open_out(
              $self->output_files_information(), $self, $no_page_out_filepath);
      if (!$fh) {
        $self->document_error($self,
              sprintf(__("could not open %s for writing: %s"),
                                      $no_page_out_filepath, $!));
        return undef;
      }
      # this can be used in init file when there are no tree units.
      # FIXME use an API?  Set in $self->{'no_page'}?
      $self->{'structure'}->{'unit_filename'} = $no_page_output_filename;
      $self->{'out_filepaths'}->{$no_page_output_filename} = $no_page_out_filepath;

      $self->{'current_filename'} = $no_page_output_filename;
    } else {
      $self->{'current_filename'} = $output_filename;
    }
    my $body = '';
    if ($tree_units and @$tree_units) {
      my $unit_nr = 0;
      # TODO there is no rule before the footnotes special element in
      # case of separate footnotes in the default formatting style.
      # Not sure if it is an issue.
      foreach my $tree_unit (@$tree_units, @$special_elements) {
        print STDERR "\nUNIT NO-PAGE $unit_nr\n" if ($self->get_conf('DEBUG'));
        my $tree_unit_text = $self->_convert($tree_unit, "no-page output unit $unit_nr");
        $body .= $tree_unit_text;
        $unit_nr++;
      }
    } else {
      $body .= $self->_print_title();
      print STDERR "\nNO UNIT NO PAGE\n" if ($self->get_conf('DEBUG'));
      $body .= $self->_convert($root, 'no-page output no unit');
      $body .= &{$self->{'format_footnotes_text'}}($self);
    }

    # do end file first, in case it needs some CSS
    my $footer = &{$self->{'format_end_file'}}($self, $output_filename);
    my $header = &{$self->{'format_begin_file'}}($self, $output_filename, undef);
    $output .= $self->write_or_return($header, $fh);
    $output .= $self->write_or_return($body, $fh);
    $output .= $self->write_or_return($footer, $fh);

    # NOTE do not close STDOUT now to avoid a perl warning.
    if ($fh and $no_page_out_filepath ne '-') {
      Texinfo::Common::output_files_register_closed(
                  $self->output_files_information(), $no_page_out_filepath);
      if (!close($fh)) {
        $self->document_error($self,
              sprintf(__("error on closing %s: %s"),
                                      $no_page_out_filepath, $!));
      }
    }
    $self->{'current_filename'} = undef;
    return $output if ($output_file eq '');
  } else {
    # output with pages
    print STDERR "DO Elements with filenames\n"
      if ($self->get_conf('DEBUG'));
    my %files;

    my $unit_nr = -1;
    # Now do the output, converting each tree units and special elements in turn
    $special_elements = [] if (!defined($special_elements));
    foreach my $element (@$tree_units, @$special_elements) {
      my $element_filename = $element->{'structure'}->{'unit_filename'};
      my $out_filepath = $self->{'out_filepaths'}->{$element_filename};
      $self->{'current_filename'} = $element_filename;
      $self->{'counter_in_file'}->{$element_filename}++;

      $unit_nr++;
      # First do the special pages, to avoid outputting these if they are
      # empty.
      my $special_element_content;
      if (defined($element->{'type'})
          and $element->{'type'} eq 'special_element') {
        print STDERR "\nUNIT SPECIAL\n" if ($self->get_conf('DEBUG'));
        $special_element_content .= $self->_convert($element, "output s-unit $unit_nr");
        if ($special_element_content eq '') {
          $self->{'file_counters'}->{$element_filename}--;
          next ;
        }
      }

      # convert body before header in case this affects the header
      my $body = '';
      if (defined($special_element_content)) {
        $body = $special_element_content;
      } else {
        print STDERR "\nUNIT $unit_nr\n" if ($self->get_conf('DEBUG'));
        $body = $self->_convert($element, "output unit $unit_nr");
      }

      # register the element but do not print anything. Printing
      # only when file_counters reach 0, to be sure that all the
      # elements have been converted.
      if (!$files{$element_filename}->{'first_element'}) {
        $files{$element_filename}->{'first_element'} = $element;
        $files{$element_filename}->{'body'} = '';
      }
      $files{$element_filename}->{'body'} .= $body;
      $self->{'file_counters'}->{$element_filename}--;
      if ($self->{'file_counters'}->{$element_filename} == 0) {
        my $file_element = $files{$element_filename}->{'first_element'};
        my $file_fh = Texinfo::Common::output_files_open_out(
                         $self->output_files_information(), $self,
                         $out_filepath);
        if (!$file_fh) {
          $self->document_error($self,
               sprintf(__("could not open %s for writing: %s"),
                                    $out_filepath, $!));
          return undef;
        }
        # do end file first in case it requires some CSS
        my $end_file = &{$self->{'format_end_file'}}($self, $element_filename);
        print $file_fh "".&{$self->{'format_begin_file'}}($self,
                                    $element_filename, $file_element);
        print $file_fh "".$files{$element_filename}->{'body'};
        # end file
        print $file_fh "". $end_file;

        # NOTE do not close STDOUT here to avoid a perl warning
        if ($out_filepath ne '-') {
          Texinfo::Common::output_files_register_closed(
             $self->output_files_information(), $out_filepath);
          if (!close($file_fh)) {
            $self->document_error($self,
                       sprintf(__("error on closing %s: %s"),
                                  $out_filepath, $!));
            return undef;
          }
        }
      }
    }
    delete $self->{'current_filename'};
    if ($self->get_conf('INFO_JS_DIR')) {
      my $jsdir = File::Spec->catdir($created_directory,
                                     $self->get_conf('INFO_JS_DIR'));
      if (!-d $jsdir) {
        if (-f $jsdir) {
          $self->document_error($self, 
            sprintf(__("%s already exists but is not a directory"), $jsdir));
        } else {
          mkdir $jsdir;
        }
      }
      if (-d $jsdir) {
        my $jssrcdir;
        if (!$Texinfo::ModulePath::texinfo_uninstalled) {
          $jssrcdir = File::Spec->catdir(
            $Texinfo::ModulePath::lib_dir, 'js');
        } else {
          $jssrcdir = File::Spec->catdir(
            $Texinfo::ModulePath::top_srcdir, 'js');
        }
        for my $f ('info.js', 'modernizr.js', 'info.css') {
          my $from = File::Spec->catfile($jssrcdir, $f);

          if (!copy($from, $jsdir)) {
            $self->document_error($self, 
              sprintf(__("error on copying %s into %s"), $from, $jsdir));
          }
        }
      }
    }
  }

  if (%{$self->{'jslicenses'}}) {
    $self->_do_jslicenses_file($created_directory);
  }

  my $finish_status = $self->run_stage_handlers($root, 'finish');
  return undef unless($finish_status);

  my $extension = '';
  $extension = '.'.$self->get_conf('EXTENSION')
            if (defined($self->get_conf('EXTENSION'))
                and $self->get_conf('EXTENSION') ne '');
  # do node redirection pages
  $self->{'current_filename'} = undef;
  if ($self->get_conf('NODE_FILES') 
      and $self->{'labels'} and $output_file ne '') {
    foreach my $label (sort(keys (%{$self->{'labels'}}))) {
      my $node = $self->{'labels'}->{$label};
      my $target = $self->_get_target($node);
      # filename may not be defined in case of an @anchor or similar in
      # @titlepage, and @titlepage is not used.
      my $filename = $self->command_filename($node);
      my $node_filename;
      # NOTE 'node_filename' is not used for Top, so the other manual
      # must use the same convention to get it right.  We avoid doing
      # also 'node_filename' to avoid unneeded redirection files.
      if ($node->{'extra'} and $node->{'extra'}->{'normalized'}
          and $node->{'extra'}->{'normalized'} eq 'Top' 
          and defined($self->get_conf('TOP_NODE_FILE_TARGET'))) {
        $node_filename = $self->get_conf('TOP_NODE_FILE_TARGET');
      } else {
        $node_filename = $target->{'node_filename'};
      }

      if (defined($filename) and $node_filename ne $filename) {
        my $redirection_page 
          = &{$self->{'format_node_redirection_page'}}($self, $node);
        my $out_filename;
        if (defined($created_directory) and $created_directory ne '') {
          $out_filename = File::Spec->catfile($created_directory,
                                              $node_filename);
        } else {
          $out_filename = $node_filename;
        }
        my $file_fh = Texinfo::Common::output_files_open_out(
                             $self->output_files_information(), $self,
                             $out_filename);
        if (!$file_fh) {
         $self->document_error($self, sprintf(__(
                                    "could not open %s for writing: %s"),
                                    $out_filename, $!));
        } else {
          print $file_fh $redirection_page;
          Texinfo::Common::output_files_register_closed(
                  $self->output_files_information(), $out_filename);
          if (!close ($file_fh)) {
            $self->document_error($self, sprintf(__(
                             "error on closing redirection node file %s: %s"),
                                    $out_filename, $!));
            return undef;
          }
        }
      }
    }
  }
  return undef;
}

# Convert the 'contents' of a tree element.
sub _convert_contents($$$)
{
  my $self = shift;
  my $element = shift;
  my $command_type = shift;

  my $content_formatted = '';
  if (ref($element->{'contents'}) ne 'ARRAY') {
    cluck "for $element contents not an array: $element->{'contents'}";
    print STDERR Texinfo::Common::debug_print_element($element);
  }

  my $content_idx = 0;
  foreach my $content (@{$element->{'contents'}}) {
    my $new_content = $self->_convert($content, "$command_type c[$content_idx]");
    if (!defined($new_content)) {
      cluck "content not defined for $command_type [$content_idx]\n";
      print STDERR "root is: ".Texinfo::Common::debug_print_element($element);
      print STDERR "content is: ".Texinfo::Common::debug_print_element($content);
    } else {
      $content_formatted .= $new_content;
    }
    $content_idx++;
  }
  return $content_formatted;
}

#my $characters_replaced_from_class_names = quotemeta('[](),~#:/\\@+=!;.,?* ');
# FIXME not clear what character should be allowed and which ones replaced besides space
my $characters_replaced_from_class_names = quotemeta(' ');
sub _protect_class_name($$)
{
  my $self = shift;
  my $class_name = shift;
  $class_name =~ s/[$characters_replaced_from_class_names]/-/g;
  return $self->protect_text($class_name);
}

sub _protect_space($$)
{
  my $self = shift;
  my $text = shift;

  return $text if ($self->in_preformatted());

  if ($self->in_space_protected()) {
    if ($text =~ /(\S*[_-]\S*)/) {
      my $open = $self->html_attribute_class('span', 'w-nolinebreak-text');
      if ($open ne '') {
        $open .= '>';
        # Protect spaces in the html leading attribute in case we are in 'w'
        $open =~ s/ /\x{1F}/g;
        # Special span to avoid breaking at _-
        $text =~ s/(\S*[_-]\S*)/${open}$1<\/span>/g;
      }
    }
    $text .= $self->html_non_breaking_space() if (chomp($text));
    # Protect spaces within text
    my $non_breaking_space = $self->html_non_breaking_space();
    $text =~ s/ /$non_breaking_space/g;
    # Revert protected spaces in leading html attribute
    $text =~ s/\x{1F}/ /g;
  }
  return $text;
}

# Convert tree element $ELEMENT, and return HTML text for the output files.
sub _convert($$;$);

sub _convert($$;$)
{
  my $self = shift;
  my $element = shift;
  # only used for debug
  my $explanation = shift;

  # to help debug and trace
  my $command_type = '';
  if ($element->{'cmdname'}) {
    $command_type = "\@$element->{'cmdname'} ";
  }
  if (defined($element->{'type'})) {
    $command_type .= $element->{'type'};
  }

  if ($self->get_conf('DEBUG')) {
    $explanation = 'NO EXPLANATION' if (!defined($explanation));
    print STDERR "ELEMENT($explanation):$element (".join('|',@{$self->{'document_context'}->[-1]->{'formatting_context'}})."), ->";
    print STDERR " cmd: $element->{'cmdname'}," if ($element->{'cmdname'});
    print STDERR " type: $element->{'type'}" if ($element->{'type'});
    my $text = $element->{'text'};
    if (defined($text)) {
      $text =~ s/\n/\\n/;
      print STDERR " text: $text";
    }
    print STDERR "\n";
  }

  if (ref($element) ne 'HASH') {
    cluck "_convert: tree element not a HASH\n";
    return '';
  }

  if (($element->{'type'}
        and exists ($self->{'types_conversion'}->{$element->{'type'}})
        and !defined($self->{'types_conversion'}->{$element->{'type'}}))
       or ($element->{'cmdname'}
            and exists($self->{'commands_conversion'}->{$element->{'cmdname'}})
            and !defined($self->{'commands_conversion'}->{$element->{'cmdname'}}))) {
    if ($self->get_conf('DEBUG')) {
      my $string = 'IGNORED';
      $string .= " \@$element->{'cmdname'}" if ($element->{'cmdname'});
      $string .= " $element->{'type'}" if ($element->{'type'});
      print STDERR "$string\n";
    }
    return '';
  }

  # Process text
  if (defined($element->{'text'})) {
    # already converted to html, keep it as is
    if ($element->{'type'} and $element->{'type'} eq '_converted') {
      return $element->{'text'};
    }
    if ($element->{'type'} and $element->{'type'} eq 'untranslated') {
      my $translated = $self->gdt($element->{'text'});
      my $result = $self->_convert($translated, 'translated TEXT');
      return $result;
    }
    my $result = &{$self->{'types_conversion'}->{'text'}} ($self, 
                                                      $element->{'type'},
                                                      $element,
                                                      $element->{'text'});
    print STDERR "DO TEXT => `$result'\n" if ($self->get_conf('DEBUG'));
    return $result;
  }

  if ($element->{'extra'} and $element->{'extra'}->{'missing_argument'}
             and (!$element->{'contents'} or !@{$element->{'contents'}})) {
    print STDERR "MISSING_ARGUMENT\n" if ($self->get_conf('DEBUG'));
    return '';
  }

  # commands like @deffnx have both a cmdname and a def_line type.  It is
  # better to consider them as a def_line type, as the whole point of the
  # def_line type is to handle the same the def*x and def* line formatting. 
  if ($element->{'cmdname'}
      and !($element->{'type'} and $element->{'type'} eq 'def_line'
            or $element->{'type'} and $element->{'type'} eq 'definfoenclose_command')) {
    my $command_name = $element->{'cmdname'};
    # use the same command name for all the index entry commands
    if ($element->{'extra'} and $element->{'extra'}->{'index_entry'}
      and $element->{'cmdname'} and $element->{'cmdname'} =~ /index$/) {
      $command_name = 'cindex';
    }
    if ($root_commands{$command_name}) {
      $self->{'current_root_command'} = $element;
    }
    if (exists($self->{'commands_conversion'}->{$command_name})) {
      if (exists($context_brace_commands{$command_name})) {
        $self->_new_document_context($command_name);
      }
      push @{$self->{'document_context'}->[-1]->{'commands'}}, 
        $element->{'cmdname'};
      if (exists($format_context_commands{$command_name})) {
        push @{$self->{'document_context'}->[-1]->{'formatting_context'}}, 
                                              {'cmdname' => $command_name};
      }
      if (exists($block_commands{$command_name})) {
        push @{$self->{'document_context'}->[-1]->{'formats'}}, $command_name;
      }
      if (exists ($composition_context_commands{$command_name})) {
        push @{$self->{'document_context'}->[-1]->{'composition_context'}}, $command_name;
      }
      if ($pre_class_commands{$command_name}) {
        push @{$self->{'document_context'}->[-1]->{'preformatted_classes'}},
          $pre_class_commands{$command_name};
      }
      if ($format_raw_commands{$command_name}) {
        $self->{'document_context'}->[-1]->{'raw'}++;
      } elsif ($command_name eq 'verb' or $command_name eq 'verbatim') {
        $self->{'document_context'}->[-1]->{'verbatim'}++;
      } 
      if ($code_style_commands{$command_name} or 
          $preformatted_code_commands{$command_name}) {
        push @{$self->{'document_context'}->[-1]->{'monospace'}}, 1;
      } elsif ($regular_font_style_commands{$command_name}) {
        push @{$self->{'document_context'}->[-1]->{'monospace'}}, 0;
      } elsif ($upper_case_commands{$command_name}) {
        $self->{'document_context'}->[-1]->{'formatting_context'}->[-1]->{'upper_case'}++;
      } elsif ($math_commands{$command_name}) {
        $self->{'document_context'}->[-1]->{'math'}++;
      } elsif ($command_name eq 'w') {
        $self->{'document_context'}->[-1]->{'formatting_context'}->[-1]->{'space_protected'}++;
      }
      my $result = '';
      if (defined($self->{'commands_open'}->{$command_name})) {
        $result .= &{$self->{'commands_open'}->{$command_name}}($self,
                                                 $command_name, $element);
      }
      my $content_formatted;
      if ($element->{'contents'}) {
        $content_formatted = $self->_convert_contents($element, $command_type);
      }
      my $args_formatted;
      if ($brace_commands{$command_name} 
          or ($misc_commands{$command_name} 
              and $misc_commands{$command_name} eq 'line')
          or (($command_name eq 'item' or $command_name eq 'itemx')
               and ($element->{'parent'}->{'type'}
                    and $element->{'parent'}->{'type'} eq 'table_term'))
          or ($command_name eq 'quotation' 
              or $command_name eq 'smallquotation')
              or ($command_name eq 'float')) {
        $args_formatted = [];
        if ($element->{'args'}) {
          my @args_specification;
          @args_specification = @{$self->{'commands_args'}->{$command_name}}
            if (defined($self->{'commands_args'}->{$command_name}));
          my $arg_idx = 0;
          foreach my $arg (@{$element->{'args'}}) {
            my $arg_spec = shift @args_specification;
            $arg_spec = ['normal'] if (!defined($arg_spec));
            my $arg_formatted = {'tree' => $arg};
            foreach my $arg_type (@$arg_spec) {
              my $explanation = "$command_type A[$arg_idx]$arg_type";
              if ($arg_type eq 'normal') {
                $arg_formatted->{'normal'} = $self->_convert($arg, $explanation);
              } elsif ($arg_type eq 'monospace') {
                push @{$self->{'document_context'}->[-1]->{'monospace'}}, 1;
                #$self->{'document_context'}->[-1]->{'code'}++;
                $arg_formatted->{$arg_type} = $self->_convert($arg, $explanation);
                #$self->{'document_context'}->[-1]->{'code'}--;
                pop @{$self->{'document_context'}->[-1]->{'monospace'}};
              } elsif ($arg_type eq 'string') {
                $self->_new_document_context($command_type);
                $self->{'document_context'}->[-1]->{'string'}++;
                $arg_formatted->{$arg_type} = $self->_convert($arg, $explanation);
                $self->_pop_document_context();
              } elsif ($arg_type eq 'monospacestring') {
                $self->_new_document_context($command_type);
                $self->{'document_context'}->[-1]->{'monospace'}->[-1] = 1;
                $self->{'document_context'}->[-1]->{'string'}++;
                $arg_formatted->{$arg_type} = $self->_convert($arg, $explanation);
                $self->_pop_document_context();
              } elsif ($arg_type eq 'monospacetext') {
                $arg_formatted->{$arg_type} 
                  = Texinfo::Convert::Text::convert_to_text($arg, {'code' => 1,
                     Texinfo::Convert::Text::copy_options_for_convert_text($self)});
              } elsif ($arg_type eq 'raw') {
                $self->{'document_context'}->[-1]->{'raw'}++;
                $arg_formatted->{$arg_type} = $self->_convert($arg, $explanation);
                $self->{'document_context'}->[-1]->{'raw'}--;
              }
            }
            
            push @$args_formatted, $arg_formatted;
            $arg_idx++;
          }
        }
      }
      if (exists ($composition_context_commands{$command_name})) {
        pop @{$self->{'document_context'}->[-1]->{'composition_context'}};
      }
      if ($pre_class_commands{$command_name}) {
        pop @{$self->{'document_context'}->[-1]->{'preformatted_classes'}};
      }
      if ($code_style_commands{$command_name} 
          or $preformatted_code_commands{$command_name}
          or $regular_font_style_commands{$command_name}) {
        #$self->{'document_context'}->[-1]->{'code'}--;
        pop @{$self->{'document_context'}->[-1]->{'monospace'}};
      } elsif ($upper_case_commands{$command_name}) {
        $self->{'document_context'}->[-1]->{'formatting_context'}->[-1]->{'upper_case'}--;
      } elsif ($math_commands{$command_name}) {
        $self->{'document_context'}->[-1]->{'math'}--;
      } elsif ($command_name eq 'w') {
        $self->{'document_context'}->[-1]->{'formatting_context'}->[-1]->{'space_protected'}--;
      }
      if ($format_raw_commands{$command_name}) {
        $self->{'document_context'}->[-1]->{'raw'}--;
      } elsif ($command_name eq 'verb' or $command_name eq 'verbatim') {
        $self->{'document_context'}->[-1]->{'verbatim'}--;
      }
      if (exists($block_commands{$command_name})) {
        pop @{$self->{'document_context'}->[-1]->{'formats'}};
      }
      if (exists($format_context_commands{$command_name})) {
        pop @{$self->{'document_context'}->[-1]->{'formatting_context'}};
      }
      pop @{$self->{'document_context'}->[-1]->{'commands'}};
      if (exists($context_brace_commands{$command_name})) {
        $self->_pop_document_context();
      }

      if ($element->{'cmdname'} eq 'node') {
        $self->{'current_node'} = $element;
      }
      elsif ($element->{'cmdname'} eq 'menu' and $self->{'current_node'}) {
        $self->{'seenmenus'}->{$self->{'current_node'}} = 1;
      }
      # args are formatted, now format the command itself
      if ($args_formatted) {
        if (!defined($self->{'commands_conversion'}->{$command_name})) {
          print STDERR "No command_conversion for $command_name\n";
        } else {
          $result .= &{$self->{'commands_conversion'}->{$command_name}}($self,
                  $command_name, $element, $args_formatted, $content_formatted);
        }
      } else {
        $result .= &{$self->{'commands_conversion'}->{$command_name}}($self,
                $command_name, $element, $content_formatted);
      }
      return $result;
    } else {
      print STDERR "Unknown command `$command_name'\n"
       if ($self->get_conf('VERBOSE') or $self->get_conf('DEBUG'));
      return '';
    }
    if ($root_commands{$command_name}) {
      delete $self->{'current_root_command'};
    }
  } elsif ($element->{'type'}) {
    push @{$self->{'document_context'}->[-1]->{'commands'}}, 
      $element->{'cmdname'}
        if ($element->{'cmdname'});

    my $result = '';
    my $type_name = $element->{'type'};
    if (defined($self->{'types_open'}->{$type_name})) {
      $result .= &{$self->{'types_open'}->{$type_name}}($self,
                                               $type_name, $element);
    }
    if ($type_name eq 'paragraph') {
      $self->{'document_context'}->[-1]->{'formatting_context'}->[-1]->{'paragraph_number'}++;
    } elsif ($type_name eq 'preformatted'
             or $type_name eq 'rawpreformatted') {
      $self->{'document_context'}->[-1]->{'formatting_context'}->[-1]->{'preformatted_number'}++;
    } elsif ($type_name eq 'unit'
             or $type_name eq 'special_element') {
      $self->{'current_root_element'} = $element;
    } elsif ($pre_class_types{$type_name}) {
      push @{$self->{'document_context'}->[-1]->{'preformatted_classes'}},
        $pre_class_types{$type_name};
      push @{$self->{'document_context'}->[-1]->{'composition_context'}},
        $type_name;
    }

    if ($self->{'code_types'}->{$type_name}) {
      push @{$self->{'document_context'}->[-1]->{'monospace'}}, 1;
    }
    if ($type_name eq '_string') {
      $self->{'document_context'}->[-1]->{'string'}++;
    }

    my $content_formatted;
    if ($type_name eq 'definfoenclose_command') {
      if ($element->{'args'}) {
        $content_formatted = $self->_convert($element->{'args'}->[0]);
      }
    } elsif ($element->{'contents'}) {
      $content_formatted = $self->_convert_contents($element, $command_type);
    }

    if (exists($self->{'types_conversion'}->{$type_name})) {
      $result = &{$self->{'types_conversion'}->{$type_name}} ($self,
                                                 $type_name,
                                                 $element,
                                                 $content_formatted);
      #print STDERR "Converting type $type_name -> $result\n";
    } elsif (defined($content_formatted)) {
      $result = $content_formatted;
    }
    if ($self->{'code_types'}->{$type_name}) {
      pop @{$self->{'document_context'}->[-1]->{'monospace'}};
    } 
    if ($type_name eq '_string') {
      $self->{'document_context'}->[-1]->{'string'}--;
    }
    if ($type_name eq 'unit' or $type_name eq 'special_element') {
      delete $self->{'current_root_element'};
    } elsif ($pre_class_types{$type_name}) {
      pop @{$self->{'document_context'}->[-1]->{'preformatted_classes'}};
      pop @{$self->{'document_context'}->[-1]->{'composition_context'}};
    }
    print STDERR "DO type ($type_name) => `$result'\n"
      if ($self->get_conf('DEBUG'));
    pop @{$self->{'document_context'}->[-1]->{'commands'}} 
        if ($element->{'cmdname'});
    return $result;
    # no type, no cmdname, but contents.
  } elsif ($element->{'contents'}) {
    # this happens inside accents, for section/node names, for @images.
    my $content_formatted = '';
    my $i = 0;
    foreach my $content (@{$element->{'contents'}}) {
      $content_formatted .= $self->_convert($content, "$command_type C[$i]");
      $i++;
    }
    print STDERR "UNNAMED HOLDER => `$content_formatted'\n"
      if ($self->get_conf('DEBUG'));
    return $content_formatted;
  } else {
    print STDERR "UNNAMED empty\n" if ($self->get_conf('DEBUG'));
    if ($self->{'types_conversion'}->{''}) {
      return &{$self->{'types_conversion'}->{''}} ($self, $element);
    } else {
      return '';
    }
  }
  print STDERR "DEBUG: HERE!($element)\n";
}

sub _set_variables_texi2html()
{
  my @texi2html_options = (
  # added hopefully temporarily to be able to validate with W3C validator
  #['DOCTYPE', '<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">'],
  #['DOCTYPE', '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">'],
  ['FORMAT_MENU', 'menu'],
  ['NO_USE_SETFILENAME', 1],
  ['USE_SETFILENAME_EXTENSION', 0],
  ['footnotestyle', 'separate'],
  ['CONTENTS_OUTPUT_LOCATION', 'separate_element'],
  ['FORCE', 1],
  ['AVOID_MENU_REDUNDANCY', 1],
  ['USE_ACCESSKEY', 0],
  ['NODE_NAME_IN_MENU', 0],
  ['SHORT_TOC_LINK_TO_TOC', 0],
  ['USE_UP_NODE_FOR_ELEMENT_UP', 1],
  ['USE_REL_REV', 0],
  ['USE_LINKS', 0],
  ['USE_NODES', 0],
  ['SPLIT', ''],
  ['PROGRAM_NAME_IN_FOOTER', 1],
  ['HEADER_IN_TABLE', 1],
  ['USE_TITLEPAGE_FOR_TITLE', 1],
  ['MENU_ENTRY_COLON', ''],
  ['INDEX_ENTRY_COLON', ''],
  ['DO_ABOUT', undef],
  ['NODE_NAME_IN_INDEX', 0],
  ['CHAPTER_HEADER_LEVEL', 1],
  ['BIG_RULE', '<hr style="height: 6px;">'],
  ['FOOTNOTE_END_HEADER_LEVEL', 3],
  ['FOOTNOTE_SEPARATE_HEADER_LEVEL', 1],
  ['KEEP_TOP_EXTERNAL_REF', 1],
  ['SECTION_BUTTONS', ['FastBack', 'Back', 'Up', 'Forward', 'FastForward',
                             ' ', ' ', ' ', ' ',
                             'Top', 'Contents', 'Index', 'About' ]],
  ['TOP_BUTTONS', ['Back', 'Forward', ' ',
                             'Contents', 'Index', 'About']],

  ['MISC_BUTTONS', [ 'Top', 'Contents', 'Index', 'About' ]],
  ['CHAPTER_BUTTONS', [ 'FastBack', 'FastForward', ' ',
                              ' ', ' ', ' ', ' ',
                              'Top', 'Contents', 'Index', 'About', ]],
  ['SECTION_FOOTER_BUTTONS', [ 'FastBack', 'FirstInFileBack', 'FirstInFileUp',
                                               'Forward', 'FastForward' ]],
  ['CHAPTER_FOOTER_BUTTONS', [ 'FastBack', 'FastForward', ' ',
                              ' ', ' ', ' ', ' ',
                              'Top', 'Contents', 'Index', 'About', ]],
  ['NODE_FOOTER_BUTTONS', [ 'FastBack', 'Back', 
                                            'Up', 'Forward', 'FastForward',
                             ' ', ' ', ' ', ' ',
                             'Top', 'Contents', 'Index', 'About' ]],
  );
  foreach my $option (@texi2html_options) {
    #no warnings 'once';
    $defaults{$option->[0]} = $option->[1];
  }
}

1;

__END__
# $Id$
# Automatically generated from maintain/template.pod

=head1 NAME

Texinfo::Convert::HTML - Convert Texinfo tree to HTML

=head1 SYNOPSIS

  my $converter 
    = Texinfo::Convert::HTML->converter({'parser' => $parser});

  $converter->output($tree);
  $converter->convert($tree);
  $converter->convert_tree($tree);
  $converter->output_internal_links(); # HTML only

=head1 DESCRIPTION

Texinfo::Convert::HTML converts a Texinfo tree to HTML.

=head1 METHODS

=over

=item $converter = Texinfo::Convert::HTML->converter($options)

Initialize converter from Texinfo to HTML.  

The I<$options> hash reference holds options for the converter.  In
this option hash reference a parser object may be associated with the 
I<parser> key.  The other options should be configuration options
described in the Texinfo manual.  Those options, when appropriate,
override the document content.

See L<Texinfo::Convert::Converter> for more informations.

=item $converter->output($tree)

Convert a Texinfo tree I<$tree> and output the result in files as
described in the Texinfo manual.

=item $result = $converter->convert($tree)

Convert a Texinfo tree I<$tree> or tree portion and return 
the resulting output.

=item $result = $converter->convert_tree($tree)

Convert a Texinfo tree portion I<$tree> and return the resulting 
output.  This function does not try to output a full document but only
portions.  For a full document use C<convert>.

=item $result = $converter->output_internal_links()

Returns text representing the links in the document.  The format should
follow the C<--internal-links> option of the texi2any/makeinfo
specification.  This is only supported in (and relevant for) HTML.

=back

=head1 AUTHOR

Patrice Dumas, E<lt>pertusus@free.frE<gt>

=cut
