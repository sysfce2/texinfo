use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'same_index_entry_merged_indices'} = {
  'contents' => [
    {
      'contents' => [
        {
          'contents' => [
            {
              'cmdname' => 'syncodeindex',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'vr fn'
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
                  'vr',
                  'fn'
                ]
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
              'text' => '
',
              'type' => 'empty_line'
            }
          ],
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
        'line_nr' => 3
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
        'line_nr' => 4
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
        'isindex' => 1,
        'normalized' => 'chap'
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
        },
        {
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'contents' => [
            {
              'text' => 'Text.
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
          'cmdname' => 'deffn',
          'contents' => [
            {
              'contents' => [
                {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'contents' => [
                            {
                              'text' => 'Command'
                            }
                          ],
                          'type' => 'def_line_arg'
                        }
                      ],
                      'type' => 'def_category'
                    },
                    {
                      'text' => ' ',
                      'type' => 'spaces'
                    },
                    {
                      'contents' => [
                        {
                          'contents' => [
                            {
                              'text' => 'mmm-mode'
                            }
                          ],
                          'type' => 'def_line_arg'
                        }
                      ],
                      'type' => 'def_name'
                    },
                    {
                      'text' => ' ',
                      'type' => 'spaces'
                    },
                    {
                      'contents' => [
                        {
                          'contents' => [
                            {
                              'cmdname' => 'var',
                              'contents' => [
                                {
                                  'contents' => [
                                    {
                                      'text' => 'arg'
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
                          'type' => 'def_line_arg'
                        }
                      ],
                      'type' => 'def_arg'
                    }
                  ],
                  'info' => {
                    'spaces_after_argument' => {
                      'text' => '
'
                    }
                  },
                  'type' => 'block_line_arg'
                }
              ],
              'extra' => {
                'def_command' => 'deffn',
                'def_index_element' => {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'mmm-mode'
                        }
                      ],
                      'type' => 'def_line_arg'
                    }
                  ],
                  'type' => 'def_name'
                },
                'element_node' => {},
                'index_entry' => [
                  'fn',
                  1
                ],
                'original_def_cmdname' => 'deffn'
              },
              'source_info' => {
                'line_nr' => 11
              },
              'type' => 'def_line'
            },
            {
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'Toggle the state of MMM Mode.
'
                    }
                  ],
                  'type' => 'paragraph'
                }
              ],
              'type' => 'def_item'
            },
            {
              'cmdname' => 'end',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'deffn'
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
                'text_arg' => 'deffn'
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'line_nr' => 13
              }
            }
          ],
          'info' => {
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'line_nr' => 11
          }
        },
        {
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'cmdname' => 'defvar',
          'contents' => [
            {
              'contents' => [
                {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'contents' => [
                            {
                              'text' => 'Variable'
                            }
                          ],
                          'type' => 'def_line_arg'
                        }
                      ],
                      'info' => {
                        'inserted' => 1
                      },
                      'type' => 'def_category'
                    },
                    {
                      'info' => {
                        'inserted' => 1
                      },
                      'text' => ' ',
                      'type' => 'spaces'
                    },
                    {
                      'contents' => [
                        {
                          'contents' => [
                            {
                              'text' => 'mmm-mode'
                            }
                          ],
                          'type' => 'def_line_arg'
                        }
                      ],
                      'type' => 'def_name'
                    }
                  ],
                  'info' => {
                    'spaces_after_argument' => {
                      'text' => '
'
                    }
                  },
                  'type' => 'block_line_arg'
                }
              ],
              'extra' => {
                'def_command' => 'defvar',
                'def_index_element' => {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'mmm-mode'
                        }
                      ],
                      'type' => 'def_line_arg'
                    }
                  ],
                  'type' => 'def_name'
                },
                'element_node' => {},
                'index_entry' => [
                  'vr',
                  1
                ],
                'original_def_cmdname' => 'defvar'
              },
              'source_info' => {
                'line_nr' => 15
              },
              'type' => 'def_line'
            },
            {
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'This variable represents MMM Mode.
'
                    }
                  ],
                  'type' => 'paragraph'
                }
              ],
              'type' => 'def_item'
            },
            {
              'cmdname' => 'end',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'defvar'
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
                'text_arg' => 'defvar'
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'line_nr' => 17
              }
            }
          ],
          'info' => {
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'line_nr' => 15
          }
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
                  'text' => 'fn'
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
              'fn'
            ]
          },
          'info' => {
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'line_nr' => 19
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
        'line_nr' => 7
      }
    }
  ],
  'type' => 'document_root'
};
$result_trees{'same_index_entry_merged_indices'}{'contents'}[4]{'contents'}[4]{'contents'}[0]{'extra'}{'element_node'} = $result_trees{'same_index_entry_merged_indices'}{'contents'}[3];
$result_trees{'same_index_entry_merged_indices'}{'contents'}[4]{'contents'}[6]{'contents'}[0]{'extra'}{'element_node'} = $result_trees{'same_index_entry_merged_indices'}{'contents'}[3];

