use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'paragraph_in_cells'} = {
  'contents' => [
    {
      'contents' => [
        {
          'args' => [
            {
              'contents' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'AAA'
                    }
                  ],
                  'parent' => {},
                  'type' => 'bracketed'
                },
                {
                  'parent' => {},
                  'text' => '  '
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'BBB'
                    }
                  ],
                  'parent' => {},
                  'type' => 'bracketed'
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
          'cmdname' => 'multitable',
          'contents' => [
            {
              'contents' => [
                {
                  'contents' => [
                    {
                      'cmdname' => 'item',
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => ' ',
                          'type' => 'ignorable_spaces_after_command'
                        },
                        {
                          'contents' => [
                            {
                              'parent' => {},
                              'text' => 'truc '
                            }
                          ],
                          'parent' => {},
                          'type' => 'paragraph'
                        }
                      ],
                      'extra' => {
                        'cell_number' => 1
                      },
                      'parent' => {},
                      'source_info' => {
                        'file_name' => '',
                        'line_nr' => 2,
                        'macro' => ''
                      }
                    },
                    {
                      'cmdname' => 'tab',
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => ' ',
                          'type' => 'ignorable_spaces_after_command'
                        },
                        {
                          'contents' => [
                            {
                              'parent' => {},
                              'text' => 'bidule
'
                            }
                          ],
                          'parent' => {},
                          'type' => 'paragraph'
                        }
                      ],
                      'extra' => {
                        'cell_number' => 2
                      },
                      'parent' => {},
                      'source_info' => {
                        'file_name' => '',
                        'line_nr' => 2,
                        'macro' => ''
                      }
                    }
                  ],
                  'extra' => {
                    'row_number' => 1
                  },
                  'parent' => {},
                  'type' => 'row'
                },
                {
                  'contents' => [
                    {
                      'cmdname' => 'item',
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => ' ',
                          'type' => 'ignorable_spaces_after_command'
                        },
                        {
                          'contents' => [
                            {
                              'parent' => {},
                              'text' => 'begin item
'
                            }
                          ],
                          'parent' => {},
                          'type' => 'paragraph'
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
                              'text' => 'new paragraph in item.
'
                            }
                          ],
                          'parent' => {},
                          'type' => 'paragraph'
                        },
                        {
                          'parent' => {},
                          'text' => '
',
                          'type' => 'empty_line'
                        }
                      ],
                      'extra' => {
                        'cell_number' => 1
                      },
                      'parent' => {},
                      'source_info' => {
                        'file_name' => '',
                        'line_nr' => 3,
                        'macro' => ''
                      }
                    },
                    {
                      'cmdname' => 'tab',
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => ' ',
                          'type' => 'ignorable_spaces_after_command'
                        },
                        {
                          'contents' => [
                            {
                              'parent' => {},
                              'text' => 'begin tab
'
                            }
                          ],
                          'parent' => {},
                          'type' => 'paragraph'
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
                              'text' => 'new paragraph in tab.
'
                            }
                          ],
                          'parent' => {},
                          'type' => 'paragraph'
                        }
                      ],
                      'extra' => {
                        'cell_number' => 2
                      },
                      'parent' => {},
                      'source_info' => {
                        'file_name' => '',
                        'line_nr' => 7,
                        'macro' => ''
                      }
                    }
                  ],
                  'extra' => {
                    'row_number' => 2
                  },
                  'parent' => {},
                  'type' => 'row'
                }
              ],
              'parent' => {},
              'type' => 'multitable_body'
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'multitable'
                    }
                  ],
                  'parent' => {},
                  'type' => 'line_arg'
                }
              ],
              'cmdname' => 'end',
              'extra' => {
                'spaces_before_argument' => ' ',
                'text_arg' => 'multitable'
              },
              'parent' => {},
              'source_info' => {
                'file_name' => '',
                'line_nr' => 10,
                'macro' => ''
              }
            }
          ],
          'extra' => {
            'max_columns' => 2,
            'prototypes' => [
              {
                'contents' => [
                  {}
                ],
                'type' => 'bracketed_multitable_prototype'
              },
              {
                'contents' => [
                  {}
                ],
                'type' => 'bracketed_multitable_prototype'
              }
            ],
            'spaces_before_argument' => ' '
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
$result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0];
$result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2];
$result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[0];
$result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'contents'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'contents'}[0]{'contents'}[0];
$result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'contents'}[0]{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'contents'}[0]{'contents'}[0]{'contents'}[1];
$result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'contents'}[0]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'contents'}[0]{'contents'}[0];
$result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'contents'}[0];
$result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'contents'}[0]{'contents'}[1];
$result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'contents'}[0]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'contents'}[0]{'contents'}[1]{'contents'}[1];
$result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'contents'}[0]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'contents'}[0]{'contents'}[1];
$result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'contents'}[0];
$result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[0]{'contents'}[0];
$result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'contents'}[1]{'contents'}[0];
$result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[1];
$result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'contents'}[1]{'contents'}[0];
$result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'contents'}[1]{'contents'}[0];
$result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[3];
$result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[3]{'parent'} = $result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'contents'}[1]{'contents'}[0];
$result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[4]{'parent'} = $result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'contents'}[1]{'contents'}[0];
$result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'contents'}[1];
$result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'contents'}[1]{'contents'}[1];
$result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'contents'}[1]{'contents'}[1];
$result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'contents'}[1]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'contents'}[1]{'contents'}[1];
$result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'contents'}[1]{'contents'}[1]{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'contents'}[1]{'contents'}[1]{'contents'}[3];
$result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'contents'}[1]{'contents'}[1]{'contents'}[3]{'parent'} = $result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'contents'}[1]{'contents'}[1];
$result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'contents'}[1];
$result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[0]{'contents'}[0];
$result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[0];
$result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[0]{'contents'}[1];
$result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[0];
$result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[0]{'extra'}{'prototypes'}[0]{'contents'}[0] = $result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'contents'}[0];
$result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[0]{'extra'}{'prototypes'}[1]{'contents'}[0] = $result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[2]{'contents'}[0];
$result_trees{'paragraph_in_cells'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'paragraph_in_cells'}{'contents'}[0];
$result_trees{'paragraph_in_cells'}{'contents'}[0]{'parent'} = $result_trees{'paragraph_in_cells'};

