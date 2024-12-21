/* teximakehtml.c -- simplistic conversion of Texinfo to HTML

   Copyright 2010-2024 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

#include <config.h>

#include <stdlib.h>
#include <stddef.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <ctype.h>
#include <stdarg.h>
#include <sys/stat.h>
#include <errno.h>
/* from Gnulib codeset.m4 */
#ifdef HAVE_LANGINFO_CODESET
#include <langinfo.h>
#endif
#include <locale.h>
#ifdef ENABLE_NLS
#include <libintl.h>
#endif
/* for pgettext and to have a definition of gettext in case ENABLE_NLS
   is not set */
#include "gettext.h"
#include <getopt.h>

#include "text.h"
#include "document_types.h"
#include "converter_types.h"
/* read_var_len */
#include "base_utils.h"
/* for xvasprintf */
#include "text.h"
/* parse_file_path whitespace_chars encode_string xasprintf */
#include "utils.h"
#include "customization_options.h"
#include "convert_to_texinfo.h"
#include "create_buttons.h"
/* needed because commands are used to determine expanded regions names */
#include "builtin_commands.h"
/* output_files_open_out output_files_register_closed */
#include "convert_utils.h"
/* destroy_converter_initialization_info */
#include "converter.h"
#include "texinfo.h"

#define LOCALEDIR DATADIR "/locale"

#define _(String) gettext (String)

typedef struct FORMAT_COMMAND_LINE_NAME {
    const char *command_line_name;
    const char *output_name;
} FORMAT_COMMAND_LINE_NAME;

static FORMAT_COMMAND_LINE_NAME format_command_line_names[] = {
 {"xml", "texinfoxml"},
 {NULL, NULL},
};

typedef struct FORMAT_REGION_NAME {
    const char *output_name;
    const char *region_name;
} FORMAT_REGION_NAME;

static FORMAT_REGION_NAME converter_format_expanded_region_name[] = {
  {"texinfoxml", "xml"},
  {NULL, NULL},
};

/* TODO for internal_links add a flag or set to a function called to do
        the internal links? */
typedef struct FORMAT_SPECIFICATION {
    const char *name;
    unsigned long flags;
    const char *converted_format;
} FORMAT_SPECIFICATION;

static FORMAT_SPECIFICATION formats_table[] = {
  {"html", STTF_relate_index_entries_to_table_items
           | STTF_move_index_entries_after_items
           | STTF_no_warn_non_empty_parts
           | STTF_nodes_tree | STTF_floats | STTF_split
           | STTF_setup_index_entries_sort_strings, NULL},
  {"parse", 0, NULL},
  {"structure", STTF_nodes_tree | STTF_floats | STTF_split, NULL},
  {NULL, 0, NULL}
};

static const char *expanded_formats[] = {"html", 0};
static VALUE values_array[] = {
  {"txicommandconditionals", "1"}
};
static const VALUE_LIST values = {1, 1, values_array};

/* options common to parser and converter */
static OPTIONS_LIST program_options;
static OPTIONS_LIST cmdline_options;
/* there are no init files in C, but this is used for the occasional
   customization variables set to an intermediate priority */
static OPTIONS_LIST init_files_options;

static char *program_file;

/* Texinfo::Config */
static OPTION *
get_conf (size_t number)
{
  if (option_number_in_option_list (&cmdline_options, number))
    return cmdline_options.sorted_options[number -1];

  if (option_number_in_option_list (&init_files_options, number))
    return init_files_options.sorted_options[number -1];

  if (option_number_in_option_list (&program_options, number))
    return program_options.sorted_options[number -1];

  return 0;
}

static char *
decode_input (char *text)
{
  OPTION *option
    = get_conf (program_options.options->COMMAND_LINE_ENCODING.number);
  if (option && option->o.string)
    {
      int status;
      char *result = decode_string (text, option->o.string, &status, 0);
      return result;
    }
  else
    return strdup (text);
}

static char *
encode_message (char *text)
{
  OPTION *option
    = get_conf (program_options.options->MESSAGE_ENCODING.number);
  if (option && option->o.string)
    {
      int status;
      char *result = encode_string (text, option->o.string, &status, 0);
      return result;
    }
  else
    return strdup (text);
}

static void
document_warn (const char *format, ...)
{
  char *message;
  char *encoded_message;
  char *formatted_message;
  OPTION *option
    = get_conf (program_options.options->NO_WARN.number);

  if (option && option->o.integer > 0)
    return;

  va_list v;

  va_start (v, format);

#ifdef ENABLE_NLS
  xvasprintf (&message, gettext (format), v);
#else
  xvasprintf (&message, format, v);
#endif
  if (!message) fatal ("vasprintf failed");

  va_end (v);

#ifdef ENABLE_NLS
  xasprintf (&formatted_message,
          pgettext ("program name: warning: warning_message",
                    "%s: warning: %s"), program_file, message);
#else
  xasprintf (&formatted_message, "%s: warning: %s",
                              program_file, message);
#endif
  if (!formatted_message) fatal ("asprintf failed");

  encoded_message = encode_message (formatted_message);

  if (encoded_message)
    {
      fprintf (stderr, "%s\n", encoded_message);
      free (encoded_message);
    }
}

/* texi2any */
static void
add_config_paths (const char *env_string, const char *subdir,
                  /* unused in Perl
                  const STRING_LIST *default_base_dirs,
                   */
                  const char *installation_dir,
                  const DEPRECATED_DIRS_LIST *overriding_dirs,
                  STRING_LIST *result_dirs,
                  DEPRECATED_DIRS_LIST *deprecated_dirs)
{
  static STRING_LIST xdg_result_dirs;
  size_t i;
  /*
   read the env directories to avoid setting the overriding_dirs
   as deprecated if they are explicitely specified in the environnement
   variable.
   */
  const char *env_value = getenv (env_string);
  if (env_value && strlen (env_value))
    {
      char *text = strdup (env_value);
      char *dir = strtok (text, ":");

      while (dir)
        {
          if (strlen (dir))
            {
              add_include_directory (dir, &xdg_result_dirs);
            }
          dir = strtok (NULL, ":");
        }
      free (text);
    }

  if (installation_dir)
    {
      char *install_result_dir;
      xasprintf (&install_result_dir, "%s/%s", installation_dir, subdir);
      add_string (install_result_dir, result_dirs);
      if (overriding_dirs)
        {
          DEPRECATED_DIR_INFO *deprecated_dir_info
            = find_deprecated_dir_info (overriding_dirs, installation_dir);

          if (deprecated_dir_info)
            {
              char *deprecated_result_dir;
              xasprintf (&deprecated_result_dir, "%s/%s",
                         deprecated_dir_info->obsolete_dir, subdir);
              if (!find_string (&xdg_result_dirs,
                                deprecated_dir_info->obsolete_dir))
                {
                  add_new_deprecated_dir_info (deprecated_dirs,
                                   deprecated_dir_info->obsolete_dir,
                                   deprecated_dir_info->reference_dir);
                  add_string (deprecated_result_dir, result_dirs);
                }
              free (deprecated_result_dir);
            }
        }
      free (install_result_dir);
    }

  for (i = 0; i < xdg_result_dirs.number; i++)
    {
      char *dir = xdg_result_dirs.list[i];
      if (!find_string (result_dirs, dir))
        {
          char *result_dir;
          xasprintf (&result_dir, "%s/%s", dir, subdir);
          add_string (result_dir, result_dirs);
          free (result_dir);
        }
      free (dir);
    }

  xdg_result_dirs.number = 0;
}

