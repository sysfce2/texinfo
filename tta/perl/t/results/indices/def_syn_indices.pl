use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'def_syn_indices'} = {
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
                      'text' => 'cp fn'
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
                  'cp',
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
                  'text' => 'Chapter index'
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
        'normalized' => 'Chapter-index'
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
                  'text' => 'Index'
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
              'text' => 'definedx truc
'
            },
            {
              'cmdname' => 'defindex',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'truc'
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
                  'truc'
                ]
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
              'text' => 'after
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
          'cmdname' => 'trucindex',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'index truc'
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
              'truc',
              1
            ]
          },
          'info' => {
            'command_name' => 'trucindex',
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
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'cmdname' => 'defcodeindex',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'codeidx'
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
              'codeidx'
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
          'cmdname' => 'codeidxindex',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'a '
                },
                {
                  'cmdname' => 'var',
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'index entry'
                        }
                      ],
                      'type' => 'brace_container'
                    }
                  ],
                  'source_info' => {
                    'line_nr' => 17
                  }
                },
                {
                  'text' => ' t'
                },
                {
                  'cmdname' => '~',
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'e'
                        }
                      ],
                      'type' => 'following_arg'
                    }
                  ],
                  'source_info' => {
                    'line_nr' => 17
                  }
                },
                {
                  'text' => ' '
                },
                {
                  'cmdname' => '^',
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'cmdname' => 'dotless',
                          'contents' => [
                            {
                              'contents' => [
                                {
                                  'text' => 'i'
                                }
                              ],
                              'type' => 'brace_container'
                            }
                          ],
                          'source_info' => {
                            'line_nr' => 17
                          }
                        }
                      ],
                      'type' => 'brace_container'
                    }
                  ],
                  'source_info' => {
                    'line_nr' => 17
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
              'codeidx',
              1
            ]
          },
          'info' => {
            'command_name' => 'codeidxindex',
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'line_nr' => 17
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
                  'text' => 'cindex entry'
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
            ]
          },
          'info' => {
            'command_name' => 'cindex',
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'line_nr' => 19
          },
          'type' => 'index_entry_command'
        },
        {
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'cmdname' => 'syncodeindex',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'ky pg'
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
              'ky',
              'pg'
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
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'cmdname' => 'kindex',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'truc kindex'
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
              'ky',
              1
            ]
          },
          'info' => {
            'command_name' => 'kindex',
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'line_nr' => 23
          },
          'type' => 'index_entry_command'
        },
        {
          'cmdname' => 'pindex',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'pindex codeidx'
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
              'pg',
              1
            ]
          },
          'info' => {
            'command_name' => 'pindex',
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'line_nr' => 24
          },
          'type' => 'index_entry_command'
        },
        {
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'cmdname' => 'synindex',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'truc cp'
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
              'truc',
              'cp'
            ]
          },
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
                  'text' => 'abc'
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
              'abc'
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
          'cmdname' => 'defindex',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'defg'
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
              'defg'
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
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'cmdname' => 'synindex',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'abc defg'
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
              'abc',
              'defg'
            ]
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
          'cmdname' => 'synindex',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'defg ky'
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
              'defg',
              'ky'
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
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'cmdname' => 'defgindex',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'defg index entry'
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
              'defg',
              1
            ]
          },
          'info' => {
            'command_name' => 'defgindex',
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'line_nr' => 34
          },
          'type' => 'index_entry_command'
        },
        {
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'cmdname' => 'abcindex',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'abc index entry'
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
              'abc',
              1
            ]
          },
          'info' => {
            'command_name' => 'abcindex',
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'line_nr' => 36
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
              'text' => 'pg
'
            }
          ],
          'type' => 'paragraph'
        },
        {
          'cmdname' => 'printindex',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'pg'
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
              'pg'
            ]
          },
          'info' => {
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'line_nr' => 39
          }
        },
        {
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'contents' => [
            {
              'text' => 'ky
'
            }
          ],
          'type' => 'paragraph'
        },
        {
          'cmdname' => 'printindex',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'ky'
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
              'ky'
            ]
          },
          'info' => {
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'line_nr' => 42
          }
        },
        {
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'contents' => [
            {
              'text' => 'truc
'
            }
          ],
          'type' => 'paragraph'
        },
        {
          'cmdname' => 'printindex',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'truc'
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
              'truc'
            ]
          },
          'info' => {
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'line_nr' => 45
          }
        },
        {
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'contents' => [
            {
              'text' => 'value truc
'
            }
          ],
          'type' => 'paragraph'
        },
        {
          'cmdname' => 'printindex',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'truc'
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
              'truc'
            ]
          },
          'info' => {
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'line_nr' => 48
          }
        },
        {
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'contents' => [
            {
              'text' => 'cp
'
            }
          ],
          'type' => 'paragraph'
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
            'line_nr' => 51
          }
        },
        {
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'contents' => [
            {
              'text' => 'value cp
'
            }
          ],
          'type' => 'paragraph'
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
            'line_nr' => 54
          }
        },
        {
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'contents' => [
            {
              'text' => 'defg
'
            }
          ],
          'type' => 'paragraph'
        },
        {
          'cmdname' => 'printindex',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'defg'
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
              'defg'
            ]
          },
          'info' => {
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'line_nr' => 57
          }
        },
        {
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'contents' => [
            {
              'text' => 'abc
'
            }
          ],
          'type' => 'paragraph'
        },
        {
          'cmdname' => 'printindex',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'abc'
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
              'abc'
            ]
          },
          'info' => {
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'line_nr' => 60
          }
        },
        {
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'contents' => [
            {
              'text' => 'fn
'
            }
          ],
          'type' => 'paragraph'
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
            'line_nr' => 63
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
$result_trees{'def_syn_indices'}{'contents'}[4]{'contents'}[4]{'extra'}{'element_node'} = $result_trees{'def_syn_indices'}{'contents'}[3];
$result_trees{'def_syn_indices'}{'contents'}[4]{'contents'}[8]{'extra'}{'element_node'} = $result_trees{'def_syn_indices'}{'contents'}[3];
$result_trees{'def_syn_indices'}{'contents'}[4]{'contents'}[10]{'extra'}{'element_node'} = $result_trees{'def_syn_indices'}{'contents'}[3];
$result_trees{'def_syn_indices'}{'contents'}[4]{'contents'}[14]{'extra'}{'element_node'} = $result_trees{'def_syn_indices'}{'contents'}[3];
$result_trees{'def_syn_indices'}{'contents'}[4]{'contents'}[15]{'extra'}{'element_node'} = $result_trees{'def_syn_indices'}{'contents'}[3];
$result_trees{'def_syn_indices'}{'contents'}[4]{'contents'}[25]{'extra'}{'element_node'} = $result_trees{'def_syn_indices'}{'contents'}[3];
$result_trees{'def_syn_indices'}{'contents'}[4]{'contents'}[27]{'extra'}{'element_node'} = $result_trees{'def_syn_indices'}{'contents'}[3];

$result_texis{'def_syn_indices'} = '@syncodeindex cp fn

@node Top
@top top

@node Chapter index
@chapter Index

definedx truc
@defindex truc
after

@trucindex index truc

@defcodeindex codeidx

@codeidxindex a @var{index entry} t@~e @^{@dotless{i}}

@cindex cindex entry

@syncodeindex ky pg

@kindex truc kindex
@pindex pindex codeidx

@synindex truc cp

@defindex abc
@defindex defg

@synindex abc defg
@synindex defg ky

@defgindex defg index entry

@abcindex abc index entry

pg
@printindex pg

ky
@printindex ky

truc
@printindex truc

value truc
@printindex truc

cp
@printindex cp

value cp
@printindex cp

defg
@printindex defg

abc
@printindex abc

fn
@printindex fn
';


$result_texts{'def_syn_indices'} = '
top
***

1 Index
*******

definedx truc
after












pg

ky

truc

value truc

cp

value cp

defg

abc

fn
';

$result_sectioning{'def_syn_indices'} = {
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
                    'normalized' => 'Chapter-index'
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
$result_sectioning{'def_syn_indices'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[0]{'extra'}{'section_directions'}{'up'} = $result_sectioning{'def_syn_indices'}{'extra'}{'section_childs'}[0];
$result_sectioning{'def_syn_indices'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[0]{'extra'}{'toplevel_directions'}{'prev'} = $result_sectioning{'def_syn_indices'}{'extra'}{'section_childs'}[0];
$result_sectioning{'def_syn_indices'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[0]{'extra'}{'toplevel_directions'}{'up'} = $result_sectioning{'def_syn_indices'}{'extra'}{'section_childs'}[0];
$result_sectioning{'def_syn_indices'}{'extra'}{'section_childs'}[0]{'extra'}{'sectioning_root'} = $result_sectioning{'def_syn_indices'};

$result_nodes{'def_syn_indices'} = [
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
            'normalized' => 'Chapter-index'
          }
        }
      },
      'normalized' => 'Top'
    }
  },
  {}
];
$result_nodes{'def_syn_indices'}[0]{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'prev'} = $result_nodes{'def_syn_indices'}[0];
$result_nodes{'def_syn_indices'}[0]{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'up'} = $result_nodes{'def_syn_indices'}[0];
$result_nodes{'def_syn_indices'}[1] = $result_nodes{'def_syn_indices'}[0]{'extra'}{'node_directions'}{'next'};

