use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'explicit_sort_key'} = {
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
        },
        {
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'cmdname' => 'defindex',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'SK'
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
              'SK'
            ]
          },
          'info' => {
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'line_nr' => 6
          }
        },
        {
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'cmdname' => 'SKindex',
          'contents' => [
            {
              'contents' => [
                {
                  'cmdname' => 'sortas',
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'A'
                        }
                      ],
                      'type' => 'brace_arg'
                    }
                  ],
                  'source_info' => {
                    'line_nr' => 8
                  }
                },
                {
                  'text' => ' ',
                  'type' => 'spaces_after_close_brace'
                },
                {
                  'text' => 'bbbbbbb (first)'
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
              'SK',
              1
            ],
            'sortas' => 'A'
          },
          'info' => {
            'command_name' => 'SKindex',
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
          'cmdname' => 'SKindex',
          'contents' => [
            {
              'contents' => [
                {
                  'cmdname' => 'sortas',
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'B'
                        }
                      ],
                      'type' => 'brace_arg'
                    }
                  ],
                  'source_info' => {
                    'line_nr' => 9
                  }
                },
                {
                  'text' => ' ',
                  'type' => 'spaces_after_close_brace'
                },
                {
                  'text' => 'aaaaaaa (second)'
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
              'SK',
              2
            ],
            'sortas' => 'B'
          },
          'info' => {
            'command_name' => 'SKindex',
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'line_nr' => 9
          },
          'type' => 'index_entry_command'
        },
        {
          'cmdname' => 'SKindex',
          'contents' => [
            {
              'contents' => [
                {
                  'cmdname' => 'sortas',
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => '0'
                        }
                      ],
                      'type' => 'brace_arg'
                    }
                  ],
                  'source_info' => {
                    'line_nr' => 10
                  }
                },
                {
                  'text' => ' ',
                  'type' => 'spaces_after_close_brace'
                },
                {
                  'text' => 'zero sort key'
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
              'SK',
              3
            ],
            'sortas' => '0'
          },
          'info' => {
            'command_name' => 'SKindex',
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
          'cmdname' => 'SKindex',
          'contents' => [
            {
              'contents' => [
                {
                  'cmdname' => 'b',
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'aaa '
                        },
                        {
                          'cmdname' => 'sortas',
                          'contents' => [
                            {
                              'contents' => [
                                {
                                  'text' => 'invalid nesting'
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
                      'type' => 'brace_container'
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
              'SK',
              4
            ]
          },
          'info' => {
            'command_name' => 'SKindex',
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
          'contents' => [
            {
              'text' => 'in a reuglar para '
            },
            {
              'cmdname' => 'sortas',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'foo'
                    }
                  ],
                  'type' => 'brace_arg'
                }
              ],
              'source_info' => {
                'line_nr' => 13
              }
            },
            {
              'text' => '. '
            },
            {
              'cmdname' => 'code',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'inside another '
                    },
                    {
                      'cmdname' => 'sortas',
                      'contents' => [
                        {
                          'contents' => [
                            {
                              'text' => 'command'
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
                  'type' => 'brace_container'
                }
              ],
              'source_info' => {
                'line_nr' => 13
              }
            },
            {
              'text' => '.
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
          'contents' => [
            {
              'cmdname' => 'sortas',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'and cmd '
                    },
                    {
                      'cmdname' => 'b',
                      'contents' => [
                        {
                          'contents' => [
                            {
                              'text' => 'inside'
                            }
                          ],
                          'type' => 'brace_container'
                        }
                      ],
                      'source_info' => {
                        'line_nr' => 15
                      }
                    }
                  ],
                  'type' => 'brace_arg'
                }
              ],
              'source_info' => {
                'line_nr' => 15
              }
            },
            {
              'text' => '.
'
            },
            {
              'cmdname' => 'url',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'and cmd '
                    },
                    {
                      'cmdname' => 'sortas',
                      'contents' => [
                        {
                          'contents' => [
                            {
                              'text' => 'inside'
                            }
                          ],
                          'type' => 'brace_arg'
                        }
                      ],
                      'source_info' => {
                        'line_nr' => 16
                      }
                    }
                  ],
                  'type' => 'brace_arg'
                }
              ],
              'source_info' => {
                'line_nr' => 16
              }
            },
            {
              'text' => '.
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
          'cmdname' => 'printindex',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'SK'
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
              'SK'
            ]
          },
          'info' => {
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'line_nr' => 18
          }
        }
      ],
      'extra' => {
        'is_target' => 1,
        'isindex' => 1,
        'normalized' => 'chap'
      },
      'info' => {
        'spaces_before_argument' => {
          'text' => ' '
        }
      },
      'source_info' => {
        'line_nr' => 4
      }
    }
  ],
  'type' => 'document_root'
};
$result_trees{'explicit_sort_key'}{'contents'}[3]{'contents'}[4]{'extra'}{'element_node'} = $result_trees{'explicit_sort_key'}{'contents'}[3];
$result_trees{'explicit_sort_key'}{'contents'}[3]{'contents'}[5]{'extra'}{'element_node'} = $result_trees{'explicit_sort_key'}{'contents'}[3];
$result_trees{'explicit_sort_key'}{'contents'}[3]{'contents'}[6]{'extra'}{'element_node'} = $result_trees{'explicit_sort_key'}{'contents'}[3];
$result_trees{'explicit_sort_key'}{'contents'}[3]{'contents'}[7]{'extra'}{'element_node'} = $result_trees{'explicit_sort_key'}{'contents'}[3];

