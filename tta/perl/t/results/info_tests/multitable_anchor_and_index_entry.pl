use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'multitable_anchor_and_index_entry'} = {
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
        },
        {
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'cmdname' => 'multitable',
          'contents' => [
            {
              'contents' => [
                {
                  'contents' => [
                    {
                      'cmdname' => 'columnfractions',
                      'contents' => [
                        {
                          'contents' => [
                            {
                              'text' => '0.4 0.6'
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
                          '0.4',
                          '0.6'
                        ]
                      },
                      'info' => {
                        'spaces_before_argument' => {
                          'text' => ' '
                        }
                      },
                      'source_info' => {
                        'line_nr' => 3
                      }
                    }
                  ],
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
                      'cmdname' => 'headitem',
                      'contents' => [
                        {
                          'text' => ' ',
                          'type' => 'ignorable_spaces_after_command'
                        },
                        {
                          'contents' => [
                            {
                              'text' => 'mu--ltitable headitem '
                            }
                          ],
                          'type' => 'paragraph'
                        }
                      ],
                      'extra' => {
                        'cell_number' => 1
                      },
                      'source_info' => {
                        'line_nr' => 4
                      }
                    },
                    {
                      'cmdname' => 'tab',
                      'contents' => [
                        {
                          'text' => ' ',
                          'type' => 'ignorable_spaces_after_command'
                        },
                        {
                          'contents' => [
                            {
                              'text' => 'another tab
'
                            }
                          ],
                          'type' => 'paragraph'
                        }
                      ],
                      'extra' => {
                        'cell_number' => 2
                      },
                      'source_info' => {
                        'line_nr' => 4
                      }
                    }
                  ],
                  'extra' => {
                    'row_number' => 1
                  },
                  'type' => 'row'
                }
              ],
              'type' => 'multitable_head'
            },
            {
              'contents' => [
                {
                  'contents' => [
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
                              'text' => 'mu--ltitable item '
                            }
                          ],
                          'type' => 'paragraph'
                        }
                      ],
                      'extra' => {
                        'cell_number' => 1
                      },
                      'source_info' => {
                        'line_nr' => 5
                      }
                    },
                    {
                      'cmdname' => 'tab',
                      'contents' => [
                        {
                          'text' => ' ',
                          'type' => 'ignorable_spaces_after_command'
                        },
                        {
                          'contents' => [
                            {
                              'text' => 'multitable tab
'
                            },
                            {
                              'cmdname' => 'c',
                              'contents' => [
                                {
                                  'text' => ' comment in multitable
',
                                  'type' => 'rawline_arg'
                                }
                              ]
                            }
                          ],
                          'type' => 'paragraph'
                        }
                      ],
                      'extra' => {
                        'cell_number' => 2
                      },
                      'source_info' => {
                        'line_nr' => 5
                      }
                    }
                  ],
                  'extra' => {
                    'row_number' => 2
                  },
                  'type' => 'row'
                },
                {
                  'contents' => [
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
                              'text' => 'mu--ltitable item 2 '
                            }
                          ],
                          'type' => 'paragraph'
                        }
                      ],
                      'extra' => {
                        'cell_number' => 1
                      },
                      'source_info' => {
                        'line_nr' => 7
                      }
                    },
                    {
                      'cmdname' => 'tab',
                      'contents' => [
                        {
                          'text' => ' ',
                          'type' => 'ignorable_spaces_after_command'
                        },
                        {
                          'contents' => [
                            {
                              'text' => 'multitable tab 2
'
                            },
                            {
                              'cmdname' => 'cindex',
                              'contents' => [
                                {
                                  'contents' => [
                                    {
                                      'text' => 'index entry within multitable'
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
                                'line_nr' => 8
                              },
                              'type' => 'index_entry_command'
                            },
                            {
                              'cmdname' => 'anchor',
                              'contents' => [
                                {
                                  'contents' => [
                                    {
                                      'text' => 'anchor in multitable'
                                    }
                                  ],
                                  'type' => 'brace_arg'
                                }
                              ],
                              'extra' => {
                                'is_target' => 1,
                                'normalized' => 'anchor-in-multitable'
                              },
                              'source_info' => {
                                'line_nr' => 9
                              }
                            },
                            {
                              'text' => '
',
                              'type' => 'spaces_after_close_brace'
                            }
                          ],
                          'type' => 'paragraph'
                        }
                      ],
                      'extra' => {
                        'cell_number' => 2
                      },
                      'source_info' => {
                        'line_nr' => 7
                      }
                    }
                  ],
                  'extra' => {
                    'row_number' => 3
                  },
                  'type' => 'row'
                },
                {
                  'contents' => [
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
                              'text' => 'lone mu--ltitable item
'
                            }
                          ],
                          'type' => 'paragraph'
                        }
                      ],
                      'extra' => {
                        'cell_number' => 1
                      },
                      'source_info' => {
                        'line_nr' => 10
                      }
                    }
                  ],
                  'extra' => {
                    'row_number' => 4
                  },
                  'type' => 'row'
                }
              ],
              'type' => 'multitable_body'
            },
            {
              'cmdname' => 'end',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'multitable'
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
                'text_arg' => 'multitable'
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'line_nr' => 11
              }
            }
          ],
          'extra' => {
            'columnfractions' => {},
            'max_columns' => 2
          },
          'info' => {
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'line_nr' => 3
          }
        },
        {
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'cmdname' => 'multitable',
          'contents' => [
            {
              'contents' => [
                {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'A'
                        }
                      ],
                      'source_info' => {
                        'line_nr' => 13
                      },
                      'type' => 'bracketed_arg'
                    },
                    {
                      'text' => ' '
                    },
                    {
                      'contents' => [
                        {
                          'text' => 'B'
                        }
                      ],
                      'source_info' => {
                        'line_nr' => 13
                      },
                      'type' => 'bracketed_arg'
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
                          'text' => ' ',
                          'type' => 'ignorable_spaces_after_command'
                        },
                        {
                          'contents' => [
                            {
                              'text' => 'A
'
                            },
                            {
                              'text' => 'B
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
                          'contents' => [
                            {
                              'text' => 'C
'
                            }
                          ],
                          'type' => 'paragraph'
                        }
                      ],
                      'extra' => {
                        'cell_number' => 1
                      },
                      'source_info' => {
                        'line_nr' => 14
                      }
                    },
                    {
                      'cmdname' => 'tab',
                      'contents' => [
                        {
                          'text' => ' ',
                          'type' => 'ignorable_spaces_after_command'
                        },
                        {
                          'contents' => [
                            {
                              'text' => 'G
'
                            }
                          ],
                          'type' => 'paragraph'
                        }
                      ],
                      'extra' => {
                        'cell_number' => 2
                      },
                      'source_info' => {
                        'line_nr' => 18
                      }
                    }
                  ],
                  'extra' => {
                    'row_number' => 1
                  },
                  'type' => 'row'
                },
                {
                  'contents' => [
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
                              'text' => 'lsfd mlkdsf lk s
'
                            },
                            {
                              'text' => 'mlsdmjlfdsjm mdsfk 
'
                            },
                            {
                              'cmdname' => 'cindex',
                              'contents' => [
                                {
                                  'contents' => [
                                    {
                                      'text' => 'index entry'
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
                                'line_nr' => 21
                              },
                              'type' => 'index_entry_command'
                            }
                          ],
                          'type' => 'paragraph'
                        }
                      ],
                      'extra' => {
                        'cell_number' => 1
                      },
                      'source_info' => {
                        'line_nr' => 19
                      }
                    }
                  ],
                  'extra' => {
                    'row_number' => 2
                  },
                  'type' => 'row'
                },
                {
                  'contents' => [
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
                              'text' => 'lsfd2 mlkdsf2 lk2 s2
'
                            },
                            {
                              'text' => 'mlsdmjlfdsjm mdsfk2
'
                            }
                          ],
                          'type' => 'paragraph'
                        }
                      ],
                      'extra' => {
                        'cell_number' => 1
                      },
                      'source_info' => {
                        'line_nr' => 22
                      }
                    },
                    {
                      'cmdname' => 'tab',
                      'contents' => [
                        {
                          'text' => ' ',
                          'type' => 'ignorable_spaces_after_command'
                        },
                        {
                          'contents' => [
                            {
                              'text' => 'ATTTTTTTTTTTTTTTTTTTTT
'
                            },
                            {
                              'text' => 'BTTTTTTt '
                            },
                            {
                              'cmdname' => 'anchor',
                              'contents' => [
                                {
                                  'contents' => [
                                    {
                                      'text' => 'mark'
                                    }
                                  ],
                                  'type' => 'brace_arg'
                                }
                              ],
                              'extra' => {
                                'is_target' => 1,
                                'normalized' => 'mark'
                              },
                              'source_info' => {
                                'line_nr' => 25
                              }
                            },
                            {
                              'text' => '
',
                              'type' => 'spaces_after_close_brace'
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
                          'contents' => [
                            {
                              'text' => 'CTTTTTT
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
                      'extra' => {
                        'cell_number' => 2
                      },
                      'source_info' => {
                        'line_nr' => 24
                      }
                    }
                  ],
                  'extra' => {
                    'row_number' => 3
                  },
                  'type' => 'row'
                }
              ],
              'type' => 'multitable_body'
            },
            {
              'cmdname' => 'end',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'multitable'
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
                'text_arg' => 'multitable'
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'line_nr' => 29
              }
            }
          ],
          'extra' => {
            'max_columns' => 2
          },
          'info' => {
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'line_nr' => 13
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
            'line_nr' => 31
          }
        },
        {
          'contents' => [
            {
              'cmdname' => 'ref',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'mark'
                    }
                  ],
                  'extra' => {
                    'node_content' => {
                      'contents' => [
                        {}
                      ]
                    },
                    'normalized' => 'mark'
                  },
                  'type' => 'brace_arg'
                }
              ],
              'source_info' => {
                'line_nr' => 32
              }
            },
            {
              'text' => '
'
            },
            {
              'cmdname' => 'ref',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'anchor in multitable'
                    }
                  ],
                  'extra' => {
                    'node_content' => {
                      'contents' => [
                        {}
                      ]
                    },
                    'normalized' => 'anchor-in-multitable'
                  },
                  'type' => 'brace_arg'
                }
              ],
              'source_info' => {
                'line_nr' => 33
              }
            },
            {
              'text' => '
'
            }
          ],
          'type' => 'paragraph'
        }
      ],
      'extra' => {
        'is_target' => 1,
        'isindex' => 1,
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
    }
  ],
  'type' => 'document_root'
};
$result_trees{'multitable_anchor_and_index_entry'}{'contents'}[1]{'contents'}[2]{'contents'}[2]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'extra'}{'element_node'} = $result_trees{'multitable_anchor_and_index_entry'}{'contents'}[1];
$result_trees{'multitable_anchor_and_index_entry'}{'contents'}[1]{'contents'}[2]{'extra'}{'columnfractions'} = $result_trees{'multitable_anchor_and_index_entry'}{'contents'}[1]{'contents'}[2]{'contents'}[0]{'contents'}[0]{'contents'}[0];
$result_trees{'multitable_anchor_and_index_entry'}{'contents'}[1]{'contents'}[4]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'contents'}[1]{'contents'}[2]{'extra'}{'element_node'} = $result_trees{'multitable_anchor_and_index_entry'}{'contents'}[1];
$result_trees{'multitable_anchor_and_index_entry'}{'contents'}[1]{'contents'}[7]{'contents'}[0]{'contents'}[0]{'extra'}{'node_content'}{'contents'}[0] = $result_trees{'multitable_anchor_and_index_entry'}{'contents'}[1]{'contents'}[7]{'contents'}[0]{'contents'}[0]{'contents'}[0];
$result_trees{'multitable_anchor_and_index_entry'}{'contents'}[1]{'contents'}[7]{'contents'}[2]{'contents'}[0]{'extra'}{'node_content'}{'contents'}[0] = $result_trees{'multitable_anchor_and_index_entry'}{'contents'}[1]{'contents'}[7]{'contents'}[2]{'contents'}[0]{'contents'}[0];

