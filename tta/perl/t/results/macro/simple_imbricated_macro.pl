use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'simple_imbricated_macro'} = {
  'contents' => [
    {
      'contents' => [
        {
          'cmdname' => 'macro',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => ' truc {}
',
                  'type' => 'macro_line'
                }
              ],
              'type' => 'arguments_line'
            },
            {
              'text' => 'truc.
',
              'type' => 'raw'
            },
            {
              'text' => '@macro bidule {}
',
              'type' => 'raw'
            },
            {
              'text' => 'bidule.
',
              'type' => 'raw'
            },
            {
              'text' => '@end macro
',
              'type' => 'raw'
            },
            {
              'cmdname' => 'end',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'macro'
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
                'text_arg' => 'macro'
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
          'extra' => {
            'macro_name' => 'truc',
            'misc_args' => []
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
          'contents' => [
            {
              'source_marks' => [
                {
                  'counter' => 1,
                  'element' => {
                    'contents' => [
                      {
                        'type' => 'brace_arg'
                      }
                    ],
                    'info' => {
                      'command_name' => 'truc'
                    },
                    'type' => 'macro_call'
                  },
                  'sourcemark_type' => 'macro_expansion',
                  'status' => 'start'
                }
              ],
              'text' => 'truc.
'
            },
            {
              'cmdname' => 'macro',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => ' bidule {}
',
                      'type' => 'macro_line'
                    }
                  ],
                  'type' => 'arguments_line'
                },
                {
                  'text' => 'bidule.
',
                  'type' => 'raw'
                },
                {
                  'cmdname' => 'end',
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'source_marks' => [
                            {
                              'counter' => 1,
                              'position' => 5,
                              'sourcemark_type' => 'macro_expansion',
                              'status' => 'end'
                            }
                          ],
                          'text' => 'macro'
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
                    'text_arg' => 'macro'
                  },
                  'info' => {
                    'spaces_before_argument' => {
                      'text' => ' '
                    }
                  },
                  'source_info' => {
                    'line_nr' => 8,
                    'macro' => 'truc'
                  }
                }
              ],
              'extra' => {
                'macro_name' => 'bidule',
                'misc_args' => []
              },
              'source_info' => {
                'line_nr' => 8,
                'macro' => 'truc'
              }
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
              'source_marks' => [
                {
                  'counter' => 2,
                  'element' => {
                    'contents' => [
                      {
                        'type' => 'brace_arg'
                      }
                    ],
                    'info' => {
                      'command_name' => 'bidule'
                    },
                    'type' => 'macro_call'
                  },
                  'sourcemark_type' => 'macro_expansion',
                  'status' => 'start'
                },
                {
                  'counter' => 2,
                  'position' => 7,
                  'sourcemark_type' => 'macro_expansion',
                  'status' => 'end'
                }
              ],
              'text' => 'bidule.
'
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

$result_texis{'simple_imbricated_macro'} = '@macro truc {}
truc.
@macro bidule {}
bidule.
@end macro
@end macro

truc.
@macro bidule {}
bidule.
@end macro

bidule.
';


$result_texts{'simple_imbricated_macro'} = '
truc.

bidule.
';

$result_errors{'simple_imbricated_macro'} = [];


$result_floats{'simple_imbricated_macro'} = {};


1;
