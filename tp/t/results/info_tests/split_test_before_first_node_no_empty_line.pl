use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'split_test_before_first_node_no_empty_line'} = {
  'contents' => [
    {
      'contents' => [
        {
          'args' => [
            {
              'contents' => [
                {
                  'text' => 'split_test_before_first_node_no_empty_line.info'
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
          'cmdname' => 'setfilename',
          'extra' => {
            'text_arg' => 'split_test_before_first_node_no_empty_line.info'
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
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'contents' => [
            {
              'text' => 'truc machin et reuc machin  ze aze zea zae eaz eaz zae
'
            }
          ],
          'type' => 'paragraph'
        }
      ],
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
        'line_nr' => 4,
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
          'contents' => [
            {
              'text' => 'In top node
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
                      'text' => 'chap1'
                    }
                  ],
                  'extra' => {
                    'node_content' => [
                      {}
                    ],
                    'normalized' => 'chap1'
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
                'line_nr' => 11,
                'macro' => ''
              }
            }
          ],
          'source_info' => {
            'file_name' => '',
            'line_nr' => 9,
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
        'line_nr' => 5,
        'macro' => ''
      }
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'text' => 'chap1'
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
        'normalized' => 'chap1'
      },
      'info' => {
        'spaces_before_argument' => {
          'text' => ' '
        }
      },
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
      'cmdname' => 'chapter',
      'contents' => [
        {
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'contents' => [
            {
              'text' => 'In chap1.
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
        'section_number' => 1
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
    }
  ],
  'type' => 'document_root'
};
$result_trees{'split_test_before_first_node_no_empty_line'}{'contents'}[2]{'contents'}[3]{'contents'}[0]{'contents'}[1]{'extra'}{'node_content'}[0] = $result_trees{'split_test_before_first_node_no_empty_line'}{'contents'}[2]{'contents'}[3]{'contents'}[0]{'contents'}[1]{'contents'}[0];

$result_texis{'split_test_before_first_node_no_empty_line'} = '@setfilename split_test_before_first_node_no_empty_line.info

truc machin et reuc machin  ze aze zea zae eaz eaz zae
@node Top
@top top

In top node

@menu
* chap1::
@end menu

@node chap1
@chapter chap

In chap1.

';


$result_texts{'split_test_before_first_node_no_empty_line'} = '
truc machin et reuc machin  ze aze zea zae eaz eaz zae
top
***

In top node

* chap1::

1 chap
******

In chap1.

';

$result_sectioning{'split_test_before_first_node_no_empty_line'} = {
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
            'structure' => {}
          },
          'section_childs' => [
            {
              'cmdname' => 'chapter',
              'extra' => {
                'associated_node' => {
                  'cmdname' => 'node',
                  'extra' => {
                    'normalized' => 'chap1'
                  },
                  'structure' => {}
                },
                'section_level' => 1,
                'section_number' => 1
              },
              'structure' => {
                'section_up' => {},
                'toplevel_prev' => {},
                'toplevel_up' => {}
              }
            }
          ],
          'section_level' => 0
        },
        'structure' => {
          'section_up' => {}
        }
      }
    ],
    'section_level' => -1
  }
};
$result_sectioning{'split_test_before_first_node_no_empty_line'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[0]{'structure'}{'section_up'} = $result_sectioning{'split_test_before_first_node_no_empty_line'}{'extra'}{'section_childs'}[0];
$result_sectioning{'split_test_before_first_node_no_empty_line'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[0]{'structure'}{'toplevel_prev'} = $result_sectioning{'split_test_before_first_node_no_empty_line'}{'extra'}{'section_childs'}[0];
$result_sectioning{'split_test_before_first_node_no_empty_line'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[0]{'structure'}{'toplevel_up'} = $result_sectioning{'split_test_before_first_node_no_empty_line'}{'extra'}{'section_childs'}[0];
$result_sectioning{'split_test_before_first_node_no_empty_line'}{'extra'}{'section_childs'}[0]{'structure'}{'section_up'} = $result_sectioning{'split_test_before_first_node_no_empty_line'};

$result_nodes{'split_test_before_first_node_no_empty_line'} = {
  'cmdname' => 'node',
  'extra' => {
    'associated_section' => {
      'cmdname' => 'top',
      'extra' => {},
      'structure' => {}
    },
    'menus' => [
      {
        'cmdname' => 'menu'
      }
    ],
    'normalized' => 'Top'
  },
  'structure' => {
    'menu_child' => {
      'cmdname' => 'node',
      'extra' => {
        'associated_section' => {
          'cmdname' => 'chapter',
          'extra' => {
            'section_number' => 1
          },
          'structure' => {}
        },
        'normalized' => 'chap1'
      },
      'structure' => {
        'node_prev' => {},
        'node_up' => {}
      }
    },
    'node_next' => {}
  }
};
$result_nodes{'split_test_before_first_node_no_empty_line'}{'structure'}{'menu_child'}{'structure'}{'node_prev'} = $result_nodes{'split_test_before_first_node_no_empty_line'};
$result_nodes{'split_test_before_first_node_no_empty_line'}{'structure'}{'menu_child'}{'structure'}{'node_up'} = $result_nodes{'split_test_before_first_node_no_empty_line'};
$result_nodes{'split_test_before_first_node_no_empty_line'}{'structure'}{'node_next'} = $result_nodes{'split_test_before_first_node_no_empty_line'}{'structure'}{'menu_child'};

$result_menus{'split_test_before_first_node_no_empty_line'} = {
  'cmdname' => 'node',
  'extra' => {
    'normalized' => 'Top'
  },
  'structure' => {
    'menu_child' => {
      'cmdname' => 'node',
      'extra' => {
        'normalized' => 'chap1'
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
$result_menus{'split_test_before_first_node_no_empty_line'}{'structure'}{'menu_child'}{'structure'}{'menu_up'} = $result_menus{'split_test_before_first_node_no_empty_line'};

$result_errors{'split_test_before_first_node_no_empty_line'} = [];


$result_floats{'split_test_before_first_node_no_empty_line'} = {};


1;
