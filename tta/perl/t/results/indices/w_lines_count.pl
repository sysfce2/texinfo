use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'w_lines_count'} = '*document_root C3
 *before_node_section C1
  *preamble_before_content
 *@node C1 l1 {Top}
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
 *@top C8 l2
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C3
   {xzcompilationxdmbufferxmsubsequentmxCtxaxxmcommandsmadvancemfrommthere.  \\n}
   *@w C1 l5
    *brace_container C1
     *@code C1 l5
      *brace_container C1
       {C-u}
   { starts again from the beginning\\n}
  {empty_line:\\n}
  *index_entry_command@findex C1 l7
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |element_node:{Top}
  |index_entry:I{fn,1}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {compilation-next-error}
  *paragraph C5
   {Compilation mode also defines the keys }
   *@key C1 l8
    *brace_container C1
     {SPC}
   { and }
   *@key C1 l8
    *brace_container C1
     {DEL}
   { to\\n}
  {empty_line:\\n}
  *@printindex C1 l10
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{1}
  |misc_args:A{fn}
   *line_arg C1
    {fn}
';


$result_texis{'w_lines_count'} = '@node Top
@top

xzcompilationxdmbufferxmsubsequentmxCtxaxxmcommandsmadvancemfrommthere.  
@w{@code{C-u}} starts again from the beginning

@findex compilation-next-error
Compilation mode also defines the keys @key{SPC} and @key{DEL} to

@printindex fn';


$result_texts{'w_lines_count'} = '
xzcompilationxdmbufferxmsubsequentmxCtxaxxmcommandsmadvancemfrommthere.  
C-u starts again from the beginning

Compilation mode also defines the keys SPC and DEL to

';

$result_errors{'w_lines_count'} = [];


$result_nodes_list{'w_lines_count'} = '1|Top
 associated_section
 associated_title_command
';

$result_sections_list{'w_lines_count'} = '1
 associated_anchor_command: Top
 associated_node: Top
';

$result_sectioning_root{'w_lines_count'} = 'level: -1
list:
 1|
';

$result_headings_list{'w_lines_count'} = '';

$result_indices_sort_strings{'w_lines_count'} = 'fn:
 compilation-next-error
';


$result_converted{'info'}->{'w_lines_count'} = 'This is , produced from .


File: ,  Node: Top,  Up: (dir)

xzcompilationxdmbufferxmsubsequentmxCtxaxxmcommandsmadvancemfrommthere.
‘C-u’ starts again from the beginning

   Compilation mode also defines the keys <SPC> and <DEL> to

 [index ]
* Menu:

* compilation-next-error:                Top.                   (line 6)


Tag Table:
Node: Top27

End Tag Table


Local Variables:
coding: utf-8
End:
';


$result_converted{'plaintext'}->{'w_lines_count'} = 'xzcompilationxdmbufferxmsubsequentmxCtxaxxmcommandsmadvancemfrommthere.
‘C-u’ starts again from the beginning

   Compilation mode also defines the keys <SPC> and <DEL> to

* Menu:

* compilation-next-error:                Top.                   (line 3)

';


$result_converted{'html_text'}->{'w_lines_count'} = '<div class="top-level-extent" id="Top">
<a class="top" id="SEC_Top"></a>
<p>xzcompilationxdmbufferxmsubsequentmxCtxaxxmcommandsmadvancemfrommthere.  
<code class="code">C-u</code><!-- /@w --> starts again from the beginning
</p>
<a class="index-entry-id" id="index-compilation_002dnext_002derror"></a>
<p>Compilation mode also defines the keys <kbd class="key">SPC</kbd> and <kbd class="key">DEL</kbd> to
</p>
<div class="printindex fn-printindex">
<table class="index-entries-printindex fn-entries-printindex">
<tr><td colspan="2"><hr></td></tr>
<tr><th class="index-letter-header-printindex fn-letter-header-printindex" colspan="2" id="Top_fn_letter-C">C</th></tr>
<tr><td class="printindex-index-entry"><a href="#index-compilation_002dnext_002derror"><code>compilation-next-error</code></a></td><td class="printindex-index-section"><a href="#Top">Top</a></td></tr>
<tr><td colspan="2"><hr></td></tr>
</table>
</div>
</div>
';


$result_converted{'xml'}->{'w_lines_count'} = '<node identifier="Top" spaces=" "><nodename>Top</nodename></node>
<top><sectiontitle></sectiontitle>

<para>xzcompilationxdmbufferxmsubsequentmxCtxaxxmcommandsmadvancemfrommthere.  
<w><code>C-u</code></w> starts again from the beginning
</para>
<findex index="fn" spaces=" "><indexterm index="fn" number="1">compilation-next-error</indexterm></findex>
<para>Compilation mode also defines the keys <key>SPC</key> and <key>DEL</key> to
</para>
<printindex spaces=" " value="fn" line="fn"></printindex>
</top>
';

1;
