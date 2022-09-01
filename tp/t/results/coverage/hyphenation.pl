use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'hyphenation'} = {
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
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'some-where'
                }
              ],
              'extra' => {
                'spaces_after_argument' => ' '
              },
              'parent' => {},
              'type' => 'brace_command_arg'
            }
          ],
          'cmdname' => 'hyphenation',
          'contents' => [],
          'parent' => {},
          'source_info' => {
            'file_name' => '',
            'line_nr' => 2,
            'macro' => ''
          }
        },
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_spaces_after_close_brace'
        },
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line'
        }
      ],
      'parent' => {},
      'type' => 'before_node_section'
    }
  ],
  'type' => 'document_root'
};
$result_trees{'hyphenation'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'hyphenation'}{'contents'}[0];
$result_trees{'hyphenation'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'hyphenation'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'hyphenation'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'hyphenation'}{'contents'}[0]{'contents'}[1];
$result_trees{'hyphenation'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'hyphenation'}{'contents'}[0];
$result_trees{'hyphenation'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'hyphenation'}{'contents'}[0];
$result_trees{'hyphenation'}{'contents'}[0]{'contents'}[3]{'parent'} = $result_trees{'hyphenation'}{'contents'}[0];
$result_trees{'hyphenation'}{'contents'}[0]{'parent'} = $result_trees{'hyphenation'};

$result_texis{'hyphenation'} = '
@hyphenation{some-where }

';


$result_texts{'hyphenation'} = '

';

$result_errors{'hyphenation'} = [];


$result_floats{'hyphenation'} = {};



$result_converted{'plaintext'}->{'hyphenation'} = '';


$result_converted{'html_text'}->{'hyphenation'} = '

';


$result_converted{'xml'}->{'hyphenation'} = '
<hyphenation>some-where </hyphenation>

';


$result_converted{'latex_text'}->{'hyphenation'} = '
\\hyphenation{some-where}
';


$result_converted{'docbook'}->{'hyphenation'} = '

';

1;
