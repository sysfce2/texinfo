use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'ftable_vtable'} = '*document_root C3
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
 *@node C12 l3 {chap}
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
  *@ftable C4 l5
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C1
    *block_line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *@emph l5
   *table_entry C2
    *table_term C2
     *@item C1 l6
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
     |EXTRA
     |element_node:{chap}
     |index_entry:I{fn,1}
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {function1}
     *@itemx C1 l7
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
     |EXTRA
     |element_node:{chap}
     |index_entry:I{fn,2}
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {function2x}
    *table_definition C1
     *paragraph C1
      {Text\\n}
   *table_entry C1
    *table_term C1
     *@item C1 l9
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
     |EXTRA
     |element_node:{chap}
     |index_entry:I{fn,3}
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {fun3}
   *@end C1 l10
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{ftable}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {ftable}
  {empty_line:\\n}
  *@vtable C4 l12
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C1
    *block_line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *@emph l12
   *table_entry C2
    *table_term C2
     *@item C1 l13
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
     |EXTRA
     |element_node:{chap}
     |index_entry:I{vr,1}
      *line_arg C2
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {var1 }
       *@error C1 l13
        *brace_container
     *@itemx C1 l14
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
     |EXTRA
     |element_node:{chap}
     |index_entry:I{vr,2}
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {varx2}
    *table_definition C1
     *paragraph C1
      {Text\\n}
   *table_entry C1
    *table_term C1
     *@item C1 l16
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
     |EXTRA
     |element_node:{chap}
     |index_entry:I{vr,3}
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {var3}
   *@end C1 l17
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
  *index_entry_command@findex C1 l19
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |element_node:{chap}
  |index_entry:I{fn,4}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {function1}
  {empty_line:\\n}
  *@printindex C1 l21
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{1}
  |misc_args:A{fn}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {fn}
  {empty_line:\\n}
  *@printindex C1 l23
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
  {empty_line:\\n}
';


$result_texis{'ftable_vtable'} = '
@node Top
@node chap

@ftable @emph
@item function1
@itemx function2x
Text
@item fun3
@end ftable

@vtable @emph
@item var1 @error{}
@itemx varx2
Text
@item var3
@end vtable

@findex function1

@printindex fn

@printindex vr

';


$result_texts{'ftable_vtable'} = '
function1
function2x
Text
fun3

var1 error->
varx2
Text
var3




';

$result_errors{'ftable_vtable'} = [
  {
    'error_line' => 'warning: node `chap\' not in menu
',
    'line_nr' => 3,
    'text' => 'node `chap\' not in menu',
    'type' => 'warning'
  }
];


$result_nodes_list{'ftable_vtable'} = '1|Top
 node_directions:
  next->chap
2|chap
 node_directions:
  prev->Top
';

$result_sections_list{'ftable_vtable'} = '';

$result_sectioning_root{'ftable_vtable'} = '';

$result_headings_list{'ftable_vtable'} = '';

$result_indices_sort_strings{'ftable_vtable'} = 'fn:
 fun3
 function1
 function1
 function2x
vr:
 var1 error→
 var3
 varx2
';


$result_converted{'info'}->{'ftable_vtable'} = 'This is , produced from .


File: ,  Node: Top,  Next: chap,  Up: (dir)


File: ,  Node: chap,  Prev: Top

_function1_
_function2x_
     Text
_fun3_

_var1 error→_
_varx2_
     Text
_var3_

 [index ]
* Menu:

* fun3:                                  chap.                 (line  6)
* function1:                             chap.                 (line  3)
* function1 <1>:                         chap.                 (line 13)
* function2x:                            chap.                 (line  4)

 [index ]
* Menu:

* var1 error→:                           chap.                 (line  8)
* var3:                                  chap.                 (line 11)
* varx2:                                 chap.                 (line  9)


Tag Table:
Node: Top27
Node: chap74

End Tag Table


Local Variables:
coding: utf-8
End:
';


$result_converted{'plaintext'}->{'ftable_vtable'} = '_function1_
_function2x_
     Text
_fun3_

_var1 error→_
_varx2_
     Text
_var3_

* Menu:

* fun3:                                  chap.                 (line  3)
* function1:                             chap.                 (line  0)
* function1 <1>:                         chap.                 (line 10)
* function2x:                            chap.                 (line  1)

* Menu:

* var1 error→:                           chap.                  (line 5)
* var3:                                  chap.                  (line 8)
* varx2:                                 chap.                  (line 6)

';


