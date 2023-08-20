use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'topic_guide'} = {
  'contents' => [
    {
      'contents' => [
        {
          'contents' => [
            {
              'text' => '\\input texinfo.tex
',
              'type' => 'text_before_beginning'
            },
            {
              'text' => '
',
              'type' => 'text_before_beginning'
            }
          ],
          'type' => 'preamble_before_beginning'
        },
        {
          'type' => 'preamble_before_content'
        }
      ],
      'type' => 'before_node_section'
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'text' => 'Top'
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
      'cmdname' => 'node',
      'extra' => {
        'is_target' => 1,
        'normalized' => 'Top'
      },
      'info' => {
        'spaces_before_argument' => {
          'text' => ' '
        }
      },
      'source_info' => {
        'file_name' => 'topic_guide.texi',
        'line_nr' => 3,
        'macro' => ''
      }
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'text' => 'A example quide topic collection'
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
      'cmdname' => 'top',
      'contents' => [
        {
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'contents' => [
            {
              'text' => 'This is an example of guide/topic based manual inspired by the Mallard
'
            },
            {
              'text' => 'format.
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
          'args' => [
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
          'cmdname' => 'menu',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => '* ',
                  'type' => 'menu_entry_leading_text'
                },
                {
                  'contents' => [
                    {
                      'text' => 'guide1'
                    }
                  ],
                  'extra' => {
                    'node_content' => [
                      {}
                    ],
                    'normalized' => 'guide1'
                  },
                  'type' => 'menu_entry_node'
                },
                {
                  'text' => ':: ',
                  'type' => 'menu_entry_separator'
                },
                {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'the easy way
'
                        }
                      ],
                      'type' => 'preformatted'
                    }
                  ],
                  'type' => 'menu_entry_description'
                }
              ],
              'source_info' => {
                'file_name' => 'topic_guide.texi',
                'line_nr' => 10,
                'macro' => ''
              },
              'type' => 'menu_entry'
            },
            {
              'contents' => [
                {
                  'text' => '* ',
                  'type' => 'menu_entry_leading_text'
                },
                {
                  'contents' => [
                    {
                      'text' => 'guide2'
                    }
                  ],
                  'extra' => {
                    'node_content' => [
                      {}
                    ],
                    'normalized' => 'guide2'
                  },
                  'type' => 'menu_entry_node'
                },
                {
                  'text' => ':: ',
                  'type' => 'menu_entry_separator'
                },
                {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'the perillous way
'
                        }
                      ],
                      'type' => 'preformatted'
                    }
                  ],
                  'type' => 'menu_entry_description'
                }
              ],
              'source_info' => {
                'file_name' => 'topic_guide.texi',
                'line_nr' => 11,
                'macro' => ''
              },
              'type' => 'menu_entry'
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'text' => 'menu'
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
              'cmdname' => 'end',
              'extra' => {
                'text_arg' => 'menu'
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'file_name' => 'topic_guide.texi',
                'line_nr' => 12,
                'macro' => ''
              }
            }
          ],
          'source_info' => {
            'file_name' => 'topic_guide.texi',
            'line_nr' => 9,
            'macro' => ''
          }
        },
        {
          'text' => '
',
          'type' => 'empty_line'
        }
      ],
      'extra' => {},
      'info' => {
        'spaces_before_argument' => {
          'text' => ' '
        }
      },
      'source_info' => {
        'file_name' => 'topic_guide.texi',
        'line_nr' => 4,
        'macro' => ''
      }
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'text' => 'guide1'
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
      'cmdname' => 'node',
      'extra' => {
        'is_target' => 1,
        'normalized' => 'guide1'
      },
      'info' => {
        'spaces_before_argument' => {
          'text' => ' '
        }
      },
      'source_info' => {
        'file_name' => 'topic_guide.texi',
        'line_nr' => 14,
        'macro' => ''
      }
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'text' => 'guide 1'
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
      'cmdname' => 'chapter',
      'contents' => [
        {
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'contents' => [
            {
              'text' => 'This is the guide for an easy use.
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
          'args' => [
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
          'cmdname' => 'menu',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => '* ',
                  'type' => 'menu_entry_leading_text'
                },
                {
                  'contents' => [
                    {
                      'text' => 'topic1'
                    }
                  ],
                  'extra' => {
                    'node_content' => [
                      {}
                    ],
                    'normalized' => 'topic1'
                  },
                  'type' => 'menu_entry_node'
                },
                {
                  'text' => ':: ',
                  'type' => 'menu_entry_separator'
                },
                {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'topic1 description
'
                        }
                      ],
                      'type' => 'preformatted'
                    }
                  ],
                  'type' => 'menu_entry_description'
                }
              ],
              'source_info' => {
                'file_name' => 'topic_guide.texi',
                'line_nr' => 20,
                'macro' => ''
              },
              'type' => 'menu_entry'
            },
            {
              'contents' => [
                {
                  'text' => '* ',
                  'type' => 'menu_entry_leading_text'
                },
                {
                  'contents' => [
                    {
                      'text' => 'topic2'
                    }
                  ],
                  'extra' => {
                    'node_content' => [
                      {}
                    ],
                    'normalized' => 'topic2'
                  },
                  'type' => 'menu_entry_node'
                },
                {
                  'text' => ':: ',
                  'type' => 'menu_entry_separator'
                },
                {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'topic2 description
'
                        }
                      ],
                      'type' => 'preformatted'
                    }
                  ],
                  'type' => 'menu_entry_description'
                }
              ],
              'source_info' => {
                'file_name' => 'topic_guide.texi',
                'line_nr' => 21,
                'macro' => ''
              },
              'type' => 'menu_entry'
            },
            {
              'contents' => [
                {
                  'text' => '* ',
                  'type' => 'menu_entry_leading_text'
                },
                {
                  'contents' => [
                    {
                      'text' => 'topic5'
                    }
                  ],
                  'extra' => {
                    'node_content' => [
                      {}
                    ],
                    'normalized' => 'topic5'
                  },
                  'type' => 'menu_entry_node'
                },
                {
                  'text' => ':: ',
                  'type' => 'menu_entry_separator'
                },
                {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'topic5 description
'
                        }
                      ],
                      'type' => 'preformatted'
                    }
                  ],
                  'type' => 'menu_entry_description'
                }
              ],
              'source_info' => {
                'file_name' => 'topic_guide.texi',
                'line_nr' => 22,
                'macro' => ''
              },
              'type' => 'menu_entry'
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'text' => 'menu'
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
              'cmdname' => 'end',
              'extra' => {
                'text_arg' => 'menu'
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'file_name' => 'topic_guide.texi',
                'line_nr' => 23,
                'macro' => ''
              }
            }
          ],
          'source_info' => {
            'file_name' => 'topic_guide.texi',
            'line_nr' => 19,
            'macro' => ''
          }
        },
        {
          'text' => '
',
          'type' => 'empty_line'
        }
      ],
      'extra' => {
        'section_number' => 1
      },
      'info' => {
        'spaces_before_argument' => {
          'text' => ' '
        }
      },
      'source_info' => {
        'file_name' => 'topic_guide.texi',
        'line_nr' => 15,
        'macro' => ''
      }
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'text' => 'topic1'
            }
          ],
          'type' => 'line_arg'
        },
        {
          'contents' => [
            {
              'text' => 'topic2'
            }
          ],
          'extra' => {
            'node_content' => [
              {}
            ],
            'normalized' => 'topic2'
          },
          'info' => {
            'spaces_after_argument' => {
              'text' => '
'
            },
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'type' => 'line_arg'
        }
      ],
      'cmdname' => 'node',
      'contents' => [
        {
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'contents' => [
            {
              'text' => 'This is topic 1.
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
          'args' => [
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
          'cmdname' => 'menu',
          'contents' => [
            {
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'More information
'
                    },
                    {
                      'text' => '
',
                      'type' => 'empty_line'
                    }
                  ],
                  'type' => 'preformatted'
                }
              ],
              'type' => 'menu_comment'
            },
            {
              'contents' => [
                {
                  'text' => '* ',
                  'type' => 'menu_entry_leading_text'
                },
                {
                  'contents' => [
                    {
                      'text' => 'guide1'
                    }
                  ],
                  'extra' => {
                    'node_content' => [
                      {}
                    ],
                    'normalized' => 'guide1'
                  },
                  'type' => 'menu_entry_node'
                },
                {
                  'text' => ':: ',
                  'type' => 'menu_entry_separator'
                },
                {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'guide 1
'
                        }
                      ],
                      'type' => 'preformatted'
                    }
                  ],
                  'type' => 'menu_entry_description'
                }
              ],
              'source_info' => {
                'file_name' => 'topic_guide.texi',
                'line_nr' => 32,
                'macro' => ''
              },
              'type' => 'menu_entry'
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'text' => 'menu'
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
              'cmdname' => 'end',
              'extra' => {
                'text_arg' => 'menu'
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'file_name' => 'topic_guide.texi',
                'line_nr' => 33,
                'macro' => ''
              }
            }
          ],
          'source_info' => {
            'file_name' => 'topic_guide.texi',
            'line_nr' => 29,
            'macro' => ''
          }
        },
        {
          'text' => '
',
          'type' => 'empty_line'
        }
      ],
      'extra' => {
        'is_target' => 1,
        'normalized' => 'topic1'
      },
      'info' => {
        'spaces_before_argument' => {
          'text' => ' '
        }
      },
      'source_info' => {
        'file_name' => 'topic_guide.texi',
        'line_nr' => 25,
        'macro' => ''
      }
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'text' => 'topic2'
            }
          ],
          'type' => 'line_arg'
        },
        {
          'contents' => [
            {
              'text' => 'topic3'
            }
          ],
          'extra' => {
            'node_content' => [
              {}
            ],
            'normalized' => 'topic3'
          },
          'info' => {
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'type' => 'line_arg'
        },
        {
          'contents' => [
            {
              'text' => 'topic1'
            }
          ],
          'extra' => {
            'node_content' => [
              {}
            ],
            'normalized' => 'topic1'
          },
          'info' => {
            'spaces_after_argument' => {
              'text' => '
'
            },
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'type' => 'line_arg'
        }
      ],
      'cmdname' => 'node',
      'contents' => [
        {
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'contents' => [
            {
              'text' => 'This is topic 2
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
          'args' => [
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
          'cmdname' => 'menu',
          'contents' => [
            {
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'More information
'
                    },
                    {
                      'text' => '
',
                      'type' => 'empty_line'
                    }
                  ],
                  'type' => 'preformatted'
                }
              ],
              'type' => 'menu_comment'
            },
            {
              'contents' => [
                {
                  'text' => '* ',
                  'type' => 'menu_entry_leading_text'
                },
                {
                  'contents' => [
                    {
                      'text' => 'guide1'
                    }
                  ],
                  'extra' => {
                    'node_content' => [
                      {}
                    ],
                    'normalized' => 'guide1'
                  },
                  'type' => 'menu_entry_node'
                },
                {
                  'text' => ':: ',
                  'type' => 'menu_entry_separator'
                },
                {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'guide 1
'
                        }
                      ],
                      'type' => 'preformatted'
                    }
                  ],
                  'type' => 'menu_entry_description'
                }
              ],
              'source_info' => {
                'file_name' => 'topic_guide.texi',
                'line_nr' => 42,
                'macro' => ''
              },
              'type' => 'menu_entry'
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'text' => 'menu'
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
              'cmdname' => 'end',
              'extra' => {
                'text_arg' => 'menu'
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'file_name' => 'topic_guide.texi',
                'line_nr' => 43,
                'macro' => ''
              }
            }
          ],
          'source_info' => {
            'file_name' => 'topic_guide.texi',
            'line_nr' => 39,
            'macro' => ''
          }
        },
        {
          'text' => '
',
          'type' => 'empty_line'
        }
      ],
      'extra' => {
        'is_target' => 1,
        'normalized' => 'topic2'
      },
      'info' => {
        'spaces_before_argument' => {
          'text' => ' '
        }
      },
      'source_info' => {
        'file_name' => 'topic_guide.texi',
        'line_nr' => 35,
        'macro' => ''
      }
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'text' => 'topic3'
            }
          ],
          'type' => 'line_arg'
        },
        {
          'contents' => [
            {
              'text' => 'topic5'
            }
          ],
          'extra' => {
            'node_content' => [
              {}
            ],
            'normalized' => 'topic5'
          },
          'info' => {
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'type' => 'line_arg'
        },
        {
          'contents' => [
            {
              'text' => 'topic2'
            }
          ],
          'extra' => {
            'node_content' => [
              {}
            ],
            'normalized' => 'topic2'
          },
          'info' => {
            'spaces_after_argument' => {
              'text' => '
'
            },
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'type' => 'line_arg'
        }
      ],
      'cmdname' => 'node',
      'contents' => [
        {
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'contents' => [
            {
              'text' => 'This is topic 3
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
          'args' => [
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
          'cmdname' => 'menu',
          'contents' => [
            {
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'More information
'
                    },
                    {
                      'text' => '
',
                      'type' => 'empty_line'
                    }
                  ],
                  'type' => 'preformatted'
                }
              ],
              'type' => 'menu_comment'
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'text' => 'menu'
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
              'cmdname' => 'end',
              'extra' => {
                'text_arg' => 'menu'
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'file_name' => 'topic_guide.texi',
                'line_nr' => 52,
                'macro' => ''
              }
            }
          ],
          'source_info' => {
            'file_name' => 'topic_guide.texi',
            'line_nr' => 49,
            'macro' => ''
          }
        },
        {
          'text' => '
',
          'type' => 'empty_line'
        }
      ],
      'extra' => {
        'is_target' => 1,
        'normalized' => 'topic3'
      },
      'info' => {
        'spaces_before_argument' => {
          'text' => ' '
        }
      },
      'source_info' => {
        'file_name' => 'topic_guide.texi',
        'line_nr' => 45,
        'macro' => ''
      }
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'text' => 'topic4'
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
      'cmdname' => 'node',
      'contents' => [
        {
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'contents' => [
            {
              'text' => 'This is topic 4
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
          'args' => [
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
          'cmdname' => 'menu',
          'contents' => [
            {
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'More information
'
                    },
                    {
                      'text' => '
',
                      'type' => 'empty_line'
                    }
                  ],
                  'type' => 'preformatted'
                }
              ],
              'type' => 'menu_comment'
            },
            {
              'contents' => [
                {
                  'text' => '* ',
                  'type' => 'menu_entry_leading_text'
                },
                {
                  'contents' => [
                    {
                      'text' => 'guide2'
                    }
                  ],
                  'extra' => {
                    'node_content' => [
                      {}
                    ],
                    'normalized' => 'guide2'
                  },
                  'type' => 'menu_entry_node'
                },
                {
                  'text' => ':: ',
                  'type' => 'menu_entry_separator'
                },
                {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'guide 2
'
                        }
                      ],
                      'type' => 'preformatted'
                    }
                  ],
                  'type' => 'menu_entry_description'
                }
              ],
              'source_info' => {
                'file_name' => 'topic_guide.texi',
                'line_nr' => 61,
                'macro' => ''
              },
              'type' => 'menu_entry'
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'text' => 'menu'
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
              'cmdname' => 'end',
              'extra' => {
                'text_arg' => 'menu'
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'file_name' => 'topic_guide.texi',
                'line_nr' => 62,
                'macro' => ''
              }
            }
          ],
          'source_info' => {
            'file_name' => 'topic_guide.texi',
            'line_nr' => 58,
            'macro' => ''
          }
        },
        {
          'text' => '
',
          'type' => 'empty_line'
        }
      ],
      'extra' => {
        'is_target' => 1,
        'normalized' => 'topic4'
      },
      'info' => {
        'spaces_before_argument' => {
          'text' => ' '
        }
      },
      'source_info' => {
        'file_name' => 'topic_guide.texi',
        'line_nr' => 54,
        'macro' => ''
      }
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'text' => 'topic5'
            }
          ],
          'type' => 'line_arg'
        },
        {
          'info' => {
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'type' => 'line_arg'
        },
        {
          'contents' => [
            {
              'text' => 'topic3'
            }
          ],
          'extra' => {
            'node_content' => [
              {}
            ],
            'normalized' => 'topic3'
          },
          'info' => {
            'spaces_after_argument' => {
              'text' => '
'
            },
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'type' => 'line_arg'
        }
      ],
      'cmdname' => 'node',
      'contents' => [
        {
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'contents' => [
            {
              'text' => 'This is topic 5
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
          'args' => [
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
          'cmdname' => 'menu',
          'contents' => [
            {
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'More information
'
                    },
                    {
                      'text' => '
',
                      'type' => 'empty_line'
                    }
                  ],
                  'type' => 'preformatted'
                }
              ],
              'type' => 'menu_comment'
            },
            {
              'contents' => [
                {
                  'text' => '* ',
                  'type' => 'menu_entry_leading_text'
                },
                {
                  'contents' => [
                    {
                      'text' => 'guide1'
                    }
                  ],
                  'extra' => {
                    'node_content' => [
                      {}
                    ],
                    'normalized' => 'guide1'
                  },
                  'type' => 'menu_entry_node'
                },
                {
                  'text' => ':: ',
                  'type' => 'menu_entry_separator'
                },
                {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'guide 1
'
                        }
                      ],
                      'type' => 'preformatted'
                    }
                  ],
                  'type' => 'menu_entry_description'
                }
              ],
              'source_info' => {
                'file_name' => 'topic_guide.texi',
                'line_nr' => 71,
                'macro' => ''
              },
              'type' => 'menu_entry'
            },
            {
              'contents' => [
                {
                  'text' => '* ',
                  'type' => 'menu_entry_leading_text'
                },
                {
                  'contents' => [
                    {
                      'text' => 'guide2'
                    }
                  ],
                  'extra' => {
                    'node_content' => [
                      {}
                    ],
                    'normalized' => 'guide2'
                  },
                  'type' => 'menu_entry_node'
                },
                {
                  'text' => ':: ',
                  'type' => 'menu_entry_separator'
                },
                {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'guide 2
'
                        }
                      ],
                      'type' => 'preformatted'
                    }
                  ],
                  'type' => 'menu_entry_description'
                }
              ],
              'source_info' => {
                'file_name' => 'topic_guide.texi',
                'line_nr' => 72,
                'macro' => ''
              },
              'type' => 'menu_entry'
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'text' => 'menu'
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
              'cmdname' => 'end',
              'extra' => {
                'text_arg' => 'menu'
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'file_name' => 'topic_guide.texi',
                'line_nr' => 73,
                'macro' => ''
              }
            }
          ],
          'source_info' => {
            'file_name' => 'topic_guide.texi',
            'line_nr' => 68,
            'macro' => ''
          }
        },
        {
          'text' => '
',
          'type' => 'empty_line'
        }
      ],
      'extra' => {
        'is_target' => 1,
        'normalized' => 'topic5'
      },
      'info' => {
        'spaces_before_argument' => {
          'text' => ' '
        }
      },
      'source_info' => {
        'file_name' => 'topic_guide.texi',
        'line_nr' => 64,
        'macro' => ''
      }
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'text' => 'guide2'
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
      'cmdname' => 'node',
      'extra' => {
        'is_target' => 1,
        'normalized' => 'guide2'
      },
      'info' => {
        'spaces_before_argument' => {
          'text' => ' '
        }
      },
      'source_info' => {
        'file_name' => 'topic_guide.texi',
        'line_nr' => 75,
        'macro' => ''
      }
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'text' => 'guide 2'
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
      'cmdname' => 'chapter',
      'contents' => [
        {
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'contents' => [
            {
              'text' => 'This is the guide for an in depth use
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
          'args' => [
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
          'cmdname' => 'menu',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => '* ',
                  'type' => 'menu_entry_leading_text'
                },
                {
                  'contents' => [
                    {
                      'text' => 'topic5'
                    }
                  ],
                  'extra' => {
                    'node_content' => [
                      {}
                    ],
                    'normalized' => 'topic5'
                  },
                  'type' => 'menu_entry_node'
                },
                {
                  'text' => ':: ',
                  'type' => 'menu_entry_separator'
                },
                {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'topic5 description
'
                        }
                      ],
                      'type' => 'preformatted'
                    }
                  ],
                  'type' => 'menu_entry_description'
                }
              ],
              'source_info' => {
                'file_name' => 'topic_guide.texi',
                'line_nr' => 81,
                'macro' => ''
              },
              'type' => 'menu_entry'
            },
            {
              'contents' => [
                {
                  'text' => '* ',
                  'type' => 'menu_entry_leading_text'
                },
                {
                  'contents' => [
                    {
                      'text' => 'topic4'
                    }
                  ],
                  'extra' => {
                    'node_content' => [
                      {}
                    ],
                    'normalized' => 'topic4'
                  },
                  'type' => 'menu_entry_node'
                },
                {
                  'text' => ':: ',
                  'type' => 'menu_entry_separator'
                },
                {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'topic4 description
'
                        }
                      ],
                      'type' => 'preformatted'
                    }
                  ],
                  'type' => 'menu_entry_description'
                }
              ],
              'source_info' => {
                'file_name' => 'topic_guide.texi',
                'line_nr' => 82,
                'macro' => ''
              },
              'type' => 'menu_entry'
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'text' => 'menu'
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
              'cmdname' => 'end',
              'extra' => {
                'text_arg' => 'menu'
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'file_name' => 'topic_guide.texi',
                'line_nr' => 83,
                'macro' => ''
              }
            }
          ],
          'source_info' => {
            'file_name' => 'topic_guide.texi',
            'line_nr' => 80,
            'macro' => ''
          }
        },
        {
          'text' => '
',
          'type' => 'empty_line'
        }
      ],
      'extra' => {
        'section_number' => 2
      },
      'info' => {
        'spaces_before_argument' => {
          'text' => ' '
        }
      },
      'source_info' => {
        'file_name' => 'topic_guide.texi',
        'line_nr' => 76,
        'macro' => ''
      }
    },
    {
      'args' => [
        {
          'text' => '
',
          'type' => 'rawline_arg'
        }
      ],
      'cmdname' => 'bye'
    }
  ],
  'type' => 'document_root'
};
$result_trees{'topic_guide'}{'contents'}[2]{'contents'}[3]{'contents'}[0]{'contents'}[1]{'extra'}{'node_content'}[0] = $result_trees{'topic_guide'}{'contents'}[2]{'contents'}[3]{'contents'}[0]{'contents'}[1]{'contents'}[0];
$result_trees{'topic_guide'}{'contents'}[2]{'contents'}[3]{'contents'}[1]{'contents'}[1]{'extra'}{'node_content'}[0] = $result_trees{'topic_guide'}{'contents'}[2]{'contents'}[3]{'contents'}[1]{'contents'}[1]{'contents'}[0];
$result_trees{'topic_guide'}{'contents'}[4]{'contents'}[3]{'contents'}[0]{'contents'}[1]{'extra'}{'node_content'}[0] = $result_trees{'topic_guide'}{'contents'}[4]{'contents'}[3]{'contents'}[0]{'contents'}[1]{'contents'}[0];
$result_trees{'topic_guide'}{'contents'}[4]{'contents'}[3]{'contents'}[1]{'contents'}[1]{'extra'}{'node_content'}[0] = $result_trees{'topic_guide'}{'contents'}[4]{'contents'}[3]{'contents'}[1]{'contents'}[1]{'contents'}[0];
$result_trees{'topic_guide'}{'contents'}[4]{'contents'}[3]{'contents'}[2]{'contents'}[1]{'extra'}{'node_content'}[0] = $result_trees{'topic_guide'}{'contents'}[4]{'contents'}[3]{'contents'}[2]{'contents'}[1]{'contents'}[0];
$result_trees{'topic_guide'}{'contents'}[5]{'args'}[1]{'extra'}{'node_content'}[0] = $result_trees{'topic_guide'}{'contents'}[5]{'args'}[1]{'contents'}[0];
$result_trees{'topic_guide'}{'contents'}[5]{'contents'}[3]{'contents'}[1]{'contents'}[1]{'extra'}{'node_content'}[0] = $result_trees{'topic_guide'}{'contents'}[5]{'contents'}[3]{'contents'}[1]{'contents'}[1]{'contents'}[0];
$result_trees{'topic_guide'}{'contents'}[6]{'args'}[1]{'extra'}{'node_content'}[0] = $result_trees{'topic_guide'}{'contents'}[6]{'args'}[1]{'contents'}[0];
$result_trees{'topic_guide'}{'contents'}[6]{'args'}[2]{'extra'}{'node_content'}[0] = $result_trees{'topic_guide'}{'contents'}[6]{'args'}[2]{'contents'}[0];
$result_trees{'topic_guide'}{'contents'}[6]{'contents'}[3]{'contents'}[1]{'contents'}[1]{'extra'}{'node_content'}[0] = $result_trees{'topic_guide'}{'contents'}[6]{'contents'}[3]{'contents'}[1]{'contents'}[1]{'contents'}[0];
$result_trees{'topic_guide'}{'contents'}[7]{'args'}[1]{'extra'}{'node_content'}[0] = $result_trees{'topic_guide'}{'contents'}[7]{'args'}[1]{'contents'}[0];
$result_trees{'topic_guide'}{'contents'}[7]{'args'}[2]{'extra'}{'node_content'}[0] = $result_trees{'topic_guide'}{'contents'}[7]{'args'}[2]{'contents'}[0];
$result_trees{'topic_guide'}{'contents'}[8]{'contents'}[3]{'contents'}[1]{'contents'}[1]{'extra'}{'node_content'}[0] = $result_trees{'topic_guide'}{'contents'}[8]{'contents'}[3]{'contents'}[1]{'contents'}[1]{'contents'}[0];
$result_trees{'topic_guide'}{'contents'}[9]{'args'}[2]{'extra'}{'node_content'}[0] = $result_trees{'topic_guide'}{'contents'}[9]{'args'}[2]{'contents'}[0];
$result_trees{'topic_guide'}{'contents'}[9]{'contents'}[3]{'contents'}[1]{'contents'}[1]{'extra'}{'node_content'}[0] = $result_trees{'topic_guide'}{'contents'}[9]{'contents'}[3]{'contents'}[1]{'contents'}[1]{'contents'}[0];
$result_trees{'topic_guide'}{'contents'}[9]{'contents'}[3]{'contents'}[2]{'contents'}[1]{'extra'}{'node_content'}[0] = $result_trees{'topic_guide'}{'contents'}[9]{'contents'}[3]{'contents'}[2]{'contents'}[1]{'contents'}[0];
$result_trees{'topic_guide'}{'contents'}[11]{'contents'}[3]{'contents'}[0]{'contents'}[1]{'extra'}{'node_content'}[0] = $result_trees{'topic_guide'}{'contents'}[11]{'contents'}[3]{'contents'}[0]{'contents'}[1]{'contents'}[0];
$result_trees{'topic_guide'}{'contents'}[11]{'contents'}[3]{'contents'}[1]{'contents'}[1]{'extra'}{'node_content'}[0] = $result_trees{'topic_guide'}{'contents'}[11]{'contents'}[3]{'contents'}[1]{'contents'}[1]{'contents'}[0];

