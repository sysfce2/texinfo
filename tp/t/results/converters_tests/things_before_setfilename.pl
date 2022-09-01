use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'things_before_setfilename'} = {
  'contents' => [
    {
      'contents' => [
        {
          'contents' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => '\\input texinfo
',
                  'type' => 'text_before_beginning'
                },
                {
                  'parent' => {},
                  'text' => '
',
                  'type' => 'text_before_beginning'
                }
              ],
              'parent' => {},
              'type' => 'preamble_before_beginning'
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'An anchor'
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                }
              ],
              'cmdname' => 'anchor',
              'contents' => [],
              'extra' => {
                'node_content' => [
                  {}
                ],
                'normalized' => 'An-anchor'
              },
              'parent' => {},
              'source_info' => {
                'file_name' => 'things_before_setfilename.texi',
                'line_nr' => 3,
                'macro' => ''
              }
            },
            {
              'parent' => {},
              'text' => '
',
              'type' => 'empty_spaces_after_close_brace'
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
                  'parent' => {},
                  'text' => 'Ref to the anchor:
'
                },
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'An anchor'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'ref',
                  'contents' => [],
                  'extra' => {
                    'label' => {},
                    'node_argument' => {
                      'node_content' => [
                        {}
                      ],
                      'normalized' => 'An-anchor'
                    }
                  },
                  'parent' => {},
                  'source_info' => {
                    'file_name' => 'things_before_setfilename.texi',
                    'line_nr' => 6,
                    'macro' => ''
                  }
                },
                {
                  'parent' => {},
                  'text' => '
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
              'contents' => [
                {
                  'parent' => {},
                  'text' => 'Ref to the anchor in footnote:
'
                },
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'Anchor in footnote'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'ref',
                  'contents' => [],
                  'extra' => {
                    'label' => {
                      'args' => [
                        {
                          'contents' => [
                            {
                              'parent' => {},
                              'text' => 'Anchor in footnote'
                            }
                          ],
                          'parent' => {},
                          'type' => 'brace_command_arg'
                        }
                      ],
                      'cmdname' => 'anchor',
                      'contents' => [],
                      'extra' => {
                        'node_content' => [
                          {}
                        ],
                        'normalized' => 'Anchor-in-footnote'
                      },
                      'parent' => {
                        'contents' => [
                          {
                            'contents' => [
                              {
                                'parent' => {},
                                'text' => 'In footnote.
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
                          {},
                          {
                            'parent' => {},
                            'text' => '
',
                            'type' => 'empty_spaces_after_close_brace'
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
                                'parent' => {},
                                'text' => 'Ref to main text anchor
'
                              },
                              {
                                'args' => [
                                  {
                                    'contents' => [
                                      {
                                        'parent' => {},
                                        'text' => 'An anchor'
                                      }
                                    ],
                                    'parent' => {},
                                    'type' => 'brace_command_arg'
                                  }
                                ],
                                'cmdname' => 'ref',
                                'contents' => [],
                                'extra' => {
                                  'label' => {},
                                  'node_argument' => {
                                    'node_content' => [
                                      {}
                                    ],
                                    'normalized' => 'An-anchor'
                                  }
                                },
                                'parent' => {},
                                'source_info' => {
                                  'file_name' => 'things_before_setfilename.texi',
                                  'line_nr' => 16,
                                  'macro' => ''
                                }
                              },
                              {
                                'parent' => {},
                                'text' => '
'
                              }
                            ],
                            'parent' => {},
                            'type' => 'paragraph'
                          }
                        ],
                        'parent' => {
                          'args' => [
                            {}
                          ],
                          'cmdname' => 'footnote',
                          'contents' => [],
                          'parent' => {
                            'contents' => [
                              {},
                              {
                                'parent' => {},
                                'text' => '
'
                              }
                            ],
                            'parent' => {},
                            'type' => 'paragraph'
                          },
                          'source_info' => {
                            'file_name' => 'things_before_setfilename.texi',
                            'line_nr' => 11,
                            'macro' => ''
                          }
                        },
                        'type' => 'brace_command_context'
                      },
                      'source_info' => {
                        'file_name' => 'things_before_setfilename.texi',
                        'line_nr' => 13,
                        'macro' => ''
                      }
                    },
                    'node_argument' => {
                      'node_content' => [
                        {}
                      ],
                      'normalized' => 'Anchor-in-footnote'
                    }
                  },
                  'parent' => {},
                  'source_info' => {
                    'file_name' => 'things_before_setfilename.texi',
                    'line_nr' => 9,
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
                  'contents' => [],
                  'parent' => {},
                  'type' => 'block_line_arg'
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'float anchor'
                    }
                  ],
                  'extra' => {
                    'spaces_after_argument' => '
',
                    'spaces_before_argument' => ' '
                  },
                  'parent' => {},
                  'type' => 'block_line_arg'
                }
              ],
              'cmdname' => 'float',
              'contents' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'In float
