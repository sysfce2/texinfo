use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'group_not_closed'} = {
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
          'cmdname' => 'group',
          'contents' => [
            {
              'parent' => {},
              'text' => '
',
              'type' => 'empty_line'
            },
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'text in group
'
                }
              ],
              'parent' => {},
              'type' => 'paragraph'
            }
          ],
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
$result_trees{'group_not_closed'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'group_not_closed'}{'contents'}[0]{'contents'}[0];
$result_trees{'group_not_closed'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'group_not_closed'}{'contents'}[0]{'contents'}[0];
$result_trees{'group_not_closed'}{'contents'}[0]{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'group_not_closed'}{'contents'}[0]{'contents'}[0]{'contents'}[1];
$result_trees{'group_not_closed'}{'contents'}[0]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'group_not_closed'}{'contents'}[0]{'contents'}[0];
$result_trees{'group_not_closed'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'group_not_closed'}{'contents'}[0];
$result_trees{'group_not_closed'}{'contents'}[0]{'parent'} = $result_trees{'group_not_closed'};

$result_texis{'group_not_closed'} = '@group

text in group
';


$result_texts{'group_not_closed'} = '
text in group
';

$result_errors{'group_not_closed'} = [
  {
    'error_line' => 'no matching `@end group\'
',
    'file_name' => '',
    'line_nr' => 3,
    'macro' => '',
    'text' => 'no matching `@end group\'',
    'type' => 'error'
  }
];


$result_floats{'group_not_closed'} = {};


1;
