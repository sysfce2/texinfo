/* transformations.h - declarations for transformations.c */
#ifndef TRANSFORMATIONS_H
#define TRANSFORMATIONS_H

#include "tree_types.h"
#include "document.h"

ELEMENT *fill_gaps_in_sectioning (ELEMENT *root);
void relate_index_entries_to_table_items_in_tree (ELEMENT *tree,
                                    INDEX **indices_information);
void move_index_entries_after_items_in_tree (ELEMENT *tree);
ELEMENT *reference_to_arg_in_tree (ELEMENT *tree);
ELEMENT *protect_colon_in_tree (ELEMENT *tree);
ELEMENT *protect_comma_in_tree (ELEMENT *tree);
ELEMENT *protect_node_after_label_in_tree (ELEMENT *tree);
void complete_tree_nodes_menus (ELEMENT *root, int use_sections);
void complete_tree_nodes_missing_menu (ELEMENT *root, int use_sections);
int regenerate_master_menu (DOCUMENT *document, int use_sections);
ELEMENT *insert_nodes_for_sectioning_commands (DOCUMENT *document);


#endif
