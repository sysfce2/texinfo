use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'nested'} = {
  'contents' => [
    {
      'contents' => [
        {
          'contents' => [
            {
              'text' => 'type the characters '
            },
            {
              'cmdname' => 'kbd',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'l o g o u t '
                    },
                    {
                      'cmdname' => 'key',
                      'contents' => [
                        {
                          'contents' => [
                            {
                              'text' => 'RET'
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
                  'type' => 'brace_container'
                }
              ],
              'source_info' => {
                'line_nr' => 1
              }
            },
            {
              'text' => '.'
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

$result_texis{'nested'} = 'type the characters @kbd{l o g o u t @key{RET}}.';


$result_texts{'nested'} = 'type the characters l o g o u t RET.';

$result_errors{'nested'} = [];


$result_floats{'nested'} = {};



$result_converted{'plaintext'}->{'nested'} = 'type the characters ‘l o g o u t <RET>’.
';


$result_converted{'html_text'}->{'nested'} = '<p>type the characters <kbd class="kbd">l o g o u t <kbd class="key">RET</kbd></kbd>.</p>';


$result_converted{'latex_text'}->{'nested'} = 'type the characters \\Texinfocommandstyletextkbd{l o g o u t \\texttt{RET}}.';


$result_converted{'docbook'}->{'nested'} = '<para>type the characters <userinput>l o g o u t <keycap>RET</keycap></userinput>.</para>';

1;
