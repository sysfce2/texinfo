use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'in_menu_only_special_ascii_spaces_node'} = {
  "contents" => [
    {
      "contents" => [
        {
          "contents" => [],
          "parent" => {},
          "type" => "preamble_before_content"
        }
      ],
      "parent" => {},
      "type" => "before_node_section"
    },
    {
      "args" => [
        {
          "contents" => [
            {
              "parent" => {},
              "text" => "Top"
            }
          ],
          "extra" => {
            "spaces_after_argument" => "\n"
          },
          "parent" => {},
          "type" => "line_arg"
        }
      ],
      "cmdname" => "node",
      "extra" => {
        "node_content" => [
          {}
        ],
        "nodes_manuals" => [
          {
            "node_content" => [
              {}
            ],
            "normalized" => "Top"
          }
        ],
        "normalized" => "Top",
        "spaces_before_argument" => " "
      },
      "parent" => {},
      "source_info" => {
        "file_name" => "in_menu_only_special_ascii_spaces_node.texi",
        "line_nr" => 1,
        "macro" => ""
      }
    },
    {
      "args" => [
        {
          "contents" => [
            {
              "parent" => {},
              "text" => "top"
            }
          ],
          "extra" => {
            "spaces_after_argument" => "\n"
          },
          "parent" => {},
          "type" => "line_arg"
        }
      ],
      "cmdname" => "top",
      "contents" => [
        {
          "parent" => {},
          "text" => "\n",
          "type" => "empty_line"
        },
        {
          "args" => [
            {
              "extra" => {
                "spaces_after_argument" => "\n"
              },
              "parent" => {},
              "type" => "block_line_arg"
            }
          ],
          "cmdname" => "menu",
          "contents" => [
            {
              "args" => [
                {
                  "parent" => {},
                  "text" => "* \r",
                  "type" => "menu_entry_leading_text"
                },
                {
                  "parent" => {},
                  "type" => "menu_entry_node"
                },
                {
                  "parent" => {},
                  "text" => "::",
                  "type" => "menu_entry_separator"
                },
                {
                  "contents" => [
                    {
                      "contents" => [
                        {
                          "parent" => {},
                          "text" => "\n"
                        }
                      ],
                      "parent" => {},
                      "type" => "preformatted"
                    }
                  ],
                  "parent" => {},
                  "type" => "menu_entry_description"
                }
              ],
              "extra" => {
                "menu_entry_description" => {}
              },
              "parent" => {},
              "source_info" => {
                "file_name" => "in_menu_only_special_ascii_spaces_node.texi",
                "line_nr" => 5,
                "macro" => ""
              },
              "type" => "menu_entry"
            },
            {
              "args" => [
                {
                  "parent" => {},
                  "text" => "* \t\f\13",
                  "type" => "menu_entry_leading_text"
                },
                {
                  "parent" => {},
                  "type" => "menu_entry_node"
                },
                {
                  "parent" => {},
                  "text" => "::",
                  "type" => "menu_entry_separator"
                },
                {
                  "contents" => [
                    {
                      "contents" => [
                        {
                          "parent" => {},
                          "text" => "\n"
                        }
                      ],
                      "parent" => {},
                      "type" => "preformatted"
                    }
                  ],
                  "parent" => {},
                  "type" => "menu_entry_description"
                }
              ],
              "extra" => {
                "menu_entry_description" => {}
              },
              "parent" => {},
              "source_info" => {
                "file_name" => "in_menu_only_special_ascii_spaces_node.texi",
                "line_nr" => 6,
                "macro" => ""
              },
              "type" => "menu_entry"
            },
            {
              "args" => [
                {
                  "contents" => [
                    {
                      "parent" => {},
                      "text" => "menu"
                    }
                  ],
                  "extra" => {
                    "spaces_after_argument" => "\n"
                  },
                  "parent" => {},
                  "type" => "line_arg"
                }
              ],
              "cmdname" => "end",
              "extra" => {
                "spaces_before_argument" => " ",
                "text_arg" => "menu"
              },
              "parent" => {},
              "source_info" => {
                "file_name" => "in_menu_only_special_ascii_spaces_node.texi",
                "line_nr" => 7,
                "macro" => ""
              }
            }
          ],
          "parent" => {},
          "source_info" => {
            "file_name" => "in_menu_only_special_ascii_spaces_node.texi",
            "line_nr" => 4,
            "macro" => ""
          }
        },
        {
          "parent" => {},
          "text" => "\n",
          "type" => "empty_line"
        }
      ],
      "extra" => {
        "spaces_before_argument" => " "
      },
      "parent" => {},
      "source_info" => {
        "file_name" => "in_menu_only_special_ascii_spaces_node.texi",
        "line_nr" => 2,
        "macro" => ""
      }
    },
    {
      "args" => [
        {
          "extra" => {
            "spaces_after_argument" => " \r\n"
          },
          "parent" => {},
          "type" => "line_arg"
        }
      ],
      "cmdname" => "node",
      "extra" => {
        "nodes_manuals" => [
          undef
        ]
      },
      "parent" => {},
      "source_info" => {
        "file_name" => "in_menu_only_special_ascii_spaces_node.texi",
        "line_nr" => 9,
        "macro" => ""
      }
    },
    {
      "args" => [
        {
          "contents" => [
            {
              "parent" => {},
              "text" => "CARRIAGE RETURN|\r|"
            }
          ],
          "extra" => {
            "spaces_after_argument" => "\n"
          },
          "parent" => {},
          "type" => "line_arg"
        }
      ],
      "cmdname" => "chapter",
      "contents" => [
        {
          "parent" => {},
          "text" => "\n",
          "type" => "empty_line"
        }
      ],
      "extra" => {
        "spaces_before_argument" => " "
      },
      "parent" => {},
      "source_info" => {
        "file_name" => "in_menu_only_special_ascii_spaces_node.texi",
        "line_nr" => 10,
        "macro" => ""
      }
    },
    {
      "args" => [
        {
          "extra" => {
            "spaces_after_argument" => " \t\f\13\n"
          },
          "parent" => {},
          "type" => "line_arg"
        }
      ],
      "cmdname" => "node",
      "extra" => {
        "nodes_manuals" => [
          undef
        ]
      },
      "parent" => {},
      "source_info" => {
        "file_name" => "in_menu_only_special_ascii_spaces_node.texi",
        "line_nr" => 12,
        "macro" => ""
      }
    },
    {
      "args" => [
        {
          "contents" => [
            {
              "parent" => {},
              "text" => "CHARACTER TABULATION|\t| FORM FEED|\f| LINE TABULATION|\13|"
            }
          ],
          "extra" => {
            "spaces_after_argument" => "\n"
          },
          "parent" => {},
          "type" => "line_arg"
        }
      ],
      "cmdname" => "chapter",
      "contents" => [
        {
          "parent" => {},
          "text" => "\n",
          "type" => "empty_line"
        }
      ],
      "extra" => {
        "spaces_before_argument" => " "
      },
      "parent" => {},
      "source_info" => {
        "file_name" => "in_menu_only_special_ascii_spaces_node.texi",
        "line_nr" => 13,
        "macro" => ""
      }
    }
  ],
  "type" => "document_root"
};
$result_trees{'in_menu_only_special_ascii_spaces_node'}{"contents"}[0]{"contents"}[0]{"parent"} = $result_trees{'in_menu_only_special_ascii_spaces_node'}{"contents"}[0];
$result_trees{'in_menu_only_special_ascii_spaces_node'}{"contents"}[0]{"parent"} = $result_trees{'in_menu_only_special_ascii_spaces_node'};
$result_trees{'in_menu_only_special_ascii_spaces_node'}{"contents"}[1]{"args"}[0]{"contents"}[0]{"parent"} = $result_trees{'in_menu_only_special_ascii_spaces_node'}{"contents"}[1]{"args"}[0];
$result_trees{'in_menu_only_special_ascii_spaces_node'}{"contents"}[1]{"args"}[0]{"parent"} = $result_trees{'in_menu_only_special_ascii_spaces_node'}{"contents"}[1];
$result_trees{'in_menu_only_special_ascii_spaces_node'}{"contents"}[1]{"extra"}{"node_content"}[0] = $result_trees{'in_menu_only_special_ascii_spaces_node'}{"contents"}[1]{"args"}[0]{"contents"}[0];
$result_trees{'in_menu_only_special_ascii_spaces_node'}{"contents"}[1]{"extra"}{"nodes_manuals"}[0]{"node_content"}[0] = $result_trees{'in_menu_only_special_ascii_spaces_node'}{"contents"}[1]{"args"}[0]{"contents"}[0];
$result_trees{'in_menu_only_special_ascii_spaces_node'}{"contents"}[1]{"parent"} = $result_trees{'in_menu_only_special_ascii_spaces_node'};
$result_trees{'in_menu_only_special_ascii_spaces_node'}{"contents"}[2]{"args"}[0]{"contents"}[0]{"parent"} = $result_trees{'in_menu_only_special_ascii_spaces_node'}{"contents"}[2]{"args"}[0];
$result_trees{'in_menu_only_special_ascii_spaces_node'}{"contents"}[2]{"args"}[0]{"parent"} = $result_trees{'in_menu_only_special_ascii_spaces_node'}{"contents"}[2];
$result_trees{'in_menu_only_special_ascii_spaces_node'}{"contents"}[2]{"contents"}[0]{"parent"} = $result_trees{'in_menu_only_special_ascii_spaces_node'}{"contents"}[2];
$result_trees{'in_menu_only_special_ascii_spaces_node'}{"contents"}[2]{"contents"}[1]{"args"}[0]{"parent"} = $result_trees{'in_menu_only_special_ascii_spaces_node'}{"contents"}[2]{"contents"}[1];
$result_trees{'in_menu_only_special_ascii_spaces_node'}{"contents"}[2]{"contents"}[1]{"contents"}[0]{"args"}[0]{"parent"} = $result_trees{'in_menu_only_special_ascii_spaces_node'}{"contents"}[2]{"contents"}[1]{"contents"}[0];
$result_trees{'in_menu_only_special_ascii_spaces_node'}{"contents"}[2]{"contents"}[1]{"contents"}[0]{"args"}[1]{"parent"} = $result_trees{'in_menu_only_special_ascii_spaces_node'}{"contents"}[2]{"contents"}[1]{"contents"}[0];
$result_trees{'in_menu_only_special_ascii_spaces_node'}{"contents"}[2]{"contents"}[1]{"contents"}[0]{"args"}[2]{"parent"} = $result_trees{'in_menu_only_special_ascii_spaces_node'}{"contents"}[2]{"contents"}[1]{"contents"}[0];
$result_trees{'in_menu_only_special_ascii_spaces_node'}{"contents"}[2]{"contents"}[1]{"contents"}[0]{"args"}[3]{"contents"}[0]{"contents"}[0]{"parent"} = $result_trees{'in_menu_only_special_ascii_spaces_node'}{"contents"}[2]{"contents"}[1]{"contents"}[0]{"args"}[3]{"contents"}[0];
$result_trees{'in_menu_only_special_ascii_spaces_node'}{"contents"}[2]{"contents"}[1]{"contents"}[0]{"args"}[3]{"contents"}[0]{"parent"} = $result_trees{'in_menu_only_special_ascii_spaces_node'}{"contents"}[2]{"contents"}[1]{"contents"}[0]{"args"}[3];
$result_trees{'in_menu_only_special_ascii_spaces_node'}{"contents"}[2]{"contents"}[1]{"contents"}[0]{"args"}[3]{"parent"} = $result_trees{'in_menu_only_special_ascii_spaces_node'}{"contents"}[2]{"contents"}[1]{"contents"}[0];
$result_trees{'in_menu_only_special_ascii_spaces_node'}{"contents"}[2]{"contents"}[1]{"contents"}[0]{"extra"}{"menu_entry_description"} = $result_trees{'in_menu_only_special_ascii_spaces_node'}{"contents"}[2]{"contents"}[1]{"contents"}[0]{"args"}[3];
$result_trees{'in_menu_only_special_ascii_spaces_node'}{"contents"}[2]{"contents"}[1]{"contents"}[0]{"parent"} = $result_trees{'in_menu_only_special_ascii_spaces_node'}{"contents"}[2]{"contents"}[1];
$result_trees{'in_menu_only_special_ascii_spaces_node'}{"contents"}[2]{"contents"}[1]{"contents"}[1]{"args"}[0]{"parent"} = $result_trees{'in_menu_only_special_ascii_spaces_node'}{"contents"}[2]{"contents"}[1]{"contents"}[1];
$result_trees{'in_menu_only_special_ascii_spaces_node'}{"contents"}[2]{"contents"}[1]{"contents"}[1]{"args"}[1]{"parent"} = $result_trees{'in_menu_only_special_ascii_spaces_node'}{"contents"}[2]{"contents"}[1]{"contents"}[1];
$result_trees{'in_menu_only_special_ascii_spaces_node'}{"contents"}[2]{"contents"}[1]{"contents"}[1]{"args"}[2]{"parent"} = $result_trees{'in_menu_only_special_ascii_spaces_node'}{"contents"}[2]{"contents"}[1]{"contents"}[1];
$result_trees{'in_menu_only_special_ascii_spaces_node'}{"contents"}[2]{"contents"}[1]{"contents"}[1]{"args"}[3]{"contents"}[0]{"contents"}[0]{"parent"} = $result_trees{'in_menu_only_special_ascii_spaces_node'}{"contents"}[2]{"contents"}[1]{"contents"}[1]{"args"}[3]{"contents"}[0];
$result_trees{'in_menu_only_special_ascii_spaces_node'}{"contents"}[2]{"contents"}[1]{"contents"}[1]{"args"}[3]{"contents"}[0]{"parent"} = $result_trees{'in_menu_only_special_ascii_spaces_node'}{"contents"}[2]{"contents"}[1]{"contents"}[1]{"args"}[3];
$result_trees{'in_menu_only_special_ascii_spaces_node'}{"contents"}[2]{"contents"}[1]{"contents"}[1]{"args"}[3]{"parent"} = $result_trees{'in_menu_only_special_ascii_spaces_node'}{"contents"}[2]{"contents"}[1]{"contents"}[1];
$result_trees{'in_menu_only_special_ascii_spaces_node'}{"contents"}[2]{"contents"}[1]{"contents"}[1]{"extra"}{"menu_entry_description"} = $result_trees{'in_menu_only_special_ascii_spaces_node'}{"contents"}[2]{"contents"}[1]{"contents"}[1]{"args"}[3];
$result_trees{'in_menu_only_special_ascii_spaces_node'}{"contents"}[2]{"contents"}[1]{"contents"}[1]{"parent"} = $result_trees{'in_menu_only_special_ascii_spaces_node'}{"contents"}[2]{"contents"}[1];
$result_trees{'in_menu_only_special_ascii_spaces_node'}{"contents"}[2]{"contents"}[1]{"contents"}[2]{"args"}[0]{"contents"}[0]{"parent"} = $result_trees{'in_menu_only_special_ascii_spaces_node'}{"contents"}[2]{"contents"}[1]{"contents"}[2]{"args"}[0];
$result_trees{'in_menu_only_special_ascii_spaces_node'}{"contents"}[2]{"contents"}[1]{"contents"}[2]{"args"}[0]{"parent"} = $result_trees{'in_menu_only_special_ascii_spaces_node'}{"contents"}[2]{"contents"}[1]{"contents"}[2];
$result_trees{'in_menu_only_special_ascii_spaces_node'}{"contents"}[2]{"contents"}[1]{"contents"}[2]{"parent"} = $result_trees{'in_menu_only_special_ascii_spaces_node'}{"contents"}[2]{"contents"}[1];
$result_trees{'in_menu_only_special_ascii_spaces_node'}{"contents"}[2]{"contents"}[1]{"parent"} = $result_trees{'in_menu_only_special_ascii_spaces_node'}{"contents"}[2];
$result_trees{'in_menu_only_special_ascii_spaces_node'}{"contents"}[2]{"contents"}[2]{"parent"} = $result_trees{'in_menu_only_special_ascii_spaces_node'}{"contents"}[2];
$result_trees{'in_menu_only_special_ascii_spaces_node'}{"contents"}[2]{"parent"} = $result_trees{'in_menu_only_special_ascii_spaces_node'};
$result_trees{'in_menu_only_special_ascii_spaces_node'}{"contents"}[3]{"args"}[0]{"parent"} = $result_trees{'in_menu_only_special_ascii_spaces_node'}{"contents"}[3];
$result_trees{'in_menu_only_special_ascii_spaces_node'}{"contents"}[3]{"parent"} = $result_trees{'in_menu_only_special_ascii_spaces_node'};
$result_trees{'in_menu_only_special_ascii_spaces_node'}{"contents"}[4]{"args"}[0]{"contents"}[0]{"parent"} = $result_trees{'in_menu_only_special_ascii_spaces_node'}{"contents"}[4]{"args"}[0];
$result_trees{'in_menu_only_special_ascii_spaces_node'}{"contents"}[4]{"args"}[0]{"parent"} = $result_trees{'in_menu_only_special_ascii_spaces_node'}{"contents"}[4];
$result_trees{'in_menu_only_special_ascii_spaces_node'}{"contents"}[4]{"contents"}[0]{"parent"} = $result_trees{'in_menu_only_special_ascii_spaces_node'}{"contents"}[4];
$result_trees{'in_menu_only_special_ascii_spaces_node'}{"contents"}[4]{"parent"} = $result_trees{'in_menu_only_special_ascii_spaces_node'};
$result_trees{'in_menu_only_special_ascii_spaces_node'}{"contents"}[5]{"args"}[0]{"parent"} = $result_trees{'in_menu_only_special_ascii_spaces_node'}{"contents"}[5];
$result_trees{'in_menu_only_special_ascii_spaces_node'}{"contents"}[5]{"parent"} = $result_trees{'in_menu_only_special_ascii_spaces_node'};
$result_trees{'in_menu_only_special_ascii_spaces_node'}{"contents"}[6]{"args"}[0]{"contents"}[0]{"parent"} = $result_trees{'in_menu_only_special_ascii_spaces_node'}{"contents"}[6]{"args"}[0];
$result_trees{'in_menu_only_special_ascii_spaces_node'}{"contents"}[6]{"args"}[0]{"parent"} = $result_trees{'in_menu_only_special_ascii_spaces_node'}{"contents"}[6];
$result_trees{'in_menu_only_special_ascii_spaces_node'}{"contents"}[6]{"contents"}[0]{"parent"} = $result_trees{'in_menu_only_special_ascii_spaces_node'}{"contents"}[6];
$result_trees{'in_menu_only_special_ascii_spaces_node'}{"contents"}[6]{"parent"} = $result_trees{'in_menu_only_special_ascii_spaces_node'};

