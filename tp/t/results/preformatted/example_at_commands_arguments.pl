use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'example_at_commands_arguments'} = {
  'contents' => [
    {
      'contents' => [
        {
          'cmdname' => 'example',
          'contents' => [
            {
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'some  thing '
                    },
                    {
                      'cmdname' => '^',
                      'contents' => [
                        {
                          'contents' => [
                            {
                              'text' => 'e'
                            }
                          ],
                          'type' => 'following_arg'
                        }
                      ],
                      'source_info' => {
                        'line_nr' => 1
                      }
                    },
                    {
                      'text' => ' '
                    },
                    {
                      'cmdname' => 'TeX',
                      'contents' => [
                        {
                          'type' => 'brace_container'
                        }
                      ],
                      'source_info' => {
                        'line_nr' => 1
                      }
                    },
                    {
                      'text' => ' '
                    },
                    {
                      'cmdname' => 'exclamdown',
                      'contents' => [
                        {
                          'type' => 'brace_container'
                        }
                      ],
                      'source_info' => {
                        'line_nr' => 1
                      }
                    },
                    {
                      'text' => ' '
                    },
                    {
                      'cmdname' => 'code',
                      'contents' => [
                        {
                          'contents' => [
                            {
                              'text' => '---'
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
                      'text' => ' '
                    },
                    {
                      'cmdname' => 'enddots',
                      'contents' => [
                        {
                          'type' => 'brace_container'
                        }
                      ],
                      'source_info' => {
                        'line_nr' => 1
                      }
                    },
                    {
                      'text' => ' !_- _---_ < " & '
                    },
                    {
                      'cmdname' => ' '
                    },
                    {
                      'cmdname' => 'comma',
                      'contents' => [
                        {
                          'type' => 'brace_container'
                        }
                      ],
                      'source_info' => {
                        'line_nr' => 1
                      }
                    }
                  ],
                  'type' => 'block_line_arg'
                },
                {
                  'contents' => [
                    {
                      'cmdname' => '@'
                    }
                  ],
                  'type' => 'block_line_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => '0'
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
              'contents' => [
                {
                  'text' => 'example with '
                },
                {
                  'cmdname' => '@'
                },
                {
                  'text' => '-commands and other special characters
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
        }
      ],
      'type' => 'before_node_section'
    }
  ],
  'type' => 'document_root'
};

$result_texis{'example_at_commands_arguments'} = '@example some  thing @^e @TeX{} @exclamdown{} @code{---} @enddots{} !_- _---_ < " & @ @comma{},@@,0
example with @@-commands and other special characters
@end example
';


$result_texts{'example_at_commands_arguments'} = 'example with @-commands and other special characters
';

$result_errors{'example_at_commands_arguments'} = [];


$result_floats{'example_at_commands_arguments'} = {};



$result_converted{'plaintext'}->{'example_at_commands_arguments'} = '     example with @-commands and other special characters
';


$result_converted{'html'}->{'example_at_commands_arguments'} = '<!DOCTYPE html>
<html>
<!-- Created by texinfo, https://www.gnu.org/software/texinfo/ -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Untitled Document</title>

<meta name="description" content="Untitled Document">
<meta name="keywords" content="Untitled Document">
<meta name="resource-type" content="document">
<meta name="distribution" content="global">
<meta name="viewport" content="width=device-width,initial-scale=1">

<style type="text/css">
<!--
div.example {margin-left: 3.2em}
-->
</style>


</head>

<body lang="en">
<div class="example user-some-thing-ê-TeX-¡-----...-!_--_---_-&lt;-&quot;-&amp;--, user-@ user-0">
<pre class="example-preformatted">example with @-commands and other special characters
</pre></div>



</body>
</html>
';

$result_converted_errors{'html'}->{'example_at_commands_arguments'} = [
  {
    'error_line' => 'warning: must specify a title with a title command or @top
',
    'text' => 'must specify a title with a title command or @top',
    'type' => 'warning'
  }
];



$result_converted{'docbook'}->{'example_at_commands_arguments'} = '<screen>example with @-commands and other special characters
</screen>';


$result_converted{'xml'}->{'example_at_commands_arguments'} = '<example spaces=" " endspaces=" "><examplelanguage>some  thing <accent type="circ" bracketed="off">e</accent> &tex; &iexcl; <code>---</code> &enddots; !_- _&textmdash;_ &lt; &quot; &amp; <spacecmd type="spc"/>&comma;</examplelanguage><examplearg>&arobase;</examplearg><examplearg>0</examplearg>
<pre xml:space="preserve">example with &arobase;-commands and other special characters
</pre></example>
';


$result_converted{'latex_text'}->{'example_at_commands_arguments'} = '\\begin{Texinfoindented}
\\begin{Texinfopreformatted}%
\\ttfamily example with @-commands and other special characters
\\end{Texinfopreformatted}
\\end{Texinfoindented}
';

1;
