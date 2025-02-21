use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'cpp_lines'} = {
  'contents' => [
    {
      'contents' => [
        {
          'contents' => [
            {
              'contents' => [
                {
                  'text' => '\\input texinfo
',
                  'type' => 'text_before_beginning'
                }
              ],
              'type' => 'preamble_before_beginning'
            }
          ],
          'type' => 'preamble_before_setfilename'
        },
        {
          'contents' => [
            {
              'cmdname' => 'setfilename',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'cpp_lines.info'
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
                'text_arg' => 'cpp_lines.info'
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'file_name' => 'cpp_lines.texi',
                'line_nr' => 2
              }
            },
            {
              'text' => '
',
              'type' => 'empty_line'
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
              'cmdname' => 'email',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'before top'
                    }
                  ],
                  'type' => 'brace_arg'
                }
              ],
              'source_info' => {
                'file_name' => 'g_f',
                'line_nr' => 68
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
        'file_name' => 'g_f',
        'line_nr' => 70
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
          'contents' => [
            {
              'text' => '# 10 25 209
'
            },
            {
              'text' => '# 1 2
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
          'cmdname' => 'verbatim',
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
              'text' => '
',
              'type' => 'raw'
            },
            {
              'text' => '  #line 5 "f"
',
              'type' => 'raw'
            },
            {
              'cmdname' => 'end',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'verbatim'
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
                'text_arg' => 'verbatim'
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'file_name' => 'g_f',
                'line_nr' => 51
              }
            }
          ],
          'source_info' => {
            'file_name' => 'g_f',
            'line_nr' => 48
          }
        },
        {
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'cmdname' => 'macro',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => ' macr
',
                  'type' => 'macro_line'
                }
              ],
              'type' => 'arguments_line'
            },
            {
              'text' => '# line 7 "k"
',
              'type' => 'raw'
            },
            {
              'cmdname' => 'end',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'macro'
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
                'text_arg' => 'macro'
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'file_name' => 'g_f',
                'line_nr' => 55
              }
            }
          ],
          'extra' => {
            'macro_name' => 'macr',
            'misc_args' => []
          },
          'source_info' => {
            'file_name' => 'g_f',
            'line_nr' => 53
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
              'cmdname' => 'email',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'after lacro def'
                    }
                  ],
                  'type' => 'brace_arg'
                }
              ],
              'source_info' => {
                'file_name' => 'g_f',
                'line_nr' => 57
              }
            },
            {
              'text' => '
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
              'source_marks' => [
                {
                  'counter' => 1,
                  'element' => {
                    'contents' => [
                      {
                        'type' => 'brace_arg'
                      }
                    ],
                    'info' => {
                      'command_name' => 'macr'
                    },
                    'type' => 'macro_call'
                  },
                  'sourcemark_type' => 'macro_expansion',
                  'status' => 'start'
                },
                {
                  'counter' => 1,
                  'position' => 12,
                  'sourcemark_type' => 'macro_expansion',
                  'status' => 'end'
                }
              ],
              'text' => '# line 7 "k"
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
              'cmdname' => 'email',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'after macro call'
                    }
                  ],
                  'type' => 'brace_arg'
                }
              ],
              'source_info' => {
                'file_name' => 'g_f',
                'line_nr' => 61
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
          'cmdname' => 'macro',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => ' macrtwo
',
                  'type' => 'macro_line'
                }
              ],
              'type' => 'arguments_line'
            },
            {
              'text' => 'line before
',
              'type' => 'raw'
            },
            {
              'text' => '# line 666 "x"
',
              'type' => 'raw'
            },
            {
              'cmdname' => 'end',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'macro'
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
                'text_arg' => 'macro'
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'file_name' => 'g_f',
                'line_nr' => 66
              }
            }
          ],
          'extra' => {
            'macro_name' => 'macrtwo',
            'misc_args' => []
          },
          'source_info' => {
            'file_name' => 'g_f',
            'line_nr' => 63
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
              'cmdname' => 'email',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'after macrotwo def'
                    }
                  ],
                  'type' => 'brace_arg'
                }
              ],
              'source_info' => {
                'file_name' => 'g_f',
                'line_nr' => 68
              }
            },
            {
              'text' => '
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
              'source_marks' => [
                {
                  'counter' => 2,
                  'element' => {
                    'contents' => [
                      {
                        'type' => 'brace_arg'
                      }
                    ],
                    'info' => {
                      'command_name' => 'macrtwo'
                    },
                    'type' => 'macro_call'
                  },
                  'sourcemark_type' => 'macro_expansion',
                  'status' => 'start'
                }
              ],
              'text' => 'line before
'
            },
            {
              'source_marks' => [
                {
                  'counter' => 2,
                  'position' => 14,
                  'sourcemark_type' => 'macro_expansion',
                  'status' => 'end'
                }
              ],
              'text' => '# line 666 "x"
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
              'cmdname' => 'email',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'after macrotwo call'
                    }
                  ],
                  'type' => 'brace_arg'
                }
              ],
              'source_info' => {
                'file_name' => 'g_f',
                'line_nr' => 72
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
          'source_marks' => [
            {
              'counter' => 1,
              'element' => {
                'cmdname' => 'include',
                'contents' => [
                  {
                    'contents' => [
                      {
                        'text' => 'file_with_cpp_lines.texi'
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
                  'text_arg' => 'file_with_cpp_lines.texi'
                },
                'info' => {
                  'spaces_before_argument' => {
                    'text' => ' '
                  }
                },
                'source_info' => {
                  'file_name' => 'g_f',
                  'line_nr' => 74
                }
              },
              'position' => 1,
              'sourcemark_type' => 'include',
              'status' => 'start'
            }
          ],
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'contents' => [
            {
              'cmdname' => 'email',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'in'
                    }
                  ],
                  'type' => 'brace_arg'
                }
              ],
              'source_info' => {
                'file_name' => 'inc',
                'line_nr' => 10
              }
            },
            {
              'text' => '
'
            }
          ],
          'type' => 'paragraph'
        },
        {
          'source_marks' => [
            {
              'counter' => 1,
              'position' => 1,
              'sourcemark_type' => 'include',
              'status' => 'end'
            }
          ],
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'contents' => [
            {
              'cmdname' => 'email',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'after inc'
                    }
                  ],
                  'type' => 'brace_arg'
                }
              ],
              'source_info' => {
                'file_name' => 'g_f',
                'line_nr' => 75
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
              'cmdname' => 'verb',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => '
',
                      'type' => 'raw'
                    },
                    {
                      'text' => '#line 5 "in verb"
',
                      'type' => 'raw'
                    }
                  ],
                  'type' => 'brace_container'
                }
              ],
              'info' => {
                'delimiter' => ':'
              },
              'source_info' => {
                'file_name' => 'g_f',
                'line_nr' => 77
              }
            },
            {
              'text' => '
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
              'cmdname' => 'email',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'after verb'
                    }
                  ],
                  'type' => 'brace_arg'
                }
              ],
              'source_info' => {
                'file_name' => 'g_f',
                'line_nr' => 81
              }
            },
            {
              'text' => '
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
              'text' => 'a'
            },
            {
              'cmdname' => 'footnote',
              'contents' => [
                {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'in footnote'
                        }
                      ],
                      'type' => 'paragraph'
                    }
                  ],
                  'type' => 'brace_command_context'
                }
              ],
              'extra' => {},
              'info' => {
                'spaces_before_argument' => {
                  'text' => '
'
                }
              },
              'source_info' => {
                'file_name' => 'g_f',
                'line_nr' => 83
              }
            },
            {
              'text' => '
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
              'text' => 'a'
            },
            {
              'cmdname' => 'footnote',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => '
',
                      'type' => 'empty_line'
                    },
                    {
                      'contents' => [
                        {
                          'text' => 'in 2footnote'
                        }
                      ],
                      'type' => 'paragraph'
                    }
                  ],
                  'type' => 'brace_command_context'
                }
              ],
              'extra' => {},
              'info' => {
                'spaces_before_argument' => {
                  'text' => '
'
                }
              },
              'source_info' => {
                'file_name' => 'footnote',
                'line_nr' => 28
              }
            },
            {
              'text' => '
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
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'contents' => [
            {
              'cmdname' => 'email',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'etext1'
                    }
                  ],
                  'info' => {
                    'spaces_before_argument' => {
                      'text' => ' 
'
                    }
                  },
                  'type' => 'brace_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => 'etext2'
                    }
                  ],
                  'info' => {
                    'spaces_after_argument' => {
                      'text' => '
'
                    },
                    'spaces_before_argument' => {
                      'text' => '
'
                    }
                  },
                  'type' => 'brace_arg'
                }
              ],
              'source_info' => {
                'file_name' => 'footnote2',
                'line_nr' => 40
              }
            },
            {
              'text' => '
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
              'cmdname' => 'email',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => ' no line directive mail space'
                    }
                  ],
                  'info' => {
                    'spaces_before_argument' => {
                      'text' => '
'
                    }
                  },
                  'type' => 'brace_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => ' no line directive text space'
                    }
                  ],
                  'info' => {
                    'spaces_after_argument' => {
                      'text' => '
'
                    },
                    'spaces_before_argument' => {
                      'text' => '
'
                    }
                  },
                  'type' => 'brace_arg'
                }
              ],
              'source_info' => {
                'file_name' => 'email2',
                'line_nr' => 64
              }
            },
            {
              'text' => '
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
              'cmdname' => 'email',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => ' mail space'
                    }
                  ],
                  'info' => {
                    'spaces_before_argument' => {
                      'text' => ' 
'
                    }
                  },
                  'type' => 'brace_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => ' text space'
                    }
                  ],
                  'info' => {
                    'spaces_after_argument' => {
                      'text' => '
'
                    },
                    'spaces_before_argument' => {
                      'text' => '
'
                    }
                  },
                  'type' => 'brace_arg'
                }
              ],
              'source_info' => {
                'file_name' => 'email2',
                'line_nr' => 69
              }
            },
            {
              'text' => '
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
              'cmdname' => 'email',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => '
',
                      'type' => 'empty_line'
                    }
                  ],
                  'info' => {
                    'spaces_before_argument' => {
                      'text' => ' 
'
                    }
                  },
                  'type' => 'brace_arg'
                }
              ],
              'source_info' => {
                'file_name' => 'email12',
                'line_nr' => 64
              }
            }
          ],
          'type' => 'paragraph'
        },
        {
          'contents' => [
            {
              'text' => 'etext3,
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
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'contents' => [
            {
              'text' => 'etext4
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
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'text' => '
',
          'type' => 'empty_line'
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
                  'text' => "l\x{e0}ng"
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
            'text_arg' => "l\x{e0}ng"
          },
          'info' => {
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'file_name' => 'accentÃªd',
            'line_nr' => 7
          }
        },
        {
          'text' => '
',
          'type' => 'empty_line'
        }
      ],
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
        'file_name' => 'g_f',
        'line_nr' => 71
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

$result_texis{'cpp_lines'} = '\\input texinfo
@setfilename cpp_lines.info


@email{before top}.

@node Top
@node chap

# 10 25 209
# 1 2

@verbatim

  #line 5 "f"
@end verbatim

@macro macr
# line 7 "k"
@end macro

@email{after lacro def}

# line 7 "k"

@email{after macro call}.

@macro macrtwo
line before
# line 666 "x"
@end macro

@email{after macrotwo def}

line before
# line 666 "x"

@email{after macrotwo call}. 



@email{in}

@email{after inc}. 

@verb{:
#line 5 "in verb"
:}

@email{after verb}

a@footnote{
in footnote}

a@footnote{

in 2footnote}


@email{ 
etext1,
etext2
}

@email{
 no line directive mail space,
 no line directive text space
}

@email{ 
 mail space,
 text space
}

@email{ 

}etext3,


etext4





@documentlanguage làng

@bye
';


$result_texts{'cpp_lines'} = '

before top.


# 10 25 209
# 1 2


  #line 5 "f"


after lacro def

# line 7 "k"

after macro call.


after macrotwo def

line before
# line 666 "x"

after macrotwo call. 



in

after inc. 


#line 5 "in verb"


after verb

a

a


etext2

 no line directive text space

 text space


etext3,


etext4






';

$result_nodes{'cpp_lines'} = [
  {
    'cmdname' => 'node',
    'extra' => {
      'node_directions' => {
        'next' => {
          'cmdname' => 'node',
          'extra' => {
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
$result_nodes{'cpp_lines'}[0]{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'prev'} = $result_nodes{'cpp_lines'}[0];
$result_nodes{'cpp_lines'}[1] = $result_nodes{'cpp_lines'}[0]{'extra'}{'node_directions'}{'next'};

$result_menus{'cpp_lines'} = [
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

$result_errors{'cpp_lines'} = [
  {
    'error_line' => '@email missing closing brace
',
    'file_name' => 'email12',
    'line_nr' => 64,
    'text' => '@email missing closing brace',
    'type' => 'error'
  },
  {
    'error_line' => 'misplaced }
',
    'file_name' => 'email4',
    'line_nr' => 63,
    'text' => 'misplaced }',
    'type' => 'error'
  },
  {
    'error_line' => "warning: l\x{e0}ng is not a valid language code
",
    'file_name' => 'accentÃªd',
    'line_nr' => 7,
    'text' => "l\x{e0}ng is not a valid language code",
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: node `chap\' not in menu
',
    'file_name' => 'g_f',
    'line_nr' => 71,
    'text' => 'node `chap\' not in menu',
    'type' => 'warning'
  }
];


$result_floats{'cpp_lines'} = {};


1;