$result_texis{'in_menu_only_special_ascii_spaces_node'} = '@node Top
@top top

@menu
* '."\r".'::
* 	::
@end menu

@node '."\r".'
@chapter CARRIAGE RETURN|'."\r".'|

@node 	
@chapter CHARACTER TABULATION|	| FORM FEED|| LINE TABULATION||

';


$result_texts{'in_menu_only_special_ascii_spaces_node'} = 'top
***

* '."\r".'::
* 	::

1 CARRIAGE RETURN|'."\r".'|
********************

2 CHARACTER TABULATION|	| FORM FEED|| LINE TABULATION||
*********************************************************

';

$result_sectioning{'in_menu_only_special_ascii_spaces_node'} = {
  'structure' => {
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
          }
        },
        'structure' => {
          'section_childs' => [
            {
              'cmdname' => 'chapter',
              'extra' => {
                'associated_node' => {
                  'cmdname' => 'node',
                  'extra' => {},
                  'structure' => {}
                }
              },
              'structure' => {
                'section_level' => 1,
                'section_number' => 1,
                'section_up' => {},
                'toplevel_prev' => {},
                'toplevel_up' => {}
              }
            },
            {
              'cmdname' => 'chapter',
              'extra' => {
                'associated_node' => {
                  'cmdname' => 'node',
                  'extra' => {}
                }
              },
              'structure' => {
                'section_level' => 1,
                'section_number' => 2,
                'section_prev' => {},
                'section_up' => {},
                'toplevel_prev' => {},
                'toplevel_up' => {}
              }
            }
          ],
          'section_level' => 0,
          'section_up' => {}
        }
      }
    ],
    'section_level' => -1
  }
};
$result_sectioning{'in_menu_only_special_ascii_spaces_node'}{'structure'}{'section_childs'}[0]{'structure'}{'section_childs'}[0]{'structure'}{'section_up'} = $result_sectioning{'in_menu_only_special_ascii_spaces_node'}{'structure'}{'section_childs'}[0];
$result_sectioning{'in_menu_only_special_ascii_spaces_node'}{'structure'}{'section_childs'}[0]{'structure'}{'section_childs'}[0]{'structure'}{'toplevel_prev'} = $result_sectioning{'in_menu_only_special_ascii_spaces_node'}{'structure'}{'section_childs'}[0];
$result_sectioning{'in_menu_only_special_ascii_spaces_node'}{'structure'}{'section_childs'}[0]{'structure'}{'section_childs'}[0]{'structure'}{'toplevel_up'} = $result_sectioning{'in_menu_only_special_ascii_spaces_node'}{'structure'}{'section_childs'}[0];
$result_sectioning{'in_menu_only_special_ascii_spaces_node'}{'structure'}{'section_childs'}[0]{'structure'}{'section_childs'}[1]{'structure'}{'section_prev'} = $result_sectioning{'in_menu_only_special_ascii_spaces_node'}{'structure'}{'section_childs'}[0]{'structure'}{'section_childs'}[0];
$result_sectioning{'in_menu_only_special_ascii_spaces_node'}{'structure'}{'section_childs'}[0]{'structure'}{'section_childs'}[1]{'structure'}{'section_up'} = $result_sectioning{'in_menu_only_special_ascii_spaces_node'}{'structure'}{'section_childs'}[0];
$result_sectioning{'in_menu_only_special_ascii_spaces_node'}{'structure'}{'section_childs'}[0]{'structure'}{'section_childs'}[1]{'structure'}{'toplevel_prev'} = $result_sectioning{'in_menu_only_special_ascii_spaces_node'}{'structure'}{'section_childs'}[0]{'structure'}{'section_childs'}[0];
$result_sectioning{'in_menu_only_special_ascii_spaces_node'}{'structure'}{'section_childs'}[0]{'structure'}{'section_childs'}[1]{'structure'}{'toplevel_up'} = $result_sectioning{'in_menu_only_special_ascii_spaces_node'}{'structure'}{'section_childs'}[0];
$result_sectioning{'in_menu_only_special_ascii_spaces_node'}{'structure'}{'section_childs'}[0]{'structure'}{'section_up'} = $result_sectioning{'in_menu_only_special_ascii_spaces_node'};

