use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'more_sections_than_nodes'} = {
  'contents' => [
    {
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
            'spaces_after_argument' => '
'
          },
          'type' => 'line_arg'
        }
      ],
      'cmdname' => 'node',
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
        'normalized' => 'Top'
      },
      'info' => {
        'spaces_before_argument' => ' '
      },
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
              'text' => 'top'
            }
          ],
          'info' => {
            'spaces_after_argument' => '
'
          },
          'type' => 'line_arg'
        }
      ],
      'cmdname' => 'top',
      'contents' => [
        {
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'args' => [
            {
              'info' => {
                'spaces_after_argument' => '
'
              },
              'type' => 'block_line_arg'
            }
          ],
          'cmdname' => 'menu',
          'contents' => [
            {
              'args' => [
                {
                  'text' => '* ',
                  'type' => 'menu_entry_leading_text'
                },
                {
                  'contents' => [
                    {
                      'text' => 'n c2'
                    }
                  ],
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
              'extra' => {
                'menu_entry_description' => {},
                'menu_entry_node' => {
                  'node_content' => [
                    {}
                  ],
                  'normalized' => 'n-c2'
                }
              },
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
                  'text' => '* ',
                  'type' => 'menu_entry_leading_text'
                },
                {
                  'contents' => [
                    {
                      'text' => 'n c3'
                    }
                  ],
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
              'extra' => {
                'menu_entry_description' => {},
                'menu_entry_node' => {
                  'node_content' => [
                    {}
                  ],
                  'normalized' => 'n-c3'
                }
              },
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
                  'text' => '* ',
                  'type' => 'menu_entry_leading_text'
                },
                {
                  'contents' => [
                    {
                      'text' => 'n c3 s1 s2'
                    }
                  ],
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
              'extra' => {
                'menu_entry_description' => {},
                'menu_entry_node' => {
                  'node_content' => [
                    {}
                  ],
                  'normalized' => 'n-c3-s1-s2'
                }
              },
              'source_info' => {
                'file_name' => '',
                'line_nr' => 7,
                'macro' => ''
              },
              'type' => 'menu_entry'
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'text' => 'menu'
                    }
                  ],
                  'info' => {
                    'spaces_after_argument' => '
'
                  },
                  'type' => 'line_arg'
                }
              ],
              'cmdname' => 'end',
              'extra' => {
                'text_arg' => 'menu'
              },
              'info' => {
                'spaces_before_argument' => ' '
              },
              'source_info' => {
                'file_name' => '',
                'line_nr' => 8,
                'macro' => ''
              }
            }
          ],
          'source_info' => {
            'file_name' => '',
            'line_nr' => 4,
            'macro' => ''
          }
        },
        {
          'text' => '
',
          'type' => 'empty_line'
        }
      ],
      'extra' => {},
      'info' => {
        'spaces_before_argument' => ' '
      },
      'source_info' => {
        'file_name' => '',
        'line_nr' => 2,
        'macro' => ''
      }
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'text' => 'c1'
            }
          ],
          'info' => {
            'spaces_after_argument' => '
'
          },
          'type' => 'line_arg'
        }
      ],
      'cmdname' => 'chapter',
      'contents' => [
        {
          'text' => '
',
          'type' => 'empty_line'
        }
      ],
      'info' => {
        'spaces_before_argument' => ' '
      },
      'source_info' => {
        'file_name' => '',
        'line_nr' => 10,
        'macro' => ''
      }
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'text' => 'n c2'
            }
          ],
          'info' => {
            'spaces_after_argument' => '
'
          },
          'type' => 'line_arg'
        }
      ],
      'cmdname' => 'node',
      'extra' => {
        'node_content' => [
          {}
        ],
        'nodes_manuals' => [
          {
            'node_content' => [
              {}
            ],
            'normalized' => 'n-c2'
          }
        ],
        'normalized' => 'n-c2'
      },
      'info' => {
        'spaces_before_argument' => ' '
      },
      'source_info' => {
        'file_name' => '',
        'line_nr' => 12,
        'macro' => ''
      }
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'text' => 'c2'
            }
          ],
          'info' => {
            'spaces_after_argument' => '
'
          },
          'type' => 'line_arg'
        }
      ],
      'cmdname' => 'chapter',
      'contents' => [
        {
          'text' => '
',
          'type' => 'empty_line'
        }
      ],
      'extra' => {},
      'info' => {
        'spaces_before_argument' => ' '
      },
      'source_info' => {
        'file_name' => '',
        'line_nr' => 13,
        'macro' => ''
      }
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'text' => 's1'
            }
          ],
          'info' => {
            'spaces_after_argument' => '
'
          },
          'type' => 'line_arg'
        }
      ],
      'cmdname' => 'section',
      'contents' => [
        {
          'text' => '
',
          'type' => 'empty_line'
        }
      ],
      'info' => {
        'spaces_before_argument' => ' '
      },
      'source_info' => {
        'file_name' => '',
        'line_nr' => 15,
        'macro' => ''
      }
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'text' => 'n c3'
            }
          ],
          'type' => 'line_arg'
        },
        {
          'contents' => [
            {
              'text' => 'n c3 s1 s2'
            }
          ],
          'info' => {
            'spaces_before_argument' => ' '
          },
          'type' => 'line_arg'
        },
        {
          'contents' => [
            {
              'text' => 'n c2'
            }
          ],
          'info' => {
            'spaces_before_argument' => ' '
          },
          'type' => 'line_arg'
        },
        {
          'contents' => [
            {
              'text' => 'Top'
            }
          ],
          'info' => {
            'spaces_after_argument' => '
',
            'spaces_before_argument' => ' '
          },
          'type' => 'line_arg'
        }
      ],
      'cmdname' => 'node',
      'extra' => {
        'node_content' => [
          {}
        ],
        'nodes_manuals' => [
          {
            'node_content' => [
              {}
            ],
            'normalized' => 'n-c3'
          },
          {
            'node_content' => [
              {}
            ],
            'normalized' => 'n-c3-s1-s2'
          },
          {
            'node_content' => [
              {}
            ],
            'normalized' => 'n-c2'
          },
          {
            'node_content' => [
              {}
            ],
            'normalized' => 'Top'
          }
        ],
        'normalized' => 'n-c3'
      },
      'info' => {
        'spaces_before_argument' => ' '
      },
      'source_info' => {
        'file_name' => '',
        'line_nr' => 17,
        'macro' => ''
      }
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'text' => 'c3'
            }
          ],
          'info' => {
            'spaces_after_argument' => '
'
          },
          'type' => 'line_arg'
        }
      ],
      'cmdname' => 'chapter',
      'contents' => [
        {
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'args' => [
            {
              'info' => {
                'spaces_after_argument' => ' 
'
              },
              'type' => 'block_line_arg'
            }
          ],
          'cmdname' => 'menu',
          'contents' => [
            {
              'args' => [
                {
                  'text' => '* ',
                  'type' => 'menu_entry_leading_text'
                },
                {
                  'contents' => [
                    {
                      'text' => 'n c3 s 2'
                    }
                  ],
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
              'extra' => {
                'menu_entry_description' => {},
                'menu_entry_node' => {
                  'node_content' => [
                    {}
                  ],
                  'normalized' => 'n-c3-s-2'
                }
              },
              'source_info' => {
                'file_name' => '',
                'line_nr' => 21,
                'macro' => ''
              },
              'type' => 'menu_entry'
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'text' => 'menu'
                    }
                  ],
                  'info' => {
                    'spaces_after_argument' => '
'
                  },
                  'type' => 'line_arg'
                }
              ],
              'cmdname' => 'end',
              'extra' => {
                'text_arg' => 'menu'
              },
              'info' => {
                'spaces_before_argument' => ' '
              },
              'source_info' => {
                'file_name' => '',
                'line_nr' => 22,
                'macro' => ''
              }
            }
          ],
          'source_info' => {
            'file_name' => '',
            'line_nr' => 20,
            'macro' => ''
          }
        },
        {
          'text' => '
',
          'type' => 'empty_line'
        }
      ],
      'extra' => {},
      'info' => {
        'spaces_before_argument' => ' '
      },
      'source_info' => {
        'file_name' => '',
        'line_nr' => 18,
        'macro' => ''
      }
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'text' => 'C3 s1'
            }
          ],
          'info' => {
            'spaces_after_argument' => '
'
          },
          'type' => 'line_arg'
        }
      ],
      'cmdname' => 'section',
      'contents' => [
        {
          'text' => '
',
          'type' => 'empty_line'
        }
      ],
      'info' => {
        'spaces_before_argument' => ' '
      },
      'source_info' => {
        'file_name' => '',
        'line_nr' => 24,
        'macro' => ''
      }
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'text' => 'n c3 s 2'
            }
          ],
          'info' => {
            'spaces_after_argument' => '
'
          },
          'type' => 'line_arg'
        }
      ],
      'cmdname' => 'node',
      'extra' => {
        'node_content' => [
          {}
        ],
        'nodes_manuals' => [
          {
            'node_content' => [
              {}
            ],
            'normalized' => 'n-c3-s-2'
          }
        ],
        'normalized' => 'n-c3-s-2'
      },
      'info' => {
        'spaces_before_argument' => ' '
      },
      'source_info' => {
        'file_name' => '',
        'line_nr' => 26,
        'macro' => ''
      }
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'text' => 'c3 s2'
            }
          ],
          'info' => {
            'spaces_after_argument' => '
'
          },
          'type' => 'line_arg'
        }
      ],
      'cmdname' => 'section',
      'contents' => [
        {
          'text' => '
',
          'type' => 'empty_line'
        }
      ],
      'extra' => {},
      'info' => {
        'spaces_before_argument' => ' '
      },
      'source_info' => {
        'file_name' => '',
        'line_nr' => 27,
        'macro' => ''
      }
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'text' => 'c3 s3'
            }
          ],
          'info' => {
            'spaces_after_argument' => '
'
          },
          'type' => 'line_arg'
        }
      ],
      'cmdname' => 'section',
      'contents' => [
        {
          'text' => '
',
          'type' => 'empty_line'
        }
      ],
      'info' => {
        'spaces_before_argument' => ' '
      },
      'source_info' => {
        'file_name' => '',
        'line_nr' => 29,
        'macro' => ''
      }
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'text' => 'c4'
            }
          ],
          'info' => {
            'spaces_after_argument' => '
'
          },
          'type' => 'line_arg'
        }
      ],
      'cmdname' => 'chapter',
      'contents' => [
        {
          'text' => '
',
          'type' => 'empty_line'
        }
      ],
      'info' => {
        'spaces_before_argument' => ' '
      },
      'source_info' => {
        'file_name' => '',
        'line_nr' => 31,
        'macro' => ''
      }
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'text' => 'c3 s1'
            }
          ],
          'info' => {
            'spaces_after_argument' => '
'
          },
          'type' => 'line_arg'
        }
      ],
      'cmdname' => 'section',
      'contents' => [
        {
          'text' => '
',
          'type' => 'empty_line'
        }
      ],
      'info' => {
        'spaces_before_argument' => ' '
      },
      'source_info' => {
        'file_name' => '',
        'line_nr' => 33,
        'macro' => ''
      }
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'text' => 'c3 s1 s1'
            }
          ],
          'info' => {
            'spaces_after_argument' => '
'
          },
          'type' => 'line_arg'
        }
      ],
      'cmdname' => 'subsection',
      'contents' => [
        {
          'text' => '
',
          'type' => 'empty_line'
        }
      ],
      'info' => {
        'spaces_before_argument' => ' '
      },
      'source_info' => {
        'file_name' => '',
        'line_nr' => 35,
        'macro' => ''
      }
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'text' => 'n c3 s1 s2'
            }
          ],
          'type' => 'line_arg'
        },
        {
          'type' => 'line_arg'
        },
        {
          'contents' => [
            {
              'text' => 'n c3'
            }
          ],
          'type' => 'line_arg'
        },
        {
          'contents' => [
            {
              'text' => 'Top'
            }
          ],
          'info' => {
            'spaces_after_argument' => '
'
          },
          'type' => 'line_arg'
        }
      ],
      'cmdname' => 'node',
      'extra' => {
        'node_content' => [
          {}
        ],
        'nodes_manuals' => [
          {
            'node_content' => [
              {}
            ],
            'normalized' => 'n-c3-s1-s2'
          },
          undef,
          {
            'node_content' => [
              {}
            ],
            'normalized' => 'n-c3'
          },
          {
            'node_content' => [
              {}
            ],
            'normalized' => 'Top'
          }
        ],
        'normalized' => 'n-c3-s1-s2'
      },
      'info' => {
        'spaces_before_argument' => ' '
      },
      'source_info' => {
        'file_name' => '',
        'line_nr' => 37,
        'macro' => ''
      }
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'text' => 'c3 s1 s2'
            }
          ],
          'info' => {
            'spaces_after_argument' => '
'
          },
          'type' => 'line_arg'
        }
      ],
      'cmdname' => 'subsection',
      'contents' => [
        {
          'text' => '
',
          'type' => 'empty_line'
        }
      ],
      'extra' => {},
      'info' => {
        'spaces_before_argument' => ' '
      },
      'source_info' => {
        'file_name' => '',
        'line_nr' => 38,
        'macro' => ''
      }
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'text' => 'appendix'
            }
          ],
          'info' => {
            'spaces_after_argument' => '
'
          },
          'type' => 'line_arg'
        }
      ],
      'cmdname' => 'appendix',
      'info' => {
        'spaces_before_argument' => ' '
      },
      'source_info' => {
        'file_name' => '',
        'line_nr' => 40,
        'macro' => ''
      }
    }
  ],
  'type' => 'document_root'
};
$result_trees{'more_sections_than_nodes'}{'contents'}[1]{'extra'}{'node_content'}[0] = $result_trees{'more_sections_than_nodes'}{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'more_sections_than_nodes'}{'contents'}[1]{'extra'}{'nodes_manuals'}[0]{'node_content'}[0] = $result_trees{'more_sections_than_nodes'}{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'more_sections_than_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_description'} = $result_trees{'more_sections_than_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[0]{'args'}[3];
$result_trees{'more_sections_than_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_node'}{'node_content'}[0] = $result_trees{'more_sections_than_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[0]{'args'}[1]{'contents'}[0];
$result_trees{'more_sections_than_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'extra'}{'menu_entry_description'} = $result_trees{'more_sections_than_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[3];
$result_trees{'more_sections_than_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'extra'}{'menu_entry_node'}{'node_content'}[0] = $result_trees{'more_sections_than_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[1]{'args'}[1]{'contents'}[0];
$result_trees{'more_sections_than_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[2]{'extra'}{'menu_entry_description'} = $result_trees{'more_sections_than_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[2]{'args'}[3];
$result_trees{'more_sections_than_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[2]{'extra'}{'menu_entry_node'}{'node_content'}[0] = $result_trees{'more_sections_than_nodes'}{'contents'}[2]{'contents'}[1]{'contents'}[2]{'args'}[1]{'contents'}[0];
$result_trees{'more_sections_than_nodes'}{'contents'}[4]{'extra'}{'node_content'}[0] = $result_trees{'more_sections_than_nodes'}{'contents'}[4]{'args'}[0]{'contents'}[0];
$result_trees{'more_sections_than_nodes'}{'contents'}[4]{'extra'}{'nodes_manuals'}[0]{'node_content'}[0] = $result_trees{'more_sections_than_nodes'}{'contents'}[4]{'args'}[0]{'contents'}[0];
$result_trees{'more_sections_than_nodes'}{'contents'}[7]{'extra'}{'node_content'}[0] = $result_trees{'more_sections_than_nodes'}{'contents'}[7]{'args'}[0]{'contents'}[0];
$result_trees{'more_sections_than_nodes'}{'contents'}[7]{'extra'}{'nodes_manuals'}[0]{'node_content'}[0] = $result_trees{'more_sections_than_nodes'}{'contents'}[7]{'args'}[0]{'contents'}[0];
$result_trees{'more_sections_than_nodes'}{'contents'}[7]{'extra'}{'nodes_manuals'}[1]{'node_content'}[0] = $result_trees{'more_sections_than_nodes'}{'contents'}[7]{'args'}[1]{'contents'}[0];
$result_trees{'more_sections_than_nodes'}{'contents'}[7]{'extra'}{'nodes_manuals'}[2]{'node_content'}[0] = $result_trees{'more_sections_than_nodes'}{'contents'}[7]{'args'}[2]{'contents'}[0];
$result_trees{'more_sections_than_nodes'}{'contents'}[7]{'extra'}{'nodes_manuals'}[3]{'node_content'}[0] = $result_trees{'more_sections_than_nodes'}{'contents'}[7]{'args'}[3]{'contents'}[0];
$result_trees{'more_sections_than_nodes'}{'contents'}[8]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_description'} = $result_trees{'more_sections_than_nodes'}{'contents'}[8]{'contents'}[1]{'contents'}[0]{'args'}[3];
$result_trees{'more_sections_than_nodes'}{'contents'}[8]{'contents'}[1]{'contents'}[0]{'extra'}{'menu_entry_node'}{'node_content'}[0] = $result_trees{'more_sections_than_nodes'}{'contents'}[8]{'contents'}[1]{'contents'}[0]{'args'}[1]{'contents'}[0];
$result_trees{'more_sections_than_nodes'}{'contents'}[10]{'extra'}{'node_content'}[0] = $result_trees{'more_sections_than_nodes'}{'contents'}[10]{'args'}[0]{'contents'}[0];
$result_trees{'more_sections_than_nodes'}{'contents'}[10]{'extra'}{'nodes_manuals'}[0]{'node_content'}[0] = $result_trees{'more_sections_than_nodes'}{'contents'}[10]{'args'}[0]{'contents'}[0];
$result_trees{'more_sections_than_nodes'}{'contents'}[16]{'extra'}{'node_content'}[0] = $result_trees{'more_sections_than_nodes'}{'contents'}[16]{'args'}[0]{'contents'}[0];
$result_trees{'more_sections_than_nodes'}{'contents'}[16]{'extra'}{'nodes_manuals'}[0]{'node_content'}[0] = $result_trees{'more_sections_than_nodes'}{'contents'}[16]{'args'}[0]{'contents'}[0];
$result_trees{'more_sections_than_nodes'}{'contents'}[16]{'extra'}{'nodes_manuals'}[2]{'node_content'}[0] = $result_trees{'more_sections_than_nodes'}{'contents'}[16]{'args'}[2]{'contents'}[0];
$result_trees{'more_sections_than_nodes'}{'contents'}[16]{'extra'}{'nodes_manuals'}[3]{'node_content'}[0] = $result_trees{'more_sections_than_nodes'}{'contents'}[16]{'args'}[3]{'contents'}[0];

$result_texis{'more_sections_than_nodes'} = '@node Top
@top top

@menu
* n c2::
* n c3::
* n c3 s1 s2::
@end menu

@chapter c1

@node n c2
@chapter c2

@section s1

@node n c3, n c3 s1 s2, n c2, Top
@chapter c3

@menu 
* n c3 s 2::
@end menu

@section C3 s1

@node n c3 s 2
@section c3 s2

@section c3 s3

@chapter c4

@section c3 s1

@subsection c3 s1 s1

@node n c3 s1 s2,,n c3,Top
@subsection c3 s1 s2

@appendix appendix
';


$result_texts{'more_sections_than_nodes'} = 'top
***

* n c2::
* n c3::
* n c3 s1 s2::

1 c1
****

2 c2
****

2.1 s1
======

3 c3
****

* n c3 s 2::

3.1 C3 s1
=========

3.2 c3 s2
=========

3.3 c3 s3
=========

4 c4
****

4.1 c3 s1
=========

4.1.1 c3 s1 s1
--------------

4.1.2 c3 s1 s2
--------------

Appendix A appendix
*******************
';

$result_sectioning{'more_sections_than_nodes'} = {
  'structure' => {
    'section_childs' => [
      {
        'cmdname' => 'top',
        'extra' => {
          'associated_node' => {
            'cmdname' => 'node',
            'extra' => {
              'normalized' => 'Top'
            },
            'info' => {},
            'structure' => {}
          }
        },
        'info' => {},
        'structure' => {
          'section_childs' => [
            {
              'cmdname' => 'chapter',
              'info' => {},
              'structure' => {
                'section_level' => 1,
                'section_number' => 1,
                'section_up' => {},
                'toplevel_prev' => {},
                'toplevel_up' => {}
              }
            },
            {
              'cmdname' => 'chapter',
              'extra' => {
                'associated_node' => {
                  'cmdname' => 'node',
                  'extra' => {
                    'normalized' => 'n-c2'
                  },
                  'info' => {},
                  'structure' => {}
                }
              },
              'info' => {},
              'structure' => {
                'section_childs' => [
                  {
                    'cmdname' => 'section',
                    'info' => {},
                    'structure' => {
                      'section_level' => 2,
                      'section_number' => '2.1',
                      'section_up' => {}
                    }
                  }
                ],
                'section_level' => 1,
                'section_number' => 2,
                'section_prev' => {},
                'section_up' => {},
                'toplevel_prev' => {},
                'toplevel_up' => {}
              }
            },
            {
              'cmdname' => 'chapter',
              'extra' => {
                'associated_node' => {
                  'cmdname' => 'node',
                  'extra' => {
                    'normalized' => 'n-c3'
                  },
                  'info' => {},
                  'structure' => {}
                }
              },
              'info' => {},
              'structure' => {
                'section_childs' => [
                  {
                    'cmdname' => 'section',
                    'info' => {},
                    'structure' => {
                      'section_level' => 2,
                      'section_number' => '3.1',
                      'section_up' => {}
                    }
                  },
                  {
                    'cmdname' => 'section',
                    'extra' => {
                      'associated_node' => {
                        'cmdname' => 'node',
                        'extra' => {
                          'normalized' => 'n-c3-s-2'
                        },
                        'info' => {},
                        'structure' => {}
                      }
                    },
                    'info' => {},
                    'structure' => {
                      'section_level' => 2,
                      'section_number' => '3.2',
                      'section_prev' => {},
                      'section_up' => {}
                    }
                  },
                  {
                    'cmdname' => 'section',
                    'info' => {},
                    'structure' => {
                      'section_level' => 2,
                      'section_number' => '3.3',
                      'section_prev' => {},
                      'section_up' => {}
                    }
                  }
                ],
                'section_level' => 1,
                'section_number' => 3,
                'section_prev' => {},
                'section_up' => {},
                'toplevel_prev' => {},
                'toplevel_up' => {}
              }
            },
            {
              'cmdname' => 'chapter',
              'info' => {},
              'structure' => {
                'section_childs' => [
                  {
                    'cmdname' => 'section',
                    'info' => {},
                    'structure' => {
                      'section_childs' => [
                        {
                          'cmdname' => 'subsection',
                          'info' => {},
                          'structure' => {
                            'section_level' => 3,
                            'section_number' => '4.1.1',
                            'section_up' => {}
                          }
                        },
                        {
                          'cmdname' => 'subsection',
                          'extra' => {
                            'associated_node' => {
                              'cmdname' => 'node',
                              'extra' => {
                                'normalized' => 'n-c3-s1-s2'
                              },
                              'info' => {},
                              'structure' => {}
                            }
                          },
                          'info' => {},
                          'structure' => {
                            'section_level' => 3,
                            'section_number' => '4.1.2',
                            'section_prev' => {},
                            'section_up' => {}
                          }
                        }
                      ],
                      'section_level' => 2,
                      'section_number' => '4.1',
                      'section_up' => {}
                    }
                  }
                ],
                'section_level' => 1,
                'section_number' => 4,
                'section_prev' => {},
                'section_up' => {},
                'toplevel_prev' => {},
                'toplevel_up' => {}
              }
            },
            {
              'cmdname' => 'appendix',
              'info' => {},
              'structure' => {
                'section_level' => 1,
                'section_number' => 'A',
                'section_prev' => {},
                'section_up' => {},
                'toplevel_prev' => {},
                'toplevel_up' => {}
              }
            }
          ],
          'section_level' => 0,
          'section_up' => {}
        }
      }
    ],
    'section_level' => -1
  }
};
$result_sectioning{'more_sections_than_nodes'}{'structure'}{'section_childs'}[0]{'structure'}{'section_childs'}[0]{'structure'}{'section_up'} = $result_sectioning{'more_sections_than_nodes'}{'structure'}{'section_childs'}[0];
$result_sectioning{'more_sections_than_nodes'}{'structure'}{'section_childs'}[0]{'structure'}{'section_childs'}[0]{'structure'}{'toplevel_prev'} = $result_sectioning{'more_sections_than_nodes'}{'structure'}{'section_childs'}[0];
$result_sectioning{'more_sections_than_nodes'}{'structure'}{'section_childs'}[0]{'structure'}{'section_childs'}[0]{'structure'}{'toplevel_up'} = $result_sectioning{'more_sections_than_nodes'}{'structure'}{'section_childs'}[0];
$result_sectioning{'more_sections_than_nodes'}{'structure'}{'section_childs'}[0]{'structure'}{'section_childs'}[1]{'structure'}{'section_childs'}[0]{'structure'}{'section_up'} = $result_sectioning{'more_sections_than_nodes'}{'structure'}{'section_childs'}[0]{'structure'}{'section_childs'}[1];
$result_sectioning{'more_sections_than_nodes'}{'structure'}{'section_childs'}[0]{'structure'}{'section_childs'}[1]{'structure'}{'section_prev'} = $result_sectioning{'more_sections_than_nodes'}{'structure'}{'section_childs'}[0]{'structure'}{'section_childs'}[0];
$result_sectioning{'more_sections_than_nodes'}{'structure'}{'section_childs'}[0]{'structure'}{'section_childs'}[1]{'structure'}{'section_up'} = $result_sectioning{'more_sections_than_nodes'}{'structure'}{'section_childs'}[0];
$result_sectioning{'more_sections_than_nodes'}{'structure'}{'section_childs'}[0]{'structure'}{'section_childs'}[1]{'structure'}{'toplevel_prev'} = $result_sectioning{'more_sections_than_nodes'}{'structure'}{'section_childs'}[0]{'structure'}{'section_childs'}[0];
$result_sectioning{'more_sections_than_nodes'}{'structure'}{'section_childs'}[0]{'structure'}{'section_childs'}[1]{'structure'}{'toplevel_up'} = $result_sectioning{'more_sections_than_nodes'}{'structure'}{'section_childs'}[0];
$result_sectioning{'more_sections_than_nodes'}{'structure'}{'section_childs'}[0]{'structure'}{'section_childs'}[2]{'structure'}{'section_childs'}[0]{'structure'}{'section_up'} = $result_sectioning{'more_sections_than_nodes'}{'structure'}{'section_childs'}[0]{'structure'}{'section_childs'}[2];
$result_sectioning{'more_sections_than_nodes'}{'structure'}{'section_childs'}[0]{'structure'}{'section_childs'}[2]{'structure'}{'section_childs'}[1]{'structure'}{'section_prev'} = $result_sectioning{'more_sections_than_nodes'}{'structure'}{'section_childs'}[0]{'structure'}{'section_childs'}[2]{'structure'}{'section_childs'}[0];
$result_sectioning{'more_sections_than_nodes'}{'structure'}{'section_childs'}[0]{'structure'}{'section_childs'}[2]{'structure'}{'section_childs'}[1]{'structure'}{'section_up'} = $result_sectioning{'more_sections_than_nodes'}{'structure'}{'section_childs'}[0]{'structure'}{'section_childs'}[2];
$result_sectioning{'more_sections_than_nodes'}{'structure'}{'section_childs'}[0]{'structure'}{'section_childs'}[2]{'structure'}{'section_childs'}[2]{'structure'}{'section_prev'} = $result_sectioning{'more_sections_than_nodes'}{'structure'}{'section_childs'}[0]{'structure'}{'section_childs'}[2]{'structure'}{'section_childs'}[1];
$result_sectioning{'more_sections_than_nodes'}{'structure'}{'section_childs'}[0]{'structure'}{'section_childs'}[2]{'structure'}{'section_childs'}[2]{'structure'}{'section_up'} = $result_sectioning{'more_sections_than_nodes'}{'structure'}{'section_childs'}[0]{'structure'}{'section_childs'}[2];
$result_sectioning{'more_sections_than_nodes'}{'structure'}{'section_childs'}[0]{'structure'}{'section_childs'}[2]{'structure'}{'section_prev'} = $result_sectioning{'more_sections_than_nodes'}{'structure'}{'section_childs'}[0]{'structure'}{'section_childs'}[1];
$result_sectioning{'more_sections_than_nodes'}{'structure'}{'section_childs'}[0]{'structure'}{'section_childs'}[2]{'structure'}{'section_up'} = $result_sectioning{'more_sections_than_nodes'}{'structure'}{'section_childs'}[0];
$result_sectioning{'more_sections_than_nodes'}{'structure'}{'section_childs'}[0]{'structure'}{'section_childs'}[2]{'structure'}{'toplevel_prev'} = $result_sectioning{'more_sections_than_nodes'}{'structure'}{'section_childs'}[0]{'structure'}{'section_childs'}[1];
$result_sectioning{'more_sections_than_nodes'}{'structure'}{'section_childs'}[0]{'structure'}{'section_childs'}[2]{'structure'}{'toplevel_up'} = $result_sectioning{'more_sections_than_nodes'}{'structure'}{'section_childs'}[0];
$result_sectioning{'more_sections_than_nodes'}{'structure'}{'section_childs'}[0]{'structure'}{'section_childs'}[3]{'structure'}{'section_childs'}[0]{'structure'}{'section_childs'}[0]{'structure'}{'section_up'} = $result_sectioning{'more_sections_than_nodes'}{'structure'}{'section_childs'}[0]{'structure'}{'section_childs'}[3]{'structure'}{'section_childs'}[0];
$result_sectioning{'more_sections_than_nodes'}{'structure'}{'section_childs'}[0]{'structure'}{'section_childs'}[3]{'structure'}{'section_childs'}[0]{'structure'}{'section_childs'}[1]{'structure'}{'section_prev'} = $result_sectioning{'more_sections_than_nodes'}{'structure'}{'section_childs'}[0]{'structure'}{'section_childs'}[3]{'structure'}{'section_childs'}[0]{'structure'}{'section_childs'}[0];
$result_sectioning{'more_sections_than_nodes'}{'structure'}{'section_childs'}[0]{'structure'}{'section_childs'}[3]{'structure'}{'section_childs'}[0]{'structure'}{'section_childs'}[1]{'structure'}{'section_up'} = $result_sectioning{'more_sections_than_nodes'}{'structure'}{'section_childs'}[0]{'structure'}{'section_childs'}[3]{'structure'}{'section_childs'}[0];
$result_sectioning{'more_sections_than_nodes'}{'structure'}{'section_childs'}[0]{'structure'}{'section_childs'}[3]{'structure'}{'section_childs'}[0]{'structure'}{'section_up'} = $result_sectioning{'more_sections_than_nodes'}{'structure'}{'section_childs'}[0]{'structure'}{'section_childs'}[3];
$result_sectioning{'more_sections_than_nodes'}{'structure'}{'section_childs'}[0]{'structure'}{'section_childs'}[3]{'structure'}{'section_prev'} = $result_sectioning{'more_sections_than_nodes'}{'structure'}{'section_childs'}[0]{'structure'}{'section_childs'}[2];
$result_sectioning{'more_sections_than_nodes'}{'structure'}{'section_childs'}[0]{'structure'}{'section_childs'}[3]{'structure'}{'section_up'} = $result_sectioning{'more_sections_than_nodes'}{'structure'}{'section_childs'}[0];
$result_sectioning{'more_sections_than_nodes'}{'structure'}{'section_childs'}[0]{'structure'}{'section_childs'}[3]{'structure'}{'toplevel_prev'} = $result_sectioning{'more_sections_than_nodes'}{'structure'}{'section_childs'}[0]{'structure'}{'section_childs'}[2];
$result_sectioning{'more_sections_than_nodes'}{'structure'}{'section_childs'}[0]{'structure'}{'section_childs'}[3]{'structure'}{'toplevel_up'} = $result_sectioning{'more_sections_than_nodes'}{'structure'}{'section_childs'}[0];
$result_sectioning{'more_sections_than_nodes'}{'structure'}{'section_childs'}[0]{'structure'}{'section_childs'}[4]{'structure'}{'section_prev'} = $result_sectioning{'more_sections_than_nodes'}{'structure'}{'section_childs'}[0]{'structure'}{'section_childs'}[3];
$result_sectioning{'more_sections_than_nodes'}{'structure'}{'section_childs'}[0]{'structure'}{'section_childs'}[4]{'structure'}{'section_up'} = $result_sectioning{'more_sections_than_nodes'}{'structure'}{'section_childs'}[0];
$result_sectioning{'more_sections_than_nodes'}{'structure'}{'section_childs'}[0]{'structure'}{'section_childs'}[4]{'structure'}{'toplevel_prev'} = $result_sectioning{'more_sections_than_nodes'}{'structure'}{'section_childs'}[0]{'structure'}{'section_childs'}[3];
$result_sectioning{'more_sections_than_nodes'}{'structure'}{'section_childs'}[0]{'structure'}{'section_childs'}[4]{'structure'}{'toplevel_up'} = $result_sectioning{'more_sections_than_nodes'}{'structure'}{'section_childs'}[0];
$result_sectioning{'more_sections_than_nodes'}{'structure'}{'section_childs'}[0]{'structure'}{'section_up'} = $result_sectioning{'more_sections_than_nodes'};

$result_nodes{'more_sections_than_nodes'} = {
  'cmdname' => 'node',
  'extra' => {
    'associated_section' => {
      'cmdname' => 'top',
      'extra' => {},
      'info' => {},
      'structure' => {}
    },
    'menus' => [
      {
        'cmdname' => 'menu'
      }
    ],
    'normalized' => 'Top'
  },
  'info' => {},
  'structure' => {
    'menu_child' => {
      'cmdname' => 'node',
      'extra' => {
        'associated_section' => {
          'cmdname' => 'chapter',
          'extra' => {},
          'info' => {},
          'structure' => {
            'section_number' => 2
          }
        },
        'normalized' => 'n-c2'
      },
      'info' => {},
      'structure' => {
        'node_next' => {
          'cmdname' => 'node',
          'extra' => {
            'associated_section' => {
              'cmdname' => 'chapter',
              'extra' => {},
              'info' => {},
              'structure' => {
                'section_number' => 3
              }
            },
            'menus' => [
              {
                'cmdname' => 'menu'
              }
            ],
            'normalized' => 'n-c3'
          },
          'info' => {},
          'structure' => {
            'menu_child' => {
              'cmdname' => 'node',
              'extra' => {
                'associated_section' => {
                  'cmdname' => 'section',
                  'extra' => {},
                  'info' => {},
                  'structure' => {
                    'section_number' => '3.2'
                  }
                },
                'normalized' => 'n-c3-s-2'
              },
              'info' => {},
              'structure' => {
                'node_up' => {}
              }
            },
            'node_next' => {
              'cmdname' => 'node',
              'extra' => {
                'associated_section' => {
                  'cmdname' => 'subsection',
                  'extra' => {},
                  'info' => {},
                  'structure' => {
                    'section_number' => '4.1.2'
                  }
                },
                'normalized' => 'n-c3-s1-s2'
              },
              'info' => {},
              'structure' => {
                'node_prev' => {},
                'node_up' => {}
              }
            },
            'node_prev' => {},
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
$result_nodes{'more_sections_than_nodes'}{'structure'}{'menu_child'}{'structure'}{'node_next'}{'structure'}{'menu_child'}{'structure'}{'node_up'} = $result_nodes{'more_sections_than_nodes'}{'structure'}{'menu_child'}{'structure'}{'node_next'};
$result_nodes{'more_sections_than_nodes'}{'structure'}{'menu_child'}{'structure'}{'node_next'}{'structure'}{'node_next'}{'structure'}{'node_prev'} = $result_nodes{'more_sections_than_nodes'}{'structure'}{'menu_child'}{'structure'}{'node_next'};
$result_nodes{'more_sections_than_nodes'}{'structure'}{'menu_child'}{'structure'}{'node_next'}{'structure'}{'node_next'}{'structure'}{'node_up'} = $result_nodes{'more_sections_than_nodes'};
$result_nodes{'more_sections_than_nodes'}{'structure'}{'menu_child'}{'structure'}{'node_next'}{'structure'}{'node_prev'} = $result_nodes{'more_sections_than_nodes'}{'structure'}{'menu_child'};
$result_nodes{'more_sections_than_nodes'}{'structure'}{'menu_child'}{'structure'}{'node_next'}{'structure'}{'node_up'} = $result_nodes{'more_sections_than_nodes'};
$result_nodes{'more_sections_than_nodes'}{'structure'}{'menu_child'}{'structure'}{'node_prev'} = $result_nodes{'more_sections_than_nodes'};
$result_nodes{'more_sections_than_nodes'}{'structure'}{'menu_child'}{'structure'}{'node_up'} = $result_nodes{'more_sections_than_nodes'};
$result_nodes{'more_sections_than_nodes'}{'structure'}{'node_next'} = $result_nodes{'more_sections_than_nodes'}{'structure'}{'menu_child'};

$result_menus{'more_sections_than_nodes'} = {
  'cmdname' => 'node',
  'extra' => {
    'normalized' => 'Top'
  },
  'info' => {},
  'structure' => {
    'menu_child' => {
      'cmdname' => 'node',
      'extra' => {
        'normalized' => 'n-c2'
      },
      'info' => {},
      'structure' => {
        'menu_next' => {
          'cmdname' => 'node',
          'extra' => {
            'normalized' => 'n-c3'
          },
          'info' => {},
          'structure' => {
            'menu_child' => {
              'cmdname' => 'node',
              'extra' => {
                'normalized' => 'n-c3-s-2'
              },
              'info' => {},
              'structure' => {
                'menu_up' => {},
                'menu_up_hash' => {
                  'n-c3' => 1
                }
              }
            },
            'menu_next' => {
              'cmdname' => 'node',
              'extra' => {
                'normalized' => 'n-c3-s1-s2'
              },
              'info' => {},
              'structure' => {
                'menu_prev' => {},
                'menu_up' => {},
                'menu_up_hash' => {
                  'Top' => 1
                }
              }
            },
            'menu_prev' => {},
            'menu_up' => {},
            'menu_up_hash' => {
              'Top' => 1
            }
          }
        },
        'menu_up' => {},
        'menu_up_hash' => {
          'Top' => 1
        }
      }
    }
  }
};
$result_menus{'more_sections_than_nodes'}{'structure'}{'menu_child'}{'structure'}{'menu_next'}{'structure'}{'menu_child'}{'structure'}{'menu_up'} = $result_menus{'more_sections_than_nodes'}{'structure'}{'menu_child'}{'structure'}{'menu_next'};
$result_menus{'more_sections_than_nodes'}{'structure'}{'menu_child'}{'structure'}{'menu_next'}{'structure'}{'menu_next'}{'structure'}{'menu_prev'} = $result_menus{'more_sections_than_nodes'}{'structure'}{'menu_child'}{'structure'}{'menu_next'};
$result_menus{'more_sections_than_nodes'}{'structure'}{'menu_child'}{'structure'}{'menu_next'}{'structure'}{'menu_next'}{'structure'}{'menu_up'} = $result_menus{'more_sections_than_nodes'};
$result_menus{'more_sections_than_nodes'}{'structure'}{'menu_child'}{'structure'}{'menu_next'}{'structure'}{'menu_prev'} = $result_menus{'more_sections_than_nodes'}{'structure'}{'menu_child'};
$result_menus{'more_sections_than_nodes'}{'structure'}{'menu_child'}{'structure'}{'menu_next'}{'structure'}{'menu_up'} = $result_menus{'more_sections_than_nodes'};
$result_menus{'more_sections_than_nodes'}{'structure'}{'menu_child'}{'structure'}{'menu_up'} = $result_menus{'more_sections_than_nodes'};

$result_errors{'more_sections_than_nodes'} = [];


$result_floats{'more_sections_than_nodes'} = {};



$result_converted{'info'}->{'more_sections_than_nodes'} = 'This is , produced from .


File: ,  Node: Top,  Next: n c2,  Up: (dir)

top
***

* Menu:

* n c2::
* n c3::
* n c3 s1 s2::

1 c1
****


File: ,  Node: n c2,  Next: n c3,  Prev: Top,  Up: Top

2 c2
****

2.1 s1
======


File: ,  Node: n c3,  Next: n c3 s1 s2,  Prev: n c2,  Up: Top

3 c3
****

* Menu:

* n c3 s 2::

3.1 C3 s1
=========


File: ,  Node: n c3 s 2,  Up: n c3

3.2 c3 s2
=========

3.3 c3 s3
=========

4 c4
****

4.1 c3 s1
=========

4.1.1 c3 s1 s1
--------------


File: ,  Node: n c3 s1 s2,  Prev: n c3,  Up: Top

4.1.2 c3 s1 s2
--------------

Appendix A appendix
*******************



Tag Table:
Node: Top27
Node: n c2137
Node: n c3221
Node: n c3 s 2341
Node: n c3 s1 s2484

End Tag Table


Local Variables:
coding: utf-8
End:
';


$result_converted{'html'}->{'more_sections_than_nodes'} = '<!DOCTYPE html>
<html>
<!-- Created by texinfo, http://www.gnu.org/software/texinfo/ -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>top</title>

<meta name="description" content="top">
<meta name="keywords" content="top">
<meta name="resource-type" content="document">
<meta name="distribution" content="global">
<meta name="viewport" content="width=device-width,initial-scale=1">

<style type="text/css">
<!--
span.program-in-footer {font-size: smaller}
td.button-direction-about {text-align:center}
td.menu-entry-description {vertical-align: top}
td.menu-entry-destination {vertical-align: top}
td.name-direction-about {text-align:center}
-->
</style>


</head>

<body lang="en">
<div class="top-level-extent" id="Top">
<table class="nav-panel" cellpadding="1" cellspacing="1" border="0">
<tr><td>[ &lt; ]</td>
<td>[<a href="#c1" title="Next section in reading order"> &gt; </a>]</td>
<td> &nbsp; </td>
<td>[Contents]</td>
<td>[Index]</td>
<td>[<a href="#SEC_About" title="About (help)"> ? </a>]</td>
</tr></table>
<h1 class="top" id="top">top</h1>

<table class="menu" border="0" cellspacing="0">
<tr><td class="menu-entry-destination"><a href="#n-c2">2 c2</a></td><td>&nbsp;&nbsp;</td><td class="menu-entry-description">
</td></tr>
<tr><td class="menu-entry-destination"><a href="#n-c3">3 c3</a></td><td>&nbsp;&nbsp;</td><td class="menu-entry-description">
</td></tr>
<tr><td class="menu-entry-destination"><a href="#n-c3-s1-s2">4.1.2 c3 s1 s2</a></td><td>&nbsp;&nbsp;</td><td class="menu-entry-description">
</td></tr>
</table>

<hr style="height: 6px;">
<div class="chapter-level-extent" id="c1">
<table class="nav-panel" cellpadding="1" cellspacing="1" border="0">
<tr><td>[<a href="#Top" title="Beginning of this chapter or previous chapter"> &lt;&lt; </a>]</td>
<td>[<a href="#Top" title="Previous section in reading order"> &lt; </a>]</td>
<td>[<a href="#Top" title="Up section"> Up </a>]</td>
<td>[<a href="#n-c2" title="Next section in reading order"> &gt; </a>]</td>
<td>[<a href="#n-c2" title="Next chapter"> &gt;&gt; </a>]</td>
<td> &nbsp; </td>
<td> &nbsp; </td>
<td> &nbsp; </td>
<td> &nbsp; </td>
<td>[<a href="#Top" title="Cover (top) of document">Top</a>]</td>
<td>[Contents]</td>
<td>[Index]</td>
<td>[<a href="#SEC_About" title="About (help)"> ? </a>]</td>
</tr></table>
<h1 class="chapter">1 c1</h1>

<hr>
</div>
<div class="chapter-level-extent" id="n-c2">
<table class="nav-panel" cellpadding="1" cellspacing="1" border="0">
<tr><td>[<a href="#c1" title="Beginning of this chapter or previous chapter"> &lt;&lt; </a>]</td>
<td>[<a href="#c1" title="Previous section in reading order"> &lt; </a>]</td>
<td>[<a href="#Top" title="Up section"> Up </a>]</td>
<td>[<a href="#s1" title="Next section in reading order"> &gt; </a>]</td>
<td>[<a href="#n-c3" title="Next chapter"> &gt;&gt; </a>]</td>
<td> &nbsp; </td>
<td> &nbsp; </td>
<td> &nbsp; </td>
<td> &nbsp; </td>
<td>[<a href="#Top" title="Cover (top) of document">Top</a>]</td>
<td>[Contents]</td>
<td>[Index]</td>
<td>[<a href="#SEC_About" title="About (help)"> ? </a>]</td>
</tr></table>
<h1 class="chapter" id="c2">2 c2</h1>

<hr>
<div class="section-level-extent" id="s1">
<table class="nav-panel" cellpadding="1" cellspacing="1" border="0">
<tr><td>[<a href="#n-c2" title="Beginning of this chapter or previous chapter"> &lt;&lt; </a>]</td>
<td>[<a href="#n-c2" title="Previous section in reading order"> &lt; </a>]</td>
<td>[<a href="#n-c2" title="Up section"> Up </a>]</td>
<td>[<a href="#n-c3" title="Next section in reading order"> &gt; </a>]</td>
<td>[<a href="#n-c3" title="Next chapter"> &gt;&gt; </a>]</td>
<td> &nbsp; </td>
<td> &nbsp; </td>
<td> &nbsp; </td>
<td> &nbsp; </td>
<td>[<a href="#Top" title="Cover (top) of document">Top</a>]</td>
<td>[Contents]</td>
<td>[Index]</td>
<td>[<a href="#SEC_About" title="About (help)"> ? </a>]</td>
</tr></table>
<h2 class="section">2.1 s1</h2>

<hr>
</div>
</div>
<div class="chapter-level-extent" id="n-c3">
<table class="nav-panel" cellpadding="1" cellspacing="1" border="0">
<tr><td>[<a href="#n-c2" title="Beginning of this chapter or previous chapter"> &lt;&lt; </a>]</td>
<td>[<a href="#s1" title="Previous section in reading order"> &lt; </a>]</td>
<td>[<a href="#Top" title="Up section"> Up </a>]</td>
<td>[<a href="#C3-s1" title="Next section in reading order"> &gt; </a>]</td>
<td>[<a href="#c4" title="Next chapter"> &gt;&gt; </a>]</td>
<td> &nbsp; </td>
<td> &nbsp; </td>
<td> &nbsp; </td>
<td> &nbsp; </td>
<td>[<a href="#Top" title="Cover (top) of document">Top</a>]</td>
<td>[Contents]</td>
<td>[Index]</td>
<td>[<a href="#SEC_About" title="About (help)"> ? </a>]</td>
</tr></table>
<h1 class="chapter" id="c3">3 c3</h1>

<table class="menu" border="0" cellspacing="0">
<tr><td class="menu-entry-destination"><a href="#n-c3-s-2">3.2 c3 s2</a></td><td>&nbsp;&nbsp;</td><td class="menu-entry-description">
</td></tr>
</table>

<hr>
<div class="section-level-extent" id="C3-s1">
<table class="nav-panel" cellpadding="1" cellspacing="1" border="0">
<tr><td>[<a href="#n-c3" title="Beginning of this chapter or previous chapter"> &lt;&lt; </a>]</td>
<td>[<a href="#n-c3" title="Previous section in reading order"> &lt; </a>]</td>
<td>[<a href="#n-c3" title="Up section"> Up </a>]</td>
<td>[<a href="#n-c3-s-2" title="Next section in reading order"> &gt; </a>]</td>
<td>[<a href="#c4" title="Next chapter"> &gt;&gt; </a>]</td>
<td> &nbsp; </td>
<td> &nbsp; </td>
<td> &nbsp; </td>
<td> &nbsp; </td>
<td>[<a href="#Top" title="Cover (top) of document">Top</a>]</td>
<td>[Contents]</td>
<td>[Index]</td>
<td>[<a href="#SEC_About" title="About (help)"> ? </a>]</td>
</tr></table>
<h2 class="section">3.1 C3 s1</h2>

<hr>
</div>
<div class="section-level-extent" id="n-c3-s-2">
<table class="nav-panel" cellpadding="1" cellspacing="1" border="0">
<tr><td>[<a href="#n-c3" title="Beginning of this chapter or previous chapter"> &lt;&lt; </a>]</td>
<td>[<a href="#C3-s1" title="Previous section in reading order"> &lt; </a>]</td>
<td>[<a href="#n-c3" title="Up section"> Up </a>]</td>
<td>[<a href="#c3-s3" title="Next section in reading order"> &gt; </a>]</td>
<td>[<a href="#c4" title="Next chapter"> &gt;&gt; </a>]</td>
<td> &nbsp; </td>
<td> &nbsp; </td>
<td> &nbsp; </td>
<td> &nbsp; </td>
<td>[<a href="#Top" title="Cover (top) of document">Top</a>]</td>
<td>[Contents]</td>
<td>[Index]</td>
<td>[<a href="#SEC_About" title="About (help)"> ? </a>]</td>
</tr></table>
<h2 class="section" id="c3-s2">3.2 c3 s2</h2>

<hr>
</div>
<div class="section-level-extent" id="c3-s3">
<table class="nav-panel" cellpadding="1" cellspacing="1" border="0">
<tr><td>[<a href="#n-c3" title="Beginning of this chapter or previous chapter"> &lt;&lt; </a>]</td>
<td>[<a href="#n-c3-s-2" title="Previous section in reading order"> &lt; </a>]</td>
<td>[<a href="#n-c3" title="Up section"> Up </a>]</td>
<td>[<a href="#c4" title="Next section in reading order"> &gt; </a>]</td>
<td>[<a href="#c4" title="Next chapter"> &gt;&gt; </a>]</td>
<td> &nbsp; </td>
<td> &nbsp; </td>
<td> &nbsp; </td>
<td> &nbsp; </td>
<td>[<a href="#Top" title="Cover (top) of document">Top</a>]</td>
<td>[Contents]</td>
<td>[Index]</td>
<td>[<a href="#SEC_About" title="About (help)"> ? </a>]</td>
</tr></table>
<h2 class="section">3.3 c3 s3</h2>

<hr>
</div>
</div>
<div class="chapter-level-extent" id="c4">
<table class="nav-panel" cellpadding="1" cellspacing="1" border="0">
<tr><td>[<a href="#n-c3" title="Beginning of this chapter or previous chapter"> &lt;&lt; </a>]</td>
<td>[<a href="#c3-s3" title="Previous section in reading order"> &lt; </a>]</td>
<td>[<a href="#Top" title="Up section"> Up </a>]</td>
<td>[<a href="#c3-s1" title="Next section in reading order"> &gt; </a>]</td>
<td>[<a href="#appendix" title="Next chapter"> &gt;&gt; </a>]</td>
<td> &nbsp; </td>
<td> &nbsp; </td>
<td> &nbsp; </td>
<td> &nbsp; </td>
<td>[<a href="#Top" title="Cover (top) of document">Top</a>]</td>
<td>[Contents]</td>
<td>[Index]</td>
<td>[<a href="#SEC_About" title="About (help)"> ? </a>]</td>
</tr></table>
<h1 class="chapter">4 c4</h1>

<hr>
<div class="section-level-extent" id="c3-s1">
<table class="nav-panel" cellpadding="1" cellspacing="1" border="0">
<tr><td>[<a href="#c4" title="Beginning of this chapter or previous chapter"> &lt;&lt; </a>]</td>
<td>[<a href="#c4" title="Previous section in reading order"> &lt; </a>]</td>
<td>[<a href="#c4" title="Up section"> Up </a>]</td>
<td>[<a href="#c3-s1-s1" title="Next section in reading order"> &gt; </a>]</td>
<td>[<a href="#appendix" title="Next chapter"> &gt;&gt; </a>]</td>
<td> &nbsp; </td>
<td> &nbsp; </td>
<td> &nbsp; </td>
<td> &nbsp; </td>
<td>[<a href="#Top" title="Cover (top) of document">Top</a>]</td>
<td>[Contents]</td>
<td>[Index]</td>
<td>[<a href="#SEC_About" title="About (help)"> ? </a>]</td>
</tr></table>
<h2 class="section">4.1 c3 s1</h2>

<hr>
<div class="subsection-level-extent" id="c3-s1-s1">
<table class="nav-panel" cellpadding="1" cellspacing="1" border="0">
<tr><td>[<a href="#c4" title="Beginning of this chapter or previous chapter"> &lt;&lt; </a>]</td>
<td>[<a href="#c3-s1" title="Previous section in reading order"> &lt; </a>]</td>
<td>[<a href="#c3-s1" title="Up section"> Up </a>]</td>
<td>[<a href="#n-c3-s1-s2" title="Next section in reading order"> &gt; </a>]</td>
<td>[<a href="#appendix" title="Next chapter"> &gt;&gt; </a>]</td>
<td> &nbsp; </td>
<td> &nbsp; </td>
<td> &nbsp; </td>
<td> &nbsp; </td>
<td>[<a href="#Top" title="Cover (top) of document">Top</a>]</td>
<td>[Contents]</td>
<td>[Index]</td>
<td>[<a href="#SEC_About" title="About (help)"> ? </a>]</td>
</tr></table>
<h3 class="subsection">4.1.1 c3 s1 s1</h3>

<hr>
</div>
<div class="subsection-level-extent" id="n-c3-s1-s2">
<table class="nav-panel" cellpadding="1" cellspacing="1" border="0">
<tr><td>[<a href="#c4" title="Beginning of this chapter or previous chapter"> &lt;&lt; </a>]</td>
<td>[<a href="#c3-s1-s1" title="Previous section in reading order"> &lt; </a>]</td>
<td>[<a href="#c3-s1" title="Up section"> Up </a>]</td>
<td>[<a href="#appendix" title="Next section in reading order"> &gt; </a>]</td>
<td>[<a href="#appendix" title="Next chapter"> &gt;&gt; </a>]</td>
<td> &nbsp; </td>
<td> &nbsp; </td>
<td> &nbsp; </td>
<td> &nbsp; </td>
<td>[<a href="#Top" title="Cover (top) of document">Top</a>]</td>
<td>[Contents]</td>
<td>[Index]</td>
<td>[<a href="#SEC_About" title="About (help)"> ? </a>]</td>
</tr></table>
<h3 class="subsection" id="c3-s1-s2">4.1.2 c3 s1 s2</h3>

<hr>
</div>
</div>
</div>
<div class="appendix-level-extent" id="appendix">
<table class="nav-panel" cellpadding="1" cellspacing="1" border="0">
<tr><td>[<a href="#c4" title="Beginning of this chapter or previous chapter"> &lt;&lt; </a>]</td>
<td>[<a href="#n-c3-s1-s2" title="Previous section in reading order"> &lt; </a>]</td>
<td>[<a href="#Top" title="Up section"> Up </a>]</td>
<td>[ &gt; ]</td>
<td>[ &gt;&gt; ]</td>
<td> &nbsp; </td>
<td> &nbsp; </td>
<td> &nbsp; </td>
<td> &nbsp; </td>
<td>[<a href="#Top" title="Cover (top) of document">Top</a>]</td>
<td>[Contents]</td>
<td>[Index]</td>
<td>[<a href="#SEC_About" title="About (help)"> ? </a>]</td>
</tr></table>
<h1 class="appendix">Appendix A appendix</h1>
<hr style="height: 6px;">
</div>
</div>
<div class="element-about" id="SEC_About">
<table class="nav-panel" cellpadding="1" cellspacing="1" border="0">
<tr><td>[<a href="#Top" title="Cover (top) of document">Top</a>]</td>
<td>[Contents]</td>
<td>[Index]</td>
<td>[<a href="#SEC_About" title="About (help)"> ? </a>]</td>
</tr></table>
<h1 class="about-heading">About This Document</h1>

<p>
  This document was generated on <em class="emph">a sunny day</em>.
</p>
<p>
  The buttons in the navigation panels have the following meaning:
</p>
<table border="1">
  <tr>
    <th> Button </th>
    <th> Name </th>
    <th> Go to </th>
    <th> From 1.2.3 go to</th>
  </tr>
  <tr>
    <td class="button-direction-about"> [ &lt;&lt; ] </td>
    <td class="name-direction-about">FastBack</td>
    <td>Beginning of this chapter or previous chapter</td>
    <td>1</td>
  </tr>
  <tr>
    <td class="button-direction-about"> [ &lt; ] </td>
    <td class="name-direction-about">Back</td>
    <td>Previous section in reading order</td>
    <td>1.2.2</td>
  </tr>
  <tr>
    <td class="button-direction-about"> [ Up ] </td>
    <td class="name-direction-about">Up</td>
    <td>Up section</td>
    <td>1.2</td>
  </tr>
  <tr>
    <td class="button-direction-about"> [ &gt; ] </td>
    <td class="name-direction-about">Forward</td>
    <td>Next section in reading order</td>
    <td>1.2.4</td>
  </tr>
  <tr>
    <td class="button-direction-about"> [ &gt;&gt; ] </td>
    <td class="name-direction-about">FastForward</td>
    <td>Next chapter</td>
    <td>2</td>
  </tr>
  <tr>
    <td class="button-direction-about"> [Top] </td>
    <td class="name-direction-about">Top</td>
    <td>Cover (top) of document</td>
    <td> &nbsp; </td>
  </tr>
  <tr>
    <td class="button-direction-about"> [Contents] </td>
    <td class="name-direction-about">Contents</td>
    <td>Table of contents</td>
    <td> &nbsp; </td>
  </tr>
  <tr>
    <td class="button-direction-about"> [Index] </td>
    <td class="name-direction-about">Index</td>
    <td>Index</td>
    <td> &nbsp; </td>
  </tr>
  <tr>
    <td class="button-direction-about"> [ ? ] </td>
    <td class="name-direction-about">About</td>
    <td>About (help)</td>
    <td> &nbsp; </td>
  </tr>
</table>

<p>
  where the <strong class="strong"> Example </strong> assumes that the current position is at <strong class="strong"> Subsubsection One-Two-Three </strong> of a document of the following structure:
</p>

<ul>
  <li> 1. Section One
    <ul>
      <li>1.1 Subsection One-One
        <ul>
          <li>...</li>
        </ul>
      </li>
      <li>1.2 Subsection One-Two
        <ul>
          <li>1.2.1 Subsubsection One-Two-One</li>
          <li>1.2.2 Subsubsection One-Two-Two</li>
          <li>1.2.3 Subsubsection One-Two-Three &nbsp; &nbsp;
            <strong>&lt;== Current Position </strong></li>
          <li>1.2.4 Subsubsection One-Two-Four</li>
        </ul>
      </li>
      <li>1.3 Subsection One-Three
        <ul>
          <li>...</li>
        </ul>
      </li>
      <li>1.4 Subsection One-Four</li>
    </ul>
  </li>
</ul>
</div><hr>
<p>
  <span class="program-in-footer">This document was generated on <em class="emph">a sunny day</em>.</span>
</p>


</body>
</html>
';


$result_converted{'xml'}->{'more_sections_than_nodes'} = '<node name="Top" spaces=" "><nodename>Top</nodename><nodenext automatic="on">n c2</nodenext></node>
<top spaces=" "><sectiontitle>top</sectiontitle>

<menu endspaces=" ">
<menuentry><menuleadingtext>* </menuleadingtext><menunode>n c2</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode>n c3</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode>n c3 s1 s2</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry></menu>

</top>
<chapter spaces=" "><sectiontitle>c1</sectiontitle>

</chapter>
<node name="n-c2" spaces=" "><nodename>n c2</nodename><nodenext automatic="on">n c3</nodenext><nodeprev automatic="on">Top</nodeprev><nodeup automatic="on">Top</nodeup></node>
<chapter spaces=" "><sectiontitle>c2</sectiontitle>

<section spaces=" "><sectiontitle>s1</sectiontitle>

</section>
</chapter>
<node name="n-c3" spaces=" "><nodename>n c3</nodename><nodenext spaces=" ">n c3 s1 s2</nodenext><nodeprev spaces=" ">n c2</nodeprev><nodeup spaces=" ">Top</nodeup></node>
<chapter spaces=" "><sectiontitle>c3</sectiontitle>

<menu endspaces=" "> 
<menuentry><menuleadingtext>* </menuleadingtext><menunode>n c3 s 2</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry></menu>

<section spaces=" "><sectiontitle>C3 s1</sectiontitle>

</section>
<node name="n-c3-s-2" spaces=" "><nodename>n c3 s 2</nodename><nodeup automatic="on">n c3</nodeup></node>
<section spaces=" "><sectiontitle>c3 s2</sectiontitle>

</section>
<section spaces=" "><sectiontitle>c3 s3</sectiontitle>

</section>
</chapter>
<chapter spaces=" "><sectiontitle>c4</sectiontitle>

<section spaces=" "><sectiontitle>c3 s1</sectiontitle>

<subsection spaces=" "><sectiontitle>c3 s1 s1</sectiontitle>

</subsection>
<node name="n-c3-s1-s2" spaces=" "><nodename>n c3 s1 s2</nodename><nodenext></nodenext><nodeprev>n c3</nodeprev><nodeup>Top</nodeup></node>
<subsection spaces=" "><sectiontitle>c3 s1 s2</sectiontitle>

</subsection>
</section>
</chapter>
<appendix spaces=" "><sectiontitle>appendix</sectiontitle>
</appendix>
';

1;