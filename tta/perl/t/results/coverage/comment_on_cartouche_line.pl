use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'comment_on_cartouche_line'} = {
  'contents' => [
    {
      'contents' => [
        {
          'cmdname' => 'cartouche',
          'contents' => [
            {
              'contents' => [
                {
                  'info' => {
                    'comment_at_end' => {
                      'cmdname' => 'c',
                      'contents' => [
                        {
                          'text' => ' comment
',
                          'type' => 'rawline_arg'
                        }
                      ]
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
                  'text' => 'in cartouche.
'
                }
              ],
              'type' => 'paragraph'
            },
            {
              'cmdname' => 'end',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'cartouche'
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
                'text_arg' => 'cartouche'
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
          'cmdname' => 'cartouche',
          'contents' => [
            {
              'contents' => [
                {
                  'contents' => [
                    {
                      'cmdname' => 'emph',
                      'contents' => [
                        {
                          'contents' => [
                            {
                              'text' => 'Title of box'
                            }
                          ],
                          'type' => 'brace_container'
                        }
                      ],
                      'source_info' => {
                        'line_nr' => 5
                      }
                    }
                  ],
                  'info' => {
                    'comment_at_end' => {
                      'cmdname' => 'c',
                      'contents' => [
                        {
                          'text' => ' comment
',
                          'type' => 'rawline_arg'
                        }
                      ]
                    },
                    'spaces_after_argument' => {
                      'text' => ' '
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
                  'text' => 'Out of main text
'
                }
              ],
              'type' => 'paragraph'
            },
            {
              'cmdname' => 'end',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'cartouche'
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
                'text_arg' => 'cartouche'
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
            'line_nr' => 5
          }
        }
      ],
      'type' => 'before_node_section'
    }
  ],
  'type' => 'document_root'
};

$result_texis{'comment_on_cartouche_line'} = '@cartouche @c comment
in cartouche.
@end cartouche

@cartouche @emph{Title of box} @c comment
Out of main text
@end cartouche
';


$result_texts{'comment_on_cartouche_line'} = 'in cartouche.

Title of box
Out of main text
';

$result_errors{'comment_on_cartouche_line'} = [];


$result_floats{'comment_on_cartouche_line'} = {};



$result_converted{'plaintext'}->{'comment_on_cartouche_line'} = 'in cartouche.

                            _Title of box_
   Out of main text
';


$result_converted{'html_text'}->{'comment_on_cartouche_line'} = '<table class="cartouche"><tr><td>
<p>in cartouche.
</p></td></tr></table>

<table class="cartouche"><tr><th>
<em class="emph">Title of box</em></th></tr><tr><td>
<p>Out of main text
</p></td></tr></table>
';


$result_converted{'xml'}->{'comment_on_cartouche_line'} = '<cartouche spaces=" " endspaces=" "><!-- c comment -->
<para>in cartouche.
</para></cartouche>

<cartouche spaces=" " endspaces=" "><cartouchetitle><emph>Title of box</emph> </cartouchetitle><!-- c comment -->
<para>Out of main text
</para></cartouche>
';


$result_converted{'latex_text'}->{'comment_on_cartouche_line'} = '\\begin{mdframed}[style=Texinfocartouche]
in cartouche.
\\end{mdframed}

\\begin{mdframed}[style=Texinfocartouche, frametitle={\\emph{Title of box}}]
Out of main text
\\end{mdframed}
';


$result_converted{'docbook'}->{'comment_on_cartouche_line'} = '<sidebar><para>in cartouche.
</para></sidebar>
<sidebar><title><emphasis>Title of box</emphasis></title>
<para>Out of main text
</para></sidebar>';

1;
