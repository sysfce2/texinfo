#! /usr/bin/env perl

# texi2any: Texinfo converter.
#
# Copyright 2010-2021 Free Software Foundation, Inc.
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

# for POSIX::setlocale and File::Spec
require 5.00405;

use strict;

# to determine the locale encoding
use I18N::Langinfo qw(langinfo CODESET);
# to decode command line arguments
use Encode qw(decode encode find_encoding);
# for file names portability
use File::Spec;
# to determine the path separator and null file
use Config;
# for dirname and fileparse
use File::Basename;
#use Cwd;
use Getopt::Long qw(GetOptions);
# for carp
#use Carp;
# for dclone
use Storable;

Getopt::Long::Configure("gnu_getopt");

my ($real_command_name, $command_directory, $command_suffix);

# This big BEGIN block deals with finding modules and 
# some dependencies that we ship 
# * in source or
# * installed or
# * installed relative to the script
BEGIN
{
  # emulate -w
  $^W = 1;
  ($real_command_name, $command_directory, $command_suffix) 
     = fileparse($0, '.pl');
  my $updir = File::Spec->updir();

  # These are substituted by the Makefile to create "texi2any".
  my $datadir = '@datadir@';
  my $package = '@PACKAGE@';
  my $packagedir = '@pkglibdir@';

  if ($datadir eq '@' .'datadir@'
      or defined($ENV{'TEXINFO_DEV_SOURCE'})
         and $ENV{'TEXINFO_DEV_SOURCE'} ne '0')
  {
    # Use uninstalled modules

    # To find Texinfo::ModulePath
    if (defined($ENV{'top_builddir'})) {
      unshift @INC, File::Spec->catdir($ENV{'top_builddir'}, 'tp');
    } else {
      unshift @INC, File::Spec->catdir($command_directory);
    }

    require Texinfo::ModulePath;
    Texinfo::ModulePath::init(undef, undef, 'updirs' => 1);
  } else {
    # Look for modules in their installed locations.
    my $lib_dir = File::Spec->catdir($datadir, $package);

    # try to make package relocatable, will only work if
    # standard relative paths are used
    if (! -f File::Spec->catfile($lib_dir, 'Texinfo', 'Parser.pm')
        and -f File::Spec->catfile($command_directory, $updir, 'share', 
                                   $package, 'Texinfo', 'Parser.pm')) {
      $lib_dir = File::Spec->catdir($command_directory, $updir, 
                                          'share', $package);
      $packagedir = File::Spec->catdir($command_directory, $updir, 
                                          'lib', $package);
    }

    unshift @INC, $lib_dir;

    require Texinfo::ModulePath;
    Texinfo::ModulePath::init($lib_dir, $packagedir, 'installed' => 1);
  }
} # end BEGIN

# This allows disabling use of XS modules when Texinfo is built.
BEGIN {
  my $enable_xs = '@enable_xs@';
  if ($enable_xs eq 'no') {
    package Texinfo::XSLoader;
    our $disable_XS;
    $disable_XS = 1;
  }
}

use Locale::Messages;
use Texinfo::Common;
use Texinfo::Config;

# determine the path separators
my $path_separator = $Config{'path_sep'};
$path_separator = ':' if (!defined($path_separator));
my $quoted_path_separator = quotemeta($path_separator);

# Paths and file names
my $curdir = File::Spec->curdir();
my $updir = File::Spec->updir();

# set by configure, prefix for the sysconfdir and so on
# This could be used in the eval
my $prefix = '@prefix@';
my $datarootdir;
my $sysconfdir;
my $pkgdatadir;
my $datadir;

my $fallback_prefix = File::Spec->catdir(File::Spec->rootdir(), 'usr', 'local');

# We need to eval as $prefix has to be expanded. However when we haven't
# run configure @sysconfdir will be expanded as an array, thus we verify
# whether configure was run or not
if ('@sysconfdir@' ne '@' . 'sysconfdir@') {
  $sysconfdir = eval '"@sysconfdir@"';
} else {
  $sysconfdir = File::Spec->catdir($fallback_prefix, 'etc');
}

if ('@datarootdir@' ne '@' . 'datarootdir@') {
  $datarootdir = eval '"@datarootdir@"';
} else {
  $datarootdir = File::Spec->catdir($fallback_prefix, 'share');
}

if ('@datadir@' ne '@' . 'datadir@' and '@PACKAGE@' ne '@' . 'PACKAGE@') {
  $datadir = eval '"@datadir@"';
  my $package = '@PACKAGE@';
  $pkgdatadir = File::Spec->catdir($datadir, $package);
} else {
  $datadir = File::Spec->catdir($fallback_prefix, 'share');
  $pkgdatadir = File::Spec->catdir($datadir, 'texinfo');
}

# work-around in case libintl-perl do not do it itself
# see http://www.gnu.org/software/gettext/manual/html_node/The-LANGUAGE-variable.html#The-LANGUAGE-variable

if ((defined($ENV{"LC_ALL"}) and $ENV{"LC_ALL"} =~ /^(C|POSIX)$/)
     or (defined($ENV{"LANG"}) and $ENV{"LANG"} =~ /^(C|POSIX)$/)) {
  delete $ENV{"LANGUAGE"} if defined($ENV{"LANGUAGE"});
}


#my $messages_textdomain = 'texinfo';
my $messages_textdomain = '@PACKAGE@';
$messages_textdomain = 'texinfo' if ($messages_textdomain eq '@'.'PACKAGE@');
my $strings_textdomain = '@PACKAGE@' . '_document';
$strings_textdomain = 'texinfo_document' 
   if ($strings_textdomain eq '@'.'PACKAGE@' . '_document');


# we want a reliable way to switch locale, so we don't use the system
# gettext.
Locale::Messages->select_package('gettext_pp');

if ($Texinfo::ModulePath::texinfo_uninstalled) {
  my $locales_dir = File::Spec->catdir($Texinfo::ModulePath::builddir,
                                       'LocaleData');
  if (-d $locales_dir) {
    Locale::Messages::bindtextdomain ($strings_textdomain, $locales_dir);
  } else {
    warn "Locales dir for document strings not found\n";
  }
} else {
  Locale::Messages::bindtextdomain ($strings_textdomain, 
                                    File::Spec->catdir($datadir, 'locale'));
}

# Note: this uses installed messages even when the program is uninstalled
Locale::Messages::bindtextdomain ($messages_textdomain,
                                File::Spec->catdir($datadir, 'locale'));


# Version setting is complicated, because we cope with 
# * script with configure values substituted or not
# * script shipped as part of texinfo or as a standalone perl module

# When shipped as a perl modules, $hardcoded_version is set to undef here
# by a sed one liner.  The consequence is that configure.ac is not used
# to retrieve the version number.
# Otherwise this is only used as a safety value, and should never be used 
# in practice as a regexp extracts the version from configure.ac.
my $hardcoded_version = "0.00-hardcoded";
# Version set in configure.ac
my $configured_version = '@PACKAGE_VERSION@';
if ($configured_version eq '@' . 'PACKAGE_VERSION@') {
  # if not configured, and $hardcoded_version is set search for the version 
  # in configure.ac
  if (defined($hardcoded_version)) {
    if (open (CONFIGURE, 
              "< ".File::Spec->catfile($Texinfo::ModulePath::top_srcdir,
                                       'configure.ac'))) {
      while (<CONFIGURE>) {
        if (/^AC_INIT\(\[[^\]]+\]\s*,\s*\[([^\]]+)\]\s*,/) {
          $configured_version = "$1+dev"; # +dev to distinguish from installed
          last;
        }
      }
      close (CONFIGURE);
    }
    # This should never be used, but is a safety value
    $configured_version = $hardcoded_version if (!defined($configured_version));
  } else {
    # used in the standalone perl module, as $hardcoded_version is undef
    # and it should never be configured in that setup
    require Texinfo::Common;
    $configured_version = $Texinfo::Common::VERSION;
  }
}

