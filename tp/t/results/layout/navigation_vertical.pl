use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'navigation_vertical'} = {
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
          'contents' => [],
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
        'normalized' => 'Top'
      },
      'info' => {
        'spaces_before_argument' => {
          'text' => ' '
        }
      },
      'source_info' => {
        'file_name' => 'navigation.texi',
        'line_nr' => 3,
        'macro' => ''
      }
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'text' => 'File used for navigation testing'
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
              'extra' => {
                'menu_entry_description' => {},
                'menu_entry_node' => {
                  'node_content' => [
                    {}
                  ],
                  'normalized' => 'chapter'
                }
              },
              'source_info' => {
                'file_name' => 'navigation.texi',
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
                'file_name' => 'navigation.texi',
                'line_nr' => 8,
                'macro' => ''
              }
            }
          ],
          'source_info' => {
            'file_name' => 'navigation.texi',
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
        'file_name' => 'navigation.texi',
        'line_nr' => 4,
        'macro' => ''
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
        'normalized' => 'chapter'
      },
      'info' => {
        'spaces_before_argument' => {
          'text' => ' '
        }
      },
      'source_info' => {
        'file_name' => 'navigation.texi',
        'line_nr' => 10,
        'macro' => ''
      }
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'text' => 'First chapter'
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
                      'text' => 'section'
                    }
                  ],
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
              'extra' => {
                'menu_entry_description' => {},
                'menu_entry_node' => {
                  'node_content' => [
                    {}
                  ],
                  'normalized' => 'section'
                }
              },
              'source_info' => {
                'file_name' => 'navigation.texi',
                'line_nr' => 14,
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
                'file_name' => 'navigation.texi',
                'line_nr' => 15,
                'macro' => ''
              }
            }
          ],
          'source_info' => {
            'file_name' => 'navigation.texi',
            'line_nr' => 13,
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
        'file_name' => 'navigation.texi',
        'line_nr' => 11,
        'macro' => ''
      }
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'text' => 'section'
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
        'node_content' => [
          {}
        ],
        'nodes_manuals' => [
          {
            'node_content' => [
              {}
            ],
            'normalized' => 'section'
          }
        ],
        'normalized' => 'section'
      },
      'info' => {
        'spaces_before_argument' => {
          'text' => ' '
        }
      },
      'source_info' => {
        'file_name' => 'navigation.texi',
        'line_nr' => 17,
        'macro' => ''
      }
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'text' => 'Section in chapter'
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
      'cmdname' => 'section',
      'contents' => [
        {
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'contents' => [
            {
              'text' => 'AAAA
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
              'text' => 'AAAA
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
              'text' => 'AAAA
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
              'text' => 'AAAA
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
              'text' => 'AAAA
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
              'text' => 'AAAA
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
              'text' => 'AAAA
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
              'text' => 'AAAA
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
              'text' => 'AAAA
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
              'text' => 'AAAA
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
              'text' => 'AAAA
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
              'text' => 'AAAA
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
              'text' => 'b b b b b b b b b b b b b b b b b b b b b b b b b b b b b b b b b b b 
'
            },
            {
              'text' => 'b b b b b b b b b b b b b b b b  b b b b b bb b b b b b b  bb  b bb.
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
                      'text' => 'subsection'
                    }
                  ],
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
              'extra' => {
                'menu_entry_description' => {},
                'menu_entry_node' => {
                  'node_content' => [
                    {}
                  ],
                  'normalized' => 'subsection'
                }
              },
              'source_info' => {
                'file_name' => 'navigation.texi',
                'line_nr' => 48,
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
                'file_name' => 'navigation.texi',
                'line_nr' => 49,
                'macro' => ''
              }
            }
          ],
          'source_info' => {
            'file_name' => 'navigation.texi',
            'line_nr' => 47,
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
        'file_name' => 'navigation.texi',
        'line_nr' => 18,
        'macro' => ''
      }
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'text' => 'subsection'
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
        'node_content' => [
          {}
        ],
        'nodes_manuals' => [
          {
            'node_content' => [
              {}
            ],
            'normalized' => 'subsection'
          }
        ],
        'normalized' => 'subsection'
      },
      'info' => {
        'spaces_before_argument' => {
          'text' => ' '
        }
      },
      'source_info' => {
        'file_name' => 'navigation.texi',
        'line_nr' => 51,
        'macro' => ''
      }
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'text' => 'Sub section in section'
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
      'cmdname' => 'subsection',
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
              'type' => 'misc_arg'
            }
          ],
          'cmdname' => 'contents',
          'source_info' => {
            'file_name' => 'navigation.texi',
            'line_nr' => 54,
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
        'file_name' => 'navigation.texi',
        'line_nr' => 52,
        'macro' => ''
      }
    },
    {
      'args' => [
        {
          'text' => '
',
          'type' => 'misc_arg'
        }
      ],
      'cmdname' => 'bye'
    }
  ],
  'type' => 'document_root'
};
$result_trees{'navigation_vertical'}{'contents'}[1]{'extra'}{'node_content'}[0] = $result_trees{'navigation_vertical'}{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'navigation_vertical'}{'contents'}[1]{'extra'}{'nodes_manuals'}[0]{'node_content'}[0] = $result_trees{'navigation_vertical'}{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'navigation_vertical'}{'contents'}[2]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_description'} = $result_trees{'navigation_vertical'}{'contents'}[2]{'contents'}[1]{'contents'}[0]{'contents'}[3];
$result_trees{'navigation_vertical'}{'contents'}[2]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_node'}{'node_content'}[0] = $result_trees{'navigation_vertical'}{'contents'}[2]{'contents'}[1]{'contents'}[0]{'contents'}[1]{'contents'}[0];
$result_trees{'navigation_vertical'}{'contents'}[3]{'extra'}{'node_content'}[0] = $result_trees{'navigation_vertical'}{'contents'}[3]{'args'}[0]{'contents'}[0];
$result_trees{'navigation_vertical'}{'contents'}[3]{'extra'}{'nodes_manuals'}[0]{'node_content'}[0] = $result_trees{'navigation_vertical'}{'contents'}[3]{'args'}[0]{'contents'}[0];
$result_trees{'navigation_vertical'}{'contents'}[4]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_description'} = $result_trees{'navigation_vertical'}{'contents'}[4]{'contents'}[1]{'contents'}[0]{'contents'}[3];
$result_trees{'navigation_vertical'}{'contents'}[4]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_node'}{'node_content'}[0] = $result_trees{'navigation_vertical'}{'contents'}[4]{'contents'}[1]{'contents'}[0]{'contents'}[1]{'contents'}[0];
$result_trees{'navigation_vertical'}{'contents'}[5]{'extra'}{'node_content'}[0] = $result_trees{'navigation_vertical'}{'contents'}[5]{'args'}[0]{'contents'}[0];
$result_trees{'navigation_vertical'}{'contents'}[5]{'extra'}{'nodes_manuals'}[0]{'node_content'}[0] = $result_trees{'navigation_vertical'}{'contents'}[5]{'args'}[0]{'contents'}[0];
$result_trees{'navigation_vertical'}{'contents'}[6]{'contents'}[27]{'contents'}[0]{'extra'}{'menu_entry_description'} = $result_trees{'navigation_vertical'}{'contents'}[6]{'contents'}[27]{'contents'}[0]{'contents'}[3];
$result_trees{'navigation_vertical'}{'contents'}[6]{'contents'}[27]{'contents'}[0]{'extra'}{'menu_entry_node'}{'node_content'}[0] = $result_trees{'navigation_vertical'}{'contents'}[6]{'contents'}[27]{'contents'}[0]{'contents'}[1]{'contents'}[0];
$result_trees{'navigation_vertical'}{'contents'}[7]{'extra'}{'node_content'}[0] = $result_trees{'navigation_vertical'}{'contents'}[7]{'args'}[0]{'contents'}[0];
$result_trees{'navigation_vertical'}{'contents'}[7]{'extra'}{'nodes_manuals'}[0]{'node_content'}[0] = $result_trees{'navigation_vertical'}{'contents'}[7]{'args'}[0]{'contents'}[0];