$result_texis{'paragraph_in_cells'} = '@multitable {AAA}  {BBB}
@item truc @tab bidule
@item begin item

new paragraph in item.

@tab begin tab

new paragraph in tab.
@end multitable';


$result_texts{'paragraph_in_cells'} = 'truc bidule
begin item

new paragraph in item.

begin tab

new paragraph in tab.
';

$result_errors{'paragraph_in_cells'} = [];


$result_floats{'paragraph_in_cells'} = {};



$result_converted{'plaintext'}->{'paragraph_in_cells'} = 'truc  bidule
begin begin
item  tab
      
new   new
paragraphparagraph
in    in
item. tab.

';


$result_converted{'html_text'}->{'paragraph_in_cells'} = '<table class="multitable">
<tbody><tr><td>truc</td><td>bidule</td></tr>
<tr><td>begin item

<p>new paragraph in item.
</p></td><td>begin tab

<p>new paragraph in tab.
</p></td></tr>
</tbody>
</table>
';


$result_converted{'xml'}->{'paragraph_in_cells'} = '<multitable spaces=" " endspaces=" "><columnprototypes><columnprototype bracketed="on">AAA</columnprototype>  <columnprototype bracketed="on">BBB</columnprototype></columnprototypes>
<tbody><row><entry command="item"> <para>truc </para></entry><entry command="tab"> <para>bidule
</para></entry></row><row><entry command="item"> <para>begin item
</para>
<para>new paragraph in item.
</para>
</entry><entry command="tab"> <para>begin tab
</para>
<para>new paragraph in tab.
</para></entry></row></tbody></multitable>';

1;
