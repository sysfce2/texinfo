use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'lone_braces_in_inlineraw'} = {
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
                      'text' => 'plaintext'
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                },
                {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'truc'
                        }
                      ],
                      'parent' => {},
                      'source_info' => {
                        'file_name' => '',
                        'line_nr' => 1,
                        'macro' => ''
                      },
                      'type' => 'bracketed'
                    }
                  ],
                  'extra' => {
                    'spaces_before_argument' => ' '
                  },
                  'parent' => {},
                  'type' => 'brace_command_arg'
                }
              ],
              'cmdname' => 'inlineraw',
              'extra' => {
                'expand_index' => 1,
                'format' => 'plaintext'
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
              'text' => '.
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
$result_trees{'lone_braces_in_inlineraw'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'lone_braces_in_inlineraw'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'lone_braces_in_inlineraw'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'lone_braces_in_inlineraw'}{'contents'}[0]{'contents'}[0]{'contents'}[0];
$result_trees{'lone_braces_in_inlineraw'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'args'}[1]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'lone_braces_in_inlineraw'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'args'}[1]{'contents'}[0];
$result_trees{'lone_braces_in_inlineraw'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'lone_braces_in_inlineraw'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'args'}[1];
$result_trees{'lone_braces_in_inlineraw'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'args'}[1]{'parent'} = $result_trees{'lone_braces_in_inlineraw'}{'contents'}[0]{'contents'}[0]{'contents'}[0];
$result_trees{'lone_braces_in_inlineraw'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'lone_braces_in_inlineraw'}{'contents'}[0]{'contents'}[0];
$result_trees{'lone_braces_in_inlineraw'}{'contents'}[0]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'lone_braces_in_inlineraw'}{'contents'}[0]{'contents'}[0];
$result_trees{'lone_braces_in_inlineraw'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'lone_braces_in_inlineraw'}{'contents'}[0];
$result_trees{'lone_braces_in_inlineraw'}{'contents'}[0]{'parent'} = $result_trees{'lone_braces_in_inlineraw'};

$result_texis{'lone_braces_in_inlineraw'} = '@inlineraw{plaintext, {truc}}.
';


$result_texts{'lone_braces_in_inlineraw'} = '.
';

$result_errors{'lone_braces_in_inlineraw'} = [];


$result_floats{'lone_braces_in_inlineraw'} = {};



$result_converted{'plaintext'}->{'lone_braces_in_inlineraw'} = '{truc}.
';

1;