$result_nodes{'in_menu_only_special_ascii_spaces_node'} = {
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
    'node_next' => {
      'cmdname' => 'node',
      'extra' => {
        'associated_section' => {
          'cmdname' => 'chapter',
          'extra' => {},
          'structure' => {
            'section_number' => 1
          }
        }
      },
      'structure' => {
        'node_prev' => {}
      }
    }
  }
};
$result_nodes{'in_menu_only_special_ascii_spaces_node'}{'structure'}{'node_next'}{'structure'}{'node_prev'} = $result_nodes{'in_menu_only_special_ascii_spaces_node'};

$result_menus{'in_menu_only_special_ascii_spaces_node'} = {
  'cmdname' => 'node',
  'extra' => {
    'normalized' => 'Top'
  },
  'structure' => {}
};

$result_errors{'in_menu_only_special_ascii_spaces_node'} = [
  {
    'error_line' => 'empty node name in menu entry
',
    'file_name' => 'in_menu_only_special_ascii_spaces_node.texi',
    'line_nr' => 5,
    'macro' => '',
    'text' => 'empty node name in menu entry',
    'type' => 'error'
  },
  {
    'error_line' => 'empty node name in menu entry
',
    'file_name' => 'in_menu_only_special_ascii_spaces_node.texi',
    'line_nr' => 6,
    'macro' => '',
    'text' => 'empty node name in menu entry',
    'type' => 'error'
  },
  {
    'error_line' => 'empty argument in @node
',
    'file_name' => 'in_menu_only_special_ascii_spaces_node.texi',
    'line_nr' => 9,
    'macro' => '',
    'text' => 'empty argument in @node',
    'type' => 'error'
  },
  {
    'error_line' => 'empty argument in @node
',
    'file_name' => 'in_menu_only_special_ascii_spaces_node.texi',
    'line_nr' => 12,
    'macro' => '',
    'text' => 'empty argument in @node',
    'type' => 'error'
  }
];


