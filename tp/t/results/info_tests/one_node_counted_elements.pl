use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'one_node_counted_elements'} = {
  'contents' => [
    {
      'contents' => [
        {
          'contents' => [
            {
              'text' => 'Garbage
'
            },
            {
              'cmdname' => 'cindex',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'before nodes'
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
                'index_entry' => [
                  'cp',
                  1
                ]
              },
              'info' => {
                'command_name' => 'cindex',
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'line_nr' => 2
              },
              'type' => 'index_entry_command'
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
    },
    {
      'cmdname' => 'node',
      'contents' => [
        {
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'one node'
                }
              ],
              'type' => 'line_arg'
            },
            {
              'type' => 'line_arg'
            },
            {
              'type' => 'line_arg'
            },
            {
              'contents' => [
                {
                  'text' => '('
                },
                {
                  'text' => 'dir'
                },
                {
                  'text' => ')'
                }
              ],
              'extra' => {
                'manual_content' => {
                  'contents' => [
                    {}
                  ]
                }
              },
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
          'contents' => [
            {
              'text' => 'Top node
'
            },
            {
              'cmdname' => 'cindex',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'Top node'
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
                'element_node' => {},
                'index_entry' => [
                  'cp',
                  2
                ]
              },
              'info' => {
                'command_name' => 'cindex',
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'line_nr' => 6
              },
              'type' => 'index_entry_command'
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
              'text' => 'anchor ref '
            },
            {
              'cmdname' => 'anchor',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'ref'
                    }
                  ],
                  'type' => 'brace_arg'
                }
              ],
              'extra' => {
                'is_target' => 1,
                'normalized' => 'ref'
              },
              'source_info' => {
                'line_nr' => 8
              }
            },
            {
              'text' => '.
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
          'cmdname' => 'menu',
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
            },
            {
              'contents' => [
                {
                  'text' => '* ',
                  'type' => 'menu_entry_leading_text'
                },
                {
                  'contents' => [
                    {
                      'text' => '('
                    },
                    {
                      'text' => 'some_manual_name_with_gcc'
                    },
                    {
                      'text' => ')'
                    }
                  ],
                  'extra' => {
                    'manual_content' => {
                      'contents' => [
                        {}
                      ]
                    }
                  },
                  'type' => 'menu_entry_node'
                },
                {
                  'text' => ':: ',
                  'type' => 'menu_entry_separator'
                },
                {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'ref to gcc
'
                        }
                      ],
                      'type' => 'preformatted'
                    }
                  ],
                  'type' => 'menu_entry_description'
                }
              ],
              'source_info' => {
                'line_nr' => 11
              },
              'type' => 'menu_entry'
            },
            {
              'cmdname' => 'end',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'menu'
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
                'text_arg' => 'menu'
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'line_nr' => 12
              }
            }
          ],
          'source_info' => {
            'line_nr' => 10
          }
        },
        {
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'contents' => [
            {
              'text' => 'ref to ref '
            },
            {
              'cmdname' => 'ref',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'ref'
                    }
                  ],
                  'extra' => {
                    'node_content' => {
                      'contents' => [
                        {}
                      ]
                    },
                    'normalized' => 'ref'
                  },
                  'type' => 'brace_arg'
                }
              ],
              'source_info' => {
                'line_nr' => 15
              }
            },
            {
              'text' => '.
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
              'text' => 'Some text.
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
          'cmdname' => 'printindex',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'cp'
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
              'cp'
            ]
          },
          'info' => {
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'line_nr' => 19
          }
        }
      ],
      'extra' => {
        'is_target' => 1,
        'isindex' => 1,
        'normalized' => 'one-node'
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
  'type' => 'document_root'
};
$result_trees{'one_node_counted_elements'}{'contents'}[1]{'contents'}[0]{'contents'}[3]{'extra'}{'manual_content'}{'contents'}[0] = $result_trees{'one_node_counted_elements'}{'contents'}[1]{'contents'}[0]{'contents'}[3]{'contents'}[1];
$result_trees{'one_node_counted_elements'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'extra'}{'element_node'} = $result_trees{'one_node_counted_elements'}{'contents'}[1];
$result_trees{'one_node_counted_elements'}{'contents'}[1]{'contents'}[5]{'contents'}[1]{'contents'}[1]{'extra'}{'manual_content'}{'contents'}[0] = $result_trees{'one_node_counted_elements'}{'contents'}[1]{'contents'}[5]{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'one_node_counted_elements'}{'contents'}[1]{'contents'}[8]{'contents'}[1]{'contents'}[0]{'extra'}{'node_content'}{'contents'}[0] = $result_trees{'one_node_counted_elements'}{'contents'}[1]{'contents'}[8]{'contents'}[1]{'contents'}[0]{'contents'}[0];

$result_texis{'one_node_counted_elements'} = 'Garbage
@cindex before nodes

@node one node,,,(dir)
Top node
@cindex Top node

anchor ref @anchor{ref}.

@menu
* (some_manual_name_with_gcc):: ref to gcc
@end menu


ref to ref @ref{ref}.

Some text.

@printindex cp
';


$result_texts{'one_node_counted_elements'} = 'Garbage

Top node

anchor ref .

* (some_manual_name_with_gcc):: ref to gcc


ref to ref ref.

Some text.

';

$result_nodes{'one_node_counted_elements'} = [
  {
    'cmdname' => 'node',
    'extra' => {
      'isindex' => 1,
      'node_directions' => {
        'up' => {
          'extra' => {
            'manual_content' => {}
          },
          'type' => 'line_arg'
        }
      },
      'normalized' => 'one-node'
    }
  }
];

$result_menus{'one_node_counted_elements'} = [
  {
    'extra' => {
      'menus' => [
        {}
      ],
      'normalized' => 'one-node'
    }
  }
];

$result_errors{'one_node_counted_elements'} = [
  {
    'error_line' => 'warning: entry for index `cp\' outside of any node
',
    'line_nr' => 2,
    'text' => 'entry for index `cp\' outside of any node',
    'type' => 'warning'
  }
];


$result_floats{'one_node_counted_elements'} = {};


$result_indices_sort_strings{'one_node_counted_elements'} = {
  'cp' => [
    'before nodes',
    'Top node'
  ]
};



$result_converted{'info'}->{'one_node_counted_elements'} = 'This is , produced from .

Garbage


File: ,  Node: one node,  Up: (dir)

Top node

   anchor ref .

* Menu:

* (some_manual_name_with_gcc):: ref to gcc

   ref to ref *note ref::.

   Some text.

 [index ]
* Menu:

* before nodes:                          (outside of any node). (line 0)
* Top node:                              one node.              (line 3)


Tag Table:
Node: one node36
Ref: ref98

End Tag Table


Local Variables:
coding: utf-8
End:
';

$result_converted_errors{'info'}->{'one_node_counted_elements'} = [
  {
    'error_line' => 'warning: document without Top node
',
    'text' => 'document without Top node',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: entry for index `cp\' outside of any node
',
    'line_nr' => 2,
    'text' => 'entry for index `cp\' outside of any node',
    'type' => 'warning'
  }
];


1;
