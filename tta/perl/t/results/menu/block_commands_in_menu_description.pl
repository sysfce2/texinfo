use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'block_commands_in_menu_description'} = {
  'contents' => [
    {
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
                  'text' => 'first'
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
        }
      ],
      'extra' => {
        'is_target' => 1,
        'normalized' => 'first'
      },
      'info' => {
        'spaces_before_argument' => {
          'text' => ' '
        }
      },
      'source_info' => {
        'line_nr' => 1
      }
    },
    {
      'cmdname' => 'top',
      'contents' => [
        {
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'top'
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
          'cmdname' => 'menu',
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
                  'text' => '* ',
                  'type' => 'menu_entry_leading_text'
                },
                {
                  'contents' => [
                    {
                      'text' => '('
                    },
                    {
                      'text' => 'manual'
                    },
                    {
                      'text' => ')'
                    }
                  ],
                  'extra' => {
                    'manual_content' => {
                      'contents' => [
                        {}
                      ]
                    }
                  },
                  'type' => 'menu_entry_node'
                },
                {
                  'text' => '::',
                  'type' => 'menu_entry_separator'
                },
                {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => '
'
                        }
                      ],
                      'type' => 'preformatted'
                    },
                    {
                      'cmdname' => 'itemize',
                      'contents' => [
                        {
                          'contents' => [
                            {
                              'contents' => [
                                {
                                  'cmdname' => 'bullet',
                                  'info' => {
                                    'inserted' => 1
                                  }
                                }
                              ],
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
                              'contents' => [
                                {
                                  'text' => '
',
                                  'type' => 'empty_line'
                                }
                              ],
                              'type' => 'preformatted'
                            }
                          ],
                          'type' => 'before_item'
                        },
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
                                },
                                {
                                  'text' => '
',
                                  'type' => 'empty_line'
                                }
                              ],
                              'type' => 'preformatted'
                            }
                          ],
                          'extra' => {
                            'item_number' => 1
                          },
                          'source_info' => {
                            'line_nr' => 8
                          }
                        },
                        {
                          'cmdname' => 'end',
                          'contents' => [
                            {
                              'contents' => [
                                {
                                  'text' => 'itemize'
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
                            'text_arg' => 'itemize'
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
                        'command_as_argument' => {}
                      },
                      'source_info' => {
                        'line_nr' => 6
                      }
                    },
                    {
                      'cmdname' => 'table',
                      'contents' => [
                        {
                          'contents' => [
                            {
                              'contents' => [
                                {
                                  'cmdname' => 'asis',
                                  'source_info' => {
                                    'line_nr' => 11
                                  }
                                }
                              ],
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
                              'contents' => [
                                {
                                  'text' => '
',
                                  'type' => 'empty_line'
                                }
                              ],
                              'type' => 'preformatted'
                            }
                          ],
                          'type' => 'before_item'
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
                                          'text' => 'table item'
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
                                  'info' => {
                                    'spaces_before_argument' => {
                                      'text' => ' '
                                    }
                                  },
                                  'source_info' => {
                                    'line_nr' => 13
                                  }
                                }
                              ],
                              'type' => 'table_term'
                            },
                            {
                              'contents' => [
                                {
                                  'contents' => [
                                    {
                                      'text' => '
',
                                      'type' => 'empty_line'
                                    },
                                    {
                                      'text' => 'Text.
'
                                    },
                                    {
                                      'text' => '
',
                                      'type' => 'empty_line'
                                    }
                                  ],
                                  'type' => 'preformatted'
                                }
                              ],
                              'type' => 'table_definition'
                            }
                          ],
                          'type' => 'table_entry'
                        },
                        {
                          'cmdname' => 'end',
                          'contents' => [
                            {
                              'contents' => [
                                {
                                  'text' => 'table'
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
                            'text_arg' => 'table'
                          },
                          'info' => {
                            'spaces_before_argument' => {
                              'text' => ' '
                            }
                          },
                          'source_info' => {
                            'line_nr' => 17
                          }
                        }
                      ],
                      'extra' => {
                        'command_as_argument' => {}
                      },
                      'info' => {
                        'spaces_before_argument' => {
                          'text' => ' '
                        }
                      },
                      'source_info' => {
                        'line_nr' => 11
                      }
                    },
                    {
                      'contents' => [
                        {
                          'cmdname' => 'html',
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
                                  'text' => '
',
                                  'type' => 'empty_line'
                                },
                                {
                                  'text' => '<b> in html </b>
'
                                },
                                {
                                  'text' => '
',
                                  'type' => 'empty_line'
                                }
                              ],
                              'type' => 'rawpreformatted'
                            },
                            {
                              'cmdname' => 'end',
                              'contents' => [
                                {
                                  'contents' => [
                                    {
                                      'text' => 'html'
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
                                'text_arg' => 'html'
                              },
                              'info' => {
                                'spaces_before_argument' => {
                                  'text' => ' '
                                }
                              },
                              'source_info' => {
                                'line_nr' => 22
                              }
                            }
                          ],
                          'source_info' => {
                            'line_nr' => 18
                          }
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
                          'text' => '
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
                            'line_nr' => 25
                          }
                        }
                      ],
                      'source_info' => {
                        'line_nr' => 23
                      }
                    }
                  ],
                  'type' => 'menu_entry_description'
                }
              ],
              'source_info' => {
                'line_nr' => 5
              },
              'type' => 'menu_entry'
            },
            {
              'cmdname' => 'end',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'menu'
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
                'text_arg' => 'menu'
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'line_nr' => 26
              }
            }
          ],
          'source_info' => {
            'line_nr' => 4
          }
        }
      ],
      'extra' => {},
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
  'type' => 'document_root'
};
$result_trees{'block_commands_in_menu_description'}{'contents'}[2]{'contents'}[2]{'contents'}[1]{'contents'}[1]{'extra'}{'manual_content'}{'contents'}[0] = $result_trees{'block_commands_in_menu_description'}{'contents'}[2]{'contents'}[2]{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'block_commands_in_menu_description'}{'contents'}[2]{'contents'}[2]{'contents'}[1]{'contents'}[3]{'contents'}[1]{'extra'}{'command_as_argument'} = $result_trees{'block_commands_in_menu_description'}{'contents'}[2]{'contents'}[2]{'contents'}[1]{'contents'}[3]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'contents'}[0];
$result_trees{'block_commands_in_menu_description'}{'contents'}[2]{'contents'}[2]{'contents'}[1]{'contents'}[3]{'contents'}[2]{'extra'}{'command_as_argument'} = $result_trees{'block_commands_in_menu_description'}{'contents'}[2]{'contents'}[2]{'contents'}[1]{'contents'}[3]{'contents'}[2]{'contents'}[0]{'contents'}[0]{'contents'}[0];

