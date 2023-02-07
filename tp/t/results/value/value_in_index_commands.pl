use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'value_in_index_commands'} = {
  'contents' => [
    {
      'contents' => [
        {
          'args' => [
            {
              'text' => 'cp',
              'type' => 'misc_arg'
            },
            {
              'text' => 'cp',
              'type' => 'misc_arg'
            }
          ],
          'cmdname' => 'set',
          'extra' => {
            'misc_args' => [
              'cp',
              'cp'
            ]
          },
          'info' => {
            'arg_line' => ' cp cp
'
          }
        },
        {
          'args' => [
            {
              'text' => 'fn',
              'type' => 'misc_arg'
            },
            {
              'text' => 'fn',
              'type' => 'misc_arg'
            }
          ],
          'cmdname' => 'set',
          'extra' => {
            'misc_args' => [
              'fn',
              'fn'
            ]
          },
          'info' => {
            'arg_line' => ' fn fn
'
          }
        },
        {
          'args' => [
            {
              'text' => 'syncodeindex_command',
              'type' => 'misc_arg'
            },
            {
              'text' => '@syncodeindex',
              'type' => 'misc_arg'
            }
          ],
          'cmdname' => 'set',
          'extra' => {
            'misc_args' => [
              'syncodeindex_command',
              '@syncodeindex'
            ]
          },
          'info' => {
            'arg_line' => ' syncodeindex_command @syncodeindex
'
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
                  'source_marks' => [
                    {
                      'counter' => 1,
                      'line' => 'cp',
                      'position' => 2,
                      'sourcemark_type' => 'value_expansion',
                      'status' => 'end'
                    },
                    {
                      'counter' => 2,
                      'element' => {
                        'args' => [
                          {
                            'text' => 'fn'
                          }
                        ],
                        'cmdname' => 'value'
                      },
                      'line' => 'fn',
                      'position' => 3,
                      'sourcemark_type' => 'value_expansion',
                      'status' => 'start'
                    },
                    {
                      'counter' => 2,
                      'line' => 'fn',
                      'position' => 5,
                      'sourcemark_type' => 'value_expansion',
                      'status' => 'end'
                    }
                  ],
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
          'cmdname' => 'syncodeindex',
          'extra' => {
            'misc_args' => [
              'cp',
              'fn'
            ]
          },
          'info' => {
            'spaces_before_argument' => {
              'source_marks' => [
                {
                  'counter' => 1,
                  'element' => {
                    'args' => [
                      {
                        'text' => 'cp'
                      }
                    ],
                    'cmdname' => 'value'
                  },
                  'line' => 'cp',
                  'position' => 1,
                  'sourcemark_type' => 'value_expansion',
                  'status' => 'start'
                }
              ],
              'text' => ' '
            }
          },
          'source_info' => {
            'file_name' => '',
            'line_nr' => 5,
            'macro' => ''
          },
          'source_marks' => [
            {
              'counter' => 3,
              'element' => {
                'args' => [
                  {
                    'text' => 'syncodeindex_command'
                  }
                ],
                'cmdname' => 'value'
              },
              'line' => '@syncodeindex',
              'sourcemark_type' => 'value_expansion',
              'status' => 'start'
            }
          ]
        },
        {
          'args' => [
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
          'cmdname' => 'syncodeindex',
          'extra' => {
            'misc_args' => [
              'cp',
              'fn'
            ]
          },
          'info' => {
            'spaces_before_argument' => {
              'source_marks' => [
                {
                  'counter' => 3,
                  'line' => '@syncodeindex',
                  'sourcemark_type' => 'value_expansion',
                  'status' => 'end'
                }
              ],
              'text' => ' '
            }
          },
          'source_info' => {
            'file_name' => '',
            'line_nr' => 6,
            'macro' => ''
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
              'text' => 'truc',
              'type' => 'misc_arg'
            },
            {
              'text' => 'truc',
              'type' => 'misc_arg'
            }
          ],
          'cmdname' => 'set',
          'extra' => {
            'misc_args' => [
              'truc',
              'truc'
            ]
          },
          'info' => {
            'arg_line' => ' truc truc
'
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
              'text' => 'definedx truc
'
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'source_marks' => [
                        {
                          'counter' => 4,
                          'line' => 'truc',
                          'position' => 4,
                          'sourcemark_type' => 'value_expansion',
                          'status' => 'end'
                        }
                      ],
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
              'cmdname' => 'defindex',
              'extra' => {
                'misc_args' => [
                  'truc'
                ]
              },
              'info' => {
                'spaces_before_argument' => {
                  'source_marks' => [
                    {
                      'counter' => 4,
                      'element' => {
                        'args' => [
                          {
                            'text' => 'truc'
                          }
                        ],
                        'cmdname' => 'value'
                      },
                      'line' => 'truc',
                      'position' => 1,
                      'sourcemark_type' => 'value_expansion',
                      'status' => 'start'
                    }
                  ],
                  'text' => ' '
                }
              },
              'source_info' => {
                'file_name' => '',
                'line_nr' => 11,
                'macro' => ''
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
          'args' => [
            {
              'text' => 'trucindex_command',
              'type' => 'misc_arg'
            },
            {
              'text' => '@trucindex',
              'type' => 'misc_arg'
            }
          ],
          'cmdname' => 'set',
          'extra' => {
            'misc_args' => [
              'trucindex_command',
              '@trucindex'
            ]
          },
          'info' => {
            'arg_line' => ' trucindex_command @trucindex
'
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
              'text' => 'codeidx',
              'type' => 'misc_arg'
            },
            {
              'text' => 'codeidx',
              'type' => 'misc_arg'
            }
          ],
          'cmdname' => 'set',
          'extra' => {
            'misc_args' => [
              'codeidx',
              'codeidx'
            ]
          },
          'info' => {
            'arg_line' => ' codeidx codeidx
'
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
                  'source_marks' => [
                    {
                      'counter' => 5,
                      'line' => 'codeidx',
                      'position' => 7,
                      'sourcemark_type' => 'value_expansion',
                      'status' => 'end'
                    }
                  ],
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
          'cmdname' => 'defcodeindex',
          'extra' => {
            'misc_args' => [
              'codeidx'
            ]
          },
          'info' => {
            'spaces_before_argument' => {
              'source_marks' => [
                {
                  'counter' => 5,
                  'element' => {
                    'args' => [
                      {
                        'text' => 'codeidx'
                      }
                    ],
                    'cmdname' => 'value'
                  },
                  'line' => 'codeidx',
                  'position' => 1,
                  'sourcemark_type' => 'value_expansion',
                  'status' => 'start'
                }
              ],
              'text' => ' '
            }
          },
          'source_info' => {
            'file_name' => '',
            'line_nr' => 18,
            'macro' => ''
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
              'text' => 'defcodeindex_entry',
              'type' => 'misc_arg'
            },
            {
              'text' => 'a @var{index entry} t@\'e @^{@dotless{i}}',
              'type' => 'misc_arg'
            }
          ],
          'cmdname' => 'set',
          'extra' => {
            'misc_args' => [
              'defcodeindex_entry',
              'a @var{index entry} t@\'e @^{@dotless{i}}'
            ]
          },
          'info' => {
            'arg_line' => ' defcodeindex_entry a @var{index entry} t@\'e @^{@dotless{i}}
'
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
      'contents' => [
        {
          'source_marks' => [
            {
              'counter' => 6,
              'element' => {
                'args' => [
                  {
                    'text' => 'trucindex_command'
                  }
                ],
                'cmdname' => 'value'
              },
              'line' => '@trucindex',
              'position' => 1,
              'sourcemark_type' => 'value_expansion',
              'status' => 'start'
            }
          ],
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'args' => [
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
          'cmdname' => 'trucindex',
          'extra' => {
            'index_entry' => {
              'content_normalized' => [],
              'entry_content' => [],
              'entry_element' => {},
              'entry_node' => {},
              'entry_number' => 1,
              'in_code' => 0,
              'index_at_command' => 'trucindex',
              'index_ignore_chars' => {},
              'index_name' => 'truc',
              'index_type_command' => 'trucindex'
            }
          },
          'info' => {
            'spaces_before_argument' => {
              'source_marks' => [
                {
                  'counter' => 6,
                  'line' => '@trucindex',
                  'sourcemark_type' => 'value_expansion',
                  'status' => 'end'
                }
              ],
              'text' => ' '
            }
          },
          'source_info' => {
            'file_name' => '',
            'line_nr' => 24,
            'macro' => ''
          },
          'type' => 'index_entry_command'
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
                  'text' => 'a '
                },
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'text' => 'index entry'
                        }
                      ],
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'var',
                  'source_info' => {
                    'file_name' => '',
                    'line_nr' => 26,
                    'macro' => ''
                  }
                },
                {
                  'text' => ' t'
                },
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'text' => 'e'
                        }
                      ],
                      'type' => 'following_arg'
                    }
                  ],
                  'cmdname' => '\'',
                  'source_info' => {
                    'file_name' => '',
                    'line_nr' => 26,
                    'macro' => ''
                  }
                },
                {
                  'text' => ' '
                },
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'args' => [
                            {
                              'contents' => [
                                {
                                  'text' => 'i'
                                }
                              ],
                              'type' => 'brace_command_arg'
                            }
                          ],
                          'cmdname' => 'dotless',
                          'source_info' => {
                            'file_name' => '',
                            'line_nr' => 26,
                            'macro' => ''
                          }
                        }
                      ],
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => '^',
                  'source_info' => {
                    'file_name' => '',
                    'line_nr' => 26,
                    'macro' => ''
                  },
                  'source_marks' => [
                    {
                      'counter' => 7,
                      'line' => 'a @var{index entry} t@\'e @^{@dotless{i}}',
                      'sourcemark_type' => 'value_expansion',
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
              'type' => 'line_arg'
            }
          ],
          'cmdname' => 'codeidxindex',
          'extra' => {
            'index_entry' => {
              'content_normalized' => [],
              'entry_content' => [],
              'entry_element' => {},
              'entry_node' => {},
              'entry_number' => 1,
              'in_code' => 1,
              'index_at_command' => 'codeidxindex',
              'index_ignore_chars' => {},
              'index_name' => 'codeidx',
              'index_type_command' => 'codeidxindex'
            }
          },
          'info' => {
            'spaces_before_argument' => {
              'source_marks' => [
                {
                  'counter' => 7,
                  'element' => {
                    'args' => [
                      {
                        'text' => 'defcodeindex_entry'
                      }
                    ],
                    'cmdname' => 'value'
                  },
                  'line' => 'a @var{index entry} t@\'e @^{@dotless{i}}',
                  'position' => 1,
                  'sourcemark_type' => 'value_expansion',
                  'status' => 'start'
                }
              ],
              'text' => ' '
            }
          },
          'source_info' => {
            'file_name' => '',
            'line_nr' => 26,
            'macro' => ''
          },
          'type' => 'index_entry_command'
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
                  'source_marks' => [
                    {
                      'counter' => 8,
                      'line' => 'truc',
                      'position' => 4,
                      'sourcemark_type' => 'value_expansion',
                      'status' => 'end'
                    }
                  ],
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
          'cmdname' => 'kindex',
          'extra' => {
            'index_entry' => {
              'content_normalized' => [],
              'entry_content' => [],
              'entry_element' => {},
              'entry_node' => {},
              'entry_number' => 1,
              'in_code' => 1,
              'index_at_command' => 'kindex',
              'index_ignore_chars' => {},
              'index_name' => 'ky',
              'index_type_command' => 'kindex'
            }
          },
          'info' => {
            'spaces_before_argument' => {
              'source_marks' => [
                {
                  'counter' => 8,
                  'element' => {
                    'args' => [
                      {
                        'text' => 'truc'
                      }
                    ],
                    'cmdname' => 'value'
                  },
                  'line' => 'truc',
                  'position' => 1,
                  'sourcemark_type' => 'value_expansion',
                  'status' => 'start'
                }
              ],
              'text' => ' '
            }
          },
          'source_info' => {
            'file_name' => '',
            'line_nr' => 28,
            'macro' => ''
          },
          'type' => 'index_entry_command'
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'source_marks' => [
                    {
                      'counter' => 9,
                      'element' => {
                        'args' => [
                          {
                            'text' => 'codeidx'
                          }
                        ],
                        'cmdname' => 'value'
                      },
                      'line' => 'codeidx',
                      'position' => 7,
                      'sourcemark_type' => 'value_expansion',
                      'status' => 'start'
                    },
                    {
                      'counter' => 9,
                      'line' => 'codeidx',
                      'position' => 14,
                      'sourcemark_type' => 'value_expansion',
                      'status' => 'end'
                    }
                  ],
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
          'cmdname' => 'pindex',
          'extra' => {
            'index_entry' => {
              'content_normalized' => [],
              'entry_content' => [],
              'entry_element' => {},
              'entry_node' => {},
              'entry_number' => 1,
              'in_code' => 1,
              'index_at_command' => 'pindex',
              'index_ignore_chars' => {},
              'index_name' => 'pg',
              'index_type_command' => 'pindex'
            }
          },
          'info' => {
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'file_name' => '',
            'line_nr' => 29,
            'macro' => ''
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
              'text' => 'value truc
'
            }
          ],
          'type' => 'paragraph'
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'source_marks' => [
                    {
                      'counter' => 10,
                      'line' => 'truc',
                      'position' => 4,
                      'sourcemark_type' => 'value_expansion',
                      'status' => 'end'
                    }
                  ],
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
          'cmdname' => 'printindex',
          'extra' => {
            'misc_args' => [
              'truc'
            ]
          },
          'info' => {
            'spaces_before_argument' => {
              'source_marks' => [
                {
                  'counter' => 10,
                  'element' => {
                    'args' => [
                      {
                        'text' => 'truc'
                      }
                    ],
                    'cmdname' => 'value'
                  },
                  'line' => 'truc',
                  'position' => 1,
                  'sourcemark_type' => 'value_expansion',
                  'status' => 'start'
                }
              ],
              'text' => ' '
            }
          },
          'source_info' => {
            'file_name' => '',
            'line_nr' => 32,
            'macro' => ''
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
          'args' => [
            {
              'contents' => [
                {
                  'source_marks' => [
                    {
                      'counter' => 11,
                      'line' => 'cp',
                      'position' => 2,
                      'sourcemark_type' => 'value_expansion',
                      'status' => 'end'
                    }
                  ],
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
          'cmdname' => 'printindex',
          'extra' => {
            'misc_args' => [
              'cp'
            ]
          },
          'info' => {
            'spaces_before_argument' => {
              'source_marks' => [
                {
                  'counter' => 11,
                  'element' => {
                    'args' => [
                      {
                        'text' => 'cp'
                      }
                    ],
                    'cmdname' => 'value'
                  },
                  'line' => 'cp',
                  'position' => 1,
                  'sourcemark_type' => 'value_expansion',
                  'status' => 'start'
                }
              ],
              'text' => ' '
            }
          },
          'source_info' => {
            'file_name' => '',
            'line_nr' => 35,
            'macro' => ''
          }
        }
      ],
      'extra' => {
        'isindex' => 1,
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
        'file_name' => '',
        'line_nr' => 22,
        'macro' => ''
      }
    }
  ],
  'type' => 'document_root'
};
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[1]{'extra'}{'index_entry'}{'content_normalized'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'};
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[1]{'extra'}{'index_entry'}{'entry_content'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'};
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[1]{'extra'}{'index_entry'}{'entry_element'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[1];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[1]{'extra'}{'index_entry'}{'entry_node'} = $result_trees{'value_in_index_commands'}{'contents'}[1];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[3]{'extra'}{'index_entry'}{'content_normalized'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'};
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[3]{'extra'}{'index_entry'}{'entry_content'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[3]{'args'}[0]{'contents'};
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[3]{'extra'}{'index_entry'}{'entry_element'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[3];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[3]{'extra'}{'index_entry'}{'entry_node'} = $result_trees{'value_in_index_commands'}{'contents'}[1];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[5]{'extra'}{'index_entry'}{'content_normalized'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[5]{'args'}[0]{'contents'};
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[5]{'extra'}{'index_entry'}{'entry_content'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[5]{'args'}[0]{'contents'};
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[5]{'extra'}{'index_entry'}{'entry_element'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[5];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[5]{'extra'}{'index_entry'}{'entry_node'} = $result_trees{'value_in_index_commands'}{'contents'}[1];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[6]{'extra'}{'index_entry'}{'content_normalized'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[6]{'args'}[0]{'contents'};
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[6]{'extra'}{'index_entry'}{'entry_content'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[6]{'args'}[0]{'contents'};
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[6]{'extra'}{'index_entry'}{'entry_element'} = $result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[6];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'contents'}[6]{'extra'}{'index_entry'}{'entry_node'} = $result_trees{'value_in_index_commands'}{'contents'}[1];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'extra'}{'node_content'}[0] = $result_trees{'value_in_index_commands'}{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'value_in_index_commands'}{'contents'}[1]{'extra'}{'nodes_manuals'}[0]{'node_content'}[0] = $result_trees{'value_in_index_commands'}{'contents'}[1]{'args'}[0]{'contents'}[0];

$result_texis{'value_in_index_commands'} = '@set cp cp
@set fn fn
@set syncodeindex_command @syncodeindex

@syncodeindex cp fn
@syncodeindex cp fn

@set truc truc

definedx truc
@defindex truc
after

@set trucindex_command @trucindex

@set codeidx codeidx

@defcodeindex codeidx

@set defcodeindex_entry a @var{index entry} t@\'e @^{@dotless{i}}

@node Top

@trucindex index truc

@codeidxindex a @var{index entry} t@\'e @^{@dotless{i}}

@kindex truc kindex
@pindex pindex codeidx

value truc
@printindex truc

value cp
@printindex cp
';


$result_texts{'value_in_index_commands'} = '


definedx truc
after









value truc

value cp
';

$result_nodes{'value_in_index_commands'} = {
  'cmdname' => 'node',
  'extra' => {
    'isindex' => 1,
    'normalized' => 'Top'
  },
  'info' => {}
};

$result_menus{'value_in_index_commands'} = {
  'cmdname' => 'node',
  'extra' => {
    'isindex' => 1,
    'normalized' => 'Top'
  },
  'info' => {}
};

$result_errors{'value_in_index_commands'} = [
  {
    'error_line' => 'warning: printing an index `cp\' merged in another one, `fn\'
',
    'file_name' => '',
    'line_nr' => 35,
    'macro' => '',
    'text' => 'printing an index `cp\' merged in another one, `fn\'',
    'type' => 'warning'
  }
];


$result_indices{'value_in_index_commands'} = {
  'index_names' => {
    'codeidx' => {
      'contained_indices' => {
        'codeidx' => 1
      },
      'in_code' => 1,
      'name' => 'codeidx'
    },
    'cp' => {
      'in_code' => 1,
      'merged_in' => 'fn',
      'name' => 'cp'
    },
    'fn' => {
      'contained_indices' => {
        'cp' => 1,
        'fn' => 1
      },
      'in_code' => 1,
      'name' => 'fn'
    },
    'ky' => {
      'contained_indices' => {
        'ky' => 1
      },
      'in_code' => 1,
      'name' => 'ky'
    },
    'pg' => {
      'contained_indices' => {
        'pg' => 1
      },
      'in_code' => 1,
      'name' => 'pg'
    },
    'tp' => {
      'contained_indices' => {
        'tp' => 1
      },
      'in_code' => 1,
      'name' => 'tp'
    },
    'truc' => {
      'contained_indices' => {
        'truc' => 1
      },
      'in_code' => 0,
      'name' => 'truc'
    },
    'vr' => {
      'contained_indices' => {
        'vr' => 1
      },
      'in_code' => 1,
      'name' => 'vr'
    }
  }
};


$result_floats{'value_in_index_commands'} = {};


$result_indices_sort_strings{'value_in_index_commands'} = {
  'codeidx' => [
    'a index entry te\' i^'
  ],
  'ky' => [
    'truc kindex'
  ],
  'pg' => [
    'pindex codeidx'
  ],
  'truc' => [
    'index truc'
  ]
};


1;
