use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'glossary'} = {
  'contents' => [
    {
      'contents' => [
        {
          'contents' => [
            {
              'contents' => [
                {
                  'text' => '\\input texinfo.tex
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
                      'text' => 'glossary'
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
                'text_arg' => 'glossary'
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'file_name' => 'glossary.texi',
                'line_nr' => 3
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
                      'text' => ' glossarytext
',
                      'type' => 'macro_line'
                    }
                  ],
                  'type' => 'arguments_line'
                },
                {
                  'text' => '@table @asis
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
                    'file_name' => 'glossary.texi',
                    'line_nr' => 7
                  }
                }
              ],
              'extra' => {
                'macro_name' => 'glossarytext',
                'misc_args' => []
              },
              'source_info' => {
                'file_name' => 'glossary.texi',
                'line_nr' => 5
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
                      'text' => ' glossary
',
                      'type' => 'macro_line'
                    }
                  ],
                  'type' => 'arguments_line'
                },
                {
                  'text' => '@glossarytext
',
                  'type' => 'raw'
                },
                {
                  'text' => '@end table
',
                  'type' => 'raw'
                },
                {
                  'text' => '
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
                    'file_name' => 'glossary.texi',
                    'line_nr' => 13
                  }
                }
              ],
              'extra' => {
                'macro_name' => 'glossary',
                'misc_args' => []
              },
              'source_info' => {
                'file_name' => 'glossary.texi',
                'line_nr' => 9
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
                      'text' => ' gentry {id, name, text}
',
                      'type' => 'macro_line'
                    }
                  ],
                  'type' => 'arguments_line'
                },
                {
                  'text' => '@ifhtml
',
                  'type' => 'raw'
                },
                {
                  'text' => '@ref{\\id\\,\\name\\}
',
                  'type' => 'raw'
                },
                {
                  'text' => '@end ifhtml
',
                  'type' => 'raw'
                },
                {
                  'text' => '@ifnothtml
',
                  'type' => 'raw'
                },
                {
                  'text' => '\\name\\ (@pxref{\\id\\})
',
                  'type' => 'raw'
                },
                {
                  'text' => '@end ifnothtml
',
                  'type' => 'raw'
                },
                {
                  'text' => '@unmacro expandglossary
',
                  'type' => 'raw'
                },
                {
                  'text' => '@macro expandglossary{glossary}
',
                  'type' => 'raw'
                },
                {
                  'text' => '@unmacro glossarytext
',
                  'type' => 'raw'
                },
                {
                  'text' => '@macro glossarytext
',
                  'type' => 'raw'
                },
                {
                  'text' => '\\\\glossary\\\\
',
                  'type' => 'raw'
                },
                {
                  'text' => '@item \\name\\ @anchor{\\id\\}
',
                  'type' => 'raw'
                },
                {
                  'text' => '\\text\\
',
                  'type' => 'raw'
                },
                {
                  'text' => '@end macro
',
                  'type' => 'raw'
                },
                {
                  'text' => '@end macro
',
                  'type' => 'raw'
                },
                {
                  'text' => '@expandglossary {@glossarytext{}}
',
                  'type' => 'raw'
                },
                {
                  'text' => '
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
                    'file_name' => 'glossary.texi',
                    'line_nr' => 33
                  }
                }
              ],
              'extra' => {
                'macro_name' => 'gentry',
                'misc_args' => [
                  'id',
                  'name',
                  'text'
                ]
              },
              'source_info' => {
                'file_name' => 'glossary.texi',
                'line_nr' => 15
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
        'file_name' => 'glossary.texi',
        'line_nr' => 35
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
        },
        {
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'cmdname' => 'menu',
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
              'contents' => [
                {
                  'text' => '* ',
                  'type' => 'menu_entry_leading_text'
                },
                {
                  'contents' => [
                    {
                      'text' => 'glossary'
                    }
                  ],
                  'extra' => {
                    'node_content' => {
                      'contents' => [
                        {}
                      ]
                    },
                    'normalized' => 'glossary'
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
                'file_name' => 'glossary.texi',
                'line_nr' => 39
              },
              'type' => 'menu_entry'
            },
            {
              'cmdname' => 'end',
              'contents' => [
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
              'extra' => {
                'text_arg' => 'menu'
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'file_name' => 'glossary.texi',
                'line_nr' => 40
              }
            }
          ],
          'source_info' => {
            'file_name' => 'glossary.texi',
            'line_nr' => 38
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
              'source_marks' => [
                {
                  'counter' => 1,
                  'element' => {
                    'contents' => [
                      {
                        'contents' => [
                          {
                            'text' => 'id1'
                          }
                        ],
                        'type' => 'brace_arg'
                      },
                      {
                        'contents' => [
                          {
                            'text' => 'name1'
                          }
                        ],
                        'info' => {
                          'spaces_before_argument' => {
                            'text' => ' '
                          }
                        },
                        'type' => 'brace_arg'
                      },
                      {
                        'contents' => [
                          {
                            'text' => 'text1, arg1 '
                          }
                        ],
                        'info' => {
                          'spaces_before_argument' => {
                            'text' => ' '
                          }
                        },
                        'type' => 'brace_arg'
                      }
                    ],
                    'info' => {
                      'command_name' => 'gentry'
                    },
                    'type' => 'macro_call'
                  },
                  'position' => 4,
                  'sourcemark_type' => 'macro_expansion',
                  'status' => 'start'
                },
                {
                  'counter' => 1,
                  'element' => {
                    'cmdname' => 'ifhtml',
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
                      }
                    ],
                    'source_info' => {
                      'file_name' => 'glossary.texi',
                      'line_nr' => 42,
                      'macro' => 'gentry'
                    }
                  },
                  'position' => 4,
                  'sourcemark_type' => 'expanded_conditional_command',
                  'status' => 'start'
                }
              ],
              'text' => 'The '
            },
            {
              'cmdname' => 'ref',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'id1'
                    }
                  ],
                  'extra' => {
                    'node_content' => {
                      'contents' => [
                        {}
                      ]
                    },
                    'normalized' => 'id1'
                  },
                  'type' => 'brace_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => 'name1'
                    }
                  ],
                  'type' => 'brace_arg'
                }
              ],
              'source_info' => {
                'file_name' => 'glossary.texi',
                'line_nr' => 42,
                'macro' => 'gentry'
              }
            },
            {
              'source_marks' => [
                {
                  'counter' => 1,
                  'element' => {
                    'cmdname' => 'end',
                    'contents' => [
                      {
                        'contents' => [
                          {
                            'text' => 'ifhtml'
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
                      'text_arg' => 'ifhtml'
                    },
                    'info' => {
                      'spaces_before_argument' => {
                        'text' => ' '
                      }
                    },
                    'source_info' => {
                      'file_name' => 'glossary.texi',
                      'line_nr' => 42,
                      'macro' => 'gentry'
                    }
                  },
                  'position' => 1,
                  'sourcemark_type' => 'expanded_conditional_command',
                  'status' => 'end'
                },
                {
                  'counter' => 1,
                  'element' => {
                    'cmdname' => 'ifnothtml',
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
                        'text' => 'name1 (@pxref{id1})
',
                        'type' => 'raw'
                      },
                      {
                        'cmdname' => 'end',
                        'contents' => [
                          {
                            'contents' => [
                              {
                                'text' => 'ifnothtml'
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
                          'text_arg' => 'ifnothtml'
                        },
                        'info' => {
                          'spaces_before_argument' => {
                            'text' => ' '
                          }
                        },
                        'source_info' => {
                          'file_name' => 'glossary.texi',
                          'line_nr' => 42,
                          'macro' => 'gentry'
                        }
                      }
                    ],
                    'source_info' => {
                      'file_name' => 'glossary.texi',
                      'line_nr' => 42,
                      'macro' => 'gentry'
                    }
                  },
                  'position' => 1,
                  'sourcemark_type' => 'ignored_conditional_block'
                }
              ],
              'text' => '
'
            },
            {
              'cmdname' => 'unmacro',
              'contents' => [
                {
                  'text' => 'expandglossary',
                  'type' => 'rawline_arg'
                }
              ],
              'info' => {
                'arg_line' => ' expandglossary
'
              }
            },
            {
              'cmdname' => 'macro',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => ' expandglossary{glossary}
',
                      'type' => 'macro_line'
                    }
                  ],
                  'type' => 'arguments_line'
                },
                {
                  'text' => '@unmacro glossarytext
',
                  'type' => 'raw'
                },
                {
                  'text' => '@macro glossarytext
',
                  'type' => 'raw'
                },
                {
                  'text' => '\\glossary\\
',
                  'type' => 'raw'
                },
                {
                  'text' => '@item name1 @anchor{id1}
',
                  'type' => 'raw'
                },
                {
                  'text' => 'text1, arg1 
',
                  'type' => 'raw'
                },
                {
                  'text' => '@end macro
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
                    'file_name' => 'glossary.texi',
                    'line_nr' => 42,
                    'macro' => 'gentry'
                  }
                }
              ],
              'extra' => {
                'macro_name' => 'expandglossary',
                'misc_args' => [
                  'glossary'
                ]
              },
              'source_info' => {
                'file_name' => 'glossary.texi',
                'line_nr' => 42,
                'macro' => 'gentry'
              },
              'source_marks' => [
                {
                  'counter' => 2,
                  'element' => {
                    'contents' => [
                      {
                        'contents' => [
                          {
                            'text' => '@glossarytext{}'
                          }
                        ],
                        'type' => 'brace_arg'
                      }
                    ],
                    'info' => {
                      'command_name' => 'expandglossary',
                      'spaces_after_cmd_before_arg' => {
                        'text' => ' '
                      }
                    },
                    'type' => 'macro_call'
                  },
                  'sourcemark_type' => 'macro_expansion',
                  'status' => 'start'
                }
              ]
            },
            {
              'cmdname' => 'unmacro',
              'contents' => [
                {
                  'text' => 'glossarytext',
                  'type' => 'rawline_arg'
                }
              ],
              'info' => {
                'arg_line' => ' glossarytext
'
              }
            },
            {
              'cmdname' => 'macro',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => ' glossarytext
',
                      'type' => 'macro_line'
                    }
                  ],
                  'type' => 'arguments_line'
                },
                {
                  'text' => '@glossarytext{}
',
                  'type' => 'raw'
                },
                {
                  'text' => '@item name1 @anchor{id1}
',
                  'type' => 'raw'
                },
                {
                  'text' => 'text1, arg1 
',
                  'type' => 'raw'
                },
                {
                  'cmdname' => 'end',
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'source_marks' => [
                            {
                              'counter' => 2,
                              'position' => 5,
                              'sourcemark_type' => 'macro_expansion',
                              'status' => 'end'
                            }
                          ],
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
                    'file_name' => 'glossary.texi',
                    'line_nr' => 42,
                    'macro' => 'expandglossary'
                  }
                }
              ],
              'extra' => {
                'macro_name' => 'glossarytext',
                'misc_args' => []
              },
              'source_info' => {
                'file_name' => 'glossary.texi',
                'line_nr' => 42,
                'macro' => 'expandglossary'
              },
              'source_marks' => [
                {
                  'counter' => 1,
                  'sourcemark_type' => 'macro_expansion',
                  'status' => 'end'
                }
              ]
            },
            {
              'source_marks' => [
                {
                  'counter' => 3,
                  'element' => {
                    'contents' => [
                      {
                        'contents' => [
                          {
                            'text' => 'id2'
                          }
                        ],
                        'type' => 'brace_arg'
                      },
                      {
                        'contents' => [
                          {
                            'text' => 'name2'
                          }
                        ],
                        'info' => {
                          'spaces_before_argument' => {
                            'text' => ' '
                          }
                        },
                        'type' => 'brace_arg'
                      },
                      {
                        'contents' => [
                          {
                            'text' => 'text2'
                          }
                        ],
                        'info' => {
                          'spaces_before_argument' => {
                            'text' => ' '
                          }
                        },
                        'type' => 'brace_arg'
                      }
                    ],
                    'info' => {
                      'command_name' => 'gentry'
                    },
                    'type' => 'macro_call'
                  },
                  'position' => 29,
                  'sourcemark_type' => 'macro_expansion',
                  'status' => 'start'
                },
                {
                  'counter' => 2,
                  'element' => {
                    'cmdname' => 'ifhtml',
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
                      }
                    ],
                    'source_info' => {
                      'file_name' => 'glossary.texi',
                      'line_nr' => 43,
                      'macro' => 'gentry'
                    }
                  },
                  'position' => 29,
                  'sourcemark_type' => 'expanded_conditional_command',
                  'status' => 'start'
                }
              ],
              'text' => ' is used in many cases while
