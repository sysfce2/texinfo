use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'cartouche'} = {
  'contents' => [
    {
      'contents' => [
        {
          'args' => [
            {
              'contents' => [],
              'extra' => {
                'spaces_after_argument' => '
'
              },
              'parent' => {},
              'type' => 'block_line_arg'
            }
          ],
          'cmdname' => 'cartouche',
          'contents' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'in cartouche.
'
                }
              ],
              'parent' => {},
              'type' => 'paragraph'
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'cartouche'
                    }
                  ],
                  'parent' => {},
                  'type' => 'line_arg'
                }
              ],
              'cmdname' => 'end',
              'extra' => {
                'spaces_before_argument' => ' ',
                'text_arg' => 'cartouche'
              },
              'parent' => {},
              'source_info' => {
                'file_name' => '',
                'line_nr' => 3,
                'macro' => ''
              }
            }
          ],
          'extra' => {
            'end_command' => {}
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
      'type' => 'before_node_section'
    }
  ],
  'type' => 'document_root'
};
$result_trees{'cartouche'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'cartouche'}{'contents'}[0]{'contents'}[0];
$result_trees{'cartouche'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'cartouche'}{'contents'}[0]{'contents'}[0]{'contents'}[0];
$result_trees{'cartouche'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'cartouche'}{'contents'}[0]{'contents'}[0];
$result_trees{'cartouche'}{'contents'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'cartouche'}{'contents'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'cartouche'}{'contents'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'cartouche'}{'contents'}[0]{'contents'}[0]{'contents'}[1];
$result_trees{'cartouche'}{'contents'}[0]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'cartouche'}{'contents'}[0]{'contents'}[0];
$result_trees{'cartouche'}{'contents'}[0]{'contents'}[0]{'extra'}{'end_command'} = $result_trees{'cartouche'}{'contents'}[0]{'contents'}[0]{'contents'}[1];
$result_trees{'cartouche'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'cartouche'}{'contents'}[0];
$result_trees{'cartouche'}{'contents'}[0]{'parent'} = $result_trees{'cartouche'};

$result_texis{'cartouche'} = '@cartouche
in cartouche.
@end cartouche';


$result_texts{'cartouche'} = 'in cartouche.
';

$result_errors{'cartouche'} = [];


$result_floats{'cartouche'} = {};



$result_converted{'plaintext'}->{'cartouche'} = 'in cartouche.
';


$result_converted{'html_text'}->{'cartouche'} = '<table class="cartouche" border="1"><tr><td>
<p>in cartouche.
</p></td></tr></table>
';


$result_converted{'xml'}->{'cartouche'} = '<cartouche endspaces=" ">
<para>in cartouche.
</para></cartouche>';


$result_converted{'latex_text'}->{'cartouche'} = '\\begin{mdframed}[style=GNUTexinfocartouche]
in cartouche.
\\end{mdframed}
';


$result_converted{'docbook'}->{'cartouche'} = '<para>in cartouche.
</para>';

1;
