use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'math_not_closed'} = {
  'contents' => [
    {
      'contents' => [
        {
          'contents' => [
            {
              'cmdname' => 'math',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => '\\delta + 2'
                    }
                  ],
                  'type' => 'brace_command_context'
                }
              ],
              'source_info' => {
                'line_nr' => 1
              }
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

$result_texis{'math_not_closed'} = '@math{\\delta + 2}';


$result_texts{'math_not_closed'} = '\\delta + 2';

$result_errors{'math_not_closed'} = [
  {
    'error_line' => '@math missing closing brace
',
    'line_nr' => 1,
    'text' => '@math missing closing brace',
    'type' => 'error'
  }
];


$result_floats{'math_not_closed'} = {};


1;
