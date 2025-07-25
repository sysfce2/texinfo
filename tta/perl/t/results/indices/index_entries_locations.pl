use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'index_entries_locations'} = '*document_root C3
 *before_node_section C2
  *preamble_before_beginning C1
   {text_before_beginning:\\n}
  *preamble_before_content
 *@node C1 l2 {Top}
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
 *@node C16 l3 {chap}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |isindex:{1}
 |node_number:{2}
 |normalized:{chap}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {chap}
  {empty_line:\\n}
  *paragraph C1
   {Initial paragraph.\\n}
  {empty_line:\\n}
  *paragraph C4
   {Paragraph\\n}
   *index_entry_command@cindex C1 l8
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |element_node:{chap}
   |index_entry:I{cp,1}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {entry in paragraph}
   {end paragraph.\\n}
   *index_entry_command@cindex C1 l10
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |element_node:{chap}
   |index_entry:I{cp,2}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {entry at end of paragraph.}
  {empty_line:\\n}
  *paragraph C1
   {New paragraph.\\n}
  {empty_line:\\n}
  *index_entry_command@cindex C1 l14
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |element_node:{chap}
  |index_entry:I{cp,3}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Entry before paragraph}
  *paragraph C1
   {Another paragraph.\\n}
  {empty_line:\\n}
  *index_entry_command@cindex C1 l17
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |element_node:{chap}
  |index_entry:I{cp,4}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {lone entry}
  {empty_line:\\n}
  *paragraph C1
   {Last paragraph.\\n}
  {empty_line:\\n}
  *@printindex C1 l21
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


$result_texis{'index_entries_locations'} = '
@node Top
@node chap

Initial paragraph.

Paragraph
@cindex entry in paragraph
end paragraph.
@cindex entry at end of paragraph.

New paragraph.

@cindex Entry before paragraph
Another paragraph.

@cindex lone entry

Last paragraph.

@printindex cp
';


$result_texts{'index_entries_locations'} = '
Initial paragraph.

Paragraph
end paragraph.

New paragraph.

Another paragraph.


Last paragraph.

';

$result_errors{'index_entries_locations'} = [
  {
    'error_line' => 'warning: node `chap\' not in menu
',
    'line_nr' => 3,
    'text' => 'node `chap\' not in menu',
    'type' => 'warning'
  }
];


$result_nodes_list{'index_entries_locations'} = '1|Top
 node_directions:
  next->chap
2|chap
 node_directions:
  prev->Top
';

$result_sections_list{'index_entries_locations'} = '';

$result_sectioning_root{'index_entries_locations'} = '';

$result_headings_list{'index_entries_locations'} = '';

$result_indices_sort_strings{'index_entries_locations'} = 'cp:
 entry at end of paragraph.
 Entry before paragraph
 entry in paragraph
 lone entry
';


$result_converted{'info'}->{'index_entries_locations'} = 'This is , produced from .


File: ,  Node: Top,  Next: chap,  Up: (dir)


File: ,  Node: chap,  Prev: Top

Initial paragraph.

   Paragraph end paragraph.

   New paragraph.

   Another paragraph.

   Last paragraph.

 [index ]
* Menu:

* entry at end of paragraph.:            chap.                 (line  5)
* Entry before paragraph:                chap.                 (line  9)
* entry in paragraph:                    chap.                 (line  5)
* lone entry:                            chap.                 (line 11)


Tag Table:
Node: Top27
Node: chap74

End Tag Table


Local Variables:
coding: utf-8
End:
';


$result_converted{'plaintext'}->{'index_entries_locations'} = 'Initial paragraph.

   Paragraph end paragraph.

   New paragraph.

   Another paragraph.

   Last paragraph.

* Menu:

* entry at end of paragraph.:            chap.                  (line 2)
* Entry before paragraph:                chap.                  (line 6)
* entry in paragraph:                    chap.                  (line 2)
* lone entry:                            chap.                  (line 8)

