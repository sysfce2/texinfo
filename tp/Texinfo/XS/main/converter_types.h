/* converter_types.h - declarations of types used in many places */
#ifndef CONVERTER_TYPES_H
#define CONVERTER_TYPES_H

/* Copyright 2010-2023 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>. */

#include <stddef.h>
#include <stdio.h>

#include "tree_types.h"
#include "element_types.h"
#include "options_types.h"
#include "global_commands_types.h"

enum error_type { MSG_error, MSG_warning,
                  MSG_document_error, MSG_document_warning };

enum formatting_reference_status {
   FRS_status_none,
   FRS_status_default_set,        /* default is set, no customization (or
                                     customization is the same as default) */
   FRS_status_customization_set,  /* customization is set, no default, or
                                     not the same as default */
   FRS_status_ignored,            /* explicitely ignored. Only used for
                                     types_conversion and commands_conversion
                                   */
};

enum command_type_variety {
   CTV_type_none,
   CTV_type_command,
   CTV_type_type,
};

enum monospace_context {
   MONO_ctx_off,
   MONO_ctx_on,
};

#define SUI_TYPES_LIST \
  sui_type(class) \
  sui_type(direction) \
  sui_type(order) \
  sui_type(file_string) \
  sui_type(target) \
  sui_type(heading)

enum special_unit_info_type {
  #define sui_type(name) SUI_type_ ## name,
   SUI_TYPES_LIST
  #undef sui_type
};

/* translated from corresponding SUI_type* */
enum special_unit_info_tree {
   SUIT_type_heading,
};

enum special_target_type {
   ST_footnote_location,
};

#define TDS_TRANSLATED_TYPES_LIST \
  tds_type(button) \
  tds_type(description) \
  tds_type(text)

#define TDS_NON_TRANSLATED_TYPES_LIST \
  tds_type(accesskey) \
  tds_type(example) \
  tds_type(rel)

enum direction_string {
  #define tds_type(name) TDS_type_ ## name,
   TDS_TRANSLATED_TYPES_LIST
   TDS_NON_TRANSLATED_TYPES_LIST
  #undef tds_type
};

/* %default_formatting_references + %default_css_string_formatting_references
   in Texinfo::HTML */
#define HTML_FORMATTING_REFERENCES_LIST \
  html_fr_reference(format_begin_file) \
  html_fr_reference(format_button) \
  html_fr_reference(format_button_icon_img) \
  html_fr_reference(format_css_lines) \
  html_fr_reference(format_comment) \
  html_fr_reference(format_contents) \
  html_fr_reference(format_element_header) \
  html_fr_reference(format_element_footer) \
  html_fr_reference(format_end_file) \
  html_fr_reference(format_footnotes_segment) \
  html_fr_reference(format_footnotes_sequence) \
  html_fr_reference(format_heading_text) \
  html_fr_reference(format_navigation_header) \
  html_fr_reference(format_navigation_panel) \
  html_fr_reference(format_node_redirection_page) \
  html_fr_reference(format_program_string) \
  html_fr_reference(format_protect_text) \
  html_fr_reference(format_separate_anchor) \
  html_fr_reference(format_titlepage) \
  html_fr_reference(format_title_titlepage) \
  html_fr_reference(format_translate_message_tree) \
  html_fr_reference(format_translate_message_string) \

#define HTML_CSS_FORMATTING_REFERENCES_LIST \
  html_fr_reference(format_protect_text)

enum html_formatting_reference {
  #define html_fr_reference(name) FR_## name,
   HTML_FORMATTING_REFERENCES_LIST
  #undef html_fr_reference
};

enum html_css_string_formatting_reference {
  #define html_fr_reference(name) CSSFR_## name,
   HTML_CSS_FORMATTING_REFERENCES_LIST
  #undef html_fr_reference
};

typedef struct {
    enum command_id *stack;
    size_t top;   /* One above last pushed command. */
    size_t space;
} COMMAND_STACK;

