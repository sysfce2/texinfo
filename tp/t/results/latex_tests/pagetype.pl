use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'pagetype'} = {
  'contents' => [
    {
      'contents' => [
        {
          'contents' => [
            {
              'args' => [
                {
                  'parent' => {},
                  'text' => '
',
                  'type' => 'misc_arg'
                }
              ],
              'cmdname' => 'afourpaper',
              'parent' => {},
              'source_info' => {
                'file_name' => '',
                'line_nr' => 1,
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
              'args' => [
                {
                  'parent' => {},
                  'text' => '
',
                  'type' => 'misc_arg'
                }
              ],
              'cmdname' => 'afourwide',
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
              'text' => 'section top'
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
        }
      ],
      'extra' => {
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
              'text' => 'chapter'
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
            'normalized' => 'chapter'
          }
        ],
        'normalized' => 'chapter',
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
              'text' => 'Chapter'
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
          'cmdname' => 'smallbook',
          'parent' => {},
          'source_info' => {
            'file_name' => '',
            'line_nr' => 11,
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
          'contents' => [
            {
              'parent' => {},
              'text' => ' In smallbook
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
          'contents' => [
            {
              'parent' => {},
              'text' => 'In smallbook
'
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
              'cmdname' => 'afourpaper',
              'parent' => {},
              'source_info' => {
                'file_name' => '',
                'line_nr' => 16,
                'macro' => ''
              }
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
          'contents' => [
            {
              'parent' => {},
              'text' => 'After afourpaper
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
        'line_nr' => 9,
        'macro' => ''
      }
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'afourpaper reset'
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
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'In afourpaper reset
'
            }
          ],
          'parent' => {},
          'type' => 'paragraph'
        }
      ],
      'extra' => {
        'spaces_before_argument' => ' '
      },
      'parent' => {},
      'source_info' => {
        'file_name' => '',
        'line_nr' => 20,
        'macro' => ''
      }
    }
  ],
  'type' => 'document_root'
};
$result_trees{'pagetype'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'pagetype'}{'contents'}[0]{'contents'}[0]{'contents'}[0];
$result_trees{'pagetype'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'pagetype'}{'contents'}[0]{'contents'}[0];
$result_trees{'pagetype'}{'contents'}[0]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'pagetype'}{'contents'}[0]{'contents'}[0];
$result_trees{'pagetype'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'pagetype'}{'contents'}[0]{'contents'}[0]{'contents'}[2];
$result_trees{'pagetype'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'pagetype'}{'contents'}[0]{'contents'}[0];
$result_trees{'pagetype'}{'contents'}[0]{'contents'}[0]{'contents'}[3]{'parent'} = $result_trees{'pagetype'}{'contents'}[0]{'contents'}[0];
$result_trees{'pagetype'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'pagetype'}{'contents'}[0];
$result_trees{'pagetype'}{'contents'}[0]{'parent'} = $result_trees{'pagetype'};
$result_trees{'pagetype'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'pagetype'}{'contents'}[1]{'args'}[0];
$result_trees{'pagetype'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'pagetype'}{'contents'}[1];
$result_trees{'pagetype'}{'contents'}[1]{'extra'}{'node_content'}[0] = $result_trees{'pagetype'}{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'pagetype'}{'contents'}[1]{'extra'}{'nodes_manuals'}[0]{'node_content'}[0] = $result_trees{'pagetype'}{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'pagetype'}{'contents'}[1]{'parent'} = $result_trees{'pagetype'};
$result_trees{'pagetype'}{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'pagetype'}{'contents'}[2]{'args'}[0];
$result_trees{'pagetype'}{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'pagetype'}{'contents'}[2];
$result_trees{'pagetype'}{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'pagetype'}{'contents'}[2];
$result_trees{'pagetype'}{'contents'}[2]{'parent'} = $result_trees{'pagetype'};
$result_trees{'pagetype'}{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'pagetype'}{'contents'}[3]{'args'}[0];
$result_trees{'pagetype'}{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'pagetype'}{'contents'}[3];
$result_trees{'pagetype'}{'contents'}[3]{'extra'}{'node_content'}[0] = $result_trees{'pagetype'}{'contents'}[3]{'args'}[0]{'contents'}[0];
$result_trees{'pagetype'}{'contents'}[3]{'extra'}{'nodes_manuals'}[0]{'node_content'}[0] = $result_trees{'pagetype'}{'contents'}[3]{'args'}[0]{'contents'}[0];
$result_trees{'pagetype'}{'contents'}[3]{'parent'} = $result_trees{'pagetype'};
$result_trees{'pagetype'}{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'pagetype'}{'contents'}[4]{'args'}[0];
$result_trees{'pagetype'}{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'pagetype'}{'contents'}[4];
$result_trees{'pagetype'}{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'pagetype'}{'contents'}[4];
$result_trees{'pagetype'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'pagetype'}{'contents'}[4]{'contents'}[1];
$result_trees{'pagetype'}{'contents'}[4]{'contents'}[1]{'parent'} = $result_trees{'pagetype'}{'contents'}[4];
$result_trees{'pagetype'}{'contents'}[4]{'contents'}[2]{'parent'} = $result_trees{'pagetype'}{'contents'}[4];
$result_trees{'pagetype'}{'contents'}[4]{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'pagetype'}{'contents'}[4]{'contents'}[3];
$result_trees{'pagetype'}{'contents'}[4]{'contents'}[3]{'parent'} = $result_trees{'pagetype'}{'contents'}[4];
$result_trees{'pagetype'}{'contents'}[4]{'contents'}[4]{'parent'} = $result_trees{'pagetype'}{'contents'}[4];
$result_trees{'pagetype'}{'contents'}[4]{'contents'}[5]{'contents'}[0]{'parent'} = $result_trees{'pagetype'}{'contents'}[4]{'contents'}[5];
$result_trees{'pagetype'}{'contents'}[4]{'contents'}[5]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'pagetype'}{'contents'}[4]{'contents'}[5]{'contents'}[1];
$result_trees{'pagetype'}{'contents'}[4]{'contents'}[5]{'contents'}[1]{'parent'} = $result_trees{'pagetype'}{'contents'}[4]{'contents'}[5];
$result_trees{'pagetype'}{'contents'}[4]{'contents'}[5]{'parent'} = $result_trees{'pagetype'}{'contents'}[4];
$result_trees{'pagetype'}{'contents'}[4]{'contents'}[6]{'parent'} = $result_trees{'pagetype'}{'contents'}[4];
$result_trees{'pagetype'}{'contents'}[4]{'contents'}[7]{'contents'}[0]{'parent'} = $result_trees{'pagetype'}{'contents'}[4]{'contents'}[7];
$result_trees{'pagetype'}{'contents'}[4]{'contents'}[7]{'parent'} = $result_trees{'pagetype'}{'contents'}[4];
$result_trees{'pagetype'}{'contents'}[4]{'contents'}[8]{'parent'} = $result_trees{'pagetype'}{'contents'}[4];
$result_trees{'pagetype'}{'contents'}[4]{'parent'} = $result_trees{'pagetype'};
$result_trees{'pagetype'}{'contents'}[5]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'pagetype'}{'contents'}[5]{'args'}[0];
$result_trees{'pagetype'}{'contents'}[5]{'args'}[0]{'parent'} = $result_trees{'pagetype'}{'contents'}[5];
$result_trees{'pagetype'}{'contents'}[5]{'contents'}[0]{'parent'} = $result_trees{'pagetype'}{'contents'}[5];
$result_trees{'pagetype'}{'contents'}[5]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'pagetype'}{'contents'}[5]{'contents'}[1];
$result_trees{'pagetype'}{'contents'}[5]{'contents'}[1]{'parent'} = $result_trees{'pagetype'}{'contents'}[5];
$result_trees{'pagetype'}{'contents'}[5]{'parent'} = $result_trees{'pagetype'};

