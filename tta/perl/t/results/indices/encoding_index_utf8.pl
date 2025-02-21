use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'encoding_index_utf8'} = {
  'contents' => [
    {
      'contents' => [
        {
          'contents' => [
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
              'cmdname' => 'documentencoding',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'utf-8'
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
                'input_encoding_name' => 'utf-8',
                'text_arg' => 'utf-8'
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'file_name' => 'encoding_index_utf8.texi',
                'line_nr' => 2
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
        'file_name' => 'encoding_index_utf8.texi',
        'line_nr' => 4
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
                  'text' => 'encoding index utf8'
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
        'file_name' => 'encoding_index_utf8.texi',
        'line_nr' => 5
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
          'cmdname' => 'cindex',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => "\x{e9} \x{e9}"
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
            'file_name' => 'encoding_index_utf8.texi',
            'line_nr' => 9
          },
          'type' => 'index_entry_command'
        },
        {
          'cmdname' => 'cindex',
          'contents' => [
            {
              'contents' => [
                {
                  'cmdname' => '"',
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
                    'file_name' => 'encoding_index_utf8.texi',
                    'line_nr' => 10
                  }
                },
                {
                  'text' => ' '
                },
                {
                  'cmdname' => '"',
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
                    'file_name' => 'encoding_index_utf8.texi',
                    'line_nr' => 10
                  }
                },
                {
                  'cmdname' => '"',
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
                    'file_name' => 'encoding_index_utf8.texi',
                    'line_nr' => 10
                  }
                },
                {
                  'cmdname' => '"',
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
                    'file_name' => 'encoding_index_utf8.texi',
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
              'type' => 'line_arg'
            }
          ],
          'extra' => {
            'element_node' => {},
            'index_entry' => [
              'cp',
              2
            ]
          },
          'info' => {
            'command_name' => 'cindex',
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'file_name' => 'encoding_index_utf8.texi',
            'line_nr' => 10
          },
          'type' => 'index_entry_command'
        },
        {
          'cmdname' => 'cindex',
          'contents' => [
            {
              'contents' => [
                {
                  'cmdname' => '^',
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'i'
                        }
                      ],
                      'type' => 'following_arg'
                    }
                  ],
                  'source_info' => {
                    'file_name' => 'encoding_index_utf8.texi',
                    'line_nr' => 11
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
                          'text' => 'i'
                        }
                      ],
                      'type' => 'following_arg'
                    }
                  ],
                  'source_info' => {
                    'file_name' => 'encoding_index_utf8.texi',
                    'line_nr' => 11
                  }
                },
                {
                  'cmdname' => '^',
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'i'
                        }
                      ],
                      'type' => 'following_arg'
                    }
                  ],
                  'source_info' => {
                    'file_name' => 'encoding_index_utf8.texi',
                    'line_nr' => 11
                  }
                },
                {
                  'cmdname' => '^',
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'i'
                        }
                      ],
                      'type' => 'following_arg'
                    }
                  ],
                  'source_info' => {
                    'file_name' => 'encoding_index_utf8.texi',
                    'line_nr' => 11
                  }
                },
                {
                  'cmdname' => '^',
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'i'
                        }
                      ],
                      'type' => 'following_arg'
                    }
                  ],
                  'source_info' => {
                    'file_name' => 'encoding_index_utf8.texi',
                    'line_nr' => 11
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
              'cp',
              3
            ]
          },
          'info' => {
            'command_name' => 'cindex',
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'file_name' => 'encoding_index_utf8.texi',
            'line_nr' => 11
          },
          'type' => 'index_entry_command'
        },
        {
          'cmdname' => 'cindex',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'a'
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
              4
            ]
          },
          'info' => {
            'command_name' => 'cindex',
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'file_name' => 'encoding_index_utf8.texi',
            'line_nr' => 12
          },
          'type' => 'index_entry_command'
        },
        {
          'cmdname' => 'cindex',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'b'
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
              5
            ]
          },
          'info' => {
            'command_name' => 'cindex',
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'file_name' => 'encoding_index_utf8.texi',
            'line_nr' => 13
          },
          'type' => 'index_entry_command'
        },
        {
          'cmdname' => 'cindex',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'c'
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
              6
            ]
          },
          'info' => {
            'command_name' => 'cindex',
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'file_name' => 'encoding_index_utf8.texi',
            'line_nr' => 14
          },
          'type' => 'index_entry_command'
        },
        {
          'cmdname' => 'cindex',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'd'
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
              7
            ]
          },
          'info' => {
            'command_name' => 'cindex',
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'file_name' => 'encoding_index_utf8.texi',
            'line_nr' => 15
          },
          'type' => 'index_entry_command'
        },
        {
          'cmdname' => 'cindex',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'e'
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
              8
            ]
          },
          'info' => {
            'command_name' => 'cindex',
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'file_name' => 'encoding_index_utf8.texi',
            'line_nr' => 16
          },
          'type' => 'index_entry_command'
        },
        {
          'cmdname' => 'cindex',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'f'
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
              9
            ]
          },
          'info' => {
            'command_name' => 'cindex',
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'file_name' => 'encoding_index_utf8.texi',
            'line_nr' => 17
          },
          'type' => 'index_entry_command'
        },
        {
          'cmdname' => 'cindex',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'g'
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
              10
            ]
          },
          'info' => {
            'command_name' => 'cindex',
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'file_name' => 'encoding_index_utf8.texi',
            'line_nr' => 18
          },
          'type' => 'index_entry_command'
        },
        {
          'cmdname' => 'cindex',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'h'
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
              11
            ]
          },
          'info' => {
            'command_name' => 'cindex',
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'file_name' => 'encoding_index_utf8.texi',
            'line_nr' => 19
          },
          'type' => 'index_entry_command'
        },
        {
          'cmdname' => 'cindex',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'i'
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
              12
            ]
          },
          'info' => {
            'command_name' => 'cindex',
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'file_name' => 'encoding_index_utf8.texi',
            'line_nr' => 20
          },
          'type' => 'index_entry_command'
        },
        {
          'cmdname' => 'cindex',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'j'
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
              13
            ]
          },
          'info' => {
            'command_name' => 'cindex',
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'file_name' => 'encoding_index_utf8.texi',
            'line_nr' => 21
          },
          'type' => 'index_entry_command'
        },
        {
          'cmdname' => 'cindex',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'k'
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
              14
            ]
          },
          'info' => {
            'command_name' => 'cindex',
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'file_name' => 'encoding_index_utf8.texi',
            'line_nr' => 22
          },
          'type' => 'index_entry_command'
        },
        {
          'cmdname' => 'cindex',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'l'
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
              15
            ]
          },
          'info' => {
            'command_name' => 'cindex',
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'file_name' => 'encoding_index_utf8.texi',
            'line_nr' => 23
          },
          'type' => 'index_entry_command'
        },
        {
          'cmdname' => 'cindex',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'm'
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
              16
            ]
          },
          'info' => {
            'command_name' => 'cindex',
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'file_name' => 'encoding_index_utf8.texi',
            'line_nr' => 24
          },
          'type' => 'index_entry_command'
        },
        {
          'cmdname' => 'cindex',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'n'
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
              17
            ]
          },
          'info' => {
            'command_name' => 'cindex',
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'file_name' => 'encoding_index_utf8.texi',
            'line_nr' => 25
          },
          'type' => 'index_entry_command'
        },
        {
          'cmdname' => 'cindex',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'o'
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
              18
            ]
          },
          'info' => {
            'command_name' => 'cindex',
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'file_name' => 'encoding_index_utf8.texi',
            'line_nr' => 26
          },
          'type' => 'index_entry_command'
        },
        {
          'cmdname' => 'cindex',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'p'
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
              19
            ]
          },
          'info' => {
            'command_name' => 'cindex',
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'file_name' => 'encoding_index_utf8.texi',
            'line_nr' => 27
          },
          'type' => 'index_entry_command'
        },
        {
          'cmdname' => 'cindex',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'q'
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
              20
            ]
          },
          'info' => {
            'command_name' => 'cindex',
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'file_name' => 'encoding_index_utf8.texi',
            'line_nr' => 28
          },
          'type' => 'index_entry_command'
        },
        {
          'cmdname' => 'cindex',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'r'
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
              21
            ]
          },
          'info' => {
            'command_name' => 'cindex',
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'file_name' => 'encoding_index_utf8.texi',
            'line_nr' => 29
          },
          'type' => 'index_entry_command'
        },
        {
          'cmdname' => 'cindex',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 's'
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
              22
            ]
          },
          'info' => {
            'command_name' => 'cindex',
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'file_name' => 'encoding_index_utf8.texi',
            'line_nr' => 30
          },
          'type' => 'index_entry_command'
        },
        {
          'cmdname' => 'cindex',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 't'
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
              23
            ]
          },
          'info' => {
            'command_name' => 'cindex',
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'file_name' => 'encoding_index_utf8.texi',
            'line_nr' => 31
          },
          'type' => 'index_entry_command'
        },
        {
          'cmdname' => 'cindex',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'u'
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
              24
            ]
          },
          'info' => {
            'command_name' => 'cindex',
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'file_name' => 'encoding_index_utf8.texi',
            'line_nr' => 32
          },
          'type' => 'index_entry_command'
        },
        {
          'cmdname' => 'cindex',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'v'
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
              25
            ]
          },
          'info' => {
            'command_name' => 'cindex',
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'file_name' => 'encoding_index_utf8.texi',
            'line_nr' => 33
          },
          'type' => 'index_entry_command'
        },
        {
          'cmdname' => 'cindex',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'w'
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
              26
            ]
          },
          'info' => {
            'command_name' => 'cindex',
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'file_name' => 'encoding_index_utf8.texi',
            'line_nr' => 34
          },
          'type' => 'index_entry_command'
        },
        {
          'cmdname' => 'cindex',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'x'
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
              27
            ]
          },
          'info' => {
            'command_name' => 'cindex',
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'file_name' => 'encoding_index_utf8.texi',
            'line_nr' => 35
          },
          'type' => 'index_entry_command'
        },
        {
          'cmdname' => 'cindex',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'y'
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
              28
            ]
          },
          'info' => {
            'command_name' => 'cindex',
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'file_name' => 'encoding_index_utf8.texi',
            'line_nr' => 36
          },
          'type' => 'index_entry_command'
        },
        {
          'cmdname' => 'cindex',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'z'
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
              29
            ]
          },
          'info' => {
            'command_name' => 'cindex',
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'file_name' => 'encoding_index_utf8.texi',
            'line_nr' => 37
          },
          'type' => 'index_entry_command'
        },
        {
          'cmdname' => 'cindex',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'A'
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
              30
            ]
          },
          'info' => {
            'command_name' => 'cindex',
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'file_name' => 'encoding_index_utf8.texi',
            'line_nr' => 38
          },
          'type' => 'index_entry_command'
        },
        {
          'cmdname' => 'cindex',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'B'
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
              31
            ]
          },
          'info' => {
            'command_name' => 'cindex',
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'file_name' => 'encoding_index_utf8.texi',
            'line_nr' => 39
          },
          'type' => 'index_entry_command'
        },
        {
          'cmdname' => 'cindex',
          'contents' => [
            {
              'contents' => [
                {
                  'cmdname' => 'l',
                  'contents' => [
                    {
                      'type' => 'brace_container'
                    }
                  ],
                  'source_info' => {
                    'file_name' => 'encoding_index_utf8.texi',
                    'line_nr' => 40
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
              'cp',
              32
            ]
          },
          'info' => {
            'command_name' => 'cindex',
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'file_name' => 'encoding_index_utf8.texi',
            'line_nr' => 40
          },
          'type' => 'index_entry_command'
        },
        {
          'cmdname' => 'cindex',
          'contents' => [
            {
              'contents' => [
                {
                  'cmdname' => 'L',
                  'contents' => [
                    {
                      'type' => 'brace_container'
                    }
                  ],
                  'source_info' => {
                    'file_name' => 'encoding_index_utf8.texi',
                    'line_nr' => 41
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
              'cp',
              33
            ]
          },
          'info' => {
            'command_name' => 'cindex',
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'file_name' => 'encoding_index_utf8.texi',
            'line_nr' => 41
          },
          'type' => 'index_entry_command'
        },
        {
          'cmdname' => 'cindex',
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
                    'file_name' => 'encoding_index_utf8.texi',
                    'line_nr' => 42
                  }
                },
                {
                  'text' => ' '
                },
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
                    'file_name' => 'encoding_index_utf8.texi',
                    'line_nr' => 42
                  }
                },
                {
                  'text' => ' (dotless)'
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
              34
            ]
          },
          'info' => {
            'command_name' => 'cindex',
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'file_name' => 'encoding_index_utf8.texi',
            'line_nr' => 42
          },
          'type' => 'index_entry_command'
        },
        {
          'cmdname' => 'cindex',
          'contents' => [
            {
              'contents' => [
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
                            'file_name' => 'encoding_index_utf8.texi',
                            'line_nr' => 43
                          }
                        }
                      ],
                      'type' => 'brace_container'
                    }
                  ],
                  'source_info' => {
                    'file_name' => 'encoding_index_utf8.texi',
                    'line_nr' => 43
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
                            'file_name' => 'encoding_index_utf8.texi',
                            'line_nr' => 43
                          }
                        }
                      ],
                      'type' => 'brace_container'
                    }
                  ],
                  'source_info' => {
                    'file_name' => 'encoding_index_utf8.texi',
                    'line_nr' => 43
                  }
                },
                {
                  'text' => ' (dotless)'
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
              35
            ]
          },
          'info' => {
            'command_name' => 'cindex',
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'file_name' => 'encoding_index_utf8.texi',
            'line_nr' => 43
          },
          'type' => 'index_entry_command'
        },
        {
          'cmdname' => 'cindex',
          'contents' => [
            {
              'contents' => [
                {
                  'cmdname' => 'ss',
                  'contents' => [
                    {
                      'type' => 'brace_container'
                    }
                  ],
                  'source_info' => {
                    'file_name' => 'encoding_index_utf8.texi',
                    'line_nr' => 44
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
              'cp',
              36
            ]
          },
          'info' => {
            'command_name' => 'cindex',
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'file_name' => 'encoding_index_utf8.texi',
            'line_nr' => 44
          },
          'type' => 'index_entry_command'
        },
        {
          'cmdname' => 'cindex',
          'contents' => [
            {
              'contents' => [
                {
                  'cmdname' => 'euro',
                  'contents' => [
                    {
                      'type' => 'brace_container'
                    }
                  ],
                  'source_info' => {
                    'file_name' => 'encoding_index_utf8.texi',
                    'line_nr' => 45
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
              'cp',
              37
            ]
          },
          'info' => {
            'command_name' => 'cindex',
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'file_name' => 'encoding_index_utf8.texi',
            'line_nr' => 45
          },
          'type' => 'index_entry_command'
        },
        {
          'cmdname' => 'cindex',
          'contents' => [
            {
              'contents' => [
                {
                  'cmdname' => 'AE',
                  'contents' => [
                    {
                      'type' => 'brace_container'
                    }
                  ],
                  'source_info' => {
                    'file_name' => 'encoding_index_utf8.texi',
                    'line_nr' => 46
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
              'cp',
              38
            ]
          },
          'info' => {
            'command_name' => 'cindex',
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'file_name' => 'encoding_index_utf8.texi',
            'line_nr' => 46
          },
          'type' => 'index_entry_command'
        },
        {
          'cmdname' => 'cindex',
          'contents' => [
            {
              'contents' => [
                {
                  'cmdname' => 'exclamdown',
                  'contents' => [
                    {
                      'type' => 'brace_container'
                    }
                  ],
                  'source_info' => {
                    'file_name' => 'encoding_index_utf8.texi',
                    'line_nr' => 47
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
              'cp',
              39
            ]
          },
          'info' => {
            'command_name' => 'cindex',
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'file_name' => 'encoding_index_utf8.texi',
            'line_nr' => 47
          },
          'type' => 'index_entry_command'
        },
        {
          'cmdname' => 'cindex',
          'contents' => [
            {
              'contents' => [
                {
                  'cmdname' => 'TH',
                  'contents' => [
                    {
                      'type' => 'brace_container'
                    }
                  ],
                  'source_info' => {
                    'file_name' => 'encoding_index_utf8.texi',
                    'line_nr' => 48
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
              'cp',
              40
            ]
          },
          'info' => {
            'command_name' => 'cindex',
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'file_name' => 'encoding_index_utf8.texi',
            'line_nr' => 48
          },
          'type' => 'index_entry_command'
        },
        {
          'cmdname' => 'cindex',
          'contents' => [
            {
              'contents' => [
                {
                  'cmdname' => 'DH',
                  'contents' => [
                    {
                      'type' => 'brace_container'
                    }
                  ],
                  'source_info' => {
                    'file_name' => 'encoding_index_utf8.texi',
                    'line_nr' => 49
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
              'cp',
              41
            ]
          },
          'info' => {
            'command_name' => 'cindex',
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'file_name' => 'encoding_index_utf8.texi',
            'line_nr' => 49
          },
          'type' => 'index_entry_command'
        },
        {
          'cmdname' => 'cindex',
          'contents' => [
            {
              'contents' => [
                {
                  'cmdname' => 'textdegree',
                  'contents' => [
                    {
                      'type' => 'brace_container'
                    }
                  ],
                  'source_info' => {
                    'file_name' => 'encoding_index_utf8.texi',
                    'line_nr' => 50
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
              'cp',
              42
            ]
          },
          'info' => {
            'command_name' => 'cindex',
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'file_name' => 'encoding_index_utf8.texi',
            'line_nr' => 50
          },
          'type' => 'index_entry_command'
        },
        {
          'cmdname' => 'cindex',
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
            'element_node' => {},
            'index_entry' => [
              'cp',
              43
            ]
          },
          'info' => {
            'command_name' => 'cindex',
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'file_name' => 'encoding_index_utf8.texi',
            'line_nr' => 51
          },
          'type' => 'index_entry_command'
        },
        {
          'cmdname' => 'cindex',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => '9'
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
              44
            ]
          },
          'info' => {
            'command_name' => 'cindex',
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'file_name' => 'encoding_index_utf8.texi',
            'line_nr' => 52
          },
          'type' => 'index_entry_command'
        },
        {
          'cmdname' => 'cindex',
          'contents' => [
            {
              'contents' => [
                {
                  'cmdname' => 'quotedblleft',
                  'contents' => [
                    {
                      'type' => 'brace_container'
                    }
                  ],
                  'source_info' => {
                    'file_name' => 'encoding_index_utf8.texi',
                    'line_nr' => 53
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
              'cp',
              45
            ]
          },
          'info' => {
            'command_name' => 'cindex',
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'file_name' => 'encoding_index_utf8.texi',
            'line_nr' => 53
          },
          'type' => 'index_entry_command'
        },
        {
          'cmdname' => 'cindex',
          'contents' => [
            {
              'contents' => [
                {
                  'cmdname' => 'geq',
                  'contents' => [
                    {
                      'type' => 'brace_container'
                    }
                  ],
                  'source_info' => {
                    'file_name' => 'encoding_index_utf8.texi',
                    'line_nr' => 54
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
              'cp',
              46
            ]
          },
          'info' => {
            'command_name' => 'cindex',
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'file_name' => 'encoding_index_utf8.texi',
            'line_nr' => 54
          },
          'type' => 'index_entry_command'
        },
        {
          'cmdname' => 'cindex',
          'contents' => [
            {
              'contents' => [
                {
                  'cmdname' => 'comma',
                  'contents' => [
                    {
                      'type' => 'brace_container'
                    }
                  ],
                  'source_info' => {
                    'file_name' => 'encoding_index_utf8.texi',
                    'line_nr' => 55
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
              'cp',
              47
            ]
          },
          'info' => {
            'command_name' => 'cindex',
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'file_name' => 'encoding_index_utf8.texi',
            'line_nr' => 55
          },
          'type' => 'index_entry_command'
        },
        {
          'cmdname' => 'cindex',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => '``'
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
              48
            ]
          },
          'info' => {
            'command_name' => 'cindex',
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'file_name' => 'encoding_index_utf8.texi',
            'line_nr' => 56
          },
          'type' => 'index_entry_command'
        },
        {
          'cmdname' => 'cindex',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => '`'
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
              49
            ]
          },
          'info' => {
            'command_name' => 'cindex',
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'file_name' => 'encoding_index_utf8.texi',
            'line_nr' => 57
          },
          'type' => 'index_entry_command'
        },
        {
          'cmdname' => 'cindex',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => '\''
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
              50
            ]
          },
          'info' => {
            'command_name' => 'cindex',
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'file_name' => 'encoding_index_utf8.texi',
            'line_nr' => 58
          },
          'type' => 'index_entry_command'
        },
        {
          'cmdname' => 'cindex',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => '\'\''
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
              51
            ]
          },
          'info' => {
            'command_name' => 'cindex',
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'file_name' => 'encoding_index_utf8.texi',
            'line_nr' => 59
          },
          'type' => 'index_entry_command'
        },
        {
          'cmdname' => 'cindex',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => '"'
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
              52
            ]
          },
          'info' => {
            'command_name' => 'cindex',
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'file_name' => 'encoding_index_utf8.texi',
            'line_nr' => 60
          },
          'type' => 'index_entry_command'
        },
        {
          'cmdname' => 'cindex',
          'contents' => [
            {
              'contents' => [
                {
                  'cmdname' => '@'
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
              53
            ]
          },
          'info' => {
            'command_name' => 'cindex',
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'file_name' => 'encoding_index_utf8.texi',
            'line_nr' => 61
          },
          'type' => 'index_entry_command'
        },
        {
          'cmdname' => 'cindex',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => '--'
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
              54
            ]
          },
          'info' => {
            'command_name' => 'cindex',
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'file_name' => 'encoding_index_utf8.texi',
            'line_nr' => 62
          },
          'type' => 'index_entry_command'
        },
        {
          'cmdname' => 'cindex',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => '---'
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
              55
            ]
          },
          'info' => {
            'command_name' => 'cindex',
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'file_name' => 'encoding_index_utf8.texi',
            'line_nr' => 63
          },
          'type' => 'index_entry_command'
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
            'file_name' => 'encoding_index_utf8.texi',
            'line_nr' => 65
          }
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
        'file_name' => 'encoding_index_utf8.texi',
        'line_nr' => 7
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
$result_trees{'encoding_index_utf8'}{'contents'}[3]{'contents'}[2]{'extra'}{'element_node'} = $result_trees{'encoding_index_utf8'}{'contents'}[3];
$result_trees{'encoding_index_utf8'}{'contents'}[3]{'contents'}[3]{'extra'}{'element_node'} = $result_trees{'encoding_index_utf8'}{'contents'}[3];
$result_trees{'encoding_index_utf8'}{'contents'}[3]{'contents'}[4]{'extra'}{'element_node'} = $result_trees{'encoding_index_utf8'}{'contents'}[3];
$result_trees{'encoding_index_utf8'}{'contents'}[3]{'contents'}[5]{'extra'}{'element_node'} = $result_trees{'encoding_index_utf8'}{'contents'}[3];
$result_trees{'encoding_index_utf8'}{'contents'}[3]{'contents'}[6]{'extra'}{'element_node'} = $result_trees{'encoding_index_utf8'}{'contents'}[3];
$result_trees{'encoding_index_utf8'}{'contents'}[3]{'contents'}[7]{'extra'}{'element_node'} = $result_trees{'encoding_index_utf8'}{'contents'}[3];
$result_trees{'encoding_index_utf8'}{'contents'}[3]{'contents'}[8]{'extra'}{'element_node'} = $result_trees{'encoding_index_utf8'}{'contents'}[3];
$result_trees{'encoding_index_utf8'}{'contents'}[3]{'contents'}[9]{'extra'}{'element_node'} = $result_trees{'encoding_index_utf8'}{'contents'}[3];
$result_trees{'encoding_index_utf8'}{'contents'}[3]{'contents'}[10]{'extra'}{'element_node'} = $result_trees{'encoding_index_utf8'}{'contents'}[3];
$result_trees{'encoding_index_utf8'}{'contents'}[3]{'contents'}[11]{'extra'}{'element_node'} = $result_trees{'encoding_index_utf8'}{'contents'}[3];
$result_trees{'encoding_index_utf8'}{'contents'}[3]{'contents'}[12]{'extra'}{'element_node'} = $result_trees{'encoding_index_utf8'}{'contents'}[3];
$result_trees{'encoding_index_utf8'}{'contents'}[3]{'contents'}[13]{'extra'}{'element_node'} = $result_trees{'encoding_index_utf8'}{'contents'}[3];
$result_trees{'encoding_index_utf8'}{'contents'}[3]{'contents'}[14]{'extra'}{'element_node'} = $result_trees{'encoding_index_utf8'}{'contents'}[3];
$result_trees{'encoding_index_utf8'}{'contents'}[3]{'contents'}[15]{'extra'}{'element_node'} = $result_trees{'encoding_index_utf8'}{'contents'}[3];
$result_trees{'encoding_index_utf8'}{'contents'}[3]{'contents'}[16]{'extra'}{'element_node'} = $result_trees{'encoding_index_utf8'}{'contents'}[3];
$result_trees{'encoding_index_utf8'}{'contents'}[3]{'contents'}[17]{'extra'}{'element_node'} = $result_trees{'encoding_index_utf8'}{'contents'}[3];
$result_trees{'encoding_index_utf8'}{'contents'}[3]{'contents'}[18]{'extra'}{'element_node'} = $result_trees{'encoding_index_utf8'}{'contents'}[3];
$result_trees{'encoding_index_utf8'}{'contents'}[3]{'contents'}[19]{'extra'}{'element_node'} = $result_trees{'encoding_index_utf8'}{'contents'}[3];
$result_trees{'encoding_index_utf8'}{'contents'}[3]{'contents'}[20]{'extra'}{'element_node'} = $result_trees{'encoding_index_utf8'}{'contents'}[3];
$result_trees{'encoding_index_utf8'}{'contents'}[3]{'contents'}[21]{'extra'}{'element_node'} = $result_trees{'encoding_index_utf8'}{'contents'}[3];
$result_trees{'encoding_index_utf8'}{'contents'}[3]{'contents'}[22]{'extra'}{'element_node'} = $result_trees{'encoding_index_utf8'}{'contents'}[3];
$result_trees{'encoding_index_utf8'}{'contents'}[3]{'contents'}[23]{'extra'}{'element_node'} = $result_trees{'encoding_index_utf8'}{'contents'}[3];
$result_trees{'encoding_index_utf8'}{'contents'}[3]{'contents'}[24]{'extra'}{'element_node'} = $result_trees{'encoding_index_utf8'}{'contents'}[3];
$result_trees{'encoding_index_utf8'}{'contents'}[3]{'contents'}[25]{'extra'}{'element_node'} = $result_trees{'encoding_index_utf8'}{'contents'}[3];
$result_trees{'encoding_index_utf8'}{'contents'}[3]{'contents'}[26]{'extra'}{'element_node'} = $result_trees{'encoding_index_utf8'}{'contents'}[3];
$result_trees{'encoding_index_utf8'}{'contents'}[3]{'contents'}[27]{'extra'}{'element_node'} = $result_trees{'encoding_index_utf8'}{'contents'}[3];
$result_trees{'encoding_index_utf8'}{'contents'}[3]{'contents'}[28]{'extra'}{'element_node'} = $result_trees{'encoding_index_utf8'}{'contents'}[3];
$result_trees{'encoding_index_utf8'}{'contents'}[3]{'contents'}[29]{'extra'}{'element_node'} = $result_trees{'encoding_index_utf8'}{'contents'}[3];
$result_trees{'encoding_index_utf8'}{'contents'}[3]{'contents'}[30]{'extra'}{'element_node'} = $result_trees{'encoding_index_utf8'}{'contents'}[3];
$result_trees{'encoding_index_utf8'}{'contents'}[3]{'contents'}[31]{'extra'}{'element_node'} = $result_trees{'encoding_index_utf8'}{'contents'}[3];
$result_trees{'encoding_index_utf8'}{'contents'}[3]{'contents'}[32]{'extra'}{'element_node'} = $result_trees{'encoding_index_utf8'}{'contents'}[3];
$result_trees{'encoding_index_utf8'}{'contents'}[3]{'contents'}[33]{'extra'}{'element_node'} = $result_trees{'encoding_index_utf8'}{'contents'}[3];
$result_trees{'encoding_index_utf8'}{'contents'}[3]{'contents'}[34]{'extra'}{'element_node'} = $result_trees{'encoding_index_utf8'}{'contents'}[3];
$result_trees{'encoding_index_utf8'}{'contents'}[3]{'contents'}[35]{'extra'}{'element_node'} = $result_trees{'encoding_index_utf8'}{'contents'}[3];
$result_trees{'encoding_index_utf8'}{'contents'}[3]{'contents'}[36]{'extra'}{'element_node'} = $result_trees{'encoding_index_utf8'}{'contents'}[3];
$result_trees{'encoding_index_utf8'}{'contents'}[3]{'contents'}[37]{'extra'}{'element_node'} = $result_trees{'encoding_index_utf8'}{'contents'}[3];
$result_trees{'encoding_index_utf8'}{'contents'}[3]{'contents'}[38]{'extra'}{'element_node'} = $result_trees{'encoding_index_utf8'}{'contents'}[3];
$result_trees{'encoding_index_utf8'}{'contents'}[3]{'contents'}[39]{'extra'}{'element_node'} = $result_trees{'encoding_index_utf8'}{'contents'}[3];
$result_trees{'encoding_index_utf8'}{'contents'}[3]{'contents'}[40]{'extra'}{'element_node'} = $result_trees{'encoding_index_utf8'}{'contents'}[3];
$result_trees{'encoding_index_utf8'}{'contents'}[3]{'contents'}[41]{'extra'}{'element_node'} = $result_trees{'encoding_index_utf8'}{'contents'}[3];
$result_trees{'encoding_index_utf8'}{'contents'}[3]{'contents'}[42]{'extra'}{'element_node'} = $result_trees{'encoding_index_utf8'}{'contents'}[3];
$result_trees{'encoding_index_utf8'}{'contents'}[3]{'contents'}[43]{'extra'}{'element_node'} = $result_trees{'encoding_index_utf8'}{'contents'}[3];
$result_trees{'encoding_index_utf8'}{'contents'}[3]{'contents'}[44]{'extra'}{'element_node'} = $result_trees{'encoding_index_utf8'}{'contents'}[3];
$result_trees{'encoding_index_utf8'}{'contents'}[3]{'contents'}[45]{'extra'}{'element_node'} = $result_trees{'encoding_index_utf8'}{'contents'}[3];
$result_trees{'encoding_index_utf8'}{'contents'}[3]{'contents'}[46]{'extra'}{'element_node'} = $result_trees{'encoding_index_utf8'}{'contents'}[3];
$result_trees{'encoding_index_utf8'}{'contents'}[3]{'contents'}[47]{'extra'}{'element_node'} = $result_trees{'encoding_index_utf8'}{'contents'}[3];
$result_trees{'encoding_index_utf8'}{'contents'}[3]{'contents'}[48]{'extra'}{'element_node'} = $result_trees{'encoding_index_utf8'}{'contents'}[3];
$result_trees{'encoding_index_utf8'}{'contents'}[3]{'contents'}[49]{'extra'}{'element_node'} = $result_trees{'encoding_index_utf8'}{'contents'}[3];
$result_trees{'encoding_index_utf8'}{'contents'}[3]{'contents'}[50]{'extra'}{'element_node'} = $result_trees{'encoding_index_utf8'}{'contents'}[3];
$result_trees{'encoding_index_utf8'}{'contents'}[3]{'contents'}[51]{'extra'}{'element_node'} = $result_trees{'encoding_index_utf8'}{'contents'}[3];
$result_trees{'encoding_index_utf8'}{'contents'}[3]{'contents'}[52]{'extra'}{'element_node'} = $result_trees{'encoding_index_utf8'}{'contents'}[3];
$result_trees{'encoding_index_utf8'}{'contents'}[3]{'contents'}[53]{'extra'}{'element_node'} = $result_trees{'encoding_index_utf8'}{'contents'}[3];
$result_trees{'encoding_index_utf8'}{'contents'}[3]{'contents'}[54]{'extra'}{'element_node'} = $result_trees{'encoding_index_utf8'}{'contents'}[3];
$result_trees{'encoding_index_utf8'}{'contents'}[3]{'contents'}[55]{'extra'}{'element_node'} = $result_trees{'encoding_index_utf8'}{'contents'}[3];
$result_trees{'encoding_index_utf8'}{'contents'}[3]{'contents'}[56]{'extra'}{'element_node'} = $result_trees{'encoding_index_utf8'}{'contents'}[3];

$result_texis{'encoding_index_utf8'} = '
@documentencoding utf-8

@node Top
@top encoding index utf8

@node chap

@cindex é é
@cindex @"{i} @"{i}@"{i}@"{i}
@cindex @^i @^i@^i@^i@^i
@cindex a
@cindex b
@cindex c
@cindex d
@cindex e
@cindex f
@cindex g
@cindex h
@cindex i
@cindex j
@cindex k
@cindex l
@cindex m
@cindex n
@cindex o
@cindex p
@cindex q
@cindex r
@cindex s
@cindex t
@cindex u
@cindex v
@cindex w
@cindex x
@cindex y
@cindex z
@cindex A
@cindex B
@cindex @l{}
@cindex @L{}
@cindex @dotless{i} @dotless{i} (dotless)
@cindex @^{@dotless{i}} @^{@dotless{i}} (dotless)
@cindex @ss{}
@cindex @euro{}
@cindex @AE{}
@cindex @exclamdown{}
@cindex @TH{}
@cindex @DH{}
@cindex @textdegree{}
@cindex 0
@cindex 9
@cindex @quotedblleft{}
@cindex @geq{}
@cindex @comma{}
@cindex ``
@cindex `
@cindex \'
@cindex \'\'
@cindex "
@cindex @@
@cindex --
@cindex ---

@printindex cp
@bye
';


$result_texts{'encoding_index_utf8'} = '
encoding index utf8
*******************



';

$result_sectioning{'encoding_index_utf8'} = {
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
          'section_level' => 0,
          'sectioning_root' => {}
        }
      }
    ],
    'section_level' => -1
  }
};
$result_sectioning{'encoding_index_utf8'}{'extra'}{'section_childs'}[0]{'extra'}{'sectioning_root'} = $result_sectioning{'encoding_index_utf8'};

$result_nodes{'encoding_index_utf8'} = [
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
            'isindex' => 1,
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
$result_nodes{'encoding_index_utf8'}[0]{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'prev'} = $result_nodes{'encoding_index_utf8'}[0];
$result_nodes{'encoding_index_utf8'}[1] = $result_nodes{'encoding_index_utf8'}[0]{'extra'}{'node_directions'}{'next'};

$result_menus{'encoding_index_utf8'} = [
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

$result_errors{'encoding_index_utf8'} = [
  {
    'error_line' => 'warning: node `chap\' not in menu
',
    'file_name' => 'encoding_index_utf8.texi',
    'line_nr' => 7,
    'text' => 'node `chap\' not in menu',
    'type' => 'warning'
  }
];


$result_floats{'encoding_index_utf8'} = {};


$result_indices_sort_strings{'encoding_index_utf8'} = {
  'cp' => [
    '-',
    '--',
    ',',
    "\x{a1}",
    '\'',
    '"',
    '"',
    '"',
    "\x{201c}",
    '@',
    '`',
    "\x{b0}",
    "\x{2265}",
    "\x{20ac}",
    '0',
    '9',
    'a',
    'A',
    "\x{c6}",
    'b',
    'B',
    'c',
    'd',
    "\x{d0}",
    'e',
    "\x{e9} \x{e9}",
    'f',
    'g',
    'h',
    'i',
    "\x{131} \x{131} (dotless)",
    "\x{ee} \x{ee} (dotless)",
    "\x{ef} \x{ef}\x{ef}\x{ef}",
    "\x{ee} \x{ee}\x{ee}\x{ee}\x{ee}",
    'j',
    'k',
    'l',
    "\x{142}",
    "\x{141}",
    'm',
    'n',
    'o',
    'p',
    'q',
    'r',
    's',
    "\x{df}",
    't',
    'u',
    'v',
    'w',
    'x',
    'y',
    'z',
    "\x{de}"
  ]
};


1;
