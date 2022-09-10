use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'sample_utf8'} = {
  'contents' => [
    {
      'contents' => [
        {
          'contents' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => '\\input texinfo   @c -*-texinfo-*-
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
                  'parent' => {},
                  'text' => ' %**start of header
',
                  'type' => 'misc_arg'
                }
              ],
              'cmdname' => 'c',
              'extra' => {
                'misc_args' => [
                  ' %**start of header
'
                ]
              },
              'parent' => {}
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
                      'text' => 'sample_utf8.info'
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
                'text_arg' => 'sample_utf8.info'
              },
              'parent' => {},
              'source_info' => {
                'file_name' => 'sample_utf8.texi',
                'line_nr' => 3,
                'macro' => ''
              }
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => "Sample \x{793a}\x{4f8b} \x{104}\x{118} \x{f9}"
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
              'cmdname' => 'settitle',
              'extra' => {
                'spaces_before_argument' => ' '
              },
              'parent' => {},
              'source_info' => {
                'file_name' => 'sample_utf8.texi',
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
                      'text' => 'UTF-8'
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
              'cmdname' => 'documentencoding',
              'extra' => {
                'input_encoding_name' => 'utf-8',
                'input_perl_encoding' => 'utf-8-strict',
                'spaces_before_argument' => ' ',
                'text_arg' => 'UTF-8'
              },
              'parent' => {},
              'source_info' => {
                'file_name' => 'sample_utf8.texi',
                'line_nr' => 5,
                'macro' => ''
              }
            },
            {
              'args' => [
                {
                  'parent' => {},
                  'text' => ' %**end of header
',
                  'type' => 'misc_arg'
                }
              ],
              'cmdname' => 'c',
              'extra' => {
                'misc_args' => [
                  ' %**end of header
'
                ]
              },
              'parent' => {}
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
              'cmdname' => 'copying',
              'contents' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'This is a short example of a complete Texinfo file.
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
                      'text' => 'Copyright (C) 2005 Someone.
'
                    },
                    {
                      'parent' => {},
                      'text' => "Texinfo\x{4e2d}\x{6587}\x{793a}\x{4f8b}
"
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
                          'text' => 'copying'
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
                    'text_arg' => 'copying'
                  },
                  'parent' => {},
                  'source_info' => {
                    'file_name' => 'sample_utf8.texi',
                    'line_nr' => 13,
                    'macro' => ''
                  }
                }
              ],
              'parent' => {},
              'source_info' => {
                'file_name' => 'sample_utf8.texi',
                'line_nr' => 8,
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
              'cmdname' => 'titlepage',
              'contents' => [
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => "\x{6807}\x{9898}\x{793a}\x{4f8b} \x{104}\x{118} ae \x{105}\x{119} \x{c2} \x{f9}"
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
                  'cmdname' => 'title',
                  'extra' => {
                    'spaces_before_argument' => ' '
                  },
                  'parent' => {},
                  'source_info' => {
                    'file_name' => 'sample_utf8.texi',
                    'line_nr' => 16,
                    'macro' => ''
                  }
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
                  'cmdname' => 'page',
                  'parent' => {}
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => "Texinfo\x{4e2d}\x{6587}\x{793a}\x{4f8b}
"
                    },
                    {
                      'args' => [
                        {
                          'parent' => {},
                          'text' => ' 0pt plus 1filll
',
                          'type' => 'misc_arg'
                        }
                      ],
                      'cmdname' => 'vskip',
                      'extra' => {
                        'misc_args' => [
                          ' 0pt plus 1filll
'
                        ]
                      },
                      'parent' => {}
                    }
                  ],
                  'parent' => {},
                  'type' => 'paragraph'
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
                  'cmdname' => 'insertcopying',
                  'parent' => {},
                  'source_info' => {
                    'file_name' => 'sample_utf8.texi',
                    'line_nr' => 20,
                    'macro' => ''
                  }
                },
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'titlepage'
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
                    'text_arg' => 'titlepage'
                  },
                  'parent' => {},
                  'source_info' => {
                    'file_name' => 'sample_utf8.texi',
                    'line_nr' => 21,
                    'macro' => ''
                  }
                }
              ],
              'parent' => {},
              'source_info' => {
                'file_name' => 'sample_utf8.texi',
                'line_nr' => 15,
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
                  'text' => ' Output the table of the contents at the beginning.
',
                  'type' => 'misc_arg'
                }
              ],
              'cmdname' => 'c',
              'extra' => {
                'misc_args' => [
                  ' Output the table of the contents at the beginning.
'
                ]
              },
              'parent' => {}
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
                'file_name' => 'sample_utf8.texi',
                'line_nr' => 24,
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
        'file_name' => 'sample_utf8.texi',
        'line_nr' => 27,
        'macro' => ''
      }
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'parent' => {},
              'text' => "Texinfo\x{4e2d}\x{6587}\x{793a}\x{4f8b}"
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
          'cmdname' => 'insertcopying',
          'parent' => {},
          'source_info' => {
            'file_name' => 'sample_utf8.texi',
            'line_nr' => 30,
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
                      'text' => "\x{7b2c}\x{4e00}\x{7ae0}\x{ff08}First Chapter\x{ff09}"
                    }
                  ],
                  'parent' => {},
                  'type' => 'menu_entry_node'
                },
                {
                  'parent' => {},
                  'text' => ':: ',
                  'type' => 'menu_entry_separator'
                },
                {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => "\x{8fd9}\x{662f}\x{6b64}\x{793a}\x{4f8b}\x{6587}\x{6863}\x{7684}\x{7b2c}\x{4e00}\x{7ae0}
"
                        },
                        {
                          'parent' => {},
                          'text' => '                           (with mixed cjk & latin char title)
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
                  'normalized' => '_7b2c_4e00_7ae0_ff08First-Chapter_ff09'
                }
              },
              'parent' => {},
              'source_info' => {
                'file_name' => 'sample_utf8.texi',
                'line_nr' => 34,
                'macro' => ''
              },
              'type' => 'menu_entry'
            },
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
                      'text' => "Second Chapter AE \x{104}\x{118} ae \x{105}\x{119}"
                    }
                  ],
                  'parent' => {},
                  'type' => 'menu_entry_node'
                },
                {
                  'parent' => {},
                  'text' => '::  ',
                  'type' => 'menu_entry_separator'
                },
                {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => "this is chapter 2. AE \x{104}\x{118} ae \x{105}\x{119}
"
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
                  'normalized' => 'Second-Chapter-AE-_0104_0118-ae-_0105_0119'
                }
              },
              'parent' => {},
              'source_info' => {
                'file_name' => 'sample_utf8.texi',
                'line_nr' => 36,
                'macro' => ''
              },
              'type' => 'menu_entry'
            },
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
                      'text' => 'Index node'
                    }
                  ],
                  'parent' => {},
                  'type' => 'menu_entry_node'
                },
                {
                  'parent' => {},
                  'text' => '::    ',
                  'type' => 'menu_entry_separator'
                },
                {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'parent' => {},
                          'text' => 'Complete index.
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
                  'normalized' => 'Index-node'
                }
              },
              'parent' => {},
              'source_info' => {
                'file_name' => 'sample_utf8.texi',
                'line_nr' => 37,
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
                'spaces_before_argument' => ' ',
                'text_arg' => 'menu'
              },
              'parent' => {},
              'source_info' => {
                'file_name' => 'sample_utf8.texi',
                'line_nr' => 38,
                'macro' => ''
              }
            }
          ],
          'parent' => {},
          'source_info' => {
            'file_name' => 'sample_utf8.texi',
            'line_nr' => 33,
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
        'file_name' => 'sample_utf8.texi',
        'line_nr' => 28,
        'macro' => ''
      }
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'parent' => {},
              'text' => "\x{7b2c}\x{4e00}\x{7ae0}\x{ff08}First Chapter\x{ff09}"
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
            'normalized' => '_7b2c_4e00_7ae0_ff08First-Chapter_ff09'
          }
        ],
        'normalized' => '_7b2c_4e00_7ae0_ff08First-Chapter_ff09',
        'spaces_before_argument' => ' '
      },
      'parent' => {},
      'source_info' => {
        'file_name' => 'sample_utf8.texi',
        'line_nr' => 41,
        'macro' => ''
      }
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'parent' => {},
              'text' => "\x{7b2c}\x{4e00}\x{7ae0}\x{ff08}First Chapter\x{ff09}"
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
                  'text' => 'chapter, first'
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
              'node' => {},
              'number' => 1
            },
            'spaces_before_argument' => ' '
          },
          'parent' => {},
          'source_info' => {
            'file_name' => 'sample_utf8.texi',
            'line_nr' => 44,
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
          'contents' => [
            {
              'parent' => {},
              'text' => "This is the first chapter. \x{8fd9}\x{662f}\x{7b2c}\x{4e00}\x{7ae0}\x{3002}
"
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => "\x{53e6}\x{4e00}\x{4e2a}\x{ff0c}index entry"
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
                  'node' => {},
                  'number' => 2
                },
                'spaces_before_argument' => ' '
              },
              'parent' => {},
              'source_info' => {
                'file_name' => 'sample_utf8.texi',
                'line_nr' => 47,
                'macro' => ''
              },
              'type' => 'index_entry_command'
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => "\x{104}\x{118} ae \x{105}\x{119}"
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
                  'node' => {},
                  'number' => 3
                },
                'spaces_before_argument' => ' '
              },
              'parent' => {},
              'source_info' => {
                'file_name' => 'sample_utf8.texi',
                'line_nr' => 48,
                'macro' => ''
              },
              'type' => 'index_entry_command'
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => "\x{e9} \x{c2}"
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
                  'node' => {},
                  'number' => 4
                },
                'spaces_before_argument' => ' '
              },
              'parent' => {},
              'source_info' => {
                'file_name' => 'sample_utf8.texi',
                'line_nr' => 49,
                'macro' => ''
              },
              'type' => 'index_entry_command'
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
              'text' => 'Here is a numbered list.
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
              'contents' => [],
              'extra' => {
                'spaces_after_argument' => '
'
              },
              'parent' => {},
              'type' => 'block_line_arg'
            }
          ],
          'cmdname' => 'enumerate',
          'contents' => [
            {
              'cmdname' => 'item',
              'contents' => [
                {
                  'parent' => {},
                  'text' => ' ',
                  'type' => 'empty_line_after_command'
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => "\x{7b2c}
"
                    },
                    {
                      'parent' => {},
                      'text' => 'This is the first item.
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
                'item_number' => 1
              },
              'parent' => {},
              'source_info' => {
                'file_name' => 'sample_utf8.texi',
                'line_nr' => 54,
                'macro' => ''
              }
            },
            {
              'cmdname' => 'item',
              'contents' => [
                {
                  'parent' => {},
                  'text' => ' ',
                  'type' => 'empty_line_after_command'
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => "\x{104}\x{118}
"
                    },
                    {
                      'parent' => {},
                      'text' => 'This is the second item.
'
                    }
                  ],
                  'parent' => {},
                  'type' => 'paragraph'
                }
              ],
              'extra' => {
                'item_number' => 2
              },
              'parent' => {},
              'source_info' => {
                'file_name' => 'sample_utf8.texi',
                'line_nr' => 57,
                'macro' => ''
              }
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'enumerate'
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
                'text_arg' => 'enumerate'
              },
              'parent' => {},
              'source_info' => {
                'file_name' => 'sample_utf8.texi',
                'line_nr' => 59,
                'macro' => ''
              }
            }
          ],
          'extra' => {
            'enumerate_specification' => '1'
          },
          'parent' => {},
          'source_info' => {
            'file_name' => 'sample_utf8.texi',
            'line_nr' => 53,
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
      'extra' => {
        'spaces_before_argument' => ' '
      },
      'parent' => {},
      'source_info' => {
        'file_name' => 'sample_utf8.texi',
        'line_nr' => 42,
        'macro' => ''
      }
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'parent' => {},
              'text' => "Second Chapter AE \x{104}\x{118} ae \x{105}\x{119}"
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
            'normalized' => 'Second-Chapter-AE-_0104_0118-ae-_0105_0119'
          }
        ],
        'normalized' => 'Second-Chapter-AE-_0104_0118-ae-_0105_0119',
        'spaces_before_argument' => ' '
      },
      'parent' => {},
      'source_info' => {
        'file_name' => 'sample_utf8.texi',
        'line_nr' => 61,
        'macro' => ''
      }
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'parent' => {},
              'text' => "Chapter 2 AE \x{104}\x{118} ae \x{105}\x{119}"
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
              'text' => "Za\x{17c}\x{f3}\x{142}\x{107} g\x{119}\x{15b}l\x{105} ja\x{17a}\x{144}!
