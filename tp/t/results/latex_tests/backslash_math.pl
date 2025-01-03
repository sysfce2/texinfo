use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'backslash_math'} = {
  'contents' => [
    {
      'contents' => [
        {
          'type' => 'preamble_before_content'
        },
        {
          'contents' => [
            {
              'cmdname' => 'math',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'a '
                    },
                    {
                      'cmdname' => '\\'
                    },
                    {
                      'text' => ' b '
                    },
                    {
                      'cmdname' => 'backslashchar',
                      'contents' => [
                        {
                          'type' => 'brace_container'
                        }
                      ],
                      'source_info' => {
                        'line_nr' => 1
                      }
                    },
                    {
                      'text' => ' c'
                    }
                  ],
                  'type' => 'brace_command_context'
                }
              ],
              'source_info' => {
                'line_nr' => 1
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

$result_texis{'backslash_math'} = '@math{a @\\ b @backslashchar{} c}.
';


$result_texts{'backslash_math'} = 'a \\ b \\ c.
';

$result_errors{'backslash_math'} = [];


$result_floats{'backslash_math'} = {};



$result_converted{'latex_text'}->{'backslash_math'} = '\\begin{document}
$a \\backslash{} b \\mathtt{\\backslash{}} c$.
';

1;
