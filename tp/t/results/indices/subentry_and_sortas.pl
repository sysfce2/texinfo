use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'subentry_and_sortas'} = {
  'contents' => [
    {
      'contents' => [
        {
          'contents' => [],
          'parent' => {},
          'type' => 'preamble_before_content'
        }
      ],
      'parent' => {},
      'type' => 'before_node_section'
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'Top'
            }
          ],
          'extra' => {
            'spaces_after_argument' => '
'
          },
          'parent' => {},
          'type' => 'line_arg'
        }
      ],
      'cmdname' => 'node',
      'extra' => {
        'node_content' => [
          {}
        ],
        'nodes_manuals' => [
          {
            'node_content' => [
              {}
            ],
            'normalized' => 'Top'
          }
        ],
        'normalized' => 'Top',
        'spaces_before_argument' => ' '
      },
      'parent' => {},
      'source_info' => {
        'file_name' => '',
        'line_nr' => 1,
        'macro' => ''
      }
    },
    {
      'args' => [
        {
          'extra' => {
            'spaces_after_argument' => '
'
          },
          'parent' => {},
          'type' => 'line_arg'
        }
      ],
      'cmdname' => 'top',
      'contents' => [
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line'
        }
      ],
      'extra' => {},
      'parent' => {},
      'source_info' => {
        'file_name' => '',
        'line_nr' => 2,
        'macro' => ''
      }
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'chapter index'
            }
          ],
          'extra' => {
            'spaces_after_argument' => '
'
          },
          'parent' => {},
          'type' => 'line_arg'
        }
      ],
      'cmdname' => 'node',
      'extra' => {
        'isindex' => 1,
        'node_content' => [
          {}
        ],
        'nodes_manuals' => [
          {
            'node_content' => [
              {}
            ],
            'normalized' => 'chapter-index'
          }
        ],
        'normalized' => 'chapter-index',
        'spaces_before_argument' => ' '
      },
      'parent' => {},
      'source_info' => {
        'file_name' => '',
        'line_nr' => 4,
        'macro' => ''
      }
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'Index'
            }
          ],
          'extra' => {
            'spaces_after_argument' => '
'
          },
          'parent' => {},
          'type' => 'line_arg'
        }
      ],
      'cmdname' => 'chapter',
      'contents' => [
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'aaa'
                },
                {
                  'parent' => {},
                  'text' => ' ',
                  'type' => 'spaces_at_end'
                },
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'A---S'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'sortas',
                  'parent' => {},
                  'source_info' => {
                    'file_name' => '',
                    'line_nr' => 7,
                    'macro' => ''
                  }
                }
              ],
              'extra' => {
                'spaces_after_argument' => ' '
              },
              'parent' => {},
              'type' => 'line_arg'
            }
          ],
          'cmdname' => 'cindex',
          'extra' => {
            'index_entry' => {
              'content_normalized' => [],
              'entry_content' => [],
              'entry_element' => {},
              'entry_node' => {},
              'entry_number' => 1,
              'in_code' => 0,
              'index_at_command' => 'cindex',
              'index_ignore_chars' => {},
              'index_name' => 'cp',
              'index_type_command' => 'cindex',
              'sortas' => 'A---S'
            },
            'sortas' => 'A---S',
            'spaces_before_argument' => ' ',
            'subentry' => {
              'args' => [
                {
                  'contents' => [
                    {
                      'args' => [
                        {
                          'contents' => [
                            {
                              'parent' => {},
                              'text' => 'B---S1'
                            }
                          ],
                          'parent' => {},
                          'type' => 'brace_command_arg'
                        }
                      ],
                      'cmdname' => 'sortas',
                      'parent' => {},
                      'source_info' => {
                        'file_name' => '',
                        'line_nr' => 7,
                        'macro' => ''
                      }
                    },
                    {
                      'parent' => {},
                      'text' => ' ',
                      'type' => 'spaces_after_close_brace'
                    },
                    {
                      'parent' => {},
                      'text' => 'bbb'
                    }
                  ],
                  'extra' => {
                    'spaces_after_argument' => '
'
                  },
                  'parent' => {},
                  'type' => 'line_arg'
                }
              ],
              'cmdname' => 'subentry',
              'extra' => {
                'level' => 1,
                'sortas' => 'B---S1',
                'spaces_before_argument' => ' '
              },
              'parent' => {},
              'source_info' => {
                'file_name' => '',
                'line_nr' => 7,
                'macro' => ''
              }
            }
          },
          'parent' => {},
          'source_info' => {
            'file_name' => '',
            'line_nr' => 7,
            'macro' => ''
          },
          'type' => 'index_entry_command'
        },
        {},
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'xxx'
                },
                {
                  'parent' => {},
                  'text' => ' ',
                  'type' => 'spaces_at_end'
                },
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'X---S'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'sortas',
                  'parent' => {},
                  'source_info' => {
                    'file_name' => '',
                    'line_nr' => 9,
                    'macro' => ''
                  }
                }
              ],
              'extra' => {
                'spaces_after_argument' => ' '
              },
              'parent' => {},
              'type' => 'line_arg'
            }
          ],
          'cmdname' => 'findex',
          'extra' => {
            'index_entry' => {
              'content_normalized' => [],
              'entry_content' => [],
              'entry_element' => {},
              'entry_node' => {},
              'entry_number' => 1,
              'in_code' => 1,
              'index_at_command' => 'findex',
              'index_ignore_chars' => {},
              'index_name' => 'fn',
              'index_type_command' => 'findex',
              'sortas' => 'X---S'
            },
            'sortas' => 'X---S',
            'spaces_before_argument' => ' ',
            'subentry' => {
              'args' => [
                {
                  'contents' => [
                    {
                      'args' => [
                        {
                          'contents' => [
                            {
                              'parent' => {},
                              'text' => 'X---S1'
                            }
                          ],
                          'parent' => {},
                          'type' => 'brace_command_arg'
                        }
                      ],
                      'cmdname' => 'sortas',
                      'parent' => {},
                      'source_info' => {
                        'file_name' => '',
                        'line_nr' => 9,
                        'macro' => ''
                      }
                    },
                    {
                      'parent' => {},
                      'text' => ' ',
                      'type' => 'spaces_after_close_brace'
                    },
                    {
                      'parent' => {},
                      'text' => 'zzz'
                    }
                  ],
                  'extra' => {
                    'spaces_after_argument' => '
'
                  },
                  'parent' => {},
                  'type' => 'line_arg'
                }
              ],
              'cmdname' => 'subentry',
              'extra' => {
                'level' => 1,
                'sortas' => 'X---S1',
                'spaces_before_argument' => ' '
              },
              'parent' => {},
              'source_info' => {
                'file_name' => '',
                'line_nr' => 9,
                'macro' => ''
              }
            }
          },
          'parent' => {},
          'source_info' => {
            'file_name' => '',
            'line_nr' => 9,
            'macro' => ''
          },
          'type' => 'index_entry_command'
        },
        {},
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'cp'
                }
              ],
              'extra' => {
                'spaces_after_argument' => '
'
              },
              'parent' => {},
              'type' => 'line_arg'
            }
          ],
          'cmdname' => 'printindex',
          'extra' => {
            'misc_args' => [
              'cp'
            ],
            'spaces_before_argument' => ' '
          },
          'parent' => {},
          'source_info' => {
            'file_name' => '',
            'line_nr' => 11,
            'macro' => ''
          }
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'fn'
                }
              ],
              'extra' => {
                'spaces_after_argument' => '
'
              },
              'parent' => {},
              'type' => 'line_arg'
            }
          ],
          'cmdname' => 'printindex',
          'extra' => {
            'misc_args' => [
              'fn'
            ],
            'spaces_before_argument' => ' '
          },
          'parent' => {},
          'source_info' => {
            'file_name' => '',
            'line_nr' => 12,
            'macro' => ''
          }
        }
      ],
      'extra' => {
        'spaces_before_argument' => ' '
      },
      'parent' => {},
      'source_info' => {
        'file_name' => '',
        'line_nr' => 5,
        'macro' => ''
      }
    }
  ],
  'type' => 'document_root'
};
$result_trees{'subentry_and_sortas'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'subentry_and_sortas'}{'contents'}[0];
$result_trees{'subentry_and_sortas'}{'contents'}[0]{'parent'} = $result_trees{'subentry_and_sortas'};
$result_trees{'subentry_and_sortas'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'subentry_and_sortas'}{'contents'}[1]{'args'}[0];
$result_trees{'subentry_and_sortas'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'subentry_and_sortas'}{'contents'}[1];
$result_trees{'subentry_and_sortas'}{'contents'}[1]{'extra'}{'node_content'}[0] = $result_trees{'subentry_and_sortas'}{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'subentry_and_sortas'}{'contents'}[1]{'extra'}{'nodes_manuals'}[0]{'node_content'}[0] = $result_trees{'subentry_and_sortas'}{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'subentry_and_sortas'}{'contents'}[1]{'parent'} = $result_trees{'subentry_and_sortas'};
$result_trees{'subentry_and_sortas'}{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'subentry_and_sortas'}{'contents'}[2];
$result_trees{'subentry_and_sortas'}{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'subentry_and_sortas'}{'contents'}[2];
$result_trees{'subentry_and_sortas'}{'contents'}[2]{'parent'} = $result_trees{'subentry_and_sortas'};
$result_trees{'subentry_and_sortas'}{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'subentry_and_sortas'}{'contents'}[3]{'args'}[0];
$result_trees{'subentry_and_sortas'}{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'subentry_and_sortas'}{'contents'}[3];
$result_trees{'subentry_and_sortas'}{'contents'}[3]{'extra'}{'node_content'}[0] = $result_trees{'subentry_and_sortas'}{'contents'}[3]{'args'}[0]{'contents'}[0];
$result_trees{'subentry_and_sortas'}{'contents'}[3]{'extra'}{'nodes_manuals'}[0]{'node_content'}[0] = $result_trees{'subentry_and_sortas'}{'contents'}[3]{'args'}[0]{'contents'}[0];
$result_trees{'subentry_and_sortas'}{'contents'}[3]{'parent'} = $result_trees{'subentry_and_sortas'};
$result_trees{'subentry_and_sortas'}{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'subentry_and_sortas'}{'contents'}[4]{'args'}[0];
$result_trees{'subentry_and_sortas'}{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'subentry_and_sortas'}{'contents'}[4];
$result_trees{'subentry_and_sortas'}{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'subentry_and_sortas'}{'contents'}[4];
$result_trees{'subentry_and_sortas'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'subentry_and_sortas'}{'contents'}[4]{'contents'}[1]{'args'}[0];
$result_trees{'subentry_and_sortas'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'subentry_and_sortas'}{'contents'}[4]{'contents'}[1]{'args'}[0];
$result_trees{'subentry_and_sortas'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'subentry_and_sortas'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'subentry_and_sortas'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'subentry_and_sortas'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'contents'}[2];
$result_trees{'subentry_and_sortas'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'subentry_and_sortas'}{'contents'}[4]{'contents'}[1]{'args'}[0];
$result_trees{'subentry_and_sortas'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'subentry_and_sortas'}{'contents'}[4]{'contents'}[1];
$result_trees{'subentry_and_sortas'}{'contents'}[4]{'contents'}[1]{'extra'}{'index_entry'}{'content_normalized'} = $result_trees{'subentry_and_sortas'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'contents'};
$result_trees{'subentry_and_sortas'}{'contents'}[4]{'contents'}[1]{'extra'}{'index_entry'}{'entry_content'} = $result_trees{'subentry_and_sortas'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'contents'};
$result_trees{'subentry_and_sortas'}{'contents'}[4]{'contents'}[1]{'extra'}{'index_entry'}{'entry_element'} = $result_trees{'subentry_and_sortas'}{'contents'}[4]{'contents'}[1];
$result_trees{'subentry_and_sortas'}{'contents'}[4]{'contents'}[1]{'extra'}{'index_entry'}{'entry_node'} = $result_trees{'subentry_and_sortas'}{'contents'}[3];
$result_trees{'subentry_and_sortas'}{'contents'}[4]{'contents'}[1]{'extra'}{'subentry'}{'args'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'subentry_and_sortas'}{'contents'}[4]{'contents'}[1]{'extra'}{'subentry'}{'args'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'subentry_and_sortas'}{'contents'}[4]{'contents'}[1]{'extra'}{'subentry'}{'args'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'subentry_and_sortas'}{'contents'}[4]{'contents'}[1]{'extra'}{'subentry'}{'args'}[0]{'contents'}[0];
$result_trees{'subentry_and_sortas'}{'contents'}[4]{'contents'}[1]{'extra'}{'subentry'}{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'subentry_and_sortas'}{'contents'}[4]{'contents'}[1]{'extra'}{'subentry'}{'args'}[0];
$result_trees{'subentry_and_sortas'}{'contents'}[4]{'contents'}[1]{'extra'}{'subentry'}{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'subentry_and_sortas'}{'contents'}[4]{'contents'}[1]{'extra'}{'subentry'}{'args'}[0];
$result_trees{'subentry_and_sortas'}{'contents'}[4]{'contents'}[1]{'extra'}{'subentry'}{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'subentry_and_sortas'}{'contents'}[4]{'contents'}[1]{'extra'}{'subentry'}{'args'}[0];
$result_trees{'subentry_and_sortas'}{'contents'}[4]{'contents'}[1]{'extra'}{'subentry'}{'args'}[0]{'parent'} = $result_trees{'subentry_and_sortas'}{'contents'}[4]{'contents'}[1]{'extra'}{'subentry'};
$result_trees{'subentry_and_sortas'}{'contents'}[4]{'contents'}[1]{'extra'}{'subentry'}{'parent'} = $result_trees{'subentry_and_sortas'}{'contents'}[4];
$result_trees{'subentry_and_sortas'}{'contents'}[4]{'contents'}[1]{'parent'} = $result_trees{'subentry_and_sortas'}{'contents'}[4];
$result_trees{'subentry_and_sortas'}{'contents'}[4]{'contents'}[2] = $result_trees{'subentry_and_sortas'}{'contents'}[4]{'contents'}[1]{'extra'}{'subentry'};
$result_trees{'subentry_and_sortas'}{'contents'}[4]{'contents'}[3]{'parent'} = $result_trees{'subentry_and_sortas'}{'contents'}[4];
$result_trees{'subentry_and_sortas'}{'contents'}[4]{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'subentry_and_sortas'}{'contents'}[4]{'contents'}[4]{'args'}[0];
$result_trees{'subentry_and_sortas'}{'contents'}[4]{'contents'}[4]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'subentry_and_sortas'}{'contents'}[4]{'contents'}[4]{'args'}[0];
$result_trees{'subentry_and_sortas'}{'contents'}[4]{'contents'}[4]{'args'}[0]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'subentry_and_sortas'}{'contents'}[4]{'contents'}[4]{'args'}[0]{'contents'}[2]{'args'}[0];
$result_trees{'subentry_and_sortas'}{'contents'}[4]{'contents'}[4]{'args'}[0]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'subentry_and_sortas'}{'contents'}[4]{'contents'}[4]{'args'}[0]{'contents'}[2];
$result_trees{'subentry_and_sortas'}{'contents'}[4]{'contents'}[4]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'subentry_and_sortas'}{'contents'}[4]{'contents'}[4]{'args'}[0];
$result_trees{'subentry_and_sortas'}{'contents'}[4]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'subentry_and_sortas'}{'contents'}[4]{'contents'}[4];
$result_trees{'subentry_and_sortas'}{'contents'}[4]{'contents'}[4]{'extra'}{'index_entry'}{'content_normalized'} = $result_trees{'subentry_and_sortas'}{'contents'}[4]{'contents'}[4]{'args'}[0]{'contents'};
$result_trees{'subentry_and_sortas'}{'contents'}[4]{'contents'}[4]{'extra'}{'index_entry'}{'entry_content'} = $result_trees{'subentry_and_sortas'}{'contents'}[4]{'contents'}[4]{'args'}[0]{'contents'};
$result_trees{'subentry_and_sortas'}{'contents'}[4]{'contents'}[4]{'extra'}{'index_entry'}{'entry_element'} = $result_trees{'subentry_and_sortas'}{'contents'}[4]{'contents'}[4];
$result_trees{'subentry_and_sortas'}{'contents'}[4]{'contents'}[4]{'extra'}{'index_entry'}{'entry_node'} = $result_trees{'subentry_and_sortas'}{'contents'}[3];
$result_trees{'subentry_and_sortas'}{'contents'}[4]{'contents'}[4]{'extra'}{'subentry'}{'args'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'subentry_and_sortas'}{'contents'}[4]{'contents'}[4]{'extra'}{'subentry'}{'args'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'subentry_and_sortas'}{'contents'}[4]{'contents'}[4]{'extra'}{'subentry'}{'args'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'subentry_and_sortas'}{'contents'}[4]{'contents'}[4]{'extra'}{'subentry'}{'args'}[0]{'contents'}[0];
$result_trees{'subentry_and_sortas'}{'contents'}[4]{'contents'}[4]{'extra'}{'subentry'}{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'subentry_and_sortas'}{'contents'}[4]{'contents'}[4]{'extra'}{'subentry'}{'args'}[0];
$result_trees{'subentry_and_sortas'}{'contents'}[4]{'contents'}[4]{'extra'}{'subentry'}{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'subentry_and_sortas'}{'contents'}[4]{'contents'}[4]{'extra'}{'subentry'}{'args'}[0];
$result_trees{'subentry_and_sortas'}{'contents'}[4]{'contents'}[4]{'extra'}{'subentry'}{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'subentry_and_sortas'}{'contents'}[4]{'contents'}[4]{'extra'}{'subentry'}{'args'}[0];
$result_trees{'subentry_and_sortas'}{'contents'}[4]{'contents'}[4]{'extra'}{'subentry'}{'args'}[0]{'parent'} = $result_trees{'subentry_and_sortas'}{'contents'}[4]{'contents'}[4]{'extra'}{'subentry'};
$result_trees{'subentry_and_sortas'}{'contents'}[4]{'contents'}[4]{'extra'}{'subentry'}{'parent'} = $result_trees{'subentry_and_sortas'}{'contents'}[4];
$result_trees{'subentry_and_sortas'}{'contents'}[4]{'contents'}[4]{'parent'} = $result_trees{'subentry_and_sortas'}{'contents'}[4];
$result_trees{'subentry_and_sortas'}{'contents'}[4]{'contents'}[5] = $result_trees{'subentry_and_sortas'}{'contents'}[4]{'contents'}[4]{'extra'}{'subentry'};
$result_trees{'subentry_and_sortas'}{'contents'}[4]{'contents'}[6]{'parent'} = $result_trees{'subentry_and_sortas'}{'contents'}[4];
$result_trees{'subentry_and_sortas'}{'contents'}[4]{'contents'}[7]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'subentry_and_sortas'}{'contents'}[4]{'contents'}[7]{'args'}[0];
$result_trees{'subentry_and_sortas'}{'contents'}[4]{'contents'}[7]{'args'}[0]{'parent'} = $result_trees{'subentry_and_sortas'}{'contents'}[4]{'contents'}[7];
$result_trees{'subentry_and_sortas'}{'contents'}[4]{'contents'}[7]{'parent'} = $result_trees{'subentry_and_sortas'}{'contents'}[4];
$result_trees{'subentry_and_sortas'}{'contents'}[4]{'contents'}[8]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'subentry_and_sortas'}{'contents'}[4]{'contents'}[8]{'args'}[0];
$result_trees{'subentry_and_sortas'}{'contents'}[4]{'contents'}[8]{'args'}[0]{'parent'} = $result_trees{'subentry_and_sortas'}{'contents'}[4]{'contents'}[8];
$result_trees{'subentry_and_sortas'}{'contents'}[4]{'contents'}[8]{'parent'} = $result_trees{'subentry_and_sortas'}{'contents'}[4];
$result_trees{'subentry_and_sortas'}{'contents'}[4]{'parent'} = $result_trees{'subentry_and_sortas'};

