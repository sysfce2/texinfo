use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'displaymath'} = {
  'contents' => [
    {
      'contents' => [
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'Simple
'
            }
          ],
          'parent' => {},
          'type' => 'paragraph'
        },
        {
          'args' => [
            {
              'contents' => [],
              'extra' => {
                'spaces_after_argument' => '
'
              },
              'parent' => {},
              'type' => 'block_line_arg'
            }
          ],
          'cmdname' => 'displaymath',
          'contents' => [
            {
              'parent' => {},
              'text' => '--'
            },
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'x^i'
                }
              ],
              'parent' => {},
              'source_info' => {
                'file_name' => '',
                'line_nr' => 3,
                'macro' => ''
              },
              'type' => 'bracketed'
            },
            {
              'parent' => {},
              'text' => '\\over'
            },
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => '\\tan y'
                }
              ],
              'parent' => {},
              'source_info' => {
                'file_name' => '',
                'line_nr' => 3,
                'macro' => ''
              },
              'type' => 'bracketed'
            },
            {
              'parent' => {},
              'text' => '
'
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'displaymath'
                    }
                  ],
                  'extra' => {
                    'spaces_after_argument' => '
'
                  },
                  'parent' => {},
                  'type' => 'line_arg'
                }
              ],
              'cmdname' => 'end',
              'extra' => {
                'command_argument' => 'displaymath',
                'spaces_before_argument' => ' ',
                'text_arg' => 'displaymath'
              },
              'parent' => {},
              'source_info' => {
                'file_name' => '',
                'line_nr' => 4,
                'macro' => ''
              }
            }
          ],
          'extra' => {
            'end_command' => {}
          },
          'parent' => {},
          'source_info' => {
            'file_name' => '',
            'line_nr' => 2,
            'macro' => ''
          }
        },
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'Math with '
            },
            {
              'cmdname' => '@',
              'parent' => {}
            },
            {
              'parent' => {},
              'text' => '-command
'
            }
          ],
          'parent' => {},
          'type' => 'paragraph'
        },
        {
          'args' => [
            {
              'contents' => [],
              'extra' => {
                'spaces_after_argument' => '
'
              },
              'parent' => {},
              'type' => 'block_line_arg'
            }
          ],
          'cmdname' => 'displaymath',
          'contents' => [
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'math code'
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                }
              ],
              'cmdname' => 'code',
              'contents' => [],
              'parent' => {},
              'source_info' => {
                'file_name' => '',
                'line_nr' => 8,
                'macro' => ''
              }
            },
            {
              'parent' => {},
              'text' => ' a < b \\sum'
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'i'
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                }
              ],
              'cmdname' => 'sub',
              'contents' => [],
              'parent' => {},
              'source_info' => {
                'file_name' => '',
                'line_nr' => 8,
                'macro' => ''
              }
            },
            {
              'parent' => {},
              'text' => ' q'
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => '2'
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                }
              ],
              'cmdname' => 'sup',
              'contents' => [],
              'parent' => {},
              'source_info' => {
                'file_name' => '',
                'line_nr' => 8,
                'macro' => ''
              }
            },
            {
              'parent' => {},
              'text' => '
'
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'displaymath'
                    }
                  ],
                  'extra' => {
                    'spaces_after_argument' => '
'
                  },
                  'parent' => {},
                  'type' => 'line_arg'
                }
              ],
              'cmdname' => 'end',
              'extra' => {
                'command_argument' => 'displaymath',
                'spaces_before_argument' => ' ',
                'text_arg' => 'displaymath'
              },
              'parent' => {},
              'source_info' => {
                'file_name' => '',
                'line_nr' => 9,
                'macro' => ''
              }
            }
          ],
          'extra' => {
            'end_command' => {}
          },
          'parent' => {},
          'source_info' => {
            'file_name' => '',
            'line_nr' => 7,
            'macro' => ''
          }
        },
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'Complex
'
            }
          ],
          'parent' => {},
          'type' => 'paragraph'
        },
        {
          'args' => [
            {
              'contents' => [],
              'extra' => {
                'spaces_after_argument' => '
'
              },
              'parent' => {},
              'type' => 'block_line_arg'
            }
          ],
          'cmdname' => 'displaymath',
          'contents' => [
            {
              'parent' => {},
              'text' => ' \\underline'
            },
            {
              'contents' => [
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'math \\hbox'
                        },
                        {
                          'contents' => [
                            {
                              'parent' => {},
                              'text' => ' code '
                            }
                          ],
                          'parent' => {},
                          'source_info' => {
                            'file_name' => '',
                            'line_nr' => 13,
                            'macro' => ''
                          },
                          'type' => 'bracketed'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'code',
                  'contents' => [],
                  'parent' => {},
                  'source_info' => {
                    'file_name' => '',
                    'line_nr' => 13,
                    'macro' => ''
                  }
                }
              ],
              'parent' => {},
              'source_info' => {
                'file_name' => '',
                'line_nr' => 13,
                'macro' => ''
              },
              'type' => 'bracketed'
            },
            {
              'parent' => {},
              'text' => ' '
            },
            {
              'cmdname' => '\\',
              'parent' => {}
            },
            {
              'parent' => {},
              'text' => 'i \\sum_'
            },
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'i'
                }
              ],
              'parent' => {},
              'source_info' => {
                'file_name' => '',
                'line_nr' => 13,
                'macro' => ''
              },
              'type' => 'bracketed'
            },
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => '\\underline'
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'f'
                    }
                  ],
                  'parent' => {},
                  'source_info' => {
                    'file_name' => '',
                    'line_nr' => 13,
                    'macro' => ''
                  },
                  'type' => 'bracketed'
                }
              ],
              'parent' => {},
              'source_info' => {
                'file_name' => '',
                'line_nr' => 13,
                'macro' => ''
              },
              'type' => 'bracketed'
            },
            {
              'parent' => {},
              'text' => '
'
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'displaymath'
                    }
                  ],
                  'extra' => {
                    'spaces_after_argument' => '
'
                  },
                  'parent' => {},
                  'type' => 'line_arg'
                }
              ],
              'cmdname' => 'end',
              'extra' => {
                'command_argument' => 'displaymath',
                'spaces_before_argument' => ' ',
                'text_arg' => 'displaymath'
              },
              'parent' => {},
              'source_info' => {
                'file_name' => '',
                'line_nr' => 14,
                'macro' => ''
              }
            }
          ],
          'extra' => {
            'end_command' => {}
          },
          'parent' => {},
          'source_info' => {
            'file_name' => '',
            'line_nr' => 12,
            'macro' => ''
          }
        },
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'With a comment
'
            }
          ],
          'parent' => {},
          'type' => 'paragraph'
        },
        {
          'args' => [
            {
              'contents' => [],
              'extra' => {
                'spaces_after_argument' => '
'
              },
              'parent' => {},
              'type' => 'block_line_arg'
            }
          ],
          'cmdname' => 'displaymath',
          'contents' => [
            {
              'args' => [
                {
                  'parent' => {},
                  'text' => ' comment in displaymath
',
                  'type' => 'misc_arg'
                }
              ],
              'cmdname' => 'c',
              'extra' => {
                'misc_args' => [
                  ' comment in displaymath
'
                ]
              },
              'parent' => {}
            },
            {
              'parent' => {},
              'text' => 'a/2
'
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'displaymath'
                    }
                  ],
                  'extra' => {
                    'spaces_after_argument' => '
'
                  },
                  'parent' => {},
                  'type' => 'line_arg'
                }
              ],
              'cmdname' => 'end',
              'extra' => {
                'command_argument' => 'displaymath',
                'spaces_before_argument' => ' ',
                'text_arg' => 'displaymath'
              },
              'parent' => {},
              'source_info' => {
                'file_name' => '',
                'line_nr' => 20,
                'macro' => ''
              }
            }
          ],
          'extra' => {
            'end_command' => {}
          },
          'parent' => {},
          'source_info' => {
            'file_name' => '',
            'line_nr' => 17,
            'macro' => ''
          }
        }
      ],
      'parent' => {},
      'type' => 'before_node_section'
    }
  ],
  'type' => 'document_root'
};
$result_trees{'displaymath'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'displaymath'}{'contents'}[0]{'contents'}[0];
$result_trees{'displaymath'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'displaymath'}{'contents'}[0];
$result_trees{'displaymath'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'displaymath'}{'contents'}[0]{'contents'}[1];
$result_trees{'displaymath'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'displaymath'}{'contents'}[0]{'contents'}[1];
$result_trees{'displaymath'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'displaymath'}{'contents'}[0]{'contents'}[1]{'contents'}[1];
$result_trees{'displaymath'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'displaymath'}{'contents'}[0]{'contents'}[1];
$result_trees{'displaymath'}{'contents'}[0]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'displaymath'}{'contents'}[0]{'contents'}[1];
$result_trees{'displaymath'}{'contents'}[0]{'contents'}[1]{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'displaymath'}{'contents'}[0]{'contents'}[1]{'contents'}[3];
$result_trees{'displaymath'}{'contents'}[0]{'contents'}[1]{'contents'}[3]{'parent'} = $result_trees{'displaymath'}{'contents'}[0]{'contents'}[1];
$result_trees{'displaymath'}{'contents'}[0]{'contents'}[1]{'contents'}[4]{'parent'} = $result_trees{'displaymath'}{'contents'}[0]{'contents'}[1];
$result_trees{'displaymath'}{'contents'}[0]{'contents'}[1]{'contents'}[5]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'displaymath'}{'contents'}[0]{'contents'}[1]{'contents'}[5]{'args'}[0];
$result_trees{'displaymath'}{'contents'}[0]{'contents'}[1]{'contents'}[5]{'args'}[0]{'parent'} = $result_trees{'displaymath'}{'contents'}[0]{'contents'}[1]{'contents'}[5];
$result_trees{'displaymath'}{'contents'}[0]{'contents'}[1]{'contents'}[5]{'parent'} = $result_trees{'displaymath'}{'contents'}[0]{'contents'}[1];
$result_trees{'displaymath'}{'contents'}[0]{'contents'}[1]{'extra'}{'end_command'} = $result_trees{'displaymath'}{'contents'}[0]{'contents'}[1]{'contents'}[5];
$result_trees{'displaymath'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'displaymath'}{'contents'}[0];
$result_trees{'displaymath'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'displaymath'}{'contents'}[0];
$result_trees{'displaymath'}{'contents'}[0]{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'displaymath'}{'contents'}[0]{'contents'}[3];
$result_trees{'displaymath'}{'contents'}[0]{'contents'}[3]{'contents'}[1]{'parent'} = $result_trees{'displaymath'}{'contents'}[0]{'contents'}[3];
$result_trees{'displaymath'}{'contents'}[0]{'contents'}[3]{'contents'}[2]{'parent'} = $result_trees{'displaymath'}{'contents'}[0]{'contents'}[3];
$result_trees{'displaymath'}{'contents'}[0]{'contents'}[3]{'parent'} = $result_trees{'displaymath'}{'contents'}[0];
$result_trees{'displaymath'}{'contents'}[0]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'displaymath'}{'contents'}[0]{'contents'}[4];
$result_trees{'displaymath'}{'contents'}[0]{'contents'}[4]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'displaymath'}{'contents'}[0]{'contents'}[4]{'contents'}[0]{'args'}[0];
$result_trees{'displaymath'}{'contents'}[0]{'contents'}[4]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'displaymath'}{'contents'}[0]{'contents'}[4]{'contents'}[0];
$result_trees{'displaymath'}{'contents'}[0]{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'displaymath'}{'contents'}[0]{'contents'}[4];
$result_trees{'displaymath'}{'contents'}[0]{'contents'}[4]{'contents'}[1]{'parent'} = $result_trees{'displaymath'}{'contents'}[0]{'contents'}[4];
$result_trees{'displaymath'}{'contents'}[0]{'contents'}[4]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'displaymath'}{'contents'}[0]{'contents'}[4]{'contents'}[2]{'args'}[0];
$result_trees{'displaymath'}{'contents'}[0]{'contents'}[4]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'displaymath'}{'contents'}[0]{'contents'}[4]{'contents'}[2];
$result_trees{'displaymath'}{'contents'}[0]{'contents'}[4]{'contents'}[2]{'parent'} = $result_trees{'displaymath'}{'contents'}[0]{'contents'}[4];
$result_trees{'displaymath'}{'contents'}[0]{'contents'}[4]{'contents'}[3]{'parent'} = $result_trees{'displaymath'}{'contents'}[0]{'contents'}[4];
$result_trees{'displaymath'}{'contents'}[0]{'contents'}[4]{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'displaymath'}{'contents'}[0]{'contents'}[4]{'contents'}[4]{'args'}[0];
$result_trees{'displaymath'}{'contents'}[0]{'contents'}[4]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'displaymath'}{'contents'}[0]{'contents'}[4]{'contents'}[4];
$result_trees{'displaymath'}{'contents'}[0]{'contents'}[4]{'contents'}[4]{'parent'} = $result_trees{'displaymath'}{'contents'}[0]{'contents'}[4];
$result_trees{'displaymath'}{'contents'}[0]{'contents'}[4]{'contents'}[5]{'parent'} = $result_trees{'displaymath'}{'contents'}[0]{'contents'}[4];
$result_trees{'displaymath'}{'contents'}[0]{'contents'}[4]{'contents'}[6]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'displaymath'}{'contents'}[0]{'contents'}[4]{'contents'}[6]{'args'}[0];
$result_trees{'displaymath'}{'contents'}[0]{'contents'}[4]{'contents'}[6]{'args'}[0]{'parent'} = $result_trees{'displaymath'}{'contents'}[0]{'contents'}[4]{'contents'}[6];
$result_trees{'displaymath'}{'contents'}[0]{'contents'}[4]{'contents'}[6]{'parent'} = $result_trees{'displaymath'}{'contents'}[0]{'contents'}[4];
$result_trees{'displaymath'}{'contents'}[0]{'contents'}[4]{'extra'}{'end_command'} = $result_trees{'displaymath'}{'contents'}[0]{'contents'}[4]{'contents'}[6];
$result_trees{'displaymath'}{'contents'}[0]{'contents'}[4]{'parent'} = $result_trees{'displaymath'}{'contents'}[0];
$result_trees{'displaymath'}{'contents'}[0]{'contents'}[5]{'parent'} = $result_trees{'displaymath'}{'contents'}[0];
$result_trees{'displaymath'}{'contents'}[0]{'contents'}[6]{'contents'}[0]{'parent'} = $result_trees{'displaymath'}{'contents'}[0]{'contents'}[6];
$result_trees{'displaymath'}{'contents'}[0]{'contents'}[6]{'parent'} = $result_trees{'displaymath'}{'contents'}[0];
$result_trees{'displaymath'}{'contents'}[0]{'contents'}[7]{'args'}[0]{'parent'} = $result_trees{'displaymath'}{'contents'}[0]{'contents'}[7];
$result_trees{'displaymath'}{'contents'}[0]{'contents'}[7]{'contents'}[0]{'parent'} = $result_trees{'displaymath'}{'contents'}[0]{'contents'}[7];
$result_trees{'displaymath'}{'contents'}[0]{'contents'}[7]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'displaymath'}{'contents'}[0]{'contents'}[7]{'contents'}[1]{'contents'}[0]{'args'}[0];
$result_trees{'displaymath'}{'contents'}[0]{'contents'}[7]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'displaymath'}{'contents'}[0]{'contents'}[7]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'displaymath'}{'contents'}[0]{'contents'}[7]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'displaymath'}{'contents'}[0]{'contents'}[7]{'contents'}[1]{'contents'}[0]{'args'}[0];
$result_trees{'displaymath'}{'contents'}[0]{'contents'}[7]{'contents'}[1]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'displaymath'}{'contents'}[0]{'contents'}[7]{'contents'}[1]{'contents'}[0];
$result_trees{'displaymath'}{'contents'}[0]{'contents'}[7]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'displaymath'}{'contents'}[0]{'contents'}[7]{'contents'}[1];
$result_trees{'displaymath'}{'contents'}[0]{'contents'}[7]{'contents'}[1]{'parent'} = $result_trees{'displaymath'}{'contents'}[0]{'contents'}[7];
$result_trees{'displaymath'}{'contents'}[0]{'contents'}[7]{'contents'}[2]{'parent'} = $result_trees{'displaymath'}{'contents'}[0]{'contents'}[7];
$result_trees{'displaymath'}{'contents'}[0]{'contents'}[7]{'contents'}[3]{'parent'} = $result_trees{'displaymath'}{'contents'}[0]{'contents'}[7];
$result_trees{'displaymath'}{'contents'}[0]{'contents'}[7]{'contents'}[4]{'parent'} = $result_trees{'displaymath'}{'contents'}[0]{'contents'}[7];
$result_trees{'displaymath'}{'contents'}[0]{'contents'}[7]{'contents'}[5]{'contents'}[0]{'parent'} = $result_trees{'displaymath'}{'contents'}[0]{'contents'}[7]{'contents'}[5];
$result_trees{'displaymath'}{'contents'}[0]{'contents'}[7]{'contents'}[5]{'parent'} = $result_trees{'displaymath'}{'contents'}[0]{'contents'}[7];
$result_trees{'displaymath'}{'contents'}[0]{'contents'}[7]{'contents'}[6]{'contents'}[0]{'parent'} = $result_trees{'displaymath'}{'contents'}[0]{'contents'}[7]{'contents'}[6];
$result_trees{'displaymath'}{'contents'}[0]{'contents'}[7]{'contents'}[6]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'displaymath'}{'contents'}[0]{'contents'}[7]{'contents'}[6]{'contents'}[1];
$result_trees{'displaymath'}{'contents'}[0]{'contents'}[7]{'contents'}[6]{'contents'}[1]{'parent'} = $result_trees{'displaymath'}{'contents'}[0]{'contents'}[7]{'contents'}[6];
$result_trees{'displaymath'}{'contents'}[0]{'contents'}[7]{'contents'}[6]{'parent'} = $result_trees{'displaymath'}{'contents'}[0]{'contents'}[7];
$result_trees{'displaymath'}{'contents'}[0]{'contents'}[7]{'contents'}[7]{'parent'} = $result_trees{'displaymath'}{'contents'}[0]{'contents'}[7];
$result_trees{'displaymath'}{'contents'}[0]{'contents'}[7]{'contents'}[8]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'displaymath'}{'contents'}[0]{'contents'}[7]{'contents'}[8]{'args'}[0];
$result_trees{'displaymath'}{'contents'}[0]{'contents'}[7]{'contents'}[8]{'args'}[0]{'parent'} = $result_trees{'displaymath'}{'contents'}[0]{'contents'}[7]{'contents'}[8];
$result_trees{'displaymath'}{'contents'}[0]{'contents'}[7]{'contents'}[8]{'parent'} = $result_trees{'displaymath'}{'contents'}[0]{'contents'}[7];
$result_trees{'displaymath'}{'contents'}[0]{'contents'}[7]{'extra'}{'end_command'} = $result_trees{'displaymath'}{'contents'}[0]{'contents'}[7]{'contents'}[8];
$result_trees{'displaymath'}{'contents'}[0]{'contents'}[7]{'parent'} = $result_trees{'displaymath'}{'contents'}[0];
$result_trees{'displaymath'}{'contents'}[0]{'contents'}[8]{'parent'} = $result_trees{'displaymath'}{'contents'}[0];
$result_trees{'displaymath'}{'contents'}[0]{'contents'}[9]{'contents'}[0]{'parent'} = $result_trees{'displaymath'}{'contents'}[0]{'contents'}[9];
$result_trees{'displaymath'}{'contents'}[0]{'contents'}[9]{'parent'} = $result_trees{'displaymath'}{'contents'}[0];
$result_trees{'displaymath'}{'contents'}[0]{'contents'}[10]{'args'}[0]{'parent'} = $result_trees{'displaymath'}{'contents'}[0]{'contents'}[10];
$result_trees{'displaymath'}{'contents'}[0]{'contents'}[10]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'displaymath'}{'contents'}[0]{'contents'}[10]{'contents'}[0];
$result_trees{'displaymath'}{'contents'}[0]{'contents'}[10]{'contents'}[0]{'parent'} = $result_trees{'displaymath'}{'contents'}[0]{'contents'}[10];
$result_trees{'displaymath'}{'contents'}[0]{'contents'}[10]{'contents'}[1]{'parent'} = $result_trees{'displaymath'}{'contents'}[0]{'contents'}[10];
$result_trees{'displaymath'}{'contents'}[0]{'contents'}[10]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'displaymath'}{'contents'}[0]{'contents'}[10]{'contents'}[2]{'args'}[0];
$result_trees{'displaymath'}{'contents'}[0]{'contents'}[10]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'displaymath'}{'contents'}[0]{'contents'}[10]{'contents'}[2];
$result_trees{'displaymath'}{'contents'}[0]{'contents'}[10]{'contents'}[2]{'parent'} = $result_trees{'displaymath'}{'contents'}[0]{'contents'}[10];
$result_trees{'displaymath'}{'contents'}[0]{'contents'}[10]{'extra'}{'end_command'} = $result_trees{'displaymath'}{'contents'}[0]{'contents'}[10]{'contents'}[2];
$result_trees{'displaymath'}{'contents'}[0]{'contents'}[10]{'parent'} = $result_trees{'displaymath'}{'contents'}[0];
$result_trees{'displaymath'}{'contents'}[0]{'parent'} = $result_trees{'displaymath'};

