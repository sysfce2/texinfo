use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'clickstyle'} = {
  'contents' => [
    {
      'contents' => [
        {
          'args' => [
            {
              'text' => '@result',
              'type' => 'misc_arg'
            }
          ],
          'cmdname' => 'clickstyle',
          'extra' => {
            'misc_args' => [
              '@result'
            ]
          },
          'info' => {
            'arg_line' => ' @result
'
          },
          'source_info' => {
            'file_name' => '',
            'line_nr' => 1,
            'macro' => ''
          }
        },
        {
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'contents' => [
            {
              'text' => 'A '
            },
            {
              'args' => [
                {
                  'type' => 'brace_command_arg'
                }
              ],
              'cmdname' => 'click',
              'extra' => {
                'clickstyle' => 'result'
              },
              'source_info' => {
                'file_name' => '',
                'line_nr' => 3,
                'macro' => ''
              }
            },
            {
              'text' => ' (result).
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

$result_texis{'clickstyle'} = '@clickstyle @result

A @click{} (result).
';


$result_texts{'clickstyle'} = '
A => (result).
';

$result_errors{'clickstyle'} = [];


$result_floats{'clickstyle'} = {};


1;