$result_texis{'topic_guide'} = '\\input texinfo.tex

@node Top
@top A example quide topic collection

This is an example of guide/topic based manual inspired by the Mallard
format.

@menu
* guide1:: the easy way
* guide2:: the perillous way
@end menu

@node guide1
@chapter guide 1

This is the guide for an easy use.

@menu
* topic1:: topic1 description
* topic2:: topic2 description
* topic5:: topic5 description
@end menu

@node topic1, topic2

This is topic 1.

@menu
More information

* guide1:: guide 1
@end menu

@node topic2, topic3, topic1

This is topic 2

@menu
More information

* guide1:: guide 1
@end menu

@node topic3, topic5, topic2

This is topic 3

@menu
More information

@end menu

@node topic4

This is topic 4

@menu
More information

* guide2:: guide 2
@end menu

@node topic5, , topic3

This is topic 5

@menu
More information

* guide1:: guide 1
* guide2:: guide 2
@end menu

@node guide2
@chapter guide 2

This is the guide for an in depth use

@menu
* topic5:: topic5 description
* topic4:: topic4 description
@end menu

@bye
';


$result_texts{'topic_guide'} = 'A example quide topic collection
********************************

This is an example of guide/topic based manual inspired by the Mallard
format.

* guide1:: the easy way
* guide2:: the perillous way

