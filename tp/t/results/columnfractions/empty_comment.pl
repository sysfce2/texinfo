use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'empty_comment'} = {
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
                      'args' => [
                        {
                          'info' => {
                            'comment_at_end' => {
                              'args' => [
                                {
                                  'text' => '
',
                                  'type' => 'rawline_arg'
                                }
                              ],
                              'cmdname' => 'c'
                            }
                          },
                          'type' => 'line_arg'
                        }
                      ],
                      'cmdname' => 'columnfractions',
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
                  'type' => 'block_line_arg'
                }
              ],
              'type' => 'argument'
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'text' => 'multitable'
                    }
                  ],
                  'type' => 'line_arg'
                }
              ],
              'cmdname' => 'end',
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

$result_texis{'empty_comment'} = '@multitable @columnfractions @c
@end multitable';


$result_texts{'empty_comment'} = '';

$result_errors{'empty_comment'} = [
  {
    'error_line' => '@columnfractions missing argument
',
    'line_nr' => 1,
    'text' => '@columnfractions missing argument',
    'type' => 'error'
  }
];


$result_floats{'empty_comment'} = {};



$result_converted{'xml'}->{'empty_comment'} = '<multitable spaces=" " endspaces=" "><columnfractions spaces=" " line="@c"></columnfractions><!-- c -->
</multitable>';


$result_converted{'latex_text'}->{'empty_comment'} = '\\begin{tabular}{}%
\\end{tabular}%
';

1;
