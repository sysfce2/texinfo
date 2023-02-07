# ParserNonXS.pm: parse texinfo code into a tree.
#
# Copyright 2010-2022 Free Software Foundation, Inc.
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
# Parts (also from Patrice Dumas) come from texi2html.pl or texi2html.init.

# Since there are different parser implementation, XS and NonXS, it is
# better to have the Texinfo::Parser packages define only the parser
# API functions.  Constants, functions useful in both parsers, and other
# functions useful in other codes are better defined in other Texinfo
# modules.

# The organization of the file is the following:
#  default parser state.  With explanation of the internal structures.
#  determination of command types.
#  user visible subroutines and subroutines related to input.
#  internal subroutines, doing the parsing.

# In general, the Parser works with character strings decoded from the
# command line, from input files or from the parsed document.  There are
# exceptions for the following files and directory names that are binary
# strings:
# * the input file name passed through parse_texi_file is a binary string
# * @include file name and CPP line directive file names are encoded
#   into binary strings.
# Those binary strings are in 'file_name' keys, they transit through
# $self->{'input'} and end up in 'source_info' in tree elements and
# in error messages.
#
# The following parser information is directly determined from the
# input file name as binary strings
# ->{'info'}->{'input_file_name'}
# ->{'info'}->{'input_directory'}

package Texinfo::Parser;

# We need the unicode stuff.
use 5.006;
use strict;

# stop \s from matching non-ASCII spaces, etc.  \p{...} can still be
# used to match Unicode character classes.
use if $] >= 5.014, re => '/a';

# check that autovivification do not happen incorrectly.
#no autovivification qw(fetch delete exists store strict);

# debug
use Carp qw(cluck confess);
use Data::Dumper;

# to detect if an encoding may be used to open the files
# to encode/decode in-memory strings used as files
use Encode qw(find_encoding decode encode);

# for fileparse
use File::Basename;

# Clone could be faster for small structures, which should be the case
# here, but Clone is not in Perl core modules, so we use Storable::dclone.
use Storable qw(dclone); # standard in 5.007003

# commands definitions
use Texinfo::Common;
use Texinfo::Commands;
# Error reporting and counting
use Texinfo::Report;

# in error messages, and for macro body expansion
use Texinfo::Convert::Texinfo;

# to call set_nodes_list_labels
use Texinfo::Convert::NodeNameNormalization;

# to complete indices translations.
use Texinfo::Translations;

require Exporter;
use vars qw($VERSION @ISA @EXPORT_OK %EXPORT_TAGS);
@ISA = qw(Exporter);

our $module_loaded = 0;
sub import {
  if (!$module_loaded) {
    # not loaded because it uses the abort_empty_line XS override
    # TODO and not up to date with the changes for source marks
    #Texinfo::XSLoader::override ("Texinfo::Parser::_merge_text",
    #  "Texinfo::MiscXS::merge_text");
    # TODO not up to date with the changes for source marks
    #Texinfo::XSLoader::override ("Texinfo::Parser::_abort_empty_line",
    #  "Texinfo::MiscXS::abort_empty_line");
    Texinfo::XSLoader::override ("Texinfo::Parser::_parse_texi_regex",
      "Texinfo::MiscXS::parse_texi_regex");
    $module_loaded = 1;
  }
  # The usual import method
  goto &Exporter::import;
}

%EXPORT_TAGS = ( 'all' => [ qw(
    parser
    parse_texi_file
    parse_texi_line
    parse_texi_piece
    parse_texi_text

) ] );

@EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

$VERSION = '7.0dev';


# these are the default values for the parser state
# some could become configurable if moved to the next hash, but they
# are not configurable/implemented in the XS parser, so they are best
# left internal.  In general they are dynamically modified during parsing.
my %parser_state_initialization = (
  # these are the user-added indices.  May be an array reference on names
  # or an hash reference in the same format than %index_names below
  'indices' => [],
  'aliases' => {},            # key is a command name value is the alias
  'commands_info' => {},      # keys are @-commands names (without @) and
                              # values are arrays for global multiple
                              # @-commands and a value for non multiple
                              # global @-commands.
  'conditional_stack' => [],  # a stack of conditional commands that are
                              # expanded.
  'raw_block_stack' => [],    # a stack of raw block commands that are nested.
  'floats' => {},             # key is the normalized float type, value is
                              # an array reference holding all the floats
                              # of that type.
  'labels' => {},             # keys are normalized label names, as described
                              # in the `HTML Xref' node.  Value should be
                              # a node/anchor or float in the tree.
  'macros' => {},             # the key is the user-defined macro name.  The
                              # value is the reference on a macro element
                              # as obtained by parsing the @macro
  'macro_stack' => [],        # stack of macros being expanded (more recent
                              # first)
  'value_stack' => [],        # stack of values being expanded (more recent
                              # first)
  'merged_indices' => {},     # the key is merged in the value
  'regions_stack' => [],      # a stack of regions commands elements (block
                              # region commands)
  'sections_level' => 0,      # modified by raise/lowersections
  'targets' => [],            # array of elements used to build 'labels'
  # initialization of information returned by global_information()
  'info' => {
    'input_encoding_name' => 'utf-8',
    'input_perl_encoding' => 'utf-8'
  },
);

# configurable parser state
my %parser_state_configuration = (
  'accept_internalvalue' => 0, # whether @txiinternalvalue should be added
                               # to the tree or considered invalid.
                               # currently set if called by gdt.
  'clickstyle' => 'arrow',       # duplicated in gdt but not set nor used by
                                 # the XS parser
  'kbdinputstyle' => 'distinct', # duplicated in gdt but not set nor used by
                                 # the XS parser
  'registrar' => undef,        # Texinfo::Report object used for error
                               # reporting.
  'values' => {'txicommandconditionals' => 1},
                              # the key is the name, the value the @set name
                              # argument.
                              # The txicommandconditionals is a special value
                              # that is set to mark that @ifcommandnotdefined
                              # is implemented
);

# customization options are in Texinfo::Common because all the
# customization options informations is gathered here, and also
# because it is used in other codes, in particular the XS parser.
my %parser_settable_configuration = (
  %parser_state_configuration,
  %Texinfo::Common::default_parser_customization_values,
);

my %parser_default_configuration = (
  %parser_state_initialization,
  %parser_settable_configuration
);

# the other possible keys for the parser state are:
#
# expanded_formats_hash   each key comes from EXPANDED_FORMATS, value is 1
# index_names             a structure holding the link between index
#                         names and merged indices;
#                         initial value is %index_names in Texinfo::Common.
# context_stack           stack of the contexts, more recent on top.
#                         'ct_line' is added when on a line or
#                         block @-command line,
#                         'ct_def' is added instead if on a definition line.
#                         'ct_preformatted' is added in block commands
#                         where there is no paragraphs and spaces are kept
#                         (format, example, display and menu commands...)
#                         'ct_math' is added in math block commands
#                         (displaymath) and @math brace commands
#                         'ct_rawpreformatted' is added in raw block commands
#                         (html, xml, docbook...)
#                         'ct_inlineraw' is added when in inlineraw
#                         'ct_brace_command' is added when in footnote,
#                         caption, or shortcaption (context brace_commands
#                         that does not already start another context, ie not
#                         math).
# context_command_stack   the stack of @-commands. An @-command name can
#                         be added each time a context is pushed on
#                         'context_stack'.  Could be undef if there
#                         is no @-command associated with the context.
# definfoenclose          an hash, key is the command name, value is an array
#                         reference with 2 values, beginning and ending.
# nesting_context         an hash, key is the context name, value is the
#                         depth of the context.
# input                   a stack, with last at bottom.  Holds the opened files
#                         or text.  Pending macro expansion or text expansion
#                         is also in that structure.
# line_commands           the same as %line_commands in Texinfo::Common,
#                         but with index entry commands dynamically added
# close_paragraph_commands      same as %close_paragraph_commands
# close_preformatted_commands   same as %close_preformatted_commands
# no_paragraph_commands   the same as %default_no_paragraph_commands
#                         below, with index
#                         entry commands dynamically added
# basic_inline_commands   the same as %contain_basic_inline_commands below, but
#                         with index entry commands dynamically added
# current_node            last seen node.
# current_section         last seen section.
# nodes                   list of nodes.
# command_index           associate a command name with an index name.
# internal_references     an array holding all the internal references.

# set                     points to the value set when initializing, for
#                         configuration items that are not to be overriden
#                         by @-commands.  For example documentlanguage.


# A source information is an hash reference with the keys:
# line_nr        the line number.
# file_name      the file name, a binary string.
# macro          if in a macro expansion, the name of the macro.
#
# A text fragment with source information is a 2 element array reference,
# the first is the text, the second is the source information.

# The input structure is an array, the first is the most recently included
# file.  The last element may corresponnd to a file if the parsing is done
# on a file, with parse_texi_file, or just hold pending text, if called on text.
# each element of the array is a hash reference.  The key are:
# th                  handle for text given in input or expansion text
#                     of value or macro.
# source_info         source information corresponding to the current file.
# fh                  filehandle for the file.

# The commands in initialization_overrides are not set in the document if
# set at the parser initialization.
my %initialization_overrides = (
  'documentlanguage' => 1,
);

my %nobrace_commands          = %Texinfo::Commands::nobrace_commands;
my %line_commands             = %Texinfo::Commands::line_commands;
my %brace_commands            = %Texinfo::Commands::brace_commands;
my %commands_args_number      = %Texinfo::Commands::commands_args_number;
my %accent_commands           = %Texinfo::Commands::accent_commands;
my %contain_plain_text_commands = %Texinfo::Commands::contain_plain_text_commands;
my %contain_basic_inline_commands = %Texinfo::Commands::contain_basic_inline_commands;
my %block_commands            = %Texinfo::Commands::block_commands;
my %blockitem_commands        = %Texinfo::Commands::blockitem_commands;
my %close_paragraph_commands  = %Texinfo::Commands::close_paragraph_commands;
my %def_commands              = %Texinfo::Commands::def_commands;
my %def_alias_commands        = %Texinfo::Commands::def_alias_commands;
my %preformatted_commands     = %Texinfo::Commands::preformatted_commands;
my %math_commands             = %Texinfo::Commands::math_commands;
my %deprecated_commands       = %Texinfo::Commands::deprecated_commands;
my %root_commands             = %Texinfo::Commands::root_commands;
my %sectioning_heading_commands     = %Texinfo::Commands::sectioning_heading_commands;
my %ref_commands              = %Texinfo::Commands::ref_commands;
my %heading_spec_commands     = %Texinfo::Commands::heading_spec_commands;
my %in_heading_spec_commands  = %Texinfo::Commands::in_heading_spec_commands;
my %variadic_commands         = %Texinfo::Commands::variadic_commands;
my %default_index_commands    = %Texinfo::Commands::default_index_commands;
my %global_multiple_commands  = %Texinfo::Commands::global_commands;
my %global_unique_commands    = %Texinfo::Commands::global_unique_commands;
my %in_index_commands         = %Texinfo::Commands::in_index_commands;
my %explained_commands        = %Texinfo::Commands::explained_commands;
my %inline_format_commands    = %Texinfo::Commands::inline_format_commands;

my %def_map                   = %Texinfo::Common::def_map;
my %def_aliases               = %Texinfo::Common::def_aliases;
my %all_commands              = %Texinfo::Common::all_commands;


# Keys are commmands, values are names of indices.  User-defined
# index commands are added dynamically.
my %command_index;

$command_index{'vtable'} = 'vr';
$command_index{'ftable'} = 'fn';

foreach my $index_command (keys(%default_index_commands)) {
  $command_index{$index_command} = $default_index_commands{$index_command};
}

# the type of index, fn: function, vr: variable, tp: type
my %index_type_def = (
 'fn' => ['deffn', 'deftypefn', 'deftypeop', 'defop'],
 'vr' => ['defvr', 'deftypevr', 'defcv', 'deftypecv' ],
 'tp' => ['deftp']
);

foreach my $index_type (keys %index_type_def) {
  foreach my $def (@{$index_type_def{$index_type}}) {
    $command_index{$def} = $index_type;
  }
}

foreach my $def_command(keys %def_map) {
  if (ref($def_map{$def_command}) eq 'HASH') {
    my ($real_command) = keys (%{$def_map{$def_command}});
    $command_index{$def_command} = $command_index{$real_command};
  }
  $command_index{$def_command.'x'} = $command_index{$def_command};
}


# equivalence between a @set flag and an @@-command
my %set_flag_command_equivalent = (
  'txicodequoteundirected' => 'codequoteundirected',
  'txicodequotebacktick'   => 'codequotebacktick',
#  'txideftypefnnl'         => 'deftypefnnewline',
);

# could be moved to Texinfo::Common if needed more generally
my %set_flag_index_char_ignore = (
 'txiindexatsignignore' => '@',
 'txiindexbackslashignore' => '\\',
 'txiindexlessthanignore' => '<',
 'txiindexhyphenignore' => '-',
);

my %type_with_paragraph;
foreach my $type ('before_item', 'before_node_section', 'document_root',
                  'brace_command_context') {
  $type_with_paragraph{$type} = 1;
}

my %command_ignore_space_after;
foreach my $command ('anchor', 'hyphenation', 'caption', 'shortcaption',
                     'sortas', 'seeentry', 'seealso') {
  $command_ignore_space_after{$command} = 1;
}

# @-commands that do not start a paragraph
my %default_no_paragraph_commands;
# @-commands that should be at the beginning of a line
my %begin_line_commands;

foreach my $command ('node', 'end') {
  $begin_line_commands{$command} = $command;
}

foreach my $no_paragraph_command ('titlefont', 'caption', 'shortcaption',
          'image', '*', 'hyphenation', 'anchor', 'errormsg') {
  $default_no_paragraph_commands{$no_paragraph_command} = 1;
}

foreach my $no_paragraph_command (keys(%line_commands),
      grep {$nobrace_commands{$_} ne 'symbol'} keys(%nobrace_commands)) {
  $default_no_paragraph_commands{$no_paragraph_command} = 1;
}

foreach my $no_paragraph_command (keys(%line_commands)) {
  $begin_line_commands{$no_paragraph_command} = 1;
}

foreach my $not_begin_line_command ('comment', 'c', 'columnfractions',
                                 'item', 'subentry') {
  delete $begin_line_commands{$not_begin_line_command};
}

my %close_preformatted_commands = %close_paragraph_commands;
foreach my $no_close_preformatted('sp') {
  delete $close_preformatted_commands{$no_close_preformatted};
}

foreach my $block_command (keys(%block_commands)) {
  $begin_line_commands{$block_command} = 1;
  $default_no_paragraph_commands{$block_command} = 1;
  # FIXME to close preformated or not to close?
  #$close_preformatted_commands{$format_raw_command} = 1
  #  if ($brace_commands{$format_raw_command}) eq 'format_raw');
}

# commands that may appear in commands containing plain text only
my %in_plain_text_commands = %accent_commands;
foreach my $brace_command(keys(%brace_commands)) {
  $in_plain_text_commands{$brace_command} = 1
     if ($brace_commands{$brace_command} eq 'noarg');
}
my %symbol_nobrace_commands;
foreach my $no_brace_command (keys(%nobrace_commands)) {
  if ($nobrace_commands{$no_brace_command} eq 'symbol') {
    $symbol_nobrace_commands{$no_brace_command} = 1;
    $in_plain_text_commands{$no_brace_command} = 1;
  }
}
$in_plain_text_commands{'c'} = 1;
$in_plain_text_commands{'comment'} = 1;

# commands that may appear in any text argument, similar constraints
# as in paragraphs.
my %in_full_text_commands;
# start from all the brace commands
foreach my $command (keys(%brace_commands), keys(%symbol_nobrace_commands)) {
  $in_full_text_commands{$command} = 1;
}
# selected line commands
foreach my $in_full_text_command ('c', 'comment', 'refill', 'subentry',
                         'columnfractions', 'set', 'clear', 'end',
                         keys(%in_heading_spec_commands)) {
  $in_full_text_commands{$in_full_text_command} = 1;
}
# selected block commands
foreach my $block_command (keys(%block_commands)) {
  $in_full_text_commands{$block_command} = 1
    if ($block_commands{$block_command} eq 'conditional'
        or $block_commands{$block_command} eq 'format_raw');
}

# sort out brace commmands and setup command list appearing in more
# restricted context.

# those two commands are not allowed in any command except for @float */
delete $in_full_text_commands{'caption'};
delete $in_full_text_commands{'shortcaption'};

# Note that checks for basic inline content are now done using the stacks of
# commands in 'nesting_context'.

# commands that may appear inside sectioning commands
my %in_basic_inline_with_refs_commands = %in_full_text_commands;
foreach my $not_in_basic_inline_with_refs_commands ('titlefont',
                                   'anchor', 'footnote', 'verb') {
  delete $in_basic_inline_with_refs_commands{
                                 $not_in_basic_inline_with_refs_commands};
}

# commands that are basic inline content
my %in_basic_inline_commands = %in_basic_inline_with_refs_commands;
foreach my $not_in_basic_inline_command('xref', 'ref', 'pxref', 'inforef') {
  delete $in_basic_inline_commands{$not_in_basic_inline_command};
}


my %contain_basic_inline_with_refs_commands = (%sectioning_heading_commands,
                                      %def_commands);

# commands that accept full text, but no block or top-level commands
my %contain_full_text_commands;
foreach my $brace_command (keys (%brace_commands)) {
  next if (exists($contain_plain_text_commands{$brace_command}));
  if ($brace_commands{$brace_command} eq 'style_code'
      or $brace_commands{$brace_command} eq 'style_other'
      or $brace_commands{$brace_command} eq 'style_no_code') {
    $contain_full_text_commands{$brace_command} = 1;
  }
}

# commands that accept almost the same as in full text, except
# what does not make sense on a line.
my %contain_full_line_commands;
$contain_full_line_commands{'center'} = 1;
$contain_full_line_commands{'exdent'} = 1;
$contain_full_line_commands{'item'} = 1;
$contain_full_line_commands{'itemx'} = 1;

# Fill the valid nestings hash.  The keys are the containing commands and
# the values arrays of commands that are allowed to occur inside those
# commands. All commands not in this hash are considered to accept anything.
# There are additional context tests, to make sure, for instance that we are
# testing @-commands on the block, line or node @-command line and not
# in the content.
# Index entry commands are dynamically set as %in_basic_inline_commands
my %default_valid_nestings;

foreach my $command (keys(%contain_plain_text_commands)) {
  $default_valid_nestings{$command} = \%in_plain_text_commands;
}

foreach my $command (keys(%contain_full_text_commands),
                     keys(%contain_full_line_commands)) {
  $default_valid_nestings{$command} = \%in_full_text_commands;
}
foreach my $command (keys(%contain_basic_inline_with_refs_commands)) {
  $default_valid_nestings{$command} = \%in_basic_inline_with_refs_commands;
}

# @this* commands should not appear in any line command except for
# page heading specification commands and can also appear in brace @-commands,
# on heading specification commands lines, such as indicatric @-commands.

foreach my $brace_command (keys (%brace_commands)) {
  if ($brace_commands{$brace_command} eq 'style_code'
      or $brace_commands{$brace_command} eq 'style_other'
      or $brace_commands{$brace_command} eq 'style_no_code') {

    # duplicate hash to avoid modifying shared structure
    $default_valid_nestings{$brace_command}
     = { %{$default_valid_nestings{$brace_command}} };

    foreach my $in_heading_spec (keys(%in_heading_spec_commands)) {
      $default_valid_nestings{$brace_command}->{$in_heading_spec} = 1;
    }
  }
}

# default indices
my %index_names = %Texinfo::Commands::index_names;

# index names that cannot be set by the user.
my %forbidden_index_name = ();

foreach my $name (keys(%index_names)) {
  $forbidden_index_name{$name} = 1;
  if ($name =~ /^(.).$/) {
    $forbidden_index_name{$1} = 1;
  }
}

my %default_basic_inline_commands = %contain_basic_inline_commands;
foreach my $index (keys(%index_names)) {
  my $one_letter_prefix = substr($index, 0, 1);
  foreach my $prefix ($index, $one_letter_prefix) {
    $default_no_paragraph_commands{$prefix.'index'} = 1;
    $default_basic_inline_commands{$prefix.'index'} = 1;
  }
}

if (0) {
  # check that all the commands either are in %default_valid_nestings,
  # do not have arguments at all, have special parsing of their arguments
  # or accept any command
  my %all_commands_nesting_check = %Texinfo::Common::all_commands;
  foreach my $command (keys(%default_valid_nestings)) {
    if (not exists($all_commands_nesting_check{$command})) {
      die "In \%default_valid_nestings: Not a command $command\n";
    }
    delete $all_commands_nesting_check{$command};
  }
  # no argument
  foreach my $command (keys(%Texinfo::Commands::nobrace_commands)) {
    delete $all_commands_nesting_check{$command};
  }
  foreach my $command (keys(%Texinfo::Commands::block_commands)) {
    # remove block commands without argument, they should have
    # an error message for any content
    delete $all_commands_nesting_check{$command}
      if (not $commands_args_number{$command}
          and not $variadic_commands{$command});
  }
  foreach my $brace_command(keys(%brace_commands)) {
    delete $all_commands_nesting_check{$brace_command}
           # no argument
       if ($brace_commands{$brace_command} eq 'noarg'
           # @inline* can contain anything in their second argument
           or $inline_format_commands{$brace_command}
           or $Texinfo::Commands::inline_conditional_commands{$brace_command});
  }
  foreach my $command (keys(%line_commands)) {
    delete $all_commands_nesting_check{$command}
       # special formatting, commands on line are not parsed as usual
       if ($line_commands{$command} eq 'skipline'
           or $line_commands{$command} eq 'special'
           or $line_commands{$command} eq 'lineraw');
  }
  # U, value and verb have special checks of argument.
  # caption and footnotes can contain any command.
  foreach my $command ('U', 'value', 'verb', 'caption', 'footnote') {
    delete $all_commands_nesting_check{$command};
  }

  print STDERR "".join('|', sort(keys(%all_commands_nesting_check)))."\n";
}

foreach my $other_forbidden_index_name ('info','ps','pdf','htm',
   'html', 'log','aux','dvi','texi','txi','texinfo','tex','bib') {
  $forbidden_index_name{$other_forbidden_index_name} = 1;
}

my %canonical_texinfo_encodings;
# Valid encodings as described in the Texinfo manual
foreach my $canonical_encoding ('us-ascii', 'utf-8', 'iso-8859-1',
                  'iso-8859-15', 'iso-8859-2', 'koi8-r', 'koi8-u') {
  $canonical_texinfo_encodings{$canonical_encoding} = 1;
}

# context_stack stack contexts in which an empty line doesn't trigger
# a paragraph
my %no_paragraph_contexts;
foreach my $no_paragraph_context ('math', 'preformatted', 'rawpreformatted',
                                  'def', 'inlineraw') {
  $no_paragraph_contexts{'ct_'.$no_paragraph_context} = 1;
};



my %nesting_context_init = (
                         'footnote' => 0,
                         'caption' => 0,
);

# Interface and internal functions for input management

# initialization entry point.  Set up a parser.
# The last argument, optional, is a hash provided by the user to change
# the default values for what is present in %parser_default_configuration.
sub parser(;$$)
{
  my $conf = shift;

  my $parser = dclone(\%parser_default_configuration);
  bless $parser;

  _setup_conf($parser, $conf);

  # Initialize command hash that are dynamically modified, notably
  # those for index commands, and definoenclose, based on defaults
  $parser->{'line_commands'} = dclone(\%line_commands);
  $parser->{'brace_commands'} = dclone(\%brace_commands);
  $parser->{'valid_nestings'} = dclone(\%default_valid_nestings);
  $parser->{'no_paragraph_commands'} = { %default_no_paragraph_commands };
  $parser->{'index_names'} = dclone(\%index_names);
  $parser->{'command_index'} = {%command_index};
  $parser->{'close_paragraph_commands'} = {%close_paragraph_commands};
  $parser->{'close_preformatted_commands'} = {%close_preformatted_commands};

  # other initializations
  $parser->{'definfoenclose'} = {};
  $parser->{'source_mark_counters'} = {};
  $parser->{'nesting_context'} = {%nesting_context_init};
  $parser->{'nesting_context'}->{'basic_inline_stack'} = [];
  $parser->{'nesting_context'}->{'basic_inline_stack_on_line'} = [];
  $parser->{'nesting_context'}->{'basic_inline_stack_block'} = [];
  $parser->{'basic_inline_commands'} = {%default_basic_inline_commands};

  # handle user provided state.

  # Currently not done, as none of the user provided configuration
  # keys of interest are in %parser_state_configuration.  If this
  # changes, the if (0) could be removed.  However, this setting of
  # configuration is also not handled by the XS parser, which is
  # again in favor of keeping the code ignored.
  if (0) {
    # REMARK the following code will not be used for user defined state
    # if the corresponding key is ignored in _setup_conf()
    #
    # a hash is simply concatenated.  It should be like %index_names.
    if (ref($parser->{'indices'}) eq 'HASH') {
      %{$parser->{'index_names'}} = (%{$parser->{'index_names'}},
                                     %{$parser->{'indices'}});
    } else { # an array holds index names defined with @defindex
      foreach my $name (@{$parser->{'indices'}}) {
        $parser->{'index_names'}->{$name} = {'in_code' => 0};
      }
    }
    foreach my $index (keys (%{$parser->{'index_names'}})) {
      if (!exists($parser->{'index_names'}->{$index}->{'name'})) {
        $parser->{'index_names'}->{$index}->{'name'} = $index;
      }
      if (!exists($parser->{'index_names'}->{$index}->{'contained_indices'})) {
        $parser->{'index_names'}->{$index}->{'contained_indices'}->{$index} = 1;
      }
      foreach my $prefix ($index, substr($index, 0, 1)) {
        $parser->{'line_commands'}->{$prefix.'index'} = 'line';
        $parser->{'no_paragraph_commands'}->{$prefix.'index'} = 1;
        $parser->{'command_index'}->{$prefix.'index'} = $index;
      }
    }
    if ($parser->{'merged_indices'}) {
      foreach my $index_from (keys (%{$parser->{'merged_indices'}})) {
        my $index_to = $parser->{'merged_indices'}->{$index_from};
        if (defined($parser->{'index_names'}->{$index_from})
            and defined($parser->{'index_names'}->{$index_to})) {
          $parser->{'index_names'}->{$index_from}->{'merged_in'} = $index_to;
          $parser->{'index_names'}->{$index_to}->{'contained_indices'}
                                                          ->{$index_from} = 1;
        }
      }
    }
  }

  # following is common with simple_parser
  $parser->_init_context_stack();

  # turn the array to a hash for speed.  Not sure it really matters for such
  # a small array.
  $parser->{'expanded_formats_hash'} = {};
  foreach my $expanded_format(@{$parser->{'EXPANDED_FORMATS'}}) {
    $parser->{'expanded_formats_hash'}->{$expanded_format} = 1;
  }

  if (not defined($parser->{'registrar'})) {
    $parser->{'registrar'} = Texinfo::Report::new();
  }

  return $parser;
}

# simple parser initialization.  The only difference with a regular parser
# is that the dynamical @-commands groups and indices information references
# that are initialized in each regular parser are initialized once for all
# and shared among simple parsers.  It is used in gdt() and this has a sizable
# effect on performance.
my $simple_parser_line_commands = dclone(\%line_commands);
my $simple_parser_brace_commands = dclone(\%brace_commands);
my $simple_parser_valid_nestings = dclone(\%default_valid_nestings);
my $simple_parser_no_paragraph_commands = { %default_no_paragraph_commands };
my $simple_parser_index_names = dclone(\%index_names);
my $simple_parser_command_index = {%command_index};
my $simple_parser_close_paragraph_commands = {%close_paragraph_commands};
my $simple_parser_close_preformatted_commands = {%close_preformatted_commands};
sub simple_parser(;$)
{
  my $conf = shift;

  my $parser = dclone(\%parser_default_configuration);
  bless $parser;

  _setup_conf($parser, $conf);

  $parser->{'line_commands'} = $simple_parser_line_commands;
  $parser->{'brace_commands'} = $simple_parser_brace_commands;
  $parser->{'valid_nestings'} = $simple_parser_valid_nestings;
  $parser->{'no_paragraph_commands'} = $simple_parser_no_paragraph_commands;
  $parser->{'index_names'} = $simple_parser_index_names;
  $parser->{'command_index'} = $simple_parser_command_index;
  $parser->{'close_paragraph_commands'} = $simple_parser_close_paragraph_commands;
  $parser->{'close_preformatted_commands'} = $simple_parser_close_preformatted_commands;

  # other initializations
  $parser->{'definfoenclose'} = {};
  $parser->{'source_mark_counters'} = {};
  $parser->{'nesting_context'} = {%nesting_context_init};

  $parser->_init_context_stack();

  # turn the array to a hash for speed.  Not sure it really matters for such
  # a small array.
  foreach my $expanded_format(@{$parser->{'EXPANDED_FORMATS'}}) {
    $parser->{'expanded_formats_hash'}->{$expanded_format} = 1;
  }

  if (not defined($parser->{'registrar'})) {
    $parser->{'registrar'} = Texinfo::Report::new();
  }

  return $parser;
}

sub get_conf($$)
{
  my ($self, $var) = @_;
  return $self->{$var};
}

sub _new_text_input($$)
{
  my $text = shift;
  my $input_source_info = shift;

  my $texthandle = do { local *FH };
  # FIXME in-memory scalar strings are considered a stream of bytes, so need
  # to encode/decode.  Is it a performance issue?  Do we care?
  $text = Encode::encode("utf8", $text);
  # Could fail with error like
  # Strings with code points over 0xFF may not be mapped into in-memory file handles
  if (!open ($texthandle, '<', \$text)) {
    my $error_message = $!;
    print STDERR "ERROR: open on a reference failed: $error_message\n";
    #return undef, $error_message;
  }
  return {'th' => $texthandle,
          'input_source_info' => $input_source_info};
}

sub _input_push_text($$$;$$)
{
  my ($self, $text, $line_nr, $macro_name, $value_name) = @_;

  if (not $self->{'input'}) {
    $self->{'input'} = [];
  }
  my $input_source_info = {'line_nr' => $line_nr, 'macro' => '',
                           'file_name' => ''};
  if (scalar(@{$self->{'input'}})) {
    $input_source_info->{'file_name'}
      = $self->{'input'}->[0]->{'input_source_info'}->{'file_name'};
  }
  if (defined($macro_name) and $macro_name ne '') {
    $input_source_info->{'macro'} = $macro_name;
  } elsif (not defined($value_name)) {
    # this counteracts the increment that would follow from the next
    # call to _next_text.
    $input_source_info->{'line_nr'} -= 1;
  }
  my $text_input = _new_text_input($text, $input_source_info);
  $text_input->{'value_flag'} = $value_name if (defined($value_name));
  unshift @{$self->{'input'}}, $text_input;
}

# push text sharing the same input_source_info as current top input
sub _input_pushback_text($$;$)
{
  my ($self, $text, $line_nr) = @_;

  if (defined($text) and $text ne '') {
    my $text_input = _new_text_input($text,
                          $self->{'input'}->[0]->{'input_source_info'});
    unshift @{$self->{'input'}}, $text_input;
    $text_input->{'input_source_info'}->{'line_nr'} -= 1
      unless($text_input->{'input_source_info'}->{'macro'} ne '');
  }
}

# entry point for text fragments.
# Used in some tests.
sub parse_texi_piece($$;$)
{
  my ($self, $text, $line_nr) = @_;

  return undef if (!defined($text));

  $line_nr = 1 if (not defined($line_nr));

  $self = parser() if (!defined($self));

  _input_push_text($self, $text, $line_nr);

  my ($document_root, $before_node_section)
     = _setup_document_root_and_before_node_section();
  my $tree = $self->_parse_texi($document_root, $before_node_section);

  return $tree;
}

sub parse_texi_line($$;$)
{
  my ($self, $text, $line_nr) = @_;

  return undef if (!defined($text));

  $line_nr = 1 if (not defined($line_nr));

  $self = parser() if (!defined($self));

  _input_push_text($self, $text, $line_nr);

  my $root = {'type' => 'root_line'};
  my $tree = $self->_parse_texi($root, $root);
  return $tree;
}

sub parse_texi_text($$;$)
{
  my ($self, $text, $line_nr) = @_;

  return undef if (!defined($text));

  $line_nr = 1 if (not defined($line_nr));

  $self = parser() if (!defined($self));

  _input_push_text($self, $text, $line_nr);

  return $self->_parse_texi_document();
}

# $INPUT_FILE_PATH the name of the opened file should be a binary string.
# Returns binary strings too.
sub _input_push_file
{
  my ($self, $input_file_path, $file_name_encoding) = @_;

  my $filehandle = do { local *FH };
  if (!open($filehandle, $input_file_path)) {
    return 0, undef, undef;
  }

  if (defined($self->{'info'}->{'input_perl_encoding'})) {
    if ($self->{'info'}->{'input_perl_encoding'} eq 'utf-8') {
      binmode($filehandle, ":utf8");
      # Use :utf8 instead of :encoding(utf-8), as the latter does
      # error checking and has (unreliably) led to fatal errors
      # when reading the first few lines of e.g. Latin-1 or Shift-JIS
      # files, even though @documentencoding is given early on in the file.
      # Evidently Perl is checking ahead in the file.
    } else {
      binmode($filehandle,
              ":encoding($self->{'info'}->{'input_perl_encoding'})");
    }
  }
  my ($file_name, $directories, $suffix) = fileparse($input_file_path);

  my $file_input = {
       'input_source_info' => {
          # binary
          'file_name' => $file_name,
          'line_nr' => 0,
          'macro' => '',
       },
       'fh' => $filehandle
    };

  $file_input->{'file_name_encoding'} = $file_name_encoding
       if (defined($file_name_encoding));
  $self->{'input'} = [] if (!defined($self->{'input'}));
  unshift @{$self->{'input'}}, $file_input;

  return 1, $file_name, $directories;
}

# parse a texi file
# $INPUT_FILE_PATH is the name of the parsed file and should be a binary string.
sub parse_texi_file($$)
{
  my ($self, $input_file_path) = @_;

  my ($status, $file_name, $directories)
    = _input_push_file($self, $input_file_path);
  if (!$status) {
    my $input_file_name = $input_file_path;
    my $encoding = $self->get_conf('COMMAND_LINE_ENCODING');
    if (defined($encoding)) {
      $input_file_name = decode($encoding, $input_file_path);
    }
    $self->{'registrar'}->document_error($self,
                 sprintf(__("could not open %s: %s"),
                                  $input_file_name, $!));
    return undef;
  }

  $self = parser() if (!defined($self));

  $self->{'info'}->{'input_file_name'} = $file_name;
  $self->{'info'}->{'input_directory'} = $directories;

  return $self->_parse_texi_document();
}

sub _parse_texi_document($)
{
  my $self = shift;

  my ($document_root, $before_node_section)
     = _setup_document_root_and_before_node_section();

  my $source_info;

  # put the empty lines and the \input line in a container at the beginning
  my $preamble_before_beginning;
  while (1) {
    my $line;
    ($line, $source_info) = _next_text($self);
    last if (!defined($line));
    # non ascii spaces do not start content
    if ($line =~ /^ *\\input/ or $line =~ /^\s*$/) {
      if (not defined($preamble_before_beginning)) {
        $preamble_before_beginning = {'type' => 'preamble_before_beginning',
                        'contents' => [], 'parent' => $before_node_section };
        push @{$before_node_section->{'contents'}}, $preamble_before_beginning;
      }
      push @{$preamble_before_beginning->{'contents'}},
                               { 'text' => $line,
                                 'type' => 'text_before_beginning',
                                 'parent' => $preamble_before_beginning };
    } else {
      # This line is not part of the preamble_before_beginning.
      # Shove back into input stream.
      _input_pushback_text($self, $line);
      last;
    }
  }

  my $tree = $self->_parse_texi($document_root, $before_node_section);

  Texinfo::Common::rearrange_tree_beginning($self, $before_node_section);

  return $tree;
}

# return indices information
sub indices_information($)
{
  my $self = shift;
  return $self->{'index_names'};
}

sub floats_information($)
{
  my $self = shift;
  return $self->{'floats'};
}

sub internal_references_information($)
{
  my $self = shift;
  return $self->{'internal_references'};
}

sub global_commands_information($)
{
  my $self = shift;
  return $self->{'commands_info'};
}

# @ dircategory_direntry
# perl_encoding
# input_encoding_name
# input_file_name
# input_directory
sub global_information($)
{
  my $self = shift;
  return $self->{'info'};
}

sub labels_information($)
{
  my $self = shift;
  return $self->{'labels'}, $self->{'targets'}, $self->{'nodes'};
}

sub registered_errors($)
{
  my $self = shift;
  return $self->{'registrar'};
}

sub _setup_conf($$)
{
  my ($parser, $conf) = @_;

  $parser->{'set'} = {};
  if (defined($conf)) {
    foreach my $key (keys(%$conf)) {
      if (exists($parser_settable_configuration{$key})) {
        # we keep registrar instead of copying on purpose, to reuse the object
        if ($key ne 'values' and $key ne 'registrar' and ref($conf->{$key})) {
          $parser->{$key} = dclone($conf->{$key});
        } else {
          $parser->{$key} = $conf->{$key};
        }
        if ($initialization_overrides{$key}) {
          $parser->{'set'}->{$key} = $parser->{$key};
        }
      } else {
        warn "ignoring parser configuration value \"$key\"\n";
      }
    }
  }
}

