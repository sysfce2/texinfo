use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'space_in_setfilename'} = {
  'contents' => [
    {
      'contents' => [
        {
          'cmdname' => 'setfilename',
          'contents' => [
            {
              'contents' => [
                {
                  'cmdname' => ' '
                },
                {
                  'cmdname' => 'verb',
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => ' name ',
                          'type' => 'raw'
                        }
                      ],
                      'type' => 'brace_container'
                    }
                  ],
                  'info' => {
                    'delimiter' => ':'
                  },
                  'source_info' => {
                    'line_nr' => 1
                  }
                },
                {
                  'cmdname' => ' '
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
            'line_nr' => 1
          }
        },
        {
          'text' => '
',
          'type' => 'empty_line'
        }
      ],
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
        'line_nr' => 3
      }
    }
  ],
  'type' => 'document_root'
};

$result_texis{'space_in_setfilename'} = '@setfilename @ @verb{: name :}@ 

@node Top
';


$result_texts{'space_in_setfilename'} = '
';

$result_nodes{'space_in_setfilename'} = [
  {
    'cmdname' => 'node',
    'extra' => {
      'normalized' => 'Top'
    }
  }
];

$result_menus{'space_in_setfilename'} = [
  {
    'extra' => {
      'normalized' => 'Top'
    }
  }
];

$result_errors{'space_in_setfilename'} = [
  {
    'error_line' => 'warning: @verb should not appear in @setfilename
',
    'line_nr' => 1,
    'text' => '@verb should not appear in @setfilename',
    'type' => 'warning'
  },
  {
    'error_line' => 'bad argument to @setfilename: @ @verb{: name :}@
',
    'line_nr' => 1,
    'text' => 'bad argument to @setfilename: @ @verb{: name :}@',
    'type' => 'error'
  }
];


$result_floats{'space_in_setfilename'} = {};



$result_converted{'info'}->{'space_in_setfilename'} = 'This is , produced from .


File: ,  Node: Top,  Up: (dir)


Tag Table:
Node: Top27

End Tag Table


Local Variables:
coding: utf-8
End:
';

1;
