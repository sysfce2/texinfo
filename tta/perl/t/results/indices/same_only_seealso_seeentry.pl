use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'same_only_seealso_seeentry'} = {
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
                  'text' => 'node'
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
        'isindex' => 1,
        'normalized' => 'node'
      },
      'info' => {
        'spaces_before_argument' => {
          'text' => ' '
        }
      },
      'source_info' => {
        'line_nr' => 4
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
        },
        {
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'cmdname' => 'cindex',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'aaa'
                },
                {
                  'text' => ' ',
                  'type' => 'spaces_at_end'
                },
                {
                  'cmdname' => 'seealso',
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'sss'
                        }
                      ],
                      'type' => 'brace_arg'
                    }
                  ],
                  'source_info' => {
                    'line_nr' => 7
                  }
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
            'element_node' => {},
            'index_entry' => [
              'cp',
              1
            ],
            'seealso' => {}
          },
          'info' => {
            'command_name' => 'cindex',
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'line_nr' => 7
          },
          'type' => 'index_entry_command'
        },
        {
          'cmdname' => 'cindex',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'aaa'
                },
                {
                  'text' => ' ',
                  'type' => 'spaces_at_end'
                },
                {
                  'cmdname' => 'seealso',
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => '123'
                        }
                      ],
                      'type' => 'brace_arg'
                    }
                  ],
                  'source_info' => {
                    'line_nr' => 8
                  }
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
            'element_node' => {},
            'index_entry' => [
              'cp',
              2
            ],
            'seealso' => {}
          },
          'info' => {
            'command_name' => 'cindex',
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'line_nr' => 8
          },
          'type' => 'index_entry_command'
        },
        {
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'cmdname' => 'cindex',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'bbb'
                },
                {
                  'text' => ' ',
                  'type' => 'spaces_at_end'
                },
                {
                  'cmdname' => 'seeentry',
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'yyy'
                        }
                      ],
                      'type' => 'brace_arg'
                    }
                  ],
                  'source_info' => {
                    'line_nr' => 10
                  }
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
            'element_node' => {},
            'index_entry' => [
              'cp',
              3
            ],
            'seeentry' => {}
          },
          'info' => {
            'command_name' => 'cindex',
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'line_nr' => 10
          },
          'type' => 'index_entry_command'
        },
        {
          'cmdname' => 'cindex',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'bbb'
                },
                {
                  'text' => ' ',
                  'type' => 'spaces_at_end'
                },
                {
                  'cmdname' => 'seeentry',
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'ttt'
                        }
                      ],
                      'type' => 'brace_arg'
                    }
                  ],
                  'source_info' => {
                    'line_nr' => 11
                  }
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
            'element_node' => {},
            'index_entry' => [
              'cp',
              4
            ],
            'seeentry' => {}
          },
          'info' => {
            'command_name' => 'cindex',
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'line_nr' => 11
          },
          'type' => 'index_entry_command'
        },
        {
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'cmdname' => 'cindex',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'ccc'
                },
                {
                  'text' => ' ',
                  'type' => 'spaces_at_end'
                },
                {
                  'cmdname' => 'seealso',
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'also'
                        }
                      ],
                      'type' => 'brace_arg'
                    }
                  ],
                  'source_info' => {
                    'line_nr' => 13
                  }
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
            'element_node' => {},
            'index_entry' => [
              'cp',
              5
            ],
            'seealso' => {}
          },
          'info' => {
            'command_name' => 'cindex',
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'line_nr' => 13
          },
          'type' => 'index_entry_command'
        },
        {
          'cmdname' => 'cindex',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'ccc'
                },
                {
                  'text' => ' ',
                  'type' => 'spaces_at_end'
                },
                {
                  'cmdname' => 'seeentry',
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'entry'
                        }
                      ],
                      'type' => 'brace_arg'
                    }
                  ],
                  'source_info' => {
                    'line_nr' => 14
                  }
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
            'element_node' => {},
            'index_entry' => [
              'cp',
              6
            ],
            'seeentry' => {}
          },
          'info' => {
            'command_name' => 'cindex',
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'line_nr' => 14
          },
          'type' => 'index_entry_command'
        },
        {
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'cmdname' => 'printindex',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'cp'
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
            'misc_args' => [
              'cp'
            ]
          },
          'info' => {
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'line_nr' => 16
          }
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
        'line_nr' => 5
      }
    }
  ],
  'type' => 'document_root'
};
$result_trees{'same_only_seealso_seeentry'}{'contents'}[4]{'contents'}[2]{'extra'}{'element_node'} = $result_trees{'same_only_seealso_seeentry'}{'contents'}[3];
$result_trees{'same_only_seealso_seeentry'}{'contents'}[4]{'contents'}[2]{'extra'}{'seealso'} = $result_trees{'same_only_seealso_seeentry'}{'contents'}[4]{'contents'}[2]{'contents'}[0]{'contents'}[2];
$result_trees{'same_only_seealso_seeentry'}{'contents'}[4]{'contents'}[3]{'extra'}{'element_node'} = $result_trees{'same_only_seealso_seeentry'}{'contents'}[3];
$result_trees{'same_only_seealso_seeentry'}{'contents'}[4]{'contents'}[3]{'extra'}{'seealso'} = $result_trees{'same_only_seealso_seeentry'}{'contents'}[4]{'contents'}[3]{'contents'}[0]{'contents'}[2];
$result_trees{'same_only_seealso_seeentry'}{'contents'}[4]{'contents'}[5]{'extra'}{'element_node'} = $result_trees{'same_only_seealso_seeentry'}{'contents'}[3];
$result_trees{'same_only_seealso_seeentry'}{'contents'}[4]{'contents'}[5]{'extra'}{'seeentry'} = $result_trees{'same_only_seealso_seeentry'}{'contents'}[4]{'contents'}[5]{'contents'}[0]{'contents'}[2];
$result_trees{'same_only_seealso_seeentry'}{'contents'}[4]{'contents'}[6]{'extra'}{'element_node'} = $result_trees{'same_only_seealso_seeentry'}{'contents'}[3];
$result_trees{'same_only_seealso_seeentry'}{'contents'}[4]{'contents'}[6]{'extra'}{'seeentry'} = $result_trees{'same_only_seealso_seeentry'}{'contents'}[4]{'contents'}[6]{'contents'}[0]{'contents'}[2];
$result_trees{'same_only_seealso_seeentry'}{'contents'}[4]{'contents'}[8]{'extra'}{'element_node'} = $result_trees{'same_only_seealso_seeentry'}{'contents'}[3];
$result_trees{'same_only_seealso_seeentry'}{'contents'}[4]{'contents'}[8]{'extra'}{'seealso'} = $result_trees{'same_only_seealso_seeentry'}{'contents'}[4]{'contents'}[8]{'contents'}[0]{'contents'}[2];
$result_trees{'same_only_seealso_seeentry'}{'contents'}[4]{'contents'}[9]{'extra'}{'element_node'} = $result_trees{'same_only_seealso_seeentry'}{'contents'}[3];
$result_trees{'same_only_seealso_seeentry'}{'contents'}[4]{'contents'}[9]{'extra'}{'seeentry'} = $result_trees{'same_only_seealso_seeentry'}{'contents'}[4]{'contents'}[9]{'contents'}[0]{'contents'}[2];

