use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'simple_no_eol'} = {
  'contents' => [
    {
      'contents' => [
        {
          'source_marks' => [
            {
              'counter' => 1,
              'element' => {
                'cmdname' => 'include',
                'contents' => [
                  {
                    'contents' => [
                      {
                        'text' => 'inc_file.texi'
                      }
                    ],
                    'type' => 'line_arg'
                  }
                ],
                'extra' => {
                  'text_arg' => 'inc_file.texi'
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
              'sourcemark_type' => 'include',
              'status' => 'start'
            }
          ],
          'text' => ''
        },
        {
          'contents' => [
            {
              'source_marks' => [
                {
                  'counter' => 1,
                  'position' => 18,
                  'sourcemark_type' => 'include',
                  'status' => 'end'
                }
              ],
              'text' => 'In included file.
'
            }
          ],
          'type' => 'paragraph'
        }
      ],
      'type' => 'before_node_section'
    }
  ],
  'type' => 'document_root'
};

$result_texis{'simple_no_eol'} = 'In included file.
';


$result_texts{'simple_no_eol'} = 'In included file.
';

$result_errors{'simple_no_eol'} = [];


$result_floats{'simple_no_eol'} = {};


1;
