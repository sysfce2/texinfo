use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text);

use utf8;

$result_trees{'image_with_spaces'} = {
  'contents' => [
    {
      'args' => [
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'f--ile'
            }
          ],
          'parent' => {},
          'type' => 'brace_command_arg'
        },
        {
          'contents' => [],
          'parent' => {},
          'type' => 'brace_command_arg'
        },
        {
          'contents' => [],
          'parent' => {},
          'type' => 'brace_command_arg'
        },
        {
          'contents' => [
            {
              'cmdname' => ' ',
              'parent' => {}
            }
          ],
          'parent' => {},
          'type' => 'brace_command_arg'
        }
      ],
      'cmdname' => 'image',
      'contents' => [],
      'extra' => {
        'input_perl_encoding' => 'utf-8-strict'
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 1,
        'macro' => ''
      },
      'parent' => {}
    },
    {
      'contents' => [
        {
          'parent' => {},
          'text' => '.
'
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'f--ile'
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            },
            {
              'contents' => [],
              'parent' => {},
              'type' => 'brace_command_arg'
            },
            {
              'contents' => [],
              'parent' => {},
              'type' => 'brace_command_arg'
            },
            {
              'contents' => [
                {
                  'cmdname' => ':',
                  'parent' => {}
                }
              ],
              'parent' => {},
              'type' => 'brace_command_arg'
            }
          ],
          'cmdname' => 'image',
          'contents' => [],
          'extra' => {
            'input_perl_encoding' => 'utf-8-strict'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 2,
            'macro' => ''
          },
          'parent' => {}
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
  'type' => 'text_root'
};
$result_trees{'image_with_spaces'}{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'image_with_spaces'}{'contents'}[0]{'args'}[0];
$result_trees{'image_with_spaces'}{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'image_with_spaces'}{'contents'}[0];
$result_trees{'image_with_spaces'}{'contents'}[0]{'args'}[1]{'parent'} = $result_trees{'image_with_spaces'}{'contents'}[0];
$result_trees{'image_with_spaces'}{'contents'}[0]{'args'}[2]{'parent'} = $result_trees{'image_with_spaces'}{'contents'}[0];
$result_trees{'image_with_spaces'}{'contents'}[0]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'image_with_spaces'}{'contents'}[0]{'args'}[3];
$result_trees{'image_with_spaces'}{'contents'}[0]{'args'}[3]{'parent'} = $result_trees{'image_with_spaces'}{'contents'}[0];
$result_trees{'image_with_spaces'}{'contents'}[0]{'parent'} = $result_trees{'image_with_spaces'};
$result_trees{'image_with_spaces'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'image_with_spaces'}{'contents'}[1];
$result_trees{'image_with_spaces'}{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'image_with_spaces'}{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'image_with_spaces'}{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'image_with_spaces'}{'contents'}[1]{'contents'}[1];
$result_trees{'image_with_spaces'}{'contents'}[1]{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'image_with_spaces'}{'contents'}[1]{'contents'}[1];
$result_trees{'image_with_spaces'}{'contents'}[1]{'contents'}[1]{'args'}[2]{'parent'} = $result_trees{'image_with_spaces'}{'contents'}[1]{'contents'}[1];
$result_trees{'image_with_spaces'}{'contents'}[1]{'contents'}[1]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'image_with_spaces'}{'contents'}[1]{'contents'}[1]{'args'}[3];
$result_trees{'image_with_spaces'}{'contents'}[1]{'contents'}[1]{'args'}[3]{'parent'} = $result_trees{'image_with_spaces'}{'contents'}[1]{'contents'}[1];
$result_trees{'image_with_spaces'}{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'image_with_spaces'}{'contents'}[1];
$result_trees{'image_with_spaces'}{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'image_with_spaces'}{'contents'}[1];
$result_trees{'image_with_spaces'}{'contents'}[1]{'parent'} = $result_trees{'image_with_spaces'};

$result_texis{'image_with_spaces'} = '@image{f--ile,,,@ }.
@image{f--ile,,,@:}.
';


$result_texts{'image_with_spaces'} = 'f--ile.
f--ile.
';

$result_errors{'image_with_spaces'} = [];



$result_converted{'plaintext'}->{'image_with_spaces'} = 'Image description""\\.. Image description""\\..
';


$result_converted{'html_text'}->{'image_with_spaces'} = '<img src="f--ile.png" alt="&nbsp;"><p>.
<img src="f--ile.png" alt="f--ile">.
</p>';


$result_converted{'xml'}->{'image_with_spaces'} = '<image><imagefile>f--ile</imagefile><alttext><spacecmd type="spc"/></alttext></image><para>.
<image where="inline"><imagefile>f--ile</imagefile><alttext>&noeos;</alttext></image>.
</para>';


$result_converted{'docbook'}->{'image_with_spaces'} = '<informalfigure><mediaobject><imageobject><imagedata fileref="f--ile.png" format="PNG"></imagedata></imageobject><textobject><literallayout>Image description&quot;&quot;\\.</literallayout></textobject></mediaobject></informalfigure><para>.
<inlinemediaobject><imageobject><imagedata fileref="f--ile.png" format="PNG"></imagedata></imageobject><textobject><literallayout>Image description&quot;&quot;\\.</literallayout></textobject></inlinemediaobject>.
</para>';


$result_converted{'info'}->{'image_with_spaces'} = 'This is , produced from .

 [image src="f--ile.png" alt=" " text="Image description\\"\\"\\\\." ]
.  [image src="f--ile.png" alt="" text="Image description\\"\\"\\\\." ].


Tag Table:

End Tag Table
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
