use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'displaymath'} = {
  'contents' => [
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
          'cmdname' => 'displaymath',
          'contents' => [
            {
              'parent' => {},
              'text' => '\\int_D ('
            },
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => '\\nabla\\cdot'
                }
              ],
              'parent' => {},
              'source_info' => {
                'file_name' => '',
                'line_nr' => 2,
                'macro' => ''
              },
              'type' => 'bracketed'
            },
            {
              'parent' => {},
              'text' => ' F)dV=\\int_'
            },
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => '\\partial D'
                }
              ],
              'parent' => {},
              'source_info' => {
                'file_name' => '',
                'line_nr' => 2,
                'macro' => ''
              },
              'type' => 'bracketed'
            },
            {
              'parent' => {},
              'text' => ' F\\cdot ndS
'
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'displaymath'
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
                'spaces_before_argument' => ' ',
                'text_arg' => 'displaymath'
              },
              'parent' => {},
              'source_info' => {
                'file_name' => '',
                'line_nr' => 3,
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
            'line_nr' => 1,
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
              'parent' => {},
              'text' => 'before
'
            }
          ],
          'parent' => {},
          'type' => 'paragraph'
        },
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
          'cmdname' => 'displaymath',
          'contents' => [
            {
              'parent' => {},
              'text' => '\\int_D ('
            },
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => '\\nabla\\cdot'
                }
              ],
              'parent' => {},
              'source_info' => {
                'file_name' => '',
                'line_nr' => 7,
                'macro' => ''
              },
              'type' => 'bracketed'
            },
            {
              'parent' => {},
              'text' => ' F)dV=\\int_'
            },
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => '\\partial D'
                }
              ],
              'parent' => {},
              'source_info' => {
                'file_name' => '',
                'line_nr' => 7,
                'macro' => ''
              },
              'type' => 'bracketed'
            },
            {
              'parent' => {},
              'text' => ' F\\cdot ndS
'
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'displaymath'
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
                'spaces_before_argument' => ' ',
                'text_arg' => 'displaymath'
              },
              'parent' => {},
              'source_info' => {
                'file_name' => '',
                'line_nr' => 8,
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
            'line_nr' => 6,
            'macro' => ''
          }
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'after
'
            }
          ],
          'parent' => {},
          'type' => 'paragraph'
        }
      ],
      'parent' => {},
      'type' => 'before_node_section'
    }
  ],
  'type' => 'document_root'
};
$result_trees{'displaymath'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'displaymath'}{'contents'}[0]{'contents'}[0];
$result_trees{'displaymath'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'displaymath'}{'contents'}[0]{'contents'}[0];
$result_trees{'displaymath'}{'contents'}[0]{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'displaymath'}{'contents'}[0]{'contents'}[0]{'contents'}[1];
$result_trees{'displaymath'}{'contents'}[0]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'displaymath'}{'contents'}[0]{'contents'}[0];
$result_trees{'displaymath'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'displaymath'}{'contents'}[0]{'contents'}[0];
$result_trees{'displaymath'}{'contents'}[0]{'contents'}[0]{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'displaymath'}{'contents'}[0]{'contents'}[0]{'contents'}[3];
$result_trees{'displaymath'}{'contents'}[0]{'contents'}[0]{'contents'}[3]{'parent'} = $result_trees{'displaymath'}{'contents'}[0]{'contents'}[0];
$result_trees{'displaymath'}{'contents'}[0]{'contents'}[0]{'contents'}[4]{'parent'} = $result_trees{'displaymath'}{'contents'}[0]{'contents'}[0];
$result_trees{'displaymath'}{'contents'}[0]{'contents'}[0]{'contents'}[5]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'displaymath'}{'contents'}[0]{'contents'}[0]{'contents'}[5]{'args'}[0];
$result_trees{'displaymath'}{'contents'}[0]{'contents'}[0]{'contents'}[5]{'args'}[0]{'parent'} = $result_trees{'displaymath'}{'contents'}[0]{'contents'}[0]{'contents'}[5];
$result_trees{'displaymath'}{'contents'}[0]{'contents'}[0]{'contents'}[5]{'parent'} = $result_trees{'displaymath'}{'contents'}[0]{'contents'}[0];
$result_trees{'displaymath'}{'contents'}[0]{'contents'}[0]{'extra'}{'end_command'} = $result_trees{'displaymath'}{'contents'}[0]{'contents'}[0]{'contents'}[5];
$result_trees{'displaymath'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'displaymath'}{'contents'}[0];
$result_trees{'displaymath'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'displaymath'}{'contents'}[0];
$result_trees{'displaymath'}{'contents'}[0]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'displaymath'}{'contents'}[0]{'contents'}[2];
$result_trees{'displaymath'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'displaymath'}{'contents'}[0];
$result_trees{'displaymath'}{'contents'}[0]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'displaymath'}{'contents'}[0]{'contents'}[3];
$result_trees{'displaymath'}{'contents'}[0]{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'displaymath'}{'contents'}[0]{'contents'}[3];
$result_trees{'displaymath'}{'contents'}[0]{'contents'}[3]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'displaymath'}{'contents'}[0]{'contents'}[3]{'contents'}[1];
$result_trees{'displaymath'}{'contents'}[0]{'contents'}[3]{'contents'}[1]{'parent'} = $result_trees{'displaymath'}{'contents'}[0]{'contents'}[3];
$result_trees{'displaymath'}{'contents'}[0]{'contents'}[3]{'contents'}[2]{'parent'} = $result_trees{'displaymath'}{'contents'}[0]{'contents'}[3];
$result_trees{'displaymath'}{'contents'}[0]{'contents'}[3]{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'displaymath'}{'contents'}[0]{'contents'}[3]{'contents'}[3];
$result_trees{'displaymath'}{'contents'}[0]{'contents'}[3]{'contents'}[3]{'parent'} = $result_trees{'displaymath'}{'contents'}[0]{'contents'}[3];
$result_trees{'displaymath'}{'contents'}[0]{'contents'}[3]{'contents'}[4]{'parent'} = $result_trees{'displaymath'}{'contents'}[0]{'contents'}[3];
$result_trees{'displaymath'}{'contents'}[0]{'contents'}[3]{'contents'}[5]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'displaymath'}{'contents'}[0]{'contents'}[3]{'contents'}[5]{'args'}[0];
$result_trees{'displaymath'}{'contents'}[0]{'contents'}[3]{'contents'}[5]{'args'}[0]{'parent'} = $result_trees{'displaymath'}{'contents'}[0]{'contents'}[3]{'contents'}[5];
$result_trees{'displaymath'}{'contents'}[0]{'contents'}[3]{'contents'}[5]{'parent'} = $result_trees{'displaymath'}{'contents'}[0]{'contents'}[3];
$result_trees{'displaymath'}{'contents'}[0]{'contents'}[3]{'extra'}{'end_command'} = $result_trees{'displaymath'}{'contents'}[0]{'contents'}[3]{'contents'}[5];
$result_trees{'displaymath'}{'contents'}[0]{'contents'}[3]{'parent'} = $result_trees{'displaymath'}{'contents'}[0];
$result_trees{'displaymath'}{'contents'}[0]{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'displaymath'}{'contents'}[0]{'contents'}[4];
$result_trees{'displaymath'}{'contents'}[0]{'contents'}[4]{'parent'} = $result_trees{'displaymath'}{'contents'}[0];
$result_trees{'displaymath'}{'contents'}[0]{'parent'} = $result_trees{'displaymath'};