'
                    }
                  ],
                  'parent' => {},
                  'type' => 'paragraph'
                },
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'float'
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
                    'command_argument' => 'float',
                    'spaces_before_argument' => ' ',
                    'text_arg' => 'float'
                  },
                  'parent' => {},
                  'source_info' => {
                    'file_name' => 'things_before_setfilename.texi',
                    'line_nr' => 21,
                    'macro' => ''
                  }
                }
              ],
              'extra' => {
                'end_command' => {},
                'node_content' => [
                  {}
                ],
                'normalized' => 'float-anchor',
                'spaces_before_argument' => ' ',
                'type' => {
                  'normalized' => ''
                }
              },
              'parent' => {},
              'source_info' => {
                'file_name' => 'things_before_setfilename.texi',
                'line_nr' => 19,
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
                  'parent' => {},
                  'text' => 'Ref to float
'
                },
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'float anchor'
                        }
                      ],
                      'parent' => {},
                      'type' => 'brace_command_arg'
                    }
                  ],
                  'cmdname' => 'ref',
                  'contents' => [],
                  'extra' => {
                    'label' => {},
                    'node_argument' => {
                      'node_content' => [
                        {}
                      ],
                      'normalized' => 'float-anchor'
                    }
                  },
                  'parent' => {},
                  'source_info' => {
                    'file_name' => 'things_before_setfilename.texi',
                    'line_nr' => 24,
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
                      'parent' => {},
                      'text' => 'Text'
                    }
                  ],
                  'parent' => {},
                  'type' => 'block_line_arg'
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'ta'
                    }
                  ],
                  'extra' => {
                    'spaces_after_argument' => '
',
                    'spaces_before_argument' => ' '
                  },
                  'parent' => {},
                  'type' => 'block_line_arg'
                }
              ],
              'cmdname' => 'float',
              'contents' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'In float
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
                          'contents' => [
                            {
                              'parent' => {},
                              'text' => 'ta caption'
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
                  'cmdname' => 'caption',
                  'contents' => [],
                  'extra' => {
                    'float' => {}
                  },
                  'parent' => {},
                  'source_info' => {
                    'file_name' => 'things_before_setfilename.texi',
                    'line_nr' => 29,
                    'macro' => ''
                  }
                },
                {
                  'parent' => {},
                  'text' => '
'
                },
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'float'
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
                    'command_argument' => 'float',
                    'spaces_before_argument' => ' ',
                    'text_arg' => 'float'
                  },
                  'parent' => {},
                  'source_info' => {
                    'file_name' => 'things_before_setfilename.texi',
                    'line_nr' => 30,
                    'macro' => ''
                  }
                }
              ],
              'extra' => {
                'caption' => {},
                'end_command' => {},
                'node_content' => [
                  {}
                ],
                'normalized' => 'ta',
                'spaces_before_argument' => ' ',
                'type' => {
                  'content' => [
                    {}
                  ],
                  'normalized' => 'Text'
                }
              },
              'parent' => {},
              'source_info' => {
                'file_name' => 'things_before_setfilename.texi',
                'line_nr' => 26,
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
              'args' => [
                {
                  'parent' => {},
                  'text' => '
',
                  'type' => 'misc_arg'
                }
              ],
              'cmdname' => 'contents',
              'parent' => {},
              'source_info' => {
                'file_name' => 'things_before_setfilename.texi',
                'line_nr' => 32,
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
              'args' => [
                {
                  'contents' => [],
                  'extra' => {
                    'spaces_after_argument' => '
'
                  },
                  'parent' => {},
                  'type' => 'block_line_arg'
                }
              ],
              'cmdname' => 'menu',
              'contents' => [
                {
                  'args' => [
                    {
                      'parent' => {},
                      'text' => '* ',
                      'type' => 'menu_entry_leading_text'
                    },
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'An anchor'
                        }
                      ],
                      'parent' => {},
                      'type' => 'menu_entry_node'
                    },
                    {
                      'parent' => {},
                      'text' => '::                ',
                      'type' => 'menu_entry_separator'
                    },
                    {
                      'contents' => [
                        {
                          'contents' => [
                            {
                              'parent' => {},
                              'text' => 'menu entry pointing to the anchor.
'
                            }
                          ],
                          'parent' => {},
                          'type' => 'preformatted'
                        }
                      ],
                      'parent' => {},
                      'type' => 'menu_entry_description'
                    }
                  ],
                  'extra' => {
                    'menu_entry_description' => {},
                    'menu_entry_node' => {
                      'node_content' => [
                        {}
                      ],
                      'normalized' => 'An-anchor'
                    }
                  },
                  'parent' => {},
                  'source_info' => {
                    'file_name' => 'things_before_setfilename.texi',
                    'line_nr' => 35,
                    'macro' => ''
                  },
                  'type' => 'menu_entry'
                },
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'menu'
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
                    'command_argument' => 'menu',
                    'spaces_before_argument' => ' ',
                    'text_arg' => 'menu'
                  },
                  'parent' => {},
                  'source_info' => {
                    'file_name' => 'things_before_setfilename.texi',
                    'line_nr' => 36,
                    'macro' => ''
                  }
                }
              ],
              'extra' => {
                'end_command' => {}
              },
              'parent' => {},
              'source_info' => {
                'file_name' => 'things_before_setfilename.texi',
                'line_nr' => 34,
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
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'index entry'
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
              'cmdname' => 'cindex',
              'extra' => {
                'index_entry' => {
                  'command' => {},
                  'content' => [],
                  'content_normalized' => [],
                  'in_code' => 0,
                  'index_at_command' => 'cindex',
                  'index_ignore_chars' => {},
                  'index_name' => 'cp',
                  'index_type_command' => 'cindex',
                  'number' => 1
                },
                'spaces_before_argument' => ' '
              },
              'parent' => {},
              'source_info' => {
                'file_name' => 'things_before_setfilename.texi',
                'line_nr' => 38,
                'macro' => ''
              },
              'type' => 'index_entry_command'
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
                'file_name' => 'things_before_setfilename.texi',
                'line_nr' => 40,
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
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'Text'
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
              'cmdname' => 'listoffloats',
              'extra' => {
                'spaces_before_argument' => ' ',
                'type' => {
                  'content' => [
                    {}
                  ],
                  'normalized' => 'Text'
                }
              },
              'parent' => {},
              'source_info' => {
                'file_name' => 'things_before_setfilename.texi',
                'line_nr' => 42,
                'macro' => ''
              }
            },
            {
              'parent' => {},
              'text' => '
',
              'type' => 'empty_line'
            }
          ],
          'parent' => {},
          'type' => 'preamble_before_setfilename'
        },
        {
          'contents' => [
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'things_before_setfilename.info'
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
              'cmdname' => 'setfilename',
              'extra' => {
                'spaces_before_argument' => ' ',
                'text_arg' => 'things_before_setfilename.info'
              },
              'parent' => {},
              'source_info' => {
                'file_name' => 'things_before_setfilename.texi',
                'line_nr' => 44,
                'macro' => ''
              }
            },
            {
              'parent' => {},
              'text' => '
',
              'type' => 'empty_line'
            }
          ],
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
      'contents' => [],
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
        'file_name' => 'things_before_setfilename.texi',
        'line_nr' => 46,
        'macro' => ''
      }
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'top section'
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
      'cmdname' => 'top',
      'contents' => [
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line'
        }
      ],
      'extra' => {
        'spaces_before_argument' => ' '
      },
      'parent' => {},
      'source_info' => {
        'file_name' => 'things_before_setfilename.texi',
        'line_nr' => 47,
        'macro' => ''
      }
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'chap'
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
      'contents' => [],
      'extra' => {
        'node_content' => [
          {}
        ],
        'nodes_manuals' => [
          {
            'node_content' => [
              {}
            ],
            'normalized' => 'chap'
          }
        ],
        'normalized' => 'chap',
        'spaces_before_argument' => ' '
      },
      'parent' => {},
      'source_info' => {
        'file_name' => 'things_before_setfilename.texi',
        'line_nr' => 49,
        'macro' => ''
      }
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'Chapter'
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
          'contents' => [
            {
              'parent' => {},
              'text' => 'Ref to anchor
'
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'An anchor'
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                }
              ],
              'cmdname' => 'ref',
              'contents' => [],
              'extra' => {
                'label' => {},
                'node_argument' => {
                  'node_content' => [
                    {}
                  ],
                  'normalized' => 'An-anchor'
                }
              },
              'parent' => {},
              'source_info' => {
                'file_name' => 'things_before_setfilename.texi',
                'line_nr' => 53,
                'macro' => ''
              }
            },
            {
              'parent' => {},
              'text' => '
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
          'contents' => [
            {
              'parent' => {},
              'text' => 'Ref to footnote anchor
'
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'Anchor in footnote'
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                }
              ],
              'cmdname' => 'ref',
              'contents' => [],
              'extra' => {
                'label' => {},
                'node_argument' => {
                  'node_content' => [
                    {}
                  ],
                  'normalized' => 'Anchor-in-footnote'
                }
              },
              'parent' => {},
              'source_info' => {
                'file_name' => 'things_before_setfilename.texi',
                'line_nr' => 56,
                'macro' => ''
              }
            },
            {
              'parent' => {},
              'text' => '
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
        }
      ],
      'extra' => {
        'spaces_before_argument' => ' '
      },
      'parent' => {},
      'source_info' => {
        'file_name' => 'things_before_setfilename.texi',
        'line_nr' => 50,
        'macro' => ''
      }
    }
  ],
  'type' => 'document_root'
};
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[0];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[0];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[1];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[1]{'extra'}{'node_content'}[0] = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[3]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[4];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[4]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[4]{'contents'}[1]{'args'}[0];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[4]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[4]{'contents'}[1];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[4]{'contents'}[1]{'extra'}{'label'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[1];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[4]{'contents'}[1]{'extra'}{'node_argument'}{'node_content'}[0] = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[4]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[4]{'contents'}[1]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[4];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[4]{'contents'}[2]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[4];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[4]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[5]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'contents'}[0]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[6];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'contents'}[1]{'args'}[0];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'contents'}[1];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'contents'}[1]{'extra'}{'label'}{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'contents'}[1]{'extra'}{'label'}{'args'}[0];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'contents'}[1]{'extra'}{'label'}{'args'}[0]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'contents'}[1]{'extra'}{'label'};
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'contents'}[1]{'extra'}{'label'}{'extra'}{'node_content'}[0] = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'contents'}[1]{'extra'}{'label'}{'args'}[0]{'contents'}[0];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'contents'}[1]{'extra'}{'label'}{'parent'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'contents'}[1]{'extra'}{'label'}{'parent'}{'contents'}[0];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'contents'}[1]{'extra'}{'label'}{'parent'}{'contents'}[0]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'contents'}[1]{'extra'}{'label'}{'parent'};
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'contents'}[1]{'extra'}{'label'}{'parent'}{'contents'}[1]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'contents'}[1]{'extra'}{'label'}{'parent'};
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'contents'}[1]{'extra'}{'label'}{'parent'}{'contents'}[2] = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'contents'}[1]{'extra'}{'label'};
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'contents'}[1]{'extra'}{'label'}{'parent'}{'contents'}[3]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'contents'}[1]{'extra'}{'label'}{'parent'};
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'contents'}[1]{'extra'}{'label'}{'parent'}{'contents'}[4]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'contents'}[1]{'extra'}{'label'}{'parent'};
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'contents'}[1]{'extra'}{'label'}{'parent'}{'contents'}[5]{'contents'}[0]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'contents'}[1]{'extra'}{'label'}{'parent'}{'contents'}[5];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'contents'}[1]{'extra'}{'label'}{'parent'}{'contents'}[5]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'contents'}[1]{'extra'}{'label'}{'parent'}{'contents'}[5]{'contents'}[1]{'args'}[0];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'contents'}[1]{'extra'}{'label'}{'parent'}{'contents'}[5]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'contents'}[1]{'extra'}{'label'}{'parent'}{'contents'}[5]{'contents'}[1];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'contents'}[1]{'extra'}{'label'}{'parent'}{'contents'}[5]{'contents'}[1]{'extra'}{'label'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[1];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'contents'}[1]{'extra'}{'label'}{'parent'}{'contents'}[5]{'contents'}[1]{'extra'}{'node_argument'}{'node_content'}[0] = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'contents'}[1]{'extra'}{'label'}{'parent'}{'contents'}[5]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'contents'}[1]{'extra'}{'label'}{'parent'}{'contents'}[5]{'contents'}[1]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'contents'}[1]{'extra'}{'label'}{'parent'}{'contents'}[5];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'contents'}[1]{'extra'}{'label'}{'parent'}{'contents'}[5]{'contents'}[2]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'contents'}[1]{'extra'}{'label'}{'parent'}{'contents'}[5];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'contents'}[1]{'extra'}{'label'}{'parent'}{'contents'}[5]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'contents'}[1]{'extra'}{'label'}{'parent'};
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'contents'}[1]{'extra'}{'label'}{'parent'}{'parent'}{'args'}[0] = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'contents'}[1]{'extra'}{'label'}{'parent'};
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'contents'}[1]{'extra'}{'label'}{'parent'}{'parent'}{'parent'}{'contents'}[0] = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'contents'}[1]{'extra'}{'label'}{'parent'}{'parent'};
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'contents'}[1]{'extra'}{'label'}{'parent'}{'parent'}{'parent'}{'contents'}[1]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'contents'}[1]{'extra'}{'label'}{'parent'}{'parent'}{'parent'};
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'contents'}[1]{'extra'}{'label'}{'parent'}{'parent'}{'parent'}{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'contents'}[1]{'extra'}{'node_argument'}{'node_content'}[0] = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'contents'}[1]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[6];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'contents'}[2]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[6];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[7]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[8] = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'contents'}[1]{'extra'}{'label'}{'parent'}{'parent'}{'parent'};
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[9]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[10]{'args'}[0]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[10];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[10]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[10]{'args'}[1];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[10]{'args'}[1]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[10];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[10]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[10]{'contents'}[0];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[10]{'contents'}[0]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[10];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[10]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[10]{'contents'}[1]{'args'}[0];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[10]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[10]{'contents'}[1];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[10]{'contents'}[1]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[10];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[10]{'extra'}{'end_command'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[10]{'contents'}[1];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[10]{'extra'}{'node_content'}[0] = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[10]{'args'}[1]{'contents'}[0];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[10]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[11]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[12]{'contents'}[0]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[12];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[12]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[12]{'contents'}[1]{'args'}[0];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[12]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[12]{'contents'}[1];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[12]{'contents'}[1]{'extra'}{'label'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[10];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[12]{'contents'}[1]{'extra'}{'node_argument'}{'node_content'}[0] = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[12]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[12]{'contents'}[1]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[12];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[12]{'contents'}[2]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[12];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[12]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[13]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[14]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[14]{'args'}[0];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[14]{'args'}[0]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[14];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[14]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[14]{'args'}[1];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[14]{'args'}[1]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[14];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[14]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[14]{'contents'}[0];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[14]{'contents'}[0]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[14];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[14]{'contents'}[1]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[14];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[14]{'contents'}[2]{'args'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[14]{'contents'}[2]{'args'}[0]{'contents'}[0];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[14]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[14]{'contents'}[2]{'args'}[0];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[14]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[14]{'contents'}[2];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[14]{'contents'}[2]{'extra'}{'float'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[14];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[14]{'contents'}[2]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[14];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[14]{'contents'}[3]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[14];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[14]{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[14]{'contents'}[4]{'args'}[0];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[14]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[14]{'contents'}[4];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[14]{'contents'}[4]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[14];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[14]{'extra'}{'caption'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[14]{'contents'}[2];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[14]{'extra'}{'end_command'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[14]{'contents'}[4];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[14]{'extra'}{'node_content'}[0] = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[14]{'args'}[1]{'contents'}[0];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[14]{'extra'}{'type'}{'content'}[0] = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[14]{'args'}[0]{'contents'}[0];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[14]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[15]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[16]{'args'}[0]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[16];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[16]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[17]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[18]{'args'}[0]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[18];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[18]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[18]{'contents'}[0];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[18]{'contents'}[0]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[18]{'contents'}[0]{'args'}[1];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[18]{'contents'}[0]{'args'}[1]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[18]{'contents'}[0];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[18]{'contents'}[0]{'args'}[2]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[18]{'contents'}[0];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[18]{'contents'}[0]{'args'}[3]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[18]{'contents'}[0]{'args'}[3]{'contents'}[0];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[18]{'contents'}[0]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[18]{'contents'}[0]{'args'}[3];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[18]{'contents'}[0]{'args'}[3]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[18]{'contents'}[0];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[18]{'contents'}[0]{'extra'}{'menu_entry_description'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[18]{'contents'}[0]{'args'}[3];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[18]{'contents'}[0]{'extra'}{'menu_entry_node'}{'node_content'}[0] = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[18]{'contents'}[0]{'args'}[1]{'contents'}[0];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[18]{'contents'}[0]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[18];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[18]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[18]{'contents'}[1]{'args'}[0];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[18]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[18]{'contents'}[1];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[18]{'contents'}[1]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[18];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[18]{'extra'}{'end_command'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[18]{'contents'}[1];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[18]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[19]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[20]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[20]{'args'}[0];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[20]{'args'}[0]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[20];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[20]{'extra'}{'index_entry'}{'command'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[20];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[20]{'extra'}{'index_entry'}{'content'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[20]{'args'}[0]{'contents'};
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[20]{'extra'}{'index_entry'}{'content_normalized'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[20]{'args'}[0]{'contents'};
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[20]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[21]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[22]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[22]{'args'}[0];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[22]{'args'}[0]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[22];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[22]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[23]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[24]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[24]{'args'}[0];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[24]{'args'}[0]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[24];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[24]{'extra'}{'type'}{'content'}[0] = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[24]{'args'}[0]{'contents'}[0];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[24]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[25]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[0];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'args'}[0];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[1]{'contents'}[0];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[1];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[1];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[0];
$result_trees{'things_before_setfilename'}{'contents'}[0]{'parent'} = $result_trees{'things_before_setfilename'};
$result_trees{'things_before_setfilename'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[1]{'args'}[0];
$result_trees{'things_before_setfilename'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[1];
$result_trees{'things_before_setfilename'}{'contents'}[1]{'extra'}{'node_content'}[0] = $result_trees{'things_before_setfilename'}{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'things_before_setfilename'}{'contents'}[1]{'extra'}{'nodes_manuals'}[0]{'node_content'}[0] = $result_trees{'things_before_setfilename'}{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'things_before_setfilename'}{'contents'}[1]{'parent'} = $result_trees{'things_before_setfilename'};
$result_trees{'things_before_setfilename'}{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[2]{'args'}[0];
$result_trees{'things_before_setfilename'}{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[2];
$result_trees{'things_before_setfilename'}{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[2];
$result_trees{'things_before_setfilename'}{'contents'}[2]{'parent'} = $result_trees{'things_before_setfilename'};
$result_trees{'things_before_setfilename'}{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[3]{'args'}[0];
$result_trees{'things_before_setfilename'}{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[3];
$result_trees{'things_before_setfilename'}{'contents'}[3]{'extra'}{'node_content'}[0] = $result_trees{'things_before_setfilename'}{'contents'}[3]{'args'}[0]{'contents'}[0];
$result_trees{'things_before_setfilename'}{'contents'}[3]{'extra'}{'nodes_manuals'}[0]{'node_content'}[0] = $result_trees{'things_before_setfilename'}{'contents'}[3]{'args'}[0]{'contents'}[0];
$result_trees{'things_before_setfilename'}{'contents'}[3]{'parent'} = $result_trees{'things_before_setfilename'};
$result_trees{'things_before_setfilename'}{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[4]{'args'}[0];
$result_trees{'things_before_setfilename'}{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[4];
$result_trees{'things_before_setfilename'}{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[4];
$result_trees{'things_before_setfilename'}{'contents'}[4]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[4]{'contents'}[1];
$result_trees{'things_before_setfilename'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'things_before_setfilename'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[4]{'contents'}[1]{'contents'}[1];
$result_trees{'things_before_setfilename'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'extra'}{'label'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[1];
$result_trees{'things_before_setfilename'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'extra'}{'node_argument'}{'node_content'}[0] = $result_trees{'things_before_setfilename'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'things_before_setfilename'}{'contents'}[4]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[4]{'contents'}[1];
$result_trees{'things_before_setfilename'}{'contents'}[4]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[4]{'contents'}[1];
$result_trees{'things_before_setfilename'}{'contents'}[4]{'contents'}[1]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[4];
$result_trees{'things_before_setfilename'}{'contents'}[4]{'contents'}[2]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[4];
$result_trees{'things_before_setfilename'}{'contents'}[4]{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[4]{'contents'}[3];
$result_trees{'things_before_setfilename'}{'contents'}[4]{'contents'}[3]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[4]{'contents'}[3]{'contents'}[1]{'args'}[0];
$result_trees{'things_before_setfilename'}{'contents'}[4]{'contents'}[3]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[4]{'contents'}[3]{'contents'}[1];
$result_trees{'things_before_setfilename'}{'contents'}[4]{'contents'}[3]{'contents'}[1]{'extra'}{'label'} = $result_trees{'things_before_setfilename'}{'contents'}[0]{'contents'}[0]{'contents'}[6]{'contents'}[1]{'extra'}{'label'};
$result_trees{'things_before_setfilename'}{'contents'}[4]{'contents'}[3]{'contents'}[1]{'extra'}{'node_argument'}{'node_content'}[0] = $result_trees{'things_before_setfilename'}{'contents'}[4]{'contents'}[3]{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'things_before_setfilename'}{'contents'}[4]{'contents'}[3]{'contents'}[1]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[4]{'contents'}[3];
$result_trees{'things_before_setfilename'}{'contents'}[4]{'contents'}[3]{'contents'}[2]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[4]{'contents'}[3];
$result_trees{'things_before_setfilename'}{'contents'}[4]{'contents'}[3]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[4];
$result_trees{'things_before_setfilename'}{'contents'}[4]{'contents'}[4]{'parent'} = $result_trees{'things_before_setfilename'}{'contents'}[4];
$result_trees{'things_before_setfilename'}{'contents'}[4]{'parent'} = $result_trees{'things_before_setfilename'};

$result_texis{'things_before_setfilename'} = '\\input texinfo

@anchor{An anchor}

Ref to the anchor:
@ref{An anchor}

Ref to the anchor in footnote:
@ref{Anchor in footnote}.

@footnote{In footnote.

@anchor{Anchor in footnote}

Ref to main text anchor
@ref{An anchor}
}

@float , float anchor
In float
@end float

Ref to float
@ref{float anchor}.

@float Text, ta
In float

@caption{ta caption}
@end float

@contents

@menu
* An anchor::                menu entry pointing to the anchor.
@end menu

@cindex index entry

@printindex cp

@listoffloats Text

@setfilename things_before_setfilename.info 

@node Top
@top top section

@node chap
@chapter Chapter

Ref to anchor
@ref{An anchor}

Ref to footnote anchor
@ref{Anchor in footnote}

';


$result_texts{'things_before_setfilename'} = '
Ref to the anchor:
An anchor

Ref to the anchor in footnote:
Anchor in footnote.



float anchor
In float

Ref to float
float anchor.

Text, ta
In float




* An anchor::                menu entry pointing to the anchor.





top section
***********

1 Chapter
*********

Ref to anchor
An anchor

Ref to footnote anchor
Anchor in footnote

';

$result_sectioning{'things_before_setfilename'} = {
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
                    'normalized' => 'chap'
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
$result_sectioning{'things_before_setfilename'}{'structure'}{'section_childs'}[0]{'structure'}{'section_childs'}[0]{'structure'}{'section_up'} = $result_sectioning{'things_before_setfilename'}{'structure'}{'section_childs'}[0];
$result_sectioning{'things_before_setfilename'}{'structure'}{'section_childs'}[0]{'structure'}{'section_childs'}[0]{'structure'}{'toplevel_prev'} = $result_sectioning{'things_before_setfilename'}{'structure'}{'section_childs'}[0];
$result_sectioning{'things_before_setfilename'}{'structure'}{'section_childs'}[0]{'structure'}{'section_childs'}[0]{'structure'}{'toplevel_up'} = $result_sectioning{'things_before_setfilename'}{'structure'}{'section_childs'}[0];
$result_sectioning{'things_before_setfilename'}{'structure'}{'section_childs'}[0]{'structure'}{'section_up'} = $result_sectioning{'things_before_setfilename'};

$result_nodes{'things_before_setfilename'} = {
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
        'normalized' => 'chap'
      },
      'structure' => {
        'node_prev' => {},
        'node_up' => {}
      }
    }
  }
};
$result_nodes{'things_before_setfilename'}{'structure'}{'node_next'}{'structure'}{'node_prev'} = $result_nodes{'things_before_setfilename'};
$result_nodes{'things_before_setfilename'}{'structure'}{'node_next'}{'structure'}{'node_up'} = $result_nodes{'things_before_setfilename'};

$result_menus{'things_before_setfilename'} = {
  'cmdname' => 'node',
  'extra' => {
    'normalized' => 'Top'
  },
  'structure' => {}
};

$result_errors{'things_before_setfilename'} = [
  {
    'error_line' => 'warning: entry for index `cp\' outside of any node
',
    'file_name' => 'things_before_setfilename.texi',
    'line_nr' => 38,
    'macro' => '',
    'text' => 'entry for index `cp\' outside of any node',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: printindex before document beginning: @printindex cp
',
    'file_name' => 'things_before_setfilename.texi',
    'line_nr' => 40,
    'macro' => '',
    'text' => 'printindex before document beginning: @printindex cp',
    'type' => 'warning'
  }
];


$result_floats{'things_before_setfilename'} = {
  '' => [
    {
      'cmdname' => 'float',
      'extra' => {
        'normalized' => 'float-anchor',
        'type' => {
          'normalized' => ''
        }
      },
      'structure' => {
        'float_number' => 1
      }
    }
  ],
  'Text' => [
    {
      'cmdname' => 'float',
      'extra' => {
        'caption' => {
          'cmdname' => 'caption',
          'extra' => {
            'float' => {}
          }
        },
        'normalized' => 'ta',
        'type' => {
          'content' => [
            {
              'text' => 'Text'
            }
          ],
          'normalized' => 'Text'
        }
      },
      'structure' => {
        'float_number' => 1
      }
    }
  ]
};
$result_floats{'things_before_setfilename'}{'Text'}[0]{'extra'}{'caption'}{'extra'}{'float'} = $result_floats{'things_before_setfilename'}{'Text'}[0];


$result_indices_sort_strings{'things_before_setfilename'} = {
  'cp' => [
    'index entry'
  ]
};



$result_converted{'plaintext'}->{'things_before_setfilename'} = 'top section
***********

1 Chapter
*********

Ref to anchor *note An anchor::

   Ref to footnote anchor *note Anchor in footnote::

';


$result_converted{'html'}->{'things_before_setfilename'} = '<!DOCTYPE html>
<html>
<!-- Created by texinfo, http://www.gnu.org/software/texinfo/ -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>top section</title>

<meta name="description" content="top section">
<meta name="keywords" content="top section">
<meta name="resource-type" content="document">
<meta name="distribution" content="global">
<meta name="viewport" content="width=device-width,initial-scale=1">

<link href="#Top" rel="start" title="Top">
<link href="#Top" rel="index" title="Top">
<link href="#SEC_Contents" rel="contents" title="Table of Contents">
<style type="text/css">
<!--
ul.toc-numbered-mark {list-style: none}
-->
</style>


</head>

<body lang="en">

<div class="top-level-extent" id="Top">
<div class="nav-panel">
<p>
Next: <a href="#chap" accesskey="n" rel="next">Chapter</a> &nbsp; [<a href="#SEC_Contents" title="Table of contents" rel="contents">Contents</a>][<a href="#Top" title="Index" rel="index">Index</a>]</p>
</div>
<h1 class="top" id="top-section">top section</h1>

<div class="element-contents" id="SEC_Contents">
<h2 class="contents-heading">Table of Contents</h2>

<div class="contents">

<ul class="toc-numbered-mark">
  <li><a id="toc-Chapter" href="#chap">1 Chapter</a></li>
</ul>
</div>
</div>
<hr>
<div class="chapter-level-extent" id="chap">
<div class="nav-panel">
<p>
Previous: <a href="#Top" accesskey="p" rel="prev">top section</a>, Up: <a href="#Top" accesskey="u" rel="up">top section</a> &nbsp; [<a href="#SEC_Contents" title="Table of contents" rel="contents">Contents</a>][<a href="#Top" title="Index" rel="index">Index</a>]</p>
</div>
<h2 class="chapter" id="Chapter">1 Chapter</h2>

<p>Ref to anchor
<a class="ref" href="#An-anchor">An anchor</a>
</p>
<p>Ref to footnote anchor
<a class="ref" href="#Anchor-in-footnote">Anchor in footnote</a>
</p>
</div>
</div>



</body>
</html>
';


$result_converted{'xml'}->{'things_before_setfilename'} = '<preamblebeforebeginning>\\input texinfo

</preamblebeforebeginning><anchor name="An-anchor">An anchor</anchor>

<para>Ref to the anchor:
<ref label="An-anchor"><xrefnodename>An anchor</xrefnodename></ref>
</para>
<para>Ref to the anchor in footnote:
<ref label="Anchor-in-footnote"><xrefnodename>Anchor in footnote</xrefnodename></ref>.
</para>
<para><footnote><para>In footnote.
</para>
<anchor name="Anchor-in-footnote">Anchor in footnote</anchor>

<para>Ref to main text anchor
<ref label="An-anchor"><xrefnodename>An anchor</xrefnodename></ref>
</para></footnote>
</para>
<float name="float-anchor" type="" number="1" spaces=" " endspaces=" "><floatname spaces=" ">float anchor</floatname>
<para>In float
</para></float>

<para>Ref to float
<ref label="float-anchor"><xrefnodename>float anchor</xrefnodename></ref>.
</para>
<float name="ta" type="Text" number="1" spaces=" " endspaces=" "><floattype>Text</floattype><floatname spaces=" ">ta</floatname>
<para>In float
</para>
<caption><para>ta caption</para></caption>
</float>

<contents></contents>

<menu endspaces=" ">
<menuentry leadingtext="* "><menunode separator="::                ">An anchor</menunode><menudescription><pre xml:space="preserve">menu entry pointing to the anchor.
</pre></menudescription></menuentry></menu>

<cindex index="cp" spaces=" "><indexterm index="cp" number="1">index entry</indexterm></cindex>

<printindex value="cp" line="cp"></printindex>

<listoffloats type="Text" spaces=" ">Text</listoffloats>

<setfilename file="things_before_setfilename.info" spaces=" ">things_before_setfilename.info </setfilename>

<node name="Top" spaces=" "><nodename>Top</nodename><nodenext automatic="on">chap</nodenext></node>
<top spaces=" "><sectiontitle>top section</sectiontitle>

</top>
<node name="chap" spaces=" "><nodename>chap</nodename><nodeprev automatic="on">Top</nodeprev><nodeup automatic="on">Top</nodeup></node>
<chapter spaces=" "><sectiontitle>Chapter</sectiontitle>

<para>Ref to anchor
<ref label="An-anchor"><xrefnodename>An anchor</xrefnodename></ref>
</para>
<para>Ref to footnote anchor
<ref label="Anchor-in-footnote"><xrefnodename>Anchor in footnote</xrefnodename></ref>
</para>
</chapter>
';


$result_converted{'docbook'}->{'things_before_setfilename'} = '<chapter label="1" id="chap">
<title>Chapter</title>

<para>Ref to anchor
<link linkend="An-anchor">An anchor</link>
</para>
<para>Ref to footnote anchor
<link linkend="Anchor-in-footnote">Anchor in footnote</link>
</para>
</chapter>
';


$result_converted{'latex_text'}->{'things_before_setfilename'} = '
\\begin{document}
\\tableofcontents\\newpage
\\label{anchor:Top}%
\\chapter{{Chapter}}
\\label{anchor:chap}%

Ref to anchor
\\hyperref[anchor:An-anchor]{[An anchor], page~\\pageref*{anchor:An-anchor}}

Ref to footnote anchor
\\hyperref[anchor:Anchor-in-footnote]{[Anchor in footnote], page~\\pageref*{anchor:Anchor-in-footnote}}

';


$result_converted{'info'}->{'things_before_setfilename'} = 'This is things_before_setfilename.info, produced from
things_before_setfilename.texi.


File: things_before_setfilename.info,  Node: Top,  Next: chap,  Up: (dir)

top section
***********

* Menu:

* chap::


File: things_before_setfilename.info,  Node: chap,  Prev: Top,  Up: Top

1 Chapter
*********

Ref to anchor *note An anchor::

   Ref to footnote anchor *note Anchor in footnote::



Tag Table:
Node: Top87
Node: chap208

End Tag Table


Local Variables:
coding: utf-8
End:
';

1;
