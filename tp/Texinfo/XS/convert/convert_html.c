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
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

#include <config.h>
#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include <errno.h>

#include "global_commands_types.h"
#include "tree_types.h"
#include "element_types.h"
#include "converter_types.h"
#include "tree.h"
#include "builtin_commands.h"
#include "command_stack.h"
#include "errors.h"
#include "utils.h"
#include "extra.h"
#include "targets.h"
#include "debug.h"
#include "output_unit.h"
#include "converter.h"
#include "node_name_normalization.h"
#include "indices_in_conversion.h"
#include "convert_to_texinfo.h"
#include "translations.h"
#include "convert_utils.h"
#include "convert_to_text.h"
#include "call_html_perl_function.h"
/* for TREE_AND_STRINGS */
#include "document.h"
#include "convert_html.h"


typedef struct ROOT_AND_UNIT {
    const OUTPUT_UNIT *output_unit;
    const ELEMENT *root;
} ROOT_AND_UNIT;

typedef struct CMD_VARIETY {
    enum command_id cmd;
    char *variety;
} CMD_VARIETY;

char *html_global_unit_direction_names[] = {
  #define hgdt_name(name) #name,
   HTML_GLOBAL_DIRECTIONS_LIST
  #undef hgdt_name
};

char *html_conversion_context_type_names[] = {
  #define cctx_type(name) #name,
    HCC_CONTEXT_TYPES_LIST
  #undef cctx_type
};

char *html_formatting_reference_names[] = {
  #define html_fr_reference(name) #name,
   HTML_FORMATTING_REFERENCES_LIST
  #undef html_fr_reference
};

const char *html_argument_formatting_type_names[] = {
   #define html_aft_type(name) #name,
    HTML_ARGUMENTS_FORMATTED_FORMAT_TYPE
   #undef html_aft_type
};

const char *special_unit_info_type_names[SUI_type_heading + 1] =
{
  #define sui_type(name) #name,
    SUI_TYPES_LIST
  #undef sui_type
};

TRANSLATED_SUI_ASSOCIATION translated_special_unit_info[] = {
  {SUIT_type_heading, SUI_type_heading},
  /* these special types end the list */
  {SUIT_type_none, SUI_type_none},
};

CMD_VARIETY command_special_unit_variety[] = {
                                {CM_contents, "contents"},
                                {CM_shortcontents, "shortcontents"},
                                {CM_summarycontents, "shortcontents"},
                                {CM_footnote, "footnotes"},
                                {0, 0},
};

/* unused */
#define F_AFT_none              0x0001

#define F_AFT_normal            0x0002
#define F_AFT_string            0x0004
#define F_AFT_monospace         0x0008
#define F_AFT_monospacetext     0x0010
#define F_AFT_monospacestring   0x0020
#define F_AFT_filenametext      0x0040
#define F_AFT_url               0x0080
#define F_AFT_raw               0x0100

/* HTML command data flags */
#define HF_composition_context  0x0001
#define HF_format_context       0x0002
#define HF_format_raw           0x0004
#define HF_pre_class            0x0008
#define HF_upper_case           0x0010
#define HF_HTML_align           0x0020
#define HF_special_variety      0x0040

typedef struct HTML_COMMAND_STRUCT {
    unsigned long flags;
    char *pre_class;
} HTML_COMMAND_STRUCT;

static HTML_COMMAND_STRUCT html_commands_data[BUILTIN_CMD_NUMBER];

/* in specification of args.  Number max +1 for a trailing 0 */
#define MAX_COMMAND_ARGS_NR 6

typedef struct COMMAND_ID_ARGS_SPECIFICATION {
    enum command_id cmd;
    unsigned long flags[MAX_COMMAND_ARGS_NR];
} COMMAND_ID_ARGS_SPECIFICATION;

static COMMAND_ID_ARGS_SPECIFICATION default_commands_args[] = {
  {CM_anchor, {F_AFT_monospacestring}},
  {CM_email, {F_AFT_url | F_AFT_monospacestring, F_AFT_normal}},
  {CM_footnote, {0}},
  {CM_printindex, {0}},
  {CM_uref, {F_AFT_url | F_AFT_monospacestring, F_AFT_normal, F_AFT_normal}},
  {CM_url, {F_AFT_url | F_AFT_monospacestring, F_AFT_normal, F_AFT_normal}},
  {CM_sp, {0}},
  {CM_inforef, {F_AFT_monospace, F_AFT_normal, F_AFT_filenametext}},
  {CM_xref, {F_AFT_monospace, F_AFT_normal, F_AFT_normal, F_AFT_filenametext, F_AFT_normal}},
  {CM_pxref, {F_AFT_monospace, F_AFT_normal, F_AFT_normal, F_AFT_filenametext, F_AFT_normal}},
  {CM_ref, {F_AFT_monospace, F_AFT_normal, F_AFT_normal, F_AFT_filenametext, F_AFT_normal}},
  {CM_link, {F_AFT_monospace, F_AFT_normal, F_AFT_filenametext}},
  {CM_image, {F_AFT_url | F_AFT_filenametext | F_AFT_monospacestring, F_AFT_filenametext, F_AFT_filenametext, F_AFT_string | F_AFT_normal, F_AFT_filenametext}},
  {CM_inlinefmt, {F_AFT_monospacetext, F_AFT_normal}},
  {CM_inlinefmtifelse, {F_AFT_monospacetext, F_AFT_normal, F_AFT_normal}},
  {CM_inlineraw, {F_AFT_monospacetext, F_AFT_raw}},
  {CM_inlineifclear, {F_AFT_monospacetext, F_AFT_normal}},
  {CM_inlineifset, {F_AFT_monospacetext, F_AFT_normal}},
  {CM_item, {0}},
  {CM_itemx, {0}},
  {CM_value, {F_AFT_monospacestring}},
  {CM_abbr, {F_AFT_normal, F_AFT_string}},
  {CM_acronym, {F_AFT_normal, F_AFT_string}},
};

typedef struct COMMAND_ARGS_SPECIFICATION {
    int status;
    unsigned long flags[MAX_COMMAND_ARGS_NR];
} COMMAND_ARGS_SPECIFICATION;

static COMMAND_ARGS_SPECIFICATION command_args_flags[BUILTIN_CMD_NUMBER];



static void convert_to_html_internal (CONVERTER *self, const ELEMENT *e,
                                      TEXT *result, char *explanation);

/*
 if OUTPUT_UNITS is defined, the first output unit is used if a proper
 top output unit is not found.
 */
static OUTPUT_UNIT *
get_top_unit (DOCUMENT *document, const OUTPUT_UNIT_LIST *output_units)
{
  const ELEMENT *node_top = find_identifier_target
                          (document->identifiers_target, "Top");
  const ELEMENT *section_top = document->global_commands->top;

  if (section_top)
    return section_top->associated_unit;
  else if (node_top)
    return node_top->associated_unit;
  else if (output_units)
    return output_units->list[0];

  return 0;
}

int
special_unit_variety_direction_index (CONVERTER *self,
                                      char *special_unit_variety)
{
  /* number is index +1 */
  size_t number = find_string (&self->special_unit_varieties,
                               special_unit_variety);
  int i = number -1;
  if (i >= 0)
    return D_Last +1 +i;
  return -1;
}

/*
  If FIND_CONTAINER is set, the element that holds the command output
  is found, otherwise the element that holds the command is found.  This is
  mostly relevant for footnote only.
  If no known root element type is found, the returned root element is undef,
  and not set to the element at the tree root
 */
static ROOT_AND_UNIT *
html_get_tree_root_element (CONVERTER *self, const ELEMENT *command,
                            int find_container)
{
  const ELEMENT *current = command;
  const OUTPUT_UNIT *output_unit = 0;
  const ELEMENT *root_command = 0;

  while (1)
    {
      if (current->type == ET_special_unit_element)
        {
          ROOT_AND_UNIT *result = malloc (sizeof (ROOT_AND_UNIT));
          result->output_unit = current->associated_unit;
          result->root = current;
          return result;
        }

      if (current->cmd && (builtin_command_flags(current) & CF_root))
        root_command = current;
      else if (current->cmd && (builtin_command_flags(current) & CF_block)
               && builtin_command_data[current->cmd].data == BLOCK_region)
        {
          const OUTPUT_UNIT_LIST *output_units
             = retrieve_output_units (self->document_units_descriptor);
          if (current->cmd == CM_copying
              && self->document->global_commands
                      ->insertcopying.contents.number > 0)
            {
              const ELEMENT global_insertcopying
                = self->document->global_commands->insertcopying;
              int i;
              for (i = 0; i < global_insertcopying.contents.number; i++)
                {
                  const ELEMENT *insertcopying
                      = global_insertcopying.contents.list[i];
                  ROOT_AND_UNIT *cur_result = html_get_tree_root_element (self,
                                                insertcopying, find_container);
                  if (cur_result->output_unit || cur_result->root)
                    return cur_result;
                }
            }
          else if (current->cmd == CM_titlepage
                   && self->conf->USE_TITLEPAGE_FOR_TITLE > 0
                   && self->conf->SHOW_TITLE > 0
                   && output_units->number > 0)
            {
              ROOT_AND_UNIT *result = malloc (sizeof (ROOT_AND_UNIT));
              result->output_unit = output_units->list[0];
              result->root = output_units->list[0]->unit_command;
              return result;
            }
          if (output_unit || root_command)
            fatal ("Problem output_unit, root_command");
          ROOT_AND_UNIT *result = malloc (sizeof (ROOT_AND_UNIT));
          memset (result, 0, sizeof (ROOT_AND_UNIT));
          return result;
        }
      else if (find_container
               && html_commands_data[current->cmd].flags & HF_special_variety)
        {
          int j;
          for (j = 0; self->command_special_variety_name_index[j].cmd; j++)
            {
     /* @footnote and possibly @*contents when a separate element is set */
              COMMAND_ID_INDEX cmd_variety_index
                = self->command_special_variety_name_index[j];
              if (cmd_variety_index.cmd == current->cmd)
                {
                  char *special_unit_variety
                = self->special_unit_varieties.list[cmd_variety_index.index];
                  int special_unit_direction_index
                    = special_unit_variety_direction_index (self,
                                                special_unit_variety);
                  const OUTPUT_UNIT *special_unit
                = self->global_units_directions[special_unit_direction_index];
                  if (special_unit)
                    {
                      ROOT_AND_UNIT *result = malloc (sizeof (ROOT_AND_UNIT));
                      result->output_unit = special_unit;
                      result->root = 0;
                      return result;
                    }
                  break;
                }
            }
        }

      if (current->associated_unit)
        {
          ROOT_AND_UNIT *result = malloc (sizeof (ROOT_AND_UNIT));
          result->output_unit = current->associated_unit;
          result->root = current;
          return result;
        }
      else if (current->parent)
        {
          current = current->parent;
        }
      else
        {
          ROOT_AND_UNIT *result = malloc (sizeof (ROOT_AND_UNIT));
          result->output_unit = 0;
          result->root = root_command;
          return result;
        }
    }
}

HTML_TARGET *
find_element_target (const HTML_TARGET_LIST *targets, const ELEMENT *element)
{
  int i;

  if (!targets->number)
    return 0;

  for (i = 0; i < targets->number; i ++)
    {
      HTML_TARGET *target = &targets->list[i];
      if (target->element == element)
        return target;
    }
  return 0;
}


char *
html_translate_string (CONVERTER *self, const char *string,
                   const char *translation_context, const char *in_lang)
{
  FORMATTING_REFERENCE *formatting_reference
    = &self->formatting_references[FR_format_translate_message];

  /* there is no place where FRS_status_ignore could be set, but
     it does not hurt to consider it possible */
  if (formatting_reference->status
      && formatting_reference->status != FRS_status_ignored
      && formatting_reference->sv_reference)
    {
      const char *lang = in_lang;
      char *translated_string;

      if (!lang && self->conf->documentlanguage)
        lang = self->conf->documentlanguage;

      translated_string
       = call_formatting_function_format_translate_message(
                            self, string, lang, translation_context);

      if (translated_string)
        return translated_string;
    }

  return translate_string (self->conf, string, translation_context,
                           in_lang);
}

/* returns a document descriptor. */
int
html_gdt (const char *string, CONVERTER *self,
     NAMED_STRING_ELEMENT_LIST *replaced_substrings,
     const char *translation_context, const char *in_lang)
{
  char *translated_string = html_translate_string (self, string,
                                              translation_context,
                                              in_lang);

  int document_descriptor
    = replace_convert_substrings (translated_string, replaced_substrings);
  free (translated_string);
  return document_descriptor;
}

/* a copy and paste of translations.c gdt_tree with html_gdt instead of gdt */
ELEMENT *
html_gdt_tree (const char *string, DOCUMENT *document, CONVERTER *self,
               NAMED_STRING_ELEMENT_LIST *replaced_substrings,
               const char *translation_context,
               const char *in_lang)
{
  ELEMENT *tree;
  int gdt_document_descriptor = html_gdt (string, self, replaced_substrings,
                                     translation_context, in_lang);
  TREE_AND_STRINGS *tree_and_strings
     = unregister_document_descriptor_tree (gdt_document_descriptor);

  tree = tree_and_strings->tree;

  if (tree_and_strings->small_strings)
    {
      /* this is very unlikely, as small strings correspond to file names and
         macro names, while we are parsing a simple string */
      if (tree_and_strings->small_strings->number)
        {
          if (document)
            merge_strings (document->small_strings,
                           tree_and_strings->small_strings);
          else
            fatal ("html_gdt_tree no document but small_strings");
        }
      free (tree_and_strings->small_strings->list);
      free (tree_and_strings->small_strings);
    }
  free (tree_and_strings);

  return tree;
}

char *
html_gdt_string (const char *string, CONVERTER *self,
                 NAMED_STRING_ELEMENT_LIST *replaced_substrings,
                 const char *translation_context, const char *in_lang)
{
  /* FIXME */
  char *translated_string = html_translate_string (self, string,
                                      translation_context, in_lang);

  char *result = replace_substrings (translated_string, replaced_substrings);
  free (translated_string);
  return result;
}

ELEMENT *
html_pgdt_tree (const char *translation_context, const char *string,
                DOCUMENT *document, CONVERTER *self,
                NAMED_STRING_ELEMENT_LIST *replaced_substrings,
                const char *in_lang)
{
  return html_gdt_tree (string, document, self, replaced_substrings,
                        translation_context, in_lang);
}


ELEMENT *
special_unit_info_tree (CONVERTER *self, enum special_unit_info_tree type,
                        char *special_unit_variety)
{
  /* number is index +1 */
  size_t number = find_string (&self->special_unit_varieties,
                               special_unit_variety);
  int j;
  int i = number -1;

  if (self->special_unit_info_tree[type][i])
    return self->special_unit_info_tree[type][i];

  for (j = 0; translated_special_unit_info[j].tree_type != SUIT_type_none; j++)
    {
      if (translated_special_unit_info[j].tree_type == type)
        {
          enum special_unit_info_type string_type
            = translated_special_unit_info[j].string_type;
          char *special_unit_info_string
            = self->special_unit_info[string_type][i];
          char *translation_context;
          xasprintf (&translation_context, "%s section heading",
                     special_unit_variety);
          self->special_unit_info_tree[type][i]
            = html_pgdt_tree (translation_context, special_unit_info_string,
                              self->document, self, 0, 0);
          free (translation_context);
          return self->special_unit_info_tree[type][i];
        }
    }
  return 0;
}

char *
special_unit_info (CONVERTER *self, enum special_unit_info_type type,
                   char *special_unit_variety)
{
  /* number is index +1 */
  size_t number = find_string (&self->special_unit_varieties,
                               special_unit_variety);
  int i = number -1;

  return self->special_unit_info[type][i];
}

OUTPUT_UNIT *
register_special_unit (CONVERTER *self, char *special_unit_variety)
{
  ELEMENT *unit_command = new_element (ET_special_unit_element);
  OUTPUT_UNIT *special_unit = new_output_unit (OU_special_unit);

  special_unit->special_unit_variety = special_unit_variety;
  unit_command->associated_unit = special_unit;
  special_unit->unit_command = unit_command;

  return special_unit;
}

typedef struct SPECIAL_UNIT_ORDER {
    char *order;
    char *variety;
} SPECIAL_UNIT_ORDER;

int
compare_special_units (const void *a, const void *b)
{
  const SPECIAL_UNIT_ORDER *spu_order_a = (const SPECIAL_UNIT_ORDER *) a;
  const SPECIAL_UNIT_ORDER *spu_order_b = (const SPECIAL_UNIT_ORDER *) b;

  int result = strcmp (spu_order_a->order, spu_order_b->order);
  if (result != 0)
    return result;
  return strcmp (spu_order_a->variety, spu_order_b->variety);
}