'
            },
            {
              'cmdname' => 'ref',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'id2'
                    }
                  ],
                  'extra' => {
                    'node_content' => {
                      'contents' => [
                        {}
                      ]
                    },
                    'normalized' => 'id2'
                  },
                  'type' => 'brace_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => 'name2'
                    }
                  ],
                  'type' => 'brace_arg'
                }
              ],
              'source_info' => {
                'file_name' => 'glossary.texi',
                'line_nr' => 43,
                'macro' => 'gentry'
              }
            },
            {
              'source_marks' => [
                {
                  'counter' => 2,
                  'element' => {
                    'cmdname' => 'end',
                    'contents' => [
                      {
                        'contents' => [
                          {
                            'text' => 'ifhtml'
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
                      'text_arg' => 'ifhtml'
                    },
                    'info' => {
                      'spaces_before_argument' => {
                        'text' => ' '
                      }
                    },
                    'source_info' => {
                      'file_name' => 'glossary.texi',
                      'line_nr' => 43,
                      'macro' => 'gentry'
                    }
                  },
                  'position' => 1,
                  'sourcemark_type' => 'expanded_conditional_command',
                  'status' => 'end'
                },
                {
                  'counter' => 2,
                  'element' => {
                    'cmdname' => 'ifnothtml',
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
                        'text' => 'name2 (@pxref{id2})
',
                        'type' => 'raw'
                      },
                      {
                        'cmdname' => 'end',
                        'contents' => [
                          {
                            'contents' => [
                              {
                                'text' => 'ifnothtml'
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
                          'text_arg' => 'ifnothtml'
                        },
                        'info' => {
                          'spaces_before_argument' => {
                            'text' => ' '
                          }
                        },
                        'source_info' => {
                          'file_name' => 'glossary.texi',
                          'line_nr' => 43,
                          'macro' => 'gentry'
                        }
                      }
                    ],
                    'source_info' => {
                      'file_name' => 'glossary.texi',
                      'line_nr' => 43,
                      'macro' => 'gentry'
                    }
                  },
                  'position' => 1,
                  'sourcemark_type' => 'ignored_conditional_block'
                }
              ],
              'text' => '
'
            },
            {
              'cmdname' => 'unmacro',
              'contents' => [
                {
                  'text' => 'expandglossary',
                  'type' => 'rawline_arg'
                }
              ],
              'info' => {
                'arg_line' => ' expandglossary
'
              }
            },
            {
              'cmdname' => 'macro',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => ' expandglossary{glossary}
',
                      'type' => 'macro_line'
                    }
                  ],
                  'type' => 'arguments_line'
                },
                {
                  'text' => '@unmacro glossarytext
',
                  'type' => 'raw'
                },
                {
                  'text' => '@macro glossarytext
',
                  'type' => 'raw'
                },
                {
                  'text' => '\\glossary\\
',
                  'type' => 'raw'
                },
                {
                  'text' => '@item name2 @anchor{id2}
',
                  'type' => 'raw'
                },
                {
                  'text' => 'text2
',
                  'type' => 'raw'
                },
                {
                  'text' => '@end macro
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
                    'file_name' => 'glossary.texi',
                    'line_nr' => 43,
                    'macro' => 'gentry'
                  }
                }
              ],
              'extra' => {
                'macro_name' => 'expandglossary',
                'misc_args' => [
                  'glossary'
                ]
              },
              'source_info' => {
                'file_name' => 'glossary.texi',
                'line_nr' => 43,
                'macro' => 'gentry'
              },
              'source_marks' => [
                {
                  'counter' => 4,
                  'element' => {
                    'contents' => [
                      {
                        'contents' => [
                          {
                            'text' => '@glossarytext{}'
                          }
                        ],
                        'type' => 'brace_arg'
                      }
                    ],
                    'info' => {
                      'command_name' => 'expandglossary',
                      'spaces_after_cmd_before_arg' => {
                        'text' => ' '
                      }
                    },
                    'type' => 'macro_call'
                  },
                  'sourcemark_type' => 'macro_expansion',
                  'status' => 'start'
                }
              ]
            },
            {
              'cmdname' => 'unmacro',
              'contents' => [
                {
                  'text' => 'glossarytext',
                  'type' => 'rawline_arg'
                }
              ],
              'info' => {
                'arg_line' => ' glossarytext
'
              }
            },
            {
              'cmdname' => 'macro',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => ' glossarytext
',
                      'type' => 'macro_line'
                    }
                  ],
                  'type' => 'arguments_line'
                },
                {
                  'text' => '@glossarytext{}
',
                  'type' => 'raw'
                },
                {
                  'text' => '@item name2 @anchor{id2}
',
                  'type' => 'raw'
                },
                {
                  'text' => 'text2
',
                  'type' => 'raw'
                },
                {
                  'cmdname' => 'end',
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'source_marks' => [
                            {
                              'counter' => 4,
                              'position' => 5,
                              'sourcemark_type' => 'macro_expansion',
                              'status' => 'end'
                            }
                          ],
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
                    'file_name' => 'glossary.texi',
                    'line_nr' => 43,
                    'macro' => 'expandglossary'
                  }
                }
              ],
              'extra' => {
                'macro_name' => 'glossarytext',
                'misc_args' => []
              },
              'source_info' => {
                'file_name' => 'glossary.texi',
                'line_nr' => 43,
                'macro' => 'expandglossary'
              },
              'source_marks' => [
                {
                  'counter' => 3,
                  'sourcemark_type' => 'macro_expansion',
                  'status' => 'end'
                }
              ]
            },
            {
              'text' => ' is quite specific
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
      'extra' => {},
      'info' => {
        'spaces_before_argument' => {
          'text' => ' '
        }
      },
      'source_info' => {
        'file_name' => 'glossary.texi',
        'line_nr' => 36
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
                  'text' => 'glossary'
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
        'normalized' => 'glossary'
      },
      'info' => {
        'spaces_before_argument' => {
          'text' => ' '
        }
      },
      'source_info' => {
        'file_name' => 'glossary.texi',
        'line_nr' => 45
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
                  'text' => 'glossary'
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
          'source_marks' => [
            {
              'counter' => 5,
              'element' => {
                'contents' => [
                  {
                    'type' => 'brace_arg'
                  }
                ],
                'info' => {
                  'command_name' => 'glossary'
                },
                'type' => 'macro_call'
              },
              'sourcemark_type' => 'macro_expansion',
              'status' => 'start'
            },
            {
              'counter' => 6,
              'element' => {
                'info' => {
                  'command_name' => 'glossarytext'
                },
                'type' => 'macro_call'
              },
              'sourcemark_type' => 'macro_expansion',
              'status' => 'start'
            }
          ],
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'text' => ' ',
          'type' => 'ignorable_spaces_after_command'
        },
        {
          'contents' => [
            {
              'text' => 'name2 '
            },
            {
              'cmdname' => 'anchor',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'id2'
                    }
                  ],
                  'type' => 'brace_arg'
                }
              ],
              'extra' => {
                'is_target' => 1,
                'normalized' => 'id2'
              },
              'source_info' => {
                'file_name' => 'glossary.texi',
                'line_nr' => 47,
                'macro' => 'glossarytext'
              }
            },
            {
              'text' => '
',
              'type' => 'spaces_after_close_brace'
            },
            {
              'source_marks' => [
                {
                  'counter' => 6,
                  'position' => 5,
                  'sourcemark_type' => 'macro_expansion',
                  'status' => 'end'
                }
              ],
              'text' => 'text2
'
            }
          ],
          'source_marks' => [
            {
              'counter' => 5,
              'sourcemark_type' => 'macro_expansion',
              'status' => 'end'
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
        'file_name' => 'glossary.texi',
        'line_nr' => 46
      }
    }
  ],
  'type' => 'document_root'
};
$result_trees{'glossary'}{'contents'}[2]{'contents'}[2]{'contents'}[1]{'contents'}[1]{'extra'}{'node_content'}{'contents'}[0] = $result_trees{'glossary'}{'contents'}[2]{'contents'}[2]{'contents'}[1]{'contents'}[1]{'contents'}[0];
$result_trees{'glossary'}{'contents'}[2]{'contents'}[4]{'contents'}[1]{'contents'}[0]{'extra'}{'node_content'}{'contents'}[0] = $result_trees{'glossary'}{'contents'}[2]{'contents'}[4]{'contents'}[1]{'contents'}[0]{'contents'}[0];
$result_trees{'glossary'}{'contents'}[2]{'contents'}[4]{'contents'}[8]{'contents'}[0]{'extra'}{'node_content'}{'contents'}[0] = $result_trees{'glossary'}{'contents'}[2]{'contents'}[4]{'contents'}[8]{'contents'}[0]{'contents'}[0];

