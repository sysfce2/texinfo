use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'nested_ignore_comment_no_eol'} = {
  'contents' => [
    {
      'contents' => [
        {
          'cmdname' => 'ignore',
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
              'text' => '@ignore @c comment',
              'type' => 'raw'
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

$result_texis{'nested_ignore_comment_no_eol'} = '@ignore
@ignore @c comment';


$result_texts{'nested_ignore_comment_no_eol'} = '';

$result_errors{'nested_ignore_comment_no_eol'} = [
  {
    'error_line' => 'expected @end ignore
',
    'line_nr' => 2,
    'text' => 'expected @end ignore',
    'type' => 'error'
  },
  {
    'error_line' => 'no matching `@end ignore\'
',
    'line_nr' => 2,
    'text' => 'no matching `@end ignore\'',
    'type' => 'error'
  }
];


$result_floats{'nested_ignore_comment_no_eol'} = {};


1;
