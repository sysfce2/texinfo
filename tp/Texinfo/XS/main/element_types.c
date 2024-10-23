/* This file automatically generated by element_types.awk */

#include "types_data.h"

TYPE_DATA type_data[] = {
{0, 0, 0},
{"index_entry_command", TF_at_command, 1},
{"definfoenclose_command", TF_at_command, 2},
{"nobrace_command", TF_at_command, 0},
{"brace_noarg_command", TF_at_command, 2},
{"container_command", TF_at_command, 0},
{"lineraw_command", TF_at_command, 0},
{"line_command", TF_at_command, 1},
{"block_command", TF_at_command, 1},
{"brace_command", TF_at_command, 2},
{"brace_args_command", TF_at_command, 2},
{"context_brace_command", TF_at_command, 2},
{"empty_line", TF_text | TF_leading_space, 0},
{"raw", TF_text, 0},
{"ignorable_spaces_after_command", TF_text | TF_leading_space, 0},
{"spaces_at_end", TF_text, 0},
{"spaces_after_close_brace", TF_text | TF_leading_space, 0},
{"spaces_before_paragraph", TF_text, 0},
{"text_after_end", TF_text, 0},
{"text_before_beginning", TF_text, 0},
{"space_at_end_menu_node", TF_text, 0},
{"after_menu_description_line", TF_text, 0},
{"spaces_after_cmd_before_arg", TF_text, 0},
{"normal_text", TF_text, 0},
{"other_text", TF_text, 0},
{"document_root", 0, 0},
{"root_line", 0, 0},
{"before_node_section", 0, 0},
{"postamble_after_end", 0, 0},
{"preamble_before_beginning", 0, 0},
{"preamble_before_setfilename", 0, 0},
{"preamble_before_content", 0, 0},
{"paragraph", 0, 0},
{"preformatted", 0, 0},
{"rawpreformatted", 0, 0},
{"brace_container", 0, 0},
{"brace_command_context", 0, 0},
{"brace_arg", 0, 3},
{"block_line_arg", 0, 4},
{"line_arg", 0, 4},
{"following_arg", 0, 0},
{"rawline_arg", TF_text, 0},
{"menu_entry", 0, 0},
{"menu_entry_leading_text", TF_text, 0},
{"menu_entry_name", 0, 0},
{"menu_entry_separator", TF_text, 0},
{"menu_entry_node", 0, 0},
{"menu_entry_description", 0, 0},
{"menu_comment", 0, 0},
{"internal_menu_star", TF_text, 0},
{"internal_spaces_after_command", TF_text | TF_leading_space, 0},
{"internal_spaces_before_argument", TF_text | TF_leading_space, 0},
{"internal_spaces_before_context_argument", TF_text | TF_leading_space, 0},
{"internal_spaces_before_brace_in_index", TF_text, 0},
{"internal_spaces_after_cmd_before_arg", TF_text, 0},
{"macro_name", TF_text, 0},
{"macro_arg", TF_text, 0},
{"before_item", 0, 0},
{"table_entry", 0, 0},
{"table_term", 0, 0},
{"table_definition", 0, 0},
{"inter_item", 0, 0},
{"def_line", 0, 1},
{"def_item", 0, 0},
{"inter_def_item", 0, 0},
{"before_defline", 0, 0},
{"multitable_head", 0, 0},
{"multitable_body", 0, 0},
{"row", 0, 0},
{"balanced_braces", 0, 0},
{"bracketed_arg", 0, 3},
{"def_line_arg", 0, 0},
{"untranslated_def_line_arg", 0, 0},
{"def_category", 0, 0},
{"def_class", 0, 0},
{"def_type", 0, 0},
{"def_name", 0, 0},
{"def_typearg", 0, 0},
{"def_arg", 0, 0},
{"delimiter", TF_text, 0},
{"spaces", TF_text, 0},
{"untranslated", TF_text, 0},
{"elided_rawpreformatted", 0, 0},
{"elided_brace_command_arg", 0, 0},
{"macro_call", TF_macro_call, 2},
{"rmacro_call", TF_macro_call, 2},
{"macro_call_line", TF_macro_call, 1},
{"rmacro_call_line", TF_macro_call, 1},
{"linemacro_call", TF_macro_call, 1},
{"bracketed_linemacro_arg", TF_text, 0},
{"text", 0, 0},
{"_code", 0, 0},
{"_converted", TF_text, 0},
{"_string", 0, 0},
{"special_unit_element", 0, 0},
};