void
prepare_special_units (CONVERTER *self, int output_units_descriptor,
                               int *special_units_descriptor_ref,
                               int *associated_special_units_descriptor_ref)
{
  int i;
  STRING_LIST *special_unit_varieties = &self->special_unit_varieties;
  SPECIAL_UNIT_ORDER *special_units_order;
  OUTPUT_UNIT *previous_output_unit = 0;

  int special_units_descriptor = new_output_units_descriptor ();
  int associated_special_units_descriptor = new_output_units_descriptor ();

  /* retrieve after reallocating */

  OUTPUT_UNIT_LIST *special_units
    = retrieve_output_units (special_units_descriptor);

  OUTPUT_UNIT_LIST *associated_special_units
    = retrieve_output_units (associated_special_units_descriptor);

  OUTPUT_UNIT_LIST *output_units
    = retrieve_output_units (output_units_descriptor);

  /* for separate special output units */
  STRING_LIST *do_special = (STRING_LIST *) malloc (sizeof (STRING_LIST));
  memset (do_special, 0, sizeof (STRING_LIST));

  *special_units_descriptor_ref = special_units_descriptor;
  *associated_special_units_descriptor_ref
     = associated_special_units_descriptor;

  if (self->document->sections_list
      && self->document->sections_list->number > 0)
    {
      enum command_id contents_cmds[2] = {CM_shortcontents, CM_contents};
      int i;
      for (i = 0; i < 2; i++)
        {
          int contents_set = 0;
          enum command_id cmd = contents_cmds[i];
          COMMAND_OPTION_REF *contents_option_ref
             = get_command_option (self->conf, cmd);
          if (*(contents_option_ref->int_ref) > 0)
            contents_set = 1;
          free (contents_option_ref);
          if (contents_set)
            {
              int j;
              char *special_unit_variety = 0;
              char *contents_location = self->conf->CONTENTS_OUTPUT_LOCATION;

              for (j = 0; command_special_unit_variety[j].cmd; j++)
                {
                  if (command_special_unit_variety[j].cmd == cmd)
                    {
                      special_unit_variety
                        = command_special_unit_variety[j].variety;
                      break;
                    }
                }
              if (!strcmp (contents_location, "separate_element"))
                add_string (special_unit_variety, do_special);
              else
                {
                  OUTPUT_UNIT *special_output_unit = 0;
                  const OUTPUT_UNIT *associated_output_unit = 0;
                  if (!strcmp (contents_location, "after_title"))
                    {
                      if (output_units->number > 0)
                        associated_output_unit = output_units->list[0];
                      else
                        continue;
                    }
                  else if (!strcmp (contents_location, "after_top"))
                    {
                      if (self->document->global_commands->top)
                        {/* note that top is a uniq command */
                          const ELEMENT *section_top
                             = self->document->global_commands->top;

                          if (section_top->associated_unit)
                            associated_output_unit
                                 = section_top->associated_unit;
                        }
                      if (!associated_output_unit)
                        continue;
                    }
                  else if (!strcmp (contents_location, "inline"))
                    {
                      const ELEMENT *global_command
                       = get_cmd_global_command (
                                      self->document->global_commands, cmd);
                      if (global_command->contents.number > 0)
                        {
                          int i;
                          for (i = 0; i < global_command->contents.number; i++)
                            {
                              const ELEMENT *command = global_command->contents.list[i];
                              ROOT_AND_UNIT *root_unit
                               = html_get_tree_root_element (self, command, 0);
                              if (root_unit->output_unit)
                                associated_output_unit = root_unit->output_unit;
                              free (root_unit);
                              if (associated_output_unit)
                                break;
                            }
                        }
                      else
                        continue;
                    }
                  else /* should not happen */
                    continue;

                  special_output_unit
                    = register_special_unit (self, special_unit_variety);
                  special_output_unit->associated_document_unit
                    = associated_output_unit;
                  add_to_output_unit_list (associated_special_units,
                                           special_output_unit);
                }
            }
        }
    }

  if (self->document->global_commands->footnotes.contents.number > 0
      && !strcmp(self->conf->footnotestyle, "separate")
      && output_units && output_units->number > 1)
    add_string ("footnotes", do_special);

  if ((self->conf->DO_ABOUT < 0
       && output_units && output_units->number > 1
       && ((self->conf->SPLIT && strlen (self->conf->SPLIT))
           || self->conf->HEADERS > 0))
      || self->conf->DO_ABOUT > 0)
    add_string ("about", do_special);

  special_units_order = (SPECIAL_UNIT_ORDER *)
    malloc (sizeof (SPECIAL_UNIT_ORDER) * do_special->number);
  for (i = 0; i < do_special->number; i++)
    {
      char *special_unit_variety = do_special->list[i];
      special_units_order[i].order = special_unit_info (self, SUI_type_order,
                                                        special_unit_variety);
      special_units_order[i].variety = special_unit_variety;
    }

  qsort (special_units_order, do_special->number, sizeof (SPECIAL_UNIT_ORDER),
         compare_special_units);

  if (output_units && output_units->number > 0)
    previous_output_unit = output_units->list[output_units->number-1];

  for (i = 0; i < do_special->number; i++)
    {
      /* take the string from special_unit_varieties */
      char *special_unit_variety;
      /* number is index +1 */
      size_t number = find_string (special_unit_varieties,
                                   special_units_order[i].variety);
      int special_unit_varieties_idx = number -1;
      if (special_unit_varieties_idx < 0)
        {
          char *msg;
          xasprintf (&msg, "special_unit_varieties not found: %s\n",
                           special_units_order[i].variety);
          bug (msg);
        }

      special_unit_variety
        = special_unit_varieties->list[special_unit_varieties_idx];
      OUTPUT_UNIT *special_output_unit
                    = register_special_unit (self, special_unit_variety);
      add_to_output_unit_list (special_units,
                               special_output_unit);

      if (previous_output_unit)
        {
          special_output_unit->tree_unit_directions[D_prev]
             = previous_output_unit;
          previous_output_unit->tree_unit_directions[D_next]
             = special_output_unit;
        }
      previous_output_unit = special_output_unit;
    }

  free (special_units_order);
  destroy_strings_list (do_special);
}

static enum command_id additional_format_context_cmd[] = {
   CM_tab, CM_item, CM_itemx, CM_headitem, 0
 };

static enum command_id HTML_align_cmd[] = {
   CM_raggedright, CM_flushleft, CM_flushright, CM_center, 0
};

/* TODO free? It should be freed at exit? */
void
register_format_context_command (enum command_id cmd)
{
  html_commands_data[cmd].flags |= HF_format_context;
}

void register_pre_class_command (enum command_id cmd, enum command_id main_cmd)
{
  char *pre_class_str;

  if (main_cmd)
    pre_class_str = builtin_command_data[main_cmd].cmdname;
  else
    pre_class_str = builtin_command_data[cmd].cmdname;

  html_commands_data[cmd].pre_class = pre_class_str;
  html_commands_data[cmd].flags |= HF_pre_class;
}

/* used for diverse elements: tree units, indices, footnotes, special
  elements, contents elements... */
static HTML_TARGET *
add_element_target_to_list (HTML_TARGET_LIST *targets,
                            const ELEMENT *element, char *target)
{
  HTML_TARGET *element_target;

  if (targets->number == targets->space)
    {
      targets->list = realloc (targets->list,
                   sizeof (HTML_TARGET) * (targets->space += 5));
    }
  element_target = &targets->list[targets->number];
  memset (element_target, 0, sizeof (HTML_TARGET));
  element_target->element = element;
  if (target)
    element_target->target = strdup (target);

  targets->number++;
  return element_target;
}

static HTML_TARGET *
add_element_target (CONVERTER *self, const ELEMENT *element, char *target)
{
  HTML_TARGET_LIST *targets = &self->html_targets;
  return add_element_target_to_list (targets, element, target);
}

static HTML_TARGET *
add_special_target (CONVERTER *self, enum special_target_type type,
                    const ELEMENT *element, char *target)
{
  HTML_TARGET_LIST *targets = &self->html_special_targets[type];
  return add_element_target_to_list (targets, element, target);
}


static const enum command_id contents_elements_options[]
             = {CM_contents, CM_shortcontents, CM_summarycontents, 0};

static const enum command_id conf_for_special_units[]
                          = {CM_footnotestyle, 0};

void
html_prepare_conversion_units (CONVERTER *self,
                               int *output_units_descriptor_ref,
                               int *special_units_descriptor_ref,
                               int *associated_special_units_descriptor_ref)
{
  int output_units_descriptor;

  if (self->conf->USE_NODES > 0)
    output_units_descriptor = split_by_node (self->document->tree);
  else
    output_units_descriptor = split_by_section (self->document->tree);
  *output_units_descriptor_ref = output_units_descriptor;

  /* Needs to be set early in case it would be needed to find some region
     command associated root command. */
  self->document_units_descriptor = output_units_descriptor;

  /* the presence of contents elements in the document is used in diverse
     places, set it once for all here */
  set_global_document_commands (self, CL_last, contents_elements_options);
  set_global_document_commands (self, CL_last, conf_for_special_units);
  /*
    NOTE if the last value of footnotestyle is separate, all the footnotes
    formatted text are set to the special element set in _prepare_special_units
    as _html_get_tree_root_element uses the Footnote direction for every footnote.
    Therefore if @footnotestyle separate is set late in the document the current
    value may not be consistent with the link obtained for the footnote
    formatted text.  This is not an issue, as the manual says that
    @footnotestyle should only appear in the preamble, and it makes sense
    to have something consistent in the whole document for footnotes position.
   */
  prepare_special_units (self, output_units_descriptor,
                         special_units_descriptor_ref,
                         associated_special_units_descriptor_ref);

  /* reset to the default */
  set_global_document_commands (self, CL_before, conf_for_special_units);
}

void
set_special_units_targets_files (CONVERTER *self, int special_units_descriptor,
                                 const char *document_name)
{
  int i;
  OUTPUT_UNIT_LIST *special_units
    = retrieve_output_units (special_units_descriptor);

  char *extension = "";
  if (self->conf->EXTENSION)
    extension = self->conf->EXTENSION;

  for (i = 0; i < special_units->number; i++)
    {
      TARGET_FILENAME *target_filename;
      char *default_filename = 0;
      char *filename = 0;
      OUTPUT_UNIT *special_unit = special_units->list[i];
      char *special_unit_variety = special_unit->special_unit_variety;

      /* not to be freed, refers to self->special_unit_info */
      char *target = special_unit_info (self, SUI_type_target,
                                        special_unit_variety);

      if (!target)
        continue;

      if (((self->conf->SPLIT && strlen (self->conf->SPLIT))
           || self->conf->MONOLITHIC <= 0)
    /* in general document_name not defined means called through convert */
          && document_name)
        {
          TEXT text_name;
          char *special_unit_file_string
            = special_unit_info (self, SUI_type_file_string,
                                 special_unit_variety);
          text_init (&text_name);
          if (!special_unit_file_string)
            special_unit_file_string = "";
          text_append (&text_name, document_name);
          text_append (&text_name, special_unit_file_string);
          if (extension && strlen (extension))
            {
              text_append (&text_name, ".");
              text_append (&text_name, extension);
            }
          default_filename = text_name.text;
        }
      target_filename = call_file_id_setting_special_unit_target_file_name (
                               self, special_unit, target, default_filename);
      if (target_filename)
        {
          if (target_filename->target)
            target = target_filename->target;
          if (target_filename->filename)
            {
              filename = target_filename->filename;
              free (default_filename);
            }
          else
            filename = default_filename;

        }
      else
        filename = default_filename;

      if (self->conf->DEBUG > 0)
        {
          char *fileout = filename;
          if (!fileout)
            fileout = "UNDEF";
          fprintf (stderr, "Add special %s: target %s,\n    filename %s\n",
                            special_unit_variety, target, fileout);
        }

      HTML_TARGET *element_target
        = add_element_target (self, special_unit->unit_command, target);
      element_target->special_unit_filename = filename;
      add_string (target, &self->seen_ids);

      if (target_filename)
        {
          if (target_filename->target)
            free (target_filename->target);

          free (target_filename);
        }
    }
}

static void
prepare_associated_special_units_targets (CONVERTER *self,
                                 int associated_special_units_descriptor)
{
  OUTPUT_UNIT_LIST *associated_special_units
    = retrieve_output_units (associated_special_units_descriptor);

  if (associated_special_units && associated_special_units->number > 0)
    {
      int i;
      for (i = 0; i < associated_special_units->number; i++)
        {
          HTML_TARGET *element_target;
          TARGET_FILENAME *target_filename;
          char *filename = 0;
          OUTPUT_UNIT *special_unit = associated_special_units->list[i];
          char *special_unit_variety = special_unit->special_unit_variety;

          /* it may be undef'ined in user customization code */
          char *target = special_unit_info (self, SUI_type_target,
                                                 special_unit_variety);
          target_filename
            = call_file_id_setting_special_unit_target_file_name (
                               self, special_unit, target, filename);
          if (target_filename)
            {
              if (target_filename->target)
                target = target_filename->target;
              if (target_filename->filename)
                filename = target_filename->filename;
            }

          if (self->conf->DEBUG > 0)
            {
              char *str_filename;
              char *str_target;
              if (filename)
                str_filename = filename;
              else
                str_filename = "UNDEF (default)";
              if (target)
                str_target = target;
              else
                str_target = "UNDEF";
              fprintf (stderr, "Add content %s: target %s,\n"
                                "    filename %s\n", special_unit_variety,
                                str_target, str_filename);
            }
          element_target
           = add_element_target (self, special_unit->unit_command, target);
          if (target)
            add_string (target, &self->seen_ids);
          if (filename)
            element_target->special_unit_filename = filename;

          if (target_filename)
            {
              if (target_filename->target)
                free (target_filename->target);

              free (target_filename);
            }
        }
    }
}

static char *
normalized_to_id (char *id)
{
  if (isascii_digit (id[0]) || id[0] == '_')
    {
      char *result;
      xasprintf (&result, "%s%s", "g_t", id);
      return result;
    }
  return strdup (id);
}

static TARGET_FILENAME *
normalized_label_id_file (CONVERTER *self, char *normalized,
                          const ELEMENT* label_element)
{
  int called;
  char *target;
  char *target_customized;
  TARGET_FILENAME *target_filename
    = (TARGET_FILENAME *) malloc (sizeof (TARGET_FILENAME));

  int normalized_need_to_be_freed = 0;
  if (!normalized)
    {
      normalized = convert_contents_to_identifier (label_element);
      normalized_need_to_be_freed = 1;
    }

  if (normalized)
    target = normalized_to_id (normalized);
  else
    target = strdup ("");

  /* to find out the Top node, one could check $normalized */
  target_customized = call_file_id_setting_label_target_name (self,
                                  normalized, label_element, target,
                                  &called);

  if (target_customized)
    {
      free (target);
      target = target_customized;
    }

  if (normalized_need_to_be_freed)
    free (normalized);

  target_filename->target = target;
  target_filename->filename = node_information_filename (self, normalized,
                                                         label_element);

  return target_filename;
}

char *
unique_target (CONVERTER *self, char *target_base)
{
  int nr = 1;
  char *target = strdup (target_base);
  while (1)
    {
      if (find_string (&self->seen_ids, target))
        {
          free (target);
          xasprintf (&target, "%s-%d", target_base, nr);
          nr++;
          if (nr == 0)
            fatal ("overflow");
        }
      else
        return target;
    }
}

