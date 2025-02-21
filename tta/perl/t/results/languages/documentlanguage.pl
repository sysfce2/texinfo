use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'documentlanguage'} = {
  'contents' => [
    {
      'contents' => [
        {
          'contents' => [
            {
              'text' => '\\input texinfo @c -*-texinfo-*-
',
              'type' => 'text_before_beginning'
            },
            {
              'text' => '
',
              'type' => 'text_before_beginning'
            }
          ],
          'type' => 'preamble_before_beginning'
        },
        {
          'contents' => [
            {
              'cmdname' => 'c',
              'contents' => [
                {
                  'text' => ' this document is setup to detect when the documentlanguage was not
',
                  'type' => 'rawline_arg'
                }
              ]
            },
            {
              'cmdname' => 'c',
              'contents' => [
                {
                  'text' => ' set according to command line, but according to document.  This
',
                  'type' => 'rawline_arg'
                }
              ]
            },
            {
              'cmdname' => 'c',
              'contents' => [
                {
                  'text' => ' is important to test that in the Parser, as converters initialized with
',
                  'type' => 'rawline_arg'
                }
              ]
            },
            {
              'cmdname' => 'c',
              'contents' => [
                {
                  'text' => ' Texinfo::Convert::Converter converter() and with values accessed by
',
                  'type' => 'rawline_arg'
                }
              ]
            },
            {
              'cmdname' => 'c',
              'contents' => [
                {
                  'text' => ' get_conf() will use the command line.
',
                  'type' => 'rawline_arg'
                }
              ]
            },
            {
              'cmdname' => 'c',
              'contents' => [
                {
                  'text' => ' This is tricky to demonstrate, as documentlanguage is not used much
',
                  'type' => 'rawline_arg'
                }
              ]
            },
            {
              'cmdname' => 'c',
              'contents' => [
                {
                  'text' => ' in Parser.  It is used in two places to set the documentlanguage extra
',
                  'type' => 'rawline_arg'
                }
              ]
            },
            {
              'cmdname' => 'c',
              'contents' => [
                {
                  'text' => ' value, 
',
                  'type' => 'rawline_arg'
                }
              ]
            },
            {
              'cmdname' => 'c',
              'contents' => [
                {
                  'text' => ' 1) for the untranslated type, for the prefix of @def* and 
',
                  'type' => 'rawline_arg'
                }
              ]
            },
            {
              'cmdname' => 'c',
              'contents' => [
                {
                  'text' => ' 2) for the @def* line commands with added index entries that need to 
',
                  'type' => 'rawline_arg'
                }
              ]
            },
            {
              'cmdname' => 'c',
              'contents' => [
                {
                  'text' => '    be translated, like \'{name} of {class}\'.
',
                  'type' => 'rawline_arg'
                }
              ]
            },
            {
              'cmdname' => 'c',
              'contents' => [
                {
                  'text' => ' The untranslated type is in general translated in the converters
',
                  'type' => 'rawline_arg'
                }
              ]
            },
            {
              'cmdname' => 'c',
              'contents' => [
                {
                  'text' => ' without using the extra documentlanguage key value, so getting it 
',
                  'type' => 'rawline_arg'
                }
              ]
            },
            {
              'cmdname' => 'c',
              'contents' => [
                {
                  'text' => ' wrong does not have any consequence.
',
                  'type' => 'rawline_arg'
                }
              ]
            },
            {
              'cmdname' => 'c',
              'contents' => [
                {
                  'text' => ' The @def* translated added indices are translated relatively early,
',
                  'type' => 'rawline_arg'
                }
              ]
            },
            {
              'cmdname' => 'c',
              'contents' => [
                {
                  'text' => ' before the converter, and the extra documentlanguage key is used to
',
                  'type' => 'rawline_arg'
                }
              ]
            },
            {
              'cmdname' => 'c',
              'contents' => [
                {
                  'text' => ' get the language, so if the wrong language is set, it will show up
',
                  'type' => 'rawline_arg'
                }
              ]
            },
            {
              'cmdname' => 'c',
              'contents' => [
                {
                  'text' => ' in the index generated by @printindex.
',
                  'type' => 'rawline_arg'
                }
              ]
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
                      'text' => 'pt'
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
                'text_arg' => 'pt'
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'file_name' => 'documentlanguage.texi',
                'line_nr' => 22
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
        'file_name' => 'documentlanguage.texi',
        'line_nr' => 24
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
        'file_name' => 'documentlanguage.texi',
        'line_nr' => 25
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
        'isindex' => 1,
        'normalized' => 'chapter'
      },
      'info' => {
        'spaces_before_argument' => {
          'text' => ' '
        }
      },
      'source_info' => {
        'file_name' => 'documentlanguage.texi',
        'line_nr' => 27
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
              'cmdname' => 'xref',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'chapter'
                    }
                  ],
                  'extra' => {
                    'node_content' => {
                      'contents' => [
                        {}
                      ]
                    },
                    'normalized' => 'chapter'
                  },
                  'type' => 'brace_arg'
                }
              ],
              'source_info' => {
                'file_name' => 'documentlanguage.texi',
                'line_nr' => 30
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
          'cmdname' => 'deftypemethod',
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
                              'text' => 'Method',
                              'type' => 'untranslated'
                            }
                          ],
                          'extra' => {
                            'documentlanguage' => 'pt',
                            'translation_context' => 'category of methods with data type in object-oriented programming for @deftypemethod'
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
                              'text' => 'class'
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
                              'text' => 'data-type'
                            }
                          ],
                          'type' => 'def_line_arg'
                        }
                      ],
                      'type' => 'def_type'
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
                              'text' => 'name'
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
                              'text' => 'arguments'
                            }
                          ],
                          'type' => 'def_line_arg'
                        }
                      ],
                      'type' => 'def_typearg'
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
                'def_command' => 'deftypemethod',
                'def_index_element' => {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'contents' => [
                            {
                              'text' => 'name'
                            }
                          ],
                          'type' => 'def_line_arg'
                        }
                      ],
                      'type' => 'def_name'
                    },
                    {
                      'text' => ' na '
                    },
                    {
                      'contents' => [
                        {
                          'contents' => [
                            {
                              'text' => 'class'
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
                              'text' => 'name'
                            }
                          ],
                          'type' => 'def_line_arg'
                        }
                      ],
                      'type' => 'def_name'
                    },
                    {
                      'text' => ' on '
                    },
                    {
                      'contents' => [
                        {
                          'contents' => [
                            {
                              'text' => 'class'
                            }
                          ],
                          'type' => 'def_line_arg'
                        }
                      ],
                      'type' => 'def_class'
                    }
                  ]
                },
                'documentlanguage' => 'pt',
                'element_node' => {},
                'index_entry' => [
                  'fn',
                  1
                ],
                'original_def_cmdname' => 'deftypemethod'
              },
              'source_info' => {
                'file_name' => 'documentlanguage.texi',
                'line_nr' => 32
              },
              'type' => 'def_line'
            },
            {
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'Some text.
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
                      'text' => 'deftypemethod'
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
                'text_arg' => 'deftypemethod'
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'file_name' => 'documentlanguage.texi',
                'line_nr' => 34
              }
            }
          ],
          'info' => {
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'file_name' => 'documentlanguage.texi',
            'line_nr' => 32
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
            'file_name' => 'documentlanguage.texi',
            'line_nr' => 36
          }
        },
        {
          'text' => '
',
          'type' => 'empty_line'
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
        'file_name' => 'documentlanguage.texi',
        'line_nr' => 28
      }
    },
    {
      'cmdname' => 'bye',
      'contents' => [
        {
          'text' => '
',
          'type' => 'rawline_arg'
        }
      ]
    }
  ],
  'type' => 'document_root'
};
$result_trees{'documentlanguage'}{'contents'}[4]{'contents'}[2]{'contents'}[0]{'contents'}[0]{'extra'}{'node_content'}{'contents'}[0] = $result_trees{'documentlanguage'}{'contents'}[4]{'contents'}[2]{'contents'}[0]{'contents'}[0]{'contents'}[0];
$result_trees{'documentlanguage'}{'contents'}[4]{'contents'}[4]{'contents'}[0]{'extra'}{'element_node'} = $result_trees{'documentlanguage'}{'contents'}[3];