# Following are the internal parsing subroutines.  The most important are
#
# _parse_texi:                main entry point, loop on input lines.
# _process_remaining_on_line: the main parser loop.
# _end_line:                  called at an end of line.  Handling of
#                             @include lines is done here.
# _next_text:                 present the next text fragment, from
#                             pending text or line.

# Taking an encoding name $ENCODING as argument, the function returns
# $canonical_texinfo_encoding: the corresponding canonical Texinfo encoding,
#                              as described in the Texinfo manual (or undef);
# $perl_encoding:              an encoding name suitable for perl;
# $canonical_output_encoding:  an encoding name suitable for most
#                              output formats, especially HTML.
sub _encoding_alias($)
{
  my $encoding = shift;
  my $Encode_encoding_object = find_encoding($encoding);
  my ($perl_encoding, $canonical_output_encoding);
  if (defined($Encode_encoding_object)) {
    $perl_encoding = $Encode_encoding_object->name();
    # mime_name() is upper-case, our keys are lower case, set to lower case
    $canonical_output_encoding = lc($Encode_encoding_object->mime_name());
  }
  my $canonical_texinfo_encoding;
  foreach my $possible_encoding ($encoding, $canonical_output_encoding,
                                            $perl_encoding) {
    if (defined($possible_encoding)
        and $canonical_texinfo_encodings{lc($possible_encoding)}) {
      $canonical_texinfo_encoding = $possible_encoding;
    }
  }
  return ($canonical_texinfo_encoding, $perl_encoding,
          $canonical_output_encoding);
}

# context stack functions
sub _init_context_stack($)
{
  my $self = shift;
  $self->{'context_stack'} = ['_root'];
  $self->{'context_command_stack'} = [''];
}

sub _push_context($$$)
{
  my ($self, $context, $command) = @_;

  push @{$self->{'context_stack'}}, $context;
  push @{$self->{'context_command_stack'}}, $command;
}

# if needed it could be possible to guard against removing '_root' context
# but it is unlikely to be useful since the expected context is checked.
sub _pop_context($$$$;$)
{
  my ($self, $expected_contexts, $source_info, $current, $message) = @_;

  my $popped_context = pop @{$self->{'context_stack'}};
  if (not grep {$_ eq $popped_context} @$expected_contexts) {
    my $error_message = "context $popped_context instead of "
         .join(" or ", @$expected_contexts);
    $error_message .= "; $message" if (defined($message));
    $self->_bug_message($error_message, $source_info, $current);
    cluck;
    die;
  }
  my $popped_command = pop @{$self->{'context_command_stack'}};
}

sub _get_context_stack($)
{
  my $self = shift;
  (undef, my @context_stack) = @{$self->{'context_stack'}};
  return @context_stack;
}

sub _top_context($)
{
  my $self = shift;
  return $self->{'context_stack'}->[-1];
}

# find first non undef command
sub _top_context_command($)
{
  my $self = shift;
  for (my $i = scalar(@{$self->{'context_command_stack'}}) -1; $i > 0; $i--) {
    if (defined($self->{'context_command_stack'}->[$i])) {
      return $self->{'context_command_stack'}->[$i];
    }
  }
  return undef;
}

# register warnings and errors
sub _line_warn
{
  my $self = shift;
  my $registrar = $self->{'registrar'};
  $registrar->line_warn($self, @_);
}

sub _line_error
{
  my $self = shift;
  my $registrar = $self->{'registrar'};
  $registrar->line_error($self, @_);
}

# Format a bug message
sub _bug_message($$;$$)
{
  my ($self, $message, $source_info, $current) = @_;

  my $line_message = '';
  if ($source_info) {
    my $file = $source_info->{'file_name'};
    $line_message
      = "last location: $source_info->{'file_name'}:$source_info->{'line_nr'}";
    if ($source_info->{'macro'} ne '') {
      $line_message .= " (possibly involving $source_info->{'macro'})";
    }
    $line_message .= "\n";
  }
  my @context_stack = $self->_get_context_stack;
  my $message_context_stack = "context_stack: (@context_stack)\n";
  my $current_element_message = '';
  if ($current) {
    $current_element_message = "current: ". _print_current($current);
  }
  warn "You found a bug: $message\n\n".
       "Additional information:\n".
       $line_message.$message_context_stack.$current_element_message;
}

# for debugging
sub _print_current($)
{
  my $current = shift;
  return Texinfo::Common::debug_print_element($current);
}

# for debugging
sub _print_command_args_texi($)
{
  my $current = shift;
  return '' if (!$current->{'cmdname'});
  my $args = '';
  my $with_brace;
  if ($current->{'args'} and @{$current->{'args'}}) {
    $with_brace
        = ($current->{'args'}->[0]->{'type'} eq 'brace_command_arg'
           or $current->{'args'}->[0]->{'type'} eq 'brace_command_context');
    $args .= '{' if ($with_brace);
    foreach my $arg (@{$current->{'args'}}) {
      $args .= Texinfo::Convert::Texinfo::convert_to_texinfo($arg).', ';
    }
    $args =~ s/, $//;
  }
  chomp($args);
  if ($with_brace) {
    $args .= '}';
  }
  return '@'.$current->{'cmdname'} .$args."\n";
}

sub _register_global_command {
  my ($self, $current, $source_info) = @_;

  my $command = $current->{'cmdname'};

  if ($command eq 'summarycontents') {
    $command = 'shortcontents';
  }
  if ($global_multiple_commands{$command}) {
    push @{$self->{'commands_info'}->{$command}}, $current;
    $current->{'source_info'} = $source_info if (!$current->{'source_info'});
    return 1;
  } elsif ($global_unique_commands{$command}) {
    # setfilename ignored in an included file
    $current->{'source_info'} = $source_info if (!$current->{'source_info'});
    if ($command eq 'setfilename'
        and _in_include($self)) {
    } elsif (exists ($self->{'commands_info'}->{$current->{'cmdname'}})) {
      $self->_line_warn(sprintf(__('multiple @%s'),
                               $current->{'cmdname'}), $source_info);
    } else {
      $self->{'commands_info'}->{$current->{'cmdname'}} = $current;
    }
    return 1;
  }
  return 0;
}

# $ELEMENT should be the parent container.
# The source mark is put in the last content if it is text
# or registered in the parent container.
sub _register_source_mark
{
  my ($self, $element, $source_mark) = @_;

  if (!defined($source_mark->{'counter'})) {
    my $counter_name = $source_mark->{'sourcemark_type'};
    if (!$self->{'source_mark_counters'}->{$counter_name}) {
      $self->{'source_mark_counters'}->{$counter_name} = 0;
    }
    $self->{'source_mark_counters'}->{$counter_name} += 1;
    $source_mark->{'counter'}
      = $self->{'source_mark_counters'}->{$counter_name};
  }
  _place_source_mark($self, $element, $source_mark);
}

sub _place_source_mark
{
  my ($self, $element, $source_mark) = @_;

  # for debug
  my $add_element = 'no-add';
  delete $source_mark->{'position'};
  # the element that holds the source mark
  my $mark_element;
  if ($element->{'contents'} and scalar(@{$element->{'contents'}}) > 0) {
    my $current = $element->{'contents'}->[-1];
    $mark_element = $current;
    if (defined($current->{'text'}) and $current->{'text'} ne '') {
      $source_mark->{'position'} = length($current->{'text'});
    }
  } else {
    # add an empty element only used for source marks
    # 'text' is here to have merge_text work as expected
    $mark_element = {'parent' => $element, 'text' => ''};
    $element->{'contents'} = [] unless (defined($element->{'contents'}));
    push @{$element->{'contents'}}, $mark_element;
    $add_element = 'add';
  }

  print STDERR "MARKS: $source_mark->{'sourcemark_type'} c: "
    .(defined($source_mark->{'counter'}) ? $source_mark->{'counter'}: 'UNDEF')
    .", ".(defined($source_mark->{'position'})
             ? $source_mark->{'position'}: 'UNDEF')." "
     .(defined($source_mark->{'status'}) ? $source_mark->{'status'}: 'UNDEF')
     ." $add_element ".Texinfo::Common::debug_print_element_short($mark_element)
      .' '.Texinfo::Common::debug_print_element_short($element)."\n"
        if ($self->{'DEBUG'});
        ;

  if (!$mark_element->{'source_marks'}) {
    $mark_element->{'source_marks'} = [];
  }
  push @{$mark_element->{'source_marks'}}, $source_mark;
}

sub _transfer_source_marks($$)
{
  my $from_e = shift;
  my $element = shift;
  if ($from_e->{'source_marks'}) {
    if (!$element->{'source_marks'}) {
      $element->{'source_marks'} = [];
    }
    push @{$element->{'source_marks'}}, @{$from_e->{'source_marks'}};
    delete $from_e->{'source_marks'};
  }
}

# parse a @macro line
sub _parse_macro_command_line($$$$$;$)
{
  my ($self, $command, $line, $parent, $source_info) = @_;

  my $macro = { 'cmdname' => $command, 'parent' => $parent,
               'info' => {'arg_line' => $line}, 'source_info' => $source_info };
  # REMACRO
  if ($line =~ /^\s+([[:alnum:]][[:alnum:]_-]*)\s*(.*)/) {
    my $macro_name = $1;
    my $args_def = $2;
    my @args;

    if ($args_def =~ s/^\s*{\s*(.*?)\s*}\s*//) {
      @args = split(/\s*,\s*/, $1);
    }

    print STDERR "MACRO \@$command $macro_name\n" if ($self->{'DEBUG'});

    $macro->{'args'} = [
      { 'type' => 'macro_name', 'text' => $macro_name,
          'parent' => $macro } ];
    foreach my $formal_arg (@args) {
      push @{$macro->{'args'}},
        { 'type' => 'macro_arg', 'text' => $formal_arg,
          'parent' => $macro};
      if ($formal_arg !~ /^[\w\-]+$/) {
        $self->_line_error(sprintf(__("bad or empty \@%s formal argument: %s"),
                                   $command, $formal_arg), $source_info);
        $macro->{'extra'} = {'invalid_syntax' => 1};
      }
    }
    # accept an @-command after the arguments in case there is a @c or
    # @comment
    if ($args_def =~ /^\s*[^\@]/) {
      $self->_line_error(sprintf(__("bad syntax for \@%s argument: %s"),
                                 $command, $args_def),
                         $source_info);
      $macro->{'extra'} = {'invalid_syntax' => 1};
    }
  } elsif ($line !~ /\S/) {
    $self->_line_error(sprintf(
               __("%c%s requires a name"), ord('@'), $command), $source_info);
    $macro->{'extra'} = {'invalid_syntax' => 1};
  } else {
    $self->_line_error(sprintf(
                    __("bad name for \@%s"), $command), $source_info);
    $macro->{'extra'} = {'invalid_syntax' => 1};
  }
  return $macro;
}

# start a paragraph if in a context where paragraphs are to be started.
sub _begin_paragraph($$;$)
{
  my ($self, $current, $source_info) = @_;

  # !$current->{'type'} is true for @-commands and for text without
  # type nor command.
  if ((!$current->{'type'} or $type_with_paragraph{$current->{'type'}})
      and !$no_paragraph_contexts{$self->_top_context()}) {

    # find whether an @indent precedes the paragraph
    my $indent;
    if ($current->{'contents'}) {
      my $index = scalar(@{$current->{'contents'}}) -1;
      while ($index >= 0
            and !($current->{'contents'}->[$index]->{'type'}
              and ($current->{'contents'}->[$index]->{'type'} eq 'empty_line'
                   or $current->{'contents'}->[$index]->{'type'} eq 'paragraph'))
            and !($current->{'contents'}->[$index]->{'cmdname'}
                  and $self->{'close_paragraph_commands'}
                           ->{$current->{'contents'}->[$index]->{'cmdname'}})) {
        if ($current->{'contents'}->[$index]->{'cmdname'}
          and ($current->{'contents'}->[$index]->{'cmdname'} eq 'indent'
              or $current->{'contents'}->[$index]->{'cmdname'} eq 'noindent')) {
          $indent = $current->{'contents'}->[$index]->{'cmdname'};
          last;
        }
        $index--;
      }
    }
    push @{$current->{'contents'}},
            { 'type' => 'paragraph', 'parent' => $current };
    $current = $current->{'contents'}->[-1];
    if ($indent) {
      $current->{'extra'} = {$indent => 1};
    }
    print STDERR "PARAGRAPH\n" if ($self->{'DEBUG'});
    return $current;
  }
  return 0;
}

sub _begin_preformatted($$)
{
  my ($self, $current) = @_;

  if ($self->_top_context() eq 'ct_preformatted') {
    push @{$current->{'contents'}},
          { 'type' => 'preformatted',
            'parent' => $current };
    $current = $current->{'contents'}->[-1];
    print STDERR "PREFORMATTED\n" if ($self->{'DEBUG'});
  }
  return $current;
}

# wrapper around line_warn.  Set source_info to be the source_info of
# the command, corresponding to the opening of the command.
# Call line_warn with sprintf if needed.
sub _command_warn($$$$;@)
{
  my $self = shift;
  my $current = shift;
  my $source_info = shift;
  my $message = shift;

  if ($current->{'source_info'}) {
    $source_info = $current->{'source_info'};
  }
  if (@_) {
    $self->_line_warn(sprintf($message, @_), $source_info);
  } else {
    $self->_line_warn($message, $source_info);
  }
}

sub _command_error($$$$;@)
{
  my $self = shift;
  my $current = shift;
  my $source_info = shift;
  my $message = shift;

  # use the beginning of the @-command for the error message
  # line number if available.
  if ($current->{'source_info'}) {
    $source_info = $current->{'source_info'};
  }
  if (@_) {
    $self->_line_error(sprintf($message, @_), $source_info);
  } else {
    $self->_line_error($message, $source_info);
  }
}

# register error messages, but otherwise doesn't do much more than
# return $_[1]->{'parent'}
sub _close_brace_command($$$;$$$)
{
  my ($self, $current, $source_info, $closed_block_command,
      $interrupting_command, $missing_brace) = @_;

  if ($self->{'brace_commands'}->{$current->{'cmdname'}} eq 'context') {
    my $expected_context;
    if ($math_commands{$current->{'cmdname'}}) {
      $expected_context = 'ct_math';
    } else {
      $expected_context = 'ct_brace_command';
    }
    $self->_pop_context([$expected_context], $source_info, $current);

    $self->{'nesting_context'}->{'footnote'} -= 1
      if ($current->{'cmdname'} eq 'footnote');
    $self->{'nesting_context'}->{'caption'} -= 1
      if ($current->{'cmdname'} eq 'caption'
        or $current->{'cmdname'} eq 'shortcaption');
  }

  pop @{$self->{'nesting_context'}->{'basic_inline_stack'}}
    if ($self->{'basic_inline_commands'}->{$current->{'cmdname'}});

  if ($current->{'cmdname'} ne 'verb'
      or $current->{'info'}->{'delimiter'} eq '') {
    if (defined($closed_block_command)) {
      $self->_command_error($current, $source_info,
        __("\@end %s seen before \@%s closing brace"),
                  $closed_block_command, $current->{'cmdname'});
    } elsif (defined($interrupting_command)) {
      $self->_command_error($current, $source_info,
        __("\@%s seen before \@%s closing brace"),
                  $interrupting_command, $current->{'cmdname'});
    } elsif ($missing_brace) {
      $self->_command_error($current, $source_info,
        __("%c%s missing closing brace"), ord('@'), $current->{'cmdname'});
    }
  } elsif ($missing_brace) {
    $self->_command_error($current, $source_info,
       __("\@%s missing closing delimiter sequence: %s}"),
       $current->{'cmdname'}, $current->{'info'}->{'delimiter'});
  }
  $current = $current->{'parent'};
  return $current;
}

sub _in_preformatted_context_not_menu($)
{
  my $self = shift;

  for (my $i = scalar(@{$self->{'context_command_stack'}}) -1; $i > 0; $i--) {
    my $context = $self->{'context_stack'}->[$i];
    # allow going through line context, for @*table to find the
    # outside context, and also assuming that they are in the same context
    # in term of preformatted.  Maybe def could be traversed too.
    if ($context ne 'ct_line' and $context ne 'ct_preformatted') {
      return 0;
    }
    my $command_name = $self->{'context_command_stack'}->[$i];
    if (defined($command_name)
        and (not $block_commands{$command_name} eq 'menu')
        and $context eq 'ct_preformatted') {
      return 1;
    }
  }
  return 0;
}

sub _kbd_formatted_as_code($$)
{
  my ($self, $current) = @_;

  if ($self->{'kbdinputstyle'} eq 'code') {
    return 1;
  } elsif ($self->{'kbdinputstyle'} eq 'example') {
    if ($self->_in_preformatted_context_not_menu()) {
      return 0;
    } else {
      return 1;
    }
  }
  return 0;
}

sub _in_paragraph($$)
{
  my ($self, $current) = @_;
  while ($current->{'parent'} and $current->{'parent'}->{'cmdname'}
         and exists($self->{'brace_commands'}
                                      ->{$current->{'parent'}->{'cmdname'}})
         and $self->{'brace_commands'}
                           ->{$current->{'parent'}->{'cmdname'}} ne 'context') {
    $current = $current->{'parent'}->{'parent'};
  }
  if ($current->{'type'} and $current->{'type'} eq 'paragraph') {
    return 1;
  } else {
    return 0;
  }
}

# close brace commands that don't set a new context (ie not @caption, @footnote)
sub _close_all_style_commands($$$;$$)
{
  my ($self, $current, $source_info, $closed_block_command,
      $interrupting_command) = @_;

  while ($current->{'parent'} and $current->{'parent'}->{'cmdname'}
          and exists($self->{'brace_commands'}
                                      ->{$current->{'parent'}->{'cmdname'}})
          and $self->{'brace_commands'}
                           ->{$current->{'parent'}->{'cmdname'}} ne 'context') {
    print STDERR "CLOSING(_close_all_style_commands) "
      ."\@$current->{'parent'}->{'cmdname'}\n"
         if ($self->{'DEBUG'});
    $current = _close_brace_command($self, $current->{'parent'}, $source_info,
                                    $closed_block_command,
                                    $interrupting_command, 1);
  }

  return $current;
}

# close brace commands except for @caption, @footnote then the paragraph
sub _end_paragraph($$$;$$)
{
  my ($self, $current, $source_info, $closed_block_command,
      $interrupting_command) = @_;

  $current = _close_all_style_commands($self, $current, $source_info,
                                       $closed_block_command,
                                       $interrupting_command);
  if ($current->{'type'} and $current->{'type'} eq 'paragraph') {
    print STDERR "CLOSE PARA\n" if ($self->{'DEBUG'});
    $current = $current->{'parent'};
  }
  return $current;
}

sub _is_container_empty($)
{
  my $current = shift;
  if (not $current->{'contents'}
      and not $current->{'args'}
      and (not defined($current->{'text'}) or $current->{'text'} eq '')
      and not $current->{'info'}) {
    return 1;
  }
  return 0;
}

sub _close_container($$)
{
  my $self = shift;
  my $current = shift;

  # remove an empty content that only holds source marks
  if ($current->{'contents'} and scalar(@{$current->{'contents'}}) == 1) {
    my $child_element = $current->{'contents'}->[0];
    if (not defined($child_element->{'cmdname'})
        and _is_container_empty($child_element)) {
      _transfer_source_marks($child_element, $current);
      print STDERR "REMOVE empty child "
         .Texinfo::Common::debug_print_element_short($child_element)
          .' '.Texinfo::Common::debug_print_element_short($current)."\n"
            if ($self->{'DEBUG'});
      _pop_element_from_contents($self, $current);
    }
  }

  # remove element without contents nor associated information
  my $element_to_remove;
  if (_is_container_empty($current)) {
    if ($current->{'source_marks'}) {
      # Keep the element to keep the source mark, but remove some types.
      # Keep before_item in order not to add empty table definition in
      # gather_previous_item.
      delete $current->{'type'} if ($current->{'type'} ne 'before_item');
    } else {
      $element_to_remove = $current;
    }
  }
  $current = $current->{'parent'};

  if ($element_to_remove
      # this is to avoid removing empty containers in args,
      # happens with brace commands not closed at the end of
      # a manual
      and $current->{'contents'}
      and scalar(@{$current->{'contents'}})
      and $current->{'contents'}->[-1] eq $element_to_remove) {
    print STDERR "REMOVE empty type "
      .Texinfo::Common::debug_print_element_short($element_to_remove)."\n"
        if ($self->{'DEBUG'});
    _pop_element_from_contents($self, $current);
  }
  return $current;
}

# close brace commands except for @caption, @footnote then the preformatted
sub _end_preformatted($$$;$$)
{
  my ($self, $current, $source_info, $closed_block_command,
      $interrupting_command) = @_;

  $current = _close_all_style_commands($self, $current, $source_info,
                                       $closed_block_command,
                                       $interrupting_command);

  if ($current->{'type'} and $current->{'type'} eq 'preformatted') {
    print STDERR "CLOSE PREFORMATTED\n" if ($self->{'DEBUG'});
    $current = _close_container($self, $current);
  }
  return $current;
}

# check that there are no text holding environment (currently
# checking only paragraphs and preformatted) in contents
sub _check_no_text($)
{
  my $current = shift;
  my $after_paragraph = 0;
  foreach my $content (@{$current->{'contents'}}) {
    if ($content->{'type'} and $content->{'type'} eq 'paragraph') {
      $after_paragraph = 1;
      last;
    } elsif ($content->{'type'} and $content->{'type'} eq 'preformatted') {
      foreach my $preformatted_content (@{$content->{'contents'}}) {
        if ((defined($preformatted_content->{'text'})
             and $preformatted_content->{'text'} =~ /\S/)
            or ($preformatted_content->{'cmdname'}
                and ($preformatted_content->{'cmdname'} ne 'c'
                     and $preformatted_content->{'cmdname'} ne 'comment')
                and !($preformatted_content->{'type'}
                      and $preformatted_content->{'type'} eq 'index_entry_command'))) {
          $after_paragraph = 1;
          last;
        }
      }
      last if ($after_paragraph);
    }
  }
  return $after_paragraph;
}

# put everything after the last @item/@itemx in a table_entry type
# container and distinguish table_term and table_definition.
sub _gather_previous_item($$;$$)
{
  my ($self, $current, $next_command, $source_info) = @_;

  # nothing to do in that case.
  if ($current->{'contents'}->[-1]->{'type'}
      and $current->{'contents'}->[-1]->{'type'} eq 'before_item') {
    if ($next_command and $next_command eq 'itemx') {
      $self->_line_error(sprintf(__("\@itemx should not begin \@%s"),
                                $current->{'cmdname'}), $source_info);
    }
    return;
  }
  my $type;
  # if before an itemx, the type is different since there should not be
  # real content, so it may be treated differently
  if ($next_command and $next_command eq 'itemx') {
    $type = 'inter_item';
  } else {
    $type = 'table_definition';
  }

  # remove everything that is not an @item/@itemx or before_item to
  # put it in the table_definition/inter_item
  my $contents_count = scalar(@{$current->{'contents'}});
  my $splice_idx;
  for (my $i = $contents_count - 1; $i >= 0; $i--) {
    if ($current->{'contents'}->[$i]->{'cmdname'}
        and ($current->{'contents'}->[$i]->{'cmdname'} eq 'item'
             or ($current->{'contents'}->[$i]->{'cmdname'} eq 'itemx'))) {
      $splice_idx = $i + 1;
      last;
    }
  }
  $splice_idx = 0 if !defined($splice_idx);

  my $splice_idx2;

  if (defined($next_command)) {
    # Don't absorb trailing index entries as they are included with a
    # following @item.
    for (my $i = $contents_count - 1; $i >= $splice_idx; $i--) {
      if (!$current->{'contents'}->[$i]->{'type'}
        or $current->{'contents'}->[$i]->{'type'} ne 'index_entry_command') {
        $splice_idx2 = $i + 1;
        last;
      }
    }
  }
  $splice_idx2 = $contents_count if !defined($splice_idx2);

  my $table_after_terms;
  if ($splice_idx2 - $splice_idx) {
    my $new_contents = [];
    @{$new_contents} = splice @{$current->{'contents'}},
                              $splice_idx, $splice_idx2 - $splice_idx;
    $table_after_terms = {'type' => $type,
                           'contents' => $new_contents};
    foreach my $child (@{$new_contents}) {
      $child->{'parent'} = $table_after_terms;
    }
  }

  if ($type eq 'table_definition') {
    my $before_item;

    # setup a table_entry
    my $table_entry = {'type' => 'table_entry',
                    'parent' => $current,
                    'contents' => []};
    my $table_term = {'type' => 'table_term',
                    'parent' => $table_entry, };
    push @{$table_entry->{'contents'}}, $table_term;

    # put everything starting from the end until reaching the previous
    # table entry or beginning of the table in table_term.
    my $contents_count = scalar(@{$current->{'contents'}});
    my $splice_idx3;
    for (my $i = $splice_idx - 1; $i >= 0; $i--) {
      if ($current->{'contents'}->[$i]->{'type'}
           # reached the beginning of the table
           and ($current->{'contents'}->[$i]->{'type'} eq 'before_item'
                # reached the previous table entry
                or $current->{'contents'}->[$i]->{'type'} eq 'table_entry')) {
        if ($current->{'contents'}->[$i]->{'type'} eq 'before_item') {
          $before_item = $current->{'contents'}->[$i];
        }
        $splice_idx3 = $i + 1;
        last;
      }
    }
    $splice_idx3 = 0 if !defined($splice_idx3);

    if ($splice_idx3 - $splice_idx) {
      my $new_contents = [];
      @{$new_contents} = splice @{$current->{'contents'}},
                                $splice_idx3, $splice_idx - $splice_idx3;
      $table_term->{'contents'} = $new_contents;
      for my $child (@{$new_contents}) {
        $child->{'parent'} = $table_term;
      }
    }
    if (defined($before_item) and $before_item->{'contents'}
        and scalar(@{$before_item->{'contents'}})) {
      # reparent any trailing index entries in the before_item to the
      # beginning of table term
      while ($before_item->{'contents'}
             and scalar(@{$before_item->{'contents'}})
             and (($before_item->{'contents'}->[-1]->{'type'}
                   and $before_item->{'contents'}->[-1]->{'type'}
                     eq 'index_entry_command')
                  or ($before_item->{'contents'}->[-1]->{'cmdname'}
                   and ($before_item->{'contents'}->[-1]->{'cmdname'}
                           eq 'c'
                        or $before_item->{'contents'}->[-1]->{'cmdname'}
                           eq 'comment')))) {
        my $element = _pop_element_from_contents($self, $before_item);
        unshift @{$table_term->{'contents'}}, $element;
      }
    }
    if ($table_after_terms) {
      # $table_after_terms necessarily with contents if defined
      push @{$table_entry->{'contents'}}, $table_after_terms;
      $table_after_terms->{'parent'} = $table_entry;
    }
    splice @{$current->{'contents'}}, $splice_idx3, 0, $table_entry;
  } else {
    if ($table_after_terms) {
      my $after_paragraph = _check_no_text($table_after_terms);
      if ($after_paragraph) {
        $self->_line_error(__("\@itemx must follow \@item"), $source_info);
      }
      if (scalar(@{$table_after_terms->{'contents'}})) {
        splice @{$current->{'contents'}}, $splice_idx, 0, $table_after_terms;
        $table_after_terms->{'parent'} = $current;
      }
    }
  }
}

# Starting from the end, gather everything util the def_line to put in
# a def_item
sub _gather_def_item($$;$)
{
  my ($self, $current, $next_command) = @_;

  my $type;
  # means that we are between a @def*x and a @def
  if ($next_command) {
    $type = 'inter_def_item';
  } else {
    $type = 'def_item';
  }

  # This may happen for a construct like
  # @deffnx a b @section
  # but otherwise the end of line will lead to the command closing
  return if (!$current->{'cmdname'} or $current->{'cmdname'} =~ /x$/);
  my $def_item = {'type' => $type,
                  'parent' => $current,
                  'contents' => []};
  # remove everything that is not a def_line to put it in the def_item,
  # starting from the end.
  my $contents_count = scalar(@{$current->{'contents'}});
  for (my $i = 0; $i < $contents_count; $i++) {
    if ($current->{'contents'}->[-1]->{'type'}
        and $current->{'contents'}->[-1]->{'type'} eq 'def_line') {
      last;
    } else {
      my $item_content = _pop_element_from_contents($self, $current);
      $item_content->{'parent'} = $def_item;
      unshift @{$def_item->{'contents'}}, $item_content;
    }
  }
  if (scalar(@{$def_item->{'contents'}})) {
    push @{$current->{'contents'}}, $def_item;
  }
}

# close formats
sub _close_command_cleanup($$) {
  my ($self, $current) = @_;

  return unless ($current->{'cmdname'});
  # remove the dynamic counters in multitable, they are not of use in the final
  # tree.  Also determine the multitable_body and multitable_head with
  # @item or @headitem rows.
  if ($current->{'cmdname'} eq 'multitable') {
    my $in_head_or_rows;
    my @contents;
    @contents = @{$current->{'contents'}} if ($current->{'contents'});
    $current->{'contents'} = [];
    foreach my $row (@contents) {
      if ($row->{'type'} and $row->{'type'} eq 'row') {
        delete $row->{'cells_count'};
        if ($row->{'contents'}->[0]->{'cmdname'} eq 'headitem') {
          if (!$in_head_or_rows) {
            push @{$current->{'contents'}}, {'type' => 'multitable_head',
                                             'parent' => $current};
            $in_head_or_rows = 1;
          }
        } elsif ($row->{'contents'}->[0]->{'cmdname'} eq 'item') {
          if (!defined($in_head_or_rows) or $in_head_or_rows) {
            push @{$current->{'contents'}}, {'type' => 'multitable_body',
                                             'parent' => $current};
            $in_head_or_rows = 0;
          }
        }
        push @{$current->{'contents'}->[-1]->{'contents'}}, $row;
        $row->{'parent'} = $current->{'contents'}->[-1];
      } else {
        push @{$current->{'contents'}}, $row;
        $in_head_or_rows = undef;
      }
    }
    delete $current->{'rows_count'};
  } elsif ($block_commands{$current->{'cmdname'}}
           and $block_commands{$current->{'cmdname'}} eq 'item_container') {
    delete $current->{'items_count'};
  }

  # put everything after the last @def*x command in a def_item type container.
  if ($def_commands{$current->{'cmdname'}}) {
    # At this point the end command hasn't been added to the command contents.
    # so checks cannot be done at this point.
    _gather_def_item($self, $current);
  }

  if ($block_commands{$current->{'cmdname'}}
      and $block_commands{$current->{'cmdname'}} eq 'item_line') {
    # At this point the end command hasn't been added to the command contents.
    # so checks cannot be done at this point.
    if ($current->{'contents'} and scalar(@{$current->{'contents'}})) {
      _gather_previous_item($self, $current);
    }
  }

  # Block commands that contain @item's - e.g. @multitable, @table,
  # @itemize.
  # put end out of before_item, and replace it at the end of the parent.
  # remove empty before_item.
  # warn if not empty before_item, but format is empty
  if ($blockitem_commands{$current->{'cmdname'}}) {
    if ($current->{'contents'} and scalar(@{$current->{'contents'}})) {
      my $leading_spaces = 0;
      my $before_item;
      if ($current->{'contents'}->[0]->{'type'}
          and $current->{'contents'}->[0]->{'type'} eq 'ignorable_spaces_after_command'
          and $current->{'contents'}->[1]
          and $current->{'contents'}->[1]->{'type'}
          and $current->{'contents'}->[1]->{'type'} eq 'before_item') {
        $leading_spaces = 1;
        $before_item = $current->{'contents'}->[1];
      } elsif ($current->{'contents'}->[0]->{'type'}
              and $current->{'contents'}->[0]->{'type'} eq 'before_item') {
        $before_item = $current->{'contents'}->[0];
      }
      if ($before_item) {
        if ($before_item->{'contents'}
            and scalar(@{$before_item->{'contents'}}) > 0
            and $before_item->{'contents'}->[-1]->{'cmdname'}
            and $before_item->{'contents'}->[-1]->{'cmdname'} eq 'end') {
          my $end = _pop_element_from_contents($self, $before_item);
          $end->{'parent'} = $current;
          push @{$current->{'contents'}}, $end;
        }
        # remove empty before_items.  Both conditions can happen, the first
        # if the before item remained empty, the second if after removing end
        # and spaces it became empty.
        if (_is_container_empty($before_item)
            and not $before_item->{'source_marks'}) {
          if ($leading_spaces) {
            my $space = shift @{$current->{'contents'}};
            shift @{$current->{'contents'}};
            unshift @{$current->{'contents'}}, $space;
          } else {
            shift @{$current->{'contents'}};
          }
        } else {
          # warn if not empty before_item, but format is empty
          my $empty_before_item = 1;
          if ($before_item->{'contents'}) {
            foreach my $before_item_content (@{$before_item->{'contents'}}) {
              if (!$before_item_content->{'cmdname'} or
                    ($before_item_content->{'cmdname'} ne 'c'
                     and $before_item_content->{'cmdname'} ne 'comment')) {
                $empty_before_item = 0;
                last;
              }
            }
          }
          if (!$empty_before_item) {
            my $empty_format = 1;
            foreach my $format_content (@{$current->{'contents'}}) {
              next if ($format_content eq $before_item);
              if (($format_content->{'cmdname'}
                   and ($format_content->{'cmdname'} ne 'c'
                        and $format_content->{'cmdname'} ne 'comment'
                        and $format_content->{'cmdname'} ne 'end'))
                  or ($format_content->{'type'} and
                   ($format_content->{'type'} ne 'ignorable_spaces_after_command'))) {
                $empty_format = 0;
                last;
              }
            }
            if ($empty_format) {
              $self->_line_warn(sprintf(__("\@%s has text but no \@item"),
                           $current->{'cmdname'}), $current->{'source_info'});
            }
          }
        }
      }
    }
  }
}

sub _pop_block_command_contexts($$$;$)
{
  my $self = shift;
  my $current = shift;
  my $source_info = shift;
  my $context_string = shift;
  if ($preformatted_commands{$current->{'cmdname'}}
      or $block_commands{$current->{'cmdname'}} eq 'menu') {
    $self->_pop_context(['ct_preformatted'], $source_info, $current,
                        $context_string);
  } elsif ($block_commands{$current->{'cmdname'}} eq 'format_raw') {
    $self->_pop_context(['ct_rawpreformatted'], $source_info, $current,
                        $context_string);
  } elsif ($math_commands{$current->{'cmdname'}}) {
    $self->_pop_context(['ct_math'], $source_info, $current,
                        $context_string);
  } elsif ($block_commands{$current->{'cmdname'}} eq 'region') {
    pop @{$self->{'regions_stack'}};
  }
}

# close the current command, with error messages and give the parent.
# If the last argument is given it is the command being closed if
# hadn't there be an error, currently only block command, used for a
# better error message.
sub _close_current($$$;$$)
{
  my ($self, $current, $source_info, $closed_block_command,
      $interrupting_command) = @_;
  # Element is a command
  if ($current->{'cmdname'}) {
    print STDERR "CLOSING(close_current) \@$current->{'cmdname'}\n"
         if ($self->{'DEBUG'});
    if (exists($self->{'brace_commands'}->{$current->{'cmdname'}})) {
      $current = _close_brace_command($self, $current, $source_info,
                                      $closed_block_command,
                                      $interrupting_command, 1);
    } elsif (exists($block_commands{$current->{'cmdname'}})) {
      if (defined($closed_block_command)) {
        $self->_line_error(sprintf(__("`\@end' expected `%s', but saw `%s'"),
                                   $current->{'cmdname'}, $closed_block_command),
                           $source_info);
      } elsif ($interrupting_command) {
        $self->_line_error(sprintf(__("\@%s seen before \@end %s"),
                                  $interrupting_command, $current->{'cmdname'}),
                           $source_info);
      } else {
        $self->_line_error(sprintf(__("no matching `%cend %s'"),
                                   ord('@'), $current->{'cmdname'}),
                           $source_info);
        if ($block_commands{$current->{'cmdname'}} eq 'conditional') {
          # In ignored conditional.
          _pop_element_from_contents($self, $current->{'parent'});
        }
      }
      _pop_block_command_contexts($self, $current, $source_info);
      # empty non-closed block commands at the end of the document
      delete $current->{'contents'}
        if ($current->{'contents'} and scalar(@{$current->{'contents'}}) == 0);
      $current = $current->{'parent'};
    } else {
      # There @item and @tab commands are closed, and also line commands
      # with invalid content.
      $current = $current->{'parent'};
    }
  } elsif ($current->{'type'}) {
    print STDERR "CLOSING type $current->{'type'}\n" if ($self->{'DEBUG'});
    if ($current->{'type'} eq 'bracketed') {
      $self->_command_error($current, $source_info,
                            __("misplaced %c"), ord('{'));
      if ($current->{'contents'}
          and @{$current->{'contents'}}
          and $current->{'contents'}->[0]->{'type'}
          and $current->{'contents'}->[0]->{'type'}
                eq 'internal_spaces_before_argument') {
        # remove spaces element from tree and update extra values
        _abort_empty_line($self, $current);
      }
    } elsif ($current->{'parent'}
             and $current->{'parent'}->{'type'}
             and $current->{'parent'}->{'type'} eq 'def_line') {
      _end_line_def_line($self, $current, $source_info);
    } elsif ($current->{'type'} eq 'line_arg') {
      #$current = _end_line_misc_line($self, $current, $source_info);
      # We ignore the current returned $current, to be sure that
      # we close the command too.
      _end_line_misc_line($self, $current, $source_info);
    } elsif ($current->{'type'} eq 'block_line_arg') {
      _end_line_starting_block($self, $current, $source_info);
    }
    $current = _close_container($self, $current);
  } else { # Should never go here.
    $current = $current->{'parent'} if ($current->{'parent'});
    $self->_bug_message("No type nor cmdname when closing",
                        $source_info, $current);
  }
  return $current;
}

