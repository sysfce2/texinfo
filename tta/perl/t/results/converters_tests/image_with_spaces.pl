use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'image_with_spaces'} = {
  'contents' => [
    {
      'contents' => [
        {
          'cmdname' => 'image',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'f--ile'
                }
              ],
              'type' => 'brace_arg'
            },
            {
              'type' => 'brace_arg'
            },
            {
              'type' => 'brace_arg'
            },
            {
              'contents' => [
                {
                  'cmdname' => ' '
                }
              ],
              'type' => 'brace_arg'
            }
          ],
          'extra' => {
            'input_encoding_name' => 'utf-8'
          },
          'source_info' => {
            'line_nr' => 1
          }
        },
        {
          'contents' => [
            {
              'text' => '.
'
            },
            {
              'cmdname' => 'image',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'f--ile'
                    }
                  ],
                  'type' => 'brace_arg'
                },
                {
                  'type' => 'brace_arg'
                },
                {
                  'type' => 'brace_arg'
                },
                {
                  'contents' => [
                    {
                      'cmdname' => ':'
                    }
                  ],
                  'type' => 'brace_arg'
                }
              ],
              'extra' => {
                'input_encoding_name' => 'utf-8'
              },
              'source_info' => {
                'line_nr' => 2
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

$result_texis{'image_with_spaces'} = '@image{f--ile,,,@ }.
@image{f--ile,,,@:}.
';


$result_texts{'image_with_spaces'} = 'f--ile.
f--ile.
';

$result_errors{'image_with_spaces'} = [];


$result_floats{'image_with_spaces'} = {};



$result_converted{'plaintext'}->{'image_with_spaces'} = 'Image description""\\..  Image description""\\..
';


$result_converted{'html_text'}->{'image_with_spaces'} = '<img class="image" src="f--ile.png" alt="&nbsp;"><p>.
<img class="image" src="f--ile.png" alt="f--ile">.
</p>';


$result_converted{'xml'}->{'image_with_spaces'} = '<image><imagefile>f--ile</imagefile><alttext><spacecmd type="spc"/></alttext></image><para>.
<image where="inline"><imagefile>f--ile</imagefile><alttext>&noeos;</alttext></image>.
</para>';


$result_converted{'docbook'}->{'image_with_spaces'} = '<informalfigure><mediaobject><imageobject><imagedata fileref="f--ile.png" format="PNG"></imagedata></imageobject><textobject><literallayout>Image description&quot;&quot;\\.</literallayout></textobject></mediaobject></informalfigure><para>.
<inlinemediaobject><imageobject><imagedata fileref="f--ile.png" format="PNG"></imagedata></imageobject><textobject><literallayout>Image description&quot;&quot;\\.</literallayout></textobject></inlinemediaobject>.
</para>';


$result_converted{'latex_text'}->{'image_with_spaces'} = '\\includegraphics{f--ile}.
\\includegraphics{f--ile}.
';


$result_converted{'info'}->{'image_with_spaces'} = 'This is , produced from .

 [image src="f--ile.png" alt=" " text="Image description\\"\\"\\\\." ]
.   [image src="f--ile.png" text="Image description\\"\\"\\\\." ].

Tag Table:

End Tag Table


Local Variables:
coding: utf-8
End:
';

$result_converted_errors{'info'}->{'image_with_spaces'} = [
  {
    'error_line' => 'warning: document without nodes
',
    'text' => 'document without nodes',
    'type' => 'warning'
  }
];


1;
