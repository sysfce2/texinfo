use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'top_in_ref'} = {
  'contents' => [
    {
      'type' => 'before_node_section'
    },
    {
      'cmdname' => 'node',
      'contents' => [
        {
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'Top'
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
          'type' => 'arguments_line'
        },
        {
          'text' => '
',
          'type' => 'empty_line'
        }
      ],
      'extra' => {
        'is_target' => 1,
        'normalized' => 'Top'
      },
      'info' => {
        'spaces_before_argument' => {
          'text' => ' '
        }
      },
      'source_info' => {
        'line_nr' => 1
      }
    },
    {
      'cmdname' => 'node',
      'contents' => [
        {
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'chap refs node'
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
          'type' => 'arguments_line'
        },
        {
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'contents' => [
            {
              'cmdname' => 'code',
              'contents' => [
                {
                  'contents' => [
                    {
                      'cmdname' => '@'
                    },
                    {
                      'text' => 'ref'
                    },
                    {
                      'cmdname' => '{'
                    },
                    {
                      'text' => 'Top,cross ref name'
                    },
                    {
                      'cmdname' => '}'
                    }
                  ],
                  'type' => 'brace_container'
                }
              ],
              'source_info' => {
                'line_nr' => 5
              }
            },
            {
              'text' => ' '
            },
            {
              'cmdname' => 'ref',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'Top'
                    }
                  ],
                  'extra' => {
                    'node_content' => {
                      'contents' => [
                        {}
                      ]
                    },
                    'normalized' => 'Top'
                  },
                  'type' => 'brace_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => 'cross ref name'
                    }
                  ],
                  'type' => 'brace_arg'
                }
              ],
              'source_info' => {
                'line_nr' => 5
              }
            },
            {
              'text' => '
'
            },
            {
              'cmdname' => 'code',
              'contents' => [
                {
                  'contents' => [
                    {
                      'cmdname' => '@'
                    },
                    {
                      'text' => 'ref'
                    },
                    {
                      'cmdname' => '{'
                    },
                    {
                      'text' => 'Top,,title'
                    },
                    {
                      'cmdname' => '}'
                    }
                  ],
                  'type' => 'brace_container'
                }
              ],
              'source_info' => {
                'line_nr' => 6
              }
            },
            {
              'text' => ' '
            },
            {
              'cmdname' => 'ref',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'Top'
                    }
                  ],
                  'extra' => {
                    'node_content' => {
                      'contents' => [
                        {}
                      ]
                    },
                    'normalized' => 'Top'
                  },
                  'type' => 'brace_arg'
                },
                {
                  'type' => 'brace_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => 'title'
                    }
                  ],
                  'type' => 'brace_arg'
                }
              ],
              'source_info' => {
                'line_nr' => 6
              }
            },
            {
              'text' => '
'
            },
            {
              'cmdname' => 'code',
              'contents' => [
                {
                  'contents' => [
                    {
                      'cmdname' => '@'
                    },
                    {
                      'text' => 'ref'
                    },
                    {
                      'cmdname' => '{'
                    },
                    {
                      'text' => 'Top,,,file name'
                    },
                    {
                      'cmdname' => '}'
                    }
                  ],
                  'type' => 'brace_container'
                }
              ],
              'source_info' => {
                'line_nr' => 7
              }
            },
            {
              'text' => ' '
            },
            {
              'cmdname' => 'ref',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'Top'
                    }
                  ],
                  'extra' => {
                    'node_content' => {
                      'contents' => [
                        {}
                      ]
                    }
                  },
                  'type' => 'brace_arg'
                },
                {
                  'type' => 'brace_arg'
                },
                {
                  'type' => 'brace_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => 'file name'
                    }
                  ],
                  'type' => 'brace_arg'
                }
              ],
              'source_info' => {
                'line_nr' => 7
              }
            },
            {
              'text' => '
'
            },
            {
              'cmdname' => 'code',
              'contents' => [
                {
                  'contents' => [
                    {
                      'cmdname' => '@'
                    },
                    {
                      'text' => 'ref'
                    },
                    {
                      'cmdname' => '{'
                    },
                    {
                      'text' => 'Top,,,,manual'
                    },
                    {
                      'cmdname' => '}'
                    }
                  ],
                  'type' => 'brace_container'
                }
              ],
              'source_info' => {
                'line_nr' => 8
              }
            },
            {
              'text' => ' '
            },
            {
              'cmdname' => 'ref',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'Top'
                    }
                  ],
                  'extra' => {
                    'node_content' => {
                      'contents' => [
                        {}
                      ]
                    }
                  },
                  'type' => 'brace_arg'
                },
                {
                  'type' => 'brace_arg'
                },
                {
                  'type' => 'brace_arg'
                },
                {
                  'type' => 'brace_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => 'manual'
                    }
                  ],
                  'type' => 'brace_arg'
                }
              ],
              'source_info' => {
                'line_nr' => 8
              }
            },
            {
              'text' => '
'
            },
            {
              'cmdname' => 'code',
              'contents' => [
                {
                  'contents' => [
                    {
                      'cmdname' => '@'
                    },
                    {
                      'text' => 'ref'
                    },
                    {
                      'cmdname' => '{'
                    },
                    {
                      'text' => 'Top,cross ref name,title,'
                    },
                    {
                      'cmdname' => '}'
                    }
                  ],
                  'type' => 'brace_container'
                }
              ],
              'source_info' => {
                'line_nr' => 9
              }
            },
            {
              'text' => ' '
            },
            {
              'cmdname' => 'ref',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'Top'
                    }
                  ],
                  'extra' => {
                    'node_content' => {
                      'contents' => [
                        {}
                      ]
                    },
                    'normalized' => 'Top'
                  },
                  'type' => 'brace_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => 'cross ref name'
                    }
                  ],
                  'type' => 'brace_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => 'title'
                    }
                  ],
                  'type' => 'brace_arg'
                },
                {
                  'type' => 'brace_arg'
                }
              ],
              'source_info' => {
                'line_nr' => 9
              }
            },
            {
              'text' => '
'
            },
            {
              'cmdname' => 'code',
              'contents' => [
                {
                  'contents' => [
                    {
                      'cmdname' => '@'
                    },
                    {
                      'text' => 'ref'
                    },
                    {
                      'cmdname' => '{'
                    },
                    {
                      'text' => 'Top,cross ref name,,file name'
                    },
                    {
                      'cmdname' => '}'
                    }
                  ],
                  'type' => 'brace_container'
                }
              ],
              'source_info' => {
                'line_nr' => 10
              }
            },
            {
              'text' => ' '
            },
            {
              'cmdname' => 'ref',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'Top'
                    }
                  ],
                  'extra' => {
                    'node_content' => {
                      'contents' => [
                        {}
                      ]
                    }
                  },
                  'type' => 'brace_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => 'cross ref name'
                    }
                  ],
                  'type' => 'brace_arg'
                },
                {
                  'type' => 'brace_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => 'file name'
                    }
                  ],
                  'type' => 'brace_arg'
                }
              ],
              'source_info' => {
                'line_nr' => 10
              }
            },
            {
              'text' => '
'
            },
            {
              'cmdname' => 'code',
              'contents' => [
                {
                  'contents' => [
                    {
                      'cmdname' => '@'
                    },
                    {
                      'text' => 'ref'
                    },
                    {
                      'cmdname' => '{'
                    },
                    {
                      'text' => 'Top,cross ref name,,,manual'
                    },
                    {
                      'cmdname' => '}'
                    }
                  ],
                  'type' => 'brace_container'
                }
              ],
              'source_info' => {
                'line_nr' => 11
              }
            },
            {
              'text' => ' '
            },
            {
              'cmdname' => 'ref',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'Top'
                    }
                  ],
                  'extra' => {
                    'node_content' => {
                      'contents' => [
                        {}
                      ]
                    }
                  },
                  'type' => 'brace_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => 'cross ref name'
                    }
                  ],
                  'type' => 'brace_arg'
                },
                {
                  'type' => 'brace_arg'
                },
                {
                  'type' => 'brace_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => 'manual'
                    }
                  ],
                  'type' => 'brace_arg'
                }
              ],
              'source_info' => {
                'line_nr' => 11
              }
            },
            {
              'text' => '
'
            },
            {
              'cmdname' => 'code',
              'contents' => [
                {
                  'contents' => [
                    {
                      'cmdname' => '@'
                    },
                    {
                      'text' => 'ref'
                    },
                    {
                      'cmdname' => '{'
                    },
                    {
                      'text' => 'Top,cross ref name,title,file name'
                    },
                    {
                      'cmdname' => '}'
                    }
                  ],
                  'type' => 'brace_container'
                }
              ],
              'source_info' => {
                'line_nr' => 12
              }
            },
            {
              'text' => ' '
            },
            {
              'cmdname' => 'ref',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'Top'
                    }
                  ],
                  'extra' => {
                    'node_content' => {
                      'contents' => [
                        {}
                      ]
                    }
                  },
                  'type' => 'brace_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => 'cross ref name'
                    }
                  ],
                  'type' => 'brace_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => 'title'
                    }
                  ],
                  'type' => 'brace_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => 'file name'
                    }
                  ],
                  'type' => 'brace_arg'
                }
              ],
              'source_info' => {
                'line_nr' => 12
              }
            },
            {
              'text' => '
'
            },
            {
              'cmdname' => 'code',
              'contents' => [
                {
                  'contents' => [
                    {
                      'cmdname' => '@'
                    },
                    {
                      'text' => 'ref'
                    },
                    {
                      'cmdname' => '{'
                    },
                    {
                      'text' => 'Top,cross ref name,title,,manual'
                    },
                    {
                      'cmdname' => '}'
                    }
                  ],
                  'type' => 'brace_container'
                }
              ],
              'source_info' => {
                'line_nr' => 13
              }
            },
            {
              'text' => ' '
            },
            {
              'cmdname' => 'ref',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'Top'
                    }
                  ],
                  'extra' => {
                    'node_content' => {
                      'contents' => [
                        {}
                      ]
                    }
                  },
                  'type' => 'brace_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => 'cross ref name'
                    }
                  ],
                  'type' => 'brace_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => 'title'
                    }
                  ],
                  'type' => 'brace_arg'
                },
                {
                  'type' => 'brace_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => 'manual'
                    }
                  ],
                  'type' => 'brace_arg'
                }
              ],
              'source_info' => {
                'line_nr' => 13
              }
            },
            {
              'text' => '
'
            },
            {
              'cmdname' => 'code',
              'contents' => [
                {
                  'contents' => [
                    {
                      'cmdname' => '@'
                    },
                    {
                      'text' => 'ref'
                    },
                    {
                      'cmdname' => '{'
                    },
                    {
                      'text' => 'Top,cross ref name,title, file name, manual'
                    },
                    {
                      'cmdname' => '}'
                    }
                  ],
                  'type' => 'brace_container'
                }
              ],
              'source_info' => {
                'line_nr' => 14
              }
            },
            {
              'text' => ' '
            },
            {
              'cmdname' => 'ref',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'Top'
                    }
                  ],
                  'extra' => {
                    'node_content' => {
                      'contents' => [
                        {}
                      ]
                    }
                  },
                  'type' => 'brace_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => 'cross ref name'
                    }
                  ],
                  'type' => 'brace_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => 'title'
                    }
                  ],
                  'type' => 'brace_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => 'file name'
                    }
                  ],
                  'info' => {
                    'spaces_before_argument' => {
                      'text' => ' '
                    }
                  },
                  'type' => 'brace_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => 'manual'
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
              'source_info' => {
                'line_nr' => 14
              }
            },
            {
              'text' => '
'
            },
            {
              'cmdname' => 'code',
              'contents' => [
                {
                  'contents' => [
                    {
                      'cmdname' => '@'
                    },
                    {
                      'text' => 'ref'
                    },
                    {
                      'cmdname' => '{'
                    },
                    {
                      'text' => 'Top,,title,file name'
                    },
                    {
                      'cmdname' => '}'
                    }
                  ],
                  'type' => 'brace_container'
                }
              ],
              'source_info' => {
                'line_nr' => 15
              }
            },
            {
              'text' => ' '
            },
            {
              'cmdname' => 'ref',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'Top'
                    }
                  ],
                  'extra' => {
                    'node_content' => {
                      'contents' => [
                        {}
                      ]
                    }
                  },
                  'type' => 'brace_arg'
                },
                {
                  'type' => 'brace_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => 'title'
                    }
                  ],
                  'type' => 'brace_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => 'file name'
                    }
                  ],
                  'type' => 'brace_arg'
                }
              ],
              'source_info' => {
                'line_nr' => 15
              }
            },
            {
              'text' => '
'
            },
            {
              'cmdname' => 'code',
              'contents' => [
                {
                  'contents' => [
                    {
                      'cmdname' => '@'
                    },
                    {
                      'text' => 'ref'
                    },
                    {
                      'cmdname' => '{'
                    },
                    {
                      'text' => 'Top,,title,,manual'
                    },
                    {
                      'cmdname' => '}'
                    }
                  ],
                  'type' => 'brace_container'
                }
              ],
              'source_info' => {
                'line_nr' => 16
              }
            },
            {
              'text' => ' '
            },
            {
              'cmdname' => 'ref',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'Top'
                    }
                  ],
                  'extra' => {
                    'node_content' => {
                      'contents' => [
                        {}
                      ]
                    }
                  },
                  'type' => 'brace_arg'
                },
                {
                  'type' => 'brace_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => 'title'
                    }
                  ],
                  'type' => 'brace_arg'
                },
                {
                  'type' => 'brace_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => 'manual'
                    }
                  ],
                  'type' => 'brace_arg'
                }
              ],
              'source_info' => {
                'line_nr' => 16
              }
            },
            {
              'text' => '
'
            },
            {
              'cmdname' => 'code',
              'contents' => [
                {
                  'contents' => [
                    {
                      'cmdname' => '@'
                    },
                    {
                      'text' => 'ref'
                    },
                    {
                      'cmdname' => '{'
                    },
                    {
                      'text' => 'Top,,title, file name, manual'
                    },
                    {
                      'cmdname' => '}'
                    }
                  ],
                  'type' => 'brace_container'
                }
              ],
              'source_info' => {
                'line_nr' => 17
              }
            },
            {
              'text' => ' '
            },
            {
              'cmdname' => 'ref',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'Top'
                    }
                  ],
                  'extra' => {
                    'node_content' => {
                      'contents' => [
                        {}
                      ]
                    }
                  },
                  'type' => 'brace_arg'
                },
                {
                  'type' => 'brace_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => 'title'
                    }
                  ],
                  'type' => 'brace_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => 'file name'
                    }
                  ],
                  'info' => {
                    'spaces_before_argument' => {
                      'text' => ' '
                    }
                  },
                  'type' => 'brace_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => 'manual'
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
              'source_info' => {
                'line_nr' => 17
              }
            },
            {
              'text' => '
'
            },
            {
              'cmdname' => 'code',
              'contents' => [
                {
                  'contents' => [
                    {
                      'cmdname' => '@'
                    },
                    {
                      'text' => 'ref'
                    },
                    {
                      'cmdname' => '{'
                    },
                    {
                      'text' => 'Top,,,file name,manual'
                    },
                    {
                      'cmdname' => '}'
                    }
                  ],
                  'type' => 'brace_container'
                }
              ],
              'source_info' => {
                'line_nr' => 18
              }
            },
            {
              'text' => ' '
            },
            {
              'cmdname' => 'ref',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'Top'
                    }
                  ],
                  'extra' => {
                    'node_content' => {
                      'contents' => [
                        {}
                      ]
                    }
                  },
                  'type' => 'brace_arg'
                },
                {
                  'type' => 'brace_arg'
                },
                {
                  'type' => 'brace_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => 'file name'
                    }
                  ],
                  'type' => 'brace_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => 'manual'
                    }
                  ],
                  'type' => 'brace_arg'
                }
              ],
              'source_info' => {
                'line_nr' => 18
              }
            },
            {
              'text' => '
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
          'contents' => [
            {
              'cmdname' => 'code',
              'contents' => [
                {
                  'contents' => [
                    {
                      'cmdname' => '@'
                    },
                    {
                      'text' => 'ref'
                    },
                    {
                      'cmdname' => '{'
                    },
                    {
                      'text' => '(pman)Top,cross ref name'
                    },
                    {
                      'cmdname' => '}'
                    }
                  ],
                  'type' => 'brace_container'
                }
              ],
              'source_info' => {
                'line_nr' => 20
              }
            },
            {
              'text' => ' '
            },
            {
              'cmdname' => 'ref',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => '('
                    },
                    {
                      'text' => 'pman'
                    },
                    {
                      'text' => ')'
                    },
                    {
                      'text' => 'Top'
                    }
                  ],
                  'extra' => {
                    'manual_content' => {
                      'contents' => [
                        {}
                      ]
                    },
                    'node_content' => {
                      'contents' => [
                        {}
                      ]
                    }
                  },
                  'type' => 'brace_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => 'cross ref name'
                    }
                  ],
                  'type' => 'brace_arg'
                }
              ],
              'source_info' => {
                'line_nr' => 20
              }
            },
            {
              'text' => '
'
            },
            {
              'cmdname' => 'code',
              'contents' => [
                {
                  'contents' => [
                    {
                      'cmdname' => '@'
                    },
                    {
                      'text' => 'ref'
                    },
                    {
                      'cmdname' => '{'
                    },
                    {
                      'text' => '(pman)Top,,title'
                    },
                    {
                      'cmdname' => '}'
                    }
                  ],
                  'type' => 'brace_container'
                }
              ],
              'source_info' => {
                'line_nr' => 21
              }
            },
            {
              'text' => ' '
            },
            {
              'cmdname' => 'ref',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => '('
                    },
                    {
                      'text' => 'pman'
                    },
                    {
                      'text' => ')'
                    },
                    {
                      'text' => 'Top'
                    }
                  ],
                  'extra' => {
                    'manual_content' => {
                      'contents' => [
                        {}
                      ]
                    },
                    'node_content' => {
                      'contents' => [
                        {}
                      ]
                    }
                  },
                  'type' => 'brace_arg'
                },
                {
                  'type' => 'brace_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => 'title'
                    }
                  ],
                  'type' => 'brace_arg'
                }
              ],
              'source_info' => {
                'line_nr' => 21
              }
            },
            {
              'text' => '
'
            },
            {
              'cmdname' => 'code',
              'contents' => [
                {
                  'contents' => [
                    {
                      'cmdname' => '@'
                    },
                    {
                      'text' => 'ref'
                    },
                    {
                      'cmdname' => '{'
                    },
                    {
                      'text' => '(pman)Top,,,file name'
                    },
                    {
                      'cmdname' => '}'
                    }
                  ],
                  'type' => 'brace_container'
                }
              ],
              'source_info' => {
                'line_nr' => 22
              }
            },
            {
              'text' => ' '
            },
            {
              'cmdname' => 'ref',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => '('
                    },
                    {
                      'text' => 'pman'
                    },
                    {
                      'text' => ')'
                    },
                    {
                      'text' => 'Top'
                    }
                  ],
                  'extra' => {
                    'manual_content' => {
                      'contents' => [
                        {}
                      ]
                    },
                    'node_content' => {
                      'contents' => [
                        {}
                      ]
                    }
                  },
                  'type' => 'brace_arg'
                },
                {
                  'type' => 'brace_arg'
                },
                {
                  'type' => 'brace_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => 'file name'
                    }
                  ],
                  'type' => 'brace_arg'
                }
              ],
              'source_info' => {
                'line_nr' => 22
              }
            },
            {
              'text' => '
'
            },
            {
              'cmdname' => 'code',
              'contents' => [
                {
                  'contents' => [
                    {
                      'cmdname' => '@'
                    },
                    {
                      'text' => 'ref'
                    },
                    {
                      'cmdname' => '{'
                    },
                    {
                      'text' => '(pman)Top,,,,manual'
                    },
                    {
                      'cmdname' => '}'
                    }
                  ],
                  'type' => 'brace_container'
                }
              ],
              'source_info' => {
                'line_nr' => 23
              }
            },
            {
              'text' => ' '
            },
            {
              'cmdname' => 'ref',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => '('
                    },
                    {
                      'text' => 'pman'
                    },
                    {
                      'text' => ')'
                    },
                    {
                      'text' => 'Top'
                    }
                  ],
                  'extra' => {
                    'manual_content' => {
                      'contents' => [
                        {}
                      ]
                    },
                    'node_content' => {
                      'contents' => [
                        {}
                      ]
                    }
                  },
                  'type' => 'brace_arg'
                },
                {
                  'type' => 'brace_arg'
                },
                {
                  'type' => 'brace_arg'
                },
                {
                  'type' => 'brace_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => 'manual'
                    }
                  ],
                  'type' => 'brace_arg'
                }
              ],
              'source_info' => {
                'line_nr' => 23
              }
            },
            {
              'text' => '
'
            },
            {
              'cmdname' => 'code',
              'contents' => [
                {
                  'contents' => [
                    {
                      'cmdname' => '@'
                    },
                    {
                      'text' => 'ref'
                    },
                    {
                      'cmdname' => '{'
                    },
                    {
                      'text' => '(pman)Top,cross ref name,title,'
                    },
                    {
                      'cmdname' => '}'
                    }
                  ],
                  'type' => 'brace_container'
                }
              ],
              'source_info' => {
                'line_nr' => 24
              }
            },
            {
              'text' => ' '
            },
            {
              'cmdname' => 'ref',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => '('
                    },
                    {
                      'text' => 'pman'
                    },
                    {
                      'text' => ')'
                    },
                    {
                      'text' => 'Top'
                    }
                  ],
                  'extra' => {
                    'manual_content' => {
                      'contents' => [
                        {}
                      ]
                    },
                    'node_content' => {
                      'contents' => [
                        {}
                      ]
                    }
                  },
                  'type' => 'brace_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => 'cross ref name'
                    }
                  ],
                  'type' => 'brace_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => 'title'
                    }
                  ],
                  'type' => 'brace_arg'
                },
                {
                  'type' => 'brace_arg'
                }
              ],
              'source_info' => {
                'line_nr' => 24
              }
            },
            {
              'text' => '
'
            },
            {
              'cmdname' => 'code',
              'contents' => [
                {
                  'contents' => [
                    {
                      'cmdname' => '@'
                    },
                    {
                      'text' => 'ref'
                    },
                    {
                      'cmdname' => '{'
                    },
                    {
                      'text' => '(pman)Top,cross ref name,,file name'
                    },
                    {
                      'cmdname' => '}'
                    }
                  ],
                  'type' => 'brace_container'
                }
              ],
              'source_info' => {
                'line_nr' => 25
              }
            },
            {
              'text' => ' '
            },
            {
              'cmdname' => 'ref',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => '('
                    },
                    {
                      'text' => 'pman'
                    },
                    {
                      'text' => ')'
                    },
                    {
                      'text' => 'Top'
                    }
                  ],
                  'extra' => {
                    'manual_content' => {
                      'contents' => [
                        {}
                      ]
                    },
                    'node_content' => {
                      'contents' => [
                        {}
                      ]
                    }
                  },
                  'type' => 'brace_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => 'cross ref name'
                    }
                  ],
                  'type' => 'brace_arg'
                },
                {
                  'type' => 'brace_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => 'file name'
                    }
                  ],
                  'type' => 'brace_arg'
                }
              ],
              'source_info' => {
                'line_nr' => 25
              }
            },
            {
              'text' => '
'
            },
            {
              'cmdname' => 'code',
              'contents' => [
                {
                  'contents' => [
                    {
                      'cmdname' => '@'
                    },
                    {
                      'text' => 'ref'
                    },
                    {
                      'cmdname' => '{'
                    },
                    {
                      'text' => '(pman)Top,cross ref name,,,manual'
                    },
                    {
                      'cmdname' => '}'
                    }
                  ],
                  'type' => 'brace_container'
                }
              ],
              'source_info' => {
                'line_nr' => 26
              }
            },
            {
              'text' => ' '
            },
            {
              'cmdname' => 'ref',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => '('
                    },
                    {
                      'text' => 'pman'
                    },
                    {
                      'text' => ')'
                    },
                    {
                      'text' => 'Top'
                    }
                  ],
                  'extra' => {
                    'manual_content' => {
                      'contents' => [
                        {}
                      ]
                    },
                    'node_content' => {
                      'contents' => [
                        {}
                      ]
                    }
                  },
                  'type' => 'brace_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => 'cross ref name'
                    }
                  ],
                  'type' => 'brace_arg'
                },
                {
                  'type' => 'brace_arg'
                },
                {
                  'type' => 'brace_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => 'manual'
                    }
                  ],
                  'type' => 'brace_arg'
                }
              ],
              'source_info' => {
                'line_nr' => 26
              }
            },
            {
              'text' => '
'
            },
            {
              'cmdname' => 'code',
              'contents' => [
                {
                  'contents' => [
                    {
                      'cmdname' => '@'
                    },
                    {
                      'text' => 'ref'
                    },
                    {
                      'cmdname' => '{'
                    },
                    {
                      'text' => '(pman)Top,cross ref name,title,file name'
                    },
                    {
                      'cmdname' => '}'
                    }
                  ],
                  'type' => 'brace_container'
                }
              ],
              'source_info' => {
                'line_nr' => 27
              }
            },
            {
              'text' => ' '
            },
            {
              'cmdname' => 'ref',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => '('
                    },
                    {
                      'text' => 'pman'
                    },
                    {
                      'text' => ')'
                    },
                    {
                      'text' => 'Top'
                    }
                  ],
                  'extra' => {
                    'manual_content' => {
                      'contents' => [
                        {}
                      ]
                    },
                    'node_content' => {
                      'contents' => [
                        {}
                      ]
                    }
                  },
                  'type' => 'brace_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => 'cross ref name'
                    }
                  ],
                  'type' => 'brace_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => 'title'
                    }
                  ],
                  'type' => 'brace_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => 'file name'
                    }
                  ],
                  'type' => 'brace_arg'
                }
              ],
              'source_info' => {
                'line_nr' => 27
              }
            },
            {
              'text' => '
'
            },
            {
              'cmdname' => 'code',
              'contents' => [
                {
                  'contents' => [
                    {
                      'cmdname' => '@'
                    },
                    {
                      'text' => 'ref'
                    },
                    {
                      'cmdname' => '{'
                    },
                    {
                      'text' => '(pman)Top,cross ref name,title,,manual'
                    },
                    {
                      'cmdname' => '}'
                    }
                  ],
                  'type' => 'brace_container'
                }
              ],
              'source_info' => {
                'line_nr' => 28
              }
            },
            {
              'text' => ' '
            },
            {
              'cmdname' => 'ref',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => '('
                    },
                    {
                      'text' => 'pman'
                    },
                    {
                      'text' => ')'
                    },
                    {
                      'text' => 'Top'
                    }
                  ],
                  'extra' => {
                    'manual_content' => {
                      'contents' => [
                        {}
                      ]
                    },
                    'node_content' => {
                      'contents' => [
                        {}
                      ]
                    }
                  },
                  'type' => 'brace_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => 'cross ref name'
                    }
                  ],
                  'type' => 'brace_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => 'title'
                    }
                  ],
                  'type' => 'brace_arg'
                },
                {
                  'type' => 'brace_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => 'manual'
                    }
                  ],
                  'type' => 'brace_arg'
                }
              ],
              'source_info' => {
                'line_nr' => 28
              }
            },
            {
              'text' => '
'
            },
            {
              'cmdname' => 'code',
              'contents' => [
                {
                  'contents' => [
                    {
                      'cmdname' => '@'
                    },
                    {
                      'text' => 'ref'
                    },
                    {
                      'cmdname' => '{'
                    },
                    {
                      'text' => '(pman)Top,cross ref name,title, file name, manual'
                    },
                    {
                      'cmdname' => '}'
                    }
                  ],
                  'type' => 'brace_container'
                }
              ],
              'source_info' => {
                'line_nr' => 29
              }
            },
            {
              'text' => ' '
            },
            {
              'cmdname' => 'ref',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => '('
                    },
                    {
                      'text' => 'pman'
                    },
                    {
                      'text' => ')'
                    },
                    {
                      'text' => 'Top'
                    }
                  ],
                  'extra' => {
                    'manual_content' => {
                      'contents' => [
                        {}
                      ]
                    },
                    'node_content' => {
                      'contents' => [
                        {}
                      ]
                    }
                  },
                  'type' => 'brace_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => 'cross ref name'
                    }
                  ],
                  'type' => 'brace_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => 'title'
                    }
                  ],
                  'type' => 'brace_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => 'file name'
                    }
                  ],
                  'info' => {
                    'spaces_before_argument' => {
                      'text' => ' '
                    }
                  },
                  'type' => 'brace_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => 'manual'
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
              'source_info' => {
                'line_nr' => 29
              }
            },
            {
              'text' => '
'
            },
            {
              'cmdname' => 'code',
              'contents' => [
                {
                  'contents' => [
                    {
                      'cmdname' => '@'
                    },
                    {
                      'text' => 'ref'
                    },
                    {
                      'cmdname' => '{'
                    },
                    {
                      'text' => '(pman)Top,,title,file name'
                    },
                    {
                      'cmdname' => '}'
                    }
                  ],
                  'type' => 'brace_container'
                }
              ],
              'source_info' => {
                'line_nr' => 30
              }
            },
            {
              'text' => ' '
            },
            {
              'cmdname' => 'ref',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => '('
                    },
                    {
                      'text' => 'pman'
                    },
                    {
                      'text' => ')'
                    },
                    {
                      'text' => 'Top'
                    }
                  ],
                  'extra' => {
                    'manual_content' => {
                      'contents' => [
                        {}
                      ]
                    },
                    'node_content' => {
                      'contents' => [
                        {}
                      ]
                    }
                  },
                  'type' => 'brace_arg'
                },
                {
                  'type' => 'brace_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => 'title'
                    }
                  ],
                  'type' => 'brace_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => 'file name'
                    }
                  ],
                  'type' => 'brace_arg'
                }
              ],
              'source_info' => {
                'line_nr' => 30
              }
            },
            {
              'text' => '
'
            },
            {
              'cmdname' => 'code',
              'contents' => [
                {
                  'contents' => [
                    {
                      'cmdname' => '@'
                    },
                    {
                      'text' => 'ref'
                    },
                    {
                      'cmdname' => '{'
                    },
                    {
                      'text' => '(pman)Top,,title,,manual'
                    },
                    {
                      'cmdname' => '}'
                    }
                  ],
                  'type' => 'brace_container'
                }
              ],
              'source_info' => {
                'line_nr' => 31
              }
            },
            {
              'text' => ' '
            },
            {
              'cmdname' => 'ref',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => '('
                    },
                    {
                      'text' => 'pman'
                    },
                    {
                      'text' => ')'
                    },
                    {
                      'text' => 'Top'
                    }
                  ],
                  'extra' => {
                    'manual_content' => {
                      'contents' => [
                        {}
                      ]
                    },
                    'node_content' => {
                      'contents' => [
                        {}
                      ]
                    }
                  },
                  'type' => 'brace_arg'
                },
                {
                  'type' => 'brace_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => 'title'
                    }
                  ],
                  'type' => 'brace_arg'
                },
                {
                  'type' => 'brace_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => 'manual'
                    }
                  ],
                  'type' => 'brace_arg'
                }
              ],
              'source_info' => {
                'line_nr' => 31
              }
            },
            {
              'text' => '
'
            },
            {
              'cmdname' => 'code',
              'contents' => [
                {
                  'contents' => [
                    {
                      'cmdname' => '@'
                    },
                    {
                      'text' => 'ref'
                    },
                    {
                      'cmdname' => '{'
                    },
                    {
                      'text' => '(pman)Top,,title, file name, manual'
                    },
                    {
                      'cmdname' => '}'
                    }
                  ],
                  'type' => 'brace_container'
                }
              ],
              'source_info' => {
                'line_nr' => 32
              }
            },
            {
              'text' => ' '
            },
            {
              'cmdname' => 'ref',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => '('
                    },
                    {
                      'text' => 'pman'
                    },
                    {
                      'text' => ')'
                    },
                    {
                      'text' => 'Top'
                    }
                  ],
                  'extra' => {
                    'manual_content' => {
                      'contents' => [
                        {}
                      ]
                    },
                    'node_content' => {
                      'contents' => [
                        {}
                      ]
                    }
                  },
                  'type' => 'brace_arg'
                },
                {
                  'type' => 'brace_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => 'title'
                    }
                  ],
                  'type' => 'brace_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => 'file name'
                    }
                  ],
                  'info' => {
                    'spaces_before_argument' => {
                      'text' => ' '
                    }
                  },
                  'type' => 'brace_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => 'manual'
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
              'source_info' => {
                'line_nr' => 32
              }
            },
            {
              'text' => '
'
            },
            {
              'cmdname' => 'code',
              'contents' => [
                {
                  'contents' => [
                    {
                      'cmdname' => '@'
                    },
                    {
                      'text' => 'ref'
                    },
                    {
                      'cmdname' => '{'
                    },
                    {
                      'text' => '(pman)Top,,,file name,manual'
                    },
                    {
                      'cmdname' => '}'
                    }
                  ],
                  'type' => 'brace_container'
                }
              ],
              'source_info' => {
                'line_nr' => 33
              }
            },
            {
              'text' => ' '
            },
            {
              'cmdname' => 'ref',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => '('
                    },
                    {
                      'text' => 'pman'
                    },
                    {
                      'text' => ')'
                    },
                    {
                      'text' => 'Top'
                    }
                  ],
                  'extra' => {
                    'manual_content' => {
                      'contents' => [
                        {}
                      ]
                    },
                    'node_content' => {
                      'contents' => [
                        {}
                      ]
                    }
                  },
                  'type' => 'brace_arg'
                },
                {
                  'type' => 'brace_arg'
                },
                {
                  'type' => 'brace_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => 'file name'
                    }
                  ],
                  'type' => 'brace_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => 'manual'
                    }
                  ],
                  'type' => 'brace_arg'
                }
              ],
              'source_info' => {
                'line_nr' => 33
              }
            },
            {
              'text' => '
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
          'contents' => [
            {
              'cmdname' => 'code',
              'contents' => [
                {
                  'contents' => [
                    {
                      'cmdname' => '@'
                    },
                    {
                      'text' => 'inforef'
                    },
                    {
                      'cmdname' => '{'
                    },
                    {
                      'text' => 'Top, cross ref name, file name'
                    },
                    {
                      'cmdname' => '}'
                    }
                  ],
                  'type' => 'brace_container'
                }
              ],
              'source_info' => {
                'line_nr' => 35
              }
            },
            {
              'text' => ' '
            },
            {
              'cmdname' => 'inforef',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'Top'
                    }
                  ],
                  'extra' => {
                    'node_content' => {
                      'contents' => [
                        {}
                      ]
                    }
                  },
                  'type' => 'brace_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => 'cross ref name'
                    }
                  ],
                  'info' => {
                    'spaces_before_argument' => {
                      'text' => ' '
                    }
                  },
                  'type' => 'brace_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => 'file name'
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
              'source_info' => {
                'line_nr' => 35
              }
            },
            {
              'text' => '
'
            },
            {
              'cmdname' => 'code',
              'contents' => [
                {
                  'contents' => [
                    {
                      'cmdname' => '@'
                    },
                    {
                      'text' => 'inforef'
                    },
                    {
                      'cmdname' => '{'
                    },
                    {
                      'text' => 'Top'
                    },
                    {
                      'cmdname' => '}'
                    }
                  ],
                  'type' => 'brace_container'
                }
              ],
              'source_info' => {
                'line_nr' => 36
              }
            },
            {
              'text' => ' '
            },
            {
              'cmdname' => 'inforef',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'Top'
                    }
                  ],
                  'extra' => {
                    'node_content' => {
                      'contents' => [
                        {}
                      ]
                    },
                    'normalized' => 'Top'
                  },
                  'type' => 'brace_arg'
                }
              ],
              'source_info' => {
                'line_nr' => 36
              }
            },
            {
              'text' => '
'
            },
            {
              'cmdname' => 'code',
              'contents' => [
                {
                  'contents' => [
                    {
                      'cmdname' => '@'
                    },
                    {
                      'text' => 'inforef'
                    },
                    {
                      'cmdname' => '{'
                    },
                    {
                      'text' => 'Top, cross ref name'
                    },
                    {
                      'cmdname' => '}'
                    }
                  ],
                  'type' => 'brace_container'
                }
              ],
              'source_info' => {
                'line_nr' => 37
              }
            },
            {
              'text' => ' '
            },
            {
              'cmdname' => 'inforef',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'Top'
                    }
                  ],
                  'extra' => {
                    'node_content' => {
                      'contents' => [
                        {}
                      ]
                    },
                    'normalized' => 'Top'
                  },
                  'type' => 'brace_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => 'cross ref name'
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
              'source_info' => {
                'line_nr' => 37
              }
            },
            {
              'text' => '
'
            },
            {
              'cmdname' => 'code',
              'contents' => [
                {
                  'contents' => [
                    {
                      'cmdname' => '@'
                    },
                    {
                      'text' => 'inforef'
                    },
                    {
                      'cmdname' => '{'
                    },
                    {
                      'text' => 'Top,,file name'
                    },
                    {
                      'cmdname' => '}'
                    }
                  ],
                  'type' => 'brace_container'
                }
              ],
              'source_info' => {
                'line_nr' => 38
              }
            },
            {
              'text' => ' '
            },
            {
              'cmdname' => 'inforef',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'Top'
                    }
                  ],
                  'extra' => {
                    'node_content' => {
                      'contents' => [
                        {}
                      ]
                    }
                  },
                  'type' => 'brace_arg'
                },
                {
                  'type' => 'brace_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => 'file name'
                    }
                  ],
                  'type' => 'brace_arg'
                }
              ],
              'source_info' => {
                'line_nr' => 38
              }
            },
            {
              'text' => '
'
            }
          ],
          'type' => 'paragraph'
        }
      ],
      'extra' => {
        'is_target' => 1,
        'normalized' => 'chap-refs-node'
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
  'type' => 'document_root'
};
$result_trees{'top_in_ref'}{'contents'}[2]{'contents'}[2]{'contents'}[2]{'contents'}[0]{'extra'}{'node_content'}{'contents'}[0] = $result_trees{'top_in_ref'}{'contents'}[2]{'contents'}[2]{'contents'}[2]{'contents'}[0]{'contents'}[0];
$result_trees{'top_in_ref'}{'contents'}[2]{'contents'}[2]{'contents'}[6]{'contents'}[0]{'extra'}{'node_content'}{'contents'}[0] = $result_trees{'top_in_ref'}{'contents'}[2]{'contents'}[2]{'contents'}[6]{'contents'}[0]{'contents'}[0];
$result_trees{'top_in_ref'}{'contents'}[2]{'contents'}[2]{'contents'}[10]{'contents'}[0]{'extra'}{'node_content'}{'contents'}[0] = $result_trees{'top_in_ref'}{'contents'}[2]{'contents'}[2]{'contents'}[10]{'contents'}[0]{'contents'}[0];
$result_trees{'top_in_ref'}{'contents'}[2]{'contents'}[2]{'contents'}[14]{'contents'}[0]{'extra'}{'node_content'}{'contents'}[0] = $result_trees{'top_in_ref'}{'contents'}[2]{'contents'}[2]{'contents'}[14]{'contents'}[0]{'contents'}[0];
$result_trees{'top_in_ref'}{'contents'}[2]{'contents'}[2]{'contents'}[18]{'contents'}[0]{'extra'}{'node_content'}{'contents'}[0] = $result_trees{'top_in_ref'}{'contents'}[2]{'contents'}[2]{'contents'}[18]{'contents'}[0]{'contents'}[0];
$result_trees{'top_in_ref'}{'contents'}[2]{'contents'}[2]{'contents'}[22]{'contents'}[0]{'extra'}{'node_content'}{'contents'}[0] = $result_trees{'top_in_ref'}{'contents'}[2]{'contents'}[2]{'contents'}[22]{'contents'}[0]{'contents'}[0];
$result_trees{'top_in_ref'}{'contents'}[2]{'contents'}[2]{'contents'}[26]{'contents'}[0]{'extra'}{'node_content'}{'contents'}[0] = $result_trees{'top_in_ref'}{'contents'}[2]{'contents'}[2]{'contents'}[26]{'contents'}[0]{'contents'}[0];
$result_trees{'top_in_ref'}{'contents'}[2]{'contents'}[2]{'contents'}[30]{'contents'}[0]{'extra'}{'node_content'}{'contents'}[0] = $result_trees{'top_in_ref'}{'contents'}[2]{'contents'}[2]{'contents'}[30]{'contents'}[0]{'contents'}[0];
$result_trees{'top_in_ref'}{'contents'}[2]{'contents'}[2]{'contents'}[34]{'contents'}[0]{'extra'}{'node_content'}{'contents'}[0] = $result_trees{'top_in_ref'}{'contents'}[2]{'contents'}[2]{'contents'}[34]{'contents'}[0]{'contents'}[0];
$result_trees{'top_in_ref'}{'contents'}[2]{'contents'}[2]{'contents'}[38]{'contents'}[0]{'extra'}{'node_content'}{'contents'}[0] = $result_trees{'top_in_ref'}{'contents'}[2]{'contents'}[2]{'contents'}[38]{'contents'}[0]{'contents'}[0];
$result_trees{'top_in_ref'}{'contents'}[2]{'contents'}[2]{'contents'}[42]{'contents'}[0]{'extra'}{'node_content'}{'contents'}[0] = $result_trees{'top_in_ref'}{'contents'}[2]{'contents'}[2]{'contents'}[42]{'contents'}[0]{'contents'}[0];
$result_trees{'top_in_ref'}{'contents'}[2]{'contents'}[2]{'contents'}[46]{'contents'}[0]{'extra'}{'node_content'}{'contents'}[0] = $result_trees{'top_in_ref'}{'contents'}[2]{'contents'}[2]{'contents'}[46]{'contents'}[0]{'contents'}[0];
$result_trees{'top_in_ref'}{'contents'}[2]{'contents'}[2]{'contents'}[50]{'contents'}[0]{'extra'}{'node_content'}{'contents'}[0] = $result_trees{'top_in_ref'}{'contents'}[2]{'contents'}[2]{'contents'}[50]{'contents'}[0]{'contents'}[0];
$result_trees{'top_in_ref'}{'contents'}[2]{'contents'}[2]{'contents'}[54]{'contents'}[0]{'extra'}{'node_content'}{'contents'}[0] = $result_trees{'top_in_ref'}{'contents'}[2]{'contents'}[2]{'contents'}[54]{'contents'}[0]{'contents'}[0];
$result_trees{'top_in_ref'}{'contents'}[2]{'contents'}[4]{'contents'}[2]{'contents'}[0]{'extra'}{'manual_content'}{'contents'}[0] = $result_trees{'top_in_ref'}{'contents'}[2]{'contents'}[4]{'contents'}[2]{'contents'}[0]{'contents'}[1];
$result_trees{'top_in_ref'}{'contents'}[2]{'contents'}[4]{'contents'}[2]{'contents'}[0]{'extra'}{'node_content'}{'contents'}[0] = $result_trees{'top_in_ref'}{'contents'}[2]{'contents'}[4]{'contents'}[2]{'contents'}[0]{'contents'}[3];
$result_trees{'top_in_ref'}{'contents'}[2]{'contents'}[4]{'contents'}[6]{'contents'}[0]{'extra'}{'manual_content'}{'contents'}[0] = $result_trees{'top_in_ref'}{'contents'}[2]{'contents'}[4]{'contents'}[6]{'contents'}[0]{'contents'}[1];
$result_trees{'top_in_ref'}{'contents'}[2]{'contents'}[4]{'contents'}[6]{'contents'}[0]{'extra'}{'node_content'}{'contents'}[0] = $result_trees{'top_in_ref'}{'contents'}[2]{'contents'}[4]{'contents'}[6]{'contents'}[0]{'contents'}[3];
$result_trees{'top_in_ref'}{'contents'}[2]{'contents'}[4]{'contents'}[10]{'contents'}[0]{'extra'}{'manual_content'}{'contents'}[0] = $result_trees{'top_in_ref'}{'contents'}[2]{'contents'}[4]{'contents'}[10]{'contents'}[0]{'contents'}[1];
$result_trees{'top_in_ref'}{'contents'}[2]{'contents'}[4]{'contents'}[10]{'contents'}[0]{'extra'}{'node_content'}{'contents'}[0] = $result_trees{'top_in_ref'}{'contents'}[2]{'contents'}[4]{'contents'}[10]{'contents'}[0]{'contents'}[3];
$result_trees{'top_in_ref'}{'contents'}[2]{'contents'}[4]{'contents'}[14]{'contents'}[0]{'extra'}{'manual_content'}{'contents'}[0] = $result_trees{'top_in_ref'}{'contents'}[2]{'contents'}[4]{'contents'}[14]{'contents'}[0]{'contents'}[1];
$result_trees{'top_in_ref'}{'contents'}[2]{'contents'}[4]{'contents'}[14]{'contents'}[0]{'extra'}{'node_content'}{'contents'}[0] = $result_trees{'top_in_ref'}{'contents'}[2]{'contents'}[4]{'contents'}[14]{'contents'}[0]{'contents'}[3];
$result_trees{'top_in_ref'}{'contents'}[2]{'contents'}[4]{'contents'}[18]{'contents'}[0]{'extra'}{'manual_content'}{'contents'}[0] = $result_trees{'top_in_ref'}{'contents'}[2]{'contents'}[4]{'contents'}[18]{'contents'}[0]{'contents'}[1];
$result_trees{'top_in_ref'}{'contents'}[2]{'contents'}[4]{'contents'}[18]{'contents'}[0]{'extra'}{'node_content'}{'contents'}[0] = $result_trees{'top_in_ref'}{'contents'}[2]{'contents'}[4]{'contents'}[18]{'contents'}[0]{'contents'}[3];
$result_trees{'top_in_ref'}{'contents'}[2]{'contents'}[4]{'contents'}[22]{'contents'}[0]{'extra'}{'manual_content'}{'contents'}[0] = $result_trees{'top_in_ref'}{'contents'}[2]{'contents'}[4]{'contents'}[22]{'contents'}[0]{'contents'}[1];
$result_trees{'top_in_ref'}{'contents'}[2]{'contents'}[4]{'contents'}[22]{'contents'}[0]{'extra'}{'node_content'}{'contents'}[0] = $result_trees{'top_in_ref'}{'contents'}[2]{'contents'}[4]{'contents'}[22]{'contents'}[0]{'contents'}[3];
$result_trees{'top_in_ref'}{'contents'}[2]{'contents'}[4]{'contents'}[26]{'contents'}[0]{'extra'}{'manual_content'}{'contents'}[0] = $result_trees{'top_in_ref'}{'contents'}[2]{'contents'}[4]{'contents'}[26]{'contents'}[0]{'contents'}[1];
$result_trees{'top_in_ref'}{'contents'}[2]{'contents'}[4]{'contents'}[26]{'contents'}[0]{'extra'}{'node_content'}{'contents'}[0] = $result_trees{'top_in_ref'}{'contents'}[2]{'contents'}[4]{'contents'}[26]{'contents'}[0]{'contents'}[3];
$result_trees{'top_in_ref'}{'contents'}[2]{'contents'}[4]{'contents'}[30]{'contents'}[0]{'extra'}{'manual_content'}{'contents'}[0] = $result_trees{'top_in_ref'}{'contents'}[2]{'contents'}[4]{'contents'}[30]{'contents'}[0]{'contents'}[1];
$result_trees{'top_in_ref'}{'contents'}[2]{'contents'}[4]{'contents'}[30]{'contents'}[0]{'extra'}{'node_content'}{'contents'}[0] = $result_trees{'top_in_ref'}{'contents'}[2]{'contents'}[4]{'contents'}[30]{'contents'}[0]{'contents'}[3];
$result_trees{'top_in_ref'}{'contents'}[2]{'contents'}[4]{'contents'}[34]{'contents'}[0]{'extra'}{'manual_content'}{'contents'}[0] = $result_trees{'top_in_ref'}{'contents'}[2]{'contents'}[4]{'contents'}[34]{'contents'}[0]{'contents'}[1];
$result_trees{'top_in_ref'}{'contents'}[2]{'contents'}[4]{'contents'}[34]{'contents'}[0]{'extra'}{'node_content'}{'contents'}[0] = $result_trees{'top_in_ref'}{'contents'}[2]{'contents'}[4]{'contents'}[34]{'contents'}[0]{'contents'}[3];
$result_trees{'top_in_ref'}{'contents'}[2]{'contents'}[4]{'contents'}[38]{'contents'}[0]{'extra'}{'manual_content'}{'contents'}[0] = $result_trees{'top_in_ref'}{'contents'}[2]{'contents'}[4]{'contents'}[38]{'contents'}[0]{'contents'}[1];
$result_trees{'top_in_ref'}{'contents'}[2]{'contents'}[4]{'contents'}[38]{'contents'}[0]{'extra'}{'node_content'}{'contents'}[0] = $result_trees{'top_in_ref'}{'contents'}[2]{'contents'}[4]{'contents'}[38]{'contents'}[0]{'contents'}[3];
$result_trees{'top_in_ref'}{'contents'}[2]{'contents'}[4]{'contents'}[42]{'contents'}[0]{'extra'}{'manual_content'}{'contents'}[0] = $result_trees{'top_in_ref'}{'contents'}[2]{'contents'}[4]{'contents'}[42]{'contents'}[0]{'contents'}[1];
$result_trees{'top_in_ref'}{'contents'}[2]{'contents'}[4]{'contents'}[42]{'contents'}[0]{'extra'}{'node_content'}{'contents'}[0] = $result_trees{'top_in_ref'}{'contents'}[2]{'contents'}[4]{'contents'}[42]{'contents'}[0]{'contents'}[3];
$result_trees{'top_in_ref'}{'contents'}[2]{'contents'}[4]{'contents'}[46]{'contents'}[0]{'extra'}{'manual_content'}{'contents'}[0] = $result_trees{'top_in_ref'}{'contents'}[2]{'contents'}[4]{'contents'}[46]{'contents'}[0]{'contents'}[1];
$result_trees{'top_in_ref'}{'contents'}[2]{'contents'}[4]{'contents'}[46]{'contents'}[0]{'extra'}{'node_content'}{'contents'}[0] = $result_trees{'top_in_ref'}{'contents'}[2]{'contents'}[4]{'contents'}[46]{'contents'}[0]{'contents'}[3];
$result_trees{'top_in_ref'}{'contents'}[2]{'contents'}[4]{'contents'}[50]{'contents'}[0]{'extra'}{'manual_content'}{'contents'}[0] = $result_trees{'top_in_ref'}{'contents'}[2]{'contents'}[4]{'contents'}[50]{'contents'}[0]{'contents'}[1];
$result_trees{'top_in_ref'}{'contents'}[2]{'contents'}[4]{'contents'}[50]{'contents'}[0]{'extra'}{'node_content'}{'contents'}[0] = $result_trees{'top_in_ref'}{'contents'}[2]{'contents'}[4]{'contents'}[50]{'contents'}[0]{'contents'}[3];
$result_trees{'top_in_ref'}{'contents'}[2]{'contents'}[4]{'contents'}[54]{'contents'}[0]{'extra'}{'manual_content'}{'contents'}[0] = $result_trees{'top_in_ref'}{'contents'}[2]{'contents'}[4]{'contents'}[54]{'contents'}[0]{'contents'}[1];
$result_trees{'top_in_ref'}{'contents'}[2]{'contents'}[4]{'contents'}[54]{'contents'}[0]{'extra'}{'node_content'}{'contents'}[0] = $result_trees{'top_in_ref'}{'contents'}[2]{'contents'}[4]{'contents'}[54]{'contents'}[0]{'contents'}[3];
$result_trees{'top_in_ref'}{'contents'}[2]{'contents'}[6]{'contents'}[2]{'contents'}[0]{'extra'}{'node_content'}{'contents'}[0] = $result_trees{'top_in_ref'}{'contents'}[2]{'contents'}[6]{'contents'}[2]{'contents'}[0]{'contents'}[0];
$result_trees{'top_in_ref'}{'contents'}[2]{'contents'}[6]{'contents'}[6]{'contents'}[0]{'extra'}{'node_content'}{'contents'}[0] = $result_trees{'top_in_ref'}{'contents'}[2]{'contents'}[6]{'contents'}[6]{'contents'}[0]{'contents'}[0];
$result_trees{'top_in_ref'}{'contents'}[2]{'contents'}[6]{'contents'}[10]{'contents'}[0]{'extra'}{'node_content'}{'contents'}[0] = $result_trees{'top_in_ref'}{'contents'}[2]{'contents'}[6]{'contents'}[10]{'contents'}[0]{'contents'}[0];
$result_trees{'top_in_ref'}{'contents'}[2]{'contents'}[6]{'contents'}[14]{'contents'}[0]{'extra'}{'node_content'}{'contents'}[0] = $result_trees{'top_in_ref'}{'contents'}[2]{'contents'}[6]{'contents'}[14]{'contents'}[0]{'contents'}[0];

