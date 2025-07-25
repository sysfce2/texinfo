use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'syncode_index_print_both'} = '*document_root C5
 *before_node_section C1
  *preamble_before_content C2
   *@syncodeindex C1 l1
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |misc_args:A{fn|cp}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {fn cp}
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
 *@top C2 l4 {top}
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
    {top}
  {empty_line:\\n}
 *@node C1 l6 {chapter index}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |isindex:{1}
 |node_number:{2}
 |normalized:{chapter-index}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {chapter index}
 *@chapter C14 l7 {index}
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
    {index}
  {empty_line:\\n}
  *index_entry_command@cindex C1 l9
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |element_node:{chapter-index}
  |index_entry:I{cp,1}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {c---oncept}
  *index_entry_command@findex C1 l10
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |element_node:{chapter-index}
  |index_entry:I{fn,1}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {f---un}
  {empty_line:\\n}
  {empty_line:\\n}
  *paragraph C1
   {Print fn\\n}
  {empty_line:\\n}
  *@printindex C1 l15
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
  *paragraph C1
   {Print cp\\n}
  {empty_line:\\n}
  *@printindex C1 l19
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{2}
  |misc_args:A{cp}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {cp}
  {empty_line:\\n}
';


$result_texis{'syncode_index_print_both'} = '@syncodeindex fn cp

@node Top
@top top

@node chapter index
@chapter index

@cindex c---oncept
@findex f---un


Print fn

@printindex fn

Print cp

@printindex cp

';


$result_texts{'syncode_index_print_both'} = '
top
***

1 index
*******



Print fn


Print cp


';

$result_errors{'syncode_index_print_both'} = [
  {
    'error_line' => 'warning: printing an index `fn\' merged in another one, `cp\'
',
    'line_nr' => 15,
    'text' => 'printing an index `fn\' merged in another one, `cp\'',
    'type' => 'warning'
  }
];


$result_indices{'syncode_index_print_both'} = 'cp
fn C ->cp
ky C
pg C
tp C
vr C
';

$result_nodes_list{'syncode_index_print_both'} = '1|Top
 associated_section: top
 associated_title_command: top
 node_directions:
  next->chapter index
2|chapter index
 associated_section: 1 index
 associated_title_command: 1 index
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'syncode_index_print_both'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->index
 section_children:
  1|index
2|index
 associated_anchor_command: chapter index
 associated_node: chapter index
 section_directions:
  up->top
 toplevel_directions:
  prev->top
  up->top
';

$result_sectioning_root{'syncode_index_print_both'} = 'level: -1
list:
 1|top
';

$result_headings_list{'syncode_index_print_both'} = '';

$result_indices_sort_strings{'syncode_index_print_both'} = 'cp:
 c--oncept
 f---un
';


$result_converted{'info'}->{'syncode_index_print_both'} = 'This is , produced from .


File: ,  Node: Top,  Next: chapter index,  Up: (dir)

top
***

* Menu:

* chapter index::


File: ,  Node: chapter index,  Prev: Top,  Up: Top

1 index
*******

Print fn

   Print cp

 [index ]
* Menu:

* c--oncept:                             chapter index.         (line 6)
* f---un:                                chapter index.         (line 6)


Tag Table:
Node: Top27
Node: chapter index120

End Tag Table


Local Variables:
coding: utf-8
End:
';


$result_converted{'plaintext'}->{'syncode_index_print_both'} = 'top
***

1 index
*******

Print fn

   Print cp

* Menu:

* c--oncept:                             chapter index.         (line 6)
* f---un:                                chapter index.         (line 6)

';


$result_converted{'html_text'}->{'syncode_index_print_both'} = '
<div class="top-level-extent" id="Top">
<div class="nav-panel">
<p>
[<a href="#chapter-index" title="Index" rel="index">Index</a>]</p>
</div>
<h1 class="top" id="top"><span>top<a class="copiable-link" href="#top"> &para;</a></span></h1>

<ul class="mini-toc">
<li><a href="#chapter-index">index</a></li>
</ul>
<hr>
<div class="chapter-level-extent" id="chapter-index">
<div class="nav-panel">
<p>
[<a href="#chapter-index" title="Index" rel="index">Index</a>]</p>
</div>
<h2 class="chapter" id="index"><span>1 index<a class="copiable-link" href="#index"> &para;</a></span></h2>

<a class="index-entry-id" id="index-c_002d_002d_002doncept"></a>
<a class="index-entry-id" id="index-f_002d_002d_002dun"></a>


<p>Print fn
</p>

<p>Print cp
</p>
<div class="printindex cp-printindex">
<table class="index-letters-header-printindex cp-letters-header-printindex"><tr><th>Jump to: &nbsp; </th><td><a class="summary-letter-printindex" href="#chapter-index_cp_letter-C"><b>C</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#chapter-index_cp_letter-F"><b>F</b></a>
 &nbsp; 
