use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'anchor_in_copying_in_footnote'} = {
  'contents' => [
    {
      'contents' => [
        {
          'contents' => [
            {
              'cmdname' => 'copying',
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
                  'text' => '
',
                  'type' => 'empty_line'
                },
                {
                  'contents' => [
                    {
                      'text' => 'Copying'
                    },
                    {
                      'cmdname' => 'footnote',
                      'contents' => [
                        {
                          'contents' => [
                            {
                              'contents' => [
                                {
                                  'text' => 'In footnote.
'
                                },
                                {
                                  'cmdname' => 'anchor',
                                  'contents' => [
                                    {
                                      'contents' => [
                                        {
                                          'text' => 'Copying footnote'
                                        }
                                      ],
                                      'extra' => {
                                        'element_region' => 'copying'
                                      },
                                      'type' => 'brace_arg'
                                    }
                                  ],
                                  'extra' => {
                                    'is_target' => 1,
                                    'normalized' => 'Copying-footnote'
                                  },
                                  'source_info' => {
                                    'line_nr' => 5
                                  }
                                },
                                {
                                  'text' => '
',
                                  'type' => 'spaces_after_close_brace'
                                }
                              ],
                              'type' => 'paragraph'
                            }
                          ],
                          'type' => 'brace_command_context'
                        }
                      ],
                      'extra' => {},
                      'info' => {
                        'spaces_before_argument' => {
                          'text' => '
'
                        }
                      },
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
                  'cmdname' => 'end',
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'copying'
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
                    'text_arg' => 'copying'
                  },
                  'info' => {
                    'spaces_before_argument' => {
                      'text' => ' '
                    }
                  },
                  'source_info' => {
                    'line_nr' => 8
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
            }
          ],
          'type' => 'preamble_before_content'
        }
      ],
      'type' => 'before_node_section'
    },
    {
      'cmdname' => 'node',
      'contents' => [
        {
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'Top'
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
          'type' => 'arguments_line'
        },
        {
          'text' => '
',
          'type' => 'empty_line'
        }
      ],
      'extra' => {
        'is_target' => 1,
        'normalized' => 'Top'
      },
      'info' => {
        'spaces_before_argument' => {
          'text' => ' '
        }
      },
      'source_info' => {
        'line_nr' => 10
      }
    },
    {
      'cmdname' => 'node',
      'contents' => [
        {
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'chap'
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
          'type' => 'arguments_line'
        },
        {
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'cmdname' => 'insertcopying',
          'contents' => [
            {
              'text' => '
',
              'type' => 'rawline_arg'
            }
          ],
          'extra' => {},
          'source_info' => {
            'line_nr' => 14
          }
        },
        {
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'cmdname' => 'insertcopying',
          'contents' => [
            {
              'text' => '
',
              'type' => 'rawline_arg'
            }
          ],
          'extra' => {},
          'source_info' => {
            'line_nr' => 16
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
              'cmdname' => 'xref',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'Copying footnote'
                    }
                  ],
                  'extra' => {
                    'node_content' => {
                      'contents' => [
                        {}
                      ]
                    },
                    'normalized' => 'Copying-footnote'
                  },
                  'type' => 'brace_arg'
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
          'type' => 'paragraph'
        },
        {
          'text' => '
',
          'type' => 'empty_line'
        }
      ],
      'extra' => {
        'is_target' => 1,
        'normalized' => 'chap'
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
  'type' => 'document_root'
};
$result_trees{'anchor_in_copying_in_footnote'}{'contents'}[2]{'contents'}[6]{'contents'}[0]{'contents'}[0]{'extra'}{'node_content'}{'contents'}[0] = $result_trees{'anchor_in_copying_in_footnote'}{'contents'}[2]{'contents'}[6]{'contents'}[0]{'contents'}[0]{'contents'}[0];

$result_texis{'anchor_in_copying_in_footnote'} = '@copying

Copying@footnote{
In footnote.
@anchor{Copying footnote}
}.

@end copying

@node Top

@node chap

@insertcopying

@insertcopying

@xref{Copying footnote}.

';


$result_texts{'anchor_in_copying_in_footnote'} = '




Copying footnote.

';

$result_nodes{'anchor_in_copying_in_footnote'} = [
  {
    'cmdname' => 'node',
    'extra' => {
      'node_directions' => {
        'next' => {
          'cmdname' => 'node',
          'extra' => {
            'node_directions' => {
              'prev' => {}
            },
            'normalized' => 'chap'
          }
        }
      },
      'normalized' => 'Top'
    }
  },
  {}
];
$result_nodes{'anchor_in_copying_in_footnote'}[0]{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'prev'} = $result_nodes{'anchor_in_copying_in_footnote'}[0];
$result_nodes{'anchor_in_copying_in_footnote'}[1] = $result_nodes{'anchor_in_copying_in_footnote'}[0]{'extra'}{'node_directions'}{'next'};

$result_menus{'anchor_in_copying_in_footnote'} = [
  {
    'extra' => {
      'normalized' => 'Top'
    }
  },
  {
    'extra' => {
      'normalized' => 'chap'
    }
  }
];

$result_errors{'anchor_in_copying_in_footnote'} = [
  {
    'error_line' => 'warning: node `chap\' not in menu
',
    'line_nr' => 12,
    'text' => 'node `chap\' not in menu',
    'type' => 'warning'
  }
];


$result_floats{'anchor_in_copying_in_footnote'} = {};



$result_converted{'info'}->{'anchor_in_copying_in_footnote'} = 'This is , produced from .

Copying(1).

   ---------- Footnotes ----------

   (1) In footnote.


File: ,  Node: Top,  Next: chap,  Up: (dir)


File: ,  Node: chap,  Prev: Top

Copying(1).

   Copying(2).

   *Note Copying footnote::.

   ---------- Footnotes ----------

   (1) In footnote.

   (2) In footnote.


Tag Table:
Node: Top97
Node: chap144
Ref: chap-Footnote-1274
Ref: Copying footnote293
Ref: chap-Footnote-2295

End Tag Table


Local Variables:
coding: utf-8
End:
';

$result_converted_errors{'info'}->{'anchor_in_copying_in_footnote'} = [
  {
    'error_line' => '@anchor output more than once: Copying footnote
',
    'line_nr' => 5,
    'text' => '@anchor output more than once: Copying footnote',
    'type' => 'error'
  }
];



$result_converted{'html'}->{'anchor_in_copying_in_footnote'} = '<!DOCTYPE html>
<html>
<!-- Created by texinfo, https://www.gnu.org/software/texinfo/ -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- 
Copying.
 -->
<title>Untitled Document</title>

<meta name="description" content="Untitled Document">
<meta name="keywords" content="Untitled Document">
<meta name="resource-type" content="document">
<meta name="distribution" content="global">
<meta name="viewport" content="width=device-width,initial-scale=1">

<link href="#Top" rel="start" title="Top">
<style type="text/css">
<!--
a.copiable-link {visibility: hidden; text-decoration: none; line-height: 0em}
span:hover a.copiable-link {visibility: visible}
-->
</style>


</head>

<body lang="en">

<a class="node-id" id="Top"></a><div class="nav-panel">
<p>
Next: <a href="#chap" accesskey="n" rel="next">chap</a> &nbsp; </p>
</div>
<h1 class="node"><span>Top<a class="copiable-link" href="#Top"> &para;</a></span></h1>

<hr>
<a class="node-id" id="chap"></a><div class="nav-panel">
<p>
Previous: <a href="#Top" accesskey="p" rel="prev">Top</a> &nbsp; </p>
</div>
<h4 class="node"><span>chap<a class="copiable-link" href="#chap"> &para;</a></span></h4>


<p>Copying<a class="footnote" id="DOCF1" href="#FOOT1"><sup>1</sup></a>.
</p>


<p>Copying<a class="footnote" id="DOCF1_2" href="#FOOT1_2"><sup>2</sup></a>.
</p>

<p>See <a class="xref" href="#Copying-footnote">Copying footnote</a>.
</p>
<div class="footnotes-segment">
<hr>
<h4 class="footnotes-heading">Footnotes</h4>

<h5 class="footnote-body-heading"><a id="FOOT1" href="#DOCF1">(1)</a></h5>
<p>In footnote.
<a class="anchor" id="Copying-footnote"></a></p>
<h5 class="footnote-body-heading"><a id="FOOT1_2" href="#DOCF1_2">(2)</a></h5>
<p>In footnote.
<a class="anchor" id="Copying-footnote"></a></p>
</div>



</body>
</html>
';

$result_converted_errors{'html'}->{'anchor_in_copying_in_footnote'} = [
  {
    'error_line' => 'warning: must specify a title with a title command or @top
',
    'text' => 'must specify a title with a title command or @top',
    'type' => 'warning'
  }
];



$result_converted{'latex_text'}->{'anchor_in_copying_in_footnote'} = '
\\begin{document}
\\label{anchor:Top}%
\\label{anchor:chap}%


Copying\\footnote{In footnote.
\\label{anchor:Copying-footnote}%
}.



Copying\\footnote{In footnote.
\\label{anchor:Copying-footnote}%
}.


See \\hyperref[anchor:Copying-footnote]{[Copying footnote], page~\\pageref*{anchor:Copying-footnote}}.

';

1;