# Compare the version of this file with the version of the modules
# it is using.  If they are different, don't go any further.  This
# can happen if multiple versions of texi2any are installed under a
# different names, e.g. with the --program-suffix option to 'configure'.
# The version in Common.pm is checked because that file has been present
# since Texinfo 5.0 (the first release with texi2any in Perl).
if ($configured_version ne $Texinfo::Common::VERSION
    and $configured_version ne $Texinfo::Common::VERSION."+dev") {
  warn "This is texi2any $configured_version but modules ".
       "for texi2any $Texinfo::Common::VERSION found!\n";
  die "Your installation of Texinfo is broken; aborting.\n";
}


my $configured_package = '@PACKAGE@';
$configured_package = 'Texinfo' if ($configured_package eq '@' . 'PACKAGE@');
my $configured_name = '@PACKAGE_NAME@';
$configured_name = $configured_package 
  if ($configured_name eq '@' .'PACKAGE_NAME@');
my $configured_name_version = "$configured_name $configured_version"; 
my $configured_url = '@PACKAGE_URL@';
$configured_url = 'http://www.gnu.org/software/texinfo/'
  if ($configured_url eq '@' .'PACKAGE_URL@');

my $texinfo_dtd_version = '@TEXINFO_DTD_VERSION@';
# $hardcoded_version is undef for a standalone perl module
if ($texinfo_dtd_version eq '@' . 'TEXINFO_DTD_VERSION@') {
  $texinfo_dtd_version = undef;
  if (defined($hardcoded_version)) {
    if (open (CONFIGURE, 
            "< ".File::Spec->catfile($Texinfo::ModulePath::top_srcdir,
                                     'configure.ac'))) {
      while (<CONFIGURE>) {
        if (/^TEXINFO_DTD_VERSION=([0-9]\S*)/) {
          $texinfo_dtd_version = "$1";
          last;
        }
      }
      close (CONFIGURE);
    }
  }
}

# the encoding used to decode command line arguments, and also for
# file names encoding, perl is expecting sequences of bytes, not unicode
# code points.
my $locale_encoding = langinfo(CODESET);
$locale_encoding = undef if ($locale_encoding eq '');
my $file_name_encoding = $locale_encoding;
$file_name_encoding = 'utf-8' if (not defined($file_name_encoding));

# Used in case it is not hardcoded in configure and for standalone perl module
$texinfo_dtd_version = $configured_version
  if (!defined($texinfo_dtd_version));

# options set in the main program.
my $main_program_set_options = {
    'PACKAGE_VERSION' => $configured_version,
    'PACKAGE' => $configured_package,
    'PACKAGE_NAME' => $configured_name,
    'PACKAGE_AND_VERSION' => $configured_name_version,
    'PACKAGE_URL' => $configured_url,
    'PROGRAM' => $real_command_name, 
    'TEXINFO_DTD_VERSION' => $texinfo_dtd_version,
    'COMMAND_LINE_ENCODING' => $locale_encoding,
    'MESSAGE_ENCODING' => $locale_encoding,
    'LOCALE_INPUT_FILE_NAME_ENCODING' => $file_name_encoding,
    'LOCALE_OUTPUT_FILE_NAME_ENCODING' => $file_name_encoding,
};

# use locale on Windows to set encoding of input file name as
# system calls obey locale pages even if the filesystem uses
# utf16 internally
# FIXME better explanation?
if ($^O eq 'MSWin32') {
  $main_program_set_options->{'DOC_ENCODING_FOR_INPUT_FILE_NAME'} = 0;
}

# defaults for options relevant in the main program. Also used as
# defaults for all the converters.
my $main_program_default_options = {
  %$main_program_set_options,
  %Texinfo::Common::default_main_program_customization_options,
};

# determine configuration directories.

# used as part of binary strings
my $conf_file_name = 'Config' ;

# directories for texinfo configuration files, used as part of binary strings.
my @language_config_dirs = File::Spec->catdir($curdir, '.texinfo');
push @language_config_dirs, File::Spec->catdir($ENV{'HOME'}, '.texinfo') 
                                if (defined($ENV{'HOME'}));
push @language_config_dirs, File::Spec->catdir($sysconfdir, 'texinfo') 
                               if (defined($sysconfdir));
push @language_config_dirs, File::Spec->catdir($datadir, 'texinfo') 
                               if (defined($datadir));
my @texinfo_config_dirs = ($curdir, @language_config_dirs);

# these variables are used as part of binary strings.
my @program_config_dirs;
my @program_init_dirs;

my $program_name = 'texi2any';
@program_config_dirs = ($curdir, File::Spec->catdir($curdir, ".$program_name"));
push @program_config_dirs, File::Spec->catdir($ENV{'HOME'}, ".$program_name")
       if (defined($ENV{'HOME'}));
push @program_config_dirs, File::Spec->catdir($sysconfdir, $program_name) 
       if (defined($sysconfdir));
push @program_config_dirs, File::Spec->catdir($datadir, $program_name) 
  if (defined($datadir));

@program_init_dirs = @program_config_dirs;
foreach my $texinfo_config_dir (@language_config_dirs) {
  push @program_init_dirs, File::Spec->catdir($texinfo_config_dir, 'init');
}

sub _decode_i18n_string($$)
{
  my $string = shift;
  my $encoding = shift;
  return decode($encoding, $string);
}

sub _encode_message($)
{
  my $text = shift;
  my $encoding = get_conf('MESSAGE_ENCODING');
  if (defined($encoding)) {
    return encode($encoding, $text);
  } else {
    return $text;
  }
}

sub document_warn($) {
  return if (get_conf('NO_WARN'));
  my $text = shift;
  chomp ($text);
  warn(_encode_message(
       sprintf(__p("program name: warning: warning_message", 
                   "%s: warning: %s\n"), $real_command_name, $text)));
}

sub _decode_input($)
{
  my $text = shift;

  my $encoding = get_conf('COMMAND_LINE_ENCODING');
  if (defined($encoding)) {
    return decode($encoding, $text);
  } else {
    return $text;
  }
}

# arguments are binary strings.
sub locate_and_load_init_file($$)
{
  my $filename = shift;
  my $directories = shift;

  my $file = Texinfo::Common::locate_init_file($filename, $directories, 0);
  if (defined($file)) {
    # evaluate the code in the Texinfo::Config namespace
    Texinfo::Config::GNUT_load_init_file($file);
  } else {
    document_warn(sprintf(__("could not read init file %s"),
                          _decode_input($filename)));
  }
}

sub set_from_cmdline($$) {
  return &Texinfo::Config::GNUT_set_from_cmdline(@_);
}

sub set_main_program_default($$) {
  return &Texinfo::Config::GNUT_set_main_program_default(@_);
}

sub get_conf($) {
  return &Texinfo::Config::texinfo_get_conf(@_);
}

sub add_to_option_list($$) {
  return &Texinfo::Config::texinfo_add_to_option_list(@_);
}

sub remove_from_option_list($$) {
  return &Texinfo::Config::texinfo_remove_from_option_list(@_);
}

my @input_file_suffixes = ('.txi','.texinfo','.texi','.txinfo','');

my @texi2dvi_args = ();

# this associates the command line options to the arrays set during
# command line parsing.
my @css_files = ();
my @css_refs = ();
my @include_dirs = ();
my @expanded_formats = ();
# note that CSS_FILES and INCLUDE_DIRECTORIES are not decoded when
# read from the command line and should be binary strings
my $cmdline_options = { 'CSS_FILES' => \@css_files,
                        'CSS_REFS' => \@css_refs,
                        'INCLUDE_DIRECTORIES' => \@include_dirs,
                        'EXPANDED_FORMATS' => \@expanded_formats };

my $format = 'info';
# this is the format associated with the output format, which is replaced
# when the output format changes.  It may also be removed if there is the
# corresponding --no-ifformat.
my $default_expanded_format = [ $format ];
my @conf_dirs = ();
my @prepend_dirs = ();

# The $cmdline_options passed to Texinfo::Config::GNUT_initialize_config
# are considered to be arrays in which items can be added or deleted both
# from the command line and from init files.  $cmdline_options text values
# are set by GNUT_set_from_cmdline (aliased as set_from_cmdline) from the
# main program.  $cmdline_options are also accessed in main program.
# $init_files_options are managed by Texinfo::Config, set by
# texinfo_set_from_init_file in init files.
#
# There is in addition $parser_options for parser related information
# that is not gathered otherwise.
# The configuration values are later on copied over to the parser if
# they are parser options.
my $parser_options = {'values' => {'txicommandconditionals' => 1}};