$result_texis{'same_index_entry_merged_indices'} = '@syncodeindex vr fn

@node Top
@top

@node chap
@chapter Chapter

Text.

@deffn Command mmm-mode @var{arg}
Toggle the state of MMM Mode.
@end deffn

@defvar mmm-mode
This variable represents MMM Mode.
@end defvar

@printindex fn
';


$result_texts{'same_index_entry_merged_indices'} = '

1 Chapter
*********

Text.

Command: mmm-mode arg
Toggle the state of MMM Mode.

Variable: mmm-mode
This variable represents MMM Mode.

';

$result_sectioning{'same_index_entry_merged_indices'} = {
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
$result_sectioning{'same_index_entry_merged_indices'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[0]{'extra'}{'section_directions'}{'up'} = $result_sectioning{'same_index_entry_merged_indices'}{'extra'}{'section_childs'}[0];
$result_sectioning{'same_index_entry_merged_indices'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[0]{'extra'}{'toplevel_directions'}{'prev'} = $result_sectioning{'same_index_entry_merged_indices'}{'extra'}{'section_childs'}[0];
$result_sectioning{'same_index_entry_merged_indices'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[0]{'extra'}{'toplevel_directions'}{'up'} = $result_sectioning{'same_index_entry_merged_indices'}{'extra'}{'section_childs'}[0];
$result_sectioning{'same_index_entry_merged_indices'}{'extra'}{'section_childs'}[0]{'extra'}{'sectioning_root'} = $result_sectioning{'same_index_entry_merged_indices'};

$result_nodes{'same_index_entry_merged_indices'} = [
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
            'normalized' => 'chap'
          }
        }
      },
      'normalized' => 'Top'
    }
  },
  {}
];
$result_nodes{'same_index_entry_merged_indices'}[0]{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'prev'} = $result_nodes{'same_index_entry_merged_indices'}[0];
$result_nodes{'same_index_entry_merged_indices'}[0]{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'up'} = $result_nodes{'same_index_entry_merged_indices'}[0];
$result_nodes{'same_index_entry_merged_indices'}[1] = $result_nodes{'same_index_entry_merged_indices'}[0]{'extra'}{'node_directions'}{'next'};

$result_menus{'same_index_entry_merged_indices'} = [
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

$result_errors{'same_index_entry_merged_indices'} = [];


$result_indices{'same_index_entry_merged_indices'} = {
  'index_names' => {
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
      'merged_in' => 'fn',
      'name' => 'vr'
    }
  }
};


$result_floats{'same_index_entry_merged_indices'} = {};


$result_indices_sort_strings{'same_index_entry_merged_indices'} = {
  'fn' => [
    'mmm-mode',
    'mmm-mode'
  ]
};



$result_converted{'info'}->{'same_index_entry_merged_indices'} = 'This is , produced from .


File: ,  Node: Top,  Next: chap,  Up: (dir)

* Menu:

* chap::


File: ,  Node: chap,  Prev: Top,  Up: Top

1 Chapter
*********

Text.

 -- Command: mmm-mode ARG
     Toggle the state of MMM Mode.

 -- Variable: mmm-mode
     This variable represents MMM Mode.

 [index ]
* Menu:

* mmm-mode:                              chap.                 (line  8)
* mmm-mode <1>:                          chap.                 (line 11)


Tag Table:
Node: Top27
Node: chap93

End Tag Table


Local Variables:
coding: utf-8
End:
';


$result_converted{'plaintext'}->{'same_index_entry_merged_indices'} = '1 Chapter
*********

Text.

 -- Command: mmm-mode ARG
     Toggle the state of MMM Mode.

 -- Variable: mmm-mode
     This variable represents MMM Mode.

* Menu:

* mmm-mode:                              chap.                  (line 5)
* mmm-mode <1>:                          chap.                  (line 8)

';


$result_converted{'html_text'}->{'same_index_entry_merged_indices'} = '
<div class="top-level-extent" id="Top">
<div class="nav-panel">
<p>
[<a href="#chap" title="Index" rel="index">Index</a>]</p>
</div>
<a class="top" id="SEC_Top"></a>
<ul class="mini-toc">
<li><a href="#chap" accesskey="1">Chapter</a></li>
</ul>
<hr>
<div class="chapter-level-extent" id="chap">
<div class="nav-panel">
<p>
[<a href="#chap" title="Index" rel="index">Index</a>]</p>
</div>
<h2 class="chapter" id="Chapter"><span>1 Chapter<a class="copiable-link" href="#Chapter"> &para;</a></span></h2>

<p>Text.
</p>
<dl class="first-deffn def-block">
<dt class="deffn def-line" id="index-mmm_002dmode"><span class="category-def">Command: </span><span><strong class="def-name">mmm-mode</strong> <var class="def-var-arguments"><var class="var">arg</var></var><a class="copiable-link" href="#index-mmm_002dmode"> &para;</a></span></dt>
<dd><p>Toggle the state of MMM Mode.
</p></dd></dl>

<dl class="first-defvr first-defvar-alias-first-defvr def-block">
<dt class="defvr defvar-alias-defvr def-line" id="index-mmm_002dmode-1"><span class="category-def">Variable: </span><span><strong class="def-name">mmm-mode</strong><a class="copiable-link" href="#index-mmm_002dmode-1"> &para;</a></span></dt>
<dd><p>This variable represents MMM Mode.
</p></dd></dl>

<div class="printindex fn-printindex">
<table class="index-entries-printindex fn-entries-printindex">
<tr><th class="index-letter-header-printindex fn-letter-header-printindex" colspan="2" id="chap_fn_letter-M">M</th></tr>
<tr><td class="printindex-index-entry"><a href="#index-mmm_002dmode"><code>mmm-mode</code></a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td class="printindex-index-entry"><a href="#index-mmm_002dmode-1"><code>mmm-mode</code></a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
</table>
</div>
</div>
</div>
';


$result_converted{'xml'}->{'same_index_entry_merged_indices'} = '<syncodeindex spaces=" " from="vr" to="fn" line="vr fn"></syncodeindex>

<node name="Top" spaces=" "><nodename>Top</nodename><nodenext automatic="on">chap</nodenext></node>
<top><sectiontitle></sectiontitle>

</top>
<node name="chap" spaces=" "><nodename>chap</nodename><nodeprev automatic="on">Top</nodeprev><nodeup automatic="on">Top</nodeup></node>
<chapter spaces=" "><sectiontitle>Chapter</sectiontitle>

<para>Text.
</para>
<deffn spaces=" " endspaces=" "><definitionterm><indexterm index="fn" number="1">mmm-mode</indexterm><defcategory>Command</defcategory> <deffunction>mmm-mode</deffunction> <defparam><var>arg</var></defparam></definitionterm>
<definitionitem><para>Toggle the state of MMM Mode.
</para></definitionitem></deffn>

<defvar spaces=" " endspaces=" "><definitionterm><indexterm index="vr" number="1" mergedindex="fn">mmm-mode</indexterm><defcategory automatic="on">Variable</defcategory> <defvariable>mmm-mode</defvariable></definitionterm>
<definitionitem><para>This variable represents MMM Mode.
</para></definitionitem></defvar>

<printindex spaces=" " value="fn" line="fn"></printindex>
</chapter>
';

1;