# a closed_command arg means closing until that command is found.
# no command arg means closing until the root or a root_command
# is found.
sub _close_commands($$$;$$)
{
  my ($self, $current, $source_info, $closed_block_command,
      $interrupting_command) = @_;

  $current = _end_paragraph($self, $current, $source_info,
                            $closed_block_command, $interrupting_command);
  $current = _end_preformatted($self, $current, $source_info,
                               $closed_block_command, $interrupting_command);

        # stop if the command is found
  while (!($closed_block_command and $current->{'cmdname'}
           and $current->{'cmdname'} eq $closed_block_command)
         # Stop if at the root
         and $current->{'parent'}
         # Stop if at a type at the root
         and not ($current->{'type'}
                  and $current->{'type'} eq 'before_node_section')
     # Stop if in a root command
     # or in a context brace_commands and searching for a specific
     # end block command (with $closed_block_command set).
     # This second condition means that a footnote is not closed when
     # looking for the end of a block command, but is closed when
     # completly closing the stack.
         and !($current->{'cmdname'}
               and ($root_commands{$current->{'cmdname'}}
                    or ($closed_block_command and $current->{'parent'}->{'cmdname'}
                       and (exists($brace_commands{$current->{'parent'}->{'cmdname'}})
            and $brace_commands{$current->{'parent'}->{'cmdname'}} eq 'context'))))) {
    _close_command_cleanup($self, $current);
    $current = _close_current($self, $current, $source_info,
                              $closed_block_command,
                              $interrupting_command);
  }

  my $closed_element;
  if ($closed_block_command and $current->{'cmdname'}
      and $current->{'cmdname'} eq $closed_block_command) {
    _pop_block_command_contexts($self, $current, $source_info,
                                "for $closed_block_command");
    $closed_element = $current;
    $current = $current->{'parent'};
  } elsif ($closed_block_command) {
    $self->_line_error(sprintf(__("unmatched `%c%s'"),
                       ord('@'), "end $closed_block_command"), $source_info);
  }
  return ($closed_element, $current);
}

# begin paragraph if needed.  If not try to merge with the previous
# content if it is also some text.
# If $TRANSFER_MARKS_ELEMENT is given, also transfer mark sources
# from that element.
# NOTE - this sub has an XS override
sub _merge_text {
  my ($self, $current, $text, $transfer_marks_element) = @_;

  my $paragraph;

  my $no_merge_with_following_text = 0;
  if ($text =~ /\S/) {
    my $leading_spaces;
    if ($text =~ /^(\s+)/) {
      $leading_spaces = $1;
    }
    if ($current->{'contents'} and scalar(@{$current->{'contents'}})
      and $current->{'contents'}->[-1]->{'type'}
      and ($current->{'contents'}->[-1]->{'type'} eq 'ignorable_spaces_after_command'
         or $current->{'contents'}->[-1]->{'type'} eq 'internal_spaces_after_command'
         or $current->{'contents'}->[-1]->{'type'} eq 'internal_spaces_before_argument'
         or $current->{'contents'}->[-1]->{'type'} eq 'spaces_after_close_brace')) {
      $no_merge_with_following_text = 1;
    }
    if (_abort_empty_line($self, $current, $leading_spaces)) {
      $text =~ s/^(\s+)//;
    }

    $paragraph = _begin_paragraph($self, $current);
    $current = $paragraph if ($paragraph);
  }

  if (!defined($current->{'contents'})) {
    # this can happen at least for preformatted.
    $current->{'contents'} = [];
  }

  if (!$no_merge_with_following_text
      and scalar(@{$current->{'contents'}})
      and exists($current->{'contents'}->[-1]->{'text'})
      and $current->{'contents'}->[-1]->{'text'} !~ /\n/) {
    my $merged_to = $current->{'contents'}->[-1];
    # Transfer source marks
    if ($transfer_marks_element
        and $transfer_marks_element->{'source_marks'}) {
      $merged_to->{'source_marks'} = []
        if (!defined($merged_to->{'source_marks'}));
      my $additional_length = length($current->{'contents'}->[-1]->{'text'});
      while (scalar(@{$transfer_marks_element->{'source_marks'}})) {
        my $source_mark = shift @{$transfer_marks_element->{'source_marks'}};
        if ($additional_length) {
          $source_mark->{'position'} = 0
            if (not defined($source_mark->{'position'}));
          $source_mark->{'position'} += $additional_length;
        }
        push @{$merged_to->{'source_marks'}}, $source_mark;
      }
      delete $transfer_marks_element->{'source_marks'};
    }
    # Append text
    $merged_to->{'text'} .= $text;
    print STDERR "MERGED TEXT: $text|||in "
      .Texinfo::Common::debug_print_element_short($merged_to)
      ." last of: ".Texinfo::Common::debug_print_element_short($current)."\n"
         if ($self->{'DEBUG'});
  } else {
    my $new_element = { 'text' => $text, 'parent' => $current };
    _transfer_source_marks($transfer_marks_element, $new_element);
    push @{$current->{'contents'}}, $new_element;
    print STDERR "NEW TEXT: $text|||\n" if ($self->{'DEBUG'});
  }
  return $current;
}

# return the parent if in a item_container command, itemize or enumerate
sub _item_container_parent($)
{
  my $current = shift;
  if ((($current->{'cmdname'} and $current->{'cmdname'} eq 'item')
       or ($current->{'type'} and $current->{'type'} eq 'before_item'))
      and ($current->{'parent'} and $current->{'parent'}->{'cmdname'}
           and $block_commands{$current->{'parent'}->{'cmdname'}}
           and $block_commands{$current->{'parent'}->{'cmdname'}} eq 'item_container')) {
    return ($current->{'parent'});
  }
  return undef;
}

# return the parent if in a item_line command, @*table
sub _item_line_parent($)
{
  my $current = shift;
  if ($current->{'type'} and $current->{'type'} eq 'before_item'
            and $current->{'parent'}) {
    $current = $current->{'parent'};
  }
  return $current if ($current->{'cmdname'}
                      and $block_commands{$current->{'cmdname'}}
                      and $block_commands{$current->{'cmdname'}} eq 'item_line');
  return undef;
}

# return the parent if in a multitable
sub _item_multitable_parent($)
{
  my $current = shift;
  if (($current->{'cmdname'} and ($current->{'cmdname'} eq 'headitem'
       or $current->{'cmdname'} eq 'item' or $current->{'cmdname'} eq 'tab'))
      and $current->{'parent'} and $current->{'parent'}->{'parent'}) {
    $current = $current->{'parent'}->{'parent'};
  } elsif ($current->{'type'} and $current->{'type'} eq 'before_item'
            and $current->{'parent'}) {
    $current = $current->{'parent'};
  }
  return $current if ($current->{'cmdname'}
                      and $current->{'cmdname'} eq 'multitable');
  return undef;
}

sub _encode_file_name($$)
{
  my ($self, $file_name) = @_;

  my $encoding;
  my $input_file_name_encoding = $self->get_conf('INPUT_FILE_NAME_ENCODING');
  if ($input_file_name_encoding) {
    $encoding = $input_file_name_encoding;
  } elsif ($self->get_conf('DOC_ENCODING_FOR_INPUT_FILE_NAME')) {
    $encoding = $self->{'info'}->{'input_perl_encoding'};
  } else {
    $encoding = $self->get_conf('LOCALE_ENCODING');
  }

  return Texinfo::Common::encode_file_name($file_name, $encoding);
}

sub _save_line_directive
{
  my ($self, $line_nr, $file_name) = @_;

  my $input = $self->{'input'}->[0];
  return if !$input;
  $input->{'input_source_info'}->{'line_nr'} = $line_nr if $line_nr;
  # need to convert to bytes for file name
  if (defined($file_name)) {
    my ($encoded_file_name, $file_name_encoding)
       = _encode_file_name($self, $file_name);
    $input->{'input_source_info'}->{'file_name'} = $encoded_file_name;
  }
}

# returns next text fragment with source information, be it
# pending from a macro expansion or pending text, or read from file.
# $CURRENT is the current container that can be used for source marks.
sub _next_text($;$)
{
  my ($self, $current) = @_;

  while (@{$self->{'input'}}) {
    my $input = $self->{'input'}->[0];
    if (exists($input->{'th'})) {
      my $texthandle = $input->{'th'};
      my $next_line = <$texthandle>;
      if (defined($next_line)) {
        # need to decode to characters
        $next_line = Encode::decode('utf8', $next_line);
        $input->{'input_source_info'}->{'line_nr'} += 1
          unless ($input->{'input_source_info'}->{'macro'} ne ''
                  or defined($input->{'value_flag'}));
        return ($next_line, { %{$input->{'input_source_info'}} });
      }
    } elsif ($input->{'fh'}) {
      my $input_error = 0;
      local $SIG{__WARN__} = sub {
        my $message = shift;
        print STDERR "$input->{'input_source_info'}->{'file_name'}" . ":"
               . ($input->{'input_source_info'}->{'line_nr'} + 1)
               . ": input error: $message";
        $input_error = 1;
      };
      my $fh = $input->{'fh'};
      my $line = <$fh>;
      if (defined($line)) {
        if ($input_error) {
          # possible encoding error.  attempt to recover by stripping out
          # non-ASCII bytes.  there may not be that many in the file.
          Encode::_utf8_off($line);
          $line =~ s/[\x80-\xFF]//g;
        }
        # add an end of line if there is none at the end of file
        if (eof($fh) and $line !~ /\n/) {
          $line .= "\n";
        }
        # DEL as comment character
        if ($line =~ s/\x{7F}(.*\s*)//) {
          _input_push_text($self, '',
                           $input->{'input_source_info'}->{'line_nr'});
          my $delcomment_source_mark = {'sourcemark_type' => 'delcomment'};
          $delcomment_source_mark->{'line'} = $1 if ($1 ne '');
          $self->{'input'}->[0]->{'input_source_mark'}
             = $delcomment_source_mark;
        }
        $input->{'input_source_info'}->{'line_nr'}++;
        return ($line, { %{$input->{'input_source_info'}} });
      }
    }
    # Top input source failed.  Close, pop, and try the next one.
    if (exists($input->{'th'})) {
      # End of text reached.
      # FIXME close $input->{'th'} explicitly?
      if ($input->{'input_source_info'}->{'macro'} ne '') {
        my $top_macro = shift @{$self->{'macro_stack'}};
        print STDERR "SHIFT MACRO_STACK(@{$self->{'macro_stack'}}):"
          ." $top_macro->{'args'}->[0]->{'text'}\n"
            if ($self->{'DEBUG'});
      } elsif (defined($input->{'value_flag'})) {
        my $top_value = shift @{$self->{'value_stack'}};
        print STDERR "SHIFT VALUE_STACK(@{$self->{'value_stack'}}):"
          . "$top_value\n"
            if ($self->{'DEBUG'});
      }
    # Don't close STDIN
    } elsif ($input->{'fh'}
             and $input->{'input_source_info'}->{'file_name'} ne '-') {
      if (!close($input->{'fh'})) {
        # need to decode for error message
        my $file_name_encoding;
        if (defined($input->{'file_name_encoding'})) {
          $file_name_encoding = $input->{'file_name_encoding'};
        } else {
          $file_name_encoding = $self->get_conf('COMMAND_LINE_ENCODING');
        }
        my $file_name = $input->{'input_source_info'}->{'file_name'};
        if (defined($file_name_encoding)) {
          $file_name = decode($file_name_encoding, $file_name);
        }
        $self->{'registrar'}->document_warn($self,
                             sprintf(__("error on closing %s: %s"),
                                     $file_name, $!));
      }
      delete $input->{'fh'};
    }

    if (defined($input->{'input_source_mark'}) and defined($current)) {
      my $end_source_mark;
      if ($input->{'input_source_mark'}->{'sourcemark_type'} eq 'delcomment') {
        $end_source_mark = $input->{'input_source_mark'};
      } else {
        $end_source_mark
          = { 'sourcemark_type' =>
               $input->{'input_source_mark'}->{'sourcemark_type'},
              'counter' =>
               $input->{'input_source_mark'}->{'counter'},
            };
        $end_source_mark->{'status'} = 'end';
      }
      _register_source_mark($self, $current,
                            $end_source_mark);
    }
    # keep the first input level to have a permanent source for
    # source_info, even when nothing is returned and the first input
    # file is closed.
    if (scalar(@{$self->{'input'}}) == 1) {
      return (undef, { %{$input->{'input_source_info'}} });
    } else {
      shift @{$self->{'input'}};
    }
  }
}

# collect text and line numbers until an end of line is found.
sub _new_line($)
{
  my ($self) = @_;

  my $new_line = '';
  my $source_info;

  while (1) {
    my $new_text;
    ($new_text, $source_info) = _next_text($self);
    if (!defined($new_text)) {
      $new_line = undef if ($new_line eq '');
      last;
    }

    $new_line .= $new_text;

    my $chomped_text = $new_text;
    last if chomp($chomped_text);
  }
  return ($new_line, $source_info);
}

# $MACRO is the element in the tree defining the macro.
sub _expand_macro_arguments($$$$)
{
  my ($self, $macro, $line, $source_info) = @_;

  my $braces_level = 1;
  my $arguments = [ '' ];
  my $arg_nr = 0;
  my $args_total = scalar(@{$macro->{'args'}}) -1;
  my $name = $macro->{'args'}->[0]->{'text'};

  my $source_info_orig = $source_info;

  while (1) {
    if ($line =~ s/([^\\{},]*)([\\{},])//) {
      my $separator = $2;
      $arguments->[-1] .= $1;
      if ($separator eq '\\') {
        if ($line =~ s/^(.)//) {
          my $protected_char = $1;
          if ($protected_char !~ /[\\{},]/) {
            $arguments->[-1] .= '\\';
          }
          $arguments->[-1] .= $protected_char;
          print STDERR "MACRO ARG: $separator: $protected_char\n"
            if ($self->{'DEBUG'});
        } else {
          $arguments->[-1] .= '\\';
          print STDERR "MACRO ARG: $separator\n" if ($self->{'DEBUG'});
        }
      } elsif ($separator eq ',') {
        if ($braces_level == 1) {
          if (scalar(@$arguments) < $args_total) {
            push @$arguments, '';
            $line =~ s/^\s*//;
            print STDERR "MACRO NEW ARG\n" if ($self->{'DEBUG'});
          } else {
            # implicit quoting when there is one argument.
            if ($args_total != 1) {
              $self->_line_error(sprintf(__(
                                     "macro `%s' called with too many args"),
                                        $name), $source_info);
            }
            $arguments->[-1] .= ',';
          }
        } else {
          $arguments->[-1] .= ',';
        }
      } elsif ($separator eq '}') {
        $braces_level--;
        last if ($braces_level == 0);
        $arguments->[-1] .= $separator;
      } elsif ($separator eq '{') {
        $braces_level++;
        $arguments->[-1] .= $separator;
      }
    } else {
      print STDERR "MACRO ARG end of line\n" if ($self->{'DEBUG'});
      $arguments->[-1] .= $line;

      ($line, $source_info) = _new_line($self);
      if (!defined($line)) {
        $self->_line_error(sprintf(__("\@%s missing closing brace"),
           $name), $source_info_orig);
        return ($arguments, "\n", $source_info);
      }
    }
  }
  if ($args_total == 0 and $arguments->[0] ne '') {
    $self->_line_error(sprintf(__(
               "macro `%s' declared without argument called with an argument"),
                                $name), $source_info);
  }
  print STDERR "END MACRO ARGS EXPANSION(".scalar(@$arguments)."): ".
                  join("|\n", @$arguments) ."|\n" if ($self->{'DEBUG'});
  return ($arguments, $line, $source_info);
}

sub _lookup_macro_parameter($$) {
  my $macro = shift;
  my $name = shift;

  my $args_total = scalar(@{$macro->{'element'}->{'args'}}) -1;
  if ($args_total > 0) {
    my $arg_index;
    # the first argument is the macro name
    for ($arg_index=1; $arg_index<=$args_total; $arg_index++) {
      if (defined($macro->{'element'}->{'args'}->[$arg_index])
          and $macro->{'element'}->{'args'}->[$arg_index]->{'text'} eq $name) {
        return $arg_index - 1;
      }
    }
  }
  return undef
}

# $MACRO is a member of $self->{'macros'}.
sub _expand_macro_body($$$$) {
  my ($self, $macro, $args, $source_info) = @_;

  my $macrobody = $macro->{'macrobody'};

  my $result = '';
  while ($macrobody ne '') {
    if ($macrobody =~ s/^([^\\]*)\\//o) {
      $result .= $1;
      if ($macrobody =~ s/^\\//) {
        $result .= '\\';
      } elsif ($macrobody =~ s/^([^\\]*)\\//) {
        my $arg = $1;
        my $formal_arg_index = _lookup_macro_parameter($macro, $arg);
        if (defined($formal_arg_index)) {
          if ($formal_arg_index < scalar(@$args)) {
            $result .= $args->[$formal_arg_index];
          }
        } else {
          $self->_line_error(sprintf(__(
         "\\ in \@%s expansion followed `%s' instead of parameter name or \\"),
             $macro->{'element'}->{'args'}->[0]->{'text'}, $arg), $source_info);
          $result .= '\\' . $arg;
        }
      }
      next;
    }
    $result .= $macrobody;
    last;
  }
  return $result;
}

# turn spaces that are ignored before @-commands like @sortas{} and
# @seeentry{} back to regular spaces if there is content after the @-command
sub _set_non_ignored_space_in_index_before_command($)
{
  my $contents = shift;
  my $pending_spaces_element = 0;
  foreach my $content (@$contents) {
    if ($content->{'type'}
        and $content->{'type'} eq 'internal_spaces_before_brace_in_index') {
      # set to "spaces_at_end" in case there are only spaces after
      $content->{'type'} = 'spaces_at_end';
      $pending_spaces_element = $content;
    } elsif ($pending_spaces_element
             and not (($content->{'cmdname'}
                       and $in_index_commands{$content->{'cmdname'}}
                       and defined($brace_commands{$content->{'cmdname'}}))
                      or ($content->{'type'}
                   and $content->{'type'} eq 'spaces_after_close_brace'))
             and (! _check_empty_expansion([$content]))) {
      delete $pending_spaces_element->{'type'};
      $pending_spaces_element = 0;
    }
  }
}

sub _pop_element_from_contents($$)
{
  my $self = shift;
  my $parent_element = shift;

  my $popped_element = pop @{$parent_element->{'contents'}};
  delete $parent_element->{'contents'}
    if (scalar(@{$parent_element->{'contents'}}) == 0);

  return $popped_element;
}

# each time a new line appeared, a container is opened to hold the text
# consisting only of spaces.  This container is removed here, typically
# this is called when non-space happens on a line.
# NOTE - this sub has an XS override
sub _abort_empty_line {
  my ($self, $current, $additional_spaces) = @_;

  $additional_spaces = '' if (!defined($additional_spaces));
  if ($current->{'contents'} and @{$current->{'contents'}}
       and $current->{'contents'}->[-1]->{'type'}
       and ($current->{'contents'}->[-1]->{'type'} eq 'empty_line'
           or $current->{'contents'}->[-1]->{'type'} eq 'ignorable_spaces_after_command'
           or $current->{'contents'}->[-1]->{'type'} eq 'internal_spaces_after_command'
           or $current->{'contents'}->[-1]->{'type'} eq 'internal_spaces_before_argument'
           or $current->{'contents'}->[-1]->{'type'} eq 'spaces_after_close_brace')) {

    my $spaces_element = $current->{'contents'}->[-1];

    print STDERR "ABORT EMPTY "
      .$spaces_element->{'type'}
      ." additional text |$additional_spaces|,"
      ." current |$spaces_element->{'text'}|\n"
        if ($self->{'DEBUG'});

    $spaces_element->{'text'} .= $additional_spaces;

    # remove empty 'empty*before'.  Happens in many situations.
    if ($spaces_element->{'text'} eq '') {
      my $popped_element = _pop_element_from_contents($self, $current);
      # if first in parent and with source mark, placing a source mark
      # should lead to readding an element for the source mark.  In that
      # case, the type is not readded, such that it is actually relatively
      # similar to the case of an empty line just below, except that an empty
      # text string is left.
      #
      # Note that an empty text string first in parent does not happen often,
      # as it cannot happen in paragraph, as there is some command or text that
      # started the paragraph before, and being first in the main text out of
      # paragraph does not happen often either.  The situation in which it
      # happens is a macro expansion to an empty string right after an
      # @-command opening (block or brace command).
      foreach my $source_mark (@{$popped_element->{'source_marks'}}) {
        _place_source_mark($self, $current, $source_mark);
      }
      delete $popped_element->{'source_marks'};
    } elsif ($spaces_element->{'type'} eq 'empty_line') {
      # exactly the same condition as to begin a paragraph
      if ((!$current->{'type'} or $type_with_paragraph{$current->{'type'}})
         and !$no_paragraph_contexts{$self->_top_context()}) {
        $spaces_element->{'type'} = 'spaces_before_paragraph';
      } else {
        delete $spaces_element->{'type'};
      }
    } elsif ($spaces_element->{'type'} eq 'internal_spaces_after_command'
             or $spaces_element->{'type'} eq 'internal_spaces_before_argument') {
      # Remove element from main tree. It will still be referenced in
      # the 'info' hash as 'spaces_before_argument'.
      _pop_element_from_contents($self, $current);
      my $owning_element
        = $spaces_element->{'extra'}->{'spaces_associated_command'};
      #$owning_element->{'info'} = {} if (! $owning_element->{'info'});
      my $new_space_element = {'text' => $spaces_element->{'text'},};
      _transfer_source_marks($spaces_element, $new_space_element);
      $owning_element->{'info'} = {} if (!exists($owning_element->{'info'}));
      $owning_element->{'info'}->{'spaces_before_argument'}
        = $new_space_element;
    }

    return 1;
  }
  return 0;
}

sub _isolate_trailing_space($$)
{
  my $current = shift;
  my $spaces_type = shift;

  if ($current->{'contents'}->[-1]->{'text'} !~ /\S/) {
    $current->{'contents'}->[-1]->{'type'} = $spaces_type;
  } else {
    if ($current->{'contents'}->[-1]->{'text'} =~ s/(\s+)$//) {
      my $new_spaces = { 'text' => $1, 'parent' => $current,
        'type' => $spaces_type };
      push @{$current->{'contents'}}, $new_spaces;
    }
  }
}

# isolate last space in a command to help expansion disregard unuseful spaces.
sub _isolate_last_space
{
  my ($self, $current) = @_;

  return if (!$current->{'contents'});

  # $current->{'type'} is always set, to line_arg, block_line_arg,
  # brace_command_arg, bracketed or menu_entry_node

  # Store a final comment command in the 'info' hash, except for brace
  # commands
  if (not ($current->{'type'} and $current->{'type'} eq 'brace_command_arg')
      and scalar(@{$current->{'contents'}}) >= 1
      and $current->{'contents'}->[-1]->{'cmdname'}
      and ($current->{'contents'}->[-1]->{'cmdname'} eq 'c'
            or $current->{'contents'}->[-1]->{'cmdname'} eq 'comment')) {
    $current->{'info'} = {} if (!$current->{'info'});
    $current->{'info'}->{'comment_at_end'}
                           = _pop_element_from_contents($self, $current);
    # TODO: @c should probably not be allowed inside most brace commands
    # as this would be difficult to implement properly in TeX.
  }

  my $debug_str;
  if ($self->{'DEBUG'}) {
    $debug_str = 'p: '
         .Texinfo::Common::debug_print_element_short($current)."; c ";
    if (scalar(@{$current->{'contents'}})) {
      if ($current->{'contents'}->[-1]->{'type'}) {
        $debug_str .= "($current->{'contents'}->[-1]->{'type'})";
      }
      if (defined($current->{'contents'}->[-1]->{'text'})) {
        $debug_str .= "[T: $current->{'contents'}->[-1]->{'text'}]";
      }
    }
    $debug_str .= "\n";
  }

  if (!$current->{'contents'}
            or !scalar(@{$current->{'contents'}})
            or !defined($current->{'contents'}->[-1]->{'text'})
            or ($current->{'contents'}->[-1]->{'type'}
                  and (!$current->{'type'}
                        or ($current->{'type'} ne 'line_arg'
                            and $current->{'type'} ne 'block_line_arg')))
            or $current->{'contents'}->[-1]->{'text'} !~ /\s+$/) {
    print STDERR "NOT ISOLATING ".$debug_str
       if ($self->{'DEBUG'});
    return;
  }

  print STDERR "ISOLATE SPACE ".$debug_str
    if ($self->{'DEBUG'});

  if ($current->{'type'} and $current->{'type'} eq 'menu_entry_node') {
    _isolate_trailing_space($current, 'space_at_end_menu_node');
  } else {
    # Store final spaces in 'spaces_after_argument'.
    #$current->{'info'} = {} if (!$current->{'info'});
    if ($current->{'contents'}->[-1]->{'text'} !~ /\S/) {
      my $spaces_after_argument = _pop_element_from_contents($self, $current);
      my $new_space_element = {'text' => $spaces_after_argument->{'text'},};
      _transfer_source_marks($spaces_after_argument, $new_space_element);
      $current->{'info'} = {} if (!exists($current->{'info'}));
      $current->{'info'}->{'spaces_after_argument'}
                 = $new_space_element;
    } else {
      # FIXME transfer source marks that are located in the spaces
      # put in spaces_after_argument
      $current->{'contents'}->[-1]->{'text'} =~ s/(\s+)$//;
      $current->{'info'} = {} if (!exists($current->{'info'}));
      $current->{'info'}->{'spaces_after_argument'} = {'text' => $1,};
    }
  }
}

# $LABEL_CONTENTS_CONTAINER->{'contents'} is the Texinfo for the
# specification of a node.
# Returned $parsed_node_manual object is a hash with two fields:
#
#     manual_content - Texinfo tree for a manual name extracted from the
#                      node specification.
#     node_content - Texinfo tree for the node name on its own
#
# retrieve a leading manual name in parentheses, if there is one
# and modify the $LABEL_CONTENTS_CONTAINER contents to be consistent
# with $parsed_node_manual.
sub _parse_node_manual($)
{
  my $label_contents_container = shift;
  my ($parsed_node_manual, $modified_node_content)
    = Texinfo::Common::parse_node_manual($label_contents_container);
  $label_contents_container->{'contents'} = $modified_node_content
     if ($modified_node_content);
  return $parsed_node_manual;
}

sub _relocate_source_marks($$$$)
{
  my $remaining_source_marks = shift;
  my $e = shift;
  my $previous_position = shift;
  my $current_position = shift;

  while (scalar(@$remaining_source_marks)
         and ($remaining_source_marks->[0]->{'position'} > $previous_position
              or $remaining_source_marks->[0]->{'position'} == 0)
         and $remaining_source_marks->[0]->{'position'} <= $current_position) {
    my $source_mark = shift(@$remaining_source_marks);
    $source_mark->{'position'}
       = $source_mark->{'position'} - $previous_position;
    $e->{'source_marks'} = [] if (! defined($e->{'source_marks'}));
    push @{$e->{'source_marks'}}, $source_mark;
  }
}

# split non-space text elements into strings without [ ] ( ) , and single
# character strings with one of them
sub _split_delimiters
{
  my ($self, $root, $current, $source_info) = @_;

  if (defined $root->{'type'} # 'spaces' for spaces
      or !defined $root->{'text'}) {
    return $root;
  } else {
    my @elements;
    my $type;
    my $chars = quotemeta '[](),';
    my $text = $root->{'text'};
    my @remaining_source_marks;
    my ($current_position, $previous_position);
    if ($root->{'source_marks'}) {
      @remaining_source_marks = @{$root->{'source_marks'}};
      $current_position = 0;
      $previous_position = 0;
      delete $root->{'source_marks'};
    }
    while (1) {
      if ($text =~ s/^([^$chars]+)//) {
        push @elements, {'text' => $1, 'parent' => $root->{'parent'}};
        if (scalar(@remaining_source_marks)) {
          $current_position += length($1);
          _relocate_source_marks(\@remaining_source_marks, $elements[-1],
                                 $previous_position, $current_position);
        }
      } elsif ($text =~ s/^([$chars])//) {
        push @elements, {'text' => $1, 'type' => 'delimiter',
                         'parent' => $root->{'parent'}};
        if (scalar(@remaining_source_marks)) {
          $current_position += length($1);
          _relocate_source_marks(\@remaining_source_marks, $elements[-1],
                                 $previous_position, $current_position);
        }
      } else {
        last;
      }
      if (scalar(@remaining_source_marks)) {
        $previous_position = $current_position;
      }
    }
    if (scalar(@remaining_source_marks)) {
      $self->_bug_message("Remaining source mark in _split_delimiters",
                          $source_info, $current);
    }
    return @elements;
  }
}

# split text elements into whitespace and non-whitespace
sub _split_def_args
{
  my ($self, $root, $current, $source_info) = @_;

  if ($root->{'type'} and $root->{'type'} eq 'spaces_inserted') {
    return $root;
  } elsif (defined $root->{'text'}) {
    my @elements;
    my $type;
    # FIXME how to handle non ascii space in def*?  As space or argument?
    my @split_text = split /(?<=\s)(?=\S)|(?<=\S)(?=\s)/, $root->{'text'};
    if ($split_text[0] =~ /^\s*$/) {
      $type = 'spaces';
    }
    my @remaining_source_marks;
    my ($current_position, $previous_position);
    if ($root->{'source_marks'}) {
      @remaining_source_marks = @{$root->{'source_marks'}};
      $current_position = 0;
      $previous_position = 0;
      $root->{'source_marks'} = undef;
    }
    for my $t (@split_text) {
      my $e = {'text' => $t };
      if (scalar(@remaining_source_marks)) {
        $current_position += length($t);
        _relocate_source_marks(\@remaining_source_marks, $e, $previous_position,
                               $current_position);
      }
      if ($type) {
        $e->{'type'} = $type;
        $type = undef;
      } else {
        $type = 'spaces';
      }
      $e->{'parent'} = $root->{'parent'};
      push @elements, $e;
      if (scalar(@remaining_source_marks)) {
        $previous_position = $current_position;
      }
    }
    if (scalar(@remaining_source_marks)) {
      $self->_bug_message("Remaining source mark in _split_def_args",
                          $source_info, $current);
    }
    return @elements;
  } elsif ($root->{'type'} and $root->{'type'} eq 'bracketed') {
    _isolate_last_space($self, $root);
    $root->{'type'} = 'bracketed_def_content';
  }
  return $root;
}

# definition line parsing
sub _parse_def($$$$)
{
  my ($self, $command, $current, $source_info) = @_;

  return [] if (!$current->{'contents'});
  my $contents = $current->{'contents'};

  my @new_contents;
  my @contents = @$contents;

  # could have used def_aliases, but use code more similar with the XS parser
  if ($def_alias_commands{$command}) {
    my $real_command = $def_aliases{$command};
    my $prepended = $def_map{$command}->{$real_command};


    my $bracketed = { 'type' => 'bracketed_inserted',
                      'parent' => $current };
    my $content = { 'text' => $prepended, 'parent' => $bracketed };
    # the prepended string is an english string (such as Function).  If
    # documentlanguage is set it needs to be translated during the conversion.
    if (defined($self->{'documentlanguage'})) {
      $content->{'type'} = 'untranslated';
      $content->{'extra'} = {'documentlanguage' => $self->{'documentlanguage'}};
    }
    @{$bracketed->{'contents'}} = ($content);

    unshift @contents, $bracketed,
                       { 'text' => ' ', 'type' => 'spaces_inserted',
                         'parent' => $current,
                       };

    $command = $def_aliases{$command};
  }
  @contents = map (_split_def_args($self, $_, $current, $source_info),
                   @contents );
  @new_contents = @contents;

  $current->{'contents'} = \@new_contents;

  my @result;
  my @args = @{$def_map{$command}};
  my $arg_type;

  $arg_type = pop @args if ($args[-1] eq 'arg' or $args[-1] eq 'argtype');
  # If $arg_type is not set (for @def* commands that are not documented
  # to take args), everything happens as if arg_type was set to 'arg'.

  #  Fill in everything up to the args, collecting adjacent non-whitespace
  #  elements into a single element, e.g 'a@i{b}c'.
  my $argument_content = [];
  my $arg = shift (@args);

  my $i = 0; # the offset in @new_contents of $token
  while (@contents) {
    my $token = $contents[0];
    # finish previous item
    if ( $token->{'type'}
        and ($token->{'type'} eq 'spaces'
               or $token->{'type'} eq 'spaces_inserted'
               or $token->{'type'} eq 'bracketed_def_content'
               or $token->{'type'} eq 'bracketed_inserted'
               or $token->{'type'} eq 'delimiter')) {
      # we create a {'contents' =>} only if there is more than one
      # content gathered.
      if (scalar(@$argument_content)) {
        if (scalar(@$argument_content) > 1) {
          my $e = {'contents' => $argument_content,
                   'type' => 'def_aggregate',
                   'parent' => $current };
          push @result, [$arg, $e];
          # Replace in the main tree.
          splice @new_contents,
                 $i - scalar(@$argument_content),
                 scalar(@$argument_content),
                 $e;
          for my $e2 (@$argument_content) {
            $e2->{'parent'} = $e;
          }
          $i -= scalar(@$argument_content) - 1;
        } elsif (scalar(@$argument_content) == 1) {
          push @result, [$arg, $argument_content->[0]];
        }
        $argument_content = [];
        if ($token->{'type'} eq 'spaces'
            or $token->{'type'} eq 'spaces_inserted') {
          $arg = shift (@args);
        }
      }
    }

    if ($token->{'type'} and ($token->{'type'} eq 'bracketed_def_content'
                                or $token->{'type'} eq 'bracketed_inserted')) {
      push @result, [$arg, $token];
      shift @contents;
      $arg = shift (@args);
    } elsif ($token->{'type'}
        and ($token->{'type'} eq 'spaces'
               or $token->{'type'} eq 'spaces_inserted')) {
      if ($token->{'text'}) {
        push @result, ['spaces', $token];
        shift @contents;
      } else {
        $i++;
        last;
      }
    } elsif ($token->{'type'} and $token->{'type'} eq 'delimiter') {
      push @result, ['delimiter', shift @contents];
    } else {
      my $text_or_cmd = shift @contents;
      push @$argument_content, $text_or_cmd;
    }
    $i++;
    last if (! defined($arg));
  }
  if (scalar(@$argument_content) > 1) {
    my $e = {'contents' => $argument_content,
      'type' => 'def_aggregate'   };
    push @result, [$arg, $e];
    # Replace in the main tree.
    splice @new_contents, $i - scalar(@$argument_content),
           scalar(@$argument_content), $e;
  } elsif (scalar(@$argument_content) == 1) {
    push @result, [$arg, $argument_content->[0]];
  }

  if (scalar(@contents) > 0) {
    splice @new_contents, -scalar(@contents);
  }

  @contents = map (_split_delimiters($self, $_, $current, $source_info),
                   @contents );
  @new_contents = (@new_contents, @contents);

  # Create the part of the def_args array for any arguments.
  my @args_results;
  while (@contents) {
    my $spaces;
    my $next_token = shift @contents;
    if ($next_token->{'type'} and $next_token->{'type'} eq 'spaces') {
      $spaces = $next_token;
      $next_token = shift @contents;
    }
    if (defined($spaces)) {
      push @args_results, ['spaces', $spaces]
    }
    last if (!defined($next_token));
    if ($next_token->{'type'} and $next_token->{'type'} eq 'delimiter') {
      push @args_results, ['delimiter', $next_token];
    } else {
      push @args_results, ['arg', $next_token];
    }
  }

  # If a command like @deftypefn, mark the type arguments
  if ($arg_type and $arg_type eq 'argtype') {
    my $next_is_type = 1;
    foreach my $arg(@args_results) {
      if ($arg->[0] eq 'spaces') {
      } elsif ($arg->[0] eq 'delimiter') {
        $next_is_type = 1;
      } elsif ($arg->[1]->{'cmdname'} and $arg->[1]->{'cmdname'} ne 'code') {
        $next_is_type = 1;
      } elsif ($next_is_type) {
        $arg->[0] = 'typearg';
        $next_is_type = 0;
      } else {
        $next_is_type = 1;
      }
    }
  }

  for my $pair (@result, @args_results) {
    $pair->[1]->{'extra'} = {} if (!$pair->[1]->{'extra'});
    $pair->[1]->{'extra'}->{'def_role'} = $pair->[0];
  }

  return [@result, @args_results];
}

# register a label, that is something that may be the target of a reference
# and must be unique in the document.  Corresponds to @node, @anchor and
# @float second arg.
sub _register_label($$$)
{
  my ($targets_list, $current, $label) = @_;

  Texinfo::Common::register_label($targets_list, $current, $label);
}

