use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'displaymath_not_closed'} = {
  'contents' => [
    {
      'contents' => [
        {
          'args' => [
            {
              'extra' => {
                'spaces_after_argument' => '
'
              },
              'parent' => {},
              'type' => 'block_line_arg'
            }
          ],
          'cmdname' => 'displaymath',
          'contents' => [
            {
              'parent' => {},
              'text' => 'in displaymath
'
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
$result_trees{'displaymath_not_closed'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'displaymath_not_closed'}{'contents'}[0]{'contents'}[0];
$result_trees{'displaymath_not_closed'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'displaymath_not_closed'}{'contents'}[0]{'contents'}[0];
$result_trees{'displaymath_not_closed'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'displaymath_not_closed'}{'contents'}[0];
$result_trees{'displaymath_not_closed'}{'contents'}[0]{'parent'} = $result_trees{'displaymath_not_closed'};

$result_texis{'displaymath_not_closed'} = '@displaymath
in displaymath
';


$result_texts{'displaymath_not_closed'} = 'in displaymath
';

$result_errors{'displaymath_not_closed'} = [
  {
    'error_line' => 'no matching `@end displaymath\'
',
    'file_name' => '',
    'line_nr' => 2,
    'macro' => '',
    'text' => 'no matching `@end displaymath\'',
    'type' => 'error'
  }
];


$result_floats{'displaymath_not_closed'} = {};


1;
