use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'command_in_end_expanded_raw_one_char_before_command'} = {
  'contents' => [
    {
      'contents' => [
        {
          'args' => [
            {
              'extra' => {
                'spaces_after_argument' => '
'
              },
              'parent' => {},
              'type' => 'block_line_arg'
            }
          ],
          'cmdname' => 'tex',
          'contents' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'In TeX
'
                }
              ],
              'parent' => {},
              'type' => 'rawpreformatted'
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 't'
                    },
                    {
                      'args' => [
                        {
                          'parent' => {},
                          'type' => 'brace_command_arg'
                        }
                      ],
                      'cmdname' => 'asis',
                      'parent' => {},
                      'source_info' => {
                        'file_name' => '',
                        'line_nr' => 3,
                        'macro' => ''
                      }
                    },
                    {
                      'parent' => {},
                      'text' => 'ex'
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
                'text_arg' => 'tex'
              },
              'parent' => {},
              'source_info' => {
                'file_name' => '',
                'line_nr' => 3,
                'macro' => ''
              }
            }
          ],
          'parent' => {},
          'source_info' => {
            'file_name' => '',
            'line_nr' => 1,
            'macro' => ''
          }
        }
      ],
      'parent' => {},
      'type' => 'before_node_section'
    }
  ],
  'type' => 'document_root'
};
$result_trees{'command_in_end_expanded_raw_one_char_before_command'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'command_in_end_expanded_raw_one_char_before_command'}{'contents'}[0]{'contents'}[0];
$result_trees{'command_in_end_expanded_raw_one_char_before_command'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'command_in_end_expanded_raw_one_char_before_command'}{'contents'}[0]{'contents'}[0]{'contents'}[0];
$result_trees{'command_in_end_expanded_raw_one_char_before_command'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'command_in_end_expanded_raw_one_char_before_command'}{'contents'}[0]{'contents'}[0];
$result_trees{'command_in_end_expanded_raw_one_char_before_command'}{'contents'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'command_in_end_expanded_raw_one_char_before_command'}{'contents'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'command_in_end_expanded_raw_one_char_before_command'}{'contents'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'command_in_end_expanded_raw_one_char_before_command'}{'contents'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1];
$result_trees{'command_in_end_expanded_raw_one_char_before_command'}{'contents'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'command_in_end_expanded_raw_one_char_before_command'}{'contents'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'command_in_end_expanded_raw_one_char_before_command'}{'contents'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'command_in_end_expanded_raw_one_char_before_command'}{'contents'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'command_in_end_expanded_raw_one_char_before_command'}{'contents'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'command_in_end_expanded_raw_one_char_before_command'}{'contents'}[0]{'contents'}[0]{'contents'}[1];
$result_trees{'command_in_end_expanded_raw_one_char_before_command'}{'contents'}[0]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'command_in_end_expanded_raw_one_char_before_command'}{'contents'}[0]{'contents'}[0];
$result_trees{'command_in_end_expanded_raw_one_char_before_command'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'command_in_end_expanded_raw_one_char_before_command'}{'contents'}[0];
$result_trees{'command_in_end_expanded_raw_one_char_before_command'}{'contents'}[0]{'parent'} = $result_trees{'command_in_end_expanded_raw_one_char_before_command'};

$result_texis{'command_in_end_expanded_raw_one_char_before_command'} = '@tex
In TeX
@end t@asis{}ex
';


$result_texts{'command_in_end_expanded_raw_one_char_before_command'} = '';

$result_errors{'command_in_end_expanded_raw_one_char_before_command'} = [
  {
    'error_line' => 'bad argument to @end: t@asis{}ex
',
    'file_name' => '',
    'line_nr' => 3,
    'macro' => '',
    'text' => 'bad argument to @end: t@asis{}ex',
    'type' => 'error'
  }
];


$result_floats{'command_in_end_expanded_raw_one_char_before_command'} = {};


1;
