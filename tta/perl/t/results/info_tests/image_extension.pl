use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'image_extension'} = {
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
          'cmdname' => 'image',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'fext'
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
              'type' => 'brace_arg'
            },
            {
              'contents' => [
                {
                  'text' => 'ext'
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
        },
        {
          'cmdname' => 'image',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'fdotext'
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
              'type' => 'brace_arg'
            },
            {
              'contents' => [
                {
                  'text' => 'ext'
                }
              ],
              'type' => 'brace_arg'
            }
          ],
          'extra' => {
            'input_encoding_name' => 'utf-8'
          },
          'source_info' => {
            'line_nr' => 4
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
              'type' => 'brace_arg'
            },
            {
              'contents' => [
                {
                  'text' => 'ext'
                }
              ],
              'type' => 'brace_arg'
            }
          ],
          'extra' => {
            'input_encoding_name' => 'utf-8'
          },
          'source_info' => {
            'line_nr' => 5
          }
        },
        {
          'text' => '
'
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

$result_texis{'image_extension'} = '@node Top

@image{fext,,,,ext}
@image{fdotext,,,,ext}
@image{f--ile,,,,ext}
';


$result_texts{'image_extension'} = '
fext
fdotext
f--ile
';

$result_nodes{'image_extension'} = [
  {
    'cmdname' => 'node',
    'extra' => {
      'normalized' => 'Top'
    }
  }
];

$result_menus{'image_extension'} = [
  {
    'extra' => {
      'normalized' => 'Top'
    }
  }
];

$result_errors{'image_extension'} = [];


$result_floats{'image_extension'} = {};



$result_converted{'info'}->{'image_extension'} = 'This is , produced from .


File: ,  Node: Top,  Up: (dir)

 [image src="fextext" text="t" ]

 [image src="fdotext.ext" text="t" ]

 [image src="f--ile.png" text="Image description\\"\\"\\\\." ]


Tag Table:
Node: Top27

End Tag Table


Local Variables:
coding: utf-8
End:
';

1;