$result_texis{'multitable_anchor_and_index_entry'} = '@node Top

@multitable @columnfractions 0.4 0.6
@headitem mu--ltitable headitem @tab another tab
@item mu--ltitable item @tab multitable tab
@c comment in multitable
@item mu--ltitable item 2 @tab multitable tab 2
@cindex index entry within multitable
@anchor{anchor in multitable}
@item lone mu--ltitable item
@end multitable

@multitable {A} {B}
@item A
B

C
@tab G
@item lsfd mlkdsf lk s
mlsdmjlfdsjm mdsfk 
@cindex index entry
@item lsfd2 mlkdsf2 lk2 s2
mlsdmjlfdsjm mdsfk2
@tab ATTTTTTTTTTTTTTTTTTTTT
BTTTTTTt @anchor{mark}

CTTTTTT

@end multitable

@printindex cp
@ref{mark}
@ref{anchor in multitable}
';


$result_texts{'multitable_anchor_and_index_entry'} = '
mu-ltitable headitem another tab
mu-ltitable item multitable tab
mu-ltitable item 2 multitable tab 2
lone mu-ltitable item

A
B

C
G
lsfd mlkdsf lk s
mlsdmjlfdsjm mdsfk 
lsfd2 mlkdsf2 lk2 s2
mlsdmjlfdsjm mdsfk2
ATTTTTTTTTTTTTTTTTTTTT
BTTTTTTt 
CTTTTTT