$result_texis{'subentry_and_sortas'} = '@node Top
@top

@node chapter index
@chapter Index

@cindex aaa @sortas{A---S} @subentry @sortas{B---S1} bbb

@findex xxx @sortas{X---S} @subentry @sortas{X---S1} zzz

@printindex cp
@printindex fn
';


$result_texts{'subentry_and_sortas'} = '
1 Index
*******



';

$result_sectioning{'subentry_and_sortas'} = {
  'structure' => {
    'section_childs' => [
      {
        'cmdname' => 'top',
        'extra' => {
          'associated_node' => {
            'cmdname' => 'node',
            'extra' => {
              'normalized' => 'Top'
            },
            'structure' => {}
          }
        },
        'structure' => {
          'section_childs' => [
            {
              'cmdname' => 'chapter',
              'extra' => {
                'associated_node' => {
                  'cmdname' => 'node',
                  'extra' => {
                    'isindex' => 1,
                    'normalized' => 'chapter-index'
                  },
                  'structure' => {}
                }
              },
              'structure' => {
                'section_level' => 1,
                'section_number' => 1,
                'section_up' => {},
                'toplevel_prev' => {},
                'toplevel_up' => {}
              }
            }
          ],
          'section_level' => 0,
          'section_up' => {}
        }
      }
    ],
    'section_level' => -1
  }
};
$result_sectioning{'subentry_and_sortas'}{'structure'}{'section_childs'}[0]{'structure'}{'section_childs'}[0]{'structure'}{'section_up'} = $result_sectioning{'subentry_and_sortas'}{'structure'}{'section_childs'}[0];
$result_sectioning{'subentry_and_sortas'}{'structure'}{'section_childs'}[0]{'structure'}{'section_childs'}[0]{'structure'}{'toplevel_prev'} = $result_sectioning{'subentry_and_sortas'}{'structure'}{'section_childs'}[0];
$result_sectioning{'subentry_and_sortas'}{'structure'}{'section_childs'}[0]{'structure'}{'section_childs'}[0]{'structure'}{'toplevel_up'} = $result_sectioning{'subentry_and_sortas'}{'structure'}{'section_childs'}[0];
$result_sectioning{'subentry_and_sortas'}{'structure'}{'section_childs'}[0]{'structure'}{'section_up'} = $result_sectioning{'subentry_and_sortas'};

