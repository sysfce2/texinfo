use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'recursive_expansion_in_set'} = {
  'contents' => [
    {
      'contents' => [
        {
          'args' => [
            {
              'text' => 'V',
              'type' => 'rawline_arg'
            },
            {
              'text' => '@value{V}',
              'type' => 'rawline_arg'
            }
          ],
          'cmdname' => 'set',
          'info' => {
            'arg_line' => ' V @value{V}
'
          }
        },
        {
          'source_marks' => [
            {
              'counter' => 1,
              'element' => {
                'args' => [
                  {
                    'contents' => [
                      {
                        'text' => 'V'
                      }
                    ],
                    'type' => 'brace_container'
                  }
                ],
                'cmdname' => 'value'
              },
              'line' => '@value{V}',
              'sourcemark_type' => 'value_expansion',
              'status' => 'start'
            },
            {
              'counter' => 2,
              'element' => {
                'args' => [
                  {
                    'contents' => [
                      {
                        'text' => 'V'
                      }
                    ],
                    'type' => 'brace_container'
                  }
                ],
                'cmdname' => 'value'
              },
              'line' => '@value{V}',
              'sourcemark_type' => 'value_expansion',
              'status' => 'start'
            },
            {
              'counter' => 3,
              'element' => {
                'args' => [
                  {
                    'contents' => [
                      {
                        'text' => 'V'
                      }
                    ],
                    'type' => 'brace_container'
                  }
                ],
                'cmdname' => 'value'
              },
              'line' => '@value{V}',
              'sourcemark_type' => 'value_expansion',
              'status' => 'start'
            },
            {
              'counter' => 4,
              'element' => {
                'args' => [
                  {
                    'contents' => [
                      {
                        'text' => 'V'
                      }
                    ],
                    'type' => 'brace_container'
                  }
                ],
                'cmdname' => 'value'
              },
              'line' => '@value{V}',
              'sourcemark_type' => 'value_expansion',
              'status' => 'start'
            },
            {
              'counter' => 5,
              'element' => {
                'args' => [
                  {
                    'contents' => [
                      {
                        'text' => 'V'
                      }
                    ],
                    'type' => 'brace_container'
                  }
                ],
                'cmdname' => 'value'
              },
              'line' => '@value{V}',
              'sourcemark_type' => 'value_expansion',
              'status' => 'start'
            },
            {
              'counter' => 6,
              'element' => {
                'args' => [
                  {
                    'contents' => [
                      {
                        'text' => 'V'
                      }
                    ],
                    'type' => 'brace_container'
                  }
                ],
                'cmdname' => 'value'
              },
              'line' => '@value{V}',
              'sourcemark_type' => 'value_expansion',
              'status' => 'start'
            },
            {
              'counter' => 7,
              'element' => {
                'args' => [
                  {
                    'contents' => [
                      {
                        'text' => 'V'
                      }
                    ],
                    'type' => 'brace_container'
                  }
                ],
                'cmdname' => 'value'
              },
              'line' => '@value{V}',
              'sourcemark_type' => 'value_expansion',
              'status' => 'start'
            },
            {
              'counter' => 8,
              'element' => {
                'args' => [
                  {
                    'contents' => [
                      {
                        'text' => 'V'
                      }
                    ],
                    'type' => 'brace_container'
                  }
                ],
                'cmdname' => 'value'
              },
              'line' => '@value{V}',
              'sourcemark_type' => 'value_expansion',
              'status' => 'start'
            },
            {
              'counter' => 9,
              'element' => {
                'args' => [
                  {
                    'contents' => [
                      {
                        'text' => 'V'
                      }
                    ],
                    'type' => 'brace_container'
                  }
                ],
                'cmdname' => 'value'
              },
              'line' => '@value{V}',
              'sourcemark_type' => 'value_expansion',
              'status' => 'start'
            },
            {
              'counter' => 10,
              'element' => {
                'args' => [
                  {
                    'contents' => [
                      {
                        'text' => 'V'
                      }
                    ],
                    'type' => 'brace_container'
                  }
                ],
                'cmdname' => 'value'
              },
              'line' => '@value{V}',
              'sourcemark_type' => 'value_expansion',
              'status' => 'start'
            },
            {
              'counter' => 11,
              'element' => {
                'args' => [
                  {
                    'contents' => [
                      {
                        'text' => 'V'
                      }
                    ],
                    'type' => 'brace_container'
                  }
                ],
                'cmdname' => 'value'
              },
              'line' => '@value{V}',
              'sourcemark_type' => 'value_expansion',
              'status' => 'start'
            },
            {
              'counter' => 12,
              'element' => {
                'args' => [
                  {
                    'contents' => [
                      {
                        'text' => 'V'
                      }
                    ],
                    'type' => 'brace_container'
                  }
                ],
                'cmdname' => 'value'
              },
              'line' => '@value{V}',
              'sourcemark_type' => 'value_expansion',
              'status' => 'start'
            },
            {
              'counter' => 13,
              'element' => {
                'args' => [
                  {
                    'contents' => [
                      {
                        'text' => 'V'
                      }
                    ],
                    'type' => 'brace_container'
                  }
                ],
                'cmdname' => 'value'
              },
              'line' => '@value{V}',
              'sourcemark_type' => 'value_expansion',
              'status' => 'start'
            },
            {
              'counter' => 14,
              'element' => {
                'args' => [
                  {
                    'contents' => [
                      {
                        'text' => 'V'
                      }
                    ],
                    'type' => 'brace_container'
                  }
                ],
                'cmdname' => 'value'
              },
              'line' => '@value{V}',
              'sourcemark_type' => 'value_expansion',
              'status' => 'start'
            },
            {
              'counter' => 15,
              'element' => {
                'args' => [
                  {
                    'contents' => [
                      {
                        'text' => 'V'
                      }
                    ],
                    'type' => 'brace_container'
                  }
                ],
                'cmdname' => 'value'
              },
              'line' => '@value{V}',
              'sourcemark_type' => 'value_expansion',
              'status' => 'start'
            },
            {
              'counter' => 16,
              'element' => {
                'args' => [
                  {
                    'contents' => [
                      {
                        'text' => 'V'
                      }
                    ],
                    'type' => 'brace_container'
                  }
                ],
                'cmdname' => 'value'
              },
              'line' => '@value{V}',
              'sourcemark_type' => 'value_expansion',
              'status' => 'start'
            },
            {
              'counter' => 17,
              'element' => {
                'args' => [
                  {
                    'contents' => [
                      {
                        'text' => 'V'
                      }
                    ],
                    'type' => 'brace_container'
                  }
                ],
                'cmdname' => 'value'
              },
              'line' => '@value{V}',
              'sourcemark_type' => 'value_expansion',
              'status' => 'start'
            },
            {
              'counter' => 18,
              'element' => {
                'args' => [
                  {
                    'contents' => [
                      {
                        'text' => 'V'
                      }
                    ],
                    'type' => 'brace_container'
                  }
                ],
                'cmdname' => 'value'
              },
              'line' => '@value{V}',
              'sourcemark_type' => 'value_expansion',
              'status' => 'start'
            },
            {
              'counter' => 19,
              'element' => {
                'args' => [
                  {
                    'contents' => [
                      {
                        'text' => 'V'
                      }
                    ],
                    'type' => 'brace_container'
                  }
                ],
                'cmdname' => 'value'
              },
              'line' => '@value{V}',
              'sourcemark_type' => 'value_expansion',
              'status' => 'start'
            },
            {
              'counter' => 20,
              'element' => {
                'args' => [
                  {
                    'contents' => [
                      {
                        'text' => 'V'
                      }
                    ],
                    'type' => 'brace_container'
                  }
                ],
                'cmdname' => 'value'
              },
              'line' => '@value{V}',
              'sourcemark_type' => 'value_expansion',
              'status' => 'start'
            },
            {
              'counter' => 21,
              'element' => {
                'args' => [
                  {
                    'contents' => [
                      {
                        'text' => 'V'
                      }
                    ],
                    'type' => 'brace_container'
                  }
                ],
                'cmdname' => 'value'
              },
              'line' => '@value{V}',
              'sourcemark_type' => 'value_expansion',
              'status' => 'start'
            },
            {
              'counter' => 22,
              'element' => {
                'args' => [
                  {
                    'contents' => [
                      {
                        'text' => 'V'
                      }
                    ],
                    'type' => 'brace_container'
                  }
                ],
                'cmdname' => 'value'
              },
              'line' => '@value{V}',
              'sourcemark_type' => 'value_expansion',
              'status' => 'start'
            },
            {
              'counter' => 23,
              'element' => {
                'args' => [
                  {
                    'contents' => [
                      {
                        'text' => 'V'
                      }
                    ],
                    'type' => 'brace_container'
                  }
                ],
                'cmdname' => 'value'
              },
              'line' => '@value{V}',
              'sourcemark_type' => 'value_expansion',
              'status' => 'start'
            },
            {
              'counter' => 24,
              'element' => {
                'args' => [
                  {
                    'contents' => [
                      {
                        'text' => 'V'
                      }
                    ],
                    'type' => 'brace_container'
                  }
                ],
                'cmdname' => 'value'
              },
              'line' => '@value{V}',
              'sourcemark_type' => 'value_expansion',
              'status' => 'start'
            },
            {
              'counter' => 25,
              'element' => {
                'args' => [
                  {
                    'contents' => [
                      {
                        'text' => 'V'
                      }
                    ],
                    'type' => 'brace_container'
                  }
                ],
                'cmdname' => 'value'
              },
              'line' => '@value{V}',
              'sourcemark_type' => 'value_expansion',
              'status' => 'start'
            },
            {
              'counter' => 26,
              'element' => {
                'args' => [
                  {
                    'contents' => [
                      {
                        'text' => 'V'
                      }
                    ],
                    'type' => 'brace_container'
                  }
                ],
                'cmdname' => 'value'
              },
              'line' => '@value{V}',
              'sourcemark_type' => 'value_expansion',
              'status' => 'start'
            },
            {
              'counter' => 27,
              'element' => {
                'args' => [
                  {
                    'contents' => [
                      {
                        'text' => 'V'
                      }
                    ],
                    'type' => 'brace_container'
                  }
                ],
                'cmdname' => 'value'
              },
              'line' => '@value{V}',
              'sourcemark_type' => 'value_expansion',
              'status' => 'start'
            },
            {
              'counter' => 28,
              'element' => {
                'args' => [
                  {
                    'contents' => [
                      {
                        'text' => 'V'
                      }
                    ],
                    'type' => 'brace_container'
                  }
                ],
                'cmdname' => 'value'
              },
              'line' => '@value{V}',
              'sourcemark_type' => 'value_expansion',
              'status' => 'start'
            },
            {
              'counter' => 29,
              'element' => {
                'args' => [
                  {
                    'contents' => [
                      {
                        'text' => 'V'
                      }
                    ],
                    'type' => 'brace_container'
                  }
                ],
                'cmdname' => 'value'
              },
              'line' => '@value{V}',
              'sourcemark_type' => 'value_expansion',
              'status' => 'start'
            },
            {
              'counter' => 30,
              'element' => {
                'args' => [
                  {
                    'contents' => [
                      {
                        'text' => 'V'
                      }
                    ],
                    'type' => 'brace_container'
                  }
                ],
                'cmdname' => 'value'
              },
              'line' => '@value{V}',
              'sourcemark_type' => 'value_expansion',
              'status' => 'start'
            },
            {
              'counter' => 31,
              'element' => {
                'args' => [
                  {
                    'contents' => [
                      {
                        'text' => 'V'
                      }
                    ],
                    'type' => 'brace_container'
                  }
                ],
                'cmdname' => 'value'
              },
              'line' => '@value{V}',
              'sourcemark_type' => 'value_expansion',
              'status' => 'start'
            },
            {
              'counter' => 32,
              'element' => {
                'args' => [
                  {
                    'contents' => [
                      {
                        'text' => 'V'
                      }
                    ],
                    'type' => 'brace_container'
                  }
                ],
                'cmdname' => 'value'
              },
              'line' => '@value{V}',
              'sourcemark_type' => 'value_expansion',
              'status' => 'start'
            },
            {
              'counter' => 33,
              'element' => {
                'args' => [
                  {
                    'contents' => [
                      {
                        'text' => 'V'
                      }
                    ],
                    'type' => 'brace_container'
                  }
                ],
                'cmdname' => 'value'
              },
              'line' => '@value{V}',
              'sourcemark_type' => 'value_expansion',
              'status' => 'start'
            },
            {
              'counter' => 34,
              'element' => {
                'args' => [
                  {
                    'contents' => [
                      {
                        'text' => 'V'
                      }
                    ],
                    'type' => 'brace_container'
                  }
                ],
                'cmdname' => 'value'
              },
              'line' => '@value{V}',
              'sourcemark_type' => 'value_expansion',
              'status' => 'start'
            },
            {
              'counter' => 35,
              'element' => {
                'args' => [
                  {
                    'contents' => [
                      {
                        'text' => 'V'
                      }
                    ],
                    'type' => 'brace_container'
                  }
                ],
                'cmdname' => 'value'
              },
              'line' => '@value{V}',
              'sourcemark_type' => 'value_expansion',
              'status' => 'start'
            },
            {
              'counter' => 36,
              'element' => {
                'args' => [
                  {
                    'contents' => [
                      {
                        'text' => 'V'
                      }
                    ],
                    'type' => 'brace_container'
                  }
                ],
                'cmdname' => 'value'
              },
              'line' => '@value{V}',
              'sourcemark_type' => 'value_expansion',
              'status' => 'start'
            },
            {
              'counter' => 37,
              'element' => {
                'args' => [
                  {
                    'contents' => [
                      {
                        'text' => 'V'
                      }
                    ],
                    'type' => 'brace_container'
                  }
                ],
                'cmdname' => 'value'
              },
              'line' => '@value{V}',
              'sourcemark_type' => 'value_expansion',
              'status' => 'start'
            },
            {
              'counter' => 38,
              'element' => {
                'args' => [
                  {
                    'contents' => [
                      {
                        'text' => 'V'
                      }
                    ],
                    'type' => 'brace_container'
                  }
                ],
                'cmdname' => 'value'
              },
              'line' => '@value{V}',
              'sourcemark_type' => 'value_expansion',
              'status' => 'start'
            },
            {
              'counter' => 39,
              'element' => {
                'args' => [
                  {
                    'contents' => [
                      {
                        'text' => 'V'
                      }
                    ],
                    'type' => 'brace_container'
                  }
                ],
                'cmdname' => 'value'
              },
              'line' => '@value{V}',
              'sourcemark_type' => 'value_expansion',
              'status' => 'start'
            },
            {
              'counter' => 40,
              'element' => {
                'args' => [
                  {
                    'contents' => [
                      {
                        'text' => 'V'
                      }
                    ],
                    'type' => 'brace_container'
                  }
                ],
                'cmdname' => 'value'
              },
              'line' => '@value{V}',
              'sourcemark_type' => 'value_expansion',
              'status' => 'start'
            },
            {
              'counter' => 41,
              'element' => {
                'args' => [
                  {
                    'contents' => [
                      {
                        'text' => 'V'
                      }
                    ],
                    'type' => 'brace_container'
                  }
                ],
                'cmdname' => 'value'
              },
              'line' => '@value{V}',
              'sourcemark_type' => 'value_expansion',
              'status' => 'start'
            },
            {
              'counter' => 42,
              'element' => {
                'args' => [
                  {
                    'contents' => [
                      {
                        'text' => 'V'
                      }
                    ],
                    'type' => 'brace_container'
                  }
                ],
                'cmdname' => 'value'
              },
              'line' => '@value{V}',
              'sourcemark_type' => 'value_expansion',
              'status' => 'start'
            },
            {
              'counter' => 43,
              'element' => {
                'args' => [
                  {
                    'contents' => [
                      {
                        'text' => 'V'
                      }
                    ],
                    'type' => 'brace_container'
                  }
                ],
                'cmdname' => 'value'
              },
              'line' => '@value{V}',
              'sourcemark_type' => 'value_expansion',
              'status' => 'start'
            },
            {
              'counter' => 44,
              'element' => {
                'args' => [
                  {
                    'contents' => [
                      {
                        'text' => 'V'
                      }
                    ],
                    'type' => 'brace_container'
                  }
                ],
                'cmdname' => 'value'
              },
              'line' => '@value{V}',
              'sourcemark_type' => 'value_expansion',
              'status' => 'start'
            },
            {
              'counter' => 45,
              'element' => {
                'args' => [
                  {
                    'contents' => [
                      {
                        'text' => 'V'
                      }
                    ],
                    'type' => 'brace_container'
                  }
                ],
                'cmdname' => 'value'
              },
              'line' => '@value{V}',
              'sourcemark_type' => 'value_expansion',
              'status' => 'start'
            },
            {
              'counter' => 46,
              'element' => {
                'args' => [
                  {
                    'contents' => [
                      {
                        'text' => 'V'
                      }
                    ],
                    'type' => 'brace_container'
                  }
                ],
                'cmdname' => 'value'
              },
              'line' => '@value{V}',
              'sourcemark_type' => 'value_expansion',
              'status' => 'start'
            },
            {
              'counter' => 47,
              'element' => {
                'args' => [
                  {
                    'contents' => [
                      {
                        'text' => 'V'
                      }
                    ],
                    'type' => 'brace_container'
                  }
                ],
                'cmdname' => 'value'
              },
              'line' => '@value{V}',
              'sourcemark_type' => 'value_expansion',
              'status' => 'start'
            },
            {
              'counter' => 48,
              'element' => {
                'args' => [
                  {
                    'contents' => [
                      {
                        'text' => 'V'
                      }
                    ],
                    'type' => 'brace_container'
                  }
                ],
                'cmdname' => 'value'
              },
              'line' => '@value{V}',
              'sourcemark_type' => 'value_expansion',
              'status' => 'start'
            },
            {
              'counter' => 49,
              'element' => {
                'args' => [
                  {
                    'contents' => [
                      {
                        'text' => 'V'
                      }
                    ],
                    'type' => 'brace_container'
                  }
                ],
                'cmdname' => 'value'
              },
              'line' => '@value{V}',
              'sourcemark_type' => 'value_expansion',
              'status' => 'start'
            },
            {
              'counter' => 50,
              'element' => {
                'args' => [
                  {
                    'contents' => [
                      {
                        'text' => 'V'
                      }
                    ],
                    'type' => 'brace_container'
                  }
                ],
                'cmdname' => 'value'
              },
              'line' => '@value{V}',
              'sourcemark_type' => 'value_expansion',
              'status' => 'start'
            },
            {
              'counter' => 51,
              'element' => {
                'args' => [
                  {
                    'contents' => [
                      {
                        'text' => 'V'
                      }
                    ],
                    'type' => 'brace_container'
                  }
                ],
                'cmdname' => 'value'
              },
              'line' => '@value{V}',
              'sourcemark_type' => 'value_expansion',
              'status' => 'start'
            },
            {
              'counter' => 52,
              'element' => {
                'args' => [
                  {
                    'contents' => [
                      {
                        'text' => 'V'
                      }
                    ],
                    'type' => 'brace_container'
                  }
                ],
                'cmdname' => 'value'
              },
              'line' => '@value{V}',
              'sourcemark_type' => 'value_expansion',
              'status' => 'start'
            },
            {
              'counter' => 53,
              'element' => {
                'args' => [
                  {
                    'contents' => [
                      {
                        'text' => 'V'
                      }
                    ],
                    'type' => 'brace_container'
                  }
                ],
                'cmdname' => 'value'
              },
              'line' => '@value{V}',
              'sourcemark_type' => 'value_expansion',
              'status' => 'start'
            },
            {
              'counter' => 54,
              'element' => {
                'args' => [
                  {
                    'contents' => [
                      {
                        'text' => 'V'
                      }
                    ],
                    'type' => 'brace_container'
                  }
                ],
                'cmdname' => 'value'
              },
              'line' => '@value{V}',
              'sourcemark_type' => 'value_expansion',
              'status' => 'start'
            },
            {
              'counter' => 55,
              'element' => {
                'args' => [
                  {
                    'contents' => [
                      {
                        'text' => 'V'
                      }
                    ],
                    'type' => 'brace_container'
                  }
                ],
                'cmdname' => 'value'
              },
              'line' => '@value{V}',
              'sourcemark_type' => 'value_expansion',
              'status' => 'start'
            },
            {
              'counter' => 56,
              'element' => {
                'args' => [
                  {
                    'contents' => [
                      {
                        'text' => 'V'
                      }
                    ],
                    'type' => 'brace_container'
                  }
                ],
                'cmdname' => 'value'
              },
              'line' => '@value{V}',
              'sourcemark_type' => 'value_expansion',
              'status' => 'start'
            },
            {
              'counter' => 57,
              'element' => {
                'args' => [
                  {
                    'contents' => [
                      {
                        'text' => 'V'
                      }
                    ],
                    'type' => 'brace_container'
                  }
                ],
                'cmdname' => 'value'
              },
              'line' => '@value{V}',
              'sourcemark_type' => 'value_expansion',
              'status' => 'start'
            },
            {
              'counter' => 58,
              'element' => {
                'args' => [
                  {
                    'contents' => [
                      {
                        'text' => 'V'
                      }
                    ],
                    'type' => 'brace_container'
                  }
                ],
                'cmdname' => 'value'
              },
              'line' => '@value{V}',
              'sourcemark_type' => 'value_expansion',
              'status' => 'start'
            },
            {
              'counter' => 59,
              'element' => {
                'args' => [
                  {
                    'contents' => [
                      {
                        'text' => 'V'
                      }
                    ],
                    'type' => 'brace_container'
                  }
                ],
                'cmdname' => 'value'
              },
              'line' => '@value{V}',
              'sourcemark_type' => 'value_expansion',
              'status' => 'start'
            },
            {
              'counter' => 60,
              'element' => {
                'args' => [
                  {
                    'contents' => [
                      {
                        'text' => 'V'
                      }
                    ],
                    'type' => 'brace_container'
                  }
                ],
                'cmdname' => 'value'
              },
              'line' => '@value{V}',
              'sourcemark_type' => 'value_expansion',
              'status' => 'start'
            },
            {
              'counter' => 61,
              'element' => {
                'args' => [
                  {
                    'contents' => [
                      {
                        'text' => 'V'
                      }
                    ],
                    'type' => 'brace_container'
                  }
                ],
                'cmdname' => 'value'
              },
              'line' => '@value{V}',
              'sourcemark_type' => 'value_expansion',
              'status' => 'start'
            },
            {
              'counter' => 62,
              'element' => {
                'args' => [
                  {
                    'contents' => [
                      {
                        'text' => 'V'
                      }
                    ],
                    'type' => 'brace_container'
                  }
                ],
                'cmdname' => 'value'
              },
              'line' => '@value{V}',
              'sourcemark_type' => 'value_expansion',
              'status' => 'start'
            },
            {
              'counter' => 63,
              'element' => {
                'args' => [
                  {
                    'contents' => [
                      {
                        'text' => 'V'
                      }
                    ],
                    'type' => 'brace_container'
                  }
                ],
                'cmdname' => 'value'
              },
              'line' => '@value{V}',
              'sourcemark_type' => 'value_expansion',
              'status' => 'start'
            },
            {
              'counter' => 64,
              'element' => {
                'args' => [
                  {
                    'contents' => [
                      {
                        'text' => 'V'
                      }
                    ],
                    'type' => 'brace_container'
                  }
                ],
                'cmdname' => 'value'
              },
              'line' => '@value{V}',
              'sourcemark_type' => 'value_expansion',
              'status' => 'start'
            },
            {
              'counter' => 65,
              'element' => {
                'args' => [
                  {
                    'contents' => [
                      {
                        'text' => 'V'
                      }
                    ],
                    'type' => 'brace_container'
                  }
                ],
                'cmdname' => 'value'
              },
              'line' => '@value{V}',
              'sourcemark_type' => 'value_expansion',
              'status' => 'start'
            },
            {
              'counter' => 66,
              'element' => {
                'args' => [
                  {
                    'contents' => [
                      {
                        'text' => 'V'
                      }
                    ],
                    'type' => 'brace_container'
                  }
                ],
                'cmdname' => 'value'
              },
              'line' => '@value{V}',
              'sourcemark_type' => 'value_expansion',
              'status' => 'start'
            },
            {
              'counter' => 67,
              'element' => {
                'args' => [
                  {
                    'contents' => [
                      {
                        'text' => 'V'
                      }
                    ],
                    'type' => 'brace_container'
                  }
                ],
                'cmdname' => 'value'
              },
              'line' => '@value{V}',
              'sourcemark_type' => 'value_expansion',
              'status' => 'start'
            },
            {
              'counter' => 68,
              'element' => {
                'args' => [
                  {
                    'contents' => [
                      {
                        'text' => 'V'
                      }
                    ],
                    'type' => 'brace_container'
                  }
                ],
                'cmdname' => 'value'
              },
              'line' => '@value{V}',
              'sourcemark_type' => 'value_expansion',
              'status' => 'start'
            },
            {
              'counter' => 69,
              'element' => {
                'args' => [
                  {
                    'contents' => [
                      {
                        'text' => 'V'
                      }
                    ],
                    'type' => 'brace_container'
                  }
                ],
                'cmdname' => 'value'
              },
              'line' => '@value{V}',
              'sourcemark_type' => 'value_expansion',
              'status' => 'start'
            },
            {
              'counter' => 70,
              'element' => {
                'args' => [
                  {
                    'contents' => [
                      {
                        'text' => 'V'
                      }
                    ],
                    'type' => 'brace_container'
                  }
                ],
                'cmdname' => 'value'
              },
              'line' => '@value{V}',
              'sourcemark_type' => 'value_expansion',
              'status' => 'start'
            },
            {
              'counter' => 71,
              'element' => {
                'args' => [
                  {
                    'contents' => [
                      {
                        'text' => 'V'
                      }
                    ],
                    'type' => 'brace_container'
                  }
                ],
                'cmdname' => 'value'
              },
              'line' => '@value{V}',
              'sourcemark_type' => 'value_expansion',
              'status' => 'start'
            },
            {
              'counter' => 72,
              'element' => {
                'args' => [
                  {
                    'contents' => [
                      {
                        'text' => 'V'
                      }
                    ],
                    'type' => 'brace_container'
                  }
                ],
                'cmdname' => 'value'
              },
              'line' => '@value{V}',
              'sourcemark_type' => 'value_expansion',
              'status' => 'start'
            },
            {
              'counter' => 73,
              'element' => {
                'args' => [
                  {
                    'contents' => [
                      {
                        'text' => 'V'
                      }
                    ],
                    'type' => 'brace_container'
                  }
                ],
                'cmdname' => 'value'
              },
              'line' => '@value{V}',
              'sourcemark_type' => 'value_expansion',
              'status' => 'start'
            },
            {
              'counter' => 74,
              'element' => {
                'args' => [
                  {
                    'contents' => [
                      {
                        'text' => 'V'
                      }
                    ],
                    'type' => 'brace_container'
                  }
                ],
                'cmdname' => 'value'
              },
              'line' => '@value{V}',
              'sourcemark_type' => 'value_expansion',
              'status' => 'start'
            },
            {
              'counter' => 75,
              'element' => {
                'args' => [
                  {
                    'contents' => [
                      {
                        'text' => 'V'
                      }
                    ],
                    'type' => 'brace_container'
                  }
                ],
                'cmdname' => 'value'
              },
              'line' => '@value{V}',
              'sourcemark_type' => 'value_expansion',
              'status' => 'start'
            },
            {
              'counter' => 76,
              'element' => {
                'args' => [
                  {
                    'contents' => [
                      {
                        'text' => 'V'
                      }
                    ],
                    'type' => 'brace_container'
                  }
                ],
                'cmdname' => 'value'
              },
              'line' => '@value{V}',
              'sourcemark_type' => 'value_expansion',
              'status' => 'start'
            },
            {
              'counter' => 77,
              'element' => {
                'args' => [
                  {
                    'contents' => [
                      {
                        'text' => 'V'
                      }
                    ],
                    'type' => 'brace_container'
                  }
                ],
                'cmdname' => 'value'
              },
              'line' => '@value{V}',
              'sourcemark_type' => 'value_expansion',
              'status' => 'start'
            },
            {
              'counter' => 78,
              'element' => {
                'args' => [
                  {
                    'contents' => [
                      {
                        'text' => 'V'
                      }
                    ],
                    'type' => 'brace_container'
                  }
                ],
                'cmdname' => 'value'
              },
              'line' => '@value{V}',
              'sourcemark_type' => 'value_expansion',
              'status' => 'start'
            },
            {
              'counter' => 79,
              'element' => {
                'args' => [
                  {
                    'contents' => [
                      {
                        'text' => 'V'
                      }
                    ],
                    'type' => 'brace_container'
                  }
                ],
                'cmdname' => 'value'
              },
              'line' => '@value{V}',
              'sourcemark_type' => 'value_expansion',
              'status' => 'start'
            },
            {
              'counter' => 80,
              'element' => {
                'args' => [
                  {
                    'contents' => [
                      {
                        'text' => 'V'
                      }
                    ],
                    'type' => 'brace_container'
                  }
                ],
                'cmdname' => 'value'
              },
              'line' => '@value{V}',
              'sourcemark_type' => 'value_expansion',
              'status' => 'start'
            },
            {
              'counter' => 81,
              'element' => {
                'args' => [
                  {
                    'contents' => [
                      {
                        'text' => 'V'
                      }
                    ],
                    'type' => 'brace_container'
                  }
                ],
                'cmdname' => 'value'
              },
              'line' => '@value{V}',
              'sourcemark_type' => 'value_expansion',
              'status' => 'start'
            },
            {
              'counter' => 82,
              'element' => {
                'args' => [
                  {
                    'contents' => [
                      {
                        'text' => 'V'
                      }
                    ],
                    'type' => 'brace_container'
                  }
                ],
                'cmdname' => 'value'
              },
              'line' => '@value{V}',
              'sourcemark_type' => 'value_expansion',
              'status' => 'start'
            },
            {
              'counter' => 83,
              'element' => {
                'args' => [
                  {
                    'contents' => [
                      {
                        'text' => 'V'
                      }
                    ],
                    'type' => 'brace_container'
                  }
                ],
                'cmdname' => 'value'
              },
              'line' => '@value{V}',
              'sourcemark_type' => 'value_expansion',
              'status' => 'start'
            },
            {
              'counter' => 84,
              'element' => {
                'args' => [
                  {
                    'contents' => [
                      {
                        'text' => 'V'
                      }
                    ],
                    'type' => 'brace_container'
                  }
                ],
                'cmdname' => 'value'
              },
              'line' => '@value{V}',
              'sourcemark_type' => 'value_expansion',
              'status' => 'start'
            },
            {
              'counter' => 85,
              'element' => {
                'args' => [
                  {
                    'contents' => [
                      {
                        'text' => 'V'
                      }
                    ],
                    'type' => 'brace_container'
                  }
                ],
                'cmdname' => 'value'
              },
              'line' => '@value{V}',
              'sourcemark_type' => 'value_expansion',
              'status' => 'start'
            },
            {
              'counter' => 86,
              'element' => {
                'args' => [
                  {
                    'contents' => [
                      {
                        'text' => 'V'
                      }
                    ],
                    'type' => 'brace_container'
                  }
                ],
                'cmdname' => 'value'
              },
              'line' => '@value{V}',
              'sourcemark_type' => 'value_expansion',
              'status' => 'start'
            },
            {
              'counter' => 87,
              'element' => {
                'args' => [
                  {
                    'contents' => [
                      {
                        'text' => 'V'
                      }
                    ],
                    'type' => 'brace_container'
                  }
                ],
                'cmdname' => 'value'
              },
              'line' => '@value{V}',
              'sourcemark_type' => 'value_expansion',
              'status' => 'start'
            },
            {
              'counter' => 88,
              'element' => {
                'args' => [
                  {
                    'contents' => [
                      {
                        'text' => 'V'
                      }
                    ],
                    'type' => 'brace_container'
                  }
                ],
                'cmdname' => 'value'
              },
              'line' => '@value{V}',
              'sourcemark_type' => 'value_expansion',
              'status' => 'start'
            },
            {
              'counter' => 89,
              'element' => {
                'args' => [
                  {
                    'contents' => [
                      {
                        'text' => 'V'
                      }
                    ],
                    'type' => 'brace_container'
                  }
                ],
                'cmdname' => 'value'
              },
              'line' => '@value{V}',
              'sourcemark_type' => 'value_expansion',
              'status' => 'start'
            },
            {
              'counter' => 90,
              'element' => {
                'args' => [
                  {
                    'contents' => [
                      {
                        'text' => 'V'
                      }
                    ],
                    'type' => 'brace_container'
                  }
                ],
                'cmdname' => 'value'
              },
              'line' => '@value{V}',
              'sourcemark_type' => 'value_expansion',
              'status' => 'start'
            },
            {
              'counter' => 91,
              'element' => {
                'args' => [
                  {
                    'contents' => [
                      {
                        'text' => 'V'
                      }
                    ],
                    'type' => 'brace_container'
                  }
                ],
                'cmdname' => 'value'
              },
              'line' => '@value{V}',
              'sourcemark_type' => 'value_expansion',
              'status' => 'start'
            },
            {
              'counter' => 92,
              'element' => {
                'args' => [
                  {
                    'contents' => [
                      {
                        'text' => 'V'
                      }
                    ],
                    'type' => 'brace_container'
                  }
                ],
                'cmdname' => 'value'
              },
              'line' => '@value{V}',
              'sourcemark_type' => 'value_expansion',
              'status' => 'start'
            },
            {
              'counter' => 93,
              'element' => {
                'args' => [
                  {
                    'contents' => [
                      {
                        'text' => 'V'
                      }
                    ],
                    'type' => 'brace_container'
                  }
                ],
                'cmdname' => 'value'
              },
              'line' => '@value{V}',
              'sourcemark_type' => 'value_expansion',
              'status' => 'start'
            },
            {
              'counter' => 94,
              'element' => {
                'args' => [
                  {
                    'contents' => [
                      {
                        'text' => 'V'
                      }
                    ],
                    'type' => 'brace_container'
                  }
                ],
                'cmdname' => 'value'
              },
              'line' => '@value{V}',
              'sourcemark_type' => 'value_expansion',
              'status' => 'start'
            },
            {
              'counter' => 95,
              'element' => {
                'args' => [
                  {
                    'contents' => [
                      {
                        'text' => 'V'
                      }
                    ],
                    'type' => 'brace_container'
                  }
                ],
                'cmdname' => 'value'
              },
              'line' => '@value{V}',
              'sourcemark_type' => 'value_expansion',
              'status' => 'start'
            },
            {
              'counter' => 96,
              'element' => {
                'args' => [
                  {
                    'contents' => [
                      {
                        'text' => 'V'
                      }
                    ],
                    'type' => 'brace_container'
                  }
                ],
                'cmdname' => 'value'
              },
              'line' => '@value{V}',
              'sourcemark_type' => 'value_expansion',
              'status' => 'start'
            },
            {
              'counter' => 97,
              'element' => {
                'args' => [
                  {
                    'contents' => [
                      {
                        'text' => 'V'
                      }
                    ],
                    'type' => 'brace_container'
                  }
                ],
                'cmdname' => 'value'
              },
              'line' => '@value{V}',
              'sourcemark_type' => 'value_expansion',
              'status' => 'start'
            },
            {
              'counter' => 98,
              'element' => {
                'args' => [
                  {
                    'contents' => [
                      {
                        'text' => 'V'
                      }
                    ],
                    'type' => 'brace_container'
                  }
                ],
                'cmdname' => 'value'
              },
              'line' => '@value{V}',
              'sourcemark_type' => 'value_expansion',
              'status' => 'start'
            },
            {
              'counter' => 99,
              'element' => {
                'args' => [
                  {
                    'contents' => [
                      {
                        'text' => 'V'
                      }
                    ],
                    'type' => 'brace_container'
                  }
                ],
                'cmdname' => 'value'
              },
              'line' => '@value{V}',
              'sourcemark_type' => 'value_expansion',
              'status' => 'start'
            },
            {
              'counter' => 100,
              'element' => {
                'args' => [
                  {
                    'contents' => [
                      {
                        'text' => 'V'
                      }
                    ],
                    'type' => 'brace_container'
                  }
                ],
                'cmdname' => 'value'
              },
              'line' => '@value{V}',
              'sourcemark_type' => 'value_expansion',
              'status' => 'start'
            },
            {
              'counter' => 100,
              'sourcemark_type' => 'value_expansion',
              'status' => 'end'
            },
            {
              'counter' => 99,
              'sourcemark_type' => 'value_expansion',
              'status' => 'end'
            },
            {
              'counter' => 98,
              'sourcemark_type' => 'value_expansion',
              'status' => 'end'
            },
            {
              'counter' => 97,
              'sourcemark_type' => 'value_expansion',
              'status' => 'end'
            },
            {
              'counter' => 96,
              'sourcemark_type' => 'value_expansion',
              'status' => 'end'
            },
            {
              'counter' => 95,
              'sourcemark_type' => 'value_expansion',
              'status' => 'end'
            },
            {
              'counter' => 94,
              'sourcemark_type' => 'value_expansion',
              'status' => 'end'
            },
            {
              'counter' => 93,
              'sourcemark_type' => 'value_expansion',
              'status' => 'end'
            },
            {
              'counter' => 92,
              'sourcemark_type' => 'value_expansion',
              'status' => 'end'
            },
            {
              'counter' => 91,
              'sourcemark_type' => 'value_expansion',
              'status' => 'end'
            },
            {
              'counter' => 90,
              'sourcemark_type' => 'value_expansion',
              'status' => 'end'
            },
            {
              'counter' => 89,
              'sourcemark_type' => 'value_expansion',
              'status' => 'end'
            },
            {
              'counter' => 88,
              'sourcemark_type' => 'value_expansion',
              'status' => 'end'
            },
            {
              'counter' => 87,
              'sourcemark_type' => 'value_expansion',
              'status' => 'end'
            },
            {
              'counter' => 86,
              'sourcemark_type' => 'value_expansion',
              'status' => 'end'
            },
            {
              'counter' => 85,
              'sourcemark_type' => 'value_expansion',
              'status' => 'end'
            },
            {
              'counter' => 84,
              'sourcemark_type' => 'value_expansion',
              'status' => 'end'
            },
            {
              'counter' => 83,
              'sourcemark_type' => 'value_expansion',
              'status' => 'end'
            },
            {
              'counter' => 82,
              'sourcemark_type' => 'value_expansion',
              'status' => 'end'
            },
            {
              'counter' => 81,
              'sourcemark_type' => 'value_expansion',
              'status' => 'end'
            },
            {
              'counter' => 80,
              'sourcemark_type' => 'value_expansion',
              'status' => 'end'
            },
            {
              'counter' => 79,
              'sourcemark_type' => 'value_expansion',
              'status' => 'end'
            },
            {
              'counter' => 78,
              'sourcemark_type' => 'value_expansion',
              'status' => 'end'
            },
            {
              'counter' => 77,
              'sourcemark_type' => 'value_expansion',
              'status' => 'end'
            },
            {
              'counter' => 76,
              'sourcemark_type' => 'value_expansion',
              'status' => 'end'
            },
            {
              'counter' => 75,
              'sourcemark_type' => 'value_expansion',
              'status' => 'end'
            },
            {
              'counter' => 74,
              'sourcemark_type' => 'value_expansion',
              'status' => 'end'
            },
            {
              'counter' => 73,
              'sourcemark_type' => 'value_expansion',
              'status' => 'end'
            },
            {
              'counter' => 72,
              'sourcemark_type' => 'value_expansion',
              'status' => 'end'
            },
            {
              'counter' => 71,
              'sourcemark_type' => 'value_expansion',
              'status' => 'end'
            },
            {
              'counter' => 70,
              'sourcemark_type' => 'value_expansion',
              'status' => 'end'
            },
            {
              'counter' => 69,
              'sourcemark_type' => 'value_expansion',
              'status' => 'end'
            },
            {
              'counter' => 68,
              'sourcemark_type' => 'value_expansion',
              'status' => 'end'
            },
            {
              'counter' => 67,
              'sourcemark_type' => 'value_expansion',
              'status' => 'end'
            },
            {
              'counter' => 66,
              'sourcemark_type' => 'value_expansion',
              'status' => 'end'
            },
            {
              'counter' => 65,
              'sourcemark_type' => 'value_expansion',
              'status' => 'end'
            },
            {
              'counter' => 64,
              'sourcemark_type' => 'value_expansion',
              'status' => 'end'
            },
            {
              'counter' => 63,
              'sourcemark_type' => 'value_expansion',
              'status' => 'end'
            },
            {
              'counter' => 62,
              'sourcemark_type' => 'value_expansion',
              'status' => 'end'
            },
            {
              'counter' => 61,
              'sourcemark_type' => 'value_expansion',
              'status' => 'end'
            },
            {
              'counter' => 60,
              'sourcemark_type' => 'value_expansion',
              'status' => 'end'
            },
            {
              'counter' => 59,
              'sourcemark_type' => 'value_expansion',
              'status' => 'end'
            },
            {
              'counter' => 58,
              'sourcemark_type' => 'value_expansion',
              'status' => 'end'
            },
            {
              'counter' => 57,
              'sourcemark_type' => 'value_expansion',
              'status' => 'end'
            },
            {
              'counter' => 56,
              'sourcemark_type' => 'value_expansion',
              'status' => 'end'
            },
            {
              'counter' => 55,
              'sourcemark_type' => 'value_expansion',
              'status' => 'end'
            },
            {
              'counter' => 54,
              'sourcemark_type' => 'value_expansion',
              'status' => 'end'
            },
            {
              'counter' => 53,
              'sourcemark_type' => 'value_expansion',
              'status' => 'end'
            },
            {
              'counter' => 52,
              'sourcemark_type' => 'value_expansion',
              'status' => 'end'
            },
            {
              'counter' => 51,
              'sourcemark_type' => 'value_expansion',
              'status' => 'end'
            },
            {
              'counter' => 50,
              'sourcemark_type' => 'value_expansion',
              'status' => 'end'
            },
            {
              'counter' => 49,
              'sourcemark_type' => 'value_expansion',
              'status' => 'end'
            },
            {
              'counter' => 48,
              'sourcemark_type' => 'value_expansion',
              'status' => 'end'
            },
            {
              'counter' => 47,
              'sourcemark_type' => 'value_expansion',
              'status' => 'end'
            },
            {
              'counter' => 46,
              'sourcemark_type' => 'value_expansion',
              'status' => 'end'
            },
            {
              'counter' => 45,
              'sourcemark_type' => 'value_expansion',
              'status' => 'end'
            },
            {
              'counter' => 44,
              'sourcemark_type' => 'value_expansion',
              'status' => 'end'
            },
            {
              'counter' => 43,
              'sourcemark_type' => 'value_expansion',
              'status' => 'end'
            },
            {
              'counter' => 42,
              'sourcemark_type' => 'value_expansion',
              'status' => 'end'
            },
            {
              'counter' => 41,
              'sourcemark_type' => 'value_expansion',
              'status' => 'end'
            },
            {
              'counter' => 40,
              'sourcemark_type' => 'value_expansion',
              'status' => 'end'
            },
            {
              'counter' => 39,
              'sourcemark_type' => 'value_expansion',
              'status' => 'end'
            },
            {
              'counter' => 38,
              'sourcemark_type' => 'value_expansion',
              'status' => 'end'
            },
            {
              'counter' => 37,
              'sourcemark_type' => 'value_expansion',
              'status' => 'end'
            },
            {
              'counter' => 36,
              'sourcemark_type' => 'value_expansion',
              'status' => 'end'
            },
            {
              'counter' => 35,
              'sourcemark_type' => 'value_expansion',
              'status' => 'end'
            },
            {
              'counter' => 34,
              'sourcemark_type' => 'value_expansion',
              'status' => 'end'
            },
            {
              'counter' => 33,
              'sourcemark_type' => 'value_expansion',
              'status' => 'end'
            },
            {
              'counter' => 32,
              'sourcemark_type' => 'value_expansion',
              'status' => 'end'
            },
            {
              'counter' => 31,
              'sourcemark_type' => 'value_expansion',
              'status' => 'end'
            },
            {
              'counter' => 30,
              'sourcemark_type' => 'value_expansion',
              'status' => 'end'
            },
            {
              'counter' => 29,
              'sourcemark_type' => 'value_expansion',
              'status' => 'end'
            },
            {
              'counter' => 28,
              'sourcemark_type' => 'value_expansion',
              'status' => 'end'
            },
            {
              'counter' => 27,
              'sourcemark_type' => 'value_expansion',
              'status' => 'end'
            },
            {
              'counter' => 26,
              'sourcemark_type' => 'value_expansion',
              'status' => 'end'
            },
            {
              'counter' => 25,
              'sourcemark_type' => 'value_expansion',
              'status' => 'end'
            },
            {
              'counter' => 24,
              'sourcemark_type' => 'value_expansion',
              'status' => 'end'
            },
            {
              'counter' => 23,
              'sourcemark_type' => 'value_expansion',
              'status' => 'end'
            },
            {
              'counter' => 22,
              'sourcemark_type' => 'value_expansion',
              'status' => 'end'
            },
            {
              'counter' => 21,
              'sourcemark_type' => 'value_expansion',
              'status' => 'end'
            },
            {
              'counter' => 20,
              'sourcemark_type' => 'value_expansion',
              'status' => 'end'
            },
            {
              'counter' => 19,
              'sourcemark_type' => 'value_expansion',
              'status' => 'end'
            },
            {
              'counter' => 18,
              'sourcemark_type' => 'value_expansion',
              'status' => 'end'
            },
            {
              'counter' => 17,
              'sourcemark_type' => 'value_expansion',
              'status' => 'end'
            },
            {
              'counter' => 16,
              'sourcemark_type' => 'value_expansion',
              'status' => 'end'
            },
            {
              'counter' => 15,
              'sourcemark_type' => 'value_expansion',
              'status' => 'end'
            },
            {
              'counter' => 14,
              'sourcemark_type' => 'value_expansion',
              'status' => 'end'
            },
            {
              'counter' => 13,
              'sourcemark_type' => 'value_expansion',
              'status' => 'end'
            },
            {
              'counter' => 12,
              'sourcemark_type' => 'value_expansion',
              'status' => 'end'
            },
            {
              'counter' => 11,
              'sourcemark_type' => 'value_expansion',
              'status' => 'end'
            },
            {
              'counter' => 10,
              'sourcemark_type' => 'value_expansion',
              'status' => 'end'
            },
            {
              'counter' => 9,
              'sourcemark_type' => 'value_expansion',
              'status' => 'end'
            },
            {
              'counter' => 8,
              'sourcemark_type' => 'value_expansion',
              'status' => 'end'
            },
            {
              'counter' => 7,
              'sourcemark_type' => 'value_expansion',
              'status' => 'end'
            },
            {
              'counter' => 6,
              'sourcemark_type' => 'value_expansion',
              'status' => 'end'
            },
            {
              'counter' => 5,
              'sourcemark_type' => 'value_expansion',
              'status' => 'end'
            },
            {
              'counter' => 4,
              'sourcemark_type' => 'value_expansion',
              'status' => 'end'
            },
            {
              'counter' => 3,
              'sourcemark_type' => 'value_expansion',
              'status' => 'end'
            },
            {
              'counter' => 2,
              'sourcemark_type' => 'value_expansion',
              'status' => 'end'
            },
            {
              'counter' => 1,
              'sourcemark_type' => 'value_expansion',
              'status' => 'end'
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

$result_texis{'recursive_expansion_in_set'} = '@set V @value{V}

';


$result_texts{'recursive_expansion_in_set'} = '
';

$result_errors{'recursive_expansion_in_set'} = [
  {
    'error_line' => 'warning: value call nested too deeply (set MAX_MACRO_CALL_NESTING to override; current value 100)
',
    'line_nr' => 2,
    'text' => 'value call nested too deeply (set MAX_MACRO_CALL_NESTING to override; current value 100)',
    'type' => 'warning'
  }
];


$result_floats{'recursive_expansion_in_set'} = {};


1;
