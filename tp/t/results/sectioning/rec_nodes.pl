use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'rec_nodes'} = {
  'contents' => [
    {
      'parent' => {},
      'type' => 'before_node_section'
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'Top'
            }
          ],
          'extra' => {
            'spaces_after_argument' => '
'
          },
          'parent' => {},
          'type' => 'line_arg'
        }
      ],
      'cmdname' => 'node',
      'contents' => [
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'Top node
'
            }
          ],
          'parent' => {},
          'type' => 'paragraph'
        },
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'args' => [
            {
              'extra' => {
                'spaces_after_argument' => '
'
              },
              'parent' => {},
              'type' => 'block_line_arg'
            }
          ],
          'cmdname' => 'menu',
          'contents' => [
            {
              'args' => [
                {
                  'parent' => {},
                  'text' => '* ',
                  'type' => 'menu_entry_leading_text'
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'second node'
                    }
                  ],
                  'parent' => {},
                  'type' => 'menu_entry_node'
                },
                {
                  'parent' => {},
                  'text' => '::',
                  'type' => 'menu_entry_separator'
                },
                {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => '
'
                        }
                      ],
                      'parent' => {},
                      'type' => 'preformatted'
                    }
                  ],
                  'parent' => {},
                  'type' => 'menu_entry_description'
                }
              ],
              'extra' => {
                'menu_entry_description' => {},
                'menu_entry_node' => {
                  'node_content' => [
                    {}
                  ],
                  'normalized' => 'second-node'
                }
              },
              'parent' => {},
              'source_info' => {
                'file_name' => '',
                'line_nr' => 5,
                'macro' => ''
              },
              'type' => 'menu_entry'
            },
            {
              'args' => [
                {
                  'parent' => {},
                  'text' => '* ',
                  'type' => 'menu_entry_leading_text'
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'node following second'
                    }
                  ],
                  'parent' => {},
                  'type' => 'menu_entry_node'
                },
                {
                  'parent' => {},
                  'text' => '::',
                  'type' => 'menu_entry_separator'
                },
                {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => '
'
                        }
                      ],
                      'parent' => {},
                      'type' => 'preformatted'
                    }
                  ],
                  'parent' => {},
                  'type' => 'menu_entry_description'
                }
              ],
              'extra' => {
                'menu_entry_description' => {},
                'menu_entry_node' => {
                  'node_content' => [
                    {}
                  ],
                  'normalized' => 'node-following-second'
                }
              },
              'parent' => {},
              'source_info' => {
                'file_name' => '',
                'line_nr' => 6,
                'macro' => ''
              },
              'type' => 'menu_entry'
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'menu'
                    }
                  ],
                  'extra' => {
                    'spaces_after_argument' => '
'
                  },
                  'parent' => {},
                  'type' => 'line_arg'
                }
              ],
              'cmdname' => 'end',
              'extra' => {
                'spaces_before_argument' => ' ',
                'text_arg' => 'menu'
              },
              'parent' => {},
              'source_info' => {
                'file_name' => '',
                'line_nr' => 7,
                'macro' => ''
              }
            }
          ],
          'parent' => {},
          'source_info' => {
            'file_name' => '',
            'line_nr' => 4,
            'macro' => ''
          }
        },
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line'
        }
      ],
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
        'normalized' => 'Top',
        'spaces_before_argument' => ' '
      },
      'parent' => {},
      'source_info' => {
        'file_name' => '',
        'line_nr' => 1,
        'macro' => ''
      }
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'second node'
            }
          ],
          'parent' => {},
          'type' => 'line_arg'
        },
        {
          'parent' => {},
          'type' => 'line_arg'
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'Top'
            }
          ],
          'parent' => {},
          'type' => 'line_arg'
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'Top'
            }
          ],
          'extra' => {
            'spaces_after_argument' => '
'
          },
          'parent' => {},
          'type' => 'line_arg'
        }
      ],
      'cmdname' => 'node',
      'contents' => [
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'args' => [
            {
              'extra' => {
                'spaces_after_argument' => '
'
              },
              'parent' => {},
              'type' => 'block_line_arg'
            }
          ],
          'cmdname' => 'menu',
          'contents' => [
            {
              'args' => [
                {
                  'parent' => {},
                  'text' => '* ',
                  'type' => 'menu_entry_leading_text'
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'other node'
                    }
                  ],
                  'parent' => {},
                  'type' => 'menu_entry_node'
                },
                {
                  'parent' => {},
                  'text' => '::',
                  'type' => 'menu_entry_separator'
                },
                {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => '
'
                        }
                      ],
                      'parent' => {},
                      'type' => 'preformatted'
                    }
                  ],
                  'parent' => {},
                  'type' => 'menu_entry_description'
                }
              ],
              'extra' => {
                'menu_entry_description' => {},
                'menu_entry_node' => {
                  'node_content' => [
                    {}
                  ],
                  'normalized' => 'other-node'
                }
              },
              'parent' => {},
              'source_info' => {
                'file_name' => '',
                'line_nr' => 12,
                'macro' => ''
              },
              'type' => 'menu_entry'
            },
            {
              'args' => [
                {
                  'parent' => {},
                  'text' => '* ',
                  'type' => 'menu_entry_leading_text'
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'second node'
                    }
                  ],
                  'parent' => {},
                  'type' => 'menu_entry_node'
                },
                {
                  'parent' => {},
                  'text' => '::',
                  'type' => 'menu_entry_separator'
                },
                {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => '
'
                        }
                      ],
                      'parent' => {},
                      'type' => 'preformatted'
                    }
                  ],
                  'parent' => {},
                  'type' => 'menu_entry_description'
                }
              ],
              'extra' => {
                'menu_entry_description' => {},
                'menu_entry_node' => {
                  'node_content' => [
                    {}
                  ],
                  'normalized' => 'second-node'
                }
              },
              'parent' => {},
              'source_info' => {
                'file_name' => '',
                'line_nr' => 13,
                'macro' => ''
              },
              'type' => 'menu_entry'
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'menu'
                    }
                  ],
                  'extra' => {
                    'spaces_after_argument' => '
'
                  },
                  'parent' => {},
                  'type' => 'line_arg'
                }
              ],
              'cmdname' => 'end',
              'extra' => {
                'spaces_before_argument' => ' ',
                'text_arg' => 'menu'
              },
              'parent' => {},
              'source_info' => {
                'file_name' => '',
                'line_nr' => 14,
                'macro' => ''
              }
            }
          ],
          'parent' => {},
          'source_info' => {
            'file_name' => '',
            'line_nr' => 11,
            'macro' => ''
          }
        },
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line'
        }
      ],
      'extra' => {
        'node_content' => [
          {}
        ],
        'nodes_manuals' => [
          {
            'node_content' => [
              {}
            ],
            'normalized' => 'second-node'
          },
          undef,
          {
            'node_content' => [
              {}
            ],
            'normalized' => 'Top'
          },
          {
            'node_content' => [
              {}
            ],
            'normalized' => 'Top'
          }
        ],
        'normalized' => 'second-node',
        'spaces_before_argument' => ' '
      },
      'parent' => {},
      'source_info' => {
        'file_name' => '',
        'line_nr' => 9,
        'macro' => ''
      }
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'other node'
            }
          ],
          'parent' => {},
          'type' => 'line_arg'
        },
        {
          'parent' => {},
          'type' => 'line_arg'
        },
        {
          'parent' => {},
          'type' => 'line_arg'
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'second node'
            }
          ],
          'extra' => {
            'spaces_after_argument' => '
'
          },
          'parent' => {},
          'type' => 'line_arg'
        }
      ],
      'cmdname' => 'node',
      'contents' => [
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'args' => [
            {
              'extra' => {
                'spaces_after_argument' => ' 
'
              },
              'parent' => {},
              'type' => 'block_line_arg'
            }
          ],
          'cmdname' => 'menu',
          'contents' => [
            {
              'args' => [
                {
                  'parent' => {},
                  'text' => '* ',
                  'type' => 'menu_entry_leading_text'
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'other node'
                    }
                  ],
                  'parent' => {},
                  'type' => 'menu_entry_node'
                },
                {
                  'parent' => {},
                  'text' => '::',
                  'type' => 'menu_entry_separator'
                },
                {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => '
'
                        }
                      ],
                      'parent' => {},
                      'type' => 'preformatted'
                    }
                  ],
                  'parent' => {},
                  'type' => 'menu_entry_description'
                }
              ],
              'extra' => {
                'menu_entry_description' => {},
                'menu_entry_node' => {
                  'node_content' => [
                    {}
                  ],
                  'normalized' => 'other-node'
                }
              },
              'parent' => {},
              'source_info' => {
                'file_name' => '',
                'line_nr' => 19,
                'macro' => ''
              },
              'type' => 'menu_entry'
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'menu'
                    }
                  ],
                  'extra' => {
                    'spaces_after_argument' => '
'
                  },
                  'parent' => {},
                  'type' => 'line_arg'
                }
              ],
              'cmdname' => 'end',
              'extra' => {
                'spaces_before_argument' => ' ',
                'text_arg' => 'menu'
              },
              'parent' => {},
              'source_info' => {
                'file_name' => '',
                'line_nr' => 20,
                'macro' => ''
              }
            }
          ],
          'parent' => {},
          'source_info' => {
            'file_name' => '',
            'line_nr' => 18,
            'macro' => ''
          }
        },
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line'
        }
      ],
      'extra' => {
        'node_content' => [
          {}
        ],
        'nodes_manuals' => [
          {
            'node_content' => [
              {}
            ],
            'normalized' => 'other-node'
          },
          undef,
          undef,
          {
            'node_content' => [
              {}
            ],
            'normalized' => 'second-node'
          }
        ],
        'normalized' => 'other-node',
        'spaces_before_argument' => ' '
      },
      'parent' => {},
      'source_info' => {
        'file_name' => '',
        'line_nr' => 16,
        'macro' => ''
      }
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'node up node following second'
            }
          ],
          'parent' => {},
          'type' => 'line_arg'
        },
        {
          'parent' => {},
          'type' => 'line_arg'
        },
        {
          'parent' => {},
          'type' => 'line_arg'
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'node following second'
            }
          ],
          'extra' => {
            'spaces_after_argument' => '
'
          },
          'parent' => {},
          'type' => 'line_arg'
        }
      ],
      'cmdname' => 'node',
      'contents' => [
        {
          'args' => [
            {
              'extra' => {
                'spaces_after_argument' => '
'
              },
              'parent' => {},
              'type' => 'block_line_arg'
            }
          ],
          'cmdname' => 'menu',
          'contents' => [
            {
              'args' => [
                {
                  'parent' => {},
                  'text' => '* ',
                  'type' => 'menu_entry_leading_text'
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'node following second'
                    }
                  ],
                  'parent' => {},
                  'type' => 'menu_entry_node'
                },
                {
                  'parent' => {},
                  'text' => '::',
                  'type' => 'menu_entry_separator'
                },
                {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => '
'
                        }
                      ],
                      'parent' => {},
                      'type' => 'preformatted'
                    }
                  ],
                  'parent' => {},
                  'type' => 'menu_entry_description'
                }
              ],
              'extra' => {
                'menu_entry_description' => {},
                'menu_entry_node' => {
                  'node_content' => [
                    {}
                  ],
                  'normalized' => 'node-following-second'
                }
              },
              'parent' => {},
              'source_info' => {
                'file_name' => '',
                'line_nr' => 24,
                'macro' => ''
              },
              'type' => 'menu_entry'
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'menu'
                    }
                  ],
                  'extra' => {
                    'spaces_after_argument' => '
'
                  },
                  'parent' => {},
                  'type' => 'line_arg'
                }
              ],
              'cmdname' => 'end',
              'extra' => {
                'spaces_before_argument' => ' ',
                'text_arg' => 'menu'
              },
              'parent' => {},
              'source_info' => {
                'file_name' => '',
                'line_nr' => 25,
                'macro' => ''
              }
            }
          ],
          'parent' => {},
          'source_info' => {
            'file_name' => '',
            'line_nr' => 23,
            'macro' => ''
          }
        },
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'in node up node following second
'
            }
          ],
          'parent' => {},
          'type' => 'paragraph'
        },
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line'
        }
      ],
      'extra' => {
        'node_content' => [
          {}
        ],
        'nodes_manuals' => [
          {
            'node_content' => [
              {}
            ],
            'normalized' => 'node-up-node-following-second'
          },
          undef,
          undef,
          {
            'node_content' => [
              {}
            ],
            'normalized' => 'node-following-second'
          }
        ],
        'normalized' => 'node-up-node-following-second',
        'spaces_before_argument' => ' '
      },
      'parent' => {},
      'source_info' => {
        'file_name' => '',
        'line_nr' => 22,
        'macro' => ''
      }
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'node following second'
            }
          ],
          'parent' => {},
          'type' => 'line_arg'
        },
        {
          'parent' => {},
          'type' => 'line_arg'
        },
        {
          'parent' => {},
          'type' => 'line_arg'
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'node up node following second'
            }
          ],
          'extra' => {
            'spaces_after_argument' => '
'
          },
          'parent' => {},
          'type' => 'line_arg'
        }
      ],
      'cmdname' => 'node',
      'contents' => [
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'in node following second
'
            }
          ],
          'parent' => {},
          'type' => 'paragraph'
        },
        {
          'args' => [
            {
              'extra' => {
                'spaces_after_argument' => '
'
              },
              'parent' => {},
              'type' => 'block_line_arg'
            }
          ],
          'cmdname' => 'menu',
          'contents' => [
            {
              'args' => [
                {
                  'parent' => {},
                  'text' => '* ',
                  'type' => 'menu_entry_leading_text'
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'node up node following second'
                    }
                  ],
                  'parent' => {},
                  'type' => 'menu_entry_node'
                },
                {
                  'parent' => {},
                  'text' => '::',
                  'type' => 'menu_entry_separator'
                },
                {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => '
'
                        }
                      ],
                      'parent' => {},
                      'type' => 'preformatted'
                    }
                  ],
                  'parent' => {},
                  'type' => 'menu_entry_description'
                }
              ],
              'extra' => {
                'menu_entry_description' => {},
                'menu_entry_node' => {
                  'node_content' => [
                    {}
                  ],
                  'normalized' => 'node-up-node-following-second'
                }
              },
              'parent' => {},
              'source_info' => {
                'file_name' => '',
                'line_nr' => 33,
                'macro' => ''
              },
              'type' => 'menu_entry'
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'menu'
                    }
                  ],
                  'extra' => {
                    'spaces_after_argument' => '
'
                  },
                  'parent' => {},
                  'type' => 'line_arg'
                }
              ],
              'cmdname' => 'end',
              'extra' => {
                'spaces_before_argument' => ' ',
                'text_arg' => 'menu'
              },
              'parent' => {},
              'source_info' => {
                'file_name' => '',
                'line_nr' => 34,
                'macro' => ''
              }
            }
          ],
          'parent' => {},
          'source_info' => {
            'file_name' => '',
            'line_nr' => 32,
            'macro' => ''
          }
        }
      ],
      'extra' => {
        'node_content' => [
          {}
        ],
        'nodes_manuals' => [
          {
            'node_content' => [
              {}
            ],
            'normalized' => 'node-following-second'
          },
          undef,
          undef,
          {
            'node_content' => [
              {}
            ],
            'normalized' => 'node-up-node-following-second'
          }
        ],
        'normalized' => 'node-following-second',
        'spaces_before_argument' => ' '
      },
      'parent' => {},
      'source_info' => {
        'file_name' => '',
        'line_nr' => 29,
        'macro' => ''
      }
    }
  ],
  'type' => 'document_root'
};
$result_trees{'rec_nodes'}{'contents'}[0]{'parent'} = $result_trees{'rec_nodes'};
$result_trees{'rec_nodes'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[1]{'args'}[0];
$result_trees{'rec_nodes'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[1];
$result_trees{'rec_nodes'}{'contents'}[1]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[1]{'contents'}[0];
$result_trees{'rec_nodes'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[1];
$result_trees{'rec_nodes'}{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[1];
$result_trees{'rec_nodes'}{'contents'}[1]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[1]{'contents'}[2];
$result_trees{'rec_nodes'}{'contents'}[1]{'contents'}[2]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[1]{'contents'}[2]{'contents'}[0];
$result_trees{'rec_nodes'}{'contents'}[1]{'contents'}[2]{'contents'}[0]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[1]{'contents'}[2]{'contents'}[0]{'args'}[1];
$result_trees{'rec_nodes'}{'contents'}[1]{'contents'}[2]{'contents'}[0]{'args'}[1]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[1]{'contents'}[2]{'contents'}[0];
$result_trees{'rec_nodes'}{'contents'}[1]{'contents'}[2]{'contents'}[0]{'args'}[2]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[1]{'contents'}[2]{'contents'}[0];
$result_trees{'rec_nodes'}{'contents'}[1]{'contents'}[2]{'contents'}[0]{'args'}[3]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[1]{'contents'}[2]{'contents'}[0]{'args'}[3]{'contents'}[0];
$result_trees{'rec_nodes'}{'contents'}[1]{'contents'}[2]{'contents'}[0]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[1]{'contents'}[2]{'contents'}[0]{'args'}[3];
$result_trees{'rec_nodes'}{'contents'}[1]{'contents'}[2]{'contents'}[0]{'args'}[3]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[1]{'contents'}[2]{'contents'}[0];
$result_trees{'rec_nodes'}{'contents'}[1]{'contents'}[2]{'contents'}[0]{'extra'}{'menu_entry_description'} = $result_trees{'rec_nodes'}{'contents'}[1]{'contents'}[2]{'contents'}[0]{'args'}[3];
$result_trees{'rec_nodes'}{'contents'}[1]{'contents'}[2]{'contents'}[0]{'extra'}{'menu_entry_node'}{'node_content'}[0] = $result_trees{'rec_nodes'}{'contents'}[1]{'contents'}[2]{'contents'}[0]{'args'}[1]{'contents'}[0];
$result_trees{'rec_nodes'}{'contents'}[1]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[1]{'contents'}[2];
$result_trees{'rec_nodes'}{'contents'}[1]{'contents'}[2]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[1]{'contents'}[2]{'contents'}[1];
$result_trees{'rec_nodes'}{'contents'}[1]{'contents'}[2]{'contents'}[1]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[1]{'contents'}[2]{'contents'}[1]{'args'}[1];
$result_trees{'rec_nodes'}{'contents'}[1]{'contents'}[2]{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[1]{'contents'}[2]{'contents'}[1];
$result_trees{'rec_nodes'}{'contents'}[1]{'contents'}[2]{'contents'}[1]{'args'}[2]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[1]{'contents'}[2]{'contents'}[1];
$result_trees{'rec_nodes'}{'contents'}[1]{'contents'}[2]{'contents'}[1]{'args'}[3]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[1]{'contents'}[2]{'contents'}[1]{'args'}[3]{'contents'}[0];
$result_trees{'rec_nodes'}{'contents'}[1]{'contents'}[2]{'contents'}[1]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[1]{'contents'}[2]{'contents'}[1]{'args'}[3];
$result_trees{'rec_nodes'}{'contents'}[1]{'contents'}[2]{'contents'}[1]{'args'}[3]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[1]{'contents'}[2]{'contents'}[1];
$result_trees{'rec_nodes'}{'contents'}[1]{'contents'}[2]{'contents'}[1]{'extra'}{'menu_entry_description'} = $result_trees{'rec_nodes'}{'contents'}[1]{'contents'}[2]{'contents'}[1]{'args'}[3];
$result_trees{'rec_nodes'}{'contents'}[1]{'contents'}[2]{'contents'}[1]{'extra'}{'menu_entry_node'}{'node_content'}[0] = $result_trees{'rec_nodes'}{'contents'}[1]{'contents'}[2]{'contents'}[1]{'args'}[1]{'contents'}[0];
$result_trees{'rec_nodes'}{'contents'}[1]{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[1]{'contents'}[2];
$result_trees{'rec_nodes'}{'contents'}[1]{'contents'}[2]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[1]{'contents'}[2]{'contents'}[2]{'args'}[0];
$result_trees{'rec_nodes'}{'contents'}[1]{'contents'}[2]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[1]{'contents'}[2]{'contents'}[2];
$result_trees{'rec_nodes'}{'contents'}[1]{'contents'}[2]{'contents'}[2]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[1]{'contents'}[2];
$result_trees{'rec_nodes'}{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[1];
$result_trees{'rec_nodes'}{'contents'}[1]{'contents'}[3]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[1];
$result_trees{'rec_nodes'}{'contents'}[1]{'extra'}{'node_content'}[0] = $result_trees{'rec_nodes'}{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'rec_nodes'}{'contents'}[1]{'extra'}{'nodes_manuals'}[0]{'node_content'}[0] = $result_trees{'rec_nodes'}{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'rec_nodes'}{'contents'}[1]{'parent'} = $result_trees{'rec_nodes'};
$result_trees{'rec_nodes'}{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[2]{'args'}[0];
$result_trees{'rec_nodes'}{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[2];
$result_trees{'rec_nodes'}{'contents'}[2]{'args'}[1]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[2];
$result_trees{'rec_nodes'}{'contents'}[2]{'args'}[2]{'contents'}[0]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[2]{'args'}[2];
$result_trees{'rec_nodes'}{'contents'}[2]{'args'}[2]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[2];
$result_trees{'rec_nodes'}{'contents'}[2]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[2]{'args'}[3];
$result_trees{'rec_nodes'}{'contents'}[2]{'args'}[3]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[2];
$result_trees{'rec_nodes'}{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[2];
$result_trees{'rec_nodes'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[2]{'contents'}[1];
$result_trees{'rec_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[0];
$result_trees{'rec_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[0]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[0]{'args'}[1];
$result_trees{'rec_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[0]{'args'}[1]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[0];
$result_trees{'rec_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[0]{'args'}[2]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[0];
$result_trees{'rec_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[0]{'args'}[3]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[0]{'args'}[3]{'contents'}[0];
$result_trees{'rec_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[0]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[0]{'args'}[3];
$result_trees{'rec_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[0]{'args'}[3]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[0];
$result_trees{'rec_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_description'} = $result_trees{'rec_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[0]{'args'}[3];
$result_trees{'rec_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_node'}{'node_content'}[0] = $result_trees{'rec_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[0]{'args'}[1]{'contents'}[0];
$result_trees{'rec_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[2]{'contents'}[1];
$result_trees{'rec_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1];
$result_trees{'rec_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[1];
$result_trees{'rec_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1];
$result_trees{'rec_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[2]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1];
$result_trees{'rec_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[3]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[3]{'contents'}[0];
$result_trees{'rec_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[3];
$result_trees{'rec_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[3]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1];
$result_trees{'rec_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'extra'}{'menu_entry_description'} = $result_trees{'rec_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[3];
$result_trees{'rec_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'extra'}{'menu_entry_node'}{'node_content'}[0] = $result_trees{'rec_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[0];
$result_trees{'rec_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[2]{'contents'}[1];
$result_trees{'rec_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[2]{'args'}[0];
$result_trees{'rec_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[2];
$result_trees{'rec_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[2]{'contents'}[1];
$result_trees{'rec_nodes'}{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[2];
$result_trees{'rec_nodes'}{'contents'}[2]{'contents'}[2]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[2];
$result_trees{'rec_nodes'}{'contents'}[2]{'extra'}{'node_content'}[0] = $result_trees{'rec_nodes'}{'contents'}[2]{'args'}[0]{'contents'}[0];
$result_trees{'rec_nodes'}{'contents'}[2]{'extra'}{'nodes_manuals'}[0]{'node_content'}[0] = $result_trees{'rec_nodes'}{'contents'}[2]{'args'}[0]{'contents'}[0];
$result_trees{'rec_nodes'}{'contents'}[2]{'extra'}{'nodes_manuals'}[2]{'node_content'}[0] = $result_trees{'rec_nodes'}{'contents'}[2]{'args'}[2]{'contents'}[0];
$result_trees{'rec_nodes'}{'contents'}[2]{'extra'}{'nodes_manuals'}[3]{'node_content'}[0] = $result_trees{'rec_nodes'}{'contents'}[2]{'args'}[3]{'contents'}[0];
$result_trees{'rec_nodes'}{'contents'}[2]{'parent'} = $result_trees{'rec_nodes'};
$result_trees{'rec_nodes'}{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[3]{'args'}[0];
$result_trees{'rec_nodes'}{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[3];
$result_trees{'rec_nodes'}{'contents'}[3]{'args'}[1]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[3];
$result_trees{'rec_nodes'}{'contents'}[3]{'args'}[2]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[3];
$result_trees{'rec_nodes'}{'contents'}[3]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[3]{'args'}[3];
$result_trees{'rec_nodes'}{'contents'}[3]{'args'}[3]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[3];
$result_trees{'rec_nodes'}{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[3];
$result_trees{'rec_nodes'}{'contents'}[3]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[3]{'contents'}[1];
$result_trees{'rec_nodes'}{'contents'}[3]{'contents'}[1]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[3]{'contents'}[1]{'contents'}[0];
$result_trees{'rec_nodes'}{'contents'}[3]{'contents'}[1]{'contents'}[0]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[3]{'contents'}[1]{'contents'}[0]{'args'}[1];
$result_trees{'rec_nodes'}{'contents'}[3]{'contents'}[1]{'contents'}[0]{'args'}[1]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[3]{'contents'}[1]{'contents'}[0];
$result_trees{'rec_nodes'}{'contents'}[3]{'contents'}[1]{'contents'}[0]{'args'}[2]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[3]{'contents'}[1]{'contents'}[0];
$result_trees{'rec_nodes'}{'contents'}[3]{'contents'}[1]{'contents'}[0]{'args'}[3]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[3]{'contents'}[1]{'contents'}[0]{'args'}[3]{'contents'}[0];
$result_trees{'rec_nodes'}{'contents'}[3]{'contents'}[1]{'contents'}[0]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[3]{'contents'}[1]{'contents'}[0]{'args'}[3];
$result_trees{'rec_nodes'}{'contents'}[3]{'contents'}[1]{'contents'}[0]{'args'}[3]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[3]{'contents'}[1]{'contents'}[0];
$result_trees{'rec_nodes'}{'contents'}[3]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_description'} = $result_trees{'rec_nodes'}{'contents'}[3]{'contents'}[1]{'contents'}[0]{'args'}[3];
$result_trees{'rec_nodes'}{'contents'}[3]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_node'}{'node_content'}[0] = $result_trees{'rec_nodes'}{'contents'}[3]{'contents'}[1]{'contents'}[0]{'args'}[1]{'contents'}[0];
$result_trees{'rec_nodes'}{'contents'}[3]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[3]{'contents'}[1];
$result_trees{'rec_nodes'}{'contents'}[3]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[3]{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'rec_nodes'}{'contents'}[3]{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[3]{'contents'}[1]{'contents'}[1];
$result_trees{'rec_nodes'}{'contents'}[3]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[3]{'contents'}[1];
$result_trees{'rec_nodes'}{'contents'}[3]{'contents'}[1]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[3];
$result_trees{'rec_nodes'}{'contents'}[3]{'contents'}[2]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[3];
$result_trees{'rec_nodes'}{'contents'}[3]{'extra'}{'node_content'}[0] = $result_trees{'rec_nodes'}{'contents'}[3]{'args'}[0]{'contents'}[0];
$result_trees{'rec_nodes'}{'contents'}[3]{'extra'}{'nodes_manuals'}[0]{'node_content'}[0] = $result_trees{'rec_nodes'}{'contents'}[3]{'args'}[0]{'contents'}[0];
$result_trees{'rec_nodes'}{'contents'}[3]{'extra'}{'nodes_manuals'}[3]{'node_content'}[0] = $result_trees{'rec_nodes'}{'contents'}[3]{'args'}[3]{'contents'}[0];
$result_trees{'rec_nodes'}{'contents'}[3]{'parent'} = $result_trees{'rec_nodes'};
$result_trees{'rec_nodes'}{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[4]{'args'}[0];
$result_trees{'rec_nodes'}{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[4];
$result_trees{'rec_nodes'}{'contents'}[4]{'args'}[1]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[4];
$result_trees{'rec_nodes'}{'contents'}[4]{'args'}[2]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[4];
$result_trees{'rec_nodes'}{'contents'}[4]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[4]{'args'}[3];
$result_trees{'rec_nodes'}{'contents'}[4]{'args'}[3]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[4];
$result_trees{'rec_nodes'}{'contents'}[4]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[4]{'contents'}[0];
$result_trees{'rec_nodes'}{'contents'}[4]{'contents'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[4]{'contents'}[0]{'contents'}[0];
$result_trees{'rec_nodes'}{'contents'}[4]{'contents'}[0]{'contents'}[0]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[4]{'contents'}[0]{'contents'}[0]{'args'}[1];
$result_trees{'rec_nodes'}{'contents'}[4]{'contents'}[0]{'contents'}[0]{'args'}[1]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[4]{'contents'}[0]{'contents'}[0];
$result_trees{'rec_nodes'}{'contents'}[4]{'contents'}[0]{'contents'}[0]{'args'}[2]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[4]{'contents'}[0]{'contents'}[0];
$result_trees{'rec_nodes'}{'contents'}[4]{'contents'}[0]{'contents'}[0]{'args'}[3]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[4]{'contents'}[0]{'contents'}[0]{'args'}[3]{'contents'}[0];
$result_trees{'rec_nodes'}{'contents'}[4]{'contents'}[0]{'contents'}[0]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[4]{'contents'}[0]{'contents'}[0]{'args'}[3];
$result_trees{'rec_nodes'}{'contents'}[4]{'contents'}[0]{'contents'}[0]{'args'}[3]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[4]{'contents'}[0]{'contents'}[0];
$result_trees{'rec_nodes'}{'contents'}[4]{'contents'}[0]{'contents'}[0]{'extra'}{'menu_entry_description'} = $result_trees{'rec_nodes'}{'contents'}[4]{'contents'}[0]{'contents'}[0]{'args'}[3];
$result_trees{'rec_nodes'}{'contents'}[4]{'contents'}[0]{'contents'}[0]{'extra'}{'menu_entry_node'}{'node_content'}[0] = $result_trees{'rec_nodes'}{'contents'}[4]{'contents'}[0]{'contents'}[0]{'args'}[1]{'contents'}[0];
$result_trees{'rec_nodes'}{'contents'}[4]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[4]{'contents'}[0];
$result_trees{'rec_nodes'}{'contents'}[4]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[4]{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'rec_nodes'}{'contents'}[4]{'contents'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[4]{'contents'}[0]{'contents'}[1];
$result_trees{'rec_nodes'}{'contents'}[4]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[4]{'contents'}[0];
$result_trees{'rec_nodes'}{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[4];
$result_trees{'rec_nodes'}{'contents'}[4]{'contents'}[1]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[4];
$result_trees{'rec_nodes'}{'contents'}[4]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[4]{'contents'}[2];
$result_trees{'rec_nodes'}{'contents'}[4]{'contents'}[2]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[4];
$result_trees{'rec_nodes'}{'contents'}[4]{'contents'}[3]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[4];
$result_trees{'rec_nodes'}{'contents'}[4]{'extra'}{'node_content'}[0] = $result_trees{'rec_nodes'}{'contents'}[4]{'args'}[0]{'contents'}[0];
$result_trees{'rec_nodes'}{'contents'}[4]{'extra'}{'nodes_manuals'}[0]{'node_content'}[0] = $result_trees{'rec_nodes'}{'contents'}[4]{'args'}[0]{'contents'}[0];
$result_trees{'rec_nodes'}{'contents'}[4]{'extra'}{'nodes_manuals'}[3]{'node_content'}[0] = $result_trees{'rec_nodes'}{'contents'}[4]{'args'}[3]{'contents'}[0];
$result_trees{'rec_nodes'}{'contents'}[4]{'parent'} = $result_trees{'rec_nodes'};
$result_trees{'rec_nodes'}{'contents'}[5]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[5]{'args'}[0];
$result_trees{'rec_nodes'}{'contents'}[5]{'args'}[0]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[5];
$result_trees{'rec_nodes'}{'contents'}[5]{'args'}[1]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[5];
$result_trees{'rec_nodes'}{'contents'}[5]{'args'}[2]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[5];
$result_trees{'rec_nodes'}{'contents'}[5]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[5]{'args'}[3];
$result_trees{'rec_nodes'}{'contents'}[5]{'args'}[3]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[5];
$result_trees{'rec_nodes'}{'contents'}[5]{'contents'}[0]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[5];
$result_trees{'rec_nodes'}{'contents'}[5]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[5]{'contents'}[1];
$result_trees{'rec_nodes'}{'contents'}[5]{'contents'}[1]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[5];
$result_trees{'rec_nodes'}{'contents'}[5]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[5]{'contents'}[2];
$result_trees{'rec_nodes'}{'contents'}[5]{'contents'}[2]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[5]{'contents'}[2]{'contents'}[0];
$result_trees{'rec_nodes'}{'contents'}[5]{'contents'}[2]{'contents'}[0]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[5]{'contents'}[2]{'contents'}[0]{'args'}[1];
$result_trees{'rec_nodes'}{'contents'}[5]{'contents'}[2]{'contents'}[0]{'args'}[1]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[5]{'contents'}[2]{'contents'}[0];
$result_trees{'rec_nodes'}{'contents'}[5]{'contents'}[2]{'contents'}[0]{'args'}[2]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[5]{'contents'}[2]{'contents'}[0];
$result_trees{'rec_nodes'}{'contents'}[5]{'contents'}[2]{'contents'}[0]{'args'}[3]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[5]{'contents'}[2]{'contents'}[0]{'args'}[3]{'contents'}[0];
$result_trees{'rec_nodes'}{'contents'}[5]{'contents'}[2]{'contents'}[0]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[5]{'contents'}[2]{'contents'}[0]{'args'}[3];
$result_trees{'rec_nodes'}{'contents'}[5]{'contents'}[2]{'contents'}[0]{'args'}[3]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[5]{'contents'}[2]{'contents'}[0];
$result_trees{'rec_nodes'}{'contents'}[5]{'contents'}[2]{'contents'}[0]{'extra'}{'menu_entry_description'} = $result_trees{'rec_nodes'}{'contents'}[5]{'contents'}[2]{'contents'}[0]{'args'}[3];
$result_trees{'rec_nodes'}{'contents'}[5]{'contents'}[2]{'contents'}[0]{'extra'}{'menu_entry_node'}{'node_content'}[0] = $result_trees{'rec_nodes'}{'contents'}[5]{'contents'}[2]{'contents'}[0]{'args'}[1]{'contents'}[0];
$result_trees{'rec_nodes'}{'contents'}[5]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[5]{'contents'}[2];
$result_trees{'rec_nodes'}{'contents'}[5]{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[5]{'contents'}[2]{'contents'}[1]{'args'}[0];
$result_trees{'rec_nodes'}{'contents'}[5]{'contents'}[2]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[5]{'contents'}[2]{'contents'}[1];
$result_trees{'rec_nodes'}{'contents'}[5]{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[5]{'contents'}[2];
$result_trees{'rec_nodes'}{'contents'}[5]{'contents'}[2]{'parent'} = $result_trees{'rec_nodes'}{'contents'}[5];
$result_trees{'rec_nodes'}{'contents'}[5]{'extra'}{'node_content'}[0] = $result_trees{'rec_nodes'}{'contents'}[5]{'args'}[0]{'contents'}[0];
$result_trees{'rec_nodes'}{'contents'}[5]{'extra'}{'nodes_manuals'}[0]{'node_content'}[0] = $result_trees{'rec_nodes'}{'contents'}[5]{'args'}[0]{'contents'}[0];
$result_trees{'rec_nodes'}{'contents'}[5]{'extra'}{'nodes_manuals'}[3]{'node_content'}[0] = $result_trees{'rec_nodes'}{'contents'}[5]{'args'}[3]{'contents'}[0];
$result_trees{'rec_nodes'}{'contents'}[5]{'parent'} = $result_trees{'rec_nodes'};

$result_texis{'rec_nodes'} = '@node Top
Top node

@menu
* second node::
* node following second::
@end menu

@node second node,,Top,Top

@menu
* other node::
* second node::
@end menu

@node other node,,,second node

@menu 
* other node::
@end menu

@node node up node following second,,,node following second
@menu
* node following second::
@end menu

in node up node following second

@node node following second,,,node up node following second

in node following second
@menu
* node up node following second::
@end menu
';


$result_texts{'rec_nodes'} = 'Top node

* second node::
* node following second::


* other node::
* second node::


* other node::

* node following second::

in node up node following second


in node following second
* node up node following second::
';

$result_nodes{'rec_nodes'} = {
  'cmdname' => 'node',
  'extra' => {
    'menus' => [
      {
        'cmdname' => 'menu'
      }
    ],
    'normalized' => 'Top'
  },
  'structure' => {
    'menu_child' => {
      'cmdname' => 'node',
      'extra' => {
        'menus' => [
          {
            'cmdname' => 'menu'
          }
        ],
        'normalized' => 'second-node'
      },
      'structure' => {
        'menu_child' => {
          'cmdname' => 'node',
          'extra' => {
            'menus' => [
              {
                'cmdname' => 'menu'
              }
            ],
            'normalized' => 'other-node'
          },
          'structure' => {
            'menu_child' => {},
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
$result_nodes{'rec_nodes'}{'structure'}{'menu_child'}{'structure'}{'menu_child'}{'structure'}{'menu_child'} = $result_nodes{'rec_nodes'}{'structure'}{'menu_child'}{'structure'}{'menu_child'};
$result_nodes{'rec_nodes'}{'structure'}{'menu_child'}{'structure'}{'menu_child'}{'structure'}{'node_up'} = $result_nodes{'rec_nodes'}{'structure'}{'menu_child'};
$result_nodes{'rec_nodes'}{'structure'}{'menu_child'}{'structure'}{'node_prev'} = $result_nodes{'rec_nodes'};
$result_nodes{'rec_nodes'}{'structure'}{'menu_child'}{'structure'}{'node_up'} = $result_nodes{'rec_nodes'};
$result_nodes{'rec_nodes'}{'structure'}{'node_next'} = $result_nodes{'rec_nodes'}{'structure'}{'menu_child'};

$result_menus{'rec_nodes'} = {
  'cmdname' => 'node',
  'extra' => {
    'normalized' => 'Top'
  },
  'structure' => {
    'menu_child' => {
      'cmdname' => 'node',
      'extra' => {
        'normalized' => 'second-node'
      },
      'structure' => {
        'menu_child' => {
          'cmdname' => 'node',
          'extra' => {
            'normalized' => 'other-node'
          },
          'structure' => {
            'menu_child' => {},
            'menu_next' => {},
            'menu_up' => {},
            'menu_up_hash' => {
              'other-node' => 1,
              'second-node' => 1
            }
          }
        },
        'menu_next' => {
          'cmdname' => 'node',
          'extra' => {
            'normalized' => 'node-following-second'
          },
          'structure' => {
            'menu_child' => {
              'cmdname' => 'node',
              'extra' => {
                'normalized' => 'node-up-node-following-second'
              },
              'structure' => {
                'menu_child' => {},
                'menu_up' => {},
                'menu_up_hash' => {
                  'node-following-second' => 1
                }
              }
            },
            'menu_prev' => {},
            'menu_up' => {},
            'menu_up_hash' => {
              'Top' => 1,
              'node-up-node-following-second' => 1
            }
          }
        },
        'menu_prev' => {},
        'menu_up' => {},
        'menu_up_hash' => {
          'Top' => 1,
          'second-node' => 1
        }
      }
    }
  }
};
$result_menus{'rec_nodes'}{'structure'}{'menu_child'}{'structure'}{'menu_child'}{'structure'}{'menu_child'} = $result_menus{'rec_nodes'}{'structure'}{'menu_child'}{'structure'}{'menu_child'};
$result_menus{'rec_nodes'}{'structure'}{'menu_child'}{'structure'}{'menu_child'}{'structure'}{'menu_next'} = $result_menus{'rec_nodes'}{'structure'}{'menu_child'};
$result_menus{'rec_nodes'}{'structure'}{'menu_child'}{'structure'}{'menu_child'}{'structure'}{'menu_up'} = $result_menus{'rec_nodes'}{'structure'}{'menu_child'}{'structure'}{'menu_child'};
$result_menus{'rec_nodes'}{'structure'}{'menu_child'}{'structure'}{'menu_next'}{'structure'}{'menu_child'}{'structure'}{'menu_child'} = $result_menus{'rec_nodes'}{'structure'}{'menu_child'}{'structure'}{'menu_next'};
$result_menus{'rec_nodes'}{'structure'}{'menu_child'}{'structure'}{'menu_next'}{'structure'}{'menu_child'}{'structure'}{'menu_up'} = $result_menus{'rec_nodes'}{'structure'}{'menu_child'}{'structure'}{'menu_next'};
$result_menus{'rec_nodes'}{'structure'}{'menu_child'}{'structure'}{'menu_next'}{'structure'}{'menu_prev'} = $result_menus{'rec_nodes'}{'structure'}{'menu_child'};
$result_menus{'rec_nodes'}{'structure'}{'menu_child'}{'structure'}{'menu_next'}{'structure'}{'menu_up'} = $result_menus{'rec_nodes'}{'structure'}{'menu_child'}{'structure'}{'menu_next'}{'structure'}{'menu_child'};
$result_menus{'rec_nodes'}{'structure'}{'menu_child'}{'structure'}{'menu_prev'} = $result_menus{'rec_nodes'}{'structure'}{'menu_child'}{'structure'}{'menu_child'};
$result_menus{'rec_nodes'}{'structure'}{'menu_child'}{'structure'}{'menu_up'} = $result_menus{'rec_nodes'}{'structure'}{'menu_child'};

$result_errors{'rec_nodes'} = [];


$result_floats{'rec_nodes'} = {};


1;