$result_nodes{'subentry_and_sortas'} = {
  'cmdname' => 'node',
  'extra' => {
    'associated_section' => {
      'cmdname' => 'top',
      'extra' => {},
      'structure' => {}
    },
    'normalized' => 'Top'
  },
  'structure' => {
    'node_next' => {
      'cmdname' => 'node',
      'extra' => {
        'associated_section' => {
          'cmdname' => 'chapter',
          'extra' => {},
          'structure' => {
            'section_number' => 1
          }
        },
        'isindex' => 1,
        'normalized' => 'chapter-index'
      },
      'structure' => {
        'node_prev' => {},
        'node_up' => {}
      }
    }
  }
};
$result_nodes{'subentry_and_sortas'}{'structure'}{'node_next'}{'structure'}{'node_prev'} = $result_nodes{'subentry_and_sortas'};
$result_nodes{'subentry_and_sortas'}{'structure'}{'node_next'}{'structure'}{'node_up'} = $result_nodes{'subentry_and_sortas'};

$result_menus{'subentry_and_sortas'} = {
  'cmdname' => 'node',
  'extra' => {
    'normalized' => 'Top'
  },
  'structure' => {}
};

$result_errors{'subentry_and_sortas'} = [];


$result_floats{'subentry_and_sortas'} = {};


