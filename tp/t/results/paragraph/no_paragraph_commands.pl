use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'no_paragraph_commands'} = {
  'contents' => [
    {
      'contents' => [
        {
          'cmdname' => '*'
        },
        {
          'text' => '
'
        },
        {
          'cmdname' => 'titlefont',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'title font'
                }
              ],
              'type' => 'brace_container'
            }
          ],
          'extra' => {},
          'source_info' => {
            'line_nr' => 2
          }
        },
        {
          'text' => '
'
        },
        {
          'cmdname' => 'image',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'aa'
                }
              ],
              'type' => 'brace_arg'
            },
            {
              'contents' => [
                {
                  'text' => 'bb'
                }
              ],
              'type' => 'brace_arg'
            },
            {
              'contents' => [
                {
                  'text' => 'cc'
                }
              ],
              'type' => 'brace_arg'
            },
            {
              'contents' => [
                {
                  'text' => 'dd'
                }
              ],
              'type' => 'brace_arg'
            },
            {
              'contents' => [
                {
                  'text' => '.ee'
                }
              ],
              'type' => 'brace_arg'
            }
          ],
          'extra' => {
            'input_encoding_name' => 'utf-8'
          },
          'source_info' => {
            'line_nr' => 3
          }
        },
        {
          'text' => '
'
        }
      ],
      'type' => 'before_node_section'
    }
  ],
  'type' => 'document_root'
};

$result_texis{'no_paragraph_commands'} = '@*
@titlefont{title font}
@image{aa,bb,cc,dd,.ee}
';


$result_texts{'no_paragraph_commands'} = '

title font
aa
';

$result_errors{'no_paragraph_commands'} = [];


$result_floats{'no_paragraph_commands'} = {};



$result_converted{'plaintext'}->{'no_paragraph_commands'} = '

title font
**********
Text for image out of paragraph.
';


$result_converted{'html_text'}->{'no_paragraph_commands'} = '<br>
<h1 class="titlefont">title font</h1>
<img class="image" src="aa.ee" alt="dd">
';

$result_converted_errors{'html_text'}->{'no_paragraph_commands'} = [
  {
    'error_line' => 'warning: @image file `aa\' (for HTML) not found, using `aa.ee\'
',
    'line_nr' => 3,
    'text' => '@image file `aa\' (for HTML) not found, using `aa.ee\'',
    'type' => 'warning'
  }
];


1;
