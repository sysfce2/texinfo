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
                                  'extra' => {
                                    'def_role' => 'category'
                                  },
                                  'text' => 'category'
                                },
                                {
                                  'extra' => {
                                    'def_role' => 'spaces'
                                  },
                                  'text' => ' ',
                                  'type' => 'spaces'
                                },
                                {
                                  'extra' => {
                                    'def_role' => 'name'
                                  },
                                  'text' => 'deffn_name'
                                },
                                {
                                  'extra' => {
                                    'def_role' => 'spaces'
                                  },
                                  'text' => ' ',
                                  'type' => 'spaces'
                                },
                                {
                                  'extra' => {
                                    'def_role' => 'arg'
                                  },
                                  'text' => 'arguments'
                                },
                                {
                                  'extra' => {
                                    'def_role' => 'spaces'
                                  },
                                  'text' => ' ',
                                  'type' => 'spaces'
                                },
                                {
                                  'extra' => {
                                    'def_role' => 'arg'
                                  },
                                  'text' => 'arg2'
                                },
                                {
                                  'extra' => {
                                    'def_role' => 'spaces'
                                  },
                                  'source_marks' => [
                                    {
                                      'counter' => 1,
                                      'location' => 'text',
                                      'position' => 1,
                                      'sourcemark_type' => 'defline_continuation'
                                    }
                                  ],
                                  'text' => '    ',
                                  'type' => 'spaces'
                                },
                                {
                                  'extra' => {
                                    'def_role' => 'arg'
                                  },
                                  'text' => 'more'
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
                                          'location' => 'text',
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
                                    'file_name' => '',
                                    'line_nr' => 3,
                                    'macro' => ''
                                  },
                                  'type' => 'bracketed_def_content'
                                },
                                {
                                  'extra' => {
                                    'def_role' => 'spaces'
                                  },
                                  'text' => ' ',
                                  'type' => 'spaces'
                                },
                                {
                                  'extra' => {
                                    'def_role' => 'arg'
                                  },
                                  'text' => 'with'
                                },
                                {
                                  'extra' => {
                                    'def_role' => 'spaces'
                                  },
                                  'text' => ' ',
                                  'type' => 'spaces'
                                },
                                {
                                  'extra' => {
                                    'def_role' => 'arg'
                                  },
                                  'text' => '3'
                                },
                                {
                                  'extra' => {
                                    'def_role' => 'spaces'
                                  },
                                  'text' => ' ',
                                  'type' => 'spaces'
                                },
                                {
                                  'cmdname' => '@',
                                  'extra' => {
                                    'def_role' => 'arg'
                                  }
                                },
                                {
                                  'extra' => {
                                    'def_role' => 'spaces'
                                  },
                                  'text' => ' ',
                                  'type' => 'spaces'
                                },
                                {
                                  'cmdname' => '@',
                                  'extra' => {
                                    'def_role' => 'arg'
                                  }
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
                                    'file_name' => '',
                                    'line_nr' => 5,
                                    'macro' => ''
                                  },
                                  'type' => 'bracketed_def_content'
                                }
                              ],
                              'info' => {
                                'spaces_after_argument' => '
'
                              },
                              'source_marks' => [
                                {
                                  'counter' => 3,
                                  'location' => 'content',
                                  'position' => 6,
                                  'sourcemark_type' => 'defline_continuation'
                                }
                              ],
                              'type' => 'block_line_arg'
                            }
                          ],
                          'extra' => {
                            'def_command' => 'deffn',
                            'def_parsed_hash' => {
                              'category' => {},
                              'name' => {}
                            },
                            'index_entry' => {
                              'content_normalized' => [
                                {}
                              ],
                              'entry_content' => [
                                {}
                              ],
                              'entry_element' => {},
                              'entry_number' => 1,
                              'in_code' => 1,
                              'index_at_command' => 'deffn',
                              'index_ignore_chars' => {},
                              'index_name' => 'fn',
                              'index_type_command' => 'deffn'
                            },
                            'original_def_cmdname' => 'deffn'
                          },
                          'source_info' => {
                            'file_name' => '',
                            'line_nr' => 2,
                            'macro' => ''
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
                                'spaces_after_argument' => '
'
                              },
                              'type' => 'line_arg'
                            }
                          ],
                          'cmdname' => 'end',
                          'extra' => {
                            'text_arg' => 'deffn'
                          },
                          'info' => {
                            'spaces_before_argument' => ' '
                          },
                          'source_info' => {
                            'file_name' => '',
                            'line_nr' => 7,
                            'macro' => ''
                          }
                        }
                      ],
                      'info' => {
                        'spaces_before_argument' => ' '
                      },
                      'source_info' => {
                        'file_name' => '',
                        'line_nr' => 2,
                        'macro' => ''
                      }
                    }
                  ],
                  'type' => 'brace_command_context'
                }
              ],
              'cmdname' => 'footnote',
              'info' => {
                'spaces_before_argument' => '
'
              },
              'source_info' => {
                'file_name' => '',
                'line_nr' => 1,
                'macro' => ''
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
$result_trees{'end_of_lines_protected_in_footnote'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'end_of_lines_protected_in_footnote'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0];
$result_trees{'end_of_lines_protected_in_footnote'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'end_of_lines_protected_in_footnote'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'end_of_lines_protected_in_footnote'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'contents'}[0]{'extra'}{'index_entry'}{'content_normalized'}[0] = $result_trees{'end_of_lines_protected_in_footnote'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'end_of_lines_protected_in_footnote'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'contents'}[0]{'extra'}{'index_entry'}{'entry_content'}[0] = $result_trees{'end_of_lines_protected_in_footnote'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'end_of_lines_protected_in_footnote'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'contents'}[0]{'extra'}{'index_entry'}{'entry_element'} = $result_trees{'end_of_lines_protected_in_footnote'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'contents'}[0];

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
    'file_name' => '',
    'line_nr' => 5,
    'macro' => '',
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
