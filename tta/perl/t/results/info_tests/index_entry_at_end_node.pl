use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'index_entry_at_end_node'} = '*document_root C7
 *before_node_section
 *@node C1 l1 {Top}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{1}
 |normalized:{Top}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Top}
 *@top C5 l2 {Element}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Element}
  {empty_line:\\n}
  {empty_line:\\n}
  *@menu C4 l5
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *menu_entry C4 l6
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{chapter}
    |normalized:{chapter}
     {chapter}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C4 l7
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{indices}
    |normalized:{indices}
     {indices}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *@end C1 l8
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{menu}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {menu}
  {empty_line:\\n}
 *@node C1 l10 {chapter}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{2}
 |normalized:{chapter}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {chapter}
 *@chapter C6 l11 {Chapter}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Chapter}
  {empty_line:\\n}
  {empty_line:\\n}
  {empty_line:\\n}
  *index_entry_command@cindex C1 l15
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |element_node:{chapter}
  |index_entry:I{cp,1}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {index entry}
  {empty_line:\\n}
 *@node C1 l17 {indices}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |isindex:{1}
 |node_number:{3}
 |normalized:{indices}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {indices}
 *@appendix C3 l18 {indices}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{A}
 |section_level:{1}
 |section_number:{3}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {indices}
  {empty_line:\\n}
  *@printindex C1 l20
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


$result_texis{'index_entry_at_end_node'} = '@node Top
@top Element


@menu
* chapter::
* indices::
@end menu

@node chapter
@chapter Chapter



@cindex index entry

@node indices
@appendix indices

@printindex cp
';


$result_texts{'index_entry_at_end_node'} = 'Element
*******


* chapter::
* indices::

1 Chapter
*********




Appendix A indices
******************

';

$result_errors{'index_entry_at_end_node'} = [];


$result_nodes_list{'index_entry_at_end_node'} = '1|Top
 associated_section: Element
 associated_title_command: Element
 menus:
  chapter
  indices
 node_directions:
  next->chapter
2|chapter
 associated_section: 1 Chapter
 associated_title_command: 1 Chapter
 node_directions:
  next->indices
  prev->Top
  up->Top
3|indices
 associated_section: A indices
 associated_title_command: A indices
 node_directions:
  prev->chapter
  up->Top
';

$result_sections_list{'index_entry_at_end_node'} = '1|Element
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->Chapter
 section_children:
  1|Chapter
  2|indices
2|Chapter
 associated_anchor_command: chapter
 associated_node: chapter
 section_directions:
  next->indices
  up->Element
 toplevel_directions:
  next->indices
  prev->Element
  up->Element
3|indices
 associated_anchor_command: indices
 associated_node: indices
 section_directions:
  prev->Chapter
  up->Element
 toplevel_directions:
  prev->Chapter
  up->Element
';

$result_sectioning_root{'index_entry_at_end_node'} = 'level: -1
list:
 1|Element
';

$result_headings_list{'index_entry_at_end_node'} = '';

$result_indices_sort_strings{'index_entry_at_end_node'} = 'cp:
 index entry
';


$result_converted{'info'}->{'index_entry_at_end_node'} = 'This is , produced from .


File: ,  Node: Top,  Next: chapter,  Up: (dir)

Element
*******

* Menu:

* chapter::
* indices::


File: ,  Node: chapter,  Next: indices,  Prev: Top,  Up: Top

1 Chapter
*********


File: ,  Node: indices,  Prev: chapter,  Up: Top

Appendix A indices
******************

 [index ]
* Menu:

* index entry:                           chapter.               (line 5)


Tag Table:
Node: Top27
Node: chapter128
Node: indices213

End Tag Table


Local Variables:
coding: utf-8
End:
';

1;
