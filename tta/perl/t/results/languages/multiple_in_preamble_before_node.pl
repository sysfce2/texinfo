use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'multiple_in_preamble_before_node'} = {
  'contents' => [
    {
      'contents' => [
        {
          'contents' => [
            {
              'cmdname' => 'documentlanguage',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'fr'
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
                'text_arg' => 'fr'
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
            },
            {
              'cmdname' => 'copying',
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
                  'cmdname' => 'defivar',
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
                                      'text' => 'Instance Variable',
                                      'type' => 'untranslated'
                                    }
                                  ],
                                  'extra' => {
                                    'documentlanguage' => 'fr',
                                    'translation_context' => 'category of instance variables in object-oriented programming for @defivar'
                                  },
                                  'type' => 'untranslated_def_line_arg'
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
                                      'text' => 'copying'
                                    }
                                  ],
                                  'type' => 'def_line_arg'
                                }
                              ],
                              'type' => 'def_class'
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
                                      'text' => 'a'
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
                                      'text' => 'b'
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
                        'def_command' => 'defivar',
                        'def_index_element' => {
                          'contents' => [
                            {
                              'contents' => [
                                {
                                  'contents' => [
                                    {
                                      'text' => 'a'
                                    }
                                  ],
                                  'type' => 'def_line_arg'
                                }
                              ],
                              'type' => 'def_name'
                            },
                            {
                              'text' => ' de '
                            },
                            {
                              'contents' => [
                                {
                                  'contents' => [
                                    {
                                      'text' => 'copying'
                                    }
                                  ],
                                  'type' => 'def_line_arg'
                                }
                              ],
                              'type' => 'def_class'
                            }
                          ]
                        },
                        'def_index_ref_element' => {
                          'contents' => [
                            {
                              'contents' => [
                                {
                                  'contents' => [
                                    {
                                      'text' => 'a'
                                    }
                                  ],
                                  'type' => 'def_line_arg'
                                }
                              ],
                              'type' => 'def_name'
                            },
                            {
                              'text' => ' of '
                            },
                            {
                              'contents' => [
                                {
                                  'contents' => [
                                    {
                                      'text' => 'copying'
                                    }
                                  ],
                                  'type' => 'def_line_arg'
                                }
                              ],
                              'type' => 'def_class'
                            }
                          ]
                        },
                        'documentlanguage' => 'fr',
                        'element_region' => 'copying',
                        'index_entry' => [
                          'vr',
                          1
                        ],
                        'original_def_cmdname' => 'defivar'
                      },
                      'source_info' => {
                        'line_nr' => 4
                      },
                      'type' => 'def_line'
                    },
                    {
                      'contents' => [
                        {
                          'contents' => [
                            {
                              'cmdname' => 'error',
                              'contents' => [
                                {
                                  'type' => 'brace_container'
                                }
                              ],
                              'source_info' => {
                                'line_nr' => 5
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
                      'type' => 'def_item'
                    },
                    {
                      'cmdname' => 'end',
                      'contents' => [
                        {
                          'contents' => [
                            {
                              'text' => 'defivar'
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
                        'text_arg' => 'defivar'
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
                  'cmdname' => 'end',
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'copying'
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
                    'text_arg' => 'copying'
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
              'source_info' => {
                'line_nr' => 3
              }
            },
            {
              'text' => '
',
              'type' => 'empty_line'
            },
            {
              'cmdname' => 'documentlanguage',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'hr'
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
                'text_arg' => 'hr'
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'line_nr' => 9
              }
            },
            {
              'text' => '
',
              'type' => 'empty_line'
            }
          ],
          'type' => 'preamble_before_content'
        },
        {
          'contents' => [
            {
              'text' => 'Text ending the preamble
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
          'cmdname' => 'documentlanguage',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'de'
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
            'text_arg' => 'de'
          },
          'info' => {
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'line_nr' => 13
          }
        },
        {
          'text' => '
',
          'type' => 'empty_line'
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
        'line_nr' => 15
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
                  'text' => 'top section'
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
        'line_nr' => 16
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
                  'text' => 'chapter'
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
        'normalized' => 'chapter'
      },
      'info' => {
        'spaces_before_argument' => {
          'text' => ' '
        }
      },
      'source_info' => {
        'line_nr' => 18
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
          'cmdname' => 'defivar',
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
                              'text' => 'Instance Variable',
                              'type' => 'untranslated'
                            }
                          ],
                          'extra' => {
                            'documentlanguage' => 'de',
                            'translation_context' => 'category of instance variables in object-oriented programming for @defivar'
                          },
                          'type' => 'untranslated_def_line_arg'
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
                              'text' => 'c'
                            }
                          ],
                          'type' => 'def_line_arg'
                        }
                      ],
                      'type' => 'def_class'
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
                              'text' => 'BBB'
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
                              'text' => 'CCC'
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
                'def_command' => 'defivar',
                'def_index_element' => {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'contents' => [
                            {
                              'text' => 'BBB'
                            }
                          ],
                          'type' => 'def_line_arg'
                        }
                      ],
                      'type' => 'def_name'
                    },
                    {
                      'text' => ' von '
                    },
                    {
                      'contents' => [
                        {
                          'contents' => [
                            {
                              'text' => 'c'
                            }
                          ],
                          'type' => 'def_line_arg'
                        }
                      ],
                      'type' => 'def_class'
                    }
                  ]
                },
                'def_index_ref_element' => {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'contents' => [
                            {
                              'text' => 'BBB'
                            }
                          ],
                          'type' => 'def_line_arg'
                        }
                      ],
                      'type' => 'def_name'
                    },
                    {
                      'text' => ' of '
                    },
                    {
                      'contents' => [
                        {
                          'contents' => [
                            {
                              'text' => 'c'
                            }
                          ],
                          'type' => 'def_line_arg'
                        }
                      ],
                      'type' => 'def_class'
                    }
                  ]
                },
                'documentlanguage' => 'de',
                'element_node' => {},
                'index_entry' => [
                  'vr',
                  2
                ],
                'original_def_cmdname' => 'defivar'
              },
              'source_info' => {
                'line_nr' => 21
              },
              'type' => 'def_line'
            },
            {
              'contents' => [
                {
                  'contents' => [
                    {
                      'cmdname' => 'error',
                      'contents' => [
                        {
                          'type' => 'brace_container'
                        }
                      ],
                      'source_info' => {
                        'line_nr' => 22
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
              'type' => 'def_item'
            },
            {
              'cmdname' => 'end',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'defivar'
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
                'text_arg' => 'defivar'
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'line_nr' => 23
              }
            }
          ],
          'info' => {
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'line_nr' => 21
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
        'line_nr' => 19
      }
    }
  ],
  'type' => 'document_root'
};
$result_trees{'multiple_in_preamble_before_node'}{'contents'}[4]{'contents'}[2]{'contents'}[0]{'extra'}{'element_node'} = $result_trees{'multiple_in_preamble_before_node'}{'contents'}[3];