$result_texis{'glossary'} = '\\input texinfo.tex

@setfilename glossary

@macro glossarytext
@table @asis
@end macro

@macro glossary
@glossarytext
@end table

@end macro

@macro gentry {id, name, text}
@ifhtml
@ref{\\id\\,\\name\\}
@end ifhtml
@ifnothtml
\\name\\ (@pxref{\\id\\})
@end ifnothtml
@unmacro expandglossary
@macro expandglossary{glossary}
@unmacro glossarytext
@macro glossarytext
\\\\glossary\\\\
@item \\name\\ @anchor{\\id\\}
\\text\\
@end macro
@end macro
@expandglossary {@glossarytext{}}

@end macro

@node Top
@top Top

@menu 
* glossary::
@end menu

The @ref{id1,name1}
@unmacro expandglossary
@macro expandglossary{glossary}
@unmacro glossarytext
@macro glossarytext
\\glossary\\
@item name1 @anchor{id1}
text1, arg1 
@end macro
@end macro
@unmacro glossarytext
@macro glossarytext
@glossarytext{}
@item name1 @anchor{id1}
text1, arg1 
@end macro
 is used in many cases while
@ref{id2,name2}
@unmacro expandglossary
@macro expandglossary{glossary}
@unmacro glossarytext
@macro glossarytext
\\glossary\\
@item name2 @anchor{id2}
text2
@end macro
@end macro
@unmacro glossarytext
@macro glossarytext
@glossarytext{}
@item name2 @anchor{id2}
text2
@end macro
 is quite specific

