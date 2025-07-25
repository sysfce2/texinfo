/* Copyright 2010-2025 Free Software Foundation, Inc.

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

/* In sync with Texinfo::Convert::Texinfo */

#include <config.h>
#include <stdlib.h>
#include <stdio.h>
#include <ctype.h>
#include <string.h>

#include "text.h"
#include "command_ids.h"
#include "element_types.h"
#include "tree_types.h"
#include "types_data.h"
/* for lookup_extra* */
#include "extra.h"
/* new_element and destroy_element for convert_contents_to_texinfo */
#include "tree.h"
#include "builtin_commands.h"
/* get_label_element and collapse_spaces */
#include "utils.h"
#include "debug.h"
#include "convert_to_texinfo.h"


static void convert_to_texinfo_internal (const ELEMENT *e, TEXT *result);


#define ADD(x) text_append (result, x)

static void
convert_args (const ELEMENT *element, TEXT *result)
{
  size_t i;
  size_t arg_nr = 0;

  for (i = 0; i < element->e.c->contents.number; i++)
    {
      const ELEMENT *arg = element->e.c->contents.list[i];
      if (arg->flags & EF_inserted)
        continue;

      if (arg_nr)
        ADD(",");
      arg_nr++;
      convert_to_texinfo_internal (arg, result);
    }
}

static void
convert_to_texinfo_internal (const ELEMENT *e, TEXT *result)
{
  const ELEMENT *elt;

  if (e->flags & EF_inserted || e->type == ET_arguments_line)
    {}
  else if (type_data[e->type].flags & TF_text)
    {
      if (e->type == ET_bracketed_linemacro_arg)
        ADD("{");
      if (e->e.text->end > 0)
        ADD(e->e.text->text);
      if (e->type == ET_bracketed_linemacro_arg)
        ADD("}");
    }
  else
    {
      /* includes user-defined macro calls (which are only in source marks) */
      const char *cmdname = element_command_name (e);
      if (cmdname)
        {
          enum command_id cmd = element_builtin_data_cmd (e);
          const ELEMENT *spc_before_arg = 0;

          ADD("@");  ADD(cmdname);

          if (type_data[e->type].elt_info_number > eit_spaces_after_cmd_before_arg)
            {
              elt = e->elt_info[eit_spaces_after_cmd_before_arg];
              if (elt)
                ADD((char *)elt->e.text->text);
            }

          if (type_data[e->type].elt_info_number > eit_spaces_before_argument
              && e->elt_info[eit_spaces_before_argument])
            {
              spc_before_arg = e->elt_info[eit_spaces_before_argument];
            }

          if (builtin_command_data[cmd].flags & CF_nobrace)
            {
           /* the spaces following a command are put in a text element in the
              tree, not associated to the command element. */
           /* item, tab and headitem are nobrace commands with contents */
              if (e->e.c->contents.number == 0)
                return;
            }
          else if (e->e.c->contents.number > 0
                   && e->e.c->contents.list[0]->type == ET_arguments_line)
            {
           /* root commands and block commands that are not def commands */
              const ELEMENT *arguments = e->e.c->contents.list[0];

              if (spc_before_arg)
                ADD((char *)spc_before_arg->e.text->text);

           /* used for @macro too, in that case the whole line is the
              only argument, there is no separation by commas */
              convert_args (arguments, result);
            }
          else if (builtin_command_data[cmd].flags & CF_brace
                   || builtin_command_data[cmd].flags & CF_INFOENCLOSE
                   || e->type == ET_macro_call || e->type == ET_rmacro_call)
            {
              int braces;

       /* contents may not be set for a command without braces.  In that
          case it is better if the command is considered as a command without
          argument. */
              if (e->e.c->contents.number == 0)
                return;

              braces = !(e->e.c->contents.list[0]->type == ET_following_arg);
              if (braces)
                ADD("{");

              if (cmd == CM_verb)
                {
                  const char *delimiter = e->e.c->string_info[sit_delimiter];
                  ADD(delimiter);
                }

              if (spc_before_arg)
                ADD((char *)spc_before_arg->e.text->text);

              convert_args (e, result);

              if (cmd == CM_verb)
                {
                  const char *delimiter = e->e.c->string_info[sit_delimiter];
                  ADD(delimiter);
                }

              if (braces)
                ADD("}");
              return;
            }
          else if (builtin_command_data[cmd].flags & CF_line
                   || e->type == ET_index_entry_command
                   || e->type == ET_macro_call_line
                   || e->type == ET_rmacro_call_line)
            {
          /* line commands that are not root commands */
              if (spc_before_arg)
                ADD((char *)spc_before_arg->e.text->text);

              convert_args (e, result);
              return;
            }
          else if (builtin_command_data[cmd].flags & CF_def
                   || e->type == ET_linemacro_call)
            { /* @def* commands (that are also block commands) */
              if (spc_before_arg)
                ADD((char *)spc_before_arg->e.text->text);
            }
          else
            {
              fprintf (stderr,
                       "BUG: Unknown command type to convert to texinfo: %s\n",
                       element_command_name (e));
            }
        }
      else
        {
          if (e->type == ET_bracketed_arg)
            ADD("{");
          if (type_data[e->type].elt_info_number > eit_spaces_before_argument)
            {
              elt = e->elt_info[eit_spaces_before_argument];
              if (elt)
                ADD((char *)elt->e.text->text);
            }
        }
      if (e->e.c->contents.number > 0)
        {
          size_t i;
          for (i = 0; i < e->e.c->contents.number; i++)
            convert_to_texinfo_internal (e->e.c->contents.list[i], result);
        }

      if (type_data[e->type].elt_info_number > eit_spaces_after_argument)
        {
          elt = e->elt_info[eit_spaces_after_argument];
          if (elt)
            ADD((char *)elt->e.text->text);
        }

      if (e->type == ET_block_line_arg || e->type == ET_line_arg)
        {
          elt = e->elt_info[eit_comment_at_end];
          if (elt)
            convert_to_texinfo_internal (elt, result);
        }

      if (e->type == ET_bracketed_arg)
        ADD("}");
    }

  return;
}
#undef ADD

