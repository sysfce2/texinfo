use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'exdent_and_commands'} = {
  'contents' => [
    {
      'contents' => [
        {
          'cmdname' => 'quotation',
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
                  'text' => 'quotation1
'
                }
              ],
              'type' => 'paragraph'
            },
            {
              'cmdname' => 'exdent',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'in exdented protected eol '
                    },
                    {
                      'cmdname' => '
'
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
                'line_nr' => 3
              }
            },
            {
              'contents' => [
                {
                  'text' => 'following
'
                }
              ],
              'type' => 'paragraph'
            },
            {
              'cmdname' => 'exdent',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'in exdented a '
                    },
                    {
                      'cmdname' => '@'
                    },
                    {
                      'text' => '* '
                    },
                    {
                      'cmdname' => '*'
                    },
                    {
                      'text' => ' and following'
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
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'line_nr' => 5
              }
            },
            {
              'contents' => [
                {
                  'text' => 'after exdented
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
                      'text' => 'quotation'
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
                'text_arg' => 'quotation'
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
                  'text' => 'example
'
                }
              ],
              'type' => 'preformatted'
            },
            {
              'cmdname' => 'exdent',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'in exdented protected eol '
                    },
                    {
                      'cmdname' => '
'
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
            },
            {
              'contents' => [
                {
                  'text' => 'following
'
                }
              ],
              'type' => 'preformatted'
            },
            {
              'cmdname' => 'exdent',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'in exdented a '
                    },
                    {
                      'cmdname' => '@'
                    },
                    {
                      'text' => '* '
                    },
                    {
                      'cmdname' => '*'
                    },
                    {
                      'text' => ' and following'
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
              'contents' => [
                {
                  'text' => 'after exdented
'
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
                'line_nr' => 15
              }
            }
          ],
          'source_info' => {
            'line_nr' => 9
          }
        }
      ],
      'type' => 'before_node_section'
    }
  ],
  'type' => 'document_root'
};

$result_texis{'exdent_and_commands'} = '@quotation
quotation1
@exdent in exdented protected eol @
following
@exdent in exdented a @@* @* and following
after exdented
@end quotation

@example
example
@exdent in exdented protected eol @
following
@exdent in exdented a @@* @* and following
after exdented
@end example
';


$result_texts{'exdent_and_commands'} = 'quotation1
in exdented protected eol  
following
in exdented a @* 
 and following
after exdented

example
in exdented protected eol  
following
in exdented a @* 
 and following
after exdented
';

$result_errors{'exdent_and_commands'} = [
  {
    'error_line' => 'warning: @ should not occur at end of argument to line command
',
    'line_nr' => 3,
    'text' => '@ should not occur at end of argument to line command',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: @ should not occur at end of argument to line command
',
    'line_nr' => 11,
    'text' => '@ should not occur at end of argument to line command',
    'type' => 'warning'
  }
];


$result_floats{'exdent_and_commands'} = {};



$result_converted{'plaintext'}->{'exdent_and_commands'} = '     quotation1
in exdented protected eol  
     following
in exdented a @*
and following
     after exdented

     example
in exdented protected eol  
     following
in exdented a @*
 and following
     after exdented
';


$result_converted{'html_text'}->{'exdent_and_commands'} = '<blockquote class="quotation">
<p>quotation1
</p><p class="exdent">in exdented protected eol &nbsp;
</p><p>following
</p><p class="exdent">in exdented a @* <br> and following
</p><p>after exdented
</p></blockquote>

<div class="example">
<pre class="example-preformatted">example
</pre><pre class="exdent">in exdented protected eol &nbsp;
</pre><pre class="example-preformatted">following
</pre><pre class="exdent">in exdented a @* 
 and following
</pre><pre class="example-preformatted">after exdented
</pre></div>
';


$result_converted{'xml'}->{'exdent_and_commands'} = '<quotation endspaces=" ">
<para>quotation1
</para><exdent spaces=" ">in exdented protected eol <spacecmd type="nl"/></exdent><para>following
</para><exdent spaces=" ">in exdented a &arobase;* &linebreak; and following</exdent>
<para>after exdented
</para></quotation>

<example endspaces=" ">
<pre xml:space="preserve">example
</pre><exdent spaces=" ">in exdented protected eol <spacecmd type="nl"/></exdent><pre xml:space="preserve">following
</pre><exdent spaces=" ">in exdented a &arobase;* &linebreak; and following</exdent>
<pre xml:space="preserve">after exdented
</pre></example>
';


$result_converted{'latex_text'}->{'exdent_and_commands'} = '\\begin{quote}
quotation1
\\leavevmode{}\\\\
\\hbox{\\kern -\\leftmargin}%
in exdented protected eol \\ {}
\\\\
following
\\leavevmode{}\\\\
\\hbox{\\kern -\\leftmargin}%
in exdented a @* \\leavevmode{}\\\\ and following
\\\\
after exdented
\\end{quote}

\\begin{Texinfoindented}
\\begin{Texinfopreformatted}%
\\ttfamily example
\\end{Texinfopreformatted}
\\leavevmode{}\\\\
\\hbox{\\kern -\\leftmargin}%
in exdented protected eol \\ {}
\\\\
\\begin{Texinfopreformatted}%
\\ttfamily following
\\end{Texinfopreformatted}
\\leavevmode{}\\\\
\\hbox{\\kern -\\leftmargin}%
in exdented a @* \\leavevmode{}\\\\ and following
\\\\
\\begin{Texinfopreformatted}%
\\ttfamily after exdented
\\end{Texinfopreformatted}
\\end{Texinfoindented}
';


$result_converted{'docbook'}->{'exdent_and_commands'} = '<blockquote><para>quotation1
</para><simpara role="exdent">in exdented protected eol &#160;</simpara>
<para>following
</para><simpara role="exdent">in exdented a @* 
 and following</simpara>
<para>after exdented
</para></blockquote>
<screen>example
</screen><simpara role="exdent">in exdented protected eol &#160;</simpara>
<screen>following
</screen><simpara role="exdent">in exdented a @* 
 and following</simpara>
<screen>after exdented
</screen>';

1;
