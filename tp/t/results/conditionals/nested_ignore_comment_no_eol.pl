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
          'args' => [
            {
              'info' => {
                'spaces_after_argument' => '
'
              },
              'type' => 'block_line_arg'
            }
          ],
          'cmdname' => 'ignore',
          'contents' => [
            {
              'args' => [
                {
                  'info' => {
                    'comment_at_end' => {
                      'args' => [
                        {
                          'text' => ' comment',
                          'type' => 'misc_arg'
                        }
                      ],
                      'cmdname' => 'c',
                      'extra' => {
                        'misc_args' => [
                          ' comment'
                        ]
                      }
                    },
                    'spaces_after_argument' => ' '
                  },
                  'type' => 'block_line_arg'
                }
              ],
              'cmdname' => 'ignore'
            }
          ],
          'source_info' => {
            'file_name' => '',
            'line_nr' => 1,
            'macro' => ''
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
    'error_line' => 'no matching `@end ignore\'
',
    'file_name' => '',
    'line_nr' => 2,
    'macro' => '',
    'text' => 'no matching `@end ignore\'',
    'type' => 'error'
  },
  {
    'error_line' => 'no matching `@end ignore\'
',
    'file_name' => '',
    'line_nr' => 2,
    'macro' => '',
    'text' => 'no matching `@end ignore\'',
    'type' => 'error'
  }
];


$result_floats{'nested_ignore_comment_no_eol'} = {};


1;
