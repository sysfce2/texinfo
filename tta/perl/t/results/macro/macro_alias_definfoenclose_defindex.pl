use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'macro_alias_definfoenclose_defindex'} = {
  'contents' => [
    {
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
        'line_nr' => 1
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
        'line_nr' => 2
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
        'line_nr' => 4
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
          'cmdname' => 'macro',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => ' phooindex {arg}
',
                  'type' => 'macro_line'
                }
              ],
              'type' => 'arguments_line'
            },
            {
              'text' => '||\\arg\\||
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
            'macro_name' => 'phooindex',
            'misc_args' => [
              'arg'
            ]
          },
          'source_info' => {
            'line_nr' => 7
          }
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
                            'text' => 'maa'
                          }
                        ],
                        'type' => 'brace_arg'
                      }
                    ],
                    'info' => {
                      'command_name' => 'phooindex'
                    },
                    'type' => 'macro_call'
                  },
                  'sourcemark_type' => 'macro_expansion',
                  'status' => 'start'
                },
                {
                  'counter' => 1,
                  'position' => 7,
                  'sourcemark_type' => 'macro_expansion',
                  'status' => 'end'
                }
              ],
              'text' => '||maa||
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
          'cmdname' => 'definfoenclose',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'phooindex,;,:'
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
              'phooindex',
              ';',
              ':'
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
              'cmdname' => 'phooindex',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'dbb'
                    }
                  ],
                  'type' => 'brace_container'
                }
              ],
              'extra' => {
                'begin' => ';',
                'end' => ':'
              },
              'info' => {
                'command_name' => 'phooindex'
              },
              'source_info' => {
                'line_nr' => 13
              },
              'type' => 'definfoenclose_command'
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
          'cmdname' => 'alias',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'phooindex = strong'
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
              'phooindex',
              'strong'
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
          'contents' => [
            {
              'cmdname' => 'strong',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'acc'
                    }
                  ],
                  'type' => 'brace_container'
                }
              ],
              'info' => {
                'alias_of' => 'phooindex'
              },
              'source_info' => {
                'line_nr' => 16
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
          'cmdname' => 'defindex',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'phoo'
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
              'phoo'
            ]
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
          'cmdname' => 'phooindex',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'idd'
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
              'phoo',
              1
            ]
          },
          'info' => {
            'command_name' => 'phooindex',
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
          'cmdname' => 'definfoenclose',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'phooindex,;,:'
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
              'phooindex',
              ';',
              ':'
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
          'contents' => [
            {
              'cmdname' => 'phooindex',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'dee'
                    }
                  ],
                  'type' => 'brace_container'
                }
              ],
              'extra' => {
                'begin' => ';',
                'end' => ':'
              },
              'info' => {
                'command_name' => 'phooindex'
              },
              'source_info' => {
                'line_nr' => 22
              },
              'type' => 'definfoenclose_command'
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
          'cmdname' => 'macro',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => ' phooindex {arg}
',
                  'type' => 'macro_line'
                }
              ],
              'type' => 'arguments_line'
            },
            {
              'text' => '!!\\arg\\!!
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
                'line_nr' => 26
              }
            }
          ],
          'extra' => {
            'macro_name' => 'phooindex',
            'misc_args' => [
              'arg'
            ]
          },
          'source_info' => {
            'line_nr' => 24
          }
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
                        'contents' => [
                          {
                            'text' => 'mff'
                          }
                        ],
                        'type' => 'line_arg'
                      }
                    ],
                    'info' => {
                      'command_name' => 'phooindex',
                      'spaces_before_argument' => {
                        'text' => ' '
                      }
                    },
                    'type' => 'macro_call_line'
                  },
                  'sourcemark_type' => 'macro_expansion',
                  'status' => 'start'
                },
                {
                  'counter' => 2,
                  'position' => 7,
                  'sourcemark_type' => 'macro_expansion',
                  'status' => 'end'
                }
              ],
              'text' => '!!mff!!
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
          'cmdname' => 'defindex',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'phoo'
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
              'phoo'
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
          'cmdname' => 'phooindex',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'igg'
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
              'phoo',
              2
            ]
          },
          'info' => {
            'command_name' => 'phooindex',
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'line_nr' => 30
          },
          'type' => 'index_entry_command'
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
                  'text' => ' phooindex {arg}
