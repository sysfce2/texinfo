use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'non_empty_part_no_top_node_output'} = {
  'contents' => [
    {
      'contents' => [],
      'parent' => {},
      'type' => 'before_node_section'
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'part before'
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
      'cmdname' => 'part',
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
              'text' => 'Content before
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
            'normalized' => 'Top'
          }
        ],
        'normalized' => 'Top',
        'spaces_before_argument' => ' '
      },
      'parent' => {},
      'source_info' => {
        'file_name' => '',
        'line_nr' => 5,
        'macro' => ''
      }
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'top'
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
      'cmdname' => 'top',
      'contents' => [
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'cmdname' => 'menu',
          'contents' => [
            {
              'extra' => {
                'command' => {}
              },
              'parent' => {},
              'text' => '
',
              'type' => 'empty_line_after_command'
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
                      'text' => 'chapter node'
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
                  'normalized' => 'chapter-node'
                }
              },
              'parent' => {},
              'source_info' => {
                'file_name' => '',
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
                      'text' => 'part chapter node'
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
                  'normalized' => 'part-chapter-node'
                }
              },
              'parent' => {},
              'source_info' => {
                'file_name' => '',
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
                'file_name' => '',
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
            'file_name' => '',
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
        'associated_part' => {},
        'spaces_before_argument' => ' '
      },
      'parent' => {},
      'source_info' => {
        'file_name' => '',
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
              'text' => 'part I'
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
      'cmdname' => 'part',
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
              'text' => 'Content I
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
        'spaces_before_argument' => ' '
      },
      'parent' => {},
      'source_info' => {
        'file_name' => '',
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
              'text' => 'chap in Top node'
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
      'cmdname' => 'chapter',
      'contents' => [
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line'
        }
      ],
      'extra' => {
        'associated_part' => {},
        'spaces_before_argument' => ' '
      },
      'parent' => {},
      'source_info' => {
        'file_name' => '',
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
              'text' => 'Part II'
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
      'cmdname' => 'part',
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
              'text' => 'Content II
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
        'spaces_before_argument' => ' '
      },
      'parent' => {},
      'source_info' => {
        'file_name' => '',
        'line_nr' => 19,
        'macro' => ''
      }
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'part chapter node'
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
            'normalized' => 'part-chapter-node'
          }
        ],
        'normalized' => 'part-chapter-node',
        'spaces_before_argument' => ' '
      },
      'parent' => {},
      'source_info' => {
        'file_name' => '',
        'line_nr' => 23,
        'macro' => ''
      }
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'part III'
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
      'cmdname' => 'part',
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
              'text' => 'Content III
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
        'spaces_before_argument' => ' '
      },
      'parent' => {},
      'source_info' => {
        'file_name' => '',
        'line_nr' => 24,
        'macro' => ''
      }
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'chapter with part node'
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
      'cmdname' => 'chapter',
      'contents' => [
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line'
        }
      ],
      'extra' => {
        'associated_part' => {},
        'spaces_before_argument' => ' '
      },
      'parent' => {},
      'source_info' => {
        'file_name' => '',
        'line_nr' => 28,
        'macro' => ''
      }
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'Part IV'
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
      'cmdname' => 'part',
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
              'text' => 'Content IV
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
        'spaces_before_argument' => ' '
      },
      'parent' => {},
      'source_info' => {
        'file_name' => '',
        'line_nr' => 30,
        'macro' => ''
      }
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'Part V'
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
      'cmdname' => 'part',
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
              'text' => 'Content V
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
        'spaces_before_argument' => ' '
      },
      'parent' => {},
      'source_info' => {
        'file_name' => '',
        'line_nr' => 34,
        'macro' => ''
      }
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'with part no node'
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
      'cmdname' => 'chapter',
      'contents' => [
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line'
        }
      ],
      'extra' => {
        'associated_part' => {},
        'spaces_before_argument' => ' '
      },
      'parent' => {},
      'source_info' => {
        'file_name' => '',
        'line_nr' => 38,
        'macro' => ''
      }
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'Part VI'
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
      'cmdname' => 'part',
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
              'text' => 'Content VI
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
        'spaces_before_argument' => ' '
      },
      'parent' => {},
      'source_info' => {
        'file_name' => '',
        'line_nr' => 40,
        'macro' => ''
      }
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'node between part and chapter'
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
            'normalized' => 'node-between-part-and-chapter'
          }
        ],
        'normalized' => 'node-between-part-and-chapter',
        'spaces_before_argument' => ' '
      },
      'parent' => {},
      'source_info' => {
        'file_name' => '',
        'line_nr' => 44,
        'macro' => ''
      }
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'chapter after part node'
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
      'cmdname' => 'chapter',
      'contents' => [
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line'
        }
      ],
      'extra' => {
        'associated_part' => {},
        'spaces_before_argument' => ' '
      },
      'parent' => {},
      'source_info' => {
        'file_name' => '',
        'line_nr' => 46,
        'macro' => ''
      }
    }
  ],
  'type' => 'document_root'
};
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[0]{'parent'} = $result_trees{'non_empty_part_no_top_node_output'};
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'non_empty_part_no_top_node_output'}{'contents'}[1]{'args'}[0];
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'non_empty_part_no_top_node_output'}{'contents'}[1];
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'non_empty_part_no_top_node_output'}{'contents'}[1];
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'non_empty_part_no_top_node_output'}{'contents'}[1]{'contents'}[1];
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'non_empty_part_no_top_node_output'}{'contents'}[1];
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'non_empty_part_no_top_node_output'}{'contents'}[1];
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[1]{'parent'} = $result_trees{'non_empty_part_no_top_node_output'};
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'non_empty_part_no_top_node_output'}{'contents'}[2]{'args'}[0];
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'non_empty_part_no_top_node_output'}{'contents'}[2];
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[2]{'extra'}{'node_content'}[0] = $result_trees{'non_empty_part_no_top_node_output'}{'contents'}[2]{'args'}[0]{'contents'}[0];
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[2]{'extra'}{'nodes_manuals'}[0]{'node_content'}[0] = $result_trees{'non_empty_part_no_top_node_output'}{'contents'}[2]{'args'}[0]{'contents'}[0];
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[2]{'parent'} = $result_trees{'non_empty_part_no_top_node_output'};
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'non_empty_part_no_top_node_output'}{'contents'}[3]{'args'}[0];
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'non_empty_part_no_top_node_output'}{'contents'}[3];
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'non_empty_part_no_top_node_output'}{'contents'}[3];
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[3]{'contents'}[1]{'contents'}[0]{'extra'}{'command'} = $result_trees{'non_empty_part_no_top_node_output'}{'contents'}[3]{'contents'}[1];
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[3]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'non_empty_part_no_top_node_output'}{'contents'}[3]{'contents'}[1];
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[3]{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'non_empty_part_no_top_node_output'}{'contents'}[3]{'contents'}[1]{'contents'}[1];
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[3]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'non_empty_part_no_top_node_output'}{'contents'}[3]{'contents'}[1]{'contents'}[1]{'args'}[1];
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[3]{'contents'}[1]{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'non_empty_part_no_top_node_output'}{'contents'}[3]{'contents'}[1]{'contents'}[1];
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[3]{'contents'}[1]{'contents'}[1]{'args'}[2]{'parent'} = $result_trees{'non_empty_part_no_top_node_output'}{'contents'}[3]{'contents'}[1]{'contents'}[1];
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[3]{'contents'}[1]{'contents'}[1]{'args'}[3]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'non_empty_part_no_top_node_output'}{'contents'}[3]{'contents'}[1]{'contents'}[1]{'args'}[3]{'contents'}[0];
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[3]{'contents'}[1]{'contents'}[1]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'non_empty_part_no_top_node_output'}{'contents'}[3]{'contents'}[1]{'contents'}[1]{'args'}[3];
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[3]{'contents'}[1]{'contents'}[1]{'args'}[3]{'parent'} = $result_trees{'non_empty_part_no_top_node_output'}{'contents'}[3]{'contents'}[1]{'contents'}[1];
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[3]{'contents'}[1]{'contents'}[1]{'extra'}{'menu_entry_description'} = $result_trees{'non_empty_part_no_top_node_output'}{'contents'}[3]{'contents'}[1]{'contents'}[1]{'args'}[3];
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[3]{'contents'}[1]{'contents'}[1]{'extra'}{'menu_entry_node'}{'node_content'}[0] = $result_trees{'non_empty_part_no_top_node_output'}{'contents'}[3]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[0];
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[3]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'non_empty_part_no_top_node_output'}{'contents'}[3]{'contents'}[1];
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[3]{'contents'}[1]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'non_empty_part_no_top_node_output'}{'contents'}[3]{'contents'}[1]{'contents'}[2];
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[3]{'contents'}[1]{'contents'}[2]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'non_empty_part_no_top_node_output'}{'contents'}[3]{'contents'}[1]{'contents'}[2]{'args'}[1];
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[3]{'contents'}[1]{'contents'}[2]{'args'}[1]{'parent'} = $result_trees{'non_empty_part_no_top_node_output'}{'contents'}[3]{'contents'}[1]{'contents'}[2];
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[3]{'contents'}[1]{'contents'}[2]{'args'}[2]{'parent'} = $result_trees{'non_empty_part_no_top_node_output'}{'contents'}[3]{'contents'}[1]{'contents'}[2];
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[3]{'contents'}[1]{'contents'}[2]{'args'}[3]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'non_empty_part_no_top_node_output'}{'contents'}[3]{'contents'}[1]{'contents'}[2]{'args'}[3]{'contents'}[0];
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[3]{'contents'}[1]{'contents'}[2]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'non_empty_part_no_top_node_output'}{'contents'}[3]{'contents'}[1]{'contents'}[2]{'args'}[3];
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[3]{'contents'}[1]{'contents'}[2]{'args'}[3]{'parent'} = $result_trees{'non_empty_part_no_top_node_output'}{'contents'}[3]{'contents'}[1]{'contents'}[2];
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[3]{'contents'}[1]{'contents'}[2]{'extra'}{'menu_entry_description'} = $result_trees{'non_empty_part_no_top_node_output'}{'contents'}[3]{'contents'}[1]{'contents'}[2]{'args'}[3];
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[3]{'contents'}[1]{'contents'}[2]{'extra'}{'menu_entry_node'}{'node_content'}[0] = $result_trees{'non_empty_part_no_top_node_output'}{'contents'}[3]{'contents'}[1]{'contents'}[2]{'args'}[1]{'contents'}[0];
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[3]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'non_empty_part_no_top_node_output'}{'contents'}[3]{'contents'}[1];
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[3]{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'non_empty_part_no_top_node_output'}{'contents'}[3]{'contents'}[1]{'contents'}[3]{'args'}[0];
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[3]{'contents'}[1]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'non_empty_part_no_top_node_output'}{'contents'}[3]{'contents'}[1]{'contents'}[3];
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[3]{'contents'}[1]{'contents'}[3]{'parent'} = $result_trees{'non_empty_part_no_top_node_output'}{'contents'}[3]{'contents'}[1];
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[3]{'contents'}[1]{'extra'}{'end_command'} = $result_trees{'non_empty_part_no_top_node_output'}{'contents'}[3]{'contents'}[1]{'contents'}[3];
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[3]{'contents'}[1]{'parent'} = $result_trees{'non_empty_part_no_top_node_output'}{'contents'}[3];
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[3]{'contents'}[2]{'parent'} = $result_trees{'non_empty_part_no_top_node_output'}{'contents'}[3];
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[3]{'extra'}{'associated_part'} = $result_trees{'non_empty_part_no_top_node_output'}{'contents'}[1];
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[3]{'parent'} = $result_trees{'non_empty_part_no_top_node_output'};
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'non_empty_part_no_top_node_output'}{'contents'}[4]{'args'}[0];
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'non_empty_part_no_top_node_output'}{'contents'}[4];
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'non_empty_part_no_top_node_output'}{'contents'}[4];
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[4]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'non_empty_part_no_top_node_output'}{'contents'}[4]{'contents'}[1];
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[4]{'contents'}[1]{'parent'} = $result_trees{'non_empty_part_no_top_node_output'}{'contents'}[4];
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[4]{'contents'}[2]{'parent'} = $result_trees{'non_empty_part_no_top_node_output'}{'contents'}[4];
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[4]{'parent'} = $result_trees{'non_empty_part_no_top_node_output'};
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[5]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'non_empty_part_no_top_node_output'}{'contents'}[5]{'args'}[0];
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[5]{'args'}[0]{'parent'} = $result_trees{'non_empty_part_no_top_node_output'}{'contents'}[5];
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[5]{'contents'}[0]{'parent'} = $result_trees{'non_empty_part_no_top_node_output'}{'contents'}[5];
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[5]{'extra'}{'associated_part'} = $result_trees{'non_empty_part_no_top_node_output'}{'contents'}[4];
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[5]{'parent'} = $result_trees{'non_empty_part_no_top_node_output'};
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[6]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'non_empty_part_no_top_node_output'}{'contents'}[6]{'args'}[0];
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[6]{'args'}[0]{'parent'} = $result_trees{'non_empty_part_no_top_node_output'}{'contents'}[6];
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[6]{'contents'}[0]{'parent'} = $result_trees{'non_empty_part_no_top_node_output'}{'contents'}[6];
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[6]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'non_empty_part_no_top_node_output'}{'contents'}[6]{'contents'}[1];
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[6]{'contents'}[1]{'parent'} = $result_trees{'non_empty_part_no_top_node_output'}{'contents'}[6];
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[6]{'contents'}[2]{'parent'} = $result_trees{'non_empty_part_no_top_node_output'}{'contents'}[6];
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[6]{'parent'} = $result_trees{'non_empty_part_no_top_node_output'};
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[7]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'non_empty_part_no_top_node_output'}{'contents'}[7]{'args'}[0];
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[7]{'args'}[0]{'parent'} = $result_trees{'non_empty_part_no_top_node_output'}{'contents'}[7];
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[7]{'extra'}{'node_content'}[0] = $result_trees{'non_empty_part_no_top_node_output'}{'contents'}[7]{'args'}[0]{'contents'}[0];
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[7]{'extra'}{'nodes_manuals'}[0]{'node_content'}[0] = $result_trees{'non_empty_part_no_top_node_output'}{'contents'}[7]{'args'}[0]{'contents'}[0];
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[7]{'parent'} = $result_trees{'non_empty_part_no_top_node_output'};
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[8]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'non_empty_part_no_top_node_output'}{'contents'}[8]{'args'}[0];
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[8]{'args'}[0]{'parent'} = $result_trees{'non_empty_part_no_top_node_output'}{'contents'}[8];
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[8]{'contents'}[0]{'parent'} = $result_trees{'non_empty_part_no_top_node_output'}{'contents'}[8];
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[8]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'non_empty_part_no_top_node_output'}{'contents'}[8]{'contents'}[1];
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[8]{'contents'}[1]{'parent'} = $result_trees{'non_empty_part_no_top_node_output'}{'contents'}[8];
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[8]{'contents'}[2]{'parent'} = $result_trees{'non_empty_part_no_top_node_output'}{'contents'}[8];
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[8]{'parent'} = $result_trees{'non_empty_part_no_top_node_output'};
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[9]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'non_empty_part_no_top_node_output'}{'contents'}[9]{'args'}[0];
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[9]{'args'}[0]{'parent'} = $result_trees{'non_empty_part_no_top_node_output'}{'contents'}[9];
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[9]{'contents'}[0]{'parent'} = $result_trees{'non_empty_part_no_top_node_output'}{'contents'}[9];
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[9]{'extra'}{'associated_part'} = $result_trees{'non_empty_part_no_top_node_output'}{'contents'}[8];
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[9]{'parent'} = $result_trees{'non_empty_part_no_top_node_output'};
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[10]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'non_empty_part_no_top_node_output'}{'contents'}[10]{'args'}[0];
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[10]{'args'}[0]{'parent'} = $result_trees{'non_empty_part_no_top_node_output'}{'contents'}[10];
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[10]{'contents'}[0]{'parent'} = $result_trees{'non_empty_part_no_top_node_output'}{'contents'}[10];
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[10]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'non_empty_part_no_top_node_output'}{'contents'}[10]{'contents'}[1];
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[10]{'contents'}[1]{'parent'} = $result_trees{'non_empty_part_no_top_node_output'}{'contents'}[10];
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[10]{'contents'}[2]{'parent'} = $result_trees{'non_empty_part_no_top_node_output'}{'contents'}[10];
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[10]{'parent'} = $result_trees{'non_empty_part_no_top_node_output'};
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[11]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'non_empty_part_no_top_node_output'}{'contents'}[11]{'args'}[0];
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[11]{'args'}[0]{'parent'} = $result_trees{'non_empty_part_no_top_node_output'}{'contents'}[11];
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[11]{'contents'}[0]{'parent'} = $result_trees{'non_empty_part_no_top_node_output'}{'contents'}[11];
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[11]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'non_empty_part_no_top_node_output'}{'contents'}[11]{'contents'}[1];
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[11]{'contents'}[1]{'parent'} = $result_trees{'non_empty_part_no_top_node_output'}{'contents'}[11];
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[11]{'contents'}[2]{'parent'} = $result_trees{'non_empty_part_no_top_node_output'}{'contents'}[11];
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[11]{'parent'} = $result_trees{'non_empty_part_no_top_node_output'};
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[12]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'non_empty_part_no_top_node_output'}{'contents'}[12]{'args'}[0];
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[12]{'args'}[0]{'parent'} = $result_trees{'non_empty_part_no_top_node_output'}{'contents'}[12];
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[12]{'contents'}[0]{'parent'} = $result_trees{'non_empty_part_no_top_node_output'}{'contents'}[12];
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[12]{'extra'}{'associated_part'} = $result_trees{'non_empty_part_no_top_node_output'}{'contents'}[11];
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[12]{'parent'} = $result_trees{'non_empty_part_no_top_node_output'};
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[13]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'non_empty_part_no_top_node_output'}{'contents'}[13]{'args'}[0];
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[13]{'args'}[0]{'parent'} = $result_trees{'non_empty_part_no_top_node_output'}{'contents'}[13];
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[13]{'contents'}[0]{'parent'} = $result_trees{'non_empty_part_no_top_node_output'}{'contents'}[13];
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[13]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'non_empty_part_no_top_node_output'}{'contents'}[13]{'contents'}[1];
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[13]{'contents'}[1]{'parent'} = $result_trees{'non_empty_part_no_top_node_output'}{'contents'}[13];
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[13]{'contents'}[2]{'parent'} = $result_trees{'non_empty_part_no_top_node_output'}{'contents'}[13];
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[13]{'parent'} = $result_trees{'non_empty_part_no_top_node_output'};
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[14]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'non_empty_part_no_top_node_output'}{'contents'}[14]{'args'}[0];
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[14]{'args'}[0]{'parent'} = $result_trees{'non_empty_part_no_top_node_output'}{'contents'}[14];
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[14]{'contents'}[0]{'parent'} = $result_trees{'non_empty_part_no_top_node_output'}{'contents'}[14];
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[14]{'extra'}{'node_content'}[0] = $result_trees{'non_empty_part_no_top_node_output'}{'contents'}[14]{'args'}[0]{'contents'}[0];
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[14]{'extra'}{'nodes_manuals'}[0]{'node_content'}[0] = $result_trees{'non_empty_part_no_top_node_output'}{'contents'}[14]{'args'}[0]{'contents'}[0];
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[14]{'parent'} = $result_trees{'non_empty_part_no_top_node_output'};
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[15]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'non_empty_part_no_top_node_output'}{'contents'}[15]{'args'}[0];
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[15]{'args'}[0]{'parent'} = $result_trees{'non_empty_part_no_top_node_output'}{'contents'}[15];
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[15]{'contents'}[0]{'parent'} = $result_trees{'non_empty_part_no_top_node_output'}{'contents'}[15];
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[15]{'extra'}{'associated_part'} = $result_trees{'non_empty_part_no_top_node_output'}{'contents'}[13];
$result_trees{'non_empty_part_no_top_node_output'}{'contents'}[15]{'parent'} = $result_trees{'non_empty_part_no_top_node_output'};

