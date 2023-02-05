/* Copyright 2023 Free Software Foundation, Inc.

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

#include <string.h>

#include "source_marks.h"
#include "tree.h"
#include "errors.h"
#include "parser.h"

int include_counter = 0;
int setfilename_counter = 0;
int delcomment_counter = 0;
int defline_continuation_counter = 0;
int macro_expansion_counter = 0;

SOURCE_MARK *
new_source_mark (enum source_mark_type type)
{
  SOURCE_MARK *source_mark = malloc (sizeof (SOURCE_MARK));

  /* Zero all elements */
  memset (source_mark, 0, sizeof (*source_mark));

  source_mark->type = type;
  source_mark->counter = -1;
  source_mark->status = SM_status_none;
  return source_mark;
}

void
add_source_mark (SOURCE_MARK *source_mark, ELEMENT *e)
{
  SOURCE_MARK_LIST *s_mark_list = &(e->source_mark_list);
  if (s_mark_list->number == s_mark_list->space)
    {
      s_mark_list->space++;  s_mark_list->space *= 1.5;
      s_mark_list->list = realloc (s_mark_list->list,
                          s_mark_list->space * sizeof (SOURCE_MARK));
      if (!s_mark_list->list)
        fatal ("realloc failed");
    }
  s_mark_list->list[s_mark_list->number] = source_mark;
  s_mark_list->number++;
}

void
transfer_source_marks (ELEMENT *from_e, ELEMENT *e)
{
  SOURCE_MARK_LIST *source_mark_list = &(from_e->source_mark_list);
  if (source_mark_list->number)
    {
      int i;
      for (i = 0; i < source_mark_list->number; i++)
        {
          add_source_mark (source_mark_list->list[i], e);
        }
      source_mark_list->number = 0;
    }
}

/* ELEMENT should be the parent container. */
void
place_source_mark (ELEMENT *e, SOURCE_MARK *source_mark)
{
  ELEMENT *mark_element;

  source_mark->position = 0;
  if (e->contents.number > 0)
    {
      ELEMENT *last_child = last_contents_child (e);
      mark_element = last_child;
      if (last_child->text.end > 0)
        source_mark->position = count_convert_u8 (last_child->text.text);
    }
  else
    {
      /* add an empty element only used for source marks */
      mark_element = new_element (ET_NONE);
      /* set empty text to have merge_text work as expected */
      text_append (&mark_element->text, "");
      add_to_element_contents (e, mark_element);
    }

  debug_nonl ("MARKS: %d c: %d, %d %d ", source_mark->type,
              source_mark->counter, source_mark->position,
              source_mark->status);
  debug_print_element_short (mark_element, 1);
  debug("");
  add_source_mark (source_mark, mark_element);
}

/* ELEMENT should be the parent container. */
void
register_source_mark (ELEMENT *e, SOURCE_MARK *source_mark)
{
  if (source_mark->counter == -1)
    {
      if (source_mark->type == SM_type_include)
        {
          include_counter++;
          source_mark->counter = include_counter;
        }
      else if (source_mark->type == SM_type_setfilename)
        {
          setfilename_counter++;
          source_mark->counter = setfilename_counter;
        }
      else if (source_mark->type == SM_type_delcomment)
        {
          delcomment_counter++;
          source_mark->counter = delcomment_counter;
        }
      else if (source_mark->type == SM_type_defline_continuation)
        {
          defline_continuation_counter++;
          source_mark->counter = defline_continuation_counter;
        }
      else if (source_mark->type == SM_type_macro_expansion)
        {
          macro_expansion_counter++;
          source_mark->counter = macro_expansion_counter;
        }
    }

  place_source_mark (e, source_mark);
}

void
source_marks_reset_counters (void)
{
  include_counter = 0;
  setfilename_counter = 0;
  delcomment_counter = 0;
  defline_continuation_counter = 0;
  macro_expansion_counter = 0;
}
