use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'recursive_linemacro_in_call'} = {
  'contents' => [
    {
      'contents' => [
        {
          'cmdname' => 'linemacro',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'anorecurse',
                  'type' => 'macro_name'
                },
                {
                  'text' => 'arg',
                  'type' => 'macro_arg'
                },
                {
                  'text' => 'other',
                  'type' => 'macro_arg'
                }
              ],
              'type' => 'argument'
            },
            {
              'text' => '\\arg\\ d \\other\\
',
              'type' => 'raw'
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'text' => 'linemacro'
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
              'cmdname' => 'end',
              'extra' => {
                'text_arg' => 'linemacro'
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
          'info' => {
            'arg_line' => ' anorecurse {arg, other}
'
          },
          'source_info' => {
            'line_nr' => 1
          }
        },
        {
          'text' => '
',
          'type' => 'empty_line'
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
                        'text' => '@anorecurse a b',
                        'type' => 'bracketed_linemacro_arg'
                      }
                    ],
                    'type' => 'line_arg'
                  },
                  {
                    'contents' => [
                      {
                        'text' => 'c'
                      }
                    ],
                    'info' => {
                      'spaces_before_argument' => {
                        'text' => ' '
                      }
                    },
                    'type' => 'line_arg'
                  }
                ],
                'info' => {
                  'command_name' => 'anorecurse',
                  'spaces_before_argument' => {
                    'text' => ' '
                  }
                },
                'type' => 'linemacro_call'
              },
              'sourcemark_type' => 'linemacro_expansion',
              'status' => 'start'
            }
          ],
          'text' => '
',
          'type' => 'empty_line'
        }
      ],
      'type' => 'before_node_section'
    }
  ],
  'type' => 'document_root'
};

$result_texis{'recursive_linemacro_in_call'} = '@linemacro anorecurse {arg, other}
\\arg\\ d \\other\\
@end linemacro


';


$result_texts{'recursive_linemacro_in_call'} = '

';

$result_errors{'recursive_linemacro_in_call'} = [
  {
    'error_line' => 'recursive call of macro anorecurse is not allowed; use @rmacro if needed (possibly involving @anorecurse)
',
    'line_nr' => 5,
    'macro' => 'anorecurse',
    'text' => 'recursive call of macro anorecurse is not allowed; use @rmacro if needed',
    'type' => 'error'
  }
];


$result_floats{'recursive_linemacro_in_call'} = {};


1;
