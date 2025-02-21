use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'indices_in_begin_tables_lists_entries_after_item'} = {
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
        },
        {
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
        'file_name' => 'indices_in_begin_tables_lists.texi',
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
        'file_name' => 'indices_in_begin_tables_lists.texi',
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
        'normalized' => 'chapter'
      },
      'info' => {
        'spaces_before_argument' => {
          'text' => ' '
        }
      },
      'source_info' => {
        'file_name' => 'indices_in_begin_tables_lists.texi',
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
          'cmdname' => 'itemize',
          'contents' => [
            {
              'contents' => [
                {
                  'contents' => [
                    {
                      'cmdname' => 'minus',
                      'source_info' => {
                        'file_name' => 'indices_in_begin_tables_lists.texi',
                        'line_nr' => 9
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
              'type' => 'arguments_line'
            },
            {
              'contents' => [
                {
                  'cmdname' => 'c',
                  'contents' => [
                    {
                      'text' => ' comment in itemize
',
                      'type' => 'rawline_arg'
                    }
                  ]
                }
              ],
              'type' => 'before_item'
            },
            {
              'cmdname' => 'item',
              'contents' => [
                {
                  'text' => ' 
',
                  'type' => 'ignorable_spaces_after_command'
                },
                {
                  'cmdname' => 'cindex',
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'also a cindex in itemize'
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
                    'file_name' => 'indices_in_begin_tables_lists.texi',
                    'line_nr' => 11
                  },
                  'type' => 'index_entry_command'
                },
                {
                  'contents' => [
                    {
                      'text' => 'e--mph item
'
                    }
                  ],
                  'type' => 'paragraph'
                }
              ],
              'extra' => {
                'item_number' => 1
              },
              'source_info' => {
                'file_name' => 'indices_in_begin_tables_lists.texi',
                'line_nr' => 12
              }
            },
            {
              'cmdname' => 'end',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'itemize'
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
                'text_arg' => 'itemize'
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'file_name' => 'indices_in_begin_tables_lists.texi',
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
            'file_name' => 'indices_in_begin_tables_lists.texi',
            'line_nr' => 9
          }
        },
        {
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'cmdname' => 'itemize',
          'contents' => [
            {
              'contents' => [
                {
                  'contents' => [
                    {
                      'cmdname' => 'bullet',
                      'source_info' => {
                        'file_name' => 'indices_in_begin_tables_lists.texi',
                        'line_nr' => 15
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
              'type' => 'arguments_line'
            },
            {
              'type' => 'before_item'
            },
            {
              'cmdname' => 'item',
              'contents' => [
                {
                  'text' => ' 
',
                  'type' => 'ignorable_spaces_after_command'
                },
                {
                  'cmdname' => 'cindex',
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'index entry within itemize'
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
                    'file_name' => 'indices_in_begin_tables_lists.texi',
                    'line_nr' => 16
                  },
                  'type' => 'index_entry_command'
                },
                {
                  'contents' => [
                    {
                      'text' => 'i--tem 1
'
                    }
                  ],
                  'type' => 'paragraph'
                }
              ],
              'extra' => {
                'item_number' => 1
              },
              'source_info' => {
                'file_name' => 'indices_in_begin_tables_lists.texi',
                'line_nr' => 17
              }
            },
            {
              'cmdname' => 'item',
              'contents' => [
                {
                  'text' => ' ',
                  'type' => 'ignorable_spaces_after_command'
                },
                {
                  'cmdname' => 'cindex',
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'index entry right after '
                        },
                        {
                          'cmdname' => '@'
                        },
                        {
                          'text' => 'item'
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
                    'file_name' => 'indices_in_begin_tables_lists.texi',
                    'line_nr' => 18
                  },
                  'type' => 'index_entry_command'
                },
                {
                  'contents' => [
                    {
                      'text' => 'i--tem 2
'
                    }
                  ],
                  'type' => 'paragraph'
                }
              ],
              'extra' => {
                'item_number' => 2
              },
              'source_info' => {
                'file_name' => 'indices_in_begin_tables_lists.texi',
                'line_nr' => 18
              }
            },
            {
              'cmdname' => 'end',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'itemize'
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
                'text_arg' => 'itemize'
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'file_name' => 'indices_in_begin_tables_lists.texi',
                'line_nr' => 20
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
            'file_name' => 'indices_in_begin_tables_lists.texi',
            'line_nr' => 15
          }
        },
        {
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'cmdname' => 'itemize',
          'contents' => [
            {
              'contents' => [
                {
                  'contents' => [
                    {
                      'cmdname' => 'bullet',
                      'info' => {
                        'inserted' => 1
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
              'type' => 'arguments_line'
            },
            {
              'contents' => [
                {
                  'cmdname' => 'c',
                  'contents' => [
                    {
                      'text' => ' comment in itemize
',
                      'type' => 'rawline_arg'
                    }
                  ]
                },
                {
                  'contents' => [
                    {
                      'text' => 'T--ext before items.
'
                    }
                  ],
                  'type' => 'paragraph'
                }
              ],
              'type' => 'before_item'
            },
            {
              'cmdname' => 'item',
              'contents' => [
                {
                  'text' => ' 
',
                  'type' => 'ignorable_spaces_after_command'
                },
                {
                  'cmdname' => 'cindex',
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'also a cindex in itemize'
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
                    'file_name' => 'indices_in_begin_tables_lists.texi',
                    'line_nr' => 25
                  },
                  'type' => 'index_entry_command'
                },
                {
                  'contents' => [
                    {
                      'text' => 'bullet item
'
                    }
                  ],
                  'type' => 'paragraph'
                }
              ],
              'extra' => {
                'item_number' => 1
              },
              'source_info' => {
                'file_name' => 'indices_in_begin_tables_lists.texi',
                'line_nr' => 26
              }
            },
            {
              'cmdname' => 'end',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'itemize'
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
                'text_arg' => 'itemize'
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'file_name' => 'indices_in_begin_tables_lists.texi',
                'line_nr' => 27
              }
            }
          ],
          'extra' => {
            'command_as_argument' => {}
          },
          'source_info' => {
            'file_name' => 'indices_in_begin_tables_lists.texi',
            'line_nr' => 22
          }
        },
        {
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'cmdname' => 'enumerate',
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
                  'text' => '
',
                  'type' => 'empty_line'
                },
                {
                  'cmdname' => 'comment',
                  'contents' => [
                    {
                      'text' => ' comment before first item in enumerate
',
                      'type' => 'rawline_arg'
                    }
                  ]
                }
              ],
              'type' => 'before_item'
            },
            {
              'cmdname' => 'item',
              'contents' => [
                {
                  'text' => ' ',
                  'type' => 'ignorable_spaces_after_command'
                },
                {
                  'contents' => [
                    {
                      'text' => 'e--numerate
'
                    }
                  ],
                  'type' => 'paragraph'
                }
              ],
              'extra' => {
                'item_number' => 1
              },
              'source_info' => {
                'file_name' => 'indices_in_begin_tables_lists.texi',
                'line_nr' => 32
              }
            },
            {
              'cmdname' => 'end',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'enumerate'
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
                'text_arg' => 'enumerate'
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'file_name' => 'indices_in_begin_tables_lists.texi',
                'line_nr' => 33
              }
            }
          ],
          'extra' => {
            'enumerate_specification' => '1'
          },
          'source_info' => {
            'file_name' => 'indices_in_begin_tables_lists.texi',
            'line_nr' => 29
          }
        },
        {
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'cmdname' => 'enumerate',
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
                          'text' => 'index inter in enumerate between lines'
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
                    'file_name' => 'indices_in_begin_tables_lists.texi',
                    'line_nr' => 37
                  },
                  'type' => 'index_entry_command'
                },
                {
                  'text' => '
',
                  'type' => 'empty_line'
                }
              ],
              'type' => 'before_item'
            },
            {
              'cmdname' => 'item',
              'contents' => [
                {
                  'text' => ' ',
                  'type' => 'ignorable_spaces_after_command'
                },
                {
                  'contents' => [
                    {
                      'text' => 'enumerate item
'
                    }
                  ],
                  'type' => 'paragraph'
                }
              ],
              'extra' => {
                'item_number' => 1
              },
              'source_info' => {
                'file_name' => 'indices_in_begin_tables_lists.texi',
                'line_nr' => 39
              }
            },
            {
              'cmdname' => 'end',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'enumerate'
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
                'text_arg' => 'enumerate'
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'file_name' => 'indices_in_begin_tables_lists.texi',
                'line_nr' => 40
              }
            }
          ],
          'extra' => {
            'enumerate_specification' => '1'
          },
          'source_info' => {
            'file_name' => 'indices_in_begin_tables_lists.texi',
            'line_nr' => 35
          }
        },
        {
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'cmdname' => 'enumerate',
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
                  'text' => '
',
                  'type' => 'empty_line'
                }
              ],
              'type' => 'before_item'
            },
            {
              'cmdname' => 'item',
              'contents' => [
                {
                  'text' => ' 
',
                  'type' => 'ignorable_spaces_after_command'
                },
                {
                  'cmdname' => 'cindex',
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'index inter in enumerate after line'
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
                    'file_name' => 'indices_in_begin_tables_lists.texi',
                    'line_nr' => 44
                  },
                  'type' => 'index_entry_command'
                },
                {
                  'contents' => [
                    {
                      'text' => 'enumerate item
'
                    }
                  ],
                  'type' => 'paragraph'
                }
              ],
              'extra' => {
                'item_number' => 1
              },
              'source_info' => {
                'file_name' => 'indices_in_begin_tables_lists.texi',
                'line_nr' => 45
              }
            },
            {
              'cmdname' => 'end',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'enumerate'
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
                'text_arg' => 'enumerate'
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'file_name' => 'indices_in_begin_tables_lists.texi',
                'line_nr' => 46
              }
            }
          ],
          'extra' => {
            'enumerate_specification' => '1'
          },
          'source_info' => {
            'file_name' => 'indices_in_begin_tables_lists.texi',
            'line_nr' => 42
          }
        },
        {
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'cmdname' => 'enumerate',
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
                  'cmdname' => 'cindex',
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'index inter in enumerate before line'
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
                    'file_name' => 'indices_in_begin_tables_lists.texi',
                    'line_nr' => 49
                  },
                  'type' => 'index_entry_command'
                },
                {
                  'text' => '
',
                  'type' => 'empty_line'
                }
              ],
              'type' => 'before_item'
            },
            {
              'cmdname' => 'item',
              'contents' => [
                {
                  'text' => ' ',
                  'type' => 'ignorable_spaces_after_command'
                },
                {
                  'contents' => [
                    {
                      'text' => 'enumerate item
'
                    }
                  ],
                  'type' => 'paragraph'
                }
              ],
              'extra' => {
                'item_number' => 1
              },
              'source_info' => {
                'file_name' => 'indices_in_begin_tables_lists.texi',
                'line_nr' => 51
              }
            },
            {
              'cmdname' => 'end',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'enumerate'
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
                'text_arg' => 'enumerate'
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'file_name' => 'indices_in_begin_tables_lists.texi',
                'line_nr' => 52
              }
            }
          ],
          'extra' => {
            'enumerate_specification' => '1'
          },
          'source_info' => {
            'file_name' => 'indices_in_begin_tables_lists.texi',
            'line_nr' => 48
          }
        },
        {
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'cmdname' => 'enumerate',
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
                  'contents' => [
                    {
                      'text' => 'Title
'
                    }
                  ],
                  'type' => 'paragraph'
                }
              ],
              'type' => 'before_item'
            },
            {
              'cmdname' => 'item',
              'contents' => [
                {
                  'text' => ' 
',
                  'type' => 'ignorable_spaces_after_command'
                },
                {
                  'cmdname' => 'cindex',
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'cindex'
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
                    'file_name' => 'indices_in_begin_tables_lists.texi',
                    'line_nr' => 56
                  },
                  'type' => 'index_entry_command'
                },
                {
                  'contents' => [
                    {
                      'text' => 'enum
'
                    }
                  ],
                  'type' => 'paragraph'
                }
              ],
              'extra' => {
                'item_number' => 1
              },
              'source_info' => {
                'file_name' => 'indices_in_begin_tables_lists.texi',
                'line_nr' => 57
              }
            },
            {
              'cmdname' => 'end',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'enumerate'
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
                'text_arg' => 'enumerate'
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'file_name' => 'indices_in_begin_tables_lists.texi',
                'line_nr' => 58
              }
            }
          ],
          'extra' => {
            'enumerate_specification' => '1'
          },
          'source_info' => {
            'file_name' => 'indices_in_begin_tables_lists.texi',
            'line_nr' => 54
          }
        },
        {
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'cmdname' => 'enumerate',
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
              'type' => 'before_item'
            },
            {
              'cmdname' => 'item',
              'contents' => [
                {
                  'text' => ' 
',
                  'type' => 'ignorable_spaces_after_command'
                },
                {
                  'cmdname' => 'cindex',
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'first idx'
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
                    'file_name' => 'indices_in_begin_tables_lists.texi',
                    'line_nr' => 61
                  },
                  'type' => 'index_entry_command'
                },
                {
                  'cmdname' => 'comment',
                  'contents' => [
                    {
                      'text' => ' comment
',
                      'type' => 'rawline_arg'
                    }
                  ]
                },
                {
                  'cmdname' => 'cindex',
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'sedond idx'
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
                    'file_name' => 'indices_in_begin_tables_lists.texi',
                    'line_nr' => 63
                  },
                  'type' => 'index_entry_command'
                },
                {
                  'cmdname' => 'cindex',
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'another'
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
                    'file_name' => 'indices_in_begin_tables_lists.texi',
                    'line_nr' => 64
                  },
                  'type' => 'index_entry_command'
                },
                {
                  'contents' => [
                    {
                      'text' => 'enum
'
                    }
                  ],
                  'type' => 'paragraph'
                }
              ],
              'extra' => {
                'item_number' => 1
              },
              'source_info' => {
                'file_name' => 'indices_in_begin_tables_lists.texi',
                'line_nr' => 65
              }
            },
            {
              'cmdname' => 'end',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'enumerate'
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
                'text_arg' => 'enumerate'
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'file_name' => 'indices_in_begin_tables_lists.texi',
                'line_nr' => 66
              }
            }
          ],
          'extra' => {
            'enumerate_specification' => '1'
          },
          'source_info' => {
            'file_name' => 'indices_in_begin_tables_lists.texi',
            'line_nr' => 60
          }
        },
        {
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'cmdname' => 'vtable',
          'contents' => [
            {
              'contents' => [
                {
                  'contents' => [
                    {
                      'cmdname' => 'code',
                      'source_info' => {
                        'file_name' => 'indices_in_begin_tables_lists.texi',
                        'line_nr' => 68
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
              'type' => 'arguments_line'
            },
            {
              'contents' => [
                {
                  'contents' => [
                    {
                      'cmdname' => 'c',
                      'contents' => [
                        {
                          'text' => ' comment in table
',
                          'type' => 'rawline_arg'
                        }
                      ]
                    },
                    {
                      'cmdname' => 'item',
                      'contents' => [
                        {
                          'contents' => [
                            {
                              'text' => 'acode--b'
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
                          'vr',
                          1
                        ]
                      },
                      'info' => {
                        'spaces_before_argument' => {
                          'text' => ' '
                        }
                      },
                      'source_info' => {
                        'file_name' => 'indices_in_begin_tables_lists.texi',
                        'line_nr' => 70
                      }
                    }
                  ],
                  'type' => 'table_term'
                },
                {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'l--ine
'
                        }
                      ],
                      'type' => 'paragraph'
                    }
                  ],
                  'type' => 'table_definition'
                }
              ],
              'type' => 'table_entry'
            },
            {
              'cmdname' => 'end',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'vtable'
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
                'text_arg' => 'vtable'
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'file_name' => 'indices_in_begin_tables_lists.texi',
                'line_nr' => 72
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
            'file_name' => 'indices_in_begin_tables_lists.texi',
            'line_nr' => 68
          }
        },
        {
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'cmdname' => 'vtable',
          'contents' => [
            {
              'contents' => [
                {
                  'contents' => [
                    {
                      'cmdname' => 'asis',
                      'source_info' => {
                        'file_name' => 'indices_in_begin_tables_lists.texi',
                        'line_nr' => 74
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
              'type' => 'arguments_line'
            },
            {
              'contents' => [
                {
                  'contents' => [
                    {
                      'cmdname' => 'item',
                      'contents' => [
                        {
                          'contents' => [
                            {
                              'text' => 'aasis--b'
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
                          'vr',
                          2
                        ]
                      },
                      'info' => {
                        'spaces_before_argument' => {
                          'text' => ' '
                        }
                      },
                      'source_info' => {
                        'file_name' => 'indices_in_begin_tables_lists.texi',
                        'line_nr' => 75
                      }
                    },
                    {
                      'contents' => [
                        {
                          'cmdname' => 'c',
                          'contents' => [
                            {
                              'text' => ' comment between item and itemx
',
                              'type' => 'rawline_arg'
                            }
                          ]
                        }
                      ],
                      'type' => 'inter_item'
                    },
                    {
                      'cmdname' => 'itemx',
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
                          'vr',
                          3
                        ]
                      },
                      'info' => {
                        'spaces_before_argument' => {
                          'text' => ' '
                        }
                      },
                      'source_info' => {
                        'file_name' => 'indices_in_begin_tables_lists.texi',
                        'line_nr' => 77
                      }
                    }
                  ],
                  'type' => 'table_term'
                },
                {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'l--ine
'
                        }
                      ],
                      'type' => 'paragraph'
                    }
                  ],
                  'type' => 'table_definition'
                }
              ],
              'type' => 'table_entry'
            },
            {
              'cmdname' => 'end',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'vtable'
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
                'text_arg' => 'vtable'
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'file_name' => 'indices_in_begin_tables_lists.texi',
                'line_nr' => 79
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
            'file_name' => 'indices_in_begin_tables_lists.texi',
            'line_nr' => 74
          }
        },
        {
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'cmdname' => 'ftable',
          'contents' => [
            {
              'contents' => [
                {
                  'contents' => [
                    {
                      'cmdname' => 'var',
                      'source_info' => {
                        'file_name' => 'indices_in_begin_tables_lists.texi',
                        'line_nr' => 81
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
              'type' => 'arguments_line'
            },
            {
              'contents' => [
                {
                  'contents' => [
                    {
                      'cmdname' => 'item',
                      'contents' => [
                        {
                          'contents' => [
                            {
                              'text' => 'avar--b'
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
                          'fn',
                          1
                        ]
                      },
                      'info' => {
                        'spaces_before_argument' => {
                          'text' => ' '
                        }
                      },
                      'source_info' => {
                        'file_name' => 'indices_in_begin_tables_lists.texi',
                        'line_nr' => 82
                      }
                    },
                    {
                      'contents' => [
                        {
                          'cmdname' => 'cindex',
                          'contents' => [
                            {
                              'contents' => [
                                {
                                  'text' => 'index entry between item and itemx'
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
                            'file_name' => 'indices_in_begin_tables_lists.texi',
                            'line_nr' => 83
                          },
                          'type' => 'index_entry_command'
                        },
                        {
                          'cmdname' => 'c',
                          'contents' => [
                            {
                              'text' => ' and a comment
',
                              'type' => 'rawline_arg'
                            }
                          ]
                        },
                        {
                          'cmdname' => 'comment',
                          'contents' => [
                            {
                              'text' => ' and another comment
',
                              'type' => 'rawline_arg'
                            }
                          ]
                        }
                      ],
                      'type' => 'inter_item'
                    },
                    {
                      'cmdname' => 'itemx',
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
                          'fn',
                          2
                        ]
                      },
                      'info' => {
                        'spaces_before_argument' => {
                          'text' => ' '
                        }
                      },
                      'source_info' => {
                        'file_name' => 'indices_in_begin_tables_lists.texi',
                        'line_nr' => 86
                      }
                    }
                  ],
                  'type' => 'table_term'
                },
                {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'l--ine
'
                        }
                      ],
                      'type' => 'paragraph'
                    }
                  ],
                  'type' => 'table_definition'
                }
              ],
              'type' => 'table_entry'
            },
            {
              'contents' => [
                {
                  'contents' => [
                    {
                      'cmdname' => 'item',
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
                          'fn',
                          3
                        ]
                      },
                      'info' => {
                        'spaces_before_argument' => {
                          'text' => ' '
                        }
                      },
                      'source_info' => {
                        'file_name' => 'indices_in_begin_tables_lists.texi',
                        'line_nr' => 88
                      }
                    },
                    {
                      'contents' => [
                        {
                          'text' => '
',
                          'type' => 'empty_line'
                        },
                        {
                          'cmdname' => 'c',
                          'contents' => [
                            {
                              'text' => ' comment between lines
',
                              'type' => 'rawline_arg'
                            }
                          ]
                        },
                        {
                          'text' => '
',
                          'type' => 'empty_line'
                        }
                      ],
                      'type' => 'inter_item'
                    },
                    {
                      'cmdname' => 'itemx',
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
                        'file_name' => 'indices_in_begin_tables_lists.texi',
                        'line_nr' => 92
                      }
                    }
                  ],
                  'type' => 'table_term'
                },
                {
                  'contents' => [
                    {
                      'text' => '
',
                      'type' => 'empty_line'
                    },
                    {
                      'cmdname' => 'c',
                      'contents' => [
                        {
                          'text' => ' comment at end
',
                          'type' => 'rawline_arg'
                        }
                      ]
                    }
                  ],
                  'type' => 'table_definition'
                }
              ],
              'type' => 'table_entry'
            },
            {
              'cmdname' => 'end',
              'contents' => [
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
              'extra' => {
                'text_arg' => 'ftable'
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'file_name' => 'indices_in_begin_tables_lists.texi',
                'line_nr' => 95
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
            'file_name' => 'indices_in_begin_tables_lists.texi',
            'line_nr' => 81
          }
        },
        {
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'cmdname' => 'table',
          'contents' => [
            {
              'contents' => [
                {
                  'contents' => [
                    {
                      'cmdname' => 'code',
                      'source_info' => {
                        'file_name' => 'indices_in_begin_tables_lists.texi',
                        'line_nr' => 97
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
              'type' => 'arguments_line'
            },
            {
              'contents' => [
                {
                  'contents' => [
                    {
                      'cmdname' => 'cindex',
                      'contents' => [
                        {
                          'contents' => [
                            {
                              'text' => 'cindex in table'
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
                        'file_name' => 'indices_in_begin_tables_lists.texi',
                        'line_nr' => 98
                      },
                      'type' => 'index_entry_command'
                    },
                    {
                      'cmdname' => 'c',
                      'contents' => [
                        {
                          'text' => ' comment in table
',
                          'type' => 'rawline_arg'
                        }
                      ]
                    },
                    {
                      'cmdname' => 'item',
                      'contents' => [
                        {
                          'contents' => [
                            {
                              'text' => 'abb'
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
                      'info' => {
                        'spaces_before_argument' => {
                          'text' => ' '
                        }
                      },
                      'source_info' => {
                        'file_name' => 'indices_in_begin_tables_lists.texi',
                        'line_nr' => 100
                      }
                    }
                  ],
                  'type' => 'table_term'
                },
                {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'l--ine
'
                        }
                      ],
                      'type' => 'paragraph'
                    }
                  ],
                  'type' => 'table_definition'
                }
              ],
              'type' => 'table_entry'
            },
            {
              'cmdname' => 'end',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'table'
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
                'text_arg' => 'table'
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'file_name' => 'indices_in_begin_tables_lists.texi',
                'line_nr' => 102
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
            'file_name' => 'indices_in_begin_tables_lists.texi',
            'line_nr' => 97
          }
        },
        {
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'cmdname' => 'table',
          'contents' => [
            {
              'contents' => [
                {
                  'contents' => [
                    {
                      'cmdname' => 'code',
                      'source_info' => {
                        'file_name' => 'indices_in_begin_tables_lists.texi',
                        'line_nr' => 104
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
              'type' => 'arguments_line'
            },
            {
              'contents' => [
                {
                  'cmdname' => 'cindex',
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'cindex in table'
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
                    'file_name' => 'indices_in_begin_tables_lists.texi',
                    'line_nr' => 105
                  },
                  'type' => 'index_entry_command'
                },
                {
                  'contents' => [
                    {
                      'text' => 'Texte before first item.
'
                    }
                  ],
                  'type' => 'paragraph'
                }
              ],
              'type' => 'before_item'
            },
            {
              'contents' => [
                {
                  'contents' => [
                    {
                      'cmdname' => 'item',
                      'contents' => [
                        {
                          'contents' => [
                            {
                              'text' => 'abb'
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
                      'info' => {
                        'spaces_before_argument' => {
                          'text' => ' '
                        }
                      },
                      'source_info' => {
                        'file_name' => 'indices_in_begin_tables_lists.texi',
                        'line_nr' => 107
                      }
                    }
                  ],
                  'type' => 'table_term'
                }
              ],
              'type' => 'table_entry'
            },
            {
              'cmdname' => 'end',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'table'
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
                'text_arg' => 'table'
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'file_name' => 'indices_in_begin_tables_lists.texi',
                'line_nr' => 108
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
            'file_name' => 'indices_in_begin_tables_lists.texi',
            'line_nr' => 104
          }
        },
        {
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'cmdname' => 'table',
          'contents' => [
            {
              'contents' => [
                {
                  'contents' => [
                    {
                      'cmdname' => 'samp',
                      'source_info' => {
                        'file_name' => 'indices_in_begin_tables_lists.texi',
                        'line_nr' => 110
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
              'type' => 'arguments_line'
            },
            {
              'contents' => [
                {
                  'contents' => [
                    {
                      'cmdname' => 'cindex',
                      'contents' => [
                        {
                          'contents' => [
                            {
                              'text' => 'samp cindex in table'
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
                        'file_name' => 'indices_in_begin_tables_lists.texi',
                        'line_nr' => 111
                      },
                      'type' => 'index_entry_command'
                    },
                    {
                      'cmdname' => 'c',
                      'contents' => [
                        {
                          'text' => ' samp comment in table
',
                          'type' => 'rawline_arg'
                        }
                      ]
                    },
                    {
                      'cmdname' => 'item',
                      'contents' => [
                        {
                          'contents' => [
                            {
                              'text' => 'asamp--bb'
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
                      'info' => {
                        'spaces_before_argument' => {
                          'text' => ' '
                        }
                      },
                      'source_info' => {
                        'file_name' => 'indices_in_begin_tables_lists.texi',
                        'line_nr' => 113
                      }
                    }
                  ],
                  'type' => 'table_term'
                },
                {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'l--ine samp
'
                        }
                      ],
                      'type' => 'paragraph'
                    }
                  ],
                  'type' => 'table_definition'
                }
              ],
              'type' => 'table_entry'
            },
            {
              'cmdname' => 'end',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'table'
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
                'text_arg' => 'table'
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'file_name' => 'indices_in_begin_tables_lists.texi',
                'line_nr' => 115
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
            'file_name' => 'indices_in_begin_tables_lists.texi',
            'line_nr' => 110
          }
        },
        {
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'cmdname' => 'table',
          'contents' => [
            {
              'contents' => [
                {
                  'contents' => [
                    {
                      'cmdname' => 'samp',
                      'source_info' => {
                        'file_name' => 'indices_in_begin_tables_lists.texi',
                        'line_nr' => 117
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
              'type' => 'arguments_line'
            },
            {
              'contents' => [
                {
                  'cmdname' => 'cindex',
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'samp cindex in table'
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
                    'file_name' => 'indices_in_begin_tables_lists.texi',
                    'line_nr' => 118
                  },
                  'type' => 'index_entry_command'
                },
                {
                  'contents' => [
                    {
                      'text' => 'Texte before first item samp.
'
                    }
                  ],
                  'type' => 'paragraph'
                }
              ],
              'type' => 'before_item'
            },
            {
              'contents' => [
                {
                  'contents' => [
                    {
                      'cmdname' => 'item',
                      'contents' => [
                        {
                          'contents' => [
                            {
                              'text' => 'asamp--bb'
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
                      'info' => {
                        'spaces_before_argument' => {
                          'text' => ' '
                        }
                      },
                      'source_info' => {
                        'file_name' => 'indices_in_begin_tables_lists.texi',
                        'line_nr' => 120
                      }
                    }
                  ],
                  'type' => 'table_term'
                }
              ],
              'type' => 'table_entry'
            },
            {
              'cmdname' => 'end',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'table'
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
                'text_arg' => 'table'
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'file_name' => 'indices_in_begin_tables_lists.texi',
                'line_nr' => 121
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
            'file_name' => 'indices_in_begin_tables_lists.texi',
            'line_nr' => 117
          }
        },
        {
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'cmdname' => 'table',
          'contents' => [
            {
              'contents' => [
                {
                  'contents' => [
                    {
                      'cmdname' => 'samp',
                      'source_info' => {
                        'file_name' => 'indices_in_begin_tables_lists.texi',
                        'line_nr' => 123
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
              'type' => 'arguments_line'
            },
            {
              'contents' => [
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
                          'text' => 'cindex between lines'
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
                    'file_name' => 'indices_in_begin_tables_lists.texi',
                    'line_nr' => 125
                  },
                  'type' => 'index_entry_command'
                },
                {
                  'text' => '
',
                  'type' => 'empty_line'
                }
              ],
              'type' => 'before_item'
            },
            {
              'contents' => [
                {
                  'contents' => [
                    {
                      'cmdname' => 'item',
                      'contents' => [
                        {
                          'contents' => [
                            {
                              'text' => 'asamp--bb1'
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
                      'info' => {
                        'spaces_before_argument' => {
                          'text' => ' '
                        }
                      },
                      'source_info' => {
                        'file_name' => 'indices_in_begin_tables_lists.texi',
                        'line_nr' => 127
                      }
                    }
                  ],
                  'type' => 'table_term'
                }
              ],
              'type' => 'table_entry'
            },
            {
              'cmdname' => 'end',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'table'
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
                'text_arg' => 'table'
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'file_name' => 'indices_in_begin_tables_lists.texi',
                'line_nr' => 128
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
            'file_name' => 'indices_in_begin_tables_lists.texi',
            'line_nr' => 123
          }
        },
        {
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'cmdname' => 'table',
          'contents' => [
            {
              'contents' => [
                {
                  'contents' => [
                    {
                      'cmdname' => 'samp',
                      'source_info' => {
                        'file_name' => 'indices_in_begin_tables_lists.texi',
                        'line_nr' => 130
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
              'type' => 'arguments_line'
            },
            {
              'contents' => [
                {
                  'cmdname' => 'cindex',
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'cindex before line'
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
                    'file_name' => 'indices_in_begin_tables_lists.texi',
                    'line_nr' => 131
                  },
                  'type' => 'index_entry_command'
                },
                {
                  'text' => '
',
                  'type' => 'empty_line'
                }
              ],
              'type' => 'before_item'
            },
            {
              'contents' => [
                {
                  'contents' => [
                    {
                      'cmdname' => 'item',
                      'contents' => [
                        {
                          'contents' => [
                            {
                              'text' => 'asamp--bb2'
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
                      'info' => {
                        'spaces_before_argument' => {
                          'text' => ' '
                        }
                      },
                      'source_info' => {
                        'file_name' => 'indices_in_begin_tables_lists.texi',
                        'line_nr' => 133
                      }
                    }
                  ],
                  'type' => 'table_term'
                }
              ],
              'type' => 'table_entry'
            },
            {
              'cmdname' => 'end',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'table'
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
                'text_arg' => 'table'
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'file_name' => 'indices_in_begin_tables_lists.texi',
                'line_nr' => 134
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
            'file_name' => 'indices_in_begin_tables_lists.texi',
            'line_nr' => 130
          }
        },
        {
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'cmdname' => 'table',
          'contents' => [
            {
              'contents' => [
                {
                  'contents' => [
                    {
                      'cmdname' => 'samp',
                      'source_info' => {
                        'file_name' => 'indices_in_begin_tables_lists.texi',
                        'line_nr' => 136
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
              'type' => 'arguments_line'
            },
            {
              'contents' => [
                {
                  'text' => '
',
                  'type' => 'empty_line'
                }
              ],
              'type' => 'before_item'
            },
            {
              'contents' => [
                {
                  'contents' => [
                    {
                      'cmdname' => 'cindex',
                      'contents' => [
                        {
                          'contents' => [
                            {
                              'text' => 'cindex after line'
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
                        'file_name' => 'indices_in_begin_tables_lists.texi',
                        'line_nr' => 138
                      },
                      'type' => 'index_entry_command'
                    },
                    {
                      'cmdname' => 'item',
                      'contents' => [
                        {
                          'contents' => [
                            {
                              'text' => 'asamp--bb2'
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
                      'info' => {
                        'spaces_before_argument' => {
                          'text' => ' '
                        }
                      },
                      'source_info' => {
                        'file_name' => 'indices_in_begin_tables_lists.texi',
                        'line_nr' => 139
                      }
                    }
                  ],
                  'type' => 'table_term'
                }
              ],
              'type' => 'table_entry'
            },
            {
              'cmdname' => 'end',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'table'
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
                'text_arg' => 'table'
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'file_name' => 'indices_in_begin_tables_lists.texi',
                'line_nr' => 140
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
            'file_name' => 'indices_in_begin_tables_lists.texi',
            'line_nr' => 136
          }
        },
        {
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'cmdname' => 'table',
          'contents' => [
            {
              'contents' => [
                {
                  'contents' => [
                    {
                      'cmdname' => 'samp',
                      'source_info' => {
                        'file_name' => 'indices_in_begin_tables_lists.texi',
                        'line_nr' => 142
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
              'type' => 'arguments_line'
            },
            {
              'contents' => [
                {
                  'contents' => [
                    {
                      'cmdname' => 'cindex',
                      'contents' => [
                        {
                          'contents' => [
                            {
                              'text' => 'cindex first'
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
                        'file_name' => 'indices_in_begin_tables_lists.texi',
                        'line_nr' => 143
                      },
                      'type' => 'index_entry_command'
                    },
                    {
                      'cmdname' => 'c',
                      'contents' => [
                        {
                          'text' => ' commant
',
                          'type' => 'rawline_arg'
                        }
                      ]
                    },
                    {
                      'cmdname' => 'cindex',
                      'contents' => [
                        {
                          'contents' => [
                            {
                              'text' => 'second'
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
                        'file_name' => 'indices_in_begin_tables_lists.texi',
                        'line_nr' => 145
                      },
                      'type' => 'index_entry_command'
                    },
                    {
                      'cmdname' => 'cindex',
                      'contents' => [
                        {
                          'contents' => [
                            {
                              'text' => 'third'
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
                        'file_name' => 'indices_in_begin_tables_lists.texi',
                        'line_nr' => 146
                      },
                      'type' => 'index_entry_command'
                    },
                    {
                      'cmdname' => 'item',
                      'contents' => [
                        {
                          'contents' => [
                            {
                              'text' => 'asamp--bb2'
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
                      'info' => {
                        'spaces_before_argument' => {
                          'text' => ' '
                        }
                      },
                      'source_info' => {
                        'file_name' => 'indices_in_begin_tables_lists.texi',
                        'line_nr' => 147
                      }
                    }
                  ],
                  'type' => 'table_term'
                }
              ],
              'type' => 'table_entry'
            },
            {
              'cmdname' => 'end',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'table'
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
                'text_arg' => 'table'
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'file_name' => 'indices_in_begin_tables_lists.texi',
                'line_nr' => 148
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
            'file_name' => 'indices_in_begin_tables_lists.texi',
            'line_nr' => 142
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
        'file_name' => 'indices_in_begin_tables_lists.texi',
        'line_nr' => 7
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
                  'text' => 'printindex'
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
        'normalized' => 'printindex'
      },
      'info' => {
        'spaces_before_argument' => {
          'text' => ' '
        }
      },
      'source_info' => {
        'file_name' => 'indices_in_begin_tables_lists.texi',
        'line_nr' => 150
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
                  'text' => 'printindex'
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
            'file_name' => 'indices_in_begin_tables_lists.texi',
            'line_nr' => 153
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
                  'text' => 'vr'
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
              'vr'
            ]
          },
          'info' => {
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'file_name' => 'indices_in_begin_tables_lists.texi',
            'line_nr' => 155
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
            'file_name' => 'indices_in_begin_tables_lists.texi',
            'line_nr' => 157
          }
        },
        {
          'text' => '
',
          'type' => 'empty_line'
        }
      ],
      'extra' => {
        'section_number' => '2'
      },
      'info' => {
        'spaces_before_argument' => {
          'text' => ' '
        }
      },
      'source_info' => {
        'file_name' => 'indices_in_begin_tables_lists.texi',
        'line_nr' => 151
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
$result_trees{'indices_in_begin_tables_lists_entries_after_item'}{'contents'}[4]{'contents'}[2]{'contents'}[2]{'contents'}[1]{'extra'}{'element_node'} = $result_trees{'indices_in_begin_tables_lists_entries_after_item'}{'contents'}[3];
$result_trees{'indices_in_begin_tables_lists_entries_after_item'}{'contents'}[4]{'contents'}[2]{'extra'}{'command_as_argument'} = $result_trees{'indices_in_begin_tables_lists_entries_after_item'}{'contents'}[4]{'contents'}[2]{'contents'}[0]{'contents'}[0]{'contents'}[0];
$result_trees{'indices_in_begin_tables_lists_entries_after_item'}{'contents'}[4]{'contents'}[4]{'contents'}[2]{'contents'}[1]{'extra'}{'element_node'} = $result_trees{'indices_in_begin_tables_lists_entries_after_item'}{'contents'}[3];
$result_trees{'indices_in_begin_tables_lists_entries_after_item'}{'contents'}[4]{'contents'}[4]{'contents'}[3]{'contents'}[1]{'extra'}{'element_node'} = $result_trees{'indices_in_begin_tables_lists_entries_after_item'}{'contents'}[3];
$result_trees{'indices_in_begin_tables_lists_entries_after_item'}{'contents'}[4]{'contents'}[4]{'extra'}{'command_as_argument'} = $result_trees{'indices_in_begin_tables_lists_entries_after_item'}{'contents'}[4]{'contents'}[4]{'contents'}[0]{'contents'}[0]{'contents'}[0];
$result_trees{'indices_in_begin_tables_lists_entries_after_item'}{'contents'}[4]{'contents'}[6]{'contents'}[2]{'contents'}[1]{'extra'}{'element_node'} = $result_trees{'indices_in_begin_tables_lists_entries_after_item'}{'contents'}[3];
$result_trees{'indices_in_begin_tables_lists_entries_after_item'}{'contents'}[4]{'contents'}[6]{'extra'}{'command_as_argument'} = $result_trees{'indices_in_begin_tables_lists_entries_after_item'}{'contents'}[4]{'contents'}[6]{'contents'}[0]{'contents'}[0]{'contents'}[0];
$result_trees{'indices_in_begin_tables_lists_entries_after_item'}{'contents'}[4]{'contents'}[10]{'contents'}[1]{'contents'}[1]{'extra'}{'element_node'} = $result_trees{'indices_in_begin_tables_lists_entries_after_item'}{'contents'}[3];
$result_trees{'indices_in_begin_tables_lists_entries_after_item'}{'contents'}[4]{'contents'}[12]{'contents'}[2]{'contents'}[1]{'extra'}{'element_node'} = $result_trees{'indices_in_begin_tables_lists_entries_after_item'}{'contents'}[3];
$result_trees{'indices_in_begin_tables_lists_entries_after_item'}{'contents'}[4]{'contents'}[14]{'contents'}[1]{'contents'}[0]{'extra'}{'element_node'} = $result_trees{'indices_in_begin_tables_lists_entries_after_item'}{'contents'}[3];
$result_trees{'indices_in_begin_tables_lists_entries_after_item'}{'contents'}[4]{'contents'}[16]{'contents'}[2]{'contents'}[1]{'extra'}{'element_node'} = $result_trees{'indices_in_begin_tables_lists_entries_after_item'}{'contents'}[3];
$result_trees{'indices_in_begin_tables_lists_entries_after_item'}{'contents'}[4]{'contents'}[18]{'contents'}[2]{'contents'}[1]{'extra'}{'element_node'} = $result_trees{'indices_in_begin_tables_lists_entries_after_item'}{'contents'}[3];
$result_trees{'indices_in_begin_tables_lists_entries_after_item'}{'contents'}[4]{'contents'}[18]{'contents'}[2]{'contents'}[3]{'extra'}{'element_node'} = $result_trees{'indices_in_begin_tables_lists_entries_after_item'}{'contents'}[3];
$result_trees{'indices_in_begin_tables_lists_entries_after_item'}{'contents'}[4]{'contents'}[18]{'contents'}[2]{'contents'}[4]{'extra'}{'element_node'} = $result_trees{'indices_in_begin_tables_lists_entries_after_item'}{'contents'}[3];
$result_trees{'indices_in_begin_tables_lists_entries_after_item'}{'contents'}[4]{'contents'}[20]{'contents'}[1]{'contents'}[0]{'contents'}[1]{'extra'}{'element_node'} = $result_trees{'indices_in_begin_tables_lists_entries_after_item'}{'contents'}[3];
$result_trees{'indices_in_begin_tables_lists_entries_after_item'}{'contents'}[4]{'contents'}[20]{'extra'}{'command_as_argument'} = $result_trees{'indices_in_begin_tables_lists_entries_after_item'}{'contents'}[4]{'contents'}[20]{'contents'}[0]{'contents'}[0]{'contents'}[0];
$result_trees{'indices_in_begin_tables_lists_entries_after_item'}{'contents'}[4]{'contents'}[22]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'extra'}{'element_node'} = $result_trees{'indices_in_begin_tables_lists_entries_after_item'}{'contents'}[3];
$result_trees{'indices_in_begin_tables_lists_entries_after_item'}{'contents'}[4]{'contents'}[22]{'contents'}[1]{'contents'}[0]{'contents'}[2]{'extra'}{'element_node'} = $result_trees{'indices_in_begin_tables_lists_entries_after_item'}{'contents'}[3];
$result_trees{'indices_in_begin_tables_lists_entries_after_item'}{'contents'}[4]{'contents'}[22]{'extra'}{'command_as_argument'} = $result_trees{'indices_in_begin_tables_lists_entries_after_item'}{'contents'}[4]{'contents'}[22]{'contents'}[0]{'contents'}[0]{'contents'}[0];
$result_trees{'indices_in_begin_tables_lists_entries_after_item'}{'contents'}[4]{'contents'}[24]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'extra'}{'element_node'} = $result_trees{'indices_in_begin_tables_lists_entries_after_item'}{'contents'}[3];
$result_trees{'indices_in_begin_tables_lists_entries_after_item'}{'contents'}[4]{'contents'}[24]{'contents'}[1]{'contents'}[0]{'contents'}[1]{'contents'}[0]{'extra'}{'element_node'} = $result_trees{'indices_in_begin_tables_lists_entries_after_item'}{'contents'}[3];
$result_trees{'indices_in_begin_tables_lists_entries_after_item'}{'contents'}[4]{'contents'}[24]{'contents'}[1]{'contents'}[0]{'contents'}[2]{'extra'}{'element_node'} = $result_trees{'indices_in_begin_tables_lists_entries_after_item'}{'contents'}[3];
$result_trees{'indices_in_begin_tables_lists_entries_after_item'}{'contents'}[4]{'contents'}[24]{'contents'}[2]{'contents'}[0]{'contents'}[0]{'extra'}{'element_node'} = $result_trees{'indices_in_begin_tables_lists_entries_after_item'}{'contents'}[3];
$result_trees{'indices_in_begin_tables_lists_entries_after_item'}{'contents'}[4]{'contents'}[24]{'contents'}[2]{'contents'}[0]{'contents'}[2]{'extra'}{'element_node'} = $result_trees{'indices_in_begin_tables_lists_entries_after_item'}{'contents'}[3];
$result_trees{'indices_in_begin_tables_lists_entries_after_item'}{'contents'}[4]{'contents'}[24]{'extra'}{'command_as_argument'} = $result_trees{'indices_in_begin_tables_lists_entries_after_item'}{'contents'}[4]{'contents'}[24]{'contents'}[0]{'contents'}[0]{'contents'}[0];
$result_trees{'indices_in_begin_tables_lists_entries_after_item'}{'contents'}[4]{'contents'}[26]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'extra'}{'element_node'} = $result_trees{'indices_in_begin_tables_lists_entries_after_item'}{'contents'}[3];
$result_trees{'indices_in_begin_tables_lists_entries_after_item'}{'contents'}[4]{'contents'}[26]{'extra'}{'command_as_argument'} = $result_trees{'indices_in_begin_tables_lists_entries_after_item'}{'contents'}[4]{'contents'}[26]{'contents'}[0]{'contents'}[0]{'contents'}[0];
$result_trees{'indices_in_begin_tables_lists_entries_after_item'}{'contents'}[4]{'contents'}[28]{'contents'}[1]{'contents'}[0]{'extra'}{'element_node'} = $result_trees{'indices_in_begin_tables_lists_entries_after_item'}{'contents'}[3];
$result_trees{'indices_in_begin_tables_lists_entries_after_item'}{'contents'}[4]{'contents'}[28]{'extra'}{'command_as_argument'} = $result_trees{'indices_in_begin_tables_lists_entries_after_item'}{'contents'}[4]{'contents'}[28]{'contents'}[0]{'contents'}[0]{'contents'}[0];
$result_trees{'indices_in_begin_tables_lists_entries_after_item'}{'contents'}[4]{'contents'}[30]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'extra'}{'element_node'} = $result_trees{'indices_in_begin_tables_lists_entries_after_item'}{'contents'}[3];
$result_trees{'indices_in_begin_tables_lists_entries_after_item'}{'contents'}[4]{'contents'}[30]{'extra'}{'command_as_argument'} = $result_trees{'indices_in_begin_tables_lists_entries_after_item'}{'contents'}[4]{'contents'}[30]{'contents'}[0]{'contents'}[0]{'contents'}[0];
$result_trees{'indices_in_begin_tables_lists_entries_after_item'}{'contents'}[4]{'contents'}[32]{'contents'}[1]{'contents'}[0]{'extra'}{'element_node'} = $result_trees{'indices_in_begin_tables_lists_entries_after_item'}{'contents'}[3];
$result_trees{'indices_in_begin_tables_lists_entries_after_item'}{'contents'}[4]{'contents'}[32]{'extra'}{'command_as_argument'} = $result_trees{'indices_in_begin_tables_lists_entries_after_item'}{'contents'}[4]{'contents'}[32]{'contents'}[0]{'contents'}[0]{'contents'}[0];
$result_trees{'indices_in_begin_tables_lists_entries_after_item'}{'contents'}[4]{'contents'}[34]{'contents'}[1]{'contents'}[1]{'extra'}{'element_node'} = $result_trees{'indices_in_begin_tables_lists_entries_after_item'}{'contents'}[3];
$result_trees{'indices_in_begin_tables_lists_entries_after_item'}{'contents'}[4]{'contents'}[34]{'extra'}{'command_as_argument'} = $result_trees{'indices_in_begin_tables_lists_entries_after_item'}{'contents'}[4]{'contents'}[34]{'contents'}[0]{'contents'}[0]{'contents'}[0];
$result_trees{'indices_in_begin_tables_lists_entries_after_item'}{'contents'}[4]{'contents'}[36]{'contents'}[1]{'contents'}[0]{'extra'}{'element_node'} = $result_trees{'indices_in_begin_tables_lists_entries_after_item'}{'contents'}[3];
$result_trees{'indices_in_begin_tables_lists_entries_after_item'}{'contents'}[4]{'contents'}[36]{'extra'}{'command_as_argument'} = $result_trees{'indices_in_begin_tables_lists_entries_after_item'}{'contents'}[4]{'contents'}[36]{'contents'}[0]{'contents'}[0]{'contents'}[0];
$result_trees{'indices_in_begin_tables_lists_entries_after_item'}{'contents'}[4]{'contents'}[38]{'contents'}[2]{'contents'}[0]{'contents'}[0]{'extra'}{'element_node'} = $result_trees{'indices_in_begin_tables_lists_entries_after_item'}{'contents'}[3];
$result_trees{'indices_in_begin_tables_lists_entries_after_item'}{'contents'}[4]{'contents'}[38]{'extra'}{'command_as_argument'} = $result_trees{'indices_in_begin_tables_lists_entries_after_item'}{'contents'}[4]{'contents'}[38]{'contents'}[0]{'contents'}[0]{'contents'}[0];
$result_trees{'indices_in_begin_tables_lists_entries_after_item'}{'contents'}[4]{'contents'}[40]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'extra'}{'element_node'} = $result_trees{'indices_in_begin_tables_lists_entries_after_item'}{'contents'}[3];
$result_trees{'indices_in_begin_tables_lists_entries_after_item'}{'contents'}[4]{'contents'}[40]{'contents'}[1]{'contents'}[0]{'contents'}[2]{'extra'}{'element_node'} = $result_trees{'indices_in_begin_tables_lists_entries_after_item'}{'contents'}[3];
$result_trees{'indices_in_begin_tables_lists_entries_after_item'}{'contents'}[4]{'contents'}[40]{'contents'}[1]{'contents'}[0]{'contents'}[3]{'extra'}{'element_node'} = $result_trees{'indices_in_begin_tables_lists_entries_after_item'}{'contents'}[3];
$result_trees{'indices_in_begin_tables_lists_entries_after_item'}{'contents'}[4]{'contents'}[40]{'extra'}{'command_as_argument'} = $result_trees{'indices_in_begin_tables_lists_entries_after_item'}{'contents'}[4]{'contents'}[40]{'contents'}[0]{'contents'}[0]{'contents'}[0];

$result_texis{'indices_in_begin_tables_lists_entries_after_item'} = '\\input texinfo.tex

@node Top
@top top

@node chapter
@chapter chap

@itemize @minus
@c comment in itemize
@item 
@cindex also a cindex in itemize
e--mph item
@end itemize

@itemize @bullet
@item 
@cindex index entry within itemize
i--tem 1
@item @cindex index entry right after @@item
i--tem 2
@end itemize

@itemize
@c comment in itemize
T--ext before items.
@item 
@cindex also a cindex in itemize
bullet item
@end itemize

@enumerate

@comment comment before first item in enumerate
@item e--numerate
@end enumerate

@enumerate

@cindex index inter in enumerate between lines

@item enumerate item
@end enumerate

@enumerate

@item 
@cindex index inter in enumerate after line
enumerate item
@end enumerate

@enumerate
@cindex index inter in enumerate before line

@item enumerate item
@end enumerate

@enumerate
Title
@item 
@cindex cindex
enum
@end enumerate

@enumerate
@item 
@cindex first idx
@comment comment
@cindex sedond idx
@cindex another
enum
@end enumerate

@vtable @code
@c comment in table
@item acode--b
l--ine
@end vtable

@vtable @asis
@item aasis--b
@c comment between item and itemx
@itemx b
l--ine
@end vtable

@ftable @var
@item avar--b
@cindex index entry between item and itemx
@c and a comment
@comment and another comment
@itemx b
l--ine
@item c

@c comment between lines

@itemx d

@c comment at end
@end ftable

@table @code
@cindex cindex in table 
@c comment in table
@item abb
l--ine
@end table

@table @code
@cindex cindex in table 
Texte before first item.
@item abb
@end table

@table @samp
@cindex samp cindex in table 
@c samp comment in table
@item asamp--bb
l--ine samp
@end table

@table @samp
@cindex samp cindex in table 
Texte before first item samp.
@item asamp--bb
@end table

@table @samp

@cindex cindex between lines

@item asamp--bb1
@end table

@table @samp
@cindex cindex before line

@item asamp--bb2
@end table

@table @samp

@cindex cindex after line
@item asamp--bb2
@end table

@table @samp
@cindex cindex first
@c commant
@cindex second
@cindex third
@item asamp--bb2
@end table

@node printindex
@chapter printindex

@printindex cp

@printindex vr

@printindex fn

@bye
';


$result_texts{'indices_in_begin_tables_lists_entries_after_item'} = 'top
***

1 chap
******

e-mph item

i-tem 1
i-tem 2

T-ext before items.
bullet item


1. e-numerate



1. enumerate item


1. enumerate item


1. enumerate item

Title
1. enum

1. enum

acode-b
l-ine

aasis-b
b
l-ine

avar-b
b
l-ine
c


d


abb
l-ine

Texte before first item.
abb

asamp-bb
l-ine samp

Texte before first item samp.
asamp-bb



asamp-bb1


asamp-bb2


asamp-bb2

asamp-bb2

2 printindex
************




';

$result_sectioning{'indices_in_begin_tables_lists_entries_after_item'} = {
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
            },
            {
              'cmdname' => 'chapter',
              'extra' => {
                'associated_node' => {
                  'cmdname' => 'node',
                  'extra' => {
                    'isindex' => 1,
                    'normalized' => 'printindex'
                  }
                },
                'section_directions' => {
                  'prev' => {},
                  'up' => {}
                },
                'section_level' => 1,
                'section_number' => '2',
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
$result_sectioning{'indices_in_begin_tables_lists_entries_after_item'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[0]{'extra'}{'section_directions'}{'up'} = $result_sectioning{'indices_in_begin_tables_lists_entries_after_item'}{'extra'}{'section_childs'}[0];
$result_sectioning{'indices_in_begin_tables_lists_entries_after_item'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[0]{'extra'}{'toplevel_directions'}{'prev'} = $result_sectioning{'indices_in_begin_tables_lists_entries_after_item'}{'extra'}{'section_childs'}[0];
$result_sectioning{'indices_in_begin_tables_lists_entries_after_item'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[0]{'extra'}{'toplevel_directions'}{'up'} = $result_sectioning{'indices_in_begin_tables_lists_entries_after_item'}{'extra'}{'section_childs'}[0];
$result_sectioning{'indices_in_begin_tables_lists_entries_after_item'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[1]{'extra'}{'section_directions'}{'prev'} = $result_sectioning{'indices_in_begin_tables_lists_entries_after_item'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[0];
$result_sectioning{'indices_in_begin_tables_lists_entries_after_item'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[1]{'extra'}{'section_directions'}{'up'} = $result_sectioning{'indices_in_begin_tables_lists_entries_after_item'}{'extra'}{'section_childs'}[0];
$result_sectioning{'indices_in_begin_tables_lists_entries_after_item'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[1]{'extra'}{'toplevel_directions'}{'prev'} = $result_sectioning{'indices_in_begin_tables_lists_entries_after_item'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[0];
$result_sectioning{'indices_in_begin_tables_lists_entries_after_item'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[1]{'extra'}{'toplevel_directions'}{'up'} = $result_sectioning{'indices_in_begin_tables_lists_entries_after_item'}{'extra'}{'section_childs'}[0];
$result_sectioning{'indices_in_begin_tables_lists_entries_after_item'}{'extra'}{'section_childs'}[0]{'extra'}{'sectioning_root'} = $result_sectioning{'indices_in_begin_tables_lists_entries_after_item'};

$result_nodes{'indices_in_begin_tables_lists_entries_after_item'} = [
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
              'next' => {
                'cmdname' => 'node',
                'extra' => {
                  'associated_section' => {
                    'cmdname' => 'chapter',
                    'extra' => {
                      'section_number' => '2'
                    }
                  },
                  'isindex' => 1,
                  'node_directions' => {
                    'prev' => {},
                    'up' => {}
                  },
                  'normalized' => 'printindex'
                }
              },
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
  {},
  {}
];
$result_nodes{'indices_in_begin_tables_lists_entries_after_item'}[0]{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'prev'} = $result_nodes{'indices_in_begin_tables_lists_entries_after_item'}[0]{'extra'}{'node_directions'}{'next'};
$result_nodes{'indices_in_begin_tables_lists_entries_after_item'}[0]{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'up'} = $result_nodes{'indices_in_begin_tables_lists_entries_after_item'}[0];
$result_nodes{'indices_in_begin_tables_lists_entries_after_item'}[0]{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'prev'} = $result_nodes{'indices_in_begin_tables_lists_entries_after_item'}[0];
$result_nodes{'indices_in_begin_tables_lists_entries_after_item'}[0]{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'up'} = $result_nodes{'indices_in_begin_tables_lists_entries_after_item'}[0];
$result_nodes{'indices_in_begin_tables_lists_entries_after_item'}[1] = $result_nodes{'indices_in_begin_tables_lists_entries_after_item'}[0]{'extra'}{'node_directions'}{'next'};
$result_nodes{'indices_in_begin_tables_lists_entries_after_item'}[2] = $result_nodes{'indices_in_begin_tables_lists_entries_after_item'}[0]{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'next'};

$result_menus{'indices_in_begin_tables_lists_entries_after_item'} = [
  {
    'extra' => {
      'normalized' => 'Top'
    }
  },
  {
    'extra' => {
      'normalized' => 'chapter'
    }
  },
  {
    'extra' => {
      'normalized' => 'printindex'
    }
  }
];

$result_errors{'indices_in_begin_tables_lists_entries_after_item'} = [
  {
    'error_line' => 'warning: @cindex should only appear at the beginning of a line
',
    'file_name' => 'indices_in_begin_tables_lists.texi',
    'line_nr' => 18,
    'text' => '@cindex should only appear at the beginning of a line',
    'type' => 'warning'
  }
];


$result_floats{'indices_in_begin_tables_lists_entries_after_item'} = {};


$result_indices_sort_strings{'indices_in_begin_tables_lists_entries_after_item'} = {
  'cp' => [
    'also a cindex in itemize',
    'also a cindex in itemize',
    'another',
    'cindex',
    'cindex after line',
    'cindex before line',
    'cindex between lines',
    'cindex first',
    'cindex in table',
    'cindex in table',
    'first idx',
    'index entry between item and itemx',
    'index entry right after @item',
    'index entry within itemize',
    'index inter in enumerate after line',
    'index inter in enumerate before line',
    'index inter in enumerate between lines',
    'samp cindex in table',
    'samp cindex in table',
    'second',
    'sedond idx',
    'third'
  ],
  'fn' => [
    'avar--b',
    'b',
    'c',
    'd'
  ],
  'vr' => [
    'aasis--b',
    'acode--b',
    'b'
  ]
};


1;
