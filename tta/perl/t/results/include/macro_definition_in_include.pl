use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'macro_definition_in_include'} = {
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
                        'text' => 'macro_included.texi'
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
                  'text_arg' => 'macro_included.texi'
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
          'cmdname' => 'macro',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => ' themacro
',
                  'type' => 'macro_line'
                }
              ],
              'type' => 'arguments_line'
            },
            {
              'text' => 'in themacro
',
              'type' => 'raw'
            },
            {
              'cmdname' => 'end',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'macro'
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
                'text_arg' => 'macro'
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'file_name' => 'macro_included.texi',
                'line_nr' => 3
              }
            }
          ],
          'extra' => {
            'macro_name' => 'themacro',
            'misc_args' => []
          },
          'source_info' => {
            'file_name' => 'macro_included.texi',
            'line_nr' => 1
          },
          'source_marks' => [
            {
              'counter' => 1,
              'sourcemark_type' => 'include',
              'status' => 'end'
            }
          ]
        },
        {
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'contents' => [
            {
              'text' => 'Call macro
'
            },
            {
              'source_marks' => [
                {
                  'counter' => 1,
                  'element' => {
                    'contents' => [
                      {
                        'type' => 'brace_arg'
                      }
                    ],
                    'info' => {
                      'command_name' => 'themacro'
                    },
                    'type' => 'macro_call'
                  },
                  'sourcemark_type' => 'macro_expansion',
                  'status' => 'start'
                },
                {
                  'counter' => 1,
                  'position' => 11,
                  'sourcemark_type' => 'macro_expansion',
                  'status' => 'end'
                }
              ],
              'text' => 'in themacro
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

$result_texis{'macro_definition_in_include'} = '@macro themacro
in themacro
@end macro

Call macro
in themacro
';


$result_texts{'macro_definition_in_include'} = '
Call macro
in themacro
';

$result_errors{'macro_definition_in_include'} = [];


$result_floats{'macro_definition_in_include'} = {};


1;
