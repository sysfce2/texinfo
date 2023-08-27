use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'top_node_up_explicit_no_nodes'} = {
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
            'manual_content' => [
              {}
            ]
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
              'text' => '('
            },
            {
              'text' => 'weird'
            },
            {
              'text' => ')'
            }
          ],
          'extra' => {
            'manual_content' => [
              {}
            ]
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
            'manual_content' => [
              {}
            ]
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
              'text' => 'The top'
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
              'text' => 'Just a top node.
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
                      'text' => 'Chap'
                    }
                  ],
                  'extra' => {
                    'node_content' => [
                      {}
                    ],
                    'normalized' => 'Chap'
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
                'line_nr' => 7,
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
                'line_nr' => 8,
                'macro' => ''
              }
            }
          ],
          'source_info' => {
            'file_name' => '',
            'line_nr' => 6,
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
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'text' => 'Chap'
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
        'normalized' => 'Chap'
      },
      'info' => {
        'spaces_before_argument' => {
          'text' => ' '
        }
      },
      'source_info' => {
        'file_name' => '',
        'line_nr' => 10,
        'macro' => ''
      }
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'text' => 'A chapter'
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
              'text' => 'Without the chapter, no up node from top is generated.
'
            }
          ],
          'type' => 'paragraph'
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
        'line_nr' => 11,
        'macro' => ''
      }
    }
  ],
  'type' => 'document_root'
};
$result_trees{'top_node_up_explicit_no_nodes'}{'contents'}[1]{'args'}[1]{'extra'}{'manual_content'}[0] = $result_trees{'top_node_up_explicit_no_nodes'}{'contents'}[1]{'args'}[1]{'contents'}[1];
$result_trees{'top_node_up_explicit_no_nodes'}{'contents'}[1]{'args'}[2]{'extra'}{'manual_content'}[0] = $result_trees{'top_node_up_explicit_no_nodes'}{'contents'}[1]{'args'}[2]{'contents'}[1];
$result_trees{'top_node_up_explicit_no_nodes'}{'contents'}[1]{'args'}[3]{'extra'}{'manual_content'}[0] = $result_trees{'top_node_up_explicit_no_nodes'}{'contents'}[1]{'args'}[3]{'contents'}[1];
$result_trees{'top_node_up_explicit_no_nodes'}{'contents'}[2]{'contents'}[3]{'contents'}[0]{'contents'}[1]{'extra'}{'node_content'}[0] = $result_trees{'top_node_up_explicit_no_nodes'}{'contents'}[2]{'contents'}[3]{'contents'}[0]{'contents'}[1]{'contents'}[0];

$result_texis{'top_node_up_explicit_no_nodes'} = '@node Top, (dir), (weird), (dir)
@top The top

Just a top node.

@menu
* Chap::
@end menu

@node Chap
@chapter A chapter

Without the chapter, no up node from top is generated.
';


$result_texts{'top_node_up_explicit_no_nodes'} = 'The top
*******

Just a top node.

* Chap::

1 A chapter
***********

Without the chapter, no up node from top is generated.
';

$result_sectioning{'top_node_up_explicit_no_nodes'} = {
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
                    'normalized' => 'Chap'
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
$result_sectioning{'top_node_up_explicit_no_nodes'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[0]{'extra'}{'section_directions'}{'up'} = $result_sectioning{'top_node_up_explicit_no_nodes'}{'extra'}{'section_childs'}[0];
$result_sectioning{'top_node_up_explicit_no_nodes'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[0]{'extra'}{'toplevel_directions'}{'prev'} = $result_sectioning{'top_node_up_explicit_no_nodes'}{'extra'}{'section_childs'}[0];
$result_sectioning{'top_node_up_explicit_no_nodes'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[0]{'extra'}{'toplevel_directions'}{'up'} = $result_sectioning{'top_node_up_explicit_no_nodes'}{'extra'}{'section_childs'}[0];
$result_sectioning{'top_node_up_explicit_no_nodes'}{'extra'}{'section_childs'}[0]{'extra'}{'sectioning_root'} = $result_sectioning{'top_node_up_explicit_no_nodes'};

$result_nodes{'top_node_up_explicit_no_nodes'} = [
  {
    'cmdname' => 'node',
    'extra' => {
      'associated_section' => {
        'cmdname' => 'top',
        'extra' => {}
      },
      'node_directions' => {
        'next' => {
          'extra' => {
            'manual_content' => [
              {
                'text' => 'dir'
              }
            ]
          },
          'type' => 'line_arg'
        },
        'prev' => {
          'extra' => {
            'manual_content' => [
              {
                'text' => 'weird'
              }
            ]
          },
          'type' => 'line_arg'
        },
        'up' => {
          'extra' => {
            'manual_content' => [
              {
                'text' => 'dir'
              }
            ]
          },
          'type' => 'line_arg'
        }
      },
      'normalized' => 'Top'
    }
  },
  {
    'cmdname' => 'node',
    'extra' => {
      'associated_section' => {
        'cmdname' => 'chapter',
        'extra' => {
          'section_number' => 1
        }
      },
      'node_directions' => {
        'up' => {}
      },
      'normalized' => 'Chap'
    }
  }
];
$result_nodes{'top_node_up_explicit_no_nodes'}[1]{'extra'}{'node_directions'}{'up'} = $result_nodes{'top_node_up_explicit_no_nodes'}[0];

$result_menus{'top_node_up_explicit_no_nodes'} = [
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
      'normalized' => 'Chap'
    }
  }
];
$result_menus{'top_node_up_explicit_no_nodes'}[1]{'extra'}{'menu_directions'}{'up'} = $result_menus{'top_node_up_explicit_no_nodes'}[0];

$result_errors{'top_node_up_explicit_no_nodes'} = [];


$result_floats{'top_node_up_explicit_no_nodes'} = {};



$result_converted{'html'}->{'top_node_up_explicit_no_nodes'} = '<!DOCTYPE html>
<html>
<!-- Created by texinfo, http://www.gnu.org/software/texinfo/ -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>The top</title>

<meta name="description" content="The top">
<meta name="keywords" content="The top">
<meta name="resource-type" content="document">
<meta name="distribution" content="global">
<meta name="viewport" content="width=device-width,initial-scale=1">

<link href="#Top" rel="start" title="The top">
<link href="http://etop.example.org" rel="up" title="(dir)">
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
 Up : <a href="http://etop.example.org" accesskey="u" rel="up">(dir)</a> &nbsp; </p>
</div>
<h1 class="top" id="The-top"><span>The top<a class="copiable-link" href="#The-top"> &para;</a></span></h1>

<p>Just a top node.
</p>

<ul class="mini-toc">
<li><a href="#Chap" accesskey="1">A chapter</a></li>
</ul>
<hr>
<div class="chapter-level-extent" id="Chap">
<div class="nav-panel">
<p>
 Up : <a href="#Top" accesskey="u" rel="up">The top</a> &nbsp; </p>
</div>
<h2 class="chapter" id="A-chapter"><span>1 A chapter<a class="copiable-link" href="#A-chapter"> &para;</a></span></h2>

<p>Without the chapter, no up node from top is generated.
</p></div>
</div>



</body>
</html>
';

1;