# store an index entry.
# $COMMAND_CONTAINER is the name of the @-command the index entry
#  is associated with, for instance 'cindex', 'defivar' or 'vtable'.
# $CURRENT is the command element.
# $CONTENT holds the actual content.  For index entries and v|ftable
#  items, it is the index entry content, for def, it is the parsed
#  arguments, based on the definition line arguments.
sub _enter_index_entry($$$$$$$)
{
  my ($self, $command_container, $command, $current, $content,
      $content_normalized, $source_info) = @_;

  $content_normalized = $content if (!defined($content_normalized));

  my $index_name = $self->{'command_index'}->{$command_container};
  my $index = $self->{'index_names'}->{$index_name};

  if (!defined($index->{'index_entries'})) {
    $index->{'index_entries'} = [];
  }

  my $number = scalar(@{$index->{'index_entries'}}) + 1;

  # FIXME index_type_command does not seems to be used anywhere.
  # It appears in test results tree, so maybe it is worth keeping
  # it to be able to understand changes.
  my $index_entry = { 'index_name'           => $index_name,
                      'index_at_command'     => $command,
                      'index_type_command'   => $command_container,
                      'entry_content'        => $content,
                      'content_normalized'   => $content_normalized,
                      'entry_element'        => $current,
                      'entry_number'         => $number,
                      'index_ignore_chars'   => {},
                    };
  # gather set txiindex*ignore information
  foreach my $set_variable (keys(%set_flag_index_char_ignore)) {
    if (exists($self->{'values'}->{$set_variable})) {
      my $ignored_char = $set_flag_index_char_ignore{$set_variable};
      $index_entry->{'index_ignore_chars'}->{$ignored_char} = 1;
    }
  }
  if (defined($current->{'extra'}) and defined($current->{'extra'}->{'sortas'})) {
    $index_entry->{'sortas'} = $current->{'extra'}->{'sortas'};
  }
  if (@{$self->{'regions_stack'}}) {
    $index_entry->{'entry_region'} = $self->{'regions_stack'}->[-1];
  } elsif ($self->{'current_node'}) {
    $index_entry->{'entry_node'} = $self->{'current_node'};
  } elsif (!$self->{'current_section'}) {
    $self->_line_warn(sprintf(__("entry for index `%s' outside of any node"),
                             $index_name), $source_info);
  }

  push @{$index->{'index_entries'}}, $index_entry;

  $current->{'extra'} = {} if (!defined($current->{'extra'}));
  $current->{'extra'}->{'index_entry'} = $index_entry;
}

