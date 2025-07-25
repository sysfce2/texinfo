use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'index_entry_before_node'} = '*document_root C4
 *before_node_section C1
  *preamble_before_content
 *@node C4 l1 {Top}
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
  {empty_line:\\n}
  *@menu C4 l3
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *menu_entry C4 l4
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{chap first}
    |normalized:{chap-first}
     {chap first}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C4 l5
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{second}
    |normalized:{second}
     {second}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *@end C1 l6
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
 *@node C6 l8 {chap first}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{2}
 |normalized:{chap-first}
  *arguments_line C4
   *line_arg C1
    {chap first}
   *line_arg C1
   |EXTRA
   |node_content:{second}
   |normalized:{second}
    {second}
   *line_arg
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
   |EXTRA
   |node_content:{Top}
   |normalized:{Top}
    {Top}
  {empty_line:\\n}
  *paragraph C1
   {Para.\\n}
  {empty_line:\\n}
  *index_entry_command@cindex C1 l12
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |element_node:{chap-first}
  |index_entry:I{cp,1}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {lone entry}
  {empty_line:\\n}
 *@node C3 l14 {second}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |isindex:{1}
 |node_number:{3}
 |normalized:{second}
  *arguments_line C4
   *line_arg C1
    {second}
   *line_arg
   *line_arg C1
   |EXTRA
   |node_content:{chap first}
   |normalized:{chap-first}
    {chap first}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
   |EXTRA
   |node_content:{Top}
   |normalized:{Top}
    {Top}
  {empty_line:\\n}
  *@printindex C1 l16
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


$result_texis{'index_entry_before_node'} = '@node Top

@menu
* chap first::
* second::
@end menu

@node chap first,second,,Top

Para.

@cindex lone entry

@node second,,chap first,Top

@printindex cp
';


$result_texts{'index_entry_before_node'} = '
* chap first::
* second::


Para.



';

$result_errors{'index_entry_before_node'} = [];


$result_nodes_list{'index_entry_before_node'} = '1|Top
 menus:
  chap first
  second
 node_directions:
  next->chap first
2|chap first
 node_directions:
  next->second
  up->Top
3|second
 node_directions:
  prev->chap first
  up->Top
';

$result_sections_list{'index_entry_before_node'} = '';

$result_sectioning_root{'index_entry_before_node'} = '';

$result_headings_list{'index_entry_before_node'} = '';

$result_indices_sort_strings{'index_entry_before_node'} = 'cp:
 lone entry
';


$result_converted{'info'}->{'index_entry_before_node'} = 'This is , produced from .


File: ,  Node: Top,  Next: chap first,  Up: (dir)

* Menu:

* chap first::
* second::


File: ,  Node: chap first,  Next: second,  Up: Top

Para.


File: ,  Node: second,  Prev: chap first,  Up: Top

 [index ]
* Menu:

* lone entry:                            chap first.            (line 4)


Tag Table:
Node: Top27
Node: chap first116
Node: second177

End Tag Table


Local Variables:
coding: utf-8
End:
';


$result_converted{'plaintext'}->{'index_entry_before_node'} = 'Para.

* Menu:

* lone entry:                            chap first.            (line 1)

';


$result_converted{'html_text'}->{'index_entry_before_node'} = '<a class="node-id" id="Top"></a><div class="nav-panel">
<p>
[<a href="#second" title="Index" rel="index">Index</a>]</p>
</div>
<h1 class="node"><span>Top<a class="copiable-link" href="#Top"> &para;</a></span></h1>


<hr>
<a class="node-id" id="chap-first"></a><div class="nav-panel">
<p>
[<a href="#second" title="Index" rel="index">Index</a>]</p>
</div>
<h4 class="node"><span>chap first<a class="copiable-link" href="#chap-first"> &para;</a></span></h4>

<p>Para.
</p>
<a class="index-entry-id" id="index-lone-entry"></a>

<hr>
<a class="node-id" id="second"></a><div class="nav-panel">
<p>
[<a href="#second" title="Index" rel="index">Index</a>]</p>
</div>
<h4 class="node"><span>second<a class="copiable-link" href="#second"> &para;</a></span></h4>

<div class="printindex cp-printindex">
<table class="index-entries-printindex cp-entries-printindex">
<tr><td colspan="2"><hr></td></tr>
<tr><th class="index-letter-header-printindex cp-letter-header-printindex" colspan="2" id="second_cp_letter-L">L</th></tr>
<tr><td class="printindex-index-entry"><a href="#index-lone-entry">lone entry</a></td><td class="printindex-index-section"><a href="#chap-first">chap first</a></td></tr>
<tr><td colspan="2"><hr></td></tr>
</table>
</div>
';


$result_converted{'xml'}->{'index_entry_before_node'} = '<node identifier="Top" spaces=" "><nodename>Top</nodename><nodenext automatic="on">chap first</nodenext></node>

<menu endspaces=" ">
<menuentry><menuleadingtext>* </menuleadingtext><menunode>chap first</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode>second</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry></menu>

<node identifier="chap-first" spaces=" "><nodename>chap first</nodename><nodenext>second</nodenext><nodeprev></nodeprev><nodeup>Top</nodeup></node>

<para>Para.
</para>
<cindex index="cp" spaces=" "><indexterm index="cp" number="1">lone entry</indexterm></cindex>

<node identifier="second" spaces=" "><nodename>second</nodename><nodenext></nodenext><nodeprev>chap first</nodeprev><nodeup>Top</nodeup></node>

<printindex spaces=" " value="cp" line="cp"></printindex>
';

1;