$result_indices_sort_strings{'subentry_and_sortas'} = {
  'cp' => [
    'A---S'
  ],
  'fn' => [
    'X---S'
  ]
};



$result_converted{'docbook'}->{'subentry_and_sortas'} = '<chapter label="1" id="chapter-index">
<title>Index</title>

<indexterm role="cp"><primary>aaa</primary><secondary>bbb</secondary></indexterm>
<indexterm role="fn"><primary>xxx</primary><secondary>zzz</secondary></indexterm>
<index role="cp"></index>
<index role="fn"></index>
</chapter>
';


$result_converted{'info'}->{'subentry_and_sortas'} = 'This is , produced from .


File: ,  Node: Top,  Next: chapter index,  Up: (dir)

* Menu:

* chapter index::


File: ,  Node: chapter index,  Prev: Top,  Up: Top

1 Index
*******

 [index ]
* Menu:

* aaa, bbb:                              chapter index.         (line 6)

 [index ]
* Menu:

* xxx, zzz:                              chapter index.         (line 6)



Tag Table:
Node: Top27
Node: chapter index111

End Tag Table


Local Variables:
coding: utf-8
End:
';


$result_converted{'plaintext'}->{'subentry_and_sortas'} = '1 Index
*******

* Menu:

* aaa, bbb:                              chapter index.         (line 3)

