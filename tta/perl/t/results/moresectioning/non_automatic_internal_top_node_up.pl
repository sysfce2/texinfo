use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'non_automatic_internal_top_node_up'} = [
  {
    'unit_command' => {
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
              'type' => 'line_arg'
            },
            {
              'contents' => [
                {
                  'text' => 'chap'
                }
              ],
              'extra' => {
                'node_content' => {
                  'contents' => [
                    {}
                  ]
                },
                'normalized' => 'chap'
              },
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
                  'cmdname' => 'acronym',
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'GNU'
                        }
                      ],
                      'type' => 'brace_arg'
                    },
                    {
                      'contents' => [
                        {
                          'cmdname' => 'acronym',
                          'contents' => [
                            {
                              'contents' => [
                                {
                                  'text' => 'GNU'
                                }
                              ],
                              'type' => 'brace_arg'
                            }
                          ],
                          'source_info' => {
                            'line_nr' => 1
                          }
                        },
                        {
                          'text' => '\'s Not Unix'
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
                  'source_info' => {
                    'line_nr' => 1
                  }
                },
                {
                  'text' => ' manuals'
                }
              ],
              'extra' => {
                'node_content' => {
                  'contents' => [
                    {},
                    {}
                  ]
                },
                'normalized' => 'GNU-manuals'
              },
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
                  'cmdname' => 'acronym',
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'GNU'
                        }
                      ],
                      'type' => 'brace_arg'
                    },
                    {
                      'contents' => [
                        {
                          'cmdname' => 'acronym',
                          'contents' => [
                            {
                              'contents' => [
                                {
                                  'text' => 'GNU'
                                }
                              ],
                              'type' => 'brace_arg'
                            }
                          ],
                          'source_info' => {
                            'line_nr' => 1
                          }
                        },
                        {
                          'text' => '\'s Not Unix'
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
                  'source_info' => {
                    'line_nr' => 1
                  }
                },
                {
                  'text' => ' manuals'
                }
              ],
              'extra' => {
                'node_content' => {
                  'contents' => [
                    {},
                    {}
                  ]
                },
                'normalized' => 'GNU-manuals'
              },
              'info' => {
                'spaces_after_argument' => {
                  'text' => '
'
                },
                'spaces_before_argument' => {
                  'text' => ' '
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
    'unit_contents' => [
      {
        'type' => 'before_node_section'
      },
      {},
      {
        'cmdname' => 'top',
        'contents' => [
          {
            'contents' => [
              {
                'contents' => [
                  {
                    'text' => 'internal top node up'
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
                        'text' => 'chap'
                      }
                    ],
                    'extra' => {
                      'node_content' => {
                        'contents' => [
                          {}
                        ]
                      },
                      'normalized' => 'chap'
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
                  'line_nr' => 5
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
                  'line_nr' => 6
                }
              }
            ],
            'source_info' => {
              'line_nr' => 4
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
          'spaces_before_argument' => {
            'text' => ' '
          }
        },
        'source_info' => {
          'line_nr' => 2
        }
      }
    ],
    'unit_type' => 'unit'
  },
  {
    'unit_command' => {
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
              'type' => 'line_arg'
            },
            {
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
                  'text' => 'Top'
                }
              ],
              'extra' => {
                'node_content' => {
                  'contents' => [
                    {}
                  ]
                },
                'normalized' => 'Top'
              },
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
                  'cmdname' => 'acronym',
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'GNU'
                        }
                      ],
                      'type' => 'brace_arg'
                    },
                    {
                      'contents' => [
                        {
                          'cmdname' => 'acronym',
                          'contents' => [
                            {
                              'contents' => [
                                {
                                  'text' => 'GNU'
                                }
                              ],
                              'type' => 'brace_arg'
                            }
                          ],
                          'source_info' => {
                            'line_nr' => 8
                          }
                        },
                        {
                          'text' => '\'s Not Unix'
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
                  'source_info' => {
                    'line_nr' => 8
                  }
                },
                {
                  'text' => ' manuals'
                }
              ],
              'extra' => {
                'node_content' => {
                  'contents' => [
                    {},
                    {}
                  ]
                },
                'normalized' => 'GNU-manuals'
              },
              'info' => {
                'spaces_after_argument' => {
                  'text' => '
'
                },
                'spaces_before_argument' => {
                  'text' => ' '
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
        'line_nr' => 8
      }
    },
    'unit_contents' => [
      {}
    ],
    'unit_type' => 'unit'
  }
];
$result_trees{'non_automatic_internal_top_node_up'}[0]{'unit_command'}{'contents'}[0]{'contents'}[1]{'extra'}{'node_content'}{'contents'}[0] = $result_trees{'non_automatic_internal_top_node_up'}[0]{'unit_command'}{'contents'}[0]{'contents'}[1]{'contents'}[0];
$result_trees{'non_automatic_internal_top_node_up'}[0]{'unit_command'}{'contents'}[0]{'contents'}[2]{'extra'}{'node_content'}{'contents'}[0] = $result_trees{'non_automatic_internal_top_node_up'}[0]{'unit_command'}{'contents'}[0]{'contents'}[2]{'contents'}[0];
$result_trees{'non_automatic_internal_top_node_up'}[0]{'unit_command'}{'contents'}[0]{'contents'}[2]{'extra'}{'node_content'}{'contents'}[1] = $result_trees{'non_automatic_internal_top_node_up'}[0]{'unit_command'}{'contents'}[0]{'contents'}[2]{'contents'}[1];
$result_trees{'non_automatic_internal_top_node_up'}[0]{'unit_command'}{'contents'}[0]{'contents'}[3]{'extra'}{'node_content'}{'contents'}[0] = $result_trees{'non_automatic_internal_top_node_up'}[0]{'unit_command'}{'contents'}[0]{'contents'}[3]{'contents'}[0];
$result_trees{'non_automatic_internal_top_node_up'}[0]{'unit_command'}{'contents'}[0]{'contents'}[3]{'extra'}{'node_content'}{'contents'}[1] = $result_trees{'non_automatic_internal_top_node_up'}[0]{'unit_command'}{'contents'}[0]{'contents'}[3]{'contents'}[1];
$result_trees{'non_automatic_internal_top_node_up'}[0]{'unit_contents'}[1] = $result_trees{'non_automatic_internal_top_node_up'}[0]{'unit_command'};
$result_trees{'non_automatic_internal_top_node_up'}[0]{'unit_contents'}[2]{'contents'}[2]{'contents'}[1]{'contents'}[1]{'extra'}{'node_content'}{'contents'}[0] = $result_trees{'non_automatic_internal_top_node_up'}[0]{'unit_contents'}[2]{'contents'}[2]{'contents'}[1]{'contents'}[1]{'contents'}[0];
$result_trees{'non_automatic_internal_top_node_up'}[1]{'unit_command'}{'contents'}[0]{'contents'}[2]{'extra'}{'node_content'}{'contents'}[0] = $result_trees{'non_automatic_internal_top_node_up'}[1]{'unit_command'}{'contents'}[0]{'contents'}[2]{'contents'}[0];
$result_trees{'non_automatic_internal_top_node_up'}[1]{'unit_command'}{'contents'}[0]{'contents'}[3]{'extra'}{'node_content'}{'contents'}[0] = $result_trees{'non_automatic_internal_top_node_up'}[1]{'unit_command'}{'contents'}[0]{'contents'}[3]{'contents'}[0];
$result_trees{'non_automatic_internal_top_node_up'}[1]{'unit_command'}{'contents'}[0]{'contents'}[3]{'extra'}{'node_content'}{'contents'}[1] = $result_trees{'non_automatic_internal_top_node_up'}[1]{'unit_command'}{'contents'}[0]{'contents'}[3]{'contents'}[1];
$result_trees{'non_automatic_internal_top_node_up'}[1]{'unit_contents'}[0] = $result_trees{'non_automatic_internal_top_node_up'}[1]{'unit_command'};

