use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'many_lines'} = {
  'contents' => [
    {
      'contents' => [
        {
          'contents' => [
            {
              'text' => 'pagesizes '
            },
            {
              'cmdname' => 'pagesizes',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => '200mm,150mm following '
                    },
                    {
                      'cmdname' => '@'
                    },
                    {
                      'text' => 'pagesizes arg'
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
              'text' => 'afourpaper '
            },
            {
              'cmdname' => 'afourpaper',
              'contents' => [
                {
                  'text' => ' on line following afourpaper
',
                  'type' => 'rawline_arg'
                }
              ],
              'source_info' => {
                'line_nr' => 2
              }
            },
            {
              'text' => 'smallbook '
            },
            {
              'cmdname' => 'smallbook',
              'contents' => [
                {
                  'text' => ' on line following smallbook
',
                  'type' => 'rawline_arg'
                }
              ],
              'source_info' => {
                'line_nr' => 3
              }
            },
            {
              'text' => 'headings '
            },
            {
              'cmdname' => 'headings',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'on line following headings'
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
              'extra' => {},
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
              'text' => 'oddfooting '
            },
            {
              'cmdname' => 'oddfooting',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'on line following oddfooting'
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
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'line_nr' => 5
              }
            },
            {
              'text' => 'everyheading '
            },
            {
              'cmdname' => 'everyheading',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'on line following everyheading'
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
              'text' => 'everyfooting '
            },
            {
              'cmdname' => 'everyfooting',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'on line following everyfooting'
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
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'line_nr' => 7
              }
            },
            {
              'text' => 'evenheading '
            },
            {
              'cmdname' => 'evenheading',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'on line following evenheading'
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
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'line_nr' => 8
              }
            },
            {
              'text' => 'evenfooting '
            },
            {
              'cmdname' => 'evenfooting',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'on line following evenfooting'
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
              'text' => 'oddheading '
            },
            {
              'cmdname' => 'oddheading',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'on line following'
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
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'line_nr' => 10
              }
            },
            {
              'text' => 'need '
            }
          ],
          'type' => 'paragraph'
        },
        {
          'cmdname' => 'need',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => '0.1 on line following'
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
          'contents' => [
            {
              'text' => 'need '
            }
          ],
          'type' => 'paragraph'
        },
        {
          'cmdname' => 'need',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => '0.1'
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
              '0.1'
            ]
          },
          'info' => {
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'line_nr' => 12
          }
        },
        {
          'contents' => [
            {
              'text' => 'setchapternewpage '
            },
            {
              'cmdname' => 'setchapternewpage',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'on line following setchapternewpage'
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
              'text' => 'raisesections '
            },
            {
              'cmdname' => 'raisesections',
              'contents' => [
                {
                  'text' => ' on line following raisesections
',
                  'type' => 'rawline_arg'
                }
              ]
            },
            {
              'text' => 'lowersections '
            },
            {
              'cmdname' => 'lowersections',
              'contents' => [
                {
                  'text' => ' on line following lowersections
',
                  'type' => 'rawline_arg'
                }
              ]
            },
            {
              'text' => 'kbdinputstyle code '
            },
            {
              'cmdname' => 'kbdinputstyle',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'code something'
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
              'text' => 'afourpaper '
            },
            {
              'cmdname' => 'afourpaper',
              'contents' => [
                {
                  'text' => ' on line following afourpaper
',
                  'type' => 'rawline_arg'
                }
              ],
              'source_info' => {
                'line_nr' => 17
              }
            },
            {
              'text' => 'afourlatex '
            },
            {
              'cmdname' => 'afourlatex',
              'contents' => [
                {
                  'text' => ' on line following afourlatex
',
                  'type' => 'rawline_arg'
                }
              ],
              'source_info' => {
                'line_nr' => 18
              }
            },
            {
              'text' => 'afourwide '
            },
            {
              'cmdname' => 'afourwide',
              'contents' => [
                {
                  'text' => ' on line following afourwide
',
                  'type' => 'rawline_arg'
                }
              ],
              'source_info' => {
                'line_nr' => 19
              }
            },
            {
              'text' => 'paragraphindent asis '
            },
            {
              'cmdname' => 'paragraphindent',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'asis'
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
                  'asis'
                ]
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'line_nr' => 20
              }
            },
            {
              'text' => 'paragraphindent 0 '
            },
            {
              'cmdname' => 'paragraphindent',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => '0'
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
                  '0'
                ]
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'line_nr' => 21
              }
            },
            {
              'text' => 'paragraphindent none '
            },
            {
              'cmdname' => 'paragraphindent',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'none'
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
                  'none'
                ]
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'line_nr' => 22
              }
            },
            {
              'text' => 'paragraphindent 4 '
            },
            {
              'cmdname' => 'paragraphindent',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => '4'
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
                  '4'
                ]
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'line_nr' => 23
              }
            },
            {
              'text' => 'firstparagraphindent insert '
            },
            {
              'cmdname' => 'firstparagraphindent',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'insert'
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
                  'insert'
                ]
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'line_nr' => 24
              }
            },
            {
              'text' => 'firstparagraphindent 3 '
            },
            {
              'cmdname' => 'firstparagraphindent',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => '3'
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
              'extra' => {},
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'line_nr' => 25
              }
            },
            {
              'text' => 'exampleindent 6 '
            },
            {
              'cmdname' => 'exampleindent',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => '6 on line following exampleindent'
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
              'extra' => {},
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'line_nr' => 26
              }
            },
            {
              'text' => 'exampleindent 6 '
            },
            {
              'cmdname' => 'exampleindent',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => '6'
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
                  '6'
                ]
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'line_nr' => 27
              }
            },
            {
              'text' => 'footnotestyle '
            },
            {
              'cmdname' => 'footnotestyle',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'end'
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
                  'end'
                ]
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'line_nr' => 28
              }
            },
            {
              'text' => 'footnotestyle '
            },
            {
              'cmdname' => 'footnotestyle',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'separate'
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
                  'separate'
                ]
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'line_nr' => 29
              }
            },
            {
              'text' => 'documentencoding '
            },
            {
              'cmdname' => 'documentencoding',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'US-ascii encoding name'
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
                'text_arg' => 'US-ascii encoding name'
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'line_nr' => 30
              }
            },
            {
              'cmdname' => 'documentencoding',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'ISO-8859-1'
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
                'input_encoding_name' => 'iso-8859-1',
                'text_arg' => 'ISO-8859-1'
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'line_nr' => 31
              }
            },
            {
              'text' => 'frenchspacing '
            },
            {
              'cmdname' => 'frenchspacing',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'on'
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
                  'on'
                ]
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'line_nr' => 32
              }
            },
            {
              'text' => 'frenchspacing '
            },
            {
              'cmdname' => 'frenchspacing',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'off'
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
                  'off'
                ]
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'line_nr' => 33
              }
            },
            {
              'text' => 'fonttextsize '
            },
            {
              'cmdname' => 'fonttextsize',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => '10'
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
                  '10'
                ]
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'line_nr' => 34
              }
            },
            {
              'text' => 'everyheadingmarks '
            },
            {
              'cmdname' => 'everyheadingmarks',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'bottom on line following everyheadingmarks'
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
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'line_nr' => 35
              }
            },
            {
              'cmdname' => 'allowcodebreaks',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'false'
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
                  'false'
                ]
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'line_nr' => 36
              }
            },
            {
              'cmdname' => 'allowcodebreaks',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'true'
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
                  'true'
                ]
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'line_nr' => 37
              }
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
              'text' => 'Text line followed by finalout on the same line and another below '
            },
            {
              'cmdname' => 'finalout',
              'contents' => [
                {
                  'text' => '
',
                  'type' => 'rawline_arg'
                }
              ]
            },
            {
              'cmdname' => 'finalout',
              'contents' => [
                {
                  'text' => '
',
                  'type' => 'rawline_arg'
                }
              ]
            },
            {
              'text' => 'Text line after the finalout followed by a fianlout '
            },
            {
              'cmdname' => 'finalout',
              'contents' => [
                {
                  'text' => '
',
                  'type' => 'rawline_arg'
                }
              ]
            },
            {
              'text' => 'Text line after the text line followed by the finalout.
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
              'text' => 'Test text after finalout
'
            },
            {
              'cmdname' => 'finalout',
              'contents' => [
                {
                  'text' => ' a word after finalout
',
                  'type' => 'rawline_arg'
                }
              ]
            },
            {
              'text' => 'Line after finalout
'
            }
          ],
          'type' => 'paragraph'
        }
      ],
      'type' => 'before_node_section'
    }
  ],
  'type' => 'document_root'
};

