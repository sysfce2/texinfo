use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'definfoenclose_on_table_line'} = {
  'contents' => [
    {
      'contents' => [
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'phi,:,:'
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
          'cmdname' => 'definfoenclose',
          'extra' => {
            'misc_args' => [
              'phi',
              ':',
              ':'
            ],
            'spaces_before_argument' => ' '
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
          'args' => [
            {
              'contents' => [
                {
                  'cmdname' => 'phi',
                  'extra' => {
                    'begin' => ':',
                    'end' => ':'
                  },
                  'parent' => {},
                  'source_info' => {
                    'file_name' => '',
                    'line_nr' => 3,
                    'macro' => ''
                  },
                  'type' => 'definfoenclose_command'
                }
              ],
              'extra' => {
                'spaces_after_argument' => '
'
              },
              'parent' => {},
              'type' => 'block_line_arg'
            }
          ],
          'cmdname' => 'table',
          'contents' => [
            {
              'contents' => [
                {
                  'contents' => [
                    {
                      'args' => [
                        {
                          'contents' => [
                            {
                              'parent' => {},
                              'text' => 'item'
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
                      'cmdname' => 'item',
                      'extra' => {
                        'spaces_before_argument' => ' '
                      },
                      'parent' => {},
                      'source_info' => {
                        'file_name' => '',
                        'line_nr' => 4,
                        'macro' => ''
                      }
                    },
                    {
                      'args' => [
                        {
                          'contents' => [
                            {
                              'parent' => {},
                              'text' => 'item x'
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
                      'cmdname' => 'itemx',
                      'extra' => {
                        'spaces_before_argument' => ' '
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
                  'type' => 'table_term'
                },
                {
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
                          'text' => 'table content.
'
                        }
                      ],
                      'parent' => {},
                      'type' => 'paragraph'
                    }
                  ],
                  'parent' => {},
                  'type' => 'table_item'
                }
              ],
              'parent' => {},
              'type' => 'table_entry'
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'table'
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
                'text_arg' => 'table'
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
            'command_as_argument' => {},
            'spaces_before_argument' => ' '
          },
          'parent' => {},
          'source_info' => {
            'file_name' => '',
            'line_nr' => 3,
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
$result_trees{'definfoenclose_on_table_line'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'definfoenclose_on_table_line'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'definfoenclose_on_table_line'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'definfoenclose_on_table_line'}{'contents'}[0]{'contents'}[0];
$result_trees{'definfoenclose_on_table_line'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'definfoenclose_on_table_line'}{'contents'}[0];
$result_trees{'definfoenclose_on_table_line'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'definfoenclose_on_table_line'}{'contents'}[0];
$result_trees{'definfoenclose_on_table_line'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'definfoenclose_on_table_line'}{'contents'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'definfoenclose_on_table_line'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'definfoenclose_on_table_line'}{'contents'}[0]{'contents'}[2];
$result_trees{'definfoenclose_on_table_line'}{'contents'}[0]{'contents'}[2]{'contents'}[0]{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'definfoenclose_on_table_line'}{'contents'}[0]{'contents'}[2]{'contents'}[0]{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'definfoenclose_on_table_line'}{'contents'}[0]{'contents'}[2]{'contents'}[0]{'contents'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'definfoenclose_on_table_line'}{'contents'}[0]{'contents'}[2]{'contents'}[0]{'contents'}[0]{'contents'}[0];
$result_trees{'definfoenclose_on_table_line'}{'contents'}[0]{'contents'}[2]{'contents'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'definfoenclose_on_table_line'}{'contents'}[0]{'contents'}[2]{'contents'}[0]{'contents'}[0];
$result_trees{'definfoenclose_on_table_line'}{'contents'}[0]{'contents'}[2]{'contents'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'definfoenclose_on_table_line'}{'contents'}[0]{'contents'}[2]{'contents'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'definfoenclose_on_table_line'}{'contents'}[0]{'contents'}[2]{'contents'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'definfoenclose_on_table_line'}{'contents'}[0]{'contents'}[2]{'contents'}[0]{'contents'}[0]{'contents'}[1];
$result_trees{'definfoenclose_on_table_line'}{'contents'}[0]{'contents'}[2]{'contents'}[0]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'definfoenclose_on_table_line'}{'contents'}[0]{'contents'}[2]{'contents'}[0]{'contents'}[0];
$result_trees{'definfoenclose_on_table_line'}{'contents'}[0]{'contents'}[2]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'definfoenclose_on_table_line'}{'contents'}[0]{'contents'}[2]{'contents'}[0];
$result_trees{'definfoenclose_on_table_line'}{'contents'}[0]{'contents'}[2]{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'definfoenclose_on_table_line'}{'contents'}[0]{'contents'}[2]{'contents'}[0]{'contents'}[1];
$result_trees{'definfoenclose_on_table_line'}{'contents'}[0]{'contents'}[2]{'contents'}[0]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'definfoenclose_on_table_line'}{'contents'}[0]{'contents'}[2]{'contents'}[0]{'contents'}[1]{'contents'}[1];
$result_trees{'definfoenclose_on_table_line'}{'contents'}[0]{'contents'}[2]{'contents'}[0]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'definfoenclose_on_table_line'}{'contents'}[0]{'contents'}[2]{'contents'}[0]{'contents'}[1];
$result_trees{'definfoenclose_on_table_line'}{'contents'}[0]{'contents'}[2]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'definfoenclose_on_table_line'}{'contents'}[0]{'contents'}[2]{'contents'}[0];
$result_trees{'definfoenclose_on_table_line'}{'contents'}[0]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'definfoenclose_on_table_line'}{'contents'}[0]{'contents'}[2];
$result_trees{'definfoenclose_on_table_line'}{'contents'}[0]{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'definfoenclose_on_table_line'}{'contents'}[0]{'contents'}[2]{'contents'}[1]{'args'}[0];
$result_trees{'definfoenclose_on_table_line'}{'contents'}[0]{'contents'}[2]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'definfoenclose_on_table_line'}{'contents'}[0]{'contents'}[2]{'contents'}[1];
$result_trees{'definfoenclose_on_table_line'}{'contents'}[0]{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'definfoenclose_on_table_line'}{'contents'}[0]{'contents'}[2];
$result_trees{'definfoenclose_on_table_line'}{'contents'}[0]{'contents'}[2]{'extra'}{'command_as_argument'} = $result_trees{'definfoenclose_on_table_line'}{'contents'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0];
$result_trees{'definfoenclose_on_table_line'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'definfoenclose_on_table_line'}{'contents'}[0];
$result_trees{'definfoenclose_on_table_line'}{'contents'}[0]{'parent'} = $result_trees{'definfoenclose_on_table_line'};

$result_texis{'definfoenclose_on_table_line'} = '@definfoenclose phi,:,:

@table @phi
@item item
@itemx item x

table content.
@end table
';


$result_texts{'definfoenclose_on_table_line'} = '
item
item x

table content.
';

$result_errors{'definfoenclose_on_table_line'} = [
  {
    'error_line' => 'warning: @definfoenclose is obsolete
',
    'file_name' => '',
    'line_nr' => 1,
    'macro' => '',
    'text' => '@definfoenclose is obsolete',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: @phi should not appear in @table
',
    'file_name' => '',
    'line_nr' => 3,
    'macro' => '',
    'text' => '@phi should not appear in @table',
    'type' => 'warning'
  }
];


$result_floats{'definfoenclose_on_table_line'} = {};



$result_converted{'plaintext'}->{'definfoenclose_on_table_line'} = ':item:
:item x:

     table content.
';


$result_converted{'html_text'}->{'definfoenclose_on_table_line'} = '
<dl class="table">
<dt>:item:</dt>
<dt>:item x:</dt>
<dd>
<p>table content.
</p></dd>
</dl>
';


$result_converted{'xml'}->{'definfoenclose_on_table_line'} = '<definfoenclose command="phi" open=":" close=":" line="phi,:,:"></definfoenclose>

<table commandarg="phi" begin=":" end=":" spaces=" " endspaces=" ">
<tableentry><tableterm><item spaces=" "><itemformat command="phi" begin=":" end=":">item</itemformat></item>
<itemx spaces=" "><itemformat command="phi" begin=":" end=":">item x</itemformat></itemx>
</tableterm><tableitem>
<para>table content.
</para></tableitem></tableentry></table>
';

1;
