use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'inlineiffmtifelse_not_closed'} = {
  'contents' => [
    {
      'contents' => [
        {
          'contents' => [
            {
              'cmdname' => 'inlinefmtifelse',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'html'
                    }
                  ],
                  'type' => 'brace_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => '
',
                      'type' => 'raw'
                    }
                  ],
                  'type' => 'elided_brace_command_arg'
                }
              ],
              'extra' => {
                'expand_index' => 2,
                'format' => 'html'
              },
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

$result_texis{'inlineiffmtifelse_not_closed'} = '@inlinefmtifelse{html,
}';


$result_texts{'inlineiffmtifelse_not_closed'} = '';

$result_errors{'inlineiffmtifelse_not_closed'} = [
  {
    'error_line' => '@inlinefmtifelse missing closing brace
',
    'line_nr' => 1,
    'text' => '@inlinefmtifelse missing closing brace',
    'type' => 'error'
  }
];


$result_floats{'inlineiffmtifelse_not_closed'} = {};


1;
