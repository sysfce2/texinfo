use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'heading_in_quotation'} = {
  'contents' => [
    {
      'contents' => [
        {
          'args' => [
            {
              'extra' => {
                'spaces_after_argument' => '
'
              },
              'parent' => {},
              'type' => 'block_line_arg'
            }
          ],
          'cmdname' => 'quotation',
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
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'in quotation '
                    },
                    {
                      'cmdname' => '@',
                      'parent' => {}
                    },
                    {
                      'parent' => {},
                      'text' => ' '
                    },
                    {
                      'args' => [
                        {
                          'contents' => [
                            {
                              'parent' => {},
                              'text' => 'heading'
                            }
                          ],
                          'parent' => {},
                          'type' => 'brace_command_arg'
                        }
                      ],
                      'cmdname' => 'emph',
                      'parent' => {},
                      'source_info' => {
                        'file_name' => '',
                        'line_nr' => 3,
                        'macro' => ''
                      }
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
              'cmdname' => 'heading',
              'extra' => {
                'spaces_before_argument' => ' '
              },
              'parent' => {},
              'source_info' => {
                'file_name' => '',
                'line_nr' => 3,
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
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'quotation'
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
                'text_arg' => 'quotation'
              },
              'parent' => {},
              'source_info' => {
                'file_name' => '',
                'line_nr' => 5,
                'macro' => ''
              }
            }
          ],
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
$result_trees{'heading_in_quotation'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'heading_in_quotation'}{'contents'}[0]{'contents'}[0];
$result_trees{'heading_in_quotation'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'heading_in_quotation'}{'contents'}[0]{'contents'}[0];
$result_trees{'heading_in_quotation'}{'contents'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'heading_in_quotation'}{'contents'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'heading_in_quotation'}{'contents'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'heading_in_quotation'}{'contents'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'heading_in_quotation'}{'contents'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'heading_in_quotation'}{'contents'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'heading_in_quotation'}{'contents'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'heading_in_quotation'}{'contents'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[3]{'args'}[0];
$result_trees{'heading_in_quotation'}{'contents'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'heading_in_quotation'}{'contents'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[3];
$result_trees{'heading_in_quotation'}{'contents'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'heading_in_quotation'}{'contents'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'heading_in_quotation'}{'contents'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'heading_in_quotation'}{'contents'}[0]{'contents'}[0]{'contents'}[1];
$result_trees{'heading_in_quotation'}{'contents'}[0]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'heading_in_quotation'}{'contents'}[0]{'contents'}[0];
$result_trees{'heading_in_quotation'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'heading_in_quotation'}{'contents'}[0]{'contents'}[0];
$result_trees{'heading_in_quotation'}{'contents'}[0]{'contents'}[0]{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'heading_in_quotation'}{'contents'}[0]{'contents'}[0]{'contents'}[3]{'args'}[0];
$result_trees{'heading_in_quotation'}{'contents'}[0]{'contents'}[0]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'heading_in_quotation'}{'contents'}[0]{'contents'}[0]{'contents'}[3];
$result_trees{'heading_in_quotation'}{'contents'}[0]{'contents'}[0]{'contents'}[3]{'parent'} = $result_trees{'heading_in_quotation'}{'contents'}[0]{'contents'}[0];
$result_trees{'heading_in_quotation'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'heading_in_quotation'}{'contents'}[0];
$result_trees{'heading_in_quotation'}{'contents'}[0]{'parent'} = $result_trees{'heading_in_quotation'};

$result_texis{'heading_in_quotation'} = '@quotation

@heading in quotation @@ @emph{heading}

@end quotation
';


$result_texts{'heading_in_quotation'} = '
in quotation @ heading
======================

';

$result_errors{'heading_in_quotation'} = [];


$result_floats{'heading_in_quotation'} = {};



$result_converted{'plaintext'}->{'heading_in_quotation'} = '     in quotation @ _heading_
     ========================

';


$result_converted{'html'}->{'heading_in_quotation'} = '<!DOCTYPE html>
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
<blockquote class="quotation">

<h3 class="heading" id="in-quotation-_0040-heading">in quotation @ <em class="emph">heading</em></h3>

</blockquote>



</body>
</html>
';

$result_converted_errors{'html'}->{'heading_in_quotation'} = [
  {
    'error_line' => 'warning: must specify a title with a title command or @top
',
    'text' => 'must specify a title with a title command or @top',
    'type' => 'warning'
  }
];


1;