$result_texis{'non_empty_part_no_top_node_output'} = '@part part before

Content before

@node Top
@top top

@menu
* chapter node::
* part chapter node::
@end menu

@part part I

Content I

@chapter chap in Top node

@part Part II

Content II

@node part chapter node
@part part III

Content III

@chapter chapter with part node

@part Part IV

Content IV

@part Part V

Content V

@chapter with part no node

@part Part VI

Content VI

@node node between part and chapter

@chapter chapter after part node

';


$result_texts{'non_empty_part_no_top_node_output'} = 'part before
***********

Content before

top
***

* chapter node::
* part chapter node::

part I
******

Content I

1 chap in Top node
******************

Part II
*******

Content II

part III
********

Content III

2 chapter with part node
************************

Part IV
*******

Content IV

Part V
******

Content V

3 with part no node
*******************

Part VI
*******

Content VI


4 chapter after part node
*************************

';

$result_sectioning{'non_empty_part_no_top_node_output'} = {
  'structure' => {
    'section_childs' => [
      {
        'cmdname' => 'part',
        'extra' => {
          'part_associated_section' => {
            'cmdname' => 'top',
            'extra' => {
              'associated_node' => {
                'cmdname' => 'node',
                'extra' => {
                  'normalized' => 'Top'
                },
                'structure' => {}
              },
              'associated_part' => {}
            },
            'structure' => {
              'section_level' => 0,
              'section_prev' => {},
              'section_up' => {}
            }
          },
          'part_following_node' => {}
        },
        'structure' => {
          'section_level' => 0,
          'section_up' => {}
        }
      },
      {},
      {
        'cmdname' => 'part',
        'extra' => {
          'part_associated_section' => {
            'cmdname' => 'chapter',
            'extra' => {
              'associated_part' => {}
            },
            'structure' => {
              'section_level' => 1,
              'section_number' => 1,
              'section_up' => {},
              'toplevel_prev' => {},
              'toplevel_up' => {}
            }
          }
        },
        'structure' => {
          'section_childs' => [
            {}
          ],
          'section_level' => 0,
          'section_prev' => {},
          'section_up' => {}
        }
      },
      {
        'cmdname' => 'part',
        'extra' => {
          'part_following_node' => {
            'cmdname' => 'node',
            'extra' => {
              'normalized' => 'part-chapter-node'
            },
            'structure' => {}
          }
        },
        'structure' => {
          'section_level' => 0,
          'section_prev' => {},
          'section_up' => {}
        }
      },
      {
        'cmdname' => 'part',
        'extra' => {
          'part_associated_section' => {
            'cmdname' => 'chapter',
            'extra' => {
              'associated_node' => {},
              'associated_part' => {}
            },
            'structure' => {
              'section_level' => 1,
              'section_number' => 2,
              'section_up' => {},
              'toplevel_prev' => {},
              'toplevel_up' => {}
            }
          }
        },
        'structure' => {
          'section_childs' => [
            {}
          ],
          'section_level' => 0,
          'section_prev' => {},
          'section_up' => {}
        }
      },
      {
        'cmdname' => 'part',
        'extra' => {},
        'structure' => {
          'section_level' => 0,
          'section_prev' => {},
          'section_up' => {}
        }
      },
      {
        'cmdname' => 'part',
        'extra' => {
          'part_associated_section' => {
            'cmdname' => 'chapter',
            'extra' => {
              'associated_part' => {}
            },
            'structure' => {
              'section_level' => 1,
              'section_number' => 3,
              'section_up' => {},
              'toplevel_prev' => {},
              'toplevel_up' => {}
            }
          }
        },
        'structure' => {
          'section_childs' => [
            {}
          ],
          'section_level' => 0,
          'section_prev' => {},
          'section_up' => {}
        }
      },
      {
        'cmdname' => 'part',
        'extra' => {
          'part_associated_section' => {
            'cmdname' => 'chapter',
            'extra' => {
              'associated_node' => {
                'cmdname' => 'node',
                'extra' => {
                  'normalized' => 'node-between-part-and-chapter'
                },
                'structure' => {}
              },
              'associated_part' => {}
            },
            'structure' => {
              'section_level' => 1,
              'section_number' => 4,
              'section_up' => {},
              'toplevel_prev' => {},
              'toplevel_up' => {}
            }
          },
          'part_following_node' => {}
        },
        'structure' => {
          'section_childs' => [
            {}
          ],
          'section_level' => 0,
          'section_prev' => {},
          'section_up' => {}
        }
      }
    ],
    'section_level' => -1
  }
};
$result_sectioning{'non_empty_part_no_top_node_output'}{'structure'}{'section_childs'}[0]{'extra'}{'part_associated_section'}{'extra'}{'associated_part'} = $result_sectioning{'non_empty_part_no_top_node_output'}{'structure'}{'section_childs'}[0];
$result_sectioning{'non_empty_part_no_top_node_output'}{'structure'}{'section_childs'}[0]{'extra'}{'part_associated_section'}{'structure'}{'section_prev'} = $result_sectioning{'non_empty_part_no_top_node_output'}{'structure'}{'section_childs'}[0];
$result_sectioning{'non_empty_part_no_top_node_output'}{'structure'}{'section_childs'}[0]{'extra'}{'part_associated_section'}{'structure'}{'section_up'} = $result_sectioning{'non_empty_part_no_top_node_output'};
$result_sectioning{'non_empty_part_no_top_node_output'}{'structure'}{'section_childs'}[0]{'extra'}{'part_following_node'} = $result_sectioning{'non_empty_part_no_top_node_output'}{'structure'}{'section_childs'}[0]{'extra'}{'part_associated_section'}{'extra'}{'associated_node'};
$result_sectioning{'non_empty_part_no_top_node_output'}{'structure'}{'section_childs'}[0]{'structure'}{'section_up'} = $result_sectioning{'non_empty_part_no_top_node_output'};
$result_sectioning{'non_empty_part_no_top_node_output'}{'structure'}{'section_childs'}[1] = $result_sectioning{'non_empty_part_no_top_node_output'}{'structure'}{'section_childs'}[0]{'extra'}{'part_associated_section'};
$result_sectioning{'non_empty_part_no_top_node_output'}{'structure'}{'section_childs'}[2]{'extra'}{'part_associated_section'}{'extra'}{'associated_part'} = $result_sectioning{'non_empty_part_no_top_node_output'}{'structure'}{'section_childs'}[2];
$result_sectioning{'non_empty_part_no_top_node_output'}{'structure'}{'section_childs'}[2]{'extra'}{'part_associated_section'}{'structure'}{'section_up'} = $result_sectioning{'non_empty_part_no_top_node_output'}{'structure'}{'section_childs'}[2];
$result_sectioning{'non_empty_part_no_top_node_output'}{'structure'}{'section_childs'}[2]{'extra'}{'part_associated_section'}{'structure'}{'toplevel_prev'} = $result_sectioning{'non_empty_part_no_top_node_output'}{'structure'}{'section_childs'}[0]{'extra'}{'part_associated_section'};
$result_sectioning{'non_empty_part_no_top_node_output'}{'structure'}{'section_childs'}[2]{'extra'}{'part_associated_section'}{'structure'}{'toplevel_up'} = $result_sectioning{'non_empty_part_no_top_node_output'}{'structure'}{'section_childs'}[0]{'extra'}{'part_associated_section'};
$result_sectioning{'non_empty_part_no_top_node_output'}{'structure'}{'section_childs'}[2]{'structure'}{'section_childs'}[0] = $result_sectioning{'non_empty_part_no_top_node_output'}{'structure'}{'section_childs'}[2]{'extra'}{'part_associated_section'};
$result_sectioning{'non_empty_part_no_top_node_output'}{'structure'}{'section_childs'}[2]{'structure'}{'section_prev'} = $result_sectioning{'non_empty_part_no_top_node_output'}{'structure'}{'section_childs'}[0]{'extra'}{'part_associated_section'};
$result_sectioning{'non_empty_part_no_top_node_output'}{'structure'}{'section_childs'}[2]{'structure'}{'section_up'} = $result_sectioning{'non_empty_part_no_top_node_output'};
$result_sectioning{'non_empty_part_no_top_node_output'}{'structure'}{'section_childs'}[3]{'structure'}{'section_prev'} = $result_sectioning{'non_empty_part_no_top_node_output'}{'structure'}{'section_childs'}[2];
$result_sectioning{'non_empty_part_no_top_node_output'}{'structure'}{'section_childs'}[3]{'structure'}{'section_up'} = $result_sectioning{'non_empty_part_no_top_node_output'};
$result_sectioning{'non_empty_part_no_top_node_output'}{'structure'}{'section_childs'}[4]{'extra'}{'part_associated_section'}{'extra'}{'associated_node'} = $result_sectioning{'non_empty_part_no_top_node_output'}{'structure'}{'section_childs'}[3]{'extra'}{'part_following_node'};
$result_sectioning{'non_empty_part_no_top_node_output'}{'structure'}{'section_childs'}[4]{'extra'}{'part_associated_section'}{'extra'}{'associated_part'} = $result_sectioning{'non_empty_part_no_top_node_output'}{'structure'}{'section_childs'}[4];
$result_sectioning{'non_empty_part_no_top_node_output'}{'structure'}{'section_childs'}[4]{'extra'}{'part_associated_section'}{'structure'}{'section_up'} = $result_sectioning{'non_empty_part_no_top_node_output'}{'structure'}{'section_childs'}[4];
$result_sectioning{'non_empty_part_no_top_node_output'}{'structure'}{'section_childs'}[4]{'extra'}{'part_associated_section'}{'structure'}{'toplevel_prev'} = $result_sectioning{'non_empty_part_no_top_node_output'}{'structure'}{'section_childs'}[2]{'extra'}{'part_associated_section'};
$result_sectioning{'non_empty_part_no_top_node_output'}{'structure'}{'section_childs'}[4]{'extra'}{'part_associated_section'}{'structure'}{'toplevel_up'} = $result_sectioning{'non_empty_part_no_top_node_output'}{'structure'}{'section_childs'}[0]{'extra'}{'part_associated_section'};
$result_sectioning{'non_empty_part_no_top_node_output'}{'structure'}{'section_childs'}[4]{'structure'}{'section_childs'}[0] = $result_sectioning{'non_empty_part_no_top_node_output'}{'structure'}{'section_childs'}[4]{'extra'}{'part_associated_section'};
$result_sectioning{'non_empty_part_no_top_node_output'}{'structure'}{'section_childs'}[4]{'structure'}{'section_prev'} = $result_sectioning{'non_empty_part_no_top_node_output'}{'structure'}{'section_childs'}[3];
$result_sectioning{'non_empty_part_no_top_node_output'}{'structure'}{'section_childs'}[4]{'structure'}{'section_up'} = $result_sectioning{'non_empty_part_no_top_node_output'};
$result_sectioning{'non_empty_part_no_top_node_output'}{'structure'}{'section_childs'}[5]{'structure'}{'section_prev'} = $result_sectioning{'non_empty_part_no_top_node_output'}{'structure'}{'section_childs'}[4];
$result_sectioning{'non_empty_part_no_top_node_output'}{'structure'}{'section_childs'}[5]{'structure'}{'section_up'} = $result_sectioning{'non_empty_part_no_top_node_output'};
$result_sectioning{'non_empty_part_no_top_node_output'}{'structure'}{'section_childs'}[6]{'extra'}{'part_associated_section'}{'extra'}{'associated_part'} = $result_sectioning{'non_empty_part_no_top_node_output'}{'structure'}{'section_childs'}[6];
$result_sectioning{'non_empty_part_no_top_node_output'}{'structure'}{'section_childs'}[6]{'extra'}{'part_associated_section'}{'structure'}{'section_up'} = $result_sectioning{'non_empty_part_no_top_node_output'}{'structure'}{'section_childs'}[6];
$result_sectioning{'non_empty_part_no_top_node_output'}{'structure'}{'section_childs'}[6]{'extra'}{'part_associated_section'}{'structure'}{'toplevel_prev'} = $result_sectioning{'non_empty_part_no_top_node_output'}{'structure'}{'section_childs'}[4]{'extra'}{'part_associated_section'};
$result_sectioning{'non_empty_part_no_top_node_output'}{'structure'}{'section_childs'}[6]{'extra'}{'part_associated_section'}{'structure'}{'toplevel_up'} = $result_sectioning{'non_empty_part_no_top_node_output'}{'structure'}{'section_childs'}[0]{'extra'}{'part_associated_section'};
$result_sectioning{'non_empty_part_no_top_node_output'}{'structure'}{'section_childs'}[6]{'structure'}{'section_childs'}[0] = $result_sectioning{'non_empty_part_no_top_node_output'}{'structure'}{'section_childs'}[6]{'extra'}{'part_associated_section'};
$result_sectioning{'non_empty_part_no_top_node_output'}{'structure'}{'section_childs'}[6]{'structure'}{'section_prev'} = $result_sectioning{'non_empty_part_no_top_node_output'}{'structure'}{'section_childs'}[5];
$result_sectioning{'non_empty_part_no_top_node_output'}{'structure'}{'section_childs'}[6]{'structure'}{'section_up'} = $result_sectioning{'non_empty_part_no_top_node_output'};
$result_sectioning{'non_empty_part_no_top_node_output'}{'structure'}{'section_childs'}[7]{'extra'}{'part_associated_section'}{'extra'}{'associated_part'} = $result_sectioning{'non_empty_part_no_top_node_output'}{'structure'}{'section_childs'}[7];
$result_sectioning{'non_empty_part_no_top_node_output'}{'structure'}{'section_childs'}[7]{'extra'}{'part_associated_section'}{'structure'}{'section_up'} = $result_sectioning{'non_empty_part_no_top_node_output'}{'structure'}{'section_childs'}[7];
$result_sectioning{'non_empty_part_no_top_node_output'}{'structure'}{'section_childs'}[7]{'extra'}{'part_associated_section'}{'structure'}{'toplevel_prev'} = $result_sectioning{'non_empty_part_no_top_node_output'}{'structure'}{'section_childs'}[6]{'extra'}{'part_associated_section'};
$result_sectioning{'non_empty_part_no_top_node_output'}{'structure'}{'section_childs'}[7]{'extra'}{'part_associated_section'}{'structure'}{'toplevel_up'} = $result_sectioning{'non_empty_part_no_top_node_output'}{'structure'}{'section_childs'}[0]{'extra'}{'part_associated_section'};
$result_sectioning{'non_empty_part_no_top_node_output'}{'structure'}{'section_childs'}[7]{'extra'}{'part_following_node'} = $result_sectioning{'non_empty_part_no_top_node_output'}{'structure'}{'section_childs'}[7]{'extra'}{'part_associated_section'}{'extra'}{'associated_node'};
$result_sectioning{'non_empty_part_no_top_node_output'}{'structure'}{'section_childs'}[7]{'structure'}{'section_childs'}[0] = $result_sectioning{'non_empty_part_no_top_node_output'}{'structure'}{'section_childs'}[7]{'extra'}{'part_associated_section'};
$result_sectioning{'non_empty_part_no_top_node_output'}{'structure'}{'section_childs'}[7]{'structure'}{'section_prev'} = $result_sectioning{'non_empty_part_no_top_node_output'}{'structure'}{'section_childs'}[6];
$result_sectioning{'non_empty_part_no_top_node_output'}{'structure'}{'section_childs'}[7]{'structure'}{'section_up'} = $result_sectioning{'non_empty_part_no_top_node_output'};

