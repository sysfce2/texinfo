use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'tex_not_closed'} = {
  'contents' => [
    {
      'contents' => [
        {
          'cmdname' => 'tex',
          'contents' => [
            {
              'contents' => [
                {
                  'info' => {
                    'spaces_after_argument' => {
                      'text' => '
'
                    }
                  },
                  'type' => 'block_line_arg'
                }
              ],
              'type' => 'arguments_line'
            },
            {
              'contents' => [
                {
                  'text' => '
',
                  'type' => 'empty_line'
                },
                {
                  'text' => 'This is some \\LaTeX{}
'
                }
              ],
              'type' => 'rawpreformatted'
            }
          ],
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

$result_texis{'tex_not_closed'} = '@tex

This is some \\LaTeX{}
';


$result_texts{'tex_not_closed'} = '
This is some \\LaTeX{}
';

$result_errors{'tex_not_closed'} = [
  {
    'error_line' => 'no matching `@end tex\'
',
    'line_nr' => 3,
    'text' => 'no matching `@end tex\'',
    'type' => 'error'
  }
];


$result_floats{'tex_not_closed'} = {};


1;