$result_texis{'block_commands_in_menu_description'} = '@node first
@top top

@menu
* (manual)::
@itemize

@item in item

@end itemize
@table @asis

@item table item

Text.

@end table
@html

<b> in html </b>

@end html
@verbatim

@end verbatim
@end menu
';


$result_texts{'block_commands_in_menu_description'} = 'top
***

* (manual)::

in item


table item

Text.


<b> in html </b>


';

$result_sectioning{'block_commands_in_menu_description'} = {
  'extra' => {
    'section_childs' => [
      {
        'cmdname' => 'top',
        'extra' => {
          'associated_node' => {
            'cmdname' => 'node',
            'extra' => {
              'normalized' => 'first'
            }
          },
          'section_level' => 0,
          'sectioning_root' => {}
        }
      }
    ],
    'section_level' => -1
  }
};
$result_sectioning{'block_commands_in_menu_description'}{'extra'}{'section_childs'}[0]{'extra'}{'sectioning_root'} = $result_sectioning{'block_commands_in_menu_description'};

$result_nodes{'block_commands_in_menu_description'} = [
  {
    'cmdname' => 'node',
    'extra' => {
      'associated_section' => {
        'cmdname' => 'top',
        'extra' => {}
      },
      'normalized' => 'first'
    }
  }
];

$result_menus{'block_commands_in_menu_description'} = [
  {
    'extra' => {
      'menus' => [
        {}
      ],
      'normalized' => 'first'
    }
  }
];

$result_errors{'block_commands_in_menu_description'} = [];


$result_floats{'block_commands_in_menu_description'} = {};



$result_converted{'plaintext'}->{'block_commands_in_menu_description'} = 'top
***

* Menu:

* (manual)::

   • in item


table item

     Text.


';


$result_converted{'html'}->{'block_commands_in_menu_description'} = '<!DOCTYPE html>
<html>
<!-- Created by texinfo, https://www.gnu.org/software/texinfo/ -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>top</title>

<meta name="description" content="top">
<meta name="keywords" content="top">
<meta name="resource-type" content="document">
<meta name="distribution" content="global">
<meta name="viewport" content="width=device-width,initial-scale=1">

<link href="#first" rel="start" title="first">
<style type="text/css">
<!--
a.copiable-link {visibility: hidden; text-decoration: none; line-height: 0em}
pre.menu-preformatted {font-family: serif}
span:hover a.copiable-link {visibility: visible}
td.menu-entry-description {vertical-align: top; padding-left: 1em}
td.menu-entry-destination {vertical-align: top}
ul.mark-bullet {list-style-type: disc}
-->
</style>


</head>

<body lang="en">
<div class="top-level-extent" id="first">
<h1 class="top" id="top"><span>top<a class="copiable-link" href="#top"> &para;</a></span></h1>

<table class="menu">
<tr><td class="menu-entry-destination">&bull; <a href="manual.html#Top" accesskey="1">(manual)</a>:</td><td class="menu-entry-description">
<ul class="itemize mark-bullet">
<li><pre class="menu-preformatted">

</pre></li><li><pre class="menu-preformatted">in item

</pre></li></ul>
<dl class="table">
<dd><pre class="menu-preformatted">

</pre></dd>
<dt>table item</dt>
<dd><pre class="menu-preformatted">

Text.

</pre></dd>
</dl>

<b> in html </b>

<pre class="verbatim">
</pre></td></tr>
</table>
</div>



</body>
</html>
';


$result_converted{'xml'}->{'block_commands_in_menu_description'} = '<node name="first" spaces=" "><nodename>first</nodename></node>
<top spaces=" "><sectiontitle>top</sectiontitle>

<menu endspaces=" ">
<menuentry><menuleadingtext>* </menuleadingtext><menunode>(manual)</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre><itemize commandarg="bullet" automaticcommandarg="on" endspaces=" "><itemprepend><formattingcommand command="bullet" automatic="on"/></itemprepend>
<beforefirstitem><pre xml:space="preserve">
</pre></beforefirstitem><listitem><prepend>&bullet;</prepend><pre xml:space="preserve"> in item

</pre></listitem></itemize>
<table commandarg="asis" spaces=" " endspaces=" ">
<beforefirstitem><pre xml:space="preserve">
</pre></beforefirstitem><tableentry><tableterm><item spaces=" "><itemformat command="asis">table item</itemformat></item>
</tableterm><tableitem><pre xml:space="preserve">
Text.

</pre></tableitem></tableentry></table>
<pre xml:space="preserve"><html endspaces=" ">

&lt;b&gt; in html &lt;/b&gt;

</html>
</pre><verbatim xml:space="preserve" endspaces=" ">

</verbatim>
</menudescription></menuentry></menu>
</top>
';

1;
