use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'space_in_footnote'} = {
  'contents' => [
    {
      'contents' => [
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'text'
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'in footnote.'
                        }
                      ],
                      'parent' => {},
                      'type' => 'paragraph'
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_context'
                }
              ],
              'cmdname' => 'footnote',
              'extra' => {
                'spaces_before_argument' => ' '
              },
              'parent' => {},
              'source_info' => {
                'file_name' => '',
                'line_nr' => 1,
                'macro' => ''
              }
            }
          ],
          'parent' => {},
          'type' => 'paragraph'
        }
      ],
      'parent' => {},
      'type' => 'before_node_section'
    }
  ],
  'type' => 'document_root'
};
$result_trees{'space_in_footnote'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'space_in_footnote'}{'contents'}[0]{'contents'}[0];
$result_trees{'space_in_footnote'}{'contents'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'space_in_footnote'}{'contents'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'space_in_footnote'}{'contents'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'space_in_footnote'}{'contents'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'space_in_footnote'}{'contents'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'space_in_footnote'}{'contents'}[0]{'contents'}[0]{'contents'}[1];
$result_trees{'space_in_footnote'}{'contents'}[0]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'space_in_footnote'}{'contents'}[0]{'contents'}[0];
$result_trees{'space_in_footnote'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'space_in_footnote'}{'contents'}[0];
$result_trees{'space_in_footnote'}{'contents'}[0]{'parent'} = $result_trees{'space_in_footnote'};

$result_texis{'space_in_footnote'} = 'text@footnote{ in footnote.}';


$result_texts{'space_in_footnote'} = 'text';

$result_errors{'space_in_footnote'} = [];


$result_floats{'space_in_footnote'} = {};



$result_converted{'plaintext'}->{'space_in_footnote'} = 'text(1)

   ---------- Footnotes ----------

   (1) in footnote.

';


$result_converted{'html_text'}->{'space_in_footnote'} = '<p>text<a class="footnote" id="DOCF1" href="#FOOT1"><sup>1</sup></a></p><div class="footnotes-segment">
<hr>
<h4 class="footnotes-heading">Footnotes</h4>

<h5 class="footnote-body-heading"><a id="FOOT1" href="#DOCF1">(1)</a></h5>
<p>in footnote.</p>
</div>
';


$result_converted{'latex_text'}->{'space_in_footnote'} = 'text\\footnote{in footnote.}';

1;
