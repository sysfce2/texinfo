use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'synindex_too_much_args'} = {
  'contents' => [
    {
      'contents' => [
        {
          'cmdname' => 'syncodeindex',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'cp fn    truc'
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
            'line_nr' => 1
          }
        }
      ],
      'type' => 'before_node_section'
    }
  ],
  'type' => 'document_root'
};

$result_texis{'synindex_too_much_args'} = '@syncodeindex cp fn    truc
';


$result_texts{'synindex_too_much_args'} = '';

$result_errors{'synindex_too_much_args'} = [
  {
    'error_line' => 'bad argument to @syncodeindex: cp fn    truc
',
    'line_nr' => 1,
    'text' => 'bad argument to @syncodeindex: cp fn    truc',
    'type' => 'error'
  }
];


$result_floats{'synindex_too_much_args'} = {};


1;
