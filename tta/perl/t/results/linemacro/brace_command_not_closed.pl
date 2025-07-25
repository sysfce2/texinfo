use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'brace_command_not_closed'} = '*document_root C1
 *before_node_section C4
  *@linemacro C3 l1
  |EXTRA
  |macro_name:{mycommand}
  |misc_args:A{a|b|c}
   *arguments_line C1
    {macro_line: mycommand {a, b, c}\\n}
   {raw:\\a\\, \\b\\ \\c\\\\n}
   *@end C1 l3
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{linemacro}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {linemacro}
  {empty_line:\\n}
  >SOURCEMARKS
  >linemacro_expansion<start;1><p:1>
   >*linemacro_call@mycommand C1
   >|INFO
   >|spaces_before_argument:
    >|{spaces_before_argument: }
    >*linemacro_arg C1
     >{macro_call_arg_text:@code{in code\\n\\n}
  *paragraph C1
   *@code C1 l6:@mycommand
    *brace_container C2
     {in code\\n}
     {empty_line:\\n}
  *paragraph C1
   {,  }
   >SOURCEMARKS
   >linemacro_expansion<end;1><p:3>
';


$result_texis{'brace_command_not_closed'} = '@linemacro mycommand {a, b, c}
\\a\\, \\b\\ \\c\\
@end linemacro

@code{in code

},  ';


$result_texts{'brace_command_not_closed'} = '
in code

,  ';

$result_errors{'brace_command_not_closed'} = [
  {
    'error_line' => '@mycommand missing closing brace
',
    'line_nr' => 6,
    'text' => '@mycommand missing closing brace',
    'type' => 'error'
  },
  {
    'error_line' => '@code missing closing brace (possibly involving @mycommand)
',
    'line_nr' => 6,
    'macro' => 'mycommand',
    'text' => '@code missing closing brace',
    'type' => 'error'
  }
];


$result_nodes_list{'brace_command_not_closed'} = '';

$result_sections_list{'brace_command_not_closed'} = '';

$result_sectioning_root{'brace_command_not_closed'} = '';

$result_headings_list{'brace_command_not_closed'} = '';

1;
