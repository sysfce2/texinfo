/* extra.h - declarations for extra.c */
#ifndef EXTRA_H
#define EXTRA_H

/* Copyright 2010-2024 Free Software Foundation, Inc.

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

#include "tree_types.h"

void add_extra_element (ELEMENT *e, const char *key, ELEMENT *value);
void add_extra_element_oot (ELEMENT *e, char *key, ELEMENT *value);
ELEMENT_LIST *add_extra_contents (ELEMENT *e, const char *key,
                                  int no_lookup);
void add_extra_container (ELEMENT *e, char *key, ELEMENT *value);
const ELEMENT_LIST *add_extra_directions (ELEMENT *e, const char *key);
void add_extra_text (ELEMENT *e, char *key, ELEMENT *value);
void add_extra_misc_args (ELEMENT *e, char *key, ELEMENT *value);
void add_extra_string (ELEMENT *e, const char *key, char *value);
void add_extra_string_dup (ELEMENT *e, const char *key, const char *value);
void add_extra_integer (ELEMENT *e, char *key, long value);
void add_info_integer (ELEMENT *e, char *key, long value);
void add_info_string (ELEMENT *e, char *key, char *value);
void add_info_string_dup (ELEMENT *e, const char *key, const char *value);
void add_info_element_oot (ELEMENT *e, char *key, ELEMENT *value);
void add_associated_info_integer (ASSOCIATED_INFO *a,
                                  const char *key, int value);
void add_associated_info_string_dup (ASSOCIATED_INFO *a, const char *key,
                                     const char *value);
KEY_PAIR *lookup_extra (const ELEMENT *e, const char *key);
KEY_PAIR *lookup_info (const ELEMENT *e, const char *key);
ELEMENT *lookup_extra_element (const ELEMENT *e, const char *key);
ELEMENT *lookup_info_element (const ELEMENT *e, const char *key);
ELEMENT_LIST *lookup_extra_contents (const ELEMENT *e, const char *key);
const ELEMENT_LIST *lookup_extra_directions (const ELEMENT *e, const char *key);
int lookup_extra_integer (const ELEMENT *e, const char *key, int *ret);
int lookup_info_integer (const ELEMENT *e, const char *key, int *ret);
char *lookup_extra_string (const ELEMENT *e, const char *key);
char *lookup_info_string (const ELEMENT *e, const char *key);

KEY_PAIR *lookup_associated_info (const ASSOCIATED_INFO *a, const char *key);

/* not to be used in general, only when using associated info
   as a temporary holder of information, for speed */
KEY_PAIR *get_associated_info_key (ASSOCIATED_INFO *a, const char *key,
                                   const enum extra_type type);
KEY_PAIR *lookup_extra_by_index (const ELEMENT *e, const char *key, int index);
#endif