$result_texis{'pagetype'} = '@afourpaper

@afourwide

@node Top
@top section top

@node chapter
@chapter Chapter

@smallbook

 In smallbook

In smallbook
@afourpaper

After afourpaper

@chapter afourpaper reset

In afourpaper reset
';


$result_texts{'pagetype'} = '

section top
***********

1 Chapter
*********


 In smallbook

In smallbook

After afourpaper

2 afourpaper reset
******************

In afourpaper reset
';

$result_sectioning{'pagetype'} = {
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
                  'extra' => {
                    'normalized' => 'chapter'
                  },
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
              'extra' => {},
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
$result_sectioning{'pagetype'}{'structure'}{'section_childs'}[0]{'structure'}{'section_childs'}[0]{'structure'}{'section_up'} = $result_sectioning{'pagetype'}{'structure'}{'section_childs'}[0];
$result_sectioning{'pagetype'}{'structure'}{'section_childs'}[0]{'structure'}{'section_childs'}[0]{'structure'}{'toplevel_prev'} = $result_sectioning{'pagetype'}{'structure'}{'section_childs'}[0];
$result_sectioning{'pagetype'}{'structure'}{'section_childs'}[0]{'structure'}{'section_childs'}[0]{'structure'}{'toplevel_up'} = $result_sectioning{'pagetype'}{'structure'}{'section_childs'}[0];
$result_sectioning{'pagetype'}{'structure'}{'section_childs'}[0]{'structure'}{'section_childs'}[1]{'structure'}{'section_prev'} = $result_sectioning{'pagetype'}{'structure'}{'section_childs'}[0]{'structure'}{'section_childs'}[0];
$result_sectioning{'pagetype'}{'structure'}{'section_childs'}[0]{'structure'}{'section_childs'}[1]{'structure'}{'section_up'} = $result_sectioning{'pagetype'}{'structure'}{'section_childs'}[0];
$result_sectioning{'pagetype'}{'structure'}{'section_childs'}[0]{'structure'}{'section_childs'}[1]{'structure'}{'toplevel_prev'} = $result_sectioning{'pagetype'}{'structure'}{'section_childs'}[0]{'structure'}{'section_childs'}[0];
$result_sectioning{'pagetype'}{'structure'}{'section_childs'}[0]{'structure'}{'section_childs'}[1]{'structure'}{'toplevel_up'} = $result_sectioning{'pagetype'}{'structure'}{'section_childs'}[0];
$result_sectioning{'pagetype'}{'structure'}{'section_childs'}[0]{'structure'}{'section_up'} = $result_sectioning{'pagetype'};

$result_nodes{'pagetype'} = {
  'cmdname' => 'node',
  'extra' => {
    'associated_section' => {
      'cmdname' => 'top',
      'extra' => {},
      'structure' => {}
    },
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
        },
        'normalized' => 'chapter'
      },
      'structure' => {
        'node_prev' => {},
        'node_up' => {}
      }
    }
  }
};
$result_nodes{'pagetype'}{'structure'}{'node_next'}{'structure'}{'node_prev'} = $result_nodes{'pagetype'};
$result_nodes{'pagetype'}{'structure'}{'node_next'}{'structure'}{'node_up'} = $result_nodes{'pagetype'};

$result_menus{'pagetype'} = {
  'cmdname' => 'node',
  'extra' => {
    'normalized' => 'Top'
  },
  'structure' => {}
};

$result_errors{'pagetype'} = [
  {
    'error_line' => 'unknown command `Chapter\'
',
    'file_name' => '',
    'line_nr' => 13,
    'macro' => '',
    'text' => 'unknown command `Chapter\'',
    'type' => 'error'
  },
  {
    'error_line' => 'warning: multiple @afourpaper
',
    'file_name' => '',
    'line_nr' => 16,
    'macro' => '',
    'text' => 'multiple @afourpaper',
    'type' => 'warning'
  }
];


$result_floats{'pagetype'} = {};



$result_converted{'latex_text'}->{'pagetype'} = '\\geometry{papername=a4paper}%

\\geometry{papername=a4paper}%

\\begin{document}
\\label{anchor:Top}%
\\chapter{{Chapter}}
\\label{anchor:chapter}%

\\geometry{paperheight=9.25in,paperwidth=7in}%

 In smallbook

In smallbook
\\geometry{papername=a4paper}%

After afourpaper

\\chapter{{afourpaper reset}}

In afourpaper reset
';

1;