$result_texis{'multiple_in_preamble_before_node'} = '@documentlanguage fr

@copying
@defivar copying a b
@error{}
@end defivar
@end copying

@documentlanguage hr

Text ending the preamble

@documentlanguage de

@node Top
@top top section

@node chapter
@chapter chap

@defivar c BBB CCC
@error{}
@end defivar
';


$result_texts{'multiple_in_preamble_before_node'} = '


Text ending the preamble


top section
***********

1 chap
******

Instanzvariable of c: BBB CCC
error-->
';

$result_sectioning{'multiple_in_preamble_before_node'} = {
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
                    'normalized' => 'chapter'
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
$result_sectioning{'multiple_in_preamble_before_node'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[0]{'extra'}{'section_directions'}{'up'} = $result_sectioning{'multiple_in_preamble_before_node'}{'extra'}{'section_childs'}[0];
$result_sectioning{'multiple_in_preamble_before_node'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[0]{'extra'}{'toplevel_directions'}{'prev'} = $result_sectioning{'multiple_in_preamble_before_node'}{'extra'}{'section_childs'}[0];
$result_sectioning{'multiple_in_preamble_before_node'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[0]{'extra'}{'toplevel_directions'}{'up'} = $result_sectioning{'multiple_in_preamble_before_node'}{'extra'}{'section_childs'}[0];
$result_sectioning{'multiple_in_preamble_before_node'}{'extra'}{'section_childs'}[0]{'extra'}{'sectioning_root'} = $result_sectioning{'multiple_in_preamble_before_node'};

$result_nodes{'multiple_in_preamble_before_node'} = [
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
            'normalized' => 'chapter'
          }
        }
      },
      'normalized' => 'Top'
    }
  },
  {}
];
$result_nodes{'multiple_in_preamble_before_node'}[0]{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'prev'} = $result_nodes{'multiple_in_preamble_before_node'}[0];
$result_nodes{'multiple_in_preamble_before_node'}[0]{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'up'} = $result_nodes{'multiple_in_preamble_before_node'}[0];
$result_nodes{'multiple_in_preamble_before_node'}[1] = $result_nodes{'multiple_in_preamble_before_node'}[0]{'extra'}{'node_directions'}{'next'};

