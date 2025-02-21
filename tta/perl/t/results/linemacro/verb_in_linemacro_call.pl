use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'verb_in_linemacro_call'} = {
  'contents' => [
    {
      'contents' => [
        {
          'cmdname' => 'linemacro',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => ' mycommand {a, b, c, d}
',
                  'type' => 'macro_line'
                }
              ],
              'type' => 'arguments_line'
            },
            {
              'text' => 'first \\a\\
',
              'type' => 'raw'
            },
            {
              'text' => 'second \\b\\
',
              'type' => 'raw'
            },
            {
              'text' => 'third \\c\\
',
              'type' => 'raw'
            },
            {
              'text' => '@defline \\a\\ \\d\\
',
              'type' => 'raw'
            },
            {
              'cmdname' => 'end',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'linemacro'
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
                'text_arg' => 'linemacro'
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
          'extra' => {
            'macro_name' => 'mycommand',
            'misc_args' => [
              'a',
              'b',
              'c',
              'd'
            ]
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
          'cmdname' => 'defblock',
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
                      'source_marks' => [
                        {
                          'counter' => 1,
                          'element' => {
                            'contents' => [
                              {
                                'contents' => [
                                  {
                                    'text' => 'Name',
                                    'type' => 'bracketed_linemacro_arg'
                                  }
                                ],
                                'type' => 'line_arg'
                              },
                              {
                                'contents' => [
                                  {
                                    'text' => '@verb{: in verb :}'
                                  }
                                ],
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
                                    'text' => 'A @verb{| in bracketed |} ',
                                    'type' => 'bracketed_linemacro_arg'
                                  }
                                ],
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
                                    'text' => 'other {j}'
                                  }
                                ],
                                'info' => {
                                  'spaces_before_argument' => {
                                    'text' => ' '
                                  }
                                },
                                'type' => 'line_arg'
                              }
                            ],
                            'info' => {
                              'command_name' => 'mycommand',
                              'spaces_before_argument' => {
                                'text' => ' '
                              }
                            },
                            'type' => 'linemacro_call'
                          },
                          'sourcemark_type' => 'linemacro_expansion',
                          'status' => 'start'
                        }
                      ],
                      'text' => 'first Name
'
                    },
                    {
                      'text' => 'second '
                    },
                    {
                      'cmdname' => 'verb',
                      'contents' => [
                        {
                          'contents' => [
                            {
                              'text' => ' in verb ',
                              'type' => 'raw'
                            }
                          ],
                          'type' => 'brace_container'
                        }
                      ],
                      'info' => {
                        'delimiter' => ':'
                      },
                      'source_info' => {
                        'line_nr' => 9,
                        'macro' => 'mycommand'
                      }
                    },
                    {
                      'text' => '
'
                    },
                    {
                      'text' => 'third A '
                    },
                    {
                      'cmdname' => 'verb',
                      'contents' => [
                        {
                          'contents' => [
                            {
                              'text' => ' in bracketed ',
                              'type' => 'raw'
                            }
                          ],
                          'type' => 'brace_container'
                        }
                      ],
                      'info' => {
                        'delimiter' => '|'
                      },
                      'source_info' => {
                        'line_nr' => 9,
                        'macro' => 'mycommand'
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
              'type' => 'before_defline'
            },
            {
              'cmdname' => 'defline',
              'contents' => [
                {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'contents' => [
                            {
                              'text' => 'Name'
                            }
                          ],
                          'type' => 'def_line_arg'
                        }
                      ],
                      'type' => 'def_category'
                    },
                    {
                      'text' => ' ',
                      'type' => 'spaces'
                    },
                    {
                      'contents' => [
                        {
                          'contents' => [
                            {
                              'text' => 'other'
                            }
                          ],
                          'type' => 'def_line_arg'
                        }
                      ],
                      'type' => 'def_name'
                    },
                    {
                      'text' => ' ',
                      'type' => 'spaces'
                    },
                    {
                      'contents' => [
                        {
                          'contents' => [
                            {
                              'text' => 'j'
                            }
                          ],
                          'source_info' => {
                            'line_nr' => 9,
                            'macro' => 'mycommand'
                          },
                          'source_marks' => [
                            {
                              'counter' => 1,
                              'sourcemark_type' => 'linemacro_expansion',
                              'status' => 'end'
                            }
                          ],
                          'type' => 'bracketed_arg'
                        }
                      ],
                      'type' => 'def_arg'
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
                'def_command' => 'defline',
                'def_index_element' => {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'other'
                        }
                      ],
                      'type' => 'def_line_arg'
                    }
                  ],
                  'type' => 'def_name'
                },
                'original_def_cmdname' => 'defline'
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'line_nr' => 9,
                'macro' => 'mycommand'
              }
            },
            {
              'cmdname' => 'end',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'defblock'
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
                'text_arg' => 'defblock'
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
          'source_info' => {
            'line_nr' => 8
          }
        }
      ],
      'type' => 'before_node_section'
    }
  ],
  'type' => 'document_root'
};

$result_texis{'verb_in_linemacro_call'} = '@linemacro mycommand {a, b, c, d}
first \\a\\
second \\b\\
third \\c\\
@defline \\a\\ \\d\\
@end linemacro

@defblock
first Name
second @verb{: in verb :}
third A @verb{| in bracketed |} 
@defline Name other {j}
@end defblock
';


$result_texts{'verb_in_linemacro_call'} = '
first Name
second  in verb 
third A  in bracketed  
Name: other j
';

$result_errors{'verb_in_linemacro_call'} = [];


$result_floats{'verb_in_linemacro_call'} = {};


1;
