use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'titlefont_in_center'} = {
  'contents' => [
    {
      'contents' => [
        {
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'cmdname' => 'center',
          'contents' => [
            {
              'contents' => [
                {
                  'cmdname' => 'titlefont',
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'A manual'
                        }
                      ],
                      'type' => 'brace_container'
                    }
                  ],
                  'extra' => {},
                  'source_info' => {
                    'line_nr' => 2
                  }
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
          'info' => {
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'line_nr' => 2
          }
        }
      ],
      'type' => 'before_node_section'
    }
  ],
  'type' => 'document_root'
};

$result_texis{'titlefont_in_center'} = '
@center @titlefont{A manual}
';


$result_texts{'titlefont_in_center'} = '
A manual
';

$result_errors{'titlefont_in_center'} = [];


$result_floats{'titlefont_in_center'} = {};



$result_converted{'plaintext'}->{'titlefont_in_center'} = '                               A manual
                               ********
';


$result_converted{'html_text'}->{'titlefont_in_center'} = '
<div class="center"><h1 class="titlefont">A manual</h1>
</div>';


$result_converted{'xml'}->{'titlefont_in_center'} = '
<center spaces=" "><titlefont>A manual</titlefont></center>
';


$result_converted{'latex_text'}->{'titlefont_in_center'} = '
\\begin{center}
{\\huge \\bfseries A manual}
\\end{center}
';


$result_converted{'docbook'}->{'titlefont_in_center'} = '
<simpara role="center">A manual</simpara>
';

1;
