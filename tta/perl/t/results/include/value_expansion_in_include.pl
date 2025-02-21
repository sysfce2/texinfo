use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'value_expansion_in_include'} = {
  'contents' => [
    {
      'contents' => [
        {
          'cmdname' => 'set',
          'contents' => [
            {
              'text' => 'testvar',
              'type' => 'rawline_arg'
            },
            {
              'text' => 'incl-incl.txi',
              'type' => 'rawline_arg'
            }
          ],
          'info' => {
            'arg_line' => ' testvar incl-incl.txi
'
          }
        },
        {
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'cmdname' => 'c',
          'contents' => [
            {
              'text' => ' test - in the variable name, and concatenation of text after.
',
              'type' => 'rawline_arg'
            }
          ]
        },
        {
          'cmdname' => 'set',
          'contents' => [
            {
              'text' => 'test-var',
              'type' => 'rawline_arg'
            },
            {
              'text' => 'incl-incl.tx',
              'type' => 'rawline_arg'
            }
          ],
          'info' => {
            'arg_line' => ' test-var incl-incl.tx
'
          }
        },
        {
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'cmdname' => 'c',
          'contents' => [
            {
              'text' => ' test - in the variable name, and concatenation of text before and after.
',
              'type' => 'rawline_arg'
            }
          ]
        },
        {
          'cmdname' => 'set',
          'contents' => [
            {
              'text' => 'test_var',
              'type' => 'rawline_arg'
            },
            {
              'text' => 'ncl-incl.tx',
              'type' => 'rawline_arg'
            }
          ],
          'info' => {
            'arg_line' => ' test_var ncl-incl.tx
'
          }
        },
        {
          'text' => '
',
          'type' => 'empty_line'
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
        'line_nr' => 10
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
          'contents' => [
            {
              'source_marks' => [
                {
                  'counter' => 1,
                  'element' => {
                    'cmdname' => 'include',
                    'contents' => [
                      {
                        'contents' => [
                          {
                            'source_marks' => [
                              {
                                'counter' => 1,
                                'position' => 13,
                                'sourcemark_type' => 'value_expansion',
                                'status' => 'end'
                              }
                            ],
                            'text' => 'incl-incl.txi'
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
                      'text_arg' => 'incl-incl.txi'
                    },
                    'info' => {
                      'spaces_before_argument' => {
                        'source_marks' => [
                          {
                            'counter' => 1,
                            'element' => {
                              'cmdname' => 'value',
                              'contents' => [
                                {
                                  'contents' => [
                                    {
                                      'text' => 'testvar'
                                    }
                                  ],
                                  'type' => 'brace_container'
                                }
                              ]
                            },
                            'line' => 'incl-incl.txi',
                            'position' => 1,
                            'sourcemark_type' => 'value_expansion',
                            'status' => 'start'
                          }
                        ],
                        'text' => ' '
                      }
                    },
                    'source_info' => {
                      'line_nr' => 13
                    }
                  },
                  'position' => 17,
                  'sourcemark_type' => 'include',
                  'status' => 'start'
                }
              ],
              'text' => 'testvar include: '
            },
            {
              'text' => 'This is the '
            },
            {
              'cmdname' => 'emph',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'included'
                    }
                  ],
                  'type' => 'brace_container'
                }
              ],
              'source_info' => {
                'file_name' => 'incl-incl.txi',
                'line_nr' => 1
              }
            },
            {
              'source_marks' => [
                {
                  'counter' => 1,
                  'position' => 36,
                  'sourcemark_type' => 'include',
                  'status' => 'end'
                }
              ],
              'text' => ' file (include-value2.txi) <> ---. 
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
              'text' => 'testvar verbatiminclude: '
            }
          ],
          'type' => 'paragraph'
        },
        {
          'cmdname' => 'verbatiminclude',
          'contents' => [
            {
              'contents' => [
                {
                  'source_marks' => [
                    {
                      'counter' => 2,
                      'position' => 13,
                      'sourcemark_type' => 'value_expansion',
                      'status' => 'end'
                    }
                  ],
                  'text' => 'incl-incl.txi'
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
            'text_arg' => 'incl-incl.txi'
          },
          'info' => {
            'spaces_before_argument' => {
              'source_marks' => [
                {
                  'counter' => 2,
                  'element' => {
                    'cmdname' => 'value',
                    'contents' => [
                      {
                        'contents' => [
                          {
                            'text' => 'testvar'
                          }
                        ],
                        'type' => 'brace_container'
                      }
                    ]
                  },
                  'line' => 'incl-incl.txi',
                  'position' => 1,
                  'sourcemark_type' => 'value_expansion',
                  'status' => 'start'
                }
              ],
              'text' => ' '
            }
          },
          'source_info' => {
            'line_nr' => 15
          }
        },
        {
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'contents' => [
            {
              'source_marks' => [
                {
                  'counter' => 2,
                  'element' => {
                    'cmdname' => 'include',
                    'contents' => [
                      {
                        'contents' => [
                          {
                            'source_marks' => [
                              {
                                'counter' => 3,
                                'position' => 12,
                                'sourcemark_type' => 'value_expansion',
                                'status' => 'end'
                              }
                            ],
                            'text' => 'incl-incl.txi'
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
                      'text_arg' => 'incl-incl.txi'
                    },
                    'info' => {
                      'spaces_before_argument' => {
                        'source_marks' => [
                          {
                            'counter' => 3,
                            'element' => {
                              'cmdname' => 'value',
                              'contents' => [
                                {
                                  'contents' => [
                                    {
                                      'text' => 'test-var'
                                    }
                                  ],
                                  'type' => 'brace_container'
                                }
                              ]
                            },
                            'line' => 'incl-incl.tx',
                            'position' => 1,
                            'sourcemark_type' => 'value_expansion',
                            'status' => 'start'
                          }
                        ],
                        'text' => ' '
                      }
                    },
                    'source_info' => {
                      'line_nr' => 18
                    }
                  },
                  'position' => 18,
                  'sourcemark_type' => 'include',
                  'status' => 'start'
                }
              ],
              'text' => 'test-var include: '
            },
            {
              'text' => 'This is the '
            },
            {
              'cmdname' => 'emph',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'included'
                    }
                  ],
                  'type' => 'brace_container'
                }
              ],
              'source_info' => {
                'file_name' => 'incl-incl.txi',
                'line_nr' => 1
              }
            },
            {
              'source_marks' => [
                {
                  'counter' => 2,
                  'position' => 36,
                  'sourcemark_type' => 'include',
                  'status' => 'end'
                }
              ],
              'text' => ' file (include-value2.txi) <> ---. 
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
              'text' => 'test-var verbatiminclude: '
            }
          ],
          'type' => 'paragraph'
        },
        {
          'cmdname' => 'verbatiminclude',
          'contents' => [
            {
              'contents' => [
                {
                  'source_marks' => [
                    {
                      'counter' => 4,
                      'position' => 12,
                      'sourcemark_type' => 'value_expansion',
                      'status' => 'end'
                    }
                  ],
                  'text' => 'incl-incl.txi'
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
            'text_arg' => 'incl-incl.txi'
          },
          'info' => {
            'spaces_before_argument' => {
              'source_marks' => [
                {
                  'counter' => 4,
                  'element' => {
                    'cmdname' => 'value',
                    'contents' => [
                      {
                        'contents' => [
                          {
                            'text' => 'test-var'
                          }
                        ],
                        'type' => 'brace_container'
                      }
                    ]
                  },
                  'line' => 'incl-incl.tx',
                  'position' => 1,
                  'sourcemark_type' => 'value_expansion',
                  'status' => 'start'
                }
              ],
              'text' => ' '
            }
          },
          'source_info' => {
            'line_nr' => 20
          }
        },
        {
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'contents' => [
            {
              'source_marks' => [
                {
                  'counter' => 3,
                  'element' => {
                    'cmdname' => 'include',
                    'contents' => [
                      {
                        'contents' => [
                          {
                            'source_marks' => [
                              {
                                'counter' => 5,
                                'element' => {
                                  'cmdname' => 'value',
                                  'contents' => [
                                    {
                                      'contents' => [
                                        {
                                          'text' => 'test_var'
                                        }
                                      ],
                                      'type' => 'brace_container'
                                    }
                                  ]
                                },
                                'line' => 'ncl-incl.tx',
                                'position' => 1,
                                'sourcemark_type' => 'value_expansion',
                                'status' => 'start'
                              },
                              {
                                'counter' => 5,
                                'position' => 12,
                                'sourcemark_type' => 'value_expansion',
                                'status' => 'end'
                              }
                            ],
                            'text' => 'incl-incl.txi'
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
                      'text_arg' => 'incl-incl.txi'
                    },
                    'info' => {
                      'spaces_before_argument' => {
                        'text' => ' '
                      }
                    },
                    'source_info' => {
                      'line_nr' => 23
                    }
                  },
                  'position' => 18,
                  'sourcemark_type' => 'include',
                  'status' => 'start'
                }
              ],
              'text' => 'test_var include: '
            },
            {
              'text' => 'This is the '
            },
            {
              'cmdname' => 'emph',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'included'
                    }
                  ],
                  'type' => 'brace_container'
                }
              ],
              'source_info' => {
                'file_name' => 'incl-incl.txi',
                'line_nr' => 1
              }
            },
            {
              'source_marks' => [
                {
                  'counter' => 3,
                  'position' => 36,
                  'sourcemark_type' => 'include',
                  'status' => 'end'
                }
              ],
              'text' => ' file (include-value2.txi) <> ---. 
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
              'text' => 'test_var verbatiminclude: '
            }
          ],
          'type' => 'paragraph'
        },
        {
          'cmdname' => 'verbatiminclude',
          'contents' => [
            {
              'contents' => [
                {
                  'source_marks' => [
                    {
                      'counter' => 6,
                      'element' => {
                        'cmdname' => 'value',
                        'contents' => [
                          {
                            'contents' => [
                              {
                                'text' => 'test_var'
                              }
                            ],
                            'type' => 'brace_container'
                          }
                        ]
                      },
                      'line' => 'ncl-incl.tx',
                      'position' => 1,
                      'sourcemark_type' => 'value_expansion',
                      'status' => 'start'
                    },
                    {
                      'counter' => 6,
                      'position' => 12,
                      'sourcemark_type' => 'value_expansion',
                      'status' => 'end'
                    }
                  ],
                  'text' => 'incl-incl.txi'
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
            'text_arg' => 'incl-incl.txi'
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
        'is_target' => 1,
        'normalized' => 'chap'
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
  'type' => 'document_root'
};

$result_texis{'value_expansion_in_include'} = '@set testvar incl-incl.txi

@c test - in the variable name, and concatenation of text after.
@set test-var incl-incl.tx

@c test - in the variable name, and concatenation of text before and after.
@set test_var ncl-incl.tx


@node Top
@node chap

testvar include: This is the @emph{included} file (include-value2.txi) <> ---. 

testvar verbatiminclude: @verbatiminclude incl-incl.txi


test-var include: This is the @emph{included} file (include-value2.txi) <> ---. 

test-var verbatiminclude: @verbatiminclude incl-incl.txi


test_var include: This is the @emph{included} file (include-value2.txi) <> ---. 

test_var verbatiminclude: @verbatiminclude incl-incl.txi
';


$result_texts{'value_expansion_in_include'} = '




testvar include: This is the included file (include-value2.txi) <> --. 

testvar verbatiminclude: 

test-var include: This is the included file (include-value2.txi) <> --. 

test-var verbatiminclude: 

test_var include: This is the included file (include-value2.txi) <> --. 

test_var verbatiminclude: ';

$result_nodes{'value_expansion_in_include'} = [
  {
    'cmdname' => 'node',
    'extra' => {
      'node_directions' => {
        'next' => {
          'cmdname' => 'node',
          'extra' => {
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
$result_nodes{'value_expansion_in_include'}[0]{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'prev'} = $result_nodes{'value_expansion_in_include'}[0];
$result_nodes{'value_expansion_in_include'}[1] = $result_nodes{'value_expansion_in_include'}[0]{'extra'}{'node_directions'}{'next'};

$result_menus{'value_expansion_in_include'} = [
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

$result_errors{'value_expansion_in_include'} = [
  {
    'error_line' => 'warning: @include should only appear at the beginning of a line
',
    'line_nr' => 13,
    'text' => '@include should only appear at the beginning of a line',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: @verbatiminclude should only appear at the beginning of a line
',
    'line_nr' => 15,
    'text' => '@verbatiminclude should only appear at the beginning of a line',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: @include should only appear at the beginning of a line
',
    'line_nr' => 18,
    'text' => '@include should only appear at the beginning of a line',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: @verbatiminclude should only appear at the beginning of a line
',
    'line_nr' => 20,
    'text' => '@verbatiminclude should only appear at the beginning of a line',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: @include should only appear at the beginning of a line
',
    'line_nr' => 23,
    'text' => '@include should only appear at the beginning of a line',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: @verbatiminclude should only appear at the beginning of a line
',
    'line_nr' => 25,
    'text' => '@verbatiminclude should only appear at the beginning of a line',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: node `chap\' not in menu
',
    'line_nr' => 11,
    'text' => 'node `chap\' not in menu',
    'type' => 'warning'
  }
];


$result_floats{'value_expansion_in_include'} = {};


1;
