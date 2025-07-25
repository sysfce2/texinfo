use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'index_entry_in_footnote'} = '*document_root C2
 *before_node_section C1
  *preamble_before_content
 *@node C5 l1 {Top}
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
  *paragraph C3
   {Top node}
   *@footnote C1 l3
   |EXTRA
   |global_command_number:{1}
    *brace_command_context C1
     *paragraph C2
      {in footnote\\n}
      *index_entry_command@cindex C1 l4
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
        {index entry in footnote}
   {\\n}
  {empty_line:\\n}
  *@printindex C1 l7
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


$result_texis{'index_entry_in_footnote'} = '@node Top

Top node@footnote{in footnote
@cindex index entry in footnote
}

@printindex cp
';


$result_texts{'index_entry_in_footnote'} = '
Top node

';

$result_errors{'index_entry_in_footnote'} = [];


$result_nodes_list{'index_entry_in_footnote'} = '1|Top
';

$result_sections_list{'index_entry_in_footnote'} = '';

$result_sectioning_root{'index_entry_in_footnote'} = '';

$result_headings_list{'index_entry_in_footnote'} = '';

$result_indices_sort_strings{'index_entry_in_footnote'} = 'cp:
 index entry in footnote
';


$result_converted{'info'}->{'index_entry_in_footnote'} = 'This is , produced from .


File: ,  Node: Top,  Up: (dir)

Top node(1)

 [index ]
* Menu:

* index entry in footnote:               Top.                   (line 4)

   ---------- Footnotes ----------

   (1) in footnote


Tag Table:
Node: Top27
Ref: Top-Footnote-1205

End Tag Table


Local Variables:
coding: utf-8
End:
';


$result_converted{'plaintext'}->{'index_entry_in_footnote'} = 'Top node(1)

* Menu:

* index entry in footnote:               Top.                   (line 0)

   ---------- Footnotes ----------

   (1) in footnote

';


$result_converted{'html_text'}->{'index_entry_in_footnote'} = '<h1 class="node" id="Top"><span>Top<a class="copiable-link" href="#Top"> &para;</a></span></h1>

<p>Top node<a class="footnote" id="DOCF1" href="#FOOT1"><sup>1</sup></a>
</p>
<div class="printindex cp-printindex">
<table class="index-entries-printindex cp-entries-printindex">
<tr><td colspan="2"><hr></td></tr>
<tr><th class="index-letter-header-printindex cp-letter-header-printindex" colspan="2" id="Top_cp_letter-I">I</th></tr>
<tr><td class="printindex-index-entry"><a href="#index-index-entry-in-footnote">index entry in footnote</a></td><td class="printindex-index-section"><a href="#Top">Top</a></td></tr>
<tr><td colspan="2"><hr></td></tr>
</table>
</div>
<div class="footnotes-segment">
<hr>
<h4 class="footnotes-heading">Footnotes</h4>

<h5 class="footnote-body-heading"><a id="FOOT1" href="#DOCF1">(1)</a></h5>
<p>in footnote
<a class="index-entry-id" id="index-index-entry-in-footnote"></a>
</p>
</div>
';


$result_converted{'xml'}->{'index_entry_in_footnote'} = '<node identifier="Top" spaces=" "><nodename>Top</nodename></node>

<para>Top node<footnote><para>in footnote
<cindex index="cp" spaces=" "><indexterm index="cp" number="1">index entry in footnote</indexterm></cindex>
</para></footnote>
</para>
<printindex spaces=" " value="cp" line="cp"></printindex>
';

1;