$result_texis{'displaymath'} = '@displaymath
\\int_D ({\\nabla\\cdot} F)dV=\\int_{\\partial D} F\\cdot ndS
@end displaymath

before
@displaymath
\\int_D ({\\nabla\\cdot} F)dV=\\int_{\\partial D} F\\cdot ndS
@end displaymath
after
';


$result_texts{'displaymath'} = '\\int_D ({\\nabla\\cdot} F)dV=\\int_{\\partial D} F\\cdot ndS

before
\\int_D ({\\nabla\\cdot} F)dV=\\int_{\\partial D} F\\cdot ndS
after
';

$result_errors{'displaymath'} = [];


$result_floats{'displaymath'} = {};



$result_converted{'html'}->{'displaymath'} = '<!DOCTYPE html>
<html>
<!-- Created by texinfo, http://www.gnu.org/software/texinfo/ -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Untitled Document</title>

<meta name="description" content="Untitled Document">
<meta name="keywords" content="Untitled Document">
<meta name="resource-type" content="document">
<meta name="distribution" content="global">
<meta name="viewport" content="width=device-width,initial-scale=1">


<script type=\'text/javascript\'>
MathJax = {
  options: {
    skipHtmlTags: {\'[-]\': [\'pre\']},
    ignoreHtmlClass: \'tex2jax_ignore\',
    processHtmlClass: \'tex2jax_process\'
  },
};
</script><script type="text/javascript" id="MathJax-script" async
  src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-svg.js">
</script>
</head>

<body lang="en" class="tex2jax_ignore">
<div class="displaymath"><em class="tex2jax_process">\\[\\int_D ({\\nabla\\cdot} F)dV=\\int_{\\partial D} F\\cdot ndS
\\]</em></div>
<p>before
</p><div class="displaymath"><em class="tex2jax_process">\\[\\int_D ({\\nabla\\cdot} F)dV=\\int_{\\partial D} F\\cdot ndS
\\]</em></div><p>after
</p>

<a href="js_licenses.html" rel="jslicense"><small>JavaScript license information</small></a>
</body>
</html>
';

$result_converted_errors{'html'}->{'displaymath'} = [
  {
    'error_line' => 'warning: must specify a title with a title command or @top
',
    'text' => 'must specify a title with a title command or @top',
    'type' => 'warning'
  }
];



$result_converted{'docbook'}->{'displaymath'} = '<informalequation><mathphrase>\\int_D ({\\nabla\\cdot} F)dV=\\int_{\\partial D} F\\cdot ndS
</mathphrase></informalequation>
<para>before
</para><informalequation><mathphrase>\\int_D ({\\nabla\\cdot} F)dV=\\int_{\\partial D} F\\cdot ndS
</mathphrase></informalequation><para>after
</para>';


$result_converted{'plaintext'}->{'displaymath'} = '\\int_D ({\\nabla\\cdot} F)dV=\\int_{\\partial D} F\\cdot ndS

   before
\\int_D ({\\nabla\\cdot} F)dV=\\int_{\\partial D} F\\cdot ndS
   after
';

1;
