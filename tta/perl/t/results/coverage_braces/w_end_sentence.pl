use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'w_end_sentence'} = {
  'contents' => [
    {
      'contents' => [
        {
          'contents' => [
            {
              'text' => 'a. '
            },
            {
              'cmdname' => 'w',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'b'
                    }
                  ],
                  'type' => 'brace_container'
                }
              ],
              'source_info' => {
                'line_nr' => 1
              }
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

$result_texis{'w_end_sentence'} = 'a. @w{b}';


$result_texts{'w_end_sentence'} = 'a. b';

$result_errors{'w_end_sentence'} = [];


$result_floats{'w_end_sentence'} = {};



$result_converted{'plaintext'}->{'w_end_sentence'} = 'a.  b
';


$result_converted{'html_text'}->{'w_end_sentence'} = '<p>a. b<!-- /@w --></p>';


$result_converted{'latex_text'}->{'w_end_sentence'} = 'a. \\hbox{b}';


$result_converted{'docbook'}->{'w_end_sentence'} = '<para>a. b<!-- /@w --></para>';

1;
