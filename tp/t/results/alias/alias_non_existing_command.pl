use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'alias_non_existing_command'} = {
  'contents' => [
    {
      'contents' => [
        {
          'cmdname' => 'alias',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'myalias = userdefined'
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
              'myalias',
              'userdefined'
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
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'contents' => [
            {
              'text' => 'hh.
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

$result_texis{'alias_non_existing_command'} = '@alias myalias = userdefined

hh.
';


$result_texts{'alias_non_existing_command'} = '
hh.
';

$result_errors{'alias_non_existing_command'} = [
  {
    'error_line' => 'unknown command `userdefined\'
',
    'line_nr' => 3,
    'text' => 'unknown command `userdefined\'',
    'type' => 'error'
  },
  {
    'error_line' => 'misplaced {
',
    'line_nr' => 3,
    'text' => 'misplaced {',
    'type' => 'error'
  },
  {
    'error_line' => 'misplaced }
',
    'line_nr' => 3,
    'text' => 'misplaced }',
    'type' => 'error'
  }
];


$result_floats{'alias_non_existing_command'} = {};


1;
