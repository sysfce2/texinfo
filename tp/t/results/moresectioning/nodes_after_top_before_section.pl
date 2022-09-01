use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'nodes_after_top_before_section'} = {
  'contents' => [
    {
      'contents' => [
        {
          'contents' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => '\\input texinfo @c -*-texinfo-*-
',
                  'type' => 'text_before_beginning'
                },
                {
                  'parent' => {},
                  'text' => '
',
                  'type' => 'text_before_beginning'
                }
              ],
              'parent' => {},
              'type' => 'preamble_before_beginning'
            }
          ],
          'parent' => {},
          'type' => 'preamble_before_setfilename'
        },
        {
          'contents' => [
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'nodes_after_top_before_section.info'
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
              'cmdname' => 'setfilename',
              'extra' => {
                'spaces_before_argument' => ' ',
                'text_arg' => 'nodes_after_top_before_section.info'
              },
              'parent' => {},
              'source_info' => {
                'file_name' => 'nodes_after_top_before_section.texi',
                'line_nr' => 3,
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
              'parent' => {},
              'text' => '
',
              'type' => 'empty_line'
            }
          ],
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
          'contents' => [
            {
              'parent' => {},
              'text' => 'Top node
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
                      'text' => 'second node'
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
                  'normalized' => 'second-node'
                }
              },
              'parent' => {},
              'source_info' => {
                'file_name' => 'nodes_after_top_before_section.texi',
                'line_nr' => 9,
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
                      'text' => 'third node'
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
                  'normalized' => 'third-node'
                }
              },
              'parent' => {},
              'source_info' => {
                'file_name' => 'nodes_after_top_before_section.texi',
                'line_nr' => 10,
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
                'command_argument' => 'menu',
                'spaces_before_argument' => ' ',
                'text_arg' => 'menu'
              },
              'parent' => {},
              'source_info' => {
                'file_name' => 'nodes_after_top_before_section.texi',
                'line_nr' => 11,
                'macro' => ''
              }
            }
          ],
          'extra' => {
            'end_command' => {}
          },
          'parent' => {},
          'source_info' => {
            'file_name' => 'nodes_after_top_before_section.texi',
            'line_nr' => 8,
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
        'file_name' => 'nodes_after_top_before_section.texi',
        'line_nr' => 6,
        'macro' => ''
      }
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'second node'
            }
          ],
          'parent' => {},
          'type' => 'line_arg'
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'third node'
            }
          ],
          'extra' => {
            'spaces_before_argument' => ' '
          },
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
              'text' => 'second node
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
            'normalized' => 'second-node'
          },
          {
            'node_content' => [
              {}
            ],
            'normalized' => 'third-node'
          },
          {
            'node_content' => [
              {}
            ],
            'normalized' => 'Top'
          },
          {
            'node_content' => [
              {}
            ],
            'normalized' => 'Top'
          }
        ],
        'normalized' => 'second-node',
        'spaces_before_argument' => ' '
      },
      'parent' => {},
      'source_info' => {
        'file_name' => 'nodes_after_top_before_section.texi',
        'line_nr' => 13,
        'macro' => ''
      }
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'third node'
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
              'text' => 'second node'
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
      'contents' => [],
      'extra' => {
        'node_content' => [
          {}
        ],
        'nodes_manuals' => [
          {
            'node_content' => [
              {}
            ],
            'normalized' => 'third-node'
          },
          undef,
          {
            'node_content' => [
              {}
            ],
            'normalized' => 'second-node'
          },
          {
            'node_content' => [
              {}
            ],
            'normalized' => 'Top'
          }
        ],
        'normalized' => 'third-node',
        'spaces_before_argument' => ' '
      },
      'parent' => {},
      'source_info' => {
        'file_name' => 'nodes_after_top_before_section.texi',
        'line_nr' => 17,
        'macro' => ''
      }
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'subsection'
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
      'cmdname' => 'subsection',
      'contents' => [
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line'
        }
      ],
      'extra' => {
        'spaces_before_argument' => ' '
      },
      'parent' => {},
      'source_info' => {
        'file_name' => 'nodes_after_top_before_section.texi',
        'line_nr' => 18,
        'macro' => ''
      }
    },
    {
      'args' => [
        {
          'parent' => {},
          'text' => '
',
          'type' => 'misc_arg'
        }
      ],
      'cmdname' => 'bye',
      'parent' => {}
    }
  ],
  'type' => 'document_root'
};
$result_trees{'nodes_after_top_before_section'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'nodes_after_top_before_section'}{'contents'}[0]{'contents'}[0]{'contents'}[0];
$result_trees{'nodes_after_top_before_section'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'nodes_after_top_before_section'}{'contents'}[0]{'contents'}[0]{'contents'}[0];
$result_trees{'nodes_after_top_before_section'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'nodes_after_top_before_section'}{'contents'}[0]{'contents'}[0];
$result_trees{'nodes_after_top_before_section'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'nodes_after_top_before_section'}{'contents'}[0];
$result_trees{'nodes_after_top_before_section'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'nodes_after_top_before_section'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'args'}[0];
$result_trees{'nodes_after_top_before_section'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'nodes_after_top_before_section'}{'contents'}[0]{'contents'}[1]{'contents'}[0];
$result_trees{'nodes_after_top_before_section'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'nodes_after_top_before_section'}{'contents'}[0]{'contents'}[1];
$result_trees{'nodes_after_top_before_section'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'nodes_after_top_before_section'}{'contents'}[0]{'contents'}[1];
$result_trees{'nodes_after_top_before_section'}{'contents'}[0]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'nodes_after_top_before_section'}{'contents'}[0]{'contents'}[1];
$result_trees{'nodes_after_top_before_section'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'nodes_after_top_before_section'}{'contents'}[0];
$result_trees{'nodes_after_top_before_section'}{'contents'}[0]{'parent'} = $result_trees{'nodes_after_top_before_section'};
$result_trees{'nodes_after_top_before_section'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'nodes_after_top_before_section'}{'contents'}[1]{'args'}[0];
$result_trees{'nodes_after_top_before_section'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'nodes_after_top_before_section'}{'contents'}[1];
$result_trees{'nodes_after_top_before_section'}{'contents'}[1]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'nodes_after_top_before_section'}{'contents'}[1]{'contents'}[0];
$result_trees{'nodes_after_top_before_section'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'nodes_after_top_before_section'}{'contents'}[1];
$result_trees{'nodes_after_top_before_section'}{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'nodes_after_top_before_section'}{'contents'}[1]{'contents'}[1];
$result_trees{'nodes_after_top_before_section'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'nodes_after_top_before_section'}{'contents'}[1]{'contents'}[1]{'contents'}[0];
$result_trees{'nodes_after_top_before_section'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'nodes_after_top_before_section'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[1];
$result_trees{'nodes_after_top_before_section'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[1]{'parent'} = $result_trees{'nodes_after_top_before_section'}{'contents'}[1]{'contents'}[1]{'contents'}[0];
$result_trees{'nodes_after_top_before_section'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[2]{'parent'} = $result_trees{'nodes_after_top_before_section'}{'contents'}[1]{'contents'}[1]{'contents'}[0];
$result_trees{'nodes_after_top_before_section'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[3]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'nodes_after_top_before_section'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[3]{'contents'}[0];
$result_trees{'nodes_after_top_before_section'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'nodes_after_top_before_section'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[3];
$result_trees{'nodes_after_top_before_section'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[3]{'parent'} = $result_trees{'nodes_after_top_before_section'}{'contents'}[1]{'contents'}[1]{'contents'}[0];
$result_trees{'nodes_after_top_before_section'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_description'} = $result_trees{'nodes_after_top_before_section'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[3];
$result_trees{'nodes_after_top_before_section'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_node'}{'node_content'}[0] = $result_trees{'nodes_after_top_before_section'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[1]{'contents'}[0];
$result_trees{'nodes_after_top_before_section'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'nodes_after_top_before_section'}{'contents'}[1]{'contents'}[1];
$result_trees{'nodes_after_top_before_section'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'nodes_after_top_before_section'}{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'nodes_after_top_before_section'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'nodes_after_top_before_section'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[1];
$result_trees{'nodes_after_top_before_section'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'nodes_after_top_before_section'}{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'nodes_after_top_before_section'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[2]{'parent'} = $result_trees{'nodes_after_top_before_section'}{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'nodes_after_top_before_section'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[3]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'nodes_after_top_before_section'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[3]{'contents'}[0];
$result_trees{'nodes_after_top_before_section'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'nodes_after_top_before_section'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[3];
$result_trees{'nodes_after_top_before_section'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[3]{'parent'} = $result_trees{'nodes_after_top_before_section'}{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'nodes_after_top_before_section'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'extra'}{'menu_entry_description'} = $result_trees{'nodes_after_top_before_section'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[3];
$result_trees{'nodes_after_top_before_section'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'extra'}{'menu_entry_node'}{'node_content'}[0] = $result_trees{'nodes_after_top_before_section'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[0];
$result_trees{'nodes_after_top_before_section'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'nodes_after_top_before_section'}{'contents'}[1]{'contents'}[1];
$result_trees{'nodes_after_top_before_section'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'nodes_after_top_before_section'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'args'}[0];
$result_trees{'nodes_after_top_before_section'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'nodes_after_top_before_section'}{'contents'}[1]{'contents'}[1]{'contents'}[2];
$result_trees{'nodes_after_top_before_section'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'nodes_after_top_before_section'}{'contents'}[1]{'contents'}[1];
$result_trees{'nodes_after_top_before_section'}{'contents'}[1]{'contents'}[1]{'extra'}{'end_command'} = $result_trees{'nodes_after_top_before_section'}{'contents'}[1]{'contents'}[1]{'contents'}[2];
$result_trees{'nodes_after_top_before_section'}{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'nodes_after_top_before_section'}{'contents'}[1];
$result_trees{'nodes_after_top_before_section'}{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'nodes_after_top_before_section'}{'contents'}[1];
$result_trees{'nodes_after_top_before_section'}{'contents'}[1]{'extra'}{'node_content'}[0] = $result_trees{'nodes_after_top_before_section'}{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'nodes_after_top_before_section'}{'contents'}[1]{'extra'}{'nodes_manuals'}[0]{'node_content'}[0] = $result_trees{'nodes_after_top_before_section'}{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'nodes_after_top_before_section'}{'contents'}[1]{'parent'} = $result_trees{'nodes_after_top_before_section'};
$result_trees{'nodes_after_top_before_section'}{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'nodes_after_top_before_section'}{'contents'}[2]{'args'}[0];
$result_trees{'nodes_after_top_before_section'}{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'nodes_after_top_before_section'}{'contents'}[2];
$result_trees{'nodes_after_top_before_section'}{'contents'}[2]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'nodes_after_top_before_section'}{'contents'}[2]{'args'}[1];
$result_trees{'nodes_after_top_before_section'}{'contents'}[2]{'args'}[1]{'parent'} = $result_trees{'nodes_after_top_before_section'}{'contents'}[2];
$result_trees{'nodes_after_top_before_section'}{'contents'}[2]{'args'}[2]{'contents'}[0]{'parent'} = $result_trees{'nodes_after_top_before_section'}{'contents'}[2]{'args'}[2];
$result_trees{'nodes_after_top_before_section'}{'contents'}[2]{'args'}[2]{'parent'} = $result_trees{'nodes_after_top_before_section'}{'contents'}[2];
$result_trees{'nodes_after_top_before_section'}{'contents'}[2]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'nodes_after_top_before_section'}{'contents'}[2]{'args'}[3];
$result_trees{'nodes_after_top_before_section'}{'contents'}[2]{'args'}[3]{'parent'} = $result_trees{'nodes_after_top_before_section'}{'contents'}[2];
$result_trees{'nodes_after_top_before_section'}{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'nodes_after_top_before_section'}{'contents'}[2];
$result_trees{'nodes_after_top_before_section'}{'contents'}[2]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'nodes_after_top_before_section'}{'contents'}[2]{'contents'}[1];
$result_trees{'nodes_after_top_before_section'}{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'nodes_after_top_before_section'}{'contents'}[2];
$result_trees{'nodes_after_top_before_section'}{'contents'}[2]{'contents'}[2]{'parent'} = $result_trees{'nodes_after_top_before_section'}{'contents'}[2];
$result_trees{'nodes_after_top_before_section'}{'contents'}[2]{'extra'}{'node_content'}[0] = $result_trees{'nodes_after_top_before_section'}{'contents'}[2]{'args'}[0]{'contents'}[0];
$result_trees{'nodes_after_top_before_section'}{'contents'}[2]{'extra'}{'nodes_manuals'}[0]{'node_content'}[0] = $result_trees{'nodes_after_top_before_section'}{'contents'}[2]{'args'}[0]{'contents'}[0];
$result_trees{'nodes_after_top_before_section'}{'contents'}[2]{'extra'}{'nodes_manuals'}[1]{'node_content'}[0] = $result_trees{'nodes_after_top_before_section'}{'contents'}[2]{'args'}[1]{'contents'}[0];
$result_trees{'nodes_after_top_before_section'}{'contents'}[2]{'extra'}{'nodes_manuals'}[2]{'node_content'}[0] = $result_trees{'nodes_after_top_before_section'}{'contents'}[2]{'args'}[2]{'contents'}[0];
$result_trees{'nodes_after_top_before_section'}{'contents'}[2]{'extra'}{'nodes_manuals'}[3]{'node_content'}[0] = $result_trees{'nodes_after_top_before_section'}{'contents'}[2]{'args'}[3]{'contents'}[0];
$result_trees{'nodes_after_top_before_section'}{'contents'}[2]{'parent'} = $result_trees{'nodes_after_top_before_section'};
$result_trees{'nodes_after_top_before_section'}{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'nodes_after_top_before_section'}{'contents'}[3]{'args'}[0];
$result_trees{'nodes_after_top_before_section'}{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'nodes_after_top_before_section'}{'contents'}[3];
$result_trees{'nodes_after_top_before_section'}{'contents'}[3]{'args'}[1]{'parent'} = $result_trees{'nodes_after_top_before_section'}{'contents'}[3];
$result_trees{'nodes_after_top_before_section'}{'contents'}[3]{'args'}[2]{'contents'}[0]{'parent'} = $result_trees{'nodes_after_top_before_section'}{'contents'}[3]{'args'}[2];
$result_trees{'nodes_after_top_before_section'}{'contents'}[3]{'args'}[2]{'parent'} = $result_trees{'nodes_after_top_before_section'}{'contents'}[3];
$result_trees{'nodes_after_top_before_section'}{'contents'}[3]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'nodes_after_top_before_section'}{'contents'}[3]{'args'}[3];
$result_trees{'nodes_after_top_before_section'}{'contents'}[3]{'args'}[3]{'parent'} = $result_trees{'nodes_after_top_before_section'}{'contents'}[3];
$result_trees{'nodes_after_top_before_section'}{'contents'}[3]{'extra'}{'node_content'}[0] = $result_trees{'nodes_after_top_before_section'}{'contents'}[3]{'args'}[0]{'contents'}[0];
$result_trees{'nodes_after_top_before_section'}{'contents'}[3]{'extra'}{'nodes_manuals'}[0]{'node_content'}[0] = $result_trees{'nodes_after_top_before_section'}{'contents'}[3]{'args'}[0]{'contents'}[0];
$result_trees{'nodes_after_top_before_section'}{'contents'}[3]{'extra'}{'nodes_manuals'}[2]{'node_content'}[0] = $result_trees{'nodes_after_top_before_section'}{'contents'}[3]{'args'}[2]{'contents'}[0];
$result_trees{'nodes_after_top_before_section'}{'contents'}[3]{'extra'}{'nodes_manuals'}[3]{'node_content'}[0] = $result_trees{'nodes_after_top_before_section'}{'contents'}[3]{'args'}[3]{'contents'}[0];
$result_trees{'nodes_after_top_before_section'}{'contents'}[3]{'parent'} = $result_trees{'nodes_after_top_before_section'};
$result_trees{'nodes_after_top_before_section'}{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'nodes_after_top_before_section'}{'contents'}[4]{'args'}[0];
$result_trees{'nodes_after_top_before_section'}{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'nodes_after_top_before_section'}{'contents'}[4];
$result_trees{'nodes_after_top_before_section'}{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'nodes_after_top_before_section'}{'contents'}[4];
$result_trees{'nodes_after_top_before_section'}{'contents'}[4]{'contents'}[1]{'parent'} = $result_trees{'nodes_after_top_before_section'}{'contents'}[4];
$result_trees{'nodes_after_top_before_section'}{'contents'}[4]{'parent'} = $result_trees{'nodes_after_top_before_section'};
$result_trees{'nodes_after_top_before_section'}{'contents'}[5]{'args'}[0]{'parent'} = $result_trees{'nodes_after_top_before_section'}{'contents'}[5];
$result_trees{'nodes_after_top_before_section'}{'contents'}[5]{'parent'} = $result_trees{'nodes_after_top_before_section'};

$result_texis{'nodes_after_top_before_section'} = '\\input texinfo @c -*-texinfo-*-

@setfilename nodes_after_top_before_section.info


@node Top
Top node
@menu
* second node::
* third node::
@end menu

@node second node, third node,Top,Top

second node

@node third node,,second node,Top
@subsection subsection


@bye
';


$result_texts{'nodes_after_top_before_section'} = '

Top node
* second node::
* third node::


second node

1 subsection
------------


';

$result_sectioning{'nodes_after_top_before_section'} = {
  'structure' => {
    'section_childs' => [
      {
        'cmdname' => 'subsection',
        'extra' => {
          'associated_node' => {
            'cmdname' => 'node',
            'extra' => {
              'normalized' => 'third-node'
            },
            'structure' => {}
          }
        },
        'structure' => {
          'section_level' => 3,
          'section_number' => 1,
          'section_up' => {}
        }
      }
    ],
    'section_level' => 2
  }
};
$result_sectioning{'nodes_after_top_before_section'}{'structure'}{'section_childs'}[0]{'structure'}{'section_up'} = $result_sectioning{'nodes_after_top_before_section'};

$result_nodes{'nodes_after_top_before_section'} = {
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
        'normalized' => 'second-node'
      },
      'structure' => {
        'node_next' => {
          'cmdname' => 'node',
          'extra' => {
            'associated_section' => {
              'cmdname' => 'subsection',
              'extra' => {},
              'structure' => {
                'section_number' => 1
              }
            },
            'normalized' => 'third-node'
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
$result_nodes{'nodes_after_top_before_section'}{'structure'}{'menu_child'}{'structure'}{'node_next'}{'structure'}{'node_prev'} = $result_nodes{'nodes_after_top_before_section'}{'structure'}{'menu_child'};
$result_nodes{'nodes_after_top_before_section'}{'structure'}{'menu_child'}{'structure'}{'node_next'}{'structure'}{'node_up'} = $result_nodes{'nodes_after_top_before_section'};
$result_nodes{'nodes_after_top_before_section'}{'structure'}{'menu_child'}{'structure'}{'node_prev'} = $result_nodes{'nodes_after_top_before_section'};
$result_nodes{'nodes_after_top_before_section'}{'structure'}{'menu_child'}{'structure'}{'node_up'} = $result_nodes{'nodes_after_top_before_section'};
$result_nodes{'nodes_after_top_before_section'}{'structure'}{'node_next'} = $result_nodes{'nodes_after_top_before_section'}{'structure'}{'menu_child'};

$result_menus{'nodes_after_top_before_section'} = {
  'cmdname' => 'node',
  'extra' => {
    'normalized' => 'Top'
  },
  'structure' => {
    'menu_child' => {
      'cmdname' => 'node',
      'extra' => {
        'normalized' => 'second-node'
      },
      'structure' => {
        'menu_next' => {
          'cmdname' => 'node',
          'extra' => {
            'normalized' => 'third-node'
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
$result_menus{'nodes_after_top_before_section'}{'structure'}{'menu_child'}{'structure'}{'menu_next'}{'structure'}{'menu_prev'} = $result_menus{'nodes_after_top_before_section'}{'structure'}{'menu_child'};
$result_menus{'nodes_after_top_before_section'}{'structure'}{'menu_child'}{'structure'}{'menu_next'}{'structure'}{'menu_up'} = $result_menus{'nodes_after_top_before_section'};
$result_menus{'nodes_after_top_before_section'}{'structure'}{'menu_child'}{'structure'}{'menu_up'} = $result_menus{'nodes_after_top_before_section'};

$result_errors{'nodes_after_top_before_section'} = [];


$result_floats{'nodes_after_top_before_section'} = {};


$result_converted_errors{'file_html'}->{'nodes_after_top_before_section'} = [
  {
    'error_line' => 'warning: must specify a title with a title command or @top
',
    'file_name' => 'nodes_after_top_before_section.texi',
    'text' => 'must specify a title with a title command or @top',
    'type' => 'warning'
  }
];


1;
