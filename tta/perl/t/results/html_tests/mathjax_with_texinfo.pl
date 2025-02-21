use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'mathjax_with_texinfo'} = {
  'contents' => [
    {
      'contents' => [
        {
          'cmdname' => 'displaymath',
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
              'text' => 'a'
            },
            {
              'cmdname' => 'sup',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'b - \\frac'
                    },
                    {
                      'contents' => [
                        {
                          'text' => '{\\xi}'
                        }
                      ],
                      'source_info' => {
                        'line_nr' => 2
                      },
                      'type' => 'balanced_braces'
                    },
                    {
                      'contents' => [
                        {
                          'text' => '{phi '
                        },
                        {
                          'cmdname' => 'copyright',
                          'contents' => [
                            {
                              'type' => 'brace_container'
                            }
                          ],
                          'source_info' => {
                            'line_nr' => 2
                          }
                        },
                        {
                          'text' => '}'
                        }
                      ],
                      'source_info' => {
                        'line_nr' => 2
                      },
                      'type' => 'balanced_braces'
                    }
                  ],
                  'type' => 'brace_container'
                }
              ],
              'source_info' => {
                'line_nr' => 2
              }
            },
            {
              'text' => ' '
            },
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
                'line_nr' => 2
              }
            },
            {
              'text' => '
'
            },
            {
              'cmdname' => 'end',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'displaymath'
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
                'text_arg' => 'displaymath'
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
          'contents' => [
            {
              'text' => 'Some '
            },
            {
              'cmdname' => 'math',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'a '
                    },
                    {
                      'cmdname' => 'minus',
                      'contents' => [
                        {
                          'type' => 'brace_container'
                        }
                      ],
                      'source_info' => {
                        'line_nr' => 5
                      }
                    },
                    {
                      'text' => ' b '
                    },
                    {
                      'cmdname' => 'geq',
                      'contents' => [
                        {
                          'type' => 'brace_container'
                        }
                      ],
                      'source_info' => {
                        'line_nr' => 5
                      }
                    },
                    {
                      'text' => ' '
                    },
                    {
                      'cmdname' => 'AA',
                      'contents' => [
                        {
                          'type' => 'brace_container'
                        }
                      ],
                      'source_info' => {
                        'line_nr' => 5
                      }
                    },
                    {
                      'text' => ' '
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
                        'line_nr' => 5
                      }
                    }
                  ],
                  'type' => 'brace_command_context'
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
        }
      ],
      'type' => 'before_node_section'
    }
  ],
  'type' => 'document_root'
};

$result_texis{'mathjax_with_texinfo'} = '@displaymath
a@sup{b - \\frac{\\xi}{phi @copyright{}}} @dotless{i}
@end displaymath

Some @math{a @minus{} b @geq{} @AA{} @^e}.
';


$result_texts{'mathjax_with_texinfo'} = 'ab - \\frac{\\xi}{phi (C)} i

Some a - b >= AA e^.
';

$result_errors{'mathjax_with_texinfo'} = [];


$result_floats{'mathjax_with_texinfo'} = {};



$result_converted{'html'}->{'mathjax_with_texinfo'} = '<!DOCTYPE html>
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
pre.displaymath {font-style: italic; font-family: serif; display: flex; justify-content: center}
-->
</style>

<script type=\'text/javascript\'>
MathJax = {
  options: {
    skipHtmlTags: {\'[-]\': [\'pre\']},       // do not skip pre
    ignoreHtmlClass: \'tex2jax_ignore\',
    processHtmlClass: \'tex2jax_process\'
  },
  tex: {
    processEscapes: false,      // do not use \\$ to produce a literal dollar sign
    processEnvironments: false, // do not process \\begin{xxx}...\\end{xxx} outside math mode
    processRefs: false,         // do not process \\ref{...} outside of math mode
    displayMath: [             // start/end delimiter pairs for display math
      [\'\\\\[\', \'\\\\]\']
    ],
  },
};
</script><script type="text/javascript" id="MathJax-script" async
  src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-svg.js">
</script>
</head>

<body lang="en" class="tex2jax_ignore">
<pre class="displaymath tex2jax_process">\\[a^{b - \\frac{\\xi}{phi \\copyright{}}} \\imath{}
\\]</pre>
<p>Some <em class="math tex2jax_process">\\(a - b \\geq{} \\mathord{\\text{\\AA{}}} \\hat{e}\\)</em>.
</p>

<a href="js_licenses.html" rel="jslicense"><small>JavaScript license information</small></a>
</body>
</html>
';

$result_converted_errors{'html'}->{'mathjax_with_texinfo'} = [
  {
    'error_line' => 'warning: must specify a title with a title command or @top
',
    'text' => 'must specify a title with a title command or @top',
    'type' => 'warning'
  }
];


1;
