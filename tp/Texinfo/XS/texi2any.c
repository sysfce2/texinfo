/* texi2any.c -- conversion of Texinfo

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

/* the program can be compiled standalone with all the required C code,
   or use libraries with the required C code and also possibilities
   to embed an interpreter, for now Perl and call Perl code.
 */

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
#include "option_types.h"
#include "document_types.h"
#include "converter_types.h"
/* read_var_len */
#include "base_utils.h"
/* for xvasprintf */
#include "text.h"
/* parse_file_path whitespace_chars encode_string xasprintf digit_chars
   wipe_values locate_file_in_dirs */
#include "utils.h"
#include "customization_options.h"
#include "txi_config.h"
/* set_document_options */
#include "document.h"
#include "convert_to_texinfo.h"
#include "create_buttons.h"
/* needed because commands are used to determine expanded regions names */
#include "builtin_commands.h"
/* output_files_open_out output_files_register_closed */
#include "convert_utils.h"
/* destroy_converter_initialization_info new_converter_initialization_info
   encoded_output_file_name*/
#include "converter.h"
/* for html_output_internal_links */
#include "html_converter_api.h"
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

typedef struct FORMAT_SPECIFICATION {
    const char *name;
    unsigned long flags;
    const char *converted_format;
    /* Perl module name */
    const char *module;
    const char *init_file;
} FORMAT_SPECIFICATION;

static FORMAT_SPECIFICATION formats_table[] = {
  {"info", STTF_nodes_tree | STTF_floats
           | STTF_setup_index_entries_sort_strings,
   NULL, "Texinfo::Convert::Info", NULL},
  {"html", STTF_relate_index_entries_to_table_items
           | STTF_move_index_entries_after_items
           | STTF_no_warn_non_empty_parts
           | STTF_nodes_tree | STTF_floats | STTF_split
           | STTF_setup_index_entries_sort_strings
           | STTF_internal_links,
   NULL, "Texinfo::Convert::HTML", NULL},
  {"plaintext", STTF_nodes_tree | STTF_floats | STTF_split
                | STTF_setup_index_entries_sort_strings,
   NULL, "Texinfo::Convert::Plaintext", NULL},
  {"latex", STTF_floats | STTF_move_index_entries_after_items
            | STTF_no_warn_non_empty_parts,
   NULL, "Texinfo::Convert::LaTeX", NULL},
  {"docbook", STTF_move_index_entries_after_items
              | STTF_no_warn_non_empty_parts,
   NULL, "Texinfo::Convert::DocBook", NULL},
  {"epub3", 0, "html", NULL, "epub3.pm"},
  {"texinfoxml", STTF_nodes_tree,
   NULL, "Texinfo::Convert::TexinfoXML", NULL},
  {"debugtree", STTF_split,
   NULL, "Texinfo::DebugTree", NULL},
  {"textcontent", 0, NULL, "Texinfo::Convert::TextContent", NULL},
  {"plaintexinfo", 0, NULL, NULL, NULL},
  {"rawtext", 0, NULL, NULL, NULL},
  {"parse", 0, NULL, NULL, NULL},
  {"structure", STTF_nodes_tree | STTF_floats | STTF_split, NULL, NULL, NULL},
  {NULL, 0, NULL, NULL, NULL}
};

static VALUE_LIST values;

/* options common to parser and converter */
static OPTIONS_LIST program_options;
static OPTIONS_LIST cmdline_options;
static OPTIONS_LIST *init_files_options;

static char *program_file;