$result_texis{'displaymath'} = 'Simple
@displaymath
--{x^i}\\over{\\tan y}
@end displaymath

Math with @@-command
@displaymath
@code{math code} a < b \\sum@sub{i} q@sup{2}
@end displaymath

Complex
@displaymath
 \\underline{@code{math \\hbox{ code }}} @\\i \\sum_{i}{\\underline{f}}
@end displaymath

With a comment
@displaymath
@c comment in displaymath
a/2
@end displaymath
';


$result_texts{'displaymath'} = 'Simple
--{x^i}\\over{\\tan y}

Math with @-command
math code a < b \\sumi q2

Complex
 \\underline{math \\hbox{ code }} \\i \\sum_{i}{\\underline{f}}

With a comment
a/2
';

$result_errors{'displaymath'} = [];


$result_floats{'displaymath'} = {};



$result_converted{'plaintext'}->{'displaymath'} = 'Simple
--{x^i}\\over{\\tan y}

   Math with @-command
math code a < b \\sum_{i} q^{2}

   Complex
 \\underline{math \\hbox{ code }} \\i \\sum_{i}{\\underline{f}}

   With a comment
a/2
';


$result_converted{'html_text'}->{'displaymath'} = '<p>Simple
</p><div class="displaymath"><em>--{x^i}\\over{\\tan y}
</em></div>
<p>Math with @-command
</p><div class="displaymath"><em><code class="code">math code</code> a &lt; b \\sum<sub class="sub">i</sub> q<sup class="sup">2</sup>
</em></div>
<p>Complex
</p><div class="displaymath"><em> \\underline{<code class="code">math \\hbox{ code }</code>} \\i \\sum_{i}{\\underline{f}}
</em></div>
<p>With a comment
</p><div class="displaymath"><em>a/2
</em></div>';


