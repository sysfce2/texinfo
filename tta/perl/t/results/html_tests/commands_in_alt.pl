use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'commands_in_alt'} = {
  'contents' => [
    {
      'contents' => [
        {
          'cmdname' => 'image',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'f--ile'
                }
              ],
              'type' => 'brace_arg'
            },
            {
              'type' => 'brace_arg'
            },
            {
              'type' => 'brace_arg'
            },
            {
              'contents' => [
                {
                  'text' => 'alt -- '
                },
                {
                  'cmdname' => 'b',
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'in b'
                        }
                      ],
                      'type' => 'brace_container'
                    }
                  ],
                  'source_info' => {
                    'line_nr' => 1
                  }
                }
              ],
              'type' => 'brace_arg'
            }
          ],
          'extra' => {
            'input_encoding_name' => 'utf-8'
          },
          'source_info' => {
            'line_nr' => 1
          }
        },
        {
          'text' => '
'
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
                  'cmdname' => 'image',
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'f--ile'
                        }
                      ],
                      'type' => 'brace_arg'
                    },
                    {
                      'type' => 'brace_arg'
                    },
                    {
                      'type' => 'brace_arg'
                    },
                    {
                      'contents' => [
                        {
                          'text' => 'alt -- '
                        },
                        {
                          'cmdname' => 'b',
                          'contents' => [
                            {
                              'contents' => [
                                {
                                  'text' => 'in b'
                                }
                              ],
                              'type' => 'brace_container'
                            }
                          ],
                          'source_info' => {
                            'line_nr' => 4
                          }
                        }
                      ],
                      'type' => 'brace_arg'
                    }
                  ],
                  'extra' => {
                    'input_encoding_name' => 'utf-8'
                  },
                  'source_info' => {
                    'line_nr' => 4
                  }
                },
                {
                  'text' => '
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
                'line_nr' => 5
              }
            }
          ],
          'source_info' => {
            'line_nr' => 3
          }
        }
      ],
      'type' => 'before_node_section'
    }
  ],
  'type' => 'document_root'
};

$result_texis{'commands_in_alt'} = '@image{f--ile,,,alt -- @b{in b}}

@example
@image{f--ile,,,alt -- @b{in b}}
@end example
';


$result_texts{'commands_in_alt'} = 'f--ile

f--ile
';

$result_errors{'commands_in_alt'} = [];


$result_floats{'commands_in_alt'} = {};



$result_converted{'html'}->{'commands_in_alt'} = '<!DOCTYPE html>
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
<img class="image" src="f--ile.png" alt="alt &ndash; in b">

<div class="example">
<pre class="example-preformatted"><img class="image" src="f--ile.png" alt="alt &ndash; in b">
</pre></div>



</body>
</html>
';

$result_converted_errors{'html'}->{'commands_in_alt'} = [
  {
    'error_line' => 'warning: must specify a title with a title command or @top
',
    'text' => 'must specify a title with a title command or @top',
    'type' => 'warning'
  }
];


1;
