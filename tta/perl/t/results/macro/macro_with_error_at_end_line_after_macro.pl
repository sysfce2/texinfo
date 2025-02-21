use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'macro_with_error_at_end_line_after_macro'} = {
  'contents' => [
    {
      'contents' => [
        {
          'cmdname' => 'macro',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => ' witherror{string}
',
                  'type' => 'macro_line'
                }
              ],
              'type' => 'arguments_line'
            },
            {
              'text' => '@center
',
              'type' => 'raw'
            },
            {
              'cmdname' => 'end',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'macro'
                    }
                  ],
                  'info' => {
                    'spaces_after_argument' => {
                      'text' => '
'
                    }
                  },
                  'type' => 'line_arg'
                }
              ],
              'extra' => {
                'text_arg' => 'macro'
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'line_nr' => 3
              }
            }
          ],
          'extra' => {
            'macro_name' => 'witherror',
            'misc_args' => [
              'string'
            ]
          },
          'source_info' => {
            'line_nr' => 1
          }
        },
        {
          'source_marks' => [
            {
              'counter' => 1,
              'element' => {
                'contents' => [
                  {
                    'contents' => [
                      {
                        'text' => 'aaa'
                      }
                    ],
                    'type' => 'brace_arg'
                  }
                ],
                'info' => {
                  'command_name' => 'witherror'
                },
                'type' => 'macro_call'
              },
              'position' => 1,
              'sourcemark_type' => 'macro_expansion',
              'status' => 'start'
            }
          ],
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'cmdname' => 'center',
          'contents' => [
            {
              'info' => {
                'spaces_after_argument' => {
                  'source_marks' => [
                    {
                      'counter' => 1,
                      'sourcemark_type' => 'macro_expansion',
                      'status' => 'end'
                    }
                  ],
                  'text' => '
'
                }
              },
              'type' => 'line_arg'
            }
          ],
          'source_info' => {
            'line_nr' => 5,
            'macro' => 'witherror'
          }
        }
      ],
      'type' => 'before_node_section'
    }
  ],
  'type' => 'document_root'
};

$result_texis{'macro_with_error_at_end_line_after_macro'} = '@macro witherror{string}
@center
@end macro

@center
';


$result_texts{'macro_with_error_at_end_line_after_macro'} = '

';

$result_errors{'macro_with_error_at_end_line_after_macro'} = [
  {
    'error_line' => 'warning: @center missing argument (possibly involving @witherror)
',
    'line_nr' => 5,
    'macro' => 'witherror',
    'text' => '@center missing argument',
    'type' => 'warning'
  }
];


$result_floats{'macro_with_error_at_end_line_after_macro'} = {};


1;
