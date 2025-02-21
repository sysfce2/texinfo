use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'item_index_transformation'} = {
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
        'normalized' => 'chap'
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
      'cmdname' => 'chapter',
      'contents' => [
        {
          'contents' => [
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
          'type' => 'arguments_line'
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
                      'cmdname' => 'asis',
                      'source_info' => {
                        'line_nr' => 4
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
                              'text' => 'After1'
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
                              'text' => 'After2'
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
                              'text' => 'Before1'
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
                        'line_nr' => 5
                      },
                      'type' => 'index_entry_command'
                    },
                    {
                      'cmdname' => 'item',
                      'contents' => [
                        {
                          'contents' => [
                            {
                              'text' => 'one'
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
                        'associated_index_entry' => [
                          'cp',
                          2
                        ]
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
                      'cmdname' => 'itemx',
                      'contents' => [
                        {
                          'contents' => [
                            {
                              'text' => 'onex'
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
                        'line_nr' => 7
                      }
                    },
                    {
                      'cmdname' => 'itemx',
                      'contents' => [
                        {
                          'contents' => [
                            {
                              'text' => 'oney'
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
                        'line_nr' => 8
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
                          'text' => 'AAA
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
                              'text' => 'two'
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
                        'line_nr' => 12
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
                          'text' => 'BBB
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
                'line_nr' => 14
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
            'line_nr' => 4
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
                      'cmdname' => 'asis',
                      'source_info' => {
                        'line_nr' => 16
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
                              'text' => 'after1'
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
                              'text' => 'after2'
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
                        'line_nr' => 21
                      },
                      'type' => 'index_entry_command'
                    },
                    {
                      'cmdname' => 'item',
                      'contents' => [
                        {
                          'contents' => [
                            {
                              'text' => 'three'
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
                        'associated_index_entry' => [
                          'cp',
                          4
                        ]
                      },
                      'info' => {
                        'spaces_before_argument' => {
                          'text' => ' '
                        }
                      },
                      'source_info' => {
                        'line_nr' => 17
                      }
                    },
                    {
                      'cmdname' => 'itemx',
                      'contents' => [
                        {
                          'contents' => [
                            {
                              'text' => 'threex'
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
                        'line_nr' => 18
                      }
                    },
                    {
                      'cmdname' => 'itemx',
                      'contents' => [
                        {
                          'contents' => [
                            {
                              'text' => 'zzzz'
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
                        'line_nr' => 19
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
                          'text' => 'CCCC
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
                              'text' => 'zzzz2'
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
                        'line_nr' => 23
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
                          'text' => 'DDDDD
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
                'line_nr' => 25
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
            'line_nr' => 16
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
                      'cmdname' => 'asis',
                      'source_info' => {
                        'line_nr' => 27
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
                              'text' => 'before1'
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
                              'text' => 'before2'
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
                        'line_nr' => 29
                      },
                      'type' => 'index_entry_command'
                    },
                    {
                      'cmdname' => 'item',
                      'contents' => [
                        {
                          'contents' => [
                            {
                              'text' => 'four'
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
                        'associated_index_entry' => [
                          'cp',
                          6
                        ]
                      },
                      'info' => {
                        'spaces_before_argument' => {
                          'text' => ' '
                        }
                      },
                      'source_info' => {
                        'line_nr' => 30
                      }
                    },
                    {
                      'cmdname' => 'itemx',
                      'contents' => [
                        {
                          'contents' => [
                            {
                              'text' => 'fourx'
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
                        'line_nr' => 31
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
                          'text' => 'EEEE
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
                              'text' => 'foour'
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
                        'line_nr' => 33
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
                          'text' => 'FFFFf
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
                'line_nr' => 35
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
            'line_nr' => 27
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
                      'cmdname' => 'asis',
                      'source_info' => {
                        'line_nr' => 37
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
                              'text' => 'five'
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
                        'line_nr' => 38
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
                          'text' => 'GGGG
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
                      'cmdname' => 'cindex',
                      'contents' => [
                        {
                          'contents' => [
                            {
                              'text' => 'after6'
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
                              'text' => 'after7'
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
                        'line_nr' => 43
                      },
                      'type' => 'index_entry_command'
                    },
                    {
                      'cmdname' => 'item',
                      'contents' => [
                        {
                          'contents' => [
                            {
                              'text' => 'six'
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
                        'associated_index_entry' => [
                          'cp',
                          8
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
                      'cmdname' => 'itemx',
                      'contents' => [
                        {
                          'contents' => [
                            {
                              'text' => 'sixx'
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
                        'line_nr' => 41
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
                          'text' => 'HHHHHH
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
                'line_nr' => 45
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
            'line_nr' => 37
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
        'line_nr' => 2
      }
    }
  ],
  'type' => 'document_root'
};
$result_trees{'item_index_transformation'}{'contents'}[2]{'contents'}[2]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'extra'}{'element_node'} = $result_trees{'item_index_transformation'}{'contents'}[1];
$result_trees{'item_index_transformation'}{'contents'}[2]{'contents'}[2]{'contents'}[1]{'contents'}[0]{'contents'}[1]{'extra'}{'element_node'} = $result_trees{'item_index_transformation'}{'contents'}[1];
$result_trees{'item_index_transformation'}{'contents'}[2]{'contents'}[2]{'contents'}[1]{'contents'}[0]{'contents'}[2]{'extra'}{'element_node'} = $result_trees{'item_index_transformation'}{'contents'}[1];
$result_trees{'item_index_transformation'}{'contents'}[2]{'contents'}[2]{'extra'}{'command_as_argument'} = $result_trees{'item_index_transformation'}{'contents'}[2]{'contents'}[2]{'contents'}[0]{'contents'}[0]{'contents'}[0];
$result_trees{'item_index_transformation'}{'contents'}[2]{'contents'}[4]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'extra'}{'element_node'} = $result_trees{'item_index_transformation'}{'contents'}[1];
$result_trees{'item_index_transformation'}{'contents'}[2]{'contents'}[4]{'contents'}[1]{'contents'}[0]{'contents'}[1]{'extra'}{'element_node'} = $result_trees{'item_index_transformation'}{'contents'}[1];
$result_trees{'item_index_transformation'}{'contents'}[2]{'contents'}[4]{'extra'}{'command_as_argument'} = $result_trees{'item_index_transformation'}{'contents'}[2]{'contents'}[4]{'contents'}[0]{'contents'}[0]{'contents'}[0];
$result_trees{'item_index_transformation'}{'contents'}[2]{'contents'}[6]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'extra'}{'element_node'} = $result_trees{'item_index_transformation'}{'contents'}[1];
$result_trees{'item_index_transformation'}{'contents'}[2]{'contents'}[6]{'contents'}[1]{'contents'}[0]{'contents'}[1]{'extra'}{'element_node'} = $result_trees{'item_index_transformation'}{'contents'}[1];
$result_trees{'item_index_transformation'}{'contents'}[2]{'contents'}[6]{'extra'}{'command_as_argument'} = $result_trees{'item_index_transformation'}{'contents'}[2]{'contents'}[6]{'contents'}[0]{'contents'}[0]{'contents'}[0];
$result_trees{'item_index_transformation'}{'contents'}[2]{'contents'}[8]{'contents'}[2]{'contents'}[0]{'contents'}[0]{'extra'}{'element_node'} = $result_trees{'item_index_transformation'}{'contents'}[1];
$result_trees{'item_index_transformation'}{'contents'}[2]{'contents'}[8]{'contents'}[2]{'contents'}[0]{'contents'}[1]{'extra'}{'element_node'} = $result_trees{'item_index_transformation'}{'contents'}[1];
$result_trees{'item_index_transformation'}{'contents'}[2]{'contents'}[8]{'extra'}{'command_as_argument'} = $result_trees{'item_index_transformation'}{'contents'}[2]{'contents'}[8]{'contents'}[0]{'contents'}[0]{'contents'}[0];

$result_texis{'item_index_transformation'} = '@node chap
@chapter Chapter

@table @asis
@cindex After1
@cindex After2
@cindex Before1
@item one
@itemx onex
@itemx oney
AAA
@item two
BBB
@end table

@table @asis
@cindex after1
@cindex after2
@item three
@itemx threex
@itemx zzzz
CCCC
@item zzzz2
DDDDD
@end table

@table @asis
@cindex before1
@cindex before2
@item four
@itemx fourx
EEEE
@item foour
FFFFf
@end table

@table @asis
@item five
GGGG
@cindex after6
@cindex after7
@item six
@itemx sixx
HHHHHH
@end table
';


$result_texts{'item_index_transformation'} = '1 Chapter
*********

one
onex
oney
AAA
two
BBB

three
threex
zzzz
CCCC
zzzz2
DDDDD

four
fourx
EEEE
foour
FFFFf

five
GGGG
six
sixx
HHHHHH
';

$result_sectioning{'item_index_transformation'} = {
  'extra' => {
    'section_childs' => [
      {
        'cmdname' => 'chapter',
        'extra' => {
          'associated_node' => {
            'cmdname' => 'node',
            'extra' => {
              'normalized' => 'chap'
            }
          },
          'section_level' => 1,
          'section_number' => '1',
          'sectioning_root' => {}
        }
      }
    ],
    'section_level' => 0
  }
};
$result_sectioning{'item_index_transformation'}{'extra'}{'section_childs'}[0]{'extra'}{'sectioning_root'} = $result_sectioning{'item_index_transformation'};

$result_nodes{'item_index_transformation'} = [
  {
    'cmdname' => 'node',
    'extra' => {
      'associated_section' => {
        'cmdname' => 'chapter',
        'extra' => {
          'section_number' => '1'
        }
      },
      'normalized' => 'chap'
    }
  }
];

$result_menus{'item_index_transformation'} = [
  {
    'extra' => {
      'normalized' => 'chap'
    }
  }
];

$result_errors{'item_index_transformation'} = [];


$result_floats{'item_index_transformation'} = {};


$result_indices_sort_strings{'item_index_transformation'} = {
  'cp' => [
    'After1',
    'after1',
    'After2',
    'after2',
    'after6',
    'after7',
    'Before1',
    'before1',
    'before2'
  ]
};



$result_converted{'plaintext'}->{'item_index_transformation'} = '1 Chapter
*********

one
onex
oney
     AAA
two
     BBB

three
threex
zzzz
     CCCC
zzzz2
     DDDDD

four
fourx
     EEEE
foour
     FFFFf

five
     GGGG
six
sixx
     HHHHHH
';


$result_converted{'html_text'}->{'item_index_transformation'} = '<div class="chapter-level-extent" id="chap">
<h2 class="chapter" id="Chapter"><span>1 Chapter<a class="copiable-link" href="#Chapter"> &para;</a></span></h2>

<dl class="table">
<dt><a class="index-entry-id" id="index-After2"></a>
<a class="index-entry-id" id="index-Before1"></a>
<a id="index-After1"></a><span>one<a class="copiable-link" href="#index-After1"> &para;</a></span></dt>
<dt>onex</dt>
<dt>oney</dt>
<dd><p>AAA
</p></dd>
<dt>two</dt>
<dd><p>BBB
</p></dd>
</dl>

<dl class="table">
<dt><a class="index-entry-id" id="index-after2"></a>
<a id="index-after1"></a><span>three<a class="copiable-link" href="#index-after1"> &para;</a></span></dt>
<dt>threex</dt>
<dt>zzzz</dt>
<dd><p>CCCC
</p></dd>
<dt>zzzz2</dt>
<dd><p>DDDDD
</p></dd>
</dl>

<dl class="table">
<dt><a class="index-entry-id" id="index-before2"></a>
<a id="index-before1"></a><span>four<a class="copiable-link" href="#index-before1"> &para;</a></span></dt>
<dt>fourx</dt>
<dd><p>EEEE
</p></dd>
<dt>foour</dt>
<dd><p>FFFFf
</p></dd>
</dl>

<dl class="table">
<dt>five</dt>
<dd><p>GGGG
</p></dd>
<dt><a class="index-entry-id" id="index-after7"></a>
<a id="index-after6"></a><span>six<a class="copiable-link" href="#index-after6"> &para;</a></span></dt>
<dt>sixx</dt>
<dd><p>HHHHHH
</p></dd>
</dl>
</div>
';


$result_converted{'xml'}->{'item_index_transformation'} = '<node name="chap" spaces=" "><nodename>chap</nodename></node>
<chapter spaces=" "><sectiontitle>Chapter</sectiontitle>

<table commandarg="asis" spaces=" " endspaces=" ">
<tableentry><tableterm><cindex index="cp" spaces=" "><indexterm index="cp" number="2">After1</indexterm></cindex>
<cindex index="cp" spaces=" "><indexterm index="cp" number="3">After2</indexterm></cindex>
<cindex index="cp" spaces=" "><indexterm index="cp" number="1">Before1</indexterm></cindex>
<item spaces=" "><itemformat command="asis">one</itemformat></item>
<itemx spaces=" "><itemformat command="asis">onex</itemformat></itemx>
<itemx spaces=" "><itemformat command="asis">oney</itemformat></itemx>
</tableterm><tableitem><para>AAA
</para></tableitem></tableentry><tableentry><tableterm><item spaces=" "><itemformat command="asis">two</itemformat></item>
</tableterm><tableitem><para>BBB
</para></tableitem></tableentry></table>

<table commandarg="asis" spaces=" " endspaces=" ">
<tableentry><tableterm><cindex index="cp" spaces=" "><indexterm index="cp" number="4">after1</indexterm></cindex>
<cindex index="cp" spaces=" "><indexterm index="cp" number="5">after2</indexterm></cindex>
<item spaces=" "><itemformat command="asis">three</itemformat></item>
<itemx spaces=" "><itemformat command="asis">threex</itemformat></itemx>
<itemx spaces=" "><itemformat command="asis">zzzz</itemformat></itemx>
</tableterm><tableitem><para>CCCC
</para></tableitem></tableentry><tableentry><tableterm><item spaces=" "><itemformat command="asis">zzzz2</itemformat></item>
</tableterm><tableitem><para>DDDDD
</para></tableitem></tableentry></table>

<table commandarg="asis" spaces=" " endspaces=" ">
<tableentry><tableterm><cindex index="cp" spaces=" "><indexterm index="cp" number="6">before1</indexterm></cindex>
<cindex index="cp" spaces=" "><indexterm index="cp" number="7">before2</indexterm></cindex>
<item spaces=" "><itemformat command="asis">four</itemformat></item>
<itemx spaces=" "><itemformat command="asis">fourx</itemformat></itemx>
</tableterm><tableitem><para>EEEE
</para></tableitem></tableentry><tableentry><tableterm><item spaces=" "><itemformat command="asis">foour</itemformat></item>
</tableterm><tableitem><para>FFFFf
</para></tableitem></tableentry></table>

<table commandarg="asis" spaces=" " endspaces=" ">
<tableentry><tableterm><item spaces=" "><itemformat command="asis">five</itemformat></item>
</tableterm><tableitem><para>GGGG
</para></tableitem></tableentry><tableentry><tableterm><cindex index="cp" spaces=" "><indexterm index="cp" number="8">after6</indexterm></cindex>
<cindex index="cp" spaces=" "><indexterm index="cp" number="9">after7</indexterm></cindex>
<item spaces=" "><itemformat command="asis">six</itemformat></item>
<itemx spaces=" "><itemformat command="asis">sixx</itemformat></itemx>
</tableterm><tableitem><para>HHHHHH
</para></tableitem></tableentry></table>
</chapter>
';


$result_converted{'docbook'}->{'item_index_transformation'} = '<chapter label="1" id="chap">
<title>Chapter</title>

<variablelist><varlistentry><term><indexterm role="cp"><primary>After1</primary></indexterm>
<indexterm role="cp"><primary>After2</primary></indexterm>
<indexterm role="cp"><primary>Before1</primary></indexterm>
one
</term><term>onex
</term><term>oney
</term><listitem><para>AAA
</para></listitem></varlistentry><varlistentry><term>two
</term><listitem><para>BBB
</para></listitem></varlistentry></variablelist>
<variablelist><varlistentry><term><indexterm role="cp"><primary>after1</primary></indexterm>
<indexterm role="cp"><primary>after2</primary></indexterm>
three
</term><term>threex
</term><term>zzzz
</term><listitem><para>CCCC
</para></listitem></varlistentry><varlistentry><term>zzzz2
</term><listitem><para>DDDDD
</para></listitem></varlistentry></variablelist>
<variablelist><varlistentry><term><indexterm role="cp"><primary>before1</primary></indexterm>
<indexterm role="cp"><primary>before2</primary></indexterm>
four
</term><term>fourx
</term><listitem><para>EEEE
</para></listitem></varlistentry><varlistentry><term>foour
</term><listitem><para>FFFFf
</para></listitem></varlistentry></variablelist>
<variablelist><varlistentry><term>five
</term><listitem><para>GGGG
</para></listitem></varlistentry><varlistentry><term><indexterm role="cp"><primary>after6</primary></indexterm>
<indexterm role="cp"><primary>after7</primary></indexterm>
six
</term><term>sixx
</term><listitem><para>HHHHHH
</para></listitem></varlistentry></variablelist></chapter>
';

1;