/* either a type or a command id */
typedef struct {
    enum command_type_variety variety;
    union {
      enum command_id cmd;
      enum element_type type;
    };
} COMMAND_OR_TYPE;

typedef struct {
    COMMAND_OR_TYPE *stack;
    size_t top;   /* One above last pushed. */
    size_t space;
} COMMAND_OR_TYPE_STACK;

typedef struct {
    char **stack;
    size_t top;   /* One above last pushed. */
    size_t space;
} STRING_STACK;

typedef struct {
    enum monospace_context *stack;
    size_t top;   /* One above last pushed. */
    size_t space;
} MONOSPACE_CONTEXT_STACK;

typedef struct {
    char *message;
    char *error_line;
    enum error_type type;
    int continuation;
    SOURCE_INFO source_info;
} ERROR_MESSAGE;

typedef struct {
    ERROR_MESSAGE *list;
    size_t number;
    size_t space;
} ERROR_MESSAGE_LIST;

typedef struct GLOBAL_INFO {
    char *input_file_name;
    char *input_directory;
    char *input_encoding_name;
    int sections_level_modifier;
    ELEMENT dircategory_direntry; /* an array of elements */
    /* Ignored characters for index sort key */
    IGNORED_CHARS ignored_chars;
} GLOBAL_INFO;

typedef struct DOCUMENT {
    int descriptor;
    ELEMENT *tree;
    INDEX **index_names;
    FLOAT_RECORD_LIST *floats;
    FLOAT_RECORD_LIST *listoffloats;
    ELEMENT_LIST *internal_references;
    LABEL_LIST *labels_list;
    LABEL_LIST *identifiers_target;
    GLOBAL_INFO *global_info;
    GLOBAL_COMMANDS *global_commands;
    STRING_LIST *small_strings;
    ELEMENT *nodes_list; /* nodes in contents of this element */
    ELEMENT *sections_list; /* sections in contents of this element */
    ERROR_MESSAGE_LIST *error_messages;
    OPTIONS *options; /* for options used in structuring */
} DOCUMENT;

typedef struct expanded_format {
    char *format;
    int expandedp;
} EXPANDED_FORMAT;

typedef struct VARIETY_DIRECTION_INDEX {
    char *special_unit_variety;
    int direction_index;
} VARIETY_DIRECTION_INDEX;

typedef struct HTML_TARGET {
    ELEMENT *element;
    char *target;
    char *special_unit_filename;
    char *node_filename;
    char *section_filename;
    char *contents_target;
    char *shortcontents_target;

    char *text;
    ELEMENT *tree;
    ELEMENT *tree_nonumber;
    char *string;
} HTML_TARGET;

typedef struct HTML_TARGET_LIST {
    size_t number;
    size_t space;
    HTML_TARGET *list;
} HTML_TARGET_LIST;

typedef struct MERGED_INDEX {
    char *name;
    INDEX_ENTRY *index_entries;
    size_t index_number;
} MERGED_INDEX;

typedef struct LETTER_INDEX_ENTRIES {
    char *letter;
    INDEX_ENTRY **entries;
    size_t number;
} LETTER_INDEX_ENTRIES;

typedef struct INDEX_SORTED_BY_LETTER {
    char *name;
    LETTER_INDEX_ENTRIES *letter_entries;
    size_t number;
} INDEX_SORTED_BY_LETTER;

typedef struct HTML_COMMAND_CONVERSION {
    char *element;
    int quote; /* for style commands formatting only */
    /* following is only for no arg command formatting */
    int unset;
    char *text;
    ELEMENT *tree;
    char *translated_converted;
    char *translated_to_convert;
} HTML_COMMAND_CONVERSION;

typedef struct COMMAND_ID_LIST {
    size_t number;
    enum command_id *list;
} COMMAND_ID_LIST;

typedef struct ARRAY_INDEX_LIST {
    size_t number;
    size_t *list;
} ARRAY_INDEX_LIST;

