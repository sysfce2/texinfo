use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'wrong_synindex'} = {
  'contents' => [
    {
      'contents' => [
        {
          'cmdname' => 'defindex',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'aaa'
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
              'aaa'
            ]
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
          'cmdname' => 'synindex',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'aaa aaa'
                }
              ],
              'type' => 'line_arg'
            }
          ],
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

$result_texis{'wrong_synindex'} = '@defindex aaa
@synindex aaa aaa';


$result_texts{'wrong_synindex'} = '';

$result_errors{'wrong_synindex'} = [
  {
    'error_line' => 'warning: @synindex leads to a merging of aaa in itself, ignoring
',
    'line_nr' => 2,
    'text' => '@synindex leads to a merging of aaa in itself, ignoring',
    'type' => 'warning'
  }
];


$result_indices{'wrong_synindex'} = {
  'index_names' => {
    'aaa' => {
      'in_code' => 0,
      'name' => 'aaa'
    },
    'cp' => {
      'in_code' => 0,
      'name' => 'cp'
    },
    'fn' => {
      'in_code' => 1,
      'name' => 'fn'
    },
    'ky' => {
      'in_code' => 1,
      'name' => 'ky'
    },
    'pg' => {
      'in_code' => 1,
      'name' => 'pg'
    },
    'tp' => {
      'in_code' => 1,
      'name' => 'tp'
    },
    'vr' => {
      'in_code' => 1,
      'name' => 'vr'
    }
  }
};


$result_floats{'wrong_synindex'} = {};


1;
