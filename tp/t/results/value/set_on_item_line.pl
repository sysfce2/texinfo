use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'set_on_item_line'} = {
  'contents' => [
    {
      'contents' => [
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
                        'line_nr' => 1
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
                              'cmdname' => 'set',
                              'contents' => [
                                {
                                  'text' => 'ca',
                                  'type' => 'rawline_arg'
                                },
                                {
                                  'text' => 'b',
                                  'type' => 'rawline_arg'
                                }
                              ],
                              'info' => {
                                'arg_line' => ' ca b@c
'
                              }
                            }
                          ],
                          'type' => 'line_arg'
                        }
                      ],
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
                  'type' => 'table_term'
                },
                {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'item text
'
                        },
                        {
                          'text' => 'in item
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
                              'text' => 'cjj '
                            },
                            {
                              'cmdname' => 'set',
                              'contents' => [
                                {
                                  'text' => 'cj',
                                  'type' => 'rawline_arg'
                                },
                                {
                                  'text' => '',
                                  'type' => 'rawline_arg'
                                }
                              ],
                              'info' => {
                                'arg_line' => ' cj@c
'
                              }
                            }
                          ],
                          'type' => 'line_arg'
                        }
                      ],
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
                  'type' => 'table_term'
                },
                {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'line
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
                              'text' => 'cvvv '
                            },
                            {
                              'cmdname' => 'set',
                              'contents' => [
                                {
                                  'text' => 'cg',
                                  'type' => 'rawline_arg'
                                },
                                {
                                  'text' => '',
                                  'type' => 'rawline_arg'
                                }
                              ],
                              'info' => {
                                'arg_line' => ' cg@c
'
                              }
                            }
                          ],
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
                'line_nr' => 8
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
            'line_nr' => 1
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
                              'cmdname' => 'set',
                              'contents' => [
                                {
                                  'text' => 'a',
                                  'type' => 'rawline_arg'
                                },
                                {
                                  'text' => 'b',
                                  'type' => 'rawline_arg'
                                }
                              ],
                              'info' => {
                                'arg_line' => ' a b
'
                              }
                            }
                          ],
                          'type' => 'line_arg'
                        }
                      ],
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
                  'type' => 'table_term'
                },
                {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'item text
'
                        },
                        {
                          'text' => 'in item
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
                              'text' => 'jj '
                            },
                            {
                              'cmdname' => 'set',
                              'contents' => [
                                {
                                  'text' => 'j',
                                  'type' => 'rawline_arg'
                                },
                                {
                                  'text' => '',
                                  'type' => 'rawline_arg'
                                }
                              ],
                              'info' => {
                                'arg_line' => ' j
'
                              }
                            }
                          ],
                          'type' => 'line_arg'
                        }
                      ],
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
                  'type' => 'table_term'
                },
                {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'line
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
                              'text' => 'vvv '
                            },
                            {
                              'cmdname' => 'set',
                              'contents' => [
                                {
                                  'text' => 'g',
                                  'type' => 'rawline_arg'
                                },
                                {
                                  'text' => '',
                                  'type' => 'rawline_arg'
                                }
                              ],
                              'info' => {
                                'arg_line' => ' g
'
                              }
                            }
                          ],
                          'type' => 'line_arg'
                        }
                      ],
                      'info' => {
                        'spaces_before_argument' => {
                          'text' => ' '
                        }
                      },
                      'source_info' => {
                        'line_nr' => 16
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
                'line_nr' => 17
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
            'line_nr' => 10
          }
        }
      ],
      'type' => 'before_node_section'
    }
  ],
  'type' => 'document_root'
};
$result_trees{'set_on_item_line'}{'contents'}[0]{'contents'}[0]{'extra'}{'command_as_argument'} = $result_trees{'set_on_item_line'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'contents'}[0]{'contents'}[0];
$result_trees{'set_on_item_line'}{'contents'}[0]{'contents'}[2]{'extra'}{'command_as_argument'} = $result_trees{'set_on_item_line'}{'contents'}[0]{'contents'}[2]{'contents'}[0]{'contents'}[0]{'contents'}[0];

$result_texis{'set_on_item_line'} = '@table @code
@item @set ca b@c
item text
in item
@item cjj @set cj@c
line
@item cvvv @set cg@c
@end table

@table @code
@item @set a b
item text
in item
@item jj @set j
line
@item vvv @set g
@end table
';


$result_texts{'set_on_item_line'} = '
item text
in item
cjj 
line
cvvv 


item text
in item
jj 
line
vvv 
';

$result_errors{'set_on_item_line'} = [
  {
    'error_line' => 'warning: @set should only appear at the beginning of a line
',
    'line_nr' => 2,
    'text' => '@set should only appear at the beginning of a line',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: @set should only appear at the beginning of a line
',
    'line_nr' => 5,
    'text' => '@set should only appear at the beginning of a line',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: @set should only appear at the beginning of a line
',
    'line_nr' => 7,
    'text' => '@set should only appear at the beginning of a line',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: @set should only appear at the beginning of a line
',
    'line_nr' => 11,
    'text' => '@set should only appear at the beginning of a line',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: @set should only appear at the beginning of a line
',
    'line_nr' => 14,
    'text' => '@set should only appear at the beginning of a line',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: @set should only appear at the beginning of a line
',
    'line_nr' => 16,
    'text' => '@set should only appear at the beginning of a line',
    'type' => 'warning'
  }
];


$result_floats{'set_on_item_line'} = {};


1;
