use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'protect_in_body_one_arg'} = {
  'contents' => [
    {
      'contents' => [
        {
          'args' => [
            {
              'parent' => {},
              'text' => 'macroone',
              'type' => 'macro_name'
            },
            {
              'parent' => {},
              'text' => 'arg1',
              'type' => 'macro_arg'
            },
            {
              'parent' => {},
              'text' => 'arg2',
              'type' => 'macro_arg'
            }
          ],
          'cmdname' => 'macro',
          'contents' => [
            {
              'parent' => {},
              'text' => 'result: @emph{\\arg1\\} protected \\\\ -> \\\\arg1\\\\ @emph{\\arg2\\}
',
              'type' => 'raw'
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'macro'
                    }
                  ],
                  'extra' => {
                    'spaces_after_argument' => '
'
                  },
                  'parent' => {},
                  'type' => 'line_arg'
                }
              ],
              'cmdname' => 'end',
              'extra' => {
                'spaces_before_argument' => ' ',
                'text_arg' => 'macro'
              },
              'parent' => {},
              'source_info' => {
                'file_name' => '',
                'line_nr' => 3,
                'macro' => ''
              }
            }
          ],
          'extra' => {
            'arg_line' => ' macroone { arg1 , arg2 }
'
          },
          'parent' => {},
          'source_info' => {
            'file_name' => '',
            'line_nr' => 1,
            'macro' => ''
          }
        },
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'result: '
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
                              'parent' => {},
                              'text' => 'f\\irst arg'
                            }
                          ],
                          'parent' => {},
                          'type' => 'brace_command_arg'
                        }
                      ],
                      'cmdname' => 'samp',
                      'parent' => {},
                      'source_info' => {
                        'file_name' => '',
                        'line_nr' => 5,
                        'macro' => 'macroone'
                      }
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                }
              ],
              'cmdname' => 'emph',
              'parent' => {},
              'source_info' => {
                'file_name' => '',
                'line_nr' => 5,
                'macro' => 'macroone'
              }
            },
            {
              'parent' => {},
              'text' => ' protected \\ -> \\arg1\\ '
            },
            {
              'args' => [
                {
                  'parent' => {},
                  'type' => 'brace_command_arg'
                }
              ],
              'cmdname' => 'emph',
              'parent' => {},
              'source_info' => {
                'file_name' => '',
                'line_nr' => 5,
                'macro' => 'macroone'
              }
            },
            {
              'parent' => {},
              'text' => '
'
            }
          ],
          'parent' => {},
          'type' => 'paragraph'
        }
      ],
      'parent' => {},
      'type' => 'before_node_section'
    }
  ],
  'type' => 'document_root'
};
$result_trees{'protect_in_body_one_arg'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'protect_in_body_one_arg'}{'contents'}[0]{'contents'}[0];
$result_trees{'protect_in_body_one_arg'}{'contents'}[0]{'contents'}[0]{'args'}[1]{'parent'} = $result_trees{'protect_in_body_one_arg'}{'contents'}[0]{'contents'}[0];
$result_trees{'protect_in_body_one_arg'}{'contents'}[0]{'contents'}[0]{'args'}[2]{'parent'} = $result_trees{'protect_in_body_one_arg'}{'contents'}[0]{'contents'}[0];
$result_trees{'protect_in_body_one_arg'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'protect_in_body_one_arg'}{'contents'}[0]{'contents'}[0];
$result_trees{'protect_in_body_one_arg'}{'contents'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'protect_in_body_one_arg'}{'contents'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'protect_in_body_one_arg'}{'contents'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'protect_in_body_one_arg'}{'contents'}[0]{'contents'}[0]{'contents'}[1];
$result_trees{'protect_in_body_one_arg'}{'contents'}[0]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'protect_in_body_one_arg'}{'contents'}[0]{'contents'}[0];
$result_trees{'protect_in_body_one_arg'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'protect_in_body_one_arg'}{'contents'}[0];
$result_trees{'protect_in_body_one_arg'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'protect_in_body_one_arg'}{'contents'}[0];
$result_trees{'protect_in_body_one_arg'}{'contents'}[0]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'protect_in_body_one_arg'}{'contents'}[0]{'contents'}[2];
$result_trees{'protect_in_body_one_arg'}{'contents'}[0]{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'protect_in_body_one_arg'}{'contents'}[0]{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'protect_in_body_one_arg'}{'contents'}[0]{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'protect_in_body_one_arg'}{'contents'}[0]{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'protect_in_body_one_arg'}{'contents'}[0]{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'protect_in_body_one_arg'}{'contents'}[0]{'contents'}[2]{'contents'}[1]{'args'}[0];
$result_trees{'protect_in_body_one_arg'}{'contents'}[0]{'contents'}[2]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'protect_in_body_one_arg'}{'contents'}[0]{'contents'}[2]{'contents'}[1];
$result_trees{'protect_in_body_one_arg'}{'contents'}[0]{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'protect_in_body_one_arg'}{'contents'}[0]{'contents'}[2];
$result_trees{'protect_in_body_one_arg'}{'contents'}[0]{'contents'}[2]{'contents'}[2]{'parent'} = $result_trees{'protect_in_body_one_arg'}{'contents'}[0]{'contents'}[2];
$result_trees{'protect_in_body_one_arg'}{'contents'}[0]{'contents'}[2]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'protect_in_body_one_arg'}{'contents'}[0]{'contents'}[2]{'contents'}[3];
$result_trees{'protect_in_body_one_arg'}{'contents'}[0]{'contents'}[2]{'contents'}[3]{'parent'} = $result_trees{'protect_in_body_one_arg'}{'contents'}[0]{'contents'}[2];
$result_trees{'protect_in_body_one_arg'}{'contents'}[0]{'contents'}[2]{'contents'}[4]{'parent'} = $result_trees{'protect_in_body_one_arg'}{'contents'}[0]{'contents'}[2];
$result_trees{'protect_in_body_one_arg'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'protect_in_body_one_arg'}{'contents'}[0];
$result_trees{'protect_in_body_one_arg'}{'contents'}[0]{'parent'} = $result_trees{'protect_in_body_one_arg'};

$result_texis{'protect_in_body_one_arg'} = '@macro macroone { arg1 , arg2 }
result: @emph{\\arg1\\} protected \\\\ -> \\\\arg1\\\\ @emph{\\arg2\\}
@end macro

result: @emph{@samp{f\\irst arg}} protected \\ -> \\arg1\\ @emph{}
';


$result_texts{'protect_in_body_one_arg'} = '
result: f\\irst arg protected \\ -> \\arg1\\ 
';

$result_errors{'protect_in_body_one_arg'} = [];


$result_floats{'protect_in_body_one_arg'} = {};


1;
