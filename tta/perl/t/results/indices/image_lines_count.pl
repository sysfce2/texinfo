use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'image_lines_count'} = '*document_root C2
 *before_node_section C1
  *preamble_before_content
 *@node C8 l1 {Top}
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
  *@image C1 l3
  |EXTRA
  |input_encoding_name:{utf-8}
   *brace_arg C1
    {count_image}
  {\\n}
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
    {index entry}
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


$result_texis{'image_lines_count'} = '@node Top

@image{count_image}

@cindex index entry

@printindex cp
';


$result_texts{'image_lines_count'} = '
count_image


';

$result_errors{'image_lines_count'} = [];


$result_nodes_list{'image_lines_count'} = '1|Top
';

$result_sections_list{'image_lines_count'} = '';

$result_sectioning_root{'image_lines_count'} = '';

$result_headings_list{'image_lines_count'} = '';

$result_indices_sort_strings{'image_lines_count'} = 'cp:
 index entry
';


$result_converted{'info'}->{'image_lines_count'} = 'This is , produced from .


File: ,  Node: Top,  Up: (dir)

 [image src="count_image.png" text="aaaa
bbb
cc

ff

" ]

 [index ]
* Menu:

* index entry:                           Top.                  (line 11)


Tag Table:
Node: Top27

End Tag Table


Local Variables:
coding: utf-8
End:
';


$result_converted{'plaintext'}->{'image_lines_count'} = 'aaaa
bbb
cc

ff


* Menu:

* index entry:                           Top.                   (line 7)

';


$result_converted{'html_text'}->{'image_lines_count'} = '<h1 class="node" id="Top"><span>Top<a class="copiable-link" href="#Top"> &para;</a></span></h1>

<img class="image" src="count_image.png" alt="count_image">

<a class="index-entry-id" id="index-index-entry"></a>

<div class="printindex cp-printindex">
<table class="index-entries-printindex cp-entries-printindex">
<tr><td colspan="2"><hr></td></tr>
<tr><th class="index-letter-header-printindex cp-letter-header-printindex" colspan="2" id="Top_cp_letter-I">I</th></tr>
<tr><td class="printindex-index-entry"><a href="#index-index-entry">index entry</a></td><td class="printindex-index-section"><a href="#Top">Top</a></td></tr>
<tr><td colspan="2"><hr></td></tr>
</table>
</div>
';


$result_converted{'xml'}->{'image_lines_count'} = '<node identifier="Top" spaces=" "><nodename>Top</nodename></node>

<image><imagefile>count_image</imagefile></image>

<cindex index="cp" spaces=" "><indexterm index="cp" number="1">index entry</indexterm></cindex>

<printindex spaces=" " value="cp" line="cp"></printindex>
';

1;