$result_texis{'many_lines'} = 'pagesizes @pagesizes 200mm,150mm following @@pagesizes arg
afourpaper @afourpaper on line following afourpaper
smallbook @smallbook on line following smallbook
headings @headings on line following headings
oddfooting @oddfooting on line following oddfooting
everyheading @everyheading on line following everyheading
everyfooting @everyfooting on line following everyfooting
evenheading @evenheading on line following evenheading
evenfooting @evenfooting on line following evenfooting
oddheading @oddheading on line following
need @need 0.1 on line following
need @need 0.1
setchapternewpage @setchapternewpage on line following setchapternewpage
raisesections @raisesections on line following raisesections
lowersections @lowersections on line following lowersections
kbdinputstyle code @kbdinputstyle code something
afourpaper @afourpaper on line following afourpaper
afourlatex @afourlatex on line following afourlatex
afourwide @afourwide on line following afourwide
paragraphindent asis @paragraphindent asis
paragraphindent 0 @paragraphindent 0
paragraphindent none @paragraphindent none
paragraphindent 4 @paragraphindent 4
firstparagraphindent insert @firstparagraphindent insert
firstparagraphindent 3 @firstparagraphindent 3
exampleindent 6 @exampleindent 6 on line following exampleindent
exampleindent 6 @exampleindent 6
footnotestyle @footnotestyle end 
footnotestyle @footnotestyle separate 
documentencoding @documentencoding US-ascii encoding name
@documentencoding ISO-8859-1
frenchspacing @frenchspacing on
frenchspacing @frenchspacing off
fonttextsize @fonttextsize 10
everyheadingmarks @everyheadingmarks bottom on line following everyheadingmarks
@allowcodebreaks false
@allowcodebreaks true