#define XDG_SYSCONFDIR SYSCONFDIR "/xdg"

static DEPRECATED_DIR_INFO overriding_sysconfdir_info[1] = {
  {XDG_SYSCONFDIR, SYSCONFDIR} };
static const DEPRECATED_DIRS_LIST overriding_sysconfdir_list = {
  1, 1, overriding_sysconfdir_info };

static STRING_LIST *
set_subdir_directories (const char *subdir,
                        DEPRECATED_DIRS_LIST *deprecated_dirs)
{
  STRING_LIST *result = new_string_list ();
  STRING_LIST *config_dirs = new_string_list ();
  char *dir_string;
  char *xdg_config_home;

  xasprintf (&dir_string, ".%s", subdir);
  add_string (dir_string, result);
  free (dir_string);

  xdg_config_home = getenv ("XDG_CONFIG_HOME");
  if (xdg_config_home && strlen (xdg_config_home))
    {
      xasprintf (&dir_string, "%s/%s", xdg_config_home, subdir);
      add_string (dir_string, result);
      free (dir_string);
    }
  else
    {
      const char *home_dir = getenv ("HOME");
      if (home_dir)
        {
          char *deprecated_config_home;
          xasprintf (&dir_string, "%s/%s/%s", home_dir, ".config", subdir);
          xasprintf (&deprecated_config_home, "%s/.%s", home_dir, subdir);
          add_new_deprecated_dir_info (deprecated_dirs,
                                   deprecated_config_home, dir_string);
          add_string (dir_string, result);
          free (dir_string);
          add_string (deprecated_config_home, result);
          free (deprecated_config_home);
        }
    }

  add_config_paths ("XDG_CONFIG_DIRS", subdir, XDG_SYSCONFDIR,
                    &overriding_sysconfdir_list, config_dirs, deprecated_dirs);

  merge_strings (result, config_dirs);

  free (config_dirs->list);
  free (config_dirs);

  xasprintf (&dir_string, DATADIR "/%s", subdir);
  add_string (dir_string, result);
  free (dir_string);

  return result;
}

static void
set_option_value (OPTIONS_LIST *options_list, size_t number,
                  const char *value)
{
  OPTION *option = options_list->sorted_options[number -1];

  if (option->type == GOT_integer)
    {
      char *endptr;
      long long_value = strtol (value, &endptr, 10);
      int int_value = (int) long_value;
      if (endptr != value && int_value >= 0)
        {
          option_set_conf (option, int_value, 0);
        }
      else
        {
          /* warn?  No such check in Perl */
        }
    }
  else if (option->type == GOT_char
           || option->type == GOT_bytes)
    {
      char *option_value;
      if (!value)
        option_value = strdup ("");
      else if (option->type == GOT_char)
        /* actually const, but constrained by protoypes */
        option_value = decode_input ((char *) value);
      else
        option_value = strdup (value);
      option_set_conf (option, 0, option_value);
      free (option_value);
    }
  options_list_add_option_number (options_list, number);
}

/* Texinfo::Config::texinfo_set_from_init_file */
/* only used for one variable */
static void
set_from_init_file (const char *option_name,
                    const char *value)
{
  OPTION *option = find_option_string (init_files_options.sorted_options,
                                       option_name);
  if (!option)
    {
      document_warn("%s: unknown variable %s", "texinfo_set_from_init_file",
                    option_name);
      return;
    }
  set_option_value (&init_files_options, option->number, value);
}

/* Texinfo::Config::GNUT_set_customization_default */
/* set_main_program_default in texi2any.pl */
static int
set_customization_default (size_t number, const char *value)
{
  if (option_number_in_option_list (&cmdline_options, number)
      || option_number_in_option_list (&init_files_options, number))
    return 0;

  set_option_value (&program_options, number, value);
  return 1;
}

/* Texinfo::Config and texi2any */
static void
set_from_cmdline (OPTIONS_LIST *options_list, size_t number,
                  const char *value)
{
  if (!strcmp (value, "undef"))
    {
      OPTION *option = options_list->sorted_options[number -1];
      clear_option (option);
      options_list_add_option_number (options_list, option->number);
    }
  else
    set_option_value (options_list, number, value);
}

static void
set_format (const char *format_name)
{
  size_t i;
  const char *new_output_format = 0;
  int format_found = 0;

  for (i = 0; format_command_line_names[i].command_line_name; i++)
    {
      if (!strcmp (format_command_line_names[i].command_line_name,
                   format_name))
        {
          new_output_format = format_command_line_names[i].output_name;
          break;
        }
    }

  if (!new_output_format)
    new_output_format = format_name;

  for (i = 0; formats_table[i].name; i++)
    {
      if (!strcmp (formats_table[i].name, new_output_format))
        {
          format_found = 1;
          break;
        }
    }
  if (!format_found)
    {
      document_warn ("ignoring unrecognized TEXINFO_OUTPUT_FORMAT value `%s'",
                     format_name);
    }
  else
    set_from_init_file ("TEXINFO_OUTPUT_FORMAT", new_output_format);
}

static void
get_cmdline_customization_option (OPTIONS_LIST *options_list,
                                  char *text)
{
  size_t identifier_len = read_var_len (text);
  if (identifier_len > 0)
    {
      char *option_name = strndup (text, identifier_len);
      OPTION *option = find_option_string (options_list->sorted_options,
                                           option_name);

      if (option)
        {
          char *p = text + identifier_len;
          p += strspn (p, whitespace_chars);
          if (*p == '=')
            {
              p++;
              p += strspn (p, whitespace_chars);
            }

          if (!strcmp (option_name, "TEXINFO_OUTPUT_FORMAT"))
            {
              char *option_value = decode_input (p);
              set_format (option_value);
              free (option_value);
            }
          else
            {
              if (!strcasecmp (p, "undef"))
                {
                  clear_option (option);
                  options_list_add_option_number (options_list, option->number);
                }
              else
                {
                  set_from_cmdline (options_list, option->number, p);
                }
            }
        }
      else
        {
          document_warn("unknown variable from command line: %s",
                        option_name);
        }
      free (option_name);
    }
}

static void
push_include_directory (STRING_LIST *include_dirs_list, char *text)
{
  char *dir = strtok (text, PATH_SEP);

  while (dir)
    {
      if (strlen (dir))
        {
          add_include_directory (dir, include_dirs_list);
        }
      dir = strtok (NULL, PATH_SEP);
    }
}