my $init_files_options = Texinfo::Config::GNUT_initialize_config(
      $real_command_name, $main_program_default_options, $cmdline_options);

# FIXME should we reset the messages encoding if 'COMMAND_LINE_ENCODING'
# is reset?
my $messages_encoding = get_conf('COMMAND_LINE_ENCODING');
if (defined($messages_encoding) and $messages_encoding ne 'us-ascii') {
  my $Encode_encoding_object = find_encoding($messages_encoding);
  my $perl_messages_encoding = $Encode_encoding_object->name();
  Locale::Messages::bind_textdomain_codeset($messages_textdomain,
                                            $messages_encoding);
  if ($perl_messages_encoding) {
    Locale::Messages::bind_textdomain_filter($messages_textdomain,
                          \&_decode_i18n_string, $perl_messages_encoding);
  }
}

# read initialization files.  Better to do that after
# Texinfo::Config::GNUT_initialize_config() in case loaded
# files replace default options.
foreach my $file (Texinfo::Common::locate_init_file($conf_file_name,
                  [ reverse(@program_config_dirs) ], 1)) {
  Texinfo::Config::GNUT_load_init_file($file);
}

sub set_expansion($$) {
  my $region = shift;
  my $set = shift;
  $set = 1 if (!defined($set));
  if ($set) {
    add_to_option_list('EXPANDED_FORMATS', [$region]);
  } else {
    remove_from_option_list('EXPANDED_FORMATS', [$region]);
    @{$default_expanded_format} 
       = grep {$_ ne $region} @{$default_expanded_format};
  }
}

my $format_from_command_line = 0;

my %format_command_line_names = (
  'xml' => 'texinfoxml',
);

my %formats_table = (
 'info' => {
             'nodes_tree' => 1,
             'floats' => 1,
             'module' => 'Texinfo::Convert::Info'
           },
  'plaintext' => {
             'nodes_tree' => 1,
             'floats' => 1,
             'split' => 1,
             'module' => 'Texinfo::Convert::Plaintext'
           },
  'html' => {
             'nodes_tree' => 1,
             'floats' => 1,
             'split' => 1,
             'internal_links' => 1,
             'simple_menu' => 1,
             'joint_transformation' => 1,
             'no_warn_non_empty_parts' => 1,
             'module' => 'Texinfo::Convert::HTML'
           },
  'latex' => {
             'floats' => 1,
             'internal_links' => 1,
             'joint_transformation' => 1,
             'no_warn_non_empty_parts' => 1,
             'module' => 'Texinfo::Convert::LaTeX'
           },
  'texinfoxml' => {
             'nodes_tree' => 1,
             'module' => 'Texinfo::Convert::TexinfoXML',
             'floats' => 1,
           },
  'texinfosxml' => {
             'nodes_tree' => 1,
             'module' => 'Texinfo::Convert::TexinfoSXML',
             'floats' => 1,
           },
  'ixinsxml' => {
             'nodes_tree' => 1,
             'module' => 'Texinfo::Convert::IXINSXML'
           },
  'docbook' => {
             'move_index_entries_after_items' => 1,
             'no_warn_non_empty_parts' => 1,
             'module' => 'Texinfo::Convert::DocBook'
           },
  'pdf' => {
             'texi2dvi_format' => 1,
           },
  'ps' =>  {
             'texi2dvi_format' => 1,
           },
  'dvi' => {
             'texi2dvi_format' => 1,
           },
  'dvipdf' => {
             'texi2dvi_format' => 1,
           },
  'debugtree' => {
          'split' => 1,
          'module' => 'DebugTexinfo::DebugTree'
         },
  'textcontent' => {
            'module' => 'Texinfo::Convert::TextContent'
           },
  'rawtext' => {
            'module' => 'Texinfo::Convert::Text'
           },
  'plaintexinfo' => {
            'module' => 'Texinfo::Convert::PlainTexinfo'
           },
  'parse' => {
           },
  'structure' => {
             'nodes_tree' => 1,
             'floats' => 1,
             'split' => 1,
           },
);

my $call_texi2dvi = 0;

# previous_format should be in argument if there is a possibility of error.
# as a fallback, the $format global variable is used.
sub set_format($;$$)
{
  my $set_format = shift;
  my $previous_format = shift;
  $previous_format = $format if (!defined($previous_format));
  my $do_not_override_command_line = shift;

  my $new_format;
  if ($format_command_line_names{$set_format}) {
    $new_format = $format_command_line_names{$set_format};
  } else {
    $new_format = $set_format;
  }
  my $expanded_format = $set_format;
  if (!$formats_table{$new_format}) {
    document_warn(sprintf(__("ignoring unrecognized TEXINFO_OUTPUT_FORMAT value `%s'\n"), 
                 $new_format));
    $new_format = $previous_format;
  } else {
    if ($format_from_command_line and $do_not_override_command_line) {
      $new_format = $previous_format;
    } else {
      if ($formats_table{$new_format}->{'texi2dvi_format'}) {
        $call_texi2dvi = 1;
        push @texi2dvi_args, '--'.$new_format; 
        $expanded_format = 'tex';
      }
      if ($Texinfo::Common::texinfo_output_formats{$expanded_format}) {
        if ($expanded_format eq 'plaintext') {
          $default_expanded_format = [$expanded_format, 'info'] 
        } else {
          $default_expanded_format = [$expanded_format] 
        }
      }
      $format_from_command_line = 1
        unless ($do_not_override_command_line);
    }
  }
  return $new_format;
}

sub _exit($$)
{
  my $error_count = shift;
  my $opened_files = shift;

  if ($error_count and $opened_files and !get_conf('FORCE')) {
    while (@$opened_files) {
      my $opened_file = shift (@$opened_files);
      unlink ($opened_file);
    }
  }
  exit (1) if ($error_count and (!get_conf('FORCE')
     or $error_count > get_conf('ERROR_LIMIT')));
}

sub handle_errors($$$)
{
  my $self = shift;
  my $error_count = shift;
  my $opened_files = shift;

  my ($errors, $new_error_count) = $self->errors();
  $error_count += $new_error_count if ($new_error_count);
  foreach my $error_message (@$errors) {
    if ($error_message->{'type'} eq 'error' or !get_conf('NO_WARN')) {
      my $s = '';
      if ($error_message->{'file_name'}) {
        my $file = $error_message->{'file_name'};

        if (get_conf('TEST')) {
          # otherwise out of source build fail since the file names
          # are different
          my ($directories, $suffix);
          ($file, $directories, $suffix) = fileparse($file);
        }
        $s .= "$file:";
      }
      if (defined($error_message->{'line_nr'})) {
        $s .= $error_message->{'line_nr'} . ':';
      }
      $s .= ' ' if ($s ne '');

      $s .= _encode_message($error_message->{'error_line'});
      warn $s;
    }
  }
  
  _exit($error_count, $opened_files);
  return $error_count;
}


sub _get_converter_default($)
{
  my $option = shift;
  if (defined($Texinfo::Common::default_converter_command_line_options{$option})) {
    return $Texinfo::Common::default_converter_command_line_options{$option};
  } elsif (defined($Texinfo::Common::document_settable_multiple_at_commands{$option})) {
    return $Texinfo::Common::document_settable_multiple_at_commands{$option};
  } #elsif (defined(%Texinfo::Common::document_settable_unique_at_commands{$option})) {
  #  return $Texinfo::Common::document_settable_unique_at_commands{$option};
  #}
  return undef;
}