Text line followed by finalout on the same line and another below @finalout
@finalout
Text line after the finalout followed by a fianlout @finalout
Text line after the text line followed by the finalout.

Test text after finalout
@finalout a word after finalout
Line after finalout
';


$result_texts{'many_lines'} = 'pagesizes afourpaper smallbook headings oddfooting everyheading everyfooting evenheading evenfooting oddheading need need setchapternewpage raisesections lowersections kbdinputstyle code afourpaper afourlatex afourwide paragraphindent asis paragraphindent 0 paragraphindent none paragraphindent 4 firstparagraphindent insert firstparagraphindent 3 exampleindent 6 exampleindent 6 footnotestyle footnotestyle documentencoding frenchspacing frenchspacing fonttextsize everyheadingmarks 
Text line followed by finalout on the same line and another below Text line after the finalout followed by a fianlout Text line after the text line followed by the finalout.

Test text after finalout
Line after finalout
';

$result_errors{'many_lines'} = [
  {
    'error_line' => 'warning: @pagesizes should only appear at the beginning of a line
',
    'line_nr' => 1,
    'text' => '@pagesizes should only appear at the beginning of a line',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: @afourpaper should only appear at the beginning of a line
',
    'line_nr' => 2,
    'text' => '@afourpaper should only appear at the beginning of a line',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: @smallbook should only appear at the beginning of a line
',
    'line_nr' => 3,
    'text' => '@smallbook should only appear at the beginning of a line',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: @headings should only appear at the beginning of a line
',
    'line_nr' => 4,
    'text' => '@headings should only appear at the beginning of a line',
    'type' => 'warning'
  },
  {
    'error_line' => 'bad argument to @headings: on line following headings
',
    'line_nr' => 4,
    'text' => 'bad argument to @headings: on line following headings',
    'type' => 'error'
  },
  {
    'error_line' => 'warning: @oddfooting should only appear at the beginning of a line
',
    'line_nr' => 5,
    'text' => '@oddfooting should only appear at the beginning of a line',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: @everyheading should only appear at the beginning of a line
',
    'line_nr' => 6,
    'text' => '@everyheading should only appear at the beginning of a line',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: @everyfooting should only appear at the beginning of a line
',
    'line_nr' => 7,
    'text' => '@everyfooting should only appear at the beginning of a line',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: @evenheading should only appear at the beginning of a line
',
    'line_nr' => 8,
    'text' => '@evenheading should only appear at the beginning of a line',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: @evenfooting should only appear at the beginning of a line
',
    'line_nr' => 9,
    'text' => '@evenfooting should only appear at the beginning of a line',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: @oddheading should only appear at the beginning of a line
',
    'line_nr' => 10,
    'text' => '@oddheading should only appear at the beginning of a line',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: @need should only appear at the beginning of a line
',
    'line_nr' => 11,
    'text' => '@need should only appear at the beginning of a line',
    'type' => 'warning'
  },
  {
    'error_line' => 'bad argument to @need: 0.1 on line following
',
    'line_nr' => 11,
    'text' => 'bad argument to @need: 0.1 on line following',
    'type' => 'error'
  },
  {
    'error_line' => 'warning: @need should only appear at the beginning of a line
',
    'line_nr' => 12,
    'text' => '@need should only appear at the beginning of a line',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: @setchapternewpage should only appear at the beginning of a line
',
    'line_nr' => 13,
    'text' => '@setchapternewpage should only appear at the beginning of a line',
    'type' => 'warning'
  },
  {
    'error_line' => '@setchapternewpage arg must be `on\', `off\' or `odd\', not `on line following setchapternewpage\'
',
    'line_nr' => 13,
    'text' => '@setchapternewpage arg must be `on\', `off\' or `odd\', not `on line following setchapternewpage\'',
    'type' => 'error'
  },
  {
    'error_line' => 'warning: @raisesections should only appear at the beginning of a line
',
    'line_nr' => 14,
    'text' => '@raisesections should only appear at the beginning of a line',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: @lowersections should only appear at the beginning of a line
',
    'line_nr' => 15,
    'text' => '@lowersections should only appear at the beginning of a line',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: @kbdinputstyle should only appear at the beginning of a line
',
    'line_nr' => 16,
    'text' => '@kbdinputstyle should only appear at the beginning of a line',
    'type' => 'warning'
  },
  {
    'error_line' => '@kbdinputstyle arg must be `code\'/`example\'/`distinct\', not `code something\'
',
    'line_nr' => 16,
    'text' => '@kbdinputstyle arg must be `code\'/`example\'/`distinct\', not `code something\'',
    'type' => 'error'
  },
  {
    'error_line' => 'warning: @afourpaper should only appear at the beginning of a line
',
    'line_nr' => 17,
    'text' => '@afourpaper should only appear at the beginning of a line',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: multiple @afourpaper
',
    'line_nr' => 17,
    'text' => 'multiple @afourpaper',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: @afourlatex should only appear at the beginning of a line
',
    'line_nr' => 18,
    'text' => '@afourlatex should only appear at the beginning of a line',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: @afourwide should only appear at the beginning of a line
',
    'line_nr' => 19,
    'text' => '@afourwide should only appear at the beginning of a line',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: @paragraphindent should only appear at the beginning of a line
',
    'line_nr' => 20,
    'text' => '@paragraphindent should only appear at the beginning of a line',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: @paragraphindent should only appear at the beginning of a line
',
    'line_nr' => 21,
    'text' => '@paragraphindent should only appear at the beginning of a line',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: @paragraphindent should only appear at the beginning of a line
',
    'line_nr' => 22,
    'text' => '@paragraphindent should only appear at the beginning of a line',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: @paragraphindent should only appear at the beginning of a line
',
    'line_nr' => 23,
    'text' => '@paragraphindent should only appear at the beginning of a line',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: @firstparagraphindent should only appear at the beginning of a line
',
    'line_nr' => 24,
    'text' => '@firstparagraphindent should only appear at the beginning of a line',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: @firstparagraphindent should only appear at the beginning of a line
',
    'line_nr' => 25,
    'text' => '@firstparagraphindent should only appear at the beginning of a line',
    'type' => 'warning'
  },
  {
    'error_line' => '@firstparagraphindent arg must be `none\' or `insert\', not `3\'
',
    'line_nr' => 25,
    'text' => '@firstparagraphindent arg must be `none\' or `insert\', not `3\'',
    'type' => 'error'
  },
  {
    'error_line' => 'warning: @exampleindent should only appear at the beginning of a line
',
    'line_nr' => 26,
    'text' => '@exampleindent should only appear at the beginning of a line',
    'type' => 'warning'
  },
  {
    'error_line' => '@exampleindent arg must be numeric/`asis\', not `6 on line following exampleindent\'
',
    'line_nr' => 26,
    'text' => '@exampleindent arg must be numeric/`asis\', not `6 on line following exampleindent\'',
    'type' => 'error'
  },
  {
    'error_line' => 'warning: @exampleindent should only appear at the beginning of a line
',
    'line_nr' => 27,
    'text' => '@exampleindent should only appear at the beginning of a line',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: @footnotestyle should only appear at the beginning of a line
',
    'line_nr' => 28,
    'text' => '@footnotestyle should only appear at the beginning of a line',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: @footnotestyle should only appear at the beginning of a line
',
    'line_nr' => 29,
    'text' => '@footnotestyle should only appear at the beginning of a line',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: multiple @footnotestyle
',
    'line_nr' => 29,
    'text' => 'multiple @footnotestyle',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: @documentencoding should only appear at the beginning of a line
',
    'line_nr' => 30,
    'text' => '@documentencoding should only appear at the beginning of a line',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: encoding `US-ascii encoding name\' is not a canonical texinfo encoding
',
    'line_nr' => 30,
    'text' => 'encoding `US-ascii encoding name\' is not a canonical texinfo encoding',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: unhandled encoding name `US-ascii encoding name\'
',
    'line_nr' => 30,
    'text' => 'unhandled encoding name `US-ascii encoding name\'',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: @frenchspacing should only appear at the beginning of a line
',
    'line_nr' => 32,
    'text' => '@frenchspacing should only appear at the beginning of a line',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: @frenchspacing should only appear at the beginning of a line
',
    'line_nr' => 33,
    'text' => '@frenchspacing should only appear at the beginning of a line',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: @fonttextsize should only appear at the beginning of a line
',
    'line_nr' => 34,
    'text' => '@fonttextsize should only appear at the beginning of a line',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: @everyheadingmarks should only appear at the beginning of a line
',
    'line_nr' => 35,
    'text' => '@everyheadingmarks should only appear at the beginning of a line',
    'type' => 'warning'
  },
  {
    'error_line' => '@everyheadingmarks arg must be `top\' or `bottom\', not `bottom on line following everyheadingmarks\'
',
    'line_nr' => 35,
    'text' => '@everyheadingmarks arg must be `top\' or `bottom\', not `bottom on line following everyheadingmarks\'',
    'type' => 'error'
  },
  {
    'error_line' => 'warning: @finalout should only appear at the beginning of a line
',
    'line_nr' => 39,
    'text' => '@finalout should only appear at the beginning of a line',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: @finalout should only appear at the beginning of a line
',
    'line_nr' => 41,
    'text' => '@finalout should only appear at the beginning of a line',
    'type' => 'warning'
  }
];


$result_floats{'many_lines'} = {};


1;
