use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'space_in_anchor'} = {
  'contents' => [
    {
      'contents' => [
        {
          'cmdname' => 'anchor',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'anchor  name'
                }
              ],
              'info' => {
                'spaces_after_argument' => {
                  'text' => '   '
                },
                'spaces_before_argument' => {
                  'text' => '   '
                }
              },
              'type' => 'brace_arg'
            }
          ],
          'extra' => {
            'is_target' => 1,
            'normalized' => 'anchor-name'
          },
          'source_info' => {
            'line_nr' => 1
          }
        },
        {
          'contents' => [
            {
              'text' => '.
'
            }
          ],
          'type' => 'paragraph'
        }
      ],
      'type' => 'before_node_section'
    }
  ],
  'type' => 'document_root'
};

$result_texis{'space_in_anchor'} = '@anchor{   anchor  name   }.
';


$result_texts{'space_in_anchor'} = '.
';

$result_errors{'space_in_anchor'} = [];


$result_floats{'space_in_anchor'} = {};



$result_converted{'plaintext'}->{'space_in_anchor'} = '.
';


$result_converted{'html_text'}->{'space_in_anchor'} = '<a class="anchor" id="anchor-name"></a><p>.
</p>';


$result_converted{'latex_text'}->{'space_in_anchor'} = '\\label{anchor:anchor-name}%
.
';


$result_converted{'docbook'}->{'space_in_anchor'} = '<anchor id="anchor-name"/><para>.
</para>';

1;
