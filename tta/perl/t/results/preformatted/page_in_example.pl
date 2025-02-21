use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'page_in_example'} = {
  'contents' => [
    {
      'contents' => [
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
              'cmdname' => 'page',
              'contents' => [
                {
                  'text' => '
',
                  'type' => 'rawline_arg'
                }
              ]
            },
            {
              'contents' => [
                {
                  'text' => 'text
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
                'line_nr' => 4
              }
            }
          ],
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

$result_texis{'page_in_example'} = '@example
@page
text
@end example
';


$result_texts{'page_in_example'} = '
text
';

$result_errors{'page_in_example'} = [];


$result_floats{'page_in_example'} = {};



$result_converted{'plaintext'}->{'page_in_example'} = '     text
';


$result_converted{'html'}->{'page_in_example'} = '<!DOCTYPE html>
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
<div class="example">
<pre class="example-preformatted">text
</pre></div>



</body>
</html>
';

$result_converted_errors{'html'}->{'page_in_example'} = [
  {
    'error_line' => 'warning: must specify a title with a title command or @top
',
    'text' => 'must specify a title with a title command or @top',
    'type' => 'warning'
  }
];



$result_converted{'docbook'}->{'page_in_example'} = '<screen>text
</screen>';


$result_converted{'xml'}->{'page_in_example'} = '<example endspaces=" ">
<page></page>
<pre xml:space="preserve">text
</pre></example>
';


$result_converted{'latex_text'}->{'page_in_example'} = '\\begin{Texinfoindented}
\\newpage{}%
\\phantom{blabla}%
\\begin{Texinfopreformatted}%
\\ttfamily text
\\end{Texinfopreformatted}
\\end{Texinfoindented}
';

1;
