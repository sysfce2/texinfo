/* session.h -- declarations for session.c, session-cmd.c, m-x.c and infodoc.c

   Copyright 1993-2025 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.

   Originally written by Brian Fox. */

#ifndef SESSION_H
#define SESSION_H

#include "info.h"
#include "window.h"
#include "scan.h"

/* Variable controlling the garbage collection of files briefly visited
   during searches.  Such files are normally gc'ed, unless they were
   compressed to begin with.  If this variable is non-zero, it says
   to gc even those file buffer contents which had to be uncompressed. */
extern int gc_compressed_files;

/* When non-zero, tiling takes place automatically when info_split_window
   is called. */
extern int auto_tiling_p;

/* Variable controlling the behaviour of default scrolling when you are
   already at the bottom of a node. */
extern int info_scroll_behaviour;

/* Values for info_scroll_behaviour. */
#define IS_Continuous 0 /* Try to get first menu item, or failing that, the
                           "Next:" pointer, or failing that, the "Up:" and
                           "Next:" of the up. */
#define IS_NextOnly   1 /* Try to get "Next:" menu item. */
#define IS_PageOnly   2 /* Simply give up at the bottom of a node. */

extern int cursor_movement_scrolls_p;

/* Controls what to do when a scrolling command is issued at the end of the
   last node. */
extern int scroll_last_node;

/* Values for scroll_last_node */
#define SLN_Stop   0 /* Stop at the last node */
#define SLN_Top    1 /* Go to the top node */

int get_input_key (void);
int get_another_input_key (void);

COMMAND_FUNCTION *read_key_sequence (Keymap map, int menu, int mouse,
                                     int insert, int *count);
unsigned char info_input_pending_p (void);
void info_set_node_of_window (WINDOW *window, NODE *node);
void info_set_node_of_window_fast (WINDOW *window, NODE *node);
FILE_BUFFER *file_buffer_of_window (WINDOW *window);

void initialize_keyseq (void);
void add_char_to_keyseq (int character);
int check_info_keyseq_displayed (void);
int info_select_reference (WINDOW *window, const REFERENCE *entry);
int info_any_buffered_input_p (void);
int control_g_waiting (void);
void pause_or_input (void);

void dump_nodes_to_file (REFERENCE **references,
				char *output_filename, int flags);
int write_node_to_stream (NODE *node, FILE *stream);

char *program_name_from_file_name (char *file_name);

/* Do the physical deletion of WINDOW, and forget this window and
   associated nodes. */
void info_delete_window_internal (WINDOW *window);

void forget_window_and_nodes (WINDOW *window);
void forget_node (WINDOW *win);
int forget_node_fast (WINDOW *win);

/* Tell Info that input is coming from the file FILENAME. */
void info_set_input_from_file (char *filename);

/* Error and debugging messages */
extern unsigned debug_level;

#define debug(n,c)							\
  do									\
    {									\
      if (debug_level >= (n))						\
        info_debug c;							\
    }									\
  while (0)

void info_debug (const char *format, ...) TEXINFO_PRINTFLIKE(1,2);
  
/* Print args as per FORMAT.  If the window system was initialized,
   then the message is printed in the echo area.  Otherwise, a message is
   output to stderr. */
void info_error (const char *format, ...) TEXINFO_PRINTFLIKE(1,2);

void show_error_node (char *error_msg);

void initialize_info_session (void);
void info_read_and_dispatch (void);
void close_info_session (void);
void info_session (REFERENCE **ref_list, char *error);
void info_session_allfiles (REFERENCE **ref_list, char *user_filename,
                            char *error);
void info_session_one_node (NODE *node);
void info_session_quit (void);
void initialize_terminal_and_keymaps (char *init_file);
NODE *info_intuit_options_node (NODE *initial_node, char *program);

NODE *info_follow_menus (NODE *initial_node, char **menus,
                         char **error_msg, int strict);

void menu_digit (WINDOW *window, int key);
void info_abort (void);

/* Adding numeric arguments. */
extern int info_explicit_arg;
extern int ea_explicit_arg;
void info_initialize_numeric_arg (void);


/* Found in m-x.c.  */
char *read_function_name (char *prompt, WINDOW *window);


/* In infodoc.c. */

/* Return the window displaying NAME, the name of an internally created
   Info window. */
WINDOW *get_internal_info_window (char *name);

#endif /* not SESSION_H */
