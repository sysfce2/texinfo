use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'accent_no_closed_newline'} = {
  'contents' => [
    {
      'contents' => [
        {
          'contents' => [
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'text' => 'e
'
                    },
                    {
                      'text' => '
',
                      'type' => 'empty_line'
                    }
                  ],
                  'type' => 'brace_command_arg'
                }
              ],
              'cmdname' => '~',
              'source_info' => {
                'file_name' => '',
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

$result_texis{'accent_no_closed_newline'} = '@~{e

}';


$result_texts{'accent_no_closed_newline'} = 'e

~';

$result_errors{'accent_no_closed_newline'} = [
  {
    'error_line' => '@~ missing closing brace
',
    'file_name' => '',
    'line_nr' => 1,
    'text' => '@~ missing closing brace',
    'type' => 'error'
  }
];


$result_floats{'accent_no_closed_newline'} = {};


1;
