use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'node_on_index_entry_line'} = {
  'contents' => [
    {
      'contents' => [
        {
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'cmdname' => 'cindex',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'entry'
                }
              ],
              'info' => {
                'spaces_after_argument' => {
                  'text' => ' '
                }
              },
              'type' => 'line_arg'
            }
          ],
          'extra' => {
            'index_entry' => [
              'cp',
              1
            ]
          },
          'info' => {
            'command_name' => 'cindex',
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'line_nr' => 2
          },
          'type' => 'index_entry_command'
        }
      ],
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
                  'text' => 'a'
                }
              ],
              'type' => 'line_arg'
            },
            {
              'contents' => [
                {
                  'text' => '('
                },
                {
                  'text' => 'm'
                },
                {
                  'text' => ')'
                },
                {
                  'text' => 'b'
                }
              ],
              'extra' => {
                'manual_content' => {
                  'contents' => [
                    {}
                  ]
                },
                'node_content' => {
                  'contents' => [
                    {}
                  ]
                },
                'normalized' => 'b'
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'type' => 'line_arg'
            },
            {
              'contents' => [
                {
                  'text' => '('
                },
                {
                  'text' => 'm'
                },
                {
                  'text' => ')'
                },
                {
                  'text' => 'c'
                }
              ],
              'extra' => {
                'manual_content' => {
                  'contents' => [
                    {}
                  ]
                },
                'node_content' => {
                  'contents' => [
                    {}
                  ]
                },
                'normalized' => 'c'
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'type' => 'line_arg'
            },
            {
              'contents' => [
                {
                  'text' => '('
                },
                {
                  'text' => 'h'
                },
                {
                  'text' => ')'
                },
                {
                  'text' => 'd'
                }
              ],
              'extra' => {
                'manual_content' => {
                  'contents' => [
                    {}
                  ]
                },
                'node_content' => {
                  'contents' => [
                    {}
                  ]
                },
                'normalized' => 'd'
              },
              'info' => {
                'spaces_after_argument' => {
                  'text' => '
'
                },
                'spaces_before_argument' => {
                  'text' => ' '
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
          'contents' => [
            {
              'text' => 'Content
'
            }
          ],
          'type' => 'paragraph'
        }
      ],
      'extra' => {
        'is_target' => 1,
        'normalized' => 'a'
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
  'type' => 'document_root'
};
$result_trees{'node_on_index_entry_line'}{'contents'}[1]{'contents'}[0]{'contents'}[1]{'extra'}{'manual_content'}{'contents'}[0] = $result_trees{'node_on_index_entry_line'}{'contents'}[1]{'contents'}[0]{'contents'}[1]{'contents'}[1];
$result_trees{'node_on_index_entry_line'}{'contents'}[1]{'contents'}[0]{'contents'}[1]{'extra'}{'node_content'}{'contents'}[0] = $result_trees{'node_on_index_entry_line'}{'contents'}[1]{'contents'}[0]{'contents'}[1]{'contents'}[3];
$result_trees{'node_on_index_entry_line'}{'contents'}[1]{'contents'}[0]{'contents'}[2]{'extra'}{'manual_content'}{'contents'}[0] = $result_trees{'node_on_index_entry_line'}{'contents'}[1]{'contents'}[0]{'contents'}[2]{'contents'}[1];
$result_trees{'node_on_index_entry_line'}{'contents'}[1]{'contents'}[0]{'contents'}[2]{'extra'}{'node_content'}{'contents'}[0] = $result_trees{'node_on_index_entry_line'}{'contents'}[1]{'contents'}[0]{'contents'}[2]{'contents'}[3];
$result_trees{'node_on_index_entry_line'}{'contents'}[1]{'contents'}[0]{'contents'}[3]{'extra'}{'manual_content'}{'contents'}[0] = $result_trees{'node_on_index_entry_line'}{'contents'}[1]{'contents'}[0]{'contents'}[3]{'contents'}[1];
$result_trees{'node_on_index_entry_line'}{'contents'}[1]{'contents'}[0]{'contents'}[3]{'extra'}{'node_content'}{'contents'}[0] = $result_trees{'node_on_index_entry_line'}{'contents'}[1]{'contents'}[0]{'contents'}[3]{'contents'}[3];

$result_texis{'node_on_index_entry_line'} = '
@cindex entry @node a, (m)b, (m)c, (h)d

Content
';


$result_texts{'node_on_index_entry_line'} = '

Content
';

$result_nodes{'node_on_index_entry_line'} = [
  {
    'cmdname' => 'node',
    'extra' => {
      'node_directions' => {
        'next' => {
          'extra' => {
            'manual_content' => {},
            'normalized' => 'b'
          },
          'type' => 'line_arg'
        },
        'prev' => {
          'extra' => {
            'manual_content' => {},
            'normalized' => 'c'
          },
          'type' => 'line_arg'
        },
        'up' => {
          'extra' => {
            'manual_content' => {},
            'normalized' => 'd'
          },
          'type' => 'line_arg'
        }
      },
      'normalized' => 'a'
    }
  }
];

$result_menus{'node_on_index_entry_line'} = [
  {
    'extra' => {
      'normalized' => 'a'
    }
  }
];

$result_errors{'node_on_index_entry_line'} = [
  {
    'error_line' => 'warning: @node should only appear at the beginning of a line
',
    'line_nr' => 2,
    'text' => '@node should only appear at the beginning of a line',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: @node should not appear on @cindex line
',
    'line_nr' => 2,
    'text' => '@node should not appear on @cindex line',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: entry for index `cp\' outside of any node
',
    'line_nr' => 2,
    'text' => 'entry for index `cp\' outside of any node',
    'type' => 'warning'
  }
];


$result_floats{'node_on_index_entry_line'} = {};


$result_indices_sort_strings{'node_on_index_entry_line'} = {
  'cp' => [
    'entry'
  ]
};


1;