static void
set_expansion (OPTIONS_LIST *options_list, STRING_LIST *ignored_formats,
               const char *format_name)
{
  OPTION *option = &options_list->options->EXPANDED_FORMATS;
  STRING_LIST *str_list = option->o.strlist;
  size_t idx_format = find_string (str_list, format_name);
  size_t ignored_idx = find_string (ignored_formats, format_name);

  if (!idx_format)
    add_string (format_name, str_list);

  if (ignored_idx)
    remove_from_strings_list (ignored_formats, ignored_idx -1);

  options_list_add_option_number (options_list, option->number);
}

static void
unset_expansion (OPTIONS_LIST *options_list, STRING_LIST *ignored_formats,
                 const char *format_name)
{
  OPTION *option = &options_list->options->EXPANDED_FORMATS;
  STRING_LIST *str_list = option->o.strlist;
  size_t idx_format = find_string (str_list, format_name);
  size_t ignored_idx = find_string (ignored_formats, format_name);

  if (idx_format)
    remove_from_strings_list (str_list, idx_format -1);

  if (!ignored_idx)
    add_string (format_name, ignored_formats);

  options_list_add_option_number (options_list, option->number);
}

static void
format_expanded_formats (STRING_LIST *default_expanded_formats,
                         FORMAT_SPECIFICATION *format_specification)
{
  const char *converter_format;
  const char *expanded_region = 0;
  size_t i;

  if (format_specification->converted_format)
    converter_format = format_specification->converted_format;
  else
    converter_format = format_specification->name;

  for (i = 0; converter_format_expanded_region_name[i].output_name; i++)
    {
      if (!strcmp (converter_format,
                   converter_format_expanded_region_name[i].output_name))
        {
          expanded_region
            = converter_format_expanded_region_name[i].region_name;
          break;
        }
    }

  if (!expanded_region)
    expanded_region = converter_format;

  if (!strcmp (expanded_region, "plaintext"))
    {
      add_string (expanded_region, default_expanded_formats);
      add_string ("info", default_expanded_formats);
    }
  /* Texinfo::Common::texinfo_output_formats */
  else
    {
      const char *expanded_format = 0;
      if (!strcmp (expanded_region, "info"))
        expanded_format = expanded_region;
      else
        {
          enum command_id cmd = lookup_builtin_command (expanded_region);
          if (cmd && builtin_command_data[cmd].flags & CF_block
              && builtin_command_data[cmd].data == BLOCK_format_raw)
            expanded_format = expanded_region;
        }
      if (expanded_format)
        add_string (expanded_format, default_expanded_formats);
    }
}

static void
set_cmdline_format (const char *format_name)
{
  set_from_cmdline(&cmdline_options,
                   cmdline_options.options->TEXINFO_OUTPUT_FORMAT.number,
                   format_name);
}

/* If the file overwriting becomes an error, should increase $ERROR_COUNT. */
static size_t
merge_opened_files (STRING_LIST *opened_files,
                    STRING_LIST *added_opened_files, size_t error_count)
{
  if (added_opened_files)
    {
      size_t i;
      for (i = 0; i < added_opened_files->number; i++)
        {
          char *opened_file = added_opened_files->list[i];
          if (find_string (opened_files, opened_file))
            document_warn ("overwriting file: %s", opened_file);
          else
            add_string (opened_file, opened_files);
        }
    }

  return error_count;
}

static void
exit_if_errors (size_t error_count, STRING_LIST *opened_files)
{
  OPTION *error_limit_option
     = get_conf (program_options.options->ERROR_LIMIT.number);
  OPTION *force_option
     = get_conf (program_options.options->FORCE.number);
  int force = (force_option->o.integer > 0);
  /* implicit conversion */
  size_t error_limit = error_limit_option->o.integer;

  if (opened_files->number > 0 && error_count && !force)
    {
      size_t i;
      for (i = opened_files->number; i > 0 ; i--)
        {
          size_t index = i - 1;
          char *opened_file = strdup (opened_files->list[index]);
          unlink (opened_file);
          remove_from_strings_list (opened_files, index);
          free (opened_file);
        }
    }

  if ((error_count && !force) || error_count > error_limit)
    exit (EXIT_FAILURE);
}

static size_t
handle_errors (size_t additional_error_count, size_t error_count,
               STRING_LIST *opened_files)
{
  error_count += additional_error_count;
  exit_if_errors (error_count, opened_files);
  return error_count;
}

/* Non-zero means demonstration mode */
static int demonstration_p;

/* Non-zero means mimick texi2any mode */
static int mimick_p;

/* If non-zero, show help and exit */
static int print_help_p;

#define DOCUMENT_LANGUAGE_OPT 2
#define NO_SPLIT_OPT 3
#define SPLIT_OPT 4
#define FOOTNOTE_STYLE_OPT 5
#define IFDOCBOOK_OPT 6
#define NO_IFDOCBOOK_OPT 7
#define IFINFO_OPT 8
#define NO_IFINFO_OPT 9
#define IFHTML_OPT 10
#define NO_IFHTML_OPT 11
#define IFLATEX_OPT 12
#define NO_IFLATEX_OPT 13
#define IFPLAINTEXT_OPT 14
#define NO_IFPLAINTEXT_OPT 15
#define IFTEX_OPT 16
#define NO_IFTEX_OPT 17
#define IFXML_OPT 18
#define NO_IFXML_OPT 19
#define NO_WARN_OPT 20
/* potentially 12 formats */
#define HTML_OPT 25
#define TRACE_INCLUDES_OPT 33
#define NO_VERBOSE_OPT 34
#define HEADERS_OPT 35
#define NO_HEADERS_OPT 36

