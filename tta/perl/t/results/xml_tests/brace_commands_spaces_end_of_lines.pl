use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'brace_commands_spaces_end_of_lines'} = {
  'contents' => [
    {
      'contents' => [
        {
          'cmdname' => 'image',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'a'
                }
              ],
              'info' => {
                'spaces_before_argument' => {
                  'text' => '
'
                }
              },
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
              'contents' => [
                {
                  'text' => 'a'
                }
              ],
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' 
'
                }
              },
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
                  'text' => 'a'
                }
              ],
              'type' => 'brace_arg'
            },
            {
              'contents' => [
                {
                  'text' => 'b'
                }
              ],
              'info' => {
                'spaces_before_argument' => {
                  'text' => '
'
                }
              },
              'type' => 'brace_arg'
            }
          ],
          'extra' => {
            'input_encoding_name' => 'utf-8'
          },
          'source_info' => {
            'line_nr' => 7
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
              'contents' => [
                {
                  'text' => 'a'
                }
              ],
              'type' => 'brace_arg'
            },
            {
              'contents' => [
                {
                  'text' => 'b'
                }
              ],
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' 
'
                }
              },
              'type' => 'brace_arg'
            }
          ],
          'extra' => {
            'input_encoding_name' => 'utf-8'
          },
          'source_info' => {
            'line_nr' => 10
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
              'contents' => [
                {
                  'text' => 'a'
                }
              ],
              'type' => 'brace_arg'
            },
            {
              'contents' => [
                {
                  'text' => ' b'
                }
              ],
              'info' => {
                'spaces_before_argument' => {
                  'text' => '
'
                }
              },
              'type' => 'brace_arg'
            }
          ],
          'extra' => {
            'input_encoding_name' => 'utf-8'
          },
          'source_info' => {
            'line_nr' => 13
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
              'contents' => [
                {
                  'text' => 'a'
                }
              ],
              'type' => 'brace_arg'
            },
            {
              'contents' => [
                {
                  'text' => ' b'
                }
              ],
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' 
'
                }
              },
              'type' => 'brace_arg'
            }
          ],
          'extra' => {
            'input_encoding_name' => 'utf-8'
          },
          'source_info' => {
            'line_nr' => 16
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

$result_texis{'brace_commands_spaces_end_of_lines'} = '@image{
a}

@image{ 
a}

@image{a,
b}

@image{a, 
b}

@image{a,
 b}

@image{a, 
 b}
';


$result_texts{'brace_commands_spaces_end_of_lines'} = 'a

a

a

a

a

a
';

$result_errors{'brace_commands_spaces_end_of_lines'} = [];


$result_floats{'brace_commands_spaces_end_of_lines'} = {};



$result_converted{'xml'}->{'brace_commands_spaces_end_of_lines'} = '<image><imagefile spaces="\\n">a</imagefile></image>

<image><imagefile spaces=" \\n">a</imagefile></image>

<image><imagefile>a</imagefile><imagewidth spaces="\\n">b</imagewidth></image>

<image><imagefile>a</imagefile><imagewidth spaces=" \\n">b</imagewidth></image>

<image><imagefile>a</imagefile><imagewidth spaces="\\n"> b</imagewidth></image>

<image><imagefile>a</imagefile><imagewidth spaces=" \\n"> b</imagewidth></image>
';

1;