$result_texis{'same_only_seealso_seeentry'} = '@node Top
@top top

@node node
@chapter chap

@cindex aaa @seealso{sss}
@cindex aaa @seealso{123}

@cindex bbb @seeentry{yyy}
@cindex bbb @seeentry{ttt}

@cindex ccc @seealso{also}
@cindex ccc @seeentry{entry}

@printindex cp
';


$result_texts{'same_only_seealso_seeentry'} = 'top
***

1 chap
******




';

$result_sectioning{'same_only_seealso_seeentry'} = {
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
                    'isindex' => 1,
                    'normalized' => 'node'
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
$result_sectioning{'same_only_seealso_seeentry'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[0]{'extra'}{'section_directions'}{'up'} = $result_sectioning{'same_only_seealso_seeentry'}{'extra'}{'section_childs'}[0];
$result_sectioning{'same_only_seealso_seeentry'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[0]{'extra'}{'toplevel_directions'}{'prev'} = $result_sectioning{'same_only_seealso_seeentry'}{'extra'}{'section_childs'}[0];
$result_sectioning{'same_only_seealso_seeentry'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[0]{'extra'}{'toplevel_directions'}{'up'} = $result_sectioning{'same_only_seealso_seeentry'}{'extra'}{'section_childs'}[0];
$result_sectioning{'same_only_seealso_seeentry'}{'extra'}{'section_childs'}[0]{'extra'}{'sectioning_root'} = $result_sectioning{'same_only_seealso_seeentry'};

$result_nodes{'same_only_seealso_seeentry'} = [
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
            'isindex' => 1,
            'node_directions' => {
              'prev' => {},
              'up' => {}
            },
            'normalized' => 'node'
          }
        }
      },
      'normalized' => 'Top'
    }
  },
  {}
];
$result_nodes{'same_only_seealso_seeentry'}[0]{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'prev'} = $result_nodes{'same_only_seealso_seeentry'}[0];
$result_nodes{'same_only_seealso_seeentry'}[0]{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'up'} = $result_nodes{'same_only_seealso_seeentry'}[0];
$result_nodes{'same_only_seealso_seeentry'}[1] = $result_nodes{'same_only_seealso_seeentry'}[0]{'extra'}{'node_directions'}{'next'};