$result_texis{'navigation_vertical'} = '\\input texinfo @c -*-texinfo-*-

@node Top
@top File used for navigation testing

@menu
* chapter::
@end menu

@node chapter
@chapter First chapter

@menu
* section::
@end menu

@node section
@section Section in chapter

AAAA

AAAA

AAAA

AAAA

AAAA

AAAA

AAAA

AAAA

AAAA

AAAA

AAAA

AAAA

b b b b b b b b b b b b b b b b b b b b b b b b b b b b b b b b b b b 
b b b b b b b b b b b b b b b b  b b b b b bb b b b b b b  bb  b bb.

@menu
* subsection::
@end menu

@node subsection
@subsection Sub section in section

@contents

@bye
';


$result_texts{'navigation_vertical'} = 'File used for navigation testing
********************************

* chapter::

1 First chapter
***************

* section::

1.1 Section in chapter
======================

AAAA

AAAA

AAAA

AAAA

AAAA

AAAA

AAAA

AAAA

AAAA

AAAA

AAAA

AAAA

b b b b b b b b b b b b b b b b b b b b b b b b b b b b b b b b b b b 
b b b b b b b b b b b b b b b b  b b b b b bb b b b b b b  bb  b bb.

* subsection::

1.1.1 Sub section in section
----------------------------