';


$result_converted{'html_text'}->{'index_entries_locations'} = '<a class="node-id" id="Top"></a><div class="nav-panel">
<p>
[<a href="#chap" title="Index" rel="index">Index</a>]</p>
</div>
<h1 class="node"><span>Top<a class="copiable-link" href="#Top"> &para;</a></span></h1>
<hr>
<a class="node-id" id="chap"></a><div class="nav-panel">
<p>
[<a href="#chap" title="Index" rel="index">Index</a>]</p>
</div>
<h4 class="node"><span>chap<a class="copiable-link" href="#chap"> &para;</a></span></h4>

<p>Initial paragraph.
</p>
<p>Paragraph
<a class="index-entry-id" id="index-entry-in-paragraph"></a>
end paragraph.
<a class="index-entry-id" id="index-entry-at-end-of-paragraph_002e"></a>
</p>
<p>New paragraph.
</p>
<a class="index-entry-id" id="index-Entry-before-paragraph"></a>
<p>Another paragraph.
</p>
<a class="index-entry-id" id="index-lone-entry"></a>

<p>Last paragraph.
</p>
<div class="printindex cp-printindex">
<table class="index-letters-header-printindex cp-letters-header-printindex"><tr><th>Jump to: &nbsp; </th><td><a class="summary-letter-printindex" href="#chap_cp_letter-E"><b>E</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#chap_cp_letter-L"><b>L</b></a>
 &nbsp; 
</td></tr></table>
<table class="index-entries-printindex cp-entries-printindex">
<tr><td colspan="2"><hr></td></tr>
<tr><th class="index-letter-header-printindex cp-letter-header-printindex" colspan="2" id="chap_cp_letter-E">E</th></tr>
<tr><td class="printindex-index-entry"><a href="#index-entry-at-end-of-paragraph_002e">entry at end of paragraph.</a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td class="printindex-index-entry"><a href="#index-Entry-before-paragraph">Entry before paragraph</a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td class="printindex-index-entry"><a href="#index-entry-in-paragraph">entry in paragraph</a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td colspan="2"><hr></td></tr>
<tr><th class="index-letter-header-printindex cp-letter-header-printindex" colspan="2" id="chap_cp_letter-L">L</th></tr>
<tr><td class="printindex-index-entry"><a href="#index-lone-entry">lone entry</a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td colspan="2"><hr></td></tr>
</table>
<table class="index-letters-footer-printindex cp-letters-footer-printindex"><tr><th>Jump to: &nbsp; </th><td><a class="summary-letter-printindex" href="#chap_cp_letter-E"><b>E</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#chap_cp_letter-L"><b>L</b></a>
 &nbsp; 
</td></tr></table>
</div>
';


$result_converted{'xml'}->{'index_entries_locations'} = '<preamblebeforebeginning>
</preamblebeforebeginning><node identifier="Top" spaces=" "><nodename>Top</nodename><nodenext automatic="on">chap</nodenext></node>
<node identifier="chap" spaces=" "><nodename>chap</nodename><nodeprev automatic="on">Top</nodeprev></node>

<para>Initial paragraph.
</para>
<para>Paragraph
<cindex index="cp" spaces=" "><indexterm index="cp" number="1">entry in paragraph</indexterm></cindex>
end paragraph.
<cindex index="cp" spaces=" "><indexterm index="cp" number="2">entry at end of paragraph.</indexterm></cindex>
</para>
<para>New paragraph.
</para>
<cindex index="cp" spaces=" "><indexterm index="cp" number="3">Entry before paragraph</indexterm></cindex>
<para>Another paragraph.
</para>
<cindex index="cp" spaces=" "><indexterm index="cp" number="4">lone entry</indexterm></cindex>

<para>Last paragraph.
</para>
<printindex spaces=" " value="cp" line="cp"></printindex>
';

1;