$result_nodes{'non_empty_part_no_top_node_output'} = {
  'cmdname' => 'node',
  'extra' => {
    'associated_section' => {
      'cmdname' => 'top',
      'extra' => {
        'associated_part' => {
          'cmdname' => 'part',
          'extra' => {},
          'structure' => {}
        }
      },
      'structure' => {}
    },
    'menus' => [
      {
        'cmdname' => 'menu',
        'extra' => {}
      }
    ],
    'node_preceding_part' => {},
    'normalized' => 'Top'
  },
  'structure' => {
    'menu_child' => {
      'cmdname' => 'node',
      'extra' => {
        'associated_section' => {
          'cmdname' => 'chapter',
          'extra' => {
            'associated_part' => {
              'cmdname' => 'part',
              'extra' => {},
              'structure' => {}
            }
          },
          'structure' => {
            'section_number' => 2
          }
        },
        'node_preceding_part' => {
          'cmdname' => 'part',
          'extra' => {},
          'structure' => {}
        },
        'normalized' => 'part-chapter-node'
      },
      'structure' => {
        'node_prev' => {},
        'node_up' => {}
      }
    },
    'node_next' => {}
  }
};
$result_nodes{'non_empty_part_no_top_node_output'}{'extra'}{'node_preceding_part'} = $result_nodes{'non_empty_part_no_top_node_output'}{'extra'}{'associated_section'}{'extra'}{'associated_part'};
$result_nodes{'non_empty_part_no_top_node_output'}{'structure'}{'menu_child'}{'structure'}{'node_prev'} = $result_nodes{'non_empty_part_no_top_node_output'};
$result_nodes{'non_empty_part_no_top_node_output'}{'structure'}{'menu_child'}{'structure'}{'node_up'} = $result_nodes{'non_empty_part_no_top_node_output'};
$result_nodes{'non_empty_part_no_top_node_output'}{'structure'}{'node_next'} = $result_nodes{'non_empty_part_no_top_node_output'}{'structure'}{'menu_child'};