typedef struct COMMAND_ID_INDEX {
    enum command_id cmd;
    size_t index;
} COMMAND_ID_INDEX;

typedef struct TRANSLATED_COMMAND {
    enum command_id cmd;
    char *translation;
} TRANSLATED_COMMAND;

typedef struct FILE_NAME_PATH_COUNTER {
    char *filename;
    char *normalized_filename;
    char *filepath;
    int counter;
    int elements_in_file_count; /* only used in HTML, corresponds to
                                   'elements_in_file_count' */
    TEXT body;           /* file body output, used for HTML */
    OUTPUT_UNIT *first_unit;
    int counter_changed;  /* indicator to determine if the file has already
                             been setup for change in counter passed to perl */
} FILE_NAME_PATH_COUNTER;

typedef struct FILE_NAME_PATH_COUNTER_LIST {
    size_t number;
    size_t space;
    FILE_NAME_PATH_COUNTER *list;
} FILE_NAME_PATH_COUNTER_LIST;

typedef struct FILE_STREAM {
    char *file_path;
    /* TODO see https://perldoc.perl.org/perlapio to pass to perl
       PerlIO_importFILE. This creates a perl io object.
       PerlIO *   PerlIO_importFILE  (FILE *stdio, const char *mode)
       A SV is IO *, created by newIO
        IO *  newIO()
       the output perolIO of an IO is obtained by:
        PerlIO *IoOFP(IO *io);
       FIXME no way to set the PerlIO associated to an IO corresponding
       to IoOFP?
   From perlguts
  All of these accessors macros are lvalues, there are no distinct _set() macros to modify the members of the IO object.
       */
    FILE *stream;
} FILE_STREAM;

typedef struct FILE_STREAM_LIST {
    size_t number;
    size_t space;
    FILE_STREAM *list;
} FILE_STREAM_LIST;

typedef struct OUTPUT_FILES_INFORMATION {
    STRING_LIST opened_files;
    FILE_STREAM_LIST unclosed_files;
} OUTPUT_FILES_INFORMATION;

typedef struct SPECIAL_UNIT_DIRECTION {
    OUTPUT_UNIT *output_unit;
    char *direction;
} SPECIAL_UNIT_DIRECTION;

typedef struct FORMATTING_REFERENCE {
/* perl references. This should be SV *sv_*,
   but we don't want to include the Perl headers everywhere; */
    void *sv_reference;
    void *sv_default;
    enum formatting_reference_status status;
} FORMATTING_REFERENCE;

typedef struct HTML_FORMATTING_CONTEXT {
    char *context_name;
    int preformatted_number;
    int paragraph_number;
    int upper_case_ctx;
    int space_protected;
    int no_break;
} HTML_FORMATTING_CONTEXT;

typedef struct HTML_FORMATTING_CONTEXT_STACK {
    HTML_FORMATTING_CONTEXT *stack;
    size_t top;   /* One above last pushed context. */
    size_t space;
} HTML_FORMATTING_CONTEXT_STACK;

typedef struct HTML_DOCUMENT_CONTEXT {
    char *context;
    int string_ctx;
    int raw_ctx;
    int verbatim_ctx;
    int math_ctx;
    char *document_global_context;
    MONOSPACE_CONTEXT_STACK monospace;
    COMMAND_OR_TYPE_STACK composition_context;
    COMMAND_STACK block_commands;
    HTML_FORMATTING_CONTEXT_STACK formatting_context;
    STRING_STACK preformatted_classes;
} HTML_DOCUMENT_CONTEXT;

typedef struct HTML_DOCUMENT_CONTEXT_STACK {
    HTML_DOCUMENT_CONTEXT *stack;
    size_t top;   /* One above last pushed context. */
    size_t space;
} HTML_DOCUMENT_CONTEXT_STACK;

