use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'simple'} = {
  'contents' => [
    {
      'contents' => [
        {
          'contents' => [],
          'parent' => {},
          'type' => 'preamble_before_content'
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'Type'
                }
              ],
              'parent' => {},
              'type' => 'block_line_arg'
            },
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'Label'
                }
              ],
              'extra' => {
                'spaces_after_argument' => '
',
                'spaces_before_argument' => ' '
              },
              'parent' => {},
              'type' => 'block_line_arg'
            }
          ],
          'cmdname' => 'float',
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
                  'text' => 'In float.
'
                }
              ],
              'parent' => {},
              'type' => 'paragraph'
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'Caption.'
                        }
                      ],
                      'parent' => {},
                      'type' => 'paragraph'
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_context'
                }
              ],
              'cmdname' => 'caption',
              'contents' => [],
              'extra' => {
                'float' => {}
              },
              'parent' => {},
              'source_info' => {
                'file_name' => '',
                'line_nr' => 4,
                'macro' => ''
              }
            },
            {
              'parent' => {},
              'text' => '
'
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'float'
                    }
                  ],
                  'parent' => {},
                  'type' => 'line_arg'
                }
              ],
              'cmdname' => 'end',
              'extra' => {
                'spaces_before_argument' => ' ',
                'text_arg' => 'float'
              },
              'parent' => {},
              'source_info' => {
                'file_name' => '',
                'line_nr' => 5,
                'macro' => ''
              }
            }
          ],
          'extra' => {
            'caption' => {},
            'end_command' => {},
            'node_content' => [
              {}
            ],
            'normalized' => 'Label',
            'spaces_before_argument' => ' ',
            'type' => {
              'content' => [
                {}
              ],
              'normalized' => 'Type'
            }
          },
          'parent' => {},
          'source_info' => {
            'file_name' => '',
            'line_nr' => 1,
            'macro' => ''
          }
        }
      ],
      'parent' => {},
      'type' => 'before_node_section'
    }
  ],
  'type' => 'document_root'
};
$result_trees{'simple'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'simple'}{'contents'}[0];
$result_trees{'simple'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'simple'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'simple'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'simple'}{'contents'}[0]{'contents'}[1];
$result_trees{'simple'}{'contents'}[0]{'contents'}[1]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'simple'}{'contents'}[0]{'contents'}[1]{'args'}[1];
$result_trees{'simple'}{'contents'}[0]{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'simple'}{'contents'}[0]{'contents'}[1];
$result_trees{'simple'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'simple'}{'contents'}[0]{'contents'}[1];
$result_trees{'simple'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'simple'}{'contents'}[0]{'contents'}[1]{'contents'}[1];
$result_trees{'simple'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'simple'}{'contents'}[0]{'contents'}[1];
$result_trees{'simple'}{'contents'}[0]{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'simple'}{'contents'}[0]{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[0];
$result_trees{'simple'}{'contents'}[0]{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'simple'}{'contents'}[0]{'contents'}[1]{'contents'}[2]{'args'}[0];
$result_trees{'simple'}{'contents'}[0]{'contents'}[1]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'simple'}{'contents'}[0]{'contents'}[1]{'contents'}[2];
$result_trees{'simple'}{'contents'}[0]{'contents'}[1]{'contents'}[2]{'extra'}{'float'} = $result_trees{'simple'}{'contents'}[0]{'contents'}[1];
$result_trees{'simple'}{'contents'}[0]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'simple'}{'contents'}[0]{'contents'}[1];
$result_trees{'simple'}{'contents'}[0]{'contents'}[1]{'contents'}[3]{'parent'} = $result_trees{'simple'}{'contents'}[0]{'contents'}[1];
$result_trees{'simple'}{'contents'}[0]{'contents'}[1]{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'simple'}{'contents'}[0]{'contents'}[1]{'contents'}[4]{'args'}[0];
$result_trees{'simple'}{'contents'}[0]{'contents'}[1]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'simple'}{'contents'}[0]{'contents'}[1]{'contents'}[4];
$result_trees{'simple'}{'contents'}[0]{'contents'}[1]{'contents'}[4]{'parent'} = $result_trees{'simple'}{'contents'}[0]{'contents'}[1];
$result_trees{'simple'}{'contents'}[0]{'contents'}[1]{'extra'}{'caption'} = $result_trees{'simple'}{'contents'}[0]{'contents'}[1]{'contents'}[2];
$result_trees{'simple'}{'contents'}[0]{'contents'}[1]{'extra'}{'end_command'} = $result_trees{'simple'}{'contents'}[0]{'contents'}[1]{'contents'}[4];
$result_trees{'simple'}{'contents'}[0]{'contents'}[1]{'extra'}{'node_content'}[0] = $result_trees{'simple'}{'contents'}[0]{'contents'}[1]{'args'}[1]{'contents'}[0];
$result_trees{'simple'}{'contents'}[0]{'contents'}[1]{'extra'}{'type'}{'content'}[0] = $result_trees{'simple'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'simple'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'simple'}{'contents'}[0];
$result_trees{'simple'}{'contents'}[0]{'parent'} = $result_trees{'simple'};

$result_texis{'simple'} = '@float Type, Label

In float.
@caption{Caption.}
@end float';


$result_texts{'simple'} = 'Type, Label

In float.

';

$result_errors{'simple'} = [];


$result_floats{'simple'} = {
  'Type' => [
    {
      'cmdname' => 'float',
      'extra' => {
        'caption' => {
          'cmdname' => 'caption',
          'extra' => {
            'float' => {}
          }
        },
        'normalized' => 'Label',
        'type' => {
          'content' => [
            {
              'text' => 'Type'
            }
          ],
          'normalized' => 'Type'
        }
      },
      'structure' => {
        'float_number' => 1
      }
    }
  ]
};
$result_floats{'simple'}{'Type'}[0]{'extra'}{'caption'}{'extra'}{'float'} = $result_floats{'simple'}{'Type'}[0];



$result_converted{'plaintext'}->{'simple'} = 'In float.


Type 1: Caption.
';


$result_converted{'html'}->{'simple'} = '<!DOCTYPE html>
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



</head>

<body lang="en">
<div class="float" id="Label">

<p>In float.
</p>
<div class="caption"><p><strong class="strong">Type 1: </strong>Caption.</p></div></div>


</body>
</html>
';

$result_converted_errors{'html'}->{'simple'} = [
  {
    'error_line' => 'warning: must specify a title with a title command or @top
',
    'text' => 'must specify a title with a title command or @top',
    'type' => 'warning'
  }
];


1;
