/* translations.h - declarations for translations.c */
#ifndef TRANSLATIONS_H
#define TRANSLATIONS_H

#include <stddef.h>

#include "options_data.h"
#include "tree_types.h"
#include "document_types.h"

// msgfmt --statistics po_document/*.pot
#define TXI_DOCUMENT_TRANSLATED_STRINGS_NR 243

/* there are two translated strings in parser related to definition
   name and category, that are not shared with the remaining of the
   codes
 */
#define TXI_PARSER_STRINGS_NR 2

/* number of document strings except for parser strings */
#define TXI_CONVERT_STRINGS_NR \
  (TXI_DOCUMENT_TRANSLATED_STRINGS_NR - TXI_PARSER_STRINGS_NR)

/* element or string may not always be present */
typedef struct NAMED_STRING_ELEMENT {
    const char *name;
    ELEMENT *element; /* actually const until added to tree */
    char *string; /* const in gdt_string, but used temporarily in gdt_tree */
} NAMED_STRING_ELEMENT;

typedef struct NAMED_STRING_ELEMENT_LIST {
    size_t number;
    size_t space;
    NAMED_STRING_ELEMENT *list;
} NAMED_STRING_ELEMENT_LIST;

extern LANG_TRANSLATION **translation_cache;

void configure_output_strings_translations (const char *localesdir,
                                            const char *strings_textdomain_in,
                                         int use_external_translate_string_in);

LANG_TRANSLATION *get_lang_translation (
                      LANG_TRANSLATION ***lang_translations_ptr,
                      const char *lang, size_t cache_size);
LANG_TRANSLATION *new_lang_translation (const char *lang);
TRANSLATION_TREE *add_translation_tree (
                   LANG_TRANSLATION_TREE_LIST *translations,
                      const char *translated);
void free_lang_translation (LANG_TRANSLATION *lang_translation);
LANG_TRANSLATION *switch_lang_translations (
                          LANG_TRANSLATION ***lang_translations,
                          const char *in_lang,
                          LANG_TRANSLATION *current_lang_translations,
                          size_t cache_size);
char *translate_string (const char * string, const char *lang,
                        const char *translation_context);
TRANSLATION_TREE *cache_translate_string (const char *string,
                        LANG_TRANSLATION *lang_translation,
                        const char *translation_context);
DOCUMENT *replace_convert_substrings (const char *translated_string,
                          NAMED_STRING_ELEMENT_LIST *replaced_substrings,
                          int debug_level);
ELEMENT *substitute_substrings_in_tree (ELEMENT *tree,
                     NAMED_STRING_ELEMENT_LIST *replaced_substrings);
char *replace_substrings (const char *string,
                    const NAMED_STRING_ELEMENT_LIST *replaced_substrings);

ELEMENT *gdt_tree (const char *string, DOCUMENT *document,
                   LANG_TRANSLATION *lang_translation,
                   NAMED_STRING_ELEMENT_LIST *replaced_substrings,
                   int debug_level, const char *translation_context);

char *gdt_string (const char *string,
                  LANG_TRANSLATION *lang_translation,
                  NAMED_STRING_ELEMENT_LIST *replaced_substrings,
                  const char *translation_context);

ELEMENT *pgdt_tree (const char *translation_context, const char *string,
                    DOCUMENT *document,
                    LANG_TRANSLATION *lang_translation,
                    NAMED_STRING_ELEMENT_LIST *replaced_substrings,
                    int debug_level);

NAMED_STRING_ELEMENT_LIST * new_named_string_element_list (void);
void add_string_to_named_string_element_list (NAMED_STRING_ELEMENT_LIST *nsel,
                                              const char *name, char *string);
void add_element_to_named_string_element_list (NAMED_STRING_ELEMENT_LIST *nsel,
                                               const char *name,
                                               ELEMENT *element);
void destroy_named_string_element_list (NAMED_STRING_ELEMENT_LIST *nsel);

#endif
