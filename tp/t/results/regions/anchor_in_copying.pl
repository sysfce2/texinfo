use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'anchor_in_copying'} = {
  'contents' => [
    {
      'contents' => [
        {
          'contents' => [
            {
              'parent' => {},
              'text' => '
',
              'type' => 'text_before_beginning'
            }
          ],
          'parent' => {},
          'type' => 'preamble_before_beginning'
        },
        {
          'contents' => [
            {
              'args' => [
                {
                  'contents' => [],
                  'extra' => {
                    'spaces_after_argument' => '
'
                  },
                  'parent' => {},
                  'type' => 'block_line_arg'
                }
              ],
              'cmdname' => 'copying',
              'contents' => [
                {
                  'parent' => {},
                  'text' => '
',
                  'type' => 'empty_line'
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'Copying.
'
                    },
                    {
                      'args' => [
                        {
                          'contents' => [
                            {
                              'parent' => {},
                              'text' => 'Copying information'
                            }
                          ],
                          'extra' => {
                            'region' => {}
                          },
                          'parent' => {},
                          'type' => 'brace_command_arg'
                        }
                      ],
                      'cmdname' => 'anchor',
                      'contents' => [],
                      'extra' => {
                        'node_content' => [
                          {}
                        ],
                        'normalized' => 'Copying-information'
                      },
                      'parent' => {},
                      'source_info' => {
                        'file_name' => '',
                        'line_nr' => 5,
                        'macro' => ''
                      }
                    },
                    {
                      'parent' => {},
                      'text' => '
',
                      'type' => 'empty_spaces_after_close_brace'
                    }
                  ],
                  'parent' => {},
                  'type' => 'paragraph'
                },
                {
                  'parent' => {},
                  'text' => '
',
                  'type' => 'empty_line'
                },
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'copying'
                        }
                      ],
                      'extra' => {
                        'spaces_after_argument' => '
'
                      },
                      'parent' => {},
                      'type' => 'line_arg'
                    }
                  ],
                  'cmdname' => 'end',
                  'extra' => {
                    'command_argument' => 'copying',
                    'spaces_before_argument' => ' ',
                    'text_arg' => 'copying'
                  },
                  'parent' => {},
                  'source_info' => {
                    'file_name' => '',
                    'line_nr' => 7,
                    'macro' => ''
                  }
                }
              ],
              'extra' => {
                'end_command' => {}
              },
              'parent' => {},
              'source_info' => {
                'file_name' => '',
                'line_nr' => 2,
                'macro' => ''
              }
            },
            {
              'parent' => {},
              'text' => '
',
              'type' => 'empty_line'
            }
          ],
          'parent' => {},
          'type' => 'preamble_before_content'
        }
      ],
      'parent' => {},
      'type' => 'before_node_section'
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'Top'
            }
          ],
          'extra' => {
            'spaces_after_argument' => '
'
          },
          'parent' => {},
          'type' => 'line_arg'
        }
      ],
      'cmdname' => 'node',
      'contents' => [
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line'
        }
      ],
      'extra' => {
        'node_content' => [
          {}
        ],
        'nodes_manuals' => [
          {
            'node_content' => [
              {}
            ],
            'normalized' => 'Top'
          }
        ],
        'normalized' => 'Top',
        'spaces_before_argument' => ' '
      },
      'parent' => {},
      'source_info' => {
        'file_name' => '',
        'line_nr' => 9,
        'macro' => ''
      }
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'node'
            }
          ],
          'extra' => {
            'spaces_after_argument' => '
'
          },
          'parent' => {},
          'type' => 'line_arg'
        }
      ],
      'cmdname' => 'node',
      'contents' => [
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'args' => [
            {
              'parent' => {},
              'text' => '
',
              'type' => 'misc_arg'
            }
          ],
          'cmdname' => 'insertcopying',
          'parent' => {},
          'source_info' => {
            'file_name' => '',
            'line_nr' => 13,
            'macro' => ''
          }
        },
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'args' => [
            {
              'parent' => {},
              'text' => '
',
              'type' => 'misc_arg'
            }
          ],
          'cmdname' => 'insertcopying',
          'parent' => {},
          'source_info' => {
            'file_name' => '',
            'line_nr' => 15,
            'macro' => ''
          }
        },
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'contents' => [
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'Copying information'
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                }
              ],
              'cmdname' => 'xref',
              'contents' => [],
              'extra' => {
                'label' => {},
                'node_argument' => {
                  'node_content' => [
                    {}
                  ],
                  'normalized' => 'Copying-information'
                }
              },
              'parent' => {},
              'source_info' => {
                'file_name' => '',
                'line_nr' => 17,
                'macro' => ''
              }
            },
            {
              'parent' => {},
              'text' => '.
'
            }
          ],
          'parent' => {},
          'type' => 'paragraph'
        },
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line'
        }
      ],
      'extra' => {
        'node_content' => [
          {}
        ],
        'nodes_manuals' => [
          {
            'node_content' => [
              {}
            ],
            'normalized' => 'node'
          }
        ],
        'normalized' => 'node',
        'spaces_before_argument' => ' '
      },
      'parent' => {},
      'source_info' => {
        'file_name' => '',
        'line_nr' => 11,
        'macro' => ''
      }
    }
  ],
  'type' => 'document_root'
};
$result_trees{'anchor_in_copying'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'anchor_in_copying'}{'contents'}[0]{'contents'}[0];
$result_trees{'anchor_in_copying'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'anchor_in_copying'}{'contents'}[0];
$result_trees{'anchor_in_copying'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'anchor_in_copying'}{'contents'}[0]{'contents'}[1]{'contents'}[0];
$result_trees{'anchor_in_copying'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'anchor_in_copying'}{'contents'}[0]{'contents'}[1]{'contents'}[0];
$result_trees{'anchor_in_copying'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'anchor_in_copying'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[1];
$result_trees{'anchor_in_copying'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'anchor_in_copying'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'anchor_in_copying'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[1]{'contents'}[1]{'args'}[0]{'extra'}{'region'} = $result_trees{'anchor_in_copying'}{'contents'}[0]{'contents'}[1]{'contents'}[0];
$result_trees{'anchor_in_copying'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'anchor_in_copying'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[1]{'contents'}[1];
$result_trees{'anchor_in_copying'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[1]{'contents'}[1]{'extra'}{'node_content'}[0] = $result_trees{'anchor_in_copying'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'anchor_in_copying'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'anchor_in_copying'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[1];
$result_trees{'anchor_in_copying'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'anchor_in_copying'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[1];
$result_trees{'anchor_in_copying'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'anchor_in_copying'}{'contents'}[0]{'contents'}[1]{'contents'}[0];
$result_trees{'anchor_in_copying'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'anchor_in_copying'}{'contents'}[0]{'contents'}[1]{'contents'}[0];
$result_trees{'anchor_in_copying'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'anchor_in_copying'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[3]{'args'}[0];
$result_trees{'anchor_in_copying'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'anchor_in_copying'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[3];
$result_trees{'anchor_in_copying'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[3]{'parent'} = $result_trees{'anchor_in_copying'}{'contents'}[0]{'contents'}[1]{'contents'}[0];
$result_trees{'anchor_in_copying'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'extra'}{'end_command'} = $result_trees{'anchor_in_copying'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[3];
$result_trees{'anchor_in_copying'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'anchor_in_copying'}{'contents'}[0]{'contents'}[1];
$result_trees{'anchor_in_copying'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'anchor_in_copying'}{'contents'}[0]{'contents'}[1];
$result_trees{'anchor_in_copying'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'anchor_in_copying'}{'contents'}[0];
$result_trees{'anchor_in_copying'}{'contents'}[0]{'parent'} = $result_trees{'anchor_in_copying'};
$result_trees{'anchor_in_copying'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'anchor_in_copying'}{'contents'}[1]{'args'}[0];
$result_trees{'anchor_in_copying'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'anchor_in_copying'}{'contents'}[1];
$result_trees{'anchor_in_copying'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'anchor_in_copying'}{'contents'}[1];
$result_trees{'anchor_in_copying'}{'contents'}[1]{'extra'}{'node_content'}[0] = $result_trees{'anchor_in_copying'}{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'anchor_in_copying'}{'contents'}[1]{'extra'}{'nodes_manuals'}[0]{'node_content'}[0] = $result_trees{'anchor_in_copying'}{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'anchor_in_copying'}{'contents'}[1]{'parent'} = $result_trees{'anchor_in_copying'};
$result_trees{'anchor_in_copying'}{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'anchor_in_copying'}{'contents'}[2]{'args'}[0];
$result_trees{'anchor_in_copying'}{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'anchor_in_copying'}{'contents'}[2];
$result_trees{'anchor_in_copying'}{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'anchor_in_copying'}{'contents'}[2];
$result_trees{'anchor_in_copying'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'anchor_in_copying'}{'contents'}[2]{'contents'}[1];
$result_trees{'anchor_in_copying'}{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'anchor_in_copying'}{'contents'}[2];
$result_trees{'anchor_in_copying'}{'contents'}[2]{'contents'}[2]{'parent'} = $result_trees{'anchor_in_copying'}{'contents'}[2];
$result_trees{'anchor_in_copying'}{'contents'}[2]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'anchor_in_copying'}{'contents'}[2]{'contents'}[3];
$result_trees{'anchor_in_copying'}{'contents'}[2]{'contents'}[3]{'parent'} = $result_trees{'anchor_in_copying'}{'contents'}[2];
$result_trees{'anchor_in_copying'}{'contents'}[2]{'contents'}[4]{'parent'} = $result_trees{'anchor_in_copying'}{'contents'}[2];
$result_trees{'anchor_in_copying'}{'contents'}[2]{'contents'}[5]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'anchor_in_copying'}{'contents'}[2]{'contents'}[5]{'contents'}[0]{'args'}[0];
$result_trees{'anchor_in_copying'}{'contents'}[2]{'contents'}[5]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'anchor_in_copying'}{'contents'}[2]{'contents'}[5]{'contents'}[0];
$result_trees{'anchor_in_copying'}{'contents'}[2]{'contents'}[5]{'contents'}[0]{'extra'}{'label'} = $result_trees{'anchor_in_copying'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[1]{'contents'}[1];
$result_trees{'anchor_in_copying'}{'contents'}[2]{'contents'}[5]{'contents'}[0]{'extra'}{'node_argument'}{'node_content'}[0] = $result_trees{'anchor_in_copying'}{'contents'}[2]{'contents'}[5]{'contents'}[0]{'args'}[0]{'contents'}[0];
$result_trees{'anchor_in_copying'}{'contents'}[2]{'contents'}[5]{'contents'}[0]{'parent'} = $result_trees{'anchor_in_copying'}{'contents'}[2]{'contents'}[5];
$result_trees{'anchor_in_copying'}{'contents'}[2]{'contents'}[5]{'contents'}[1]{'parent'} = $result_trees{'anchor_in_copying'}{'contents'}[2]{'contents'}[5];
$result_trees{'anchor_in_copying'}{'contents'}[2]{'contents'}[5]{'parent'} = $result_trees{'anchor_in_copying'}{'contents'}[2];
$result_trees{'anchor_in_copying'}{'contents'}[2]{'contents'}[6]{'parent'} = $result_trees{'anchor_in_copying'}{'contents'}[2];
$result_trees{'anchor_in_copying'}{'contents'}[2]{'extra'}{'node_content'}[0] = $result_trees{'anchor_in_copying'}{'contents'}[2]{'args'}[0]{'contents'}[0];
$result_trees{'anchor_in_copying'}{'contents'}[2]{'extra'}{'nodes_manuals'}[0]{'node_content'}[0] = $result_trees{'anchor_in_copying'}{'contents'}[2]{'args'}[0]{'contents'}[0];
$result_trees{'anchor_in_copying'}{'contents'}[2]{'parent'} = $result_trees{'anchor_in_copying'};

$result_texis{'anchor_in_copying'} = '
@copying

Copying.
@anchor{Copying information}

@end copying

@node Top

@node node

@insertcopying

@insertcopying

@xref{Copying information}.

';


$result_texts{'anchor_in_copying'} = '




Copying information.

';

$result_nodes{'anchor_in_copying'} = {
  'cmdname' => 'node',
  'extra' => {
    'normalized' => 'Top'
  },
  'structure' => {
    'node_next' => {
      'cmdname' => 'node',
      'extra' => {
        'normalized' => 'node'
      },
      'structure' => {
        'node_prev' => {}
      }
    }
  }
};
$result_nodes{'anchor_in_copying'}{'structure'}{'node_next'}{'structure'}{'node_prev'} = $result_nodes{'anchor_in_copying'};

$result_menus{'anchor_in_copying'} = {
  'cmdname' => 'node',
  'extra' => {
    'normalized' => 'Top'
  },
  'structure' => {}
};

$result_errors{'anchor_in_copying'} = [];


$result_floats{'anchor_in_copying'} = {};



$result_converted{'info'}->{'anchor_in_copying'} = 'This is , produced from .

Copying.


File: ,  Node: Top,  Next: node,  Up: (dir)


File: ,  Node: node,  Prev: Top

Copying.

   Copying.

   *Note Copying information::.



Tag Table:
Node: Top37
Node: node84
Ref: Copying information127

End Tag Table


Local Variables:
coding: utf-8
End:
';

$result_converted_errors{'info'}->{'anchor_in_copying'} = [
  {
    'error_line' => '@anchor output more than once: Copying information
',
    'file_name' => '',
    'line_nr' => 5,
    'macro' => '',
    'text' => '@anchor output more than once: Copying information',
    'type' => 'error'
  }
];



$result_converted{'html'}->{'anchor_in_copying'} = '<!DOCTYPE html>
<html>
<!-- Created by texinfo, http://www.gnu.org/software/texinfo/ -->
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


</head>

<body lang="en">

<a class="node-id" id="Top"></a><div class="nav-panel">
<p>
Next: <a href="#node" accesskey="n" rel="next">node</a> &nbsp; </p>
</div>
<h1 class="node">Top</h1>

<hr>
<a class="node-id" id="node"></a><div class="nav-panel">
<p>
Previous: <a href="#Top" accesskey="p" rel="prev">Top</a> &nbsp; </p>
</div>
<h4 class="node">node</h4>


<p>Copying.
<a class="anchor" id="Copying-information"></a></p>


<p>Copying.
<a class="anchor" id="Copying-information"></a></p>

<p>See <a class="xref" href="#Copying-information">Copying information</a>.
</p>



</body>
</html>
';

$result_converted_errors{'html'}->{'anchor_in_copying'} = [
  {
    'error_line' => 'warning: must specify a title with a title command or @top
',
    'text' => 'must specify a title with a title command or @top',
    'type' => 'warning'
  }
];



$result_converted{'latex'}->{'anchor_in_copying'} = '
\\begin{document}
\\label{anchor:Top}%
\\label{anchor:node}%


Copying.
\\label{anchor:Copying-information}%



Copying.
\\label{anchor:Copying-information}%


See \\hyperref[anchor:Copying-information]{[Copying information], page~\\pageref*{anchor:Copying-information}}.

';

1;