$result_texis{'top_in_ref'} = '@node Top

@node chap refs node

@code{@@ref@{Top,cross ref name@}} @ref{Top,cross ref name}
@code{@@ref@{Top,,title@}} @ref{Top,,title}
@code{@@ref@{Top,,,file name@}} @ref{Top,,,file name}
@code{@@ref@{Top,,,,manual@}} @ref{Top,,,,manual}
@code{@@ref@{Top,cross ref name,title,@}} @ref{Top,cross ref name,title,}
@code{@@ref@{Top,cross ref name,,file name@}} @ref{Top,cross ref name,,file name}
@code{@@ref@{Top,cross ref name,,,manual@}} @ref{Top,cross ref name,,,manual}
@code{@@ref@{Top,cross ref name,title,file name@}} @ref{Top,cross ref name,title,file name}
@code{@@ref@{Top,cross ref name,title,,manual@}} @ref{Top,cross ref name,title,,manual}
@code{@@ref@{Top,cross ref name,title, file name, manual@}} @ref{Top,cross ref name,title, file name, manual}
@code{@@ref@{Top,,title,file name@}} @ref{Top,,title,file name}
@code{@@ref@{Top,,title,,manual@}} @ref{Top,,title,,manual}
@code{@@ref@{Top,,title, file name, manual@}} @ref{Top,,title, file name, manual}
@code{@@ref@{Top,,,file name,manual@}} @ref{Top,,,file name,manual}