static void
new_sectioning_command_target (CONVERTER *self, const ELEMENT *command)
{
  char *normalized_name;
  char *filename;
  char *target_base;
  char *target;
  char *target_contents = 0;
  char *target_shortcontents = 0;
  TARGET_CONTENTS_FILENAME *target_contents_filename;

  TARGET_FILENAME *target_filename
    = normalized_sectioning_command_filename (self, command);

  normalized_name = target_filename->target;
  filename = target_filename->filename;

  free (target_filename);

  target_base = normalized_to_id (normalized_name);

  if (!strlen (target_base) && command->cmd == CM_top)
    {
      /* @top is allowed to be empty.  In that case it gets this target name */
      free (target_base);
      target_base = strdup ("SEC_Top");
    }

  if (strlen (target_base))
    target = unique_target (self, target_base);
  else
    target = strdup ("");

  free (target_base);

  if (strlen (target)
      && (builtin_command_flags(command) & CF_sectioning_heading))
    {
      char *target_base_contents;
      char *target_base_shortcontents;
      xasprintf (&target_base_contents, "toc-%s", normalized_name);
      target_contents = unique_target (self, target_base_contents);
      free (target_base_contents);

      xasprintf (&target_base_shortcontents, "stoc-%s", normalized_name);
      target_shortcontents = unique_target (self, target_base_shortcontents);
      free (target_base_shortcontents);
    }

  free (normalized_name);

  target_contents_filename
    = call_file_id_setting_sectioning_command_target_name (self, command,
                  target, target_contents, target_shortcontents, filename);
  if (target_contents_filename)
    {
      free (target);
      target = target_contents_filename->target;
      free (filename);
      filename = target_contents_filename->filename;
      free (target_contents);
      target_contents = target_contents_filename->target_contents;
      free (target_shortcontents);
      target_shortcontents = target_contents_filename->target_shortcontents;

      free (target_contents_filename);
    }

  if (self->conf->DEBUG > 0)
    {
      char *command_name = element_command_name (command);
      fprintf (stderr, "Register %s %s\n", command_name, target);
    }

  HTML_TARGET *element_target
    = add_element_target (self, command, target);
  element_target->section_filename = filename;
  add_string (target, &self->seen_ids);

  free (target);

  if (target_contents)
    element_target->contents_target = target_contents;
  else
    element_target->contents_target = strdup ("");

  if (target_shortcontents)
    element_target->shortcontents_target = target_shortcontents;
  else
    element_target->shortcontents_target = strdup ("");
}

/*
 This set with two different codes
  * the target information, id and normalized filename of 'identifiers_target',
    ie everything that may be the target of a ref, @node, @float label,
    @anchor.
  * The target information of sectioning elements
 @node and section commands targets are therefore both set.

 conversion to HTML is done on-demand, upon call to command_text
 and similar functions.
 Note that 'node_filename', which is set here for Top target information
 too, is not used later for Top anchors or links, see the NOTE below
 associated with setting TOP_NODE_FILE_TARGET.
 */
void
set_root_commands_targets_node_files (CONVERTER *self)
{

  if (self->document->identifiers_target)
    {
      char *extension = 0;

      if (self->conf->EXTENSION)
        extension = self->conf->EXTENSION;
      LABEL_LIST *label_targets = self->document->identifiers_target;
      int i;
      for (i = 0; i < label_targets->number; i++)
        {
          int called;
          char *target;
          char *node_filename;
          char *user_node_filename;
          LABEL *label = &label_targets->list[i];
          const ELEMENT *target_element = label->element;
          const ELEMENT *label_element = get_label_element (target_element);

          TARGET_FILENAME *target_filename =
           normalized_label_id_file (self, label->identifier, label_element);
          target = target_filename->target;
          if (extension)
            xasprintf (&node_filename, "%s.%s", target_filename->filename,
                                                extension);
          else
            node_filename = strdup (target_filename->filename);

          free (target_filename->filename);
          free (target_filename);

          /* a non defined filename is ok if called with convert, but not
             if output in files.  We reset if undef, silently unless verbose
             in case called by convert. */

          user_node_filename = call_file_id_setting_node_file_name (self,
                                               target_element, node_filename,
                                               &called);
          if (user_node_filename)
            {
              free (node_filename);
              node_filename = user_node_filename;
            }
          else if (called)
            {
              if (self->conf->VERBOSE > 0)
                {
                  message_list_document_warn (&self->error_messages, self->conf,
                             "user-defined node file name not set for `%s'",
                             node_filename);
                }
              else if (self->conf->DEBUG > 0)
                {
                  fprintf (stderr,
                     "user-defined node file name undef for `%s'\n",
                       node_filename);
                }
            }

          if (self->conf->DEBUG > 0)
            {
              char *command_name = element_command_name (target_element);
              fprintf (stderr, "Label @%s %s, %s\n", command_name, target,
                               node_filename);
            }

          HTML_TARGET *element_target
            = add_element_target (self, target_element, target);
          element_target->node_filename = node_filename;
          add_string (target, &self->seen_ids);

          free (target);
        }
    }

  if (self->document->sections_list
      && self->document->sections_list->number >= 0)
    {
      const ELEMENT_LIST *sections_list = self->document->sections_list;
      int i;
      for (i = 0; i < sections_list->number; i++)
        {
          const ELEMENT *root_element = sections_list->list[i];
          new_sectioning_command_target (self, root_element);
        }
    }
}

void
html_merge_index_entries (CONVERTER *self)
{
  if (self->document->index_names)
    {
      INDEX **index_names = self->document->index_names;
      MERGED_INDEX *merged_index_entries = merge_indices (index_names);
      self->index_entries = merged_index_entries;
    }
}

int
compare_index_name (const void *a, const void *b)
{
  const INDEX **idx_a = (const INDEX **) a;
  const INDEX **idx_b = (const INDEX **) b;

  return strcmp ((*idx_a)->name, (*idx_b)->name);
}

void
prepare_index_entries_targets (CONVERTER *self)
{
  if (self->document->index_names)
    {
      INDEX **i, *idx;
      INDEX **index_names = self->document->index_names;
      INDEX **sorted_index_names;
      int index_nr = 0;

      /* TODO sort indices by name before? when registering in document?
         In parser?
         Depending on size?  And use bsearch in some places?
       */
      for (i = index_names; (idx = *i); i++)
        index_nr++;

      sorted_index_names = (INDEX **) malloc ((index_nr+1) * sizeof (INDEX *));

      memcpy (sorted_index_names, index_names, (index_nr+1) * sizeof (INDEX *));
      qsort (sorted_index_names, index_nr, sizeof (INDEX *),
             compare_index_name);

      for (i = sorted_index_names; (idx = *i); i++)
        {
          if (idx->entries_number > 0)
            {
              int j;
              for (j = 0; j < idx->entries_number; j++)
                {
                  INDEX_ENTRY *index_entry;
                  const ELEMENT *main_entry_element;
                  const ELEMENT *seeentry;
                  const ELEMENT *seealso;
                  ELEMENT *entry_reference_content_element;
                  ELEMENT *normalize_index_element;
                  ELEMENT_LIST *subentries_tree;
                  const ELEMENT *target_element;
                  TEXT target_base;
                  char *normalized_index;
                  char *region = 0;
                  char *target;

                  index_entry = &idx->index_entries[j];
                  main_entry_element = index_entry->entry_element;
                  seeentry = lookup_extra_element (main_entry_element,
                                                   "seeentry");
                  if (seeentry)
                    continue;
                  seealso = lookup_extra_element (main_entry_element,
                                                  "seealso");
                  if (seealso)
                    continue;

                  region = lookup_extra_string (main_entry_element,
                                                "element_region");
                  entry_reference_content_element
                   = index_content_element (main_entry_element, 1);
        /* construct element to convert to a normalized identifier to use as
           hrefs target */
                  normalize_index_element = new_element (ET_NONE);
                  add_to_element_contents (normalize_index_element,
                                           entry_reference_content_element);

                  subentries_tree
                   = comma_index_subentries_tree (main_entry_element, " ");
                  if (subentries_tree)
                    {
                      insert_list_slice_into_contents (normalize_index_element,
                                       normalize_index_element->contents.number,
                                       subentries_tree, 0,
                                       subentries_tree->number);
                    }
                  normalized_index
                    = normalize_transliterate_texinfo (normalize_index_element,
                                                       (self->conf->TEST > 0));

                  destroy_element (normalize_index_element);
                  if (subentries_tree)
                    free_comma_index_subentries_tree (subentries_tree);

                  text_init (&target_base);
                  text_append (&target_base, "index-");
                  if (region)
                    {
                      text_append (&target_base, region);
                      text_append (&target_base, "-");
                    }
                  text_append (&target_base, normalized_index);
                  free (normalized_index);
                  target = unique_target (self, target_base.text);
                  free (target_base.text);
                  if (index_entry->entry_associated_element)
                    target_element = index_entry->entry_associated_element;
                  else
                    target_element = main_entry_element;

                  add_element_target (self, target_element, target);
                  add_string (target, &self->seen_ids);

                  free (target);
                }
            }
        }
      free (sorted_index_names);
    }
}

static const char *footid_base = "FOOT";
static const char *docid_base = "DOCF";

static void
prepare_footnotes_targets (CONVERTER *self)
{
  const ELEMENT *global_footnotes = &self->document->global_commands->footnotes;
  if (global_footnotes->contents.number > 0)
    {
      int i;
      for (i = 0; i < global_footnotes->contents.number; i++)
        {
          const ELEMENT *footnote = global_footnotes->contents.list[i];
          TEXT footid;
          TEXT docid;
          int nr = i+1;

          text_init (&footid);
          text_init (&docid);
          text_printf (&footid, "%s%d", footid_base, nr);
          text_printf (&docid, "%s%d", docid_base, nr);

          while (1)
            {
              int j;
              int non_unique = 0;
              for (j = 0; j < self->seen_ids.number; j++)
                {
                  if (!strcmp (footid.text, self->seen_ids.list[j])
                      || !strcmp (docid.text, self->seen_ids.list[j]))
                    {
                      non_unique = 1;
                      break;
                    }
                }
              if (non_unique)
                {
                  nr++;
                  if (nr == 0)
                    fatal ("overflow footnote target nr");

                  text_init (&footid);
                  text_init (&docid);
                  text_printf (&footid, "%s%d", footid_base, nr);
                  text_printf (&docid, "%s%d", docid_base, nr);
                }
              else
                break;
            }
          add_string (footid.text, &self->seen_ids);
          add_string (docid.text, &self->seen_ids);
          add_element_target (self, footnote, footid.text);
          add_special_target (self, ST_footnote_location, footnote,
                              docid.text);

          if (self->conf->DEBUG > 0)
            {
              char *footnote_txi = convert_to_texinfo (footnote);
              fprintf (stderr, "Enter footnote: target %s, nr %d\n%s\n",
                       footid.text, nr, footnote_txi);
              free (footnote_txi);
            }
          free (footid.text);
          free (docid.text);
        }
    }
}

/* for conversion units except for associated special units that require
   files for document units to be set */
void
html_prepare_conversion_units_targets (CONVERTER *self,
                                       const char *document_name,
                                       int output_units_descriptor,
                                       int special_units_descriptor,
                                       int associated_special_units_descriptor)
{
  /*
   Do that before the other elements, to be sure that special page ids
   are registered before elements id are.
   */
  set_special_units_targets_files (self, special_units_descriptor,
                                   document_name);

  prepare_associated_special_units_targets (self,
                                  associated_special_units_descriptor);

  set_root_commands_targets_node_files (self);

  prepare_index_entries_targets (self);
  prepare_footnotes_targets (self);
}

/* Associate output units to the global targets, First, Last, Top, Index.
   and special output units */
void
html_prepare_output_units_global_targets (CONVERTER *self,
                                        int output_units_descriptor,
                                        int special_units_descriptor,
                                        int associated_special_units_descriptor)
{
  int i;
  int all_special_units_nr = 0;
  int s;
  const OUTPUT_UNIT_LIST *output_units
    = retrieve_output_units (output_units_descriptor);

  const OUTPUT_UNIT *top_output_unit = get_top_unit (self->document,
                                                     output_units);

  int special_output_units_lists[2] = {special_units_descriptor,
                                       associated_special_units_descriptor};

  self->global_units_directions[D_First] = output_units->list[0];
  self->global_units_directions[D_Last]
    = output_units->list[output_units->number - 1];

  self->global_units_directions[D_Top] = top_output_unit;

  /* It is always the first printindex, even if it is not output (for example
     it is in @copying and @titlepage, which are certainly wrong constructs).
   */
  if (self->document->global_commands->printindex.contents.number > 0)
    {
      const ELEMENT *printindex
        = self->document->global_commands->printindex.contents.list[0];
      ROOT_AND_UNIT *root_unit
        = html_get_tree_root_element (self, printindex, 0);
      if (root_unit->output_unit)
        {
          const OUTPUT_UNIT *document_unit = root_unit->output_unit;
          const ELEMENT *root_command = root_unit->root;
          if (root_command && root_command->cmd == CM_node)
            {
              const ELEMENT *associated_section
                = lookup_extra_element (root_command, "associated_section");
              if (associated_section)
                root_command = associated_section;
            }
       /* find the first level 1 sectioning element to associate the printindex
           with */
          if (root_command && root_command->cmd != CM_node)
            {
              while (1)
                {
                  int status;
                  int section_level
                    = lookup_extra_integer (root_command, "section_level",
                                                               &status);
                  if (!status && section_level <= 1)
                    break;

                  const ELEMENT *up_section_directions
                    = lookup_extra_element (root_command, "section_directions");
                  if (up_section_directions
                      && up_section_directions->contents.list[D_up]
                      && up_section_directions->contents.list[D_up]
                                     ->associated_unit)
                    {
                      root_command = up_section_directions->contents.list[D_up];
                      document_unit = root_command->associated_unit;
                    }
                  else
                    break;
                }
            }
          self->global_units_directions[D_Index] = document_unit;
        }
      free (root_unit);
    }

  if (self->conf->DEBUG > 0)
    {
      int i;
      fprintf (stderr, "GLOBAL DIRECTIONS:\n");
      for (i = 0; i < D_Last+1; i++)
        {
          if (self->global_units_directions[i])
            {
              const OUTPUT_UNIT *global_unit = self->global_units_directions[i];
              char *unit_texi = output_unit_texi (global_unit);
              fprintf (stderr, " %s: %s\n", html_global_unit_direction_names[i],
                                            unit_texi);
              free (unit_texi);
            }
        }
      fprintf (stderr, "\n");
    }

  /* determine total number of special output units and fill
     special_units_directions_name_unit.  Used to simplify building perl
     directions */
  for (i = 0; i < 2; i++)
    {
      int special_units_descriptor = special_output_units_lists[i];
      const OUTPUT_UNIT_LIST *units_list
       = retrieve_output_units (special_units_descriptor);
      if (units_list && units_list->number)
        all_special_units_nr += units_list->number;
    }

  self->special_units_direction_name = (SPECIAL_UNIT_DIRECTION *)
   malloc (sizeof (SPECIAL_UNIT_DIRECTION) * (all_special_units_nr+1));
  memset (self->special_units_direction_name, 0,
          sizeof (SPECIAL_UNIT_DIRECTION) * (all_special_units_nr+1));

  s = 0;
  for (i = 0; i < 2; i++)
    {
      int special_units_descriptor = special_output_units_lists[i];
      OUTPUT_UNIT_LIST *units_list
       = retrieve_output_units (special_units_descriptor);
      if (units_list && units_list->number)
        {
          int j;
          for (j = 0; j < units_list->number; j++)
            {
              const OUTPUT_UNIT *special_unit = units_list->list[j];
              char *special_unit_variety = special_unit->special_unit_variety;
              int special_unit_direction_index
                = special_unit_variety_direction_index (self,
                                                special_unit_variety);
              self->global_units_directions[special_unit_direction_index]
                = special_unit;

              self->special_units_direction_name[s].output_unit = special_unit;
              self->special_units_direction_name[s].direction
                = special_unit_info (self, SUI_type_direction,
                                           special_unit_variety);
              s++;
            }
        }
    }
}

static void
set_file_source_info (FILE_SOURCE_INFO *file_source_info,
                          char *file_info_type, char *file_info_name,
                          const ELEMENT *file_info_element, char *filepath)
{
  file_source_info->type = file_info_type;
  file_source_info->name = file_info_name;
  file_source_info->element = file_info_element;
  file_source_info->path = filepath;
}

static FILE_SOURCE_INFO *
add_to_files_source_info (FILE_SOURCE_INFO_LIST *files_source_info,
                          char *filename,
                          char *file_info_type, char *file_info_name,
                          const ELEMENT *file_info_element, char *filepath)
{
  FILE_SOURCE_INFO *new_file_source_info;
  if (files_source_info->number == files_source_info->space)
    {
      files_source_info->list = realloc (files_source_info->list,
               (files_source_info->space += 5) * sizeof (FILE_SOURCE_INFO));
      if (!files_source_info->list)
       fatal ("realloc failed");
    }

  new_file_source_info =
   &files_source_info->list[files_source_info->number];

  new_file_source_info->filename = strdup (filename);
  set_file_source_info (new_file_source_info, file_info_type,
                        file_info_name, file_info_element, filepath);

  files_source_info->number++;

  return new_file_source_info;
}

