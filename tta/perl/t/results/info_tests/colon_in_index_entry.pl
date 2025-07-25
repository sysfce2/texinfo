use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'colon_in_index_entry'} = '*document_root C2
 *before_node_section
 *@node C11 l1 {Top}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |isindex:{1}
 |node_number:{1}
 |normalized:{Top}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Top}
  {empty_line:\\n}
  *@synindex C1 l3
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |misc_args:A{vr|cp}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {vr cp}
  {empty_line:\\n}
  *index_entry_command@cindex C1 l5
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |element_node:{Top}
  |index_entry:I{cp,1}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {a:b}
  {empty_line:\\n}
  *@vtable C3 l7
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C1
    *block_line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *@emph l7
   *table_entry C1
    *table_term C1
     *@item C1 l8
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
     |EXTRA
     |element_node:{Top}
     |index_entry:I{vr,1}
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {%main::value}
   *@end C1 l9
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{vtable}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {vtable}
  {empty_line:\\n}
  *@defvr C3 l11
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *def_line C1 l11
   |EXTRA
   |def_command:{defvr}
   |def_index_element:
    |* C1
     |*brace_arg C1
      |{c:d}
   |element_node:{Top}
   |index_entry:I{vr,2}
   |original_def_cmdname:{defvr}
    *block_line_arg C7
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *def_category C1
      *bracketed_arg C1 l11
       {a:b}
     {spaces: }
     *def_name C1
      *bracketed_arg C1 l11
       {c:d}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {e}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {f}
   *@defvrx C1 l12
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |def_command:{defvr}
   |def_index_element:
    |* C1
     |*brace_arg C1
      |{z:t}
   |element_node:{Top}
   |index_entry:I{vr,3}
   |original_def_cmdname:{defvrx}
    *line_arg C9
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *def_category C1
      *bracketed_arg C1 l12
       {x:y}
     {spaces: }
     *def_name C1
      *bracketed_arg C1 l12
       {z:t}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {n}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {m}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {o}
   *@end C1 l13
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{defvr}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {defvr}
  {empty_line:\\n}
  *@printindex C1 l15
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{1}
  |misc_args:A{cp}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {cp}
';


$result_texis{'colon_in_index_entry'} = '@node Top

@synindex vr cp

@cindex a:b

@vtable @emph
@item %main::value
@end vtable

@defvr {a:b} {c:d} e f
@defvrx {x:y} {z:t} n m o
@end defvr

@printindex cp
';


$result_texts{'colon_in_index_entry'} = '


%main::value

a:b: c:d e f
x:y: z:t n m o

';

$result_errors{'colon_in_index_entry'} = [];


$result_indices{'colon_in_index_entry'} = 'cp
fn C
ky C
pg C
tp C
vr ->cp
';

$result_nodes_list{'colon_in_index_entry'} = '1|Top
';

$result_sections_list{'colon_in_index_entry'} = '';

$result_sectioning_root{'colon_in_index_entry'} = '';

$result_headings_list{'colon_in_index_entry'} = '';

$result_indices_sort_strings{'colon_in_index_entry'} = 'cp:
 %main::value
 a:b
 c:d
 z:t
';


$result_converted{'info'}->{'colon_in_index_entry'} = 'This is , produced from .


File: ,  Node: Top,  Up: (dir)

_%main::value_

 -- a:b: c:d e f
 -- x:y: z:t n m o

 [index ]
* Menu:

* %main::value:                          Top.                   (line 3)
* a:b:                                   Top.                   (line 3)
* c:d:                                   Top.                   (line 5)
* z:t:                                   Top.                   (line 6)


Tag Table:
Node: Top27

End Tag Table


Local Variables:
coding: utf-8
End:
';

1;