$result_menus{'def_syn_indices'} = [
  {
    'extra' => {
      'normalized' => 'Top'
    }
  },
  {
    'extra' => {
      'normalized' => 'Chapter-index'
    }
  }
];

$result_errors{'def_syn_indices'} = [
  {
    'error_line' => 'warning: printing an index `ky\' merged in another one, `pg\'
',
    'line_nr' => 42,
    'text' => 'printing an index `ky\' merged in another one, `pg\'',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: printing an index `truc\' merged in another one, `fn\'
',
    'line_nr' => 45,
    'text' => 'printing an index `truc\' merged in another one, `fn\'',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: printing an index `truc\' merged in another one, `fn\'
',
    'line_nr' => 48,
    'text' => 'printing an index `truc\' merged in another one, `fn\'',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: printing an index `cp\' merged in another one, `fn\'
',
    'line_nr' => 51,
    'text' => 'printing an index `cp\' merged in another one, `fn\'',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: printing an index `cp\' merged in another one, `fn\'
',
    'line_nr' => 54,
    'text' => 'printing an index `cp\' merged in another one, `fn\'',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: printing an index `defg\' merged in another one, `pg\'
',
    'line_nr' => 57,
    'text' => 'printing an index `defg\' merged in another one, `pg\'',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: printing an index `abc\' merged in another one, `pg\'
',
    'line_nr' => 60,
    'text' => 'printing an index `abc\' merged in another one, `pg\'',
    'type' => 'warning'
  }
];


