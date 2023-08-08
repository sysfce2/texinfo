/* document.h - declarations for document.c */
#ifndef DOCUMENT_H
#define DOCUMENT_H

#include "tree_types.h"
/* for GLOBAL_INFO */
#include "utils.h"

typedef struct DOCUMENT {
  ELEMENT *tree;
  INDEX **index_names;
  FLOAT_RECORD_LIST *floats;
  ELEMENT_LIST *internal_references;
  LABEL_LIST *labels_list;
  LABEL_LIST *identifiers_target;
  GLOBAL_INFO *global_info;
} DOCUMENT;

DOCUMENT *retrieve_document (int document_descriptor);
size_t register_document (ELEMENT *root, INDEX **index_names,
                          FLOAT_RECORD_LIST *floats_list,
                          ELEMENT_LIST *internal_references,
                          LABEL_LIST *labels_list,
                          LABEL_LIST *identifiers_target,
                          GLOBAL_INFO *global_info);
void remove_document (int document_descriptor);
LABEL_LIST *set_labels_identifiers_target (LABEL *list_of_labels,
                                           size_t labels_number);

#endif