@code{@@ref@{(pman)Top,cross ref name@}} @ref{(pman)Top,cross ref name}
@code{@@ref@{(pman)Top,,title@}} @ref{(pman)Top,,title}
@code{@@ref@{(pman)Top,,,file name@}} @ref{(pman)Top,,,file name}
@code{@@ref@{(pman)Top,,,,manual@}} @ref{(pman)Top,,,,manual}
@code{@@ref@{(pman)Top,cross ref name,title,@}} @ref{(pman)Top,cross ref name,title,}
@code{@@ref@{(pman)Top,cross ref name,,file name@}} @ref{(pman)Top,cross ref name,,file name}
@code{@@ref@{(pman)Top,cross ref name,,,manual@}} @ref{(pman)Top,cross ref name,,,manual}
@code{@@ref@{(pman)Top,cross ref name,title,file name@}} @ref{(pman)Top,cross ref name,title,file name}
@code{@@ref@{(pman)Top,cross ref name,title,,manual@}} @ref{(pman)Top,cross ref name,title,,manual}
@code{@@ref@{(pman)Top,cross ref name,title, file name, manual@}} @ref{(pman)Top,cross ref name,title, file name, manual}
@code{@@ref@{(pman)Top,,title,file name@}} @ref{(pman)Top,,title,file name}
@code{@@ref@{(pman)Top,,title,,manual@}} @ref{(pman)Top,,title,,manual}
@code{@@ref@{(pman)Top,,title, file name, manual@}} @ref{(pman)Top,,title, file name, manual}
@code{@@ref@{(pman)Top,,,file name,manual@}} @ref{(pman)Top,,,file name,manual}

