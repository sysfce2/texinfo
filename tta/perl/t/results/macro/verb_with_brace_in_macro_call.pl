use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'verb_with_brace_in_macro_call'} = {
  'contents' => [
    {
      'contents' => [
        {
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'cmdname' => 'macro',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => ' mycommand {a, b, c}
',
                  'type' => 'macro_line'
                }
              ],
              'type' => 'arguments_line'
            },
            {
              'text' => '\\a\\|\\b\\|\\c\\
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
                'line_nr' => 4
              }
            }
          ],
          'extra' => {
            'macro_name' => 'mycommand',
            'misc_args' => [
              'a',
              'b',
              'c'
            ]
          },
          'source_info' => {
            'line_nr' => 2
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
                        'text' => '@verb{: in }'
                      }
                    ],
                    'type' => 'brace_arg'
                  },
                  {
                    'contents' => [
                      {
                        'text' => 'verb :'
                      }
                    ],
                    'info' => {
                      'spaces_before_argument' => {
                        'text' => ' '
                      }
                    },
                    'type' => 'brace_arg'
                  }
                ],
                'info' => {
                  'command_name' => 'mycommand',
                  'spaces_after_cmd_before_arg' => {
                    'text' => ' '
                  }
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
          'contents' => [
            {
              'cmdname' => 'verb',
              'contents' => [
                {
                  'contents' => [
                    {
                      'source_marks' => [
                        {
                          'counter' => 1,
                          'position' => 13,
                          'sourcemark_type' => 'macro_expansion',
                          'status' => 'end'
                        }
                      ],
                      'text' => ' in }|verb :|',
                      'type' => 'raw'
                    },
                    {
                      'text' => ', other, last}
',
                      'type' => 'raw'
                    },
                    {
                      'text' => '
',
                      'type' => 'raw'
                    }
                  ],
                  'type' => 'brace_container'
                }
              ],
              'info' => {
                'delimiter' => ':'
              },
              'source_info' => {
                'line_nr' => 6,
                'macro' => 'mycommand'
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

$result_texis{'verb_with_brace_in_macro_call'} = '
@macro mycommand {a, b, c}
\\a\\|\\b\\|\\c\\
@end macro

@verb{: in }|verb :|, other, last}

:}';


$result_texts{'verb_with_brace_in_macro_call'} = '

 in }|verb :|, other, last}

';

$result_errors{'verb_with_brace_in_macro_call'} = [
  {
    'error_line' => '@verb missing closing delimiter sequence: :} (possibly involving @mycommand)
',
    'line_nr' => 6,
    'macro' => 'mycommand',
    'text' => '@verb missing closing delimiter sequence: :}',
    'type' => 'error'
  }
];


$result_floats{'verb_with_brace_in_macro_call'} = {};


1;
