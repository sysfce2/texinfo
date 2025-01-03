use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'cartouche_title_and_content'} = {
  'contents' => [
    {
      'contents' => [
        {
          'cmdname' => 'cartouche',
          'contents' => [
            {
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'Box title on '
                    },
                    {
                      'cmdname' => 'emph',
                      'contents' => [
                        {
                          'contents' => [
                            {
                              'text' => 'documentation'
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
                  'info' => {
                    'spaces_after_argument' => {
                      'text' => '
'
                    }
                  },
                  'type' => 'block_line_arg'
                }
              ],
              'type' => 'arguments_line'
            },
            {
              'contents' => [
                {
                  'text' => 'Text on documentation explaining something important out of the main
'
                },
                {
                  'text' => 'flow of the text.
'
                }
              ],
              'type' => 'paragraph'
            },
            {
              'cmdname' => 'end',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'cartouche'
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
              'extra' => {
                'text_arg' => 'cartouche'
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'line_nr' => 4
              }
            }
          ],
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
      'type' => 'before_node_section'
    }
  ],
  'type' => 'document_root'
};

$result_texis{'cartouche_title_and_content'} = '@cartouche Box title on @emph{documentation}
Text on documentation explaining something important out of the main
flow of the text.
@end cartouche
';


$result_texts{'cartouche_title_and_content'} = 'Box title on documentation
Text on documentation explaining something important out of the main
flow of the text.
';

$result_errors{'cartouche_title_and_content'} = [];


$result_floats{'cartouche_title_and_content'} = {};



$result_converted{'plaintext'}->{'cartouche_title_and_content'} = '                     Box title on _documentation_
Text on documentation explaining something important out of the main
flow of the text.
';


$result_converted{'html_text'}->{'cartouche_title_and_content'} = '<table class="cartouche"><tr><th>
Box title on <em class="emph">documentation</em></th></tr><tr><td>
<p>Text on documentation explaining something important out of the main
flow of the text.
</p></td></tr></table>
';


$result_converted{'xml'}->{'cartouche_title_and_content'} = '<cartouche spaces=" " endspaces=" "><cartouchetitle>Box title on <emph>documentation</emph></cartouchetitle>
<para>Text on documentation explaining something important out of the main
flow of the text.
</para></cartouche>
';


$result_converted{'latex_text'}->{'cartouche_title_and_content'} = '\\begin{mdframed}[style=Texinfocartouche, frametitle={Box title on \\emph{documentation}}]
Text on documentation explaining something important out of the main
flow of the text.
\\end{mdframed}
';


$result_converted{'docbook'}->{'cartouche_title_and_content'} = '<sidebar><title>Box title on <emphasis>documentation</emphasis></title>
<para>Text on documentation explaining something important out of the main
flow of the text.
</para></sidebar>';

1;
