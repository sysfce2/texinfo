use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'node_in_copying_not_closed'} = {
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
          'cmdname' => 'copying',
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
                  'text' => 'This is an unterminatted copyright notice
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
              'parent' => {},
              'text' => '
',
              'type' => 'empty_line'
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
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'Top'
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
      'cmdname' => 'node',
      'extra' => {
        'node_content' => [
          {}
        ],
        'nodes_manuals' => [
          {
            'node_content' => [
              {}
            ],
            'normalized' => 'Top'
          }
        ],
        'normalized' => 'Top',
        'spaces_before_argument' => ' '
      },
      'parent' => {},
      'source_info' => {
        'file_name' => '',
        'line_nr' => 6,
        'macro' => ''
      }
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'Top section'
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
      'cmdname' => 'top',
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
              'parent' => {},
              'text' => '
',
              'type' => 'misc_arg'
            }
          ],
          'cmdname' => 'insertcopying',
          'parent' => {},
          'source_info' => {
            'file_name' => '',
            'line_nr' => 9,
            'macro' => ''
          }
        }
      ],
      'extra' => {
        'spaces_before_argument' => ' '
      },
      'parent' => {},
      'source_info' => {
        'file_name' => '',
        'line_nr' => 7,
        'macro' => ''
      }
    }
  ],
  'type' => 'document_root'
};
$result_trees{'node_in_copying_not_closed'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'node_in_copying_not_closed'}{'contents'}[0]{'contents'}[0];
$result_trees{'node_in_copying_not_closed'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'node_in_copying_not_closed'}{'contents'}[0]{'contents'}[0];
$result_trees{'node_in_copying_not_closed'}{'contents'}[0]{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'node_in_copying_not_closed'}{'contents'}[0]{'contents'}[0]{'contents'}[1];
$result_trees{'node_in_copying_not_closed'}{'contents'}[0]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'node_in_copying_not_closed'}{'contents'}[0]{'contents'}[0];
$result_trees{'node_in_copying_not_closed'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'node_in_copying_not_closed'}{'contents'}[0]{'contents'}[0];
$result_trees{'node_in_copying_not_closed'}{'contents'}[0]{'contents'}[0]{'contents'}[3]{'parent'} = $result_trees{'node_in_copying_not_closed'}{'contents'}[0]{'contents'}[0];
$result_trees{'node_in_copying_not_closed'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'node_in_copying_not_closed'}{'contents'}[0];
$result_trees{'node_in_copying_not_closed'}{'contents'}[0]{'parent'} = $result_trees{'node_in_copying_not_closed'};
$result_trees{'node_in_copying_not_closed'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'node_in_copying_not_closed'}{'contents'}[1]{'args'}[0];
$result_trees{'node_in_copying_not_closed'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'node_in_copying_not_closed'}{'contents'}[1];
$result_trees{'node_in_copying_not_closed'}{'contents'}[1]{'extra'}{'node_content'}[0] = $result_trees{'node_in_copying_not_closed'}{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'node_in_copying_not_closed'}{'contents'}[1]{'extra'}{'nodes_manuals'}[0]{'node_content'}[0] = $result_trees{'node_in_copying_not_closed'}{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'node_in_copying_not_closed'}{'contents'}[1]{'parent'} = $result_trees{'node_in_copying_not_closed'};
$result_trees{'node_in_copying_not_closed'}{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'node_in_copying_not_closed'}{'contents'}[2]{'args'}[0];
$result_trees{'node_in_copying_not_closed'}{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'node_in_copying_not_closed'}{'contents'}[2];
$result_trees{'node_in_copying_not_closed'}{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'node_in_copying_not_closed'}{'contents'}[2];
$result_trees{'node_in_copying_not_closed'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'node_in_copying_not_closed'}{'contents'}[2]{'contents'}[1];
$result_trees{'node_in_copying_not_closed'}{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'node_in_copying_not_closed'}{'contents'}[2];
$result_trees{'node_in_copying_not_closed'}{'contents'}[2]{'parent'} = $result_trees{'node_in_copying_not_closed'};

$result_texis{'node_in_copying_not_closed'} = '@copying

This is an unterminatted copyright notice


@node Top
@top Top section

@insertcopying
';


$result_texts{'node_in_copying_not_closed'} = 'Top section
***********

';

$result_sectioning{'node_in_copying_not_closed'} = {
  'structure' => {
    'section_childs' => [
      {
        'cmdname' => 'top',
        'extra' => {
          'associated_node' => {
            'cmdname' => 'node',
            'extra' => {
              'normalized' => 'Top'
            }
          }
        },
        'structure' => {
          'section_level' => 0,
          'section_up' => {}
        }
      }
    ],
    'section_level' => -1
  }
};
$result_sectioning{'node_in_copying_not_closed'}{'structure'}{'section_childs'}[0]{'structure'}{'section_up'} = $result_sectioning{'node_in_copying_not_closed'};

$result_nodes{'node_in_copying_not_closed'} = {
  'cmdname' => 'node',
  'extra' => {
    'associated_section' => {
      'cmdname' => 'top',
      'extra' => {},
      'structure' => {}
    },
    'normalized' => 'Top'
  }
};

$result_menus{'node_in_copying_not_closed'} = {
  'cmdname' => 'node',
  'extra' => {
    'normalized' => 'Top'
  }
};

$result_errors{'node_in_copying_not_closed'} = [
  {
    'error_line' => '@node seen before @end copying
',
    'file_name' => '',
    'line_nr' => 6,
    'macro' => '',
    'text' => '@node seen before @end copying',
    'type' => 'error'
  }
];


$result_floats{'node_in_copying_not_closed'} = {};


1;