$result_converted{'xml'}->{'displaymath'} = '<para>Simple
</para><displaymath endspaces=" ">
--{x^i}\\over{\\tan y}
</displaymath>

<para>Math with &arobase;-command
</para><displaymath endspaces=" ">
<code>math code</code> a &lt; b \\sum<sub>i</sub> q<sup>2</sup>
</displaymath>

<para>Complex
</para><displaymath endspaces=" ">
 \\underline{<code>math \\hbox{ code }</code>} &backslash;i \\sum_{i}{\\underline{f}}
</displaymath>

<para>With a comment
</para><displaymath endspaces=" ">
<!-- c comment in displaymath -->
a/2
</displaymath>
';


$result_converted{'latex'}->{'displaymath'} = 'Simple
$$
--{x^i}\\over{\\tan y}
$$

Math with @-command
$$
\\mathtt{math code} a < b \\sum_{i} q^{2}
$$

Complex
$$
 \\underline{\\mathtt{math \\hbox{ code }}} \\i \\sum_{i}{\\underline{f}}
$$

With a comment
$$
a/2
$$
';


$result_converted{'docbook'}->{'displaymath'} = '<para>Simple
</para><informalequation><mathphrase>--{x^i}\\over{\\tan y}
</mathphrase></informalequation>
<para>Math with @-command
</para><informalequation><mathphrase><literal>math code</literal> a &lt; b \\sum<subscript>i</subscript> q<superscript>2</superscript>
</mathphrase></informalequation>
<para>Complex
</para><informalequation><mathphrase> \\underline{<literal>math \\hbox{ code }</literal>} \\i \\sum_{i}{\\underline{f}}
</mathphrase></informalequation>
<para>With a comment
</para><informalequation><mathphrase><!-- comment in displaymath -->
a/2
</mathphrase></informalequation>';

1;