$result_menus{'multiple_in_preamble_before_node'} = [
  {
    'extra' => {
      'normalized' => 'Top'
    }
  },
  {
    'extra' => {
      'normalized' => 'chapter'
    }
  }
];

$result_errors{'multiple_in_preamble_before_node'} = [];


$result_floats{'multiple_in_preamble_before_node'} = {};


$result_indices_sort_strings{'multiple_in_preamble_before_node'} = {
  'vr' => [
    'a de copying',
    'BBB von c'
  ]
};



$result_converted{'plaintext'}->{'multiple_in_preamble_before_node'} = 'Text ending the preamble

top section
***********

1 chap
******

 -- Instanzvariable of c: BBB CCC
     error→
';


$result_converted{'info'}->{'multiple_in_preamble_before_node'} = 'This is , produced from .

 -- Primjerak varijable od copying: a b
     greška→

   Text ending the preamble


File: ,  Node: Top,  Next: chapter,  Up: (dir)

top section
***********

* Menu:

* chapter::


File: ,  Node: chapter,  Prev: Top,  Up: Top

1 chap
******

 -- Instanzvariable of c: BBB CCC
     error→


Tag Table:
Node: Top110
Node: chapter207

End Tag Table


Local Variables:
coding: utf-8
Info-documentlanguage: de
End:
';


$result_converted{'html'}->{'multiple_in_preamble_before_node'} = '<!DOCTYPE html>
<html>
<!-- Created by texinfo, https://www.gnu.org/software/texinfo/ -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- Primjerak varijable od copying: a b
greška→ -->
<title>top section</title>

<meta name="description" content="top section">
<meta name="keywords" content="top section">
<meta name="resource-type" content="document">
<meta name="distribution" content="global">
<meta name="viewport" content="width=device-width,initial-scale=1">

<link href="#Top" rel="start" title="Top">
<style type="text/css">
<!--
a.copiable-link {visibility: hidden; text-decoration: none; line-height: 0em}
span:hover a.copiable-link {visibility: visible}
strong.def-name {font-family: monospace; font-weight: bold; font-size: larger}
-->
</style>


</head>

<body lang="hr">



<p>Text ending the preamble
</p>

<div class="top-level-extent" id="Top">
<div class="nav-panel">
<p>
Nächste: <a href="#chapter" accesskey="n" rel="next">chap</a> &nbsp; </p>
</div>
<h1 class="top" id="top-section"><span>top section<a class="copiable-link" href="#top-section"> &para;</a></span></h1>