';

$result_sectioning{'navigation_vertical'} = {
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
            'info' => {},
            'structure' => {}
          }
        },
        'info' => {},
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
                  'info' => {},
                  'structure' => {}
                }
              },
              'info' => {},
              'structure' => {
                'section_childs' => [
                  {
                    'cmdname' => 'section',
                    'extra' => {
                      'associated_node' => {
                        'cmdname' => 'node',
                        'extra' => {
                          'normalized' => 'section'
                        },
                        'info' => {},
                        'structure' => {}
                      }
                    },
                    'info' => {},
                    'structure' => {
                      'section_childs' => [
                        {
                          'cmdname' => 'subsection',
                          'extra' => {
                            'associated_node' => {
                              'cmdname' => 'node',
                              'extra' => {
                                'normalized' => 'subsection'
                              },
                              'info' => {},
                              'structure' => {}
                            }
                          },
                          'info' => {},
                          'structure' => {
                            'section_level' => 3,
                            'section_number' => '1.1.1',
                            'section_up' => {}
                          }
                        }
                      ],
                      'section_level' => 2,
                      'section_number' => '1.1',
                      'section_up' => {}
                    }
                  }
                ],
                'section_level' => 1,
                'section_number' => 1,
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
$result_sectioning{'navigation_vertical'}{'structure'}{'section_childs'}[0]{'structure'}{'section_childs'}[0]{'structure'}{'section_childs'}[0]{'structure'}{'section_childs'}[0]{'structure'}{'section_up'} = $result_sectioning{'navigation_vertical'}{'structure'}{'section_childs'}[0]{'structure'}{'section_childs'}[0]{'structure'}{'section_childs'}[0];
$result_sectioning{'navigation_vertical'}{'structure'}{'section_childs'}[0]{'structure'}{'section_childs'}[0]{'structure'}{'section_childs'}[0]{'structure'}{'section_up'} = $result_sectioning{'navigation_vertical'}{'structure'}{'section_childs'}[0]{'structure'}{'section_childs'}[0];
$result_sectioning{'navigation_vertical'}{'structure'}{'section_childs'}[0]{'structure'}{'section_childs'}[0]{'structure'}{'section_up'} = $result_sectioning{'navigation_vertical'}{'structure'}{'section_childs'}[0];
$result_sectioning{'navigation_vertical'}{'structure'}{'section_childs'}[0]{'structure'}{'section_childs'}[0]{'structure'}{'toplevel_prev'} = $result_sectioning{'navigation_vertical'}{'structure'}{'section_childs'}[0];
$result_sectioning{'navigation_vertical'}{'structure'}{'section_childs'}[0]{'structure'}{'section_childs'}[0]{'structure'}{'toplevel_up'} = $result_sectioning{'navigation_vertical'}{'structure'}{'section_childs'}[0];
$result_sectioning{'navigation_vertical'}{'structure'}{'section_childs'}[0]{'structure'}{'section_up'} = $result_sectioning{'navigation_vertical'};

$result_nodes{'navigation_vertical'} = {
  'cmdname' => 'node',
  'extra' => {
    'associated_section' => {
      'cmdname' => 'top',
      'extra' => {},
      'info' => {},
      'structure' => {}
    },
    'menus' => [
      {
        'cmdname' => 'menu'
      }
    ],
    'normalized' => 'Top'
  },
  'info' => {},
  'structure' => {
    'menu_child' => {
      'cmdname' => 'node',
      'extra' => {
        'associated_section' => {
          'cmdname' => 'chapter',
          'extra' => {},
          'info' => {},
          'structure' => {
            'section_number' => 1
          }
        },
        'menus' => [
          {
            'cmdname' => 'menu'
          }
        ],
        'normalized' => 'chapter'
      },
      'info' => {},
      'structure' => {
        'menu_child' => {
          'cmdname' => 'node',
          'extra' => {
            'associated_section' => {
              'cmdname' => 'section',
              'extra' => {},
              'info' => {},
              'structure' => {
                'section_number' => '1.1'
              }
            },
            'menus' => [
              {
                'cmdname' => 'menu'
              }
            ],
            'normalized' => 'section'
          },
          'info' => {},
          'structure' => {
            'menu_child' => {
              'cmdname' => 'node',
              'extra' => {
                'associated_section' => {
                  'cmdname' => 'subsection',
                  'extra' => {},
                  'info' => {},
                  'structure' => {
                    'section_number' => '1.1.1'
                  }
                },
                'normalized' => 'subsection'
              },
              'info' => {},
              'structure' => {
                'node_up' => {}
              }
            },
            'node_up' => {}
          }
        },
        'node_prev' => {},
        'node_up' => {}
      }
    },
    'node_next' => {}
  }
};
$result_nodes{'navigation_vertical'}{'structure'}{'menu_child'}{'structure'}{'menu_child'}{'structure'}{'menu_child'}{'structure'}{'node_up'} = $result_nodes{'navigation_vertical'}{'structure'}{'menu_child'}{'structure'}{'menu_child'};
$result_nodes{'navigation_vertical'}{'structure'}{'menu_child'}{'structure'}{'menu_child'}{'structure'}{'node_up'} = $result_nodes{'navigation_vertical'}{'structure'}{'menu_child'};
$result_nodes{'navigation_vertical'}{'structure'}{'menu_child'}{'structure'}{'node_prev'} = $result_nodes{'navigation_vertical'};
$result_nodes{'navigation_vertical'}{'structure'}{'menu_child'}{'structure'}{'node_up'} = $result_nodes{'navigation_vertical'};
$result_nodes{'navigation_vertical'}{'structure'}{'node_next'} = $result_nodes{'navigation_vertical'}{'structure'}{'menu_child'};

$result_menus{'navigation_vertical'} = {
  'cmdname' => 'node',
  'extra' => {
    'normalized' => 'Top'
  },
  'info' => {},
  'structure' => {
    'menu_child' => {
      'cmdname' => 'node',
      'extra' => {
        'normalized' => 'chapter'
      },
      'info' => {},
      'structure' => {
        'menu_child' => {
          'cmdname' => 'node',
          'extra' => {
            'normalized' => 'section'
          },
          'info' => {},
          'structure' => {
            'menu_child' => {
              'cmdname' => 'node',
              'extra' => {
                'normalized' => 'subsection'
              },
              'info' => {},
              'structure' => {
                'menu_up' => {},
                'menu_up_hash' => {
                  'section' => 1
                }
              }
            },
            'menu_up' => {},
            'menu_up_hash' => {
              'chapter' => 1
            }
          }
        },
        'menu_up' => {},
        'menu_up_hash' => {
          'Top' => 1
        }
      }
    }
  }
};
$result_menus{'navigation_vertical'}{'structure'}{'menu_child'}{'structure'}{'menu_child'}{'structure'}{'menu_child'}{'structure'}{'menu_up'} = $result_menus{'navigation_vertical'}{'structure'}{'menu_child'}{'structure'}{'menu_child'};
$result_menus{'navigation_vertical'}{'structure'}{'menu_child'}{'structure'}{'menu_child'}{'structure'}{'menu_up'} = $result_menus{'navigation_vertical'}{'structure'}{'menu_child'};
$result_menus{'navigation_vertical'}{'structure'}{'menu_child'}{'structure'}{'menu_up'} = $result_menus{'navigation_vertical'};

$result_errors{'navigation_vertical'} = [];


$result_floats{'navigation_vertical'} = {};


1;
