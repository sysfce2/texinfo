use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'simple_imbricated_macro'} = '*document_root C1
 *before_node_section C5
  *@macro C6 l1
  |EXTRA
  |macro_name:{truc}
  |misc_args:A{}
   *arguments_line C1
    {macro_line: truc {}\\n}
   {raw:truc.\\n}
   {raw:@macro bidule {}\\n}
   {raw:bidule.\\n}
   {raw:@end macro\\n}
   *@end C1 l6
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{macro}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {macro}
  {empty_line:\\n}
  *paragraph C2
   {truc.\\n}
   >SOURCEMARKS
   >macro_expansion<start;1>
    >*macro_call@truc C1
     >*brace_arg
   *@macro C3 l8:@truc
   |EXTRA
   |macro_name:{bidule}
   |misc_args:A{}
    *arguments_line C1
     {macro_line: bidule {}\\n}
    {raw:bidule.\\n}
    *@end C1 l8:@truc
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
    |EXTRA
    |text_arg:{macro}
     *line_arg C1
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
      {macro}
      >SOURCEMARKS
      >macro_expansion<end;1><p:5>
  {empty_line:\\n}
  *paragraph C1
   {bidule.\\n}
   >SOURCEMARKS
   >macro_expansion<start;2>
    >*macro_call@bidule C1
     >*brace_arg
   >macro_expansion<end;2><p:7>
';


$result_texis{'simple_imbricated_macro'} = '@macro truc {}
truc.
@macro bidule {}
bidule.
@end macro
@end macro

truc.
@macro bidule {}
bidule.
@end macro

bidule.
';


$result_texts{'simple_imbricated_macro'} = '
truc.

bidule.
';

$result_errors{'simple_imbricated_macro'} = [];


$result_nodes_list{'simple_imbricated_macro'} = '';

$result_sections_list{'simple_imbricated_macro'} = '';

$result_sectioning_root{'simple_imbricated_macro'} = '';

$result_headings_list{'simple_imbricated_macro'} = '';

1;