"
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
        'file_name' => 'sample_utf8.texi',
        'line_nr' => 62,
        'macro' => ''
      }
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'Index node'
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
        'isindex' => 1,
        'node_content' => [
          {}
        ],
        'nodes_manuals' => [
          {
            'node_content' => [
              {}
            ],
            'normalized' => 'Index-node'
          }
        ],
        'normalized' => 'Index-node',
        'spaces_before_argument' => ' '
      },
      'parent' => {},
      'source_info' => {
        'file_name' => 'sample_utf8.texi',
        'line_nr' => 66,
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
      'cmdname' => 'unnumbered',
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
            'file_name' => 'sample_utf8.texi',
            'line_nr' => 69,
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
      'extra' => {
        'spaces_before_argument' => ' '
      },
      'parent' => {},
      'source_info' => {
        'file_name' => 'sample_utf8.texi',
        'line_nr' => 67,
        'macro' => ''
      }
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
      'cmdname' => 'bye',
      'parent' => {}
    }
  ],
  'type' => 'document_root'
};
$result_trees{'sample_utf8'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[0]{'contents'}[0]{'contents'}[0];
$result_trees{'sample_utf8'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[0]{'contents'}[0];
$result_trees{'sample_utf8'}{'contents'}[0]{'contents'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[0]{'contents'}[0]{'contents'}[1];
$result_trees{'sample_utf8'}{'contents'}[0]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[0]{'contents'}[0];
$result_trees{'sample_utf8'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[0];
$result_trees{'sample_utf8'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'args'}[0];
$result_trees{'sample_utf8'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[0]{'contents'}[1]{'contents'}[0];
$result_trees{'sample_utf8'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[0]{'contents'}[1];
$result_trees{'sample_utf8'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'sample_utf8'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[0]{'contents'}[1]{'contents'}[1];
$result_trees{'sample_utf8'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[0]{'contents'}[1];
$result_trees{'sample_utf8'}{'contents'}[0]{'contents'}[1]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[0]{'contents'}[1]{'contents'}[2]{'args'}[0];
$result_trees{'sample_utf8'}{'contents'}[0]{'contents'}[1]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[0]{'contents'}[1]{'contents'}[2];
$result_trees{'sample_utf8'}{'contents'}[0]{'contents'}[1]{'contents'}[2]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[0]{'contents'}[1];
$result_trees{'sample_utf8'}{'contents'}[0]{'contents'}[1]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[0]{'contents'}[1]{'contents'}[3];
$result_trees{'sample_utf8'}{'contents'}[0]{'contents'}[1]{'contents'}[3]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[0]{'contents'}[1];
$result_trees{'sample_utf8'}{'contents'}[0]{'contents'}[1]{'contents'}[4]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[0]{'contents'}[1];
$result_trees{'sample_utf8'}{'contents'}[0]{'contents'}[1]{'contents'}[5]{'args'}[0]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[0]{'contents'}[1]{'contents'}[5];
$result_trees{'sample_utf8'}{'contents'}[0]{'contents'}[1]{'contents'}[5]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[0]{'contents'}[1]{'contents'}[5]{'contents'}[0];
$result_trees{'sample_utf8'}{'contents'}[0]{'contents'}[1]{'contents'}[5]{'contents'}[0]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[0]{'contents'}[1]{'contents'}[5];
$result_trees{'sample_utf8'}{'contents'}[0]{'contents'}[1]{'contents'}[5]{'contents'}[1]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[0]{'contents'}[1]{'contents'}[5];
$result_trees{'sample_utf8'}{'contents'}[0]{'contents'}[1]{'contents'}[5]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[0]{'contents'}[1]{'contents'}[5]{'contents'}[2];
$result_trees{'sample_utf8'}{'contents'}[0]{'contents'}[1]{'contents'}[5]{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[0]{'contents'}[1]{'contents'}[5]{'contents'}[2];
$result_trees{'sample_utf8'}{'contents'}[0]{'contents'}[1]{'contents'}[5]{'contents'}[2]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[0]{'contents'}[1]{'contents'}[5];
$result_trees{'sample_utf8'}{'contents'}[0]{'contents'}[1]{'contents'}[5]{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[0]{'contents'}[1]{'contents'}[5]{'contents'}[3]{'args'}[0];
$result_trees{'sample_utf8'}{'contents'}[0]{'contents'}[1]{'contents'}[5]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[0]{'contents'}[1]{'contents'}[5]{'contents'}[3];
$result_trees{'sample_utf8'}{'contents'}[0]{'contents'}[1]{'contents'}[5]{'contents'}[3]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[0]{'contents'}[1]{'contents'}[5];
$result_trees{'sample_utf8'}{'contents'}[0]{'contents'}[1]{'contents'}[5]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[0]{'contents'}[1];
$result_trees{'sample_utf8'}{'contents'}[0]{'contents'}[1]{'contents'}[6]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[0]{'contents'}[1];
$result_trees{'sample_utf8'}{'contents'}[0]{'contents'}[1]{'contents'}[7]{'args'}[0]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[0]{'contents'}[1]{'contents'}[7];
$result_trees{'sample_utf8'}{'contents'}[0]{'contents'}[1]{'contents'}[7]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[0]{'contents'}[1]{'contents'}[7]{'contents'}[0]{'args'}[0];
$result_trees{'sample_utf8'}{'contents'}[0]{'contents'}[1]{'contents'}[7]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[0]{'contents'}[1]{'contents'}[7]{'contents'}[0];
$result_trees{'sample_utf8'}{'contents'}[0]{'contents'}[1]{'contents'}[7]{'contents'}[0]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[0]{'contents'}[1]{'contents'}[7];
$result_trees{'sample_utf8'}{'contents'}[0]{'contents'}[1]{'contents'}[7]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[0]{'contents'}[1]{'contents'}[7]{'contents'}[1];
$result_trees{'sample_utf8'}{'contents'}[0]{'contents'}[1]{'contents'}[7]{'contents'}[1]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[0]{'contents'}[1]{'contents'}[7];
$result_trees{'sample_utf8'}{'contents'}[0]{'contents'}[1]{'contents'}[7]{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[0]{'contents'}[1]{'contents'}[7]{'contents'}[2];
$result_trees{'sample_utf8'}{'contents'}[0]{'contents'}[1]{'contents'}[7]{'contents'}[2]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[0]{'contents'}[1]{'contents'}[7]{'contents'}[2]{'contents'}[1];
$result_trees{'sample_utf8'}{'contents'}[0]{'contents'}[1]{'contents'}[7]{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[0]{'contents'}[1]{'contents'}[7]{'contents'}[2];
$result_trees{'sample_utf8'}{'contents'}[0]{'contents'}[1]{'contents'}[7]{'contents'}[2]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[0]{'contents'}[1]{'contents'}[7];
$result_trees{'sample_utf8'}{'contents'}[0]{'contents'}[1]{'contents'}[7]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[0]{'contents'}[1]{'contents'}[7]{'contents'}[3];
$result_trees{'sample_utf8'}{'contents'}[0]{'contents'}[1]{'contents'}[7]{'contents'}[3]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[0]{'contents'}[1]{'contents'}[7];
$result_trees{'sample_utf8'}{'contents'}[0]{'contents'}[1]{'contents'}[7]{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[0]{'contents'}[1]{'contents'}[7]{'contents'}[4]{'args'}[0];
$result_trees{'sample_utf8'}{'contents'}[0]{'contents'}[1]{'contents'}[7]{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[0]{'contents'}[1]{'contents'}[7]{'contents'}[4];
$result_trees{'sample_utf8'}{'contents'}[0]{'contents'}[1]{'contents'}[7]{'contents'}[4]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[0]{'contents'}[1]{'contents'}[7];
$result_trees{'sample_utf8'}{'contents'}[0]{'contents'}[1]{'contents'}[7]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[0]{'contents'}[1];
$result_trees{'sample_utf8'}{'contents'}[0]{'contents'}[1]{'contents'}[8]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[0]{'contents'}[1];
$result_trees{'sample_utf8'}{'contents'}[0]{'contents'}[1]{'contents'}[9]{'args'}[0]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[0]{'contents'}[1]{'contents'}[9];
$result_trees{'sample_utf8'}{'contents'}[0]{'contents'}[1]{'contents'}[9]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[0]{'contents'}[1];
$result_trees{'sample_utf8'}{'contents'}[0]{'contents'}[1]{'contents'}[10]{'args'}[0]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[0]{'contents'}[1]{'contents'}[10];
$result_trees{'sample_utf8'}{'contents'}[0]{'contents'}[1]{'contents'}[10]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[0]{'contents'}[1];
$result_trees{'sample_utf8'}{'contents'}[0]{'contents'}[1]{'contents'}[11]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[0]{'contents'}[1];
$result_trees{'sample_utf8'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[0];
$result_trees{'sample_utf8'}{'contents'}[0]{'parent'} = $result_trees{'sample_utf8'};
$result_trees{'sample_utf8'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[1]{'args'}[0];
$result_trees{'sample_utf8'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[1];
$result_trees{'sample_utf8'}{'contents'}[1]{'extra'}{'node_content'}[0] = $result_trees{'sample_utf8'}{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'sample_utf8'}{'contents'}[1]{'extra'}{'nodes_manuals'}[0]{'node_content'}[0] = $result_trees{'sample_utf8'}{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'sample_utf8'}{'contents'}[1]{'parent'} = $result_trees{'sample_utf8'};
$result_trees{'sample_utf8'}{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[2]{'args'}[0];
$result_trees{'sample_utf8'}{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[2];
$result_trees{'sample_utf8'}{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[2];
$result_trees{'sample_utf8'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[2]{'contents'}[1];
$result_trees{'sample_utf8'}{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[2];
$result_trees{'sample_utf8'}{'contents'}[2]{'contents'}[2]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[2];
$result_trees{'sample_utf8'}{'contents'}[2]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[2]{'contents'}[3];
$result_trees{'sample_utf8'}{'contents'}[2]{'contents'}[3]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[2]{'contents'}[3]{'contents'}[0];
$result_trees{'sample_utf8'}{'contents'}[2]{'contents'}[3]{'contents'}[0]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[2]{'contents'}[3]{'contents'}[0]{'args'}[1];
$result_trees{'sample_utf8'}{'contents'}[2]{'contents'}[3]{'contents'}[0]{'args'}[1]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[2]{'contents'}[3]{'contents'}[0];
$result_trees{'sample_utf8'}{'contents'}[2]{'contents'}[3]{'contents'}[0]{'args'}[2]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[2]{'contents'}[3]{'contents'}[0];
$result_trees{'sample_utf8'}{'contents'}[2]{'contents'}[3]{'contents'}[0]{'args'}[3]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[2]{'contents'}[3]{'contents'}[0]{'args'}[3]{'contents'}[0];
$result_trees{'sample_utf8'}{'contents'}[2]{'contents'}[3]{'contents'}[0]{'args'}[3]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[2]{'contents'}[3]{'contents'}[0]{'args'}[3]{'contents'}[0];
$result_trees{'sample_utf8'}{'contents'}[2]{'contents'}[3]{'contents'}[0]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[2]{'contents'}[3]{'contents'}[0]{'args'}[3];
$result_trees{'sample_utf8'}{'contents'}[2]{'contents'}[3]{'contents'}[0]{'args'}[3]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[2]{'contents'}[3]{'contents'}[0];
$result_trees{'sample_utf8'}{'contents'}[2]{'contents'}[3]{'contents'}[0]{'extra'}{'menu_entry_description'} = $result_trees{'sample_utf8'}{'contents'}[2]{'contents'}[3]{'contents'}[0]{'args'}[3];
$result_trees{'sample_utf8'}{'contents'}[2]{'contents'}[3]{'contents'}[0]{'extra'}{'menu_entry_node'}{'node_content'}[0] = $result_trees{'sample_utf8'}{'contents'}[2]{'contents'}[3]{'contents'}[0]{'args'}[1]{'contents'}[0];
$result_trees{'sample_utf8'}{'contents'}[2]{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[2]{'contents'}[3];
$result_trees{'sample_utf8'}{'contents'}[2]{'contents'}[3]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[2]{'contents'}[3]{'contents'}[1];
$result_trees{'sample_utf8'}{'contents'}[2]{'contents'}[3]{'contents'}[1]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[2]{'contents'}[3]{'contents'}[1]{'args'}[1];
$result_trees{'sample_utf8'}{'contents'}[2]{'contents'}[3]{'contents'}[1]{'args'}[1]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[2]{'contents'}[3]{'contents'}[1];
$result_trees{'sample_utf8'}{'contents'}[2]{'contents'}[3]{'contents'}[1]{'args'}[2]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[2]{'contents'}[3]{'contents'}[1];
$result_trees{'sample_utf8'}{'contents'}[2]{'contents'}[3]{'contents'}[1]{'args'}[3]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[2]{'contents'}[3]{'contents'}[1]{'args'}[3]{'contents'}[0];
$result_trees{'sample_utf8'}{'contents'}[2]{'contents'}[3]{'contents'}[1]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[2]{'contents'}[3]{'contents'}[1]{'args'}[3];
$result_trees{'sample_utf8'}{'contents'}[2]{'contents'}[3]{'contents'}[1]{'args'}[3]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[2]{'contents'}[3]{'contents'}[1];
$result_trees{'sample_utf8'}{'contents'}[2]{'contents'}[3]{'contents'}[1]{'extra'}{'menu_entry_description'} = $result_trees{'sample_utf8'}{'contents'}[2]{'contents'}[3]{'contents'}[1]{'args'}[3];
$result_trees{'sample_utf8'}{'contents'}[2]{'contents'}[3]{'contents'}[1]{'extra'}{'menu_entry_node'}{'node_content'}[0] = $result_trees{'sample_utf8'}{'contents'}[2]{'contents'}[3]{'contents'}[1]{'args'}[1]{'contents'}[0];
$result_trees{'sample_utf8'}{'contents'}[2]{'contents'}[3]{'contents'}[1]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[2]{'contents'}[3];
$result_trees{'sample_utf8'}{'contents'}[2]{'contents'}[3]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[2]{'contents'}[3]{'contents'}[2];
$result_trees{'sample_utf8'}{'contents'}[2]{'contents'}[3]{'contents'}[2]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[2]{'contents'}[3]{'contents'}[2]{'args'}[1];
$result_trees{'sample_utf8'}{'contents'}[2]{'contents'}[3]{'contents'}[2]{'args'}[1]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[2]{'contents'}[3]{'contents'}[2];
$result_trees{'sample_utf8'}{'contents'}[2]{'contents'}[3]{'contents'}[2]{'args'}[2]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[2]{'contents'}[3]{'contents'}[2];
$result_trees{'sample_utf8'}{'contents'}[2]{'contents'}[3]{'contents'}[2]{'args'}[3]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[2]{'contents'}[3]{'contents'}[2]{'args'}[3]{'contents'}[0];
$result_trees{'sample_utf8'}{'contents'}[2]{'contents'}[3]{'contents'}[2]{'args'}[3]{'contents'}[0]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[2]{'contents'}[3]{'contents'}[2]{'args'}[3];
$result_trees{'sample_utf8'}{'contents'}[2]{'contents'}[3]{'contents'}[2]{'args'}[3]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[2]{'contents'}[3]{'contents'}[2];
$result_trees{'sample_utf8'}{'contents'}[2]{'contents'}[3]{'contents'}[2]{'extra'}{'menu_entry_description'} = $result_trees{'sample_utf8'}{'contents'}[2]{'contents'}[3]{'contents'}[2]{'args'}[3];
$result_trees{'sample_utf8'}{'contents'}[2]{'contents'}[3]{'contents'}[2]{'extra'}{'menu_entry_node'}{'node_content'}[0] = $result_trees{'sample_utf8'}{'contents'}[2]{'contents'}[3]{'contents'}[2]{'args'}[1]{'contents'}[0];
$result_trees{'sample_utf8'}{'contents'}[2]{'contents'}[3]{'contents'}[2]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[2]{'contents'}[3];
$result_trees{'sample_utf8'}{'contents'}[2]{'contents'}[3]{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[2]{'contents'}[3]{'contents'}[3]{'args'}[0];
$result_trees{'sample_utf8'}{'contents'}[2]{'contents'}[3]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[2]{'contents'}[3]{'contents'}[3];
$result_trees{'sample_utf8'}{'contents'}[2]{'contents'}[3]{'contents'}[3]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[2]{'contents'}[3];
$result_trees{'sample_utf8'}{'contents'}[2]{'contents'}[3]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[2];
$result_trees{'sample_utf8'}{'contents'}[2]{'contents'}[4]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[2];
$result_trees{'sample_utf8'}{'contents'}[2]{'contents'}[5]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[2];
$result_trees{'sample_utf8'}{'contents'}[2]{'parent'} = $result_trees{'sample_utf8'};
$result_trees{'sample_utf8'}{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[3]{'args'}[0];
$result_trees{'sample_utf8'}{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[3];
$result_trees{'sample_utf8'}{'contents'}[3]{'extra'}{'node_content'}[0] = $result_trees{'sample_utf8'}{'contents'}[3]{'args'}[0]{'contents'}[0];
$result_trees{'sample_utf8'}{'contents'}[3]{'extra'}{'nodes_manuals'}[0]{'node_content'}[0] = $result_trees{'sample_utf8'}{'contents'}[3]{'args'}[0]{'contents'}[0];
$result_trees{'sample_utf8'}{'contents'}[3]{'parent'} = $result_trees{'sample_utf8'};
$result_trees{'sample_utf8'}{'contents'}[4]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[4]{'args'}[0];
$result_trees{'sample_utf8'}{'contents'}[4]{'args'}[0]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[4];
$result_trees{'sample_utf8'}{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[4];
$result_trees{'sample_utf8'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[4]{'contents'}[1]{'args'}[0];
$result_trees{'sample_utf8'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[4]{'contents'}[1];
$result_trees{'sample_utf8'}{'contents'}[4]{'contents'}[1]{'extra'}{'index_entry'}{'command'} = $result_trees{'sample_utf8'}{'contents'}[4]{'contents'}[1];
$result_trees{'sample_utf8'}{'contents'}[4]{'contents'}[1]{'extra'}{'index_entry'}{'content'} = $result_trees{'sample_utf8'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'contents'};
$result_trees{'sample_utf8'}{'contents'}[4]{'contents'}[1]{'extra'}{'index_entry'}{'content_normalized'} = $result_trees{'sample_utf8'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'contents'};
$result_trees{'sample_utf8'}{'contents'}[4]{'contents'}[1]{'extra'}{'index_entry'}{'node'} = $result_trees{'sample_utf8'}{'contents'}[3];
$result_trees{'sample_utf8'}{'contents'}[4]{'contents'}[1]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[4];
$result_trees{'sample_utf8'}{'contents'}[4]{'contents'}[2]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[4];
$result_trees{'sample_utf8'}{'contents'}[4]{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[4]{'contents'}[3];
$result_trees{'sample_utf8'}{'contents'}[4]{'contents'}[3]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[4]{'contents'}[3]{'contents'}[1]{'args'}[0];
$result_trees{'sample_utf8'}{'contents'}[4]{'contents'}[3]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[4]{'contents'}[3]{'contents'}[1];
$result_trees{'sample_utf8'}{'contents'}[4]{'contents'}[3]{'contents'}[1]{'extra'}{'index_entry'}{'command'} = $result_trees{'sample_utf8'}{'contents'}[4]{'contents'}[3]{'contents'}[1];
$result_trees{'sample_utf8'}{'contents'}[4]{'contents'}[3]{'contents'}[1]{'extra'}{'index_entry'}{'content'} = $result_trees{'sample_utf8'}{'contents'}[4]{'contents'}[3]{'contents'}[1]{'args'}[0]{'contents'};
$result_trees{'sample_utf8'}{'contents'}[4]{'contents'}[3]{'contents'}[1]{'extra'}{'index_entry'}{'content_normalized'} = $result_trees{'sample_utf8'}{'contents'}[4]{'contents'}[3]{'contents'}[1]{'args'}[0]{'contents'};
$result_trees{'sample_utf8'}{'contents'}[4]{'contents'}[3]{'contents'}[1]{'extra'}{'index_entry'}{'node'} = $result_trees{'sample_utf8'}{'contents'}[3];
$result_trees{'sample_utf8'}{'contents'}[4]{'contents'}[3]{'contents'}[1]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[4]{'contents'}[3];
$result_trees{'sample_utf8'}{'contents'}[4]{'contents'}[3]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[4]{'contents'}[3]{'contents'}[2]{'args'}[0];
$result_trees{'sample_utf8'}{'contents'}[4]{'contents'}[3]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[4]{'contents'}[3]{'contents'}[2];
$result_trees{'sample_utf8'}{'contents'}[4]{'contents'}[3]{'contents'}[2]{'extra'}{'index_entry'}{'command'} = $result_trees{'sample_utf8'}{'contents'}[4]{'contents'}[3]{'contents'}[2];
$result_trees{'sample_utf8'}{'contents'}[4]{'contents'}[3]{'contents'}[2]{'extra'}{'index_entry'}{'content'} = $result_trees{'sample_utf8'}{'contents'}[4]{'contents'}[3]{'contents'}[2]{'args'}[0]{'contents'};
$result_trees{'sample_utf8'}{'contents'}[4]{'contents'}[3]{'contents'}[2]{'extra'}{'index_entry'}{'content_normalized'} = $result_trees{'sample_utf8'}{'contents'}[4]{'contents'}[3]{'contents'}[2]{'args'}[0]{'contents'};
$result_trees{'sample_utf8'}{'contents'}[4]{'contents'}[3]{'contents'}[2]{'extra'}{'index_entry'}{'node'} = $result_trees{'sample_utf8'}{'contents'}[3];
$result_trees{'sample_utf8'}{'contents'}[4]{'contents'}[3]{'contents'}[2]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[4]{'contents'}[3];
$result_trees{'sample_utf8'}{'contents'}[4]{'contents'}[3]{'contents'}[3]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[4]{'contents'}[3]{'contents'}[3]{'args'}[0];
$result_trees{'sample_utf8'}{'contents'}[4]{'contents'}[3]{'contents'}[3]{'args'}[0]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[4]{'contents'}[3]{'contents'}[3];
$result_trees{'sample_utf8'}{'contents'}[4]{'contents'}[3]{'contents'}[3]{'extra'}{'index_entry'}{'command'} = $result_trees{'sample_utf8'}{'contents'}[4]{'contents'}[3]{'contents'}[3];
$result_trees{'sample_utf8'}{'contents'}[4]{'contents'}[3]{'contents'}[3]{'extra'}{'index_entry'}{'content'} = $result_trees{'sample_utf8'}{'contents'}[4]{'contents'}[3]{'contents'}[3]{'args'}[0]{'contents'};
$result_trees{'sample_utf8'}{'contents'}[4]{'contents'}[3]{'contents'}[3]{'extra'}{'index_entry'}{'content_normalized'} = $result_trees{'sample_utf8'}{'contents'}[4]{'contents'}[3]{'contents'}[3]{'args'}[0]{'contents'};
$result_trees{'sample_utf8'}{'contents'}[4]{'contents'}[3]{'contents'}[3]{'extra'}{'index_entry'}{'node'} = $result_trees{'sample_utf8'}{'contents'}[3];
$result_trees{'sample_utf8'}{'contents'}[4]{'contents'}[3]{'contents'}[3]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[4]{'contents'}[3];
$result_trees{'sample_utf8'}{'contents'}[4]{'contents'}[3]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[4];
$result_trees{'sample_utf8'}{'contents'}[4]{'contents'}[4]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[4];
$result_trees{'sample_utf8'}{'contents'}[4]{'contents'}[5]{'contents'}[0]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[4]{'contents'}[5];
$result_trees{'sample_utf8'}{'contents'}[4]{'contents'}[5]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[4];
$result_trees{'sample_utf8'}{'contents'}[4]{'contents'}[6]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[4];
$result_trees{'sample_utf8'}{'contents'}[4]{'contents'}[7]{'args'}[0]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[4]{'contents'}[7];
$result_trees{'sample_utf8'}{'contents'}[4]{'contents'}[7]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[4]{'contents'}[7]{'contents'}[0];
$result_trees{'sample_utf8'}{'contents'}[4]{'contents'}[7]{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[4]{'contents'}[7]{'contents'}[0]{'contents'}[1];
$result_trees{'sample_utf8'}{'contents'}[4]{'contents'}[7]{'contents'}[0]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[4]{'contents'}[7]{'contents'}[0]{'contents'}[1];
$result_trees{'sample_utf8'}{'contents'}[4]{'contents'}[7]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[4]{'contents'}[7]{'contents'}[0];
$result_trees{'sample_utf8'}{'contents'}[4]{'contents'}[7]{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[4]{'contents'}[7]{'contents'}[0];
$result_trees{'sample_utf8'}{'contents'}[4]{'contents'}[7]{'contents'}[0]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[4]{'contents'}[7];
$result_trees{'sample_utf8'}{'contents'}[4]{'contents'}[7]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[4]{'contents'}[7]{'contents'}[1];
$result_trees{'sample_utf8'}{'contents'}[4]{'contents'}[7]{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[4]{'contents'}[7]{'contents'}[1]{'contents'}[1];
$result_trees{'sample_utf8'}{'contents'}[4]{'contents'}[7]{'contents'}[1]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[4]{'contents'}[7]{'contents'}[1]{'contents'}[1];
$result_trees{'sample_utf8'}{'contents'}[4]{'contents'}[7]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[4]{'contents'}[7]{'contents'}[1];
$result_trees{'sample_utf8'}{'contents'}[4]{'contents'}[7]{'contents'}[1]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[4]{'contents'}[7];
$result_trees{'sample_utf8'}{'contents'}[4]{'contents'}[7]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[4]{'contents'}[7]{'contents'}[2]{'args'}[0];
$result_trees{'sample_utf8'}{'contents'}[4]{'contents'}[7]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[4]{'contents'}[7]{'contents'}[2];
$result_trees{'sample_utf8'}{'contents'}[4]{'contents'}[7]{'contents'}[2]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[4]{'contents'}[7];
$result_trees{'sample_utf8'}{'contents'}[4]{'contents'}[7]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[4];
$result_trees{'sample_utf8'}{'contents'}[4]{'contents'}[8]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[4];
$result_trees{'sample_utf8'}{'contents'}[4]{'parent'} = $result_trees{'sample_utf8'};
$result_trees{'sample_utf8'}{'contents'}[5]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[5]{'args'}[0];
$result_trees{'sample_utf8'}{'contents'}[5]{'args'}[0]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[5];
$result_trees{'sample_utf8'}{'contents'}[5]{'extra'}{'node_content'}[0] = $result_trees{'sample_utf8'}{'contents'}[5]{'args'}[0]{'contents'}[0];
$result_trees{'sample_utf8'}{'contents'}[5]{'extra'}{'nodes_manuals'}[0]{'node_content'}[0] = $result_trees{'sample_utf8'}{'contents'}[5]{'args'}[0]{'contents'}[0];
$result_trees{'sample_utf8'}{'contents'}[5]{'parent'} = $result_trees{'sample_utf8'};
$result_trees{'sample_utf8'}{'contents'}[6]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[6]{'args'}[0];
$result_trees{'sample_utf8'}{'contents'}[6]{'args'}[0]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[6];
$result_trees{'sample_utf8'}{'contents'}[6]{'contents'}[0]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[6];
$result_trees{'sample_utf8'}{'contents'}[6]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[6]{'contents'}[1];
$result_trees{'sample_utf8'}{'contents'}[6]{'contents'}[1]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[6];
$result_trees{'sample_utf8'}{'contents'}[6]{'contents'}[2]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[6];
$result_trees{'sample_utf8'}{'contents'}[6]{'parent'} = $result_trees{'sample_utf8'};
$result_trees{'sample_utf8'}{'contents'}[7]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[7]{'args'}[0];
$result_trees{'sample_utf8'}{'contents'}[7]{'args'}[0]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[7];
$result_trees{'sample_utf8'}{'contents'}[7]{'extra'}{'node_content'}[0] = $result_trees{'sample_utf8'}{'contents'}[7]{'args'}[0]{'contents'}[0];
$result_trees{'sample_utf8'}{'contents'}[7]{'extra'}{'nodes_manuals'}[0]{'node_content'}[0] = $result_trees{'sample_utf8'}{'contents'}[7]{'args'}[0]{'contents'}[0];
$result_trees{'sample_utf8'}{'contents'}[7]{'parent'} = $result_trees{'sample_utf8'};
$result_trees{'sample_utf8'}{'contents'}[8]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[8]{'args'}[0];
$result_trees{'sample_utf8'}{'contents'}[8]{'args'}[0]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[8];
$result_trees{'sample_utf8'}{'contents'}[8]{'contents'}[0]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[8];
$result_trees{'sample_utf8'}{'contents'}[8]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[8]{'contents'}[1]{'args'}[0];
$result_trees{'sample_utf8'}{'contents'}[8]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[8]{'contents'}[1];
$result_trees{'sample_utf8'}{'contents'}[8]{'contents'}[1]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[8];
$result_trees{'sample_utf8'}{'contents'}[8]{'contents'}[2]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[8];
$result_trees{'sample_utf8'}{'contents'}[8]{'parent'} = $result_trees{'sample_utf8'};
$result_trees{'sample_utf8'}{'contents'}[9]{'args'}[0]{'parent'} = $result_trees{'sample_utf8'}{'contents'}[9];
$result_trees{'sample_utf8'}{'contents'}[9]{'parent'} = $result_trees{'sample_utf8'};

$result_texis{'sample_utf8'} = '\\input texinfo   @c -*-texinfo-*-
@c %**start of header
@setfilename sample_utf8.info
@settitle Sample 示例 ĄĘ ù
@documentencoding UTF-8
@c %**end of header

@copying
This is a short example of a complete Texinfo file.

Copyright (C) 2005 Someone.
Texinfo中文示例
@end copying

@titlepage
@title 标题示例 ĄĘ ae ąę Â ù
@page
Texinfo中文示例
@vskip 0pt plus 1filll
@insertcopying
@end titlepage

@c Output the table of the contents at the beginning.
@contents

@node Top
@top Texinfo中文示例

@insertcopying

@menu
* 第一章（First Chapter）:: 这是此示例文档的第一章
                           (with mixed cjk & latin char title)
* Second Chapter AE ĄĘ ae ąę::  this is chapter 2. AE ĄĘ ae ąę
* Index node::    Complete index.
@end menu


@node 第一章（First Chapter）
@chapter 第一章（First Chapter）

@cindex chapter, first

This is the first chapter. 这是第一章。
@cindex 另一个，index entry
@cindex ĄĘ ae ąę
@cindex é Â

Here is a numbered list.

@enumerate
@item 第
This is the first item.

@item ĄĘ
This is the second item.
@end enumerate

@node Second Chapter AE ĄĘ ae ąę
@chapter Chapter 2 AE ĄĘ ae ąę

Zażółć gęślą jaźń!

@node Index node
@unnumbered Index

@printindex cp

@bye
';


$result_texts{'sample_utf8'} = '



Texinfo中文示例
***************


* 第一章（First Chapter）:: 这是此示例文档的第一章
                           (with mixed cjk & latin char title)
* Second Chapter AE ĄĘ ae ąę::  this is chapter 2. AE ĄĘ ae ąę
* Index node::    Complete index.


1 第一章（First Chapter）
*************************


This is the first chapter. 这是第一章。

Here is a numbered list.

1. 第
This is the first item.

2. ĄĘ
This is the second item.

2 Chapter 2 AE ĄĘ ae ąę
***********************

Zażółć gęślą jaźń!

Index
*****


';

$result_sectioning{'sample_utf8'} = {
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
                    'normalized' => '_7b2c_4e00_7ae0_ff08First-Chapter_ff09'
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
            },
            {
              'cmdname' => 'chapter',
              'extra' => {
                'associated_node' => {
                  'cmdname' => 'node',
                  'extra' => {
                    'normalized' => 'Second-Chapter-AE-_0104_0118-ae-_0105_0119'
                  },
                  'structure' => {}
                }
              },
              'structure' => {
                'section_level' => 1,
                'section_number' => 2,
                'section_prev' => {},
                'section_up' => {},
                'toplevel_prev' => {},
                'toplevel_up' => {}
              }
            },
            {
              'cmdname' => 'unnumbered',
              'extra' => {
                'associated_node' => {
                  'cmdname' => 'node',
                  'extra' => {
                    'isindex' => 1,
                    'normalized' => 'Index-node'
                  },
                  'structure' => {}
                }
              },
              'structure' => {
                'section_level' => 1,
                'section_prev' => {},
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
$result_sectioning{'sample_utf8'}{'structure'}{'section_childs'}[0]{'structure'}{'section_childs'}[0]{'structure'}{'section_up'} = $result_sectioning{'sample_utf8'}{'structure'}{'section_childs'}[0];
$result_sectioning{'sample_utf8'}{'structure'}{'section_childs'}[0]{'structure'}{'section_childs'}[0]{'structure'}{'toplevel_prev'} = $result_sectioning{'sample_utf8'}{'structure'}{'section_childs'}[0];
$result_sectioning{'sample_utf8'}{'structure'}{'section_childs'}[0]{'structure'}{'section_childs'}[0]{'structure'}{'toplevel_up'} = $result_sectioning{'sample_utf8'}{'structure'}{'section_childs'}[0];
$result_sectioning{'sample_utf8'}{'structure'}{'section_childs'}[0]{'structure'}{'section_childs'}[1]{'structure'}{'section_prev'} = $result_sectioning{'sample_utf8'}{'structure'}{'section_childs'}[0]{'structure'}{'section_childs'}[0];
$result_sectioning{'sample_utf8'}{'structure'}{'section_childs'}[0]{'structure'}{'section_childs'}[1]{'structure'}{'section_up'} = $result_sectioning{'sample_utf8'}{'structure'}{'section_childs'}[0];
$result_sectioning{'sample_utf8'}{'structure'}{'section_childs'}[0]{'structure'}{'section_childs'}[1]{'structure'}{'toplevel_prev'} = $result_sectioning{'sample_utf8'}{'structure'}{'section_childs'}[0]{'structure'}{'section_childs'}[0];
$result_sectioning{'sample_utf8'}{'structure'}{'section_childs'}[0]{'structure'}{'section_childs'}[1]{'structure'}{'toplevel_up'} = $result_sectioning{'sample_utf8'}{'structure'}{'section_childs'}[0];
$result_sectioning{'sample_utf8'}{'structure'}{'section_childs'}[0]{'structure'}{'section_childs'}[2]{'structure'}{'section_prev'} = $result_sectioning{'sample_utf8'}{'structure'}{'section_childs'}[0]{'structure'}{'section_childs'}[1];
$result_sectioning{'sample_utf8'}{'structure'}{'section_childs'}[0]{'structure'}{'section_childs'}[2]{'structure'}{'section_up'} = $result_sectioning{'sample_utf8'}{'structure'}{'section_childs'}[0];
$result_sectioning{'sample_utf8'}{'structure'}{'section_childs'}[0]{'structure'}{'section_childs'}[2]{'structure'}{'toplevel_prev'} = $result_sectioning{'sample_utf8'}{'structure'}{'section_childs'}[0]{'structure'}{'section_childs'}[1];
$result_sectioning{'sample_utf8'}{'structure'}{'section_childs'}[0]{'structure'}{'section_childs'}[2]{'structure'}{'toplevel_up'} = $result_sectioning{'sample_utf8'}{'structure'}{'section_childs'}[0];
$result_sectioning{'sample_utf8'}{'structure'}{'section_childs'}[0]{'structure'}{'section_up'} = $result_sectioning{'sample_utf8'};

$result_nodes{'sample_utf8'} = {
  'cmdname' => 'node',
  'extra' => {
    'associated_section' => {
      'cmdname' => 'top',
      'extra' => {},
      'structure' => {}
    },
    'menus' => [
      {
        'cmdname' => 'menu'
      }
    ],
    'normalized' => 'Top'
  },
  'structure' => {
    'menu_child' => {
      'cmdname' => 'node',
      'extra' => {
        'associated_section' => {
          'cmdname' => 'chapter',
          'extra' => {},
          'structure' => {
            'section_number' => 1
          }
        },
        'normalized' => '_7b2c_4e00_7ae0_ff08First-Chapter_ff09'
      },
      'structure' => {
        'node_next' => {
          'cmdname' => 'node',
          'extra' => {
            'associated_section' => {
              'cmdname' => 'chapter',
              'extra' => {},
              'structure' => {
                'section_number' => 2
              }
            },
            'normalized' => 'Second-Chapter-AE-_0104_0118-ae-_0105_0119'
          },
          'structure' => {
            'node_next' => {
              'cmdname' => 'node',
              'extra' => {
                'associated_section' => {
                  'cmdname' => 'unnumbered',
                  'extra' => {},
                  'structure' => {}
                },
                'isindex' => 1,
                'normalized' => 'Index-node'
              },
              'structure' => {
                'node_prev' => {},
                'node_up' => {}
              }
            },
            'node_prev' => {},
            'node_up' => {}
          }
        },
        'node_prev' => {},
        'node_up' => {}
      }
    },
    'node_next' => {}
  }
};
$result_nodes{'sample_utf8'}{'structure'}{'menu_child'}{'structure'}{'node_next'}{'structure'}{'node_next'}{'structure'}{'node_prev'} = $result_nodes{'sample_utf8'}{'structure'}{'menu_child'}{'structure'}{'node_next'};
$result_nodes{'sample_utf8'}{'structure'}{'menu_child'}{'structure'}{'node_next'}{'structure'}{'node_next'}{'structure'}{'node_up'} = $result_nodes{'sample_utf8'};
$result_nodes{'sample_utf8'}{'structure'}{'menu_child'}{'structure'}{'node_next'}{'structure'}{'node_prev'} = $result_nodes{'sample_utf8'}{'structure'}{'menu_child'};
$result_nodes{'sample_utf8'}{'structure'}{'menu_child'}{'structure'}{'node_next'}{'structure'}{'node_up'} = $result_nodes{'sample_utf8'};
$result_nodes{'sample_utf8'}{'structure'}{'menu_child'}{'structure'}{'node_prev'} = $result_nodes{'sample_utf8'};
$result_nodes{'sample_utf8'}{'structure'}{'menu_child'}{'structure'}{'node_up'} = $result_nodes{'sample_utf8'};
$result_nodes{'sample_utf8'}{'structure'}{'node_next'} = $result_nodes{'sample_utf8'}{'structure'}{'menu_child'};

$result_menus{'sample_utf8'} = {
  'cmdname' => 'node',
  'extra' => {
    'normalized' => 'Top'
  },
  'structure' => {
    'menu_child' => {
      'cmdname' => 'node',
      'extra' => {
        'normalized' => '_7b2c_4e00_7ae0_ff08First-Chapter_ff09'
      },
      'structure' => {
        'menu_next' => {
          'cmdname' => 'node',
          'extra' => {
            'normalized' => 'Second-Chapter-AE-_0104_0118-ae-_0105_0119'
          },
          'structure' => {
            'menu_next' => {
              'cmdname' => 'node',
              'extra' => {
                'isindex' => 1,
                'normalized' => 'Index-node'
              },
              'structure' => {
                'menu_prev' => {},
                'menu_up' => {},
                'menu_up_hash' => {
                  'Top' => 1
                }
              }
            },
            'menu_prev' => {},
            'menu_up' => {},
            'menu_up_hash' => {
              'Top' => 1
            }
          }
        },
        'menu_up' => {},
        'menu_up_hash' => {
          'Top' => 1
        }
      }
    }
  }
};
$result_menus{'sample_utf8'}{'structure'}{'menu_child'}{'structure'}{'menu_next'}{'structure'}{'menu_next'}{'structure'}{'menu_prev'} = $result_menus{'sample_utf8'}{'structure'}{'menu_child'}{'structure'}{'menu_next'};
$result_menus{'sample_utf8'}{'structure'}{'menu_child'}{'structure'}{'menu_next'}{'structure'}{'menu_next'}{'structure'}{'menu_up'} = $result_menus{'sample_utf8'};
$result_menus{'sample_utf8'}{'structure'}{'menu_child'}{'structure'}{'menu_next'}{'structure'}{'menu_prev'} = $result_menus{'sample_utf8'}{'structure'}{'menu_child'};
$result_menus{'sample_utf8'}{'structure'}{'menu_child'}{'structure'}{'menu_next'}{'structure'}{'menu_up'} = $result_menus{'sample_utf8'};
$result_menus{'sample_utf8'}{'structure'}{'menu_child'}{'structure'}{'menu_up'} = $result_menus{'sample_utf8'};

$result_errors{'sample_utf8'} = [];


$result_floats{'sample_utf8'} = {};


$result_indices_sort_strings{'sample_utf8'} = {
  'cp' => [
    'chapter, first',
    "\x{e9} \x{c2}",
    "\x{104}\x{118} ae \x{105}\x{119}",
    "\x{53e6}\x{4e00}\x{4e2a}\x{ff0c}index entry"
  ]
};


1;
