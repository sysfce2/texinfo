use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'empty_menu_entry_name'} = {
  'contents' => [
    {
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
                  'parent' => {},
                  'type' => 'menu_entry_name'
                },
                {
                  'parent' => {},
                  'text' => ': ',
                  'type' => 'menu_entry_separator'
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => '('
                    },
                    {
                      'parent' => {},
                      'text' => 'vvv'
                    },
                    {
                      'parent' => {},
                      'text' => ')'
                    }
                  ],
                  'parent' => {},
                  'type' => 'menu_entry_node'
                },
                {
                  'parent' => {},
                  'text' => '. ',
                  'type' => 'menu_entry_separator'
                },
                {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'fff
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
                'menu_entry_name' => {},
                'menu_entry_node' => {
                  'manual_content' => [
                    {}
                  ]
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
                  'parent' => {},
                  'type' => 'menu_entry_name'
                },
                {
                  'parent' => {},
                  'text' => ':',
                  'type' => 'menu_entry_separator'
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'aaa'
                    }
                  ],
                  'parent' => {},
                  'type' => 'menu_entry_node'
                },
                {
                  'parent' => {},
                  'text' => ',',
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
                'menu_entry_name' => {},
                'menu_entry_node' => {
                  'node_content' => [
                    {}
                  ],
                  'normalized' => 'aaa'
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
              'text' => 'aaa'
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
      'extra' => {
        'node_content' => [
          {}
        ],
        'nodes_manuals' => [
          {
            'node_content' => [
              {}
            ],
            'normalized' => 'aaa'
          }
        ],
        'normalized' => 'aaa',
        'spaces_before_argument' => ' '
      },
      'parent' => {},
      'source_info' => {
        'file_name' => '',
        'line_nr' => 8,
        'macro' => ''
      }
    }
  ],
  'type' => 'document_root'
};
$result_trees{'empty_menu_entry_name'}{'contents'}[0]{'parent'} = $result_trees{'empty_menu_entry_name'};
$result_trees{'empty_menu_entry_name'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'empty_menu_entry_name'}{'contents'}[1]{'args'}[0];
$result_trees{'empty_menu_entry_name'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'empty_menu_entry_name'}{'contents'}[1];
$result_trees{'empty_menu_entry_name'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'empty_menu_entry_name'}{'contents'}[1];
$result_trees{'empty_menu_entry_name'}{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'empty_menu_entry_name'}{'contents'}[1]{'contents'}[1];
$result_trees{'empty_menu_entry_name'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'empty_menu_entry_name'}{'contents'}[1]{'contents'}[1]{'contents'}[0];
$result_trees{'empty_menu_entry_name'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[1]{'parent'} = $result_trees{'empty_menu_entry_name'}{'contents'}[1]{'contents'}[1]{'contents'}[0];
$result_trees{'empty_menu_entry_name'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[2]{'parent'} = $result_trees{'empty_menu_entry_name'}{'contents'}[1]{'contents'}[1]{'contents'}[0];
$result_trees{'empty_menu_entry_name'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'empty_menu_entry_name'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[3];
$result_trees{'empty_menu_entry_name'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[3]{'contents'}[1]{'parent'} = $result_trees{'empty_menu_entry_name'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[3];
$result_trees{'empty_menu_entry_name'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[3]{'contents'}[2]{'parent'} = $result_trees{'empty_menu_entry_name'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[3];
$result_trees{'empty_menu_entry_name'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[3]{'parent'} = $result_trees{'empty_menu_entry_name'}{'contents'}[1]{'contents'}[1]{'contents'}[0];
$result_trees{'empty_menu_entry_name'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[4]{'parent'} = $result_trees{'empty_menu_entry_name'}{'contents'}[1]{'contents'}[1]{'contents'}[0];
$result_trees{'empty_menu_entry_name'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[5]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'empty_menu_entry_name'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[5]{'contents'}[0];
$result_trees{'empty_menu_entry_name'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[5]{'contents'}[0]{'parent'} = $result_trees{'empty_menu_entry_name'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[5];
$result_trees{'empty_menu_entry_name'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[5]{'parent'} = $result_trees{'empty_menu_entry_name'}{'contents'}[1]{'contents'}[1]{'contents'}[0];
$result_trees{'empty_menu_entry_name'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_description'} = $result_trees{'empty_menu_entry_name'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[5];
$result_trees{'empty_menu_entry_name'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_name'} = $result_trees{'empty_menu_entry_name'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[1];
$result_trees{'empty_menu_entry_name'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_node'}{'manual_content'}[0] = $result_trees{'empty_menu_entry_name'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[3]{'contents'}[1];
$result_trees{'empty_menu_entry_name'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'empty_menu_entry_name'}{'contents'}[1]{'contents'}[1];
$result_trees{'empty_menu_entry_name'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'empty_menu_entry_name'}{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'empty_menu_entry_name'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'empty_menu_entry_name'}{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'empty_menu_entry_name'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[2]{'parent'} = $result_trees{'empty_menu_entry_name'}{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'empty_menu_entry_name'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'empty_menu_entry_name'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[3];
$result_trees{'empty_menu_entry_name'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[3]{'parent'} = $result_trees{'empty_menu_entry_name'}{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'empty_menu_entry_name'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[4]{'parent'} = $result_trees{'empty_menu_entry_name'}{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'empty_menu_entry_name'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[5]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'empty_menu_entry_name'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[5]{'contents'}[0];
$result_trees{'empty_menu_entry_name'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[5]{'contents'}[0]{'parent'} = $result_trees{'empty_menu_entry_name'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[5];
$result_trees{'empty_menu_entry_name'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[5]{'parent'} = $result_trees{'empty_menu_entry_name'}{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'empty_menu_entry_name'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'extra'}{'menu_entry_description'} = $result_trees{'empty_menu_entry_name'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[5];
$result_trees{'empty_menu_entry_name'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'extra'}{'menu_entry_name'} = $result_trees{'empty_menu_entry_name'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[1];
$result_trees{'empty_menu_entry_name'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'extra'}{'menu_entry_node'}{'node_content'}[0] = $result_trees{'empty_menu_entry_name'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[3]{'contents'}[0];
$result_trees{'empty_menu_entry_name'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'empty_menu_entry_name'}{'contents'}[1]{'contents'}[1];
$result_trees{'empty_menu_entry_name'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'empty_menu_entry_name'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'args'}[0];
$result_trees{'empty_menu_entry_name'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'empty_menu_entry_name'}{'contents'}[1]{'contents'}[1]{'contents'}[2];
$result_trees{'empty_menu_entry_name'}{'contents'}[1]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'empty_menu_entry_name'}{'contents'}[1]{'contents'}[1];
$result_trees{'empty_menu_entry_name'}{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'empty_menu_entry_name'}{'contents'}[1];
$result_trees{'empty_menu_entry_name'}{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'empty_menu_entry_name'}{'contents'}[1];
$result_trees{'empty_menu_entry_name'}{'contents'}[1]{'extra'}{'node_content'}[0] = $result_trees{'empty_menu_entry_name'}{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'empty_menu_entry_name'}{'contents'}[1]{'extra'}{'nodes_manuals'}[0]{'node_content'}[0] = $result_trees{'empty_menu_entry_name'}{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'empty_menu_entry_name'}{'contents'}[1]{'parent'} = $result_trees{'empty_menu_entry_name'};
$result_trees{'empty_menu_entry_name'}{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'empty_menu_entry_name'}{'contents'}[2]{'args'}[0];
$result_trees{'empty_menu_entry_name'}{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'empty_menu_entry_name'}{'contents'}[2];
$result_trees{'empty_menu_entry_name'}{'contents'}[2]{'extra'}{'node_content'}[0] = $result_trees{'empty_menu_entry_name'}{'contents'}[2]{'args'}[0]{'contents'}[0];
$result_trees{'empty_menu_entry_name'}{'contents'}[2]{'extra'}{'nodes_manuals'}[0]{'node_content'}[0] = $result_trees{'empty_menu_entry_name'}{'contents'}[2]{'args'}[0]{'contents'}[0];
$result_trees{'empty_menu_entry_name'}{'contents'}[2]{'parent'} = $result_trees{'empty_menu_entry_name'};

$result_texis{'empty_menu_entry_name'} = '@node Top

@menu
* : (vvv). fff
* :aaa,
@end menu

@node aaa
';


$result_texts{'empty_menu_entry_name'} = '
* : (vvv). fff
* :aaa,

';

$result_nodes{'empty_menu_entry_name'} = {
  'cmdname' => 'node',
  'extra' => {
    'menus' => [
      {
        'cmdname' => 'menu'
      }
    ],
    'normalized' => 'Top'
  },
  'structure' => {
    'menu_child' => {
      'extra' => {
        'manual_content' => [
          {
            'text' => 'vvv'
          }
        ]
      }
    },
    'node_next' => {}
  }
};
$result_nodes{'empty_menu_entry_name'}{'structure'}{'node_next'} = $result_nodes{'empty_menu_entry_name'}{'structure'}{'menu_child'};

$result_menus{'empty_menu_entry_name'} = {
  'cmdname' => 'node',
  'extra' => {
    'normalized' => 'Top'
  },
  'structure' => {
    'menu_child' => {
      'extra' => {
        'manual_content' => [
          {
            'text' => 'vvv'
          }
        ]
      }
    }
  }
};

$result_errors{'empty_menu_entry_name'} = [
  {
    'error_line' => 'warning: empty menu entry name in `* : (vvv). \'
',
    'file_name' => '',
    'line_nr' => 4,
    'macro' => '',
    'text' => 'empty menu entry name in `* : (vvv). \'',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: empty menu entry name in `* :aaa,\'
',
    'file_name' => '',
    'line_nr' => 5,
    'macro' => '',
    'text' => 'empty menu entry name in `* :aaa,\'',
    'type' => 'warning'
  }
];


$result_floats{'empty_menu_entry_name'} = {};


1;
