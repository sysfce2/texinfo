use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'item_container'} = {
  'contents' => [
    {
      'contents' => [
        {
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'cmdname' => 'itemize',
          'contents' => [
            {
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => '+'
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
              'cmdname' => 'item',
              'contents' => [
                {
                  'text' => ' ',
                  'type' => 'ignorable_spaces_after_command'
                },
                {
                  'contents' => [
                    {
                      'text' => 'i--tem +
'
                    }
                  ],
                  'type' => 'paragraph'
                }
              ],
              'extra' => {
                'item_number' => 1
              },
              'source_info' => {
                'line_nr' => 3
              }
            },
            {
              'cmdname' => 'end',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'itemize'
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
                'text_arg' => 'itemize'
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'line_nr' => 4
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
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'cmdname' => 'itemize',
          'contents' => [
            {
              'contents' => [
                {
                  'contents' => [
                    {
                      'cmdname' => 'bullet',
                      'source_info' => {
                        'line_nr' => 6
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
              'cmdname' => 'item',
              'contents' => [
                {
                  'text' => '
',
                  'type' => 'ignorable_spaces_after_command'
                },
                {
                  'text' => ' ',
                  'type' => 'spaces_before_paragraph'
                },
                {
                  'contents' => [
                    {
                      'text' => 'b--ullet
'
                    }
                  ],
                  'type' => 'paragraph'
                }
              ],
              'extra' => {
                'item_number' => 1
              },
              'source_info' => {
                'line_nr' => 7
              }
            },
            {
              'cmdname' => 'end',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'itemize'
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
                'text_arg' => 'itemize'
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'line_nr' => 9
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
            'line_nr' => 6
          }
        },
        {
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'cmdname' => 'itemize',
          'contents' => [
            {
              'contents' => [
                {
                  'contents' => [
                    {
                      'cmdname' => 'bullet',
                      'info' => {
                        'inserted' => 1
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
              'cmdname' => 'item',
              'contents' => [
                {
                  'text' => ' ',
                  'type' => 'ignorable_spaces_after_command'
                },
                {
                  'contents' => [
                    {
                      'text' => 'no itemize argument
'
                    }
                  ],
                  'type' => 'paragraph'
                }
              ],
              'extra' => {
                'item_number' => 1
              },
              'source_info' => {
                'line_nr' => 12
              }
            },
            {
              'cmdname' => 'end',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'itemize'
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
                'text_arg' => 'itemize'
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'line_nr' => 13
              }
            }
          ],
          'extra' => {
            'command_as_argument' => {}
          },
          'source_info' => {
            'line_nr' => 11
          }
        }
      ],
      'type' => 'before_node_section'
    }
  ],
  'type' => 'document_root'
};
$result_trees{'item_container'}{'contents'}[0]{'contents'}[3]{'extra'}{'command_as_argument'} = $result_trees{'item_container'}{'contents'}[0]{'contents'}[3]{'contents'}[0]{'contents'}[0]{'contents'}[0];
$result_trees{'item_container'}{'contents'}[0]{'contents'}[5]{'extra'}{'command_as_argument'} = $result_trees{'item_container'}{'contents'}[0]{'contents'}[5]{'contents'}[0]{'contents'}[0]{'contents'}[0];

$result_texis{'item_container'} = '
@itemize +
@item i--tem +
@end itemize

@itemize @bullet
@item
 b--ullet
@end itemize

@itemize
@item no itemize argument
@end itemize
';


$result_texts{'item_container'} = '
i-tem +

b-ullet

no itemize argument
';

$result_errors{'item_container'} = [];


$result_floats{'item_container'} = {};



$result_converted{'plaintext'}->{'item_container'} = '   + i-tem +

   • b-ullet

   • no itemize argument
';


$result_converted{'html_text'}->{'item_container'} = '
<ul class="itemize" style="list-style-type: \'+\'">
<li>i&ndash;tem +
</li></ul>

<ul class="itemize mark-bullet">
<li>b&ndash;ullet
</li></ul>

<ul class="itemize mark-bullet">
<li>no itemize argument
</li></ul>
';


$result_converted{'xml'}->{'item_container'} = '
<itemize spaces=" " endspaces=" "><itemprepend>+</itemprepend>
<listitem><prepend>+</prepend> <para>i&textndash;tem +
</para></listitem></itemize>

<itemize commandarg="bullet" spaces=" " endspaces=" "><itemprepend><formattingcommand command="bullet"/></itemprepend>
<listitem><prepend>&bullet;</prepend>
 <para>b&textndash;ullet
</para></listitem></itemize>

<itemize commandarg="bullet" automaticcommandarg="on" endspaces=" "><itemprepend><formattingcommand command="bullet" automatic="on"/></itemprepend>
<listitem><prepend>&bullet;</prepend> <para>no itemize argument
</para></listitem></itemize>
';


$result_converted{'latex_text'}->{'item_container'} = '
\\begin{itemize}[label=+]
\\item i--tem +
\\end{itemize}

\\begin{itemize}[label=\\textbullet{}]
\\item  b--ullet
\\end{itemize}

\\begin{itemize}
\\item no itemize argument
\\end{itemize}
';


$result_converted{'docbook'}->{'item_container'} = '
<itemizedlist><listitem><para>+ i&#8211;tem +
</para></listitem></itemizedlist>
<itemizedlist><listitem><para>b&#8211;ullet
</para></listitem></itemizedlist>
<itemizedlist><listitem><para>no itemize argument
</para></listitem></itemizedlist>';

1;
