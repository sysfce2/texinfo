use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'end_of_lines_protected_in_footnote'} = {
  'contents' => [
    {
      'contents' => [
        {
          'contents' => [
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'cmdname' => 'deffn',
                      'contents' => [
                        {
                          'args' => [
                            {
                              'contents' => [
                                {
                                  'contents' => [
                                    {
                                      'text' => 'category'
                                    }
                                  ],
                                  'extra' => {
                                    'def_role' => 'category'
                                  },
                                  'type' => 'def_aggregate'
                                },
                                {
                                  'extra' => {
                                    'def_role' => 'spaces'
                                  },
                                  'text' => ' ',
                                  'type' => 'spaces'
                                },
                                {
                                  'contents' => [
                                    {
                                      'text' => 'deffn_name'
                                    }
                                  ],
                                  'extra' => {
                                    'def_role' => 'name'
                                  },
                                  'type' => 'def_aggregate'
                                },
                                {
                                  'extra' => {
                                    'def_role' => 'spaces'
                                  },
                                  'text' => ' ',
                                  'type' => 'spaces'
                                },
                                {
                                  'contents' => [
                                    {
                                      'text' => 'arguments'
                                    }
                                  ],
                                  'extra' => {
                                    'def_role' => 'arg'
                                  },
                                  'type' => 'def_aggregate'
                                },
                                {
                                  'extra' => {
                                    'def_role' => 'spaces'
                                  },
                                  'text' => ' ',
                                  'type' => 'spaces'
                                },
                                {
                                  'contents' => [
                                    {
                                      'text' => 'arg2'
                                    }
                                  ],
                                  'extra' => {
                                    'def_role' => 'arg'
                                  },
                                  'type' => 'def_aggregate'
                                },
                                {
                                  'extra' => {
                                    'def_role' => 'spaces'
                                  },
                                  'source_marks' => [
                                    {
                                      'counter' => 1,
                                      'position' => 1,
                                      'sourcemark_type' => 'defline_continuation'
                                    }
                                  ],
                                  'text' => '    ',
                                  'type' => 'spaces'
                                },
                                {
                                  'contents' => [
                                    {
                                      'text' => 'more'
                                    }
                                  ],
                                  'extra' => {
                                    'def_role' => 'arg'
                                  },
                                  'type' => 'def_aggregate'
                                },
                                {
                                  'extra' => {
                                    'def_role' => 'spaces'
                                  },
                                  'text' => ' ',
                                  'type' => 'spaces'
                                },
                                {
                                  'contents' => [
                                    {
                                      'source_marks' => [
                                        {
                                          'counter' => 2,
                                          'position' => 5,
                                          'sourcemark_type' => 'defline_continuation'
                                        }
                                      ],
                                      'text' => 'args   with end of line within'
                                    }
                                  ],
                                  'extra' => {
                                    'def_role' => 'arg'
                                  },
                                  'source_info' => {
                                    'line_nr' => 3
                                  },
                                  'type' => 'bracketed_arg'
                                },
                                {
                                  'extra' => {
                                    'def_role' => 'spaces'
                                  },
                                  'text' => ' ',
                                  'type' => 'spaces'
                                },
                                {
                                  'contents' => [
                                    {
                                      'text' => 'with'
                                    }
                                  ],
                                  'extra' => {
                                    'def_role' => 'arg'
                                  },
                                  'type' => 'def_aggregate'
                                },
                                {
                                  'extra' => {
                                    'def_role' => 'spaces'
                                  },
                                  'text' => ' ',
                                  'type' => 'spaces'
                                },
                                {
                                  'contents' => [
                                    {
                                      'text' => '3'
                                    }
                                  ],
                                  'extra' => {
                                    'def_role' => 'arg'
                                  },
                                  'type' => 'def_aggregate'
                                },
                                {
                                  'extra' => {
                                    'def_role' => 'spaces'
                                  },
                                  'text' => ' ',
                                  'type' => 'spaces'
                                },
                                {
                                  'contents' => [
                                    {
                                      'cmdname' => '@'
                                    }
                                  ],
                                  'extra' => {
                                    'def_role' => 'arg'
                                  },
                                  'type' => 'def_aggregate'
                                },
                                {
                                  'extra' => {
                                    'def_role' => 'spaces'
                                  },
                                  'text' => ' ',
                                  'type' => 'spaces'
                                },
                                {
                                  'contents' => [
                                    {
                                      'cmdname' => '@',
                                      'source_marks' => [
                                        {
                                          'counter' => 3,
                                          'sourcemark_type' => 'defline_continuation'
                                        }
                                      ]
                                    }
                                  ],
                                  'extra' => {
                                    'def_role' => 'arg'
                                  },
                                  'type' => 'def_aggregate'
                                },
                                {
                                  'extra' => {
                                    'def_role' => 'spaces'
                                  },
                                  'text' => ' ',
                                  'type' => 'spaces'
                                },
                                {
                                  'contents' => [
                                    {
                                      'text' => 'one last arg'
                                    }
                                  ],
                                  'extra' => {
                                    'def_role' => 'arg'
                                  },
                                  'source_info' => {
                                    'line_nr' => 5
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
                          'extra' => {
                            'def_command' => 'deffn',
                            'def_index_element' => {},
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
                                  'text' => 'deffn
'
                                }
                              ],
                              'type' => 'paragraph'
                            }
                          ],
                          'type' => 'def_item'
                        },
                        {
                          'args' => [
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
                          'cmdname' => 'end',
                          'extra' => {
                            'text_arg' => 'deffn'
                          },
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
                  'type' => 'brace_command_context'
                }
              ],
              'cmdname' => 'footnote',
              'extra' => {},
              'info' => {
                'spaces_before_argument' => {
                  'text' => '
'
                }
              },
              'source_info' => {
                'line_nr' => 1
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
      'type' => 'before_node_section'
    }
  ],
  'type' => 'document_root'
};
$result_trees{'end_of_lines_protected_in_footnote'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'contents'}[0]{'extra'}{'def_index_element'} = $result_trees{'end_of_lines_protected_in_footnote'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2];

$result_texis{'end_of_lines_protected_in_footnote'} = '@footnote{
@deffn category deffn_name arguments arg2    more {args   with end of line within} with 3 @@ @@ {one last arg}
deffn
@end deffn
}
';


$result_texts{'end_of_lines_protected_in_footnote'} = '
';

$result_errors{'end_of_lines_protected_in_footnote'} = [
  {
    'error_line' => 'warning: entry for index `fn\' outside of any node
',
    'line_nr' => 5,
    'text' => 'entry for index `fn\' outside of any node',
    'type' => 'warning'
  }
];


$result_floats{'end_of_lines_protected_in_footnote'} = {};


$result_indices_sort_strings{'end_of_lines_protected_in_footnote'} = {
  'fn' => [
    'deffn_name'
  ]
};



$result_converted{'plaintext'}->{'end_of_lines_protected_in_footnote'} = '(1)

   ---------- Footnotes ----------

   (1)  -- category: deffn_name arguments arg2 more args with end of
          line within with 3 @ @ one last arg
     deffn

';

1;