@code{@@inforef@{Top, cross ref name, file name@}} @inforef{Top, cross ref name, file name}
@code{@@inforef@{Top@}} @inforef{Top}
@code{@@inforef@{Top, cross ref name@}} @inforef{Top, cross ref name}
@code{@@inforef@{Top,,file name@}} @inforef{Top,,file name}
';


$result_texts{'top_in_ref'} = '

@ref{Top,cross ref name} Top
@ref{Top,,title} Top
@ref{Top,,,file name} Top
@ref{Top,,,,manual} Top
@ref{Top,cross ref name,title,} Top
@ref{Top,cross ref name,,file name} Top
@ref{Top,cross ref name,,,manual} Top
@ref{Top,cross ref name,title,file name} Top
@ref{Top,cross ref name,title,,manual} Top
@ref{Top,cross ref name,title, file name, manual} Top
@ref{Top,,title,file name} Top
@ref{Top,,title,,manual} Top
@ref{Top,,title, file name, manual} Top
@ref{Top,,,file name,manual} Top

@ref{(pman)Top,cross ref name} (pman)Top
@ref{(pman)Top,,title} (pman)Top
@ref{(pman)Top,,,file name} (pman)Top
@ref{(pman)Top,,,,manual} (pman)Top
@ref{(pman)Top,cross ref name,title,} (pman)Top
@ref{(pman)Top,cross ref name,,file name} (pman)Top
@ref{(pman)Top,cross ref name,,,manual} (pman)Top
@ref{(pman)Top,cross ref name,title,file name} (pman)Top
@ref{(pman)Top,cross ref name,title,,manual} (pman)Top
@ref{(pman)Top,cross ref name,title, file name, manual} (pman)Top
@ref{(pman)Top,,title,file name} (pman)Top
@ref{(pman)Top,,title,,manual} (pman)Top
@ref{(pman)Top,,title, file name, manual} (pman)Top
@ref{(pman)Top,,,file name,manual} (pman)Top

