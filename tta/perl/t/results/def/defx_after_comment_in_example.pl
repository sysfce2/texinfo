use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'defx_after_comment_in_example'} = {
  'contents' => [
    {
      'contents' => [
        {
          'cmdname' => 'example',
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
              'cmdname' => 'deffn',
              'contents' => [
                {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'contents' => [
                            {
                              'contents' => [
                                {
                                  'text' => 'fset'
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
                                  'cmdname' => 'var',
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
                                    'line_nr' => 2
                                  }
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
                                  'text' => 'a'
                                }
                              ],
                              'type' => 'def_line_arg'
                            }
                          ],
                          'type' => 'def_arg'
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
                                  'text' => 'g'
                                }
                              ],
                              'type' => 'def_line_arg'
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
                      'type' => 'block_line_arg'
                    }
                  ],
                  'extra' => {
                    'def_command' => 'deffn',
                    'def_index_element' => {
                      'contents' => [
                        {
                          'contents' => [
                            {
                              'cmdname' => 'var',
                              'contents' => [
                                {
                                  'contents' => [
                                    {
                                      'text' => 'i'
                                    }
                                  ],
                                  'type' => 'brace_container'
                                }
                              ]
                            }
                          ],
                          'type' => 'def_line_arg'
                        }
                      ],
                      'type' => 'def_name'
                    },
                    'index_entry' => [
                      'fn',
                      1
                    ],
                    'original_def_cmdname' => 'deffn'
                  },
                  'source_info' => {
                    'line_nr' => 2
                  },
                  'type' => 'def_line'
                },
                {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'cmdname' => 'c',
                          'contents' => [
                            {
                              'text' => ' comment
',
                              'type' => 'rawline_arg'
                            }
                          ]
                        }
                      ],
                      'type' => 'preformatted'
                    }
                  ],
                  'type' => 'inter_def_item'
                },
                {
                  'cmdname' => 'deffnx',
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'contents' => [
                            {
                              'contents' => [
                                {
                                  'text' => 'truc'
                                }
                              ],
                              'source_info' => {
                                'line_nr' => 4
                              },
                              'type' => 'bracketed_arg'
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
                                  'text' => 'bidulr'
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
                                  'text' => 'machin...'
                                }
                              ],
                              'type' => 'def_line_arg'
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
                    'def_command' => 'deffn',
                    'def_index_element' => {
                      'contents' => [
                        {
                          'contents' => [
                            {
                              'text' => 'bidulr'
                            }
                          ],
                          'type' => 'def_line_arg'
                        }
                      ],
                      'type' => 'def_name'
                    },
                    'index_entry' => [
                      'fn',
                      2
                    ],
                    'original_def_cmdname' => 'deffnx'
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
                  'cmdname' => 'end',
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'deffn'
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
                    'text_arg' => 'deffn'
                  },
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
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'line_nr' => 2
              }
            },
            {
              'cmdname' => 'end',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'example'
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
                'text_arg' => 'example'
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
            'line_nr' => 1
          }
        }
      ],
      'type' => 'before_node_section'
    }
  ],
  'type' => 'document_root'
};

$result_texis{'defx_after_comment_in_example'} = '@example
@deffn fset @var{i} a g
@c comment
@deffnx {truc} bidulr machin...
@end deffn
@end example
';


$result_texts{'defx_after_comment_in_example'} = 'fset: i a g
truc: bidulr machin...
';

$result_errors{'defx_after_comment_in_example'} = [
  {
    'error_line' => 'warning: entry for index `fn\' outside of any node
',
    'line_nr' => 2,
    'text' => 'entry for index `fn\' outside of any node',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: entry for index `fn\' outside of any node
',
    'line_nr' => 4,
    'text' => 'entry for index `fn\' outside of any node',
    'type' => 'warning'
  }
];


$result_floats{'defx_after_comment_in_example'} = {};


$result_indices_sort_strings{'defx_after_comment_in_example'} = {
  'fn' => [
    'bidulr',
    'i'
  ]
};



$result_converted{'plaintext'}->{'defx_after_comment_in_example'} = '      -- fset: I a g
      -- truc: bidulr machin...
';

1;