1 guide 1
*********

This is the guide for an easy use.

* topic1:: topic1 description
* topic2:: topic2 description
* topic5:: topic5 description


This is topic 1.

More information

* guide1:: guide 1


This is topic 2

More information

* guide1:: guide 1


This is topic 3

More information



This is topic 4

More information

* guide2:: guide 2


This is topic 5

More information

* guide1:: guide 1
* guide2:: guide 2

2 guide 2
*********

This is the guide for an in depth use

* topic5:: topic5 description
* topic4:: topic4 description

';

$result_sectioning{'topic_guide'} = {
  'extra' => {
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
          },
          'section_childs' => [
            {
              'cmdname' => 'chapter',
              'extra' => {
                'associated_node' => {
                  'cmdname' => 'node',
                  'extra' => {
                    'normalized' => 'guide1'
                  },
                  'structure' => {}
                },
                'section_directions' => {
                  'up' => {}
                },
                'section_level' => 1,
                'section_number' => 1,
                'toplevel_directions' => {
                  'prev' => {},
                  'up' => {}
                }
              }
            },
            {
              'cmdname' => 'chapter',
              'extra' => {
                'associated_node' => {
                  'cmdname' => 'node',
                  'extra' => {
                    'normalized' => 'guide2'
                  },
                  'structure' => {}
                },
                'section_directions' => {
                  'prev' => {},
                  'up' => {}
                },
                'section_level' => 1,
                'section_number' => 2,
                'toplevel_directions' => {
                  'prev' => {},
                  'up' => {}
                }
              }
            }
          ],
          'section_directions' => {
            'up' => {}
          },
          'section_level' => 0,
          'toplevel_directions' => {}
        }
      }
    ],
    'section_level' => -1
  }
};
$result_sectioning{'topic_guide'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[0]{'extra'}{'section_directions'}{'up'} = $result_sectioning{'topic_guide'}{'extra'}{'section_childs'}[0];
$result_sectioning{'topic_guide'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[0]{'extra'}{'toplevel_directions'}{'prev'} = $result_sectioning{'topic_guide'}{'extra'}{'section_childs'}[0];
$result_sectioning{'topic_guide'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[0]{'extra'}{'toplevel_directions'}{'up'} = $result_sectioning{'topic_guide'}{'extra'}{'section_childs'}[0];
$result_sectioning{'topic_guide'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[1]{'extra'}{'section_directions'}{'prev'} = $result_sectioning{'topic_guide'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[0];
$result_sectioning{'topic_guide'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[1]{'extra'}{'section_directions'}{'up'} = $result_sectioning{'topic_guide'}{'extra'}{'section_childs'}[0];
$result_sectioning{'topic_guide'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[1]{'extra'}{'toplevel_directions'}{'prev'} = $result_sectioning{'topic_guide'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[0];
$result_sectioning{'topic_guide'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[1]{'extra'}{'toplevel_directions'}{'up'} = $result_sectioning{'topic_guide'}{'extra'}{'section_childs'}[0];
$result_sectioning{'topic_guide'}{'extra'}{'section_childs'}[0]{'extra'}{'section_directions'}{'up'} = $result_sectioning{'topic_guide'};

$result_nodes{'topic_guide'} = {
  'cmdname' => 'node',
  'extra' => {
    'associated_section' => {
      'cmdname' => 'top',
      'extra' => {}
    },
    'menus' => [
      {
        'cmdname' => 'menu'
      }
    ],
    'node_directions' => {
      'next' => {
        'cmdname' => 'node',
        'extra' => {
          'associated_section' => {
            'cmdname' => 'chapter',
            'extra' => {
              'section_number' => 1
            }
          },
          'menus' => [
            {
              'cmdname' => 'menu'
            }
          ],
          'node_directions' => {
            'next' => {
              'cmdname' => 'node',
              'extra' => {
                'associated_section' => {
                  'cmdname' => 'chapter',
                  'extra' => {
                    'section_number' => 2
                  }
                },
                'menus' => [
                  {
                    'cmdname' => 'menu'
                  }
                ],
                'node_directions' => {
                  'prev' => {},
                  'up' => {}
                },
                'normalized' => 'guide2'
              },
              'structure' => {
                'menu_child' => {
                  'cmdname' => 'node',
                  'extra' => {
                    'menus' => [
                      {
                        'cmdname' => 'menu'
                      }
                    ],
                    'node_directions' => {
                      'prev' => {
                        'cmdname' => 'node',
                        'extra' => {
                          'menus' => [
                            {
                              'cmdname' => 'menu'
                            }
                          ],
                          'node_directions' => {
                            'next' => {},
                            'prev' => {
                              'cmdname' => 'node',
                              'extra' => {
                                'menus' => [
                                  {
                                    'cmdname' => 'menu'
                                  }
                                ],
                                'node_directions' => {
                                  'next' => {},
                                  'prev' => {
                                    'cmdname' => 'node',
                                    'extra' => {
                                      'menus' => [
                                        {
                                          'cmdname' => 'menu'
                                        }
                                      ],
                                      'node_directions' => {
                                        'next' => {}
                                      },
                                      'normalized' => 'topic1'
                                    },
                                    'structure' => {
                                      'menu_child' => {}
                                    }
                                  }
                                },
                                'normalized' => 'topic2'
                              },
                              'structure' => {
                                'menu_child' => {}
                              }
                            }
                          },
                          'normalized' => 'topic3'
                        }
                      }
                    },
                    'normalized' => 'topic5'
                  },
                  'structure' => {
                    'menu_child' => {}
                  }
                }
              }
            },
            'prev' => {},
            'up' => {}
          },
          'normalized' => 'guide1'
        },
        'structure' => {
          'menu_child' => {}
        }
      }
    },
    'normalized' => 'Top'
  },
  'structure' => {
    'menu_child' => {}
  }
};
$result_nodes{'topic_guide'}{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'prev'} = $result_nodes{'topic_guide'}{'extra'}{'node_directions'}{'next'};
$result_nodes{'topic_guide'}{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'up'} = $result_nodes{'topic_guide'};
$result_nodes{'topic_guide'}{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'next'}{'structure'}{'menu_child'}{'extra'}{'node_directions'}{'prev'}{'extra'}{'node_directions'}{'next'} = $result_nodes{'topic_guide'}{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'next'}{'structure'}{'menu_child'};
$result_nodes{'topic_guide'}{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'next'}{'structure'}{'menu_child'}{'extra'}{'node_directions'}{'prev'}{'extra'}{'node_directions'}{'prev'}{'extra'}{'node_directions'}{'next'} = $result_nodes{'topic_guide'}{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'next'}{'structure'}{'menu_child'}{'extra'}{'node_directions'}{'prev'};
$result_nodes{'topic_guide'}{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'next'}{'structure'}{'menu_child'}{'extra'}{'node_directions'}{'prev'}{'extra'}{'node_directions'}{'prev'}{'extra'}{'node_directions'}{'prev'}{'extra'}{'node_directions'}{'next'} = $result_nodes{'topic_guide'}{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'next'}{'structure'}{'menu_child'}{'extra'}{'node_directions'}{'prev'}{'extra'}{'node_directions'}{'prev'};
$result_nodes{'topic_guide'}{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'next'}{'structure'}{'menu_child'}{'extra'}{'node_directions'}{'prev'}{'extra'}{'node_directions'}{'prev'}{'extra'}{'node_directions'}{'prev'}{'structure'}{'menu_child'} = $result_nodes{'topic_guide'}{'extra'}{'node_directions'}{'next'};
$result_nodes{'topic_guide'}{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'next'}{'structure'}{'menu_child'}{'extra'}{'node_directions'}{'prev'}{'extra'}{'node_directions'}{'prev'}{'structure'}{'menu_child'} = $result_nodes{'topic_guide'}{'extra'}{'node_directions'}{'next'};
$result_nodes{'topic_guide'}{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'next'}{'structure'}{'menu_child'}{'structure'}{'menu_child'} = $result_nodes{'topic_guide'}{'extra'}{'node_directions'}{'next'};
$result_nodes{'topic_guide'}{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'prev'} = $result_nodes{'topic_guide'};
$result_nodes{'topic_guide'}{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'up'} = $result_nodes{'topic_guide'};
$result_nodes{'topic_guide'}{'extra'}{'node_directions'}{'next'}{'structure'}{'menu_child'} = $result_nodes{'topic_guide'}{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'next'}{'structure'}{'menu_child'}{'extra'}{'node_directions'}{'prev'}{'extra'}{'node_directions'}{'prev'}{'extra'}{'node_directions'}{'prev'};
$result_nodes{'topic_guide'}{'structure'}{'menu_child'} = $result_nodes{'topic_guide'}{'extra'}{'node_directions'}{'next'};

$result_menus{'topic_guide'} = {
  'cmdname' => 'node',
  'extra' => {
    'normalized' => 'Top'
  },
  'structure' => {
    'menu_child' => {
      'cmdname' => 'node',
      'extra' => {
        'menu_directions' => {
          'next' => {
            'cmdname' => 'node',
            'extra' => {
              'menu_directions' => {
                'prev' => {},
                'up' => {
                  'cmdname' => 'node',
                  'extra' => {
                    'menu_directions' => {
                      'next' => {
                        'cmdname' => 'node',
                        'extra' => {
                          'menu_directions' => {
                            'prev' => {},
                            'up' => {}
                          },
                          'normalized' => 'topic4'
                        },
                        'structure' => {
                          'menu_child' => {},
                          'menu_up_hash' => {
                            'guide2' => 1
                          }
                        }
                      },
                      'prev' => {
                        'cmdname' => 'node',
                        'extra' => {
                          'menu_directions' => {
                            'next' => {},
                            'prev' => {
                              'cmdname' => 'node',
                              'extra' => {
                                'menu_directions' => {
                                  'next' => {},
                                  'up' => {}
                                },
                                'normalized' => 'topic1'
                              },
                              'structure' => {
                                'menu_child' => {},
                                'menu_up_hash' => {
                                  'guide1' => 1
                                }
                              }
                            },
                            'up' => {}
                          },
                          'normalized' => 'topic2'
                        },
                        'structure' => {
                          'menu_child' => {},
                          'menu_up_hash' => {
                            'guide1' => 1
                          }
                        }
                      },
                      'up' => {}
                    },
                    'normalized' => 'topic5'
                  },
                  'structure' => {
                    'menu_child' => {},
                    'menu_up_hash' => {
                      'guide1' => 1,
                      'guide2' => 1
                    }
                  }
                }
              },
              'normalized' => 'guide2'
            },
            'structure' => {
              'menu_child' => {},
              'menu_up_hash' => {
                'Top' => 1,
                'topic4' => 1,
                'topic5' => 1
              }
            }
          },
          'up' => {}
        },
        'normalized' => 'guide1'
      },
      'structure' => {
        'menu_child' => {},
        'menu_up_hash' => {
          'Top' => 1,
          'topic1' => 1,
          'topic2' => 1,
          'topic5' => 1
        }
      }
    }
  }
};
$result_menus{'topic_guide'}{'structure'}{'menu_child'}{'extra'}{'menu_directions'}{'next'}{'extra'}{'menu_directions'}{'prev'} = $result_menus{'topic_guide'}{'structure'}{'menu_child'};
$result_menus{'topic_guide'}{'structure'}{'menu_child'}{'extra'}{'menu_directions'}{'next'}{'extra'}{'menu_directions'}{'up'}{'extra'}{'menu_directions'}{'next'}{'extra'}{'menu_directions'}{'prev'} = $result_menus{'topic_guide'}{'structure'}{'menu_child'}{'extra'}{'menu_directions'}{'next'}{'extra'}{'menu_directions'}{'up'};
$result_menus{'topic_guide'}{'structure'}{'menu_child'}{'extra'}{'menu_directions'}{'next'}{'extra'}{'menu_directions'}{'up'}{'extra'}{'menu_directions'}{'next'}{'extra'}{'menu_directions'}{'up'} = $result_menus{'topic_guide'}{'structure'}{'menu_child'}{'extra'}{'menu_directions'}{'next'};
$result_menus{'topic_guide'}{'structure'}{'menu_child'}{'extra'}{'menu_directions'}{'next'}{'extra'}{'menu_directions'}{'up'}{'extra'}{'menu_directions'}{'next'}{'structure'}{'menu_child'} = $result_menus{'topic_guide'}{'structure'}{'menu_child'}{'extra'}{'menu_directions'}{'next'};
$result_menus{'topic_guide'}{'structure'}{'menu_child'}{'extra'}{'menu_directions'}{'next'}{'extra'}{'menu_directions'}{'up'}{'extra'}{'menu_directions'}{'prev'}{'extra'}{'menu_directions'}{'next'} = $result_menus{'topic_guide'}{'structure'}{'menu_child'}{'extra'}{'menu_directions'}{'next'}{'extra'}{'menu_directions'}{'up'};
$result_menus{'topic_guide'}{'structure'}{'menu_child'}{'extra'}{'menu_directions'}{'next'}{'extra'}{'menu_directions'}{'up'}{'extra'}{'menu_directions'}{'prev'}{'extra'}{'menu_directions'}{'prev'}{'extra'}{'menu_directions'}{'next'} = $result_menus{'topic_guide'}{'structure'}{'menu_child'}{'extra'}{'menu_directions'}{'next'}{'extra'}{'menu_directions'}{'up'}{'extra'}{'menu_directions'}{'prev'};
$result_menus{'topic_guide'}{'structure'}{'menu_child'}{'extra'}{'menu_directions'}{'next'}{'extra'}{'menu_directions'}{'up'}{'extra'}{'menu_directions'}{'prev'}{'extra'}{'menu_directions'}{'prev'}{'extra'}{'menu_directions'}{'up'} = $result_menus{'topic_guide'}{'structure'}{'menu_child'};
$result_menus{'topic_guide'}{'structure'}{'menu_child'}{'extra'}{'menu_directions'}{'next'}{'extra'}{'menu_directions'}{'up'}{'extra'}{'menu_directions'}{'prev'}{'extra'}{'menu_directions'}{'prev'}{'structure'}{'menu_child'} = $result_menus{'topic_guide'}{'structure'}{'menu_child'};
$result_menus{'topic_guide'}{'structure'}{'menu_child'}{'extra'}{'menu_directions'}{'next'}{'extra'}{'menu_directions'}{'up'}{'extra'}{'menu_directions'}{'prev'}{'extra'}{'menu_directions'}{'up'} = $result_menus{'topic_guide'}{'structure'}{'menu_child'};
$result_menus{'topic_guide'}{'structure'}{'menu_child'}{'extra'}{'menu_directions'}{'next'}{'extra'}{'menu_directions'}{'up'}{'extra'}{'menu_directions'}{'prev'}{'structure'}{'menu_child'} = $result_menus{'topic_guide'}{'structure'}{'menu_child'};
$result_menus{'topic_guide'}{'structure'}{'menu_child'}{'extra'}{'menu_directions'}{'next'}{'extra'}{'menu_directions'}{'up'}{'extra'}{'menu_directions'}{'up'} = $result_menus{'topic_guide'}{'structure'}{'menu_child'}{'extra'}{'menu_directions'}{'next'};
$result_menus{'topic_guide'}{'structure'}{'menu_child'}{'extra'}{'menu_directions'}{'next'}{'extra'}{'menu_directions'}{'up'}{'structure'}{'menu_child'} = $result_menus{'topic_guide'}{'structure'}{'menu_child'};
$result_menus{'topic_guide'}{'structure'}{'menu_child'}{'extra'}{'menu_directions'}{'next'}{'structure'}{'menu_child'} = $result_menus{'topic_guide'}{'structure'}{'menu_child'}{'extra'}{'menu_directions'}{'next'}{'extra'}{'menu_directions'}{'up'};
$result_menus{'topic_guide'}{'structure'}{'menu_child'}{'extra'}{'menu_directions'}{'up'} = $result_menus{'topic_guide'}{'structure'}{'menu_child'}{'extra'}{'menu_directions'}{'next'}{'extra'}{'menu_directions'}{'up'};
$result_menus{'topic_guide'}{'structure'}{'menu_child'}{'structure'}{'menu_child'} = $result_menus{'topic_guide'}{'structure'}{'menu_child'}{'extra'}{'menu_directions'}{'next'}{'extra'}{'menu_directions'}{'up'}{'extra'}{'menu_directions'}{'prev'}{'extra'}{'menu_directions'}{'prev'};

$result_errors{'topic_guide'} = [];


$result_floats{'topic_guide'} = {};


1;
