use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'verbatim_in_multitable_in_example'} = {
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
              'cmdname' => 'multitable',
              'contents' => [
                {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'cmdname' => 'columnfractions',
                          'contents' => [
                            {
                              'contents' => [
                                {
                                  'text' => '0.5 0.5'
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
                            'misc_args' => [
                              '0.5',
                              '0.5'
                            ]
                          },
                          'info' => {
                            'spaces_before_argument' => {
                              'text' => ' '
                            }
                          },
                          'source_info' => {
                            'line_nr' => 2
                          }
                        }
                      ],
                      'type' => 'block_line_arg'
                    }
                  ],
                  'type' => 'arguments_line'
                },
                {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'cmdname' => 'item',
                          'contents' => [
                            {
                              'contents' => [
                                {
                                  'text' => ' ',
                                  'type' => 'ignorable_spaces_after_command'
                                },
                                {
                                  'text' => 'in item
'
                                }
                              ],
                              'type' => 'preformatted'
                            }
                          ],
                          'extra' => {
                            'cell_number' => 1
                          },
                          'source_info' => {
                            'line_nr' => 3
                          }
                        },
                        {
                          'cmdname' => 'tab',
                          'contents' => [
                            {
                              'contents' => [
                                {
                                  'text' => ' ',
                                  'type' => 'ignorable_spaces_after_command'
                                },
                                {
                                  'text' => 'in tab
'
                                }
                              ],
                              'type' => 'preformatted'
                            }
                          ],
                          'extra' => {
                            'cell_number' => 2
                          },
                          'source_info' => {
                            'line_nr' => 4
                          }
                        }
                      ],
                      'extra' => {
                        'row_number' => 1
                      },
                      'type' => 'row'
                    },
                    {
                      'contents' => [
                        {
                          'cmdname' => 'item',
                          'contents' => [
                            {
                              'contents' => [
                                {
                                  'text' => '
',
                                  'type' => 'ignorable_spaces_after_command'
                                }
                              ],
                              'type' => 'preformatted'
                            },
                            {
                              'cmdname' => 'verbatim',
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
                                  'text' => 'in first column, verbatim
',
                                  'type' => 'raw'
                                },
                                {
                                  'cmdname' => 'end',
                                  'contents' => [
                                    {
                                      'contents' => [
                                        {
                                          'text' => 'verbatim'
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
                                    'text_arg' => 'verbatim'
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
                                'line_nr' => 6
                              }
                            }
                          ],
                          'extra' => {
                            'cell_number' => 1
                          },
                          'source_info' => {
                            'line_nr' => 5
                          }
                        },
                        {
                          'cmdname' => 'tab',
                          'contents' => [
                            {
                              'contents' => [
                                {
                                  'text' => '
',
                                  'type' => 'ignorable_spaces_after_command'
                                }
                              ],
                              'type' => 'preformatted'
                            },
                            {
                              'cmdname' => 'verbatiminclude',
                              'contents' => [
                                {
                                  'contents' => [
                                    {
                                      'text' => 'inc_file.texi'
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
                                'input_encoding_name' => 'utf-8',
                                'text_arg' => 'inc_file.texi'
                              },
                              'info' => {
                                'spaces_before_argument' => {
                                  'text' => ' '
                                }
                              },
                              'source_info' => {
                                'line_nr' => 10
                              }
                            }
                          ],
                          'extra' => {
                            'cell_number' => 2
                          },
                          'source_info' => {
                            'line_nr' => 9
                          }
                        }
                      ],
                      'extra' => {
                        'row_number' => 2
                      },
                      'type' => 'row'
                    }
                  ],
                  'type' => 'multitable_body'
                },
                {
                  'cmdname' => 'end',
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'multitable'
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
                    'text_arg' => 'multitable'
                  },
                  'info' => {
                    'spaces_before_argument' => {
                      'text' => ' '
                    }
                  },
                  'source_info' => {
                    'line_nr' => 11
                  }
                }
              ],
              'extra' => {
                'columnfractions' => {},
                'max_columns' => 2
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'line_nr' => 2
              }
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
                'line_nr' => 12
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
$result_trees{'verbatim_in_multitable_in_example'}{'contents'}[0]{'contents'}[0]{'contents'}[1]{'extra'}{'columnfractions'} = $result_trees{'verbatim_in_multitable_in_example'}{'contents'}[0]{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'contents'}[0];

$result_texis{'verbatim_in_multitable_in_example'} = '@example
@multitable @columnfractions 0.5 0.5
@item in item
@tab in tab
@item
@verbatim
in first column, verbatim
@end verbatim
@tab
@verbatiminclude inc_file.texi
@end multitable
@end example
';


$result_texts{'verbatim_in_multitable_in_example'} = 'in item
in tab
in first column, verbatim
';

$result_errors{'verbatim_in_multitable_in_example'} = [];


$result_floats{'verbatim_in_multitable_in_example'} = {};



$result_converted{'html'}->{'verbatim_in_multitable_in_example'} = '<!DOCTYPE html>
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
<table class="multitable">
<tbody><tr><td width="50%"><pre class="example-preformatted">in item</pre></td><td width="50%"><pre class="example-preformatted">in tab</pre></td></tr>
<tr><td width="50%"><pre class="verbatim">in first column, verbatim
</pre></td><td width="50%"><pre class="verbatim">In included file.
</pre></td></tr>
</tbody>
</table>
</div>



</body>
</html>
';

$result_converted_errors{'html'}->{'verbatim_in_multitable_in_example'} = [
  {
    'error_line' => 'warning: must specify a title with a title command or @top
',
    'text' => 'must specify a title with a title command or @top',
    'type' => 'warning'
  }
];


1;