@node glossary
@chapter glossary

 name2 @anchor{id2}
text2


';


$result_texts{'glossary'} = '



Top
***

* glossary::

The id1
 is used in many cases while
id2
 is quite specific

1 glossary
**********

name2 text2


';

$result_sectioning{'glossary'} = {
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
                    'normalized' => 'glossary'
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
$result_sectioning{'glossary'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[0]{'extra'}{'section_directions'}{'up'} = $result_sectioning{'glossary'}{'extra'}{'section_childs'}[0];
$result_sectioning{'glossary'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[0]{'extra'}{'toplevel_directions'}{'prev'} = $result_sectioning{'glossary'}{'extra'}{'section_childs'}[0];
$result_sectioning{'glossary'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[0]{'extra'}{'toplevel_directions'}{'up'} = $result_sectioning{'glossary'}{'extra'}{'section_childs'}[0];
$result_sectioning{'glossary'}{'extra'}{'section_childs'}[0]{'extra'}{'sectioning_root'} = $result_sectioning{'glossary'};

$result_nodes{'glossary'} = [
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
            'normalized' => 'glossary'
          }
        }
      },
      'normalized' => 'Top'
    }
  },
  {}
];
$result_nodes{'glossary'}[0]{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'prev'} = $result_nodes{'glossary'}[0];
$result_nodes{'glossary'}[0]{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'up'} = $result_nodes{'glossary'}[0];
$result_nodes{'glossary'}[1] = $result_nodes{'glossary'}[0]{'extra'}{'node_directions'}{'next'};