<ul class="mini-toc">
<li><a href="#chapter" accesskey="1">chap</a></li>
</ul>
<hr>
<div class="chapter-level-extent" id="chapter">
<div class="nav-panel">
<p>
Vorige: <a href="#Top" accesskey="p" rel="prev">top section</a>, Nach oben: <a href="#Top" accesskey="u" rel="up">top section</a> &nbsp; </p>
</div>
<h2 class="chapter" id="chap"><span>1 chap<a class="copiable-link" href="#chap"> &para;</a></span></h2>

<dl class="first-defcv first-defivar-alias-first-defcv def-block">
<dt class="defcv defivar-alias-defcv def-line" id="index-BBB-of-c"><span class="category-def">Instanzvariable of <code class="code">c</code>: </span><span><strong class="def-name">BBB</strong> <var class="def-var-arguments">CCC</var><a class="copiable-link" href="#index-BBB-of-c"> &para;</a></span></dt>
<dd><p>error&rarr;
</p></dd></dl>
</div>
</div>



</body>
</html>
';


$result_converted{'xml'}->{'multiple_in_preamble_before_node'} = '<documentlanguage xml:lang="fr" spaces=" ">fr</documentlanguage>

<copying endspaces=" ">
<defivar spaces=" " endspaces=" "><definitionterm><indexterm index="vr" number="1">a de copying</indexterm><defcategory automatic="on">Instance Variable</defcategory> <defclass>copying</defclass> <defclassvar>a</defclassvar> <defparam>b</defparam></definitionterm>
<definitionitem><para>&errorglyph;
</para></definitionitem></defivar>
</copying>

<documentlanguage xml:lang="hr" spaces=" ">hr</documentlanguage>

<para>Text ending the preamble
</para>
<documentlanguage xml:lang="de" spaces=" ">de</documentlanguage>

<node name="Top" spaces=" "><nodename>Top</nodename><nodenext automatic="on">chapter</nodenext></node>
<top spaces=" "><sectiontitle>top section</sectiontitle>

</top>
<node name="chapter" spaces=" "><nodename>chapter</nodename><nodeprev automatic="on">Top</nodeprev><nodeup automatic="on">Top</nodeup></node>
<chapter spaces=" "><sectiontitle>chap</sectiontitle>

<defivar spaces=" " endspaces=" "><definitionterm><indexterm index="vr" number="2">BBB von c</indexterm><defcategory automatic="on">Instance Variable</defcategory> <defclass>c</defclass> <defclassvar>BBB</defclassvar> <defparam>CCC</defparam></definitionterm>
<definitionitem><para>&errorglyph;
</para></definitionitem></defivar>
</chapter>
';


$result_converted{'docbook_doc'}->{'multiple_in_preamble_before_node'} = '<?xml version="1.0"?>
<!DOCTYPE book PUBLIC "-//OASIS//DTD DocBook XML V4.5//EN" "http://www.oasis-open.org/docbook/xml/4.5/docbookx.dtd" [
  <!ENTITY tex "TeX">
  <!ENTITY latex "LaTeX">
]>
<book lang="hr">
<title>top section</title>
<bookinfo><title>top section</title>
<legalnotice><synopsis><indexterm role="vr"><primary>a de copying</primary></indexterm><phrase role="category"><emphasis role="bold">Instance Variable</emphasis>:</phrase> <ooclass><classname>copying</classname></ooclass> <property>a</property> <emphasis role="arg">b</emphasis></synopsis>
<blockquote><para>greška&#8594;
</para></blockquote></legalnotice></bookinfo>
<chapter label="1" id="chapter" lang="de">
<title>chap</title>

<synopsis><indexterm role="vr"><primary>BBB von c</primary></indexterm><phrase role="category"><emphasis role="bold">Instance Variable</emphasis>:</phrase> <ooclass><classname>c</classname></ooclass> <property>BBB</property> <emphasis role="arg">CCC</emphasis></synopsis>
<blockquote><para>error&#8594;
</para></blockquote></chapter>
</book>
';

1;
