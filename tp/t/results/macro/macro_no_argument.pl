use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'macro_no_argument'} = {
  'contents' => [
    {
      'contents' => [
        {
          'cmdname' => 'macro',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => '',
                  'type' => 'macro_line'
                }
              ],
              'type' => 'arguments_line'
            }
          ],
          'extra' => {
            'invalid_syntax' => 1
          },
          'source_info' => {
            'line_nr' => 1
          }
        }
      ],
      'type' => 'before_node_section'
    }
  ],
  'type' => 'document_root'
};

$result_texis{'macro_no_argument'} = '@macro';


$result_texts{'macro_no_argument'} = '';

$result_errors{'macro_no_argument'} = [
  {
    'error_line' => '@macro requires a name
',
    'line_nr' => 1,
    'text' => '@macro requires a name',
    'type' => 'error'
  },
  {
    'error_line' => 'no matching `@end macro\'
',
    'line_nr' => 1,
    'text' => 'no matching `@end macro\'',
    'type' => 'error'
  }
];


$result_floats{'macro_no_argument'} = {};


1;