static FILE_SOURCE_INFO *
find_file_source_info (FILE_SOURCE_INFO_LIST *files_source_info,
                            char *filename)
{
  int i;
  for (i = 0; i < files_source_info->number; i++)
    {
      FILE_SOURCE_INFO *file_source_info = &files_source_info->list[i];
      if (!strcmp (file_source_info->filename, filename))
        return file_source_info;
    }
  return 0;
}

void
html_destroy_files_source_info (FILE_SOURCE_INFO_LIST *files_source_info)
{
  int i;
  for (i = 0; i < files_source_info->number; i++)
    {
      free (files_source_info->list[i].filename);
    }
  free (files_source_info->list);
  free (files_source_info);
}

static char *
add_to_unit_file_name_paths (char **unit_file_name_paths,
                             char *filename, OUTPUT_UNIT *output_unit)
{
  char **new_output_unit_file_name
                  = &unit_file_name_paths[output_unit->index];
  *new_output_unit_file_name = strdup (filename);

  return *new_output_unit_file_name;
}

static FILE_SOURCE_INFO_LIST *
html_set_pages_files (CONVERTER *self, OUTPUT_UNIT_LIST *output_units,
                      OUTPUT_UNIT_LIST *special_units,
                      OUTPUT_UNIT_LIST *associated_special_units,
                      char *output_file,
                      char *destination_directory, char *output_filename,
                      char *document_name)
{
  FILE_SOURCE_INFO_LIST *files_source_info = 0;
  char **unit_file_name_paths;
  int i;

  if (!output_units || !output_units->number)
    return 0;

  initialize_output_units_files (self);

  files_source_info = (FILE_SOURCE_INFO_LIST *)
    malloc (sizeof (FILE_SOURCE_INFO_LIST));
  memset (files_source_info, 0, sizeof (FILE_SOURCE_INFO_LIST));

  unit_file_name_paths = (char **)
   malloc (output_units->number * sizeof (char *));
  memset (unit_file_name_paths, 0,
          output_units->number * sizeof (char *));

  if (!self->conf->SPLIT || !strlen (self->conf->SPLIT))
    {
      int i;
      add_to_files_source_info (files_source_info, output_filename,
                                "special_file", "non_split", 0,
                                output_file);
      for (i = 0; i < output_units->number; i++)
        {
          add_to_unit_file_name_paths (unit_file_name_paths,
                                       output_filename,
                                       output_units->list[i]);
        }
    }
  else
    {
      char *top_node_filename_str;
      OUTPUT_UNIT *node_top_output_unit = 0;
      char *extension = 0;
      const ELEMENT *node_top = 0;
      int file_nr = 0;
      int i;

      /* first determine the top node file name. */
      if (self->document->identifiers_target)
        node_top = find_identifier_target (self->document->identifiers_target,
                                           "Top");

      top_node_filename_str = top_node_filename (self, document_name);

      if (node_top && top_node_filename_str)
        {
          int i;
          node_top_output_unit = node_top->associated_unit;
          for (i = 0; i < output_units->number; i++)
            if (output_units->list[i] == node_top_output_unit)
              break;
          add_to_files_source_info (files_source_info, top_node_filename_str,
                                    "special_file", "Top", 0, 0);
          add_to_unit_file_name_paths (unit_file_name_paths,
                                       top_node_filename_str,
                                       node_top_output_unit);
        }

      if (self->conf->EXTENSION && strlen (self->conf->EXTENSION))
        extension = self->conf->EXTENSION;

      for (i = 0; i < output_units->number; i++)
        {
          OUTPUT_UNIT *output_unit = output_units->list[i];
          OUTPUT_UNIT *file_output_unit;
          char *output_unit_file_name;
          /* For Top node. */
          if (node_top_output_unit && node_top_output_unit == output_unit)
            continue;

          file_output_unit = output_unit->first_in_page;
          output_unit_file_name
           = unit_file_name_paths[file_output_unit->index];
          if (!output_unit_file_name)
            {
              char *node_filename = 0;
              int j;
              for (j = 0; j < file_output_unit->unit_contents.number; j++)
                {
                  const ELEMENT *root_command
                     = file_output_unit->unit_contents.list[j];
                  if (root_command->cmd == CM_node)
                    {
                      const ELEMENT *node_target = 0;
                      char *normalized = lookup_extra_string (root_command,
                                                              "normalized");
                      if (normalized)
                        node_target
                         = find_identifier_target (
                                  self->document->identifiers_target,
                                  normalized);
                   /* double node are not normalized, they are handled here */
                      if (!node_target)
                        {
                          FILE_SOURCE_INFO *file_source_info = 0;

                          TEXT file_name_text;
                          text_init (&file_name_text);
                          text_append (&file_name_text, "unknown_node");
                          if (extension)
                            {
                              text_append (&file_name_text, ".");
                              text_append (&file_name_text, extension);
                            }
                          file_source_info
                            = find_file_source_info (files_source_info,
                                                         file_name_text.text);
                          if (!file_source_info)
                            {
                              file_source_info
                                = add_to_files_source_info (files_source_info,
                                                file_name_text.text, "node", 0,
                                                              root_command, 0);
                              node_filename = file_source_info->filename;
                            }
                          free (file_name_text.text);
                        }
                      else
                        {
          /* Nodes with {'extra'}->{'is_target'} should always be in
            'identifiers_target', and thus in targets.  It is a bug otherwise. */
                          FILE_SOURCE_INFO *file_source_info = 0;
                          HTML_TARGET *node_target
                            = find_element_target (&self->html_targets,
                                                   root_command);
                          node_filename = node_target->node_filename;

                          file_source_info
                            = find_file_source_info (files_source_info,
                                                          node_filename);
                          if (file_source_info)
                            {
                              if (!strcmp (file_source_info->type,
                                           "stand_in_file"))
                                {/* NOTE we keep the order, as in perl */
                                  set_file_source_info (file_source_info,
                                                        "node",
                                                        0, root_command, 0);
                                }
                            }
                          else
                            add_to_files_source_info (files_source_info,
                                                 node_filename, "node", 0,
                                                 root_command, 0);
                        }
                      output_unit_file_name
                        = add_to_unit_file_name_paths (unit_file_name_paths,
                                                       node_filename,
                                                       file_output_unit);
                      break;
                    }
                }
              if (!node_filename)
                {
                  /* use section to do the file name if there is no node */
                  const ELEMENT *command = file_output_unit->unit_command;
                  if (command)
                    {
                      if (command->cmd == CM_top && !node_top
                          && top_node_filename_str)
                        {
                   /* existing top_node_filename can happen, see
                      html_tests.t top_file_name_and_node_name_collision */
                          FILE_SOURCE_INFO *file_source_info
                            = find_file_source_info (files_source_info,
                                                  top_node_filename_str);
                          if (file_source_info)
                            {/* NOTE we keep the order, as in perl */
                              set_file_source_info (file_source_info,
                                                    "special_file", "Top",
                                                    0, 0);
                            }
                          else
                            {
                              add_to_files_source_info (files_source_info,
                                                       top_node_filename_str,
                                                       "special_file", "Top",
                                                       0, 0);
                            }
                          output_unit_file_name
                           = add_to_unit_file_name_paths (unit_file_name_paths,
                                                          top_node_filename_str,
                                                           file_output_unit);
                        }
                      else
                        {
                          HTML_TARGET *section_target
                            = find_element_target (&self->html_targets,
                                                   command);
                          char *section_filename
                            = section_target->section_filename;

                          FILE_SOURCE_INFO *file_source_info
                            = find_file_source_info (files_source_info,
                                                     section_filename);
                          if (file_source_info)
                            {
                              if (!strcmp (file_source_info->type,
                                           "stand_in_file"))
                                {/* NOTE we keep the order, as in perl */
                                  set_file_source_info (file_source_info,
                                                        "section",
                                                        0, command, 0);
                                }
                            }
                          else
                            add_to_files_source_info (files_source_info,
                                                 section_filename, "section", 0,
                                                 command, 0);
                          output_unit_file_name
                            = add_to_unit_file_name_paths (unit_file_name_paths,
                                                           section_filename,
                                                           file_output_unit);
                        }
                    }
                  else
                    {
                      /* when everything else has failed */
                      if (file_nr == 0 && !node_top
                          && top_node_filename_str)
                        {
                          FILE_SOURCE_INFO *file_source_info
                            = find_file_source_info (files_source_info,
                                                  top_node_filename_str);
                          if (!file_source_info)
                            {
                              add_to_files_source_info (files_source_info,
                                                       top_node_filename_str,
                                                       "stand_in_file", "Top",
                                                       0, 0);
                            }
                          output_unit_file_name
                           = add_to_unit_file_name_paths (unit_file_name_paths,
                                                         top_node_filename_str,
                                                           file_output_unit);
                        }
                      else
                        {
                          FILE_SOURCE_INFO *file_source_info;

                          TEXT file_name_text;
                          text_init (&file_name_text);
                          text_printf (&file_name_text, "%s_%d", document_name,
                                                                file_nr);
                          if (extension)
                            {
                              text_append (&file_name_text, ".");
                              text_append (&file_name_text, extension);
                            }
                          file_source_info
                            = find_file_source_info (files_source_info,
                                                  file_name_text.text);
                          if (!file_source_info)
                            {
                              add_to_files_source_info (files_source_info,
                                                       file_name_text.text,
                                                       "stand_in_file",
                                                       "unknown",
                                                       0, 0);
                            }
                          output_unit_file_name
                           = add_to_unit_file_name_paths (unit_file_name_paths,
                                                          file_name_text.text,
                                                           file_output_unit);
                          free (file_name_text.text);
                        }
                      file_nr++;
                    }
                }
            }
          if (output_unit != file_output_unit)
            add_to_unit_file_name_paths (unit_file_name_paths,
                                         output_unit_file_name,
                                         output_unit);
        }
      free (top_node_filename_str);
    }

  self->output_unit_file_indices = (size_t *)
    malloc (output_units->number * sizeof (size_t));

  for (i = 0; i < output_units->number; i++)
    {
      size_t output_unit_file_idx = 0;
      FILE_NAME_PATH_COUNTER *output_unit_file;
      OUTPUT_UNIT *output_unit = output_units->list[i];
      char *output_unit_file_name = unit_file_name_paths[i];
      char *filename = strdup (output_unit_file_name);
      FILE_SOURCE_INFO *file_source_info
        = find_file_source_info (files_source_info, output_unit_file_name);
      char *filepath = file_source_info->path;

      FILE_NAME_PATH *file_name_path
        = call_file_id_setting_unit_file_name (self, output_unit,
                                         output_unit_file_name, filepath);
      if (file_name_path)
        {
          if (file_name_path->filename)
            {
              FILE_SOURCE_INFO *file_source_info
               = find_file_source_info (files_source_info,
                                        file_name_path->filename);
              if (file_source_info)
                {
                  if (file_source_info->path && file_name_path->filepath
                      && strcmp (file_source_info->path,
                                 file_name_path->filepath))
                    {
                      message_list_document_warn (&self->error_messages,
                                                  self->conf,
                                     "resetting %s file path %s to %s",
                                           file_name_path->filename,
                                           file_source_info->path,
                                           file_name_path->filepath);
                    }
                  set_file_source_info (file_source_info, "special_file",
                                "user_defined", 0, file_name_path->filepath);
                }
              else
                add_to_files_source_info (files_source_info,
                                          file_name_path->filename,
                                          "special_file", "user_defined",
                                           0, file_name_path->filepath);
              free (filename);
              filename = file_name_path->filename;
            }
          free (file_name_path);
        }
      output_unit_file_idx
        = set_output_unit_file (self, output_unit, filename, 1);
      self->output_unit_file_indices[i] = output_unit_file_idx;
      output_unit_file = &self->output_unit_files.list[output_unit_file_idx];
      if (self->conf->DEBUG > 0)
        fprintf (stderr, "Page %s: %s(%d)\n",
                 output_unit_texi (output_unit),
                 output_unit->unit_filename, output_unit_file->counter);
      free (filename);
      free (output_unit_file_name);
    }

  free (unit_file_name_paths);

  if (special_units && special_units->number)
    {
      int i;
      self->special_unit_file_indices = (size_t *)
        malloc (special_units->number * sizeof (size_t));
      for (i = 0; i < special_units->number; i++)
        {
          size_t special_unit_file_idx = 0;
          FILE_NAME_PATH_COUNTER *special_unit_file;
          OUTPUT_UNIT *special_unit = special_units->list[i];
          const ELEMENT *unit_command = special_unit->unit_command;
          const HTML_TARGET *special_unit_target
            = find_element_target (&self->html_targets, unit_command);
          char *filename = special_unit_target->special_unit_filename;

        /* Associate the special elements that have no page with the main page.
           This may only happen if not split. */
          if (!filename && special_units->number
              && output_units && output_units->number
              && output_units->list[0]->unit_filename)
            {
              filename = output_units->list[0]->unit_filename;
            }

          if (filename)
            {
              FILE_SOURCE_INFO *file_source_info
               = find_file_source_info (files_source_info, filename);
              if (file_source_info)
                {
                  if (!strcmp (file_source_info->type, "stand_in_file"))
                    {/* NOTE we keep the order, as in perl */
                      set_file_source_info (file_source_info, "special_unit",
                                            0, unit_command, 0);
                    }
                }
              else
                add_to_files_source_info (files_source_info, filename,
                                          "special_unit", 0, unit_command, 0);
            }
          special_unit_file_idx
            = set_output_unit_file (self, special_unit, filename, 1);
          self->special_unit_file_indices[i] = special_unit_file_idx;
          special_unit_file
             = &self->output_unit_files.list[special_unit_file_idx];
          if (self->conf->DEBUG > 0)
            fprintf (stderr, "Special page: %s(%d)\n", filename,
                             special_unit_file->counter);
        }
    }

  for (i = 0; i < files_source_info->number; i++)
    {
      FILE_SOURCE_INFO *file_source_info = &files_source_info->list[i];
      set_file_path (self, file_source_info->filename, file_source_info->path,
                     destination_directory);
    }

  /*
   to be able to associate to the output unit file the associated
   output units will be output into, this is done after document output
   units got files.
   In practice only used for contents and shortcontents.
   */
  if (associated_special_units && associated_special_units->number > 0)
    {
      int i;
      for (i = 0; i < associated_special_units->number; i++)
        {
          char *filename = 0;
          OUTPUT_UNIT *special_unit = associated_special_units->list[i];
          const OUTPUT_UNIT *associated_output_unit
            = special_unit->associated_document_unit;
          const ELEMENT *unit_command = special_unit->unit_command;
          HTML_TARGET *element_target
            = find_element_target (&self->html_targets, unit_command);

          if (element_target->special_unit_filename)
            filename = element_target->special_unit_filename;
          else
            {
              if (associated_output_unit)
                filename = strdup (associated_output_unit->unit_filename);
              element_target->special_unit_filename = filename;
            }

   /* set here the file name, but do not increment the counter as it is
      already set for the output unit the special output unit is in. */
          if (filename)
            set_output_unit_file (self, special_unit, filename, 0);
        }
    }

  /* initialize data that requires output_unit_files number */
  self->file_changed_counter.list = (size_t *)
      malloc (self->output_unit_files.number * sizeof (size_t));
  memset (self->file_changed_counter.list, 0,
          self->output_unit_files.number * sizeof (size_t));

  return files_source_info;
}

static void
prepare_special_units_directions (CONVERTER *self,
                                  OUTPUT_UNIT_LIST *special_units)
{
  int i;

  if (!special_units)
    return;

  for (i = 0; i < special_units->number; i++)
    {
      OUTPUT_UNIT *special_unit = special_units->list[i];
      special_unit->directions[RUD_type_This] = special_unit;
    }
}

FILE_SOURCE_INFO_LIST *
html_prepare_units_directions_files (CONVERTER *self,
          int output_units_descriptor,
          int special_units_descriptor, int associated_special_units_descriptor,
          char *output_file, char *destination_directory, char *output_filename,
          char *document_name)
{
  int i;
  FILE_SOURCE_INFO_LIST *files_source_info = 0;
  OUTPUT_UNIT_LIST *output_units
    = retrieve_output_units (output_units_descriptor);
  OUTPUT_UNIT_LIST *special_units
    = retrieve_output_units (special_units_descriptor);
  OUTPUT_UNIT_LIST *associated_special_units
    = retrieve_output_units (associated_special_units_descriptor);

  html_prepare_output_units_global_targets (self, output_units_descriptor,
                                             special_units_descriptor,
                                       associated_special_units_descriptor);

  split_pages (output_units, self->conf->SPLIT);

  if (strlen (output_file))
    {
      files_source_info =
        html_set_pages_files (self, output_units, special_units,
                        associated_special_units, output_file,
                        destination_directory, output_filename, document_name);
    }

  units_directions (self->conf, self->document->identifiers_target,
                    output_units);

  prepare_special_units_directions (self, special_units);

  units_file_directions (output_units);

 /* elements_in_file_count is only set in HTML, not in
    Texinfo::Convert::Converter */
  if (self->output_unit_files.number)
    {
      for (i = 0; i < self->output_unit_files.number; i++)
        {
          FILE_NAME_PATH_COUNTER *file_counter
            = &self->output_unit_files.list[i];

          /* counter is dynamic, decreased when the element is encountered
             elements_in_file_count is not modified afterwards */
          file_counter->elements_in_file_count = file_counter->counter;
        }
    }

  return files_source_info;
}

