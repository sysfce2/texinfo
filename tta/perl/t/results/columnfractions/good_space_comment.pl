use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'good_space_comment'} = {
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
                      'cmdname' => 'columnfractions',
                      'contents' => [
                        {
                          'contents' => [
                            {
                              'text' => '0 1'
                            }
                          ],
                          'info' => {
                            'comment_at_end' => {
                              'cmdname' => 'c',
                              'contents' => [
                                {
                                  'text' => ' space comment
',
                                  'type' => 'rawline_arg'
                                }
                              ]
                            },
                            'spaces_after_argument' => {
                              'text' => '  '
                            }
                          },
                          'type' => 'line_arg'
                        }
                      ],
                      'extra' => {
                        'misc_args' => [
                          '0',
                          '1'
                        ]
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
            'columnfractions' => {},
            'max_columns' => 2
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
$result_trees{'good_space_comment'}{'contents'}[0]{'contents'}[0]{'extra'}{'columnfractions'} = $result_trees{'good_space_comment'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'contents'}[0]{'contents'}[0];

$result_texis{'good_space_comment'} = '@multitable @columnfractions 0 1  @c space comment
@end multitable';


$result_texts{'good_space_comment'} = '';

$result_errors{'good_space_comment'} = [];


$result_floats{'good_space_comment'} = {};



$result_converted{'html_text'}->{'good_space_comment'} = '';


$result_converted{'xml'}->{'good_space_comment'} = '<multitable spaces=" " endspaces=" "><columnfractions spaces=" " line="0 1  @c space comment"><columnfraction value="0"></columnfraction><columnfraction value="1"></columnfraction></columnfractions><!-- c space comment -->
</multitable>';


$result_converted{'latex_text'}->{'good_space_comment'} = '\\begin{tabular}{m{0\\textwidth} m{1\\textwidth}}%
\\end{tabular}%
';

1;
