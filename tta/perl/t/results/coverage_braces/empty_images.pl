use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'empty_images'} = {
  'contents' => [
    {
      'contents' => [
        {
          'cmdname' => 'image',
          'contents' => [
            {
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
          'text' => '
'
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
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'type' => 'brace_arg'
            },
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
              'info' => {
                'spaces_after_argument' => {
                  'text' => ' '
                }
              },
              'type' => 'brace_arg'
            },
            {
              'contents' => [
                {
                  'text' => 'dd'
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
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'cmdname' => 'image',
          'contents' => [
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
            'line_nr' => 5
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
            'line_nr' => 6
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

$result_texis{'empty_images'} = '@image{}

@image{ ,aa,bb,cc ,dd}

@image{,,,@ }
@image{,,,@:}
';


$result_texts{'empty_images'} = '





';

$result_errors{'empty_images'} = [
  {
    'error_line' => '@image missing filename argument
',
    'line_nr' => 1,
    'text' => '@image missing filename argument',
    'type' => 'error'
  },
  {
    'error_line' => '@image missing filename argument
',
    'line_nr' => 3,
    'text' => '@image missing filename argument',
    'type' => 'error'
  },
  {
    'error_line' => '@image missing filename argument
',
    'line_nr' => 5,
    'text' => '@image missing filename argument',
    'type' => 'error'
  },
  {
    'error_line' => '@image missing filename argument
',
    'line_nr' => 6,
    'text' => '@image missing filename argument',
    'type' => 'error'
  }
];


$result_floats{'empty_images'} = {};


1;