typedef struct CONVERTER {
    int converter_descriptor;
    OPTIONS *conf;
    OPTIONS *init_conf;
    struct DOCUMENT *document;
    int document_units_descriptor;

    ERROR_MESSAGE_LIST *error_messages;
    MERGED_INDEX **index_entries;
    INDEX_SORTED_BY_LETTER **index_entries_by_letter;
    TRANSLATED_COMMAND **translated_commands;
    EXPANDED_FORMAT *expanded_formats;

  /* output unit files API */
    FILE_NAME_PATH_COUNTER_LIST output_unit_files;

  /* API to open, set encoding and register files */
    OUTPUT_FILES_INFORMATION output_files_information;

  /* perl converter. This should be HV *hv,
     but we don't want to include the Perl headers everywhere; */
    void *hv;

  /* maybe HTML specific */
    char *title_titlepage;

  /* HTML specific */
    OUTPUT_UNIT **global_units_directions;
    SPECIAL_UNIT_DIRECTION **special_units_direction_name;
    char **special_unit_info[SUI_type_heading+1];
    ELEMENT **special_unit_info_tree[SUIT_type_heading+1];
    STRING_LIST *special_unit_varieties;
    VARIETY_DIRECTION_INDEX **varieties_direction_index;
    STRING_LIST *seen_ids;
    HTML_TARGET_LIST *html_targets;
    HTML_TARGET_LIST *html_special_targets[ST_footnote_location+1];
    char **directions_strings[TDS_type_rel+1];
    HTML_COMMAND_CONVERSION **html_command_conversion[BUILTIN_CMD_NUMBER];
    COMMAND_ID_LIST no_arg_formatted_cmd;
    int code_types[ET_special_unit_element+1];
    char *pre_class_types[ET_special_unit_element+1];
    FORMATTING_REFERENCE
       formatting_references[FR_format_translate_message_string+1];
    FORMATTING_REFERENCE
       css_string_formatting_references[FR_format_translate_message_string+1];
    FORMATTING_REFERENCE commands_open[BUILTIN_CMD_NUMBER];
    FORMATTING_REFERENCE commands_conversion[BUILTIN_CMD_NUMBER];
    FORMATTING_REFERENCE css_string_commands_conversion[BUILTIN_CMD_NUMBER];
    FORMATTING_REFERENCE types_open[ET_special_unit_element+1];
    FORMATTING_REFERENCE types_conversion[ET_special_unit_element+1];
    FORMATTING_REFERENCE css_string_types_conversion[ET_special_unit_element+1];
    FORMATTING_REFERENCE output_units_conversion[OU_special_unit+1];
    /* associate cmd and index in special_unit_varieties STRING_LIST */
    /* number in sync with command_special_unit_variety, +1 for trailing 0 */
    COMMAND_ID_INDEX command_special_variety_name_index[4+1];

    /* state only in C converter */
    unsigned long modified_state; /* specifies which perl state to rebuild */
    ELEMENT *tree_to_build; /* C tree that needs to be built to perl before
                               calling perl functions on it */
    COMMAND_ID_LIST no_arg_formatted_cmd_translated; /* list of commands that
                         were translated and need to be passed back to perl */
    ELEMENT_LIST reset_target_commands; /* element targets that should have
                                           their texts reset after language
                                           change */
    ARRAY_INDEX_LIST file_changed_counter;  /* index of files in
                                 output_unit_files with changed counter */
    size_t *output_unit_file_indices;   /* array of indices in output_unit_files
              each position corresponding to an output unit. */
    size_t *special_unit_file_indices;  /* same for special output units */
    /* next three allow to switch from normal HTML formatting to css strings
       formatting */
    FORMATTING_REFERENCE *current_formatting_references;
    FORMATTING_REFERENCE *current_commands_conversion;
    FORMATTING_REFERENCE *current_types_conversion;

    /* state common with perl converter */
    int document_global_context;
    int ignore_notice;
    ELEMENT *current_root_command;
    ELEMENT *current_node;
    OUTPUT_UNIT *current_output_unit;
    HTML_DOCUMENT_CONTEXT_STACK html_document_context;
    STRING_STACK multiple_pass;
    char *current_filename;
} CONVERTER;

#endif