use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'spaces_after_macro_linemacro_commands_in_call'} = {
  'contents' => [
    {
      'contents' => [
        {
          'cmdname' => 'linemacro',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => ' mylinecommand {first, second, rest}
',
                  'type' => 'macro_line'
                }
              ],
              'type' => 'arguments_line'
            },
            {
              'text' => '@defblock
',
              'type' => 'raw'
            },
            {
              'text' => '@defline category {\\first\\} A \\second\\ B \\rest\\
',
              'type' => 'raw'
            },
            {
              'text' => '@end defblock
',
              'type' => 'raw'
            },
            {
              'cmdname' => 'end',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'linemacro'
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
                'text_arg' => 'linemacro'
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'line_nr' => 5
              }
            }
          ],
          'extra' => {
            'macro_name' => 'mylinecommand',
            'misc_args' => [
              'first',
              'second',
              'rest'
            ]
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
          'cmdname' => 'macro',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => ' mymac {arg1}
',
                  'type' => 'macro_line'
                }
              ],
              'type' => 'arguments_line'
            },
            {
              'text' => '@samp{arg1}
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
                'line_nr' => 9
              }
            }
          ],
          'extra' => {
            'macro_name' => 'mymac',
            'misc_args' => [
              'arg1'
            ]
          },
          'source_info' => {
            'line_nr' => 7
          }
        },
        {
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'cmdname' => 'linemacro',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => ' mylinemac {name, rest}
',
                  'type' => 'macro_line'
                }
              ],
              'type' => 'arguments_line'
            },
            {
              'text' => '{\\name\\} \\rest\\
',
              'type' => 'raw'
            },
            {
              'cmdname' => 'end',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'linemacro'
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
                'text_arg' => 'linemacro'
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
            'macro_name' => 'mylinemac',
            'misc_args' => [
              'name',
              'rest'
            ]
          },
          'source_info' => {
            'line_nr' => 11
          }
        },
        {
          'source_marks' => [
            {
              'counter' => 1,
              'element' => {
                'contents' => [
                  {
                    'contents' => [
                      {
                        'text' => '@mymac'
                      }
                    ],
                    'type' => 'line_arg'
                  },
                  {
                    'contents' => [
                      {
                        'text' => 'aa',
                        'type' => 'bracketed_linemacro_arg'
                      }
                    ],
                    'info' => {
                      'spaces_before_argument' => {
                        'text' => ' '
                      }
                    },
                    'type' => 'line_arg'
                  },
                  {
                    'contents' => [
                      {
                        'text' => '@mymac {bb}'
                      }
                    ],
                    'info' => {
                      'spaces_before_argument' => {
                        'text' => ' '
                      }
                    },
                    'type' => 'line_arg'
                  }
                ],
                'info' => {
                  'command_name' => 'mylinecommand',
                  'spaces_before_argument' => {
                    'text' => ' '
                  }
                },
                'type' => 'linemacro_call'
              },
              'position' => 1,
              'sourcemark_type' => 'linemacro_expansion',
              'status' => 'start'
            }
          ],
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'cmdname' => 'defblock',
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
              'cmdname' => 'defline',
              'contents' => [
                {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'contents' => [
                            {
                              'text' => 'category'
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
                              'source_marks' => [
                                {
                                  'counter' => 1,
                                  'element' => {
                                    'contents' => [
                                      {
                                        'contents' => [
                                          {
                                            'text' => '} A aa B @mymac {bb}'
                                          }
                                        ],
                                        'type' => 'line_arg'
                                      }
                                    ],
                                    'info' => {
                                      'command_name' => 'mymac'
                                    },
                                    'type' => 'macro_call_line'
                                  },
                                  'sourcemark_type' => 'macro_expansion',
                                  'status' => 'start'
                                }
                              ],
                              'text' => ''
                            },
                            {
                              'cmdname' => 'samp',
                              'contents' => [
                                {
                                  'contents' => [
                                    {
                                      'text' => 'arg1'
                                    }
                                  ],
                                  'type' => 'brace_container'
                                }
                              ],
                              'source_info' => {
                                'line_nr' => 15,
                                'macro' => 'mymac'
                              },
                              'source_marks' => [
                                {
                                  'counter' => 1,
                                  'sourcemark_type' => 'macro_expansion',
                                  'status' => 'end'
                                }
                              ]
                            }
                          ],
                          'info' => {
                            'spaces_after_argument' => {
                              'text' => '
'
                            }
                          },
                          'source_info' => {
                            'line_nr' => 15,
                            'macro' => 'mylinecommand'
                          },
                          'type' => 'bracketed_arg'
                        }
                      ],
                      'type' => 'def_name'
                    }
                  ],
                  'type' => 'line_arg'
                }
              ],
              'extra' => {
                'def_command' => 'defline',
                'def_index_element' => {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => ''
                        },
                        {
                          'cmdname' => 'samp',
                          'contents' => [
                            {
                              'contents' => [
                                {
                                  'text' => 'arg1'
                                }
                              ],
                              'type' => 'brace_container'
                            }
                          ]
                        }
                      ],
                      'info' => {
                        'spaces_after_argument' => {
                          'text' => '
'
                        }
                      },
                      'type' => 'bracketed_arg'
                    }
                  ],
                  'type' => 'def_name'
                },
                'original_def_cmdname' => 'defline'
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'line_nr' => 15,
                'macro' => 'mylinecommand'
              }
            },
            {
              'cmdname' => 'end',
              'contents' => [
                {
                  'contents' => [
                    {
                      'source_marks' => [
                        {
                          'counter' => 1,
                          'position' => 8,
                          'sourcemark_type' => 'linemacro_expansion',
                          'status' => 'end'
                        }
                      ],
                      'text' => 'defblock'
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
                'text_arg' => 'defblock'
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'line_nr' => 15,
                'macro' => 'mylinecommand'
              }
            }
          ],
          'source_info' => {
            'line_nr' => 15,
            'macro' => 'mylinecommand'
          }
        },
        {
          'source_marks' => [
            {
              'counter' => 2,
              'element' => {
                'contents' => [
                  {
                    'contents' => [
                      {
                        'text' => '@mylinemac'
                      }
                    ],
                    'type' => 'line_arg'
                  },
                  {
                    'contents' => [
                      {
                        'text' => 'Fun',
                        'type' => 'bracketed_linemacro_arg'
                      }
                    ],
                    'info' => {
                      'spaces_before_argument' => {
                        'text' => ' '
                      }
                    },
                    'type' => 'line_arg'
                  },
                  {
                    'contents' => [
                      {
                        'text' => '{other} and remaining'
                      }
                    ],
                    'info' => {
                      'spaces_before_argument' => {
                        'text' => ' '
                      }
                    },
                    'type' => 'line_arg'
                  }
                ],
                'info' => {
                  'command_name' => 'mylinecommand',
                  'spaces_before_argument' => {
                    'text' => ' '
                  }
                },
                'type' => 'linemacro_call'
              },
              'position' => 1,
              'sourcemark_type' => 'linemacro_expansion',
              'status' => 'start'
            }
          ],
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'cmdname' => 'defblock',
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
              'cmdname' => 'defline',
              'contents' => [
                {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'contents' => [
                            {
                              'text' => 'category'
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
                              'source_marks' => [
                                {
                                  'counter' => 3,
                                  'element' => {
                                    'contents' => [
                                      {
                                        'contents' => [
                                          {
                                            'text' => '}'
                                          }
                                        ],
                                        'type' => 'line_arg'
                                      },
                                      {
                                        'contents' => [
                                          {
                                            'text' => 'A Fun B {other} and remaining'
                                          }
                                        ],
                                        'info' => {
                                          'spaces_before_argument' => {
                                            'text' => ' '
                                          }
                                        },
                                        'type' => 'line_arg'
                                      }
                                    ],
                                    'info' => {
                                      'command_name' => 'mylinemac'
                                    },
                                    'type' => 'linemacro_call'
                                  },
                                  'sourcemark_type' => 'linemacro_expansion',
                                  'status' => 'start'
                                }
                              ],
                              'text' => ''
                            }
                          ],
                          'source_info' => {
                            'line_nr' => 17,
                            'macro' => 'mylinecommand'
                          },
                          'type' => 'bracketed_arg'
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
                              'text' => 'A'
                            }
                          ],
                          'type' => 'def_line_arg'
                        }
                      ],
                      'type' => 'def_arg'
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
                              'text' => 'Fun'
                            }
                          ],
                          'type' => 'def_line_arg'
                        }
                      ],
                      'type' => 'def_arg'
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
                              'text' => 'B'
                            }
                          ],
                          'type' => 'def_line_arg'
                        }
                      ],
                      'type' => 'def_arg'
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
                              'text' => 'other'
                            }
                          ],
                          'source_info' => {
                            'line_nr' => 17,
                            'macro' => 'mylinemac'
                          },
                          'type' => 'bracketed_arg'
                        }
                      ],
                      'type' => 'def_arg'
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
                              'text' => 'and'
                            }
                          ],
                          'type' => 'def_line_arg'
                        }
                      ],
                      'type' => 'def_arg'
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
                              'source_marks' => [
                                {
                                  'counter' => 3,
                                  'position' => 9,
                                  'sourcemark_type' => 'linemacro_expansion',
                                  'status' => 'end'
                                }
                              ],
                              'text' => 'remaining'
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
              'extra' => {
                'def_command' => 'defline',
                'original_def_cmdname' => 'defline'
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'line_nr' => 17,
                'macro' => 'mylinecommand'
              }
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
                          'position' => 8,
                          'sourcemark_type' => 'linemacro_expansion',
                          'status' => 'end'
                        }
                      ],
                      'text' => 'defblock'
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
                'text_arg' => 'defblock'
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'line_nr' => 17,
                'macro' => 'mylinecommand'
              }
            }
          ],
          'source_info' => {
            'line_nr' => 17,
            'macro' => 'mylinecommand'
          }
        },
        {
          'text' => '
',
          'type' => 'empty_line'
        }
      ],
      'type' => 'before_node_section'
    }
  ],
  'type' => 'document_root'
};

