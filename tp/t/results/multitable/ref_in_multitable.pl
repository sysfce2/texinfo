use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'ref_in_multitable'} = {
  'contents' => [
    {
      'contents' => [
        {
          'args' => [
            {
              'parent' => {},
              'text' => '
',
              'type' => 'misc_arg'
            }
          ],
          'cmdname' => 'novalidate',
          'parent' => {},
          'source_info' => {
            'file_name' => '',
            'line_nr' => 1,
            'macro' => ''
          }
        },
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'contents' => [
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XX XXX XXX XXX XXX 
'
                    },
                    {
                      'parent' => {},
                      'text' => 'XXX XXX XXX XXX XXX XXX XXX XXX XX'
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                }
              ],
              'cmdname' => 'ref',
              'extra' => {
                'node_argument' => {
                  'node_content' => [
                    {},
                    {}
                  ],
                  'normalized' => 'XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XX'
                }
              },
              'parent' => {},
              'source_info' => {
                'file_name' => '',
                'line_nr' => 3,
                'macro' => ''
              }
            },
            {
              'parent' => {},
              'text' => '.
'
            }
          ],
          'parent' => {},
          'type' => 'paragraph'
        },
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
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => '.35 .65'
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
                  'cmdname' => 'columnfractions',
                  'extra' => {
                    'misc_args' => [
                      '.35',
                      '.65'
                    ],
                    'spaces_before_argument' => ' '
                  },
                  'parent' => {},
                  'source_info' => {
                    'file_name' => '',
                    'line_nr' => 6,
                    'macro' => ''
                  }
                }
              ],
              'parent' => {},
              'type' => 'block_line_arg'
            }
          ],
          'cmdname' => 'multitable',
          'contents' => [
            {
              'contents' => [
                {
                  'contents' => [
                    {
                      'cmdname' => 'item',
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => ' ',
                          'type' => 'ignorable_spaces_after_command'
                        },
                        {
                          'contents' => [
                            {
                              'parent' => {},
                              'text' => 'XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XX
'
                            }
                          ],
                          'parent' => {},
                          'type' => 'paragraph'
                        }
                      ],
                      'extra' => {
                        'cell_number' => 1
                      },
                      'parent' => {},
                      'source_info' => {
                        'file_name' => '',
                        'line_nr' => 7,
                        'macro' => ''
                      }
                    },
                    {
                      'cmdname' => 'tab',
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => ' ',
                          'type' => 'ignorable_spaces_after_command'
                        },
                        {
                          'contents' => [
                            {
                              'parent' => {},
                              'text' => 'See '
                            },
                            {
                              'args' => [
                                {
                                  'contents' => [
                                    {
                                      'parent' => {},
                                      'text' => 'RRR RRR RRR RRR RRR RRR RRR RRR RRR RRRR'
                                    }
                                  ],
                                  'parent' => {},
                                  'type' => 'brace_command_arg'
                                }
                              ],
                              'cmdname' => 'ref',
                              'extra' => {
                                'node_argument' => {
                                  'node_content' => [
                                    {}
                                  ],
                                  'normalized' => 'RRR-RRR-RRR-RRR-RRR-RRR-RRR-RRR-RRR-RRRR'
                                }
                              },
                              'parent' => {},
                              'source_info' => {
                                'file_name' => '',
                                'line_nr' => 8,
                                'macro' => ''
                              }
                            },
                            {
                              'parent' => {},
                              'text' => '.
'
                            }
                          ],
                          'parent' => {},
                          'type' => 'paragraph'
                        }
                      ],
                      'extra' => {
                        'cell_number' => 2
                      },
                      'parent' => {},
                      'source_info' => {
                        'file_name' => '',
                        'line_nr' => 8,
                        'macro' => ''
                      }
                    }
                  ],
                  'extra' => {
                    'row_number' => 1
                  },
                  'parent' => {},
                  'type' => 'row'
                },
                {
                  'contents' => [
                    {
                      'cmdname' => 'item',
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => ' ',
                          'type' => 'ignorable_spaces_after_command'
                        },
                        {
                          'contents' => [
                            {
                              'parent' => {},
                              'text' => 'XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XX
'
                            }
                          ],
                          'parent' => {},
                          'type' => 'paragraph'
                        }
                      ],
                      'extra' => {
                        'cell_number' => 1
                      },
                      'parent' => {},
                      'source_info' => {
                        'file_name' => '',
                        'line_nr' => 9,
                        'macro' => ''
                      }
                    },
                    {
                      'cmdname' => 'tab',
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => ' ',
                          'type' => 'ignorable_spaces_after_command'
                        },
                        {
                          'contents' => [
                            {
                              'parent' => {},
                              'text' => 'See '
                            },
                            {
                              'args' => [
                                {
                                  'contents' => [
                                    {
                                      'parent' => {},
                                      'text' => 'SSS SSS SSS SSS SSS SSS SSS SSS SSS SSS SSS SSS SSSSS'
                                    }
                                  ],
                                  'parent' => {},
                                  'type' => 'brace_command_arg'
                                }
                              ],
                              'cmdname' => 'ref',
                              'extra' => {
                                'node_argument' => {
                                  'node_content' => [
                                    {}
                                  ],
                                  'normalized' => 'SSS-SSS-SSS-SSS-SSS-SSS-SSS-SSS-SSS-SSS-SSS-SSS-SSSSS'
                                }
                              },
                              'parent' => {},
                              'source_info' => {
                                'file_name' => '',
                                'line_nr' => 10,
                                'macro' => ''
                              }
                            },
                            {
                              'parent' => {},
                              'text' => '.
'
                            }
                          ],
                          'parent' => {},
                          'type' => 'paragraph'
                        }
                      ],
                      'extra' => {
                        'cell_number' => 2
                      },
                      'parent' => {},
                      'source_info' => {
                        'file_name' => '',
                        'line_nr' => 10,
                        'macro' => ''
                      }
                    }
                  ],
                  'extra' => {
                    'row_number' => 2
                  },
                  'parent' => {},
                  'type' => 'row'
                },
                {
                  'contents' => [
                    {
                      'cmdname' => 'item',
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => ' ',
                          'type' => 'ignorable_spaces_after_command'
                        },
                        {
                          'contents' => [
                            {
                              'parent' => {},
                              'text' => 'adsf'
                            },
                            {
                              'args' => [
                                {
                                  'contents' => [
                                    {
                                      'contents' => [
                                        {
                                          'args' => [
                                            {
                                              'contents' => [
                                                {
                                                  'parent' => {},
                                                  'text' => 'XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XX 
'
                                                },
                                                {
                                                  'parent' => {},
                                                  'text' => 'XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XX'
                                                }
                                              ],
                                              'parent' => {},
                                              'type' => 'brace_command_arg'
                                            }
                                          ],
                                          'cmdname' => 'ref',
                                          'extra' => {
                                            'node_argument' => {
                                              'node_content' => [
                                                {},
                                                {}
                                              ],
                                              'normalized' => 'XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XX'
                                            }
                                          },
                                          'parent' => {},
                                          'source_info' => {
                                            'file_name' => '',
                                            'line_nr' => 11,
                                            'macro' => ''
                                          }
                                        }
                                      ],
                                      'parent' => {},
                                      'type' => 'paragraph'
                                    }
                                  ],
                                  'parent' => {},
                                  'type' => 'brace_command_context'
                                }
                              ],
                              'cmdname' => 'footnote',
                              'parent' => {},
                              'source_info' => {
                                'file_name' => '',
                                'line_nr' => 11,
                                'macro' => ''
                              }
                            },
                            {
                              'parent' => {},
                              'text' => ' '
                            }
                          ],
                          'parent' => {},
                          'type' => 'paragraph'
                        }
                      ],
                      'extra' => {
                        'cell_number' => 1
                      },
                      'parent' => {},
                      'source_info' => {
                        'file_name' => '',
                        'line_nr' => 11,
                        'macro' => ''
                      }
                    },
                    {
                      'cmdname' => 'tab',
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => ' 
',
                          'type' => 'ignorable_spaces_after_command'
                        },
                        {
                          'contents' => [
                            {
                              'parent' => {},
                              'text' => 'second column
'
                            }
                          ],
                          'parent' => {},
                          'type' => 'paragraph'
                        }
                      ],
                      'extra' => {
                        'cell_number' => 2
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
                    'row_number' => 3
                  },
                  'parent' => {},
                  'type' => 'row'
                }
              ],
              'parent' => {},
              'type' => 'multitable_body'
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'multitable'
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
              'cmdname' => 'end',
              'extra' => {
                'spaces_before_argument' => ' ',
                'text_arg' => 'multitable'
              },
              'parent' => {},
              'source_info' => {
                'file_name' => '',
                'line_nr' => 14,
                'macro' => ''
              }
            }
          ],
          'extra' => {
            'columnfractions' => {},
            'max_columns' => 2,
            'spaces_before_argument' => ' '
          },
          'parent' => {},
          'source_info' => {
            'file_name' => '',
            'line_nr' => 6,
            'macro' => ''
          }
        },
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'contents' => [
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XX XXX XXX XXX XXX 
'
                    },
                    {
                      'parent' => {},
                      'text' => 'XXX XXX XXX XXX XXX XXX XXX XXX XX'
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                }
              ],
              'cmdname' => 'ref',
              'extra' => {
                'node_argument' => {
                  'node_content' => [
                    {},
                    {}
                  ],
                  'normalized' => 'XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XX'
                }
              },
              'parent' => {},
              'source_info' => {
                'file_name' => '',
                'line_nr' => 16,
                'macro' => ''
              }
            },
            {
              'parent' => {},
              'text' => '.
'
            }
          ],
          'parent' => {},
          'type' => 'paragraph'
        }
      ],
      'parent' => {},
      'type' => 'before_node_section'
    }
  ],
  'type' => 'document_root'
};
$result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[0];
$result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'ref_in_multitable'}{'contents'}[0];
$result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'ref_in_multitable'}{'contents'}[0];
$result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[2]{'contents'}[0]{'args'}[0];
$result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[2]{'contents'}[0]{'args'}[0];
$result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[2]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[2]{'contents'}[0];
$result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[2]{'contents'}[0]{'extra'}{'node_argument'}{'node_content'}[0] = $result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[0];
$result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[2]{'contents'}[0]{'extra'}{'node_argument'}{'node_content'}[1] = $result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[2];
$result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[2];
$result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'ref_in_multitable'}{'contents'}[0];
$result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[3]{'parent'} = $result_trees{'ref_in_multitable'}{'contents'}[0];
$result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[4]{'args'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[4]{'args'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[4]{'args'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[4]{'args'}[0]{'contents'}[0];
$result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[4]{'args'}[0];
$result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[4];
$result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[4]{'contents'}[0]{'contents'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[4]{'contents'}[0]{'contents'}[0]{'contents'}[0];
$result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[4]{'contents'}[0]{'contents'}[0]{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[4]{'contents'}[0]{'contents'}[0]{'contents'}[0]{'contents'}[1];
$result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[4]{'contents'}[0]{'contents'}[0]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[4]{'contents'}[0]{'contents'}[0]{'contents'}[0];
$result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[4]{'contents'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[4]{'contents'}[0]{'contents'}[0];
$result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[4]{'contents'}[0]{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[4]{'contents'}[0]{'contents'}[0]{'contents'}[1];
$result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[4]{'contents'}[0]{'contents'}[0]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[4]{'contents'}[0]{'contents'}[0]{'contents'}[1]{'contents'}[1];
$result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[4]{'contents'}[0]{'contents'}[0]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[4]{'contents'}[0]{'contents'}[0]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[4]{'contents'}[0]{'contents'}[0]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[4]{'contents'}[0]{'contents'}[0]{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[4]{'contents'}[0]{'contents'}[0]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'extra'}{'node_argument'}{'node_content'}[0] = $result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[4]{'contents'}[0]{'contents'}[0]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[4]{'contents'}[0]{'contents'}[0]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[4]{'contents'}[0]{'contents'}[0]{'contents'}[1]{'contents'}[1];
$result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[4]{'contents'}[0]{'contents'}[0]{'contents'}[1]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[4]{'contents'}[0]{'contents'}[0]{'contents'}[1]{'contents'}[1];
$result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[4]{'contents'}[0]{'contents'}[0]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[4]{'contents'}[0]{'contents'}[0]{'contents'}[1];
$result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[4]{'contents'}[0]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[4]{'contents'}[0]{'contents'}[0];
$result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[4]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[4]{'contents'}[0];
$result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[4]{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[4]{'contents'}[0]{'contents'}[1]{'contents'}[0];
$result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[4]{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[4]{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[1];
$result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[4]{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[4]{'contents'}[0]{'contents'}[1]{'contents'}[0];
$result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[4]{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[4]{'contents'}[0]{'contents'}[1];
$result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[4]{'contents'}[0]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[4]{'contents'}[0]{'contents'}[1]{'contents'}[1];
$result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[4]{'contents'}[0]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[4]{'contents'}[0]{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[4]{'contents'}[0]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[4]{'contents'}[0]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[4]{'contents'}[0]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[4]{'contents'}[0]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[4]{'contents'}[0]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'extra'}{'node_argument'}{'node_content'}[0] = $result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[4]{'contents'}[0]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[4]{'contents'}[0]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[4]{'contents'}[0]{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[4]{'contents'}[0]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[4]{'contents'}[0]{'contents'}[1]{'contents'}[1]{'contents'}[1];
$result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[4]{'contents'}[0]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[4]{'contents'}[0]{'contents'}[1]{'contents'}[1];
$result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[4]{'contents'}[0]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[4]{'contents'}[0]{'contents'}[1];
$result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[4]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[4]{'contents'}[0];
$result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[4]{'contents'}[0]{'contents'}[2]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[4]{'contents'}[0]{'contents'}[2]{'contents'}[0];
$result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[4]{'contents'}[0]{'contents'}[2]{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[4]{'contents'}[0]{'contents'}[2]{'contents'}[0]{'contents'}[1];
$result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[4]{'contents'}[0]{'contents'}[2]{'contents'}[0]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[4]{'contents'}[0]{'contents'}[2]{'contents'}[0]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[4]{'contents'}[0]{'contents'}[2]{'contents'}[0]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[4]{'contents'}[0]{'contents'}[2]{'contents'}[0]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[4]{'contents'}[0]{'contents'}[2]{'contents'}[0]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[4]{'contents'}[0]{'contents'}[2]{'contents'}[0]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[0];
$result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[4]{'contents'}[0]{'contents'}[2]{'contents'}[0]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[0]{'extra'}{'node_argument'}{'node_content'}[0] = $result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[4]{'contents'}[0]{'contents'}[2]{'contents'}[0]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0];
$result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[4]{'contents'}[0]{'contents'}[2]{'contents'}[0]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[0]{'extra'}{'node_argument'}{'node_content'}[1] = $result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[4]{'contents'}[0]{'contents'}[2]{'contents'}[0]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[4]{'contents'}[0]{'contents'}[2]{'contents'}[0]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[4]{'contents'}[0]{'contents'}[2]{'contents'}[0]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[4]{'contents'}[0]{'contents'}[2]{'contents'}[0]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[4]{'contents'}[0]{'contents'}[2]{'contents'}[0]{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[4]{'contents'}[0]{'contents'}[2]{'contents'}[0]{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[4]{'contents'}[0]{'contents'}[2]{'contents'}[0]{'contents'}[1]{'contents'}[1];
$result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[4]{'contents'}[0]{'contents'}[2]{'contents'}[0]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[4]{'contents'}[0]{'contents'}[2]{'contents'}[0]{'contents'}[1];
$result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[4]{'contents'}[0]{'contents'}[2]{'contents'}[0]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[4]{'contents'}[0]{'contents'}[2]{'contents'}[0]{'contents'}[1];
$result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[4]{'contents'}[0]{'contents'}[2]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[4]{'contents'}[0]{'contents'}[2]{'contents'}[0];
$result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[4]{'contents'}[0]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[4]{'contents'}[0]{'contents'}[2];
$result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[4]{'contents'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[4]{'contents'}[0]{'contents'}[2]{'contents'}[1];
$result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[4]{'contents'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[4]{'contents'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[1];
$result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[4]{'contents'}[0]{'contents'}[2]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[4]{'contents'}[0]{'contents'}[2]{'contents'}[1];
$result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[4]{'contents'}[0]{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[4]{'contents'}[0]{'contents'}[2];
$result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[4]{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[4]{'contents'}[0];
$result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[4];
$result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[4]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[4]{'contents'}[1]{'args'}[0];
$result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[4]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[4]{'contents'}[1];
$result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[4]{'contents'}[1]{'parent'} = $result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[4];
$result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[4]{'extra'}{'columnfractions'} = $result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[4]{'args'}[0]{'contents'}[0];
$result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[4]{'parent'} = $result_trees{'ref_in_multitable'}{'contents'}[0];
$result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[5]{'parent'} = $result_trees{'ref_in_multitable'}{'contents'}[0];
$result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[6]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[6]{'contents'}[0]{'args'}[0];
$result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[6]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[6]{'contents'}[0]{'args'}[0];
$result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[6]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[6]{'contents'}[0];
$result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[6]{'contents'}[0]{'extra'}{'node_argument'}{'node_content'}[0] = $result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[6]{'contents'}[0]{'args'}[0]{'contents'}[0];
$result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[6]{'contents'}[0]{'extra'}{'node_argument'}{'node_content'}[1] = $result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[6]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[6]{'contents'}[0]{'parent'} = $result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[6];
$result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[6]{'contents'}[1]{'parent'} = $result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[6];
$result_trees{'ref_in_multitable'}{'contents'}[0]{'contents'}[6]{'parent'} = $result_trees{'ref_in_multitable'}{'contents'}[0];
$result_trees{'ref_in_multitable'}{'contents'}[0]{'parent'} = $result_trees{'ref_in_multitable'};

$result_texis{'ref_in_multitable'} = '@novalidate

@ref{XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XX XXX XXX XXX XXX 
XXX XXX XXX XXX XXX XXX XXX XXX XX}.

@multitable @columnfractions .35 .65
@item XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XX
@tab See @ref{RRR RRR RRR RRR RRR RRR RRR RRR RRR RRRR}.
@item XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XX
@tab See @ref{SSS SSS SSS SSS SSS SSS SSS SSS SSS SSS SSS SSS SSSSS}.
@item adsf@footnote{@ref{XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XX 
XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XX}} @tab 
second column
@end multitable

@ref{XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XX XXX XXX XXX XXX 
XXX XXX XXX XXX XXX XXX XXX XXX XX}.
';


$result_texts{'ref_in_multitable'} = '
XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XX XXX XXX XXX XXX 
XXX XXX XXX XXX XXX XXX XXX XXX XX.

XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XX
See RRR RRR RRR RRR RRR RRR RRR RRR RRR RRRR.
XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XX
See SSS SSS SSS SSS SSS SSS SSS SSS SSS SSS SSS SSS SSSSS.
adsf second column

XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XX XXX XXX XXX XXX 
XXX XXX XXX XXX XXX XXX XXX XXX XX.
';

$result_errors{'ref_in_multitable'} = [];


$result_floats{'ref_in_multitable'} = {};



$result_converted{'plaintext'}->{'ref_in_multitable'} = '*note XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XX XXX XXX XXX XXX
XXX XXX XXX XXX XXX XXX XXX XXX XX::.

XXX XXX XXX XXX XXX XXX   See
XXX XXX XXX XXX XXX XXX   *note RRR RRR RRR RRR RRR RRR RRR RRR RRR RRRR::.
XX
XXX XXX XXX XXX XXX XXX   See
XXX XXX XXX XXX XXX XXX   *note SSS SSS SSS SSS SSS SSS SSS SSS SSS SSS SSS SSS SSSSS::.
XX
adsf(1)                   second column

   *note XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XX XXX XXX XXX
XXX XXX XXX XXX XXX XXX XXX XXX XXX XX::.

   ---------- Footnotes ----------

   (1) *note XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XX XXX XXX
XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XX::

';


$result_converted{'html_text'}->{'ref_in_multitable'} = '
<p>&lsquo;XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XX XXX XXX XXX XXX 
XXX XXX XXX XXX XXX XXX XXX XXX XX&rsquo;.
</p>
<table class="multitable">
<tbody><tr><td width="35%">XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XX</td><td width="65%">See &lsquo;RRR RRR RRR RRR RRR RRR RRR RRR RRR RRRR&rsquo;.</td></tr>
<tr><td width="35%">XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XX</td><td width="65%">See &lsquo;SSS SSS SSS SSS SSS SSS SSS SSS SSS SSS SSS SSS SSSSS&rsquo;.</td></tr>
<tr><td width="35%">adsf<a class="footnote" id="DOCF1" href="#FOOT1"><sup>1</sup></a></td><td width="65%">second column</td></tr>
</tbody>
</table>

<p>&lsquo;XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XX XXX XXX XXX XXX 
XXX XXX XXX XXX XXX XXX XXX XXX XX&rsquo;.
</p><div class="footnotes-segment">
<hr>
<h4 class="footnotes-heading">Footnotes</h4>

<h5 class="footnote-body-heading"><a id="FOOT1" href="#DOCF1">(1)</a></h5>
<p>&lsquo;XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XX 
XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XX&rsquo;</p>
</div>
';


$result_converted{'xml'}->{'ref_in_multitable'} = '<novalidate></novalidate>

<para><ref label="XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XX"><xrefnodename>XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XX XXX XXX XXX XXX 
XXX XXX XXX XXX XXX XXX XXX XXX XX</xrefnodename></ref>.
</para>
<multitable spaces=" " endspaces=" "><columnfractions line=".35 .65"><columnfraction value=".35"></columnfraction><columnfraction value=".65"></columnfraction></columnfractions>
<tbody><row><entry command="item"> <para>XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XX
</para></entry><entry command="tab"> <para>See <ref label="RRR-RRR-RRR-RRR-RRR-RRR-RRR-RRR-RRR-RRRR"><xrefnodename>RRR RRR RRR RRR RRR RRR RRR RRR RRR RRRR</xrefnodename></ref>.
</para></entry></row><row><entry command="item"> <para>XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XX
</para></entry><entry command="tab"> <para>See <ref label="SSS-SSS-SSS-SSS-SSS-SSS-SSS-SSS-SSS-SSS-SSS-SSS-SSSSS"><xrefnodename>SSS SSS SSS SSS SSS SSS SSS SSS SSS SSS SSS SSS SSSSS</xrefnodename></ref>.
</para></entry></row><row><entry command="item"> <para>adsf<footnote><para><ref label="XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XX"><xrefnodename>XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XX 
XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XX</xrefnodename></ref></para></footnote> </para></entry><entry command="tab"> 
<para>second column
</para></entry></row></tbody></multitable>

<para><ref label="XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XXX-XX"><xrefnodename>XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XX XXX XXX XXX XXX 
XXX XXX XXX XXX XXX XXX XXX XXX XX</xrefnodename></ref>.
</para>';

1;
