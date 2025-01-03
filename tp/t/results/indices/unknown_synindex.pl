use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'unknown_synindex'} = {
  'contents' => [
    {
      'contents' => [
        {
          'cmdname' => 'synindex',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'c truc'
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
            'line_nr' => 1
          }
        }
      ],
      'type' => 'before_node_section'
    }
  ],
  'type' => 'document_root'
};

$result_texis{'unknown_synindex'} = '@synindex c truc';


$result_texts{'unknown_synindex'} = '';

$result_errors{'unknown_synindex'} = [
  {
    'error_line' => 'unknown source index in @synindex: c
',
    'line_nr' => 1,
    'text' => 'unknown source index in @synindex: c',
    'type' => 'error'
  },
  {
    'error_line' => 'unknown destination index in @synindex: truc
',
    'line_nr' => 1,
    'text' => 'unknown destination index in @synindex: truc',
    'type' => 'error'
  }
];


$result_floats{'unknown_synindex'} = {};


1;
