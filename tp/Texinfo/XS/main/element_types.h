/* This file automatically generated by element_types.awk */
#ifndef ELEMENT_TYPES_H
#define ELEMENT_TYPES_H
enum element_type {
ET_NONE,
ET_command_as_argument,
ET_command_as_argument_inserted,
ET_index_entry_command,
ET_following_arg,
ET_space_command_arg,
ET_definfoenclose_command,
ET_empty_line,
ET_raw,
ET_ignorable_spaces_after_command,
ET_spaces_at_end,
ET_spaces_after_close_brace,
ET_spaces_before_paragraph,
ET_text_after_end,
ET_text_before_beginning,
ET_space_at_end_menu_node,
ET_after_menu_description_line,
ET_spaces_after_cmd_before_arg,
ET_spaces_inserted,
ET_document_root,
ET_root_line,
ET_before_node_section,
ET_postamble_after_end,
ET_preamble_before_beginning,
ET_preamble_before_setfilename,
ET_preamble_before_content,
ET_paragraph,
ET_preformatted,
ET_rawpreformatted,
ET_brace_command_arg,
ET_brace_command_context,
ET_block_line_arg,
ET_line_arg,
ET_rawline_arg,
ET_menu_entry,
ET_menu_entry_leading_text,
ET_menu_entry_name,
ET_menu_entry_separator,
ET_menu_entry_node,
ET_menu_entry_description,
ET_menu_comment,
ET_internal_menu_star,
ET_internal_spaces_after_command,
ET_internal_spaces_before_argument,
ET_internal_spaces_before_brace_in_index,
ET_internal_spaces_after_cmd_before_arg,
ET_macro_name,
ET_macro_arg,
ET_before_item,
ET_table_entry,
ET_table_term,
ET_table_definition,
ET_inter_item,
ET_def_line,
ET_def_item,
ET_inter_def_item,
ET_before_defline,
ET_multitable_head,
ET_multitable_body,
ET_row,
ET_balanced_braces,
ET_bracketed_arg,
ET_bracketed_linemacro_arg,
ET_def_aggregate,
ET_def_category_inserted,
ET_untranslated_def_category_inserted,
ET_elided_rawpreformatted,
ET_elided_brace_command_arg,
ET_delimiter,
ET_spaces,
ET_untranslated,
ET_macro_call,
ET_rmacro_call,
ET_linemacro_call,
ET_text,
ET__code,
ET__converted,
ET__string,
ET_special_unit_element,
};

#define TXI_TREE_TYPES_NUMBER (ET_special_unit_element +1)

extern char *element_type_names[];
#endif
