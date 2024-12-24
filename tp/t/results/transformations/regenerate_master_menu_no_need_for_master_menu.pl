use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'regenerate_master_menu_no_need_for_master_menu'} = {
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
      'cmdname' => 'top',
      'contents' => [
        {
          'contents' => [
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
          'type' => 'arguments_line'
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
                      'text' => 'chap'
                    }
                  ],
                  'extra' => {
                    'node_content' => {
                      'contents' => [
                        {}
                      ]
                    },
                    'normalized' => 'chap'
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
                'line_nr' => 5
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
                'line_nr' => 6
              }
            }
          ],
          'source_info' => {
            'line_nr' => 4
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
        'line_nr' => 2
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
                  'text' => 'chap'
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
        }
      ],
      'extra' => {
        'is_target' => 1,
        'normalized' => 'chap'
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
    {
      'cmdname' => 'chapter',
      'contents' => [
        {
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'Chapter'
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
        }
      ],
      'extra' => {
        'section_number' => '1'
      },
      'info' => {
        'spaces_before_argument' => {
          'text' => ' '
        }
      },
      'source_info' => {
        'line_nr' => 9
      }
    }
  ],
  'type' => 'document_root'
};
$result_trees{'regenerate_master_menu_no_need_for_master_menu'}{'contents'}[2]{'contents'}[2]{'contents'}[1]{'contents'}[1]{'extra'}{'node_content'}{'contents'}[0] = $result_trees{'regenerate_master_menu_no_need_for_master_menu'}{'contents'}[2]{'contents'}[2]{'contents'}[1]{'contents'}[1]{'contents'}[0];

$result_texis{'regenerate_master_menu_no_need_for_master_menu'} = '@node Top
@top top

@menu
* chap::
@end menu

@node chap
@chapter Chapter
';


$result_texts{'regenerate_master_menu_no_need_for_master_menu'} = 'top
***

* chap::

1 Chapter
*********
';

$result_sectioning{'regenerate_master_menu_no_need_for_master_menu'} = {
  'extra' => {
    'section_childs' => [
      {
        'cmdname' => 'top',
        'extra' => {
          'associated_node' => {
            'cmdname' => 'node',
            'extra' => {
              'normalized' => 'Top'
            }
          },
          'section_childs' => [
            {
              'cmdname' => 'chapter',
              'extra' => {
                'associated_node' => {
                  'cmdname' => 'node',
                  'extra' => {
                    'normalized' => 'chap'
                  }
                },
                'section_directions' => {
                  'up' => {}
                },
                'section_level' => 1,
                'section_number' => '1',
                'toplevel_directions' => {
                  'prev' => {},
                  'up' => {}
                }
              }
            }
          ],
          'section_level' => 0,
          'sectioning_root' => {},
          'toplevel_directions' => {}
        }
      }
    ],
    'section_level' => -1
  }
};
$result_sectioning{'regenerate_master_menu_no_need_for_master_menu'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[0]{'extra'}{'section_directions'}{'up'} = $result_sectioning{'regenerate_master_menu_no_need_for_master_menu'}{'extra'}{'section_childs'}[0];
$result_sectioning{'regenerate_master_menu_no_need_for_master_menu'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[0]{'extra'}{'toplevel_directions'}{'prev'} = $result_sectioning{'regenerate_master_menu_no_need_for_master_menu'}{'extra'}{'section_childs'}[0];
$result_sectioning{'regenerate_master_menu_no_need_for_master_menu'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[0]{'extra'}{'toplevel_directions'}{'up'} = $result_sectioning{'regenerate_master_menu_no_need_for_master_menu'}{'extra'}{'section_childs'}[0];
$result_sectioning{'regenerate_master_menu_no_need_for_master_menu'}{'extra'}{'section_childs'}[0]{'extra'}{'sectioning_root'} = $result_sectioning{'regenerate_master_menu_no_need_for_master_menu'};

$result_nodes{'regenerate_master_menu_no_need_for_master_menu'} = [
  {
    'cmdname' => 'node',
    'extra' => {
      'associated_section' => {
        'cmdname' => 'top',
        'extra' => {}
      },
      'node_directions' => {
        'next' => {
          'cmdname' => 'node',
          'extra' => {
            'associated_section' => {
              'cmdname' => 'chapter',
              'extra' => {
                'section_number' => '1'
              }
            },
            'node_directions' => {
              'prev' => {},
              'up' => {}
            },
            'normalized' => 'chap'
          }
        }
      },
      'normalized' => 'Top'
    }
  },
  {}
];
$result_nodes{'regenerate_master_menu_no_need_for_master_menu'}[0]{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'prev'} = $result_nodes{'regenerate_master_menu_no_need_for_master_menu'}[0];
$result_nodes{'regenerate_master_menu_no_need_for_master_menu'}[0]{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'up'} = $result_nodes{'regenerate_master_menu_no_need_for_master_menu'}[0];
$result_nodes{'regenerate_master_menu_no_need_for_master_menu'}[1] = $result_nodes{'regenerate_master_menu_no_need_for_master_menu'}[0]{'extra'}{'node_directions'}{'next'};

$result_menus{'regenerate_master_menu_no_need_for_master_menu'} = [
  {
    'extra' => {
      'menus' => [
        {}
      ],
      'normalized' => 'Top'
    }
  },
  {
    'extra' => {
      'menu_directions' => {
        'up' => {}
      },
      'normalized' => 'chap'
    }
  }
];
$result_menus{'regenerate_master_menu_no_need_for_master_menu'}[1]{'extra'}{'menu_directions'}{'up'} = $result_menus{'regenerate_master_menu_no_need_for_master_menu'}[0];

$result_errors{'regenerate_master_menu_no_need_for_master_menu'} = [];


$result_floats{'regenerate_master_menu_no_need_for_master_menu'} = {};


1;
