use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'prototype_no_brace'} = {
  'contents' => [
    {
      'contents' => [
        {
          'cmdname' => 'multitable',
          'contents' => [
            {
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'aa'
                    },
                    {
                      'cmdname' => 'var',
                      'contents' => [
                        {
                          'contents' => [
                            {
                              'text' => 'FF'
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
                      'text' => ' b    cc'
                    }
                  ],
                  'info' => {
                    'spaces_after_argument' => {
                      'text' => '
'
                    }
                  },
                  'type' => 'block_line_arg'
                }
              ],
              'type' => 'arguments_line'
            },
            {
              'cmdname' => 'end',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'multitable'
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
              'extra' => {
                'text_arg' => 'multitable'
              },
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
          'extra' => {
            'max_columns' => 0
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
      'type' => 'before_node_section'
    }
  ],
  'type' => 'document_root'
};

$result_texis{'prototype_no_brace'} = '@multitable aa@var{FF} b    cc
@end multitable
';


$result_texts{'prototype_no_brace'} = '';

$result_errors{'prototype_no_brace'} = [
  {
    'error_line' => 'warning: unexpected argument on @multitable line: @var{FF}
',
    'line_nr' => 1,
    'text' => 'unexpected argument on @multitable line: @var{FF}',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: empty multitable
',
    'line_nr' => 1,
    'text' => 'empty multitable',
    'type' => 'warning'
  }
];


$result_floats{'prototype_no_brace'} = {};



$result_converted{'plaintext'}->{'prototype_no_brace'} = '';


$result_converted{'html_text'}->{'prototype_no_brace'} = '';


$result_converted{'xml'}->{'prototype_no_brace'} = '<multitable spaces=" " endspaces=" "><columnprototypes>aa<var>FF</var> b    cc</columnprototypes>
</multitable>
';

1;