/* Return value to be freed by caller. */
char *
convert_to_texinfo (const ELEMENT *e)
{
  TEXT result;

  if (!e)
    return strdup ("");
  text_init (&result);
  /* in case of a document without any content expanded, for instance
     containing only containers, we still want to output an empty string */
  text_append (&result, "");
  convert_to_texinfo_internal (e, &result);
  return result.text;
}

char *
convert_contents_to_texinfo (const ELEMENT *e)
{
  ELEMENT *tmp = new_element (ET_NONE);
  char *result;

  tmp->e.c->contents = e->e.c->contents;
  result = convert_to_texinfo (tmp);
  tmp->e.c->contents.list = 0;
  destroy_element (tmp);

  return result;
}

/* Return value to be freed by caller. */
char *
link_element_to_texi (const ELEMENT *element)
{
  TEXT result;
  const ELEMENT *element_link;

  text_init (&result);
  text_append (&result, "");

  element_link = lookup_extra_container (element, AI_key_manual_content);
  if (element_link)
    {
      char *manual_texi = convert_contents_to_texinfo (element_link);
      text_append (&result, "(");
      text_append (&result, manual_texi);
      text_append (&result, ")");
      free (manual_texi);
    }

  element_link = lookup_extra_container (element, AI_key_node_content);
  if (element_link)
    {
      char *node_texi = convert_contents_to_texinfo (element_link);
      text_append (&result, node_texi);
      free (node_texi);
    }
  return result.text;
}

/* Return value to be freed by caller. */
char *
target_element_to_texi_label (const ELEMENT *element)
{
  const ELEMENT *label_element = get_label_element (element);
  /* get_label_element does not handle links to external manuals in menus */
  if (!label_element)
    {
      return link_element_to_texi (element);
    }
  return convert_contents_to_texinfo (label_element);
}

int
check_node_same_texinfo_code (const ELEMENT *reference_node,
                              const ELEMENT *node_content)
{
  char *reference_node_texi;
  char *node_texi;
  int equal_texi;
  const char *normalized = lookup_extra_string (reference_node,
                                                AI_key_normalized);

  if (normalized)
    {
      char *tmp_texi;
      const ELEMENT *label_element = get_label_element (reference_node);

      tmp_texi = convert_contents_to_texinfo (label_element);
      reference_node_texi = collapse_spaces (tmp_texi);
      free (tmp_texi);
    }
  else
    reference_node_texi = strdup ("");

  if (node_content)
    {
      char *tmp_texi;

      const ELEMENT *last_content = last_contents_child (node_content);
      if (last_content && last_content->type == ET_space_at_end_menu_node)
        {
          ELEMENT *tmp_elt = new_element (ET_NONE);
          insert_slice_into_contents (tmp_elt, 0,
                                      node_content, 0,
                                      node_content->e.c->contents.number -1);
          tmp_texi = convert_to_texinfo (tmp_elt);
          destroy_element (tmp_elt);
        }
      else
        tmp_texi = convert_contents_to_texinfo (node_content);

      node_texi = collapse_spaces (tmp_texi);
      free (tmp_texi);
    }
  else
    node_texi = strdup ("");

  equal_texi = !strcmp (reference_node_texi, node_texi);
  free (reference_node_texi);
  free (node_texi);

  return equal_texi;
}

/* for debugging */
/* Return value to be freed by caller. */
char *
root_heading_command_to_texinfo (const ELEMENT *element)
{
  const ELEMENT *tree = 0;
  TEXT text;

  enum command_id data_cmd = element_builtin_data_cmd (element);

  if (data_cmd)
    {
      if ((data_cmd == CM_node
           || (builtin_command_data[data_cmd].flags & CF_sectioning_heading))
          && element->e.c->contents.list[0]->type == ET_arguments_line
          /* Should always be true */
          && element->e.c->contents.list[0]->e.c->contents.list[0]->type
                                                             == ET_line_arg
          && element->e.c->contents.list[0]->e.c->contents.list[0]
                                              ->e.c->contents.number > 0)
        tree = element->e.c->contents.list[0]->e.c->contents.list[0];
    }
  else
    return strdup ("Not a command");

  text_init (&text);
  if (tree)
    {
      char *tree_txi = convert_contents_to_texinfo (tree);
      text_printf (&text, "@%s %s", builtin_command_name (data_cmd),
                                    tree_txi);
      free (tree_txi);
    }
  else
   text_printf (&text, "@%s", builtin_command_name (data_cmd));

  return (text.text);
}
