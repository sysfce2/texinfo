use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'part_node_chapter_after_top'} = [
  {
    'contents' => [
      {
        'type' => 'before_node_section'
      },
      {
        'args' => [
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
        'cmdname' => 'node',
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
                'text' => 'top'
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
        'cmdname' => 'top',
        'contents' => [
          {
            'text' => '
',
            'type' => 'empty_line'
          },
          {
            'args' => [
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
            'cmdname' => 'menu',
            'contents' => [
              {
                'contents' => [
                  {
                    'text' => '* ',
                    'type' => 'menu_entry_leading_text'
                  },
                  {
                    'contents' => [
                      {
                        'text' => 'a node after part'
                      }
                    ],
                    'extra' => {
                      'node_content' => [
                        {}
                      ],
                      'normalized' => 'a-node-after-part'
                    },
                    'type' => 'menu_entry_node'
                  },
                  {
                    'text' => '::',
                    'type' => 'menu_entry_separator'
                  },
                  {
                    'contents' => [
                      {
                        'contents' => [
                          {
                            'text' => '
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
                  'file_name' => '',
                  'line_nr' => 5,
                  'macro' => ''
                },
                'type' => 'menu_entry'
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
                        'text' => 'chapter'
                      }
                    ],
                    'extra' => {
                      'node_content' => [
                        {}
                      ],
                      'normalized' => 'chapter'
                    },
                    'type' => 'menu_entry_node'
                  },
                  {
                    'text' => '::',
                    'type' => 'menu_entry_separator'
                  },
                  {
                    'contents' => [
                      {
                        'contents' => [
                          {
                            'text' => '
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
                  'file_name' => '',
                  'line_nr' => 6,
                  'macro' => ''
                },
                'type' => 'menu_entry'
              },
              {
                'args' => [
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
                'cmdname' => 'end',
                'extra' => {
                  'text_arg' => 'menu'
                },
                'info' => {
                  'spaces_before_argument' => {
                    'text' => ' '
                  }
                },
                'source_info' => {
                  'file_name' => '',
                  'line_nr' => 7,
                  'macro' => ''
                }
              }
            ],
            'source_info' => {
              'file_name' => '',
              'line_nr' => 4,
              'macro' => ''
            }
          },
          {
            'text' => '
',
            'type' => 'empty_line'
          }
        ],
        'extra' => {},
        'info' => {
          'spaces_before_argument' => {
            'text' => ' '
          }
        },
        'source_info' => {
          'file_name' => '',
          'line_nr' => 2,
          'macro' => ''
        }
      }
    ],
    'type' => 'unit',
    'unit_command' => {}
  },
  {
    'contents' => [
      {
        'args' => [
          {
            'contents' => [
              {
                'text' => 'part'
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
        'cmdname' => 'part',
        'contents' => [
          {
            'text' => '
',
            'type' => 'empty_line'
          }
        ],
        'extra' => {},
        'info' => {
          'spaces_before_argument' => {
            'text' => ' '
          }
        },
        'source_info' => {
          'file_name' => '',
          'line_nr' => 9,
          'macro' => ''
        }
      },
      {
        'args' => [
          {
            'contents' => [
              {
                'text' => 'a node after part'
              }
            ],
            'type' => 'line_arg'
          },
          {
            'contents' => [
              {
                'text' => 'chapter'
              }
            ],
            'extra' => {
              'node_content' => [
                {}
              ],
              'normalized' => 'chapter'
            },
            'info' => {
              'spaces_before_argument' => {
                'text' => ' '
              }
            },
            'type' => 'line_arg'
          },
          {
            'contents' => [
              {
                'text' => 'Top'
              }
            ],
            'extra' => {
              'node_content' => [
                {}
              ],
              'normalized' => 'Top'
            },
            'info' => {
              'spaces_before_argument' => {
                'text' => ' '
              }
            },
            'type' => 'line_arg'
          },
          {
            'contents' => [
              {
                'text' => 'Top'
              }
            ],
            'extra' => {
              'node_content' => [
                {}
              ],
              'normalized' => 'Top'
            },
            'info' => {
              'spaces_after_argument' => {
                'text' => '
'
              },
              'spaces_before_argument' => {
                'text' => ' '
              }
            },
            'type' => 'line_arg'
          }
        ],
        'cmdname' => 'node',
        'contents' => [
          {
            'contents' => [
              {
                'text' => 'After a node after part
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
        'extra' => {
          'is_target' => 1,
          'normalized' => 'a-node-after-part'
        },
        'info' => {
          'spaces_before_argument' => {
            'text' => ' '
          }
        },
        'source_info' => {
          'file_name' => '',
          'line_nr' => 11,
          'macro' => ''
        }
      },
      {
        'args' => [
          {
            'contents' => [
              {
                'text' => 'chapter'
              }
            ],
            'type' => 'line_arg'
          },
          {
            'contents' => [
              {
                'text' => 'a node after part'
              }
            ],
            'extra' => {
              'node_content' => [
                {}
              ],
              'normalized' => 'a-node-after-part'
            },
            'info' => {
              'spaces_before_argument' => {
                'text' => ' '
              }
            },
            'type' => 'line_arg'
          },
          {
            'type' => 'line_arg'
          },
          {
            'contents' => [
              {
                'text' => 'Top'
              }
            ],
            'extra' => {
              'node_content' => [
                {}
              ],
              'normalized' => 'Top'
            },
            'info' => {
              'spaces_after_argument' => {
                'text' => '
'
              },
              'spaces_before_argument' => {
                'text' => ' '
              }
            },
            'type' => 'line_arg'
          }
        ],
        'cmdname' => 'node',
        'extra' => {
          'is_target' => 1,
          'normalized' => 'chapter'
        },
        'info' => {
          'spaces_before_argument' => {
            'text' => ' '
          }
        },
        'source_info' => {
          'file_name' => '',
          'line_nr' => 14,
          'macro' => ''
        }
      },
      {
        'args' => [
          {
            'contents' => [
              {
                'text' => 'chapter'
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
        'cmdname' => 'chapter',
        'extra' => {
          'associated_part' => {},
          'section_number' => 1
        },
        'info' => {
          'spaces_before_argument' => {
            'text' => ' '
          }
        },
        'source_info' => {
          'file_name' => '',
          'line_nr' => 15,
          'macro' => ''
        }
      }
    ],
    'type' => 'unit',
    'unit_command' => {}
  }
];
$result_trees{'part_node_chapter_after_top'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[0]{'contents'}[1]{'extra'}{'node_content'}[0] = $result_trees{'part_node_chapter_after_top'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[0]{'contents'}[1]{'contents'}[0];
$result_trees{'part_node_chapter_after_top'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'extra'}{'node_content'}[0] = $result_trees{'part_node_chapter_after_top'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[0];
$result_trees{'part_node_chapter_after_top'}[0]{'unit_command'} = $result_trees{'part_node_chapter_after_top'}[0]{'contents'}[2];
$result_trees{'part_node_chapter_after_top'}[1]{'contents'}[1]{'args'}[1]{'extra'}{'node_content'}[0] = $result_trees{'part_node_chapter_after_top'}[1]{'contents'}[1]{'args'}[1]{'contents'}[0];
$result_trees{'part_node_chapter_after_top'}[1]{'contents'}[1]{'args'}[2]{'extra'}{'node_content'}[0] = $result_trees{'part_node_chapter_after_top'}[1]{'contents'}[1]{'args'}[2]{'contents'}[0];
$result_trees{'part_node_chapter_after_top'}[1]{'contents'}[1]{'args'}[3]{'extra'}{'node_content'}[0] = $result_trees{'part_node_chapter_after_top'}[1]{'contents'}[1]{'args'}[3]{'contents'}[0];
$result_trees{'part_node_chapter_after_top'}[1]{'contents'}[2]{'args'}[1]{'extra'}{'node_content'}[0] = $result_trees{'part_node_chapter_after_top'}[1]{'contents'}[2]{'args'}[1]{'contents'}[0];
$result_trees{'part_node_chapter_after_top'}[1]{'contents'}[2]{'args'}[3]{'extra'}{'node_content'}[0] = $result_trees{'part_node_chapter_after_top'}[1]{'contents'}[2]{'args'}[3]{'contents'}[0];
$result_trees{'part_node_chapter_after_top'}[1]{'contents'}[3]{'extra'}{'associated_part'} = $result_trees{'part_node_chapter_after_top'}[1]{'contents'}[0];
$result_trees{'part_node_chapter_after_top'}[1]{'unit_command'} = $result_trees{'part_node_chapter_after_top'}[1]{'contents'}[3];

$result_texis{'part_node_chapter_after_top'} = '@node Top
@top top

@menu
* a node after part::
* chapter::
@end menu

@part part

@node a node after part, chapter, Top, Top
After a node after part

@node chapter, a node after part,, Top
@chapter chapter 
';


$result_texts{'part_node_chapter_after_top'} = 'top
***

* a node after part::
* chapter::

part
****

After a node after part

1 chapter
*********
';

$result_sectioning{'part_node_chapter_after_top'} = {
  'extra' => {
    'section_childs' => [
      {
        'cmdname' => 'top',
        'extra' => {
          'associated_node' => {
            'cmdname' => 'node',
            'extra' => {
              'normalized' => 'Top'
            },
            'structure' => {
              'associated_unit' => {
                'directions' => {
                  'FastForward' => {
                    'directions' => {
                      'Back' => {},
                      'FastBack' => {},
                      'NodeBack' => {},
                      'NodeForward' => {},
                      'NodeNext' => {},
                      'NodeUp' => {},
                      'This' => {}
                    },
                    'tree_unit_directions' => {
                      'prev' => {}
                    },
                    'type' => 'unit',
                    'unit_command' => {
                      'cmdname' => 'chapter',
                      'extra' => {
                        'associated_node' => {
                          'cmdname' => 'node',
                          'extra' => {
                            'normalized' => 'chapter'
                          },
                          'structure' => {
                            'associated_unit' => {}
                          }
                        },
                        'associated_part' => {
                          'cmdname' => 'part',
                          'extra' => {
                            'part_associated_section' => {},
                            'part_following_node' => {},
                            'section_childs' => [
                              {}
                            ],
                            'section_directions' => {
                              'prev' => {},
                              'up' => {}
                            },
                            'section_level' => 0
                          },
                          'structure' => {
                            'associated_unit' => {}
                          }
                        },
                        'section_directions' => {
                          'up' => {}
                        },
                        'section_level' => 1,
                        'section_number' => 1,
                        'toplevel_directions' => {
                          'prev' => {},
                          'up' => {}
                        }
                      },
                      'structure' => {
                        'associated_unit' => {}
                      }
                    }
                  },
                  'Forward' => {},
                  'Next' => {},
                  'NodeForward' => {},
                  'NodeNext' => {},
                  'This' => {}
                },
                'tree_unit_directions' => {},
                'type' => 'unit',
                'unit_command' => {}
              }
            }
          },
          'section_directions' => {
            'up' => {}
          },
          'section_level' => 0,
          'toplevel_directions' => {}
        },
        'structure' => {
          'associated_unit' => {}
        }
      },
      {}
    ],
    'section_level' => -1
  }
};
$result_sectioning{'part_node_chapter_after_top'}{'extra'}{'section_childs'}[0]{'extra'}{'associated_node'}{'structure'}{'associated_unit'}{'directions'}{'FastForward'}{'directions'}{'Back'} = $result_sectioning{'part_node_chapter_after_top'}{'extra'}{'section_childs'}[0]{'extra'}{'associated_node'}{'structure'}{'associated_unit'};
$result_sectioning{'part_node_chapter_after_top'}{'extra'}{'section_childs'}[0]{'extra'}{'associated_node'}{'structure'}{'associated_unit'}{'directions'}{'FastForward'}{'directions'}{'FastBack'} = $result_sectioning{'part_node_chapter_after_top'}{'extra'}{'section_childs'}[0]{'extra'}{'associated_node'}{'structure'}{'associated_unit'};
$result_sectioning{'part_node_chapter_after_top'}{'extra'}{'section_childs'}[0]{'extra'}{'associated_node'}{'structure'}{'associated_unit'}{'directions'}{'FastForward'}{'directions'}{'NodeBack'} = $result_sectioning{'part_node_chapter_after_top'}{'extra'}{'section_childs'}[0]{'extra'}{'associated_node'}{'structure'}{'associated_unit'};
$result_sectioning{'part_node_chapter_after_top'}{'extra'}{'section_childs'}[0]{'extra'}{'associated_node'}{'structure'}{'associated_unit'}{'directions'}{'FastForward'}{'directions'}{'NodeForward'} = $result_sectioning{'part_node_chapter_after_top'}{'extra'}{'section_childs'}[0]{'extra'}{'associated_node'}{'structure'}{'associated_unit'}{'directions'}{'FastForward'};
$result_sectioning{'part_node_chapter_after_top'}{'extra'}{'section_childs'}[0]{'extra'}{'associated_node'}{'structure'}{'associated_unit'}{'directions'}{'FastForward'}{'directions'}{'NodeNext'} = $result_sectioning{'part_node_chapter_after_top'}{'extra'}{'section_childs'}[0]{'extra'}{'associated_node'}{'structure'}{'associated_unit'}{'directions'}{'FastForward'};
$result_sectioning{'part_node_chapter_after_top'}{'extra'}{'section_childs'}[0]{'extra'}{'associated_node'}{'structure'}{'associated_unit'}{'directions'}{'FastForward'}{'directions'}{'NodeUp'} = $result_sectioning{'part_node_chapter_after_top'}{'extra'}{'section_childs'}[0]{'extra'}{'associated_node'}{'structure'}{'associated_unit'};
$result_sectioning{'part_node_chapter_after_top'}{'extra'}{'section_childs'}[0]{'extra'}{'associated_node'}{'structure'}{'associated_unit'}{'directions'}{'FastForward'}{'directions'}{'This'} = $result_sectioning{'part_node_chapter_after_top'}{'extra'}{'section_childs'}[0]{'extra'}{'associated_node'}{'structure'}{'associated_unit'}{'directions'}{'FastForward'};
$result_sectioning{'part_node_chapter_after_top'}{'extra'}{'section_childs'}[0]{'extra'}{'associated_node'}{'structure'}{'associated_unit'}{'directions'}{'FastForward'}{'tree_unit_directions'}{'prev'} = $result_sectioning{'part_node_chapter_after_top'}{'extra'}{'section_childs'}[0]{'extra'}{'associated_node'}{'structure'}{'associated_unit'};
$result_sectioning{'part_node_chapter_after_top'}{'extra'}{'section_childs'}[0]{'extra'}{'associated_node'}{'structure'}{'associated_unit'}{'directions'}{'FastForward'}{'unit_command'}{'extra'}{'associated_node'}{'structure'}{'associated_unit'} = $result_sectioning{'part_node_chapter_after_top'}{'extra'}{'section_childs'}[0]{'extra'}{'associated_node'}{'structure'}{'associated_unit'}{'directions'}{'FastForward'};
$result_sectioning{'part_node_chapter_after_top'}{'extra'}{'section_childs'}[0]{'extra'}{'associated_node'}{'structure'}{'associated_unit'}{'directions'}{'FastForward'}{'unit_command'}{'extra'}{'associated_part'}{'extra'}{'part_associated_section'} = $result_sectioning{'part_node_chapter_after_top'}{'extra'}{'section_childs'}[0]{'extra'}{'associated_node'}{'structure'}{'associated_unit'}{'directions'}{'FastForward'}{'unit_command'};
$result_sectioning{'part_node_chapter_after_top'}{'extra'}{'section_childs'}[0]{'extra'}{'associated_node'}{'structure'}{'associated_unit'}{'directions'}{'FastForward'}{'unit_command'}{'extra'}{'associated_part'}{'extra'}{'part_following_node'} = $result_sectioning{'part_node_chapter_after_top'}{'extra'}{'section_childs'}[0]{'extra'}{'associated_node'}{'structure'}{'associated_unit'}{'directions'}{'FastForward'}{'unit_command'}{'extra'}{'associated_node'};
$result_sectioning{'part_node_chapter_after_top'}{'extra'}{'section_childs'}[0]{'extra'}{'associated_node'}{'structure'}{'associated_unit'}{'directions'}{'FastForward'}{'unit_command'}{'extra'}{'associated_part'}{'extra'}{'section_childs'}[0] = $result_sectioning{'part_node_chapter_after_top'}{'extra'}{'section_childs'}[0]{'extra'}{'associated_node'}{'structure'}{'associated_unit'}{'directions'}{'FastForward'}{'unit_command'};
$result_sectioning{'part_node_chapter_after_top'}{'extra'}{'section_childs'}[0]{'extra'}{'associated_node'}{'structure'}{'associated_unit'}{'directions'}{'FastForward'}{'unit_command'}{'extra'}{'associated_part'}{'extra'}{'section_directions'}{'prev'} = $result_sectioning{'part_node_chapter_after_top'}{'extra'}{'section_childs'}[0];
$result_sectioning{'part_node_chapter_after_top'}{'extra'}{'section_childs'}[0]{'extra'}{'associated_node'}{'structure'}{'associated_unit'}{'directions'}{'FastForward'}{'unit_command'}{'extra'}{'associated_part'}{'extra'}{'section_directions'}{'up'} = $result_sectioning{'part_node_chapter_after_top'};
$result_sectioning{'part_node_chapter_after_top'}{'extra'}{'section_childs'}[0]{'extra'}{'associated_node'}{'structure'}{'associated_unit'}{'directions'}{'FastForward'}{'unit_command'}{'extra'}{'associated_part'}{'structure'}{'associated_unit'} = $result_sectioning{'part_node_chapter_after_top'}{'extra'}{'section_childs'}[0]{'extra'}{'associated_node'}{'structure'}{'associated_unit'}{'directions'}{'FastForward'};
$result_sectioning{'part_node_chapter_after_top'}{'extra'}{'section_childs'}[0]{'extra'}{'associated_node'}{'structure'}{'associated_unit'}{'directions'}{'FastForward'}{'unit_command'}{'extra'}{'section_directions'}{'up'} = $result_sectioning{'part_node_chapter_after_top'}{'extra'}{'section_childs'}[0]{'extra'}{'associated_node'}{'structure'}{'associated_unit'}{'directions'}{'FastForward'}{'unit_command'}{'extra'}{'associated_part'};
$result_sectioning{'part_node_chapter_after_top'}{'extra'}{'section_childs'}[0]{'extra'}{'associated_node'}{'structure'}{'associated_unit'}{'directions'}{'FastForward'}{'unit_command'}{'extra'}{'toplevel_directions'}{'prev'} = $result_sectioning{'part_node_chapter_after_top'}{'extra'}{'section_childs'}[0];
$result_sectioning{'part_node_chapter_after_top'}{'extra'}{'section_childs'}[0]{'extra'}{'associated_node'}{'structure'}{'associated_unit'}{'directions'}{'FastForward'}{'unit_command'}{'extra'}{'toplevel_directions'}{'up'} = $result_sectioning{'part_node_chapter_after_top'}{'extra'}{'section_childs'}[0];
$result_sectioning{'part_node_chapter_after_top'}{'extra'}{'section_childs'}[0]{'extra'}{'associated_node'}{'structure'}{'associated_unit'}{'directions'}{'FastForward'}{'unit_command'}{'structure'}{'associated_unit'} = $result_sectioning{'part_node_chapter_after_top'}{'extra'}{'section_childs'}[0]{'extra'}{'associated_node'}{'structure'}{'associated_unit'}{'directions'}{'FastForward'};
$result_sectioning{'part_node_chapter_after_top'}{'extra'}{'section_childs'}[0]{'extra'}{'associated_node'}{'structure'}{'associated_unit'}{'directions'}{'Forward'} = $result_sectioning{'part_node_chapter_after_top'}{'extra'}{'section_childs'}[0]{'extra'}{'associated_node'}{'structure'}{'associated_unit'}{'directions'}{'FastForward'};
$result_sectioning{'part_node_chapter_after_top'}{'extra'}{'section_childs'}[0]{'extra'}{'associated_node'}{'structure'}{'associated_unit'}{'directions'}{'Next'} = $result_sectioning{'part_node_chapter_after_top'}{'extra'}{'section_childs'}[0]{'extra'}{'associated_node'}{'structure'}{'associated_unit'}{'directions'}{'FastForward'};
$result_sectioning{'part_node_chapter_after_top'}{'extra'}{'section_childs'}[0]{'extra'}{'associated_node'}{'structure'}{'associated_unit'}{'directions'}{'NodeForward'} = $result_sectioning{'part_node_chapter_after_top'}{'extra'}{'section_childs'}[0]{'extra'}{'associated_node'}{'structure'}{'associated_unit'}{'directions'}{'FastForward'};
$result_sectioning{'part_node_chapter_after_top'}{'extra'}{'section_childs'}[0]{'extra'}{'associated_node'}{'structure'}{'associated_unit'}{'directions'}{'NodeNext'} = $result_sectioning{'part_node_chapter_after_top'}{'extra'}{'section_childs'}[0]{'extra'}{'associated_node'}{'structure'}{'associated_unit'}{'directions'}{'FastForward'};
$result_sectioning{'part_node_chapter_after_top'}{'extra'}{'section_childs'}[0]{'extra'}{'associated_node'}{'structure'}{'associated_unit'}{'directions'}{'This'} = $result_sectioning{'part_node_chapter_after_top'}{'extra'}{'section_childs'}[0]{'extra'}{'associated_node'}{'structure'}{'associated_unit'};
$result_sectioning{'part_node_chapter_after_top'}{'extra'}{'section_childs'}[0]{'extra'}{'associated_node'}{'structure'}{'associated_unit'}{'unit_command'} = $result_sectioning{'part_node_chapter_after_top'}{'extra'}{'section_childs'}[0];
$result_sectioning{'part_node_chapter_after_top'}{'extra'}{'section_childs'}[0]{'extra'}{'section_directions'}{'up'} = $result_sectioning{'part_node_chapter_after_top'};
$result_sectioning{'part_node_chapter_after_top'}{'extra'}{'section_childs'}[0]{'structure'}{'associated_unit'} = $result_sectioning{'part_node_chapter_after_top'}{'extra'}{'section_childs'}[0]{'extra'}{'associated_node'}{'structure'}{'associated_unit'};
$result_sectioning{'part_node_chapter_after_top'}{'extra'}{'section_childs'}[1] = $result_sectioning{'part_node_chapter_after_top'}{'extra'}{'section_childs'}[0]{'extra'}{'associated_node'}{'structure'}{'associated_unit'}{'directions'}{'FastForward'}{'unit_command'}{'extra'}{'associated_part'};

$result_nodes{'part_node_chapter_after_top'} = {
  'cmdname' => 'node',
  'extra' => {
    'associated_section' => {
      'cmdname' => 'top',
      'extra' => {},
      'structure' => {
        'associated_unit' => {
          'directions' => {
            'FastForward' => {
              'directions' => {
                'Back' => {},
                'FastBack' => {},
                'NodeBack' => {},
                'NodeForward' => {},
                'NodeNext' => {},
                'NodeUp' => {},
                'This' => {}
              },
              'tree_unit_directions' => {
                'prev' => {}
              },
              'type' => 'unit',
              'unit_command' => {
                'cmdname' => 'chapter',
                'extra' => {
                  'associated_part' => {
                    'cmdname' => 'part',
                    'extra' => {},
                    'structure' => {
                      'associated_unit' => {}
                    }
                  },
                  'section_number' => 1
                },
                'structure' => {
                  'associated_unit' => {}
                }
              }
            },
            'Forward' => {},
            'Next' => {},
            'NodeForward' => {},
            'NodeNext' => {},
            'This' => {}
          },
          'tree_unit_directions' => {
            'next' => {}
          },
          'type' => 'unit',
          'unit_command' => {}
        }
      }
    },
    'menus' => [
      {
        'cmdname' => 'menu'
      }
    ],
    'node_directions' => {
      'next' => {
        'cmdname' => 'node',
        'extra' => {
          'node_directions' => {
            'next' => {
              'cmdname' => 'node',
              'extra' => {
                'associated_section' => {},
                'node_directions' => {
                  'next' => {},
                  'up' => {}
                },
                'node_preceding_part' => {},
                'normalized' => 'chapter'
              },
              'structure' => {
                'associated_unit' => {}
              }
            },
            'prev' => {},
            'up' => {}
          },
          'node_preceding_part' => {},
          'normalized' => 'a-node-after-part'
        },
        'structure' => {
          'associated_unit' => {}
        }
      }
    },
    'normalized' => 'Top'
  },
  'structure' => {
    'associated_unit' => {},
    'menu_child' => {}
  }
};
$result_nodes{'part_node_chapter_after_top'}{'extra'}{'associated_section'}{'structure'}{'associated_unit'}{'directions'}{'FastForward'}{'directions'}{'Back'} = $result_nodes{'part_node_chapter_after_top'}{'extra'}{'associated_section'}{'structure'}{'associated_unit'};
$result_nodes{'part_node_chapter_after_top'}{'extra'}{'associated_section'}{'structure'}{'associated_unit'}{'directions'}{'FastForward'}{'directions'}{'FastBack'} = $result_nodes{'part_node_chapter_after_top'}{'extra'}{'associated_section'}{'structure'}{'associated_unit'};
$result_nodes{'part_node_chapter_after_top'}{'extra'}{'associated_section'}{'structure'}{'associated_unit'}{'directions'}{'FastForward'}{'directions'}{'NodeBack'} = $result_nodes{'part_node_chapter_after_top'}{'extra'}{'associated_section'}{'structure'}{'associated_unit'};
$result_nodes{'part_node_chapter_after_top'}{'extra'}{'associated_section'}{'structure'}{'associated_unit'}{'directions'}{'FastForward'}{'directions'}{'NodeForward'} = $result_nodes{'part_node_chapter_after_top'}{'extra'}{'associated_section'}{'structure'}{'associated_unit'}{'directions'}{'FastForward'};
$result_nodes{'part_node_chapter_after_top'}{'extra'}{'associated_section'}{'structure'}{'associated_unit'}{'directions'}{'FastForward'}{'directions'}{'NodeNext'} = $result_nodes{'part_node_chapter_after_top'}{'extra'}{'associated_section'}{'structure'}{'associated_unit'}{'directions'}{'FastForward'};
$result_nodes{'part_node_chapter_after_top'}{'extra'}{'associated_section'}{'structure'}{'associated_unit'}{'directions'}{'FastForward'}{'directions'}{'NodeUp'} = $result_nodes{'part_node_chapter_after_top'}{'extra'}{'associated_section'}{'structure'}{'associated_unit'};
$result_nodes{'part_node_chapter_after_top'}{'extra'}{'associated_section'}{'structure'}{'associated_unit'}{'directions'}{'FastForward'}{'directions'}{'This'} = $result_nodes{'part_node_chapter_after_top'}{'extra'}{'associated_section'}{'structure'}{'associated_unit'}{'directions'}{'FastForward'};
$result_nodes{'part_node_chapter_after_top'}{'extra'}{'associated_section'}{'structure'}{'associated_unit'}{'directions'}{'FastForward'}{'tree_unit_directions'}{'prev'} = $result_nodes{'part_node_chapter_after_top'}{'extra'}{'associated_section'}{'structure'}{'associated_unit'};
$result_nodes{'part_node_chapter_after_top'}{'extra'}{'associated_section'}{'structure'}{'associated_unit'}{'directions'}{'FastForward'}{'unit_command'}{'extra'}{'associated_part'}{'structure'}{'associated_unit'} = $result_nodes{'part_node_chapter_after_top'}{'extra'}{'associated_section'}{'structure'}{'associated_unit'}{'directions'}{'FastForward'};
$result_nodes{'part_node_chapter_after_top'}{'extra'}{'associated_section'}{'structure'}{'associated_unit'}{'directions'}{'FastForward'}{'unit_command'}{'structure'}{'associated_unit'} = $result_nodes{'part_node_chapter_after_top'}{'extra'}{'associated_section'}{'structure'}{'associated_unit'}{'directions'}{'FastForward'};
$result_nodes{'part_node_chapter_after_top'}{'extra'}{'associated_section'}{'structure'}{'associated_unit'}{'directions'}{'Forward'} = $result_nodes{'part_node_chapter_after_top'}{'extra'}{'associated_section'}{'structure'}{'associated_unit'}{'directions'}{'FastForward'};
$result_nodes{'part_node_chapter_after_top'}{'extra'}{'associated_section'}{'structure'}{'associated_unit'}{'directions'}{'Next'} = $result_nodes{'part_node_chapter_after_top'}{'extra'}{'associated_section'}{'structure'}{'associated_unit'}{'directions'}{'FastForward'};
$result_nodes{'part_node_chapter_after_top'}{'extra'}{'associated_section'}{'structure'}{'associated_unit'}{'directions'}{'NodeForward'} = $result_nodes{'part_node_chapter_after_top'}{'extra'}{'associated_section'}{'structure'}{'associated_unit'}{'directions'}{'FastForward'};
$result_nodes{'part_node_chapter_after_top'}{'extra'}{'associated_section'}{'structure'}{'associated_unit'}{'directions'}{'NodeNext'} = $result_nodes{'part_node_chapter_after_top'}{'extra'}{'associated_section'}{'structure'}{'associated_unit'}{'directions'}{'FastForward'};
$result_nodes{'part_node_chapter_after_top'}{'extra'}{'associated_section'}{'structure'}{'associated_unit'}{'directions'}{'This'} = $result_nodes{'part_node_chapter_after_top'}{'extra'}{'associated_section'}{'structure'}{'associated_unit'};
$result_nodes{'part_node_chapter_after_top'}{'extra'}{'associated_section'}{'structure'}{'associated_unit'}{'tree_unit_directions'}{'next'} = $result_nodes{'part_node_chapter_after_top'}{'extra'}{'associated_section'}{'structure'}{'associated_unit'}{'directions'}{'FastForward'};
$result_nodes{'part_node_chapter_after_top'}{'extra'}{'associated_section'}{'structure'}{'associated_unit'}{'unit_command'} = $result_nodes{'part_node_chapter_after_top'}{'extra'}{'associated_section'};
$result_nodes{'part_node_chapter_after_top'}{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'next'}{'extra'}{'associated_section'} = $result_nodes{'part_node_chapter_after_top'}{'extra'}{'associated_section'}{'structure'}{'associated_unit'}{'directions'}{'FastForward'}{'unit_command'};
$result_nodes{'part_node_chapter_after_top'}{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'next'} = $result_nodes{'part_node_chapter_after_top'}{'extra'}{'node_directions'}{'next'};
$result_nodes{'part_node_chapter_after_top'}{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'up'} = $result_nodes{'part_node_chapter_after_top'};
$result_nodes{'part_node_chapter_after_top'}{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'next'}{'extra'}{'node_preceding_part'} = $result_nodes{'part_node_chapter_after_top'}{'extra'}{'associated_section'}{'structure'}{'associated_unit'}{'directions'}{'FastForward'}{'unit_command'}{'extra'}{'associated_part'};
$result_nodes{'part_node_chapter_after_top'}{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'next'}{'structure'}{'associated_unit'} = $result_nodes{'part_node_chapter_after_top'}{'extra'}{'associated_section'}{'structure'}{'associated_unit'}{'directions'}{'FastForward'};
$result_nodes{'part_node_chapter_after_top'}{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'prev'} = $result_nodes{'part_node_chapter_after_top'};
$result_nodes{'part_node_chapter_after_top'}{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'up'} = $result_nodes{'part_node_chapter_after_top'};
$result_nodes{'part_node_chapter_after_top'}{'extra'}{'node_directions'}{'next'}{'extra'}{'node_preceding_part'} = $result_nodes{'part_node_chapter_after_top'}{'extra'}{'associated_section'}{'structure'}{'associated_unit'}{'directions'}{'FastForward'}{'unit_command'}{'extra'}{'associated_part'};
$result_nodes{'part_node_chapter_after_top'}{'extra'}{'node_directions'}{'next'}{'structure'}{'associated_unit'} = $result_nodes{'part_node_chapter_after_top'}{'extra'}{'associated_section'}{'structure'}{'associated_unit'}{'directions'}{'FastForward'};
$result_nodes{'part_node_chapter_after_top'}{'structure'}{'associated_unit'} = $result_nodes{'part_node_chapter_after_top'}{'extra'}{'associated_section'}{'structure'}{'associated_unit'};
$result_nodes{'part_node_chapter_after_top'}{'structure'}{'menu_child'} = $result_nodes{'part_node_chapter_after_top'}{'extra'}{'node_directions'}{'next'};

$result_menus{'part_node_chapter_after_top'} = {
  'cmdname' => 'node',
  'extra' => {
    'normalized' => 'Top'
  },
  'structure' => {
    'associated_unit' => {
      'directions' => {
        'FastForward' => {
          'directions' => {
            'Back' => {},
            'FastBack' => {},
            'NodeBack' => {},
            'NodeForward' => {},
            'NodeNext' => {},
            'NodeUp' => {},
            'This' => {}
          },
          'tree_unit_directions' => {
            'prev' => {}
          },
          'type' => 'unit',
          'unit_command' => {
            'cmdname' => 'chapter',
            'extra' => {
              'associated_part' => {
                'cmdname' => 'part',
                'extra' => {},
                'structure' => {
                  'associated_unit' => {}
                }
              },
              'section_number' => 1
            },
            'structure' => {
              'associated_unit' => {}
            }
          }
        },
        'Forward' => {},
        'Next' => {},
        'NodeForward' => {},
        'NodeNext' => {},
        'This' => {}
      },
      'tree_unit_directions' => {
        'next' => {}
      },
      'type' => 'unit',
      'unit_command' => {
        'cmdname' => 'top',
        'extra' => {},
        'structure' => {
          'associated_unit' => {}
        }
      }
    },
    'menu_child' => {
      'cmdname' => 'node',
      'extra' => {
        'menu_directions' => {
          'next' => {
            'cmdname' => 'node',
            'extra' => {
              'menu_directions' => {
                'prev' => {},
                'up' => {}
              },
              'normalized' => 'chapter'
            },
            'structure' => {
              'associated_unit' => {},
              'menu_up_hash' => {
                'Top' => 1
              }
            }
          },
          'up' => {}
        },
        'normalized' => 'a-node-after-part'
      },
      'structure' => {
        'associated_unit' => {},
        'menu_up_hash' => {
          'Top' => 1
        }
      }
    }
  }
};
$result_menus{'part_node_chapter_after_top'}{'structure'}{'associated_unit'}{'directions'}{'FastForward'}{'directions'}{'Back'} = $result_menus{'part_node_chapter_after_top'}{'structure'}{'associated_unit'};
$result_menus{'part_node_chapter_after_top'}{'structure'}{'associated_unit'}{'directions'}{'FastForward'}{'directions'}{'FastBack'} = $result_menus{'part_node_chapter_after_top'}{'structure'}{'associated_unit'};
$result_menus{'part_node_chapter_after_top'}{'structure'}{'associated_unit'}{'directions'}{'FastForward'}{'directions'}{'NodeBack'} = $result_menus{'part_node_chapter_after_top'}{'structure'}{'associated_unit'};
$result_menus{'part_node_chapter_after_top'}{'structure'}{'associated_unit'}{'directions'}{'FastForward'}{'directions'}{'NodeForward'} = $result_menus{'part_node_chapter_after_top'}{'structure'}{'associated_unit'}{'directions'}{'FastForward'};
$result_menus{'part_node_chapter_after_top'}{'structure'}{'associated_unit'}{'directions'}{'FastForward'}{'directions'}{'NodeNext'} = $result_menus{'part_node_chapter_after_top'}{'structure'}{'associated_unit'}{'directions'}{'FastForward'};
$result_menus{'part_node_chapter_after_top'}{'structure'}{'associated_unit'}{'directions'}{'FastForward'}{'directions'}{'NodeUp'} = $result_menus{'part_node_chapter_after_top'}{'structure'}{'associated_unit'};
$result_menus{'part_node_chapter_after_top'}{'structure'}{'associated_unit'}{'directions'}{'FastForward'}{'directions'}{'This'} = $result_menus{'part_node_chapter_after_top'}{'structure'}{'associated_unit'}{'directions'}{'FastForward'};
$result_menus{'part_node_chapter_after_top'}{'structure'}{'associated_unit'}{'directions'}{'FastForward'}{'tree_unit_directions'}{'prev'} = $result_menus{'part_node_chapter_after_top'}{'structure'}{'associated_unit'};
$result_menus{'part_node_chapter_after_top'}{'structure'}{'associated_unit'}{'directions'}{'FastForward'}{'unit_command'}{'extra'}{'associated_part'}{'structure'}{'associated_unit'} = $result_menus{'part_node_chapter_after_top'}{'structure'}{'associated_unit'}{'directions'}{'FastForward'};
$result_menus{'part_node_chapter_after_top'}{'structure'}{'associated_unit'}{'directions'}{'FastForward'}{'unit_command'}{'structure'}{'associated_unit'} = $result_menus{'part_node_chapter_after_top'}{'structure'}{'associated_unit'}{'directions'}{'FastForward'};
$result_menus{'part_node_chapter_after_top'}{'structure'}{'associated_unit'}{'directions'}{'Forward'} = $result_menus{'part_node_chapter_after_top'}{'structure'}{'associated_unit'}{'directions'}{'FastForward'};
$result_menus{'part_node_chapter_after_top'}{'structure'}{'associated_unit'}{'directions'}{'Next'} = $result_menus{'part_node_chapter_after_top'}{'structure'}{'associated_unit'}{'directions'}{'FastForward'};
$result_menus{'part_node_chapter_after_top'}{'structure'}{'associated_unit'}{'directions'}{'NodeForward'} = $result_menus{'part_node_chapter_after_top'}{'structure'}{'associated_unit'}{'directions'}{'FastForward'};
$result_menus{'part_node_chapter_after_top'}{'structure'}{'associated_unit'}{'directions'}{'NodeNext'} = $result_menus{'part_node_chapter_after_top'}{'structure'}{'associated_unit'}{'directions'}{'FastForward'};
$result_menus{'part_node_chapter_after_top'}{'structure'}{'associated_unit'}{'directions'}{'This'} = $result_menus{'part_node_chapter_after_top'}{'structure'}{'associated_unit'};
$result_menus{'part_node_chapter_after_top'}{'structure'}{'associated_unit'}{'tree_unit_directions'}{'next'} = $result_menus{'part_node_chapter_after_top'}{'structure'}{'associated_unit'}{'directions'}{'FastForward'};
$result_menus{'part_node_chapter_after_top'}{'structure'}{'associated_unit'}{'unit_command'}{'structure'}{'associated_unit'} = $result_menus{'part_node_chapter_after_top'}{'structure'}{'associated_unit'};
$result_menus{'part_node_chapter_after_top'}{'structure'}{'menu_child'}{'extra'}{'menu_directions'}{'next'}{'extra'}{'menu_directions'}{'prev'} = $result_menus{'part_node_chapter_after_top'}{'structure'}{'menu_child'};
$result_menus{'part_node_chapter_after_top'}{'structure'}{'menu_child'}{'extra'}{'menu_directions'}{'next'}{'extra'}{'menu_directions'}{'up'} = $result_menus{'part_node_chapter_after_top'};
$result_menus{'part_node_chapter_after_top'}{'structure'}{'menu_child'}{'extra'}{'menu_directions'}{'next'}{'structure'}{'associated_unit'} = $result_menus{'part_node_chapter_after_top'}{'structure'}{'associated_unit'}{'directions'}{'FastForward'};
$result_menus{'part_node_chapter_after_top'}{'structure'}{'menu_child'}{'extra'}{'menu_directions'}{'up'} = $result_menus{'part_node_chapter_after_top'};
$result_menus{'part_node_chapter_after_top'}{'structure'}{'menu_child'}{'structure'}{'associated_unit'} = $result_menus{'part_node_chapter_after_top'}{'structure'}{'associated_unit'}{'directions'}{'FastForward'};

$result_errors{'part_node_chapter_after_top'} = [];


$result_floats{'part_node_chapter_after_top'} = {};


$result_elements{'part_node_chapter_after_top'} = [
  {
    'directions' => {
      'FastForward' => {
        'directions' => {
          'Back' => {},
          'FastBack' => {},
          'NodeBack' => {},
          'NodeForward' => {},
          'NodeNext' => {},
          'NodeUp' => {},
          'This' => {}
        },
        'type' => 'unit',
        'unit_command' => {
          'cmdname' => 'chapter',
          'extra' => {
            'associated_part' => {
              'cmdname' => 'part',
              'extra' => {},
              'structure' => {
                'associated_unit' => {}
              }
            },
            'section_number' => 1
          },
          'structure' => {
            'associated_unit' => {}
          }
        }
      },
      'Forward' => {},
      'Next' => {},
      'NodeForward' => {},
      'NodeNext' => {},
      'This' => {}
    },
    'type' => 'unit',
    'unit_command' => {
      'cmdname' => 'top',
      'extra' => {},
      'structure' => {
        'associated_unit' => {}
      }
    }
  },
  {}
];
$result_elements{'part_node_chapter_after_top'}[0]{'directions'}{'FastForward'}{'directions'}{'Back'} = $result_elements{'part_node_chapter_after_top'}[0];
$result_elements{'part_node_chapter_after_top'}[0]{'directions'}{'FastForward'}{'directions'}{'FastBack'} = $result_elements{'part_node_chapter_after_top'}[0];
$result_elements{'part_node_chapter_after_top'}[0]{'directions'}{'FastForward'}{'directions'}{'NodeBack'} = $result_elements{'part_node_chapter_after_top'}[0];
$result_elements{'part_node_chapter_after_top'}[0]{'directions'}{'FastForward'}{'directions'}{'NodeForward'} = $result_elements{'part_node_chapter_after_top'}[0]{'directions'}{'FastForward'};
$result_elements{'part_node_chapter_after_top'}[0]{'directions'}{'FastForward'}{'directions'}{'NodeNext'} = $result_elements{'part_node_chapter_after_top'}[0]{'directions'}{'FastForward'};
$result_elements{'part_node_chapter_after_top'}[0]{'directions'}{'FastForward'}{'directions'}{'NodeUp'} = $result_elements{'part_node_chapter_after_top'}[0];
$result_elements{'part_node_chapter_after_top'}[0]{'directions'}{'FastForward'}{'directions'}{'This'} = $result_elements{'part_node_chapter_after_top'}[0]{'directions'}{'FastForward'};
$result_elements{'part_node_chapter_after_top'}[0]{'directions'}{'FastForward'}{'unit_command'}{'extra'}{'associated_part'}{'structure'}{'associated_unit'} = $result_elements{'part_node_chapter_after_top'}[0]{'directions'}{'FastForward'};
$result_elements{'part_node_chapter_after_top'}[0]{'directions'}{'FastForward'}{'unit_command'}{'structure'}{'associated_unit'} = $result_elements{'part_node_chapter_after_top'}[0]{'directions'}{'FastForward'};
$result_elements{'part_node_chapter_after_top'}[0]{'directions'}{'Forward'} = $result_elements{'part_node_chapter_after_top'}[0]{'directions'}{'FastForward'};
$result_elements{'part_node_chapter_after_top'}[0]{'directions'}{'Next'} = $result_elements{'part_node_chapter_after_top'}[0]{'directions'}{'FastForward'};
$result_elements{'part_node_chapter_after_top'}[0]{'directions'}{'NodeForward'} = $result_elements{'part_node_chapter_after_top'}[0]{'directions'}{'FastForward'};
$result_elements{'part_node_chapter_after_top'}[0]{'directions'}{'NodeNext'} = $result_elements{'part_node_chapter_after_top'}[0]{'directions'}{'FastForward'};
$result_elements{'part_node_chapter_after_top'}[0]{'directions'}{'This'} = $result_elements{'part_node_chapter_after_top'}[0];
$result_elements{'part_node_chapter_after_top'}[0]{'unit_command'}{'structure'}{'associated_unit'} = $result_elements{'part_node_chapter_after_top'}[0];
$result_elements{'part_node_chapter_after_top'}[1] = $result_elements{'part_node_chapter_after_top'}[0]{'directions'}{'FastForward'};



$result_directions_text{'part_node_chapter_after_top'} = 'element: @top top
  FastForward: @chapter chapter
  Forward: @chapter chapter
  Next: @chapter chapter
  NodeForward: @chapter chapter
  NodeNext: @chapter chapter
  This: @top top
element: @chapter chapter
  Back: @top top
  FastBack: @top top
  NodeBack: @top top
  NodeForward: @chapter chapter
  NodeNext: @chapter chapter
  NodeUp: @top top
  This: @chapter chapter
';


$result_converted{'info'}->{'part_node_chapter_after_top'} = 'This is , produced from .


File: ,  Node: Top,  Next: a node after part,  Up: (dir)

top
***

* Menu:

* a node after part::
* chapter::


File: ,  Node: a node after part,  Next: chapter,  Prev: Top,  Up: Top

After a node after part


File: ,  Node: chapter,  Next: a node after part,  Up: Top

1 chapter
*********



Tag Table:
Node: Top27
Node: a node after part140
Node: chapter239

End Tag Table


Local Variables:
coding: utf-8
End:
';


$result_converted{'html'}->{'part_node_chapter_after_top'} = '<!DOCTYPE html>
<html>
<!-- Created by texinfo, http://www.gnu.org/software/texinfo/ -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>top</title>

<meta name="description" content="top">
<meta name="keywords" content="top">
<meta name="resource-type" content="document">
<meta name="distribution" content="global">
<meta name="viewport" content="width=device-width,initial-scale=1">

<link href="#Top" rel="start" title="Top">
<style type="text/css">
<!--
a.copiable-link {visibility: hidden; text-decoration: none; line-height: 0em}
span:hover a.copiable-link {visibility: visible}
-->
</style>


</head>

<body lang="en">
<div class="top-level-extent" id="Top">
<div class="nav-panel">
<p>
Next: <a href="#a-node-after-part" accesskey="n" rel="next">a node after part</a> &nbsp; </p>
</div>
<h1 class="top" id="top"><span>top<a class="copiable-link" href="#top"> &para;</a></span></h1>


<hr>
</div>
<div class="part-level-extent" id="part">
<div class="nav-panel">
<p>
Next: <a href="#chapter" accesskey="n" rel="next">chapter</a>, Previous: <a href="#Top" accesskey="p" rel="prev">top</a>, Up: <a href="#Top" accesskey="u" rel="up">top</a> &nbsp; </p>
</div>
<h1 class="part"><span>part<a class="copiable-link" href="#part"> &para;</a></span></h1>
<hr>

<ul class="mini-toc">
<li><a href="#chapter" accesskey="1">chapter</a></li>
</ul>
<h4 class="node" id="a-node-after-part"><span>a node after part<a class="copiable-link" href="#a-node-after-part"> &para;</a></span></h4>
<p>After a node after part
</p>
<hr>
<div class="chapter-level-extent" id="chapter">
<div class="nav-panel">
<p>
Next: <a href="#a-node-after-part" accesskey="n" rel="next">a node after part</a>, Up: <a href="#Top" accesskey="u" rel="up">top</a> &nbsp; </p>
</div>
<h2 class="chapter" id="chapter-1"><span>1 chapter<a class="copiable-link" href="#chapter-1"> &para;</a></span></h2>
</div>
</div>



</body>
</html>
';


$result_converted{'xml'}->{'part_node_chapter_after_top'} = '<node name="Top" spaces=" "><nodename>Top</nodename><nodenext automatic="on">a node after part</nodenext></node>
<top spaces=" "><sectiontitle>top</sectiontitle>

<menu endspaces=" ">
<menuentry><menuleadingtext>* </menuleadingtext><menunode>a node after part</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode>chapter</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry></menu>

</top>
<part spaces=" "><sectiontitle>part</sectiontitle>

<node name="a-node-after-part" spaces=" "><nodename>a node after part</nodename><nodenext spaces=" ">chapter</nodenext><nodeprev spaces=" ">Top</nodeprev><nodeup spaces=" ">Top</nodeup></node>
<para>After a node after part
</para>
<node name="chapter" spaces=" "><nodename>chapter</nodename><nodenext spaces=" ">a node after part</nodenext><nodeprev></nodeprev><nodeup spaces=" ">Top</nodeup></node>
<chapter spaces=" "><sectiontitle>chapter </sectiontitle>
</chapter>
</part>
';

1;
