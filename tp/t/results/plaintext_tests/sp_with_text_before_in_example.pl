use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'sp_with_text_before_in_example'} = {
  'contents' => [
    {
      'contents' => [
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'args' => [
            {
              'contents' => [],
              'extra' => {
                'spaces_after_argument' => '
'
              },
              'parent' => {},
              'type' => 'block_line_arg'
            }
          ],
          'cmdname' => 'example',
          'contents' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'sp'
                },
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => '4'
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
                  'cmdname' => 'sp',
                  'extra' => {
                    'misc_args' => [
                      '4'
                    ],
                    'spaces_before_argument' => ' '
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
                  'text' => 'text
'
                }
              ],
              'parent' => {},
              'type' => 'preformatted'
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'example'
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
                'command_argument' => 'example',
                'spaces_before_argument' => ' ',
                'text_arg' => 'example'
              },
              'parent' => {},
              'source_info' => {
                'file_name' => '',
                'line_nr' => 5,
                'macro' => ''
              }
            }
          ],
          'extra' => {
            'end_command' => {}
          },
          'parent' => {},
          'source_info' => {
            'file_name' => '',
            'line_nr' => 2,
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
$result_trees{'sp_with_text_before_in_example'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'sp_with_text_before_in_example'}{'contents'}[0];
$result_trees{'sp_with_text_before_in_example'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'sp_with_text_before_in_example'}{'contents'}[0]{'contents'}[1];
$result_trees{'sp_with_text_before_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'sp_with_text_before_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[0];
$result_trees{'sp_with_text_before_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'sp_with_text_before_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'sp_with_text_before_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'sp_with_text_before_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[1];
$result_trees{'sp_with_text_before_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'sp_with_text_before_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[0];
$result_trees{'sp_with_text_before_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'sp_with_text_before_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[0];
$result_trees{'sp_with_text_before_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'sp_with_text_before_in_example'}{'contents'}[0]{'contents'}[1];
$result_trees{'sp_with_text_before_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'sp_with_text_before_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'sp_with_text_before_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'sp_with_text_before_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[1];
$result_trees{'sp_with_text_before_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'sp_with_text_before_in_example'}{'contents'}[0]{'contents'}[1];
$result_trees{'sp_with_text_before_in_example'}{'contents'}[0]{'contents'}[1]{'extra'}{'end_command'} = $result_trees{'sp_with_text_before_in_example'}{'contents'}[0]{'contents'}[1]{'contents'}[1];
$result_trees{'sp_with_text_before_in_example'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'sp_with_text_before_in_example'}{'contents'}[0];
$result_trees{'sp_with_text_before_in_example'}{'contents'}[0]{'parent'} = $result_trees{'sp_with_text_before_in_example'};

$result_texis{'sp_with_text_before_in_example'} = '
@example
sp@sp 4
text
@end example
';


$result_texts{'sp_with_text_before_in_example'} = '
sp



text
';

$result_errors{'sp_with_text_before_in_example'} = [];


$result_floats{'sp_with_text_before_in_example'} = {};



$result_converted{'plaintext'}->{'sp_with_text_before_in_example'} = '     sp



     text
';

1;