$result_menus{'same_only_seealso_seeentry'} = [
  {
    'extra' => {
      'normalized' => 'Top'
    }
  },
  {
    'extra' => {
      'normalized' => 'node'
    }
  }
];

$result_errors{'same_only_seealso_seeentry'} = [];


$result_floats{'same_only_seealso_seeentry'} = {};


$result_indices_sort_strings{'same_only_seealso_seeentry'} = {
  'cp' => [
    'aaa',
    'aaa',
    'bbb',
    'bbb',
    'ccc',
    'ccc'
  ]
};



$result_converted{'info'}->{'same_only_seealso_seeentry'} = 'This is , produced from .


File: ,  Node: Top,  Next: node,  Up: (dir)

top
***

* Menu:

* node::


File: ,  Node: node,  Prev: Top,  Up: Top

1 chap
******

 [index ]
* Menu:

  aaa:                                   See also sss.
  aaa:                                   See also 123.
  bbb, See yyy.
  bbb, See ttt.
  ccc:                                   See also also.
  ccc, See entry.


Tag Table:
Node: Top27
Node: node102

End Tag Table


Local Variables:
coding: utf-8
End:
';


$result_converted{'plaintext'}->{'same_only_seealso_seeentry'} = 'top
***

1 chap
******

* Menu:

  aaa:                                   See also sss.
  aaa:                                   See also 123.
  bbb, See yyy.
  bbb, See ttt.
  ccc:                                   See also also.
  ccc, See entry.

';


$result_converted{'html_text'}->{'same_only_seealso_seeentry'} = '<div class="top-level-extent" id="Top">
<div class="nav-panel">
<p>
[<a href="#node" title="Index" rel="index">Index</a>]</p>
</div>
<h1 class="top" id="top"><span>top<a class="copiable-link" href="#top"> &para;</a></span></h1>

<ul class="mini-toc">
<li><a href="#node" accesskey="1">chap</a></li>
</ul>
<hr>
<div class="chapter-level-extent" id="node">
<div class="nav-panel">
<p>
[<a href="#node" title="Index" rel="index">Index</a>]</p>
</div>
<h2 class="chapter" id="chap"><span>1 chap<a class="copiable-link" href="#chap"> &para;</a></span></h2>




<div class="printindex cp-printindex">
<table class="index-letters-header-printindex cp-letters-header-printindex"><tr><th>Jump to: &nbsp; </th><td><a class="summary-letter-printindex" href="#node_cp_letter-A"><b>A</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#node_cp_letter-B"><b>B</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#node_cp_letter-C"><b>C</b></a>
 &nbsp; 
</td></tr></table>
<table class="index-entries-printindex cp-entries-printindex">
<tr><th class="index-letter-header-printindex cp-letter-header-printindex" colspan="2" id="node_cp_letter-A">A</th></tr>
<tr><td class="printindex-index-entry">aaa</td><td class="printindex-index-see-also"><em class="emph">See also</em> sss</td></tr>
<tr><td class="printindex-index-entry">aaa</td><td class="printindex-index-see-also"><em class="emph">See also</em> 123</td></tr>
<tr><th class="index-letter-header-printindex cp-letter-header-printindex" colspan="2" id="node_cp_letter-B">B</th></tr>
<tr><td class="printindex-index-see-entry">bbb, <em class="emph">See</em> yyy</td><td class="printindex-index-see-entry-section"></td></tr>
<tr><td class="printindex-index-see-entry">bbb, <em class="emph">See</em> ttt</td><td class="printindex-index-see-entry-section"></td></tr>
<tr><th class="index-letter-header-printindex cp-letter-header-printindex" colspan="2" id="node_cp_letter-C">C</th></tr>
<tr><td class="printindex-index-entry">ccc</td><td class="printindex-index-see-also"><em class="emph">See also</em> also</td></tr>
<tr><td class="printindex-index-see-entry">ccc, <em class="emph">See</em> entry</td><td class="printindex-index-see-entry-section"></td></tr>
</table>
<table class="index-letters-footer-printindex cp-letters-footer-printindex"><tr><th>Jump to: &nbsp; </th><td><a class="summary-letter-printindex" href="#node_cp_letter-A"><b>A</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#node_cp_letter-B"><b>B</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#node_cp_letter-C"><b>C</b></a>
 &nbsp; 