$result_menus{'glossary'} = [
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
      'normalized' => 'glossary'
    }
  }
];
$result_menus{'glossary'}[1]{'extra'}{'menu_directions'}{'up'} = $result_menus{'glossary'}[0];

$result_errors{'glossary'} = [
  {
    'error_line' => 'warning: use @comma{} instead of \\, in macro arg
',
    'file_name' => 'glossary.texi',
    'line_nr' => 42,
    'text' => 'use @comma{} instead of \\, in macro arg',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: @ifhtml should only appear at the beginning of a line (possibly involving @gentry)
',
    'file_name' => 'glossary.texi',
    'line_nr' => 42,
    'macro' => 'gentry',
    'text' => '@ifhtml should only appear at the beginning of a line',
    'type' => 'warning'
  },
  {
    'error_line' => 'recursive call of macro glossarytext is not allowed; use @rmacro if needed (possibly involving @glossarytext)
',
    'file_name' => 'glossary.texi',
    'line_nr' => 47,
    'macro' => 'glossarytext',
    'text' => 'recursive call of macro glossarytext is not allowed; use @rmacro if needed',
    'type' => 'error'
  },
  {
    'error_line' => '@item outside of table or list (possibly involving @glossarytext)
',
    'file_name' => 'glossary.texi',
    'line_nr' => 47,
    'macro' => 'glossarytext',
    'text' => '@item outside of table or list',
    'type' => 'error'
  },
  {
    'error_line' => 'unmatched `@end table\' (possibly involving @glossary)
',
    'file_name' => 'glossary.texi',
    'line_nr' => 47,
    'macro' => 'glossary',
    'text' => 'unmatched `@end table\'',
    'type' => 'error'
  },
  {
    'error_line' => '@ref reference to nonexistent node `id1\' (possibly involving @gentry)
',
    'file_name' => 'glossary.texi',
    'line_nr' => 42,
    'macro' => 'gentry',
    'text' => '@ref reference to nonexistent node `id1\'',
    'type' => 'error'
  }
];


$result_floats{'glossary'} = {};


1;
