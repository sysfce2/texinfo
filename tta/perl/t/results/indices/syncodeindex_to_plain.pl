use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'syncodeindex_to_plain'} = '*document_root C3
 *before_node_section C1
  *preamble_before_content C2
   *@syncodeindex C1 l1
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |misc_args:A{ky|cp}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {ky cp}
   {empty_line:\\n}
 *@node C1 l3 {Top}
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
 *@node C11 l4 {chap}
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
  *index_entry_command@kindex C1 l6
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |element_node:{chap}
  |index_entry:I{ky,1}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {--k1}
  *index_entry_command@vindex C1 l7
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |element_node:{chap}
  |index_entry:I{vr,1}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {--v}
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
    {--c}
  {empty_line:\\n}
  *paragraph C1
   {cp index.\\n}
  *@printindex C1 l11
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
  {empty_line:\\n}
  *paragraph C1
   {vr index.\\n}
  *@printindex C1 l14
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{2}
  |misc_args:A{vr}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {vr}
';


$result_texis{'syncodeindex_to_plain'} = '@syncodeindex ky cp

@node Top
@node chap

@kindex --k1
@vindex --v
@cindex --c

cp index.
@printindex cp

vr index.
@printindex vr
';


$result_texts{'syncodeindex_to_plain'} = '


cp index.

vr index.
';

$result_errors{'syncodeindex_to_plain'} = [
  {
    'error_line' => 'warning: node `chap\' not in menu
',
    'line_nr' => 4,
    'text' => 'node `chap\' not in menu',
    'type' => 'warning'
  }
];


$result_indices{'syncodeindex_to_plain'} = 'cp
fn C
ky C ->cp
pg C
tp C
vr C
';

$result_nodes_list{'syncodeindex_to_plain'} = '1|Top
 node_directions:
  next->chap
2|chap
 node_directions:
  prev->Top
';

$result_sections_list{'syncodeindex_to_plain'} = '';

$result_sectioning_root{'syncodeindex_to_plain'} = '';

$result_headings_list{'syncodeindex_to_plain'} = '';

$result_indices_sort_strings{'syncodeindex_to_plain'} = 'cp:
 --k1
 -c
vr:
 --v
';


$result_converted{'info'}->{'syncodeindex_to_plain'} = 'This is , produced from .


File: ,  Node: Top,  Next: chap,  Up: (dir)


File: ,  Node: chap,  Prev: Top

cp index.

 [index ]
* Menu:

* --k1:                                  chap.                  (line 3)
* -c:                                    chap.                  (line 3)

   vr index.

 [index ]
* Menu:

* --v:                                   chap.                  (line 3)


Tag Table:
Node: Top27
Node: chap74

End Tag Table


Local Variables:
coding: utf-8
End:
';


$result_converted{'plaintext'}->{'syncodeindex_to_plain'} = 'cp index.

* Menu:

* --k1:                                  chap.                  (line 0)
* -c:                                    chap.                  (line 0)

   vr index.

* Menu:

* --v:                                   chap.                  (line 0)

';


$result_converted{'html_text'}->{'syncodeindex_to_plain'} = '
<a class="node-id" id="Top"></a><div class="nav-panel">
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

<a class="index-entry-id" id="index-_002d_002dk1"></a>
<a class="index-entry-id" id="index-_002d_002dv"></a>
<a class="index-entry-id" id="index-_002d_002dc"></a>

<p>cp index.
</p><div class="printindex cp-printindex">
<table class="index-entries-printindex cp-entries-printindex">
<tr><td colspan="2"><hr></td></tr>
<tr><th class="index-letter-header-printindex cp-letter-header-printindex" colspan="2" id="chap_cp_symbol-1">-</th></tr>
<tr><td class="printindex-index-entry"><a href="#index-_002d_002dk1"><code>--k1</code></a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td class="printindex-index-entry"><a href="#index-_002d_002dc">&ndash;c</a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td colspan="2"><hr></td></tr>
</table>
</div>

<p>vr index.
</p><div class="printindex vr-printindex">
<table class="index-entries-printindex vr-entries-printindex">
<tr><td colspan="2"><hr></td></tr>
<tr><th class="index-letter-header-printindex vr-letter-header-printindex" colspan="2" id="chap_vr_symbol-1">-</th></tr>
<tr><td class="printindex-index-entry"><a href="#index-_002d_002dv"><code>--v</code></a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td colspan="2"><hr></td></tr>
</table>
</div>
';


$result_converted{'xml'}->{'syncodeindex_to_plain'} = '<syncodeindex spaces=" " from="ky" to="cp" line="ky cp"></syncodeindex>

<node identifier="Top" spaces=" "><nodename>Top</nodename><nodenext automatic="on">chap</nodenext></node>
<node identifier="chap" spaces=" "><nodename>chap</nodename><nodeprev automatic="on">Top</nodeprev></node>

<kindex index="ky" spaces=" "><indexterm index="ky" number="1" mergedindex="cp">--k1</indexterm></kindex>
<vindex index="vr" spaces=" "><indexterm index="vr" number="1">--v</indexterm></vindex>
<cindex index="cp" spaces=" "><indexterm index="cp" number="1">&textndash;c</indexterm></cindex>

<para>cp index.
</para><printindex spaces=" " value="cp" line="cp"></printindex>

<para>vr index.
</para><printindex spaces=" " value="vr" line="vr"></printindex>
';

1;