# translation related todo to be done when the string change anyway to
# avoid requiring translation
sub makeinfo_help()
{
  # TODO: avoid \n in translated strings.  Report from Benno Schulenberg
  my $makeinfo_help =
    sprintf(__("Usage: %s [OPTION]... TEXINFO-FILE...\n"),
    $real_command_name . $command_suffix)
."\n".
__("Translate Texinfo source documentation to various other formats, by default
Info files suitable for reading online with Emacs or standalone GNU Info.

This program is commonly installed as both `makeinfo' and `texi2any';
the behavior is identical, and does not depend on the installed name.\n")
."\n";
  # TODO: avoid \n in translated strings, split each option in a translatable
  # string.  Report from Benno Schulenberg
  $makeinfo_help .= sprintf(__("General options:
      --document-language=STR locale to use in translating Texinfo keywords
                                for the output document (default C).
      --error-limit=NUM       quit after NUM errors (default %d).
      --force                 preserve output even if errors.
      --help                  display this help and exit.
      --no-validate           suppress node cross-reference validation.
      --no-warn               suppress warnings (but not errors).
      --conf-dir=DIR          search also for initialization files in DIR.
      --init-file=FILE        load FILE to modify the default behavior.
  -c, --set-customization-variable VAR=VAL  set customization variable VAR 
                                to value VAL.
  -v, --verbose               explain what is being done.
      --version               display version information and exit.\n"),
    get_conf('ERROR_LIMIT'))
."\n";
  $makeinfo_help .= __("Output format selection (default is to produce Info):")."\n"
.__("      --docbook               output Docbook XML rather than Info.")."\n"
.__("      --html                  output HTML rather than Info.")."\n"
.__("      --latex                 output LaTeX rather than Info.")."\n"
.__("      --plaintext             output plain text rather than Info.")."\n"
.__("      --xml                   output Texinfo XML rather than Info.")."\n"
.__("      --dvi, --dvipdf, --ps, --pdf  call texi2dvi to generate given output,
                                after checking validity of TEXINFO-FILE.")."\n"
."\n";

  $makeinfo_help .= __("General output options:")."\n"
.__(
"  -E, --macro-expand=FILE     output macro-expanded source to FILE,
                                ignoring any \@setfilename.")."\n"
.__(
"      --no-headers            suppress node separators, Node: lines, and menus
                                from Info output (thus producing plain text)
                                or from HTML (thus producing shorter output).
                                Also, if producing Info, write to
                                standard output by default.")."\n"
.__(
"      --no-split              suppress any splitting of the output;
                                generate only one output file.")."\n"
.__(
"      --[no-]number-sections  output chapter and sectioning numbers;
                                default is on.")."\n"
.__(
"  -o, --output=DEST           output to DEST.
                                With split output, create DEST as a directory
                                and put the output files there.
                                With non-split output, if DEST is already
                                a directory or ends with a /,
                                put the output file there.
                                Otherwise, DEST names the output file.")."\n"
.__(
"      --disable-encoding      do not output accented and special characters
                                in Info output based on document encoding.")."\n"
.__(
"      --enable-encoding       based on document encoding, output accented
                                characters in XML-based output as well as
                                special characters in HTML instead of
                                entities.")."\n"
."\n";
  $makeinfo_help .= sprintf(__("Options for Info and plain text:")."\n"
.__(
"      --fill-column=NUM       break Info lines at NUM columns (default %d).")."\n"
.__(
"      --footnote-style=STYLE  output footnotes in Info according to STYLE:
                                `separate' to put them in their own node;
                                `end' to put them at the end of the node, in
                                which they are defined (this is the default).")."\n"
.__(
"      --paragraph-indent=VAL  indent Info paragraphs by VAL spaces (default %d).
                                If VAL is `none', do not indent; if VAL is
                                `asis', preserve existing indentation.")."\n"
.__(
"      --split-size=NUM        split Info files at size NUM (default %d).")."\n"
."\n".
    _get_converter_default('FILLCOLUMN'),
    _get_converter_default('paragraphindent'), 
    _get_converter_default('SPLIT_SIZE'))
."\n";
  # TODO: avoid \n in translated strings, split each option in a translatable
  # string.  Report from Benno Schulenberg
  $makeinfo_help .= __("Options for HTML:
      --css-include=FILE      include FILE in HTML <style> output;
                                read stdin if FILE is -.
      --css-ref=URL           generate CSS reference to URL.
      --internal-links=FILE   produce list of internal links in FILE.
      --split=SPLIT           split at SPLIT, where SPLIT may be `chapter',
                                `section' or `node'.
      --transliterate-file-names  use file names in ASCII transliteration.
      --node-files            produce redirection files for nodes and 
                                anchors; default is set only if split.\n")
."\n";
  # TODO: avoid \n in translated strings.  Report from Benno Schulenberg
  $makeinfo_help .= __("Options for XML and Docbook:
      --output-indent=VAL     does nothing, retained for compatibility.\n")
."\n";
  $makeinfo_help .= __("Options for DVI/PS/PDF:
      --Xopt=OPT              pass OPT to texi2dvi; can be repeated.\n")
."\n";
  # TODO: avoid \n in translated strings, split each option in a translatable
  # string.  Report from Benno Schulenberg
  $makeinfo_help .= __("Input file options:
      --commands-in-node-names  does nothing, retained for compatibility.
  -D VAR                        define the variable VAR, as with \@set.
  -D 'VAR VAL'                  define VAR to VAL (one shell argument).
  -I DIR                        append DIR to the \@include search path.
  -P DIR                        prepend DIR to the \@include search path.
  -U VAR                        undefine the variable VAR, as with \@clear.\n")
."\n";
  $makeinfo_help .= __("Conditional processing in input:")."\n"
.__("  --ifdocbook       process \@ifdocbook and \@docbook even if
                      not generating Docbook.")."\n"
.__("  --ifhtml          process \@ifhtml and \@html even if not generating HTML.")."\n"
.__("  --ifinfo          process \@ifinfo even if not generating Info.")."\n"
.__("  --iflatex         process \@iflatex and \@latex.")."\n"
.__("  --ifplaintext     process \@ifplaintext even if not generating plain text.")."\n"
.__("  --iftex           process \@iftex and \@tex.")."\n"
.__("  --ifxml           process \@ifxml and \@xml.")."\n"
.__("  --no-ifdocbook    do not process \@ifdocbook and \@docbook text.")."\n"
.__("  --no-ifhtml       do not process \@ifhtml and \@html text.")."\n"
.__("  --no-ifinfo       do not process \@ifinfo text.")."\n"
.__("  --no-iflatex      do not process \@iflatex and \@latex text.")."\n"
.__("  --no-ifplaintext  do not process \@ifplaintext text.")."\n"
.__("  --no-iftex        do not process \@iftex and \@tex text.")."\n"
.__("  --no-ifxml        do not process \@ifxml and \@xml text.")."\n"
."\n"
.__("  Also, for the --no-ifFORMAT options, do process \@ifnotFORMAT text.")."\n"
."\n";
  # TODO: avoid \n in translated strings, split each option in a translatable
  # string.  Report from Benno Schulenberg
  $makeinfo_help .= __("  The defaults for the \@if... conditionals depend on the output format:
  if generating Docbook, --ifdocbook is on and the others are off;
  if generating HTML, --ifhtml is on and the others are off;
  if generating Info, --ifinfo is on and the others are off;
  if generating plain text, --ifplaintext is on and the others are off;
  if generating LaTeX, --iflatex is on and the others are off;
  if generating XML, --ifxml is on and the others are off.")."\n"
."\n";
  # TODO: avoid \n in translated strings, split each option in a translatable
  # string.  Report from Benno Schulenberg
  $makeinfo_help .= __("Examples:
  makeinfo foo.texi                      write Info to foo's \@setfilename
  makeinfo --html foo.texi               write HTML to \@setfilename
  makeinfo --xml foo.texi                write Texinfo XML to \@setfilename
  makeinfo --docbook foo.texi            write Docbook XML to \@setfilename
  makeinfo --plaintext foo.texi          write plain text to standard output
  makeinfo --pdf foo.texi                write PDF using texi2dvi

  makeinfo --html --no-headers foo.texi  write html without node lines, menus
  makeinfo --number-sections foo.texi    write Info with numbered sections
  makeinfo --no-split foo.texi           write one Info file however big\n")
."\n";
  $makeinfo_help .= __("Email bug reports to bug-texinfo\@gnu.org,
general questions and discussion to help-texinfo\@gnu.org.
Texinfo home page: http://www.gnu.org/software/texinfo/") ."\n";
  return $makeinfo_help;
}

my %non_decoded_customization_variables;
foreach my $variable_name ('MACRO_EXPAND', 'INTERNAL_LINKS') {
  $non_decoded_customization_variables{$variable_name} = 1;
}

my $Xopt_arg_nr = 0;

my $result_options = Getopt::Long::GetOptions (
 'help|h' => sub { print _encode_message(makeinfo_help()); exit 0; },
 'version|V' => sub {
    print _encode_message("$program_name (GNU texinfo) $configured_version\n\n");
    print _encode_message(sprintf __("Copyright (C) %s Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.\n"), "2021");
      exit 0;},
 'macro-expand|E=s' => sub { set_from_cmdline('MACRO_EXPAND', $_[1]); },
 'ifhtml!' => sub { set_expansion('html', $_[1]); },
 'ifinfo!' => sub { set_expansion('info', $_[1]); },
 'ifxml!' => sub { set_expansion('xml', $_[1]); },
 'ifdocbook!' => sub { set_expansion('docbook', $_[1]); },
 'iftex!' => sub { set_expansion('tex', $_[1]); },
 'ifplaintext!' => sub { set_expansion('plaintext', $_[1]); },
 'I=s' => sub { push @texi2dvi_args, ('-'.$_[0], $_[1]);
                push @include_dirs, split(/$quoted_path_separator/, $_[1]); },
 'conf-dir=s' => sub { push @conf_dirs, split(/$quoted_path_separator/, $_[1]); },
 'P=s' => sub { unshift @prepend_dirs, split(/$quoted_path_separator/, $_[1]); },
 'number-sections!' => sub { set_from_cmdline('NUMBER_SECTIONS', $_[1]); },
 'number-footnotes!' => sub { set_from_cmdline('NUMBER_FOOTNOTES', $_[1]); },
 'node-files!' => sub { set_from_cmdline('NODE_FILES', $_[1]); },
 'footnote-style=s' => sub {
    my $value = _decode_input($_[1]);
    if ($value eq 'end' or $value eq 'separate') {
       set_from_cmdline('footnotestyle', $value);
    } else {
      die _encode_message(
           sprintf(__("%s: --footnote-style arg must be `separate' or `end', not `%s'.\n"),
                  $real_command_name, $value));
    }
  },
 'split=s' => sub {  my $split = _decode_input($_[1]);
                     my @messages 
                       = Texinfo::Common::warn_unknown_split($split);
                     if (@messages) {
                       foreach my $message (@messages) {
                         document_warn($message);
                       }
                       $split = 'node';
                     }
                     set_from_cmdline('SPLIT', $split); },
 'no-split' => sub { set_from_cmdline('SPLIT', ''); 
                     set_from_cmdline('SPLIT_SIZE', undef);},
 'headers!' => sub { set_from_cmdline('HEADERS', $_[1]);
                     if (!$_[1]) {
                       set_from_cmdline('FORMAT_MENU', 'nomenu');
                     } else {
                       # a special value that is modified below when the
                       # output format is known, to be the default for that
                       # format, or 'menu'
                       set_from_cmdline('FORMAT_MENU', 'set_format_menu_from_cmdline_header');
                     }
                     $format = 'plaintext' if (!$_[1] and $format eq 'info'); },
 'output|out|o=s' => sub {
    my $var = 'OUTFILE';
    if ($_[1] =~ m:/$: or -d $_[1]) {
      set_from_cmdline($var, undef);
      $var = 'SUBDIR';
    }
    set_from_cmdline($var, _decode_input($_[1]));
    push @texi2dvi_args, '-o', $_[1];
  },
 'no-validate|no-pointer-validate' => sub {
      set_from_cmdline('novalidate',$_[1]);
    },
 'no-warn' => sub { set_from_cmdline('NO_WARN', $_[1]); },
 'verbose|v!' => sub {set_from_cmdline('VERBOSE', $_[1]); 
                     push @texi2dvi_args, '--verbose'; },
 'document-language=s' => sub {
                      my $documentlanguage = _decode_input($_[1]);
                      set_from_cmdline('documentlanguage', $documentlanguage);
                      my @messages 
                       = Texinfo::Common::warn_unknown_language($documentlanguage);
                      foreach my $message (@messages) {
                        document_warn($message);
                      }
                    },
 'D=s' => sub {
    my $var = $_[1];
    my @field = split (/\s+/, $var, 2);
    if (@field == 1) {
      $parser_options->{'values'}->{_decode_input($var)} = 1;
      push @texi2dvi_args, "--command=\@set $var 1";
    } else {
      $parser_options->{'values'}->{_decode_input($field[0])}
           = _decode_input($field[1]);
      push @texi2dvi_args, "--command=\@set $field[0] $field[1]";
    }
 },
 'U=s' => sub {
    delete $parser_options->{'values'}->{_decode_input($_[1])};
    push @texi2dvi_args, "--command=\@clear $_[1]";
 },
 'init-file=s' => sub {
    locate_and_load_init_file($_[1], [ @conf_dirs, @program_init_dirs ]);
 },
 'set-customization-variable|c=s' => sub {
   my $var_val;
   if ($non_decoded_customization_variables{$_[1]}) {
     $var_val = $_[1];
   } else {
     $var_val = _decode_input($_[1]);
   }
   if ($var_val =~ s/^(\w+)\s*=?\s*//) {
     my $var = $1;
     my $value = $var_val;
     if ($value =~ /^undef$/i) {
       $value = undef;
     }
     set_from_cmdline($var, $value);
   }
 },
 'css-include=s' => \@css_files,
 'css-ref=s' => \@css_refs,
 'transliterate-file-names!' => 
     sub {set_from_cmdline('TRANSLITERATE_FILE_NAMES', $_[1]);},
 'error-limit|e=i' => sub { set_from_cmdline('ERROR_LIMIT', $_[1]); },
 'split-size=s' => sub {set_from_cmdline('SPLIT_SIZE', $_[1])},
 'paragraph-indent|p=s' => sub {
    my $value = _decode_input($_[1]);
    if ($value =~ /^([0-9]+)$/ or $value eq 'none' or $value eq 'asis') {
      set_from_cmdline('paragraphindent', $value);
    } else {
      die _encode_message(sprintf(
       __("%s: --paragraph-indent arg must be numeric/`none'/`asis', not `%s'.\n"),
                  $real_command_name, $value));
    }
 },
 'fill-column|f=i' => sub {set_from_cmdline('FILLCOLUMN',$_[1]);},
 'enable-encoding' => sub {set_from_cmdline('ENABLE_ENCODING',$_[1]);
                     },
 'disable-encoding' => sub {set_from_cmdline('ENABLE_ENCODING', 0);
                     },
 'internal-links=s' => sub {set_from_cmdline('INTERNAL_LINKS', $_[1]);},
 'force|F' => sub {set_from_cmdline('FORCE', $_[1]);},
 'commands-in-node-names' => sub { ;},
 'output-indent=i' => sub { ;},
 'reference-limit=i' => sub { ;},
 'Xopt=s' => sub {push @texi2dvi_args, $_[1]; $Xopt_arg_nr++},
 'silent|quiet' => sub { push @texi2dvi_args, '--'.$_[0];},
 'plaintext' => sub {$format = set_format($_[0].'');},
 'html' => sub {$format = set_format($_[0].'');},
 'latex' => sub {$format = set_format($_[0].'');},
 'info' => sub {$format = set_format($_[0].'');},
 'docbook' => sub {$format = set_format($_[0].'');},
 'xml' => sub {$format = set_format($_[0].'');},
 'dvi' => sub {$format = set_format($_[0].'');},
 'dvipdf' => sub {$format = set_format($_[0].'');},
 'ps' => sub {$format = set_format($_[0].'');},
 'pdf' => sub {$format = set_format($_[0].'');},
 'debug=i' => sub {set_from_cmdline('DEBUG', $_[1]); 
                   push @texi2dvi_args, '--'.$_[0]; },
);



exit 1 if (!$result_options);

# those are strings combined with output so decode
my $ref_css_refs = get_conf('CSS_REFS');
my @input_css_refs = @{$ref_css_refs};
@$ref_css_refs = map {_decode_input($_)} @input_css_refs;

# Change some options depending on the settings of other ones set formats
sub process_config {
  my $conf = shift;

  if (defined($conf->{'TEXINFO_OUTPUT_FORMAT'})) {
    $format = set_format($conf->{'TEXINFO_OUTPUT_FORMAT'}, $format, 1);
  } elsif (defined($conf->{'TEXI2HTML'})) {
    $format = set_format('html', $format, 1);
    $parser_options->{'values'}->{'texi2html'} = 1;
  }
}

process_config($cmdline_options);

# The configuration API is setup such that the loading of init
# files can be done here and not in format specific code.  There is
# only one format, HTML, with use of complex customization (besides setting
# customization options), so maybe this would need to be revisited
# if another format uses complex customization.
my $latex2html_file = 'latex2html.pm';
if (defined($cmdline_options->{'HTML_MATH'})
      and $cmdline_options->{'HTML_MATH'} eq 'l2h') {
  locate_and_load_init_file($latex2html_file, 
                        [ @conf_dirs, @program_init_dirs ]);
}

my $tex4ht_file = 'tex4ht.pm';
if (defined($cmdline_options->{'HTML_MATH'})
      and $cmdline_options->{'HTML_MATH'} eq 't4h') {
  locate_and_load_init_file($tex4ht_file, 
                        [ @conf_dirs, @program_init_dirs ]);
}

# For tests, set some strings to values not changing with releases
my %test_conf = (
    'PACKAGE_VERSION' => '',
    'PACKAGE' => 'texinfo',
    'PACKAGE_NAME' => 'texinfo',
    'PACKAGE_AND_VERSION' => 'texinfo',
    'PACKAGE_URL' => 'http://www.gnu.org/software/texinfo/',
# maybe don't set this?
    'PROGRAM' => 'texi2any', 
);
if (get_conf('TEST')) {
  foreach my $conf (keys (%test_conf)) {
    $main_program_default_options->{$conf} = $test_conf{$conf};
  }
}


my %format_names = (
 'info' => 'Info',
 'html' => 'HTML',
 'docbook' => 'DocBook',
 'texinfoxml' => 'Texinfo XML',
 'plaintext' => 'Plain Text',
);

sub format_name($)
{
  my $format = shift;
  if ($format_names{$format}) {
    return $format_names{$format};
  } else {
    return $format;
  }
}

my $init_file_format = Texinfo::Config::GNUT_get_format_from_init_file();
if (defined($init_file_format)) {
  $format = set_format($init_file_format, $format, 1);
}

if (defined($ENV{'TEXINFO_OUTPUT_FORMAT'}) 
    and $ENV{'TEXINFO_OUTPUT_FORMAT'} ne '') {
  $format = set_format(_decode_input($ENV{'TEXINFO_OUTPUT_FORMAT'}),
                       $format, 1);
}

if ($call_texi2dvi) {
  if (defined(get_conf('OUTFILE')) and @ARGV > 1) {
    die sprintf(__('%s: when generating %s, only one input FILE may be specified with -o'."\n"),
                $real_command_name, format_name($format));
  }
} elsif($Xopt_arg_nr) {
  document_warn(__('--Xopt option without printed output')); 
}

require Texinfo::Parser;
require Texinfo::Structuring;
require Texinfo::Transformations;
# Avoid loading these modules until down here to speed up the case
# when they are not needed.

my %tree_transformations;
if (get_conf('TREE_TRANSFORMATIONS')) {
  my @transformations = split /,/, get_conf('TREE_TRANSFORMATIONS');
  foreach my $transformation (@transformations) {
    if (Texinfo::Common::valid_tree_transformation($transformation)) {
      $tree_transformations{$transformation} = 1;
    } else {
      document_warn(sprintf(__('unknown tree transformation %s'), 
                     $transformation));
    }
  }
}

if (get_conf('SPLIT') and !$formats_table{$format}->{'split'}) {
  document_warn(sprintf(__('ignoring splitting for format %s'), 
                        format_name($format)));
  set_from_cmdline('SPLIT', ''); 
}

add_to_option_list('EXPANDED_FORMATS', $default_expanded_format);

my $converter_class;
my %converter_defaults;

if (defined($formats_table{$format}->{'module'})) {
  # Speed up initialization by only loading the module we need.
  my $module = $formats_table{$format}->{'module'};
  eval "require $module" or die "$@";
  eval "$module->import;";

  eval '$formats_table{$format}->{\'converter\'} = sub{'.
                $formats_table{$format}->{'module'}
        .'->converter(@_)};';
}

# For now, FORMAT_MENU is the only variable that can be set from converter defaults
# for the main program structuring and for the parser.
# This could be done for more variables if
# converter default becomes relevant for more variables, either
# for the parser or the main program.

# Specific variable for 'FORMAT_MENU' to keep the converter information
# even if the command line higher precedence option is set in case
# command line is set_format_menu_from_cmdline_header.
my $conversion_format_menu_default;
if (defined($formats_table{$format}->{'module'})) {
  $converter_class = $formats_table{$format}->{'module'};
  # $cmdline_options is passed to have command line settings, here
  # in practice TEXI2HTML set, for conversion to HTML to select
  # possibly different customization variable values.
  %converter_defaults = $converter_class->converter_defaults($cmdline_options);
  $conversion_format_menu_default = undef;
  if (defined($converter_defaults{'FORMAT_MENU'})) {
    # could be done for other customization options
    set_main_program_default('FORMAT_MENU', $converter_defaults{'FORMAT_MENU'});
    # for FORMAT_MENU need in addition to have the value if
    # command-line set to 'set_format_menu_from_cmdline_header'
    $conversion_format_menu_default = $converter_defaults{'FORMAT_MENU'};
  } else {
    # this happens for the plaintexinfo format for which nothing
    # is set.
  }
}

# special case for FORMAT_MENU of delayed setting based in
# some case on converter
if (defined(get_conf('FORMAT_MENU'))
    and get_conf('FORMAT_MENU') eq 'set_format_menu_from_cmdline_header') {
   # set FORMAT_MENU to the output format default, if not nomenu
  if (defined($conversion_format_menu_default)
      and $conversion_format_menu_default ne 'nomenu') {
    set_from_cmdline('FORMAT_MENU', $conversion_format_menu_default);
  } else {
    set_from_cmdline('FORMAT_MENU', 'menu');
  }
}

# using no warnings is wrong, but a way to avoid a spurious warning.
no warnings 'once';
my @parser_settable_options = keys(%Texinfo::Common::default_parser_customization_values);
# Copy relevant customization variables into the parser options.
foreach my $parser_settable_option (@parser_settable_options) {
  if (defined(get_conf($parser_settable_option))) {
    $parser_options->{$parser_settable_option} 
       = get_conf($parser_settable_option);
  }
}

# special case, show all the built in HTML CSS rules and exit
if (get_conf('SHOW_BUILTIN_CSS_RULES')) {
  require Texinfo::Convert::HTML;
  print STDOUT Texinfo::Convert::HTML::builtin_default_css_text();
  exit(0);
}

# Main processing, process all the files given on the command line

# Note that the input file names are binary strings and are not decoded
my @input_files = @ARGV;
# use STDIN if not a tty, like makeinfo does
@input_files = ('-') if (!scalar(@input_files) and !-t STDIN);
die sprintf(__("%s: missing file argument.\n"), $real_command_name) 
   .sprintf(__("Try `%s --help' for more information.\n"), $real_command_name)
     unless (scalar(@input_files) >= 1);

my $file_number = -1;
my @opened_files = ();
my %unclosed_files;
my $error_count = 0;
# main processing
while(@input_files) {
  $file_number++;
  my $input_file_arg = shift(@input_files);
  my $input_file_name;
  # try to concatenate with different suffixes. The last suffix is ''
  # such that the plain file name is checked.
  foreach my $suffix (@input_file_suffixes) {
    if (-e $input_file_arg.$suffix) {
      $input_file_name = $input_file_arg.$suffix;
      last;
    }
  }
  # in case no file was found, still set the file name
  $input_file_name = $input_file_arg if (!defined($input_file_name));

  my ($input_filename, $input_directory, $suffix) = fileparse($input_file_name);
  if (!defined($input_directory) or $input_directory eq '') {
    $input_directory = $curdir;
  }

  my $input_file_base = $input_file_name;
  $input_file_base =~ s/\.te?x(i|info)?$//;

  # a shallow copy is not sufficient for arrays and hashes to make
  # sure that the $parser_options are not modified if $parser_file_options
  # are modified
  my $parser_file_options = Storable::dclone($parser_options);

  my @prepended_include_directories = ('.');
  push @prepended_include_directories, $input_directory
      if ($input_directory ne '.');
  @prepended_include_directories =
    (@prepend_dirs, @prepended_include_directories);

  unshift @{$parser_file_options->{'INCLUDE_DIRECTORIES'}},
          @prepended_include_directories;

  my $parser = Texinfo::Parser::parser($parser_file_options);
  my $tree = $parser->parse_texi_file($input_file_name);

  if (defined($tree)
      and (defined(get_conf('DUMP_TREE')) 
           or (get_conf('DEBUG') and get_conf('DEBUG') >= 10))) {
    # this is very wrong, but a way to avoid a spurious warning.
    no warnings 'once';
    local $Data::Dumper::Purity = 1;
    no warnings 'once';
    local $Data::Dumper::Indent = 1;
    print STDERR Data::Dumper->Dump([$tree]);
  }
  # object registering errors and warnings
  my $registrar = $parser->registered_errors();
  if (!defined($tree) or $format eq 'parse') {
    handle_errors($registrar, $error_count, \@opened_files);
    next;
  }


  if ($tree_transformations{'fill_gaps_in_sectioning'}) {
    my ($filled_contents, $added_sections) 
      = Texinfo::Transformations::fill_gaps_in_sectioning($tree);
    if (!defined($filled_contents)) {
      document_warn(__("fill_gaps_in_sectioning transformation return no result. No section?"));
    } else {
      $tree->{'contents'} = $filled_contents;
    }
  }

  my ($labels, $targets_list, $nodes_list) = $parser->labels_information();
  if ((get_conf('SIMPLE_MENU')
       and $formats_table{$format}->{'simple_menu'})
      or $tree_transformations{'simple_menus'}) {
    Texinfo::Transformations::set_menus_to_simple_menu($nodes_list);
  }

  # setup a configuration object which defines get_conf and gives the same as
  # get_conf() in main program.  It is for Structuring/Transformations methods
  # needing access to the configuration information.
  my $main_configuration = Texinfo::MainConfig::new();

  my $parser_information = $parser->global_information();
  my $input_perl_encoding;
  if (defined($parser_information->{'input_perl_encoding'})) {
    $input_perl_encoding = $parser_information->{'input_perl_encoding'};
  }
  # encoding is needed for output files
  # encoding and documentlanguage are needed for gdt() in regenerate_master_menu
  Texinfo::Common::set_output_encodings($main_configuration, $parser_information);
  my $global_commands = $parser->global_commands_information();
  if (not defined($main_configuration->get_conf('documentlanguage'))) {
    my $element = Texinfo::Common::set_global_document_command($main_configuration,
       $global_commands, 'documentlanguage', 'preamble');
  }
  # relevant for many Structuring methods.
  if ($global_commands->{'novalidate'}) {
    $main_configuration->set_conf('novalidate', 1);
  }

  if (defined(get_conf('MACRO_EXPAND')) and $file_number == 0) {
    require Texinfo::Convert::Texinfo;
    my $texinfo_text = Texinfo::Convert::Texinfo::convert_to_texinfo($tree);
    #print STDERR "$texinfo_text\n";
    my $encoded_macro_expand_file_name = get_conf('MACRO_EXPAND');
    my $macro_expand_file_name = _decode_input($encoded_macro_expand_file_name);
    my $macro_expand_files_information = {};
    my $macro_expand_fh = Texinfo::Common::output_files_open_out(
          $macro_expand_files_information, $main_configuration,
          $encoded_macro_expand_file_name);
    my $error_macro_expand_file;
    if (defined($macro_expand_fh)) {
      print $macro_expand_fh $texinfo_text;
      Texinfo::Common::output_files_register_closed($macro_expand_files_information,
                                                    $encoded_macro_expand_file_name);
      if (!close($macro_expand_fh)) {
        document_warn(sprintf(__("error on closing macro expand file %s: %s\n"), 
                              $macro_expand_file_name, $!));
        $error_macro_expand_file = 1;
      }
    } else {
      document_warn(sprintf(__("could not open %s for writing: %s\n"), 
                            $macro_expand_file_name, $!));
      $error_macro_expand_file = 1;
    }
    push @opened_files, Texinfo::Common::output_files_opened_files(
                                      $macro_expand_files_information);
    # we do not need to go through unclosed files of
    # $macro_expand_files_information as we know that the file is
    # already closed if needed.

    if ($error_macro_expand_file) {
      $error_count++;
      _exit($error_count, \@opened_files);
    }
  }
  if (get_conf('DUMP_TEXI') or $formats_table{$format}->{'texi2dvi_format'}) {
    handle_errors($registrar, $error_count, \@opened_files);
    next;
  }

  if ($formats_table{$format}->{'move_index_entries_after_items'}
      or $tree_transformations{'move_index_entries_after_items'}) {
    Texinfo::Common::move_index_entries_after_items_in_tree($tree);
  }

  if ($formats_table{$format}->{'relate_index_entries_to_table_entries'}
      or $tree_transformations{'relate_index_entries_to_table_entries'}) {
    Texinfo::Common::relate_index_entries_to_table_entries_in_tree($tree);
  }

  if ($formats_table{$format}->{'joint_transformation'}) {
    Texinfo::Common::html_joint_transformation($tree);
  }

  if ($tree_transformations{'insert_nodes_for_sectioning_commands'}) {
    my ($modified_contents, $added_nodes)
     = Texinfo::Transformations::insert_nodes_for_sectioning_commands(
                              $tree, $nodes_list, $targets_list, $labels);
    if (!defined($modified_contents)) {
      document_warn(__(
       "insert_nodes_for_sectioning_commands transformation return no result. No section?"));
    } else {
      $tree->{'contents'} = $modified_contents;
    }
  }

  my $refs = $parser->internal_references_information();
  Texinfo::Structuring::associate_internal_references($registrar, 
                                                      $main_configuration,
                                        $parser_information, $labels, $refs);
  # information obtained through Texinfo::Structuring
  # and usefull in converters.
  # FIXME the keys are not documented anywhere.  It is unclear where they
  # should be documented.
  my $structure_information = {};
  # every format needs the sectioning structure
  my ($sectioning_root, $sections_list)
            = Texinfo::Structuring::sectioning_structure($registrar,
                                               $main_configuration, $tree);

  if ($sectioning_root) {
    $structure_information->{'sectioning_root'} = $sectioning_root;
    $structure_information->{'sections_list'} = $sections_list;
    if (!$formats_table{$format}->{'no_warn_non_empty_parts'}) {
      Texinfo::Structuring::warn_non_empty_parts($registrar, $main_configuration,
                                                 $global_commands);
    }
  }

  if ($tree_transformations{'complete_tree_nodes_menus'}) {
    Texinfo::Transformations::complete_tree_nodes_menus($tree);
  } elsif ($tree_transformations{'complete_tree_nodes_missing_menu'}) {
    Texinfo::Transformations::complete_tree_nodes_missing_menu($tree);
  }

  if ($tree_transformations{'regenerate_master_menu'}) {
    Texinfo::Transformations::regenerate_master_menu($main_configuration,
                                                     $labels);
  }

  # this can be done for every format, since information is already gathered
  my $floats = $parser->floats_information();

  my $top_node;
  if ($formats_table{$format}->{'nodes_tree'}) {

    # FIXME makes implicitely menu the default here.  'FORMAT_MENU'
    # not being set here happens rarely, when there is a format, but the
    # format does not define 'FORMAT_MENU' (case of plaintexinfo).
    if (not defined(get_conf('FORMAT_MENU'))
        or get_conf('FORMAT_MENU') eq 'menu') {
      Texinfo::Structuring::set_menus_node_directions($registrar,
               $main_configuration, $parser_information, $global_commands,
               $nodes_list, $labels);
    }
    $top_node = Texinfo::Structuring::nodes_tree($registrar, $main_configuration,
                                   $parser_information, $nodes_list, $labels);
    if (defined($top_node)) {
      $structure_information->{'top_node'} = $top_node;
    }
    if (not defined(get_conf('FORMAT_MENU'))
        or get_conf('FORMAT_MENU') eq 'menu') {
      if (defined($nodes_list)) {

        Texinfo::Structuring::complete_node_tree_with_menus($registrar,
                                 $main_configuration, $nodes_list, $top_node);
        Texinfo::Structuring::check_nodes_are_referenced($registrar,
                                    $main_configuration, $nodes_list, $top_node,
                                                     $labels, $refs);
      }
    }
  }
  if ($formats_table{$format}->{'floats'}) {
    Texinfo::Structuring::number_floats($floats);
  }

  $error_count = handle_errors($registrar, $error_count, \@opened_files);

  if ($format eq 'structure') {
    next;
  }
  # a shallow copy is not sufficient for arrays and hashes to make
  # sure that the $cmdline_options are not modified if $file_cmdline_options
  # are modified
  my $file_cmdline_options = Storable::dclone($cmdline_options);

  if ($file_number != 0) {
    delete $file_cmdline_options->{'OUTFILE'}
       if exists($file_cmdline_options->{'OUTFILE'});
    delete $file_cmdline_options->{'PREFIX'}
       if exists($file_cmdline_options->{'PREFIX'});
    delete $file_cmdline_options->{'SUBDIR'}
       if (exists($file_cmdline_options->{'SUBDIR'}) and get_conf('SPLIT'));
  }
  # the code in Texinfo::Config makes sure that the keys appear only
  # once in these three hashes.
  my $converter_options = { %$main_program_default_options,
                            %$init_files_options,
                            %$file_cmdline_options,
                          };

  # NOTE nothing set in $main_configuration is passed, which is
  # clean, the Converters can find that information their way.
  # It could be possible to pass some information if it allows
  # for instance to have some consistent information for Structuring
  # and Converters.
  $converter_options->{'parser'} = $parser;
  $converter_options->{'structuring'} = $structure_information;
  $converter_options->{'output_format'} = $format;
  $converter_options->{'language_config_dirs'} = \@language_config_dirs;
  unshift @{$converter_options->{'INCLUDE_DIRECTORIES'}},
          @prepended_include_directories;

  my $converter = &{$formats_table{$format}->{'converter'}}($converter_options);
  $converter->output($tree);
  push @opened_files, Texinfo::Common::output_files_opened_files(
                              $converter->output_files_information());
  handle_errors($converter, $error_count, \@opened_files);
  my $converter_unclosed_files
       = Texinfo::Common::output_files_unclosed_files(
                               $converter->output_files_information());
  if ($converter_unclosed_files) {
    foreach my $unclosed_file (keys(%$converter_unclosed_files)) {
      if ($unclosed_file eq '-') {
        $unclosed_files{$unclosed_file} 
          = $converter_unclosed_files->{$unclosed_file};
      } else {
        if (!close($converter_unclosed_files->{$unclosed_file})) {
          warn(sprintf(__("%s: error on closing %s: %s\n"), 
                           $real_command_name, $unclosed_file, $!));
          $error_count++;
          _exit($error_count, \@opened_files);
        }
      }
    }
  }
  
  if (defined(get_conf('INTERNAL_LINKS')) and $file_number == 0
      and $formats_table{$format}->{'internal_links'}) {
    my $internal_links_text 
      = $converter->output_internal_links();
    # always create a file, even if empty.
    $internal_links_text = '' if (!defined($internal_links_text));
    my $encoded_internal_links_file_name = get_conf('INTERNAL_LINKS');
    my $internal_links_file_name
        = _decode_input($encoded_internal_links_file_name);
    my $internal_links_files_information = {};
    my $internal_links_fh = Texinfo::Common::output_files_open_out(
                              $internal_links_files_information, $converter,
                                        $encoded_internal_links_file_name);
    my $error_internal_links_file;
    if (defined ($internal_links_fh)) {
      print $internal_links_fh $internal_links_text;
      
      if (!close ($internal_links_fh)) {
        warn(sprintf(__("%s: error on closing internal links file %s: %s\n"), 
                      $real_command_name, $internal_links_file_name, $!));
        $error_internal_links_file = 1;
      }
      Texinfo::Common::output_files_register_closed(
           $internal_links_files_information, $encoded_internal_links_file_name);
    } else {
      warn(sprintf(__("%s: could not open %s for writing: %s\n"), 
                      $real_command_name, $internal_links_file_name, $!));
      $error_internal_links_file = 1;
    }

    push @opened_files, Texinfo::Common::output_files_opened_files(
                                      $internal_links_files_information);
    # we do not need to go through unclosed files of
    # $internal_links_files_information as we know that the file is
    # already closed if needed.

    if ($error_internal_links_file) {
      $error_count++;
      _exit($error_count, \@opened_files);
    }
  }
  if (defined(get_conf('SORT_ELEMENT_COUNT')) and $file_number == 0) {
    require Texinfo::Convert::Converter;
    my $converter_element_count_file 
      = Texinfo::Convert::TextContent->converter($converter_options);
    my $use_sections = (! $formats_table{$format}->{'nodes_tree'}
                        or (defined($converter->get_conf('USE_NODES'))
                            and !$converter->get_conf('USE_NODES')));
    my ($sorted_name_counts_array, $sort_element_count_text)
        = Texinfo::Convert::Converter::sort_element_counts(
               $converter_element_count_file, $tree, $use_sections,
                             get_conf('SORT_ELEMENT_COUNT_WORDS'));

    my $sort_element_count_file_name = get_conf('SORT_ELEMENT_COUNT');
    my ($encoded_sort_element_count_file_name, $path_encoding)
       = Texinfo::Common::encode_file_name($main_configuration,
                                           $sort_element_count_file_name,
                                           $input_perl_encoding);
    my $sort_elem_files_information = {};
    # FIXME using $converter here for the configuration is
    # not right, should be changed by something not associated
    # with the converter but to the main program or file. parser
    # is not much better
    my $sort_element_count_fh = Texinfo::Common::output_files_open_out(
                               $sort_elem_files_information, $converter,
                                    $encoded_sort_element_count_file_name);
    my $error_sort_element_count_file;
    if (defined ($sort_element_count_fh)) {
      print $sort_element_count_fh $sort_element_count_text;
      
      if (!close ($sort_element_count_fh)) {
        warn(sprintf(__("%s: error on closing internal links file %s: %s\n"), 
                      $real_command_name, $sort_element_count_file_name, $!));
        $error_sort_element_count_file = 1;
      }
      Texinfo::Common::output_files_register_closed($sort_elem_files_information,
                                           $encoded_sort_element_count_file_name);
    } else {
      warn(sprintf(__("%s: could not open %s for writing: %s\n"), 
                    $real_command_name, $sort_element_count_file_name, $!));
      $error_sort_element_count_file = 1;
    }

    push @opened_files, Texinfo::Common::output_files_opened_files(
                                      $sort_elem_files_information);
    # we do not need to go through unclosed files of
    # $sort_elem_files_information as we know that the file is
    # already closed if needed.

    if ($error_sort_element_count_file) {
      $error_count++;
      _exit($error_count, \@opened_files);
    }
  }
}

foreach my $unclosed_file (keys(%unclosed_files)) {
  if (!close($unclosed_files{$unclosed_file})) {
    warn(sprintf(__("%s: error on closing %s: %s\n"), 
                     $real_command_name, $unclosed_file, $!));
    $error_count++;
    _exit($error_count, \@opened_files);
  }
}

if ($call_texi2dvi) {
  if (get_conf('DEBUG') or get_conf('VERBOSE')) {
    print STDERR "EXEC ".join('|', (get_conf('TEXI2DVI'), @texi2dvi_args, @ARGV)) 
       ."\n";
  }
  exec { get_conf('TEXI2DVI') } (get_conf('TEXI2DVI'), @texi2dvi_args, @ARGV);
}

1;