@inforef{Top, cross ref name, file name} Top
@inforef{Top} Top
@inforef{Top, cross ref name} Top
@inforef{Top,,file name} Top
';

$result_nodes{'top_in_ref'} = [
  {
    'cmdname' => 'node',
    'extra' => {
      'node_directions' => {
        'next' => {
          'cmdname' => 'node',
          'extra' => {
            'node_directions' => {
              'prev' => {}
            },
            'normalized' => 'chap-refs-node'
          }
        }
      },
      'normalized' => 'Top'
    }
  },
  {}
];
$result_nodes{'top_in_ref'}[0]{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'prev'} = $result_nodes{'top_in_ref'}[0];
$result_nodes{'top_in_ref'}[1] = $result_nodes{'top_in_ref'}[0]{'extra'}{'node_directions'}{'next'};

$result_menus{'top_in_ref'} = [
  {
    'extra' => {
      'normalized' => 'Top'
    }
  },
  {
    'extra' => {
      'normalized' => 'chap-refs-node'
    }
  }
];

$result_errors{'top_in_ref'} = [
  {
    'error_line' => 'warning: @inforef is obsolete
',
    'line_nr' => 35,
    'text' => '@inforef is obsolete',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: @inforef is obsolete
',
    'line_nr' => 36,
    'text' => '@inforef is obsolete',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: @inforef is obsolete
',
    'line_nr' => 37,
    'text' => '@inforef is obsolete',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: @inforef is obsolete
',
    'line_nr' => 38,
    'text' => '@inforef is obsolete',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: node `chap refs node\' not in menu
',
    'line_nr' => 3,
    'text' => 'node `chap refs node\' not in menu',
    'type' => 'warning'
  }
];