$result_texis{'documentlanguage'} = '\\input texinfo @c -*-texinfo-*-

@c this document is setup to detect when the documentlanguage was not
@c set according to command line, but according to document.  This
@c is important to test that in the Parser, as converters initialized with
@c Texinfo::Convert::Converter converter() and with values accessed by
@c get_conf() will use the command line.
@c This is tricky to demonstrate, as documentlanguage is not used much
@c in Parser.  It is used in two places to set the documentlanguage extra
@c value, 
@c 1) for the untranslated type, for the prefix of @def* and 
@c 2) for the @def* line commands with added index entries that need to 
@c    be translated, like \'{name} of {class}\'.
@c The untranslated type is in general translated in the converters
@c without using the extra documentlanguage key value, so getting it 
@c wrong does not have any consequence.
@c The @def* translated added indices are translated relatively early,
@c before the converter, and the extra documentlanguage key is used to
@c get the language, so if the wrong language is set, it will show up
@c in the index generated by @printindex.

@documentlanguage pt

@node Top
@top top section

@node chapter
@chapter Chapter

@xref{chapter}.

@deftypemethod class data-type name arguments
Some text.
@end deftypemethod

@printindex fn

@bye
';


$result_texts{'documentlanguage'} = '

top section
***********

1 Chapter
*********

chapter.

Método on class: data-type name arguments
Some text.


';

$result_sectioning{'documentlanguage'} = {
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
$result_sectioning{'documentlanguage'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[0]{'extra'}{'section_directions'}{'up'} = $result_sectioning{'documentlanguage'}{'extra'}{'section_childs'}[0];
$result_sectioning{'documentlanguage'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[0]{'extra'}{'toplevel_directions'}{'prev'} = $result_sectioning{'documentlanguage'}{'extra'}{'section_childs'}[0];
$result_sectioning{'documentlanguage'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[0]{'extra'}{'toplevel_directions'}{'up'} = $result_sectioning{'documentlanguage'}{'extra'}{'section_childs'}[0];
$result_sectioning{'documentlanguage'}{'extra'}{'section_childs'}[0]{'extra'}{'sectioning_root'} = $result_sectioning{'documentlanguage'};

$result_nodes{'documentlanguage'} = [
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
            'normalized' => 'chapter'
          }
        }
      },
      'normalized' => 'Top'
    }
  },
  {}
];
$result_nodes{'documentlanguage'}[0]{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'prev'} = $result_nodes{'documentlanguage'}[0];
$result_nodes{'documentlanguage'}[0]{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'up'} = $result_nodes{'documentlanguage'}[0];
$result_nodes{'documentlanguage'}[1] = $result_nodes{'documentlanguage'}[0]{'extra'}{'node_directions'}{'next'};

$result_menus{'documentlanguage'} = [
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

$result_errors{'documentlanguage'} = [];


$result_floats{'documentlanguage'} = {};


$result_indices_sort_strings{'documentlanguage'} = {
  'fn' => [
    'name na class'
  ]
};


1;
