use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'unknown_region'} = {
  'contents' => [
    {
      'contents' => [
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'fr_NOWHERE'
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
          'cmdname' => 'documentlanguage',
          'extra' => {
            'spaces_before_argument' => ' ',
            'text_arg' => 'fr_NOWHERE'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 1,
            'macro' => ''
          },
          'parent' => {}
        },
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line'
        }
      ],
      'parent' => {},
      'type' => 'text_root'
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
        },
        {
          'cmdname' => 'defivar',
          'contents' => [
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'extra' => {
                            'documentlanguage' => 'fr_NOWHERE'
                          },
                          'parent' => {},
                          'text' => 'Instance Variable',
                          'type' => 'untranslated'
                        }
                      ],
                      'extra' => {
                        'def_role' => 'category'
                      },
                      'parent' => {},
                      'type' => 'bracketed_inserted'
                    },
                    {
                      'extra' => {
                        'def_role' => 'spaces'
                      },
                      'parent' => {},
                      'text' => ' ',
                      'type' => 'spaces_inserted'
                    },
                    {
                      'extra' => {
                        'def_role' => 'class'
                      },
                      'text' => 'AAA'
                    },
                    {
                      'extra' => {
                        'def_role' => 'spaces'
                      },
                      'parent' => {},
                      'text' => ' ',
                      'type' => 'spaces'
                    },
                    {
                      'extra' => {
                        'def_role' => 'name'
                      },
                      'text' => 'BBB'
                    },
                    {
                      'extra' => {
                        'def_role' => 'spaces'
                      },
                      'parent' => {},
                      'text' => ' ',
                      'type' => 'spaces'
                    },
                    {
                      'extra' => {
                        'def_role' => 'arg'
                      },
                      'parent' => {},
                      'text' => 'CCC'
                    },
                    {
                      'extra' => {
                        'def_role' => 'spaces'
                      },
                      'parent' => {},
                      'text' => '
',
                      'type' => 'spaces_at_end'
                    }
                  ],
                  'parent' => {},
                  'type' => 'block_line_arg'
                }
              ],
              'extra' => {
                'def_command' => 'defivar',
                'def_parsed_hash' => {
                  'category' => {},
                  'class' => {},
                  'name' => {}
                },
                'documentlanguage' => 'fr_NOWHERE',
                'index_entry' => {
                  'command' => {},
                  'content' => [
                    {},
                    {
                      'text' => ' de '
                    },
                    {}
                  ],
                  'content_normalized' => [
                    {},
                    {
                      'text' => ' of '
                    },
                    {}
                  ],
                  'in_code' => 1,
                  'index_at_command' => 'defivar',
                  'index_ignore_chars' => {},
                  'index_name' => 'vr',
                  'index_type_command' => 'defivar',
                  'node' => {},
                  'number' => 1
                },
                'original_def_cmdname' => 'defivar'
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 5,
                'macro' => ''
              },
              'parent' => {},
              'type' => 'def_line'
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'defivar'
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
                'command_argument' => 'defivar',
                'spaces_before_argument' => ' ',
                'text_arg' => 'defivar'
              },
              'line_nr' => {
                'file_name' => '',
                'line_nr' => 6,
                'macro' => ''
              },
              'parent' => {}
            }
          ],
          'extra' => {
            'end_command' => {},
            'spaces_before_argument' => ' '
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 5,
            'macro' => ''
          },
          'parent' => {}
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
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 3,
        'macro' => ''
      },
      'parent' => {}
    }
  ],
  'type' => 'document_root'
};
$result_trees{'unknown_region'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'unknown_region'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'unknown_region'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'unknown_region'}{'contents'}[0]{'contents'}[0];
$result_trees{'unknown_region'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'unknown_region'}{'contents'}[0];
$result_trees{'unknown_region'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'unknown_region'}{'contents'}[0];
$result_trees{'unknown_region'}{'contents'}[0]{'parent'} = $result_trees{'unknown_region'};
$result_trees{'unknown_region'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'unknown_region'}{'contents'}[1]{'args'}[0];
$result_trees{'unknown_region'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'unknown_region'}{'contents'}[1];
$result_trees{'unknown_region'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'unknown_region'}{'contents'}[1];
$result_trees{'unknown_region'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'unknown_region'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[0];
$result_trees{'unknown_region'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'unknown_region'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[0];
$result_trees{'unknown_region'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'unknown_region'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[0];
$result_trees{'unknown_region'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'unknown_region'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[0];
$result_trees{'unknown_region'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[5]{'parent'} = $result_trees{'unknown_region'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[0];
$result_trees{'unknown_region'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[6]{'parent'} = $result_trees{'unknown_region'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[0];
$result_trees{'unknown_region'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[7]{'parent'} = $result_trees{'unknown_region'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[0];
$result_trees{'unknown_region'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'unknown_region'}{'contents'}[1]{'contents'}[1]{'contents'}[0];
$result_trees{'unknown_region'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'unknown_region'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[0];
$result_trees{'unknown_region'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'class'} = $result_trees{'unknown_region'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'unknown_region'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'unknown_region'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[4];
$result_trees{'unknown_region'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'unknown_region'}{'contents'}[1]{'contents'}[1]{'contents'}[0];
$result_trees{'unknown_region'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'unknown_region'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[4];
$result_trees{'unknown_region'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[2] = $result_trees{'unknown_region'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'unknown_region'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'extra'}{'index_entry'}{'content_normalized'}[0] = $result_trees{'unknown_region'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[4];
$result_trees{'unknown_region'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'extra'}{'index_entry'}{'content_normalized'}[2] = $result_trees{'unknown_region'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'unknown_region'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'extra'}{'index_entry'}{'node'} = $result_trees{'unknown_region'}{'contents'}[1];
$result_trees{'unknown_region'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'unknown_region'}{'contents'}[1]{'contents'}[1];
$result_trees{'unknown_region'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'unknown_region'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'unknown_region'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'unknown_region'}{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'unknown_region'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'unknown_region'}{'contents'}[1]{'contents'}[1];
$result_trees{'unknown_region'}{'contents'}[1]{'contents'}[1]{'extra'}{'end_command'} = $result_trees{'unknown_region'}{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'unknown_region'}{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'unknown_region'}{'contents'}[1];
$result_trees{'unknown_region'}{'contents'}[1]{'extra'}{'node_content'}[0] = $result_trees{'unknown_region'}{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'unknown_region'}{'contents'}[1]{'extra'}{'nodes_manuals'}[0]{'node_content'}[0] = $result_trees{'unknown_region'}{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'unknown_region'}{'contents'}[1]{'parent'} = $result_trees{'unknown_region'};

$result_texis{'unknown_region'} = '@documentlanguage fr_NOWHERE

@node Top

@defivar AAA BBB CCC
@end defivar
';


$result_texts{'unknown_region'} = '

Instance Variable of AAA: BBB CCC
';

$result_nodes{'unknown_region'} = {
  'cmdname' => 'node',
  'extra' => {
    'normalized' => 'Top',
    'spaces_before_argument' => ' '
  }
};

$result_menus{'unknown_region'} = {
  'cmdname' => 'node',
  'extra' => {
    'normalized' => 'Top',
    'spaces_before_argument' => ' '
  }
};

$result_errors{'unknown_region'} = [
  {
    'error_line' => ':1: warning: NOWHERE is not a valid region code
',
    'file_name' => '',
    'line_nr' => 1,
    'macro' => '',
    'text' => 'NOWHERE is not a valid region code',
    'type' => 'warning'
  }
];


$result_floats{'unknown_region'} = {};


$result_indices_sort_strings{'unknown_region'} = {
  'vr' => [
    'BBB de AAA'
  ]
};



$result_converted{'plaintext'}->{'unknown_region'} = ' -- Variable d\'instance de AAA : BBB CCC
';


$result_converted{'info'}->{'unknown_region'} = 'This is , produced from .


File: ,  Node: Top,  Up: (dir)

 -- Variable d\'instance de AAA : BBB CCC


Tag Table:
Node: Top27

End Tag Table


Local Variables:
coding: utf-8
End:
';


$result_converted{'html'}->{'unknown_region'} = '<!DOCTYPE html>
<html>
<!-- Created by texinfo, http://www.gnu.org/software/texinfo/ -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Document sans titre</title>

<meta name="description" content="Document sans titre">
<meta name="keywords" content="Document sans titre">
<meta name="resource-type" content="document">
<meta name="distribution" content="global">
<meta name="viewport" content="width=device-width,initial-scale=1">

<link href="#Top" rel="start" title="Top">
<style type="text/css">
<!--
a.copiable-anchor {visibility: hidden; text-decoration: none; line-height: 0em}
a.summary-letter {text-decoration: none}
blockquote.indentedblock {margin-right: 0em}
div.center-align {text-align:center}
div.display {margin-left: 3.2em}
div.example {margin-left: 3.2em}
h1.center-align {text-align:center}
h2.center-align {text-align:center}
h3.center-align {text-align:center}
h3.right-align {text-align:right}
h4.center-align {text-align:center}
kbd {font-style: oblique}
p.center-align {text-align:center}
p.left-align {text-align:left}
p.right-align {text-align:right}
pre.display {font-family: inherit}
pre.format {font-family: inherit}
pre.menu-comment {font-family: serif}
pre.menu-preformatted {font-family: serif}
span.nolinebreak {white-space: nowrap}
span.roman {font-family: initial; font-weight: normal}
span.sansserif {font-family: sans-serif; font-weight: normal}
span:hover a.copiable-anchor {visibility: visible}
ul.no-bullet {list-style: none}
-->
</style>


</head>

<body lang="fr_NOWHERE">

<h1 class="node-heading" id="Top">Top</h1>

<dl class="def">
<dt id="index-BBB-of-AAA"><span>Variable d\'instance de AAA&nbsp;: <strong>BBB</strong> <em>CCC</em><a href=\'#index-BBB-of-AAA\' class=\'copiable-anchor\'> &para;</a></span></dt>
</dl>



</body>
</html>
';

$result_converted_errors{'html'}->{'unknown_region'} = [
  {
    'error_line' => 'warning: must specify a title with a title command or @top
',
    'text' => 'must specify a title with a title command or @top',
    'type' => 'warning'
  }
];


1;
