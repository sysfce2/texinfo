use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'printindex_index_entry_in_copying'} = {
  'contents' => [
    {
      'contents' => [
        {
          'contents' => [
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
              'cmdname' => 'copying',
              'contents' => [
                {
                  'text' => '
',
                  'type' => 'empty_line'
                },
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'text' => 'Copying this document'
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
                  'cmdname' => 'findex',
                  'extra' => {
                    'element_region' => 'copying',
                    'index_entry' => [
                      'fn',
                      1
                    ]
                  },
                  'info' => {
                    'command_name' => 'findex',
                    'spaces_before_argument' => {
                      'text' => ' '
                    }
                  },
                  'source_info' => {
                    'line_nr' => 3
                  },
                  'type' => 'index_entry_command'
                },
                {
                  'text' => '
',
                  'type' => 'empty_line'
                },
                {
                  'cmdname' => 'defun',
                  'contents' => [
                    {
                      'args' => [
                        {
                          'contents' => [
                            {
                              'contents' => [
                                {
                                  'contents' => [
                                    {
                                      'text' => 'Function'
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
                                      'text' => 'fun'
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
                                      'text' => 'arg'
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
                        'def_command' => 'defun',
                        'def_index_element' => {},
                        'element_region' => 'copying',
                        'index_entry' => [
                          'fn',
                          2
                        ],
                        'original_def_cmdname' => 'defun'
                      },
                      'source_info' => {
                        'line_nr' => 5
                      },
                      'type' => 'def_line'
                    },
                    {
                      'args' => [
                        {
                          'contents' => [
                            {
                              'contents' => [
                                {
                                  'contents' => [
                                    {
                                      'text' => 'Function'
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
                                      'text' => 'xf'
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
                                      'text' => 'arg'
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
                          'type' => 'line_arg'
                        }
                      ],
                      'cmdname' => 'defunx',
                      'extra' => {
                        'def_command' => 'defun',
                        'def_index_element' => {},
                        'element_region' => 'copying',
                        'index_entry' => [
                          'fn',
                          3
                        ],
                        'original_def_cmdname' => 'defunx'
                      },
                      'info' => {
                        'spaces_before_argument' => {
                          'text' => ' '
                        }
                      },
                      'source_info' => {
                        'line_nr' => 6
                      },
                      'type' => 'def_line'
                    },
                    {
                      'contents' => [
                        {
                          'contents' => [
                            {
                              'text' => 'Defun
'
                            }
                          ],
                          'type' => 'paragraph'
                        }
                      ],
                      'type' => 'def_item'
                    },
                    {
                      'args' => [
                        {
                          'contents' => [
                            {
                              'text' => 'defun'
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
                        'text_arg' => 'defun'
                      },
                      'info' => {
                        'spaces_before_argument' => {
                          'text' => ' '
                        }
                      },
                      'source_info' => {
                        'line_nr' => 8
                      }
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
                  'text' => '
',
                  'type' => 'empty_line'
                },
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'cmdname' => 'asis',
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
                      'type' => 'block_line_arg'
                    }
                  ],
                  'cmdname' => 'ftable',
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'contents' => [
                            {
                              'args' => [
                                {
                                  'contents' => [
                                    {
                                      'text' => 'ftable item'
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
                              'cmdname' => 'item',
                              'extra' => {
                                'element_region' => 'copying',
                                'index_entry' => [
                                  'fn',
                                  4
                                ]
                              },
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
                              'args' => [
                                {
                                  'contents' => [
                                    {
                                      'text' => 'xftable xitem'
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
                              'cmdname' => 'itemx',
                              'extra' => {
                                'element_region' => 'copying',
                                'index_entry' => [
                                  'fn',
                                  5
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
                            }
                          ],
                          'type' => 'table_term'
                        }
                      ],
                      'type' => 'table_entry'
                    },
                    {
                      'args' => [
                        {
                          'contents' => [
                            {
                              'text' => 'ftable'
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
                        'text_arg' => 'ftable'
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
                  'extra' => {
                    'command_as_argument' => {}
                  },
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
                  'text' => '
',
                  'type' => 'empty_line'
                },
                {
                  'args' => [
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
                  'cmdname' => 'printindex',
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
                    'line_nr' => 15
                  }
                },
                {
                  'text' => '
',
                  'type' => 'empty_line'
                },
                {
                  'args' => [
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
                  'cmdname' => 'end',
                  'extra' => {
                    'text_arg' => 'copying'
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
        'line_nr' => 19
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
        },
        {
          'contents' => [
            {
              'text' => 'Top.
'
            }
          ],
          'type' => 'paragraph'
        },
        {
          'args' => [
            {
              'text' => '
',
              'type' => 'rawline_arg'
            }
          ],
          'cmdname' => 'insertcopying',
          'extra' => {},
          'source_info' => {
            'line_nr' => 23
          }
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
                'line_nr' => 26
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
                'line_nr' => 27
              }
            }
          ],
          'source_info' => {
            'line_nr' => 25
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
        'line_nr' => 20
      }
    },
    {
      'args' => [
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
      'cmdname' => 'node',
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
        'line_nr' => 29
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
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'args' => [
            {
              'text' => '
',
              'type' => 'rawline_arg'
            }
          ],
          'cmdname' => 'insertcopying',
          'extra' => {},
          'source_info' => {
            'line_nr' => 32
          }
        },
        {
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'args' => [
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
          'cmdname' => 'printindex',
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
            'line_nr' => 34
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
        'line_nr' => 30
      }
    }
  ],
  'type' => 'document_root'
};
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'contents'}[3]{'contents'}[0]{'extra'}{'def_index_element'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'contents'}[3]{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'contents'}[3]{'contents'}[1]{'extra'}{'def_index_element'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'contents'}[3]{'contents'}[1]{'args'}[0]{'contents'}[2];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'contents'}[5]{'extra'}{'command_as_argument'} = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'contents'}[5]{'args'}[0]{'contents'}[0];
$result_trees{'printindex_index_entry_in_copying'}{'contents'}[2]{'contents'}[4]{'contents'}[0]{'contents'}[1]{'extra'}{'node_content'}{'contents'}[0] = $result_trees{'printindex_index_entry_in_copying'}{'contents'}[2]{'contents'}[4]{'contents'}[0]{'contents'}[1]{'contents'}[0];

$result_texis{'printindex_index_entry_in_copying'} = '@copying

@findex Copying this document

@defun fun arg
@defunx xf arg
Defun
@end defun

@ftable @asis
@item ftable item
@itemx xftable xitem
@end ftable

@printindex fn

@end copying

@node Top
@top top

Top.
@insertcopying

@menu
* chapter::
@end menu

@node chapter
@chapter Chapter

@insertcopying

@printindex fn

';


$result_texts{'printindex_index_entry_in_copying'} = '
top
***

Top.

* chapter::

1 Chapter
*********



';

$result_sectioning{'printindex_index_entry_in_copying'} = {
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
$result_sectioning{'printindex_index_entry_in_copying'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[0]{'extra'}{'section_directions'}{'up'} = $result_sectioning{'printindex_index_entry_in_copying'}{'extra'}{'section_childs'}[0];
$result_sectioning{'printindex_index_entry_in_copying'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[0]{'extra'}{'toplevel_directions'}{'prev'} = $result_sectioning{'printindex_index_entry_in_copying'}{'extra'}{'section_childs'}[0];
$result_sectioning{'printindex_index_entry_in_copying'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[0]{'extra'}{'toplevel_directions'}{'up'} = $result_sectioning{'printindex_index_entry_in_copying'}{'extra'}{'section_childs'}[0];
$result_sectioning{'printindex_index_entry_in_copying'}{'extra'}{'section_childs'}[0]{'extra'}{'sectioning_root'} = $result_sectioning{'printindex_index_entry_in_copying'};

$result_nodes{'printindex_index_entry_in_copying'} = [
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
$result_nodes{'printindex_index_entry_in_copying'}[0]{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'prev'} = $result_nodes{'printindex_index_entry_in_copying'}[0];
$result_nodes{'printindex_index_entry_in_copying'}[0]{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'up'} = $result_nodes{'printindex_index_entry_in_copying'}[0];
$result_nodes{'printindex_index_entry_in_copying'}[1] = $result_nodes{'printindex_index_entry_in_copying'}[0]{'extra'}{'node_directions'}{'next'};

$result_menus{'printindex_index_entry_in_copying'} = [
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
      'normalized' => 'chapter'
    }
  }
];
$result_menus{'printindex_index_entry_in_copying'}[1]{'extra'}{'menu_directions'}{'up'} = $result_menus{'printindex_index_entry_in_copying'}[0];

$result_errors{'printindex_index_entry_in_copying'} = [];


$result_floats{'printindex_index_entry_in_copying'} = {};


$result_indices_sort_strings{'printindex_index_entry_in_copying'} = {
  'fn' => [
    'Copying this document',
    'ftable item',
    'fun',
    'xf',
    'xftable xitem'
  ]
};



$result_converted{'info'}->{'printindex_index_entry_in_copying'} = 'This is , produced from .

 -- Function: fun arg
 -- Function: xf arg
     Defun

ftable item
xftable xitem


File: ,  Node: Top,  Next: chapter,  Up: (dir)

top
***

Top.

 -- Function: fun arg
 -- Function: xf arg
     Defun

ftable item
xftable xitem

 [index ]
* Menu:

* Copying this document:                 Top.                  (line  8)
* ftable item:                           Top.                  (line 12)
* fun:                                   Top.                  (line  8)
* xf:                                    Top.                  (line  9)
* xftable xitem:                         Top.                  (line 13)

* Menu:

* chapter::


File: ,  Node: chapter,  Prev: Top,  Up: Top

1 Chapter
*********

 -- Function: fun arg
 -- Function: xf arg
     Defun

ftable item
xftable xitem

 [index ]
* Menu:

* Copying this document:                 chapter.              (line  6)
* ftable item:                           chapter.              (line 10)
* fun:                                   chapter.              (line  6)
* xf:                                    chapter.              (line  7)
* xftable xitem:                         chapter.              (line 11)

 [index ]
* Menu:

* Copying this document:                 chapter.              (line  6)
* ftable item:                           chapter.              (line 10)
* fun:                                   chapter.              (line  6)
* xf:                                    chapter.              (line  7)
* xftable xitem:                         chapter.              (line 11)


Tag Table:
Node: Top109
Node: chapter665

End Tag Table


Local Variables:
coding: utf-8
End:
';


$result_converted{'plaintext'}->{'printindex_index_entry_in_copying'} = 'top
***

Top.

 -- Function: fun arg
 -- Function: xf arg
     Defun

ftable item
xftable xitem

* Menu:

* Copying this document:                 Top.                  (line  5)
* ftable item:                           Top.                  (line  9)
* fun:                                   Top.                  (line  5)
* xf:                                    Top.                  (line  6)
* xftable xitem:                         Top.                  (line 10)

1 Chapter
*********

 -- Function: fun arg
 -- Function: xf arg
     Defun

ftable item
xftable xitem

* Menu:

* Copying this document:                 chapter.              (line 23)
* ftable item:                           chapter.              (line 27)
* fun:                                   chapter.              (line 23)
* xf:                                    chapter.              (line 24)
* xftable xitem:                         chapter.              (line 28)

* Menu:

* Copying this document:                 chapter.              (line 23)
* ftable item:                           chapter.              (line 27)
* fun:                                   chapter.              (line 23)
* xf:                                    chapter.              (line 24)
* xftable xitem:                         chapter.              (line 28)

';


$result_converted{'html_text'}->{'printindex_index_entry_in_copying'} = '
<div class="top-level-extent" id="Top">
<div class="nav-panel">
<p>
[<a href="#Top" title="Index" rel="index">Index</a>]</p>
</div>
<h1 class="top" id="top"><span>top<a class="copiable-link" href="#top"> &para;</a></span></h1>

<p>Top.
</p>
<a class="index-entry-id" id="index-copying-Copying-this-document"></a>

<dl class="first-deffn first-defun-alias-first-deffn def-block">
<dt class="deffn defun-alias-deffn def-line" id="index-copying-fun"><span class="category-def">Function: </span><span><strong class="def-name">fun</strong> <var class="def-var-arguments">arg</var><a class="copiable-link" href="#index-copying-fun"> &para;</a></span></dt>
<dt class="deffnx defunx-alias-deffnx def-cmd-deffn def-line" id="index-copying-xf"><span class="category-def">Function: </span><span><strong class="def-name">xf</strong> <var class="def-var-arguments">arg</var><a class="copiable-link" href="#index-copying-xf"> &para;</a></span></dt>
<dd><p>Defun
</p></dd></dl>

<dl class="ftable">
<dt><a id="index-copying-ftable-item"></a><span>ftable item<a class="copiable-link" href="#index-copying-ftable-item"> &para;</a></span></dt>
<dt><a id="index-copying-xftable-xitem"></a><span>xftable xitem<a class="copiable-link" href="#index-copying-xftable-xitem"> &para;</a></span></dt>
</dl>

<div class="printindex fn-printindex">
<table class="fn-letters-header-printindex"><tr><th>Jump to: &nbsp; </th><td><a class="summary-letter-printindex" href="#Top_fn_letter-C"><b>C</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#Top_fn_letter-F"><b>F</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#Top_fn_letter-X"><b>X</b></a>
 &nbsp; 
</td></tr></table>
<table class="fn-entries-printindex">
<tr><td></td><th class="entries-header-printindex">Index Entry</th><th class="sections-header-printindex">Section</th></tr>
<tr><td colspan="3"><hr></td></tr>
<tr><th id="Top_fn_letter-C">C</th></tr>
<tr><td></td><td class="printindex-index-entry"><a href="#index-copying-Copying-this-document"><code>Copying this document</code></a></td><td class="printindex-index-section"><a href="#Top">Top</a></td></tr>
<tr><td colspan="3"><hr></td></tr>
<tr><th id="Top_fn_letter-F">F</th></tr>
<tr><td></td><td class="printindex-index-entry"><a href="#index-copying-ftable-item"><code>ftable item</code></a></td><td class="printindex-index-section"><a href="#Top">Top</a></td></tr>
<tr><td></td><td class="printindex-index-entry"><a href="#index-copying-fun"><code>fun</code></a></td><td class="printindex-index-section"><a href="#Top">Top</a></td></tr>
<tr><td colspan="3"><hr></td></tr>
<tr><th id="Top_fn_letter-X">X</th></tr>
<tr><td></td><td class="printindex-index-entry"><a href="#index-copying-xf"><code>xf</code></a></td><td class="printindex-index-section"><a href="#Top">Top</a></td></tr>
<tr><td></td><td class="printindex-index-entry"><a href="#index-copying-xftable-xitem"><code>xftable xitem</code></a></td><td class="printindex-index-section"><a href="#Top">Top</a></td></tr>
<tr><td colspan="3"><hr></td></tr>
</table>
<table class="fn-letters-footer-printindex"><tr><th>Jump to: &nbsp; </th><td><a class="summary-letter-printindex" href="#Top_fn_letter-C"><b>C</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#Top_fn_letter-F"><b>F</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#Top_fn_letter-X"><b>X</b></a>
 &nbsp; 
</td></tr></table>
</div>



<ul class="mini-toc">
<li><a href="#chapter" accesskey="1">Chapter</a></li>
</ul>
<hr>
<div class="chapter-level-extent" id="chapter">
<div class="nav-panel">
<p>
[<a href="#Top" title="Index" rel="index">Index</a>]</p>
</div>
<h2 class="chapter" id="Chapter"><span>1 Chapter<a class="copiable-link" href="#Chapter"> &para;</a></span></h2>


<a class="index-entry-id" id="index-copying-Copying-this-document"></a>

<dl class="first-deffn first-defun-alias-first-deffn def-block">
<dt class="deffn defun-alias-deffn def-line" id="index-copying-fun"><span class="category-def">Function: </span><span><strong class="def-name">fun</strong> <var class="def-var-arguments">arg</var><a class="copiable-link" href="#index-copying-fun"> &para;</a></span></dt>
<dt class="deffnx defunx-alias-deffnx def-cmd-deffn def-line" id="index-copying-xf"><span class="category-def">Function: </span><span><strong class="def-name">xf</strong> <var class="def-var-arguments">arg</var><a class="copiable-link" href="#index-copying-xf"> &para;</a></span></dt>
<dd><p>Defun
</p></dd></dl>

<dl class="ftable">
<dt><a id="index-copying-ftable-item"></a><span>ftable item<a class="copiable-link" href="#index-copying-ftable-item"> &para;</a></span></dt>
<dt><a id="index-copying-xftable-xitem"></a><span>xftable xitem<a class="copiable-link" href="#index-copying-xftable-xitem"> &para;</a></span></dt>
</dl>

<div class="printindex fn-printindex">
<table class="fn-letters-header-printindex"><tr><th>Jump to: &nbsp; </th><td><a class="summary-letter-printindex" href="#chapter_fn_letter-C"><b>C</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#chapter_fn_letter-F"><b>F</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#chapter_fn_letter-X"><b>X</b></a>
 &nbsp; 
</td></tr></table>
<table class="fn-entries-printindex">
<tr><td></td><th class="entries-header-printindex">Index Entry</th><th class="sections-header-printindex">Section</th></tr>
<tr><td colspan="3"><hr></td></tr>
<tr><th id="chapter_fn_letter-C">C</th></tr>
<tr><td></td><td class="printindex-index-entry"><a href="#index-copying-Copying-this-document"><code>Copying this document</code></a></td><td class="printindex-index-section"><a href="#Top">Top</a></td></tr>
<tr><td colspan="3"><hr></td></tr>
<tr><th id="chapter_fn_letter-F">F</th></tr>
<tr><td></td><td class="printindex-index-entry"><a href="#index-copying-ftable-item"><code>ftable item</code></a></td><td class="printindex-index-section"><a href="#Top">Top</a></td></tr>
<tr><td></td><td class="printindex-index-entry"><a href="#index-copying-fun"><code>fun</code></a></td><td class="printindex-index-section"><a href="#Top">Top</a></td></tr>
<tr><td colspan="3"><hr></td></tr>
<tr><th id="chapter_fn_letter-X">X</th></tr>
<tr><td></td><td class="printindex-index-entry"><a href="#index-copying-xf"><code>xf</code></a></td><td class="printindex-index-section"><a href="#Top">Top</a></td></tr>
<tr><td></td><td class="printindex-index-entry"><a href="#index-copying-xftable-xitem"><code>xftable xitem</code></a></td><td class="printindex-index-section"><a href="#Top">Top</a></td></tr>
<tr><td colspan="3"><hr></td></tr>
</table>
<table class="fn-letters-footer-printindex"><tr><th>Jump to: &nbsp; </th><td><a class="summary-letter-printindex" href="#chapter_fn_letter-C"><b>C</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#chapter_fn_letter-F"><b>F</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#chapter_fn_letter-X"><b>X</b></a>
 &nbsp; 
</td></tr></table>
</div>


<div class="printindex fn-printindex">
<table class="fn-letters-header-printindex"><tr><th>Jump to: &nbsp; </th><td><a class="summary-letter-printindex" href="#chapter_fn_letter-C"><b>C</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#chapter_fn_letter-F"><b>F</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#chapter_fn_letter-X"><b>X</b></a>
 &nbsp; 
</td></tr></table>
<table class="fn-entries-printindex">
<tr><td></td><th class="entries-header-printindex">Index Entry</th><th class="sections-header-printindex">Section</th></tr>
<tr><td colspan="3"><hr></td></tr>
<tr><th id="chapter_fn_letter-C">C</th></tr>
<tr><td></td><td class="printindex-index-entry"><a href="#index-copying-Copying-this-document"><code>Copying this document</code></a></td><td class="printindex-index-section"><a href="#Top">Top</a></td></tr>
<tr><td colspan="3"><hr></td></tr>
<tr><th id="chapter_fn_letter-F">F</th></tr>
<tr><td></td><td class="printindex-index-entry"><a href="#index-copying-ftable-item"><code>ftable item</code></a></td><td class="printindex-index-section"><a href="#Top">Top</a></td></tr>
<tr><td></td><td class="printindex-index-entry"><a href="#index-copying-fun"><code>fun</code></a></td><td class="printindex-index-section"><a href="#Top">Top</a></td></tr>
<tr><td colspan="3"><hr></td></tr>
<tr><th id="chapter_fn_letter-X">X</th></tr>
<tr><td></td><td class="printindex-index-entry"><a href="#index-copying-xf"><code>xf</code></a></td><td class="printindex-index-section"><a href="#Top">Top</a></td></tr>
<tr><td></td><td class="printindex-index-entry"><a href="#index-copying-xftable-xitem"><code>xftable xitem</code></a></td><td class="printindex-index-section"><a href="#Top">Top</a></td></tr>
<tr><td colspan="3"><hr></td></tr>
</table>
<table class="fn-letters-footer-printindex"><tr><th>Jump to: &nbsp; </th><td><a class="summary-letter-printindex" href="#chapter_fn_letter-C"><b>C</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#chapter_fn_letter-F"><b>F</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#chapter_fn_letter-X"><b>X</b></a>
 &nbsp; 
</td></tr></table>
</div>

</div>
</div>
';


$result_converted{'xml'}->{'printindex_index_entry_in_copying'} = '<copying endspaces=" ">

<findex index="fn" spaces=" "><indexterm index="fn" number="1">Copying this document</indexterm></findex>

<defun spaces=" " endspaces=" "><definitionterm><indexterm index="fn" number="2">fun</indexterm><defcategory automatic="on">Function</defcategory> <deffunction>fun</deffunction> <defparam>arg</defparam></definitionterm>
<defunx spaces=" "><definitionterm><indexterm index="fn" number="3">xf</indexterm><defcategory automatic="on">Function</defcategory> <deffunction>xf</deffunction> <defparam>arg</defparam></definitionterm></defunx>
<definitionitem><para>Defun
</para></definitionitem></defun>

<ftable commandarg="asis" spaces=" " endspaces=" ">
<tableentry><tableterm><item spaces=" "><itemformat command="asis"><indexterm index="fn" number="4">ftable item</indexterm>ftable item</itemformat></item>
<itemx spaces=" "><itemformat command="asis"><indexterm index="fn" number="5">xftable xitem</indexterm>xftable xitem</itemformat></itemx>
</tableterm></tableentry></ftable>

<printindex spaces=" " value="fn" line="fn"></printindex>

</copying>

<node name="Top" spaces=" "><nodename>Top</nodename><nodenext automatic="on">chapter</nodenext></node>
<top spaces=" "><sectiontitle>top</sectiontitle>

<para>Top.
</para><insertcopying></insertcopying>

<menu endspaces=" ">
<menuentry><menuleadingtext>* </menuleadingtext><menunode>chapter</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry></menu>

</top>
<node name="chapter" spaces=" "><nodename>chapter</nodename><nodeprev automatic="on">Top</nodeprev><nodeup automatic="on">Top</nodeup></node>
<chapter spaces=" "><sectiontitle>Chapter</sectiontitle>

<insertcopying></insertcopying>

<printindex spaces=" " value="fn" line="fn"></printindex>

</chapter>
';

1;
