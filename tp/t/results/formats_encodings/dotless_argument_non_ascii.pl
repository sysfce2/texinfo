use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'dotless_argument_non_ascii'} = {
  'contents' => [
    {
      'contents' => [
        {
          'type' => 'preamble_before_content'
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
      'cmdname' => 'node',
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
      'cmdname' => 'chapter',
      'contents' => [
        {
          'contents' => [
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'text' => "\x{ea}"
                    }
                  ],
                  'type' => 'brace_command_arg'
                }
              ],
              'cmdname' => 'dotless',
              'source_info' => {
                'file_name' => '',
                'line_nr' => 6,
                'macro' => ''
              }
            },
            {
              'text' => '
'
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'text' => "\x{ea}"
                    }
                  ],
                  'type' => 'following_arg'
                }
              ],
              'cmdname' => 'dotless',
              'info' => {
                'spaces_after_cmd_before_arg' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'file_name' => '',
                'line_nr' => 7,
                'macro' => ''
              }
            },
            {
              'text' => '
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
        'line_nr' => 5,
        'macro' => ''
      }
    }
  ],
  'type' => 'document_root'
};

$result_texis{'dotless_argument_non_ascii'} = '@node Top
@top top

@node chap
@chapter Chapter
@dotless{ê}
@dotless ê
';


$result_texts{'dotless_argument_non_ascii'} = 'top
***

1 Chapter
*********
ê
ê
';

$result_sectioning{'dotless_argument_non_ascii'} = {
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
                'section_number' => 1,
                'toplevel_directions' => {
                  'prev' => {},
                  'up' => {}
                }
              }
            }
          ],
          'section_directions' => {
            'up' => {}
          },
          'section_level' => 0,
          'toplevel_directions' => {}
        }
      }
    ],
    'section_level' => -1
  }
};
$result_sectioning{'dotless_argument_non_ascii'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[0]{'extra'}{'section_directions'}{'up'} = $result_sectioning{'dotless_argument_non_ascii'}{'extra'}{'section_childs'}[0];
$result_sectioning{'dotless_argument_non_ascii'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[0]{'extra'}{'toplevel_directions'}{'prev'} = $result_sectioning{'dotless_argument_non_ascii'}{'extra'}{'section_childs'}[0];
$result_sectioning{'dotless_argument_non_ascii'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[0]{'extra'}{'toplevel_directions'}{'up'} = $result_sectioning{'dotless_argument_non_ascii'}{'extra'}{'section_childs'}[0];
$result_sectioning{'dotless_argument_non_ascii'}{'extra'}{'section_childs'}[0]{'extra'}{'section_directions'}{'up'} = $result_sectioning{'dotless_argument_non_ascii'};

$result_nodes{'dotless_argument_non_ascii'} = {
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
              'section_number' => 1
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
};
$result_nodes{'dotless_argument_non_ascii'}{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'prev'} = $result_nodes{'dotless_argument_non_ascii'};
$result_nodes{'dotless_argument_non_ascii'}{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'up'} = $result_nodes{'dotless_argument_non_ascii'};

$result_menus{'dotless_argument_non_ascii'} = {
  'cmdname' => 'node',
  'extra' => {
    'normalized' => 'Top'
  }
};

$result_errors{'dotless_argument_non_ascii'} = [
  {
    'error_line' => "\@dotless expects `i' or `j' as argument, not `\x{ea}'
",
    'file_name' => '',
    'line_nr' => 6,
    'macro' => '',
    'text' => "\@dotless expects `i' or `j' as argument, not `\x{ea}'",
    'type' => 'error'
  },
  {
    'error_line' => "\@dotless expects `i' or `j' as argument, not `\x{ea}'
",
    'file_name' => '',
    'line_nr' => 7,
    'macro' => '',
    'text' => "\@dotless expects `i' or `j' as argument, not `\x{ea}'",
    'type' => 'error'
  }
];


$result_floats{'dotless_argument_non_ascii'} = {};



$result_converted{'plaintext'}->{'dotless_argument_non_ascii'} = 'top
***

1 Chapter
*********

ê ê
';


$result_converted{'html_text'}->{'dotless_argument_non_ascii'} = '<div class="top-level-extent" id="Top">
<div class="nav-panel">
</div>
<h1 class="top" id="top"><span>top<a class="copiable-link" href="#top"> &para;</a></span></h1>

<ul class="mini-toc">
<li><a href="#chap" accesskey="1">Chapter</a></li>
</ul>
<hr>
<div class="chapter-level-extent" id="chap">
<div class="nav-panel">
</div>
<h2 class="chapter" id="Chapter"><span>1 Chapter<a class="copiable-link" href="#Chapter"> &para;</a></span></h2>
<p>ê
ê
</p></div>
</div>
';


$result_converted{'xml'}->{'dotless_argument_non_ascii'} = '<node name="Top" spaces=" "><nodename>Top</nodename><nodenext automatic="on">chap</nodenext></node>
<top spaces=" "><sectiontitle>top</sectiontitle>

</top>
<node name="chap" spaces=" "><nodename>chap</nodename><nodeprev automatic="on">Top</nodeprev><nodeup automatic="on">Top</nodeup></node>
<chapter spaces=" "><sectiontitle>Chapter</sectiontitle>
<para><dotless>ê</dotless>
<dotless spacesaftercmd=" ">ê</dotless>
</para></chapter>
';


$result_converted{'docbook'}->{'dotless_argument_non_ascii'} = '<chapter label="1" id="chap">
<title>Chapter</title>
<para>ê
ê
</para></chapter>
';


$result_converted{'latex_text'}->{'dotless_argument_non_ascii'} = '\\begin{document}
\\label{anchor:Top}%
\\chapter{{Chapter}}
\\label{anchor:chap}%
ê
ê
';

1;
