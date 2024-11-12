use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'call_macro_in_linemacro_body'} = {
  'contents' => [
    {
      'contents' => [
        {
          'cmdname' => 'linemacro',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'lm',
                  'type' => 'macro_name'
                },
                {
                  'text' => 'a',
                  'type' => 'macro_arg'
                },
                {
                  'text' => 'b',
                  'type' => 'macro_arg'
                }
              ],
              'type' => 'argument'
            },
            {
              'text' => '@mymacro{@code{}
',
              'type' => 'raw'
            },
            {
              'text' => '@var{\\a\\}
',
              'type' => 'raw'
            },
            {
              'text' => 'now second arg: \\b\\}
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
                'line_nr' => 5
              }
            }
          ],
          'info' => {
            'arg_line' => ' lm {a, b}
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
          'cmdname' => 'macro',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'mymacro',
                  'type' => 'macro_name'
                },
                {
                  'text' => 'c',
                  'type' => 'macro_arg'
                },
                {
                  'text' => 'd',
                  'type' => 'macro_arg'
                }
              ],
              'type' => 'argument'
            },
            {
              'text' => '@table \\c\\
',
              'type' => 'raw'
            },
            {
              'text' => '@item \\d\\
',
              'type' => 'raw'
            },
            {
              'text' => '@end table
',
              'type' => 'raw'
            },
            {
              'args' => [
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
              'cmdname' => 'end',
              'extra' => {
                'text_arg' => 'macro'
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'line_nr' => 11
              }
            }
          ],
          'info' => {
            'arg_line' => ' mymacro {c, d}
'
          },
          'source_info' => {
            'line_nr' => 7
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
                        'text' => 'something',
                        'type' => 'bracketed_linemacro_arg'
                      }
                    ],
                    'type' => 'line_arg'
                  },
                  {
                    'contents' => [
                      {
                        'text' => 'gg , yy 
  zz',
                        'type' => 'bracketed_linemacro_arg'
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
                  'command_name' => 'lm',
                  'spaces_before_argument' => {
                    'text' => ' '
                  }
                },
                'type' => 'linemacro_call'
              },
              'position' => 1,
              'sourcemark_type' => 'linemacro_expansion',
              'status' => 'start'
            },
            {
              'counter' => 1,
              'element' => {
                'contents' => [
                  {
                    'contents' => [
                      {
                        'text' => '@code{}
@var{something}
now second arg: gg '
                      }
                    ],
                    'type' => 'brace_arg'
                  },
                  {
                    'contents' => [
                      {
                        'source_marks' => [
                          {
                            'counter' => 1,
                            'position' => 4,
                            'sourcemark_type' => 'linemacro_expansion',
                            'status' => 'end'
                          }
                        ],
                        'text' => 'yy 
  zz'
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
                  'command_name' => 'mymacro'
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
          'cmdname' => 'table',
          'contents' => [
            {
              'contents' => [
                {
                  'contents' => [
                    {
                      'cmdname' => 'code',
                      'contents' => [
                        {
                          'type' => 'brace_container'
                        }
                      ],
                      'source_info' => {
                        'line_nr' => 14,
                        'macro' => 'mymacro'
                      }
                    }
                  ],
                  'info' => {
                    'spaces_after_argument' => {
                      'text' => '
'
                    }
                  },
                  'type' => 'block_line_arg'
                }
              ],
              'type' => 'argument'
            },
            {
              'contents' => [
                {
                  'contents' => [
                    {
                      'cmdname' => 'var',
                      'contents' => [
                        {
                          'contents' => [
                            {
                              'text' => 'something'
                            }
                          ],
                          'type' => 'brace_container'
                        }
                      ],
                      'source_info' => {
                        'line_nr' => 14,
                        'macro' => 'mymacro'
                      }
                    },
                    {
                      'text' => '
'
                    },
                    {
                      'text' => 'now second arg: gg 
'
                    }
                  ],
                  'type' => 'paragraph'
                }
              ],
              'type' => 'before_item'
            },
            {
              'contents' => [
                {
                  'contents' => [
                    {
                      'args' => [
                        {
                          'contents' => [
                            {
                              'text' => 'yy'
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
                      'cmdname' => 'item',
                      'info' => {
                        'spaces_before_argument' => {
                          'text' => ' '
                        }
                      },
                      'source_info' => {
                        'line_nr' => 14,
                        'macro' => 'mymacro'
                      }
                    }
                  ],
                  'type' => 'table_term'
                },
                {
                  'contents' => [
                    {
                      'text' => '  ',
                      'type' => 'spaces_before_paragraph'
                    },
                    {
                      'contents' => [
                        {
                          'text' => 'zz
'
                        }
                      ],
                      'type' => 'paragraph'
                    }
                  ],
                  'type' => 'table_definition'
                }
              ],
              'type' => 'table_entry'
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'source_marks' => [
                        {
                          'counter' => 1,
                          'position' => 5,
                          'sourcemark_type' => 'macro_expansion',
                          'status' => 'end'
                        }
                      ],
                      'text' => 'table'
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
                'text_arg' => 'table'
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'line_nr' => 14,
                'macro' => 'mymacro'
              }
            }
          ],
          'extra' => {
            'command_as_argument' => {}
          },
          'info' => {
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'line_nr' => 14,
            'macro' => 'mymacro'
          }
        }
      ],
      'type' => 'before_node_section'
    }
  ],
  'type' => 'document_root'
};
$result_trees{'call_macro_in_linemacro_body'}{'contents'}[0]{'contents'}[4]{'extra'}{'command_as_argument'} = $result_trees{'call_macro_in_linemacro_body'}{'contents'}[0]{'contents'}[4]{'contents'}[0]{'contents'}[0]{'contents'}[0];

$result_texis{'call_macro_in_linemacro_body'} = '@linemacro lm {a, b}
@mymacro{@code{}
@var{\\a\\}
now second arg: \\b\\}
@end linemacro

@macro mymacro {c, d}
@table \\c\\
@item \\d\\
@end table
@end macro

@table @code{}
@var{something}
now second arg: gg 
@item yy 
  zz
@end table
';


$result_texts{'call_macro_in_linemacro_body'} = '

something
now second arg: gg 
yy
zz
';

$result_errors{'call_macro_in_linemacro_body'} = [];


$result_floats{'call_macro_in_linemacro_body'} = {};


1;