',
                  'type' => 'macro_line'
                }
              ],
              'type' => 'arguments_line'
            },
            {
              'text' => '!!\\arg\\!!
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
                'line_nr' => 34
              }
            }
          ],
          'extra' => {
            'macro_name' => 'phooindex',
            'misc_args' => [
              'arg'
            ]
          },
          'source_info' => {
            'line_nr' => 32
          }
        },
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
                            'text' => 'mhh'
                          }
                        ],
                        'type' => 'line_arg'
                      }
                    ],
                    'info' => {
                      'command_name' => 'phooindex',
                      'spaces_before_argument' => {
                        'text' => ' '
                      }
                    },
                    'type' => 'macro_call_line'
                  },
                  'sourcemark_type' => 'macro_expansion',
                  'status' => 'start'
                },
                {
                  'counter' => 3,
                  'position' => 7,
                  'sourcemark_type' => 'macro_expansion',
                  'status' => 'end'
                }
              ],
              'text' => '!!mhh!!
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
          'cmdname' => 'alias',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'phooindex = strong'
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
              'phooindex',
              'strong'
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
        },
        {
          'contents' => [
            {
              'cmdname' => 'strong',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'aii'
                    }
                  ],
                  'type' => 'brace_container'
                }
              ],
              'info' => {
                'alias_of' => 'phooindex'
              },
              'source_info' => {
                'line_nr' => 38
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
          'cmdname' => 'definfoenclose',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'phoo,;,:'
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
              'phoo',
              ';',
              ':'
            ]
          },
          'info' => {
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'line_nr' => 40
          }
        },
        {
          'contents' => [
            {
              'cmdname' => 'phoo',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'djj'
                    }
                  ],
                  'type' => 'brace_container'
                }
              ],
              'extra' => {
                'begin' => ';',
                'end' => ':'
              },
              'info' => {
                'command_name' => 'phoo'
              },
              'source_info' => {
                'line_nr' => 41
              },
              'type' => 'definfoenclose_command'
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
          'cmdname' => 'defindex',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'phoo'
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
              'phoo'
            ]
          },
          'info' => {
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'line_nr' => 43
          }
        },
        {
          'cmdname' => 'phooindex',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'ikk'
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
              'phoo',
              3
            ]
          },
          'info' => {
            'command_name' => 'phooindex',
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'line_nr' => 44
          },
          'type' => 'index_entry_command'
        },
        {
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'cmdname' => 'alias',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'phooindex = strong'
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
              'phooindex',
              'strong'
            ]
          },
          'info' => {
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'line_nr' => 46
          }
        },
        {
          'contents' => [
            {
              'cmdname' => 'strong',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'all'
                    }
                  ],
                  'type' => 'brace_container'
                }
              ],
              'info' => {
                'alias_of' => 'phooindex'
              },
              'source_info' => {
                'line_nr' => 47
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
          'cmdname' => 'macro',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => ' phooindex {arg}
',
                  'type' => 'macro_line'
                }
              ],
              'type' => 'arguments_line'
            },
            {
              'text' => '%%\\arg\\%%
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
                'line_nr' => 51
              }
            }
          ],
          'extra' => {
            'macro_name' => 'phooindex',
            'misc_args' => [
              'arg'
            ]
          },
          'source_info' => {
            'line_nr' => 49
          }
        },
        {
          'contents' => [
            {
              'source_marks' => [
                {
                  'counter' => 4,
                  'element' => {
                    'contents' => [
                      {
                        'contents' => [
                          {
                            'text' => 'mmm'
                          }
                        ],
                        'type' => 'brace_arg'
                      }
                    ],
                    'info' => {
                      'command_name' => 'phooindex'
                    },
                    'type' => 'macro_call'
                  },
                  'sourcemark_type' => 'macro_expansion',
                  'status' => 'start'
                },
                {
                  'counter' => 4,
                  'position' => 7,
                  'sourcemark_type' => 'macro_expansion',
                  'status' => 'end'
                }
              ],
              'text' => '%%mmm%%
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
          'cmdname' => 'printindex',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'phoo'
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
              'phoo'
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
        'line_nr' => 5
      }
    }
  ],
  'type' => 'document_root'
};
$result_trees{'macro_alias_definfoenclose_defindex'}{'contents'}[4]{'contents'}[12]{'extra'}{'element_node'} = $result_trees{'macro_alias_definfoenclose_defindex'}{'contents'}[3];
$result_trees{'macro_alias_definfoenclose_defindex'}{'contents'}[4]{'contents'}[21]{'extra'}{'element_node'} = $result_trees{'macro_alias_definfoenclose_defindex'}{'contents'}[3];
$result_trees{'macro_alias_definfoenclose_defindex'}{'contents'}[4]{'contents'}[33]{'extra'}{'element_node'} = $result_trees{'macro_alias_definfoenclose_defindex'}{'contents'}[3];

