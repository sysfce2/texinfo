/* call_perl_function.h - API to interact with perl from C code */
#ifndef CALL_PERL_FUNCTION_H
#define CALL_PERL_FUNCTION_H

#include "tree_types.h"
#include "utils.h"

char *call_nodenamenormalization_unicode_to_transliterate (char *text);

TARGET_FILENAME *call_file_id_setting_special_unit_target_file_name (
                     CONVERTER *self, OUTPUT_UNIT *special_unit, char *target,
                                                      char *default_filename);
char *call_file_id_setting_label_target_name (CONVERTER *self,
                       char *normalized, ELEMENT *label_element, char *target,
                       int *called);
char *call_file_id_setting_node_file_name (CONVERTER *self,
                       ELEMENT *target_element, char *node_filename,
                       int *called);
TARGET_CONTENTS_FILENAME * call_file_id_setting_sectioning_command_target_name
                     (CONVERTER *self,
                      ELEMENT *command, char *target, char *target_contents,
                      char *target_shortcontents, char *filename);
FILE_NAME_PATH *call_file_id_setting_unit_file_name (CONVERTER *self,
                                                     OUTPUT_UNIT *output_unit,
                                               char *filename, char *filepath);
char *call_formatting_function_format_title_titlepage (CONVERTER *self);

char *call_types_conversion (CONVERTER *self, enum element_type type,
                             ELEMENT *element, char *content);
char *call_types_open (CONVERTER *self, enum element_type type,
                       ELEMENT *element);
char *call_commands_conversion (CONVERTER *self, enum command_id cmd,
                          ELEMENT *element, HTML_ARGS_FORMATTED *args_formatted,
                          const char *content);
char *call_commands_open (CONVERTER *self, enum command_id cmd,
                          ELEMENT *element);
char *call_output_units_conversion (CONVERTER *self,
                                    enum output_unit_type unit_type,
                                OUTPUT_UNIT *output_unit, const char *content);

#endif
