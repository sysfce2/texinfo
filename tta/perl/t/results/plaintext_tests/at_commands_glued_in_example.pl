use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'at_commands_glued_in_example'} = {
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
              'contents' => [
                {
                  'text' => 'at'
                },
                {
                  'cmdname' => '@'
                },
                {
                  'text' => '.
'
                },
                {
                  'text' => 'TeX'
                },
                {
                  'cmdname' => 'TeX',
                  'contents' => [
                    {
                      'type' => 'brace_container'
                    }
                  ],
                  'source_info' => {
                    'line_nr' => 3
                  }
                },
                {
                  'text' => 'TeX.
'
                },
                {
                  'text' => 'code'
                },
                {
                  'cmdname' => 'code',
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'in code'
                        }
                      ],
                      'type' => 'brace_container'
                    }
                  ],
                  'source_info' => {
                    'line_nr' => 4
                  }
                },
                {
                  'text' => 'code.
'
                },
                {
                  'text' => 'acronym'
                },
                {
                  'cmdname' => 'acronym',
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'ABC'
                        }
                      ],
                      'type' => 'brace_arg'
                    },
                    {
                      'contents' => [
                        {
                          'text' => 'aaa bb cc'
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
                    'line_nr' => 5
                  }
                },
                {
                  'text' => 'acronym.
'
                },
                {
                  'text' => 'acronym2'
                },
                {
                  'cmdname' => 'acronym',
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'ABC'
                        }
                      ],
                      'type' => 'brace_arg'
                    }
                  ],
                  'source_info' => {
                    'line_nr' => 6
                  }
                },
                {
                  'text' => 'acronym.
'
                },
                {
                  'text' => 'email'
                },
                {
                  'cmdname' => 'email',
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'somebody'
                        }
                      ],
                      'type' => 'brace_arg'
                    },
                    {
                      'contents' => [
                        {
                          'text' => 'mali'
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
                    'line_nr' => 7
                  }
                },
                {
                  'text' => 'email.
'
                },
                {
                  'text' => 'ref'
                },
                {
                  'cmdname' => 'ref',
                  'contents' => [
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
                      'type' => 'brace_arg'
                    }
                  ],
                  'source_info' => {
                    'line_nr' => 8
                  }
                },
                {
                  'text' => 'ref.
'
                },
                {
                  'text' => 'Foornote'
                },
                {
                  'cmdname' => 'footnote',
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'contents' => [
                            {
                              'text' => 'in footnote'
                            }
                          ],
                          'type' => 'paragraph'
                        }
                      ],
                      'type' => 'brace_command_context'
                    }
                  ],
                  'extra' => {},
                  'source_info' => {
                    'line_nr' => 9
                  }
                },
                {
                  'text' => 'after footnote.
'
                },
                {
                  'text' => 'accent'
                },
                {
                  'cmdname' => '^',
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'cmdname' => 'dotless',
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
                            'line_nr' => 10
                          }
                        }
                      ],
                      'type' => 'brace_container'
                    }
                  ],
                  'source_info' => {
                    'line_nr' => 10
                  }
                },
                {
                  'text' => 'accent.
'
                },
                {
                  'text' => 'and star'
                },
                {
                  'cmdname' => '*'
                },
                {
                  'text' => 'star.
'
                },
                {
                  'text' => 'noindent'
                },
                {
                  'cmdname' => 'noindent',
                  'source_info' => {
                    'line_nr' => 12
                  }
                },
                {
                  'text' => ' ',
                  'type' => 'ignorable_spaces_after_command'
                },
                {
                  'text' => 'after noindent
'
                },
                {
                  'text' => 'sp'
                },
                {
                  'cmdname' => 'sp',
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => '4'
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
                      '4'
                    ]
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
                  'text' => 'anchor'
                },
                {
                  'cmdname' => 'anchor',
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'anchor'
                        }
                      ],
                      'type' => 'brace_arg'
                    }
                  ],
                  'extra' => {
                    'is_target' => 1,
                    'normalized' => 'anchor'
                  },
                  'source_info' => {
                    'line_nr' => 14
                  }
                },
                {
                  'text' => 'anchor
'
                },
                {
                  'text' => 'index'
                },
                {
                  'cmdname' => 'cindex',
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'index'
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
                    'line_nr' => 15
                  },
                  'type' => 'index_entry_command'
                }
              ],
              'type' => 'preformatted'
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
                'line_nr' => 16
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
$result_trees{'at_commands_glued_in_example'}{'contents'}[0]{'contents'}[0]{'contents'}[1]{'contents'}[19]{'contents'}[0]{'extra'}{'node_content'}{'contents'}[0] = $result_trees{'at_commands_glued_in_example'}{'contents'}[0]{'contents'}[0]{'contents'}[1]{'contents'}[19]{'contents'}[0]{'contents'}[0];

$result_texis{'at_commands_glued_in_example'} = '@example
at@@.
TeX@TeX{}TeX.
code@code{in code}code.
acronym@acronym{ABC, aaa bb cc}acronym.
acronym2@acronym{ABC}acronym.
email@email{somebody, mali}email.
ref@ref{Top}ref.
Foornote@footnote{in footnote}after footnote.
accent@^{@dotless{i}}accent.
and star@*star.
noindent@noindent after noindent
sp@sp 4
anchor@anchor{anchor}anchor
index@cindex index
@end example
';


$result_texts{'at_commands_glued_in_example'} = 'at@.
TeXTeXTeX.
codein codecode.
acronymABC (aaa bb cc)acronym.
acronym2ABCacronym.
emailmaliemail.
refTopref.
Foornoteafter footnote.
accenti^accent.
and star
star.
noindentafter noindent
sp



anchoranchor
index';

$result_errors{'at_commands_glued_in_example'} = [
  {
    'error_line' => 'warning: @sp should only appear at the beginning of a line
',
    'line_nr' => 13,
    'text' => '@sp should only appear at the beginning of a line',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: @cindex should only appear at the beginning of a line
',
    'line_nr' => 15,
    'text' => '@cindex should only appear at the beginning of a line',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: entry for index `cp\' outside of any node
',
    'line_nr' => 15,
    'text' => 'entry for index `cp\' outside of any node',
    'type' => 'warning'
  },
  {
    'error_line' => '@ref reference to nonexistent node `Top\'
',
    'line_nr' => 8,
    'text' => '@ref reference to nonexistent node `Top\'',
    'type' => 'error'
  }
];


$result_floats{'at_commands_glued_in_example'} = {};


$result_indices_sort_strings{'at_commands_glued_in_example'} = {
  'cp' => [
    'index'
  ]
};



$result_converted{'plaintext'}->{'at_commands_glued_in_example'} = '     at@.
     TeXTeXTeX.
     codein codecode.
     acronymABC (aaa bb cc)acronym.
     acronym2ABCacronym.
     emailmali <somebody>email.
     refTopref.
     Foornote(1)after footnote.
     accentîaccent.
     and star
     star.
     noindentafter noindent
     sp



     anchoranchor
     index

   ---------- Footnotes ----------

   (1) in footnote

';

1;
