use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'index_entry_before_node'} = {
  'contents' => [
    {
      'contents' => [
        {
          'contents' => [],
          'parent' => {},
          'type' => 'preamble_before_content'
        }
      ],
      'parent' => {},
      'type' => 'before_node_section'
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'Top'
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
      'cmdname' => 'node',
      'contents' => [
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line'
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
          'cmdname' => 'menu',
          'contents' => [
            {
              'args' => [
                {
                  'parent' => {},
                  'text' => '* ',
                  'type' => 'menu_entry_leading_text'
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'first'
                    }
                  ],
                  'parent' => {},
                  'type' => 'menu_entry_node'
                },
                {
                  'parent' => {},
                  'text' => '::',
                  'type' => 'menu_entry_separator'
                },
                {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => '
'
                        }
                      ],
                      'parent' => {},
                      'type' => 'preformatted'
                    }
                  ],
                  'parent' => {},
                  'type' => 'menu_entry_description'
                }
              ],
              'extra' => {
                'menu_entry_description' => {},
                'menu_entry_node' => {
                  'node_content' => [
                    {}
                  ],
                  'normalized' => 'first'
                }
              },
              'parent' => {},
              'source_info' => {
                'file_name' => '',
                'line_nr' => 4,
                'macro' => ''
              },
              'type' => 'menu_entry'
            },
            {
              'args' => [
                {
                  'parent' => {},
                  'text' => '* ',
                  'type' => 'menu_entry_leading_text'
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'second'
                    }
                  ],
                  'parent' => {},
                  'type' => 'menu_entry_node'
                },
                {
                  'parent' => {},
                  'text' => '::',
                  'type' => 'menu_entry_separator'
                },
                {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => '
'
                        }
                      ],
                      'parent' => {},
                      'type' => 'preformatted'
                    }
                  ],
                  'parent' => {},
                  'type' => 'menu_entry_description'
                }
              ],
              'extra' => {
                'menu_entry_description' => {},
                'menu_entry_node' => {
                  'node_content' => [
                    {}
                  ],
                  'normalized' => 'second'
                }
              },
              'parent' => {},
              'source_info' => {
                'file_name' => '',
                'line_nr' => 5,
                'macro' => ''
              },
              'type' => 'menu_entry'
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'menu'
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
                'spaces_before_argument' => ' ',
                'text_arg' => 'menu'
              },
              'parent' => {},
              'source_info' => {
                'file_name' => '',
                'line_nr' => 6,
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
            'line_nr' => 3,
            'macro' => ''
          }
        },
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line'
        }
      ],
      'extra' => {
        'node_content' => [
          {}
        ],
        'nodes_manuals' => [
          {
            'node_content' => [
              {}
            ],
            'normalized' => 'Top'
          }
        ],
        'normalized' => 'Top',
        'spaces_before_argument' => ' '
      },
      'parent' => {},
      'source_info' => {
        'file_name' => '',
        'line_nr' => 1,
        'macro' => ''
      }
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'first'
            }
          ],
          'parent' => {},
          'type' => 'line_arg'
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'second'
            }
          ],
          'parent' => {},
          'type' => 'line_arg'
        },
        {
          'contents' => [],
          'parent' => {},
          'type' => 'line_arg'
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'Top'
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
      'cmdname' => 'node',
      'contents' => [
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
              'text' => 'Para.
'
            }
          ],
          'parent' => {},
          'type' => 'paragraph'
        },
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'lone entry'
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
          'cmdname' => 'cindex',
          'extra' => {
            'index_entry' => {
              'command' => {},
              'content' => [],
              'content_normalized' => [],
              'in_code' => 0,
              'index_at_command' => 'cindex',
              'index_ignore_chars' => {},
              'index_name' => 'cp',
              'index_type_command' => 'cindex',
              'node' => {},
              'number' => 1
            },
            'spaces_before_argument' => ' '
          },
          'parent' => {},
          'source_info' => {
            'file_name' => '',
            'line_nr' => 12,
            'macro' => ''
          },
          'type' => 'index_entry_command'
        },
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line'
        }
      ],
      'extra' => {
        'node_content' => [
          {}
        ],
        'nodes_manuals' => [
          {
            'node_content' => [
              {}
            ],
            'normalized' => 'first'
          },
          {
            'node_content' => [
              {}
            ],
            'normalized' => 'second'
          },
          undef,
          {
            'node_content' => [
              {}
            ],
            'normalized' => 'Top'
          }
        ],
        'normalized' => 'first',
        'spaces_before_argument' => ' '
      },
      'parent' => {},
      'source_info' => {
        'file_name' => '',
        'line_nr' => 8,
        'macro' => ''
      }
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'second'
            }
          ],
          'parent' => {},
          'type' => 'line_arg'
        },
        {
          'contents' => [],
          'parent' => {},
          'type' => 'line_arg'
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'first'
            }
          ],
          'parent' => {},
          'type' => 'line_arg'
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'Top'
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
      'cmdname' => 'node',
      'contents' => [
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'cp'
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
          'cmdname' => 'printindex',
          'extra' => {
            'misc_args' => [
              'cp'
            ],
            'spaces_before_argument' => ' '
          },
          'parent' => {},
          'source_info' => {
            'file_name' => '',
            'line_nr' => 16,
            'macro' => ''
          }
        }
      ],
      'extra' => {
        'isindex' => 1,
        'node_content' => [
          {}
        ],
        'nodes_manuals' => [
          {
            'node_content' => [
              {}
            ],
            'normalized' => 'second'
          },
          undef,
          {
            'node_content' => [
              {}
            ],
            'normalized' => 'first'
          },
          {
            'node_content' => [
              {}
            ],
            'normalized' => 'Top'
          }
        ],
        'normalized' => 'second',
        'spaces_before_argument' => ' '
      },
      'parent' => {},
      'source_info' => {
        'file_name' => '',
        'line_nr' => 14,
        'macro' => ''
      }
    }
  ],
  'type' => 'document_root'
};
$result_trees{'index_entry_before_node'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'index_entry_before_node'}{'contents'}[0];
$result_trees{'index_entry_before_node'}{'contents'}[0]{'parent'} = $result_trees{'index_entry_before_node'};
$result_trees{'index_entry_before_node'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'index_entry_before_node'}{'contents'}[1]{'args'}[0];
$result_trees{'index_entry_before_node'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'index_entry_before_node'}{'contents'}[1];
$result_trees{'index_entry_before_node'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'index_entry_before_node'}{'contents'}[1];
$result_trees{'index_entry_before_node'}{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'index_entry_before_node'}{'contents'}[1]{'contents'}[1];
$result_trees{'index_entry_before_node'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'index_entry_before_node'}{'contents'}[1]{'contents'}[1]{'contents'}[0];
$result_trees{'index_entry_before_node'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'index_entry_before_node'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[1];
$result_trees{'index_entry_before_node'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[1]{'parent'} = $result_trees{'index_entry_before_node'}{'contents'}[1]{'contents'}[1]{'contents'}[0];
$result_trees{'index_entry_before_node'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[2]{'parent'} = $result_trees{'index_entry_before_node'}{'contents'}[1]{'contents'}[1]{'contents'}[0];
$result_trees{'index_entry_before_node'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[3]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'index_entry_before_node'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[3]{'contents'}[0];
$result_trees{'index_entry_before_node'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'index_entry_before_node'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[3];
$result_trees{'index_entry_before_node'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[3]{'parent'} = $result_trees{'index_entry_before_node'}{'contents'}[1]{'contents'}[1]{'contents'}[0];
$result_trees{'index_entry_before_node'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_description'} = $result_trees{'index_entry_before_node'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[3];
$result_trees{'index_entry_before_node'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_node'}{'node_content'}[0] = $result_trees{'index_entry_before_node'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[1]{'contents'}[0];
$result_trees{'index_entry_before_node'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'index_entry_before_node'}{'contents'}[1]{'contents'}[1];
$result_trees{'index_entry_before_node'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'index_entry_before_node'}{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'index_entry_before_node'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'index_entry_before_node'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[1];
$result_trees{'index_entry_before_node'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'index_entry_before_node'}{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'index_entry_before_node'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[2]{'parent'} = $result_trees{'index_entry_before_node'}{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'index_entry_before_node'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[3]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'index_entry_before_node'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[3]{'contents'}[0];
$result_trees{'index_entry_before_node'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'index_entry_before_node'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[3];
$result_trees{'index_entry_before_node'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[3]{'parent'} = $result_trees{'index_entry_before_node'}{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'index_entry_before_node'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'extra'}{'menu_entry_description'} = $result_trees{'index_entry_before_node'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[3];
$result_trees{'index_entry_before_node'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'extra'}{'menu_entry_node'}{'node_content'}[0] = $result_trees{'index_entry_before_node'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[0];
$result_trees{'index_entry_before_node'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'index_entry_before_node'}{'contents'}[1]{'contents'}[1];
$result_trees{'index_entry_before_node'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'index_entry_before_node'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'args'}[0];
$result_trees{'index_entry_before_node'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'index_entry_before_node'}{'contents'}[1]{'contents'}[1]{'contents'}[2];
$result_trees{'index_entry_before_node'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'index_entry_before_node'}{'contents'}[1]{'contents'}[1];
$result_trees{'index_entry_before_node'}{'contents'}[1]{'contents'}[1]{'extra'}{'end_command'} = $result_trees{'index_entry_before_node'}{'contents'}[1]{'contents'}[1]{'contents'}[2];
$result_trees{'index_entry_before_node'}{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'index_entry_before_node'}{'contents'}[1];
$result_trees{'index_entry_before_node'}{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'index_entry_before_node'}{'contents'}[1];
$result_trees{'index_entry_before_node'}{'contents'}[1]{'extra'}{'node_content'}[0] = $result_trees{'index_entry_before_node'}{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'index_entry_before_node'}{'contents'}[1]{'extra'}{'nodes_manuals'}[0]{'node_content'}[0] = $result_trees{'index_entry_before_node'}{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'index_entry_before_node'}{'contents'}[1]{'parent'} = $result_trees{'index_entry_before_node'};
$result_trees{'index_entry_before_node'}{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'index_entry_before_node'}{'contents'}[2]{'args'}[0];
$result_trees{'index_entry_before_node'}{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'index_entry_before_node'}{'contents'}[2];
$result_trees{'index_entry_before_node'}{'contents'}[2]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'index_entry_before_node'}{'contents'}[2]{'args'}[1];
$result_trees{'index_entry_before_node'}{'contents'}[2]{'args'}[1]{'parent'} = $result_trees{'index_entry_before_node'}{'contents'}[2];
$result_trees{'index_entry_before_node'}{'contents'}[2]{'args'}[2]{'parent'} = $result_trees{'index_entry_before_node'}{'contents'}[2];
$result_trees{'index_entry_before_node'}{'contents'}[2]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'index_entry_before_node'}{'contents'}[2]{'args'}[3];
$result_trees{'index_entry_before_node'}{'contents'}[2]{'args'}[3]{'parent'} = $result_trees{'index_entry_before_node'}{'contents'}[2];
$result_trees{'index_entry_before_node'}{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'index_entry_before_node'}{'contents'}[2];
$result_trees{'index_entry_before_node'}{'contents'}[2]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'index_entry_before_node'}{'contents'}[2]{'contents'}[1];
$result_trees{'index_entry_before_node'}{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'index_entry_before_node'}{'contents'}[2];
$result_trees{'index_entry_before_node'}{'contents'}[2]{'contents'}[2]{'parent'} = $result_trees{'index_entry_before_node'}{'contents'}[2];
$result_trees{'index_entry_before_node'}{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'index_entry_before_node'}{'contents'}[2]{'contents'}[3]{'args'}[0];
$result_trees{'index_entry_before_node'}{'contents'}[2]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'index_entry_before_node'}{'contents'}[2]{'contents'}[3];
$result_trees{'index_entry_before_node'}{'contents'}[2]{'contents'}[3]{'extra'}{'index_entry'}{'command'} = $result_trees{'index_entry_before_node'}{'contents'}[2]{'contents'}[3];
$result_trees{'index_entry_before_node'}{'contents'}[2]{'contents'}[3]{'extra'}{'index_entry'}{'content'} = $result_trees{'index_entry_before_node'}{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'};
$result_trees{'index_entry_before_node'}{'contents'}[2]{'contents'}[3]{'extra'}{'index_entry'}{'content_normalized'} = $result_trees{'index_entry_before_node'}{'contents'}[2]{'contents'}[3]{'args'}[0]{'contents'};
$result_trees{'index_entry_before_node'}{'contents'}[2]{'contents'}[3]{'extra'}{'index_entry'}{'node'} = $result_trees{'index_entry_before_node'}{'contents'}[2];
$result_trees{'index_entry_before_node'}{'contents'}[2]{'contents'}[3]{'parent'} = $result_trees{'index_entry_before_node'}{'contents'}[2];
$result_trees{'index_entry_before_node'}{'contents'}[2]{'contents'}[4]{'parent'} = $result_trees{'index_entry_before_node'}{'contents'}[2];
$result_trees{'index_entry_before_node'}{'contents'}[2]{'extra'}{'node_content'}[0] = $result_trees{'index_entry_before_node'}{'contents'}[2]{'args'}[0]{'contents'}[0];
$result_trees{'index_entry_before_node'}{'contents'}[2]{'extra'}{'nodes_manuals'}[0]{'node_content'}[0] = $result_trees{'index_entry_before_node'}{'contents'}[2]{'args'}[0]{'contents'}[0];
$result_trees{'index_entry_before_node'}{'contents'}[2]{'extra'}{'nodes_manuals'}[1]{'node_content'}[0] = $result_trees{'index_entry_before_node'}{'contents'}[2]{'args'}[1]{'contents'}[0];
$result_trees{'index_entry_before_node'}{'contents'}[2]{'extra'}{'nodes_manuals'}[3]{'node_content'}[0] = $result_trees{'index_entry_before_node'}{'contents'}[2]{'args'}[3]{'contents'}[0];
$result_trees{'index_entry_before_node'}{'contents'}[2]{'parent'} = $result_trees{'index_entry_before_node'};
$result_trees{'index_entry_before_node'}{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'index_entry_before_node'}{'contents'}[3]{'args'}[0];
$result_trees{'index_entry_before_node'}{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'index_entry_before_node'}{'contents'}[3];
$result_trees{'index_entry_before_node'}{'contents'}[3]{'args'}[1]{'parent'} = $result_trees{'index_entry_before_node'}{'contents'}[3];
$result_trees{'index_entry_before_node'}{'contents'}[3]{'args'}[2]{'contents'}[0]{'parent'} = $result_trees{'index_entry_before_node'}{'contents'}[3]{'args'}[2];
$result_trees{'index_entry_before_node'}{'contents'}[3]{'args'}[2]{'parent'} = $result_trees{'index_entry_before_node'}{'contents'}[3];
$result_trees{'index_entry_before_node'}{'contents'}[3]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'index_entry_before_node'}{'contents'}[3]{'args'}[3];
$result_trees{'index_entry_before_node'}{'contents'}[3]{'args'}[3]{'parent'} = $result_trees{'index_entry_before_node'}{'contents'}[3];
$result_trees{'index_entry_before_node'}{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'index_entry_before_node'}{'contents'}[3];
$result_trees{'index_entry_before_node'}{'contents'}[3]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'index_entry_before_node'}{'contents'}[3]{'contents'}[1]{'args'}[0];
$result_trees{'index_entry_before_node'}{'contents'}[3]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'index_entry_before_node'}{'contents'}[3]{'contents'}[1];
$result_trees{'index_entry_before_node'}{'contents'}[3]{'contents'}[1]{'parent'} = $result_trees{'index_entry_before_node'}{'contents'}[3];
$result_trees{'index_entry_before_node'}{'contents'}[3]{'extra'}{'node_content'}[0] = $result_trees{'index_entry_before_node'}{'contents'}[3]{'args'}[0]{'contents'}[0];
$result_trees{'index_entry_before_node'}{'contents'}[3]{'extra'}{'nodes_manuals'}[0]{'node_content'}[0] = $result_trees{'index_entry_before_node'}{'contents'}[3]{'args'}[0]{'contents'}[0];
$result_trees{'index_entry_before_node'}{'contents'}[3]{'extra'}{'nodes_manuals'}[2]{'node_content'}[0] = $result_trees{'index_entry_before_node'}{'contents'}[3]{'args'}[2]{'contents'}[0];
$result_trees{'index_entry_before_node'}{'contents'}[3]{'extra'}{'nodes_manuals'}[3]{'node_content'}[0] = $result_trees{'index_entry_before_node'}{'contents'}[3]{'args'}[3]{'contents'}[0];
$result_trees{'index_entry_before_node'}{'contents'}[3]{'parent'} = $result_trees{'index_entry_before_node'};

$result_texis{'index_entry_before_node'} = '@node Top

@menu
* first::
* second::
@end menu

@node first,second,,Top

Para.

@cindex lone entry

@node second,,first,Top

@printindex cp
';


$result_texts{'index_entry_before_node'} = '
* first::
* second::


Para.



';

$result_nodes{'index_entry_before_node'} = {
  'cmdname' => 'node',
  'extra' => {
    'menus' => [
      {
        'cmdname' => 'menu',
        'extra' => {}
      }
    ],
    'normalized' => 'Top'
  },
  'structure' => {
    'menu_child' => {
      'cmdname' => 'node',
      'extra' => {
        'normalized' => 'first'
      },
      'structure' => {
        'node_next' => {
          'cmdname' => 'node',
          'extra' => {
            'isindex' => 1,
            'normalized' => 'second'
          },
          'structure' => {
            'node_prev' => {},
            'node_up' => {}
          }
        },
        'node_prev' => {},
        'node_up' => {}
      }
    },
    'node_next' => {}
  }
};
$result_nodes{'index_entry_before_node'}{'structure'}{'menu_child'}{'structure'}{'node_next'}{'structure'}{'node_prev'} = $result_nodes{'index_entry_before_node'}{'structure'}{'menu_child'};
$result_nodes{'index_entry_before_node'}{'structure'}{'menu_child'}{'structure'}{'node_next'}{'structure'}{'node_up'} = $result_nodes{'index_entry_before_node'};
$result_nodes{'index_entry_before_node'}{'structure'}{'menu_child'}{'structure'}{'node_prev'} = $result_nodes{'index_entry_before_node'};
$result_nodes{'index_entry_before_node'}{'structure'}{'menu_child'}{'structure'}{'node_up'} = $result_nodes{'index_entry_before_node'};
$result_nodes{'index_entry_before_node'}{'structure'}{'node_next'} = $result_nodes{'index_entry_before_node'}{'structure'}{'menu_child'};

$result_menus{'index_entry_before_node'} = {
  'cmdname' => 'node',
  'extra' => {
    'normalized' => 'Top'
  },
  'structure' => {
    'menu_child' => {
      'cmdname' => 'node',
      'extra' => {
        'normalized' => 'first'
      },
      'structure' => {
        'menu_next' => {
          'cmdname' => 'node',
          'extra' => {
            'isindex' => 1,
            'normalized' => 'second'
          },
          'structure' => {
            'menu_prev' => {},
            'menu_up' => {},
            'menu_up_hash' => {
              'Top' => 1
            }
          }
        },
        'menu_up' => {},
        'menu_up_hash' => {
          'Top' => 1
        }
      }
    }
  }
};
$result_menus{'index_entry_before_node'}{'structure'}{'menu_child'}{'structure'}{'menu_next'}{'structure'}{'menu_prev'} = $result_menus{'index_entry_before_node'}{'structure'}{'menu_child'};
$result_menus{'index_entry_before_node'}{'structure'}{'menu_child'}{'structure'}{'menu_next'}{'structure'}{'menu_up'} = $result_menus{'index_entry_before_node'};
$result_menus{'index_entry_before_node'}{'structure'}{'menu_child'}{'structure'}{'menu_up'} = $result_menus{'index_entry_before_node'};

$result_errors{'index_entry_before_node'} = [];


$result_floats{'index_entry_before_node'} = {};


$result_indices_sort_strings{'index_entry_before_node'} = {
  'cp' => [
    'lone entry'
  ]
};



$result_converted{'info'}->{'index_entry_before_node'} = 'This is , produced from .


File: ,  Node: Top,  Next: first,  Up: (dir)

* Menu:

* first::
* second::


File: ,  Node: first,  Next: second,  Prev: Top,  Up: Top

Para.


File: ,  Node: second,  Prev: first,  Up: Top

 [index ]
* Menu:

* lone entry:                            first.                 (line 4)



Tag Table:
Node: Top27
Node: first106
Node: second174

End Tag Table


Local Variables:
coding: utf-8
End:
';


$result_converted{'plaintext'}->{'index_entry_before_node'} = 'Para.

* Menu:

* lone entry:                            first.                 (line 1)

';


$result_converted{'html_text'}->{'index_entry_before_node'} = '<a class="node-id" id="Top"></a><div class="nav-panel">
<p>
 &nbsp; [<a href="#second" title="Index" rel="index">Index</a>]</p>
</div>
<h1 class="node">Top</h1>


<hr>
<a class="node-id" id="first"></a><div class="nav-panel">
<p>
 &nbsp; [<a href="#second" title="Index" rel="index">Index</a>]</p>
</div>
<h4 class="node">first</h4>

<p>Para.
</p>
<a class="index-entry-id" id="index-lone-entry"></a>

<hr>
<a class="node-id" id="second"></a><div class="nav-panel">
<p>
 &nbsp; [<a href="#second" title="Index" rel="index">Index</a>]</p>
</div>
<h4 class="node">second</h4>

<div class="printindex cp-printindex">
<table class="cp-entries-printindex" border="0">
<tr><td></td><th class="entries-header-printindex">Index Entry</th><td>&nbsp;</td><th class="sections-header-printindex"> Section</th></tr>
<tr><td colspan="4"> <hr></td></tr>
<tr><th id="t_i_cp_letter-L">L</th><td></td><td></td></tr>
<tr><td></td><td class="printindex-index-entry"><a href="#index-lone-entry">lone entry</a>:</td><td>&nbsp;</td><td class="printindex-index-section"><a href="#first">first</a></td></tr>
<tr><td colspan="4"> <hr></td></tr>
</table>
</div>
';

1;