static char *
command_conversion (CONVERTER *self, enum command_id cmd,
                    const ELEMENT *element, HTML_ARGS_FORMATTED *args_formatted,
                    char *content)
{
  /* TODO call a C function if status is FRS_status_default_set
     maybe putting function references in an array */
  /* FIXME XS specific debug message */
  /*
  if (self->conf->DEBUG > 0)
    fprintf (stderr, "DEBUG: command conversion %s '%s'\n",
             builtin_command_data[cmd].cmdname, content);
   */

  FORMATTING_REFERENCE *formatting_reference
    = &self->current_commands_conversion[cmd];

  if (formatting_reference->status > 0)
    return call_commands_conversion (self, cmd, formatting_reference,
                                     element, args_formatted, content);
  return 0;
}

static char *
command_open (CONVERTER *self, enum command_id cmd, const ELEMENT *element)
{
  /* TODO call a C function if status is FRS_status_default_set
     maybe putting function references in an array */
  if (self->commands_open[cmd].status > 0)
    return call_commands_open (self, cmd, element);
  return 0;
}

static char *
type_conversion (CONVERTER *self, enum element_type type,
                 const ELEMENT *element, char *content)
{
  /* TODO call a C function if status is FRS_status_default_set
     maybe putting function references in an array */

  FORMATTING_REFERENCE *formatting_reference
    = &self->current_types_conversion[type];

  if (formatting_reference->status > 0)
    return call_types_conversion (self, type, formatting_reference,
                                  element, content);
  return 0;
}

static char *
type_open (CONVERTER *self, enum element_type type, const ELEMENT *element)
{
  /* TODO call a C function if status is FRS_status_default_set
     maybe putting function references in an array */
  if (self->types_open[type].status > 0)
    return call_types_open (self, type, element);
  return 0;
}


static void
push_html_formatting_context (HTML_FORMATTING_CONTEXT_STACK *stack,
                              char *context_name)
{
  if (stack->top >= stack->space)
    {
      stack->stack
        = realloc (stack->stack,
                   (stack->space += 5) * sizeof (HTML_FORMATTING_CONTEXT));
    }

  memset (&stack->stack[stack->top], 0, sizeof (HTML_FORMATTING_CONTEXT));

  stack->stack[stack->top].context_name = strdup (context_name);

  stack->top++;
}

static void
pop_html_formatting_context (HTML_FORMATTING_CONTEXT_STACK *stack)
{
  if (stack->top == 0)
    fatal ("HTML formatting context stack empty");

  free (stack->stack[stack->top - 1].context_name);
  stack->top--;
}

void
html_new_document_context (CONVERTER *self,
        char *context_name, char *document_global_context,
        enum command_id block_command)
{
  HTML_DOCUMENT_CONTEXT_STACK *stack = &self->html_document_context;
  HTML_DOCUMENT_CONTEXT *doc_context;

  self->modified_state |= HMSF_document_context;
  self->document_context_change++;

  if (stack->top >= stack->space)
    {
      stack->stack
        = realloc (stack->stack,
                   (stack->space += 5) * sizeof (HTML_DOCUMENT_CONTEXT));
    }

  doc_context = &stack->stack[stack->top];
  memset (doc_context, 0, sizeof (HTML_DOCUMENT_CONTEXT));
  doc_context->context = strdup (context_name);
  doc_context->document_global_context = document_global_context;

  push_style_no_code (&doc_context->monospace);
  push_command_or_type (&doc_context->composition_context, 0, 0);
  if (block_command)
    push_command (&doc_context->block_commands, block_command);

  if (document_global_context)
    {
      self->document_global_context++;
      self->modified_state |= HMSF_converter_state;
    }

  push_html_formatting_context (&doc_context->formatting_context,
                                "_format");

  stack->top++;
}

void
html_pop_document_context (CONVERTER *self)
{
  HTML_DOCUMENT_CONTEXT_STACK *stack = &self->html_document_context;
  HTML_DOCUMENT_CONTEXT *document_ctx;

  if (stack->top == 0)
    fatal ("HTML document context stack empty for pop");

  self->modified_state |= HMSF_document_context;
  self->document_context_change--;
  /* set document_contexts_to_pop to the lowest level below last sync with
     perl reached */
  if (-self->document_context_change > self->document_contexts_to_pop)
    self->document_contexts_to_pop = -self->document_context_change;

  document_ctx = &stack->stack[stack->top -1];

  free (document_ctx->context);
  free (document_ctx->monospace.stack);
  free (document_ctx->composition_context.stack);
  free (document_ctx->preformatted_classes.stack);
  if (document_ctx->block_commands.top > 0)
    pop_command (&document_ctx->block_commands);
  free (document_ctx->block_commands.stack);
  pop_html_formatting_context (&document_ctx->formatting_context);
  free (document_ctx->formatting_context.stack);

  if (document_ctx->document_global_context)
    {
      self->document_global_context--;
      self->modified_state |= HMSF_converter_state;
    }

  stack->top--;
}

void
reset_translated_special_unit_info_tree (CONVERTER *self)
{
  STRING_LIST *special_unit_varieties = &self->special_unit_varieties;
  int j;
  for (j = 0; translated_special_unit_info[j].tree_type != SUIT_type_none; j++)
    {
      int i;
      enum special_unit_info_tree tree_type
        = translated_special_unit_info[j].tree_type;
      for (i = 0; i < special_unit_varieties->number; i++)
        {
          if (self->special_unit_info_tree[tree_type][i])
            destroy_element_and_children (
              self->special_unit_info_tree[tree_type][i]);
          self->special_unit_info_tree[tree_type][i] = 0;
        }
    }
}

/* most of the initialization is done by html_converter_initialize_sv
   in get_perl_info, the initialization that do not require information
   from perl is done here.  This is called after information from perl
   has been gathered  */
void
html_converter_initialize (CONVERTER *self)
{
  int i;
  int nr_special_units;
  int nr_default_commands
    = sizeof (default_commands_args) / sizeof (default_commands_args[0]);
  int max_args = MAX_COMMAND_ARGS_NR;

  /* first set information that is fully independent from information
     coming from perl */

  for (i = 0; i < nr_default_commands; i++)
    {
      /* we file the status for specified commands, to distinguish them
         but it is not actually used in the code, as we default to
         normal for unspecified commands too */
      enum command_id cmd = default_commands_args[i].cmd;
      command_args_flags[cmd].status = 1;
      memcpy (&command_args_flags[cmd].flags, &default_commands_args[i].flags,
              max_args * sizeof (unsigned long));
    }

  for (i = 0; small_block_associated_command[i][0]; i++)
    {
      enum command_id small_cmd = small_block_associated_command[i][0];
      enum command_id cmd = small_block_associated_command[i][1];
      if (builtin_command_data[cmd].flags & CF_preformatted)
        register_pre_class_command (small_cmd, cmd);
    }

  for (i = 1; i < BUILTIN_CMD_NUMBER; i++)
    {
      if (builtin_command_data[i].flags & CF_block
          || builtin_command_data[i].flags & CF_root)
        register_format_context_command (i);

      if (builtin_command_data[i].flags & CF_preformatted
          || builtin_command_data[i].flags & CF_root)
        html_commands_data[i].flags |= HF_composition_context;

      if (builtin_command_data[i].flags & CF_block)
        {
          if (builtin_command_data[i].data == BLOCK_menu)
            html_commands_data[i].flags |= HF_composition_context;
          else if (builtin_command_data[i].data == BLOCK_format_raw)
            html_commands_data[i].flags |= HF_format_raw;
        }

      if (builtin_command_data[i].flags & CF_preformatted)
        {
          if (!(html_commands_data[i].flags & HF_pre_class))
            register_pre_class_command (i, 0);
        }
    }
  register_pre_class_command (CM_verbatim, 0);
  register_pre_class_command (CM_menu, 0);
  for (i = 0; additional_format_context_cmd[i]; i++)
    register_format_context_command (additional_format_context_cmd[i]);

  for (i = 0; HTML_align_cmd[i]; i++)
    {
      enum command_id cmd = HTML_align_cmd[i];
      html_commands_data[cmd].flags |= HF_HTML_align | HF_composition_context;
    }

  html_commands_data[CM_float].flags |= HF_composition_context;

  html_commands_data[CM_sc].flags |= HF_upper_case;

  /* initialization needing some information from perl */

  nr_special_units = self->special_unit_varieties.number;

  /* allocate space for translated tree types, they will be created
     on-demand during the conversion */
  for (i = 0; i < SUIT_type_heading+1; i++)
    {
      self->special_unit_info_tree[i] = (ELEMENT **)
        malloc ((nr_special_units +1) * sizeof (ELEMENT *));
      memset (self->special_unit_info_tree[i], 0,
               (nr_special_units +1) * sizeof (ELEMENT *));
    }

  self->global_units_directions
    = (const OUTPUT_UNIT **) malloc ((D_Last + nr_special_units+1)
                               * sizeof (OUTPUT_UNIT));

  /* note that we allocate the same size as no_arg_formatted_cmd
     even though in general there are much less translated commands,
     for simplicity */
  if (self->no_arg_formatted_cmd.number)
    {
      self->no_arg_formatted_cmd_translated.list = (enum command_id *)
       malloc (self->no_arg_formatted_cmd.number * sizeof (enum command_id));
      memset (self->no_arg_formatted_cmd_translated.list, 0,
              self->no_arg_formatted_cmd.number * sizeof (enum command_id));
    }

  for (i = 0; command_special_unit_variety[i].cmd; i++)
    {
      char *special_unit_variety = command_special_unit_variety[i].variety;
      /* number is index +1 */
      size_t number = find_string (&self->special_unit_varieties,
                                   special_unit_variety);
      enum command_id cmd = command_special_unit_variety[i].cmd;
      html_commands_data[cmd].flags |= HF_special_variety;
      self->command_special_variety_name_index[i].cmd = cmd;
      self->command_special_variety_name_index[i].index = number - 1;
    }


}

void
reset_html_targets (HTML_TARGET_LIST *targets)
{
  size_t i;

  if (targets->number)
    {
      for (i = 0; i < targets->number; i++)
        {
          HTML_TARGET *html_target = &targets->list[i];
          /* setup before conversion */
          free (html_target->target);
          free (html_target->special_unit_filename);
          free (html_target->node_filename);
          free (html_target->section_filename);
          free (html_target->contents_target);
          free (html_target->shortcontents_target);

          /* TODO free fields changed during conversion */
        }
      memset (targets->list, 0,
              sizeof (HTML_TARGET) * targets->number);
      targets->number = 0;
    }
}

void
html_initialize_output_state (CONVERTER *self, char *context)
{
  /* directions */
  memset (self->global_units_directions, 0,
    (D_Last + self->special_unit_varieties.number+1) * sizeof (OUTPUT_UNIT));


  self->current_formatting_references = &self->formatting_references[0];
  self->current_commands_conversion = &self->commands_conversion[0];
  self->current_types_conversion = &self->types_conversion[0];

  /* FIXME now done through HTML _initialize_output_state, would need
     to readd when the HTML function is overriden
  html_new_document_context (self, context, 0, 0);
   */
}

void
html_finalize_output_state (CONVERTER *self)
{
  int i;
  reset_translated_special_unit_info_tree (self);
  /* targets */
  reset_html_targets (&self->html_targets);
  clear_strings_list (&self->seen_ids);
  for (i = 0; i < ST_footnote_location+1; i++)
    {
      reset_html_targets (&self->html_special_targets[i]);
    }

  free (self->special_units_direction_name);
  self->special_units_direction_name = 0;
  free (self->output_unit_file_indices);
  self->output_unit_file_indices = 0;
  free (self->special_unit_file_indices);
  self->special_unit_file_indices = 0;
  free (self->title_titlepage);
  self->title_titlepage = 0;

  if (self->index_entries)
    {
      destroy_merged_indices (self->index_entries);
      self->index_entries = 0;
    }
  if (self->index_entries_by_letter)
    {
      destroy_indices_sorted_by_letter (self->index_entries_by_letter);
      self->index_entries_by_letter = 0;
    }

  clear_output_files_information (&self->output_files_information);
  clear_output_unit_files (&self->output_unit_files);

  html_pop_document_context (self);

  /* could change to 0 in releases? */
  if (1)
    {
      if (self->html_document_context.top > 0)
        fprintf (stderr, "BUG: document context top > 0: %zu\n",
                         self->html_document_context.top);
      if (self->document_global_context)
        fprintf (stderr, "BUG: document_global_context: %d\n",
                         self->document_global_context);
      if (self->ignore_notice)
        fprintf (stderr, "BUG: ignore_notice: %d\n",
                         self->ignore_notice);

    }
}

void
html_check_transfer_state_finalization (CONVERTER *self)
{
  /* could change to 0 in releases? */
  if (1)
    {
      /* check that all the state change have been transmitted */
      if (self->tree_to_build)
        fprintf (stderr, "BUG: tree_to_build set\n");
      if (self->document_context_change)
        fprintf (stderr, "BUG: document_context_change: %d\n",
                         self->document_context_change);
      if (self->document_contexts_to_pop)
        fprintf (stderr, "BUG: document_contexts_to_pop: %d\n",
                         self->document_contexts_to_pop);
      if (self->no_arg_formatted_cmd_translated.number)
        fprintf (stderr, "BUG: no_arg_formatted_cmd_translated: %zu\n",
                         self->no_arg_formatted_cmd_translated.number);
      if (self->reset_target_commands.number)
        fprintf (stderr, "BUG: reset_target_commands: %zu\n",
                         self->reset_target_commands.number);
      if (self->file_changed_counter.number)
        fprintf (stderr, "BUG: file_changed_counter: %zu\n",
                         self->file_changed_counter.number);
    }
}

void
html_destroy (CONVERTER *self)
{
  int i;

  free_generic_converter (self);

  free (self->global_units_directions);
  free (self->html_targets.list);
  free_strings_list (&self->seen_ids);
  for (i = 0; i < ST_footnote_location+1; i++)
    {
      free (self->html_special_targets[i].list);
    }
  for (i = 0; i < SUIT_type_heading+1; i++)
    {/* we assume that reset_translated_special_unit_info_tree
        has already been called */
      free (self->special_unit_info_tree[i]);
    }

  for (i = 1; i < ET_special_unit_element+1; i++)
    {
      free (self->pre_class_types[i]);
    }

  for (i = 0; i < self->no_arg_formatted_cmd.number; i++)
    {
      enum command_id cmd = self->no_arg_formatted_cmd.list[i];
      enum conversion_context cctx;
      for (cctx = 0; cctx < HCC_type_css_string+1; cctx++)
        {
          HTML_COMMAND_CONVERSION *format_spec
                = &self->html_command_conversion[cmd][cctx];
          if (cctx == HCC_type_normal && format_spec->tree)
            destroy_element_and_children (format_spec->tree);
          free (format_spec->element);
          free (format_spec->text);
          free (format_spec->translated_converted);
          free (format_spec->translated_to_convert);
        }
    }

  free (self->no_arg_formatted_cmd.list);

  free (self->no_arg_formatted_cmd_translated.list);
  free (self->reset_target_commands.list);
  free (self->file_changed_counter.list);

  free_strings_list (&self->special_unit_varieties);
}

char *
html_convert_tree (CONVERTER *self, const ELEMENT *tree, char *explanation)
{
  TEXT result;
  text_init (&result);

  convert_to_html_internal (self, tree, &result, explanation);

  return result.text;
}

/* This function should be used in formatting functions when some
   Texinfo tree need to be converted. */
char *
convert_tree_new_formatting_context (CONVERTER *self, const ELEMENT *tree,
                              char *context_string, char *multiple_pass,
                              char *document_global_context,
                              enum command_id block_cmd)
{
  char *result;
  char *multiple_pass_str = "";
  char *explanation;
  TEXT context_string_str;
  text_init (&context_string_str);
  text_append (&context_string_str, "");