$result_texis{'explicit_sort_key'} = '@node Top
@top

@node chap

@defindex SK

@SKindex @sortas{A} bbbbbbb (first)
@SKindex @sortas{B} aaaaaaa (second)
@SKindex @sortas{0} zero sort key
@SKindex @b{aaa @sortas{invalid nesting}}

in a reuglar para @sortas{foo}. @code{inside another @sortas{command}}.

@sortas{and cmd @b{inside}}.
@url{and cmd @sortas{inside}}.

@printindex SK
';


$result_texts{'explicit_sort_key'} = '



in a reuglar para . inside another .

.
and cmd .

';

$result_sectioning{'explicit_sort_key'} = {
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
          'section_level' => 0,
          'sectioning_root' => {}
        }
      }
    ],
    'section_level' => -1
  }
};
$result_sectioning{'explicit_sort_key'}{'extra'}{'section_childs'}[0]{'extra'}{'sectioning_root'} = $result_sectioning{'explicit_sort_key'};

$result_nodes{'explicit_sort_key'} = [
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
            'isindex' => 1,
            'node_directions' => {
              'prev' => {}
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
$result_nodes{'explicit_sort_key'}[0]{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'prev'} = $result_nodes{'explicit_sort_key'}[0];
$result_nodes{'explicit_sort_key'}[1] = $result_nodes{'explicit_sort_key'}[0]{'extra'}{'node_directions'}{'next'};

$result_menus{'explicit_sort_key'} = [
  {
    'extra' => {
      'normalized' => 'Top'
    }
  },
  {
    'extra' => {
      'normalized' => 'chap'
    }
  }
];

$result_errors{'explicit_sort_key'} = [
  {
    'error_line' => 'warning: @sortas should only appear in an index entry
',
    'line_nr' => 11,
    'text' => '@sortas should only appear in an index entry',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: @sortas should only appear in an index entry
',
    'line_nr' => 13,
    'text' => '@sortas should only appear in an index entry',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: @sortas should only appear in an index entry
',
    'line_nr' => 13,
    'text' => '@sortas should only appear in an index entry',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: @sortas should only appear in an index entry
',
    'line_nr' => 15,
    'text' => '@sortas should only appear in an index entry',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: @b should not appear in @sortas
',
    'line_nr' => 15,
    'text' => '@b should not appear in @sortas',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: @sortas should only appear in an index entry
',
    'line_nr' => 16,
    'text' => '@sortas should only appear in an index entry',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: node `chap\' not in menu
',
    'line_nr' => 4,
    'text' => 'node `chap\' not in menu',
    'type' => 'warning'
  }
];


$result_indices{'explicit_sort_key'} = {
  'index_names' => {
    'SK' => {
      'in_code' => 0,
      'name' => 'SK'
    },
    'cp' => {
      'in_code' => 0,
      'name' => 'cp'
    },
    'fn' => {
      'in_code' => 1,
      'name' => 'fn'
    },
    'ky' => {
      'in_code' => 1,
      'name' => 'ky'
    },
    'pg' => {
      'in_code' => 1,
      'name' => 'pg'
    },
    'tp' => {
      'in_code' => 1,
      'name' => 'tp'
    },
    'vr' => {
      'in_code' => 1,
      'name' => 'vr'
    }
  }
};


$result_floats{'explicit_sort_key'} = {};


$result_indices_sort_strings{'explicit_sort_key'} = {
  'SK' => [
    '0',
    'A',
    'aaa ',
    'B'
  ]
};



$result_converted{'info'}->{'explicit_sort_key'} = 'This is , produced from .


File: ,  Node: Top,  Next: chap,  Up: (dir)


File: ,  Node: chap,  Prev: Top

in a reuglar para .  ‘inside another ’.

   .  <and cmd >.

 [index ]
* Menu:

* zero sort key:                         chap.                  (line 3)
* bbbbbbb (first):                       chap.                  (line 3)
* aaa :                                  chap.                  (line 3)
* aaaaaaa (second):                      chap.                  (line 3)


Tag Table:
Node: Top27
Node: chap74

End Tag Table


Local Variables:
coding: utf-8
End:
';


$result_converted{'plaintext'}->{'explicit_sort_key'} = 'in a reuglar para .  ‘inside another ’.

   .  <and cmd >.

* Menu:

* zero sort key:                         chap.                  (line 0)
* bbbbbbb (first):                       chap.                  (line 0)
* aaa :                                  chap.                  (line 0)
* aaaaaaa (second):                      chap.                  (line 0)

';


$result_converted{'html_text'}->{'explicit_sort_key'} = '<div class="top-level-extent" id="Top">
<div class="nav-panel">
<p>
[<a href="#chap" title="Index" rel="index">Index</a>]</p>
</div>
<a class="top" id="SEC_Top"></a>
<hr>
<a class="node-id" id="chap"></a><div class="nav-panel">
<p>
[<a href="#chap" title="Index" rel="index">Index</a>]</p>
</div>
<h4 class="node"><span>chap<a class="copiable-link" href="#chap"> &para;</a></span></h4>


<a class="index-entry-id" id="index-bbbbbbb-_0028first_0029"></a>
<a class="index-entry-id" id="index-aaaaaaa-_0028second_0029"></a>
<a class="index-entry-id" id="index-zero-sort-key"></a>
<a class="index-entry-id" id="index-aaa-"></a>

<p>in a reuglar para . <code class="code">inside another </code>.
</p>
<p>.
<a class="url" href="and%20cmd%20">and cmd </a>.
</p>
<div class="printindex SK-printindex">
<table class="index-letters-header-printindex SK-letters-header-printindex"><tr><th>Jump to: &nbsp; </th><td><a class="summary-letter-printindex" href="#chap_SK_symbol-1"><b>0</b></a>
 &nbsp; 
<br>
<a class="summary-letter-printindex" href="#chap_SK_letter-A"><b>A</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#chap_SK_letter-B"><b>B</b></a>
 &nbsp; 
</td></tr></table>
<table class="index-entries-printindex SK-entries-printindex">
<tr><th class="index-letter-header-printindex SK-letter-header-printindex" colspan="2" id="chap_SK_symbol-1">0</th></tr>
<tr><td class="printindex-index-entry"><a href="#index-zero-sort-key">zero sort key</a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><th class="index-letter-header-printindex SK-letter-header-printindex" colspan="2" id="chap_SK_letter-A">A</th></tr>
<tr><td class="printindex-index-entry"><a href="#index-bbbbbbb-_0028first_0029">bbbbbbb (first)</a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td class="printindex-index-entry"><a href="#index-aaa-"><b class="b">aaa </b></a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><th class="index-letter-header-printindex SK-letter-header-printindex" colspan="2" id="chap_SK_letter-B">B</th></tr>
<tr><td class="printindex-index-entry"><a href="#index-aaaaaaa-_0028second_0029">aaaaaaa (second)</a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
</table>
<table class="index-letters-footer-printindex SK-letters-footer-printindex"><tr><th>Jump to: &nbsp; </th><td><a class="summary-letter-printindex" href="#chap_SK_symbol-1"><b>0</b></a>
 &nbsp; 
<br>
<a class="summary-letter-printindex" href="#chap_SK_letter-A"><b>A</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#chap_SK_letter-B"><b>B</b></a>
 &nbsp; 
</td></tr></table>
</div>
</div>
';


$result_converted{'xml'}->{'explicit_sort_key'} = '<node name="Top" spaces=" "><nodename>Top</nodename><nodenext automatic="on">chap</nodenext></node>
<top><sectiontitle></sectiontitle>

</top>
<node name="chap" spaces=" "><nodename>chap</nodename><nodeprev automatic="on">Top</nodeprev></node>

<defindex spaces=" " value="SK" line="SK"></defindex>

<indexcommand command="SKindex" index="SK" spaces=" "><indexterm index="SK" number="1" incode="0"><sortas>A</sortas> bbbbbbb (first)</indexterm></indexcommand>
<indexcommand command="SKindex" index="SK" spaces=" "><indexterm index="SK" number="2" incode="0"><sortas>B</sortas> aaaaaaa (second)</indexterm></indexcommand>
<indexcommand command="SKindex" index="SK" spaces=" "><indexterm index="SK" number="3" incode="0"><sortas>0</sortas> zero sort key</indexterm></indexcommand>
<indexcommand command="SKindex" index="SK" spaces=" "><indexterm index="SK" number="4" incode="0"><b>aaa <sortas>invalid nesting</sortas></b></indexterm></indexcommand>

<para>in a reuglar para <sortas>foo</sortas>. <code>inside another <sortas>command</sortas></code>.
</para>
<para><sortas>and cmd <b>inside</b></sortas>.
<url><urefurl>and cmd <sortas>inside</sortas></urefurl></url>.
</para>
<printindex spaces=" " value="SK" line="SK"></printindex>
';


$result_converted{'latex'}->{'explicit_sort_key'} = '\\documentclass{book}
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
\\makeindex[name=SK,title=]%

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
\\label{anchor:chap}%


\\index[SK]{A@bbbbbbb (first)}%
\\index[SK]{B@aaaaaaa (second)}%
\\index[SK]{0@zero sort key}%
\\index[SK]{aaa @\\textbf{aaa }}%

in a reuglar para . \\texttt{inside another }.

.
\\url{and cmd }.

\\printindex[SK]
\\end{document}
';

1;