sub _in_include($)
{
  my $self = shift;

  foreach my $input (@{$self->{'input'}}[0..$#{$self->{'input'}}-1]) {
    if (not $input->{'th'}) {
      return 1;
    }
  }
  return 0;
}

# Used for file names and index sort strings to allow including the special
# Texinfo characters but not other command nor element type.
sub _convert_to_text {
  my $e = shift;

  my ($text,  $superfluous_arg) = ('', 0);

  return ($text, $superfluous_arg)
    unless($e->{'contents'});

  for my $c (@{$e->{'contents'}}) {
    # Allow @@, @{ and @} to give a way for @, { and } to appear in
    # filenames (although it's not a good idea to use these characters
    # in filenames).
    if (defined $c->{'text'}) {
      $text .= $c->{'text'};
    } elsif ($c->{'cmdname'}
        and ($c->{'cmdname'} eq '@'
             or $c->{'cmdname'} eq 'atchar')) {
      $text .= '@';
    } elsif ($c->{'cmdname'}
        and ($c->{'cmdname'} eq '{'
             or $c->{'cmdname'} eq 'lbracechar')) {
      $text .= '{';
    } elsif ($c->{'cmdname'}
        and ($c->{'cmdname'} eq '}'
             or $c->{'cmdname'} eq 'rbracechar')) {
      $text .= '}';
    } else {
      $superfluous_arg = 1;
    }
  }
  return ($text, $superfluous_arg);
}

sub _end_line_misc_line($$$)
{
  my $self = shift;
  my $current = shift;
  my $source_info = shift;

  $self->_pop_context(['ct_line'], $source_info, $current, 'in line_arg');
  _isolate_last_space($self, $current);

  # first parent is the @command, second is the parent
  $current = $current->{'parent'};
  my $misc_cmd = $current;
  my $command = $current->{'cmdname'};
  my $end_command;
  my $included_file;
  my $include_source_mark;
  print STDERR "MISC END \@$command: $self->{'line_commands'}->{$command}\n"
     if ($self->{'DEBUG'});

  if ($self->{'basic_inline_commands'}->{$command}) {
    pop @{$self->{'nesting_context'}->{'basic_inline_stack_on_line'}};
  }

  if ($self->{'line_commands'}->{$command} eq 'specific') {
    my $args = _parse_line_command_args($self, $current, $source_info);
    if (defined($args)) {
      $current->{'extra'} = {} if (!defined($current->{'extra'}));
      $current->{'extra'}->{'misc_args'} = $args;
    }
  } elsif ($self->{'line_commands'}->{$command} eq 'text') {
    my ($text, $superfluous_arg)
      = _convert_to_text($current->{'args'}->[0]);

    $current->{'extra'} = {} if (!$current->{'extra'});
    if ($text eq '') {
      if (not $superfluous_arg) {
        $self->_command_warn($current, $source_info,
                             __("\@%s missing argument"), $command);
      }
      # if there is superfluous arg, a more suitable error is issued below.
      $current->{'extra'}->{'missing_argument'} = 1;
    } else {
      $current->{'extra'}->{'text_arg'} = $text;
      if ($command eq 'end') {
        # REMACRO
        my $remaining_on_line = $text;
        if ($remaining_on_line =~ s/^([[:alnum:]][[:alnum:]-]*)//) {
          $end_command = $1;

          if (!exists $block_commands{$end_command}) {
            $self->_command_warn($current, $source_info,
                                 __("unknown \@end %s"), $end_command);
            $end_command = undef;
          } else {
            print STDERR "END BLOCK $end_command\n" if ($self->{'DEBUG'});
            if ($block_commands{$end_command} eq 'conditional') {
              if (@{$self->{'conditional_stack'}}
                and $self->{'conditional_stack'}->[-1] eq $end_command) {
                pop @{$self->{'conditional_stack'}};
              } else {
                $self->_command_error($current, $source_info,
                                  __("unmatched `%c%s'"), ord('@'), 'end');
                $end_command = undef;
              }
            }
          }
          # non-ASCII spaces are also superfluous arguments.
          # If there is superfluous text after @end argument, set
          # $superfluous_arg such that the error message triggered by an
          # unexpected @-command on the @end line is issued below.  Note
          # that $superfluous_arg may also be true if it was set above.
          if ($end_command and $remaining_on_line =~ /\S/) {
            $superfluous_arg = 1;
          }
        # if $superfluous_arg is set there is a similar and somewhat
        # better error message below
        } elsif (!$superfluous_arg) {
          $self->_command_error($current, $source_info,
                            __("bad argument to \@%s: %s"),
                            $command, $remaining_on_line);
        }
      } elsif ($superfluous_arg) {
        # @-command effects are ignored, an error message is issued below.
      } elsif ($command eq 'include') {
        # We want Perl binary strings representing sequences of bytes,
        # not character strings of codepoints in the internal perl encoding.
        my ($file_path, $file_name_encoding) = _encode_file_name($self, $text);
        my $included_file_path
             = Texinfo::Common::locate_include_file($self, $file_path);
        if (defined($included_file_path)) {
          my ($status, $file_name, $directories)
             = _input_push_file($self, $included_file_path, $file_name_encoding);
          if ($status) {
            $included_file = 1;
            print STDERR "Included $included_file_path\n" if ($self->{'DEBUG'});
            $include_source_mark = {'sourcemark_type' => $command,
                                    'status' => 'start'};
            $self->{'input'}->[0]->{'input_source_mark'} = $include_source_mark;
          } else {
            # FIXME $text does not show the include directory.  Using
            # $included_file_path would require decoding to character string
            # using $file_name_encoding
            $self->_command_error($current, $source_info,
                            __("\@%s: could not open %s: %s"),
                            $command, $text, $!);
          }
        } else {
          $self->_command_error($current, $source_info,
                            __("\@%s: could not find %s"),
                           $command, $text);
        }
      } elsif ($command eq 'verbatiminclude') {
        $current->{'extra'}->{'input_perl_encoding'}
                        = $self->{'info'}->{'input_perl_encoding'}
          if defined $self->{'info'}->{'input_perl_encoding'};
      } elsif ($command eq 'documentencoding') {
        my ($texinfo_encoding, $perl_encoding, $input_encoding)
           = _encoding_alias($text);
        $self->_command_warn($current, $source_info,
               __("encoding `%s' is not a canonical texinfo encoding"),
                             $text)
          if (!$texinfo_encoding or $texinfo_encoding ne lc($text));
        if ($input_encoding) {
          $current->{'extra'}->{'input_encoding_name'} = $input_encoding;
        }
        if (!$perl_encoding) {
          $self->_command_warn($current, $source_info,
               __("unrecognized encoding name `%s'"), $text);
        } else {
          $current->{'extra'}->{'input_perl_encoding'} = $perl_encoding;

          if ($input_encoding) {
            $self->{'info'}->{'input_encoding_name'} = $input_encoding;
          }

          $self->{'info'}->{'input_perl_encoding'} = $perl_encoding;
          foreach my $input (@{$self->{'input'}}) {
            binmode($input->{'fh'}, ":encoding($perl_encoding)")
              if ($input->{'fh'});
          }
        }
      } elsif ($command eq 'documentlanguage') {
        my @messages = Texinfo::Common::warn_unknown_language($text);
        foreach my $message(@messages) {
          $self->_command_warn($current, $source_info, $message);
        }
        if (!$self->{'set'}->{'documentlanguage'}) {
           $self->{'documentlanguage'} = $text;
        }
      }
    }
    if ($superfluous_arg) {
      my $texi_line
        = Texinfo::Convert::Texinfo::convert_to_texinfo($current->{'args'}->[0]);
      $texi_line =~ s/^\s*//;
      $texi_line =~ s/\s*$//;

      $self->_command_error($current, $source_info,
                     __("bad argument to \@%s: %s"),
                     $command, $texi_line);
    }
  } elsif ($command eq 'node') {
    $current->{'extra'} = {} if (!$current->{'extra'});
    foreach my $arg (@{$current->{'args'}}) {
      my $node = _parse_node_manual($arg);
      push @{$current->{'extra'}->{'nodes_manuals'}}, $node;
    }
    _check_internal_node($self, $current->{'extra'}->{'nodes_manuals'}->[0],
                         $source_info);
    _register_label($self->{'targets'}, $current,
                 $current->{'extra'}->{'nodes_manuals'}->[0]);
    if ($self->{'current_part'}) {
      my $part = $self->{'current_part'};
      if (not $part->{'extra'}
         or not $part->{'extra'}->{'part_associated_section'}) {
        # we only associate a part to the following node if the
        # part is not already associate to a sectioning command,
        # but the part can be associated to the sectioning command later
        # if a sectioning command follows the node.
        $current->{'extra'}->{'node_preceding_part'} = $part;
        $part->{'extra'} = {} if (!defined($part->{'extra'}));
        $part->{'extra'}->{'part_following_node'} = $current;
      }
    }
    $self->{'current_node'} = $current;
  } elsif ($command eq 'listoffloats') {
    # for now done in Texinfo::Convert::NodeNameNormalization, but could be
    # good to do in Parser/XS
    #_parse_float_type($current);
  } else {
    # Handle all the other 'line' commands.  Here just check that they
    # have an argument.  Empty @top is allowed
    if (!$current->{'args'}->[0]->{'contents'} and $command ne 'top') {
      $self->_command_warn($current, $source_info,
             __("\@%s missing argument"), $command);
      $current->{'extra'} = {} if (!$current->{'extra'});
      $current->{'extra'}->{'missing_argument'} = 1;
    } else {
      if (($command eq 'item' or $command eq 'itemx')
          and $current->{'parent'}->{'cmdname'}
          and $self->{'command_index'}->{$current->{'parent'}->{'cmdname'}}) {
        _enter_index_entry($self, $current->{'parent'}->{'cmdname'},
                           $command, $current,
                           $current->{'args'}->[0]->{'contents'},
                           undef, $source_info);
      } elsif ($self->{'command_index'}->{$current->{'cmdname'}}) {
        _enter_index_entry($self, $current->{'cmdname'},
                           $current->{'cmdname'}, $current,
                           $current->{'args'}->[0]->{'contents'},
                           undef, $source_info);
        $current->{'type'} = 'index_entry_command';
      }
      # if there is a brace command interrupting an index or subentry
      # command, replace the internal internal_spaces_before_brace_in_index
      # text type with its final type depending on whether there is
      # text after the brace command.
      if (_is_index_element($self, $current)) {
        if (defined($current->{'extra'}->{'sortas'})
            or defined($current->{'extra'}->{'seealso'})
            or defined($current->{'extra'}->{'seeentry'})) {
          _set_non_ignored_space_in_index_before_command(
                         $current->{'args'}->[0]->{'contents'});
        }
      }
    }
  }
  $current = $current->{'parent'};
  if ($end_command) { # Set above
    # More processing of @end
    print STDERR "END COMMAND $end_command\n" if ($self->{'DEBUG'});
    # Reparent the "@end" element to be a child of the block element.
    my $end = _pop_element_from_contents($self, $current);
    if ($block_commands{$end_command} ne 'conditional') {
      my $closed_command;
      ($closed_command, $current)
         = _close_commands($self, $current, $source_info, $end_command);
      if ($closed_command) {
        _close_command_cleanup($self, $closed_command);
        $end->{'parent'} = $closed_command;
        push @{$closed_command->{'contents'}}, $end;
      } else {
        # block command not found for @end
      }
      # closing a menu command, but still in a menu. Open a menu_comment
      if ($closed_command
          and $block_commands{$closed_command->{'cmdname'}} eq 'menu'
          and defined($self->_top_context_command())
          and $block_commands{$self->_top_context_command()} eq 'menu') {
        print STDERR "CLOSE MENU but still in menu context\n"
          if ($self->{'DEBUG'});
        push @{$current->{'contents'}}, {'type' => 'menu_comment',
                                         'parent' => $current,
                                         'contents' => [] };
        $current = $current->{'contents'}->[-1];
      }

      $current = _begin_preformatted($self, $current)
        if ($close_preformatted_commands{$end_command});
    }
  } else {
    # Ignore @setfilename in included file, as said in the manual.
    if ($included_file
        or ($command eq 'setfilename' and _in_include($self))) {
      my $source_mark;
      if ($included_file) {
        $source_mark = $include_source_mark;
      } else {
        $source_mark = { 'sourcemark_type' => $command };
      }
      # this is in order to keep source marks that are within a
      # removed element.  For the XS parser it is also easier to
      # manage the source mark memory which can stay associated
      # to the element.
      my $removed_element = _pop_element_from_contents($self, $current);
      $source_mark->{'element'} = $removed_element;
      _register_source_mark($self, $current, $source_mark);
    }
    $current = _begin_preformatted($self, $current)
      if ($close_preformatted_commands{$command});
  }

  if ($command eq 'setfilename'
      and ($self->{'current_node'} or $self->{'current_section'})) {
    $self->_command_warn($misc_cmd, $source_info,
             __("\@%s after the first element"), $command);
  # columnfractions
  } elsif ($command eq 'columnfractions') {
    # in a multitable, we are in a block_line_arg
    if (!$current->{'parent'} or !$current->{'parent'}->{'cmdname'}
                 or $current->{'parent'}->{'cmdname'} ne 'multitable') {
      $self->_command_error($current, $source_info,
             __("\@%s only meaningful on a \@multitable line"),
             $command);
    } else {
      # This is the multitable block_line_arg line context
      $self->_pop_context(['ct_line'], $source_info, $current, 'for multitable');
      pop @{$self->{'nesting_context'}->{'basic_inline_stack_block'}};
      # FIXME much better to pop contexts in exactly one place in the
      # source code.

      $current = $current->{'parent'};
      $current->{'extra'} = {} if (!defined($current->{'extra'}));
      $current->{'extra'}->{'max_columns'} = 0;
      if ($misc_cmd->{'extra'}
          and defined($misc_cmd->{'extra'}->{'misc_args'})) {
        $current->{'extra'}->{'max_columns'}
            = scalar(@{$misc_cmd->{'extra'}->{'misc_args'}});
        $current->{'extra'}->{'columnfractions'} = $misc_cmd;
      }
      push @{$current->{'contents'}}, { 'type' => 'before_item',
                                        'parent', $current };
      $current = $current->{'contents'}->[-1];
    }
  } elsif ($root_commands{$command}) {
    $current = $current->{'contents'}->[-1];
    delete $current->{'remaining_args'};

    # associate the section (not part) with the current node.
    if ($command ne 'node' and $command ne 'part') {
      if ($self->{'current_node'}
         and !$self->{'current_node'}->{'extra'}->{'associated_section'}) {
        $self->{'current_node'}->{'extra'}->{'associated_section'} = $current;
        $current->{'extra'} = {} if (!$current->{'extra'});
        $current->{'extra'}->{'associated_node'} = $self->{'current_node'};
      }
      if ($self->{'current_part'}) {
        $current->{'extra'} = {} if (!defined($current->{'extra'}));
        $current->{'extra'}->{'associated_part'} = $self->{'current_part'};
        $self->{'current_part'}->{'extra'} = {}
          if (!defined($self->{'current_part'}->{'extra'}));
        $self->{'current_part'}->{'extra'}->{'part_associated_section'}
                                                 = $current;
        if ($current->{'cmdname'} eq 'top') {
          $self->_line_warn("\@part should not be associated with \@top",
                           $self->{'current_part'}->{'source_info'});
        }
        delete $self->{'current_part'};
      }
      $self->{'current_section'} = $current;
    } elsif ($command eq 'part') {
      $self->{'current_part'} = $current;
      if ($self->{'current_node'}
         and !$self->{'current_node'}->{'extra'}->{'associated_section'}) {
        $self->_line_warn(sprintf(__(
         "\@node precedes \@%s, but parts may not be associated with nodes"),
                                  $command), $source_info);
      }
    }
  }
  return $current;
}

sub _end_line_def_line($$$)
{
  my $self = shift;
  my $current = shift;
  my $source_info = shift;

  $self->_pop_context(['ct_def'], $source_info, $current);
  my $def_command = $current->{'parent'}->{'extra'}->{'def_command'};

  print STDERR "END DEF LINE $def_command; current: "
    .Texinfo::Common::debug_print_element_short($current)."\n"
      if ($self->{'DEBUG'});

  _isolate_last_space($self, $current);

  my $arguments = _parse_def($self, $def_command, $current, $source_info);
  if (scalar(@$arguments)) {
    #$current->{'parent'}->{'extra'}->{'def_args'} = $arguments;
    my $def_parsed_hash = {};
    foreach my $arg (@$arguments) {
      die if (!defined($arg->[0]));
      last if ($arg->[0] eq 'arg' or $arg->[0] eq 'typearg'
               or $arg->[0] eq 'delimiter');
      next if ($arg->[0] eq 'spaces');
      $def_parsed_hash->{$arg->[0]} = $arg->[1];
    }
    $current->{'parent'}->{'extra'}->{'def_parsed_hash'} = $def_parsed_hash;
    # do a standard index entry tree
    my $index_entry;
    if (defined($def_parsed_hash->{'name'})) {
      $index_entry = $def_parsed_hash->{'name'}
       # empty bracketed
        unless ($def_parsed_hash->{'name'}->{'type'}
                and $def_parsed_hash->{'name'}->{'type'} eq 'bracketed_def_content'
                and (!$def_parsed_hash->{'name'}->{'contents'}
                     or (!scalar(@{$def_parsed_hash->{'name'}->{'contents'}}))
                     or (scalar(@{$def_parsed_hash->{'name'}->{'contents'}}) == 1
                        and defined($def_parsed_hash->{'name'}->{'contents'}->[0]->{'text'})
                        and $def_parsed_hash->{'name'}->{'contents'}->[0]->{'text'} !~ /\S/)));
    }
    if (defined($index_entry)) {
      my $index_contents_normalized;
      if ($def_parsed_hash->{'class'}) {
        # Delay getting the text until Texinfo::Structuring::sort_index_keys
        # in order to avoid using gdt.
        # We need to store the language as well in case there are multiple
        # languages in the document.
        if ($command_index{$def_command} eq 'fn'
            or $command_index{$def_command} eq 'vr'
                and $def_command ne 'defcv') {
          undef $index_entry;
          if (defined($self->{'documentlanguage'})) {
            $current->{'parent'}->{'extra'}->{'documentlanguage'}
                   = $self->{'documentlanguage'};
          }
        }
      }
      my $index_contents;
      if ($index_entry) {
        $index_contents_normalized = [$index_entry];
        $index_contents = [$index_entry];
      }

      _enter_index_entry($self,
        $current->{'parent'}->{'extra'}->{'def_command'},
        $current->{'parent'}->{'extra'}->{'original_def_cmdname'},
        $current->{'parent'}, $index_contents,
        $index_contents_normalized, $source_info);
    } else {
      $self->_command_warn($current->{'parent'}, $source_info,
                           __('missing name for @%s'),
         $current->{'parent'}->{'extra'}->{'original_def_cmdname'});
    }
  } else {
    $self->_command_warn($current->{'parent'}, $source_info,
                         __('missing category for @%s'),
       $current->{'parent'}->{'extra'}->{'original_def_cmdname'});
  }
  $current = $current->{'parent'}->{'parent'};
  $current = _begin_preformatted($self, $current);

  return $current;
}

sub _end_line_starting_block($$$)
{
  my $self = shift;
  my $current = shift;
  my $source_info = shift;

  my $empty_text;
  $self->_pop_context(['ct_line'], $source_info, $current,
                      'in block_line_arg');

  my $command = $current->{'parent'}->{'cmdname'};
  $command = '' if !defined($command);

  if ($self->{'basic_inline_commands'}->{$command}) {
    pop @{$self->{'nesting_context'}->{'basic_inline_stack_block'}};
  }

  print STDERR "END BLOCK LINE: "
     .Texinfo::Common::debug_print_element_short($current, 1)."\n"
       if ($self->{'DEBUG'});

  # @multitable args
  if ($command eq 'multitable') {
    # parse the prototypes and put them in a special arg
    my @prototype_row;
    if ($current->{'contents'}) {
      foreach my $content (@{$current->{'contents'}}) {
        if ($content->{'type'} and $content->{'type'} eq 'bracketed') {
          # TODO the 'extra' information in $content is not copied over,
          # at least leading/trailing spaces (something else?).
          my $bracketed_prototype
            = { 'type' => 'bracketed_multitable_prototype' };
          $bracketed_prototype->{'contents'} = $content->{'contents'}
            if ($content->{'contents'});
          push @prototype_row, $bracketed_prototype;
        } elsif ($content->{'text'}) {
          # TODO: this should be a warning or an error - all prototypes
          # on a @multitable line should be in braces, as documented in the
          # Texinfo manual.
          if ($content->{'text'} =~ /\S/) {
            foreach my $prototype (split /\s+/, $content->{'text'}) {
              push @prototype_row, { 'text' => $prototype,
                                     'type' => 'row_prototype' }
                unless ($prototype eq '');
            }
          }
        } else {
          if (!$content->{'cmdname'}
                or ($content->{'cmdname'} ne 'c'
                    and $content->{'cmdname'} ne 'comment')) {
            $self->_command_warn($current, $source_info,
                __("unexpected argument on \@%s line: %s"),
                     $command,
                     Texinfo::Convert::Texinfo::convert_to_texinfo($content));
          }
        }
      }
    }
    my $multitable = $current->{'parent'};
    $multitable->{'extra'} = {} if (!$multitable->{'extra'});
    $multitable->{'extra'}->{'max_columns'} = scalar(@prototype_row);
    if (!scalar(@prototype_row)) {
      $self->_command_warn($multitable, $source_info,
                           __("empty multitable"));
    }
    $multitable->{'extra'}->{'prototypes'} = \@prototype_row;
  }
  _isolate_last_space($self, $current);
  $current = $current->{'parent'};
  delete $current->{'remaining_args'};

  # @float args
  if ($command eq 'float') {
    $current->{'source_info'} = $source_info;
    my $type = '';
    my $float_label;
    if ($current->{'args'} and $current->{'args'}->[1]) {
      $float_label = _parse_node_manual($current->{'args'}->[1]);
      _check_internal_node($self, $float_label, $source_info);
    }
    # for now done in Texinfo::Convert::NodeNameNormalization, but could be
    # good to do in Parser/XS
    #_parse_float_type($current);
    #$type = $current->{'extra'}->{'type'}->{'normalized'};
    #push @{$self->{'floats'}->{$type}}, $current;
    _register_label($self->{'targets'}, $current, $float_label);
    if (defined($self->{'current_section'})) {
      $current->{'extra'} = {} if (!defined($current->{'extra'}));
      $current->{'extra'}->{'float_section'} = $self->{'current_section'};
    }

    # all the commands with @item
  } elsif ($blockitem_commands{$command}) {
    if ($command eq 'enumerate') {
      my $spec = '1';
      if ($current->{'args'} and $current->{'args'}->[0]
          and $current->{'args'}->[0]->{'contents'}
          and @{$current->{'args'}->[0]->{'contents'}}) {
        if (scalar(@{$current->{'args'}->[0]->{'contents'}}) > 1) {
          $self->_command_error($current, $source_info,
                      __("superfluous argument to \@%s"), $command);
        }
        my $arg = $current->{'args'}->[0]->{'contents'}->[0];
        if (!defined($arg->{'text'})
            or $arg->{'text'} !~ /^(([[:digit:]]+)|([[:alpha:]]))$/) {
          $self->_command_error($current, $source_info,
                      __("bad argument to \@%s"), $command);
        } else {
          $spec = $arg->{'text'};
        }
      }
      $current->{'extra'} = {} if (!$current->{'extra'});
      $current->{'extra'}->{'enumerate_specification'} = $spec;
    } elsif ($block_commands{$command} eq 'item_line') {
      if (!$current->{'extra'}
          or !$current->{'extra'}->{'command_as_argument'}) {
        if ($current->{'args'}->[0]->{'contents'}
            and scalar(@{$current->{'args'}->[0]->{'contents'}})) {
          # expand the contents to avoid surrounding spaces
          my $texi_arg
            = Texinfo::Convert::Texinfo::convert_to_texinfo(
                    {'contents' => $current->{'args'}->[0]->{'contents'}});
          $self->_command_error($current, $source_info,
                                __("bad argument to \@%s: %s"),
                                $command, $texi_arg);
        } else {
          $self->_command_error($current, $source_info,
                                __("missing \@%s argument"),
                                $command);
        }
      } elsif ($self->{'brace_commands'}->{
    $current->{'extra'}->{'command_as_argument'}->{'cmdname'}} eq 'noarg') {
        $self->_command_error($current, $source_info,
  __("command \@%s not accepting argument in brace should not be on \@%s line"),
            $current->{'extra'}->{'command_as_argument'}->{'cmdname'},
            $current->{'cmdname'});
        delete $current->{'extra'}->{'command_as_argument'};
        if (scalar(keys(%{$current->{'extra'}})) == 0) {
          delete $current->{'extra'};
        }
      }
    } elsif ($command eq 'itemize'
             and $current->{'extra'}
             and $current->{'extra'}->{'command_as_argument'}) {
      # This code checks that the command_as_argument of the @itemize
      # is alone on the line, otherwise it is not a command_as_argument.
      my @args = @{$current->{'args'}->[0]->{'contents'}};
      while (@args) {
        my $arg = shift @args;
        last if ($arg eq $current->{'extra'}->{'command_as_argument'});
      }
      while (@args) {
        my $arg = shift @args;
        if (!(($arg->{'cmdname'}
               and ($arg->{'cmdname'} eq 'c'
                    or $arg->{'cmdname'} eq 'comment'))
              or (defined($arg->{'text'}) and $arg->{'text'} !~ /\S/))) {
          delete $current->{'extra'}->{'command_as_argument'}->{'type'};
          delete $current->{'extra'}->{'command_as_argument'};
          if (scalar(keys(%{$current->{'extra'}})) == 0) {
            delete $current->{'extra'};
          }
          last;
        }
      }
    }
    if ($current->{'extra'}
        and $current->{'extra'}->{'command_as_argument'}
        and $accent_commands{$current->{'extra'}->{'command_as_argument'}
                                                                 ->{'cmdname'}}
        and ($command eq 'itemize'
             or $block_commands{$command} eq 'item_line')) {
      # this can only happen to an accent command with brace, if without
      # brace it is not set as command_as_argument to begin with.
      $self->_command_warn($current, $source_info,
            __("accent command `\@%s' not allowed as \@%s argument"),
            $current->{'extra'}->{'command_as_argument'}->{'cmdname'},
            $command);
      delete $current->{'extra'}->{'command_as_argument'};
      if (scalar(keys(%{$current->{'extra'}})) == 0) {
        delete $current->{'extra'};
      }
    }
    if ($command eq 'itemize') {
      if ((!$current->{'args'}
          or !$current->{'args'}->[0]
          or !$current->{'args'}->[0]->{'contents'}
          or !@{$current->{'args'}->[0]->{'contents'}})) {
        my $block_line_arg;
        if ($current->{'args'} and $current->{'args'}->[-1]
            and $current->{'args'}->[-1]->{'type'}
            and $current->{'args'}->[-1]->{'type'} eq 'block_line_arg') {
          $block_line_arg = $current->{'args'}->[-1];
        } else {
          $block_line_arg = { 'type' => 'block_line_arg',
                              'parent' => $current,
                              'contents' => [] };
          unshift @{$current->{'args'}}, $block_line_arg;
        }
        my $inserted = { 'cmdname' => 'bullet',
                         'type' => 'command_as_argument_inserted',
                         'parent' => $block_line_arg };
        unshift @{$block_line_arg->{'contents'}}, $inserted;
        $current->{'extra'} = {} if (!$current->{'extra'});
        $current->{'extra'}->{'command_as_argument'} = $inserted;
      }
    } elsif ($block_commands{$command} eq 'item_line') {
      $current->{'extra'} = {} if (!$current->{'extra'});
      if (!$current->{'extra'}->{'command_as_argument'}) {
        my $inserted =  { 'cmdname' => 'asis',
                          'type' => 'command_as_argument_inserted',
                          'parent' => $current };
        unshift @{$current->{'args'}}, $inserted;
        $current->{'extra'}->{'command_as_argument'} = $inserted;
      }
    }
    push @{$current->{'contents'}}, { 'type' => 'before_item',
                                      'parent', $current };
    $current = $current->{'contents'}->[-1];
  } elsif (not $commands_args_number{$command}
           and not exists($variadic_commands{$command})
           and $current->{'args'}
           and scalar(@{$current->{'args'}})
           and $current->{'args'}->[0]->{'contents'}
           and scalar(@{$current->{'args'}->[0]->{'contents'}})) {
    # expand the contents to avoid surrounding spaces
    my $texi_arg = Texinfo::Convert::Texinfo::convert_to_texinfo(
                       {'contents' => $current->{'args'}->[0]->{'contents'}});
    $self->_command_warn($current, $source_info,
                         __("unexpected argument on \@%s line: %s"),
                         $command, $texi_arg);
  }
  if ($block_commands{$command} eq 'menu') {
    push @{$current->{'contents'}}, {'type' => 'menu_comment',
                                     'parent' => $current,
                                     'contents' => [] };
    $current = $current->{'contents'}->[-1];
    print STDERR "MENU_COMMENT OPEN\n" if ($self->{'DEBUG'});
  }
  if ($block_commands{$command} eq 'format_raw'
      and $self->{'expanded_formats_hash'}->{$command}) {
    push @{$current->{'contents'}},
        { 'type' => 'rawpreformatted',
          'parent' => $current };
    $current = $current->{'contents'}->[-1];
  }
  $current = _begin_preformatted($self, $current)
    unless ($block_commands{$command} eq 'raw');

  return $current;
}

# close constructs and do stuff at end of line (or end of the document)
sub _end_line($$$);
sub _end_line($$$)
{
  my ($self, $current, $source_info) = @_;

  my $current_old = $current;

  # a line consisting only of spaces.
  if ($current->{'contents'} and @{$current->{'contents'}}
      and $current->{'contents'}->[-1]->{'type'}
      and $current->{'contents'}->[-1]->{'type'} eq 'empty_line') {
    print STDERR "END EMPTY LINE\n" if ($self->{'DEBUG'});
    if ($current->{'type'} and $current->{'type'} eq 'paragraph') {
      # Remove empty_line element.
      my $empty_line = _pop_element_from_contents($self, $current);
      $current = _end_paragraph($self, $current, $source_info);
      push @{$current->{'contents'}}, $empty_line;
      $empty_line->{'parent'} = $current;
    } elsif ($current->{'type'}
             and $current->{'type'} eq 'preformatted'
             and $current->{'parent'}->{'type'}
             and $current->{'parent'}->{'type'} eq 'menu_entry_description')  {
      # happens for an empty line following a menu_description
      my $empty_line = _pop_element_from_contents($self, $current);
      my $preformatted = $current;
      $current = $current->{'parent'};
      if (not $preformatted->{'contents'} or
          not scalar(@{$preformatted->{'contents'}})) {
        my $empty_preformatted = _pop_element_from_contents($self, $current);
        # it should not be possible to have associated source marks
        # as the source marks are either associated to the menu description
        # or to the empty line after the menu description.  Leave a message
        # in case it happens in the future/some unexpected case.
        if ($self->get_conf('TEST')
            and $empty_preformatted->{'source_marks'}) {
          print STDERR "BUG: source_marks in menu description preformatted\n";
        }
      }

      # first parent is menu_entry
      $current = $current->{'parent'}->{'parent'};

      push @{$current->{'contents'}}, { 'type' => 'menu_comment',
                                        'parent' => $current,
                                        'contents' => [] };
      $current = $current->{'contents'}->[-1];
      push @{$current->{'contents'}}, { 'type' => 'preformatted',
                                        'parent' => $current,
                                        'contents' => [] };
      $current = $current->{'contents'}->[-1];
      my $after_menu_description_line = {
                                        'type' => 'after_menu_description_line',
                                        'text' => $empty_line->{'text'},
                                        'parent' => $current };
      _transfer_source_marks($empty_line, $after_menu_description_line);
      push @{$current->{'contents'}}, $after_menu_description_line;
      print STDERR "MENU: END DESCRIPTION, OPEN COMMENT\n" if ($self->{'DEBUG'});
    } elsif (!$no_paragraph_contexts{$self->_top_context()}) {
      $current = _end_paragraph($self, $current, $source_info);
    }

  # end of a menu line.
  } elsif ($current->{'type'}
    and ($current->{'type'} eq 'menu_entry_name'
     or $current->{'type'} eq 'menu_entry_node')) {
    my $empty_menu_entry_node = 0;
    my $end_comment;
    if ($current->{'type'} eq 'menu_entry_node') {
      if (@{$current->{'contents'}}
          and $current->{'contents'}->[-1]->{'cmdname'}
          and ($current->{'contents'}->[-1]->{'cmdname'} eq 'c'
            or $current->{'contents'}->[-1]->{'cmdname'} eq 'comment')) {
        $end_comment = _pop_element_from_contents($self, $current);
      }
      if (not $current->{'contents'} or not scalar(@{$current->{'contents'}})
           # empty if only the end of line or spaces, including non ascii spaces
           or (@{$current->{'contents'}} == 1
               and defined($current->{'contents'}->[-1]->{'text'})
               and $current->{'contents'}->[-1]->{'text'} !~ /\S/)) {
        $empty_menu_entry_node = 1;
        push @{$current->{'contents'}}, $end_comment if ($end_comment);
      }
    }
    # we abort the menu entry if there is no node name
    if ($empty_menu_entry_node or $current->{'type'} eq 'menu_entry_name') {
      my $description_or_menu_comment;
      my $menu_type_reopened = 'menu_description';
      print STDERR "FINALLY NOT MENU ENTRY\n" if ($self->{'DEBUG'});
      my $menu = $current->{'parent'}->{'parent'};
      my $menu_entry = _pop_element_from_contents($self, $menu);
      if ($menu->{'contents'} and scalar(@{$menu->{'contents'}})
          and $menu->{'contents'}->[-1]->{'type'}
          and $menu->{'contents'}->[-1]->{'type'} eq 'menu_entry') {
        my $entry = $menu->{'contents'}->[-1];
        my $description;
        foreach my $entry_element (reverse(@{$entry->{'contents'}})) {
          if ($entry_element->{'type'} eq 'menu_entry_description') {
            $description = $entry_element;
            last;
          }
        }
        if ($description) {
          $description_or_menu_comment = $description;
        } else {
          # Normally this cannot happen
          $self->_bug_message("no description in menu_entry",
                               $source_info, $current);
          push @{$entry->{'contents'}}, {'type' => 'menu_entry_description',
                                     'parent' => $entry, };
          $description_or_menu_comment = $entry->{'contents'}->[-1];
        }
      } elsif ($menu->{'contents'} and scalar(@{$menu->{'contents'}})
               and $menu->{'contents'}->[-1]->{'type'}
               and $menu->{'contents'}->[-1]->{'type'} eq 'menu_comment') {
        $description_or_menu_comment = $menu->{'contents'}->[-1];
        $menu_type_reopened = 'menu_comment';
      }
      if ($description_or_menu_comment) {
        $current = $description_or_menu_comment;
        if ($current->{'contents'}->[-1]
            and $current->{'contents'}->[-1]->{'type'}
            and $current->{'contents'}->[-1]->{'type'} eq 'preformatted') {
          $current = $current->{'contents'}->[-1];
        } else {
          # this should not happen
          $self->_bug_message("description or menu comment not in preformatted",
                              $source_info, $current);
          push @{$current->{'contents'}}, {'type' => 'preformatted',
                                    'parent' => $current, };
          $current = $current->{'contents'}->[-1];
        }
      } else {
        push @{$menu->{'contents'}}, {'type' => 'menu_comment',
                                    'parent' => $menu,
                                    'contents' => [] };
        $current = $menu->{'contents'}->[-1];
        push @{$current->{'contents'}}, {'type' => 'preformatted',
                                  'parent' => $current, };
        $current = $current->{'contents'}->[-1];
        print STDERR "THEN MENU_COMMENT OPEN\n" if ($self->{'DEBUG'});
      }
      # source marks tested in t/*macro.t macro_in_menu_comment_like_entry
      while (@{$menu_entry->{'contents'}}) {
        my $arg = shift @{$menu_entry->{'contents'}};
        if (defined($arg->{'text'})) {
          $current = _merge_text($self, $current, $arg->{'text'}, $arg);
        } elsif ($arg->{'contents'}) {
          while (@{$arg->{'contents'}}) {
            my $content = shift @{$arg->{'contents'}};
            if (defined($content->{'text'})) {
              $current = _merge_text($self, $current, $content->{'text'},
                                     $content);
              $content = undef;
            } else {
              $content->{'parent'} = $current;
              push @{$current->{'contents'}}, $content;
            }
          }
        }
        $arg = undef;
      }
      # MENU_COMMENT open
      $menu_entry = undef;
    } else {
      print STDERR "MENU ENTRY END LINE\n" if ($self->{'DEBUG'});
      $current = $current->{'parent'};
      $current = _enter_menu_entry_node($self, $current, $source_info);
      if (defined($end_comment)) {
        $end_comment->{'parent'} = $current;
        push @{$current->{'contents'}}, $end_comment;
      }
    }
  # def line
  } elsif ($current->{'parent'}
            and $current->{'parent'}->{'type'}
            and $current->{'parent'}->{'type'} eq 'def_line') {
    $current = _end_line_def_line($self, $current, $source_info);
  # other block command lines
  } elsif ($current->{'type'}
            and $current->{'type'} eq 'block_line_arg') {
    $current = _end_line_starting_block($self, $current, $source_info);

  # misc command line arguments
  # Never go here if skipline/noarg/...
  } elsif ($current->{'type'} and $current->{'type'} eq 'line_arg') {
    $current = _end_line_misc_line($self, $current, $source_info);
  }

  # this happens if there is a nesting of line @-commands on a line.
  # they are reprocessed here.
  my $top_context = $self->_top_context();
  if ($top_context eq 'ct_line' or $top_context eq 'ct_def') {
    print STDERR "Still opened line command $top_context:"
      ._print_current($current)
        if ($self->{'DEBUG'});
    if ($top_context eq 'ct_def') {
      while ($current->{'parent'} and !($current->{'parent'}->{'type'}
            and $current->{'parent'}->{'type'} eq 'def_line')) {
        $current = _close_current($self, $current, $source_info);
      }
    } else {
      while ($current->{'parent'} and !($current->{'type'}
             and ($current->{'type'} eq 'block_line_arg'
                  or $current->{'type'} eq 'line_arg'))) {
        $current = _close_current($self, $current, $source_info);
      }
    }

    # check for infinite loop bugs...
    if ($current eq $current_old) {
      my $indent_str = '- ';
      my $tree_msg = $indent_str . _print_current($current);
      while ($current->{'parent'}) {
        $indent_str = '-'.$indent_str;
        $current = $current->{'parent'};
        $tree_msg .= $indent_str . _print_current($current);
      }
      $self->_bug_message("Nothing closed while a line context remains\n"
                                                                . $tree_msg,
                          $source_info);
      die;
    }

    $current = $self->_end_line($current, $source_info);
  }
  return $current;
}

# $command may be undef if we are after a wrong other command such as
# a buggy @tab.
sub _start_empty_line_after_command($$$) {
  my ($line, $current, $command) = @_;

  $line =~ s/^([^\S\r\n]*)//;
  push @{$current->{'contents'}}, { 'type' => 'ignorable_spaces_after_command',
                                    'text' => $1,
                                    'parent' => $current,
                                  };
  if (defined($command)) {
    $current->{'contents'}->[-1]->{'extra'}
       = {'spaces_associated_command' => $command};
    $current->{'contents'}->[-1]->{'type'} = 'internal_spaces_after_command';
  }
  return $line;
}

sub _check_empty_node($$$$)
{
  my ($self, $parsed_node, $command, $source_info) = @_;

  if (!defined($parsed_node) or !$parsed_node->{'node_content'}) {
    $self->_line_error(sprintf(__("empty argument in \@%s"),
                $command), $source_info);
    return 0;
  } else {
    return 1;
  }
}

sub _check_internal_node($$$)
{
  my ($self, $parsed_node, $source_info) = @_;

  if ($parsed_node and $parsed_node->{'manual_content'}) {
    $self->_line_error(sprintf(__("syntax for an external node used for `%s'"),
        Texinfo::Structuring::node_extra_to_texi($parsed_node)), $source_info);
  }
}

sub _check_node_label($$$$)
{
  my ($self, $parsed_node, $command, $source_info) = @_;

  _check_internal_node($self, $parsed_node, $source_info);
  return _check_empty_node($self, $parsed_node, $command, $source_info);
}

# Return 1 if an element is all whitespace.
# Note that this function isn't completely reliable because it
# doesn't look deep into the element tree.
# Consistent with XS parser
sub _check_empty_expansion($)
{
  my $current = shift;

  foreach my $content (@$current) {
    if (!(($content->{'cmdname'}
           and ($content->{'cmdname'} eq ' ' or $content->{'cmdname'} eq "\t"
                or $content->{'cmdname'} eq "\n"
                or $content->{'cmdname'} eq 'c'
                or $content->{'cmdname'} eq 'comment'
                or $content->{'cmdname'} eq ':'))
           or (defined($content->{'text'}) and $content->{'text'} !~ /\S/))) {
      return 0;
    }
  }
  return 1;
}

sub _register_extra_menu_entry_information($$;$)
{
  my ($self, $current, $source_info) = @_;

  foreach my $arg (@{$current->{'contents'}}) {
    if ($arg->{'type'} eq 'menu_entry_name') {
      if (not $arg->{'contents'} or scalar(@{$arg->{'contents'}}) == 0) {
        $self->_line_warn(sprintf(__("empty menu entry name in `%s'"),
                   Texinfo::Convert::Texinfo::convert_to_texinfo($current)),
                          $source_info);
      }
    } elsif ($arg->{'type'} eq 'menu_entry_node') {
      _isolate_last_space($self, $arg);
      if (! $arg->{'contents'}) {
        if ($self->{'FORMAT_MENU'} eq 'menu') {
          $self->_line_error(__("empty node name in menu entry"), $source_info);
        }
      } else {
        my $parsed_entry_node = _parse_node_manual($arg);
        $current->{'extra'} = {} if (!$current->{'extra'});
        $current->{'extra'}->{'menu_entry_node_label'} = $parsed_entry_node;
      }
    }
  }
}

sub _enter_menu_entry_node($$$)
{
  my ($self, $current, $source_info) = @_;

  my $description = { 'type' => 'menu_entry_description',
                      'parent' => $current };
  push @{$current->{'contents'}}, $description;
  _register_extra_menu_entry_information($self, $current, $source_info);
  $current->{'source_info'} = $source_info;
  push @{$self->{'internal_references'}}, $current;

  $current = $description;
  push @{$current->{'contents'}}, {'type' => 'preformatted',
                                   'parent' => $current, };
  $current = $current->{'contents'}->[-1];
  return $current;
}

# If the container can hold a command as an argument, determined as
# parent element taking a command as an argument, like
# @itemize @bullet, and the command as argument being the only content.
sub _parent_of_command_as_argument($)
{
  my $current = shift;
  return ($current and $current->{'type'}
      and $current->{'type'} eq 'block_line_arg'
      and $current->{'parent'}
      and $current->{'parent'}->{'cmdname'}
      and ($current->{'parent'}->{'cmdname'} eq 'itemize'
           or ($block_commands{$current->{'parent'}->{'cmdname'}}
               and $block_commands{$current->{'parent'}->{'cmdname'}} eq 'item_line'))
      and scalar(@{$current->{'contents'}}) == 1);
}

# register a command like @bullet with @itemize, or @asis with @table
sub _register_command_as_argument($$)
{
  my $self = shift;
  my $cmd_as_arg = shift;
  print STDERR "FOR PARENT \@$cmd_as_arg->{'parent'}->{'parent'}->{'cmdname'} ".
         "command_as_argument $cmd_as_arg->{'cmdname'}\n" if ($self->{'DEBUG'});
  $cmd_as_arg->{'type'} = 'command_as_argument' if (!$cmd_as_arg->{'type'});
  $cmd_as_arg->{'parent'}->{'parent'}->{'extra'} = {}
    if (!defined($cmd_as_arg->{'parent'}->{'parent'}->{'extra'}));
  $cmd_as_arg->{'parent'}->{'parent'}->{'extra'}->{'command_as_argument'}
    = $cmd_as_arg;
  if ($cmd_as_arg->{'cmdname'} eq 'kbd'
      and _kbd_formatted_as_code($self, $cmd_as_arg->{'parent'}->{'parent'})) {
    $cmd_as_arg->{'parent'}->{'parent'}->{'extra'}->{'command_as_argument_kbd_code'} = 1;
  }
}

sub _is_index_element {
  my ($self, $element) = @_;

  if (!$element->{'cmdname'}
        or (!$self->{'command_index'}->{$element->{'cmdname'}}
             and $element->{'cmdname'} ne 'subentry')) {
    return 0;
  }
  return 1;
}

# This combines several regular expressions used in '_parse_texi' to
# look at what is next on the remaining part of the line.
# NOTE - this sub has an XS override
sub _parse_texi_regex {
  my ($line) = @_;

  # REMACRO
  my ($at_command, $open_brace, $asterisk, $single_letter_command,
      $separator_match, $misc_text)
    = ($line =~ /^\@([[:alnum:]][[:alnum:]-]*)
                |^(\{)
                |^(\*)
                |^\@(["'~\@&\}\{,\.!\? \t\n\*\-\^`=:\|\/\\])
                |^([{}@,:\t.\f])
                |^([^{}@,:\t.\n\f]+)
                /x);

  if ($open_brace) {
    $separator_match = $open_brace;
  } elsif ($asterisk) {
    ($misc_text) = ($line =~ /^([^{}@,:\t.\n\f]+)/);
  }

  return ($at_command, $open_brace, $asterisk, $single_letter_command,
    $separator_match, $misc_text);
}

sub _check_line_directive {
  my ($self, $line, $source_info) = @_;

  if ($self->{'CPP_LINE_DIRECTIVES'}
      and defined($source_info->{'file_name'})
      and $source_info->{'file_name'} ne ''
      and !$source_info->{'macro'}
      and $line =~ /^\s*#\s*(line)? (\d+)(( "([^"]+)")(\s+\d+)*)?\s*$/) {
    _save_line_directive($self, int($2), $5);
    return 1;
  }
  return 0;
}

# Check whether $COMMAND can appear within $CURRENT->{'parent'}.
sub _check_valid_nesting {
  my ($self, $current, $command, $source_info) = @_;

  my $invalid_parent;
  # error messages for forbidden constructs, like @node in @r,
  # block command on line command, @xref in @anchor or node...
  if ($current->{'parent'}) {
    if ($current->{'parent'}->{'cmdname'}) {
      if (defined($self->{'valid_nestings'}
                                   ->{$current->{'parent'}->{'cmdname'}})
          and !$self->{'valid_nestings'}
                             ->{$current->{'parent'}->{'cmdname'}}->{$command}
          # we make sure that we are on a root @-command line and
          # not in contents
          and (!$root_commands{$current->{'parent'}->{'cmdname'}}
               or ($current->{'type'}
                   and $current->{'type'} eq 'line_arg'))
          # we make sure that we are on a block @-command line and
          # not in contents
          and (!defined($block_commands{$current->{'parent'}->{'cmdname'}})
               or ($current->{'type'}
                   and $current->{'type'} eq 'block_line_arg'))
          # we make sure that we are on an @item/@itemx line and
          # not in an @enumerate, @multitable or @itemize @item.
          and (($current->{'parent'}->{'cmdname'} ne 'itemx'
                and $current->{'parent'}->{'cmdname'} ne 'item')
               or ($current->{'type'}
                        and $current->{'type'} eq 'line_arg'))) {
        $invalid_parent = $current->{'parent'}->{'cmdname'};
      }
    } elsif ($self->_top_context() eq 'ct_def'
      # FIXME instead of hardcoding in_basic_inline_with_refs_commands
      # it would be better to use the parent command valid_nesting.
             and !$in_basic_inline_with_refs_commands{$command}) {
      my $def_block = $current;
      while ($def_block->{'parent'}
             and (!$def_block->{'parent'}->{'type'}
                  or $def_block->{'parent'}->{'type'} ne 'def_line')) {
        $def_block = $def_block->{'parent'};
      }

      $invalid_parent = $def_block->{'parent'}->{'parent'}->{'cmdname'};
    }
  }

  if (defined($invalid_parent)) {
    $self->_line_warn(sprintf(__("\@%s should not appear in \@%s"),
              $command, $invalid_parent), $source_info);
  }
}

sub _check_valid_nesting_context
{
  my ($self, $command, $source_info) = @_;

  my $invalid_context;
  if ($command eq 'footnote' and $self->{'nesting_context'}->{'footnote'}) {
    $invalid_context = 'footnote';
  }

  if (($command eq 'caption' or $command eq 'shortcaption')
      and $self->{'nesting_context'}->{'caption'}) {
    $self->_line_warn(sprintf(
        __("\@%s should not appear anywhere inside caption"),
          $command), $source_info);
  } elsif (defined($self->{'nesting_context'}->{'basic_inline_stack'})
       and @{$self->{'nesting_context'}->{'basic_inline_stack'}} > 0
       and !$in_basic_inline_commands{$command}) {
    $invalid_context
      = $self->{'nesting_context'}->{'basic_inline_stack'}->[-1];
  } elsif (defined($self->{'nesting_context'}->{'basic_inline_stack_on_line'})
       and @{$self->{'nesting_context'}->{'basic_inline_stack_on_line'}} > 0
       and !$in_basic_inline_commands{$command}) {
    $invalid_context
      = $self->{'nesting_context'}->{'basic_inline_stack_on_line'}->[-1];
  } elsif (defined($self->{'nesting_context'}->{'basic_inline_stack_block'})
       and @{$self->{'nesting_context'}->{'basic_inline_stack_block'}} > 0
       and !$in_basic_inline_commands{$command}) {
    $invalid_context
      = $self->{'nesting_context'}->{'basic_inline_stack_block'}->[-1];
  }

  $self->_line_warn(sprintf(
        __("\@%s should not appear anywhere inside \@%s"),
            $command, $invalid_context), $source_info)
    if ($invalid_context);
}

sub _setup_document_root_and_before_node_section()
{
  my $before_node_section = { 'type' => 'before_node_section' };
  my $document_root = { 'contents' => [$before_node_section],
                        'type' => 'document_root' };
  $before_node_section->{'parent'} = $document_root;
  return ($document_root, $before_node_section);
}

sub _new_value_element($$;$)
{
  my $command = shift;
  my $flag = shift;
  my $current = shift;

  my $value_elt = { 'cmdname' => $command,
                      'args' => [] };
  $value_elt->{'parent'} = $current if (defined($current));
  # Add a 'brace_command_arg' container?  On the one hand it is
  # not usefull, as there is no contents, only a flag, on the
  # other end, it is different from other similar commands, like 'U'.
  # Beware that it is also used for txiinternalvalue, which for
  # now requires that structure, but it could easily be changed too.
  push @{$value_elt->{'args'}}, {'text' => $flag,
                                 'parent' => $value_elt};
  return $value_elt;
}

sub _handle_macro($$$$$)
{
  my $self = shift;
  my $current = shift;
  my $line = shift;
  my $source_info = shift;
  my $command = shift;

  my $expanded_macro = $self->{'macros'}->{$command}->{'element'};
  my $args_number = scalar(@{$expanded_macro->{'args'}}) -1;
  my $arguments = [];
  if ($line =~ s/^\s*{\s*//) { # macro with args
    # FIXME keep separators information for source mark
    ($arguments, $line, $source_info)
     = _expand_macro_arguments($self, $expanded_macro, $line, $source_info);
  } elsif (($args_number >= 2) or ($args_number <1)) {
  # as agreed on the bug-texinfo mailing list, no warn when zero
  # arg and not called with {}.
    $self->_line_warn(sprintf(__(
 "\@%s defined with zero or more than one argument should be invoked with {}"),
                              $command), $source_info)
       if ($args_number >= 2);
  } else {
    if ($line !~ /\n/) {
      ($line, $source_info) = _new_line($self);
      $line = '' if (!defined($line));
    }
    # FIXME keep separators information for source mark
    $line =~ s/^\s*// if ($line =~ /\S/);
    my $has_end_of_line = chomp $line;
    $arguments = [$line];
    $line = "\n" if ($has_end_of_line);
  }
  my $expanded = _expand_macro_body($self,
                            $self->{'macros'}->{$command},
                            $arguments, $source_info);
  print STDERR "MACROBODY: $expanded".'||||||'."\n"
    if ($self->{'DEBUG'});
  chomp($expanded);

  if ($self->{'MAX_MACRO_CALL_NESTING'}
      and scalar(@{$self->{'macro_stack'}}) >= $self->{'MAX_MACRO_CALL_NESTING'}) {
    $self->_line_warn(sprintf(__(
  "macro call nested too deeply (set MAX_MACRO_CALL_NESTING to override; current value %d)"),
                          $self->{'MAX_MACRO_CALL_NESTING'}), $source_info);
    goto funexit;
  }

  if ($expanded_macro->{'cmdname'} eq 'macro') {
    my $found = 0;
    foreach my $macro (@{$self->{'macro_stack'}}) {
      if ($macro->{'args'}->[0]->{'text'} eq $command) {
        $self->_line_error(sprintf(__(
       "recursive call of macro %s is not allowed; use \@rmacro if needed"),
                                   $command), $source_info);
        $found = 1;
        last;
      }
    }
    goto funexit if ($found);
  }

  unshift @{$self->{'macro_stack'}}, $expanded_macro;
  print STDERR "UNSHIFT MACRO_STACK: $expanded_macro->{'args'}->[0]->{'text'}\n"
    if ($self->{'DEBUG'});
  # first put the line that was interrupted by the macro call
  # on the input pending text with information stack
  _input_push_text($self, $line, $source_info->{'line_nr'});
  # then put the following macro expansion lines with information on the
  # pending text
  _input_push_text($self, $expanded, $source_info->{'line_nr'},
                   $expanded_macro->{'args'}->[0]->{'text'});
  my $macro_source_mark = {'sourcemark_type' => 'macro_expansion',
                           'status' => 'start'};
  my $sm_macro_element = {'type' => $expanded_macro->{'cmdname'}.'_call',
   'extra' => {'name' => $command}};
  if (scalar(@$arguments)) {
    $sm_macro_element->{'args'} = [];
    foreach my $arg (@$arguments) {
      push @{$sm_macro_element->{'args'}}, {'text' => $arg};
    }
  }
  $macro_source_mark->{'element'} = $sm_macro_element;
  _register_source_mark($self, $current, $macro_source_mark);
  $self->{'input'}->[0]->{'input_source_mark'} = $macro_source_mark;
  $line = '';
 funexit:
  return ($line, $source_info);
}

my $STILL_MORE_TO_PROCESS = 0;
my $GET_A_NEW_LINE = 1;
my $FINISHED_TOTALLY = -1;

# return values:
#     $STILL_MORE_TO_PROCESS: when there is more to process on the line
#     $GET_A_NEW_LINE: when we need to read a new line
#     $FINISHED_TOTALLY: found @bye, end of processing
sub _process_remaining_on_line($$$$)
{
  my $self = shift;
  my $current = shift;
  my $line = shift;
  my $source_info = shift;

  my $retval = $STILL_MORE_TO_PROCESS;

  # in a 'raw' (verbatim, ignore, (r)macro)
  if ($current->{'cmdname'}
      and $block_commands{$current->{'cmdname'}}
      and ($block_commands{$current->{'cmdname'}} eq 'raw')) {
    my $closed_nested_raw;
    # r?macro may be nested
    if ((($current->{'cmdname'} eq 'macro'
          or $current->{'cmdname'} eq 'rmacro')
         and $line =~ /^\s*\@(r?macro)\s+/)
        or ($current->{'cmdname'} eq 'ignore'
            and $line =~ /^\s*\@(ignore)(\@|\s+)/)) {
      push @{$self->{'raw_block_stack'}}, $1;
      print STDERR "RAW SECOND LEVEL $1 in \@$current->{'cmdname'}\n"
        if ($self->{'DEBUG'});
    } elsif ($line =~ /^(\s*?)\@end\s+([a-zA-Z][\w-]*)/
             and ((scalar(@{$self->{'raw_block_stack'}}) > 0
                   and $2 eq $self->{'raw_block_stack'}->[-1])
                  or (scalar(@{$self->{'raw_block_stack'}}) == 0
                      and $2 eq $current->{'cmdname'}))) {
      if (scalar(@{$self->{'raw_block_stack'}}) == 0) {
        if ($line =~ s/^(\s+)//) {
          push @{$current->{'contents'}},
            { 'text' => $1,
              'type' => 'raw', 'parent' => $current };
          $self->_line_warn(sprintf(
                __("\@end %s should only appear at the beginning of a line"),
                                   $current->{'cmdname'}), $source_info);
        }
        if ($current->{'cmdname'} eq 'macro'
            or $current->{'cmdname'} eq 'rmacro') {
          # store toplevel macro specification
          my $macrobody =
             Texinfo::Convert::Texinfo::convert_to_texinfo(
                                 { 'contents' => $current->{'contents'} });
          if ($current->{'args'} and $current->{'args'}->[0]) {
            my $name = $current->{'args'}->[0]->{'text'};
            if (exists($self->{'macros'}->{$name})) {
              $self->_line_warn(sprintf(__("macro `%s' previously defined"),
                                        $name), $current->{'source_info'});
              $self->_line_warn(sprintf(__(
                                 "here is the previous definition of `%s'"),
             $name), $self->{'macros'}->{$name}->{'element'}->{'source_info'});
            }
            if ($all_commands{$name}
                or ($name eq 'txiinternalvalue'
                    and $self->{'accept_internalvalue'})) {
              $self->_line_warn(sprintf(__(
                                "redefining Texinfo language command: \@%s"),
                                        $name), $current->{'source_info'});
            }
            if (!($current->{'extra'}
                  and $current->{'extra'}->{'invalid_syntax'})) {
              $self->{'macros'}->{$name} = {
                'element' => $current,
                'macrobody' => $macrobody
              };
            }
          }
        }
        print STDERR "CLOSED raw $current->{'cmdname'}\n" if ($self->{'DEBUG'});
        # start a new line for the @end line (without the first spaces on
        # the line that have already been put in a raw container).
        # This is normally done at the beginning of a line, but not here,
        # as we directly got the line.  As the @end is processed just below,
        # an empty line will not appear in the output, but it is needed to
        # avoid a duplicate warning on @end not appearing at the beginning
        # of the line
        push @{$current->{'contents'}}, { 'type' => 'empty_line',
                                          'text' => '',
                                          'parent' => $current };
        $closed_nested_raw = 1;
      } else {
        my $closed_cmdname = pop @{$self->{'raw_block_stack'}};
      }
    }
    if (not $closed_nested_raw) {
      push @{$current->{'contents'}},
        { 'text' => $line, 'type' => 'raw', 'parent' => $current };
      $retval = $GET_A_NEW_LINE;
      goto funexit;
    }
  # in ignored conditional block command
  } elsif ($current->{'cmdname'}
      and $block_commands{$current->{'cmdname'}}
      and ($block_commands{$current->{'cmdname'}} eq 'conditional')) {
    # check for nested @ifset (so that @end ifset doesn't end the
    # outermost @ifset).  It is discarded when the outermost is.
    if (($current->{'cmdname'} eq 'ifclear'
              or $current->{'cmdname'} eq 'ifset'
              or $current->{'cmdname'} eq 'ifcommanddefined'
              or $current->{'cmdname'} eq 'ifcommandnotdefined')
            and $line =~ /^\s*\@$current->{'cmdname'}/) {
      push @{$current->{'contents'}}, { 'cmdname' => $current->{'cmdname'},
                                        'parent' => $current,
                                        'contents' => [],
                                      };
      $current = $current->{'contents'}->[-1];
    } elsif ($line =~ /^(\s*?)\@end\s+([a-zA-Z][\w-]*)/
             and ($2 eq $current->{'cmdname'})) {
      my $end_command = $current->{'cmdname'};
      $line =~ s/^(\s*?)\@end\s+$end_command//;
      if ($1 ne '') {
        $self->_line_warn(sprintf(
              __("\@end %s should only appear at the beginning of a line"),
                                 $end_command), $source_info);
      }
      $self->_line_warn(sprintf(
           __("superfluous argument to \@%s %s: %s"), 'end', $end_command,
                              $line), $source_info)
        if ($line =~ /\S/ and $line !~ /^\s*\@c(omment)?\b/);
      $current = $current->{'parent'};
      # Remove an ignored block @if*
      my $conditional = _pop_element_from_contents($self, $current);
      if (!defined($conditional->{'cmdname'}
          or $conditional->{'cmdname'} ne $end_command)) {
        $self->_bug_message(
                "Ignored command is not the conditional $end_command",
                             $source_info, $conditional);
        die;
      }
      print STDERR "CLOSED conditional $end_command\n" if ($self->{'DEBUG'});
      # Ignore until end of line
      # FIXME this is not the same as for other commands.  Change?
      if ($line !~ /\n/) {
        ($line, $source_info) = _new_line($self);
        print STDERR "IGNORE CLOSE line: $line" if ($self->{'DEBUG'});
      }
    }
    # anything remaining on the line and any other line is ignored here
    $retval = $GET_A_NEW_LINE;
    goto funexit;
  # in @verb. type should be 'brace_command_arg'
  } elsif ($current->{'parent'} and $current->{'parent'}->{'cmdname'}
         and $current->{'parent'}->{'cmdname'} eq 'verb') {
    $current->{'parent'}->{'info'} = {} if (!$current->{'parent'}->{'info'});
    # collect the first character if not already done
    if (!defined($current->{'parent'}->{'info'}->{'delimiter'})) {
      if ($line =~ /^$/) {
        $current->{'parent'}->{'info'}->{'delimiter'} = '';
        $self->_line_error(sprintf(
            __("\@%s without associated character"), 'verb'), $source_info);
      } else {
        $line =~ s/^(.)//;
        $current->{'parent'}->{'info'}->{'delimiter'} = $1;
      }
    }
    my $char = quotemeta($current->{'parent'}->{'info'}->{'delimiter'});
    if ($line =~ s/^(.*?)$char\}/\}/) {
      push @{$current->{'contents'}},
          { 'text' => $1, 'type' => 'raw', 'parent' => $current }
            if ($1 ne '');
      print STDERR "END VERB\n" if ($self->{'DEBUG'});
    } else {
      push @{$current->{'contents'}},
         { 'text' => $line, 'type' => 'raw', 'parent' => $current };
      print STDERR "LINE VERB: $line" if ($self->{'DEBUG'});
      $retval = $GET_A_NEW_LINE;
      goto funexit;
    }
  } elsif ($current->{'cmdname'}
           and $block_commands{$current->{'cmdname'}}
           and $block_commands{$current->{'cmdname'}} eq 'format_raw'
           and not $self->{'expanded_formats_hash'}->{$current->{'cmdname'}}) {
    push @{$current->{'contents'}}, { 'type' => 'elided_block',
                                      'parent' => $current };
    while (not $line =~ /^\s*\@end\s+$current->{'cmdname'}/) {
      ($line, $source_info) = _new_line($self);
      if (!$line) {
        # unclosed block
        $line = '';
        last;
      }
    }
    # start a new line for the @end line, this is normally done
    # at the beginning of a line, but not here, as we directly
    # got the lines.
    $line =~ s/^([^\S\r\n]*)//;
    push @{$current->{'contents'}}, { 'type' => 'empty_line',
                                      'text' => $1,
                                      'parent' => $current };
    # It is important to let the processing continue from here, such that
    # the @end is catched and handled below, as the condition has not changed
  }
  # this mostly happens in the following cases:
  #   after expansion of user defined macro that doesn't end with EOL
  #   after a protection of @\n in @def* line
  #   at the end of an expanded Texinfo fragment
  while ($line eq '') {
    print STDERR "EMPTY TEXT in: "
     .Texinfo::Common::debug_print_element_short($current)."\n"
      if ($self->{'DEBUG'});
    ($line, $source_info) = _next_text($self, $current);
    if (!defined($line)) {
      # end of the file or of a text fragment.
      $current = _end_line($self, $current, $source_info);
      # It may happen that there is an @include file on the line, it
      # will be picked up at NEXT_LINE, beginning a new line
      $retval = $GET_A_NEW_LINE;
      goto funexit;
    }
    # this shows beginning of lines (right after 'empty_line') with
    # _next_text obtained.  This new text therefore does not
    # go through _parse_texi code that happens at the beginning
    # of lines, mostly checking cpp directives.
    # elsif ($current->{'contents'} and @{$current->{'contents'}}
    #        and $current->{'contents'}->[-1]->{'type'}
    #        and $current->{'contents'}->[-1]->{'type'} eq 'empty_line'
    #        and $line ne '') {
    #  print STDERR "New text in empty line $source_info->{'line_nr'}.$source_info->{'macro'} !$line!\n";
    #}
  }

  my $at_command_length;
  my @line_parsing = _parse_texi_regex($line);
  my ($at_command, $open_brace, $asterisk, $single_letter_command,
      $separator_match, $misc_text) = @line_parsing;
  print STDERR "PARSED: "
    .join(', ',map {!defined($_) ? 'UNDEF' : "'$_'"} @line_parsing)."\n"
       if ($self->{'DEBUG'} and $self->{'DEBUG'} > 3);

  my $command;
  if ($single_letter_command) {
    $command = $single_letter_command;
  } elsif ($at_command) {
    $at_command_length = length($at_command) + 1;
    $command = $at_command;

    my $alias_command;
    if (exists($self->{'aliases'}->{$command})) {
      $alias_command = $command;
      $command = $self->{'aliases'}->{$command};
    }


    # handle user defined macros before anything else since
    # their expansion may lead to changes in the line
    if ($self->{'macros'}->{$command}) {
      substr($line, 0, $at_command_length) = '';

      # TODO check that the $line here, which is discarded right after
      # is necessarily empty
      ($line, $source_info)
        = _handle_macro($self, $current, $line, $source_info, $command);
      # FIXME this is the same as in the XS parser, and it gives somewhat better
      # results in test cases, avoiding useless text.  But it is unclear why
      # it is so and if it is not covering up some other bug.
      ($line, $source_info) = _next_text($self, $current);
      goto funexit;
    }
    # expand value if it can change the line.  It considered again
    # together with other commands below for all the other cases
    # which may need a well formed tree, which is not needed here, and
    # early value expansion may be needed to provide with an argument.
    if ($command eq 'value') {
      my $remaining_line = $line;
      substr($remaining_line, 0, $at_command_length) = '';
      $remaining_line =~ s/^\s*//
         if ($self->{'IGNORE_SPACE_AFTER_BRACED_COMMAND_NAME'});
      # REVALUE
      if ($remaining_line =~ s/^{([\w\-][^\s{\\}~`\^+"<>|@]*)}//) {
        my $value = $1;
        if (exists($self->{'values'}->{$value})) {
          if ($self->{'MAX_MACRO_CALL_NESTING'}
             and scalar(@{$self->{'value_stack'}}) >= $self->{'MAX_MACRO_CALL_NESTING'}) {
            $self->_line_warn(sprintf(__(
  "value call nested too deeply (set MAX_MACRO_CALL_NESTING to override; current value %d)"),
                              $self->{'MAX_MACRO_CALL_NESTING'}), $source_info);
            $line = $remaining_line;
            goto funexit;
          }
          unshift @{$self->{'value_stack'}}, $value;
          _input_push_text($self, $remaining_line, $source_info->{'line_nr'},
                           $source_info->{'macro'});
          _input_push_text($self, $self->{'values'}->{$value},
                           $source_info->{'line_nr'},
                           $source_info->{'macro'}, $value);
          my $sm_value_element = _new_value_element($command, $value);
          my $value_source_mark = {'sourcemark_type' => 'value_expansion',
                                   'status' => 'start',
                                   'line' => $self->{'values'}->{$value},
                                   'element' => $sm_value_element};
          _register_source_mark($self, $current, $value_source_mark);
          $self->{'input'}->[0]->{'input_source_mark'} = $value_source_mark;
          $line = '';
          goto funexit;
        }
      }
    }
  }

  # special case for @-command as argument of @itemize or @*table.
  # The normal case for those are to be identifier only, not a true command
  # with argument, so can be followed by anything.  If followed by
  # braces, will be handled as a normal brace command.
  #
  # Need to be done as early as possible such that no other condition
  # prevail and lead to a missed command
  if ($current->{'cmdname'}
      and defined($self->{'brace_commands'}->{$current->{'cmdname'}})
      and not $self->{'brace_commands'}->{$current->{'cmdname'}} eq 'accent'
      and !$open_brace
      and _parent_of_command_as_argument($current->{'parent'})) {
    _register_command_as_argument($self, $current);
    $current = $current->{'parent'};
  }

  # command but before an opening brace, otherwise $current
  # would be an argument type and not the command, and a new
  # @-command was found.  This means that the $current->{'cmdname'}
  # argument (an opening brace, or a character after spaces for
  # accent commands) was not found and there is already a new command.
  #
  # It would have been nice to allow for comments, but there is no
  # container in the tree to put them when after command and before brace
  # or argument for accent commands.
  if ($command
      and $current->{'cmdname'}
      and defined($self->{'brace_commands'}->{$current->{'cmdname'}})) {
    $self->_line_error(sprintf(__("\@%s expected braces"),
                       $current->{'cmdname'}), $source_info);
    $current = $current->{'parent'};
  }

  # handle unknown @-command
  if ($command and !$all_commands{$command}
      and !$self->{'definfoenclose'}->{$command}
      and !$self->{'command_index'}->{$command}
      # @txiinternalvalue is invalid unless accept_internalvalue is set
      and !($command eq 'txiinternalvalue'
            and $self->{'accept_internalvalue'})) {
    $self->_line_error(sprintf(__("unknown command `%s'"),
                                  $command), $source_info);
    substr($line, 0, $at_command_length) = '';
    _abort_empty_line($self, $current);
    my $paragraph = _begin_paragraph($self, $current, $source_info);
    $current = $paragraph if ($paragraph);
    goto funexit;
  }

  # this situation arises when after the $current->{'cmdname'}
  # Brace commands not followed immediately by a brace
  # opening.  In particular cases that may lead to "command closing"
  # or following character association with an @-command, for accent
  # commands.

  # This condition can only happen immediately after the command opening,
  # otherwise the current element is in the 'args' and not right in the
  # command container.
  if ($current->{'cmdname'}
        and defined($self->{'brace_commands'}->{$current->{'cmdname'}})
        and !$open_brace) {
    print STDERR "BRACE CMD: no brace after \@$current->{'cmdname'}: $line"
      if $self->{'DEBUG'};
    # Note that non ascii spaces do not count as spaces
    if ($line =~ /^(\s+)/
        and ($accent_commands{$current->{'cmdname'}}
             or $self->{'IGNORE_SPACE_AFTER_BRACED_COMMAND_NAME'})) {
      my $added_space = $1;
      my $additional_newline;
      if ($added_space =~ /\n/) {
        $self->_line_warn(sprintf(
           __("command `\@%s' must not be followed by new line"),
           $current->{'cmdname'}), $source_info);
        my $top_context = $self->_top_context();
        if ($top_context eq 'ct_line' or $top_context eq 'ct_def') {
          # do not consider the end of line to be possibly between
          # the @-command and the argument if at the end of a
          # line or block @-command.
          $current = $current->{'parent'};
          $current = _merge_text($self, $current, $added_space);
          _isolate_last_space($self, $current);
          $current = _end_line($self, $current, $source_info);
          $retval = $GET_A_NEW_LINE;
          goto funexit;
        }
        $additional_newline = 1;
      }
      $current->{'info'} = {} if (!$current->{'info'});
      if (!defined($current->{'info'}->{'spaces_after_cmd_before_arg'})) {
        $line =~ s/^(\s+)//;
        $current->{'info'}->{'spaces_after_cmd_before_arg'} = $added_space;
        print STDERR "BRACE CMD before brace init spaces '$added_space'\n"
          if $self->{'DEBUG'};
      # only ignore spaces and one newline, two newlines lead to
      # an empty line before the brace or argument which is incorrect.
      } elsif ($additional_newline
               and $current->{'info'}->{'spaces_after_cmd_before_arg'} =~ /\n/) {
        print STDERR "BRACE CMD before brace second newline stops spaces\n"
          if $self->{'DEBUG'};
        $self->_line_error(sprintf(__("\@%s expected braces"),
                           $current->{'cmdname'}), $source_info);
        $current = $current->{'parent'};
      } else {
        $line =~ s/^(\s+)//;
        $current->{'info'}->{'spaces_after_cmd_before_arg'} .= $added_space;
        print STDERR "BRACE CMD before brace add spaces '$added_space'\n"
          if $self->{'DEBUG'};
      }
    # special case for accent commands, use following character except @
    # as argument.  Note that since we checked before that there isn't
    # an @-command opening, there should not be an @ anyway.  The line
    # may possibly be empty in some specific case, without end of line.
    } elsif ($accent_commands{$current->{'cmdname'}}
             and $line =~ s/^([^@])//) {
      print STDERR "ACCENT following_arg \@$current->{'cmdname'}\n"
        if ($self->{'DEBUG'});
      my $following_arg = {'type' => 'following_arg',
                           'parent' => $current};
      $following_arg->{'contents'} = [{ 'text' => $1,
                                       'parent' => $following_arg } ];
      $current->{'args'} = [ $following_arg ];
      if ($current->{'cmdname'} eq 'dotless' and $1 ne 'i' and $1 ne 'j') {
        $self->_line_error(sprintf(
           __("%c%s expects `i' or `j' as argument, not `%s'"),
                                   ord('@'), $current->{'cmdname'}, $1),
                           $source_info);
      }
      # FIXME this is like the XS parser, and it matters to have the contents
      # removed here when there are source marks.  It is not clear why there
      # are contents to begin with, nor what would be the best, remove them
      # as is done here, or keep them as contents.  Also, in theory the
      # elements may have text/args/contents, although never saw anything
      # else than empty elements.
      while ($current->{'contents'} and scalar(@{$current->{'contents'}})) {
        # TODO not clear that it leads to a correct location of source marks
        my $removed_element = _pop_element_from_contents($self, $current);
        _transfer_source_marks($removed_element, $following_arg);
      }
      $current = $current->{'parent'};
    } else {
      $self->_line_error(sprintf(__("\@%s expected braces"),
                         $current->{'cmdname'}), $source_info);
      $current = $current->{'parent'};
    }
  # maybe a menu entry beginning: a * at the beginning of a menu line
  } elsif ($current->{'type'}
            and $current->{'type'} eq 'preformatted'
            and $current->{'parent'}->{'type'}
            and ($current->{'parent'}->{'type'} eq 'menu_comment'
                 or $current->{'parent'}->{'type'} eq 'menu_entry_description')
            and $asterisk
            and @{$current->{'contents'}}
            and $current->{'contents'}->[-1]->{'type'}
            and $current->{'contents'}->[-1]->{'type'} eq 'empty_line'
            and $current->{'contents'}->[-1]->{'text'} eq '') {
    print STDERR "MENU STAR\n" if ($self->{'DEBUG'});
    _abort_empty_line($self, $current);
    $line =~ s/^\*//;
    push @{$current->{'contents'}}, { 'parent' => $current,
                                      'type' => 'internal_menu_star',
                                      'text' => '*' };
  # a space after a * at the beginning of a menu line
  } elsif ($current->{'contents'} and @{$current->{'contents'}}
           and $current->{'contents'}->[-1]->{'type'}
           and $current->{'contents'}->[-1]->{'type'} eq 'internal_menu_star') {
    if ($line !~ /^\s+/) {
      print STDERR "ABORT MENU STAR ($line)\n" if ($self->{'DEBUG'});
      delete $current->{'contents'}->[-1]->{'type'};
    } else {
      print STDERR "MENU ENTRY (certainly)\n" if ($self->{'DEBUG'});
      # this is the menu star collected previously
      my $menu_star_element = _pop_element_from_contents($self, $current);
      $line =~ s/^(\s+)//;
      my $leading_text = '*' . $1;
      # FIXME remove empty description too?
      if ($current->{'type'} eq 'preformatted'
          and $current->{'parent'}->{'type'}
          and $current->{'parent'}->{'type'} eq 'menu_comment') {
        # close preformatted
        $current = _close_container($self, $current);
        # close menu_comment
        $current = _close_container($self, $current);
      } else {
        # first parent preformatted, third is menu_entry
        if ($current->{'type'} ne 'preformatted'
            or $current->{'parent'}->{'type'} ne 'menu_entry_description'
            or $current->{'parent'}->{'parent'}->{'type'} ne 'menu_entry'
            or (not $block_commands{$current->{'parent'}->{'parent'}->{'parent'}
                                                  ->{'cmdname'}} eq 'menu')) {
          $self->_bug_message("Not in menu comment nor description",
                               $source_info, $current);
        }
        $current = $current->{'parent'}->{'parent'}->{'parent'};
      }
      push @{$current->{'contents'}}, { 'type' => 'menu_entry',
                                        'parent' => $current,
                                      };
      $current = $current->{'contents'}->[-1];
      $current->{'contents'} = [ { 'type' => 'menu_entry_leading_text',
                                   'text' => $leading_text,
                                   'parent' => $current },
                                 { 'type' => 'menu_entry_name',
                                   'parent' => $current } ];
      # transfer source marks from removed menu star to leading text
      _transfer_source_marks($menu_star_element, $current->{'contents'}->[0]);
      $current = $current->{'contents'}->[-1];
    }
  # after a separator in menu
  } elsif ($current->{'contents'} and @{$current->{'contents'}}
           and $current->{'contents'}->[-1]->{'type'}
           and $current->{'contents'}->[-1]->{'type'} eq 'menu_entry_separator') {
    print STDERR "AFTER menu_entry_separator\n" if ($self->{'DEBUG'});
    my $separator = $current->{'contents'}->[-1]->{'text'};
    # separator is ::, we concatenate and let the while restart
    # in order to collect spaces below
    if ($separator eq ':' and $line =~ s/^(:)//) {
      $current->{'contents'}->[-1]->{'text'} .= $1;
    # a . not followed by a space.  Not a separator.
    } elsif ($separator eq '.' and $line =~ /^\S/) {
      my $popped_element = _pop_element_from_contents($self, $current);
      $current = $current->{'contents'}->[-1];
      $current = _merge_text($self, $current, $separator, $popped_element);
    # here we collect spaces following separators.
    } elsif ($line =~ s/^([^\S\r\n]+)//) {
      # FIXME a trailing end of line could be considered to be part
      # of the separator. Right now it is part of the description,
      # since it is catched (in the next while) as one of the case below
      $current->{'contents'}->[-1]->{'text'} .= $1;
    # now handle the menu part that was closed
    } elsif ($separator =~ /^::/) {
      print STDERR "MENU NODE no name $separator\n" if ($self->{'DEBUG'});
      # it was previously registered as menu_entry_name, it is
      # changed to node
      $current->{'contents'}->[-2]->{'type'} = 'menu_entry_node';
      $current = _enter_menu_entry_node($self, $current, $source_info);
    # end of the menu entry name
    } elsif ($separator =~ /^:/) {
      print STDERR "MENU ENTRY $separator\n" if ($self->{'DEBUG'});
      push @{$current->{'contents'}}, { 'type' => 'menu_entry_node',
                                        'parent' => $current };
      $current = $current->{'contents'}->[-1];
    # anything else is the end of the menu node following a menu_entry_name
    } else {
      print STDERR "MENU NODE $separator\n" if ($self->{'DEBUG'});
      $current = _enter_menu_entry_node($self, $current, $source_info);
    }
  # Any other @-command.
  } elsif ($command) {
    if (!$at_command) {
      substr($line, 0, 2) = '';
    } else {
      substr($line, 0, $at_command_length) = '';
    }

    print STDERR "COMMAND $command\n" if ($self->{'DEBUG'});

    # @value not expanded (expansion is done above), and @txiinternalvalue
    if ($command eq 'value' or $command eq 'txiinternalvalue') {
      $line =~ s/^\s*//
         if ($self->{'IGNORE_SPACE_AFTER_BRACED_COMMAND_NAME'});
      # REVALUE
      if ($line =~ s/^{([\w\-][^\s{\\}~`\^+"<>|@]*)}//) {
        my $value = $1;
        if ($command eq 'value') {
          if (not exists($self->{'values'}->{$value})) {
            _abort_empty_line($self, $current);
            # caller should expand something along
            # gdt($self, '@{No value for `{value}\'@}', {'value' => $value});
            my $new_element = _new_value_element($command, $value, $current);
            push @{$current->{'contents'}}, $new_element;
            $self->_line_warn(
               sprintf(__("undefined flag: %s"), $value), $source_info);
          # expansion of value already done above
          #} else {
          }
        } else {
          # txiinternalvalue
          _abort_empty_line($self, $current);
          my $new_element = _new_value_element($command, $value, $current);
          push @{$current->{'contents'}}, $new_element;
        }
      } else {
        $self->_line_error(sprintf(__("bad syntax for %c%s"), ord('@'),
                             $command), $source_info);
      }
      goto funexit;
    }

    if (defined($deprecated_commands{$command})) {
      $self->_line_warn(sprintf(__("%c%s is obsolete"),
                          ord('@'), $command), $source_info);
    }

    # special case with @ followed by a newline protecting end of lines
    # in @def*
    my $def_line_continuation
      = ($self->_top_context() eq 'ct_def' and $command eq "\n");

    if (not $def_line_continuation
           and not _abort_empty_line($self, $current)
           and $begin_line_commands{$command}) {
      $self->_line_warn(
          sprintf(__("\@%s should only appear at the beginning of a line"),
                  $command), $source_info);
    }

    _check_valid_nesting ($self, $current, $command, $source_info);
    _check_valid_nesting_context ($self, $command, $source_info);

    if ($def_line_continuation) {
      my $line_continuation_source_mark
        = { 'sourcemark_type' => 'defline_continuation' };
      _register_source_mark($self, $current, $line_continuation_source_mark);
      $retval = $GET_A_NEW_LINE;
      goto funexit;
    }

    unless ($self->{'no_paragraph_commands'}->{$command}) {
      my $paragraph = _begin_paragraph($self, $current, $source_info);
      $current = $paragraph if ($paragraph);
    }

    if ($self->{'close_paragraph_commands'}->{$command}) {
      $current = _end_paragraph($self, $current, $source_info);
    }
    if ($self->{'close_preformatted_commands'}->{$command}) {
      $current = _end_preformatted($self, $current, $source_info);
    }

    if ($in_index_commands{$command}
        and $current->{'contents'}
        and $current->{'contents'}->[-1]
        and $current->{'contents'}->[-1]->{'text'}
        # it is important to check if in an index command, as otherwise
        # the internal space type is not processed and remains as is in
        # the final tree.
        and _is_index_element($self, $current->{'parent'})) {
      if ($command eq 'subentry') {
        _isolate_trailing_space($current, 'spaces_at_end');
      } else {
        # an internal and temporary space type that is converted to
        # a normal space without type if followed by text or a
        # "spaces_at_end" if followed by spaces only when the
        # index or subentry command is done.
        _isolate_trailing_space($current,
                                'internal_spaces_before_brace_in_index');
      }
    }

    if (defined($nobrace_commands{$command})
        and ($command ne 'item' or !_item_line_parent($current))) {
      # symbol skipspace other
      my $arg_spec = $nobrace_commands{$command};
      my $misc;

      if ($arg_spec ne 'skipspace') {
        $misc = {'cmdname' => $command, 'parent' => $current};
        push @{$current->{'contents'}}, $misc;

        if ($in_heading_spec_commands{$command}) {
          # TODO use a more generic system for check of @-command nesting
          # in command on context stack
          my $top_context_command = $self->_top_context_command();
          if (not defined($top_context_command)
              or not $heading_spec_commands{$top_context_command}) {
            $self->_line_error(
              sprintf(__("\@%s should only appear in heading or footing"),
                    $command), $source_info);
          }
        }
        if ($arg_spec eq 'symbol') {
          # FIXME generalize?
          if ($command eq '\\' and $self->_top_context() ne 'ct_math') {
            $self->_line_warn(sprintf(
                       __("\@%s should only appear in math context"),
                                  $command), $source_info);
          }
          if ($command eq "\n") {
            $current = _end_line($self, $current, $source_info);
            $retval = $GET_A_NEW_LINE;
            goto funexit;
          }
        } else { # other
          _register_global_command($self, $misc, $source_info);
          $current = _begin_preformatted($self, $current)
            if ($close_preformatted_commands{$command});
        }
      } else {
        if ($command eq 'item'
            or $command eq 'headitem' or $command eq 'tab') {
          my $parent;
          # @itemize or @enumerate
          if ($parent = _item_container_parent($current)) {
            if ($command eq 'item') {
              print STDERR "ITEM_CONTAINER\n" if ($self->{'DEBUG'});
              $parent->{'items_count'}++;
              $misc = { 'cmdname' => $command, 'parent' => $parent,
                        'extra' =>
                          {'item_number' => $parent->{'items_count'}} };
              push @{$parent->{'contents'}}, $misc;
              $current = $parent->{'contents'}->[-1];
            } else {
              $self->_line_error(sprintf(__(
                            "\@%s not meaningful inside `\@%s' block"),
                               $command, $parent->{'cmdname'}), $source_info);
            }
            $current = _begin_preformatted($self, $current);
          # @*table
          } elsif ($parent = _item_line_parent($current)) {
            # @item and _item_line_parent is explicitly avoided in the if above
            $self->_line_error(sprintf(__(
                  "\@%s not meaningful inside `\@%s' block"),
                $command, $parent->{'cmdname'}), $source_info);
            $current = _begin_preformatted($self, $current);
          # @multitable
          } elsif ($parent = _item_multitable_parent($current)) {
            if (!$parent->{'extra'}->{'max_columns'}) {
              $self->_line_warn(
                 sprintf(__("\@%s in empty multitable"),
                         $command), $source_info);
            } elsif ($command eq 'tab') {
              my $row = $parent->{'contents'}->[-1];
              die if (!$row->{'type'});
              if ($row->{'type'} eq 'before_item') {
                $self->_line_error(__("\@tab before \@item"), $source_info);
              } elsif ($row->{'cells_count'} >= $parent->{'extra'}->{'max_columns'}) {
                $self->_line_error(sprintf(__(
                        "too many columns in multitable item (max %d)"),
                       $parent->{'extra'}->{'max_columns'}), $source_info);
              } else {
                $row->{'cells_count'}++;
                $misc = { 'cmdname' => $command,
                          'parent' => $row,
                          'contents' => [],
                          'extra' =>
                      {'cell_number' => $row->{'cells_count'}} };
                push @{$row->{'contents'}}, $misc;
                $current = $row->{'contents'}->[-1];
                print STDERR "TAB\n" if ($self->{'DEBUG'});
              }
            } else {
              print STDERR "ROW\n" if ($self->{'DEBUG'});
              $parent->{'rows_count'}++;
              my $row = { 'type' => 'row', 'contents' => [],
                          'cells_count' => 1,
                          'extra' => {'row_number' => $parent->{'rows_count'} },
                          'parent' => $parent };
              push @{$parent->{'contents'}}, $row;
              $misc =  { 'cmdname' => $command,
                         'parent' => $row,
                         'contents' => [],
                         'extra' => {'cell_number' => 1}};
              push @{$row->{'contents'}}, $misc;
              $current = $row->{'contents'}->[-1];
            }
            $current = _begin_preformatted($self, $current);
          } elsif ($command eq 'tab') {
            $self->_line_error(__(
                       "ignoring \@tab outside of multitable"), $source_info);
            $current = _begin_preformatted($self, $current);
          } else {
            $self->_line_error(sprintf(__(
               "\@%s outside of table or list"), $command), $source_info);
            $current = _begin_preformatted($self, $current);
          }
          $misc->{'source_info'} = $source_info if (defined($misc));
        } else {
          $misc = { 'cmdname' => $command, 'parent' => $current,
              'source_info' => $source_info };
          push @{$current->{'contents'}}, $misc;
          if (($command eq 'indent' or $command eq 'noindent')
               and _in_paragraph($self, $current)) {
            $self->_line_warn(sprintf(__("\@%s is useless inside of a paragraph"),
                                      $command),
                              $source_info);
          }
        }
        $line = _start_empty_line_after_command($line, $current, undef);
      }
    # line commands
    } elsif (defined($self->{'line_commands'}->{$command})) {
      if ($root_commands{$command} or $command eq 'bye') {
        $current = _close_commands($self, $current, $source_info, undef,
                                   $command);
        if (!defined($current->{'parent'})) {
          # if parse_texi_line is called on a line with a node/section then
          # it will directly be in the root_line, otherwise it is not directly
          # in the root, but in another container
          #
          # FIXME warn/error with a root command in parse_texi_line?
          if ($current->{'type'} ne 'root_line') {
            $self->_bug_message("no parent element", $source_info, $current);
            die;
          }
        } else {
          $current = $current->{'parent'};
        }
      }

      # skipline text line lineraw /^\d$/
      my $arg_spec = $self->{'line_commands'}->{$command};
      my $misc;

      # all the cases using the raw line
      if ($arg_spec eq 'skipline' or $arg_spec eq 'lineraw'
               or $arg_spec eq 'special') {
        my $ignored = 0;
        if ($command eq 'insertcopying') {
          my $parent = $current;
          while ($parent) {
            if ($parent->{'cmdname'} and $parent->{'cmdname'} eq 'copying') {
              $self->_line_error(
                 sprintf(__("\@%s not allowed inside `\@%s' block"),
                         $command, $parent->{'cmdname'}), $source_info);
              $ignored = 1;
              last;
            }
            $parent = $parent->{'parent'};
          }
        }

        # complete the line if there was a user macro expansion
        if ($line !~ /\n/) {
          my ($new_line, $new_line_source_info)
                     = _new_line($self);
          $line .= $new_line if (defined($new_line));
        }
        $misc = {'cmdname' => $command,
                 'parent' => $current};
        my $args = [];
        my $has_comment;
        if ($arg_spec eq 'lineraw' or $arg_spec eq 'skipline') {
          $args = [ $line ];
        } elsif ($arg_spec eq 'special') {
          ($args, $has_comment)
           = _parse_special_misc_command($self, $line, $command, $source_info);
          $misc->{'info'} = {'arg_line' => $line};
        }

        # if using the @set txi* instead of a proper @-command, replace
        # by the tree obtained with the @-command.  Even though
        # _end_line is called below, as $current is not line_arg
        # there should not be anything done in addition than what is
        # done for @clear or @set.
        if (($command eq 'set' or $command eq 'clear')
             and scalar(@$args) >= 1
             and $set_flag_command_equivalent{$args->[0]}) {
          my $arg;
          if ($command eq 'set') {
            $arg = 'on';
          } else {
            $arg = 'off';
          }
          $command = $set_flag_command_equivalent{$args->[0]};
          $misc = {'cmdname' => $command,
                   'parent' => $current,
                   'source_info' => $source_info,
                   'extra' => {'misc_args' => [$arg],},
                   'info' => {'spaces_before_argument' => {'text' => ' '}}};
          my $misc_line_args = {'type' => 'line_arg',
                 'parent' => $misc,
                 'info' => {'spaces_after_argument'
                              => {'text' => "\n",}}};
          $misc->{'args'} = [$misc_line_args];
          $misc_line_args->{'contents'} = [
            { 'text' => $arg,
              'parent' => $misc_line_args, },
          ];
          push @{$current->{'contents'}}, $misc;
        } else {
          if (!$ignored) {
            push @{$current->{'contents'}}, $misc;
            foreach my $arg (@$args) {
              push @{$misc->{'args'}},
                { 'type' => 'misc_arg', 'text' => $arg,
                  'parent' => $current->{'contents'}->[-1] };
            }
            if (scalar(@$args) and $arg_spec ne 'skipline') {
              $misc->{'extra'} = {} if (!$misc->{'extra'});
              $misc->{'extra'}->{'misc_args'} = $args;
            }
          } else {
            $misc = undef;
          }
        }
        if ($command eq 'raisesections') {
          $self->{'sections_level'}++;
        } elsif ($command eq 'lowersections') {
          $self->{'sections_level'}--;
        }
        _register_global_command($self, $misc, $source_info)
          if $misc;
        # the end of line is ignored for special commands
        if ($arg_spec ne 'special' or !$has_comment) {
          $current = _end_line($self, $current, $source_info);
        }

        if ($command eq 'bye') {
          $retval = $FINISHED_TOTALLY;
          goto funexit;
        }
        # Even if _end_line is called, it is not done since there is
        # no line_arg
        $current = _begin_preformatted($self, $current)
          if ($close_preformatted_commands{$command});
        $retval = $GET_A_NEW_LINE;
        goto funexit;
      } else {
        # $arg_spec is text, line or a number
        # @item or @itemx in @table
        if ($command eq 'item' or $command eq 'itemx') {
          my $parent;
          print STDERR "ITEM_LINE\n" if ($self->{'DEBUG'});
          if ($parent = _item_line_parent($current)) {
            $current = $parent;
            _gather_previous_item($self, $current, $command, $source_info);
          } else {
            $self->_line_error(sprintf(__(
               "\@%s outside of table or list"), $command), $source_info);
            $current = _begin_preformatted($self, $current);
          }
          $misc = { 'cmdname' => $command, 'parent' => $current };
          push @{$current->{'contents'}}, $misc;
          $misc->{'source_info'} = $source_info;
        } else {
          $misc = { 'cmdname' => $command, 'source_info' => $source_info };
          if ($command eq 'subentry') {
            my $parent = $current->{'parent'};
            if (!_is_index_element($self, $parent)) {
              $self->_line_warn(
                sprintf(__("\@%s should only appear in an index entry"),
                        $command), $source_info);
            }
            $parent->{'extra'} = {} if (!defined($parent->{'extra'}));
            $parent->{'extra'}->{'subentry'} = $misc;
            my $subentry_level = 1;
            if ($parent->{'cmdname'} eq 'subentry') {
              $subentry_level = $parent->{'extra'}->{'level'} + 1;
            }
            $misc->{'extra'} = {'level' => $subentry_level};
            if ($subentry_level > 2) {
              $self->_line_error(__(
          "no more than two levels of index subentry are allowed"),
                       $source_info);
            }
            # Do not make the @subentry element a child of the index
            # command.  This means that spaces are preserved properly
            # when converting back to Texinfo.
            $current = _end_line($self, $current, $source_info);
          } elsif ($sectioning_heading_commands{$command}) {
            if ($self->{'sections_level'}) {
              $misc->{'extra'} = {'sections_level' => $self->{'sections_level'}};
            }
          }
          push @{$current->{'contents'}}, $misc;
          $misc->{'parent'} = $current;
          # def*x
          if ($def_commands{$command}) {
            my $base_command = $command;
            $base_command =~ s/x$//;
            # check that the def*x is first after @def*, no paragraph
            # in-between.
            my $after_paragraph = _check_no_text($current);
            $self->_push_context('ct_def', $command);
            $current->{'contents'}->[-1]->{'type'} = 'def_line';
            $current->{'contents'}->[-1]->{'extra'}
              = {'def_command' => $base_command,
                 'original_def_cmdname' => $command};
            if (defined($self->{'values'}->{'txidefnamenospace'})) {
              $current->{'contents'}->[-1]{'extra'}
                                  ->{'omit_def_name_space'} = 1;
            }
            if ($current->{'cmdname'}
                and $current->{'cmdname'} eq $base_command) {
              # popped element should be the same as $misc
              _pop_element_from_contents($self, $current);
              _gather_def_item($self, $current, $command);
              push @{$current->{'contents'}}, $misc;
            }
            if (!$current->{'cmdname'}
                 or $current->{'cmdname'} ne $base_command
                 or $after_paragraph) {
              $self->_line_error(sprintf(__(
                                   "must be after `\@%s' to use `\@%s'"),
                                      $base_command, $command), $source_info);
              $current->{'contents'}->[-1]->{'extra'}->{'not_after_command'} = 1;
            }
          }
        }
        $current = $current->{'contents'}->[-1];
        $current->{'args'} = [{ 'type' => 'line_arg',
                                'parent' => $current }];
        if ($self->{'basic_inline_commands'}->{$command}) {
          push @{$self->{'nesting_context'}->{'basic_inline_stack_on_line'}},
               $command;
        }

        # 'specific' commands arguments are handled in a specific way.
        # The only other line commands that have more than one argument is
        # node, so the following condition only applies to node
        if ($self->{'line_commands'}->{$command} ne 'specific'
            and $commands_args_number{$command}
            and $commands_args_number{$command} > 1) {
          $current->{'remaining_args'} = $commands_args_number{$command} - 1;
        }
        if ($command eq 'author') {
          my $parent = $current;
          my $found;
          while ($parent->{'parent'}) {
            $parent = $parent->{'parent'};
            last if ($parent->{'type'}
                    and $parent->{'type'} eq 'brace_command_context');
            if ($parent->{'cmdname'}) {
              if ($parent->{'cmdname'} eq 'titlepage') {
                $current->{'extra'} = {} if (!$current->{'extra'});
                $current->{'extra'}->{'titlepage'} = $parent;
                $found = 1;
              } elsif ($parent->{'cmdname'} eq 'quotation' or
                  $parent->{'cmdname'} eq 'smallquotation') {
                $parent->{'extra'} = {} if (!$parent->{'extra'});
                push @{$parent->{'extra'}->{'authors'}}, $current;
                $current->{'extra'} = {} if (!$current->{'extra'});
                $current->{'extra'}->{'quotation'} = $parent;
                $found = 1;
              }
              last if ($found);
            }
          }
          if (!$found) {
            $self->_line_warn(sprintf(__(
    "\@%s not meaningful outside `\@titlepage' and `\@quotation' environments"),
                           $command), $current->{'source_info'});
          }
        } elsif ($command eq 'dircategory' and $self->{'current_node'}) {
            $self->_line_warn(__("\@dircategory after first node"),
                         $source_info);
        } elsif ($command eq 'printindex') {
          # Record that @printindex occurs in this node so we know it
          # is an index node.
          if ($self->{'current_node'}) {
            $self->{'current_node'}->{'extra'}->{'isindex'} = 1;
          }
        }

        $current = $current->{'args'}->[-1];
        $self->_push_context('ct_line', $command)
          unless ($def_commands{$command});
        $line = _start_empty_line_after_command($line, $current, $misc);
      }
      _register_global_command($self, $misc, $source_info)
        if $misc;
      if ($command eq 'dircategory') {
        push @{$self->{'info'}->{'dircategory_direntry'}}, $misc;
      }
    # @-command with matching @end opening
    } elsif (exists($block_commands{$command})) {
      if ($command eq 'macro' or $command eq 'rmacro') {
        my $macro = _parse_macro_command_line($self, $command, $line,
                                              $current, $source_info);
        push @{$current->{'contents'}}, $macro;
        $current = $current->{'contents'}->[-1];
        $retval = $GET_A_NEW_LINE;
        goto funexit;
      } elsif ($block_commands{$command} eq 'conditional') {
        my $ifvalue_true = 0;
        if ($command eq 'ifclear' or $command eq 'ifset') {
          # REVALUE
          if ($line =~ /^\s+([\w\-][^\s{\\}~`\^+"<>|@]*)\s*(\@(c|comment)((\@|\s+).*)?)?$/) {
            my $name = $1;
            if ((exists($self->{'values'}->{$name}) and $command eq 'ifset')
                or (!exists($self->{'values'}->{$name})
                     and $command eq 'ifclear')) {
              $ifvalue_true = 1;
            }
            print STDERR "CONDITIONAL \@$command $name: $ifvalue_true\n"
                                                        if ($self->{'DEBUG'});
          } elsif ($line !~ /\S/) {
              $self->_line_error(sprintf(
                __("%c%s requires a name"), ord('@'), $command), $source_info);
          } else {
            $self->_line_error(sprintf(
                __("bad name for \@%s"), $command), $source_info);
          }
        } elsif ($command eq 'ifcommanddefined'
                 or $command eq 'ifcommandnotdefined') {
          # REMACRO
          if ($line =~ /^\s+([[:alnum:]][[:alnum:]\-]*)\s*(\@(c|comment)((\@|\s+).*)?)?$/) {
            my $name = $1;
            my $command_is_defined = (
              exists($all_commands{$name})
              or $self->{'macros'}->{$name}
              or $self->{'definfoenclose'}->{$name}
              or $self->{'aliases'}->{$name}
              or $self->{'command_index'}->{$name}
            );
            if (($command_is_defined
                 and $command eq 'ifcommanddefined')
                or (! $command_is_defined
                     and $command eq 'ifcommandnotdefined')) {
              $ifvalue_true = 1;
            }
            print STDERR "CONDITIONAL \@$command $name: $ifvalue_true\n"
                                                        if ($self->{'DEBUG'});
          } elsif ($line !~ /\S/) {
              $self->_line_error(sprintf(
                __("%c%s requires a name"), ord('@'), $command), $source_info);
          } else {
            $self->_line_error(sprintf(
                __("bad name for \@%s"), $command), $source_info);
          }
        } elsif ($command =~ /^ifnot(.*)/) {
          $ifvalue_true = 1 if !($self->{'expanded_formats_hash'}->{$1}
                # exception as explained in the texinfo manual
                or ($1 eq 'info'
                    and $self->{'expanded_formats_hash'}->{'plaintext'}));
          print STDERR "CONDITIONAL \@$command format $1: $ifvalue_true\n"
                                                         if ($self->{'DEBUG'});
        } else {
          die unless ($command =~ /^if(.*)/);
          $ifvalue_true = 1 if ($self->{'expanded_formats_hash'}->{$1}
                  or ($1 eq 'info'
                      and $self->{'expanded_formats_hash'}->{'plaintext'}));
          print STDERR "CONDITIONAL \@$command format $1: $ifvalue_true\n"
                                                         if ($self->{'DEBUG'});
        }
        if ($ifvalue_true) {
          push @{$self->{'conditional_stack'}}, $command;
        } else {
          push @{$current->{'contents'}}, { 'cmdname' => $command,
                                            'parent' => $current,
                                            'contents' => [] };
          $current = $current->{'contents'}->[-1];
        }
        # FIXME(Karl) ignore what is remaining on the line, to eat
        # the end of line?
        $retval = $GET_A_NEW_LINE;
        goto funexit;
      } else {
        my $block;
        # a menu command closes a menu_comment, but not the other
        # block commands. This won't catch menu commands buried in
        # other formats (that are incorrect anyway).
        if ($block_commands{$command} eq 'menu' and $current->{'type'}
            and ($current->{'type'} eq 'menu_comment'
                 or $current->{'type'} eq 'menu_entry_description')) {

          # This is, in general, caused by @detailmenu within @menu
          if ($current->{'type'} eq 'menu_comment') {
            $current = _close_container($self, $current);
          } else { # menu_entry_description
            $current = _close_container($self, $current);
            if ($current->{'type'} and $current->{'type'} eq 'menu_entry') {
              $current = $current->{'parent'};
            } else {
              $self->_bug_message("menu description parent not a menu_entry",
                                  $source_info, $current);
              die;
            }
          }
        }
        # the def command holds a line_def* which corresponds with the
        # definition line.  This allows to have a treatement similar
        # with def*x.
        if ($def_commands{$command}) {
          $self->_push_context('ct_def', $command);
          $block = { 'parent' => $current,
                     'cmdname' => $command,
                     'contents' => [] };
          push @{$current->{'contents'}}, $block;
          $current = $current->{'contents'}->[-1];
          push @{$current->{'contents'}}, {
                                            'type' => 'def_line',
                                            'parent' => $current,
                                            'source_info' => $source_info,
                                            'extra' =>
                                             {'def_command' => $command,
                                              'original_def_cmdname' => $command}
                                            };
          if (defined($self->{'values'}->{'txidefnamenospace'})) {
            $current->{'contents'}->[-1]->{'extra'}
                                        ->{'omit_def_name_space'} = 1;
          }
        } else {
          $block = { 'cmdname' => $command,
                     'parent' => $current,
                     'contents' => [] };
          push @{$current->{'contents'}}, $block;
        }
        $current = $current->{'contents'}->[-1];

        if ($preformatted_commands{$command}) {
          $self->_push_context('ct_preformatted', $command);
        } elsif ($math_commands{$command}) {
          $self->_push_context('ct_math', $command);
        } elsif ($block_commands{$command} eq 'format_raw') {
          $self->_push_context('ct_rawpreformatted', $command);
        }
        if ($block_commands{$command} eq 'region') {
          if (@{$self->{'regions_stack'}}) {
            $self->_line_error(
        sprintf(__("region %s inside region %s is not allowed"),
                $command, $self->{'regions_stack'}->[-1]->{'cmdname'}),
                              $source_info);
          }
          push @{$self->{'regions_stack'}}, $block;
        }
        if ($block_commands{$command} eq 'menu') {
          $self->_push_context('ct_preformatted', $command);
          push @{$self->{'info'}->{'dircategory_direntry'}}, $block
            if ($command eq 'direntry');
          if ($self->{'current_node'}) {
            if ($command eq 'direntry') {
              if ($self->{'FORMAT_MENU'} eq 'menu') {
                $self->_line_warn(__("\@direntry after first node"),
                          $source_info);
              }
            } elsif ($command eq 'menu') {
              if (!(defined $current->{'parent'}->{'cmdname'})
                  or $root_commands{$current->{'parent'}->{'cmdname'}}) {
                push @{$self->{'current_node'}->{'extra'}->{'menus'}}, $current;
              } else {
                $self->_line_warn(__("\@menu in invalid context"),
                                  $source_info);
              }
            }
          }
        }
        # cleaner, and more similar to XS parser, but not required, would have
        # been initialized automatically.
        $current->{'items_count'} = 0
           if ($block_commands{$command}
               and $block_commands{$command} eq 'item_container');

        $current->{'args'} = [ {
           'type' => 'block_line_arg',
           'parent' => $current } ];

        if ($commands_args_number{$command}) {
          if ($commands_args_number{$command} - 1 > 0) {
            $current->{'remaining_args'}
              = $commands_args_number{$command} - 1;
          }
        } elsif ($variadic_commands{$command}) {
          $current->{'remaining_args'} = -1; # unlimited args
        }
        $current = $current->{'args'}->[-1];
        $self->_push_context('ct_line', $command)
          unless ($def_commands{$command});
        if ($self->{'basic_inline_commands'}->{$command}) {
          push @{$self->{'nesting_context'}->{'basic_inline_stack_block'}},
               $command;
        }
        $block->{'source_info'} = $source_info;
        _register_global_command($self, $block, $source_info);
        $line = _start_empty_line_after_command($line, $current, $block);
      }
    } elsif (defined($self->{'brace_commands'}->{$command})) {
      print STDERR "OPEN BRACE \@$command\n"
         if ($self->{'DEBUG'});
      push @{$current->{'contents'}}, { 'cmdname' => $command,
                                        'parent' => $current,
                                        };
      $current->{'contents'}->[-1]->{'source_info'} = $source_info;
      if ($in_index_commands{$command}
          and !_is_index_element($self, $current->{'parent'})) {
        $self->_line_warn(
          sprintf(__("\@%s should only appear in an index entry"),
                  $command), $source_info);
      }
      $current = $current->{'contents'}->[-1];
      if ($command eq 'click') {
        $current->{'extra'} = {} if (!$current->{'extra'});
        $current->{'extra'}->{'clickstyle'} = $self->{'clickstyle'};
      } elsif ($command eq 'kbd'
               and _kbd_formatted_as_code($self, $current)) {
        $current->{'extra'} = {} if (!$current->{'extra'});
        $current->{'extra'}->{'code'} = 1;
      }
      if ($self->{'definfoenclose'}->{$command}) {
        $current->{'type'} = 'definfoenclose_command';
        $current->{'extra'} = {} if (!$current->{'extra'});
        $current->{'extra'}->{'begin'}
          = $self->{'definfoenclose'}->{$command}->[0];
        $current->{'extra'}->{'end'}
          = $self->{'definfoenclose'}->{$command}->[1];
      }
    }
  } elsif ($separator_match) {
    my $separator = $separator_match;
    substr ($line, 0, 1) = '';
    print STDERR "SEPARATOR: $separator\n" if ($self->{'DEBUG'});
    if ($separator eq '@') {
      # this may happen with a @ at the very end of a file, therefore
      # not followed by anything.
      $self->_line_error(__("unexpected \@"), $source_info);
    } elsif ($separator eq '{') {
      _abort_empty_line($self, $current);
      if ($current->{'cmdname'}
           and defined($self->{'brace_commands'}->{$current->{'cmdname'}})) {
        my $command = $current->{'cmdname'};
        $current->{'args'} = [ { 'parent' => $current } ];

        if (defined($commands_args_number{$command})
            and $commands_args_number{$command} > 1) {
          $current->{'remaining_args'}
              = $commands_args_number{$command} - 1;
        }

        $current = $current->{'args'}->[-1];
        push @{$self->{'nesting_context'}->{'basic_inline_stack'}}, $command
          if ($self->{'basic_inline_commands'}->{$command});
        if ($self->{'brace_commands'}->{$command} eq 'context') {
          if ($command eq 'caption' or $command eq 'shortcaption') {
            my $float;
            $self->{'nesting_context'}->{'caption'} += 1;
            if (!$current->{'parent'}->{'parent'}
                or !$current->{'parent'}->{'parent'}->{'cmdname'}
                or $current->{'parent'}->{'parent'}->{'cmdname'} ne 'float') {
              $float = $current->{'parent'};
              while ($float->{'parent'} and !($float->{'cmdname'}
                                              and $float->{'cmdname'} eq 'float')) {
                $float = $float->{'parent'};
              }
              if (!($float->{'cmdname'} and $float->{'cmdname'} eq 'float')) {
                $self->_line_error(sprintf(__(
                   "\@%s is not meaningful outside `\@float' environment"),
                                           $command), $source_info);
                $float = undef;
              } else {
                $self->_line_warn(sprintf(__(
                                   "\@%s should be right below `\@float'"),
                                           $command), $source_info);
              }
            } else {
              $float = $current->{'parent'}->{'parent'};
            }
            if ($float) {
              if ($float->{'extra'} and $float->{'extra'}->{$command}) {
                $self->_line_warn(sprintf(__("ignoring multiple \@%s"),
                                          $command), $source_info);
              } else {
                $current->{'parent'}->{'extra'} = {}
                    if (!$current->{'parent'}->{'extra'});
                $current->{'parent'}->{'extra'}->{'float'} = $float;
                $float->{'extra'} = {} if (!defined($float->{'extra'}));
                $float->{'extra'}->{$command} = $current->{'parent'};
              }
            }
          } elsif ($command eq 'footnote') {
            $self->{'nesting_context'}->{'footnote'} += 1;
          }
          if ($math_commands{$command}) {
            $self->_push_context('ct_math', $command);
          } else {
            $self->_push_context('ct_brace_command', $command);
          }
          $line =~ s/([^\S\f\n]*)//;
          $current->{'type'} = 'brace_command_context';
          # internal_spaces_before_argument is a transient internal type,
          # which should end up in info spaces_before_argument.
          push @{$current->{'contents'}}, {
            'type' => 'internal_spaces_before_argument',
            'text' => $1,
            'parent' => $current,
            'extra' => {'spaces_associated_command' => $current->{'parent'}}
          };
        } else {
          $current->{'type'} = 'brace_command_arg';
          # Commands that disregard leading whitespace.
          if ($brace_commands{$command}
              and ($brace_commands{$command} eq 'arguments'
                   or $brace_commands{$command} eq 'inline')) {
            # internal_spaces_before_argument is a transient internal type,
            # which should end up in info spaces_before_argument.
            push @{$current->{'contents'}}, {
                        'type' => 'internal_spaces_before_argument',
                        'text' => '',
                        'parent' => $current,
                        'extra' => {'spaces_associated_command' => $current}
                      };
          }
          $self->_push_context('ct_inlineraw', $command)
            if ($command eq 'inlineraw');
        }
        print STDERR "OPENED \@$current->{'parent'}->{'cmdname'}, remaining: "
          .(defined($current->{'parent'}->{'remaining_args'}) ? "remaining: $current->{'parent'}->{'remaining_args'}, " : '')
          .($current->{'type'} ? "type: $current->{'type'}" : '')."\n"
           if ($self->{'DEBUG'});
      } elsif ($current->{'parent'}
                and (($current->{'parent'}->{'cmdname'}
                      and $current->{'parent'}->{'cmdname'} eq 'multitable')
                     or ($current->{'parent'}->{'type'}
                         and $current->{'parent'}->{'type'} eq 'def_line'))) {
        push @{$current->{'contents'}},
             { 'type' => 'bracketed',
               'parent' => $current };
        $current = $current->{'contents'}->[-1];
        # we need the line number here in case @ protects end of line
        $current->{'source_info'} = $source_info
          if ($current->{'parent'}->{'parent'}->{'type'}
              and $current->{'parent'}->{'parent'}->{'type'} eq 'def_line');
        # internal_spaces_before_argument is a transient internal type,
        # which should end up in info spaces_before_argument.
        push @{$current->{'contents'}},
            {'type' => 'internal_spaces_before_argument',
             'text' => '',
             'parent' => $current,
             'extra' => {'spaces_associated_command' => $current}
           };
        print STDERR "BRACKETED in def/multitable\n" if ($self->{'DEBUG'});
      # lone braces accepted right in a rawpreformatted
      } elsif ($current->{'type'}
               and $current->{'type'} eq 'rawpreformatted') {
        push @{$current->{'contents'}}, {'text' => '{',
                                         'parent' => $current };
      # matching braces accepted in a rawpreformatted or math or ignored
      # code
      } elsif ($self->_top_context() eq 'ct_math'
               or $self->_top_context() eq 'ct_rawpreformatted'
               or $self->_top_context() eq 'ct_inlineraw') {
        push @{$current->{'contents'}},
             { 'type' => 'bracketed',
               'parent' => $current, 'source_info' => $source_info };
        $current = $current->{'contents'}->[-1];
        print STDERR "BRACKETED in math/rawpreformatted/inlineraw\n"
           if ($self->{'DEBUG'});
      } else {
        $self->_line_error(sprintf(__("misplaced %c"),
                                         ord('{')), $source_info);
      }

    } elsif ($separator eq '}') {
      # handle_close_brace in XS parser
      _abort_empty_line($self, $current);

      # For footnote and caption closing, when there is a paragraph inside.
      # This makes the brace command the parent element.
      if ($current->{'parent'} and $current->{'parent'}->{'type'}
            and $current->{'parent'}->{'type'} eq 'brace_command_context') {
         $current = _end_paragraph($self, $current, $source_info);
      }

      if ($current->{'type'} and ($current->{'type'} eq 'bracketed')) {
        # Used in @math
        $current = $current->{'parent'};
      } elsif ($current->{'parent'}
          and $current->{'parent'}->{'cmdname'}
          and exists($self->{'brace_commands'}
                                     ->{$current->{'parent'}->{'cmdname'}})) {
        # first is the arg.
        if ($brace_commands{$current->{'parent'}->{'cmdname'}}
            and $brace_commands{$current->{'parent'}{'cmdname'}} eq 'arguments'
            and $current->{'parent'}->{'cmdname'} ne 'math') {
          _isolate_last_space($self, $current);
        }
        my $closed_command = $current->{'parent'}->{'cmdname'};
        print STDERR "CLOSING(brace) \@$current->{'parent'}->{'cmdname'}\n"
          if ($self->{'DEBUG'});
        delete $current->{'parent'}->{'remaining_args'};
        if (defined($brace_commands{$closed_command})
             and $brace_commands{$closed_command} eq 'noarg'
             and $current->{'contents'}
             and @{$current->{'contents'}}) {
          $self->_line_warn(sprintf(__(
                             "command \@%s does not accept arguments"),
                                   $closed_command), $source_info);
        }
        if ($current->{'parent'}->{'cmdname'} eq 'anchor') {
          $current->{'parent'}->{'source_info'} = $source_info;
          my $parsed_anchor = _parse_node_manual($current);
          if (_check_node_label($self, $parsed_anchor,
                            $current->{'parent'}->{'cmdname'}, $source_info)) {
            _register_label($self->{'targets'}, $current->{'parent'},
                            $parsed_anchor);
            if (@{$self->{'regions_stack'}}) {
              $current->{'extra'} = {} if (!$current->{'extra'});
              $current->{'extra'}->{'region'} = $self->{'regions_stack'}->[-1];
            }
          }
        } elsif ($ref_commands{$current->{'parent'}->{'cmdname'}}) {
          my $ref = $current->{'parent'};
          if (@{$ref->{'args'}}) {
            my @args;
            for $a (@{$ref->{'args'}}) {
              if ($a->{'contents'} and @{$a->{'contents'}}) {
                push @args, $a->{'contents'};
              } else {
                push @args, undef;
              }
            }
            if (($closed_command eq 'inforef'
                 and !defined($args[0]) and !defined($args[2]))
                or ($closed_command ne 'inforef'
                 and !defined($args[0]) and !defined($args[3])
                 and !defined($args[4]))) {
              $self->_line_warn(sprintf(__(
                 "command \@%s missing a node or external manual argument"),
                                    $closed_command), $source_info);
            } else {
              my $parsed_ref_node = _parse_node_manual($ref->{'args'}->[0]);
              if (defined $parsed_ref_node) {
                if ($closed_command ne 'inforef'
                    and !defined($args[3]) and !defined($args[4])
                    and !$parsed_ref_node->{'manual_content'}) {
                  push @{$self->{'internal_references'}}, $ref;
                }
                $ref->{'extra'} = {} if (!$ref->{'extra'});
                $ref->{'extra'}->{'node_argument'} = $parsed_ref_node
              }
            }
            if (defined($args[1])) {
              if (_check_empty_expansion($args[1])) {
                $self->_line_warn(sprintf(__(
                "in \@%s empty cross reference name after expansion `%s'"),
                      $closed_command,
                      Texinfo::Convert::Texinfo::convert_to_texinfo(
                                                {'contents' => $args[1]})),
                        $source_info);
              }
            }
            if ($closed_command ne 'inforef' and defined($args[2])) {
              if (_check_empty_expansion($args[2])) {
                $self->_line_warn(sprintf(__(
                 "in \@%s empty cross reference title after expansion `%s'"),
                      $closed_command,
                      Texinfo::Convert::Texinfo::convert_to_texinfo(
                                              {'contents' => $args[2]})),
                        $source_info);
              }
            }
          }
        } elsif ($current->{'parent'}->{'cmdname'} eq 'image') {
          my $image = $current->{'parent'};
          if (!@{$image->{'args'}}
              or !defined($image->{'args'}->[0])
              or !$image->{'args'}->[0]->{'contents'}
              or scalar(@{$image->{'args'}->[0]->{'contents'}}) == 0) {
            $self->_line_error(
               __("\@image missing filename argument"), $source_info);
          }
          if (defined $self->{'info'}->{'input_perl_encoding'}) {
            $image->{'extra'} = {} if (!$image->{'extra'});
            $image->{'extra'}->{'input_perl_encoding'}
               = $self->{'info'}->{'input_perl_encoding'};
          }
        } elsif($current->{'parent'}->{'cmdname'} eq 'dotless') {
          my $dotless = $current->{'parent'};
          if ($current->{'contents'}
              and @{$current->{'contents'}}) {
            my $text = $current->{'contents'}->[0]->{'text'};
            if (!defined ($text)
              or ($text ne 'i' and $text ne 'j')) {
              $self->_line_error(sprintf(
                    __("%c%s expects `i' or `j' as argument, not `%s'"),
                    ord('@'), $dotless->{'cmdname'},
                    Texinfo::Convert::Texinfo::convert_to_texinfo($current)),
                  $source_info);
            }
          }
        } elsif ($explained_commands{$current->{'parent'}->{'cmdname'}}
                 or ($brace_commands{$current->{'parent'}->{'cmdname'}}
                     and $brace_commands{$current->{'parent'}->{'cmdname'}} eq 'inline')) {
          my $current_command = $current->{'parent'};
          if ($brace_commands{$current_command->{'cmdname'}} eq 'inline') {
            if ($current_command->{'cmdname'} eq 'inlineraw') {
              $self->_pop_context(['ct_inlineraw'], $source_info, $current,
                                  ' inlineraw');
            }
          }
          if (!@{$current_command->{'args'}}
              or !defined($current_command->{'args'}->[0])
              or !$current_command->{'args'}->[0]->{'contents'}
              or scalar(@{$current_command->{'args'}->[0]->{'contents'}}) == 0) {
            $self->_line_warn(
               sprintf(__("\@%s missing first argument"),
                       $current_command->{'cmdname'}), $source_info);
          }
        } elsif ($current->{'parent'}->{'cmdname'} eq 'errormsg') {
          my $error_message_text = $current->{'contents'}->[0]->{'text'};
          $self->_line_error($error_message_text, $source_info)
            if $error_message_text;
        } elsif ($current->{'parent'}->{'cmdname'} eq 'U') {
          my $arg;
          if ($current->{'contents'} and $current->{'contents'}->[0]) {
            $arg = $current->{'contents'}->[0]->{'text'};
          }
          if (!defined($arg) || !$arg) {
            $self->_line_warn(__("no argument specified for \@U"),
              $source_info);
          } elsif ($arg !~ /^[0-9A-Fa-f]+$/) {
            $self->_line_error(sprintf(__(
                        "non-hex digits in argument for \@U: %s"), $arg),
                               $source_info);
          } elsif (length ($arg) < 4) {
            # Perl doesn't mind, but too much trouble to do in TeX.
            $self->_line_warn(sprintf(__(
              "fewer than four hex digits in argument for \@U: %s"), $arg),
             $source_info);
          } else {
            # we don't want to call hex at all if the value isn't
            # going to fit; so first use eval to check.
            # Since integer overflow is only a warning, have to make
            # warnings fatal for the eval to be effective.
            eval qq!use warnings FATAL => qw(all); hex("$arg")!;
            if ($@) {
              # leave clue in case something else went wrong.
              warn "\@U hex($arg) eval failed: $@\n" if ($self->{'DEBUG'});
              # argument likely exceeds size of integer
            }
            # ok, value can be given to hex(), so try it.
            if ($@ or hex($arg) > 0x10FFFF) {
              $self->_line_error(sprintf(__(
                 "argument for \@U exceeds Unicode maximum 0x10FFFF: %s"),
                 $arg),
                $source_info);
            }
          }
          # first parent is the brace command
        } elsif (_parent_of_command_as_argument($current->{'parent'}->{'parent'})
             and !$current->{'contents'}) {
          _register_command_as_argument($self, $current->{'parent'});
        } elsif ($in_index_commands{$current->{'parent'}->{'cmdname'}}) {
          my $command = $current->{'parent'}->{'cmdname'};

          my $index_element = $current->{'parent'}->{'parent'}->{'parent'};
          if ($index_element
              and _is_index_element($self, $index_element)) {
            if ($command eq 'sortas') {
              my ($arg, $superfluous_arg) = _convert_to_text($current);
              if (defined($arg)) {
                $index_element->{'extra'} = {}
                  if (!defined($index_element->{'extra'}));
                $index_element->{'extra'}->{$command} = $arg;
              }
            } else {
              $index_element->{'extra'} = {}
                if (!defined($index_element->{'extra'}));
              $index_element->{'extra'}->{$command} = $current->{'parent'};
            }
          }
        }
        _register_global_command($self, $current->{'parent'}, $source_info);
        if ($command_ignore_space_after{$current->{'parent'}->{'cmdname'}}) {
          push @{$current->{'parent'}->{'parent'}->{'contents'}},
             {'type' => 'spaces_after_close_brace',
              'text' => '',
              'parent' => $current->{'parent'}->{'parent'}
             };
        }

        $current = _close_brace_command($self, $current->{'parent'},
                                        $source_info);

        $current = _begin_preformatted($self, $current)
           if ($close_preformatted_commands{$closed_command});
      # lone braces accepted right in a rawpreformatted
      } elsif ($current->{'type'}
               and $current->{'type'} eq 'rawpreformatted') {
        push @{$current->{'contents'}}, {'text' => '}',
                                         'parent' => $current };

      } else {
        $self->_line_error(sprintf(__("misplaced %c"),
                                 ord('}')), $source_info);
      }
    } elsif ($separator eq ','
             and $current->{'parent'}
             and $current->{'parent'}->{'remaining_args'}) {
      _abort_empty_line ($self, $current);
      _isolate_last_space($self, $current);
      my $type = $current->{'type'};
      $current = $current->{'parent'};
      if ($brace_commands{$current->{'cmdname'}}
          and $brace_commands{$current->{'cmdname'}} eq 'inline') {
        my $expandp = 0;
        $current->{'extra'} = {} if (!$current->{'extra'});
        if (! $current->{'extra'}->{'format'}) {
          my $inline_type;
          if (defined $current->{'args'}->[0]
              and $current->{'args'}->[0]->{'contents'}
              and @{$current->{'args'}->[0]->{'contents'}}) {
            $inline_type = $current->{'args'}->[0]->{'contents'}->[0]->{'text'};
          }

          if (!$inline_type) {
            # condition is missing for some reason
            print STDERR "INLINE COND MISSING\n"
              if ($self->{'DEBUG'});
          } elsif ($inline_format_commands{$current->{'cmdname'}}) {
            if ($self->{'expanded_formats_hash'}->{$inline_type}) {
              $expandp = 1;
              $current->{'extra'}->{'expand_index'} = 1;
            } else {
              $expandp = 0;
            }
          } elsif (($current->{'cmdname'} eq 'inlineifset'
                    and exists($self->{'values'}->{$inline_type}))
                   or ($current->{'cmdname'} eq 'inlineifclear'
                       and ! exists($self->{'values'}->{$inline_type}))) {
            $expandp = 1;
            $current->{'extra'}->{'expand_index'} = 1;
          } else {
            $expandp = 0;
          }
          $current->{'extra'}->{'format'} = $inline_type;

          # Skip first argument for a false @inlinefmtifelse
          if (!$expandp and $current->{'cmdname'} eq 'inlinefmtifelse') {
            $current->{'extra'}->{'expand_index'} = 2;

            # Add a dummy argument for the first argument.
            push @{$current->{'args'}}, {'type' => 'elided',
                                         'parent' => $current,};
            # Scan forward to get the next argument.
            my $brace_count = 1;
            while ($brace_count > 0) {
              # Forward to next comma or brace
              if ($line =~ s/[^{,}]*([,{}])//) {
                if ($1 eq ',' and $brace_count == 1) {
                  last;
                } elsif ($1 eq '{') {
                  $brace_count++;
                } elsif ($1 eq '}') {
                  $brace_count--;
                }
              } else {
                my $new_text;
                ($new_text, $source_info)
                # TODO a test a situation with @include closing in ignored
                # @inlinefmtifelse first arg (which maybe is not possible).
                   = _next_text($self, $current->{'args'}->[-1]);
                if (not defined($new_text)) {
                  $retval = $GET_A_NEW_LINE; # error - unbalanced brace
                  goto funexit;
                }
                $line .= $new_text;
              }
            }
            if ($brace_count == 0) {
              # second arg missing
              $line = '}' . $line;
            } else {
              $current->{'remaining_args'}--;
            }
            $expandp = 1;
          }
        } elsif ($current->{'cmdname'} eq 'inlinefmtifelse') {
          # Second arg of @inlinefmtifelse when condition is true.
          # Discard second argument.
          $expandp = 0;
        }
        # If this command is not being expanded, add a dummy argument,
        # and scan forward to the closing brace.
        if (!$expandp) {
          push @{$current->{'args'}}, {'type' => 'elided',
                                       'parent' => $current,};
          my $brace_count = 1;
          while ($brace_count > 0) {
            if ($line =~ s/[^{}]*([{}])//) {
              if ($1 eq '{') {
                $brace_count++;
              } else {
                $brace_count--;
              }
            } else {
              my $new_text;
              # TODO a test a situation with @include closing in ignored
              # @inline* second arg (which maybe is not possible).
              ($new_text, $source_info)
                 = _next_text($self, $current->{'args'}->[-1]);
              if (not defined($new_text)) {
                $retval = $GET_A_NEW_LINE; # error - unbalanced brace
                goto funexit;
              }
              $line .= $new_text;
            }
          }
          $current->{'remaining_args'}--;
          $current = $current->{'args'}->[-1];
          $line = '}' . $line;
          goto funexit;
        }
      }
      $current->{'remaining_args'}--;
      push @{$current->{'args'}},
           { 'type' => $type, 'parent' => $current, 'contents' => [] };
      $current = $current->{'args'}->[-1];
      # internal_spaces_before_argument is a transient internal type,
      # which should end up in info spaces_before_argument.
      push @{$current->{'contents'}},
             {'type' => 'internal_spaces_before_argument',
              'text' => '',
              'parent' => $current,
              'extra' => {'spaces_associated_command' => $current}
            };
    } elsif ($separator eq ',' and $current->{'type'}
             and $current->{'type'} eq 'line_arg'
             and $current->{'parent'}->{'cmdname'}
             and $current->{'parent'}->{'cmdname'} eq 'node') {
      $self->_line_warn(__("superfluous arguments for node"), $source_info);
    # After a separator in a menu, end of menu node
    # (. must be followed by a space to stop the node).
    } elsif (($separator =~ /[,\t.]/ and $current->{'type'}
           and $current->{'type'} eq 'menu_entry_node')
           or ($separator eq ':' and $current->{'type'}
             and $current->{'type'} eq 'menu_entry_name')) {
      $current = $current->{'parent'};
      push @{$current->{'contents'}}, { 'type' => 'menu_entry_separator',
                                        'text' => $separator,
                                        'parent' => $current };
    } elsif ($separator eq "\f" and $current->{'type'}
             and $current->{'type'} eq 'paragraph') {
      # A form feed stops and restart a paragraph.
      $current = _end_paragraph($self, $current, $source_info);
      push @{$current->{'contents'}}, {'text' => $separator,
                                       'type' => 'empty_line',
                                        'parent' => $current };
      push @{$current->{'contents'}}, { 'type' => 'empty_line',
                                        'text' => '',
                                        'parent' => $current };
    } else {
      $current = _merge_text($self, $current, $separator);
    }
  # Misc text except end of line
  } elsif (defined $misc_text) {
    print STDERR "MISC TEXT: $misc_text\n" if ($self->{'DEBUG'});
    my $new_text = $misc_text;
    substr ($line, 0, length ($misc_text)) = '';
    $current = _merge_text($self, $current, $new_text);
  # end of line
  } else {
    print STDERR "END LINE: "
        .Texinfo::Common::debug_print_element_short($current, 1)."\n"
          if ($self->{'DEBUG'});
    if ($line =~ s/^(\n)//) {
      $current = _merge_text($self, $current, $1);
    } else {
      if (scalar(@{$self->{'input'}})) {
        $self->_bug_message("Text remaining without normal text but `$line'",
                            $source_info, $current);
        die;
      }
    }
    $current = _end_line($self, $current, $source_info);
    $retval = $GET_A_NEW_LINE;
    goto funexit;
  }

 funexit:
  return ($current, $line, $source_info, $retval);
}

# the main subroutine
sub _parse_texi($$$)
{
  my ($self, $root, $current) = @_;

  my $source_info;

 NEXT_LINE:
  while (1) {
    my $line;
    ($line, $source_info) = _next_text($self, $current);
    last if (!defined($line));

    if ($self->{'DEBUG'}) {
      my $source_info_text = '';
      $source_info_text = "$source_info->{'line_nr'}.$source_info->{'macro'}"
         if ($source_info);
      print STDERR "NEW LINE("
         .join('|', $self->_get_context_stack())
         .":@{$self->{'conditional_stack'}}:$source_info_text): $line";
      #print STDERR "  $current: "
      #             .Texinfo::Common::debug_print_element_short($current)."\n";
    }

    # This almost never happens in the tests, because empty lines are mostly
    # generated within a line.
    #if ($line eq '') {
    #  print STDERR "IGNORE EMPTY LINE\n"
    #     if ($self->{'DEBUG'})
    #  next;
    #}

    if (not
        # all the format handled early that have specific containers
        # 'raw' command or ignored conditional or verb or ignored raw format
          (($current->{'cmdname'}
           and $block_commands{$current->{'cmdname'}}
           and ($block_commands{$current->{'cmdname'}} eq 'raw'
                or $block_commands{$current->{'cmdname'}} eq 'conditional'
                or ($block_commands{$current->{'cmdname'}} eq 'format_raw'
           and not $self->{'expanded_formats_hash'}->{$current->{'cmdname'}})))
          or
           ($current->{'parent'} and $current->{'parent'}->{'cmdname'}
            and $current->{'parent'}->{'cmdname'} eq 'verb')
          )
        # not def line
        and $self->_top_context() ne 'ct_def') {
      next NEXT_LINE if _check_line_directive ($self, $line, $source_info);
      print STDERR "BEGIN LINE\n" if ($self->{'DEBUG'});

      if ($current->{'contents'}
          and $current->{'contents'}->[-1]
          and $current->{'contents'}->[-1]->{'type'}
          and $current->{'contents'}->[-1]->{'type'}
               eq 'internal_spaces_before_argument') {
        # Empty spaces after brace or comma till the end of line.
        # Remove this element and update 'extra' values.
        _abort_empty_line($self, $current);
      }
      $line =~ s/^([^\S\r\n]*)//;
      push @{$current->{'contents'}}, { 'type' => 'empty_line',
                                        'text' => $1,
                                        'parent' => $current };
    }

    while (1) {
      my $status;
      ($current, $line, $source_info, $status)
         = _process_remaining_on_line($self, $current, $line, $source_info);
      if ($status == $GET_A_NEW_LINE) {
        last;
      } elsif ($status == $FINISHED_TOTALLY) {
        goto finished_totally;
      }
      # can happen if there is macro expansion at the end of a text fragment.
      # Not sure that it can happen otherwise.
      if (! defined($line)) {
        $current = _end_line($self, $current, $source_info);
        last;
      }
    }
  }
 finished_totally:
  while (@{$self->{'conditional_stack'}}) {
    my $end_conditional = pop @{$self->{'conditional_stack'}};
    $self->_line_error(sprintf(__("expected \@end %s"), $end_conditional),
                      $source_info);
  }
  while (@{$self->{'raw_block_stack'}}) {
    my $end_raw_block = pop @{$self->{'raw_block_stack'}};
    $self->_line_error(sprintf(__("expected \@end %s"), $end_raw_block),
                      $source_info);
  }
  $current = _close_commands($self, $current, $source_info);

  my @context_stack = $self->_get_context_stack();
  if (scalar(@context_stack) != 0) {
    die($self->_bug_message("CONTEXT_STACK not empty at _parse_texi end: "
           .join('|', @context_stack)));
  }

  # Gather text after @bye
  my $element_after_bye = {'type' => 'postamble_after_end', 'contents' => [],
                           'parent' => $current};
  while (1) {
    my $line;
    ($line, $source_info) = _next_text($self);
    last if (!defined($line));
    push @{$element_after_bye->{'contents'}},
           {'text' => $line, 'type' => 'text_after_end',
            'parent' => $element_after_bye};
  }
  if (scalar(@{$element_after_bye->{'contents'}})) {
    push @{$current->{'contents'}}, $element_after_bye;
  }

  # Setup labels info and nodes list based on 'targets'
  Texinfo::Convert::NodeNameNormalization::set_nodes_list_labels($self,
                                              $self->{'registrar'}, $self);
  Texinfo::Convert::NodeNameNormalization::set_float_types($self);
  Texinfo::Translations::complete_indices($self);
  return $root;
}

# parse special line @-commands, unmacro, set, clear, clickstyle.
# Also remove spaces or ignore text, as specified in the line_commands hash.
sub _parse_special_misc_command($$$$)
{
  my ($self, $line, $command, $source_info) = @_;

  my $args = [];

  my $has_comment = 0;
  my $remaining;
  if ($command eq 'set') {
    # REVALUE
    if ($line =~ /^\s+([\w\-][^\s{\\}~`\^+"<>|@]*)(\@(c|comment)((\@|\s+).*)?|\s+(.*?))?\s*$/) {
      if ($line =~ s/\@(c|comment)((\@|\s+).*)?$//) {
        $has_comment = 1;
      }
      $line =~ /^\s+([\w\-][^\s{\\}~`\^+"<>|@]*)(\s+(.*?))?\s*$/;
      my $name = $1;
      my $arg = $3;
      $arg = '' if (!defined($arg));
      $args = [$name, $arg];
      $self->{'values'}->{$name} = $arg;
    } elsif ($line !~ /\S/) {
      $self->_line_error(sprintf(
                  __("%c%s requires a name"), ord('@'), $command), $source_info);
    } else {
      $self->_line_error(sprintf(
                    __("bad name for \@%s"), $command), $source_info);
    }
  } elsif ($command eq 'clear') {
    # REVALUE
    if ($line =~ /^\s+([\w\-][^\s{\\}~`\^+"<>|@]*)\s*(\@(c|comment)((\@|\s+).*)?)?$/) {
      $args = [$1];
      delete $self->{'values'}->{$1};
      $has_comment = 1 if (defined($3));
    } elsif ($line !~ /\S/) {
      $self->_line_error(sprintf(
                  __("%c%s requires a name"), ord('@'), $command), $source_info);
    } else {
      $self->_line_error(sprintf(
                    __("bad name for \@%s"), $command), $source_info);
    }
  } elsif ($command eq 'unmacro') {
    # REMACRO
    if ($line =~ /^\s+([[:alnum:]][[:alnum:]\-]*)\s*(\@(c|comment)((\@|\s+).*)?)?$/) {
      $args = [$1];
      delete $self->{'macros'}->{$1};
      $has_comment = 1 if (defined($3));
      print STDERR "UNMACRO $1\n" if ($self->{'DEBUG'});
    } elsif ($line !~ /\S/) {
      $self->_line_error(sprintf(
                  __("%c%s requires a name"), ord('@'), $command), $source_info);
    } else {
      $self->_line_error(sprintf(
                    __("bad name for \@%s"), $command), $source_info);
    }
  } elsif ($command eq 'clickstyle') {
    # REMACRO
    if ($line =~ /^\s+@([[:alnum:]][[:alnum:]\-]*)(\{\})?\s*/) {
      $args = ['@'.$1];
      $self->{'clickstyle'} = $1;
      $remaining = $line;
      $remaining =~ s/^\s+@([[:alnum:]][[:alnum:]\-]*)(\{\})?\s*(\@(c|comment)((\@|\s+).*)?)?//;
      $has_comment = 1 if (defined($4));
    } else {
      $self->_line_error(sprintf(__(
                "\@%s should only accept an \@-command as argument, not `%s'"),
                                 $command, $line), $source_info);
    }
  } else {
    die $self->_bug_message("Unknown special command $command", $source_info);
  }
  if (defined($remaining)) {
    chomp($remaining);
    if ($remaining ne '') {
      $self->_line_warn(sprintf(__(
                         "remaining argument on \@%s line: %s"),
                           $command, $remaining), $source_info);
    }
  }
  return ($args, $has_comment);
}

# at the end of an @-command line with arguments, parse the resulting
# text, to collect aliases, definfoenclose and collect errors on
# wrong arguments.
sub _parse_line_command_args($$$)
{
  my ($self, $line_command, $source_info) = @_;

  my $args;

  my $command = $line_command->{'cmdname'};
  my $arg = $line_command->{'args'}->[0];

  if ($self->{'DEBUG'}) {
    print STDERR "MISC ARGS \@$command\n";
    if ($arg->{'contents'} and @{$arg->{'contents'}}) {
      my $idx = 0;
      foreach my $content (@{$arg->{'contents'}}) {
        my $name = '';
        $name = '@' . $content->{'cmdname'} if ($content->{'cmdname'});
        my $type = ', t: ';
        $type .= $content->{'type'} if ($content->{'type'});
        my $text = ', ';
        $type .= $content->{'text'} if ($content->{'text'});
        print STDERR "   -> $idx $name $type $text\n";
        $idx++;
      }
    }
  }

  if (!$arg->{'contents'}) {
    $self->_command_error($line_command, $source_info,
               __("\@%s missing argument"), $command);
    $line_command->{'extra'} = {} if (!$line_command->{'extra'});
    $line_command->{'extra'}->{'missing_argument'} = 1;
    return undef;
  }

  if (@{$arg->{'contents'}} > 1
         or (!defined($arg->{'contents'}->[0]->{'text'}))) {
    $self->_line_error(sprintf(__("superfluous argument to \@%s"),
       $command), $source_info);
  }
  return undef if (!defined($arg->{'contents'}->[0]->{'text'}));

  my $line = $arg->{'contents'}->[0]->{'text'};

  if ($command eq 'alias') {
    # REMACRO
    if ($line =~ s/^([[:alnum:]][[:alnum:]-]*)(\s*=\s*)([[:alnum:]][[:alnum:]-]*)$//) {
      my $new_command = $1;
      my $existing_command = $3;
      $args = [$1, $3];
      $self->{'aliases'}->{$new_command} = $existing_command;
      if (exists($block_commands{$existing_command})) {
        $self->_line_warn(sprintf(
                             __("environment command %s as argument to \@%s"),
                             $existing_command, $command), $source_info);
      }
    } else {
      $self->_line_error(sprintf(
                             __("bad argument to \@%s"), $command), $source_info);
    }

  } elsif ($command eq 'definfoenclose') {
    # REMACRO
    # FIXME not clear if non ascii spaces are ok in the args
    if ($line =~ s/^([[:alnum:]][[:alnum:]\-]*)\s*,\s*([^\s,]*)\s*,\s*([^\s,]*)$//) {
      $args = [$1, $2, $3 ];
      my ($cmd_name, $begin, $end) = ($1, $2, $3);
      $self->{'definfoenclose'}->{$cmd_name} = [ $begin, $end ];
      print STDERR "DEFINFOENCLOSE \@$cmd_name: $begin, $end\n"
               if ($self->{'DEBUG'});
      # consistent with XS parser, not actually used anywhere.
      $self->{'brace_commands'}->{$cmd_name} = 'style_other';
      # this allows to obtain the same result as the XS parser which checks
      # dynamically the brace_commands type
      $self->{'valid_nestings'}->{$cmd_name} = \%in_full_text_commands;
      # note that a built-in command previously in a hash classifying the
      # @-command will remain there, possibly having specific effects.
    } else {
      $self->_line_error(sprintf(__("bad argument to \@%s"), $command),
                         $source_info);
    }
  } elsif ($command eq 'columnfractions') {
    my @possible_fractions = split (/\s+/, $line);
    if (!@possible_fractions) {
      $self->_line_error(sprintf(__("empty \@%s"), $command),
                             $source_info);
    } else {
      foreach my $fraction (@possible_fractions) {
        if ($fraction =~ /^\d*\.\d+$|^\d+\.?$/) {
          push @$args, $fraction;
        } else {
          $self->_line_error(sprintf(
                              __("column fraction not a number: %s"),
                              $fraction), $source_info);
        }
      }
    }
  } elsif ($command eq 'sp') {
    if ($line =~ /^([0-9]+)$/) {
      $args = [$1];
    } else {
      $self->_line_error(sprintf(__("\@sp arg must be numeric, not `%s'"),
                                 $line), $source_info);
    }
  } elsif ($command eq 'defindex' || $command eq 'defcodeindex') {
    # REMACRO
    if ($line =~ /^([[:alnum:]][[:alnum:]\-]*)$/) {
      my $name = $1;
      if ($forbidden_index_name{$name}) {
        $self->_line_error(sprintf(
                             __("reserved index name %s"), $name), $source_info);
      } else {
        my $in_code = 0;
        $in_code = 1 if ($command eq 'defcodeindex');
        $args = [$name];
        $self->{'index_names'}->{$name} = {'in_code' => $in_code};
        if (!exists($self->{'index_names'}->{$name}->{'name'})) {
          $self->{'index_names'}->{$name}->{'name'} = $name;
        }
        if (!exists($self->{'index_names'}->{$name}->{'contained_indices'})) {
          $self->{'index_names'}->{$name}->{'contained_indices'} = {$name => 1};
        }
        $self->{'line_commands'}->{$name.'index'} = 'line';
        $self->{'no_paragraph_commands'}->{$name.'index'} = 1;
        $self->{'basic_inline_commands'}->{$name.'index'} = 1;
        $self->{'command_index'}->{$name.'index'} = $name;
      }
    } else {
      $self->_line_error(sprintf(
                __("bad argument to \@%s: %s"), $command, $line), $source_info);
    }
  } elsif ($command eq 'synindex' || $command eq 'syncodeindex') {
    # REMACRO
    if ($line =~ /^([[:alnum:]][[:alnum:]\-]*)\s+([[:alnum:]][[:alnum:]\-]*)$/) {
      my $index_from = $1;
      my $index_to = $2;
      $self->_line_error(sprintf(__("unknown source index in \@%s: %s"),
                                 $command, $index_from), $source_info)
        unless $self->{'index_names'}->{$index_from};
      $self->_line_error(sprintf(__("unknown destination index in \@%s: %s"),
                                 $command, $index_to), $source_info)
        unless $self->{'index_names'}->{$index_to};
      if ($self->{'index_names'}->{$index_from}
           and $self->{'index_names'}->{$index_to}) {
        my $current_to = $index_to;
        # find the merged indices recursively avoiding loops
        while ($current_to ne $index_from
               and $self->{'merged_indices'}->{$current_to}) {
          $current_to = $self->{'merged_indices'}->{$current_to};
        }
        if ($current_to ne $index_from) {
          my $index_from_info = $self->{'index_names'}->{$index_from};
          my $index_to_info = $self->{'index_names'}->{$current_to};

          my $in_code = 0;
          $in_code = 1 if ($command eq 'syncodeindex');
          $self->{'merged_indices'}->{$index_from} = $current_to;
          $index_from_info->{'in_code'} = $in_code;
          if ($index_from_info->{'contained_indices'}) {
            foreach my $contained_index
                             (keys %{$index_from_info->{'contained_indices'}}) {
              $index_to_info->{'contained_indices'}->{$contained_index} = 1;
              $self->{'index_names'}->{$contained_index}->{'merged_in'}
                                                              = $current_to;
              $self->{'merged_indices'}->{$contained_index} = $current_to;
            }
            delete $index_from_info->{'contained_indices'};
          }
          $index_from_info->{'merged_in'} = $current_to;
          $index_to_info->{'contained_indices'}->{$index_from} = 1;
          $args = [$index_from, $index_to];
        } else {
          $self->_line_warn(sprintf(__(
                         "\@%s leads to a merging of %s in itself, ignoring"),
                             $command, $index_from), $source_info);
        }
      }
    } else {
      $self->_line_error(sprintf(__("bad argument to \@%s: %s"),
                                $command, $line), $source_info);
    }
  } elsif ($command eq 'printindex') {
    # REMACRO
    if ($line =~ /^([[:alnum:]][[:alnum:]\-]*)$/) {
      my $name = $1;
      if (!exists($self->{'index_names'}->{$name})) {
        $self->_line_error(sprintf(__("unknown index `%s' in \@printindex"),
                                    $name), $source_info);
      } else {
        if ($self->{'merged_indices'}->{$name}) {
          $self->_line_warn(sprintf(__(
                       "printing an index `%s' merged in another one, `%s'"),
                                   $name, $self->{'merged_indices'}->{$name}),
                           $source_info);
        }
        if (!defined($self->{'current_node'})
            and !defined($self->{'current_section'})
            and !scalar(@{$self->{'regions_stack'}})) {
          $self->_line_warn(sprintf(__(
                     "printindex before document beginning: \@printindex %s"),
                                    $name), $source_info);
        }
        $args = [$name];
      }
    } else {
      $self->_line_error(sprintf(
               __("bad argument to \@%s: %s"), $command, $line), $source_info);
    }
  } elsif ($command eq 'fonttextsize') {
    if ($line eq '10' or $line eq '11') {
      $args = [$line];
    } else {
      $self->_line_error(sprintf(__(
                        "Only \@%s 10 or 11 is supported, not `%s'"),
                                $command, $line), $source_info);
    }
  } elsif ($command eq 'footnotestyle') {
    if ($line eq 'separate' or $line eq 'end') {
      $args = [$line];
    } else {
      $self->_line_error(sprintf(__(
                            "\@%s arg must be `separate' or `end', not `%s'"),
                                $command, $line), $source_info);
    }
  } elsif ($command eq 'setchapternewpage') {
    if ($line eq 'on' or $line eq 'off' or $line eq 'odd') {
      $args = [$line];
    } else {
      $self->_line_error(sprintf(__(
                           "\@%s arg must be `on', `off' or `odd', not `%s'"),
                                $command, $line), $source_info);
    }
  } elsif ($command eq 'need') { # only a warning
    if (($line =~ /^([0-9]+(\.[0-9]*)?)$/) or
             ($line =~ /^(\.[0-9]+)$/)) {
      $args = [$1];
    } else {
      $self->_line_error(sprintf(__("bad argument to \@%s: %s"),
                                 $command, $line), $source_info);
    }
  } elsif ($command eq 'paragraphindent') {
    if ($line =~ /^([\w\-]+)$/) {
      my $value = $1;
      if ($value =~ /^([0-9]+)$/ or $value eq 'none' or $value eq 'asis') {
        $args = [$1];
      } else {
        $self->_line_error(sprintf(__(
           "\@paragraphindent arg must be numeric/`none'/`asis', not `%s'"),
                                             $value), $source_info);
      }
    } else {
      $self->_line_error(sprintf(__(
             "\@paragraphindent arg must be numeric/`none'/`asis', not `%s'"),
                                           $line), $source_info);
    }
  } elsif ($command eq 'firstparagraphindent') {
    if ($line eq 'none' or $line eq 'insert') {
      $args = [$line];
    } else {
      $self->_line_error(sprintf(__(
         "\@firstparagraphindent arg must be `none' or `insert', not `%s'"),
                                           $line), $source_info);
    }
  } elsif ($command eq 'exampleindent') {
    if ($line =~ /^([0-9]+)$/) {
      $args = [$1];
    } elsif ($line =~ /^(asis)$/) {
      $args = [$1];
    } else {
      $self->_line_error(sprintf(__(
           "\@exampleindent arg must be numeric/`asis', not `%s'"),
                                         $line), $source_info);
    }
  } elsif ($command eq 'frenchspacing'
           or $command eq 'xrefautomaticsectiontitle'
           or $command eq 'codequoteundirected'
           or $command eq 'codequotebacktick'
           or $command eq 'deftypefnnewline'
           or $command eq 'microtype') {
    if ($line eq 'on' or $line eq 'off') {
      $args = [$line];
    } else {
      $self->_line_error(sprintf(__("expected \@%s on or off, not `%s'"),
                                         $command, $line), $source_info);
    }
  } elsif ($command eq 'kbdinputstyle') {
    if ($line eq 'code' or $line eq 'example' or $line eq 'distinct') {
      $self->{'kbdinputstyle'} = $line;
      $args = [$line];
    } else {
      $self->_line_error(sprintf(__(
      "\@kbdinputstyle arg must be `code'/`example'/`distinct', not `%s'"),
                                           $line), $source_info);
    }
  } elsif ($command eq 'allowcodebreaks') {
    if ($line eq 'true' or $line eq 'false') {
      $args = [$line];
    } else {
      $self->_line_error(sprintf(__(
               "\@allowcodebreaks arg must be `true' or `false', not `%s'"),
                                           $line), $source_info);
    }
  } elsif ($command eq 'urefbreakstyle') {
    if ($line eq 'after' or $line eq 'before' or $line eq 'none') {
      $args = [$line];
    } else {
      $self->_line_error(sprintf(__(
         "\@urefbreakstyle arg must be `after'/`before'/`none', not `%s'"),
                                           $line), $source_info);
    }
  } elsif ($command eq 'headings') {
    if ($line eq 'off' or $line eq 'on' or $line eq 'single'
       or $line eq 'double' or  $line eq 'singleafter' or $line eq 'doubleafter') {
      $args = [$line];
    } else {
      $self->_line_error(sprintf(__("bad argument to \@%s: %s"),
                                 $command, $line), $source_info);
    }
  } elsif (grep {$_ eq $command} ('everyheadingmarks', 'everyfootingmarks',
                                  'evenheadingmarks', 'oddheadingmarks',
                                  'evenfootingmarks', 'oddfootingmarks')) {
    if ($line eq 'top' or $line eq 'bottom') {
      $args = [$line];
    } else {
      $self->_line_error(sprintf(__(
                      "\@%s arg must be `top' or `bottom', not `%s'"),
                                $command, $line), $source_info);
    }
  }
  return $args;
}

1;
__END__
=head1 NAME

Texinfo::Parser - Parse Texinfo code into a Perl tree

=head1 SYNOPSIS

  use Texinfo::Parser;
  my $parser = Texinfo::Parser::parser();
  my $tree = $parser->parse_texi_file("somefile.texi");
  # a Texinfo::Report object in which the errors and warnings
  # encountered while parsing are registered.
  my $registrar = $parser->registered_errors();
  my ($errors, $errors_count) = $registrar->errors();
  foreach my $error_message (@$errors) {
    warn $error_message->{'error_line'};
  }

  my $index_names = $parser->indices_information();
  my $float_types_arrays = $parser->floats_information();
  my $internal_references_array
    = $parser->internal_references_information();
  # $labels_information is an hash reference on normalized node/float/anchor names.
  my ($labels_information, $targets_list, $nodes_list) = $parser->labels_information();
  # A hash reference, keys are @-command names, value is an
  # array reference holding all the corresponding @-commands.
  my $global_commands_information = $parser->global_commands_information();
  # a hash reference on document information (encodings,
  # input file name, dircategory and direntry list, for example).
  my $global_information = $parser->global_information();

=head1 NOTES

The Texinfo Perl module main purpose is to be used in C<texi2any> to convert
Texinfo to other formats.  There is no promise of API stability.

=head1 DESCRIPTION

C<Texinfo::Parser> will parse Texinfo text into a Perl tree.  In one pass
it expands user-defined @-commands, conditionals (C<@ifset>, C<@ifinfo>...)
and C<@value> and constructs the tree.  Some extra information is gathered
while doing the tree: for example, the C<@quotation> associated to an C<@author>
command, the number of columns in a multitable, or the node associated with a
section.

=head1 METHODS

No method is exported in the default case.  The module allows both
an object-oriented syntax, or traditional function, with the parser
as an opaque data structure given as an argument to every function.

=head2 Initialization

The following method is used to construct a new C<Texinfo::Parser> object:

=over

=item $parser = Texinfo::Parser::parser($options);
X<C<Texinfo::Parser::parser>>
X<Parser initialization>

This method creates a new parser.  The options may be provided as a hash
reference.  Most of those options correspond to Texinfo customization options
described in the Texinfo manual.

=over

=item CPP_LINE_DIRECTIVES

Handle cpp like synchronization lines if set. Set in the default case.

=item EXPANDED_FORMATS

An array reference of the output formats for which C<@ifI<FORMAT>>
conditional blocks should be expanded.  Default is empty.

=item FORMAT_MENU

Possible values are C<nomenu>, C<menu> and C<sectiontoc>.  Only report
menu-related errors for C<menu>.

=item INCLUDE_DIRECTORIES

An array reference of directories in which C<@include> files should be
searched for.  Default contains the working directory, F<.>.

=item IGNORE_SPACE_AFTER_BRACED_COMMAND_NAME

If set, spaces after an @-command name that take braces are ignored.
Default on.

=item MAX_MACRO_CALL_NESTING

Maximal number of nested user-defined macro calls.  Default is 100000.

=begin comment

Duplicated in gdt() but not implemented in the XS Parser, so not
documented.

=item clickstyle

A string, the command name associated with C<@clickstyle>.

=item kbdinputstyle

A string, the C<@kbdinputstyle> style.

=end comment

=item documentlanguage

A string corresponding to a document language set by C<@documentlanguage>.
It overrides the document C<@documentlanguage> information, if present.

=item registrar

L<Texinfo::Report> object reused by the parser to register errors.

=item values

A hash reference.  Keys are names, values are the corresponding values.
Same as values set by C<@set>.

=back

=back

=head2 Parsing Texinfo text

Different methods may be called to parse some Texinfo code:
C<parse_texi_line> for a line, C<parse_texi_piece> for a fragment of
Texinfo, C<parse_texi_text> for a string corresponding to a full document
and C<parse_texi_file> for a file.

For all those functions, if the I<$parser> argument is undef, a new
parser object is generated to parse the line.  Otherwise the parser given
as an argument is used to parse into a tree.

When C<parse_texi_line> is used, the resulting tree is rooted at
a C<root_line> type container.  Otherwise, the resulting tree should be
rooted at a C<document_root> type container.

=over

=item $tree = parse_texi_line($parser, $text, $first_line_number)
X<C<parse_texi_line>>

This function is used to parse a short fragment of Texinfo code.

I<$text> is the string containing the texinfo line.  I<$first_line_number> is
the line number of the line, if undef, it will be set to 1.

=item $tree = parse_texi_piece($parser, $text, $first_line_number)
X<C<parse_texi_piece>>

This function is used to parse Texinfo fragments.

I<$text> is the string containing the texinfo text.  I<$first_line_number> is
the line number of the first text line, if undef, it will be set to 1.

=item $tree = parse_texi_text($parser, $text, $first_line_number)
X<C<parse_texi_text>>

This function is used to parse a text as a whole document.

I<$text> is the string containing the texinfo text.  I<$first_line_number> is
the line number of the first text line, if undef, it will be set to 1.

=item $tree = parse_texi_file($parser, $file_name)
X<C<parse_texi_file>>

The file with name I<$file_name> is considered to be a Texinfo file and
is parsed into a tree.  I<$file_name> should be a binary string.

undef is returned if the file couldn't be read.

=back

The errors collected during the tree parsing are registered in a
L<Texinfo::Report> object.  This object is available with
C<registered_errors>.  The errors registered in the C<Texinfo::Report>
object are available through the C<errors> method.  This method is
described in L<Texinfo::Report::errors|Texinfo::Report/($error_warnings_list, $error_count) = errors($registrar)>.

=over

=item $registrar = registered_errors($parser)
X<C<registered_errors>>

I<$registrar> is a L<Texinfo::Report> object in which the errors
and warnings encountered while parsing are registered.  If a I<registrar>
is passed to the parser initialization options, it is reused, otherwise
a new one is created.

=back

=head2 Getting information on the document

After parsing some information about the Texinfo code that was processed
is available from the parser.

Some global information is available through C<global_information>:

=over

=item $info = global_information($parser)
X<C<global_information>>

The I<$info> returned is a hash reference.  The possible keys are

=over

=item dircategory_direntry

An array of successive C<@dircategory> and C<@direntry> as they appear
in the document.

=item input_encoding_name

=item input_perl_encoding

C<input_encoding_name> string is the encoding name used for the
Texinfo code.
C<input_perl_encoding> string is a corresponding Perl encoding name.

=item input_file_name

=item input_directory

The name of the main Texinfo input file and the associated directory.
Binary strings.  In C<texi2any>, they should come from the command line
(and can be decoded with the encoding in the customization variable
C<COMMAND_LINE_ENCODING>).

=back

=back

Some command lists are available, such that it is possible to go through
the corresponding tree elements without walking the tree.  They are
available through C<global_commands_information>:

=over

=item $commands = global_commands_information($parser)
X<C<global_commands_information>>

I<$commands> is an hash reference.  The keys are @-command names.  The
associated values are array references containing all the corresponding
tree elements.

=back

All the @-commands that have an associated label (so can be the
target of cross references) -- C<@node>, C<@anchor> and C<@float> with
label -- have a normalized name associated, constructed as described in the
I<HTML Xref> node in the Texinfo documentation.  Those normalized labels and
the association with @-commands is available through C<labels_information>:

=over

=item $labels_information, $targets_list, $nodes_list = labels_information($parser)
X<C<labels_information>>

I<$labels_information> is a hash reference whose keys are normalized
labels, and the associated value is the corresponding @-command.
I<$targets_list> is a list of labels @-command.  Using
I<$labels_information> is preferred.  I<$nodes_list> is a list of all
the nodes appearing in the document.

=back

Information on C<@float> is also available, grouped by type of
floats, each type corresponding to potential C<@listoffloats>.
This information is available through the method C<floats_information>.

=over

=item $float_types = floats_information($parser)
X<C<floats_information>>

I<$float_types> is a hash reference whose keys are normalized float
types (the first float argument, or the C<@listoffloats> argument).
The normalization is the same as for the first step of node names
normalization. The value is the list of float tree elements appearing
in the texinfo document.

=back

Internal references, that is, @-commands that refer to node, anchors
or floats within the document are also available:

=over

=item $internal_references_array = internal_references_information($parser);
X<C<internal_references_information>>

The function returns a list of cross-reference commands referring to
the same document.

=back

Information about defined indices, merged indices and index entries is
also available through the C<indices_information> method.

=over

=item indices_information
X<C<indices_information>>

  $index_names = indices_information($parser);

The index names is a hash reference.  The keys are

=over

=item in_code

1 if the index entries should be formatted as code, 0 in the opposite case.

=item name

The index name.

=item prefix

An array reference of prefix associated to the index.

=item merged_in

In case the index is merged to another index, this key holds the name of
the index the index is merged into.  It takes into account indirectly
merged indices.

=item contained_indices

An hash reference holding names of indices that are merged into the index,
including itself.  It also contains indirectly merged indices.  This key
is removed if the index is itself later merged to another index.

=item index_entries

An array reference containing index entry structures for index entries
associated with the index.  The index entry could be associated to
@-commands like C<@cindex>, or C<@item> in C<@vtable>, or definition
commands entries like C<@deffn>.

The keys of the index entry structures are

=over

=item index_name

The index name.

=item index_at_command

The name of the @-command associated with the index entry.

=item index_ignore_chars

A hash reference with characters as keys and 1 as value.  Corresponds to
the characters flagged as ignored in key sorting in the document by
setting flags such as I<txiindexbackslashignore>.

=begin comment

This is not used anywhere, do not document to be able to remove it
anytime.

=item index_type_command

The name of the @-command associated with the index entry.  This
should allow to find the index associated to the index entry.

=end comment

=item entry_content

An array reference corresponding to the index entry content.

=item content_normalized

An array reference corresponding to the index entry content, independent
of the current language.

=item entry_element

The element in the parsed tree associated with the @-command holding the
index entry.

=item entry_node

The node in the parsed tree containing the index entry.

=item entry_number

The number of the index entry.

=item entry_region

The region command (C<@copying>, C<@titlepage>) containing the index entry,
if it is in such an environement.

=back

=back

The following shows the references corresponding to the default indexes
I<cp> and I<fn>, the I<fn> index having its entries formatted as code and
the indices corresponding to the following texinfo

  @defindex some
  @defcodeindex code

  $index_names = {'cp' => {'name' => 'cp', 'in_code' => 0, },
                  'fn' => {'name' => 'fn', 'in_code' => 1, },
                  'some' => {'in_code' => 0},
                  'code' => {'in_code' => 1}};

If C<name> is not set, it is set to the index name.

=back

=begin comment

The following are not implemented in the XS parser, and we do not want them
to be used for the NonXS parser.  They are not set to be configurable in the
NonXS parser anyway (but could easily be).

=head2 Texinfo Parser options

Setting these options is the same as seeing some Texinfo constructs in the
document.

=over

=item aliases

A hash reference.  The key is a command name, the value is the alias, as
could be set by C<@alias>.

=item indices

If it is a hash reference, the keys are index names, the values are
index prefix hash references.  The index prefix hash reference values are
prefix, the value is set if the corresponding index entries should be
formatted as if in C<@code>.  An example is as L</indices_information>.

If it is an array reference, it is a list of index names, as if they were
entered as

  @defindex name

=item labels

A hash reference.  Keys are normalized node names as described in the
I<HTML Xref> node in the Texinfo manual.  Instead of a node, it may also
be a float label or an anchor name.  The value is the corresponding
@-command element in the tree.

=item macros

The associated hash reference has as keys user-defined macro names.  The
value is the reference on a macro definition element as obtained by
the Parser when parsing a C<@macro>.  For example

  @macro mymacro{arg}
  coucou \arg\ after arg
  @end macro

Is associated to a macro definition element

  {'cmdname' => 'macro',
   'args' => [{'text' => 'mymacro', 'type' => 'macro_name'},
              {'text' => 'arg', 'type' => 'macro_arg}],
   'contents' => [{'text' => "coucou \arg\ after arg\n", 'type' => 'raw'}],
   'info' => {'arg_line' => " mymacro{arg}\n", }}

=item merged_indices

The associated hash reference holds merged indices information, each key
is merged in the value.  Same as setting C<@synindex> or C<syncodeindex>.

=item sections_level

Modifier of the sections level.  Same as calling C<@lowersections> or
C<@raisesections>.

=back

=end comment

=head1 TEXINFO TREE

X<Texinfo tree elements>

A Texinfo tree element (called element because node is overloaded in
the Texinfo world) is an hash reference.  There are three main categories
of tree element.  Tree elements associated with an @-command have a
C<cmdname> key holding the @-command name.  Tree elements corresponding
to text fragments have a C<text> key holding the corresponding text.
Finally, the last category is other elements, which in most cases have
a C<type> key holding their name.  Text fragments and @-command elements
may also have an associated type when such information is needed.

The children of an @-command or of other container element are in the array
referred to with the C<args> key or with the C<contents> key.  The C<args> key
is for arguments of @-commands, either in braces or on the rest of the line
after the command, depending on the type of command.  The C<contents> key array
holds the contents of the texinfo code appearing within a block @-command,
within a container, or within a C<@node> or sectioning @-command.

Another important key for the elements is the C<extra> key which is
associated to a hash reference and holds all kinds of information that
is gathered during the parsing and may help with the conversion.

You can see examples of the tree structure by running makeinfo like
this:

  makeinfo -c DUMP_TREE=1 -c TEXINFO_OUTPUT_FORMAT=parse document.texi

For a simpler, more regular representation of the tree structure, you
can do:

  makeinfo -c TEXINFO_OUTPUT_FORMAT=debugtree document.texi

=head2 Element keys

X<Texinfo tree element structure>

=over

=item cmdname

The command name of @-command elements.

=item text

The text fragment of text elements.

=item type

The type of element considered, in general a container.  Frequent
types encountered are I<paragraph> for a paragraph container,
I<brace_command_arg> for the container holding the brace @-commands
contents, I<line_arg> and I<block_line_arg> contain the arguments
appearing on the line of @-commands.  Text fragments may have a type to
give an information of the kind of text fragment, for example
I<spaces_before_paragraph> is associated to spaces appearing
before a paragraph beginning.  Most @-commands elements do not have
a type associated.

=item args

Arguments in braces or on @-command line.  An array reference.

=item contents

The Texinfo appearing in the element.  For block commands, other
containers, C<@node> and sectioning commands. An array reference.

=item parent

The parent element.

=item source_info

An hash reference corresponding to information on the location of the
element in the Texinfo input manual.  It should mainly be available for
@-command elements, and only for @-commands that are considered to be
complex enough that the location in the document is needed, for example
to prepare an error message.

The keys of the line number hash references are

=over

=item line_nr

The line number of the @-command.

=item file_name

The file name where @-command appeared.

=item macro

The user macro name the @-command is expanded from.

=back

=item info

A hash reference holding any other information that cannot be
obtained otherwise from the tree.
See L</Information available in the C<info> key>.

=item extra

A hash reference holding information that could also be obtained
from the tree, but is directly associated to the element to simplify
downstream code.
See L</Information available in the C<extra> key>.

=back

=head2 Element types

=head3 Types for command elements

Some types can be associated with @-commands (in addition to C<cmdname>),
although usually there will be no type at all.  The following are the
possible values of C<type> for tree elements for @-commands.

=over

=item command_as_argument

This is the type of a command given in argument of C<@itemize>,
C<@table>, C<@vtable> or C<@ftable>.  For example in

 @itemize @bullet
 @item item
 @end itemize

the element corresponding with bullet has the following keys:

  'cmdname' => 'bullet'
  'type' => 'command_as_argument'

The parent @-command has an entry in C<extra> for the I<command_as_argument>
element:

  'cmdname' => 'itemize'
  'extra' => {'command_as_argument' => $command_element_as_argument}

=item def_line

This type may be associated with a definition command with a x form,
like C<@defunx>, C<@defvrx>.  For the form without x, the associated
I<def_line> is the first C<contents> element.  It is described in more
details below.

=item definfoenclose_command

This type is set for an @-command that is redefined by C<@definfoenclose>.
The beginning is in C<< {'extra'}->{'begin'} >> and the end in
C<< {'extra'}->{'end'} >>.

=item following_arg

This type is set for accent @-commands that don't use braces but instead
have their argument after them, as

  @~n
  @ringaccent A

=item index_entry_command

This is the type of index entry command like C<@cindex>, and, more
importantly user-defined index entry commands.  So for example if there
is:

 @defindex foo
  ...

 @fooindex index entry

the C<@fooindex> @-command element will have the I<index_entry_command>
type.

=back

=head3 Types for text elements

The text elements may have the following types (or may have no type
at all):

=over

=item after_menu_description_line

=item space_at_end_menu_node

Space after a node in the menu entry, when there is no description,
and space appearing after the description line.

=item empty_line

An empty line (possibly containing whitespace characters only).

=item ignorable_spaces_after_command

spaces appearing after an @-command without braces that does not
take takes argument on the line, but which is followed by ignorable
spaces, such as C<@item> in C<@itemize> of C<@multitable>, or C<@noindent>.

=item spaces_after_close_brace

Spaces appearing after a closing brace, for some rare commands for which
this space should be ignorable (like C<@caption> or C<@sortas>).

=item spaces_before_paragraph

Space appearing before a paragraph beginning.

=item misc_arg

Used for the arguments to some special line commands whose arguments
aren't subject to the usual macro expansion.  For example C<@set>,
C<@clickstyle>, C<@unmacro>, C<@comment>.  The argument is associated to
the I<text> key.

=item raw

Text in an environment where it should be kept as is (in C<@verbatim>,
C<@verb>, C<@macro> body).

=item spaces_at_end

Space within an index @-command before an @-command interrupting the
index command.

=item text_after_end

Text appearing after @bye.

=item text_before_beginning

Text appearing before real content, including the C<\input texinfo.tex>.

=item untranslated

English text added by the parser that may need to be translated
during conversion.  Happens for C<@def*> @-commands aliases that
leads to prepending text such as 'Function'.

=back

=head3 Tree container elements

Some types of element are containers of portions of the tree,
either for the whole tree, or for contents appearing before C<@node>
and sectioning commands.

=over

=item before_node_section

Content before nodes and sectioning commands at the beginning of C<document_root>.

=item document_root

=item root_line

C<root_line> is the type of the root tree when parsing Texinfo line
fragments using C<parse_texi_line>.  C<document_root> is the document
root otherwise.

C<document_root> first content should be C<before_node_section>, then nodes and
sections @-commands elements, and also C<@bye> element.

=item postamble_after_end

This container holds everything appearing after @bye.

=item preamble_before_beginning

This container holds everything appearing before the first content, including
the C<\input texinfo.tex> line and following blank lines.

=item preamble_before_setfilename

This container holds everything that appears before C<@setfilename>.

=item preamble_before_content

This container holds everything appearing before the first formatted content,
corresponding to the I<preamble> in the Texinfo documentation.

=back

=head3 Types of container elements

The other types of element are containers with other elements appearing in
their C<contents>.  The C<paragraph> container holds normal text from the
Texinfo manual outside of any @-commands, and within @-commands with blocks of
text (C<@footnote>, C<@itemize> C<@item>, C<@quotation> for example).  The
C<preformatted> container holds the content appearing in @-commands like
C<@example> and the C<rawpreformatted> container holds the content appearing in
format commands such as C<@html>.  The other containers are more specific.

The types of container element are the following:

=over

=item before_item

A container for content before the first C<@item> of block @-commands
with items (C<@table>, C<@multitable>, C<@enumerate>...).

=item brace_command_arg

=item brace_command_context

=item line_arg

=item block_line_arg

Those containers occur within the C<args> array of @-commands taking an
argument.  I<brace_command_arg> is used for the arguments to commands
taking arguments surrounded by braces (and in some cases separated by
commas).  I<brace_command_context> is used for @-commands with braces
that start a new context (C<@footnote>, C<@caption>, C<@math>).

I<line_arg> is used for commands that take the texinfo code on the rest of the
line as their argument, such as C<@settitle>, C<@node>, C<@section>.
I<block_line_arg> is similar but is used for commands that start a new block
(which is to be ended with C<@end>).

For example

 @code{in code}

leads to

 {'cmdname' => 'code',
  'args' => [{'type' => 'brace_command_arg',
              'contents' => [{'text' => 'in code'}]}]}

As an exception, C<@value> flag argument is directly in the I<args> array
reference, not in a I<brace_command_arg> container.  Note that only C<@value>
commands that are not expanded because there is no corresponding value set
are present as elements in the tree.

=item bracketed

This a special type containing content in brackets in the context
where they are valid, in C<@math>.

=item bracketed_def_content

Content in brackets on definition command lines.

=item bracketed_multitable_prototype

=item row_prototype

On C<@multitable> line, content in brackets is in
I<bracketed_multitable_prototype>, text not in brackets
is in I<row_prototype>.

=item def_aggregate

Contains several elements that together are a single unit on a @def* line.

=item def_line

=item def_item

=item inter_def_item

The I<def_line> type is either associated with a container within a
definition command, or is the type of a definition command with a x
form, like C<@deffnx>.  It holds the definition line arguments.
The container with type I<def_item> holds the definition text content.
Content appearing before a definition command with a x form is in
an I<inter_def_item> container.

=item macro_name

=item macro_arg

Taken from C<@macro> definition and put in the C<args> key array of
the macro, I<macro_name> is the type of the text fragment corresponding
to the macro name, I<macro_arg> is the type of the text fragments
corresponding to macro formal arguments.

=item menu_comment

The I<menu_comment> container holds what is between menu entries
in menus.  For example, in:

  @menu
  Menu title

  * entry::

  Between entries
  * other::
  @end menu

Both

  Menu title

and

  Between entries

will be in a I<menu_comment>.

=item menu_entry

=item menu_entry_leading_text

=item menu_entry_name

=item menu_entry_separator

=item menu_entry_node

=item menu_entry_description

A I<menu_entry> holds a full menu entry, like

  * node::    description.

The different elements of the menu entry are in the
I<menu_entry> C<contents> array reference.

I<menu_entry_leading_text> holds the star and following spaces.
I<menu_entry_name> is the menu entry name (if present), I<menu_entry_node>
corresponds to the node in the menu entry, I<menu_entry_separator> holds
the text after the node and before the description, in most cases
C<::   >.  Lastly, I<menu_entry_description> is for the description.

=item multitable_head

=item multitable_body

=item row

In C<@multitable>, a I<multitable_head> container contains all the rows
with C<@headitem>, while I<multitable_body> contains the rows associated
with C<@item>.  A I<row> container contains the C<@item> and C<@tab>
forming a row.

=item paragraph

A paragraph.  The C<contents> of a paragraph (like other container
elements for Texinfo content) are elements representing the contents of
the paragraph in the order they occur, such as text elements
without a C<cmdname> or C<type>, or @-command elements for commands
appearing in the paragraph.

=item preformatted

Texinfo code within a format that is not filled.  Happens within some
block commands like C<@example>, but also in menu (in menu descriptions,
menu comments...).

=item rawpreformatted

Texinfo code within raw output format block commands such as C<@tex>
or C<@html>.

=item table_entry

=item table_term

=item table_definition

=item inter_item

Those containers appear in C<@table>, C<@ftable> and C<@vtable>.
A I<table_entry> container contains an entire row of the table.
It contains a I<table_term> container, which holds all the C<@item> and
C<@itemx> lines.  This is followed by a I<table_definition> container, which
holds the content that is to go into the second column of the table.

If there is any content before an C<@itemx> (normally only comments,
empty lines or maybe index entries are allowed), it will be in
a container with type I<inter_item> at the same level of C<@item>
and C<@itemx>, in a I<table_term>.

=back

=head2 Information available in the C<info> key

=over

=item arg_line

The string correspond to the line after the @-command
for @-commands that have special arguments on their line,
and for C<@macro> line.

=item delimiter

C<@verb> delimiter is in I<delimiter>.

=item spaces_after_argument

A reference to spaces after @-command arguments before a comma, a closing
brace or at end of line, for some @-commands and bracketed content type
with opening brace, and line commands and block command lines taking Texinfo
as argument and comma delimited arguments.  Depending on the @-command,
the I<spaces_after_argument> is associated with the @-command element, or
with each argument element.

=item spaces_after_cmd_before_arg

For accent commands with spaces following the @-command, like:

 @ringaccent A
 @^ u

there is a I<spaces_after_cmd_before_arg> key which holds the
spaces appearing after the command.

Space between a brace @-command name and its opening brace also
ends up in I<spaces_after_cmd_before_arg>.  It is not recommended
to leave space between an @-command name and its opening brace.

=item spaces_before_argument

A reference to spaces following the opening brace of some @-commands with braces
and bracketed content type, spaces following @-commands for line commands and
block command taking Texinfo as argument, and spaces following comma delimited
arguments.  For context brace commands, line commands and block commands,
I<spaces_before_argument> is associated with the @-command element, for other
brace commands and for spaces after comma, it is associated with each argument
element.

=back

=head2 Information available in the C<extra> key
X<Texinfo tree element extra key>

=head3 Extra keys available for more than one @-command

=over

=item index_entry

The index entry information (described in L</index_entries>
in details) is associated to @-commands that have an associated
index entry.

=item misc_args

An array holding strings, the arguments of @-commands taking simple
textual arguments as arguments, like C<@everyheadingmarks>,
C<@frenchspacing>, C<@alias>, C<@synindex>, C<@columnfractions>.
Also filled for C<@set>, C<@clickstyle>, C<@unmacro> or C<@comment>
arguments.

=item missing_argument

Set for some @-commands with line arguments and a missing argument.

=item text_arg

The string correspond to the line after the @-command for @-commands
that have an argument interpreted as simple text, like C<@setfilename>,
C<@end> or C<@documentencoding>.

=back

=head3 Extra keys specific of certain @-commands or containers

=over

=item C<@abbr>

=item C<@acronym>

The first argument normalized is in I<normalized>.

=item C<@anchor>

=item C<@float>

@-commands that are targets for cross-references have a I<normalized> key for
the normalized label, built as specified in the Texinfo documentation in the
I<HTML Xref> node.  There is also a I<node_content> key for an array holding
the corresponding content.

C<@anchor> also has I<region> set to the special region name if
in a special region (C<@copying>, C<@titlepage>).

=item C<@author>

If in a C<@titlepage>, the titlepage is in I<titlepage>, if in
C<@quotation> or C<@smallquotation>, the corresponding tree element
is in I<quotation>.

The author tree element is in the I<authors> array of the C<@titlepage>
or the C<@quotation> or C<@smallquotation> it is associated with.

=item C<@click>

In I<clickstyle> there is the current clickstyle command.

=item definition command

I<def_command> holds the command name, without x if it is
an x form of a definition command.
I<original_def_cmdname> is the original def command.

If it is an x form, it has I<not_after_command> set if not
appearing after the definition command without x.

=item C<def_line>

For each element in a C<def_line>, the key I<def_role> holds a string
describing the meaning of the element.  It is one of
I<category>, I<name>, I<class>, I<type>, I<arg>, I<typearg>,
I<spaces> or I<delimiter>, depending on the definition.

The I<def_parsed_hash> hash reference has these strings as keys,
and the values are the corresponding elements.

The I<omit_def_name_space> key value is set and true if the Texinfo variable
C<txidefnamenospace> was set for the C<def_line>, signaling that the
space between function definition name and arguments should be omitted.

=item C<@definfoenclose> defined commands

I<begin> holds the string beginning the C<@definfoenclose>,
I<end> holds the string ending the C<@definfoenclose>.

=item C<@documentencoding>

The argument, normalized is in I<input_encoding_name> if it is recognized.
The corresponding Perl encoding name is in I<input_perl_encoding>.

=item C<@enumerate>

The I<enumerate_specification> C<extra> key contains the enumerate argument.

=item C<@float>

=item C<@listoffloats>

If float has a first argument, and for C<@listoffloats>
argument there is a I<type> key which is also a hash reference,
with two keys. I<content> is an array holding the associated
contents, I<normalized> holds the normalized float type.

I<caption> and I<shortcaption> holds the corresponding
tree elements for float.  The C<@caption> or C<@shortcaption>
have the float tree element stored in I<float>.

=item C<@inlinefmt>

=item C<@inlineraw>

=item C<@inlinefmtifelse>

=item C<@inlineifclear>

=item C<@inlineifset>

The first argument is in I<format>.  If an argument has been determined
as being expanded by the Parser, the index of this argument is in
I<expand_index>.  Index numbering begins at 0, but the first argument is
always the format or flag name, so, if set, it should be 1 or 2 for
C<@inlinefmtifelse>, and 1 for other commands.

=item C<@item> in C<@enumerate> or C<@itemize>

The I<item_number> C<extra> key holds the number of this item.

=item C<@item> and C<@tab> in C<@multitable>

The I<cell_number> index key holds the index of the column of
the cell.

=item C<@itemize>

=item C<@table>

=item C<@vtable>

=item C<@ftable>

The I<command_as_argument> C<extra> key points to the @-command on
as argument on the @-command line.

If the command in argument for C<@table>, C<@vtable> or C<@ftable>
is C<@kbd> and the context and C<@kbdinputstyle> is such that C<@kbd>
should be formatted as code, the I<command_as_argument_kbd_code>
C<extra> key is set to 1.

=item C<@kbd>

I<code> is set depending on the context and C<@kbdinputstyle>.

=item C<@macro>

I<invalid_syntax> is set if there was an error on the C<@macro>
line.  C<info> key hash I<arg_line> holds the line after C<@macro>.

=item C<menu_entry>

The I<menu_entry_node_label> value is a hash with information about the
parsed node entry; its keys are the same as those appearing in the
elements of the I<nodes_manuals> array for C<@node>.

=item C<@multitable>

The key I<max_columns> holds the maximal number of columns.  If there
are prototypes on the line they are in the array associated with
I<prototypes>.  If there is a C<@columnfractions> as argument, then the
I<columnfractions> key is associated with the element for the
@columnfractions command.

=item C<@node>

The arguments are in the I<nodes_manuals> array. Each
of the entries is a hash with a I<node_content> key for
an array holding the corresponding content, a I<manual_content> key
if there is an associated external manual name, and a I<normalized>
key for the normalized label, built as specified in the I<HTML Xref>
Texinfo documentation node.

An I<associated_section> key holds the tree element of the
sectioning command that follows the node.  An I<node_preceding_part>
key holds the tree element of the C<@part> that precedes the node,
if there is no sectioning command between the C<@part> and the node.

A node containing a menu have a I<menus> key which refers to an array of
references to menu elements occuring in the node.

The first node containing a C<@printindex> @-command has the I<isindex>
key set.

=item C<paragraph>

The I<indent> or I<noindent> key value is set if the corresponding
@-commands are associated with that paragraph.

=item C<@part>

The next sectioning command tree element is in I<part_associated_section>.
The following node tree element is in I<part_following_node> if there is
no sectioning command between the C<@part> and the node.

=item C<@ref>

=item C<@xref>

=item C<@pxref>

=item C<@inforef>

The I<node_argument> entry holds a parsed node entry, like
the one appearing in the I<nodes_manuals> array for C<@node>.

=item C<row>

The I<row_number> index key holds the index of the row in
the C<@multitable>.

=item sectioning command

The node preceding the command is in I<associated_node>.
The part preceding the command is in I<associated_part>.
If the level of the document was modified by C<@raisections>
or C<@lowersections>, the differential level is in I<sections_level>.

=back

=head1 SEE ALSO

L<Texinfo manual|http://www.gnu.org/software/texinfo/manual/texinfo/>.

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
