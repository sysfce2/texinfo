use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'spaces_after_braced_command'} = {
  'contents' => [
    {
      'contents' => [
        {
          'contents' => [
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'b'
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                }
              ],
              'cmdname' => 'code',
              'contents' => [],
              'extra' => {
                'spaces' => ' '
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
'
            }
          ],
          'parent' => {},
          'type' => 'paragraph'
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
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'v'
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                }
              ],
              'cmdname' => 'samp',
              'contents' => [],
              'extra' => {
                'spaces' => '
'
              },
              'parent' => {},
              'source_info' => {
                'file_name' => '',
                'line_nr' => 3,
                'macro' => ''
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
              'cmdname' => 'TeX',
              'contents' => [],
              'extra' => {
                'spaces' => '
'
              },
              'parent' => {},
              'source_info' => {
                'file_name' => '',
                'line_nr' => 6,
                'macro' => ''
              }
            },
            {
              'parent' => {},
              'text' => '
'
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
$result_trees{'spaces_after_braced_command'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'spaces_after_braced_command'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'spaces_after_braced_command'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'spaces_after_braced_command'}{'contents'}[0]{'contents'}[0]{'contents'}[0];
$result_trees{'spaces_after_braced_command'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'spaces_after_braced_command'}{'contents'}[0]{'contents'}[0];
$result_trees{'spaces_after_braced_command'}{'contents'}[0]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'spaces_after_braced_command'}{'contents'}[0]{'contents'}[0];
$result_trees{'spaces_after_braced_command'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'spaces_after_braced_command'}{'contents'}[0];
$result_trees{'spaces_after_braced_command'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'spaces_after_braced_command'}{'contents'}[0];
$result_trees{'spaces_after_braced_command'}{'contents'}[0]{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'spaces_after_braced_command'}{'contents'}[0]{'contents'}[2]{'contents'}[0]{'args'}[0];
$result_trees{'spaces_after_braced_command'}{'contents'}[0]{'contents'}[2]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'spaces_after_braced_command'}{'contents'}[0]{'contents'}[2]{'contents'}[0];
$result_trees{'spaces_after_braced_command'}{'contents'}[0]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'spaces_after_braced_command'}{'contents'}[0]{'contents'}[2];
$result_trees{'spaces_after_braced_command'}{'contents'}[0]{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'spaces_after_braced_command'}{'contents'}[0]{'contents'}[2];
$result_trees{'spaces_after_braced_command'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'spaces_after_braced_command'}{'contents'}[0];
$result_trees{'spaces_after_braced_command'}{'contents'}[0]{'contents'}[3]{'parent'} = $result_trees{'spaces_after_braced_command'}{'contents'}[0];
$result_trees{'spaces_after_braced_command'}{'contents'}[0]{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'spaces_after_braced_command'}{'contents'}[0]{'contents'}[4];
$result_trees{'spaces_after_braced_command'}{'contents'}[0]{'contents'}[4]{'contents'}[1]{'parent'} = $result_trees{'spaces_after_braced_command'}{'contents'}[0]{'contents'}[4];
$result_trees{'spaces_after_braced_command'}{'contents'}[0]{'contents'}[4]{'contents'}[2]{'parent'} = $result_trees{'spaces_after_braced_command'}{'contents'}[0]{'contents'}[4];
$result_trees{'spaces_after_braced_command'}{'contents'}[0]{'contents'}[4]{'parent'} = $result_trees{'spaces_after_braced_command'}{'contents'}[0];
$result_trees{'spaces_after_braced_command'}{'contents'}[0]{'parent'} = $result_trees{'spaces_after_braced_command'};

$result_texis{'spaces_after_braced_command'} = '@code {b}

@samp
{v}

@TeX


';


$result_texts{'spaces_after_braced_command'} = 'b

v

TeX

';

$result_errors{'spaces_after_braced_command'} = [
  {
    'error_line' => 'warning: command `@samp\' must not be followed by new line
',
    'file_name' => '',
    'line_nr' => 3,
    'macro' => '',
    'text' => 'command `@samp\' must not be followed by new line',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: command `@TeX\' must not be followed by new line
',
    'file_name' => '',
    'line_nr' => 6,
    'macro' => '',
    'text' => 'command `@TeX\' must not be followed by new line',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: command `@TeX\' must not be followed by new line
',
    'file_name' => '',
    'line_nr' => 7,
    'macro' => '',
    'text' => 'command `@TeX\' must not be followed by new line',
    'type' => 'warning'
  },
  {
    'error_line' => '@TeX expected braces
',
    'file_name' => '',
    'line_nr' => 7,
    'macro' => '',
    'text' => '@TeX expected braces',
    'type' => 'error'
  },
  {
    'error_line' => 'misplaced {
',
    'file_name' => '',
    'line_nr' => 8,
    'macro' => '',
    'text' => 'misplaced {',
    'type' => 'error'
  },
  {
    'error_line' => 'misplaced }
',
    'file_name' => '',
    'line_nr' => 8,
    'macro' => '',
    'text' => 'misplaced }',
    'type' => 'error'
  }
];


$result_floats{'spaces_after_braced_command'} = {};


1;
