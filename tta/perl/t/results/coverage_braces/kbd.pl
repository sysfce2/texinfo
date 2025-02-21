use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'kbd'} = {
  'contents' => [
    {
      'contents' => [
        {
          'contents' => [
            {
              'text' => 'kbd: '
            },
            {
              'cmdname' => 'code',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'in kbd'
                    }
                  ],
                  'type' => 'brace_container'
                }
              ],
              'source_info' => {
                'line_nr' => 1
              }
            },
            {
              'text' => '.
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
              'text' => 'kbd in code: '
            },
            {
              'cmdname' => 'code',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'in first '
                    },
                    {
                      'cmdname' => 'kbd',
                      'contents' => [
                        {
                          'contents' => [
                            {
                              'text' => 'in nested kbd'
                            }
                          ],
                          'type' => 'brace_container'
                        }
                      ],
                      'source_info' => {
                        'line_nr' => 3
                      }
                    }
                  ],
                  'type' => 'brace_container'
                }
              ],
              'source_info' => {
                'line_nr' => 3
              }
            },
            {
              'text' => '.
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
              'text' => 'kbd in kbd: '
            },
            {
              'cmdname' => 'kbd',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'in top kbd '
                    },
                    {
                      'cmdname' => 'kbd',
                      'contents' => [
                        {
                          'contents' => [
                            {
                              'text' => 'in nested kbd'
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
                  'type' => 'brace_container'
                }
              ],
              'source_info' => {
                'line_nr' => 5
              }
            },
            {
              'text' => '.
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
              'text' => 'kbd in '
            },
            {
              'cmdname' => '@'
            },
            {
              'text' => 'example:
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
                  'text' => 'in example
'
                },
                {
                  'cmdname' => 'code',
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'in example in kbd'
                        }
                      ],
                      'type' => 'brace_container'
                    }
                  ],
                  'source_info' => {
                    'line_nr' => 11
                  }
                },
                {
                  'text' => '.
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
                'line_nr' => 12
              }
            }
          ],
          'source_info' => {
            'line_nr' => 9
          }
        },
        {
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'contents' => [
            {
              'text' => 'kbd in '
            },
            {
              'cmdname' => '@'
            },
            {
              'text' => 'format:
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
          'cmdname' => 'format',
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
                  'text' => 'in format
'
                },
                {
                  'cmdname' => 'code',
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'in format in kbd'
                        }
                      ],
                      'type' => 'brace_container'
                    }
                  ],
                  'source_info' => {
                    'line_nr' => 18
                  }
                },
                {
                  'text' => '.
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
                      'text' => 'format'
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
                'text_arg' => 'format'
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'line_nr' => 19
              }
            }
          ],
          'source_info' => {
            'line_nr' => 16
          }
        }
      ],
      'type' => 'before_node_section'
    }
  ],
  'type' => 'document_root'
};

$result_texis{'kbd'} = 'kbd: @code{in kbd}.

kbd in code: @code{in first @kbd{in nested kbd}}.

kbd in kbd: @kbd{in top kbd @kbd{in nested kbd}}.

kbd in @@example:

@example 
in example
@code{in example in kbd}.
@end example

kbd in @@format:

@format 
in format
@code{in format in kbd}.
@end format
';


$result_texts{'kbd'} = 'kbd: in kbd.

kbd in code: in first in nested kbd.

kbd in kbd: in top kbd in nested kbd.

kbd in @example:

in example
in example in kbd.

kbd in @format:

in format
in format in kbd.
';

$result_errors{'kbd'} = [];


$result_floats{'kbd'} = {};



$result_converted{'plaintext'}->{'kbd'} = 'kbd: ‘in kbd’.

   kbd in code: ‘in first in nested kbd’.

   kbd in kbd: ‘in top kbd in nested kbd’.

   kbd in @example:

     in example
     in example in kbd.

   kbd in @format:

in format
‘in format in kbd’.
';


$result_converted{'html_text'}->{'kbd'} = '<p>kbd: <code class="code">in kbd</code>.
</p>
<p>kbd in code: <code class="code">in first <kbd class="kbd">in nested kbd</kbd></code>.
</p>
<p>kbd in kbd: <kbd class="kbd">in top kbd <kbd class="kbd">in nested kbd</kbd></kbd>.
</p>
<p>kbd in @example:
</p>
<div class="example">
<pre class="example-preformatted">in example
<code class="code">in example in kbd</code>.
</pre></div>

<p>kbd in @format:
</p>
<div class="format">
<pre class="format-preformatted">in format
<code class="code">in format in kbd</code>.
</pre></div>
';


$result_converted{'latex_text'}->{'kbd'} = 'kbd: \\texttt{in kbd}.

kbd in code: \\texttt{in first \\Texinfocommandstyletextkbd{in nested kbd}}.

kbd in kbd: \\Texinfocommandstyletextkbd{in top kbd \\Texinfocommandstyletextkbd{in nested kbd}}.

kbd in @example:

\\begin{Texinfoindented}
\\begin{Texinfopreformatted}%
\\ttfamily in example
\\texttt{in example in kbd}.
\\end{Texinfopreformatted}
\\end{Texinfoindented}

kbd in @format:

\\begin{Texinfopreformatted}%
in format
\\texttt{in format in kbd}.
\\end{Texinfopreformatted}
';


$result_converted{'docbook'}->{'kbd'} = '<para>kbd: <literal>in kbd</literal>.
</para>
<para>kbd in code: <literal>in first <userinput>in nested kbd</userinput></literal>.
</para>
<para>kbd in kbd: <userinput>in top kbd <userinput>in nested kbd</userinput></userinput>.
</para>
<para>kbd in @example:
</para>
<screen>in example
<literal>in example in kbd</literal>.
</screen>
<para>kbd in @format:
</para>
<literallayout>in format
<literal>in format in kbd</literal>.
</literallayout>';

1;