$result_texis{'macro_alias_definfoenclose_defindex'} = '@node Top
@top top

@node chap
@chapter chap

@macro phooindex {arg}
||\\arg\\||
@end macro
||maa||

@definfoenclose phooindex,;,:
@phooindex{dbb}

@alias phooindex = strong
@strong{acc}

@defindex phoo
@phooindex idd

@definfoenclose phooindex,;,:
@phooindex{dee}

@macro phooindex {arg}
!!\\arg\\!!
@end macro
!!mff!!

@defindex phoo
@phooindex igg

@macro phooindex {arg}
!!\\arg\\!!
@end macro
!!mhh!!

@alias phooindex = strong
@strong{aii}

@definfoenclose phoo,;,:
@phoo{djj}

@defindex phoo
@phooindex ikk

@alias phooindex = strong
@strong{all}

@macro phooindex {arg}
%%\\arg\\%%
@end macro
%%mmm%%

@printindex phoo
';


$result_texts{'macro_alias_definfoenclose_defindex'} = 'top
***

1 chap
******

||maa||

dbb

acc


dee

!!mff!!


!!mhh!!

aii

djj


all

%%mmm%%

';

$result_sectioning{'macro_alias_definfoenclose_defindex'} = {
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
$result_sectioning{'macro_alias_definfoenclose_defindex'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[0]{'extra'}{'section_directions'}{'up'} = $result_sectioning{'macro_alias_definfoenclose_defindex'}{'extra'}{'section_childs'}[0];
$result_sectioning{'macro_alias_definfoenclose_defindex'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[0]{'extra'}{'toplevel_directions'}{'prev'} = $result_sectioning{'macro_alias_definfoenclose_defindex'}{'extra'}{'section_childs'}[0];
$result_sectioning{'macro_alias_definfoenclose_defindex'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[0]{'extra'}{'toplevel_directions'}{'up'} = $result_sectioning{'macro_alias_definfoenclose_defindex'}{'extra'}{'section_childs'}[0];
$result_sectioning{'macro_alias_definfoenclose_defindex'}{'extra'}{'section_childs'}[0]{'extra'}{'sectioning_root'} = $result_sectioning{'macro_alias_definfoenclose_defindex'};

$result_nodes{'macro_alias_definfoenclose_defindex'} = [
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
$result_nodes{'macro_alias_definfoenclose_defindex'}[0]{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'prev'} = $result_nodes{'macro_alias_definfoenclose_defindex'}[0];
$result_nodes{'macro_alias_definfoenclose_defindex'}[0]{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'up'} = $result_nodes{'macro_alias_definfoenclose_defindex'}[0];
$result_nodes{'macro_alias_definfoenclose_defindex'}[1] = $result_nodes{'macro_alias_definfoenclose_defindex'}[0]{'extra'}{'node_directions'}{'next'};

$result_menus{'macro_alias_definfoenclose_defindex'} = [
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

$result_errors{'macro_alias_definfoenclose_defindex'} = [
  {
    'error_line' => 'warning: @definfoenclose is obsolete
',
    'line_nr' => 12,
    'text' => '@definfoenclose is obsolete',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: @definfoenclose is obsolete
',
    'line_nr' => 21,
    'text' => '@definfoenclose is obsolete',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: @definfoenclose is obsolete
',
    'line_nr' => 40,
    'text' => '@definfoenclose is obsolete',
    'type' => 'warning'
  }
];


$result_indices{'macro_alias_definfoenclose_defindex'} = {
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
    'phoo' => {
      'in_code' => 0,
      'name' => 'phoo'
    },
    'tp' => {
      'in_code' => 1,
      'name' => 'tp'
    },
    'vr' => {
      'in_code' => 1,
      'name' => 'vr'
    }
  }
};


$result_floats{'macro_alias_definfoenclose_defindex'} = {};


$result_indices_sort_strings{'macro_alias_definfoenclose_defindex'} = {
  'phoo' => [
    'idd',
    'igg',
    'ikk'
  ]
};



$result_converted{'plaintext'}->{'macro_alias_definfoenclose_defindex'} = 'top
***

1 chap
******

||maa||

   ;dbb:

   *acc*

   ;dee:

   !!mff!!

   !!mhh!!

   *aii*

   ;djj:

   *all*

   %%mmm%%

* Menu:

* idd:                                   chap.                 (line 12)
* igg:                                   chap.                 (line 16)
* ikk:                                   chap.                 (line 22)

';

1;