$result_menus{'non_empty_part_no_top_node_output'} = {
  'cmdname' => 'node',
  'extra' => {
    'normalized' => 'Top'
  },
  'structure' => {
    'menu_child' => {
      'cmdname' => 'node',
      'extra' => {
        'normalized' => 'part-chapter-node'
      },
      'structure' => {
        'menu_up' => {},
        'menu_up_hash' => {
          'Top' => 1
        }
      }
    }
  }
};
$result_menus{'non_empty_part_no_top_node_output'}{'structure'}{'menu_child'}{'structure'}{'menu_up'} = $result_menus{'non_empty_part_no_top_node_output'};

$result_errors{'non_empty_part_no_top_node_output'} = [
  {
    'error_line' => 'warning: @part should not be associated with @top
',
    'file_name' => '',
    'line_nr' => 1,
    'macro' => '',
    'text' => '@part should not be associated with @top',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: @node precedes @part, but parts may not be associated with nodes
',
    'file_name' => '',
    'line_nr' => 24,
    'macro' => '',
    'text' => '@node precedes @part, but parts may not be associated with nodes',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: no sectioning command associated with @part
',
    'file_name' => '',
    'line_nr' => 19,
    'macro' => '',
    'text' => 'no sectioning command associated with @part',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: no sectioning command associated with @part
',
    'file_name' => '',
    'line_nr' => 30,
    'macro' => '',
    'text' => 'no sectioning command associated with @part',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: @part not empty
',
    'file_name' => '',
    'line_nr' => 1,
    'macro' => '',
    'text' => '@part not empty',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: @part not empty
',
    'file_name' => '',
    'line_nr' => 13,
    'macro' => '',
    'text' => '@part not empty',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: @part not empty
',
    'file_name' => '',
    'line_nr' => 19,
    'macro' => '',
    'text' => '@part not empty',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: @part not empty
',
    'file_name' => '',
    'line_nr' => 24,
    'macro' => '',
    'text' => '@part not empty',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: @part not empty
',
    'file_name' => '',
    'line_nr' => 30,
    'macro' => '',
    'text' => '@part not empty',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: @part not empty
',
    'file_name' => '',
    'line_nr' => 34,
    'macro' => '',
    'text' => '@part not empty',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: @part not empty
',
    'file_name' => '',
    'line_nr' => 40,
    'macro' => '',
    'text' => '@part not empty',
    'type' => 'warning'
  },
  {
    'error_line' => '@menu reference to nonexistent node `chapter node\'
',
    'file_name' => '',
    'line_nr' => 9,
    'macro' => '',
    'text' => '@menu reference to nonexistent node `chapter node\'',
    'type' => 'error'
  },
  {
    'error_line' => 'warning: node `node between part and chapter\' unreferenced
',
    'file_name' => '',
    'line_nr' => 44,
    'macro' => '',
    'text' => 'node `node between part and chapter\' unreferenced',
    'type' => 'warning'
  }
];