mark
anchor in multitable
';

$result_nodes{'multitable_anchor_and_index_entry'} = [
  {
    'cmdname' => 'node',
    'extra' => {
      'isindex' => 1,
      'normalized' => 'Top'
    }
  }
];

$result_menus{'multitable_anchor_and_index_entry'} = [
  {
    'extra' => {
      'normalized' => 'Top'
    }
  }
];

$result_errors{'multitable_anchor_and_index_entry'} = [];


$result_floats{'multitable_anchor_and_index_entry'} = {};


$result_indices_sort_strings{'multitable_anchor_and_index_entry'} = {
  'cp' => [
    'index entry',
    'index entry within multitable'
  ]
};



$result_converted{'info'}->{'multitable_anchor_and_index_entry'} = 'This is , produced from .


File: ,  Node: Top,  Up: (dir)

mu-ltitable headitem          another tab
--------------------------------------------------------------------------
mu-ltitable item              multitable tab
mu-ltitable item 2            multitable tab 2
lone mu-ltitable item

A   G
B

C
lsfd
mlkdsf
lk
s
mlsdmjlfdsjm
mdsfk
lsfd2ATTTTTTTTTTTTTTTTTTTTT
mlkdsf2BTTTTTTt
lk2 
s2  CTTTTTT
mlsdmjlfdsjm
mdsfk2

 [index ]
* Menu:

* index entry:                           Top.                  (line 19)
* index entry within multitable:         Top.                  (line  6)

   *note mark:: *note anchor in multitable::


Tag Table:
Node: Top27
Ref: anchor in multitable269
Ref: mark388

End Tag Table


Local Variables:
coding: utf-8
End:
';

1;