$result_texis{'non_automatic_internal_top_node_up'} = '@node Top, chap, @acronym{GNU, @acronym{GNU}\'s Not Unix} manuals, @acronym{GNU, @acronym{GNU}\'s Not Unix} manuals
@top internal top node up

@menu
* chap::
@end menu

@node chap, , Top, @acronym{GNU, @acronym{GNU}\'s Not Unix} manuals
';


$result_texts{'non_automatic_internal_top_node_up'} = 'internal top node up
********************

* chap::

';

$result_sectioning{'non_automatic_internal_top_node_up'} = {
  'extra' => {
    'section_childs' => [
      {
        'associated_unit' => {
          'directions' => {
            'Forward' => {
              'directions' => {
                'Back' => {},
                'FastBack' => {},
                'NodeBack' => {},
                'NodePrev' => {},
                'This' => {}
              },
              'tree_unit_directions' => {
                'prev' => {}
              },
              'unit_command' => {
                'associated_unit' => {},
                'cmdname' => 'node',
                'extra' => {
                  'normalized' => 'chap'
                }
              },
              'unit_type' => 'unit'
            },
            'NodeForward' => {},
            'NodeNext' => {},
            'This' => {}
          },
          'tree_unit_directions' => {},
          'unit_command' => {
            'associated_unit' => {},
            'cmdname' => 'node',
            'extra' => {
              'normalized' => 'Top'
            }
          },
          'unit_type' => 'unit'
        },
        'cmdname' => 'top',
        'extra' => {
          'associated_node' => {},
          'section_level' => 0,
          'sectioning_root' => {}
        }
      }
    ],
    'section_level' => -1
  }
};
$result_sectioning{'non_automatic_internal_top_node_up'}{'extra'}{'section_childs'}[0]{'associated_unit'}{'directions'}{'Forward'}{'directions'}{'Back'} = $result_sectioning{'non_automatic_internal_top_node_up'}{'extra'}{'section_childs'}[0]{'associated_unit'};
$result_sectioning{'non_automatic_internal_top_node_up'}{'extra'}{'section_childs'}[0]{'associated_unit'}{'directions'}{'Forward'}{'directions'}{'FastBack'} = $result_sectioning{'non_automatic_internal_top_node_up'}{'extra'}{'section_childs'}[0]{'associated_unit'};
$result_sectioning{'non_automatic_internal_top_node_up'}{'extra'}{'section_childs'}[0]{'associated_unit'}{'directions'}{'Forward'}{'directions'}{'NodeBack'} = $result_sectioning{'non_automatic_internal_top_node_up'}{'extra'}{'section_childs'}[0]{'associated_unit'};
$result_sectioning{'non_automatic_internal_top_node_up'}{'extra'}{'section_childs'}[0]{'associated_unit'}{'directions'}{'Forward'}{'directions'}{'NodePrev'} = $result_sectioning{'non_automatic_internal_top_node_up'}{'extra'}{'section_childs'}[0]{'associated_unit'};
$result_sectioning{'non_automatic_internal_top_node_up'}{'extra'}{'section_childs'}[0]{'associated_unit'}{'directions'}{'Forward'}{'directions'}{'This'} = $result_sectioning{'non_automatic_internal_top_node_up'}{'extra'}{'section_childs'}[0]{'associated_unit'}{'directions'}{'Forward'};
$result_sectioning{'non_automatic_internal_top_node_up'}{'extra'}{'section_childs'}[0]{'associated_unit'}{'directions'}{'Forward'}{'tree_unit_directions'}{'prev'} = $result_sectioning{'non_automatic_internal_top_node_up'}{'extra'}{'section_childs'}[0]{'associated_unit'};
$result_sectioning{'non_automatic_internal_top_node_up'}{'extra'}{'section_childs'}[0]{'associated_unit'}{'directions'}{'Forward'}{'unit_command'}{'associated_unit'} = $result_sectioning{'non_automatic_internal_top_node_up'}{'extra'}{'section_childs'}[0]{'associated_unit'}{'directions'}{'Forward'};
$result_sectioning{'non_automatic_internal_top_node_up'}{'extra'}{'section_childs'}[0]{'associated_unit'}{'directions'}{'NodeForward'} = $result_sectioning{'non_automatic_internal_top_node_up'}{'extra'}{'section_childs'}[0]{'associated_unit'}{'directions'}{'Forward'};
$result_sectioning{'non_automatic_internal_top_node_up'}{'extra'}{'section_childs'}[0]{'associated_unit'}{'directions'}{'NodeNext'} = $result_sectioning{'non_automatic_internal_top_node_up'}{'extra'}{'section_childs'}[0]{'associated_unit'}{'directions'}{'Forward'};
$result_sectioning{'non_automatic_internal_top_node_up'}{'extra'}{'section_childs'}[0]{'associated_unit'}{'directions'}{'This'} = $result_sectioning{'non_automatic_internal_top_node_up'}{'extra'}{'section_childs'}[0]{'associated_unit'};
$result_sectioning{'non_automatic_internal_top_node_up'}{'extra'}{'section_childs'}[0]{'associated_unit'}{'unit_command'}{'associated_unit'} = $result_sectioning{'non_automatic_internal_top_node_up'}{'extra'}{'section_childs'}[0]{'associated_unit'};
$result_sectioning{'non_automatic_internal_top_node_up'}{'extra'}{'section_childs'}[0]{'extra'}{'associated_node'} = $result_sectioning{'non_automatic_internal_top_node_up'}{'extra'}{'section_childs'}[0]{'associated_unit'}{'unit_command'};
$result_sectioning{'non_automatic_internal_top_node_up'}{'extra'}{'section_childs'}[0]{'extra'}{'sectioning_root'} = $result_sectioning{'non_automatic_internal_top_node_up'};

$result_nodes{'non_automatic_internal_top_node_up'} = [
  {
    'associated_unit' => {
      'directions' => {
        'Forward' => {
          'directions' => {
            'Back' => {},
            'FastBack' => {},
            'NodeBack' => {},
            'NodePrev' => {},
            'This' => {}
          },
          'tree_unit_directions' => {
            'prev' => {}
          },
          'unit_command' => {
            'associated_unit' => {},
            'cmdname' => 'node',
            'extra' => {
              'node_directions' => {
                'prev' => {}
              },
              'normalized' => 'chap'
            }
          },
          'unit_type' => 'unit'
        },
        'NodeForward' => {},
        'NodeNext' => {},
        'This' => {}
      },
      'tree_unit_directions' => {
        'next' => {}
      },
      'unit_command' => {},
      'unit_type' => 'unit'
    },
    'cmdname' => 'node',
    'extra' => {
      'associated_section' => {
        'associated_unit' => {},
        'cmdname' => 'top',
        'extra' => {}
      },
      'node_directions' => {
        'next' => {}
      },
      'normalized' => 'Top'
    }
  },
  {}
];
$result_nodes{'non_automatic_internal_top_node_up'}[0]{'associated_unit'}{'directions'}{'Forward'}{'directions'}{'Back'} = $result_nodes{'non_automatic_internal_top_node_up'}[0]{'associated_unit'};
$result_nodes{'non_automatic_internal_top_node_up'}[0]{'associated_unit'}{'directions'}{'Forward'}{'directions'}{'FastBack'} = $result_nodes{'non_automatic_internal_top_node_up'}[0]{'associated_unit'};
$result_nodes{'non_automatic_internal_top_node_up'}[0]{'associated_unit'}{'directions'}{'Forward'}{'directions'}{'NodeBack'} = $result_nodes{'non_automatic_internal_top_node_up'}[0]{'associated_unit'};
$result_nodes{'non_automatic_internal_top_node_up'}[0]{'associated_unit'}{'directions'}{'Forward'}{'directions'}{'NodePrev'} = $result_nodes{'non_automatic_internal_top_node_up'}[0]{'associated_unit'};
$result_nodes{'non_automatic_internal_top_node_up'}[0]{'associated_unit'}{'directions'}{'Forward'}{'directions'}{'This'} = $result_nodes{'non_automatic_internal_top_node_up'}[0]{'associated_unit'}{'directions'}{'Forward'};
$result_nodes{'non_automatic_internal_top_node_up'}[0]{'associated_unit'}{'directions'}{'Forward'}{'tree_unit_directions'}{'prev'} = $result_nodes{'non_automatic_internal_top_node_up'}[0]{'associated_unit'};
$result_nodes{'non_automatic_internal_top_node_up'}[0]{'associated_unit'}{'directions'}{'Forward'}{'unit_command'}{'associated_unit'} = $result_nodes{'non_automatic_internal_top_node_up'}[0]{'associated_unit'}{'directions'}{'Forward'};
$result_nodes{'non_automatic_internal_top_node_up'}[0]{'associated_unit'}{'directions'}{'Forward'}{'unit_command'}{'extra'}{'node_directions'}{'prev'} = $result_nodes{'non_automatic_internal_top_node_up'}[0];
$result_nodes{'non_automatic_internal_top_node_up'}[0]{'associated_unit'}{'directions'}{'NodeForward'} = $result_nodes{'non_automatic_internal_top_node_up'}[0]{'associated_unit'}{'directions'}{'Forward'};
$result_nodes{'non_automatic_internal_top_node_up'}[0]{'associated_unit'}{'directions'}{'NodeNext'} = $result_nodes{'non_automatic_internal_top_node_up'}[0]{'associated_unit'}{'directions'}{'Forward'};
$result_nodes{'non_automatic_internal_top_node_up'}[0]{'associated_unit'}{'directions'}{'This'} = $result_nodes{'non_automatic_internal_top_node_up'}[0]{'associated_unit'};
$result_nodes{'non_automatic_internal_top_node_up'}[0]{'associated_unit'}{'tree_unit_directions'}{'next'} = $result_nodes{'non_automatic_internal_top_node_up'}[0]{'associated_unit'}{'directions'}{'Forward'};
$result_nodes{'non_automatic_internal_top_node_up'}[0]{'associated_unit'}{'unit_command'} = $result_nodes{'non_automatic_internal_top_node_up'}[0];
$result_nodes{'non_automatic_internal_top_node_up'}[0]{'extra'}{'associated_section'}{'associated_unit'} = $result_nodes{'non_automatic_internal_top_node_up'}[0]{'associated_unit'};
$result_nodes{'non_automatic_internal_top_node_up'}[0]{'extra'}{'node_directions'}{'next'} = $result_nodes{'non_automatic_internal_top_node_up'}[0]{'associated_unit'}{'directions'}{'Forward'}{'unit_command'};
$result_nodes{'non_automatic_internal_top_node_up'}[1] = $result_nodes{'non_automatic_internal_top_node_up'}[0]{'associated_unit'}{'directions'}{'Forward'}{'unit_command'};

$result_menus{'non_automatic_internal_top_node_up'} = [
  {
    'associated_unit' => {
      'directions' => {
        'Forward' => {
          'directions' => {
            'Back' => {},
            'FastBack' => {},
            'NodeBack' => {},
            'NodePrev' => {},
            'This' => {}
          },
          'tree_unit_directions' => {
            'prev' => {}
          },
          'unit_command' => {
            'associated_unit' => {},
            'extra' => {
              'menu_directions' => {
                'up' => {}
              },
              'normalized' => 'chap'
            }
          },
          'unit_type' => 'unit'
        },
        'NodeForward' => {},
        'NodeNext' => {},
        'This' => {}
      },
      'tree_unit_directions' => {
        'next' => {}
      },
      'unit_command' => {},
      'unit_type' => 'unit'
    },
    'extra' => {
      'menus' => [
        {}
      ],
      'normalized' => 'Top'
    }
  },
  {}
];
$result_menus{'non_automatic_internal_top_node_up'}[0]{'associated_unit'}{'directions'}{'Forward'}{'directions'}{'Back'} = $result_menus{'non_automatic_internal_top_node_up'}[0]{'associated_unit'};
$result_menus{'non_automatic_internal_top_node_up'}[0]{'associated_unit'}{'directions'}{'Forward'}{'directions'}{'FastBack'} = $result_menus{'non_automatic_internal_top_node_up'}[0]{'associated_unit'};
$result_menus{'non_automatic_internal_top_node_up'}[0]{'associated_unit'}{'directions'}{'Forward'}{'directions'}{'NodeBack'} = $result_menus{'non_automatic_internal_top_node_up'}[0]{'associated_unit'};
$result_menus{'non_automatic_internal_top_node_up'}[0]{'associated_unit'}{'directions'}{'Forward'}{'directions'}{'NodePrev'} = $result_menus{'non_automatic_internal_top_node_up'}[0]{'associated_unit'};
$result_menus{'non_automatic_internal_top_node_up'}[0]{'associated_unit'}{'directions'}{'Forward'}{'directions'}{'This'} = $result_menus{'non_automatic_internal_top_node_up'}[0]{'associated_unit'}{'directions'}{'Forward'};
$result_menus{'non_automatic_internal_top_node_up'}[0]{'associated_unit'}{'directions'}{'Forward'}{'tree_unit_directions'}{'prev'} = $result_menus{'non_automatic_internal_top_node_up'}[0]{'associated_unit'};
$result_menus{'non_automatic_internal_top_node_up'}[0]{'associated_unit'}{'directions'}{'Forward'}{'unit_command'}{'associated_unit'} = $result_menus{'non_automatic_internal_top_node_up'}[0]{'associated_unit'}{'directions'}{'Forward'};
$result_menus{'non_automatic_internal_top_node_up'}[0]{'associated_unit'}{'directions'}{'Forward'}{'unit_command'}{'extra'}{'menu_directions'}{'up'} = $result_menus{'non_automatic_internal_top_node_up'}[0];
$result_menus{'non_automatic_internal_top_node_up'}[0]{'associated_unit'}{'directions'}{'NodeForward'} = $result_menus{'non_automatic_internal_top_node_up'}[0]{'associated_unit'}{'directions'}{'Forward'};
$result_menus{'non_automatic_internal_top_node_up'}[0]{'associated_unit'}{'directions'}{'NodeNext'} = $result_menus{'non_automatic_internal_top_node_up'}[0]{'associated_unit'}{'directions'}{'Forward'};
$result_menus{'non_automatic_internal_top_node_up'}[0]{'associated_unit'}{'directions'}{'This'} = $result_menus{'non_automatic_internal_top_node_up'}[0]{'associated_unit'};
$result_menus{'non_automatic_internal_top_node_up'}[0]{'associated_unit'}{'tree_unit_directions'}{'next'} = $result_menus{'non_automatic_internal_top_node_up'}[0]{'associated_unit'}{'directions'}{'Forward'};
$result_menus{'non_automatic_internal_top_node_up'}[0]{'associated_unit'}{'unit_command'} = $result_menus{'non_automatic_internal_top_node_up'}[0];
$result_menus{'non_automatic_internal_top_node_up'}[1] = $result_menus{'non_automatic_internal_top_node_up'}[0]{'associated_unit'}{'directions'}{'Forward'}{'unit_command'};

$result_errors{'non_automatic_internal_top_node_up'} = [
  {
    'error_line' => 'Prev reference to nonexistent `@acronym{GNU, @acronym{GNU}\'s Not Unix} manuals\'
',
    'line_nr' => 1,
    'text' => 'Prev reference to nonexistent `@acronym{GNU, @acronym{GNU}\'s Not Unix} manuals\'',
    'type' => 'error'
  },
  {
    'error_line' => 'Up reference to nonexistent `@acronym{GNU, @acronym{GNU}\'s Not Unix} manuals\'
',
    'line_nr' => 1,
    'text' => 'Up reference to nonexistent `@acronym{GNU, @acronym{GNU}\'s Not Unix} manuals\'',
    'type' => 'error'
  },
  {
    'error_line' => 'Up reference to nonexistent `@acronym{GNU, @acronym{GNU}\'s Not Unix} manuals\'
',
    'line_nr' => 8,
    'text' => 'Up reference to nonexistent `@acronym{GNU, @acronym{GNU}\'s Not Unix} manuals\'',
    'type' => 'error'
  }
];


$result_floats{'non_automatic_internal_top_node_up'} = {};


$result_elements{'non_automatic_internal_top_node_up'} = [
  {
    'directions' => {
      'Forward' => {
        'directions' => {
          'Back' => {},
          'FastBack' => {},
          'NodeBack' => {},
          'NodePrev' => {},
          'This' => {}
        },
        'unit_command' => {
          'associated_unit' => {},
          'cmdname' => 'node',
          'extra' => {
            'menu_directions' => {
              'up' => {
                'associated_unit' => {},
                'cmdname' => 'node',
                'extra' => {
                  'normalized' => 'Top'
                }
              }
            },
            'normalized' => 'chap'
          }
        },
        'unit_type' => 'unit'
      },
      'NodeForward' => {},
      'NodeNext' => {},
      'This' => {}
    },
    'unit_command' => {},
    'unit_type' => 'unit'
  },
  {}
];
$result_elements{'non_automatic_internal_top_node_up'}[0]{'directions'}{'Forward'}{'directions'}{'Back'} = $result_elements{'non_automatic_internal_top_node_up'}[0];
$result_elements{'non_automatic_internal_top_node_up'}[0]{'directions'}{'Forward'}{'directions'}{'FastBack'} = $result_elements{'non_automatic_internal_top_node_up'}[0];
$result_elements{'non_automatic_internal_top_node_up'}[0]{'directions'}{'Forward'}{'directions'}{'NodeBack'} = $result_elements{'non_automatic_internal_top_node_up'}[0];
$result_elements{'non_automatic_internal_top_node_up'}[0]{'directions'}{'Forward'}{'directions'}{'NodePrev'} = $result_elements{'non_automatic_internal_top_node_up'}[0];
$result_elements{'non_automatic_internal_top_node_up'}[0]{'directions'}{'Forward'}{'directions'}{'This'} = $result_elements{'non_automatic_internal_top_node_up'}[0]{'directions'}{'Forward'};
$result_elements{'non_automatic_internal_top_node_up'}[0]{'directions'}{'Forward'}{'unit_command'}{'associated_unit'} = $result_elements{'non_automatic_internal_top_node_up'}[0]{'directions'}{'Forward'};
$result_elements{'non_automatic_internal_top_node_up'}[0]{'directions'}{'Forward'}{'unit_command'}{'extra'}{'menu_directions'}{'up'}{'associated_unit'} = $result_elements{'non_automatic_internal_top_node_up'}[0];
$result_elements{'non_automatic_internal_top_node_up'}[0]{'directions'}{'NodeForward'} = $result_elements{'non_automatic_internal_top_node_up'}[0]{'directions'}{'Forward'};
$result_elements{'non_automatic_internal_top_node_up'}[0]{'directions'}{'NodeNext'} = $result_elements{'non_automatic_internal_top_node_up'}[0]{'directions'}{'Forward'};
$result_elements{'non_automatic_internal_top_node_up'}[0]{'directions'}{'This'} = $result_elements{'non_automatic_internal_top_node_up'}[0];
$result_elements{'non_automatic_internal_top_node_up'}[0]{'unit_command'} = $result_elements{'non_automatic_internal_top_node_up'}[0]{'directions'}{'Forward'}{'unit_command'}{'extra'}{'menu_directions'}{'up'};
$result_elements{'non_automatic_internal_top_node_up'}[1] = $result_elements{'non_automatic_internal_top_node_up'}[0]{'directions'}{'Forward'};



$result_directions_text{'non_automatic_internal_top_node_up'} = 'output unit: @node Top
  This: @node Top
  Forward: @node chap
  NodeNext: @node chap
  NodeForward: @node chap
output unit: @node chap
  This: @node chap
  Back: @node Top
  FastBack: @node Top
  NodePrev: @node Top
  NodeBack: @node Top
';


$result_converted{'info'}->{'non_automatic_internal_top_node_up'} = 'This is , produced from .


File: ,  Node: Top,  Next: chap,  Up: @acronym{GNU, @acronym{GNU}\'s Not Unix} manuals

internal top node up
********************

* Menu:

* chap::


File: ,  Node: chap,  Prev: Top


Tag Table:
Node: Top27
Node: chap178

End Tag Table


Local Variables:
coding: utf-8
End:
';


$result_converted{'html'}->{'non_automatic_internal_top_node_up'} = '<!DOCTYPE html>
<html>
<!-- Created by texinfo, https://www.gnu.org/software/texinfo/ -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>internal top node up</title>

<meta name="description" content="internal top node up">
<meta name="keywords" content="internal top node up">
<meta name="resource-type" content="document">
<meta name="distribution" content="global">
<meta name="viewport" content="width=device-width,initial-scale=1">

<link href="#Top" rel="start" title="Top">
<style type="text/css">
<!--
a.copiable-link {visibility: hidden; text-decoration: none; line-height: 0em}
span:hover a.copiable-link {visibility: visible}
-->
</style>


</head>

<body lang="en">
<div class="top-level-extent" id="Top">
<div class="nav-panel">
<p>
Next: <a href="#chap" accesskey="n" rel="next">chap</a> &nbsp; </p>
</div>
<h1 class="top" id="internal-top-node-up"><span>internal top node up<a class="copiable-link" href="#internal-top-node-up"> &para;</a></span></h1>


<hr>
<a class="node-id" id="chap"></a><div class="nav-panel">
<p>
Previous: <a href="#Top" accesskey="p" rel="prev">internal top node up</a> &nbsp; </p>
</div>
<h4 class="node"><span>chap<a class="copiable-link" href="#chap"> &para;</a></span></h4>
</div>



</body>
</html>
';

1;