$result_converted{'html_text'}->{'ftable_vtable'} = '<a class="node-id" id="Top"></a><div class="nav-panel">
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

<dl class="ftable">
<dt><a id="index-function1"></a><span><em class="emph">function1</em><a class="copiable-link" href="#index-function1"> &para;</a></span></dt>
<dt><a id="index-function2x"></a><span><em class="emph">function2x</em><a class="copiable-link" href="#index-function2x"> &para;</a></span></dt>
<dd><p>Text
</p></dd>
<dt><a id="index-fun3"></a><span><em class="emph">fun3</em><a class="copiable-link" href="#index-fun3"> &para;</a></span></dt>
</dl>

<dl class="vtable">
<dt><a id="index-var1-error_002d_002d_003e"></a><span><em class="emph">var1 error&rarr;</em><a class="copiable-link" href="#index-var1-error_002d_002d_003e"> &para;</a></span></dt>
<dt><a id="index-varx2"></a><span><em class="emph">varx2</em><a class="copiable-link" href="#index-varx2"> &para;</a></span></dt>
<dd><p>Text
</p></dd>
<dt><a id="index-var3"></a><span><em class="emph">var3</em><a class="copiable-link" href="#index-var3"> &para;</a></span></dt>
</dl>

<a class="index-entry-id" id="index-function1-1"></a>

<div class="printindex fn-printindex">
<table class="index-entries-printindex fn-entries-printindex">
<tr><td colspan="2"><hr></td></tr>
<tr><th class="index-letter-header-printindex fn-letter-header-printindex" colspan="2" id="chap_fn_letter-F">F</th></tr>
<tr><td class="printindex-index-entry"><a href="#index-fun3"><code>fun3</code></a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td class="printindex-index-entry"><a href="#index-function1"><code>function1</code></a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td class="printindex-index-entry"><a href="#index-function1-1"><code>function1</code></a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td class="printindex-index-entry"><a href="#index-function2x"><code>function2x</code></a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td colspan="2"><hr></td></tr>
</table>
</div>

<div class="printindex vr-printindex">
<table class="index-entries-printindex vr-entries-printindex">
<tr><td colspan="2"><hr></td></tr>
<tr><th class="index-letter-header-printindex vr-letter-header-printindex" colspan="2" id="chap_vr_letter-V">V</th></tr>
<tr><td class="printindex-index-entry"><a href="#index-var1-error_002d_002d_003e"><code>var1 error&rarr;</code></a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td class="printindex-index-entry"><a href="#index-var3"><code>var3</code></a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td class="printindex-index-entry"><a href="#index-varx2"><code>varx2</code></a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td colspan="2"><hr></td></tr>
</table>
</div>

';


$result_converted{'xml'}->{'ftable_vtable'} = '<preamblebeforebeginning>
</preamblebeforebeginning><node identifier="Top" spaces=" "><nodename>Top</nodename><nodenext automatic="on">chap</nodenext></node>
<node identifier="chap" spaces=" "><nodename>chap</nodename><nodeprev automatic="on">Top</nodeprev></node>

<ftable commandarg="emph" spaces=" " endspaces=" ">
<tableentry><tableterm><item spaces=" "><itemformat command="emph"><indexterm index="fn" number="1">function1</indexterm>function1</itemformat></item>
<itemx spaces=" "><itemformat command="emph"><indexterm index="fn" number="2">function2x</indexterm>function2x</itemformat></itemx>
</tableterm><tableitem><para>Text
</para></tableitem></tableentry><tableentry><tableterm><item spaces=" "><itemformat command="emph"><indexterm index="fn" number="3">fun3</indexterm>fun3</itemformat></item>
</tableterm></tableentry></ftable>

<vtable commandarg="emph" spaces=" " endspaces=" ">
<tableentry><tableterm><item spaces=" "><itemformat command="emph"><indexterm index="vr" number="1">var1 &errorglyph;</indexterm>var1 &errorglyph;</itemformat></item>
<itemx spaces=" "><itemformat command="emph"><indexterm index="vr" number="2">varx2</indexterm>varx2</itemformat></itemx>
</tableterm><tableitem><para>Text
</para></tableitem></tableentry><tableentry><tableterm><item spaces=" "><itemformat command="emph"><indexterm index="vr" number="3">var3</indexterm>var3</itemformat></item>
</tableterm></tableentry></vtable>

<findex index="fn" spaces=" "><indexterm index="fn" number="4">function1</indexterm></findex>

<printindex spaces=" " value="fn" line="fn"></printindex>

<printindex spaces=" " value="vr" line="vr"></printindex>

';

1;
