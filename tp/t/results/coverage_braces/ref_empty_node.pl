use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'ref_empty_node'} = {
  'contents' => [
    {
      'contents' => [
        {
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'contents' => [
            {
              'args' => [
                {
                  'type' => 'brace_command_container'
                },
                {
                  'type' => 'brace_command_container'
                },
                {
                  'type' => 'brace_command_container'
                },
                {
                  'contents' => [
                    {
                      'text' => 'manual'
                    }
                  ],
                  'type' => 'brace_command_container'
                }
              ],
              'cmdname' => 'ref',
              'source_info' => {
                'line_nr' => 2
              }
            },
            {
              'text' => ' '
            },
            {
              'args' => [
                {
                  'type' => 'brace_command_container'
                },
                {
                  'type' => 'brace_command_container'
                },
                {
                  'type' => 'brace_command_container'
                },
                {
                  'info' => {
                    'spaces_before_argument' => {
                      'text' => ' '
                    }
                  },
                  'type' => 'brace_command_container'
                },
                {
                  'contents' => [
                    {
                      'text' => 'Manual'
                    }
                  ],
                  'info' => {
                    'spaces_before_argument' => {
                      'text' => ' '
                    }
                  },
                  'type' => 'brace_command_container'
                }
              ],
              'cmdname' => 'ref',
              'source_info' => {
                'line_nr' => 2
              }
            },
            {
              'text' => ' '
            },
            {
              'args' => [
                {
                  'type' => 'brace_command_container'
                },
                {
                  'type' => 'brace_command_container'
                },
                {
                  'contents' => [
                    {
                      'text' => 'imanual'
                    }
                  ],
                  'type' => 'brace_command_container'
                }
              ],
              'cmdname' => 'inforef',
              'source_info' => {
                'line_nr' => 2
              }
            },
            {
              'text' => '
'
            },
            {
              'args' => [
                {
                  'info' => {
                    'spaces_before_argument' => {
                      'text' => ' '
                    }
                  },
                  'type' => 'brace_command_container'
                },
                {
                  'contents' => [
                    {
                      'text' => 'Bidule'
                    }
                  ],
                  'info' => {
                    'spaces_before_argument' => {
                      'text' => ' '
                    }
                  },
                  'type' => 'brace_command_container'
                },
                {
                  'contents' => [
                    {
                      'text' => 'Truc'
                    }
                  ],
                  'info' => {
                    'spaces_before_argument' => {
                      'text' => ' '
                    }
                  },
                  'type' => 'brace_command_container'
                },
                {
                  'contents' => [
                    {
                      'text' => 'file'
                    }
                  ],
                  'info' => {
                    'spaces_before_argument' => {
                      'text' => ' '
                    }
                  },
                  'type' => 'brace_command_container'
                },
                {
                  'contents' => [
                    {
                      'text' => 'Printed'
                    }
                  ],
                  'info' => {
                    'spaces_before_argument' => {
                      'text' => ' '
                    }
                  },
                  'type' => 'brace_command_container'
                }
              ],
              'cmdname' => 'xref',
              'source_info' => {
                'line_nr' => 3
              }
            },
            {
              'text' => '.
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

$result_texis{'ref_empty_node'} = '
@ref{,,,manual} @ref{,,, , Manual} @inforef{,,imanual}
@xref{ , Bidule, Truc, file, Printed}.
';


$result_texts{'ref_empty_node'} = '
  
.
';

$result_errors{'ref_empty_node'} = [
  {
    'error_line' => 'warning: @inforef is obsolete
',
    'line_nr' => 2,
    'text' => '@inforef is obsolete',
    'type' => 'warning'
  }
];


$result_floats{'ref_empty_node'} = {};


1;