$result_floats{'in_menu_only_special_ascii_spaces_node'} = {};



$result_converted{'info'}->{'in_menu_only_special_ascii_spaces_node'} = 'This is , produced from in_menu_only_special_ascii_spaces_node.texi.


File: ,  Node: Top,  Next: ,  Up: (dir)

top
***

* Menu:

* '."\r".'::
* 	::

1 CARRIAGE RETURN|'."\r".'|
********************

2 CHARACTER TABULATION|	| FORM FEED|| LINE TABULATION||
*********************************************************



Tag Table:
Node: Top70

End Tag Table


Local Variables:
coding: utf-8
End:
';


$result_converted{'html'}->{'in_menu_only_special_ascii_spaces_node'} = '<!DOCTYPE html>
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


</head>

<body lang="en">
<div class="top-level-extent" id="Top">
<div class="nav-panel">
<p>
Next: CARRIAGE RETURN|'."\r".'| &nbsp; </p>
</div>
<h1 class="top" id="top">top</h1>


<ul class="mini-toc">
<li>CARRIAGE RETURN|'."\r".'|</li>
<li>CHARACTER TABULATION|	| FORM FEED|&#12;| LINE TABULATION||</li>
</ul>
<hr>
<div class="chapter-level-extent">
<div class="nav-panel">
<p>
Previous: <a href="#Top" accesskey="p" rel="prev">top</a> &nbsp; </p>
</div>
<h2 class="chapter" id="CARRIAGE-RETURN_007c-_007c">1 CARRIAGE RETURN|'."\r".'|</h2>

<hr>
</div>
<div class="chapter-level-extent">
<div class="nav-panel">
<p>
 &nbsp; </p>
</div>
<h2 class="chapter" id="CHARACTER-TABULATION_007c-_007c-FORM-FEED_007c-_007c-LINE-TABULATION_007c-_007c">2 CHARACTER TABULATION|	| FORM FEED|&#12;| LINE TABULATION||</h2>

</div>
</div>



</body>
</html>
';

1;