  if (context_string)
    {
      html_new_document_context (self, context_string,
                                 document_global_context, block_cmd);
      text_printf (&context_string_str, "C(%s)", context_string);
    }

  if (multiple_pass)
    {
      self->ignore_notice++;
      push_string_stack_string (&self->multiple_pass, multiple_pass);
      self->modified_state |= HMSF_multiple_pass | HMSF_converter_state;
      multiple_pass_str = "|M";
    }

  if (self->conf->DEBUG > 0)
    fprintf (stderr, "new_fmt_ctx %s%s\n", context_string_str.text,
                                           multiple_pass_str);

  xasprintf (&explanation, "new_fmt_ctx %s", context_string_str.text);
  result = html_convert_tree (self, tree, explanation);

  free (explanation);
  free (context_string_str.text);

  if (context_string)
    {
      html_pop_document_context (self);
    }

  if (multiple_pass)
    {
      self->ignore_notice--;
      pop_string_stack (&self->multiple_pass);
      self->modified_state |= HMSF_multiple_pass | HMSF_converter_state;
    }

  return result;
}

char *
html_convert_css_string (CONVERTER *self, const ELEMENT *element, char *explanation)
{
  char *result;
  HTML_DOCUMENT_CONTEXT *top_document_ctx;

  FORMATTING_REFERENCE *saved_formatting_references
     = self->current_formatting_references;
  FORMATTING_REFERENCE *saved_commands_conversion
     = self->current_commands_conversion;
  FORMATTING_REFERENCE *saved_types_conversion
     = self->current_types_conversion;

  self->current_formatting_references
    = &self->css_string_formatting_references[0];
  self->current_commands_conversion
    = &self->css_string_commands_conversion[0];
  self->current_types_conversion
    = &self->css_string_types_conversion[0];

  html_new_document_context (self, "css_string", 0, 0);
  top_document_ctx = html_top_document_context (self);
  top_document_ctx->string_ctx++;

  result = html_convert_tree (self, element, explanation);

  html_pop_document_context (self);

  self->current_formatting_references = saved_formatting_references;
  self->current_commands_conversion = saved_commands_conversion;
  self->current_types_conversion = saved_types_conversion;

  return result;
}

static void
reset_unset_no_arg_commands_formatting_context (CONVERTER *self,
               enum command_id cmd, enum conversion_context reset_context,
               enum conversion_context ref_context, int translate)
{
  HTML_COMMAND_CONVERSION *no_arg_command_context;
  HTML_COMMAND_CONVERSION *conversion_contexts
    = self->html_command_conversion[cmd];
  no_arg_command_context = &conversion_contexts[reset_context];
  if (ref_context >= 0)
    {
      if (no_arg_command_context->unset)
        {
          HTML_COMMAND_CONVERSION *no_arg_ref
            = &conversion_contexts[ref_context];

          if (no_arg_ref->text)
            {
              free (no_arg_command_context->text);
              no_arg_command_context->text = strdup (no_arg_ref->text);
            }
          if (no_arg_ref->tree)
            no_arg_command_context->tree = no_arg_ref->tree;
          if (no_arg_ref->translated_converted)
            {
              free (no_arg_command_context->translated_converted);
              no_arg_command_context->translated_converted
                = strdup (no_arg_ref->translated_converted);
            }
          if (no_arg_ref->translated_to_convert)
            {
              free (no_arg_command_context->translated_to_convert);
              no_arg_command_context->translated_to_convert
                = strdup (no_arg_ref->translated_to_convert);
            }
        }
    }

  if (translate
      && no_arg_command_context->tree
      && !no_arg_command_context->translated_converted)
    {
      char *translation_result = 0;
      char *explanation;
      char *context;
      ELEMENT *translated_tree = no_arg_command_context->tree;
      if (!translated_tree->hv)
        {/* FIXME Would need to be done differently if it is possible
                  to recursively call html_translate_names. */
          self->tree_to_build = translated_tree;
        }
      xasprintf (&explanation, "Translated NO ARG @%s ctx %s",
                 builtin_command_data[cmd].cmdname,
                 html_conversion_context_type_names[reset_context]);
      xasprintf (&context, "Tr %s ctx %s",
                 builtin_command_data[cmd].cmdname,
                 html_conversion_context_type_names[reset_context]);
      if (reset_context == HCC_type_normal)
        {
          translation_result = html_convert_tree (self, translated_tree,
                                                  explanation);
        }
      else if (reset_context == HCC_type_preformatted)
        {
          enum command_id preformated_cmd = CM_example;
          HTML_DOCUMENT_CONTEXT *top_document_ctx;
          html_new_document_context (self, context, 0, 0);

          top_document_ctx = html_top_document_context (self);

          /* there does not seems to be anything simpler... */
          push_command_or_type (&top_document_ctx->composition_context,
                                preformated_cmd, 0);
      /* should not be needed for at commands no brace translation strings */
          push_string_stack_string (&top_document_ctx->preformatted_classes,
                              html_commands_data[preformated_cmd].pre_class);

          translation_result = html_convert_tree (self, translated_tree,
                                                  explanation);
          pop_command_or_type (&top_document_ctx->composition_context);
          pop_string_stack (&top_document_ctx->preformatted_classes);
          html_pop_document_context (self);
        }
      else if (reset_context == HCC_type_string)
        {
          HTML_DOCUMENT_CONTEXT *top_document_ctx;

          html_new_document_context (self, context, 0, 0);

          top_document_ctx = html_top_document_context (self);
          top_document_ctx->string_ctx++;

          translation_result = html_convert_tree (self, translated_tree,
                                                  explanation);
          html_pop_document_context (self);
        }
      else if (reset_context == HCC_type_css_string)
        {
          translation_result = html_convert_css_string (self, translated_tree,
                                                        0);
        }
      free (explanation);
      free (context);
      if (no_arg_command_context->text)
        free (no_arg_command_context->text);
      no_arg_command_context->text = translation_result;
      self->tree_to_build = 0;
    }
}

static void
complete_no_arg_commands_formatting (CONVERTER *self, enum command_id cmd,
                                     int translate)
{
  reset_unset_no_arg_commands_formatting_context (self, cmd, HCC_type_normal,
                                                  -1, translate);
  reset_unset_no_arg_commands_formatting_context (self, cmd,
                                                  HCC_type_preformatted,
                                                  HCC_type_normal, translate);
  reset_unset_no_arg_commands_formatting_context (self, cmd, HCC_type_string,
                                                  HCC_type_preformatted, translate);
  reset_unset_no_arg_commands_formatting_context (self, cmd, HCC_type_css_string,
                                                  HCC_type_string, translate);
}

void
html_translate_names (CONVERTER *self)
{
  int j;
  STRING_LIST *special_unit_varieties = &self->special_unit_varieties;

  if (self->conf->DEBUG > 0)
    {
      fprintf (stderr, "\nXS|TRANSLATE_NAMES encoding_name: %s"
               " documentlanguage: %s\n",
               self->conf->OUTPUT_ENCODING_NAME, self->conf->documentlanguage);
    }

  /* reset strings such that they are translated when needed. */
  #define tds_type(name) self->directions_strings[TDS_type_ ## name] = 0;
   TDS_TRANSLATED_TYPES_LIST
  #undef tds_type

  /* reset trees such that they are created based on Texinfo code string
     translation on-demand */
  reset_translated_special_unit_info_tree (self);

  /* delete the tree and formatted results for special elements
     such that they are redone with the new tree when needed. */
  /* if reset_target_commands was still set, we will fill with the
     same elements again, but it is not a big deal as we need to go
     through the loop anyway and the memory will be reused */
  self->reset_target_commands.number = 0;
  for (j = 0; j < special_unit_varieties->number; j++)
    {
      char *special_unit_variety = special_unit_varieties->list[j];
      int special_unit_direction_index
       = special_unit_variety_direction_index (self, special_unit_variety);
      if (special_unit_direction_index >= 0)
        {
          const OUTPUT_UNIT *special_unit
           = self->global_units_directions[special_unit_direction_index];
          if (special_unit)
             {
               ELEMENT *command = special_unit->unit_command;
               if (command)
                 {
                   HTML_TARGET *target
                     = find_element_target (&self->html_targets, command);
                   if (target)
                     {
       /* the tree is a reference to special_unit_info_tree, so it should
          not be freed, but need to be reset to trigger the creation of the
          special_unit_info_tree tree when needed */
                       target->tree = 0;
       /* TODO check if there is a need to free when the code setting
               those fields is done */
                       target->string = 0;
                       target->text = 0;
                       /* gather elements to pass information to perl */
                       add_to_element_list (&self->reset_target_commands,
                                            command);
                     }
                 }
             }
        }
    }

  /* self->no_arg_formatted_cmd_translated is used here to hold the translated
     commands, and the information is kept as it is also used to pass
     translated commands results to perl */
  if (self->no_arg_formatted_cmd.number)
    {
      int translated_nr = 0;
      COMMAND_ID_LIST *translated_cmds = &self->no_arg_formatted_cmd_translated;
      /* in general this is done in build_html_translated_names.  Still need
         to do it here if build_html_translated_names is never called */
      if (translated_cmds->number)
        {
          memset (translated_cmds->list, 0, translated_cmds->number
                * sizeof (enum command_id));
        }

      for (j = 0; j < self->no_arg_formatted_cmd.number; j++)
        {
          enum command_id cmd = self->no_arg_formatted_cmd.list[j];
          enum conversion_context cctx;
          int add_cmd = 0;
          for (cctx = 0; cctx < HCC_type_css_string+1; cctx++)
            {
              HTML_COMMAND_CONVERSION *format_spec
                = &self->html_command_conversion[cmd][cctx];
              if (format_spec->translated_converted
                  && !format_spec->unset)
                {
                  add_cmd = 1;
                  free (format_spec->text);
                  format_spec->text
                   = html_gdt_string (format_spec->translated_converted, self,
                                 0, 0, 0);
                }
              else if (cctx == HCC_type_normal)
                {
                  ELEMENT *translated_tree = 0;
                  if (format_spec->translated_to_convert)
                    {/* FIXME use document associated to converter? */
                      translated_tree =
                        html_gdt_tree (format_spec->translated_to_convert,
                                   0, self, 0, 0, 0);
                    }
                  else
                    translated_tree = translated_command_tree (self, cmd);

                  if (translated_tree)
                    {
                      add_cmd = 1;
                      if (format_spec->tree)
                        destroy_element_and_children (format_spec->tree);

                      format_spec->tree = translated_tree;
                    }
                }
            }
          if (add_cmd)
            {
              translated_cmds->list[translated_nr] = cmd;
              translated_nr++;
            }
        }

      translated_cmds->number = translated_nr;
      for (j = 0; j < translated_nr; j++)
        {
          enum command_id cmd = translated_cmds->list[j];
          complete_no_arg_commands_formatting (self, cmd, 1);
        }
    }

  if (self->conf->DEBUG > 0)
    fprintf (stderr, "END TRANSLATE_NAMES\n\n");

  self->modified_state |= HMSF_translations;
}


void
destroy_args_formatted (HTML_ARGS_FORMATTED *args_formatted)
{
  if (args_formatted)
    {
      int i;
      for (i = 0; i < args_formatted->number; i++)
        {
          int j;
          HTML_ARG_FORMATTED *arg_formatted = &args_formatted->args[i];
          if (arg_formatted->tree)
            {
              for (j = 0; j < AFT_type_raw+1; j++)
                free (arg_formatted->formatted[j]);
            }
        }
      free (args_formatted->args);
    }
  free (args_formatted);
}

#define ADD(x) text_append (result, x)

