use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'node_simple'} = {
  'contents' => [
    {
      'type' => 'before_node_section'
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'text' => 'first'
            }
          ],
          'type' => 'line_arg'
        }
      ],
      'cmdname' => 'node',
      'extra' => {
        'nodes_manuals' => [
          {
            'node_content' => [
              {}
            ],
            'normalized' => 'first'
          }
        ],
        'normalized' => 'first'
      },
      'info' => {
        'spaces_before_argument' => {
          'text' => ' '
        }
      },
      'source_info' => {
        'file_name' => '',
        'line_nr' => 1,
        'macro' => ''
      }
    }
  ],
  'type' => 'document_root'
};
$result_trees{'node_simple'}{'contents'}[1]{'extra'}{'nodes_manuals'}[0]{'node_content'}[0] = $result_trees{'node_simple'}{'contents'}[1]{'args'}[0]{'contents'}[0];

$result_texis{'node_simple'} = '@node first';


$result_texts{'node_simple'} = '';

$result_nodes{'node_simple'} = {
  'cmdname' => 'node',
  'extra' => {
    'normalized' => 'first'
  },
  'info' => {}
};

$result_menus{'node_simple'} = {
  'cmdname' => 'node',
  'extra' => {
    'normalized' => 'first'
  },
  'info' => {}
};

$result_errors{'node_simple'} = [];


$result_floats{'node_simple'} = {};


1;
