use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'empty_quotation_with_arg_followed_by_quotation'} = {
  'contents' => [
    {
      'contents' => [
        {
          'cmdname' => 'quotation',
          'contents' => [
            {
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'something'
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
                      'text' => 'quotation'
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
                'text_arg' => 'quotation'
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
        },
        {
          'cmdname' => 'quotation',
          'contents' => [
            {
              'contents' => [
                {
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
              'contents' => [
                {
                  'text' => 'In quotation
'
                }
              ],
              'type' => 'paragraph'
            },
            {
              'cmdname' => 'end',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'quotation'
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
                'text_arg' => 'quotation'
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'line_nr' => 6
              }
            }
          ],
          'source_info' => {
            'line_nr' => 4
          }
        }
      ],
      'type' => 'before_node_section'
    }
  ],
  'type' => 'document_root'
};

$result_texis{'empty_quotation_with_arg_followed_by_quotation'} = '@quotation something
@end quotation

@quotation
In quotation
@end quotation
';


$result_texts{'empty_quotation_with_arg_followed_by_quotation'} = 'something

In quotation
';

$result_errors{'empty_quotation_with_arg_followed_by_quotation'} = [];


$result_floats{'empty_quotation_with_arg_followed_by_quotation'} = {};



$result_converted{'docbook'}->{'empty_quotation_with_arg_followed_by_quotation'} = '<blockquote></blockquote>
<blockquote><para>In quotation
</para></blockquote>';

1;