</td></tr></table>
<table class="index-entries-printindex cp-entries-printindex">
<tr><td colspan="2"><hr></td></tr>
<tr><th class="index-letter-header-printindex cp-letter-header-printindex" colspan="2" id="chapter-index_cp_letter-C">C</th></tr>
<tr><td class="printindex-index-entry"><a href="#index-c_002d_002d_002doncept">c&mdash;oncept</a></td><td class="printindex-index-section"><a href="#chapter-index">chapter index</a></td></tr>
<tr><td colspan="2"><hr></td></tr>
<tr><th class="index-letter-header-printindex cp-letter-header-printindex" colspan="2" id="chapter-index_cp_letter-F">F</th></tr>
<tr><td class="printindex-index-entry"><a href="#index-f_002d_002d_002dun"><code>f---un</code></a></td><td class="printindex-index-section"><a href="#chapter-index">chapter index</a></td></tr>
<tr><td colspan="2"><hr></td></tr>
</table>
<table class="index-letters-footer-printindex cp-letters-footer-printindex"><tr><th>Jump to: &nbsp; </th><td><a class="summary-letter-printindex" href="#chapter-index_cp_letter-C"><b>C</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#chapter-index_cp_letter-F"><b>F</b></a>
 &nbsp; 
</td></tr></table>
</div>

</div>
</div>
';


$result_converted{'xml'}->{'syncode_index_print_both'} = '<syncodeindex spaces=" " from="fn" to="cp" line="fn cp"></syncodeindex>

<node identifier="Top" spaces=" "><nodename>Top</nodename><nodenext automatic="on">chapter index</nodenext></node>
<top spaces=" "><sectiontitle>top</sectiontitle>

</top>
<node identifier="chapter-index" spaces=" "><nodename>chapter index</nodename><nodeprev automatic="on">Top</nodeprev><nodeup automatic="on">Top</nodeup></node>
<chapter spaces=" "><sectiontitle>index</sectiontitle>

<cindex index="cp" spaces=" "><indexterm index="cp" number="1">c&textmdash;oncept</indexterm></cindex>
<findex index="fn" spaces=" "><indexterm index="fn" number="1" mergedindex="cp">f---un</indexterm></findex>


<para>Print fn
</para>
<printindex spaces=" " value="fn" line="fn"></printindex>

<para>Print cp
</para>
<printindex spaces=" " value="cp" line="cp"></printindex>

</chapter>
';


$result_converted{'latex'}->{'syncode_index_print_both'} = '\\documentclass{book}
\\usepackage{amsfonts}
\\usepackage{amsmath}
\\usepackage[gen]{eurosym}
\\usepackage{textcomp}
\\usepackage{graphicx}
\\usepackage{etoolbox}
\\usepackage{titleps}
\\usepackage[utf8]{inputenc}
\\usepackage[T1]{fontenc}
\\usepackage{imakeidx}
\\usepackage{float}
% use hidelinks to remove boxes around links to be similar to Texinfo TeX
\\usepackage[hidelinks]{hyperref}

\\makeatletter
\\newcommand{\\Texinfosettitle}{No Title}%

% no index headers
\\indexsetup{level=\\relax,toclevel=section}%
\\makeindex[name=cp,title=]%

% redefine the \\mainmatter command such that it does not clear page
% as if in double page
\\renewcommand\\mainmatter{\\clearpage\\@mainmattertrue\\pagenumbering{arabic}}
\\newenvironment{Texinfopreformatted}{%
  \\par\\GNUTobeylines\\obeyspaces\\frenchspacing\\parskip=\\z@\\parindent=\\z@}{}
{\\catcode`\\^^M=13 \\gdef\\GNUTobeylines{\\catcode`\\^^M=13 \\def^^M{\\null\\par}}}
\\newenvironment{Texinfoindented}{\\begin{list}{}{}\\item\\relax}{\\end{list}}

% used for substitutions in commands
\\newcommand{\\Texinfoplaceholder}[1]{}

\\newpagestyle{single}{\\sethead[\\chaptername{} \\thechapter{} \\chaptertitle{}][][\\thepage]
                              {\\chaptername{} \\thechapter{} \\chaptertitle{}}{}{\\thepage}}

% allow line breaking at underscore
\\let\\Texinfounderscore\\_
\\renewcommand{\\_}{\\Texinfounderscore\\discretionary{}{}{}}
\\renewcommand{\\includegraphics}[1]{\\fbox{FIG \\detokenize{#1}}}

\\makeatother
% set default for @setchapternewpage
\\makeatletter
\\patchcmd{\\chapter}{\\if@openright\\cleardoublepage\\else\\clearpage\\fi}{\\Texinfoplaceholder{setchapternewpage placeholder}\\clearpage}{}{}
\\makeatother
\\pagestyle{single}%


\\begin{document}
\\label{anchor:Top}%
\\chapter{{index}}
\\label{anchor:chapter-index}%

\\index[cp]{c--oncept@c---oncept}%
\\index[cp]{f---un@\\texttt{f{-}{-}{-}un}}%


Print fn


Print cp

\\printindex[cp]

\\end{document}
';

1;