$result_floats{'top_in_ref'} = {};



$result_converted{'plaintext'}->{'top_in_ref'} = '‘@ref{Top,cross ref name}’ cross ref name: Top ‘@ref{Top,,title}’ title:
Top ‘@ref{Top,,,file name}’ (file name)Top ‘@ref{Top,,,,manual}’ Top in
‘manual’ ‘@ref{Top,cross ref name,title,}’ cross ref name: Top
‘@ref{Top,cross ref name,,file name}’ cross ref name: (file name)Top
‘@ref{Top,cross ref name,,,manual}’ cross ref name: Top in ‘manual’
‘@ref{Top,cross ref name,title,file name}’ cross ref name: (file
name)Top ‘@ref{Top,cross ref name,title,,manual}’ cross ref name: Top in
‘manual’ ‘@ref{Top,cross ref name,title, file name, manual}’ cross ref
name: (file name)Top ‘@ref{Top,,title,file name}’ title: (file name)Top
‘@ref{Top,,title,,manual}’ title: Top in ‘manual’ ‘@ref{Top,,title, file
name, manual}’ title: (file name)Top ‘@ref{Top,,,file name,manual}’
(file name)Top

   ‘@ref{(pman)Top,cross ref name}’ cross ref name: (pman)Top
‘@ref{(pman)Top,,title}’ title: (pman)Top ‘@ref{(pman)Top,,,file name}’
(file name)(pman)Top ‘@ref{(pman)Top,,,,manual}’ (pman)Top in ‘manual’
‘@ref{(pman)Top,cross ref name,title,}’ cross ref name: (pman)Top
‘@ref{(pman)Top,cross ref name,,file name}’ cross ref name: (file
name)(pman)Top ‘@ref{(pman)Top,cross ref name,,,manual}’ cross ref name:
(pman)Top in ‘manual’ ‘@ref{(pman)Top,cross ref name,title,file name}’
cross ref name: (file name)(pman)Top ‘@ref{(pman)Top,cross ref
name,title,,manual}’ cross ref name: (pman)Top in ‘manual’
‘@ref{(pman)Top,cross ref name,title, file name, manual}’ cross ref
name: (file name)(pman)Top ‘@ref{(pman)Top,,title,file name}’ title:
(file name)(pman)Top ‘@ref{(pman)Top,,title,,manual}’ title: (pman)Top
in ‘manual’ ‘@ref{(pman)Top,,title, file name, manual}’ title: (file
name)(pman)Top ‘@ref{(pman)Top,,,file name,manual}’ (file name)(pman)Top

   ‘@inforef{Top, cross ref name, file name}’ See cross ref name: (file
name)Top ‘@inforef{Top}’ See Top ‘@inforef{Top, cross ref name}’ See
cross ref name: Top ‘@inforef{Top,,file name}’ See (file name)Top
';


$result_converted{'html_text'}->{'top_in_ref'} = '<h1 class="node" id="Top"><span>Top<a class="copiable-link" href="#Top"> &para;</a></span></h1>

<hr>
<h4 class="node" id="chap-refs-node"><span>chap refs node<a class="copiable-link" href="#chap-refs-node"> &para;</a></span></h4>

<p><code class="code">@ref{Top,cross ref name}</code> <a class="ref" href="#Top">cross ref name</a>
<code class="code">@ref{Top,,title}</code> <a class="ref" href="#Top">title</a>
<code class="code">@ref{Top,,,file name}</code> <a data-manual="file name" href="file%20name.html#Top">(file name)Top</a>
<code class="code">@ref{Top,,,,manual}</code> <cite class="cite">manual</cite>
<code class="code">@ref{Top,cross ref name,title,}</code> <a class="ref" href="#Top">title</a>
<code class="code">@ref{Top,cross ref name,,file name}</code> <a data-manual="file name" href="file%20name.html#Top">cross ref name</a>
<code class="code">@ref{Top,cross ref name,,,manual}</code> &lsquo;cross ref name&rsquo; in <cite class="cite">manual</cite>
<code class="code">@ref{Top,cross ref name,title,file name}</code> <a data-manual="file name" href="file%20name.html#Top">title</a>
<code class="code">@ref{Top,cross ref name,title,,manual}</code> &lsquo;title&rsquo; in <cite class="cite">manual</cite>
<code class="code">@ref{Top,cross ref name,title, file name, manual}</code> <a data-manual="file name" href="file%20name.html#Top">title</a> in <cite class="cite">manual</cite>
<code class="code">@ref{Top,,title,file name}</code> <a data-manual="file name" href="file%20name.html#Top">title</a>
<code class="code">@ref{Top,,title,,manual}</code> &lsquo;title&rsquo; in <cite class="cite">manual</cite>
<code class="code">@ref{Top,,title, file name, manual}</code> <a data-manual="file name" href="file%20name.html#Top">title</a> in <cite class="cite">manual</cite>
<code class="code">@ref{Top,,,file name,manual}</code> <cite class="cite"><a data-manual="file name" href="file%20name.html#Top">manual</a></cite>
</p>
<p><code class="code">@ref{(pman)Top,cross ref name}</code> <a data-manual="pman" href="pman.html#Top">cross ref name</a>
<code class="code">@ref{(pman)Top,,title}</code> <a data-manual="pman" href="pman.html#Top">title</a>
<code class="code">@ref{(pman)Top,,,file name}</code> <a data-manual="file name" href="file%20name.html#Top">(file name)Top</a>
<code class="code">@ref{(pman)Top,,,,manual}</code> <cite class="cite"><a data-manual="pman" href="pman.html#Top">manual</a></cite>
<code class="code">@ref{(pman)Top,cross ref name,title,}</code> <a data-manual="pman" href="pman.html#Top">title</a>
<code class="code">@ref{(pman)Top,cross ref name,,file name}</code> <a data-manual="file name" href="file%20name.html#Top">cross ref name</a>
<code class="code">@ref{(pman)Top,cross ref name,,,manual}</code> <a data-manual="pman" href="pman.html#Top">cross ref name</a> in <cite class="cite">manual</cite>
<code class="code">@ref{(pman)Top,cross ref name,title,file name}</code> <a data-manual="file name" href="file%20name.html#Top">title</a>
<code class="code">@ref{(pman)Top,cross ref name,title,,manual}</code> <a data-manual="pman" href="pman.html#Top">title</a> in <cite class="cite">manual</cite>
<code class="code">@ref{(pman)Top,cross ref name,title, file name, manual}</code> <a data-manual="file name" href="file%20name.html#Top">title</a> in <cite class="cite">manual</cite>
<code class="code">@ref{(pman)Top,,title,file name}</code> <a data-manual="file name" href="file%20name.html#Top">title</a>
<code class="code">@ref{(pman)Top,,title,,manual}</code> <a data-manual="pman" href="pman.html#Top">title</a> in <cite class="cite">manual</cite>
<code class="code">@ref{(pman)Top,,title, file name, manual}</code> <a data-manual="file name" href="file%20name.html#Top">title</a> in <cite class="cite">manual</cite>
<code class="code">@ref{(pman)Top,,,file name,manual}</code> <cite class="cite"><a data-manual="file name" href="file%20name.html#Top">manual</a></cite>
</p>
<p><code class="code">@inforef{Top, cross ref name, file name}</code> See <a data-manual="file name" href="file%20name.html#Top">cross ref name</a>
<code class="code">@inforef{Top}</code> 
<code class="code">@inforef{Top, cross ref name}</code> See &lsquo;cross ref name&rsquo;
<code class="code">@inforef{Top,,file name}</code> See <a data-manual="file name" href="file%20name.html#Top">(file name)Top</a>
</p>';


