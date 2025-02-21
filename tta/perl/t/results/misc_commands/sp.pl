use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'sp'} = {
  'contents' => [
    {
      'contents' => [
        {
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'contents' => [
            {
              'text' => 'Text line followed on the same line and another below '
            }
          ],
          'type' => 'paragraph'
        },
        {
          'cmdname' => 'sp',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => '1'
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
            'misc_args' => [
              '1'
            ]
          },
          'info' => {
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'line_nr' => 2
          }
        },
        {
          'cmdname' => 'sp',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => '2'
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
            'misc_args' => [
              '2'
            ]
          },
          'info' => {
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'line_nr' => 3
          }
        },
        {
          'contents' => [
            {
              'text' => 'Text line after the sp followed by a sp '
            }
          ],
          'type' => 'paragraph'
        },
        {
          'cmdname' => 'sp',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => '1'
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
            'misc_args' => [
              '1'
            ]
          },
          'info' => {
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'line_nr' => 4
          }
        },
        {
          'contents' => [
            {
              'source_marks' => [
                {
                  'counter' => 1,
                  'element' => {
                    'cmdname' => 'ifnottex',
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
                      }
                    ],
                    'source_info' => {
                      'line_nr' => 6
                    }
                  },
                  'position' => 50,
                  'sourcemark_type' => 'expanded_conditional_command',
                  'status' => 'start'
                }
              ],
              'text' => 'Text line after the text line followed by the sp.
'
            }
          ],
          'type' => 'paragraph'
        },
        {
          'cmdname' => 'sp',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => '2 a number after sp'
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
            'line_nr' => 7
          },
          'source_marks' => [
            {
              'counter' => 1,
              'element' => {
                'cmdname' => 'end',
                'contents' => [
                  {
                    'contents' => [
                      {
                        'text' => 'ifnottex'
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
                  'text_arg' => 'ifnottex'
                },
                'info' => {
                  'spaces_before_argument' => {
                    'text' => ' '
                  }
                },
                'source_info' => {
                  'line_nr' => 8
                }
              },
              'sourcemark_type' => 'expanded_conditional_command',
              'status' => 'end'
            }
          ]
        }
      ],
      'type' => 'before_node_section'
    }
  ],
  'type' => 'document_root'
};

$result_texis{'sp'} = '
Text line followed on the same line and another below @sp 1
@sp 2
Text line after the sp followed by a sp @sp 1
Text line after the text line followed by the sp.
@sp 2 a number after sp
';


$result_texts{'sp'} = '
Text line followed on the same line and another below 


Text line after the sp followed by a sp 
Text line after the text line followed by the sp.
';

$result_errors{'sp'} = [
  {
    'error_line' => 'warning: @sp should only appear at the beginning of a line
',
    'line_nr' => 2,
    'text' => '@sp should only appear at the beginning of a line',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: @sp should only appear at the beginning of a line
',
    'line_nr' => 4,
    'text' => '@sp should only appear at the beginning of a line',
    'type' => 'warning'
  },
  {
    'error_line' => '@sp arg must be numeric, not `2 a number after sp\'
',
    'line_nr' => 7,
    'text' => '@sp arg must be numeric, not `2 a number after sp\'',
    'type' => 'error'
  }
];


$result_floats{'sp'} = {};


1;