* Menu:

* xxx, zzz:                              chapter index.         (line 3)

';


$result_converted{'html_text'}->{'subentry_and_sortas'} = '<div class="top-level-extent" id="Top">
<div class="nav-panel">
<p>
 &nbsp; [<a href="#chapter-index" title="Index" rel="index">Index</a>]</p>
</div>
<a class="top" id="SEC_Top"></a>
<ul class="mini-toc">
<li><a href="#chapter-index" accesskey="1">Index</a></li>
</ul>
<hr>
<div class="chapter-level-extent" id="chapter-index">
<div class="nav-panel">
<p>
 &nbsp; [<a href="#chapter-index" title="Index" rel="index">Index</a>]</p>
</div>
<h2 class="chapter" id="Index">1 Index</h2>

<a class="index-entry-id" id="index-aaa"></a>

<a class="index-entry-id" id="index-xxx"></a>

<div class="printindex cp-printindex">
<table class="cp-entries-printindex" border="0">
<tr><td></td><th class="entries-header-printindex">Index Entry</th><td>&nbsp;</td><th class="sections-header-printindex"> Section</th></tr>
<tr><td colspan="4"> <hr></td></tr>
<tr><th id="t_i_cp_letter-A">A</th><td></td><td></td></tr>
<tr><td></td><td class="printindex-index-entry"><a href="#index-aaa">aaa, bbb</a>:</td><td>&nbsp;</td><td class="printindex-index-section"><a href="#chapter-index">chapter index</a></td></tr>
<tr><td colspan="4"> <hr></td></tr>
</table>
</div>
<div class="printindex fn-printindex">
<table class="fn-entries-printindex" border="0">
<tr><td></td><th class="entries-header-printindex">Index Entry</th><td>&nbsp;</td><th class="sections-header-printindex"> Section</th></tr>
<tr><td colspan="4"> <hr></td></tr>
<tr><th id="t_i_fn_letter-X">X</th><td></td><td></td></tr>
<tr><td></td><td class="printindex-index-entry"><a href="#index-xxx"><code>xxx, zzz</code></a>:</td><td>&nbsp;</td><td class="printindex-index-section"><a href="#chapter-index">chapter index</a></td></tr>
<tr><td colspan="4"> <hr></td></tr>
</table>
</div>
</div>
</div>
';


