use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'line_end_accent_command_macro_call'} = {
  'contents' => [
    {
      'contents' => [
        {
          'cmdname' => 'macro',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => ' expand {}
',
                  'type' => 'macro_line'
                }
              ],
              'type' => 'arguments_line'
            },
            {
              'text' => '@center A @ringaccent 
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
            'macro_name' => 'expand',
            'misc_args' => []
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
                    'type' => 'brace_arg'
                  }
                ],
                'info' => {
                  'command_name' => 'expand'
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
              'contents' => [
                {
                  'text' => 'A '
                },
                {
                  'cmdname' => 'ringaccent',
                  'info' => {
                    'spaces_after_cmd_before_arg' => {
                      'source_marks' => [
                        {
                          'counter' => 1,
                          'position' => 1,
                          'sourcemark_type' => 'macro_expansion',
                          'status' => 'end'
                        }
                      ],
                      'text' => ' '
                    }
                  },
                  'source_info' => {
                    'line_nr' => 5,
                    'macro' => 'expand'
                  }
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
          'info' => {
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'line_nr' => 5,
            'macro' => 'expand'
          }
        },
        {
          'text' => ' ',
          'type' => 'spaces_before_paragraph'
        },
        {
          'contents' => [
            {
              'text' => 'a
'
            }
          ],
          'type' => 'paragraph'
        },
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
                  'text' => ' nospace {}
',
                  'type' => 'macro_line'
                }
              ],
              'type' => 'arguments_line'
            },
            {
              'text' => '@center B @ringaccent
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
                'line_nr' => 10
              }
            }
          ],
          'extra' => {
            'macro_name' => 'nospace',
            'misc_args' => []
          },
          'source_info' => {
            'line_nr' => 8
          }
        },
        {
          'source_marks' => [
            {
              'counter' => 2,
              'element' => {
                'contents' => [
                  {
                    'type' => 'brace_arg'
                  }
                ],
                'info' => {
                  'command_name' => 'nospace'
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
              'contents' => [
                {
                  'text' => 'B '
                },
                {
                  'cmdname' => 'ringaccent',
                  'info' => {
                    'spaces_after_cmd_before_arg' => {
                      'source_marks' => [
                        {
                          'counter' => 2,
                          'sourcemark_type' => 'macro_expansion',
                          'status' => 'end'
                        }
                      ],
                      'text' => ''
                    }
                  },
                  'source_info' => {
                    'line_nr' => 12,
                    'macro' => 'nospace'
                  }
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
          'info' => {
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'line_nr' => 12,
            'macro' => 'nospace'
          }
        },
        {
          'text' => ' ',
          'type' => 'spaces_before_paragraph'
        },
        {
          'contents' => [
            {
              'text' => 'A
'
            }
          ],
          'type' => 'paragraph'
        },
        {
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

$result_texis{'line_end_accent_command_macro_call'} = '@macro expand {}
@center A @ringaccent 
@end macro

@center A @ringaccent 
 a

@macro nospace {}
@center B @ringaccent
@end macro

@center B @ringaccent
 A

';


$result_texts{'line_end_accent_command_macro_call'} = '
A *
a


B *
A

';

$result_errors{'line_end_accent_command_macro_call'} = [
  {
    'error_line' => 'warning: command `@ringaccent\' must not be followed by new line
',
    'line_nr' => 5,
    'text' => 'command `@ringaccent\' must not be followed by new line',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: command `@ringaccent\' must not be followed by new line
',
    'line_nr' => 12,
    'text' => 'command `@ringaccent\' must not be followed by new line',
    'type' => 'warning'
  }
];


$result_floats{'line_end_accent_command_macro_call'} = {};


1;