/* EXPLANATION is used for debugging */
void
convert_to_html_internal (CONVERTER *self, const ELEMENT *element,
                          TEXT *result, char *explanation)
{
  /* for debugging, for explanations */
  TEXT command_type;
  char *debug_str;
  char *command_name = element_command_name (element);
  enum command_id cmd = element_builtin_cmd (element);

  text_init (&command_type);
  if (command_name)
    text_printf (&command_type, "@%s ", command_name);

  if (element->type)
    text_append (&command_type, element_type_names[element->type]);

  if (self->conf->DEBUG > 0)
    {
      int i;
      TEXT debug_str;
      TEXT contexts_str;
      text_init (&debug_str);
      text_init (&contexts_str);
      text_append (&contexts_str, "[");
      HTML_DOCUMENT_CONTEXT_STACK *document_context_stack
        = &self->html_document_context;
      HTML_DOCUMENT_CONTEXT *top_document_ctx
        = html_top_document_context (self);
      HTML_FORMATTING_CONTEXT_STACK *formatting_context_stack
        = &top_document_ctx->formatting_context;

      for (i = 0; i < document_context_stack->top; i++)
        {
          HTML_DOCUMENT_CONTEXT *document_context
            = &document_context_stack->stack[i];
          if (i != 0)
            text_append (&contexts_str, "|");
          if (document_context->context)
            text_append (&contexts_str, document_context->context);
          else
            text_append (&contexts_str, "UNDEF");
        }
      text_append (&contexts_str, "](");

      for (i = 0; i < formatting_context_stack->top; i++)
        {
          HTML_FORMATTING_CONTEXT *formatting_context
           = &formatting_context_stack->stack[i];
          if (i != 0)
            text_append (&contexts_str, "|");
          if (formatting_context->context_name)
            text_append (&contexts_str, formatting_context->context_name);
          else
            text_append (&contexts_str, "UNDEF");

        }
      text_append (&contexts_str, ")");
      text_printf (&debug_str, "XS|ELEMENT(%s) %s, ->", explanation,
                                                       contexts_str.text);
      free (contexts_str.text);
      if (command_name)
        text_printf (&debug_str, " cmd: %s,", command_name);
      if (element->type)
        text_printf (&debug_str, " type: %s",
                     element_type_names[element->type]);
      if (element->text.end > 0)
        {
          int allocated;
          char *text = debug_protect_eol (element->text.text, &allocated);
          text_printf (&debug_str, " text: %s", text);
          if (allocated)
            free (text);
        }
      text_append (&debug_str, "\n");
      fprintf (stderr, "%s", debug_str.text);
      free (debug_str.text);
    }

  if ((element->type
       && self->types_conversion[element->type].status == FRS_status_ignored)
      || (cmd
          && self->commands_conversion[cmd].status == FRS_status_ignored))
    {
      if (self->conf->DEBUG > 0)
        {
          fprintf (stderr, "IGNORED %s\n", command_type.text);
        }
      goto out;
    }

  /* Process text */

  if (element->text.space > 0)
    {
      TEXT text_result;
      text_init (&text_result);
      text_append (&text_result, "");

      /* already converted to html, keep it as is, assume it cannot be NULL */
      if (element->type == ET__converted)
        text_append (&text_result, element->text.text);
      else if (element->type == ET_untranslated)
        {
          char *translation_context
            = lookup_extra_string (element, "translation_context");
          const ELEMENT *translated = html_gdt_tree (element->text.text,
                                      self->document,
                                      self, 0, translation_context, 0);

          convert_to_html_internal (self, translated, &text_result,
                                    "translated TEXT");
        }
      else
        {
          char *conv_text = type_conversion (self, ET_text, element,
                                             element->text.text);
          if (conv_text)
            {
              text_append (&text_result, conv_text);
              free (conv_text);
            }
        }

      if (self->conf->DEBUG > 0)
        {
          fprintf (stderr, "XS|DO TEXT => `%s'\n", text_result.text);
        }

      ADD(text_result.text);
      free (text_result.text);
      goto out;
    }

  if (element->cmd
      && (element->type != ET_def_line
          && element->type != ET_definfoenclose_command
          && element->type != ET_index_entry_command))
    {
      enum command_id data_cmd = element_builtin_data_cmd (element);
      /* FIXME XS only debug message */
      /*
      if (self->conf->DEBUG > 0)
        fprintf (stderr, "COMMAND: %s %s\n",
                 builtin_command_data[data_cmd].cmdname,
                 builtin_command_data[cmd].cmdname);
      */

      if (builtin_command_data[data_cmd].flags & CF_root)
        {
          self->current_root_command = element;
          self->modified_state |= HMSF_current_root;
        }

      if (self->commands_conversion[cmd].status)
        {
          int convert_to_latex = 0;
          HTML_ARGS_FORMATTED *args_formatted = 0;
          TEXT content_formatted;

          HTML_DOCUMENT_CONTEXT *top_document_ctx;
          HTML_FORMATTING_CONTEXT *top_formating_ctx;

          if (builtin_command_data[data_cmd].flags & CF_brace
              && builtin_command_data[data_cmd].data == BRACE_context)
            {
              html_new_document_context (self,
                               builtin_command_data[data_cmd].cmdname, 0, 0);

            }
          top_document_ctx = html_top_document_context (self);

          if (html_commands_data[data_cmd].flags & HF_format_context)
            {
              char *context_str;
              xasprintf (&context_str, "@%s",
                         builtin_command_data[data_cmd].cmdname);
              push_html_formatting_context (
                         &top_document_ctx->formatting_context,
                         context_str);
              free (context_str);
              self->modified_state |= HMSF_formatting_context;
            }

          top_formating_ctx
            = html_top_formatting_context (&top_document_ctx->formatting_context);

          if (builtin_command_data[data_cmd].flags & CF_block)
            {
              push_command (&top_document_ctx->block_commands, data_cmd);
              self->modified_state |= HMSF_block_commands;
            }

          if (html_commands_data[data_cmd].flags & HF_composition_context)
            {
              push_command_or_type (&top_document_ctx->composition_context,
                                    cmd, 0);
              self->modified_state |= HMSF_composition_context;
            }

          if (html_commands_data[data_cmd].flags & HF_pre_class)
            {
              push_string_stack_string (&top_document_ctx->preformatted_classes,
                                        html_commands_data[data_cmd].pre_class);
              self->modified_state |= HMSF_preformatted_classes;
            }

          if (html_commands_data[data_cmd].flags & HF_format_raw)
            {
              top_document_ctx->raw_ctx++;
              self->modified_state |= HMSF_top_document_ctx;
            }
          else if (data_cmd == CM_verbatim)
            {
              top_document_ctx->verbatim_ctx++;
              self->modified_state |= HMSF_top_document_ctx;
            }

          if (builtin_command_data[data_cmd].other_flags & CF_brace_code
              || builtin_command_data[data_cmd].flags & CF_preformatted_code)
            {
              push_monospace (&top_document_ctx->monospace);
              self->modified_state |= HMSF_monospace;
            }
          else if (builtin_command_data[data_cmd].flags & CF_brace
                   && builtin_command_data[data_cmd].data == BRACE_style_no_code)
            {
              push_style_no_code (&top_document_ctx->monospace);
              self->modified_state |= HMSF_monospace;
            }
          else if (html_commands_data[data_cmd].flags & HF_upper_case)
            {
              top_formating_ctx->upper_case_ctx++;
              self->modified_state |= HMSF_top_formatting_context;
            }
          else if (builtin_command_data[data_cmd].flags & CF_math)
            {
              top_document_ctx->math_ctx++;
              self->modified_state |= HMSF_top_document_ctx;
             /*
        $convert_to_latex = 1 if ($self->get_conf('CONVERT_TO_LATEX_IN_MATH'));
              */
            }
          if (cmd == CM_verb)
            {
              top_formating_ctx->space_protected++;
              self->modified_state |= HMSF_top_formatting_context;
            }
          else if (cmd == CM_w)
            {
              top_formating_ctx->no_break++;
              self->modified_state |= HMSF_top_formatting_context;
            }

          if (self->commands_open[cmd].status)
            {
              char *cmd_open_str = command_open (self, data_cmd, element);
              if (cmd_open_str)
                {
                  ADD(cmd_open_str);
                  free (cmd_open_str);
                }
            }

          text_init (&content_formatted);
          text_append (&content_formatted, "");

          if (element->contents.number > 0)
            {

              if (convert_to_latex)
                {
                  /*
          $content_formatted
           = Texinfo::Convert::LaTeX::convert_to_latex_math(undef,
                                {'contents' => $element->{'contents'}},
                                         $self->{'options_latex_math'});

                  */
                }
              else
                {
                  int content_idx;
                  text_append (&content_formatted, "");
                  for (content_idx = 0; content_idx < element->contents.number;
                       content_idx++)
                    {
                      const ELEMENT *content = element->contents.list[content_idx];
                      char *explanation;
                      xasprintf (&explanation, "%s c[%d]", command_type.text,
                                content_idx);
                      convert_to_html_internal (self, content, &content_formatted,
                                                explanation);
                      free (explanation);
                    }
                }
            }

          if ((builtin_command_data[data_cmd].flags & CF_brace)
              || (builtin_command_data[data_cmd].flags & CF_line
                  && builtin_command_data[data_cmd].data == LINE_line)
              || ((cmd == CM_item || cmd == CM_itemx)
                  && element->parent->type == ET_table_term)
              || (cmd == CM_quotation || cmd == CM_smallquotation)
              || cmd == CM_float
              || cmd == CM_cartouche)
            {
              if (element->args.number > 0)
                {
                  TEXT formatted_arg;
                  int arg_idx;

                  text_init (&formatted_arg);

                  args_formatted = (HTML_ARGS_FORMATTED *)
                    malloc (sizeof (HTML_ARGS_FORMATTED));
                  args_formatted->number = element->args.number;
                  args_formatted->args = (HTML_ARG_FORMATTED *)
                 malloc (args_formatted->number * sizeof (HTML_ARG_FORMATTED));
                  memset (args_formatted->args, 0,
                        args_formatted->number * sizeof (HTML_ARG_FORMATTED));

                  for (arg_idx = 0; arg_idx < element->args.number; arg_idx++)
                    {
                      char *explanation;
                      unsigned long arg_flags = 0;
                      const ELEMENT *arg = element->args.list[arg_idx];
                      HTML_ARG_FORMATTED *arg_formatted
                         = &args_formatted->args[arg_idx];

                      if (arg->contents.number <= 0)
                        {
                          continue;
                        }
                      if (arg_idx < MAX_COMMAND_ARGS_NR
                          /* could check command_args_flags[cmd].status,
                             but it is probably faster not to */
                          && command_args_flags[cmd].flags[arg_idx])
                        arg_flags = command_args_flags[cmd].flags[arg_idx];
                      else
                        arg_flags = F_AFT_normal;

                      arg_formatted->tree = arg;

                      if (arg_flags & F_AFT_normal)
                        {
                          text_reset (&formatted_arg);
                          if (convert_to_latex)
                            {
                              /* */
                            }
                          else
                            {
                              xasprintf (&explanation, "%s A[%d]normal",
                                                   command_type.text, arg_idx);
                              convert_to_html_internal (self, arg,
                                                        &formatted_arg,
                                                        explanation);
                              free (explanation);
                            }
                          arg_formatted->formatted[AFT_type_normal]
                            = strdup (formatted_arg.text);
                        }
                      if (arg_flags & F_AFT_monospace)
                        {
                          text_reset (&formatted_arg);
                          xasprintf (&explanation, "%s A[%d]monospace",
                                                   command_type.text, arg_idx);
                          push_monospace (&top_document_ctx->monospace);
                          self->modified_state |= HMSF_monospace;

                          convert_to_html_internal (self, arg, &formatted_arg,
                                                    explanation);
                          pop_monospace_context
                              (&top_document_ctx->monospace);
                          self->modified_state |= HMSF_monospace;

                          free (explanation);
                          arg_formatted->formatted[AFT_type_monospace]
                           = strdup (formatted_arg.text);
                        }
                      if (arg_flags & F_AFT_string)
                        {
                          HTML_DOCUMENT_CONTEXT *string_document_ctx;
                          text_reset (&formatted_arg);
                          html_new_document_context (self, command_type.text,
                                                     0, 0);
                          string_document_ctx = html_top_document_context (self);
                          string_document_ctx->string_ctx++;

                          xasprintf (&explanation, "%s A[%d]string",
                                                   command_type.text, arg_idx);
                          convert_to_html_internal (self, arg, &formatted_arg,
                                                    explanation);

                          free (explanation);

                          html_pop_document_context (self);

                          arg_formatted->formatted[AFT_type_string]
                           = strdup (formatted_arg.text);
                        }
                      if (arg_flags & F_AFT_monospacestring)
                        {
                          HTML_DOCUMENT_CONTEXT *string_document_ctx;
                          text_reset (&formatted_arg);
                          html_new_document_context (self, command_type.text,
                                                     0, 0);
                          string_document_ctx = html_top_document_context (self);
                          string_document_ctx->string_ctx++;
                          push_monospace (&string_document_ctx->monospace);
                          xasprintf (&explanation, "%s A[%d]monospacestring",
                                                   command_type.text, arg_idx);
                          convert_to_html_internal (self, arg, &formatted_arg,
                                                    explanation);

                          free (explanation);
                          pop_monospace_context
                              (&string_document_ctx->monospace);
                          html_pop_document_context (self);
                          arg_formatted->formatted[AFT_type_monospacestring]
                           = strdup (formatted_arg.text);
                        }
                      if (arg_flags & F_AFT_monospacetext)
                        {
                          char *text;
                          TEXT_OPTIONS *text_conv_options
                            = copy_options_for_convert_text (self, 0);
                          text_conv_options->code_state = 1;

                          text = convert_to_text (arg, text_conv_options);

                          free (text_conv_options);

                          arg_formatted->formatted[AFT_type_monospacetext]
                            = text;
                        }
                      if (arg_flags & F_AFT_filenametext)
                        {
                          char *text;
                          /* Always use encoded characters for file names */
                          TEXT_OPTIONS *text_conv_options
                            = copy_options_for_convert_text (self, 1);
                          text_conv_options->code_state = 1;

                          text = convert_to_text (arg, text_conv_options);

                          free (text_conv_options);

                          arg_formatted->formatted[AFT_type_filenametext] = text;
                        }
                      if (arg_flags & F_AFT_url)
                        {
                          char *text;
           /* set the encoding to UTF-8 to always have a string that is suitable
              for percent encoding. */
                          TEXT_OPTIONS *text_conv_options
                            = copy_options_for_convert_text (self, 1);
                          text_conv_options->code_state = 1;
                          text_conv_options->encoding = "utf-8";

                          text = convert_to_text (arg, text_conv_options);

                          free (text_conv_options);

                          arg_formatted->formatted[AFT_type_url] = text;
                        }
                      if (arg_flags & F_AFT_raw)
                        {
                          text_reset (&formatted_arg);
                          top_document_ctx->raw_ctx++;
                          self->modified_state |= HMSF_top_document_ctx;
                          xasprintf (&explanation, "%s A[%d]raw",
                                                   command_type.text, arg_idx);
                          convert_to_html_internal (self, arg, &formatted_arg,
                                                    explanation);

                          free (explanation);
                          top_document_ctx->raw_ctx--;
                          self->modified_state |= HMSF_top_document_ctx;
                          arg_formatted->formatted[AFT_type_raw]
                            = strdup (formatted_arg.text);
                        }
                    }
                  free (formatted_arg.text);
                }
            }

          if (html_commands_data[data_cmd].flags & HF_composition_context)
            {
              pop_command_or_type (&top_document_ctx->composition_context);
              self->modified_state |= HMSF_composition_context;
            }

          if (html_commands_data[data_cmd].flags & HF_pre_class)
            {
              pop_string_stack (&top_document_ctx->preformatted_classes);
              self->modified_state |= HMSF_preformatted_classes;
            }

          if (cmd == CM_verb)
            {
              top_formating_ctx->space_protected--;
              self->modified_state |= HMSF_top_formatting_context;
            }
          else if (cmd == CM_w)
            {
              top_formating_ctx->no_break--;
              self->modified_state |= HMSF_top_formatting_context;
            }

          if (builtin_command_data[data_cmd].flags & CF_preformatted_code
              || (builtin_command_data[data_cmd].flags & CF_brace
                  && builtin_command_data[data_cmd].data == BRACE_style_no_code)
              || builtin_command_data[data_cmd].other_flags & CF_brace_code)
            {
              pop_monospace_context (&top_document_ctx->monospace);
              self->modified_state |= HMSF_monospace;
            }
          else if (html_commands_data[data_cmd].flags & HF_upper_case)
            {
              top_formating_ctx->upper_case_ctx--;
              self->modified_state |= HMSF_top_formatting_context;
            }

          else if (builtin_command_data[data_cmd].flags & CF_math)
            {
              top_document_ctx->math_ctx--;
              self->modified_state |= HMSF_top_document_ctx;
            }

          if (html_commands_data[data_cmd].flags & HF_format_raw)
            {
              top_document_ctx->raw_ctx--;
              self->modified_state |= HMSF_top_document_ctx;
            }
          else if (data_cmd == CM_verbatim)
            {
              top_document_ctx->verbatim_ctx--;
              self->modified_state |= HMSF_top_document_ctx;
            }

          if (builtin_command_data[data_cmd].flags & CF_block)
            {
              pop_command (&top_document_ctx->block_commands);
              self->modified_state |= HMSF_block_commands;
            }

          if (html_commands_data[data_cmd].flags & HF_format_context)
            {
              pop_html_formatting_context (
                         &top_document_ctx->formatting_context);
              self->modified_state |= HMSF_formatting_context;
            }

          if (builtin_command_data[data_cmd].flags & CF_brace
              && builtin_command_data[data_cmd].data == BRACE_context)
            {
              html_pop_document_context (self);
            }

          if (element->cmd == CM_node)
            {
              self->current_node = element;
              self->modified_state |= HMSF_current_node;
            }

          /* args are formatted, now format the command itself */
          if (self->commands_conversion[cmd].status)
            {
              char *conv_str = command_conversion (self, cmd,
                                                   element, args_formatted,
                                                   content_formatted.text);
              if (conv_str)
                {
                  ADD(conv_str);
                  free (conv_str);
                }
            }
          else if (args_formatted)
            fprintf (stderr, "No command_conversion for %s\n",
                             command_name);
          if (args_formatted)
            destroy_args_formatted (args_formatted);

          if (cmd == CM_documentlanguage)
            {
              html_translate_names (self);
            }

          free (content_formatted.text);

          goto out;
        }
      else
        {
          if (self->conf->DEBUG > 0 || self->conf->VERBOSE > 0)
            fprintf (stderr, "Command not converted: %s\n", command_name);
          if (builtin_command_data[data_cmd].flags & CF_root)
            {
              self->current_root_command = 0;
              self->modified_state |= HMSF_current_root;
            }
          goto out;
        }

      if (builtin_command_data[data_cmd].flags & CF_root)
        {
          self->current_root_command = 0;
          self->modified_state |= HMSF_current_root;
        }
    }
  else if (element->type)
    {
      char *open_result;
      enum element_type type = element->type;
      char *type_name = element_type_names[type];
      TEXT type_result;
      TEXT content_formatted;
      HTML_DOCUMENT_CONTEXT *top_document_ctx = html_top_document_context (self);
      HTML_FORMATTING_CONTEXT *top_formating_ctx
        = html_top_formatting_context (&top_document_ctx->formatting_context);

      text_init (&type_result);
      text_append (&type_result, "");

      open_result = type_open (self, type, element);
      if (open_result)
        {
          text_append (&type_result, open_result);
          free (open_result);
        }

      if (type == ET_paragraph)
        {
          top_formating_ctx->paragraph_number++;
          self->modified_state |= HMSF_top_formatting_context;
        }
      else if (type == ET_preformatted || type == ET_rawpreformatted)
        {
          top_formating_ctx->preformatted_number++;
          self->modified_state |= HMSF_top_formatting_context;
        }
      else if (self->pre_class_types[type])
        {
          push_string_stack_string (&top_document_ctx->preformatted_classes,
                                    self->pre_class_types[type]);
          push_command_or_type (&top_document_ctx->composition_context,
                                0, type);
          self->modified_state |= HMSF_preformatted_classes
                                  | HMSF_composition_context;
        }

      if (self->code_types[type])
        {
          push_monospace (&top_document_ctx->monospace);
          self->modified_state |= HMSF_monospace;
        }

      if (type == ET__string)
        {
          top_document_ctx->string_ctx++;
          self->modified_state |= HMSF_top_document_ctx;
        }

      text_init (&content_formatted);

      if (type == ET_definfoenclose_command)
        {
          if (element->args.number > 0)
            {
              convert_to_html_internal (self, element->args.list[0],
                                        &content_formatted, 0);
            }
        }
      else if (element->contents.number > 0)
        {
          int content_idx;
          text_append (&content_formatted, "");
          for (content_idx = 0; content_idx < element->contents.number;
               content_idx++)
            {
              const ELEMENT *content = element->contents.list[content_idx];
              char *explanation;
              xasprintf (&explanation, "%s c[%d]", command_type.text,
                        content_idx);
              convert_to_html_internal (self, content, &content_formatted,
                                        explanation);
              free (explanation);
            }
        }

      if (self->types_conversion[type].status)
        {
          char *conversion_result
                    = type_conversion (self, type, element,
                                       content_formatted.text);
          if (conversion_result)
            {
              text_append (&type_result, conversion_result);
              free (conversion_result);
            }
        }
      else if (content_formatted.end > 0)
        {
          text_append (&type_result, content_formatted.text);
        }
      free (content_formatted.text);

      if (self->code_types[type])
        {
          pop_monospace_context (&top_document_ctx->monospace);
          self->modified_state |= HMSF_monospace;
        }

      if (type == ET__string)
        {
          top_document_ctx->string_ctx--;
          self->modified_state |= HMSF_top_document_ctx;
        }

      if (self->pre_class_types[type])
        {
          pop_string_stack (&top_document_ctx->preformatted_classes);
          pop_command_or_type (&top_document_ctx->composition_context);
          self->modified_state |= HMSF_preformatted_classes
                                  | HMSF_composition_context;
        }

      if (self->conf->DEBUG > 0)
        {
          fprintf (stderr, "XS|DO type (%s) => `%s'\n", type_name,
                           type_result.text);
        }
      ADD(type_result.text);
      free (type_result.text);

      goto out;
    }
  else if (element->contents.number > 0)
    {
      /* no type, no cmdname, but contents. */
      /* this happens inside accents, for section/node names, for @images. */
      TEXT content_formatted;

      text_init (&content_formatted);
      text_append (&content_formatted, "");

      int content_idx;
      for (content_idx = 0; content_idx < element->contents.number;
           content_idx++)
        {
          const ELEMENT *content = element->contents.list[content_idx];
          char *explanation;
          xasprintf (&explanation, "%s c[%d]", command_type.text,
                     content_idx);
          convert_to_html_internal (self, content, &content_formatted,
                                    explanation);
          free (explanation);
        }

      if (self->conf->DEBUG > 0)
        fprintf (stderr, "UNNAMED HOLDER => `%s'\n", content_formatted.text);
      ADD(content_formatted.text);
      goto out;
    }
  else
    {
      if (self->conf->DEBUG > 0)
        fprintf (stderr, "UNNAMED empty\n");
      if (self->types_conversion[0].status
          && self->types_conversion[0].status != FRS_status_ignored)
        {
          char *conversion_result
                    = type_conversion (self, 0, element, "");
          if (conversion_result)
            {
              ADD(conversion_result);
              free (conversion_result);
            }
          goto out;
        }
      else
        goto out;
    }
  debug_str = print_element_debug (element, 0);
  fprintf (stderr, "DEBUG: HERE!(%p:%s)\n", element, debug_str);
  free (debug_str);

 out:
  free (command_type.text);
}
#undef ADD