$result_converted{'xml'}->{'subentry_and_sortas'} = '<node name="Top" spaces=" "><nodename>Top</nodename><nodenext automatic="on">chapter index</nodenext></node>
<top><sectiontitle></sectiontitle>

</top>
<node name="chapter-index" spaces=" "><nodename>chapter index</nodename><nodeprev automatic="on">Top</nodeprev><nodeup automatic="on">Top</nodeup></node>
<chapter spaces=" "><sectiontitle>Index</sectiontitle>

<cindex index="cp" spaces=" "><indexterm index="cp" number="1">aaa <sortas>A&textmdash;S</sortas></indexterm></cindex> <subentry spaces=" "><sortas>B&textmdash;S1</sortas> bbb</subentry>

<findex index="fn" spaces=" "><indexterm index="fn" number="1">xxx <sortas>X---S</sortas></indexterm></findex> <subentry spaces=" "><sortas>X&textmdash;S1</sortas> zzz</subentry>

<printindex spaces=" " value="cp" line="cp"></printindex>
<printindex spaces=" " value="fn" line="fn"></printindex>
</chapter>
';


$result_converted{'latex'}->{'subentry_and_sortas'} = '\\documentclass{book}
\\usepackage{imakeidx}
\\usepackage{amsfonts}
\\usepackage{amsmath}
\\usepackage[gen]{eurosym}
\\usepackage[T1]{fontenc}
\\usepackage{textcomp}
\\usepackage{graphicx}
\\usepackage{etoolbox}
\\usepackage{titleps}
\\usepackage{float}
% use hidelinks to remove boxes around links to be similar to Texinfo TeX
\\usepackage[hidelinks]{hyperref}
\\usepackage[utf8]{inputenc}

