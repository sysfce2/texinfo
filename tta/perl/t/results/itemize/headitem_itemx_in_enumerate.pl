use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'headitem_itemx_in_enumerate'} = {
  'contents' => [
    {
      'contents' => [
        {
          'cmdname' => 'enumerate',
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
              'cmdname' => 'item',
              'contents' => [
                {
                  'text' => ' ',
                  'type' => 'ignorable_spaces_after_command'
                },
                {
                  'contents' => [
                    {
                      'text' => 'item enumerate
'
                    }
                  ],
                  'type' => 'paragraph'
                },
                {
                  'cmdname' => 'itemx',
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'itemx enumerate'
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
                    'line_nr' => 3
                  }
                },
                {
                  'text' => ' ',
                  'type' => 'ignorable_spaces_after_command'
                },
                {
                  'contents' => [
                    {
                      'text' => 'headitem enumerate
'
                    }
                  ],
                  'type' => 'paragraph'
                }
              ],
              'extra' => {
                'item_number' => 1
              },
              'source_info' => {
                'line_nr' => 2
              }
            },
            {
              'cmdname' => 'end',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'enumerate'
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
                'text_arg' => 'enumerate'
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'line_nr' => 5
              }
            }
          ],
          'extra' => {
            'enumerate_specification' => '1'
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

$result_texis{'headitem_itemx_in_enumerate'} = '@enumerate
@item item enumerate
@itemx itemx enumerate
 headitem enumerate
@end enumerate
';


$result_texts{'headitem_itemx_in_enumerate'} = '1. item enumerate
itemx enumerate
headitem enumerate
';

$result_errors{'headitem_itemx_in_enumerate'} = [
  {
    'error_line' => '@itemx outside of table or list
',
    'line_nr' => 3,
    'text' => '@itemx outside of table or list',
    'type' => 'error'
  },
  {
    'error_line' => '@headitem not meaningful inside `@enumerate\' block
',
    'line_nr' => 4,
    'text' => '@headitem not meaningful inside `@enumerate\' block',
    'type' => 'error'
  }
];


$result_floats{'headitem_itemx_in_enumerate'} = {};


1;