$result_texis{'spaces_after_macro_linemacro_commands_in_call'} = '@linemacro mylinecommand {first, second, rest}
@defblock
@defline category {\\first\\} A \\second\\ B \\rest\\
@end defblock
@end linemacro

@macro mymac {arg1}
@samp{arg1}
@end macro

@linemacro mylinemac {name, rest}
{\\name\\} \\rest\\
@end linemacro

@defblock
@defline category {@samp{arg1}
}@end defblock

@defblock
@defline category {} A Fun B {other} and remaining
@end defblock

';


$result_texts{'spaces_after_macro_linemacro_commands_in_call'} = '


category: arg1

category:  A Fun B other and remaining

';

$result_errors{'spaces_after_macro_linemacro_commands_in_call'} = [
  {
    'error_line' => 'misplaced { (possibly involving @mylinecommand)
',
    'line_nr' => 15,
    'macro' => 'mylinecommand',
    'text' => 'misplaced {',
    'type' => 'error'
  },
  {
    'error_line' => 'misplaced { (possibly involving @mylinemac)
',
    'line_nr' => 17,
    'macro' => 'mylinemac',
    'text' => 'misplaced {',
    'type' => 'error'
  },
  {
    'error_line' => 'misplaced } (possibly involving @mylinemac)
',
    'line_nr' => 17,
    'macro' => 'mylinemac',
    'text' => 'misplaced }',
    'type' => 'error'
  },
  {
    'error_line' => 'warning: missing name for @defline (possibly involving @mylinecommand)
',
    'line_nr' => 17,
    'macro' => 'mylinecommand',
    'text' => 'missing name for @defline',
    'type' => 'warning'
  }
];


$result_floats{'spaces_after_macro_linemacro_commands_in_call'} = {};


1;