#define IFFORMAT_TABLE(upcase, name) \
  {"if" #name, 0, 0, IF ## upcase ## _OPT}, \
  {"no-if" #name, 0, 0, NO_IF ## upcase ## _OPT},

static struct option long_options[] = {
  /* next two not in texi2any */
  {"demonstration", 0, &demonstration_p, 1},
  {"mimick", 0, &mimick_p, 1},

  {"document-language", required_argument, 0, DOCUMENT_LANGUAGE_OPT},
  {"error-limit", required_argument, 0, 'e'},
  {"footnote-style", required_argument, 0, FOOTNOTE_STYLE_OPT},
  {"force", 0, 0, 'F'},
  {"headers", 0, 0, HEADERS_OPT},
  {"no-headers", 0, 0, NO_HEADERS_OPT},
  {"help", 0, 0, 'h'},
  {"macro-expand", required_argument, 0, 'E'},
  {"no-warn", 0, 0, NO_WARN_OPT},
  {"out", required_argument, 0, 'o'},
  {"output", required_argument, 0, 'o'},
  {"no-split", 0, 0, NO_SPLIT_OPT},
  {"split", required_argument, 0, SPLIT_OPT},
  {"set-customization-variable", required_argument, 0, 'c'},
  {"trace-include", 0, 0, TRACE_INCLUDES_OPT},
  {"verbose", 0, 0, 'v'},
  {"no-verbose", 0, 0, NO_VERBOSE_OPT},
  {"version", 0, 0, 'V'},
  {"html", 0, 0, HTML_OPT},
  IFFORMAT_TABLE(DOCBOOK, docbook)
  IFFORMAT_TABLE(INFO, info)
  IFFORMAT_TABLE(HTML, html)
  IFFORMAT_TABLE(LATEX, latex)
  IFFORMAT_TABLE(PLAINTEXT, plaintext)
  IFFORMAT_TABLE(TEX, tex)
  IFFORMAT_TABLE(XML, xml)
  {NULL, 0, NULL, 0}
};
#undef IFFORMAT_TABLE

static const char *possible_split[] = {
  "chapter", "section", "node", NULL
};

int
main (int argc, char *argv[])
{
  int getopt_long_index;
  const char *locale_encoding = 0;
  const char *input_file_path;
  int status;
  char *program_file_name_and_directory[2];
  /*
  char *command_directory;
   */
  BUTTON_SPECIFICATION_LIST *custom_node_footer_buttons;
  OPTIONS_LIST parser_options;
  OPTIONS_LIST convert_options;
  size_t errors_count = 0;
  size_t errors_nr;
  STRING_LIST *texinfo_language_config_dirs;
  STRING_LIST converter_texinfo_language_config_dirs;
  STRING_LIST ignored_formats;
  STRING_LIST default_expanded_formats;
  STRING_LIST prepend_dirs;
  CONVERTER_INITIALIZATION_INFO *format_defaults;
  DEPRECATED_DIRS_LIST deprecated_directories;
  char *top_srcdir;
  char *top_builddir;
  char *tp_builddir = 0;
  OPTION *test_option;
  OPTION *no_warn_option;
  OPTION *format_menu_option;
  int no_warn = 0;
  int test_mode_set = 0;
  size_t i;
  STRING_LIST input_files;
  STRING_LIST opened_files;
  STRING_LIST prepended_include_directories;
  char *texinfo_output_format_env;
  OPTION *output_format_option;
  const char *output_format;
  const char *converted_format;
  FORMAT_SPECIFICATION *format_specification = 0;
  int do_menu = 0;
  size_t format_menu_option_nr;
  char *conversion_format_menu_default = 0;

  parse_file_path (argv[0], program_file_name_and_directory);
  program_file = program_file_name_and_directory[0];
  /* command_directory = program_file_name_and_directory[1]; */

  top_srcdir = getenv ("top_srcdir");
  if (top_srcdir)
    top_srcdir = strdup (top_srcdir);
  else
    /* equivalent to setting top_srcdir based on updirs in ModulePath.pm
       adapted to a program without any in-source version */
    top_srcdir = strdup ("../../..");

  top_builddir = getenv ("top_builddir");
  if (!top_builddir)
    /* this is correct for in-source builds only. */
    top_builddir = strdup (top_srcdir);
  else
    top_builddir = strdup (top_builddir);

  xasprintf (&tp_builddir, "%s/tp", top_builddir);

  free (top_builddir);

  txi_general_setup (1, 0, tp_builddir, top_srcdir);

  free (tp_builddir);
  free (top_srcdir);

  /* from Gnulib codeset.m4 */
#ifdef HAVE_LANGINFO_CODESET
  locale_encoding = nl_langinfo (CODESET);
#endif
  /*
  if (!defined($locale_encoding) and $^O eq 'MSWin32') {
    eval 'require Win32::API';
    if (!$@) {
      Win32::API::More->Import("kernel32", "int GetACP()");
      my $CP = GetACP();
      if (defined($CP)) {
        $locale_encoding = 'cp'.$CP;
      }
    }
  }
   */

  /* program_options corresponds to main_program_set_options in texi2any */
  txi_set_base_default_options (&program_options, locale_encoding,
                                program_file);

  /* set default output format.  Is info in texi2any */
  /* better than making it the default value independently of the
     implementation */
  add_option_value (&program_options, "TEXINFO_OUTPUT_FORMAT", 0, "html");

  /*
   if ($^O eq 'MSWin32') {
     $main_program_set_options->{'DOC_ENCODING_FOR_INPUT_FILE_NAME'} = 0;
   }
  */

  memset (&deprecated_directories, 0, sizeof (DEPRECATED_DIRS_LIST));

  texinfo_language_config_dirs
   = set_subdir_directories ("texinfo", &deprecated_directories);

  memset (&prepend_dirs, 0, sizeof (STRING_LIST));

  memset (&input_files, 0, sizeof (STRING_LIST));

  initialize_options_list (&cmdline_options);
  memset (&ignored_formats, 0, sizeof (STRING_LIST));

  initialize_options_list (&init_files_options);

  while (1)
    {
      int option_character;

      option_character = getopt_long (argc, argv, "VhvFc:e:I:P:o:E:",
                                      long_options,
                                      &getopt_long_index);

      if (option_character == -1)
        break;

      switch (option_character)
        {
        case 'c':
          get_cmdline_customization_option (&cmdline_options, optarg);
          break;
        case 'e':
          set_from_cmdline(&cmdline_options,
                           cmdline_options.options->ERROR_LIMIT.number,
                           optarg);
          break;
        case 'E':
          set_from_cmdline(&cmdline_options,
                           cmdline_options.options->MACRO_EXPAND.number,
                           optarg);
          break;
        case 'F':
          set_from_cmdline(&cmdline_options,
                           cmdline_options.options->FORCE.number, "1");
          break;
        case NO_WARN_OPT:
          set_from_cmdline(&cmdline_options,
                           cmdline_options.options->NO_WARN.number, "1");
          break;
        case TRACE_INCLUDES_OPT:
          set_from_cmdline(&cmdline_options,
                           cmdline_options.options->TRACE_INCLUDES.number,
                           "1");
          break;
        case 'v':
          set_from_cmdline(&cmdline_options,
                           cmdline_options.options->VERBOSE.number, "1");
          break;
        case NO_VERBOSE_OPT:
          set_from_cmdline(&cmdline_options,
                           cmdline_options.options->VERBOSE.number, "0");
          break;
        case NO_HEADERS_OPT:
          set_from_cmdline(&cmdline_options,
                           cmdline_options.options->HEADERS.number, "0");
          set_from_cmdline(&cmdline_options,
                           cmdline_options.options->FORMAT_MENU.number,
                           "nomenu");
          {
            size_t option_nr
              = program_options.options->TEXINFO_OUTPUT_FORMAT.number;
            OPTION *output_format_option = get_conf (option_nr);
            if (output_format_option && output_format_option->o.string
                && !strcmp (output_format_option->o.string, "info"))
              set_customization_default (option_nr, "plaintext");
          }
          break;
        case HEADERS_OPT:
          set_from_cmdline(&cmdline_options,
                           cmdline_options.options->HEADERS.number, "1");
          set_from_cmdline(&cmdline_options,
                           cmdline_options.options->FORMAT_MENU.number,
                           "set_format_menu_from_cmdline_header_option");
          break;
        case 'I':
          {
            OPTION *option = &cmdline_options.options->INCLUDE_DIRECTORIES;
            push_include_directory (option->o.strlist, optarg);
            options_list_add_option_number (&cmdline_options, option->number);
          }
          break;
        case 'P':
          push_include_directory (&prepend_dirs, optarg);
          break;
        case 'h':
          print_help_p = 1;
          break;
        case 'V':
          {
            char *encoded_message;
            char *message
             = CONVERTER_CONFIG " (GNU texinfo) " PACKAGE_VERSION_CONFIG "\n\n";
            char *formatted_message;

            encoded_message = encode_message (message);
            printf ("%s", encoded_message);
            free (encoded_message);

            xasprintf (&formatted_message, _(
  "Copyright (C) %s Free Software Foundation, Inc.\nLicense GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>\nThis is free software: you are free to change and redistribute it.\nThere is NO WARRANTY, to the extent permitted by law."),
                       "2024");
            encoded_message = encode_message (formatted_message);
            free (formatted_message);
            printf ("%s\n", encoded_message);
            free (encoded_message);

            exit (EXIT_SUCCESS);
          }
          break;
        case DOCUMENT_LANGUAGE_OPT:
          set_from_cmdline(&cmdline_options,
                           cmdline_options.options->documentlanguage.number,
                           optarg);
          break;
        case FOOTNOTE_STYLE_OPT:
          {
            /* actually const but constrained by prototypes */
            char *value = decode_input((char *) optarg);
            if (!strcmp (value, "end") || !strcmp (value, "separate"))
              {
                set_from_cmdline(&cmdline_options,
                          cmdline_options.options->footnotestyle.number,
                                 value);
              }
            else
              {
                char *formatted_message;
                char *encoded_message;

                xasprintf (&formatted_message,
        _("%s: --footnote-style arg must be `separate' or `end', not `%s'."),
                  program_file, value);
                encoded_message = encode_message (formatted_message);
                free (formatted_message);
                fprintf (stderr, "%s\n", encoded_message);
                free (encoded_message);
                exit (EXIT_FAILURE);
              }
            free (value);
          }
          break;
        case 'o':
          {
            OPTION *option = &cmdline_options.options->OUTFILE;
            /* actually const but constrained by prototypes */
            char *decoded_string = decode_input ((char *) optarg);
            if (strcmp (optarg, "-"))
              {
                size_t opt_len = strlen (optarg);
                struct stat finfo;

                if (optarg[opt_len -1] == '/'
                    || (stat (optarg, &finfo) == 0 && S_ISDIR (finfo.st_mode)))
                  {
                    set_from_cmdline (&cmdline_options,
                                      option->number, "undef");
                    option = &cmdline_options.options->SUBDIR;
                  }
              }
            set_from_cmdline (&cmdline_options, option->number, decoded_string);
            free (decoded_string);
          }
          break;
        case NO_SPLIT_OPT:
          set_from_cmdline (&cmdline_options,
                            cmdline_options.options->SPLIT.number, "");
          set_from_cmdline (&cmdline_options,
                            cmdline_options.options->SPLIT_SIZE.number,
                            "undef");
          break;
        case SPLIT_OPT:
          {
            char *split = decode_input (optarg);
            size_t i;
            for (i = 0; possible_split[i]; i++)
              if (!strcmp (possible_split[i], optarg))
                break;
            if (!possible_split[i])
              {
                document_warn ("%s is not a valid split possibility",
                               split);
                free (split);
                split = strdup ("node");
              }
            set_from_cmdline (&cmdline_options,
                              cmdline_options.options->SPLIT.number, split);
            free (split);
          }
          break;
        case HTML_OPT:
          set_cmdline_format ("html");
          break;
#define IFFORMAT_CASE(upcase, name) \
        case IF ## upcase ## _OPT: \
          set_expansion (&cmdline_options, &ignored_formats, #name); \
          break; \
        case NO_IF ## upcase ## _OPT: \
          unset_expansion (&cmdline_options, &ignored_formats, #name); \
          break;
        IFFORMAT_CASE(DOCBOOK, docbook)
        IFFORMAT_CASE(INFO, info)
        IFFORMAT_CASE(HTML, html)
        IFFORMAT_CASE(LATEX, latex)
        IFFORMAT_CASE(PLAINTEXT, plaintext)
        IFFORMAT_CASE(TEX, tex)
        IFFORMAT_CASE(XML, xml)
#undef IFFORMAT_CASE
 /*
        case IFTEX_OPT:
          set_expansion (&cmdline_options, &ignored_formats, "tex");
          break;
        case NO_IFTEX_OPT:
          unset_expansion (&cmdline_options, &ignored_formats, "tex");
          break;
 */
          /*
        case '?':
          if (isprint (optopt))
            fprintf (stderr, "Unknown option `-%c'\n", optopt);
          else
            fprintf (stderr,
                     "Unknown option character `\\x%x'\n",
                     optopt);
          break;
           */
        default:
          exit (EXIT_FAILURE);
        }
    }

  if (print_help_p)
    {
      TEXT help_message;
      OPTION *error_limit_option
        = get_conf (program_options.options->ERROR_LIMIT.number);

      text_init (&help_message);
      text_printf (&help_message,
                   _("Usage: %s [OPTION]... TEXINFO-FILE..."), program_file);
      text_append_n (&help_message, "\n\n", 2);
      /* no added translations, reuse translations with they already exist */
      text_append (&help_message,
     "Translate Texinfo source documentation to various other formats.\n\n");
      text_append (&help_message, _("General options:"));
      text_append_n (&help_message, "\n", 1);
      text_append (&help_message,
   _("      --document-language=STR locale to use in translating Texinfo keywords\n                                for the output document (default C)."));
      text_append_n (&help_message, "\n", 1);
      text_printf (&help_message,
        _("      --error-limit=NUM       quit after NUM errors (default %d)."),
        error_limit_option->o.integer);
      text_append_n (&help_message, "\n", 1);
      text_append (&help_message,
        _("      --force                 preserve output even if errors."));
      text_append_n (&help_message, "\n", 1);
      text_append (&help_message,
        _("      --help                  display this help and exit."));
      text_append_n (&help_message, "\n", 1);
      text_append (&help_message,
        _("      --no-warn               suppress warnings (but not errors)."));
      text_append_n (&help_message, "\n", 1);
      text_append (&help_message,
        _("  -c, --set-customization-variable VAR=VAL  set customization variable VAR\n                                to value VAL."));
      text_append_n (&help_message, "\n", 1);
      text_append (&help_message,
        _("      --trace-includes        print names of included files."));
      text_append_n (&help_message, "\n", 1);
      text_append (&help_message,
        _("  -v, --verbose               explain what is being done."));
      text_append_n (&help_message, "\n", 1);
      text_append (&help_message,
        _("      --version               display version information and exit."));
      text_append_n (&help_message, "\n\n", 2);

      text_append (&help_message, "Output format selection (default is to produce HTML):");
      text_append_n (&help_message, "\n", 1);
      text_append (&help_message,
        _("      --html                  output HTML."));
      text_append_n (&help_message, "\n\n", 2);

      text_append (&help_message, _("General output options:"));
      text_append_n (&help_message, "\n", 1);
      text_append (&help_message, _(
   "  -E, --macro-expand=FILE     output macro-expanded source to FILE,\n                                ignoring any @setfilename."));
      text_append_n (&help_message, "\n", 1);
      text_append (&help_message, _(
   "      --no-headers            suppress node separators, Node: lines, and menus\n                                from Info output (thus producing plain text)\n                                or from HTML (thus producing shorter output).\n                                Also, if producing Info, write to\n                                standard output by default."));
      text_append_n (&help_message, "\n", 1);
      text_append (&help_message, _(
   "      --no-split              suppress any splitting of the output;\n                                generate only one output file."));
      text_append_n (&help_message, "\n", 1);
      text_append (&help_message, _(
   "  -o, --output=DEST           output to DEST.\n                                With split output, create DEST as a directory\n                                and put the output files there.\n                                With non-split output, if DEST is already\n                                a directory or ends with a /,\n                                put the output file there.\n                                Otherwise, DEST names the output file."));
      text_append_n (&help_message, "\n\n", 2);

      text_append (&help_message, _("Options for Info and plain text:"));
      text_append_n (&help_message, "\n", 1);
      text_append (&help_message,
   "      --footnote-style=STYLE  output footnotes in Info according to STYLE:\n                                `separate' to put them in their own node;\n                                `end' to put them at the end of the node, in\n                                which they are defined (this is the default).");
      text_append_n (&help_message, "\n\n", 2);

      text_append (&help_message, _("Options for HTML:"));
      text_append_n (&help_message, "\n", 1);
      text_append (&help_message,
   "      --split=SPLIT           split at SPLIT, where SPLIT may be `chapter',\n                                `section' or `node'.");
      text_append_n (&help_message, "\n\n", 2);

      text_append (&help_message, _("Input file options:"));
      text_append_n (&help_message, "\n", 1);
      text_append (&help_message,
        _(" -I DIR                       append DIR to the @include search path."));
      text_append_n (&help_message, "\n", 1);
      text_append (&help_message,
        _(" -P DIR                       prepend DIR to the @include search path."));
      text_append_n (&help_message, "\n\n", 2);

      text_append (&help_message, _("Conditional processing in input:"));
      text_append_n (&help_message, "\n", 1);
      text_append (&help_message,
  _("  --ifdocbook       process @ifdocbook and @docbook even if\n                      not generating Docbook."));
      text_append_n (&help_message, "\n", 1);
      text_append (&help_message,
  _("  --ifhtml          process @ifhtml and @html even if not generating HTML."));
      text_append_n (&help_message, "\n", 1);
      text_append (&help_message,
  _("  --ifinfo          process @ifinfo even if not generating Info."));
      text_append_n (&help_message, "\n", 1);
      text_append (&help_message,
  _("  --iflatex         process @iflatex and @latex."));
      text_append_n (&help_message, "\n", 1);
      text_append (&help_message,
  _("  --ifplaintext     process @ifplaintext even if not generating plain text."));
      text_append_n (&help_message, "\n", 1);
      text_append (&help_message,
  _("  --iftex           process @iftex and @tex."));
      text_append_n (&help_message, "\n", 1);
      text_append (&help_message,
  _("  --ifxml           process @ifxml and @xml."));
      text_append_n (&help_message, "\n", 1);
      text_append (&help_message,
  _("  --no-ifdocbook    do not process @ifdocbook and @docbook text."));
      text_append_n (&help_message, "\n", 1);
      text_append (&help_message,
  _("  --no-ifhtml       do not process @ifhtml and @html text."));
      text_append_n (&help_message, "\n", 1);
      text_append (&help_message,
  _("  --no-ifinfo       do not process @ifinfo text."));
      text_append_n (&help_message, "\n", 1);
      text_append (&help_message,
  _("  --no-iflatex      do not process @iflatex and @latex text."));
      text_append_n (&help_message, "\n", 1);
      text_append (&help_message,
  _("  --no-ifplaintext  do not process @ifplaintext text."));
      text_append_n (&help_message, "\n", 1);
      text_append (&help_message,
  _("  --no-iftex        do not process @iftex and @tex text."));
      text_append_n (&help_message, "\n", 1);
      text_append (&help_message,
  _("  --no-ifxml        do not process @ifxml and @xml text."));
      text_append_n (&help_message, "\n\n", 2);

      text_append (&help_message,
  _("  Also, for the --no-ifFORMAT options, do process @ifnotFORMAT text."));
      text_append_n (&help_message, "\n\n", 2);

      text_append (&help_message, _("Email bug reports to bug-texinfo@gnu.org,\ngeneral questions and discussion to help-texinfo@gnu.org.\nTexinfo home page: https://www.gnu.org/software/texinfo/"));
      text_append_n (&help_message, "\n", 1);

      fprintf (stderr, "%s", help_message.text);
      free (help_message.text);
      exit (EXIT_SUCCESS);
    }

  test_option = get_conf (program_options.options->TEST.number);
  if (test_option && test_option->o.integer > 0)
    test_mode_set = 1;

  no_warn_option = get_conf (program_options.options->NO_WARN.number);
  if (no_warn_option && no_warn_option->o.integer > 0)
    no_warn = 1;

  if(test_mode_set)
    {
      add_option_value (&program_options, "PACKAGE_VERSION", 0, "");
      add_option_value (&program_options, "PACKAGE", 0, "texinfo");
      add_option_value (&program_options, "PACKAGE_NAME", 0, "GNU Texinfo");
      add_option_value (&program_options, "PACKAGE_AND_VERSION", 0,
                                          "texinfo");
      add_option_value (&program_options, "PACKAGE_URL", 0,
                                     "https://www.gnu.org/software/texinfo/");
      add_option_value (&program_options, "PROGRAM", 0, "texi2any");
    }

  texinfo_output_format_env = getenv ("TEXINFO_OUTPUT_FORMAT");
  if (texinfo_output_format_env && strlen (texinfo_output_format_env))
    {
      char *format_name = decode_input (texinfo_output_format_env);
      set_format (format_name);
      free (format_name);
    }

  output_format_option
    = get_conf (program_options.options->TEXINFO_OUTPUT_FORMAT.number);
  output_format = output_format_option->o.string;

  for (i = 0; formats_table[i].name; i++)
    {
      if (!strcmp (formats_table[i].name, output_format))
        {
          format_specification = &formats_table[i];
          break;
        }
    }

  if (format_specification->converted_format)
    converted_format = format_specification->converted_format;
  else
    converted_format = output_format;

  memset (&default_expanded_formats, 0, sizeof (STRING_LIST));
  format_expanded_formats (&default_expanded_formats, format_specification);

  for (i = 0; i < ignored_formats.number; i++)
    {
      size_t ignored_fmt_nr
         = find_string (&default_expanded_formats, ignored_formats.list[i]);
      if (ignored_fmt_nr)
        remove_from_strings_list (&default_expanded_formats, ignored_fmt_nr-1);
    }
  for (i = 0; i < default_expanded_formats.number; i++)
    {
      OPTION *option = &cmdline_options.options->EXPANDED_FORMATS;
      STRING_LIST *expanded_formats_list = option->o.strlist;
      if (!find_string (expanded_formats_list,
                        default_expanded_formats.list[i]))
        add_string (default_expanded_formats.list[i], expanded_formats_list);
    }


  /* corresponds to eval "require $module"; in texi2any.pl */
  txi_converter_output_format_setup (converted_format);

  /*
  For now, FORMAT_MENU is the only variable that can be set from converter
  defaults for the main program structuring and for the parser.
   */
  /*
   $cmdline_options is passed to have command line settings, here
   in practice TEXI2HTML set, for conversion to HTML to select
   possibly different customization variable values.
   */
  format_defaults = txi_converter_format_defaults (converted_format,
                                                   &cmdline_options);

  format_menu_option_nr = program_options.options->FORMAT_MENU.number;

  /* in Perl the presence of a module in format specification is used to
     determine if there are format defaults.  Here check if format_defaults
     is set */
  if (format_defaults)
    {
      conversion_format_menu_default
        = strdup (format_defaults->conf.options->FORMAT_MENU.o.string);
      if (conversion_format_menu_default != 0)
        {
          /*
          fprintf (stderr, "FORMAT_MENU %s\n", conversion_format_menu_default);
           */
          set_customization_default (format_menu_option_nr,
                                     conversion_format_menu_default);
        }

      destroy_converter_initialization_info (format_defaults);
    }

  /* special case for FORMAT_MENU of delayed setting based in
     some case on converter */
  format_menu_option = get_conf (format_menu_option_nr);
  if (format_menu_option && format_menu_option->o.string
      && !strcmp (format_menu_option->o.string,
                  "set_format_menu_from_cmdline_header_option"))
    {
      if (conversion_format_menu_default
          && strcmp (conversion_format_menu_default, "nomenu"))
        {
          set_from_cmdline (&cmdline_options, format_menu_option_nr,
                            conversion_format_menu_default);
        }
      else
        set_from_cmdline (&cmdline_options, format_menu_option_nr, "menu");
    }

  free (conversion_format_menu_default);

  format_menu_option = get_conf (format_menu_option_nr);
  if (format_menu_option && (!format_menu_option->o.string
                             || !strcmp (format_menu_option->o.string,
                                         "menu")))
    do_menu = 1;

  initialize_options_list (&parser_options);
  /* Copy relevant customization variables into the parser options. */
  for (i = 0; i < TXI_OPTIONS_NR; i++)
    {
      OPTION *parser_option = parser_options.sorted_options[i];
      if (parser_option->flags & OF_parser_option)
        {
          /* note that INCLUDE_DIRECTORIES is reset before parsing
             to add prepended directories, current directory and manual
             directory */
          OPTION *option = get_conf (parser_option->number);
          if (option)
            {
              options_list_add_option_number (&parser_options,
                                              parser_option->number);
              copy_option (parser_option, option);
            }
        }
    }

  if (demonstration_p)
    {
      /* customize buttons.  It is a bit silly to use link buttons for
         footer, it is for the demonstration */
      custom_node_footer_buttons = new_base_links_buttons (0);
      add_new_button_option (&program_options,
                     "NODE_FOOTER_BUTTONS", custom_node_footer_buttons);
      add_option_value (&program_options, "PROGRAM_NAME_IN_FOOTER", 1, 0);
    }

  if (mimick_p)
    {
      /* mimick texi2any.pl, under the assumption that
         teximakehtml output will be compared to calls of in-source
         texi2any.pl */
      const char *configured_version = PACKAGE_VERSION_CONFIG "+dev";
      const char *configured_name_version
         = PACKAGE_NAME_CONFIG " " PACKAGE_VERSION_CONFIG "+dev";

      free (program_file);
      program_file = strdup ("texi2any");

      add_option_value (&program_options, "PROGRAM", 0, program_file);
      add_option_value (&program_options, "PACKAGE_VERSION", 0,
                        configured_version);
      add_option_value (&program_options, "PACKAGE_AND_VERSION", 0,
                        configured_name_version);
    }

  memset (&converter_texinfo_language_config_dirs, 0, sizeof (STRING_LIST));

  if (optind < argc)
    {
      int j;
      for (j = optind; j < argc; j++)
        add_string (argv[j], &input_files);
    }
  else if (!isatty (fileno (stdin)))
    {
      add_string ("-", &input_files);
    }
  else
    {
      char *formatted_message;
      char *encoded_message;

      xasprintf (&formatted_message, _("%s: missing file argument."),
                 program_file);
      encoded_message = encode_message (formatted_message);
      free (formatted_message);
      fprintf (stderr, "%s\n", encoded_message);
      free (encoded_message);

      xasprintf (&formatted_message,
                 _("Try `%s --help' for more information."),
                 program_file);
      encoded_message = encode_message (formatted_message);
      free (formatted_message);
      fprintf (stderr, "%s\n", encoded_message);
      free (encoded_message);
      exit (EXIT_FAILURE);
    }

  initialize_options_list (&convert_options);

  memset (&opened_files, 0, sizeof (STRING_LIST));
  memset (&prepended_include_directories, 0, sizeof (STRING_LIST));

  for (i = 0; i < input_files.number; i++)
    {
      DOCUMENT *document;
      CONVERTER *converter;
      char *result;
      char *input_file_name_and_directory[2];
      char *input_file_name;
      char *input_directory;
      OPTION *trace_includes_option;
      OPTION *macro_expand_option;
      OPTION *dump_texi_option;
      OPTION *converter_include_dirs_option;
      STRING_LIST *cmdline_include_dirs
        = cmdline_options.options->INCLUDE_DIRECTORIES.o.strlist;
      STRING_LIST *parser_include_dirs
        = parser_options.options->INCLUDE_DIRECTORIES.o.strlist;
      STRING_LIST *converter_include_dirs;
      const char *curdir = ".";

      input_file_path = input_files.list[i];

      parse_file_path (input_file_path, input_file_name_and_directory);
      input_file_name = input_file_name_and_directory[0];
      input_directory = input_file_name_and_directory[1];

      if (prepend_dirs.number > 0)
        copy_strings (&prepended_include_directories, &prepend_dirs);

      add_string (curdir, &prepended_include_directories);
      if (input_directory && strcmp (curdir, input_directory))
        add_string (input_directory, &prepended_include_directories);

      /* tune for the input file include directory and prepend to
         INCLUDE_DIRECTORIES by merging prepended directories and command
         line include directories */
      clear_strings_list (parser_include_dirs);
      copy_strings (parser_include_dirs, &prepended_include_directories);
      copy_strings (parser_include_dirs, cmdline_include_dirs);

      /* Texinfo file parsing */
      /* initialize parser */
      txi_parser (input_file_path, locale_encoding, expanded_formats,
                  &values, &parser_options);

      /* Texinfo document tree parsing */
      document = txi_parse_texi_file (input_file_path, &status);

      errors_nr
        = txi_handle_parser_error_messages (document, no_warn, test_mode_set,
                                            locale_encoding);
      if (status)
        {
          errors_count = handle_errors (errors_nr, errors_count, &opened_files);
          goto next_input_file;
        }

      if (!strcmp (output_format, "parse"))
        {
          errors_count = handle_errors (errors_nr, errors_count, &opened_files);
          goto next_input_file;
        }

      trace_includes_option
         = get_conf (program_options.options->TRACE_INCLUDES.number);
      if (trace_includes_option && trace_includes_option->o.integer > 0)
        {
          errors_count = handle_errors (errors_nr, errors_count, &opened_files);
          if (document->global_info.included_files.number)
            {
              for (i = 0; i < document->global_info.included_files.number;
                   i++)
                {
                  printf ("%s\n",
                          document->global_info.included_files.list[i]);
                }
            }
          goto next_input_file;
        }

      errors_count = handle_errors (errors_nr, errors_count, &opened_files);

      macro_expand_option
        = get_conf (program_options.options->MACRO_EXPAND.number);
      if (macro_expand_option && macro_expand_option->o.string && i == 0)
        {
          const char *encoded_macro_expand_file_name
            = macro_expand_option->o.string;
          char *macro_expand_file_name
            = decode_input((char *) encoded_macro_expand_file_name);
          FILE *file_fh;
          OUTPUT_FILES_INFORMATION output_files_information;
          char *open_error_message;
          int overwritten_file;
          size_t error_macro_expand_file = 0;

          char *texinfo_text = convert_to_texinfo (document->tree);

          /* fprintf (stderr, "%s", texinfo_text); */

          memset (&output_files_information, 0,
                  sizeof (OUTPUT_FILES_INFORMATION));

          file_fh = output_files_open_out (&output_files_information,
                                           encoded_macro_expand_file_name,
                                           &open_error_message,
                                           &overwritten_file, 0);
          /* overwritten_file, set if the file has already been used
             in this files_information is not checked as this cannot happen.
           */

          if (file_fh)
            {
              size_t write_len;
              size_t res_len;
              const ENCODING_CONVERSION *conversion = 0;
              char *result_texinfo = 0;
              OPTION *out_encoding_option
           = get_conf (program_options.options->OUTPUT_ENCODING_NAME.number);
              if (out_encoding_option && out_encoding_option->o.string
                  && strcmp (out_encoding_option->o.string, "utf-8"))
                {
                  conversion
                    = get_encoding_conversion (out_encoding_option->o.string,
                                               &output_conversions);
                  if (conversion)
                    result_texinfo = encode_with_iconv (conversion->iconv,
                                                        texinfo_text, 0);
                }

              if (!result_texinfo)
                result_texinfo = texinfo_text;

              res_len = strlen (result_texinfo);

              write_len = fwrite (result_texinfo, sizeof (char),
                                  res_len, file_fh);

              if (conversion)
                free (result_texinfo);

              if (write_len != res_len)
                { /* register error message instead? */
                   fprintf (stderr,
                      "ERROR: write to %s failed (%zu/%zu)\n",
                            encoded_macro_expand_file_name, write_len, res_len);
                }
              output_files_register_closed (&output_files_information,
                                            encoded_macro_expand_file_name);

              if (fclose (file_fh))
                {
                  document_warn ("error on closing macro expand file %s: %s",
                                 macro_expand_file_name, strerror (errno));
                  error_macro_expand_file = 1;
                }
            }
          else
            {
              document_warn ("could not open %s for writing: %s",
                             macro_expand_file_name, open_error_message);
              error_macro_expand_file = 1;
            }

          error_macro_expand_file
            = merge_opened_files (&opened_files,
                                  &output_files_information.opened_files,
                                  error_macro_expand_file);

          if (error_macro_expand_file)
            {
              errors_count = handle_errors (error_macro_expand_file,
                                            errors_count, &opened_files);
            }

          free (macro_expand_file_name);
          free (texinfo_text);
        }

      dump_texi_option
        = get_conf (program_options.options->DUMP_TEXI.number);

      if (dump_texi_option && dump_texi_option->o.integer > 0)
        {
          errors_count = handle_errors (errors_nr, errors_count, &opened_files);
          goto next_input_file;
        }

      /* structure and transformations */
      /* do_menu corresponds to FORMAT_MENU undef or set to menu */
      txi_complete_document (document, format_specification->flags, do_menu);

      errors_nr
        = txi_handle_document_error_messages (document, no_warn,
                                              test_mode_set,
                                              locale_encoding);

      errors_count = handle_errors (errors_nr, errors_count, &opened_files);

      if (!strcmp (output_format, "structure"))
        goto next_input_file;

      /* conversion initialization */
      copy_options_list (&convert_options, &program_options);
      copy_options_list (&convert_options, &init_files_options);
      copy_options_list (&convert_options, &cmdline_options);

      /* prepend to INCLUDE_DIRECTORIES by resetting include directories to
         merged prepended directories and command line include directories */
      converter_include_dirs_option
        = &convert_options.options->INCLUDE_DIRECTORIES;
      converter_include_dirs = converter_include_dirs_option->o.strlist;
      clear_strings_list (converter_include_dirs);
      copy_strings (converter_include_dirs, &prepended_include_directories);
      copy_strings (converter_include_dirs, cmdline_include_dirs);
      /* always mark include directories as set in converter options */
      options_list_add_option_number (&convert_options,
                                      converter_include_dirs_option->number);

      add_string (curdir, &converter_texinfo_language_config_dirs);
      if (input_directory)
        {
          if (strcmp (curdir, input_directory))
            add_string (input_directory,
                        &converter_texinfo_language_config_dirs);
        free (input_directory);
      }

      copy_strings (&converter_texinfo_language_config_dirs,
                    texinfo_language_config_dirs);

      converter = txi_converter_setup (converted_format, output_format,
                                   &converter_texinfo_language_config_dirs,
                                   &deprecated_directories,
                                   &convert_options);


      /* conversion */
      /* return value can be NULL in case of errors or an empty string, but
         not anything else as parse_file is used with a file */
      result = txi_converter_output (converter, document);
      free (result);

      errors_count
        = merge_opened_files (&opened_files,
                     &converter->output_files_information.opened_files,
                              errors_count);

      errors_nr
        = txi_handle_converter_error_messages (converter, no_warn,
                                           test_mode_set, locale_encoding);

      errors_count = handle_errors (errors_nr, errors_count, &opened_files);

      /* free after output */
      txi_converter_reset (converter);

      /* destroy converter */
      txi_converter_destroy (converter);

    next_input_file:
      /* destroy document */
      txi_document_remove (document);

      free (input_file_name);

      clear_strings_list (&prepended_include_directories);
      clear_strings_list (&converter_texinfo_language_config_dirs);
      clear_options_list (&convert_options);
    }

  free_strings_list (&opened_files);
  free_strings_list (&prepended_include_directories);
  free_strings_list (&converter_texinfo_language_config_dirs);
  free_options_list (&convert_options);

  free_strings_list (&input_files);

  free_options_list (&parser_options);
  free (program_file);

  free_options_list (&cmdline_options);
  free_options_list (&init_files_options);
  free_options_list (&program_options);

  destroy_strings_list (texinfo_language_config_dirs);

  if (errors_count > 0)
    exit (EXIT_FAILURE);
}
