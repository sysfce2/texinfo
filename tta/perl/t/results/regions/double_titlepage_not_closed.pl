use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'double_titlepage_not_closed'} = {
  'contents' => [
    {
      'contents' => [
        {
          'cmdname' => 'titlepage',
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
              'text' => '
',
              'type' => 'empty_line'
            },
            {
              'contents' => [
                {
                  'text' => 'This is in title page
'
                }
              ],
              'type' => 'paragraph'
            },
            {
              'text' => '
',
              'type' => 'empty_line'
            },
            {
              'text' => '
',
              'type' => 'empty_line'
            },
            {
              'cmdname' => 'titlepage',
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
                  'text' => '
',
                  'type' => 'empty_line'
                },
                {
                  'contents' => [
                    {
                      'text' => 'And still in title page
'
                    }
                  ],
                  'type' => 'paragraph'
                }
              ],
              'source_info' => {
                'line_nr' => 6
              }
            }
          ],
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

$result_texis{'double_titlepage_not_closed'} = '@titlepage

This is in title page


@titlepage

And still in title page
';


$result_texts{'double_titlepage_not_closed'} = '';

$result_errors{'double_titlepage_not_closed'} = [
  {
    'error_line' => 'warning: @titlepage should not appear in @titlepage block
',
    'line_nr' => 6,
    'text' => '@titlepage should not appear in @titlepage block',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: multiple @titlepage
',
    'line_nr' => 6,
    'text' => 'multiple @titlepage',
    'type' => 'warning'
  },
  {
    'error_line' => 'no matching `@end titlepage\'
',
    'line_nr' => 8,
    'text' => 'no matching `@end titlepage\'',
    'type' => 'error'
  },
  {
    'error_line' => 'no matching `@end titlepage\'
',
    'line_nr' => 8,
    'text' => 'no matching `@end titlepage\'',
    'type' => 'error'
  }
];


$result_floats{'double_titlepage_not_closed'} = {};


1;