\\makeatletter
\\newcommand{\\Texinfosettitle}{No Title}%

% no index headers or page break
\\indexsetup{level=\\relax,toclevel=section,noclearpage}%
\\makeindex[name=cp,title=]%
\\makeindex[name=fn,title=]%

% redefine the \\mainmatter command such that it does not clear page
% as if in double page
\\renewcommand\\mainmatter{\\clearpage\\@mainmattertrue\\pagenumbering{arabic}}
\\newenvironment{Texinfopreformatted}{%
  \\par\\GNUTobeylines\\obeyspaces\\frenchspacing\\parskip=\\z@\\parindent=\\z@}{}
{\\catcode`\\^^M=13 \\gdef\\GNUTobeylines{\\catcode`\\^^M=13 \\def^^M{\\null\\par}}}
\\newenvironment{Texinfoindented}{\\begin{list}{}{}\\item\\relax}{\\end{list}}

% used for substitutions in commands
\\newcommand{\\Texinfoplaceholder}[1]{}

\\newpagestyle{single}{\\sethead[\\chaptername{} \\thechapter{} \\chaptertitle{}][][\\thepage]
                              {\\chaptername{} \\thechapter{} \\chaptertitle{}}{}{\\thepage}}

% allow line breaking at underscore
\\let\\Texinfounderscore\\_
\\renewcommand{\\_}{\\Texinfounderscore\\discretionary{}{}{}}
\\renewcommand{\\includegraphics}[1]{\\fbox{FIG \\detokenize{#1}}}

\\makeatother
% set default for @setchapternewpage
\\makeatletter
\\patchcmd{\\chapter}{\\if@openright\\cleardoublepage\\else\\clearpage\\fi}{\\Texinfoplaceholder{setchapternewpage placeholder}\\clearpage}{}{}
\\makeatother
\\pagestyle{single}%

\\begin{document}
\\label{anchor:Top}%
\\chapter{{Index}}
\\label{anchor:chapter-index}%

\\index[cp]{A---S@aaa!B---S1@bbb}%

\\index[fn]{X---S@\\texttt{xxx}!X---S1@\\texttt{zzz}}%

\\printindex[cp]
\\printindex[fn]
\\end{document}
';

1;
