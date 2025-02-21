use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'tab_in_index'} = {
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
                      'contents' => [
                        {
                          'text' => 'one nonlettered character'
                        }
                      ],
                      'source_info' => {
                        'line_nr' => 1
                      },
                      'type' => 'bracketed_arg'
                    },
                    {
                      'text' => ' '
                    },
                    {
                      'contents' => [
                        {
                          'text' => 'normal text'
                        }
                      ],
                      'source_info' => {
                        'line_nr' => 1
                      },
                      'type' => 'bracketed_arg'
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
              'contents' => [
                {
                  'contents' => [
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
                              'text' => 'one nonlettered character '
                            }
                          ],
                          'type' => 'paragraph'
                        }
                      ],
                      'extra' => {
                        'cell_number' => 1
                      },
                      'source_info' => {
                        'line_nr' => 2
                      }
                    },
                    {
                      'cmdname' => 'tab',
                      'contents' => [
                        {
                          'text' => ' ',
                          'type' => 'ignorable_spaces_after_command'
                        },
                        {
                          'contents' => [
                            {
                              'text' => 'aaa
'
                            },
                            {
                              'cmdname' => 'vindex',
                              'contents' => [
                                {
                                  'contents' => [
                                    {
                                      'text' => 'in index entry '
                                    },
                                    {
                                      'text' => ' ',
                                      'type' => 'ignorable_spaces_after_command'
                                    },
                                    {
                                      'text' => 'in tab'
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
                                'index_entry' => [
                                  'vr',
                                  1
                                ]
                              },
                              'info' => {
                                'command_name' => 'vindex',
                                'spaces_before_argument' => {
                                  'text' => ' '
                                }
                              },
                              'source_info' => {
                                'line_nr' => 3
                              },
                              'type' => 'index_entry_command'
                            }
                          ],
                          'type' => 'paragraph'
                        }
                      ],
                      'extra' => {
                        'cell_number' => 2
                      },
                      'source_info' => {
                        'line_nr' => 2
                      }
                    }
                  ],
                  'extra' => {
                    'row_number' => 1
                  },
                  'type' => 'row'
                }
              ],
              'type' => 'multitable_body'
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
                'line_nr' => 4
              }
            }
          ],
          'extra' => {
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

$result_texis{'tab_in_index'} = '@multitable {one nonlettered character} {normal text}
@item one nonlettered character @tab aaa
@vindex in index entry  in tab
@end multitable
';


$result_texts{'tab_in_index'} = 'one nonlettered character aaa
';

$result_errors{'tab_in_index'} = [
  {
    'error_line' => 'warning: @tab should not appear on @vindex line
',
    'line_nr' => 3,
    'text' => '@tab should not appear on @vindex line',
    'type' => 'warning'
  },
  {
    'error_line' => 'ignoring @tab outside of multitable
',
    'line_nr' => 3,
    'text' => 'ignoring @tab outside of multitable',
    'type' => 'error'
  },
  {
    'error_line' => 'warning: entry for index `vr\' outside of any node
',
    'line_nr' => 3,
    'text' => 'entry for index `vr\' outside of any node',
    'type' => 'warning'
  }
];


$result_floats{'tab_in_index'} = {};


$result_indices_sort_strings{'tab_in_index'} = {
  'vr' => [
    'in index entry in tab'
  ]
};


1;