$result_converted{'xml'}->{'top_in_ref'} = '<node name="Top" spaces=" "><nodename>Top</nodename><nodenext automatic="on">chap refs node</nodenext></node>

<node name="chap-refs-node" spaces=" "><nodename>chap refs node</nodename><nodeprev automatic="on">Top</nodeprev></node>

<para><code>&arobase;ref&lbrace;Top,cross ref name&rbrace;</code> <ref label="Top"><xrefnodename>Top</xrefnodename><xrefinfoname>cross ref name</xrefinfoname></ref>
<code>&arobase;ref&lbrace;Top,,title&rbrace;</code> <ref label="Top"><xrefnodename>Top</xrefnodename><xrefprinteddesc>title</xrefprinteddesc></ref>
<code>&arobase;ref&lbrace;Top,,,file name&rbrace;</code> <ref label="Top" manual="file name"><xrefnodename>Top</xrefnodename><xrefinfofile>file name</xrefinfofile></ref>
<code>&arobase;ref&lbrace;Top,,,,manual&rbrace;</code> <ref label="Top"><xrefnodename>Top</xrefnodename><xrefprintedname>manual</xrefprintedname></ref>
<code>&arobase;ref&lbrace;Top,cross ref name,title,&rbrace;</code> <ref label="Top"><xrefnodename>Top</xrefnodename><xrefinfoname>cross ref name</xrefinfoname><xrefprinteddesc>title</xrefprinteddesc><xrefinfofile></xrefinfofile></ref>
<code>&arobase;ref&lbrace;Top,cross ref name,,file name&rbrace;</code> <ref label="Top" manual="file name"><xrefnodename>Top</xrefnodename><xrefinfoname>cross ref name</xrefinfoname><xrefinfofile>file name</xrefinfofile></ref>
<code>&arobase;ref&lbrace;Top,cross ref name,,,manual&rbrace;</code> <ref label="Top"><xrefnodename>Top</xrefnodename><xrefinfoname>cross ref name</xrefinfoname><xrefprintedname>manual</xrefprintedname></ref>
<code>&arobase;ref&lbrace;Top,cross ref name,title,file name&rbrace;</code> <ref label="Top" manual="file name"><xrefnodename>Top</xrefnodename><xrefinfoname>cross ref name</xrefinfoname><xrefprinteddesc>title</xrefprinteddesc><xrefinfofile>file name</xrefinfofile></ref>
<code>&arobase;ref&lbrace;Top,cross ref name,title,,manual&rbrace;</code> <ref label="Top"><xrefnodename>Top</xrefnodename><xrefinfoname>cross ref name</xrefinfoname><xrefprinteddesc>title</xrefprinteddesc><xrefprintedname>manual</xrefprintedname></ref>
<code>&arobase;ref&lbrace;Top,cross ref name,title, file name, manual&rbrace;</code> <ref label="Top" manual="file name"><xrefnodename>Top</xrefnodename><xrefinfoname>cross ref name</xrefinfoname><xrefprinteddesc>title</xrefprinteddesc><xrefinfofile spaces=" ">file name</xrefinfofile><xrefprintedname spaces=" ">manual</xrefprintedname></ref>
<code>&arobase;ref&lbrace;Top,,title,file name&rbrace;</code> <ref label="Top" manual="file name"><xrefnodename>Top</xrefnodename><xrefprinteddesc>title</xrefprinteddesc><xrefinfofile>file name</xrefinfofile></ref>
<code>&arobase;ref&lbrace;Top,,title,,manual&rbrace;</code> <ref label="Top"><xrefnodename>Top</xrefnodename><xrefprinteddesc>title</xrefprinteddesc><xrefprintedname>manual</xrefprintedname></ref>
<code>&arobase;ref&lbrace;Top,,title, file name, manual&rbrace;</code> <ref label="Top" manual="file name"><xrefnodename>Top</xrefnodename><xrefprinteddesc>title</xrefprinteddesc><xrefinfofile spaces=" ">file name</xrefinfofile><xrefprintedname spaces=" ">manual</xrefprintedname></ref>
<code>&arobase;ref&lbrace;Top,,,file name,manual&rbrace;</code> <ref label="Top" manual="file name"><xrefnodename>Top</xrefnodename><xrefinfofile>file name</xrefinfofile><xrefprintedname>manual</xrefprintedname></ref>
</para>
<para><code>&arobase;ref&lbrace;(pman)Top,cross ref name&rbrace;</code> <ref label="Top" manual="pman"><xrefnodename>(pman)Top</xrefnodename><xrefinfoname>cross ref name</xrefinfoname></ref>
<code>&arobase;ref&lbrace;(pman)Top,,title&rbrace;</code> <ref label="Top" manual="pman"><xrefnodename>(pman)Top</xrefnodename><xrefprinteddesc>title</xrefprinteddesc></ref>
<code>&arobase;ref&lbrace;(pman)Top,,,file name&rbrace;</code> <ref label="Top" manual="file name"><xrefnodename>(pman)Top</xrefnodename><xrefinfofile>file name</xrefinfofile></ref>
<code>&arobase;ref&lbrace;(pman)Top,,,,manual&rbrace;</code> <ref label="Top" manual="pman"><xrefnodename>(pman)Top</xrefnodename><xrefprintedname>manual</xrefprintedname></ref>
<code>&arobase;ref&lbrace;(pman)Top,cross ref name,title,&rbrace;</code> <ref label="Top" manual="pman"><xrefnodename>(pman)Top</xrefnodename><xrefinfoname>cross ref name</xrefinfoname><xrefprinteddesc>title</xrefprinteddesc><xrefinfofile></xrefinfofile></ref>
<code>&arobase;ref&lbrace;(pman)Top,cross ref name,,file name&rbrace;</code> <ref label="Top" manual="file name"><xrefnodename>(pman)Top</xrefnodename><xrefinfoname>cross ref name</xrefinfoname><xrefinfofile>file name</xrefinfofile></ref>
<code>&arobase;ref&lbrace;(pman)Top,cross ref name,,,manual&rbrace;</code> <ref label="Top" manual="pman"><xrefnodename>(pman)Top</xrefnodename><xrefinfoname>cross ref name</xrefinfoname><xrefprintedname>manual</xrefprintedname></ref>
<code>&arobase;ref&lbrace;(pman)Top,cross ref name,title,file name&rbrace;</code> <ref label="Top" manual="file name"><xrefnodename>(pman)Top</xrefnodename><xrefinfoname>cross ref name</xrefinfoname><xrefprinteddesc>title</xrefprinteddesc><xrefinfofile>file name</xrefinfofile></ref>
<code>&arobase;ref&lbrace;(pman)Top,cross ref name,title,,manual&rbrace;</code> <ref label="Top" manual="pman"><xrefnodename>(pman)Top</xrefnodename><xrefinfoname>cross ref name</xrefinfoname><xrefprinteddesc>title</xrefprinteddesc><xrefprintedname>manual</xrefprintedname></ref>
<code>&arobase;ref&lbrace;(pman)Top,cross ref name,title, file name, manual&rbrace;</code> <ref label="Top" manual="file name"><xrefnodename>(pman)Top</xrefnodename><xrefinfoname>cross ref name</xrefinfoname><xrefprinteddesc>title</xrefprinteddesc><xrefinfofile spaces=" ">file name</xrefinfofile><xrefprintedname spaces=" ">manual</xrefprintedname></ref>
<code>&arobase;ref&lbrace;(pman)Top,,title,file name&rbrace;</code> <ref label="Top" manual="file name"><xrefnodename>(pman)Top</xrefnodename><xrefprinteddesc>title</xrefprinteddesc><xrefinfofile>file name</xrefinfofile></ref>
<code>&arobase;ref&lbrace;(pman)Top,,title,,manual&rbrace;</code> <ref label="Top" manual="pman"><xrefnodename>(pman)Top</xrefnodename><xrefprinteddesc>title</xrefprinteddesc><xrefprintedname>manual</xrefprintedname></ref>
<code>&arobase;ref&lbrace;(pman)Top,,title, file name, manual&rbrace;</code> <ref label="Top" manual="file name"><xrefnodename>(pman)Top</xrefnodename><xrefprinteddesc>title</xrefprinteddesc><xrefinfofile spaces=" ">file name</xrefinfofile><xrefprintedname spaces=" ">manual</xrefprintedname></ref>
<code>&arobase;ref&lbrace;(pman)Top,,,file name,manual&rbrace;</code> <ref label="Top" manual="file name"><xrefnodename>(pman)Top</xrefnodename><xrefinfofile>file name</xrefinfofile><xrefprintedname>manual</xrefprintedname></ref>
</para>
<para><code>&arobase;inforef&lbrace;Top, cross ref name, file name&rbrace;</code> <inforef label="Top" manual="file name"><inforefnodename>Top</inforefnodename><inforefrefname spaces=" ">cross ref name</inforefrefname><inforefinfoname spaces=" ">file name</inforefinfoname></inforef>
<code>&arobase;inforef&lbrace;Top&rbrace;</code> <inforef label="Top"><inforefnodename>Top</inforefnodename></inforef>
<code>&arobase;inforef&lbrace;Top, cross ref name&rbrace;</code> <inforef label="Top"><inforefnodename>Top</inforefnodename><inforefrefname spaces=" ">cross ref name</inforefrefname></inforef>
<code>&arobase;inforef&lbrace;Top,,file name&rbrace;</code> <inforef label="Top" manual="file name"><inforefnodename>Top</inforefnodename><inforefinfoname>file name</inforefinfoname></inforef>
</para>';


