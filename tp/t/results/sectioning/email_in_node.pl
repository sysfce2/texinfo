use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'email_in_node'} = {
  'contents' => [
    {
      'type' => 'before_node_section'
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'text' => 'a'
                    }
                  ],
                  'info' => {
                    'spaces_after_argument' => {
                      'text' => ' '
                    },
                    'spaces_before_argument' => {
                      'text' => ' '
                    }
                  },
                  'type' => 'brace_command_container'
                }
              ],
              'cmdname' => 'email',
              'source_info' => {
                'line_nr' => 1
              }
            },
            {
              'text' => ' '
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'text' => 'c'
                    }
                  ],
                  'info' => {
                    'spaces_after_argument' => {
                      'text' => ' '
                    }
                  },
                  'type' => 'brace_command_container'
                },
                {
                  'contents' => [
                    {
                      'text' => 'd'
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
              'cmdname' => 'email',
              'source_info' => {
                'line_nr' => 1
              }
            },
            {
              'text' => ' '
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
                      'text' => 'e'
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
              'cmdname' => 'email',
              'source_info' => {
                'line_nr' => 1
              }
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
      'cmdname' => 'node',
      'extra' => {
        'is_target' => 1,
        'normalized' => 'a-c-'
      },
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
  'type' => 'document_root'
};

$result_texis{'email_in_node'} = '@node @email{ a } @email{c , d} @email{ , e}
';


$result_texts{'email_in_node'} = '';

$result_nodes{'email_in_node'} = [
  {
    'cmdname' => 'node',
    'extra' => {
      'normalized' => 'a-c-'
    }
  }
];

$result_menus{'email_in_node'} = [
  {
    'extra' => {
      'normalized' => 'a-c-'
    }
  }
];

$result_errors{'email_in_node'} = [];


$result_floats{'email_in_node'} = {};


1;
