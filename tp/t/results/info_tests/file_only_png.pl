use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'file_only_png'} = {
  'contents' => [
    {
      'type' => 'before_node_section'
    },
    {
      'cmdname' => 'node',
      'contents' => [
        {
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'Top'
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
          'type' => 'arguments_line'
        },
        {
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'contents' => [
            {
              'text' => 'Just before an image '
            },
            {
              'cmdname' => 'image',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'this_is_a_long_unknown_file'
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
              'text' => ' text after the image, and more text, and more '
            },
            {
              'cmdname' => 'image',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'this_is_a_long_unknown_file'
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
              'text' => ' text.
'
            }
          ],
          'type' => 'paragraph'
        }
      ],
      'extra' => {
        'is_target' => 1,
        'normalized' => 'Top'
      },
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
  'type' => 'document_root'
};

$result_texis{'file_only_png'} = '@node Top

Just before an image @image{this_is_a_long_unknown_file} text after the image, and more text, and more @image{this_is_a_long_unknown_file} text.
';


$result_texts{'file_only_png'} = '
Just before an image this_is_a_long_unknown_file text after the image, and more text, and more this_is_a_long_unknown_file text.
';

$result_nodes{'file_only_png'} = [
  {
    'cmdname' => 'node',
    'extra' => {
      'normalized' => 'Top'
    }
  }
];

$result_menus{'file_only_png'} = [
  {
    'extra' => {
      'normalized' => 'Top'
    }
  }
];

$result_errors{'file_only_png'} = [];


$result_floats{'file_only_png'} = {};



$result_converted{'info'}->{'file_only_png'} = 'This is , produced from .


File: ,  Node: Top,  Up: (dir)

Just before an image  [image src="this_is_a_long_unknown_file.png" ] text after the image, and more text, and more  [image src="this_is_a_long_unknown_file.png" ]
text.


Tag Table:
Node: Top27

End Tag Table


Local Variables:
coding: utf-8
End:
';

1;