$result_converted{'docbook'}->{'top_in_ref'} = '<anchor id="chap-refs-node"/>

<para><literal>@ref{Top,cross ref name}</literal> <link linkend="Top">cross ref name</link>
<literal>@ref{Top,,title}</literal> <link linkend="Top">title</link>
<literal>@ref{Top,,,file name}</literal> <filename>file name</filename>
<literal>@ref{Top,,,,manual}</literal> <citetitle>manual</citetitle>
<literal>@ref{Top,cross ref name,title,}</literal> <link linkend="Top">title</link>
<literal>@ref{Top,cross ref name,,file name}</literal> section &#8220;cross ref name&#8221; in <filename>file name</filename>
<literal>@ref{Top,cross ref name,,,manual}</literal> section &#8220;cross ref name&#8221; in <citetitle>manual</citetitle>
<literal>@ref{Top,cross ref name,title,file name}</literal> section &#8220;title&#8221; in <filename>file name</filename>
<literal>@ref{Top,cross ref name,title,,manual}</literal> section &#8220;title&#8221; in <citetitle>manual</citetitle>
<literal>@ref{Top,cross ref name,title, file name, manual}</literal> section &#8220;title&#8221; in <citetitle>manual</citetitle>
<literal>@ref{Top,,title,file name}</literal> section &#8220;title&#8221; in <filename>file name</filename>
<literal>@ref{Top,,title,,manual}</literal> section &#8220;title&#8221; in <citetitle>manual</citetitle>
<literal>@ref{Top,,title, file name, manual}</literal> section &#8220;title&#8221; in <citetitle>manual</citetitle>
<literal>@ref{Top,,,file name,manual}</literal> <citetitle>manual</citetitle>
</para>
<para><literal>@ref{(pman)Top,cross ref name}</literal> <link>cross ref name</link>
<literal>@ref{(pman)Top,,title}</literal> <link>title</link>
<literal>@ref{(pman)Top,,,file name}</literal> &#8220;(pman)Top&#8221; in <filename>file name</filename>
<literal>@ref{(pman)Top,,,,manual}</literal> &#8220;(pman)Top&#8221; in <citetitle>manual</citetitle>
<literal>@ref{(pman)Top,cross ref name,title,}</literal> <link>title</link>
<literal>@ref{(pman)Top,cross ref name,,file name}</literal> section &#8220;cross ref name&#8221; in <filename>file name</filename>
<literal>@ref{(pman)Top,cross ref name,,,manual}</literal> section &#8220;cross ref name&#8221; in <citetitle>manual</citetitle>
<literal>@ref{(pman)Top,cross ref name,title,file name}</literal> section &#8220;title&#8221; in <filename>file name</filename>
<literal>@ref{(pman)Top,cross ref name,title,,manual}</literal> section &#8220;title&#8221; in <citetitle>manual</citetitle>
<literal>@ref{(pman)Top,cross ref name,title, file name, manual}</literal> section &#8220;title&#8221; in <citetitle>manual</citetitle>
<literal>@ref{(pman)Top,,title,file name}</literal> section &#8220;title&#8221; in <filename>file name</filename>
<literal>@ref{(pman)Top,,title,,manual}</literal> section &#8220;title&#8221; in <citetitle>manual</citetitle>
<literal>@ref{(pman)Top,,title, file name, manual}</literal> section &#8220;title&#8221; in <citetitle>manual</citetitle>
<literal>@ref{(pman)Top,,,file name,manual}</literal> &#8220;(pman)Top&#8221; in <citetitle>manual</citetitle>
</para>
<para><literal>@inforef{Top, cross ref name, file name}</literal> See section &#8220;cross ref name&#8221; in <filename>file name</filename>
<literal>@inforef{Top}</literal> 
<literal>@inforef{Top, cross ref name}</literal> 
<literal>@inforef{Top,,file name}</literal> See <filename>file name</filename>
</para>';


$result_converted{'latex_text'}->{'top_in_ref'} = '\\label{anchor:Top}%
\\label{anchor:chap-refs-node}%

\\texttt{@ref\\{Top,cross ref name\\}} \\hyperref[anchor:Top]{[Top], page~\\pageref*{anchor:Top}}
\\texttt{@ref\\{Top{,}{,}title\\}} \\hyperref[anchor:Top]{[title], page~\\pageref*{anchor:Top}}
\\texttt{@ref\\{Top{,}{,},file name\\}} Section ``Top\'\' in \\texttt{file name}
\\texttt{@ref\\{Top{,}{,}{,}{,}manual\\}} Section ``Top\'\' in \\textsl{manual}
\\texttt{@ref\\{Top,cross ref name,title,\\}} \\hyperref[anchor:Top]{[title], page~\\pageref*{anchor:Top}}
\\texttt{@ref\\{Top,cross ref name{,}{,}file name\\}} Section ``Top\'\' in \\texttt{file name}
\\texttt{@ref\\{Top,cross ref name{,}{,},manual\\}} Section ``Top\'\' in \\textsl{manual}
\\texttt{@ref\\{Top,cross ref name,title,file name\\}} Section ``title\'\' in \\texttt{file name}
\\texttt{@ref\\{Top,cross ref name,title{,}{,}manual\\}} Section ``title\'\' in \\textsl{manual}
\\texttt{@ref\\{Top,cross ref name,title,\\ file name,\\ manual\\}} Section ``title\'\' in \\textsl{manual}
\\texttt{@ref\\{Top{,}{,}title,file name\\}} Section ``title\'\' in \\texttt{file name}
\\texttt{@ref\\{Top{,}{,}title{,}{,}manual\\}} Section ``title\'\' in \\textsl{manual}
\\texttt{@ref\\{Top{,}{,}title,\\ file name,\\ manual\\}} Section ``title\'\' in \\textsl{manual}
\\texttt{@ref\\{Top{,}{,},file name,manual\\}} Section ``Top\'\' in \\textsl{manual}

\\texttt{@ref\\{(pman)Top,cross ref name\\}} (pman)Top
\\texttt{@ref\\{(pman)Top{,}{,}title\\}} title
\\texttt{@ref\\{(pman)Top{,}{,},file name\\}} Section ``(pman)Top\'\' in \\texttt{file name}
\\texttt{@ref\\{(pman)Top{,}{,}{,}{,}manual\\}} Section ``(pman)Top\'\' in \\textsl{manual}
\\texttt{@ref\\{(pman)Top,cross ref name,title,\\}} title
\\texttt{@ref\\{(pman)Top,cross ref name{,}{,}file name\\}} Section ``(pman)Top\'\' in \\texttt{file name}
\\texttt{@ref\\{(pman)Top,cross ref name{,}{,},manual\\}} Section ``(pman)Top\'\' in \\textsl{manual}
\\texttt{@ref\\{(pman)Top,cross ref name,title,file name\\}} Section ``title\'\' in \\texttt{file name}
\\texttt{@ref\\{(pman)Top,cross ref name,title{,}{,}manual\\}} Section ``title\'\' in \\textsl{manual}
\\texttt{@ref\\{(pman)Top,cross ref name,title,\\ file name,\\ manual\\}} Section ``title\'\' in \\textsl{manual}
\\texttt{@ref\\{(pman)Top{,}{,}title,file name\\}} Section ``title\'\' in \\texttt{file name}
\\texttt{@ref\\{(pman)Top{,}{,}title{,}{,}manual\\}} Section ``title\'\' in \\textsl{manual}
\\texttt{@ref\\{(pman)Top{,}{,}title,\\ file name,\\ manual\\}} Section ``title\'\' in \\textsl{manual}
\\texttt{@ref\\{(pman)Top{,}{,},file name,manual\\}} Section ``(pman)Top\'\' in \\textsl{manual}

\\texttt{@inforef\\{Top,\\ cross ref name,\\ file name\\}} Section ``Top\'\' in \\texttt{file name}
\\texttt{@inforef\\{Top\\}} Top
\\texttt{@inforef\\{Top,\\ cross ref name\\}} Top
\\texttt{@inforef\\{Top{,}{,}file name\\}} Section ``Top\'\' in \\texttt{file name}
';


$result_converted{'info'}->{'top_in_ref'} = 'This is , produced from .


File: ,  Node: Top,  Next: chap refs node,  Up: (dir)


File: ,  Node: chap refs node,  Prev: Top

‘@ref{Top,cross ref name}’ *note cross ref name: Top. ‘@ref{Top,,title}’
*note title: Top. ‘@ref{Top,,,file name}’ *note (file name)Top::
‘@ref{Top,,,,manual}’ *note ()Top:: ‘@ref{Top,cross ref name,title,}’
*note cross ref name: Top. ‘@ref{Top,cross ref name,,file name}’ *note
cross ref name: (file name)Top. ‘@ref{Top,cross ref name,,,manual}’
*note cross ref name: ()Top. ‘@ref{Top,cross ref name,title,file name}’
*note cross ref name: (file name)Top. ‘@ref{Top,cross ref
name,title,,manual}’ *note cross ref name: ()Top. ‘@ref{Top,cross ref
name,title, file name, manual}’ *note cross ref name: (file name)Top.
‘@ref{Top,,title,file name}’ *note title: (file name)Top.
‘@ref{Top,,title,,manual}’ *note title: ()Top. ‘@ref{Top,,title, file
name, manual}’ *note title: (file name)Top. ‘@ref{Top,,,file
name,manual}’ *note (file name)Top::

   ‘@ref{(pman)Top,cross ref name}’ *note cross ref name: (pman)Top.
‘@ref{(pman)Top,,title}’ *note title: (pman)Top. ‘@ref{(pman)Top,,,file
name}’ *note (file name)(pman)Top:: ‘@ref{(pman)Top,,,,manual}’ *note
()(pman)Top:: ‘@ref{(pman)Top,cross ref name,title,}’ *note cross ref
name: (pman)Top. ‘@ref{(pman)Top,cross ref name,,file name}’ *note cross
ref name: (file name)(pman)Top. ‘@ref{(pman)Top,cross ref
name,,,manual}’ *note cross ref name: ()(pman)Top. ‘@ref{(pman)Top,cross
ref name,title,file name}’ *note cross ref name: (file name)(pman)Top.
‘@ref{(pman)Top,cross ref name,title,,manual}’ *note cross ref name:
()(pman)Top. ‘@ref{(pman)Top,cross ref name,title, file name, manual}’
*note cross ref name: (file name)(pman)Top. ‘@ref{(pman)Top,,title,file
name}’ *note title: (file name)(pman)Top.
‘@ref{(pman)Top,,title,,manual}’ *note title: ()(pman)Top.
‘@ref{(pman)Top,,title, file name, manual}’ *note title: (file
name)(pman)Top. ‘@ref{(pman)Top,,,file name,manual}’ *note (file
name)(pman)Top::

   ‘@inforef{Top, cross ref name, file name}’ *note cross ref name:
(file name)Top. ‘@inforef{Top}’ *note Top:: ‘@inforef{Top, cross ref
name}’ *note cross ref name: Top. ‘@inforef{Top,,file name}’ *note (file
name)Top::


Tag Table:
Node: Top27
Node: chap refs node84

End Tag Table


Local Variables:
coding: utf-8
End:
';

1;
