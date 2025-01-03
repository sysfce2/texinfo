use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'index_command_before_end_table'} = {
  'contents' => [
    {
      'contents' => [
        {
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'cmdname' => 'table',
          'contents' => [
            {
              'contents' => [
                {
                  'contents' => [
                    {
                      'cmdname' => 'code',
                      'source_info' => {
                        'line_nr' => 2
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
                      'cmdname' => 'item',
                      'contents' => [
                        {
                          'contents' => [
                            {
                              'text' => 'in item'
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
                        'line_nr' => 3
                      }
                    },
                    {
                      'cmdname' => 'itemx',
                      'contents' => [
                        {
                          'contents' => [
                            {
                              'text' => 'in itemx'
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
                        'line_nr' => 4
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
                          'text' => 'aaaaa
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
                      'cmdname' => 'vindex',
                      'contents' => [
                        {
                          'contents' => [
                            {
                              'text' => 'var'
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
                        'index_entry' => [
                          'vr',
                          1
                        ]
                      },
                      'info' => {
                        'command_name' => 'vindex',
                        'spaces_before_argument' => {
                          'text' => ' '
                        }
                      },
                      'source_info' => {
                        'line_nr' => 7
                      },
                      'type' => 'index_entry_command'
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
                'line_nr' => 8
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
            'line_nr' => 2
          }
        }
      ],
      'type' => 'before_node_section'
    }
  ],
  'type' => 'document_root'
};
$result_trees{'index_command_before_end_table'}{'contents'}[0]{'contents'}[1]{'extra'}{'command_as_argument'} = $result_trees{'index_command_before_end_table'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'contents'}[0];

$result_texis{'index_command_before_end_table'} = '
@table @code
@item in item
@itemx in itemx
aaaaa

@vindex var
@end table
';


$result_texts{'index_command_before_end_table'} = '
in item
in itemx
aaaaa

';

$result_errors{'index_command_before_end_table'} = [
  {
    'error_line' => 'warning: entry for index `vr\' outside of any node
',
    'line_nr' => 7,
    'text' => 'entry for index `vr\' outside of any node',
    'type' => 'warning'
  }
];


$result_floats{'index_command_before_end_table'} = {};


$result_indices_sort_strings{'index_command_before_end_table'} = {
  'vr' => [
    'var'
  ]
};



$result_converted{'plaintext'}->{'index_command_before_end_table'} = '‘in item’
‘in itemx’
     aaaaa

';


$result_converted{'html_text'}->{'index_command_before_end_table'} = '
<dl class="table">
<dt><code class="code">in item</code></dt>
<dt><code class="code">in itemx</code></dt>
<dd><p>aaaaa
</p>
<a class="index-entry-id" id="index-var"></a>
</dd>
</dl>
';


$result_converted{'xml'}->{'index_command_before_end_table'} = '
<table commandarg="code" spaces=" " endspaces=" ">
<tableentry><tableterm><item spaces=" "><itemformat command="code">in item</itemformat></item>
<itemx spaces=" "><itemformat command="code">in itemx</itemformat></itemx>
</tableterm><tableitem><para>aaaaa
</para>
<vindex index="vr" spaces=" "><indexterm index="vr" number="1">var</indexterm></vindex>
</tableitem></tableentry></table>
';


$result_converted{'docbook'}->{'index_command_before_end_table'} = '
<variablelist><varlistentry><term><literal>in item</literal>
</term><term><literal>in itemx</literal>
</term><listitem><para>aaaaa
</para>
<indexterm role="vr"><primary>var</primary></indexterm>
</listitem></varlistentry></variablelist>';

1;