static char *
output_unit_conversion (CONVERTER *self, enum output_unit_type unit_type,
                        const OUTPUT_UNIT *output_unit, const char *content)
{
  /* TODO call a C function if status is FRS_status_default_set
     maybe putting function references in an array */
  if (self->output_units_conversion[unit_type].status > 0)
    return call_output_units_conversion (self, unit_type, output_unit, content);
  return 0;
}

char *
convert_output_unit (CONVERTER *self, const OUTPUT_UNIT *output_unit,
                     char *explanation)
{
  char *result = 0;
  TEXT content_formatted;
  enum output_unit_type unit_type = output_unit->unit_type;

  if (self->output_units_conversion[unit_type].status == FRS_status_ignored)
    {
      if (self->conf->DEBUG > 0)
        {
          fprintf (stderr, "IGNORED OU %s\n", output_unit_type_names[unit_type]);
        }
      return strdup ("");
    }

  if (self->conf->DEBUG > 0)
    {
      char *output_unit_txi = output_unit_texi (output_unit);
      fprintf (stderr, "XS|UNIT(%s) -> ou: %s '%s'\n", explanation,
                  output_unit_type_names[unit_type],
                  output_unit_txi);
      free (output_unit_txi);
    }

  self->current_output_unit = output_unit;
  self->modified_state |= HMSF_current_output_unit;

  text_init (&content_formatted);
  text_append (&content_formatted, "");

  if (output_unit->unit_contents.number > 0)
    {
      int content_idx;
      for (content_idx = 0; content_idx < output_unit->unit_contents.number;
           content_idx++)
       {
         const ELEMENT *content = output_unit->unit_contents.list[content_idx];
         char *explanation;
         xasprintf (&explanation, "%s c[%d]",
                    output_unit_type_names[unit_type], content_idx);
         convert_to_html_internal (self, content, &content_formatted,
                                   explanation);
         free (explanation);
       }
    }

  if (self->output_units_conversion[unit_type].status)
    {
      result = output_unit_conversion (self, unit_type, output_unit,
                                             content_formatted.text);
      if (! result)
        result = strdup ("");
    }
   else
    {
      result = strdup (content_formatted.text);
    }

  free (content_formatted.text);

  self->current_output_unit = 0;
  self->modified_state |= HMSF_current_output_unit;

  if (self->conf->DEBUG > 0)
    fprintf (stderr, "DOUNIT (%s) => `%s'\n", output_unit_type_names[unit_type],
                     result);

  return result;
}

/* wrapper to avoid code repetition and use similar functions as in perl */
void
convert_convert_output_unit_internal (CONVERTER *self, TEXT *result,
                                   const OUTPUT_UNIT *output_unit, int unit_nr,
                                   char *debug_str, char *explanation_str)
{
  char *explanation;
  char *output_unit_text;

  if (self->conf->DEBUG > 0)
    fprintf (stderr, "\n%s %d\n", debug_str, unit_nr);

  xasprintf (&explanation, "%s %d", explanation_str, unit_nr);
  output_unit_text = convert_output_unit (self, output_unit,
                                          explanation);
  text_append (result, output_unit_text);
  free (explanation);
  free (output_unit_text);
}

char *
html_convert_convert (CONVERTER *self, const ELEMENT *root,
                      int output_units_descriptor,
                      int special_units_descriptor)
{
  TEXT result;

  const OUTPUT_UNIT_LIST *output_units
    = retrieve_output_units (output_units_descriptor);
  const OUTPUT_UNIT_LIST *special_units
    = retrieve_output_units (special_units_descriptor);

  text_init (&result);

  if (!output_units || !output_units->number)
    {
      char *footnotes_segment;
      if (self->conf->DEBUG > 0)
        fprintf (stderr, "\nC NO UNIT\n");

      convert_to_html_internal (self, root, &result,
                                "convert no unit");

      footnotes_segment
        = call_formatting_function_format_footnotes_segment (self);
      if (footnotes_segment)
        {
          text_append (&result, footnotes_segment);
          free (footnotes_segment);
        }
    }
  else
    {
      int unit_nr = 0;
      int i;
      for (i = 0; i < output_units->number; i++)
        {
          const OUTPUT_UNIT *output_unit = output_units->list[i];
          convert_convert_output_unit_internal (self, &result, output_unit,
                                unit_nr, "C UNIT", "convert unit");
          unit_nr++;
        }
      if (special_units && special_units->number)
        {
          for (i = 0; i < special_units->number; i++)
            {
              const OUTPUT_UNIT *special_unit = special_units->list[i];
              convert_convert_output_unit_internal (self, &result,
                        special_unit, unit_nr, "C UNIT", "convert unit");
              unit_nr++;
            }
        }
    }
  return result.text;
}

int
convert_output_output_unit_internal (CONVERTER *self,
                                     ENCODING_CONVERSION *conversion,
                                     TEXT *text,
                                     const OUTPUT_UNIT *output_unit,
                                     int unit_nr)
{
  FILE_NAME_PATH_COUNTER *unit_file = 0;
  size_t file_index;
  int empty_body = 0; /* set if body is empty and it is a special unit */
  char *output_unit_filename = output_unit->unit_filename;

  self->current_filename = output_unit_filename;
  self->modified_state |= HMSF_current_filename;

  text_reset (text);
  text_append (text, "");

  if (output_unit->unit_type == OU_special_unit)
    {
      char *debug_str;
      char *special_unit_variety = output_unit->special_unit_variety;

      file_index = self->special_unit_file_indices[output_unit->index];
      unit_file = &self->output_unit_files.list[file_index];

      xasprintf (&debug_str, "UNIT SPECIAL %s", special_unit_variety);
      convert_convert_output_unit_internal (self, text,
                    output_unit, unit_nr, debug_str, "output s-unit");
      free (debug_str);

      if (!strcmp (text->text, ""))
        empty_body = 1;
    }
  else
    {
      file_index = self->output_unit_file_indices[output_unit->index];
      unit_file = &self->output_unit_files.list[file_index];

      convert_convert_output_unit_internal (self, text, output_unit,
                                            unit_nr, "UNIT", "output unit");
    }

  unit_file->counter--;
  if (!unit_file->counter_changed)
    {
      self->file_changed_counter.list[self->file_changed_counter.number]
        = file_index;
      self->file_changed_counter.number++;
      unit_file->counter_changed = 1;
    }

      /* register the output but do not print anything. Printing
         only when file_counters reach 0, to be sure that all the
         elements have been converted before headers are done. */

  if (!empty_body)
    {
      if (!unit_file->first_unit)
        {
          unit_file->first_unit = output_unit;
          text_init (&unit_file->body);
        }
      text_append (&unit_file->body, text->text);
    }
  else
    {
      if (!unit_file->first_unit
          || unit_file->body.end == 0)
        {
          return 1;
        }
    }

  if (unit_file->counter == 0)
    {
      const OUTPUT_UNIT *file_output_unit = unit_file->first_unit;
      char *file_end;
      char *file_beginning;
      char *out_filepath = unit_file->filepath;
      char *path_encoding;
      char *open_error_message;

      char *encoded_out_filepath = encoded_output_file_name (self->conf,
                               self->document->global_info, out_filepath,
                                                       &path_encoding, 0);
      FILE *file_fh = output_files_open_out (&self->output_files_information,
                               encoded_out_filepath, &open_error_message, 0);
      free (path_encoding);
      if (!file_fh)
        {
          message_list_document_error (&self->error_messages, self->conf,
                             "could not open %s for writing: %s",
                             out_filepath, open_error_message);
          free (encoded_out_filepath);
          return 0;
        }

      /* do end file first in case it requires some CSS */
      file_end = call_formatting_function_format_end_file (self,
                                             output_unit_filename, output_unit);
      file_beginning = call_formatting_function_format_begin_file (self,
                                        output_unit_filename, file_output_unit);
      text_reset (text);
      if (file_beginning)
        {
          text_append (text, file_beginning);
          free (file_beginning);
        }
      if (unit_file->body.end)
        {
          text_append (text, unit_file->body.text);
        }
      if (file_end)
        {
          text_append (text, file_end);
          free (file_end);
        }
      if (text->end)
        {
          char *result;
          size_t res_len;
          size_t write_len;

          if (conversion)
            result = encode_with_iconv (conversion->iconv, text->text, 0);
          else
            result = text->text;
          res_len = strlen (result);
          write_len = fwrite (result, sizeof (char), res_len,
                                     file_fh);
          if (conversion)
            free (result);
          if (write_len != res_len)
            { /* register error message instead? */
              fprintf (stderr, "ERROR: write to %s failed (%zu/%zu)\n",
                       encoded_out_filepath, write_len, res_len);
              free (encoded_out_filepath);
              return 0;
            }
        }
      /* NOTE do not close STDOUT here to be in line with perl code */
      if (strcmp (out_filepath, "-"))
        {
          output_files_register_closed (&self->output_files_information,
                                        encoded_out_filepath);
          if (fclose (file_fh))
            {
              message_list_document_error (&self->error_messages, self->conf,
                             "error on closing %s: %s",
                             out_filepath, strerror (errno));
              free (encoded_out_filepath);
              return 0;
            }
        }
      free (encoded_out_filepath);
    }
  return 1;
}

void
html_prepare_title_titlepage (CONVERTER *self, int output_units_descriptor,
                              char *output_file, char *output_filename)
{
  char *title_titlepage;
  OUTPUT_UNIT_LIST *output_units
    = retrieve_output_units (output_units_descriptor);

  if (strlen (output_file))
    self->current_filename = output_units->list[0]->unit_filename;
  else
    self->current_filename = output_filename;

  self->modified_state |= HMSF_current_filename;

  title_titlepage
    = call_formatting_function_format_title_titlepage (self);
  self->title_titlepage = title_titlepage;
  self->current_filename = 0;
  self->modified_state |= HMSF_current_filename;
}

char *
html_convert_output (CONVERTER *self, const ELEMENT *root,
                     int output_units_descriptor,
                     int special_units_descriptor,
                     char *output_file, char *destination_directory,
                     char *output_filename, char *document_name)
{
  int status = 1;
  TEXT result;
  TEXT text; /* reused for all the output units */

  const OUTPUT_UNIT_LIST *output_units
    = retrieve_output_units (output_units_descriptor);
  const OUTPUT_UNIT_LIST *special_units
    = retrieve_output_units (special_units_descriptor);

  text_init (&result);
  text_init (&text);

  text_append (&result, "");


  if (!strlen (output_file))
    {
      char *file_end;
      char *file_beginning;

      self->current_filename = output_filename;
      self->modified_state |= HMSF_current_filename;

      text_append (&text, "");

      if (output_units && output_units->number)
        {
          int unit_nr = 0;
          int i;
          for (i = 0; i < output_units->number; i++)
            {
              const OUTPUT_UNIT *output_unit = output_units->list[i];
              convert_convert_output_unit_internal (self, &text, output_unit,
                             unit_nr, "UNIT NO-PAGE", "no-page output unit");
              unit_nr++;
            }
      /* TODO there is no rule before the footnotes special element in
         case of separate footnotes in the default formatting style.
         Not sure if it is an issue. */
          if (special_units && special_units->number)
            {
              for (i = 0; i < special_units->number; i++)
                {
                  const OUTPUT_UNIT *special_unit = special_units->list[i];
                  convert_convert_output_unit_internal (self, &text,
                                 special_unit, unit_nr, "UNIT NO-PAGE",
                                 "no-page output unit");
                  unit_nr++;
                }
            }
        }
      else
        {
          char *footnotes_segment;
          if (self->conf->DEBUG > 0)
            fprintf (stderr, "\nNO UNIT NO PAGE\n");

          text_append (&text, self->title_titlepage);
          convert_to_html_internal (self, root, &text,
                                     "no-page output no unit");
          footnotes_segment
            = call_formatting_function_format_footnotes_segment (self);
          if (footnotes_segment)
            {
              text_append (&text, footnotes_segment);
              free (footnotes_segment);
            }
        }

      /* do end file first, in case it needs some CSS */
      file_end = call_formatting_function_format_end_file (self,
                                                     output_filename, 0);
      file_beginning = call_formatting_function_format_begin_file (self,
                                                     output_filename, 0);
      if (file_beginning)
        {
          text_append (&result, file_beginning);
          free (file_beginning);
        }
      text_append (&result, text.text);
      if (file_end)
        {
          text_append (&result, file_end);
          free (file_end);
        }
      self->current_filename = 0;
      self->modified_state |= HMSF_current_filename;
    }
  else
    {
      int unit_nr = 0;
      int i;
      ENCODING_CONVERSION *conversion = 0;

      if (self->conf->OUTPUT_ENCODING_NAME)
        {
          conversion
             = get_encoding_conversion (self->conf->OUTPUT_ENCODING_NAME,
                                              &output_conversions);
        }

      if (self->conf->DEBUG > 0)
        fprintf (stderr, "DO Units with filenames\n");

      for (i = 0; i < output_units->number; i++)
        {
          const OUTPUT_UNIT *output_unit = output_units->list[i];
          status = convert_output_output_unit_internal (self, conversion,
                                               &text, output_unit, unit_nr);
          if (!status)
            {
              /*
              fprintf (stderr, "   FAILED U(%d %d): %s\n", i, unit_nr,
                       output_unit_texi (output_unit));
               */
              goto out;
            }
          unit_nr++;
        }
      if (special_units && special_units->number)
        {
          for (i = 0; i < special_units->number; i++)
            {
              const OUTPUT_UNIT *special_unit = special_units->list[i];
              status = convert_output_output_unit_internal (self, conversion,
                                                &text, special_unit, unit_nr);
              if (!status)
                goto out;
              unit_nr++;
            }
        }
      self->current_filename = 0;
      self->modified_state |= HMSF_current_filename;
    }

 out:
  free (text.text);

  if (status)
    return result.text;
  else
    {
      free (result.text);
      return 0;
    }
}