$result_indices{'def_syn_indices'} = {
  'index_names' => {
    'abc' => {
      'in_code' => 0,
      'merged_in' => 'pg',
      'name' => 'abc'
    },
    'codeidx' => {
      'in_code' => 1,
      'name' => 'codeidx'
    },
    'cp' => {
      'in_code' => 1,
      'merged_in' => 'fn',
      'name' => 'cp'
    },
    'defg' => {
      'in_code' => 0,
      'merged_in' => 'pg',
      'name' => 'defg'
    },
    'fn' => {
      'in_code' => 1,
      'name' => 'fn'
    },
    'ky' => {
      'in_code' => 1,
      'merged_in' => 'pg',
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
    'truc' => {
      'in_code' => 0,
      'merged_in' => 'fn',
      'name' => 'truc'
    },
    'vr' => {
      'in_code' => 1,
      'name' => 'vr'
    }
  }
};


$result_floats{'def_syn_indices'} = {};


$result_indices_sort_strings{'def_syn_indices'} = {
  'codeidx' => [
    "a index entry t\x{1ebd} \x{ee}"
  ],
  'fn' => [
    'cindex entry',
    'index truc'
  ],
  'pg' => [
    'abc index entry',
    'defg index entry',
    'pindex codeidx',
    'truc kindex'
  ]
};



$result_converted{'info'}->{'def_syn_indices'} = 'This is , produced from .


File: ,  Node: Top,  Next: Chapter index,  Up: (dir)

top
***

* Menu:

* Chapter index::


File: ,  Node: Chapter index,  Prev: Top,  Up: Top

1 Index
*******

definedx truc after

   pg

 [index ]
* Menu:

* abc index entry:                       Chapter index.         (line 8)
* defg index entry:                      Chapter index.         (line 8)
* pindex codeidx:                        Chapter index.         (line 8)
* truc kindex:                           Chapter index.         (line 8)

   ky

   truc

   value truc

   cp

   value cp

   defg

   abc

   fn

 [index ]
* Menu:

* cindex entry:                          Chapter index.         (line 8)
* index truc:                            Chapter index.         (line 8)


Tag Table:
Node: Top27
Node: Chapter index120

End Tag Table


Local Variables:
coding: utf-8
End:
';


$result_converted{'plaintext'}->{'def_syn_indices'} = 'top
***

1 Index
*******

definedx truc after

   pg

* Menu:

* abc index entry:                       Chapter index.         (line 8)
* defg index entry:                      Chapter index.         (line 8)
* pindex codeidx:                        Chapter index.         (line 8)
* truc kindex:                           Chapter index.         (line 8)

   ky

   truc

   value truc

   cp

   value cp

   defg

   abc

   fn

* Menu:

* cindex entry:                          Chapter index.         (line 8)
* index truc:                            Chapter index.         (line 8)

';


$result_converted{'html_text'}->{'def_syn_indices'} = '
<div class="top-level-extent" id="Top">
<div class="nav-panel">
<p>
[<a href="#Chapter-index" title="Index" rel="index">Index</a>]</p>
</div>
<h1 class="top" id="top"><span>top<a class="copiable-link" href="#top"> &para;</a></span></h1>

<ul class="mini-toc">
<li><a href="#Chapter-index" accesskey="1">Index</a></li>
</ul>
<hr>
<div class="chapter-level-extent" id="Chapter-index">
<div class="nav-panel">
<p>
[<a href="#Chapter-index" title="Index" rel="index">Index</a>]</p>
</div>
<h2 class="chapter" id="Index"><span>1 Index<a class="copiable-link" href="#Index"> &para;</a></span></h2>

<p>definedx truc
after
</p>
<a class="index-entry-id" id="index-index-truc"></a>


<a class="index-entry-id" id="index-a-index-entry-te-i"></a>

<a class="index-entry-id" id="index-cindex-entry"></a>


<a class="index-entry-id" id="index-truc-kindex"></a>
<a class="index-entry-id" id="index-pindex-codeidx"></a>




<a class="index-entry-id" id="index-defg-index-entry"></a>

<a class="index-entry-id" id="index-abc-index-entry"></a>

<p>pg
</p><div class="printindex pg-printindex">
<table class="index-letters-header-printindex pg-letters-header-printindex"><tr><th>Jump to: &nbsp; </th><td><a class="summary-letter-printindex" href="#Chapter-index_pg_letter-A"><b>A</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#Chapter-index_pg_letter-D"><b>D</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#Chapter-index_pg_letter-P"><b>P</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#Chapter-index_pg_letter-T"><b>T</b></a>
 &nbsp; 
</td></tr></table>
<table class="index-entries-printindex pg-entries-printindex">
<tr><th class="index-letter-header-printindex pg-letter-header-printindex" colspan="2" id="Chapter-index_pg_letter-A">A</th></tr>
<tr><td class="printindex-index-entry"><a href="#index-abc-index-entry">abc index entry</a></td><td class="printindex-index-section"><a href="#Chapter-index">Chapter index</a></td></tr>
<tr><th class="index-letter-header-printindex pg-letter-header-printindex" colspan="2" id="Chapter-index_pg_letter-D">D</th></tr>
<tr><td class="printindex-index-entry"><a href="#index-defg-index-entry">defg index entry</a></td><td class="printindex-index-section"><a href="#Chapter-index">Chapter index</a></td></tr>
<tr><th class="index-letter-header-printindex pg-letter-header-printindex" colspan="2" id="Chapter-index_pg_letter-P">P</th></tr>
<tr><td class="printindex-index-entry"><a href="#index-pindex-codeidx"><code>pindex codeidx</code></a></td><td class="printindex-index-section"><a href="#Chapter-index">Chapter index</a></td></tr>
<tr><th class="index-letter-header-printindex pg-letter-header-printindex" colspan="2" id="Chapter-index_pg_letter-T">T</th></tr>
<tr><td class="printindex-index-entry"><a href="#index-truc-kindex"><code>truc kindex</code></a></td><td class="printindex-index-section"><a href="#Chapter-index">Chapter index</a></td></tr>
</table>
<table class="index-letters-footer-printindex pg-letters-footer-printindex"><tr><th>Jump to: &nbsp; </th><td><a class="summary-letter-printindex" href="#Chapter-index_pg_letter-A"><b>A</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#Chapter-index_pg_letter-D"><b>D</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#Chapter-index_pg_letter-P"><b>P</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#Chapter-index_pg_letter-T"><b>T</b></a>
 &nbsp; 
</td></tr></table>
</div>

<p>ky
</p>
<p>truc
</p>
<p>value truc
</p>
<p>cp
</p>
<p>value cp
</p>
<p>defg
</p>
<p>abc
</p>
<p>fn
</p><div class="printindex fn-printindex">
<table class="index-letters-header-printindex fn-letters-header-printindex"><tr><th>Jump to: &nbsp; </th><td><a class="summary-letter-printindex" href="#Chapter-index_fn_letter-C"><b>C</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#Chapter-index_fn_letter-I"><b>I</b></a>
 &nbsp; 
</td></tr></table>
<table class="index-entries-printindex fn-entries-printindex">
<tr><th class="index-letter-header-printindex fn-letter-header-printindex" colspan="2" id="Chapter-index_fn_letter-C">C</th></tr>
<tr><td class="printindex-index-entry"><a href="#index-cindex-entry"><code>cindex entry</code></a></td><td class="printindex-index-section"><a href="#Chapter-index">Chapter index</a></td></tr>
<tr><th class="index-letter-header-printindex fn-letter-header-printindex" colspan="2" id="Chapter-index_fn_letter-I">I</th></tr>
<tr><td class="printindex-index-entry"><a href="#index-index-truc">index truc</a></td><td class="printindex-index-section"><a href="#Chapter-index">Chapter index</a></td></tr>
</table>
<table class="index-letters-footer-printindex fn-letters-footer-printindex"><tr><th>Jump to: &nbsp; </th><td><a class="summary-letter-printindex" href="#Chapter-index_fn_letter-C"><b>C</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#Chapter-index_fn_letter-I"><b>I</b></a>
 &nbsp; 
</td></tr></table>
</div>
</div>
</div>
';


$result_converted{'xml'}->{'def_syn_indices'} = '<syncodeindex spaces=" " from="cp" to="fn" line="cp fn"></syncodeindex>

<node name="Top" spaces=" "><nodename>Top</nodename><nodenext automatic="on">Chapter index</nodenext></node>
<top spaces=" "><sectiontitle>top</sectiontitle>

</top>
<node name="Chapter-index" spaces=" "><nodename>Chapter index</nodename><nodeprev automatic="on">Top</nodeprev><nodeup automatic="on">Top</nodeup></node>
<chapter spaces=" "><sectiontitle>Index</sectiontitle>

<para>definedx truc
<defindex spaces=" " value="truc" line="truc"></defindex>
after
</para>
<indexcommand command="trucindex" index="truc" spaces=" "><indexterm index="truc" number="1" incode="0" mergedindex="fn">index truc</indexterm></indexcommand>

<defcodeindex spaces=" " value="codeidx" line="codeidx"></defcodeindex>

<indexcommand command="codeidxindex" index="codeidx" spaces=" "><indexterm index="codeidx" number="1" incode="1">a <var>index entry</var> t<accent type="tilde" bracketed="off">e</accent> <accent type="circ"><dotless>i</dotless></accent></indexterm></indexcommand>

<cindex index="cp" spaces=" "><indexterm index="cp" number="1" incode="1" mergedindex="fn">cindex entry</indexterm></cindex>

<syncodeindex spaces=" " from="ky" to="pg" line="ky pg"></syncodeindex>

<kindex index="ky" spaces=" "><indexterm index="ky" number="1" mergedindex="pg">truc kindex</indexterm></kindex>
<pindex index="pg" spaces=" "><indexterm index="pg" number="1">pindex codeidx</indexterm></pindex>

<synindex spaces=" " from="truc" to="cp" line="truc cp"></synindex>

<defindex spaces=" " value="abc" line="abc"></defindex>
<defindex spaces=" " value="defg" line="defg"></defindex>

<synindex spaces=" " from="abc" to="defg" line="abc defg"></synindex>
<synindex spaces=" " from="defg" to="ky" line="defg ky"></synindex>

<indexcommand command="defgindex" index="defg" spaces=" "><indexterm index="defg" number="1" incode="0" mergedindex="pg">defg index entry</indexterm></indexcommand>

<indexcommand command="abcindex" index="abc" spaces=" "><indexterm index="abc" number="1" incode="0" mergedindex="pg">abc index entry</indexterm></indexcommand>

<para>pg
</para><printindex spaces=" " value="pg" line="pg"></printindex>

<para>ky
</para><printindex spaces=" " value="ky" line="ky"></printindex>

<para>truc
</para><printindex spaces=" " value="truc" line="truc"></printindex>

<para>value truc
</para><printindex spaces=" " value="truc" line="truc"></printindex>

<para>cp
</para><printindex spaces=" " value="cp" line="cp"></printindex>

<para>value cp
</para><printindex spaces=" " value="cp" line="cp"></printindex>

<para>defg
</para><printindex spaces=" " value="defg" line="defg"></printindex>

<para>abc
</para><printindex spaces=" " value="abc" line="abc"></printindex>

<para>fn
</para><printindex spaces=" " value="fn" line="fn"></printindex>
</chapter>
';


$result_converted{'latex'}->{'def_syn_indices'} = '\\documentclass{book}
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
\\makeindex[name=codeidx,title=]%
\\makeindex[name=fn,title=]%
\\makeindex[name=pg,title=]%

% style command for var in \'cmd_text\' formatting context
\\newcommand\\Texinfocommandstyletextvar[1]{{\\normalfont{}\\textsl{#1}}}%

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
\\chapter{{Index}}
\\label{anchor:Chapter-index}%

definedx truc
after

\\index[fn]{index truc@index truc}%


\\index[codeidx]{a index entry tẽ î@\\texttt{a \\Texinfocommandstyletextvar{index entry}\\ t\\~{e}\\ \\^{\\i{}}}}%

\\index[fn]{cindex entry@\\texttt{cindex entry}}%


\\index[pg]{truc kindex@\\texttt{truc kindex}}%
\\index[pg]{pindex codeidx@\\texttt{pindex codeidx}}%




\\index[pg]{defg index entry@defg index entry}%

\\index[pg]{abc index entry@abc index entry}%

pg
\\printindex[pg]

ky

truc

value truc

cp

value cp

defg

abc

fn
\\printindex[fn]
\\end{document}
';

1;
