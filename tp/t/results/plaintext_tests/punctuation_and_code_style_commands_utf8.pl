use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'punctuation_and_code_style_commands_utf8'} = {
  'contents' => [
    {
      'contents' => [
        {
          'args' => [
            {
              'contents' => [
                {
                  'text' => 'utf-8'
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
          'cmdname' => 'documentencoding',
          'extra' => {
            'input_encoding_name' => 'utf-8',
            'text_arg' => 'utf-8'
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
          'contents' => [
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'text' => 'aaa'
                    }
                  ],
                  'type' => 'brace_container'
                }
              ],
              'cmdname' => 'command',
              'source_info' => {
                'line_nr' => 2
              }
            },
            {
              'text' => '. '
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'args' => [
                        {
                          'contents' => [
                            {
                              'text' => 'e'
                            }
                          ],
                          'type' => 'following_arg'
                        }
                      ],
                      'cmdname' => '~',
                      'source_info' => {
                        'line_nr' => 2
                      }
                    }
                  ],
                  'type' => 'brace_container'
                }
              ],
              'cmdname' => 'code',
              'source_info' => {
                'line_nr' => 2
              }
            },
            {
              'text' => '. '
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'args' => [
                        {
                          'type' => 'brace_container'
                        }
                      ],
                      'cmdname' => 'aa',
                      'source_info' => {
                        'line_nr' => 2
                      }
                    }
                  ],
                  'type' => 'brace_container'
                }
              ],
              'cmdname' => 'samp',
              'source_info' => {
                'line_nr' => 2
              }
            },
            {
              'text' => '.
'
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'text' => 'AAA'
                    }
                  ],
                  'type' => 'brace_container'
                }
              ],
              'cmdname' => 'command',
              'source_info' => {
                'line_nr' => 3
              }
            },
            {
              'text' => '. '
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'args' => [
                        {
                          'contents' => [
                            {
                              'text' => 'E'
                            }
                          ],
                          'type' => 'following_arg'
                        }
                      ],
                      'cmdname' => '~',
                      'source_info' => {
                        'line_nr' => 3
                      }
                    }
                  ],
                  'type' => 'brace_container'
                }
              ],
              'cmdname' => 'code',
              'source_info' => {
                'line_nr' => 3
              }
            },
            {
              'text' => '. '
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'args' => [
                        {
                          'type' => 'brace_container'
                        }
                      ],
                      'cmdname' => 'AA',
                      'source_info' => {
                        'line_nr' => 3
                      }
                    }
                  ],
                  'type' => 'brace_container'
                }
              ],
              'cmdname' => 'samp',
              'source_info' => {
                'line_nr' => 3
              }
            },
            {
              'text' => '.
'
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'text' => 'double AAA'
                    }
                  ],
                  'type' => 'brace_container'
                }
              ],
              'cmdname' => 'command',
              'source_info' => {
                'line_nr' => 4
              }
            },
            {
              'text' => '.  '
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'text' => 'double '
                    },
                    {
                      'args' => [
                        {
                          'contents' => [
                            {
                              'text' => 'E'
                            }
                          ],
                          'type' => 'following_arg'
                        }
                      ],
                      'cmdname' => '~',
                      'source_info' => {
                        'line_nr' => 4
                      }
                    }
                  ],
                  'type' => 'brace_container'
                }
              ],
              'cmdname' => 'code',
              'source_info' => {
                'line_nr' => 4
              }
            },
            {
              'text' => '. '
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'text' => 'double '
                    },
                    {
                      'args' => [
                        {
                          'type' => 'brace_container'
                        }
                      ],
                      'cmdname' => 'AA',
                      'source_info' => {
                        'line_nr' => 4
                      }
                    }
                  ],
                  'type' => 'brace_container'
                }
              ],
              'cmdname' => 'samp',
              'source_info' => {
                'line_nr' => 4
              }
            },
            {
              'text' => '.  End.
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

$result_texis{'punctuation_and_code_style_commands_utf8'} = '@documentencoding utf-8
@command{aaa}. @code{@~e}. @samp{@aa{}}.
@command{AAA}. @code{@~E}. @samp{@AA{}}.
@command{double AAA}.  @code{double @~E}. @samp{double @AA{}}.  End.
';


$result_texts{'punctuation_and_code_style_commands_utf8'} = 'aaa. e~. aa.
AAA. E~. AA.
double AAA.  double E~. double AA.  End.
';

$result_errors{'punctuation_and_code_style_commands_utf8'} = [];


$result_floats{'punctuation_and_code_style_commands_utf8'} = {};



$result_converted{'plaintext'}->{'punctuation_and_code_style_commands_utf8'} = '‘aaa’.  ‘ẽ’.  ‘å’.  ‘AAA’.  ‘Ẽ’.  ‘Å’.  ‘double AAA’.  ‘double Ẽ’.
‘double Å’.  End.
';

1;