</td></tr></table>
</div>
</div>
</div>
';


$result_converted{'xml'}->{'same_only_seealso_seeentry'} = '<node name="Top" spaces=" "><nodename>Top</nodename><nodenext automatic="on">node</nodenext></node>
<top spaces=" "><sectiontitle>top</sectiontitle>

</top>
<node name="node" spaces=" "><nodename>node</nodename><nodeprev automatic="on">Top</nodeprev><nodeup automatic="on">Top</nodeup></node>
<chapter spaces=" "><sectiontitle>chap</sectiontitle>

<cindex index="cp" spaces=" "><indexterm index="cp" number="1">aaa <seealso>sss</seealso></indexterm></cindex>
<cindex index="cp" spaces=" "><indexterm index="cp" number="2">aaa <seealso>123</seealso></indexterm></cindex>

<cindex index="cp" spaces=" "><indexterm index="cp" number="3">bbb <seeentry>yyy</seeentry></indexterm></cindex>
<cindex index="cp" spaces=" "><indexterm index="cp" number="4">bbb <seeentry>ttt</seeentry></indexterm></cindex>

<cindex index="cp" spaces=" "><indexterm index="cp" number="5">ccc <seealso>also</seealso></indexterm></cindex>
<cindex index="cp" spaces=" "><indexterm index="cp" number="6">ccc <seeentry>entry</seeentry></indexterm></cindex>

<printindex spaces=" " value="cp" line="cp"></printindex>
</chapter>
';


$result_converted{'latex'}->{'same_only_seealso_seeentry'} = '\\documentclass{book}
\\usepackage{amsfonts}
\\usepackage{amsmath}
\\usepackage[gen]{eurosym}
\\usepackage{textcomp}
\\usepackage{graphicx}
\\usepackage{etoolbox}
\\usepackage{titleps}
\\usepackage[utf8]{inputenc}
\\usepackage[T1]{fontenc}
\\usepackage{imakeidx}
\\usepackage{float}
% use hidelinks to remove boxes around links to be similar to Texinfo TeX
\\usepackage[hidelinks]{hyperref}

\\makeatletter
\\newcommand{\\Texinfosettitle}{No Title}%

% no index headers
\\indexsetup{level=\\relax,toclevel=section}%
\\makeindex[name=cp,title=]%

% redefine the \\mainmatter command such that it does not clear page
% as if in double page
\\renewcommand\\mainmatter{\\clearpage\\@mainmattertrue\\pagenumbering{arabic}}
\\newenvironment{Texinfopreformatted}{%
  \\par\\GNUTobeylines\\obeyspaces\\frenchspacing\\parskip=\\z@\\parindent=\\z@}{}
{\\catcode`\\^^M=13 \\gdef\\GNUTobeylines{\\catcode`\\^^M=13 \\def^^M{\\null\\par}}}
\\newenvironment{Texinfoindented}{\\begin{list}{}{}\\item\\relax}{\\end{list}}

% used for substitutions in commands
\\newcommand{\\Texinfoplaceholder}[1]{}

\\newpagestyle{single}{\\sethead[\\chaptername{} \\thechapter{} \\chaptertitle{}][][\\thepage]
                              {\\chaptername{} \\thechapter{} \\chaptertitle{}}{}{\\thepage}}

% allow line breaking at underscore
\\let\\Texinfounderscore\\_
\\renewcommand{\\_}{\\Texinfounderscore\\discretionary{}{}{}}
\\renewcommand{\\includegraphics}[1]{\\fbox{FIG \\detokenize{#1}}}

\\makeatother
% set default for @setchapternewpage
\\makeatletter
\\patchcmd{\\chapter}{\\if@openright\\cleardoublepage\\else\\clearpage\\fi}{\\Texinfoplaceholder{setchapternewpage placeholder}\\clearpage}{}{}
\\makeatother
\\pagestyle{single}%

\\begin{document}
\\label{anchor:Top}%
\\chapter{{chap}}
\\label{anchor:node}%

\\index[cp]{aaa@aaa|seealso{sss}}%
\\index[cp]{aaa@aaa|seealso{123}}%

\\index[cp]{bbb@bbb|see{yyy}}%
\\index[cp]{bbb@bbb|see{ttt}}%

\\index[cp]{ccc@ccc|seealso{also}}%
\\index[cp]{ccc@ccc|see{entry}}%

\\printindex[cp]
\\end{document}
';

1;