static int embedded_interpreter = 0;

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
      txi_config_document_warn (
             "ignoring unrecognized TEXINFO_OUTPUT_FORMAT value `%s'",
                     format_name);
    }
  else
    GNUT_set_from_init_file ("TEXINFO_OUTPUT_FORMAT", new_output_format);
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
              char *option_value = GNUT_decode_input (p);
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
                  GNUT_set_from_cmdline (options_list, option->number, p);
                }
            }
        }
      else
        {
          /* in Perl obsolete options may get another error message */
          txi_config_document_warn ("unknown variable from command line: %s",
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
  size_t ignored_idx = find_string (ignored_formats, format_name);

  txi_config_add_to_option_list (option, format_name, 0);

  if (ignored_idx)
    remove_from_strings_list (ignored_formats, ignored_idx -1);
}

static void
unset_expansion (OPTIONS_LIST *options_list, STRING_LIST *ignored_formats,
                 const char *format_name)
{
  OPTION *option = &options_list->options->EXPANDED_FORMATS;
  size_t ignored_idx = find_string (ignored_formats, format_name);

  txi_config_remove_from_option_list (option, format_name);

  if (!ignored_idx)
    add_string (format_name, ignored_formats);
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
  GNUT_set_from_cmdline (&cmdline_options,
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
            txi_config_document_warn ("overwriting file: %s", opened_file);
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
     = GNUT_get_conf (program_options.options->ERROR_LIMIT.number);
  OPTION *force_option
     = GNUT_get_conf (program_options.options->FORCE.number);
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

/* TODO could also have used strtol */
static int
is_ascii_digit (const char *text)
{
  const char *p = text;
  size_t digits_nr = strspn (text, digit_chars);

  if (digits_nr)
    {
      p += digits_nr;
      if (!*p)
        return 1;
    }
  return 0;
}

static void
warn_deprecated_dirs (DEPRECATED_DIRS_LIST *deprecated_dirs_used)
{
  if (deprecated_dirs_used->number)
    {
      size_t i;
      for (i = 0; i < deprecated_dirs_used->number; i++)
        {
          char *dir_name, *replacement_dir;
          DEPRECATED_DIR_INFO *deprecated_dir_info
           = &deprecated_dirs_used->list[i];
          dir_name = GNUT_decode_input (deprecated_dir_info->obsolete_dir);
          replacement_dir
            = GNUT_decode_input (deprecated_dir_info->reference_dir);

          txi_config_document_warn (
                    "%s directory is deprecated. Use %s instead",
                         dir_name, replacement_dir);

          free (dir_name);
          free (replacement_dir);
        }
    }
  deprecated_dirs_used->number = 0;
}

int loaded_init_files_nr = 0;

static void
locate_and_load_init_file (const char *filename, STRING_LIST *directories,
                           DEPRECATED_DIRS_LIST *deprecated_dirs)
{
  static DEPRECATED_DIRS_LIST deprecated_dirs_used;

  char *file = locate_file_in_dirs (filename, directories, 0,
                                    deprecated_dirs, &deprecated_dirs_used);

  if (file)
    {
      int status = txi_load_init_file (file, embedded_interpreter);

      if (status)
        loaded_init_files_nr++;
      else
        {
          char *decoded_filename = GNUT_decode_input ((char *) filename);
          if (!embedded_interpreter)
            fprintf (stderr, "WARNING: no interpreter, cannot load: %s\n",
                     filename);
          else
            fprintf (stderr, "ERROR: could not load: %s\n",
                     filename);
          free (decoded_filename);
        }
      free (file);
    }
  else
    {
      char *decoded_filename = GNUT_decode_input ((char *) filename);
      txi_config_document_warn ("could not read init file %s",
                                decoded_filename);

      free (decoded_filename);
    }

  if (deprecated_dirs)
    warn_deprecated_dirs (&deprecated_dirs_used);
}

static void
locate_and_load_extension_file (const char *filename, STRING_LIST *directories)
{
  char *file = locate_file_in_dirs (filename, directories, 0, 0, 0);

  if (file)
    {
      int status = txi_load_init_file (file, embedded_interpreter);

      if (status)
        loaded_init_files_nr++;
      else
        {
          char *decoded_filename = GNUT_decode_input ((char *) filename);
          if (!embedded_interpreter)
            fprintf (stderr, "WARNING: no interpreter, cannot load: %s\n",
                     filename);
          else
            fprintf (stderr, "ERROR: could not load: %s\n",
                     filename);
          free (decoded_filename);
        }
      free (file);
    }
  else
    {
      char *decoded_filename = GNUT_decode_input ((char *) filename);
      txi_config_document_warn ("could not read extension file %s",
                                decoded_filename);

      free (decoded_filename);
      exit (EXIT_FAILURE);
    }
}

static void
write_to_file (char *output_text, FILE *file_fh,
               const char *encoded_file_name)
{
  size_t write_len;
  size_t res_len;
  const ENCODING_CONVERSION *conversion = 0;
  char *result_text = 0;
  OPTION *out_encoding_option
      = GNUT_get_conf (program_options.options->OUTPUT_ENCODING_NAME.number);
  if (out_encoding_option && out_encoding_option->o.string
      && strcmp (out_encoding_option->o.string, "utf-8"))
    {
      conversion
        = get_encoding_conversion (out_encoding_option->o.string,
                                   &output_conversions);
      if (conversion)
        result_text = encode_with_iconv (conversion->iconv,
                                            output_text, 0);
    }

  if (!result_text)
    result_text = output_text;

  res_len = strlen (result_text);

  write_len = fwrite (result_text, sizeof (char),
                      res_len, file_fh);

  if (conversion)
    free (result_text);

  if (write_len != res_len)
    { /* register error message instead? */
       fprintf (stderr,
          "ERROR: write to %s failed (%zu/%zu)\n",
                encoded_file_name, write_len, res_len);
    }
}

const char *input_file_suffixes[] = {
".txi",".texinfo",".texi",".txinfo", "", NULL
};

/* If non-zero, show help and exit */
static int print_help_p;

/* if 1 embed interpreter.  If -1 do not embed interpreted.
   If 0 use a compile-time default */
static int embed_interpreter_p;

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
#define _FORMAT_OPT 21
#define XML_OPT 22
#define INTERNAL_LINKS_OPT 23
#define MIMICK_OPT 24
/* can add here */
#define TRACE_INCLUDES_OPT 33
#define NO_VERBOSE_OPT 34
#define HEADERS_OPT 35
#define NO_HEADERS_OPT 36
#define NUMBER_SECTIONS_OPT 37
#define NO_NUMBER_SECTIONS_OPT 38
#define ENABLE_ENCODING_OPT 39
#define DISABLE_ENCODING_OPT 40
#define NUMBER_FOOTNOTES_OPT 41
#define NO_NUMBER_FOOTNOTES_OPT 42
#define NODE_FILES_OPT 43
#define NO_NODE_FILES_OPT 44
#define TRANSLITERATE_FILE_NAMES_OPT 45
#define NO_TRANSLITERATE_FILE_NAMES_OPT 46
#define SPLIT_SIZE_OPT 47
#define DEBUG_OPT 48
#define NO_VALIDATE_OPT 49
#define CSS_INCLUDE_OPT 50
#define CSS_REF_OPT 51
#define CONF_DIR_OPT 52
#define INIT_FILE_OPT 53

#define IFFORMAT_TABLE(upcase, name) \
  {"if" #name, 0, 0, IF ## upcase ## _OPT}, \
  {"no-if" #name, 0, 0, NO_IF ## upcase ## _OPT},

static struct option long_options[] = {
  /* next not in texi2any */
  {"mimick", 0, 0, MIMICK_OPT},
  {"embed-interpreter", 0, &embed_interpreter_p, 1},
  {"no-embed-interpreter", 0, &embed_interpreter_p, -1},

  {"conf-dir", required_argument, 0, CONF_DIR_OPT},
  {"css-include", required_argument, 0, CSS_INCLUDE_OPT},
  {"css-ref", required_argument, 0, CSS_REF_OPT},
  {"debug", required_argument, 0, DEBUG_OPT},
  {"disable-encoding", 0, 0, DISABLE_ENCODING_OPT},
  {"document-language", required_argument, 0, DOCUMENT_LANGUAGE_OPT},
  {"enable-encoding", 0, 0, ENABLE_ENCODING_OPT},
  {"error-limit", required_argument, 0, 'e'},
  {"fill-column", required_argument, 0, 'f'},
  {"footnote-style", required_argument, 0, FOOTNOTE_STYLE_OPT},
  {"force", 0, 0, 'F'},
  {"headers", 0, 0, HEADERS_OPT},
  {"no-headers", 0, 0, NO_HEADERS_OPT},
  {"help", 0, 0, 'h'},
  {"init-file", required_argument, 0, INIT_FILE_OPT},
  {"internal-links", required_argument, 0, INTERNAL_LINKS_OPT},
  {"macro-expand", required_argument, 0, 'E'},
  {"node-files", 0, 0, NODE_FILES_OPT},
  {"no-node-files", 0, 0, NO_NODE_FILES_OPT},
  {"number-footnotes", 0, 0, NUMBER_FOOTNOTES_OPT},
  {"no-number-footnotes", 0, 0, NO_NUMBER_FOOTNOTES_OPT},
  {"number-sections", 0, 0, NUMBER_SECTIONS_OPT},
  {"no-number-sections", 0, 0, NO_NUMBER_SECTIONS_OPT},
  {"paragraph-indent", required_argument, 0, 'p'},
  {"no-warn", 0, 0, NO_WARN_OPT},
  {"out", required_argument, 0, 'o'},
  {"output", required_argument, 0, 'o'},
  {"no-split", 0, 0, NO_SPLIT_OPT},
  {"split", required_argument, 0, SPLIT_OPT},
  {"set-customization-variable", required_argument, 0, 'c'},
  {"split-size", required_argument, 0, SPLIT_SIZE_OPT},
  {"trace-include", 0, 0, TRACE_INCLUDES_OPT},
  {"transliterate-file-names", 0, 0, TRANSLITERATE_FILE_NAMES_OPT},
  {"no-transliterate-file-names", 0, 0, NO_TRANSLITERATE_FILE_NAMES_OPT},
  {"no-validate", 0, 0, NO_VALIDATE_OPT},
  {"no-pointer-validate", 0, 0, NO_VALIDATE_OPT},
  {"verbose", 0, 0, 'v'},
  {"no-verbose", 0, 0, NO_VERBOSE_OPT},
  {"version", 0, 0, 'V'},
  {"html", 0, 0, _FORMAT_OPT},
  {"plaintext", 0, 0, _FORMAT_OPT},
  {"latex", 0, 0, _FORMAT_OPT},
  {"info", 0, 0, _FORMAT_OPT},
  {"docbook", 0, 0, _FORMAT_OPT},
  {"epub3", 0, 0, _FORMAT_OPT},
  {"xml", 0, 0, XML_OPT},
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

/* we use env in case a Perl interpreter is embedded in order to blindly
   follow the documentation in perlembed, which is not very explicit */
int
main (int argc, char *argv[], char *env[])
{
  int getopt_long_index;
  const char *locale_encoding = 0;
  const char *input_file_arg;
  int status;
  char *program_file_name_and_directory[2];
  /*
  char *command_directory;
   */
  OPTIONS_LIST parser_options;
  OPTIONS_LIST convert_options;
  size_t errors_count = 0;
  size_t errors_nr;
  STRING_LIST *texinfo_language_config_dirs;
  STRING_LIST ignored_formats;
  STRING_LIST default_expanded_formats;
  STRING_LIST prepend_dirs;
  CONVERTER_INITIALIZATION_INFO *format_defaults;
  DEPRECATED_DIRS_LIST deprecated_directories;
  char *top_srcdir;
  char *top_builddir;
  char *tp_builddir = 0;
  OPTION *html_math_option;
  OPTION *highlight_syntax_option;
  OPTION *test_option;
  OPTION *no_warn_option;
  OPTION *format_menu_option;
  OPTION *debug_option;
  OPTION *message_encoding_option;
  int no_warn = 0;
  int test_mode_set = 0;
  int debug = 0;
  size_t i;
  STRING_LIST input_files;
  STRING_LIST opened_files;
  STRING_LIST prepended_include_directories;
  STRING_LIST conf_dirs;
  STRING_LIST converter_config_dirs;
  STRING_LIST converter_init_dirs;
  STRING_LIST *converter_config_dirs_array_ref;
  STRING_LIST internal_extension_dirs;
  STRING_LIST init_files;
  STRING_LIST init_file_dirs;
  char *extensions_dir;
  char *texinfo_output_format_env;
  OPTION *output_format_option;
  OPTION *expanded_formats_option;
  const char *output_format;
  const char *converted_format;
  FORMAT_SPECIFICATION *format_specification = 0;
  int do_menu = 0;
  size_t format_menu_option_nr;
  char *conversion_format_menu_default = 0;
  int texinfo_uninstalled = 1;
  const char *converterdatadir = DATADIR "/" CONVERTER_CONFIG;
  const char *curdir = ".";
  CONVERTER_INITIALIZATION_INFO *converter_init_info;
  const char *external_module = 0;
  int default_is_html = 1;
  char *init_file_format;
  const char *set_message_encoding = 0;
  const char *version_for_embedded_interpreter_check;

  parse_file_path (argv[0], program_file_name_and_directory);
  program_file = program_file_name_and_directory[0];
  free (program_file_name_and_directory[1]);
  /* command_directory = program_file_name_and_directory[1]; */

#ifdef EMBED_PERL
  embedded_interpreter = 1;
  default_is_html = 0;
#endif

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

  if (texinfo_uninstalled)
    xasprintf (&extensions_dir, "%s/tp/ext", top_srcdir);
  else
    xasprintf (&extensions_dir, "%s/ext", converterdatadir);

  memset (&internal_extension_dirs, 0, sizeof (STRING_LIST));

  add_string (extensions_dir, &internal_extension_dirs);

  txi_general_setup (texinfo_uninstalled, converterdatadir,
                     tp_builddir, top_srcdir, 0);

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

  version_for_embedded_interpreter_check = PACKAGE_VERSION_CONFIG;

  if (texinfo_uninstalled)
    {
      add_option_value (&program_options, "PACKAGE_AND_VERSION", 0,
                        PACKAGE_NAME_CONFIG " " PACKAGE_VERSION_CONFIG "+dev");
      version_for_embedded_interpreter_check = PACKAGE_VERSION_CONFIG "+dev";
    }

  /* set default output format.  Is info in texi2any */
  /* better than making it the default value independently of the
     implementation */
  if (default_is_html)
    add_option_value (&program_options, "TEXINFO_OUTPUT_FORMAT", 0, "html");
  else
    add_option_value (&program_options, "TEXINFO_OUTPUT_FORMAT", 0, "info");

  /*
   if ($^O eq 'MSWin32') {
     $main_program_set_options->{'DOC_ENCODING_FOR_INPUT_FILE_NAME'} = 0;
   }
  */

  memset (&deprecated_directories, 0, sizeof (DEPRECATED_DIRS_LIST));

  texinfo_language_config_dirs
   = set_subdir_directories ("texinfo", &deprecated_directories);

  converter_config_dirs_array_ref
   = set_subdir_directories (CONVERTER_CONFIG, &deprecated_directories);

  memset (&converter_config_dirs, 0, sizeof (STRING_LIST));
  add_string (curdir, &converter_config_dirs);
  copy_strings (&converter_config_dirs, converter_config_dirs_array_ref);

  memset (&converter_init_dirs, 0, sizeof (STRING_LIST));
  copy_strings (&converter_init_dirs, &converter_config_dirs);

  for (i = 0; i < texinfo_language_config_dirs->number; i++)
    {
      char *init_dir;
      DEPRECATED_DIR_INFO *deprecated_dir_info;
      char *texinfo_config_dir = texinfo_language_config_dirs->list[i];

      xasprintf (&init_dir, "%s/init", texinfo_config_dir);
      add_string (init_dir, &converter_init_dirs);

      deprecated_dir_info = find_deprecated_dir_info (&deprecated_directories,
                                                      texinfo_config_dir);
      if (deprecated_dir_info)
        {
          char *reference_init_dir;
          xasprintf (&reference_init_dir, "%s/init",
                                           deprecated_dir_info->reference_dir);
          add_new_deprecated_dir_info (&deprecated_directories,
                                       init_dir, reference_init_dir);
          free (reference_init_dir);
        }
      free (init_dir);
    }
  add_string (extensions_dir, &converter_init_dirs);

  memset (&prepend_dirs, 0, sizeof (STRING_LIST));
  memset (&conf_dirs, 0, sizeof (STRING_LIST));

  memset (&input_files, 0, sizeof (STRING_LIST));

  initialize_options_list (&cmdline_options);

  store_value (&values, "txicommandconditionals", "1");

  /* always consider that command-line array options are set from
     the command-line */

  options_list_add_option_number (&cmdline_options,
                     cmdline_options.options->CSS_FILES.number);
  options_list_add_option_number (&cmdline_options,
                     cmdline_options.options->CSS_REFS.number);
  options_list_add_option_number (&cmdline_options,
                     cmdline_options.options->INCLUDE_DIRECTORIES.number);
  options_list_add_option_number (&cmdline_options,
               cmdline_options.options->TEXINFO_LANGUAGE_DIRECTORIES.number);
  options_list_add_option_number (&cmdline_options,
                     cmdline_options.options->EXPANDED_FORMATS.number);


  memset (&ignored_formats, 0, sizeof (STRING_LIST));
  memset (&init_files, 0, sizeof (STRING_LIST));

  init_files_options =
    GNUT_initialize_customization (&program_file, &program_options,
                                   &cmdline_options);
  /* initialize_options_list (&init_files_options); */

  while (1)
    {
      int option_character;

      option_character = getopt_long (argc, argv, "VhvFc:D:e:f:I:P:o:E:U:",
                                      long_options,
                                      &getopt_long_index);

      if (option_character == -1)
        break;

      switch (option_character)
        {
        case 0:
          /* option sets a flag, nothing to do */
          break;
        case _FORMAT_OPT:
          set_cmdline_format (long_options[getopt_long_index].name);
          break;
        case XML_OPT:
          set_cmdline_format ("texinfoxml");
          break;
        case MIMICK_OPT:
          free (program_file);
          program_file = strdup ("texi2any");
          break;
        case 'c':
          get_cmdline_customization_option (&cmdline_options, optarg);
          break;
        case DOCUMENT_LANGUAGE_OPT:
          {
            const char *region_code;
            int lang_is_valid;
            int region_is_valid;
            char *lang;
            GNUT_set_from_cmdline (&cmdline_options,
                              cmdline_options.options->documentlanguage.number,
                              optarg);

            lang = analyze_documentlanguage_argument (optarg, &region_code,
                                        &lang_is_valid, &region_is_valid);
            if (!lang_is_valid)
              {
                txi_config_document_warn ("%s is not a valid language code",
                                         lang);
              }
            free (lang);
            if (!region_is_valid)
              {
                txi_config_document_warn ("%s is not a valid region code",
                                          region_code);
              }
          }
          break;
        case DEBUG_OPT:
          GNUT_set_from_cmdline (&cmdline_options,
                            cmdline_options.options->DEBUG.number,
                            optarg);
          break;
        case 'e':
          GNUT_set_from_cmdline (&cmdline_options,
                            cmdline_options.options->ERROR_LIMIT.number,
                            optarg);
          break;
        case 'f':
          GNUT_set_from_cmdline (&cmdline_options,
                            cmdline_options.options->FILLCOLUMN.number,
                            optarg);
          break;
        case 'E':
          GNUT_set_from_cmdline (&cmdline_options,
                            cmdline_options.options->MACRO_EXPAND.number,
                            optarg);
          break;
        case 'F':
          GNUT_set_from_cmdline (&cmdline_options,
                            cmdline_options.options->FORCE.number, "1");
          break;
        case DISABLE_ENCODING_OPT:
          GNUT_set_from_cmdline (&cmdline_options,
                            cmdline_options.options->ENABLE_ENCODING.number,
                            "0");
          break;
        case ENABLE_ENCODING_OPT:
          GNUT_set_from_cmdline (&cmdline_options,
                            cmdline_options.options->ENABLE_ENCODING.number,
                            "1");
          break;
        case INTERNAL_LINKS_OPT:
          GNUT_set_from_cmdline (&cmdline_options,
                            cmdline_options.options->INTERNAL_LINKS.number,
                            optarg);
          break;
        case NODE_FILES_OPT:
          GNUT_set_from_cmdline (&cmdline_options,
                            cmdline_options.options->NODE_FILES.number,
                            "1");
          break;
        case NO_NODE_FILES_OPT:
          GNUT_set_from_cmdline (&cmdline_options,
                            cmdline_options.options->NODE_FILES.number,
                            "0");
          break;
        case NUMBER_FOOTNOTES_OPT:
          GNUT_set_from_cmdline (&cmdline_options,
                            cmdline_options.options->NUMBER_FOOTNOTES.number,
                            "1");
          break;
        case NO_NUMBER_FOOTNOTES_OPT:
          GNUT_set_from_cmdline (&cmdline_options,
                            cmdline_options.options->NUMBER_FOOTNOTES.number,
                            "0");
          break;
        case NUMBER_SECTIONS_OPT:
          GNUT_set_from_cmdline (&cmdline_options,
                            cmdline_options.options->NUMBER_SECTIONS.number,
                            "1");
          break;
        case NO_NUMBER_SECTIONS_OPT:
          GNUT_set_from_cmdline (&cmdline_options,
                            cmdline_options.options->NUMBER_SECTIONS.number,
                            "0");
          break;
        case SPLIT_SIZE_OPT:
          GNUT_set_from_cmdline (&cmdline_options,
                            cmdline_options.options->SPLIT_SIZE.number,
                            optarg);
          break;
        case TRACE_INCLUDES_OPT:
          GNUT_set_from_cmdline (&cmdline_options,
                            cmdline_options.options->TRACE_INCLUDES.number,
                            "1");
          break;
        case TRANSLITERATE_FILE_NAMES_OPT:
          GNUT_set_from_cmdline (&cmdline_options,
                     cmdline_options.options->TRANSLITERATE_FILE_NAMES.number,
                            "1");
          break;
        case NO_TRANSLITERATE_FILE_NAMES_OPT:
          GNUT_set_from_cmdline (&cmdline_options,
                     cmdline_options.options->TRANSLITERATE_FILE_NAMES.number,
                            "0");
          break;
        case NO_VALIDATE_OPT:
          GNUT_set_from_cmdline (&cmdline_options,
                            cmdline_options.options->novalidate.number, "1");
          break;
        case 'v':
          GNUT_set_from_cmdline (&cmdline_options,
                            cmdline_options.options->VERBOSE.number, "1");
          break;
        case NO_VERBOSE_OPT:
          GNUT_set_from_cmdline (&cmdline_options,
                            cmdline_options.options->VERBOSE.number, "0");
          break;
        case NO_WARN_OPT:
          GNUT_set_from_cmdline (&cmdline_options,
                            cmdline_options.options->NO_WARN.number, "1");
          break;
        case NO_HEADERS_OPT:
          GNUT_set_from_cmdline (&cmdline_options,
                            cmdline_options.options->HEADERS.number, "0");
          GNUT_set_from_cmdline (&cmdline_options,
                            cmdline_options.options->FORMAT_MENU.number,
                            "nomenu");
          {
            size_t option_nr
              = program_options.options->TEXINFO_OUTPUT_FORMAT.number;
            OPTION *output_format_option = GNUT_get_conf (option_nr);
            if (output_format_option && output_format_option->o.string
                && !strcmp (output_format_option->o.string, "info"))
              GNUT_set_customization_default (option_nr, "plaintext");
          }
          break;
        case HEADERS_OPT:
          GNUT_set_from_cmdline (&cmdline_options,
                            cmdline_options.options->HEADERS.number, "1");
          GNUT_set_from_cmdline (&cmdline_options,
                            cmdline_options.options->FORMAT_MENU.number,
                            "set_format_menu_from_cmdline_header_option");
          break;
        case 'I':
          {
            OPTION *option = &cmdline_options.options->INCLUDE_DIRECTORIES;
            push_include_directory (option->o.strlist, optarg);
          }
          break;
        case 'P':
          push_include_directory (&prepend_dirs, optarg);
          break;
        case CONF_DIR_OPT:
          push_include_directory (&conf_dirs, optarg);
          break;
        case CSS_INCLUDE_OPT:
          {
            OPTION *option = &cmdline_options.options->CSS_FILES;
            add_string (optarg, option->o.strlist);
          }
          break;
        case CSS_REF_OPT:
          {
            OPTION *option = &cmdline_options.options->CSS_REFS;
            char *value = GNUT_decode_input ((char *) optarg);
            add_string (value, option->o.strlist);
            free (value);
          }
          break;
        case 'h':
          print_help_p = 1;
          break;
        case INIT_FILE_OPT:
          add_string (optarg, &init_files);
          break;
        case 'D':
          {
           /* actually const but constrained by prototypes */
            char *value = GNUT_decode_input ((char *) optarg);
            const char *p = value;
            size_t flag_len = strcspn (value, whitespace_chars);
            if (flag_len)
              {
                size_t spaces_len;
                const char *flag_value = 0;
                char *flag = strndup (value, flag_len);

                p += flag_len;
                spaces_len = strspn (p, whitespace_chars);
                if (spaces_len)
                  {
                    p += spaces_len;
                    if (*p)
                      flag_value = p;
                  }
                if (!flag_value)
                  flag_value = "1";
                store_value (&values, flag, flag_value);
                free (flag);
              }
            free (value);
          }
          break;
        case 'U':
          {
           /* actually const but constrained by prototypes */
            char *value = GNUT_decode_input ((char *) optarg);
            clear_value (&values, value);
            free (value);
          }
          break;
        case 'V':
          {
            char *encoded_message;
            char *message
             = CONVERTER_CONFIG " (GNU texinfo) " PACKAGE_VERSION_CONFIG "\n\n";
            char *formatted_message;

            encoded_message = GNUT_encode_message (message);
            printf ("%s", encoded_message);
            free (encoded_message);

            xasprintf (&formatted_message, _(
  "Copyright (C) %s Free Software Foundation, Inc.\nLicense GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>\nThis is free software: you are free to change and redistribute it.\nThere is NO WARRANTY, to the extent permitted by law."),
                       "2024");
            encoded_message = GNUT_encode_message (formatted_message);
            free (formatted_message);
            printf ("%s\n", encoded_message);
            free (encoded_message);

            exit (EXIT_SUCCESS);
          }
          break;
        case FOOTNOTE_STYLE_OPT:
          {
            /* actually const but constrained by prototypes */
            char *value = GNUT_decode_input ((char *) optarg);
            if (!strcmp (value, "end") || !strcmp (value, "separate"))
              {
                GNUT_set_from_cmdline (&cmdline_options,
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
                encoded_message = GNUT_encode_message (formatted_message);
                free (formatted_message);
                fprintf (stderr, "%s\n", encoded_message);
                free (encoded_message);
                exit (EXIT_FAILURE);
              }
            free (value);
          }
          break;
        case 'p':
          {
            /* actually const but constrained by prototypes */
            char *value = GNUT_decode_input ((char *) optarg);
            if (!strcmp (value, "none") || !strcmp (value, "asis")
                || is_ascii_digit (value))
              {
                GNUT_set_from_cmdline (&cmdline_options,
                          cmdline_options.options->paragraphindent.number,
                                  value);
              }
            else
              {
                char *formatted_message;
                char *encoded_message;

                xasprintf (&formatted_message,
    _("%s:  --paragraph-indent arg must be numeric/`none'/`asis', not `%s'."),
                  program_file, value);
                encoded_message = GNUT_encode_message (formatted_message);
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
            char *decoded_string = GNUT_decode_input ((char *) optarg);
            if (strcmp (optarg, "-"))
              {
                size_t opt_len = strlen (optarg);
                struct stat finfo;

                if (optarg[opt_len -1] == '/'
                    || (stat (optarg, &finfo) == 0 && S_ISDIR (finfo.st_mode)))
                  {
                    GNUT_set_from_cmdline (&cmdline_options,
                                      option->number, "undef");
                    option = &cmdline_options.options->SUBDIR;
                  }
              }
            GNUT_set_from_cmdline (&cmdline_options,
                                   option->number, decoded_string);
            free (decoded_string);
          }
          break;
        case NO_SPLIT_OPT:
          GNUT_set_from_cmdline (&cmdline_options,
                            cmdline_options.options->SPLIT.number, "");
          GNUT_set_from_cmdline (&cmdline_options,
                            cmdline_options.options->SPLIT_SIZE.number,
                            "undef");
          break;
        case SPLIT_OPT:
          {
            char *split = GNUT_decode_input (optarg);
            size_t i;
            for (i = 0; possible_split[i]; i++)
              if (!strcmp (possible_split[i], optarg))
                break;
            if (!possible_split[i])
              {
                txi_config_document_warn ("%s is not a valid split possibility",
                               split);
                free (split);
                split = strdup ("node");
              }
            GNUT_set_from_cmdline (&cmdline_options,
                              cmdline_options.options->SPLIT.number, split);
            free (split);
          }
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
        case '?': /* unknown option or option with missing argument */
          exit (EXIT_FAILURE);
          break;
        default:
          fprintf (stderr,
                   "BUG: getopt_long unexpected option_character: %d '%c'\n",
                   option_character, (char) option_character);
          exit (EXIT_FAILURE);
        }
    }

  if (print_help_p)
    {
      char *encoded_message;
      char *endptr;
      const char *option_value;
      int paragraphindent_size;
      TEXT help_message;
      OPTION *error_limit_option
        = GNUT_get_conf (program_options.options->ERROR_LIMIT.number);

      text_init (&help_message);
      text_printf (&help_message,
                   _("Usage: %s [OPTION]... TEXINFO-FILE..."), program_file);
      text_append_n (&help_message, "\n\n", 2);
      /* no added translations, reuse translations with they already exist */
      if (default_is_html)
        text_append (&help_message,
        "Translate Texinfo source documentation to various other formats.");
      else
    /* lie on the name, but this is no such a big lie */
        text_append (&help_message,
   _("Translate Texinfo source documentation to various other formats, by default\nInfo files suitable for reading online with Emacs or standalone GNU Info.\n\nThis program is commonly installed as both `makeinfo' and `texi2any';\nthe behavior is identical, and does not depend on the installed name."));
      text_append_n (&help_message, "\n\n", 2);

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
        _("      --no-validate           suppress node cross-reference validation."));
      text_append_n (&help_message, "\n", 1);
      text_append (&help_message,
        _("      --conf-dir=DIR          search also for initialization files in DIR."));
      text_append_n (&help_message, "\n", 1);
      text_append (&help_message,
        _("      --init-file=FILE        load FILE to modify the default behavior."));
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

      if (default_is_html)
        text_append (&help_message, "Output format selection (default is to produce HTML):");
      else
        text_append (&help_message, _("Output format selection (default is to produce Info):"));
      text_append_n (&help_message, "\n", 1);
      text_append (&help_message,
        _("      --docbook               output Docbook XML."));
      text_append_n (&help_message, "\n", 1);
      text_append (&help_message,
        _("      --html                  output HTML."));
      text_append_n (&help_message, "\n", 1);
      text_append (&help_message,
        _("      --epub3                 output EPUB 3."));
      text_append_n (&help_message, "\n", 1);
      text_append (&help_message,
        _("      --latex                 output LaTeX."));
      text_append_n (&help_message, "\n", 1);
      text_append (&help_message,
        _("      --plaintext             output plain text rather than Info."));
      text_append_n (&help_message, "\n", 1);
      text_append (&help_message,
        _("      --xml                   output Texinfo XML."));
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
   "      --[no-]number-sections  output chapter and sectioning numbers;\n                                default is on."));
      text_append_n (&help_message, "\n", 1);
      text_append (&help_message, _(
   "  -o, --output=DEST           output to DEST.\n                                With split output, create DEST as a directory\n                                and put the output files there.\n                                With non-split output, if DEST is already\n                                a directory or ends with a /,\n                                put the output file there.\n                                Otherwise, DEST names the output file."));
      text_append_n (&help_message, "\n", 1);
      text_append (&help_message, _(
   "      --disable-encoding      do not output accented and special characters\n                                in Info and plain text output based on document\n                                encoding."));
      text_append_n (&help_message, "\n", 1);
      text_append (&help_message, _(
   "      --enable-encoding       override --disable-encoding (default)."));
      text_append_n (&help_message, "\n\n", 2);

      text_append (&help_message, _("Options for Info and plain text:"));
      text_append_n (&help_message, "\n", 1);
      text_printf (&help_message, _(
   "      --fill-column=NUM       break Info lines at NUM columns (default %d)."),
  txi_base_sorted_options[program_options.options->FILLCOLUMN.number -1]->o.integer);
      text_append_n (&help_message, "\n", 1);
      text_append (&help_message, _(
   "      --footnote-style=STYLE  output footnotes in Info according to STYLE:\n                                `separate' to put them in their own node;\n                                `end' to put them at the end of the node, in\n                                which they are defined (this is the default)."));
      text_append_n (&help_message, "\n", 1);

      option_value
  = txi_base_sorted_options[program_options.options->paragraphindent.number -1]->o.string;
      paragraphindent_size = strtol (option_value, &endptr, 10);
      text_printf (&help_message, _(
   "      --paragraph-indent=VAL  indent Info paragraphs by VAL spaces (default %d).\n                                If VAL is `none', do not indent; if VAL is\n                                `asis', preserve existing indentation."),
                   paragraphindent_size);
      text_append_n (&help_message, "\n", 1);
      text_printf (&help_message, _(
   "      --split-size=NUM        split Info files at size NUM (default %d)."),
  txi_base_sorted_options[program_options.options->SPLIT_SIZE.number -1]->o.integer);
      text_append_n (&help_message, "\n\n", 2);

      text_append (&help_message, _("Options for HTML:"));
      text_append_n (&help_message, "\n", 1);
      text_append (&help_message, _(
   "      --css-include=FILE      include FILE in HTML <style> output;\n                                read stdin if FILE is -."));
      text_append_n (&help_message, "\n", 1);
      text_append (&help_message, _(
   "      --css-ref=URL           generate CSS reference to URL."));
      text_append_n (&help_message, "\n", 1);
      text_append (&help_message, _(
   "      --internal-links=FILE   produce list of internal links in FILE."));
      text_append_n (&help_message, "\n", 1);
      text_append (&help_message, _(
   "      --split=SPLIT           split at SPLIT, where SPLIT may be `chapter',\n                                `section' or `node'."));
      text_append_n (&help_message, "\n", 1);
      text_append (&help_message, _(
   "      --transliterate-file-names  use file names in ASCII transliteration."));
      text_append_n (&help_message, "\n", 1);
      text_append (&help_message, _(
   "      --node-files            produce redirection files for nodes and\n                                anchors; default is set only if split."));
      text_append_n (&help_message, "\n\n", 2);

      text_append (&help_message, _("Input file options:"));
      text_append_n (&help_message, "\n", 1);
      text_append (&help_message,
        _(" -D VAR                       define the variable VAR, as with @set."));
      text_append_n (&help_message, "\n", 1);
      text_append (&help_message,
        _(" -D 'VAR VAL'                 define VAR to VAL (one shell argument)."));
      text_append_n (&help_message, "\n", 1);
      text_append (&help_message,
        _(" -I DIR                       append DIR to the @include search path."));
      text_append_n (&help_message, "\n", 1);
      text_append (&help_message,
        _(" -P DIR                       prepend DIR to the @include search path."));
      text_append_n (&help_message, "\n", 1);
      text_append (&help_message,
        _(" -U VAR                       undefine the variable VAR, as with @clear."));
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

      encoded_message = GNUT_encode_message (help_message.text);
      free (help_message.text);
      printf ("%s", encoded_message);
      free (encoded_message);
      exit (EXIT_SUCCESS);
    }

  if (cmdline_options.options->TEXI2HTML.o.integer > 0)
    {
      set_format ("html");
      store_value (&values, "TEXI2HTML", "1");
    }

  if (embed_interpreter_p == -1)
    embedded_interpreter = 0;
  else if (embed_interpreter_p == 1)
    embedded_interpreter = 1;

  if (!embedded_interpreter)
    /* it is the best we have without an embedded interpreter */
    add_option_value (&program_options, "XS_STRXFRM_COLLATION_LOCALE", 0,
                      "en_US");

  txi_customization_loading_setup (embedded_interpreter, &argc, &argv, &env,
                                   version_for_embedded_interpreter_check);

  /* TODO different from Perl, to be discussed on the list which
     one is better, load within the command line loop, or after */
  memset (&init_file_dirs, 0, sizeof (STRING_LIST));

  test_option = GNUT_get_conf (program_options.options->TEST.number);
  if (test_option && test_option->o.integer > 0)
    test_mode_set = 1;

  if (!test_mode_set)
    {
      copy_strings (&init_file_dirs, &conf_dirs);
      copy_strings (&init_file_dirs, &converter_init_dirs);
    }

  for (i = 0; i < init_files.number; i++)
    {
      char *init_file = init_files.list[i];
      if (test_mode_set)
        locate_and_load_init_file (init_file, &conf_dirs, 0);
      else
        locate_and_load_init_file (init_file, &init_file_dirs,
                                   &deprecated_directories);
    }

  free_strings_list (&init_file_dirs);
  free_strings_list (&init_files);

  html_math_option = GNUT_get_conf (program_options.options->HTML_MATH.number);
  if (html_math_option && html_math_option->o.string
      && !strcmp (html_math_option->o.string, "l2h"))
    locate_and_load_extension_file ("latex2html.pm", &internal_extension_dirs);

  if (html_math_option && html_math_option->o.string
      && !strcmp (html_math_option->o.string, "t4h"))
    locate_and_load_extension_file ("tex4ht.pm", &internal_extension_dirs);

  highlight_syntax_option
    = GNUT_get_conf (program_options.options->HIGHLIGHT_SYNTAX.number);
  if (highlight_syntax_option && highlight_syntax_option->o.string
      && strlen (highlight_syntax_option->o.string))
    locate_and_load_extension_file ("highlight_syntax.pm",
                                    &internal_extension_dirs);

  /* re-set in case it was set in init files */
  test_option = GNUT_get_conf (program_options.options->TEST.number);
  if (test_option && test_option->o.integer > 0)
    test_mode_set = 1;

  no_warn_option = GNUT_get_conf (program_options.options->NO_WARN.number);
  if (no_warn_option && no_warn_option->o.integer > 0)
    no_warn = 1;

  debug_option = GNUT_get_conf (program_options.options->DEBUG.number);
  if (debug_option && debug_option->o.integer > 0)
    debug = 1;

  if (test_mode_set)
    {
      add_option_value (&program_options, "PACKAGE_VERSION", 0, "");
      add_option_value (&program_options, "PACKAGE", 0, "texinfo");
      add_option_value (&program_options, "PACKAGE_NAME", 0, "GNU Texinfo");
      add_option_value (&program_options, "PACKAGE_AND_VERSION", 0,
                                          "texinfo");
      add_option_value (&program_options, "PACKAGE_URL", 0,
                                     "https://www.gnu.org/software/texinfo/");
      add_option_value (&program_options, "PROGRAM", 0, "texi2any");

      free (program_file);
      program_file = strdup ("texi2any");
    }

  init_file_format = GNUT_get_format_from_init_file ();
  if (init_file_format)
    {
      set_format (init_file_format);
      free (init_file_format);
    }

  texinfo_output_format_env = getenv ("TEXINFO_OUTPUT_FORMAT");
  if (texinfo_output_format_env && strlen (texinfo_output_format_env))
    {
      char *format_name = GNUT_decode_input (texinfo_output_format_env);
      set_format (format_name);
      free (format_name);
    }

  output_format_option
    = GNUT_get_conf (program_options.options->TEXINFO_OUTPUT_FORMAT.number);
  output_format = output_format_option->o.string;

  if (!test_mode_set
      && conversion_paths_info.texinfo_uninstalled
      && conversion_paths_info.p.uninstalled.top_srcdir)
    {
      char *in_source_util_dir;
      xasprintf (&in_source_util_dir, "%s/util",
                 conversion_paths_info.p.uninstalled.top_srcdir);
      add_string (in_source_util_dir, texinfo_language_config_dirs);
      free (in_source_util_dir);
    }


  for (i = 0; formats_table[i].name; i++)
    {
      if (!strcmp (formats_table[i].name, output_format))
        {
          format_specification = &formats_table[i];
          break;
        }
    }

  /* for a format setup with an init file */
  if (format_specification->init_file)
    locate_and_load_extension_file (format_specification->init_file,
                                    &internal_extension_dirs);

  if (format_specification->converted_format)
    {
      converted_format = format_specification->converted_format;
  /* reset the format_specification to the converted_format specification */
      for (i = 0; formats_table[i].name; i++)
        {
          if (!strcmp (formats_table[i].name, converted_format))
            {
              format_specification = &formats_table[i];
              break;
            }
        }
    }
  else
    converted_format = output_format;

  memset (&default_expanded_formats, 0, sizeof (STRING_LIST));
  format_expanded_formats (&default_expanded_formats, format_specification);

  expanded_formats_option = &cmdline_options.options->EXPANDED_FORMATS;

  for (i = 0; i < ignored_formats.number; i++)
    {
      size_t ignored_fmt_nr
         = find_string (&default_expanded_formats, ignored_formats.list[i]);
      if (ignored_fmt_nr)
        remove_from_strings_list (&default_expanded_formats, ignored_fmt_nr-1);
    }
  for (i = 0; i < default_expanded_formats.number; i++)
    {
      txi_config_add_to_option_list (expanded_formats_option,
                                     default_expanded_formats.list[i], 0);
    }

  free_strings_list (&default_expanded_formats);

  if (format_specification->module)
    {
      if (!strcmp (converted_format, "html"))
        {
          /* TODO INTERNAL_LINKS implemented in C anymore, but need to do
             an XS interface */
          OPTION *internal_links_option
            = GNUT_get_conf (program_options.options->INTERNAL_LINKS.number);
          /* setup of need_latex to be kept in sync with setup of
             CONVERT_TO_LATEX_IN_MATH in html_initialize_output_state
             based on HTML_MATH */
          int need_latex = 0;
          OPTION *convert_to_latex_in_math_option
            = GNUT_get_conf (
              program_options.options->CONVERT_TO_LATEX_IN_MATH.number);
          if (!convert_to_latex_in_math_option
              || convert_to_latex_in_math_option->o.integer < 0)
            {
              OPTION *option_html_math
                = GNUT_get_conf (program_options.options->HTML_MATH.number);
              if (option_html_math && option_html_math->o.string)
                need_latex = 1;
            }

          /* to be kept in sync with build_html_perl_info.c
              html_pass_conversion_initialization */
          /* internal links code is in Perl */
          if (loaded_init_files_nr > 0
              || need_latex || (internal_links_option
                                && internal_links_option->o.string))
            external_module = format_specification->module;
        }
      else
        external_module = format_specification->module;

      if (external_module)
        {
          if (!embedded_interpreter)
            {
              fprintf (stderr, "ERROR: no interpreter for %s\n",
                       external_module);
              exit (EXIT_FAILURE);
            }
          else if (debug)
            fprintf (stderr, "ctexi2any: loading module: %s\n", external_module);
        }
    }

  /* corresponds to eval "require $module"; in texi2any.pl */
  txi_converter_output_format_setup (converted_format, external_module);

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
                                                   external_module,
                                                   &cmdline_options);

  format_menu_option_nr = program_options.options->FORMAT_MENU.number;

  /* Converters may set format_defaults to NULL (Text converter) */
  if (format_defaults)
    {
      if (format_defaults->conf.options->FORMAT_MENU.o.string)
        conversion_format_menu_default
          = strdup (format_defaults->conf.options->FORMAT_MENU.o.string);
      if (conversion_format_menu_default != 0)
        {
          /*
          fprintf (stderr, "FORMAT_MENU %s\n", conversion_format_menu_default);
           */
          GNUT_set_customization_default (format_menu_option_nr,
                                     conversion_format_menu_default);
        }

      destroy_converter_initialization_info (format_defaults);
    }

  /* special case for FORMAT_MENU of delayed setting based in
     some case on converter */
  format_menu_option = GNUT_get_conf (format_menu_option_nr);
  if (format_menu_option && format_menu_option->o.string
      && !strcmp (format_menu_option->o.string,
                  "set_format_menu_from_cmdline_header_option"))
    {
      if (conversion_format_menu_default
          && strcmp (conversion_format_menu_default, "nomenu"))
        {
          GNUT_set_from_cmdline (&cmdline_options, format_menu_option_nr,
                            conversion_format_menu_default);
        }
      else
        GNUT_set_from_cmdline (&cmdline_options,
                               format_menu_option_nr, "menu");
    }

  free (conversion_format_menu_default);

  format_menu_option = GNUT_get_conf (format_menu_option_nr);
  if (!format_menu_option || !format_menu_option->o.string
                          || !strcmp (format_menu_option->o.string,
                                         "menu"))
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
          OPTION *option = GNUT_get_conf (parser_option->number);
          if (option)
            {
              options_list_add_option_number (&parser_options,
                                              parser_option->number);
              copy_option (parser_option, option);
            }
        }
    }

  message_encoding_option
    = GNUT_get_conf (program_options.options->MESSAGE_ENCODING.number);
  if (message_encoding_option && message_encoding_option->o.string)
    set_message_encoding = message_encoding_option->o.string;

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
      encoded_message = GNUT_encode_message (formatted_message);
      free (formatted_message);
      fprintf (stderr, "%s\n", encoded_message);
      free (encoded_message);

      xasprintf (&formatted_message,
                 _("Try `%s --help' for more information."),
                 program_file);
      encoded_message = GNUT_encode_message (formatted_message);
      free (formatted_message);
      fprintf (stderr, "%s\n", encoded_message);
      free (encoded_message);
      exit (EXIT_FAILURE);
    }

  initialize_options_list (&convert_options);

  memset (&opened_files, 0, sizeof (STRING_LIST));
  memset (&prepended_include_directories, 0, sizeof (STRING_LIST));
  converter_init_info = new_converter_initialization_info ();

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
      OPTION *converter_texinfo_language_directories_option;
      STRING_LIST *cmdline_include_dirs
        = cmdline_options.options->INCLUDE_DIRECTORIES.o.strlist;
      STRING_LIST *parser_include_dirs
        = parser_options.options->INCLUDE_DIRECTORIES.o.strlist;
      STRING_LIST *converter_include_dirs;
      STRING_LIST *converter_texinfo_language_config_dirs;
      char *input_file_path = 0;
      size_t file_path_len;
      size_t j;

      input_file_arg = input_files.list[i];

      file_path_len = strlen (input_file_arg);
      if (file_path_len > strlen (".info")
          && !memcmp (input_file_arg + file_path_len -strlen (".info"),
                      ".info", strlen (".info")))
        {
          char *corrected;
          char *arg_basename;

          parse_file_path (input_file_arg, input_file_name_and_directory);
          arg_basename = input_file_name_and_directory[0];
          free (input_file_name_and_directory[1]);
          corrected = strdup (arg_basename);
          memcpy (corrected + strlen (corrected) -strlen (".info"), ".texi",
                  strlen (".texi"));
          txi_config_document_warn ("input file %s; did you mean %s?",
                                    arg_basename, corrected);
          free (corrected);
          free (arg_basename);
        }

     /* try to concatenate with different suffixes. The last suffix is ''
        such that the plain file name is checked. */
      for (j = 0; input_file_suffixes[j]; j++)
        {
          struct stat finfo;
          char *path_name;
          xasprintf (&path_name, "%s%s", input_file_arg,
                     input_file_suffixes[j]);
          if (stat (path_name, &finfo) == 0)
            {
              input_file_path = path_name;
              break;
            }
          else
            free (path_name);
        }

      /* in case no file was found, still set the file name */
      if (!input_file_path)
        input_file_path = strdup (input_file_arg);

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
      txi_parser (input_file_path, &values, &parser_options);

      /* Texinfo document tree parsing */
      document = txi_parse_texi_file (input_file_path, &status);

      errors_nr
        = txi_handle_parser_error_messages (document, no_warn, test_mode_set,
                                            set_message_encoding);
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
         = GNUT_get_conf (program_options.options->TRACE_INCLUDES.number);
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

      set_document_options (document, &program_options, &cmdline_options,
                            init_files_options);

      macro_expand_option
        = GNUT_get_conf (program_options.options->MACRO_EXPAND.number);
      if (macro_expand_option && macro_expand_option->o.string && i == 0)
        {
          const char *encoded_macro_expand_file_name
            = macro_expand_option->o.string;
          char *macro_expand_file_name
            = GNUT_decode_input ((char *) encoded_macro_expand_file_name);
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
              write_to_file (texinfo_text, file_fh,
                             encoded_macro_expand_file_name);

              output_files_register_closed (&output_files_information,
                                            encoded_macro_expand_file_name);
              if (fclose (file_fh))
                {
                  txi_config_document_warn (
                               "error on closing macro expand file %s: %s",
                                 macro_expand_file_name, strerror (errno));
                  error_macro_expand_file = 1;
                }
            }
          else
            {
              txi_config_document_warn ("could not open %s for writing: %s",
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
          free_output_files_information (&output_files_information);
          free (macro_expand_file_name);
          free (texinfo_text);
        }

      dump_texi_option
        = GNUT_get_conf (program_options.options->DUMP_TEXI.number);

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
                                              set_message_encoding);

      errors_count = handle_errors (errors_nr, errors_count, &opened_files);

      if (!strcmp (output_format, "structure"))
        goto next_input_file;

      /* conversion initialization */
      copy_options_list (&convert_options, &program_options);
      copy_options_list (&convert_options, init_files_options);
      copy_options_list (&convert_options, &cmdline_options);

      /* prepend to INCLUDE_DIRECTORIES by resetting include directories to
         merged prepended directories and command line include directories */
      converter_include_dirs_option
        = &convert_options.options->INCLUDE_DIRECTORIES;
      converter_include_dirs = converter_include_dirs_option->o.strlist;
      clear_strings_list (converter_include_dirs);
      copy_strings (converter_include_dirs, &prepended_include_directories);
      copy_strings (converter_include_dirs, cmdline_include_dirs);

      /* set TEXINFO_LANGUAGE_DIRECTORIES by prepending current directory
         and input directory to texinfo_language_config_dirs */
      converter_texinfo_language_directories_option
        = &convert_options.options->TEXINFO_LANGUAGE_DIRECTORIES;
      converter_texinfo_language_config_dirs
        = converter_texinfo_language_directories_option->o.strlist;
      clear_strings_list (converter_texinfo_language_config_dirs);

      add_string (curdir, converter_texinfo_language_config_dirs);
      if (input_directory)
        {
          if (strcmp (curdir, input_directory))
            add_string (input_directory,
                        converter_texinfo_language_config_dirs);
        free (input_directory);
      }

      copy_strings (converter_texinfo_language_config_dirs,
                    texinfo_language_config_dirs);

      txi_converter_initialization_setup (converter_init_info,
                                          &deprecated_directories,
                                          &convert_options);

      converter = txi_converter_setup (external_module,
                                       converted_format,
                                       converter_init_info);

      /* conversion */
      /* return value can be NULL in case of errors or an empty string, but
         not anything else as parse_file is used with a file */
      result = txi_converter_output (external_module, converter, document);

      free (result);
      clear_converter_initialization_info (converter_init_info);

      errors_count
        = merge_opened_files (&opened_files,
                     &converter->output_files_information.opened_files,
                              errors_count);

      errors_nr
        = txi_handle_converter_error_messages (converter, no_warn,
                                       test_mode_set, set_message_encoding);

      errors_count = handle_errors (errors_nr, errors_count, &opened_files);

      if (format_specification->flags & STTF_internal_links && i == 0)
        {
          OPTION *internal_links_option
            = GNUT_get_conf (program_options.options->INTERNAL_LINKS.number);
          if (internal_links_option && internal_links_option->o.string)
            {
              char *internal_links_file_name;
              char *internal_links_text
               = html_output_internal_links (converter);
              FILE *file_fh;
              OUTPUT_FILES_INFORMATION output_files_information;
              char *open_error_message;
              int overwritten_file;
              char *encoded_internal_links_file_name
                = internal_links_option->o.string;
              int error_internal_links_file = 0;

              if (!internal_links_text)
                internal_links_text = strdup ("");

              internal_links_file_name
                 = GNUT_decode_input (encoded_internal_links_file_name);

              memset (&output_files_information, 0,
                      sizeof (OUTPUT_FILES_INFORMATION));

              file_fh = output_files_open_out (&output_files_information,
                                        encoded_internal_links_file_name,
                                               &open_error_message,
                                               &overwritten_file, 0);

          /* overwritten_file, set if the file has already been used
             in this files_information is not checked as this cannot happen.
           */

              if (file_fh)
                {
                  write_to_file (internal_links_text, file_fh,
                                 encoded_internal_links_file_name);

                  output_files_register_closed (&output_files_information,
                                            encoded_internal_links_file_name);
                  if (fclose (file_fh))
                    {
                      txi_config_document_warn (
                               "error on closing internal links file %s: %s",
                               internal_links_file_name, strerror (errno));
                      error_internal_links_file = 1;
                    }
                }
              else
                {
                  txi_config_document_warn ("could not open %s for writing: %s",
                                 internal_links_file_name, open_error_message);
                  error_internal_links_file = 1;
                }

              error_internal_links_file
                = merge_opened_files (&opened_files,
                                  &output_files_information.opened_files,
                                  error_internal_links_file);

              if (error_internal_links_file)
                {
                  errors_count = handle_errors (error_internal_links_file,
                                                errors_count, &opened_files);
                }

              free_output_files_information (&output_files_information);
              free (internal_links_file_name);
              free (internal_links_text);
            }
        }

      /* free after output */
      txi_converter_reset (converter);

      /* destroy converter */
      txi_converter_destroy (converter);

      if (i == 0)
        {
          OPTION *sort_element_count_option
           = GNUT_get_conf (program_options.options->SORT_ELEMENT_COUNT.number);
          if (sort_element_count_option && sort_element_count_option->o.string)
            {
              char *sort_element_count_text;
              CONVERTER_TEXT_INFO *sort_element_count_info;
              OPTION *use_nodes_option
               = GNUT_get_conf (program_options.options->USE_NODES.number);
              int no_use_nodes = (use_nodes_option
                                  && use_nodes_option->o.integer == 0);
              int use_sections
                = (!(format_specification->flags & STTF_nodes_tree)
                   || no_use_nodes);

              OPTION *sort_element_count_words_option
                = GNUT_get_conf (
                    program_options.options->SORT_ELEMENT_COUNT_WORDS.number);

              FILE *file_fh;
              OUTPUT_FILES_INFORMATION output_files_information;
              char *open_error_message;
              int overwritten_file;
              const char *sort_element_count_file_name
                = sort_element_count_option->o.string;
              char *path_encoding;
              char *encoded_sort_element_count_file_name;
              int error_element_count_file = 0;

              /* reuse converter options list memory */
              clear_options_list (&convert_options);

              copy_options_list (&convert_options, &program_options);
              copy_options_list (&convert_options, init_files_options);
              copy_options_list (&convert_options, &cmdline_options);

          /* prepend to INCLUDE_DIRECTORIES by resetting include directories to
             merged prepended directories and command line include directories */
              converter_include_dirs_option
                = &convert_options.options->INCLUDE_DIRECTORIES;
              converter_include_dirs = converter_include_dirs_option->o.strlist;
              clear_strings_list (converter_include_dirs);
              copy_strings (converter_include_dirs, &prepended_include_directories);
              copy_strings (converter_include_dirs, cmdline_include_dirs);

              sort_element_count_info
               = txi_sort_element_counts ("Texinfo::Convert::TextContent",
                     &convert_options, document,
                     use_sections, (sort_element_count_words_option
                         && sort_element_count_words_option->o.integer > 0));

              sort_element_count_text = sort_element_count_info->text;

              if (!sort_element_count_text)
                sort_element_count_text = strdup ("");

              encoded_sort_element_count_file_name
                  = encoded_output_file_name (
                                   sort_element_count_info->converter->conf,
                                              &document->global_info,
                     (char *)sort_element_count_file_name, &path_encoding, 0);
              free (path_encoding);

              memset (&output_files_information, 0,
                      sizeof (OUTPUT_FILES_INFORMATION));

              file_fh = output_files_open_out (&output_files_information,
                                        encoded_sort_element_count_file_name,
                                               &open_error_message,
                                               &overwritten_file, 0);

          /* overwritten_file, set if the file has already been used
             in this files_information is not checked as this cannot happen.
           */

              if (file_fh)
                {
                  write_to_file (sort_element_count_text, file_fh,
                                 encoded_sort_element_count_file_name);

                  output_files_register_closed (&output_files_information,
                                         encoded_sort_element_count_file_name);
                  if (fclose (file_fh))
                    {
                      txi_config_document_warn (
                               "error on closing internal links file %s: %s",
                               sort_element_count_file_name, strerror (errno));
                      error_element_count_file = 1;
                    }
                }
              else
                {
                  txi_config_document_warn ("could not open %s for writing: %s",
                             sort_element_count_file_name, open_error_message);
                  error_element_count_file = 1;
                }
              free (encoded_sort_element_count_file_name);
              free (sort_element_count_text);

              /* destroy converter and sort_element_count_info */
              txi_converter_reset (sort_element_count_info->converter);
              txi_converter_destroy (sort_element_count_info->converter);
              free (sort_element_count_info);

              error_element_count_file
                = merge_opened_files (&opened_files,
                                  &output_files_information.opened_files,
                                  error_element_count_file);

              if (error_element_count_file)
                {
                  errors_count = handle_errors (error_element_count_file,
                                                errors_count, &opened_files);
                }

              free_output_files_information (&output_files_information);
            }
        }

    next_input_file:
      /* destroy document */
      txi_document_remove (document);

      free (input_file_name);
      free (input_file_path);

      clear_strings_list (&prepended_include_directories);
      clear_options_list (&convert_options);
    }

  destroy_converter_initialization_info (converter_init_info);

  free_strings_list (&prepended_include_directories);
  free_options_list (&convert_options);

  free_strings_list (&input_files);

  free_options_list (&parser_options);
  /* free (command_directory); */
  free (program_file);

  free_options_list (&cmdline_options);
  free_options_list (init_files_options);
  free_options_list (&program_options);

  free_strings_list (&conf_dirs);
  free_strings_list (&prepend_dirs);

  free_strings_list (&converter_init_dirs);
  free_strings_list (&converter_config_dirs);

  free_deprecated_dirs_list (&deprecated_directories);

  destroy_strings_list (converter_config_dirs_array_ref);
  destroy_strings_list (texinfo_language_config_dirs);
  wipe_values (&values);

  free_strings_list (&internal_extension_dirs);
  free (extensions_dir);

  txi_customization_loading_finish (embedded_interpreter);

  free_strings_list (&opened_files);
}