$result_floats{'non_empty_part_no_top_node_output'} = {};



$result_converted{'html_text'}->{'non_empty_part_no_top_node_output'} = '<a class="part" id="part-before"></a><div class="nav-panel">
<p>
 &nbsp; </p>
</div>
<a class="node" id="Top"></a><a class="top" id="top"></a><a class="part" id="part-I"></a><ul class="mini-toc">
<li><a href="#chap-in-Top-node" accesskey="1">chap in Top node</a></li>
</ul>
<a class="chapter" id="chap-in-Top-node"></a><hr>
<div class="part-level-extent" id="Part-II">
<div class="nav-panel">
<p>
 &nbsp; </p>
</div>
<h1 class="part">Part II</h1>
<hr>

<p>Content II
</p>
<div class="chapter-level-extent" id="part-chapter-node">
</div>
</div>
<div class="part-level-extent" id="part-III">
<h1 class="part">part III</h1>
<hr>

<p>Content III
</p>
<ul class="mini-toc">
<li><a href="#part-chapter-node" accesskey="1">chapter with part node</a></li>
</ul>
<h2 class="chapter" id="chapter-with-part-node">2 chapter with part node</h2>

</div>
<div class="part-level-extent" id="Part-IV">
<h1 class="part">Part IV</h1>
<hr>

<p>Content IV
</p>
</div>
<div class="part-level-extent" id="Part-V">
<h1 class="part">Part V</h1>
<hr>

<p>Content V
</p>
<ul class="mini-toc">
<li><a href="#with-part-no-node" accesskey="1">with part no node</a></li>
</ul>
<div class="chapter-level-extent" id="with-part-no-node">
<h2 class="chapter">3 with part no node</h2>

<hr>
</div>
</div>
<div class="part-level-extent" id="Part-VI">
<div class="nav-panel">
<p>
 &nbsp; </p>
</div>
<h1 class="part">Part VI</h1>
<hr>

<p>Content VI
</p>
<ul class="mini-toc">
<li><a href="#node-between-part-and-chapter" accesskey="1">chapter after part node</a></li>
</ul>
<div class="chapter-level-extent" id="node-between-part-and-chapter">

<h2 class="chapter" id="chapter-after-part-node">4 chapter after part node</h2>

</div>
</div>
';

1;
