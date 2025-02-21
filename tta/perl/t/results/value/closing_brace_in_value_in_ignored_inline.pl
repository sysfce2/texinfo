use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'closing_brace_in_value_in_ignored_inline'} = {
  'contents' => [
    {
      'contents' => [
        {
          'cmdname' => 'set',
          'contents' => [
            {
              'text' => 'closebrace',
              'type' => 'rawline_arg'
            },
            {
              'text' => '}',
              'type' => 'rawline_arg'
            }
          ],
          'info' => {
            'arg_line' => ' closebrace }
'
          }
        },
        {
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'contents' => [
            {
              'cmdname' => 'inlinefmt',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'html'
                    }
                  ],
                  'type' => 'brace_arg'
                },
                {
                  'contents' => [
                    {
                      'source_marks' => [
                        {
                          'counter' => 1,
                          'element' => {
                            'cmdname' => 'value',
                            'contents' => [
                              {
                                'contents' => [
                                  {
                                    'text' => 'closebrace'
                                  }
                                ],
                                'type' => 'brace_container'
                              }
                            ]
                          },
                          'line' => '}',
                          'position' => 5,
                          'sourcemark_type' => 'value_expansion',
                          'status' => 'start'
                        }
                      ],
                      'text' => 'truc '
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
                'expand_index' => 1,
                'format' => 'html'
              },
              'source_info' => {
                'line_nr' => 3
              },
              'source_marks' => [
                {
                  'counter' => 1,
                  'sourcemark_type' => 'value_expansion',
                  'status' => 'end'
                }
              ]
            },
            {
              'text' => '
'
            },
            {
              'text' => 'machin
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
          'contents' => [
            {
              'cmdname' => 'inlinefmt',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'tex'
                    }
                  ],
                  'type' => 'brace_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => '
bidule @value{closebrace}
after
',
                      'type' => 'raw'
                    }
                  ],
                  'type' => 'elided_brace_command_arg'
                }
              ],
              'extra' => {
                'format' => 'tex'
              },
              'source_info' => {
                'line_nr' => 7
              }
            }
          ],
          'type' => 'paragraph'
        }
      ],
      'type' => 'before_node_section'
    }
  ],
  'type' => 'document_root'
};

$result_texis{'closing_brace_in_value_in_ignored_inline'} = '@set closebrace }

@inlinefmt{html,
truc }
machin

@inlinefmt{tex,
bidule @value{closebrace}
after
}';


$result_texts{'closing_brace_in_value_in_ignored_inline'} = '
truc 
machin

';

$result_errors{'closing_brace_in_value_in_ignored_inline'} = [
  {
    'error_line' => '@inlinefmt missing closing brace
',
    'line_nr' => 7,
    'text' => '@inlinefmt missing closing brace',
    'type' => 'error'
  }
];


$result_floats{'closing_brace_in_value_in_ignored_inline'} = {};


1;
