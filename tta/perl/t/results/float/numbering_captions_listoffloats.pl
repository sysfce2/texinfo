use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'numbering_captions_listoffloats'} = {
  'contents' => [
    {
      'contents' => [
        {
          'type' => 'preamble_before_content'
        }
      ],
      'type' => 'before_node_section'
    },
    {
      'cmdname' => 'node',
      'contents' => [
        {
          'contents' => [
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
          'type' => 'arguments_line'
        }
      ],
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
        'line_nr' => 1
      }
    },
    {
      'cmdname' => 'top',
      'contents' => [
        {
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'Test floats'
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
          'type' => 'arguments_line'
        },
        {
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'cmdname' => 'float',
          'contents' => [
            {
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'Text'
                    }
                  ],
                  'type' => 'block_line_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => 'text with a lot of features'
                    }
                  ],
                  'info' => {
                    'spaces_after_argument' => {
                      'text' => '
'
                    },
                    'spaces_before_argument' => {
                      'text' => ' '
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
              'cmdname' => 'caption',
              'contents' => [
                {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'An example of float caption'
                        },
                        {
                          'cmdname' => 'enddots',
                          'contents' => [
                            {
                              'type' => 'brace_container'
                            }
                          ],
                          'source_info' => {
                            'line_nr' => 6
                          }
                        }
                      ],
                      'type' => 'paragraph'
                    }
                  ],
                  'type' => 'brace_command_context'
                }
              ],
              'extra' => {
                'float' => {}
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'line_nr' => 6
              }
            },
            {
              'text' => '
',
              'type' => 'spaces_after_close_brace'
            },
            {
              'cmdname' => 'shortcaption',
              'contents' => [
                {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'cmdname' => 'TeX',
                          'contents' => [
                            {
                              'type' => 'brace_container'
                            }
                          ],
                          'source_info' => {
                            'line_nr' => 7
                          }
                        },
                        {
                          'text' => ' and someething'
                        }
                      ],
                      'type' => 'paragraph'
                    }
                  ],
                  'type' => 'brace_command_context'
                }
              ],
              'extra' => {
                'float' => {}
              },
              'source_info' => {
                'line_nr' => 7
              }
            },
            {
              'text' => '
',
              'type' => 'spaces_after_close_brace'
            },
            {
              'cmdname' => 'end',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'float'
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
                'text_arg' => 'float'
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'line_nr' => 8
              }
            }
          ],
          'extra' => {
            'caption' => {},
            'float_section' => {},
            'float_type' => 'Text',
            'is_target' => 1,
            'normalized' => 'text-with-a-lot-of-features',
            'shortcaption' => {}
          },
          'info' => {
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'line_nr' => 4
          }
        },
        {
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'cmdname' => 'float',
          'contents' => [
            {
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'Text'
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
                  'text' => 'No label but caption and shortcaption.
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
              'cmdname' => 'caption',
              'contents' => [
                {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'C No label'
                        }
                      ],
                      'type' => 'paragraph'
                    }
                  ],
                  'type' => 'brace_command_context'
                }
              ],
              'extra' => {
                'float' => {}
              },
              'source_info' => {
                'line_nr' => 13
              }
            },
            {
              'text' => '
',
              'type' => 'spaces_after_close_brace'
            },
            {
              'cmdname' => 'shortcaption',
              'contents' => [
                {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'SC No label'
                        }
                      ],
                      'type' => 'paragraph'
                    }
                  ],
                  'type' => 'brace_command_context'
                }
              ],
              'extra' => {
                'float' => {}
              },
              'source_info' => {
                'line_nr' => 14
              }
            },
            {
              'text' => '
',
              'type' => 'spaces_after_close_brace'
            },
            {
              'cmdname' => 'end',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'float'
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
                'text_arg' => 'float'
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'line_nr' => 15
              }
            }
          ],
          'extra' => {
            'caption' => {},
            'float_section' => {},
            'float_type' => 'Text',
            'shortcaption' => {}
          },
          'info' => {
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'line_nr' => 10
          }
        },
        {
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'cmdname' => 'float',
          'contents' => [
            {
              'contents' => [
                {
                  'type' => 'block_line_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => 'label but no type'
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
                  'text' => 'No type but caption and shortcaption.
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
              'cmdname' => 'caption',
              'contents' => [
                {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'C No type'
                        }
                      ],
                      'type' => 'paragraph'
                    }
                  ],
                  'type' => 'brace_command_context'
                }
              ],
              'extra' => {
                'float' => {}
              },
              'source_info' => {
                'line_nr' => 20
              }
            },
            {
              'text' => '
',
              'type' => 'spaces_after_close_brace'
            },
            {
              'cmdname' => 'shortcaption',
              'contents' => [
                {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'SC No type'
                        }
                      ],
                      'type' => 'paragraph'
                    }
                  ],
                  'type' => 'brace_command_context'
                }
              ],
              'extra' => {
                'float' => {}
              },
              'source_info' => {
                'line_nr' => 21
              }
            },
            {
              'text' => '
',
              'type' => 'spaces_after_close_brace'
            },
            {
              'cmdname' => 'end',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'float'
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
                'text_arg' => 'float'
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'line_nr' => 22
              }
            }
          ],
          'extra' => {
            'caption' => {},
            'float_section' => {},
            'float_type' => '',
            'is_target' => 1,
            'normalized' => 'label-but-no-type',
            'shortcaption' => {}
          },
          'info' => {
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'line_nr' => 17
          }
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
          'cmdname' => 'float',
          'contents' => [
            {
              'contents' => [
                {
                  'type' => 'block_line_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => 'label but no type and no caption'
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
                  'text' => 'No type but label and no caption nor shortcaption.
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
              'cmdname' => 'end',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'float'
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
                'text_arg' => 'float'
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'line_nr' => 28
              }
            }
          ],
          'extra' => {
            'float_section' => {},
            'float_type' => '',
            'is_target' => 1,
            'normalized' => 'label-but-no-type-and-no-caption'
          },
          'info' => {
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'line_nr' => 25
          }
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
          'cmdname' => 'float',
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
              'contents' => [
                {
                  'text' => 'No label, no type, no caption no shortcaption.
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
              'cmdname' => 'end',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'float'
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
                'text_arg' => 'float'
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'line_nr' => 34
              }
            }
          ],
          'extra' => {
            'float_section' => {},
            'float_type' => ''
          },
          'source_info' => {
            'line_nr' => 31
          }
        },
        {
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'cmdname' => 'float',
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
              'contents' => [
                {
                  'text' => 'No label, no type, but caption and shortcaption.
'
                }
              ],
              'type' => 'paragraph'
            },
            {
              'cmdname' => 'caption',
              'contents' => [
                {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'C No label, no type, but caption and shortcaption.'
                        }
                      ],
                      'type' => 'paragraph'
                    }
                  ],
                  'type' => 'brace_command_context'
                }
              ],
              'extra' => {
                'float' => {}
              },
              'source_info' => {
                'line_nr' => 38
              }
            },
            {
              'text' => '
',
              'type' => 'spaces_after_close_brace'
            },
            {
              'cmdname' => 'shortcaption',
              'contents' => [
                {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'SC No label, no type, but caption and shortcaption.'
                        }
                      ],
                      'type' => 'paragraph'
                    }
                  ],
                  'type' => 'brace_command_context'
                }
              ],
              'extra' => {
                'float' => {}
              },
              'source_info' => {
                'line_nr' => 39
              }
            },
            {
              'text' => '
',
              'type' => 'spaces_after_close_brace'
            },
            {
              'cmdname' => 'end',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'float'
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
                'text_arg' => 'float'
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'line_nr' => 40
              }
            }
          ],
          'extra' => {
            'caption' => {},
            'float_section' => {},
            'float_type' => '',
            'shortcaption' => {}
          },
          'source_info' => {
            'line_nr' => 36
          }
        },
        {
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'cmdname' => 'float',
          'contents' => [
            {
              'contents' => [
                {
                  'type' => 'block_line_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => 'label but no type 2'
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
                  'text' => 'Second float with no type.
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
              'cmdname' => 'caption',
              'contents' => [
                {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'C No type 2'
                        }
                      ],
                      'type' => 'paragraph'
                    }
                  ],
                  'type' => 'brace_command_context'
                }
              ],
              'extra' => {
                'float' => {}
              },
              'source_info' => {
                'line_nr' => 45
              }
            },
            {
              'text' => '
',
              'type' => 'spaces_after_close_brace'
            },
            {
              'cmdname' => 'shortcaption',
              'contents' => [
                {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'SC No type 2'
                        }
                      ],
                      'type' => 'paragraph'
                    }
                  ],
                  'type' => 'brace_command_context'
                }
              ],
              'extra' => {
                'float' => {}
              },
              'source_info' => {
                'line_nr' => 46
              }
            },
            {
              'text' => '
',
              'type' => 'spaces_after_close_brace'
            },
            {
              'cmdname' => 'end',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'float'
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
                'text_arg' => 'float'
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'line_nr' => 47
              }
            }
          ],
          'extra' => {
            'caption' => {},
            'float_section' => {},
            'float_type' => '',
            'is_target' => 1,
            'normalized' => 'label-but-no-type-2',
            'shortcaption' => {}
          },
          'info' => {
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'line_nr' => 42
          }
        },
        {
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'cmdname' => 'float',
          'contents' => [
            {
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'Warning'
                    }
                  ],
                  'type' => 'block_line_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => 'warning in top'
                    }
                  ],
                  'info' => {
                    'spaces_after_argument' => {
                      'text' => '
'
                    },
                    'spaces_before_argument' => {
                      'text' => ' '
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
                  'text' => 'A warning
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
              'cmdname' => 'caption',
              'contents' => [
                {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'C A warning'
                        }
                      ],
                      'type' => 'paragraph'
                    }
                  ],
                  'type' => 'brace_command_context'
                }
              ],
              'extra' => {
                'float' => {}
              },
              'source_info' => {
                'line_nr' => 52
              }
            },
            {
              'text' => '
',
              'type' => 'spaces_after_close_brace'
            },
            {
              'cmdname' => 'shortcaption',
              'contents' => [
                {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'SC A warning'
                        }
                      ],
                      'type' => 'paragraph'
                    }
                  ],
                  'type' => 'brace_command_context'
                }
              ],
              'extra' => {
                'float' => {}
              },
              'source_info' => {
                'line_nr' => 53
              }
            },
            {
              'text' => '
',
              'type' => 'spaces_after_close_brace'
            },
            {
              'cmdname' => 'end',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'float'
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
                'text_arg' => 'float'
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'line_nr' => 54
              }
            }
          ],
          'extra' => {
            'caption' => {},
            'float_section' => {},
            'float_type' => 'Warning',
            'is_target' => 1,
            'normalized' => 'warning-in-top',
            'shortcaption' => {}
          },
          'info' => {
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'line_nr' => 49
          }
        },
        {
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'cmdname' => 'menu',
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
              'contents' => [
                {
                  'text' => '* ',
                  'type' => 'menu_entry_leading_text'
                },
                {
                  'contents' => [
                    {
                      'text' => 'chapter'
                    }
                  ],
                  'extra' => {
                    'node_content' => {
                      'contents' => [
                        {}
                      ]
                    },
                    'normalized' => 'chapter'
                  },
                  'type' => 'menu_entry_node'
                },
                {
                  'text' => '::',
                  'type' => 'menu_entry_separator'
                },
                {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => '
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
                'line_nr' => 57
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
                      'text' => 'Unnumbered'
                    }
                  ],
                  'extra' => {
                    'node_content' => {
                      'contents' => [
                        {}
                      ]
                    },
                    'normalized' => 'Unnumbered'
                  },
                  'type' => 'menu_entry_node'
                },
                {
                  'text' => '::',
                  'type' => 'menu_entry_separator'
                },
                {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => '
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
                'line_nr' => 58
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
                      'text' => 'Chapter with unnumbsubsec'
                    }
                  ],
                  'extra' => {
                    'node_content' => {
                      'contents' => [
                        {}
                      ]
                    },
                    'normalized' => 'Chapter-with-unnumbsubsec'
                  },
                  'type' => 'menu_entry_node'
                },
                {
                  'text' => '::',
                  'type' => 'menu_entry_separator'
                },
                {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => '
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
                'line_nr' => 59
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
                      'text' => 'Appendix for float'
                    }
                  ],
                  'extra' => {
                    'node_content' => {
                      'contents' => [
                        {}
                      ]
                    },
                    'normalized' => 'Appendix-for-float'
                  },
                  'type' => 'menu_entry_node'
                },
                {
                  'text' => '::',
                  'type' => 'menu_entry_separator'
                },
                {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => '
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
                'line_nr' => 60
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
                      'text' => 'list of floats'
                    }
                  ],
                  'extra' => {
                    'node_content' => {
                      'contents' => [
                        {}
                      ]
                    },
                    'normalized' => 'list-of-floats'
                  },
                  'type' => 'menu_entry_node'
                },
                {
                  'text' => '::',
                  'type' => 'menu_entry_separator'
                },
                {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => '
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
                'line_nr' => 61
              },
              'type' => 'menu_entry'
            },
            {
              'cmdname' => 'end',
              'contents' => [
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
              'extra' => {
                'text_arg' => 'menu'
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'line_nr' => 62
              }
            }
          ],
          'source_info' => {
            'line_nr' => 56
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
        'line_nr' => 2
      }
    },
    {
      'cmdname' => 'node',
      'contents' => [
        {
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'chapter'
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
          'type' => 'arguments_line'
        }
      ],
      'extra' => {
        'is_target' => 1,
        'normalized' => 'chapter'
      },
      'info' => {
        'spaces_before_argument' => {
          'text' => ' '
        }
      },
      'source_info' => {
        'line_nr' => 64
      }
    },
    {
      'cmdname' => 'chapter',
      'contents' => [
        {
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'A chapter'
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
          'type' => 'arguments_line'
        },
        {
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'cmdname' => 'float',
          'contents' => [
            {
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'Text'
                    }
                  ],
                  'type' => 'block_line_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => 'text in chapter'
                    }
                  ],
                  'info' => {
                    'spaces_after_argument' => {
                      'text' => '
'
                    },
                    'spaces_before_argument' => {
                      'text' => ' '
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
                  'text' => 'Text in chapter
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
              'cmdname' => 'caption',
              'contents' => [
                {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'C Text in chapter'
                        }
                      ],
                      'type' => 'paragraph'
                    }
                  ],
                  'type' => 'brace_command_context'
                }
              ],
              'extra' => {
                'float' => {}
              },
              'source_info' => {
                'line_nr' => 70
              }
            },
            {
              'text' => '
',
              'type' => 'spaces_after_close_brace'
            },
            {
              'cmdname' => 'end',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'float'
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
                'text_arg' => 'float'
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'line_nr' => 71
              }
            }
          ],
          'extra' => {
            'caption' => {},
            'float_section' => {},
            'float_type' => 'Text',
            'is_target' => 1,
            'normalized' => 'text-in-chapter'
          },
          'info' => {
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'line_nr' => 67
          }
        },
        {
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'cmdname' => 'float',
          'contents' => [
            {
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'Text'
                    }
                  ],
                  'type' => 'block_line_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => 'float with a lot of features and no shortcaption'
                    }
                  ],
                  'info' => {
                    'spaces_after_argument' => {
                      'text' => '
'
                    },
                    'spaces_before_argument' => {
                      'text' => ' '
                    }
                  },
                  'type' => 'block_line_arg'
                }
              ],
              'type' => 'arguments_line'
            },
            {
              'cmdname' => 'caption',
              'contents' => [
                {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'An example of float caption, no shortcaption'
                        },
                        {
                          'cmdname' => 'enddots',
                          'contents' => [
                            {
                              'type' => 'brace_container'
                            }
                          ],
                          'source_info' => {
                            'line_nr' => 74
                          }
                        }
                      ],
                      'type' => 'paragraph'
                    }
                  ],
                  'type' => 'brace_command_context'
                }
              ],
              'extra' => {
                'float' => {}
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'line_nr' => 74
              }
            },
            {
              'text' => '
',
              'type' => 'spaces_after_close_brace'
            },
            {
              'cmdname' => 'end',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'float'
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
                'text_arg' => 'float'
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'line_nr' => 75
              }
            }
          ],
          'extra' => {
            'caption' => {},
            'float_section' => {},
            'float_type' => 'Text',
            'is_target' => 1,
            'normalized' => 'float-with-a-lot-of-features-and-no-shortcaption'
          },
          'info' => {
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'line_nr' => 73
          }
        },
        {
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'cmdname' => 'float',
          'contents' => [
            {
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'th'
                    },
                    {
                      'cmdname' => '\'',
                      'contents' => [
                        {
                          'contents' => [
                            {
                              'text' => 'e'
                            }
                          ],
                          'type' => 'following_arg'
                        }
                      ],
                      'source_info' => {
                        'line_nr' => 77
                      }
                    },
                    {
                      'text' => 'or'
                    },
                    {
                      'cmdname' => '`',
                      'contents' => [
                        {
                          'contents' => [
                            {
                              'text' => 'e'
                            }
                          ],
                          'type' => 'following_arg'
                        }
                      ],
                      'source_info' => {
                        'line_nr' => 77
                      }
                    },
                    {
                      'text' => 'me'
                    }
                  ],
                  'type' => 'block_line_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => 'theoreme'
                    }
                  ],
                  'info' => {
                    'spaces_after_argument' => {
                      'text' => '
'
                    },
                    'spaces_before_argument' => {
                      'text' => ' '
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
                  'text' => 'A th'
                },
                {
                  'cmdname' => '\'',
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'e'
                        }
                      ],
                      'type' => 'following_arg'
                    }
                  ],
                  'source_info' => {
                    'line_nr' => 78
                  }
                },
                {
                  'text' => 'or'
                },
                {
                  'cmdname' => '`',
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'e'
                        }
                      ],
                      'type' => 'following_arg'
                    }
                  ],
                  'source_info' => {
                    'line_nr' => 78
                  }
                },
                {
                  'text' => 'me
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
              'cmdname' => 'caption',
              'contents' => [
                {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'C A th'
                        },
                        {
                          'cmdname' => '\'',
                          'contents' => [
                            {
                              'contents' => [
                                {
                                  'text' => 'e'
                                }
                              ],
                              'type' => 'following_arg'
                            }
                          ],
                          'source_info' => {
                            'line_nr' => 80
                          }
                        },
                        {
                          'text' => 'or'
                        },
                        {
                          'cmdname' => '`',
                          'contents' => [
                            {
                              'contents' => [
                                {
                                  'text' => 'e'
                                }
                              ],
                              'type' => 'following_arg'
                            }
                          ],
                          'source_info' => {
                            'line_nr' => 80
                          }
                        },
                        {
                          'text' => 'me'
                        }
                      ],
                      'type' => 'paragraph'
                    }
                  ],
                  'type' => 'brace_command_context'
                }
              ],
              'extra' => {
                'float' => {}
              },
              'source_info' => {
                'line_nr' => 80
              }
            },
            {
              'text' => '
',
              'type' => 'spaces_after_close_brace'
            },
            {
              'cmdname' => 'end',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'float'
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
                'text_arg' => 'float'
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'line_nr' => 81
              }
            }
          ],
          'extra' => {
            'caption' => {},
            'float_section' => {},
            'float_type' => "th\x{e9}or\x{e8}me",
            'is_target' => 1,
            'normalized' => 'theoreme'
          },
          'info' => {
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'line_nr' => 77
          }
        },
        {
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'cmdname' => 'float',
          'contents' => [
            {
              'contents' => [
                {
                  'type' => 'block_line_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => 'label but no type in chapter'
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
                  'text' => 'float with no type.
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
              'cmdname' => 'caption',
              'contents' => [
                {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'C No type in chapter'
                        }
                      ],
                      'type' => 'paragraph'
                    }
                  ],
                  'type' => 'brace_command_context'
                }
              ],
              'extra' => {
                'float' => {}
              },
              'source_info' => {
                'line_nr' => 86
              }
            },
            {
              'text' => '
',
              'type' => 'spaces_after_close_brace'
            },
            {
              'cmdname' => 'shortcaption',
              'contents' => [
                {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'SC No type in chapter'
                        }
                      ],
                      'type' => 'paragraph'
                    }
                  ],
                  'type' => 'brace_command_context'
                }
              ],
              'extra' => {
                'float' => {}
              },
              'source_info' => {
                'line_nr' => 87
              }
            },
            {
              'text' => '
',
              'type' => 'spaces_after_close_brace'
            },
            {
              'cmdname' => 'end',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'float'
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
                'text_arg' => 'float'
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'line_nr' => 88
              }
            }
          ],
          'extra' => {
            'caption' => {},
            'float_section' => {},
            'float_type' => '',
            'is_target' => 1,
            'normalized' => 'label-but-no-type-in-chapter',
            'shortcaption' => {}
          },
          'info' => {
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'line_nr' => 83
          }
        },
        {
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'cmdname' => 'float',
          'contents' => [
            {
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'Warning'
                    }
                  ],
                  'type' => 'block_line_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => 'warning in chapter'
                    }
                  ],
                  'info' => {
                    'spaces_after_argument' => {
                      'text' => '
'
                    },
                    'spaces_before_argument' => {
                      'text' => ' '
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
                  'text' => 'A warning
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
              'cmdname' => 'caption',
              'contents' => [
                {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'C A warning in chapter'
                        }
                      ],
                      'type' => 'paragraph'
                    }
                  ],
                  'type' => 'brace_command_context'
                }
              ],
              'extra' => {
                'float' => {}
              },
              'source_info' => {
                'line_nr' => 93
              }
            },
            {
              'text' => '
',
              'type' => 'spaces_after_close_brace'
            },
            {
              'cmdname' => 'shortcaption',
              'contents' => [
                {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'SC A warning in chapter'
                        }
                      ],
                      'type' => 'paragraph'
                    }
                  ],
                  'type' => 'brace_command_context'
                }
              ],
              'extra' => {
                'float' => {}
              },
              'source_info' => {
                'line_nr' => 94
              }
            },
            {
              'text' => '
',
              'type' => 'spaces_after_close_brace'
            },
            {
              'cmdname' => 'end',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'float'
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
                'text_arg' => 'float'
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'line_nr' => 95
              }
            }
          ],
          'extra' => {
            'caption' => {},
            'float_section' => {},
            'float_type' => 'Warning',
            'is_target' => 1,
            'normalized' => 'warning-in-chapter',
            'shortcaption' => {}
          },
          'info' => {
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'line_nr' => 90
          }
        },
        {
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'cmdname' => 'menu',
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
              'contents' => [
                {
                  'text' => '* ',
                  'type' => 'menu_entry_leading_text'
                },
                {
                  'contents' => [
                    {
                      'text' => 'section'
                    }
                  ],
                  'extra' => {
                    'node_content' => {
                      'contents' => [
                        {}
                      ]
                    },
                    'normalized' => 'section'
                  },
                  'type' => 'menu_entry_node'
                },
                {
                  'text' => '::',
                  'type' => 'menu_entry_separator'
                },
                {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => '
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
                'line_nr' => 98
              },
              'type' => 'menu_entry'
            },
            {
              'cmdname' => 'end',
              'contents' => [
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
              'extra' => {
                'text_arg' => 'menu'
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'line_nr' => 99
              }
            }
          ],
          'source_info' => {
            'line_nr' => 97
          }
        },
        {
          'text' => '
',
          'type' => 'empty_line'
        }
      ],
      'extra' => {
        'section_number' => '1'
      },
      'info' => {
        'spaces_before_argument' => {
          'text' => ' '
        }
      },
      'source_info' => {
        'line_nr' => 65
      }
    },
    {
      'cmdname' => 'node',
      'contents' => [
        {
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'section'
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
          'type' => 'arguments_line'
        }
      ],
      'extra' => {
        'is_target' => 1,
        'normalized' => 'section'
      },
      'info' => {
        'spaces_before_argument' => {
          'text' => ' '
        }
      },
      'source_info' => {
        'line_nr' => 101
      }
    },
    {
      'cmdname' => 'section',
      'contents' => [
        {
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'A section'
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
          'type' => 'arguments_line'
        },
        {
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'cmdname' => 'float',
          'contents' => [
            {
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'Text'
                    }
                  ],
                  'type' => 'block_line_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => 'text in section'
                    }
                  ],
                  'info' => {
                    'spaces_after_argument' => {
                      'text' => '
'
                    },
                    'spaces_before_argument' => {
                      'text' => ' '
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
                  'text' => 'A text in float no caption a label a type.
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
              'cmdname' => 'end',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'float'
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
                'text_arg' => 'float'
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'line_nr' => 108
              }
            }
          ],
          'extra' => {
            'float_section' => {},
            'float_type' => 'Text',
            'is_target' => 1,
            'normalized' => 'text-in-section'
          },
          'info' => {
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'line_nr' => 104
          }
        },
        {
          'text' => '
',
          'type' => 'empty_line'
        }
      ],
      'extra' => {
        'section_number' => '1.1'
      },
      'info' => {
        'spaces_before_argument' => {
          'text' => ' '
        }
      },
      'source_info' => {
        'line_nr' => 102
      }
    },
    {
      'cmdname' => 'node',
      'contents' => [
        {
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'Unnumbered'
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
          'type' => 'arguments_line'
        }
      ],
      'extra' => {
        'is_target' => 1,
        'normalized' => 'Unnumbered'
      },
      'info' => {
        'spaces_before_argument' => {
          'text' => ' '
        }
      },
      'source_info' => {
        'line_nr' => 110
      }
    },
    {
      'cmdname' => 'unnumbered',
      'contents' => [
        {
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'Unnumbered'
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
          'type' => 'arguments_line'
        },
        {
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'cmdname' => 'menu',
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
              'contents' => [
                {
                  'text' => '* ',
                  'type' => 'menu_entry_leading_text'
                },
                {
                  'contents' => [
                    {
                      'text' => 'Section within unnumbered'
                    }
                  ],
                  'extra' => {
                    'node_content' => {
                      'contents' => [
                        {}
                      ]
                    },
                    'normalized' => 'Section-within-unnumbered'
                  },
                  'type' => 'menu_entry_node'
                },
                {
                  'text' => '::',
                  'type' => 'menu_entry_separator'
                },
                {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => '
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
                'line_nr' => 114
              },
              'type' => 'menu_entry'
            },
            {
              'cmdname' => 'end',
              'contents' => [
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
              'extra' => {
                'text_arg' => 'menu'
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'line_nr' => 115
              }
            }
          ],
          'source_info' => {
            'line_nr' => 113
          }
        },
        {
          'cmdname' => 'float',
          'contents' => [
            {
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'Text'
                    }
                  ],
                  'type' => 'block_line_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => 'unnumbered float'
                    }
                  ],
                  'info' => {
                    'spaces_after_argument' => {
                      'text' => '
'
                    },
                    'spaces_before_argument' => {
                      'text' => ' '
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
                  'text' => 'unnum
'
                }
              ],
              'type' => 'paragraph'
            },
            {
              'cmdname' => 'shortcaption',
              'contents' => [
                {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'SC unnumbered float'
                        }
                      ],
                      'type' => 'paragraph'
                    }
                  ],
                  'type' => 'brace_command_context'
                }
              ],
              'extra' => {
                'float' => {}
              },
              'source_info' => {
                'line_nr' => 118
              }
            },
            {
              'text' => '
',
              'type' => 'spaces_after_close_brace'
            },
            {
              'cmdname' => 'caption',
              'contents' => [
                {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'C unnumbered float'
                        }
                      ],
                      'type' => 'paragraph'
                    }
                  ],
                  'type' => 'brace_command_context'
                }
              ],
              'extra' => {
                'float' => {}
              },
              'source_info' => {
                'line_nr' => 119
              }
            },
            {
              'text' => '
',
              'type' => 'spaces_after_close_brace'
            },
            {
              'cmdname' => 'end',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'float'
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
                'text_arg' => 'float'
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'line_nr' => 120
              }
            }
          ],
          'extra' => {
            'caption' => {},
            'float_section' => {},
            'float_type' => 'Text',
            'is_target' => 1,
            'normalized' => 'unnumbered-float',
            'shortcaption' => {}
          },
          'info' => {
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'line_nr' => 116
          }
        },
        {
          'cmdname' => 'float',
          'contents' => [
            {
              'contents' => [
                {
                  'type' => 'block_line_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => 'label but no type in unnumbered'
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
                  'text' => 'float with no type.
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
              'cmdname' => 'caption',
              'contents' => [
                {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'C No type in unnumbered'
                        }
                      ],
                      'type' => 'paragraph'
                    }
                  ],
                  'type' => 'brace_command_context'
                }
              ],
              'extra' => {
                'float' => {}
              },
              'source_info' => {
                'line_nr' => 124
              }
            },
            {
              'text' => '
',
              'type' => 'spaces_after_close_brace'
            },
            {
              'cmdname' => 'shortcaption',
              'contents' => [
                {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'SC No type in unnumbered'
                        }
                      ],
                      'type' => 'paragraph'
                    }
                  ],
                  'type' => 'brace_command_context'
                }
              ],
              'extra' => {
                'float' => {}
              },
              'source_info' => {
                'line_nr' => 125
              }
            },
            {
              'text' => '
',
              'type' => 'spaces_after_close_brace'
            },
            {
              'cmdname' => 'end',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'float'
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
                'text_arg' => 'float'
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'line_nr' => 126
              }
            }
          ],
          'extra' => {
            'caption' => {},
            'float_section' => {},
            'float_type' => '',
            'is_target' => 1,
            'normalized' => 'label-but-no-type-in-unnumbered',
            'shortcaption' => {}
          },
          'info' => {
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'line_nr' => 121
          }
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
        }
      ],
      'extra' => {},
      'info' => {
        'spaces_before_argument' => {
          'text' => ' '
        }
      },
      'source_info' => {
        'line_nr' => 111
      }
    },
    {
      'cmdname' => 'node',
      'contents' => [
        {
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'Section within unnumbered'
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
          'type' => 'arguments_line'
        }
      ],
      'extra' => {
        'is_target' => 1,
        'normalized' => 'Section-within-unnumbered'
      },
      'info' => {
        'spaces_before_argument' => {
          'text' => ' '
        }
      },
      'source_info' => {
        'line_nr' => 129
      }
    },
    {
      'cmdname' => 'section',
      'contents' => [
        {
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'Section within unnumbered'
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
          'type' => 'arguments_line'
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
          'cmdname' => 'float',
          'contents' => [
            {
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'Text'
                    }
                  ],
                  'type' => 'block_line_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => 'Section within unnumbered float'
                    }
                  ],
                  'info' => {
                    'spaces_after_argument' => {
                      'text' => '
'
                    },
                    'spaces_before_argument' => {
                      'text' => ' '
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
                  'text' => 'Section within unnumbered
'
                }
              ],
              'type' => 'paragraph'
            },
            {
              'cmdname' => 'shortcaption',
              'contents' => [
                {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'SC Section within unnumbered'
                        }
                      ],
                      'type' => 'paragraph'
                    }
                  ],
                  'type' => 'brace_command_context'
                }
              ],
              'extra' => {
                'float' => {}
              },
              'source_info' => {
                'line_nr' => 135
              }
            },
            {
              'text' => '
',
              'type' => 'spaces_after_close_brace'
            },
            {
              'cmdname' => 'caption',
              'contents' => [
                {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'C Section within unnumbered'
                        }
                      ],
                      'type' => 'paragraph'
                    }
                  ],
                  'type' => 'brace_command_context'
                }
              ],
              'extra' => {
                'float' => {}
              },
              'source_info' => {
                'line_nr' => 136
              }
            },
            {
              'text' => '
',
              'type' => 'spaces_after_close_brace'
            },
            {
              'cmdname' => 'end',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'float'
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
                'text_arg' => 'float'
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'line_nr' => 137
              }
            }
          ],
          'extra' => {
            'caption' => {},
            'float_section' => {},
            'float_type' => 'Text',
            'is_target' => 1,
            'normalized' => 'Section-within-unnumbered-float',
            'shortcaption' => {}
          },
          'info' => {
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'line_nr' => 133
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
        'line_nr' => 130
      }
    },
    {
      'cmdname' => 'node',
      'contents' => [
        {
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'Chapter with unnumbsubsec'
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
          'type' => 'arguments_line'
        }
      ],
      'extra' => {
        'is_target' => 1,
        'normalized' => 'Chapter-with-unnumbsubsec'
      },
      'info' => {
        'spaces_before_argument' => {
          'text' => ' '
        }
      },
      'source_info' => {
        'line_nr' => 139
      }
    },
    {
      'cmdname' => 'chapter',
      'contents' => [
        {
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'Chapter with unnumbsubsec'
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
          'type' => 'arguments_line'
        },
        {
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'cmdname' => 'menu',
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
              'contents' => [
                {
                  'text' => '* ',
                  'type' => 'menu_entry_leading_text'
                },
                {
                  'contents' => [
                    {
                      'text' => 'unnumbered sec'
                    }
                  ],
                  'extra' => {
                    'node_content' => {
                      'contents' => [
                        {}
                      ]
                    },
                    'normalized' => 'unnumbered-sec'
                  },
                  'type' => 'menu_entry_node'
                },
                {
                  'text' => '::',
                  'type' => 'menu_entry_separator'
                },
                {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => '
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
                'line_nr' => 143
              },
              'type' => 'menu_entry'
            },
            {
              'cmdname' => 'end',
              'contents' => [
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
              'extra' => {
                'text_arg' => 'menu'
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'line_nr' => 144
              }
            }
          ],
          'source_info' => {
            'line_nr' => 142
          }
        },
        {
          'cmdname' => 'float',
          'contents' => [
            {
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'Text'
                    }
                  ],
                  'type' => 'block_line_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => 'Chapter with subsec float'
                    }
                  ],
                  'info' => {
                    'spaces_after_argument' => {
                      'text' => '
'
                    },
                    'spaces_before_argument' => {
                      'text' => ' '
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
                  'text' => 'Chap
'
                }
              ],
              'type' => 'paragraph'
            },
            {
              'cmdname' => 'shortcaption',
              'contents' => [
                {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'SC Chapter with subsec'
                        }
                      ],
                      'type' => 'paragraph'
                    }
                  ],
                  'type' => 'brace_command_context'
                }
              ],
              'extra' => {
                'float' => {}
              },
              'source_info' => {
                'line_nr' => 147
              }
            },
            {
              'text' => '
',
              'type' => 'spaces_after_close_brace'
            },
            {
              'cmdname' => 'caption',
              'contents' => [
                {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'C Chapter with subsec'
                        }
                      ],
                      'type' => 'paragraph'
                    }
                  ],
                  'type' => 'brace_command_context'
                }
              ],
              'extra' => {
                'float' => {}
              },
              'source_info' => {
                'line_nr' => 148
              }
            },
            {
              'text' => '
',
              'type' => 'spaces_after_close_brace'
            },
            {
              'cmdname' => 'end',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'float'
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
                'text_arg' => 'float'
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'line_nr' => 149
              }
            }
          ],
          'extra' => {
            'caption' => {},
            'float_section' => {},
            'float_type' => 'Text',
            'is_target' => 1,
            'normalized' => 'Chapter-with-subsec-float',
            'shortcaption' => {}
          },
          'info' => {
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'line_nr' => 145
          }
        },
        {
          'text' => '
',
          'type' => 'empty_line'
        }
      ],
      'extra' => {
        'section_number' => '2'
      },
      'info' => {
        'spaces_before_argument' => {
          'text' => ' '
        }
      },
      'source_info' => {
        'line_nr' => 140
      }
    },
    {
      'cmdname' => 'node',
      'contents' => [
        {
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'unnumbered sec'
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
          'type' => 'arguments_line'
        }
      ],
      'extra' => {
        'is_target' => 1,
        'normalized' => 'unnumbered-sec'
      },
      'info' => {
        'spaces_before_argument' => {
          'text' => ' '
        }
      },
      'source_info' => {
        'line_nr' => 151
      }
    },
    {
      'cmdname' => 'unnumberedsec',
      'contents' => [
        {
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'unnumbered sec'
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
          'type' => 'arguments_line'
        },
        {
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'cmdname' => 'float',
          'contents' => [
            {
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'Text'
                    }
                  ],
                  'type' => 'block_line_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => 'unnumbered sec float'
                    }
                  ],
                  'info' => {
                    'spaces_after_argument' => {
                      'text' => '
'
                    },
                    'spaces_before_argument' => {
                      'text' => ' '
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
                  'text' => 'Chap
'
                }
              ],
              'type' => 'paragraph'
            },
            {
              'cmdname' => 'shortcaption',
              'contents' => [
                {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'SC unnumbered sec float'
                        }
                      ],
                      'type' => 'paragraph'
                    }
                  ],
                  'type' => 'brace_command_context'
                }
              ],
              'extra' => {
                'float' => {}
              },
              'source_info' => {
                'line_nr' => 156
              }
            },
            {
              'text' => '
',
              'type' => 'spaces_after_close_brace'
            },
            {
              'cmdname' => 'caption',
              'contents' => [
                {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'C unnumbered sec float'
                        }
                      ],
                      'type' => 'paragraph'
                    }
                  ],
                  'type' => 'brace_command_context'
                }
              ],
              'extra' => {
                'float' => {}
              },
              'source_info' => {
                'line_nr' => 157
              }
            },
            {
              'text' => '
',
              'type' => 'spaces_after_close_brace'
            },
            {
              'cmdname' => 'end',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'float'
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
                'text_arg' => 'float'
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'line_nr' => 158
              }
            }
          ],
          'extra' => {
            'caption' => {},
            'float_section' => {},
            'float_type' => 'Text',
            'is_target' => 1,
            'normalized' => 'unnumbered-sec-float',
            'shortcaption' => {}
          },
          'info' => {
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'line_nr' => 154
          }
        },
        {
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'cmdname' => 'float',
          'contents' => [
            {
              'contents' => [
                {
                  'type' => 'block_line_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => 'label but no type in unnumbered subsec in chapter'
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
                  'text' => 'float with no type.
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
              'cmdname' => 'caption',
              'contents' => [
                {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'C No type in unnumbered subsec in chapter'
                        }
                      ],
                      'type' => 'paragraph'
                    }
                  ],
                  'type' => 'brace_command_context'
                }
              ],
              'extra' => {
                'float' => {}
              },
              'source_info' => {
                'line_nr' => 163
              }
            },
            {
              'text' => '
',
              'type' => 'spaces_after_close_brace'
            },
            {
              'cmdname' => 'shortcaption',
              'contents' => [
                {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'SC No type in unnumbered subsec in chapter'
                        }
                      ],
                      'type' => 'paragraph'
                    }
                  ],
                  'type' => 'brace_command_context'
                }
              ],
              'extra' => {
                'float' => {}
              },
              'source_info' => {
                'line_nr' => 164
              }
            },
            {
              'text' => '
',
              'type' => 'spaces_after_close_brace'
            },
            {
              'cmdname' => 'end',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'float'
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
                'text_arg' => 'float'
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'line_nr' => 165
              }
            }
          ],
          'extra' => {
            'caption' => {},
            'float_section' => {},
            'float_type' => '',
            'is_target' => 1,
            'normalized' => 'label-but-no-type-in-unnumbered-subsec-in-chapter',
            'shortcaption' => {}
          },
          'info' => {
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'line_nr' => 160
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
        'line_nr' => 152
      }
    },
    {
      'cmdname' => 'node',
      'contents' => [
        {
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'Appendix for float'
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
          'type' => 'arguments_line'
        }
      ],
      'extra' => {
        'is_target' => 1,
        'normalized' => 'Appendix-for-float'
      },
      'info' => {
        'spaces_before_argument' => {
          'text' => ' '
        }
      },
      'source_info' => {
        'line_nr' => 167
      }
    },
    {
      'cmdname' => 'appendix',
      'contents' => [
        {
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'Appendix for float'
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
          'type' => 'arguments_line'
        },
        {
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'cmdname' => 'float',
          'contents' => [
            {
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'Text'
                    }
                  ],
                  'type' => 'block_line_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => 'appendix sec float'
                    }
                  ],
                  'info' => {
                    'spaces_after_argument' => {
                      'text' => '
'
                    },
                    'spaces_before_argument' => {
                      'text' => ' '
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
                  'text' => 'Appendix
'
                }
              ],
              'type' => 'paragraph'
            },
            {
              'cmdname' => 'shortcaption',
              'contents' => [
                {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'SC appendix sec float'
                        }
                      ],
                      'type' => 'paragraph'
                    }
                  ],
                  'type' => 'brace_command_context'
                }
              ],
              'extra' => {
                'float' => {}
              },
              'source_info' => {
                'line_nr' => 173
              }
            },
            {
              'text' => '
',
              'type' => 'spaces_after_close_brace'
            },
            {
              'cmdname' => 'caption',
              'contents' => [
                {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'C appendix sec float'
                        }
                      ],
                      'type' => 'paragraph'
                    }
                  ],
                  'type' => 'brace_command_context'
                }
              ],
              'extra' => {
                'float' => {}
              },
              'source_info' => {
                'line_nr' => 174
              }
            },
            {
              'text' => '
',
              'type' => 'spaces_after_close_brace'
            },
            {
              'cmdname' => 'end',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'float'
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
                'text_arg' => 'float'
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'line_nr' => 175
              }
            }
          ],
          'extra' => {
            'caption' => {},
            'float_section' => {},
            'float_type' => 'Text',
            'is_target' => 1,
            'normalized' => 'appendix-sec-float',
            'shortcaption' => {}
          },
          'info' => {
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'line_nr' => 170
          }
        },
        {
          'text' => '
',
          'type' => 'empty_line'
        }
      ],
      'extra' => {
        'section_number' => 'A'
      },
      'info' => {
        'spaces_before_argument' => {
          'text' => ' '
        }
      },
      'source_info' => {
        'line_nr' => 168
      }
    },
    {
      'cmdname' => 'node',
      'contents' => [
        {
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'list of floats'
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
          'type' => 'arguments_line'
        }
      ],
      'extra' => {
        'is_target' => 1,
        'normalized' => 'list-of-floats'
      },
      'info' => {
        'spaces_before_argument' => {
          'text' => ' '
        }
      },
      'source_info' => {
        'line_nr' => 177
      }
    },
    {
      'cmdname' => 'unnumbered',
      'contents' => [
        {
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'list of floats'
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
              'text' => 'See '
            },
            {
              'cmdname' => 'ref',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'text in section'
                    }
                  ],
                  'extra' => {
                    'node_content' => {
                      'contents' => [
                        {}
                      ]
                    },
                    'normalized' => 'text-in-section'
                  },
                  'type' => 'brace_arg'
                }
              ],
              'source_info' => {
                'line_nr' => 180
              }
            },
            {
              'text' => '.
'
            },
            {
              'text' => 'And ('
            },
            {
              'cmdname' => 'pxref',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'text in chapter'
                    }
                  ],
                  'extra' => {
                    'node_content' => {
                      'contents' => [
                        {}
                      ]
                    },
                    'normalized' => 'text-in-chapter'
                  },
                  'type' => 'brace_arg'
                }
              ],
              'source_info' => {
                'line_nr' => 181
              }
            },
            {
              'text' => ').
'
            },
            {
              'cmdname' => 'xref',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'text with a lot of features'
                    }
                  ],
                  'extra' => {
                    'node_content' => {
                      'contents' => [
                        {}
                      ]
                    },
                    'normalized' => 'text-with-a-lot-of-features'
                  },
                  'type' => 'brace_arg'
                }
              ],
              'source_info' => {
                'line_nr' => 182
              }
            },
            {
              'text' => '.
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
              'text' => 'And now a ref (without manual or printed manual)
'
            },
            {
              'cmdname' => 'ref',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'text with a lot of features'
                    }
                  ],
                  'extra' => {
                    'node_content' => {
                      'contents' => [
                        {}
                      ]
                    },
                    'normalized' => 'text-with-a-lot-of-features'
                  },
                  'type' => 'brace_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => 'cross ref'
                    }
                  ],
                  'info' => {
                    'spaces_before_argument' => {
                      'text' => ' '
                    }
                  },
                  'type' => 'brace_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => 'title'
                    }
                  ],
                  'info' => {
                    'spaces_before_argument' => {
                      'text' => ' '
                    }
                  },
                  'type' => 'brace_arg'
                }
              ],
              'source_info' => {
                'line_nr' => 185
              }
            },
            {
              'text' => '.
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
              'text' => 'And now a ref (with manual without printed manual)
'
            },
            {
              'cmdname' => 'ref',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'text with a lot of features'
                    }
                  ],
                  'extra' => {
                    'node_content' => {
                      'contents' => [
                        {}
                      ]
                    }
                  },
                  'type' => 'brace_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => 'cross ref'
                    }
                  ],
                  'info' => {
                    'spaces_before_argument' => {
                      'text' => ' '
                    }
                  },
                  'type' => 'brace_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => 'title'
                    }
                  ],
                  'info' => {
                    'spaces_before_argument' => {
                      'text' => ' '
                    }
                  },
                  'type' => 'brace_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => 'manual'
                    }
                  ],
                  'info' => {
                    'spaces_before_argument' => {
                      'text' => ' '
                    }
                  },
                  'type' => 'brace_arg'
                }
              ],
              'source_info' => {
                'line_nr' => 188
              }
            },
            {
              'text' => '.
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
              'text' => 'And now a ref (without manual with a printed manual)
'
            },
            {
              'cmdname' => 'ref',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'text with a lot of features'
                    }
                  ],
                  'extra' => {
                    'node_content' => {
                      'contents' => [
                        {}
                      ]
                    }
                  },
                  'type' => 'brace_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => 'cross ref'
                    }
                  ],
                  'info' => {
                    'spaces_before_argument' => {
                      'text' => ' '
                    }
                  },
                  'type' => 'brace_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => 'title'
                    }
                  ],
                  'info' => {
                    'spaces_before_argument' => {
                      'text' => ' '
                    }
                  },
                  'type' => 'brace_arg'
                },
                {
                  'type' => 'brace_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => 'printed manual title'
                    }
                  ],
                  'info' => {
                    'spaces_before_argument' => {
                      'text' => ' '
                    }
                  },
                  'type' => 'brace_arg'
                }
              ],
              'source_info' => {
                'line_nr' => 191
              }
            },
            {
              'text' => '.
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
              'text' => 'A ref to float without type '
            },
            {
              'cmdname' => 'ref',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'label but no type'
                    }
                  ],
                  'extra' => {
                    'node_content' => {
                      'contents' => [
                        {}
                      ]
                    },
                    'normalized' => 'label-but-no-type'
                  },
                  'type' => 'brace_arg'
                }
              ],
              'source_info' => {
                'line_nr' => 193
              }
            },
            {
              'text' => '.
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
          'cmdname' => 'listoffloats',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'Text'
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
            'float_type' => 'Text'
          },
          'info' => {
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'line_nr' => 195
          }
        },
        {
          'cmdname' => 'listoffloats',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'th'
                },
                {
                  'cmdname' => '\'',
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'e'
                        }
                      ],
                      'type' => 'following_arg'
                    }
                  ],
                  'source_info' => {
                    'line_nr' => 196
                  }
                },
                {
                  'text' => 'or'
                },
                {
                  'cmdname' => '`',
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'e'
                        }
                      ],
                      'type' => 'following_arg'
                    }
                  ],
                  'source_info' => {
                    'line_nr' => 196
                  }
                },
                {
                  'text' => 'me'
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
            'float_type' => "th\x{e9}or\x{e8}me"
          },
          'info' => {
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'line_nr' => 196
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
        'line_nr' => 178
      }
    },
    {
      'cmdname' => 'bye',
      'contents' => [
        {
          'text' => '
',
          'type' => 'rawline_arg'
        }
      ]
    },
    {
      'contents' => [
        {
          'text' => '
',
          'type' => 'text_after_end'
        },
        {
          'text' => '
',
          'type' => 'text_after_end'
        }
      ],
      'type' => 'postamble_after_end'
    }
  ],
  'type' => 'document_root'
};
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[2]{'contents'}[2]{'extra'}{'float'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[2];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[2]{'contents'}[4]{'extra'}{'float'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[2];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[2]{'extra'}{'caption'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[2]{'contents'}[2];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[2]{'extra'}{'float_section'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[2]{'extra'}{'shortcaption'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[2]{'contents'}[4];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[4]{'contents'}[3]{'extra'}{'float'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[4];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[4]{'contents'}[5]{'extra'}{'float'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[4];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[4]{'extra'}{'caption'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[4]{'contents'}[3];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[4]{'extra'}{'float_section'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[4]{'extra'}{'shortcaption'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[4]{'contents'}[5];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[6]{'contents'}[3]{'extra'}{'float'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[6];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[6]{'contents'}[5]{'extra'}{'float'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[6];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[6]{'extra'}{'caption'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[6]{'contents'}[3];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[6]{'extra'}{'float_section'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[6]{'extra'}{'shortcaption'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[6]{'contents'}[5];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[9]{'extra'}{'float_section'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[12]{'extra'}{'float_section'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[14]{'contents'}[2]{'extra'}{'float'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[14];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[14]{'contents'}[4]{'extra'}{'float'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[14];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[14]{'extra'}{'caption'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[14]{'contents'}[2];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[14]{'extra'}{'float_section'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[14]{'extra'}{'shortcaption'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[14]{'contents'}[4];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[16]{'contents'}[3]{'extra'}{'float'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[16];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[16]{'contents'}[5]{'extra'}{'float'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[16];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[16]{'extra'}{'caption'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[16]{'contents'}[3];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[16]{'extra'}{'float_section'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[16]{'extra'}{'shortcaption'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[16]{'contents'}[5];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[18]{'contents'}[3]{'extra'}{'float'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[18];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[18]{'contents'}[5]{'extra'}{'float'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[18];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[18]{'extra'}{'caption'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[18]{'contents'}[3];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[18]{'extra'}{'float_section'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[18]{'extra'}{'shortcaption'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[18]{'contents'}[5];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[20]{'contents'}[1]{'contents'}[1]{'extra'}{'node_content'}{'contents'}[0] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[20]{'contents'}[1]{'contents'}[1]{'contents'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[20]{'contents'}[2]{'contents'}[1]{'extra'}{'node_content'}{'contents'}[0] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[20]{'contents'}[2]{'contents'}[1]{'contents'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[20]{'contents'}[3]{'contents'}[1]{'extra'}{'node_content'}{'contents'}[0] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[20]{'contents'}[3]{'contents'}[1]{'contents'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[20]{'contents'}[4]{'contents'}[1]{'extra'}{'node_content'}{'contents'}[0] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[20]{'contents'}[4]{'contents'}[1]{'contents'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[20]{'contents'}[5]{'contents'}[1]{'extra'}{'node_content'}{'contents'}[0] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[2]{'contents'}[20]{'contents'}[5]{'contents'}[1]{'contents'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[2]{'contents'}[3]{'extra'}{'float'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[2];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[2]{'extra'}{'caption'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[2]{'contents'}[3];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[2]{'extra'}{'float_section'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[4]{'contents'}[1]{'extra'}{'float'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[4];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[4]{'extra'}{'caption'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[4]{'contents'}[1];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[4]{'extra'}{'float_section'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[6]{'contents'}[3]{'extra'}{'float'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[6];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[6]{'extra'}{'caption'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[6]{'contents'}[3];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[6]{'extra'}{'float_section'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[8]{'contents'}[3]{'extra'}{'float'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[8];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[8]{'contents'}[5]{'extra'}{'float'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[8];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[8]{'extra'}{'caption'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[8]{'contents'}[3];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[8]{'extra'}{'float_section'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[8]{'extra'}{'shortcaption'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[8]{'contents'}[5];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[10]{'contents'}[3]{'extra'}{'float'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[10];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[10]{'contents'}[5]{'extra'}{'float'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[10];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[10]{'extra'}{'caption'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[10]{'contents'}[3];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[10]{'extra'}{'float_section'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[10]{'extra'}{'shortcaption'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[10]{'contents'}[5];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[12]{'contents'}[1]{'contents'}[1]{'extra'}{'node_content'}{'contents'}[0] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[4]{'contents'}[12]{'contents'}[1]{'contents'}[1]{'contents'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[6]{'contents'}[2]{'extra'}{'float_section'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[6];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[2]{'contents'}[1]{'contents'}[1]{'extra'}{'node_content'}{'contents'}[0] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[2]{'contents'}[1]{'contents'}[1]{'contents'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[3]{'contents'}[2]{'extra'}{'float'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[3];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[3]{'contents'}[4]{'extra'}{'float'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[3];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[3]{'extra'}{'caption'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[3]{'contents'}[4];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[3]{'extra'}{'float_section'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[8];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[3]{'extra'}{'shortcaption'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[3]{'contents'}[2];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[4]{'contents'}[3]{'extra'}{'float'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[4];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[4]{'contents'}[5]{'extra'}{'float'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[4];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[4]{'extra'}{'caption'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[4]{'contents'}[3];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[4]{'extra'}{'float_section'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[8];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[4]{'extra'}{'shortcaption'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[8]{'contents'}[4]{'contents'}[5];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[10]{'contents'}[3]{'contents'}[2]{'extra'}{'float'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[10]{'contents'}[3];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[10]{'contents'}[3]{'contents'}[4]{'extra'}{'float'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[10]{'contents'}[3];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[10]{'contents'}[3]{'extra'}{'caption'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[10]{'contents'}[3]{'contents'}[4];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[10]{'contents'}[3]{'extra'}{'float_section'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[10];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[10]{'contents'}[3]{'extra'}{'shortcaption'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[10]{'contents'}[3]{'contents'}[2];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[12]{'contents'}[2]{'contents'}[1]{'contents'}[1]{'extra'}{'node_content'}{'contents'}[0] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[12]{'contents'}[2]{'contents'}[1]{'contents'}[1]{'contents'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[12]{'contents'}[3]{'contents'}[2]{'extra'}{'float'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[12]{'contents'}[3];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[12]{'contents'}[3]{'contents'}[4]{'extra'}{'float'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[12]{'contents'}[3];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[12]{'contents'}[3]{'extra'}{'caption'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[12]{'contents'}[3]{'contents'}[4];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[12]{'contents'}[3]{'extra'}{'float_section'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[12];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[12]{'contents'}[3]{'extra'}{'shortcaption'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[12]{'contents'}[3]{'contents'}[2];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[2]{'contents'}[2]{'extra'}{'float'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[2];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[2]{'contents'}[4]{'extra'}{'float'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[2];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[2]{'extra'}{'caption'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[2]{'contents'}[4];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[2]{'extra'}{'float_section'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[14];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[2]{'extra'}{'shortcaption'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[2]{'contents'}[2];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[4]{'contents'}[3]{'extra'}{'float'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[4];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[4]{'contents'}[5]{'extra'}{'float'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[4];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[4]{'extra'}{'caption'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[4]{'contents'}[3];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[4]{'extra'}{'float_section'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[14];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[4]{'extra'}{'shortcaption'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[14]{'contents'}[4]{'contents'}[5];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[16]{'contents'}[2]{'contents'}[3]{'extra'}{'float'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[16]{'contents'}[2];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[16]{'contents'}[2]{'contents'}[5]{'extra'}{'float'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[16]{'contents'}[2];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[16]{'contents'}[2]{'extra'}{'caption'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[16]{'contents'}[2]{'contents'}[5];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[16]{'contents'}[2]{'extra'}{'float_section'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[16];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[16]{'contents'}[2]{'extra'}{'shortcaption'} = $result_trees{'numbering_captions_listoffloats'}{'contents'}[16]{'contents'}[2]{'contents'}[3];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[2]{'contents'}[1]{'contents'}[0]{'extra'}{'node_content'}{'contents'}[0] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[2]{'contents'}[1]{'contents'}[0]{'contents'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[2]{'contents'}[4]{'contents'}[0]{'extra'}{'node_content'}{'contents'}[0] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[2]{'contents'}[4]{'contents'}[0]{'contents'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[2]{'contents'}[6]{'contents'}[0]{'extra'}{'node_content'}{'contents'}[0] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[2]{'contents'}[6]{'contents'}[0]{'contents'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[4]{'contents'}[1]{'contents'}[0]{'extra'}{'node_content'}{'contents'}[0] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[4]{'contents'}[1]{'contents'}[0]{'contents'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[6]{'contents'}[1]{'contents'}[0]{'extra'}{'node_content'}{'contents'}[0] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[6]{'contents'}[1]{'contents'}[0]{'contents'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[8]{'contents'}[1]{'contents'}[0]{'extra'}{'node_content'}{'contents'}[0] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[8]{'contents'}[1]{'contents'}[0]{'contents'}[0];
$result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[10]{'contents'}[1]{'contents'}[0]{'extra'}{'node_content'}{'contents'}[0] = $result_trees{'numbering_captions_listoffloats'}{'contents'}[18]{'contents'}[10]{'contents'}[1]{'contents'}[0]{'contents'}[0];

$result_texis{'numbering_captions_listoffloats'} = '@node Top
@top Test floats

@float Text, text with a lot of features

@caption{ An example of float caption@enddots{}}
@shortcaption{@TeX{} and someething}
@end float

@float Text
No label but caption and shortcaption.

@caption{C No label}
@shortcaption{SC No label}
@end float

@float ,label but no type
No type but caption and shortcaption.

@caption{C No type}
@shortcaption{SC No type}
@end float


@float ,label but no type and no caption
No type but label and no caption nor shortcaption.

@end float


@float
No label, no type, no caption no shortcaption.

@end float

@float
No label, no type, but caption and shortcaption.
@caption{C No label, no type, but caption and shortcaption.}
@shortcaption{SC No label, no type, but caption and shortcaption.}
@end float

@float ,label but no type 2
Second float with no type.

@caption{C No type 2}
@shortcaption{SC No type 2}
@end float

@float Warning, warning in top
A warning

@caption{C A warning}
@shortcaption{SC A warning}
@end float

@menu
* chapter::
* Unnumbered::
* Chapter with unnumbsubsec::
* Appendix for float::
* list of floats::
@end menu

@node chapter
@chapter A chapter

@float Text, text in chapter
Text in chapter

@caption{C Text in chapter}
@end float

@float Text, float with a lot of features and no shortcaption
@caption{ An example of float caption, no shortcaption@enddots{}}
@end float

@float th@\'eor@`eme, theoreme
A th@\'eor@`eme

@caption{C A th@\'eor@`eme}
@end float

@float ,label but no type in chapter
float with no type.

@caption{C No type in chapter}
@shortcaption{SC No type in chapter}
@end float

@float Warning, warning in chapter
A warning

@caption{C A warning in chapter}
@shortcaption{SC A warning in chapter}
@end float

@menu
* section::
@end menu

@node section
@section A section

@float Text, text in section

A text in float no caption a label a type.

@end float

@node Unnumbered
@unnumbered Unnumbered

@menu
* Section within unnumbered::
@end menu
@float Text, unnumbered float
unnum
@shortcaption{SC unnumbered float}
@caption{C unnumbered float}
@end float
@float ,label but no type in unnumbered
float with no type.

@caption{C No type in unnumbered}
@shortcaption{SC No type in unnumbered}
@end float


@node Section within unnumbered
@section Section within unnumbered


@float Text, Section within unnumbered float
Section within unnumbered
@shortcaption{SC Section within unnumbered}
@caption{C Section within unnumbered}
@end float

@node Chapter with unnumbsubsec
@chapter Chapter with unnumbsubsec

@menu
* unnumbered sec::
@end menu
@float Text, Chapter with subsec float
Chap
@shortcaption{SC Chapter with subsec}
@caption{C Chapter with subsec}
@end float

@node unnumbered sec
@unnumberedsec unnumbered sec

@float Text, unnumbered sec float
Chap
@shortcaption{SC unnumbered sec float}
@caption{C unnumbered sec float}
@end float

@float ,label but no type in unnumbered subsec in chapter
float with no type.

@caption{C No type in unnumbered subsec in chapter}
@shortcaption{SC No type in unnumbered subsec in chapter}
@end float

@node Appendix for float
@appendix Appendix for float

@float Text, appendix sec float

Appendix
@shortcaption{SC appendix sec float}
@caption{C appendix sec float}
@end float

@node list of floats
@unnumbered list of floats

See @ref{text in section}.
And (@pxref{text in chapter}).
@xref{text with a lot of features}.

And now a ref (without manual or printed manual)
@ref{text with a lot of features, cross ref, title}.

And now a ref (with manual without printed manual)
@ref{text with a lot of features, cross ref, title, manual}.

And now a ref (without manual with a printed manual)
@ref{text with a lot of features, cross ref, title,, printed manual title}.

A ref to float without type @ref{label but no type}.

@listoffloats Text
@listoffloats th@\'eor@`eme

@bye


';


$result_texts{'numbering_captions_listoffloats'} = 'Test floats
***********

Text, text with a lot of features


Text
No label but caption and shortcaption.


label but no type
No type but caption and shortcaption.



label but no type and no caption
No type but label and no caption nor shortcaption.



No label, no type, no caption no shortcaption.


No label, no type, but caption and shortcaption.

label but no type 2
Second float with no type.


Warning, warning in top
A warning


* chapter::
* Unnumbered::
* Chapter with unnumbsubsec::
* Appendix for float::
* list of floats::

1 A chapter
***********

Text, text in chapter
Text in chapter


Text, float with a lot of features and no shortcaption

the\'ore`me, theoreme
A the\'ore`me


label but no type in chapter
float with no type.


Warning, warning in chapter
A warning


* section::

1.1 A section
=============

Text, text in section

A text in float no caption a label a type.


Unnumbered
**********

* Section within unnumbered::
Text, unnumbered float
unnum
label but no type in unnumbered
float with no type.



Section within unnumbered
=========================


Text, Section within unnumbered float
Section within unnumbered

2 Chapter with unnumbsubsec
***************************

* unnumbered sec::
Text, Chapter with subsec float
Chap

unnumbered sec
==============

Text, unnumbered sec float
Chap

label but no type in unnumbered subsec in chapter
float with no type.


Appendix A Appendix for float
*****************************

Text, appendix sec float

Appendix

list of floats
**************

See text in section.
And (text in chapter).
text with a lot of features.

And now a ref (without manual or printed manual)
text with a lot of features.

And now a ref (with manual without printed manual)
text with a lot of features.

And now a ref (without manual with a printed manual)
text with a lot of features.

A ref to float without type label but no type.


';

$result_sectioning{'numbering_captions_listoffloats'} = {
  'extra' => {
    'section_childs' => [
      {
        'cmdname' => 'top',
        'extra' => {
          'associated_node' => {
            'cmdname' => 'node',
            'extra' => {
              'normalized' => 'Top'
            }
          },
          'section_childs' => [
            {
              'cmdname' => 'chapter',
              'extra' => {
                'associated_node' => {
                  'cmdname' => 'node',
                  'extra' => {
                    'normalized' => 'chapter'
                  }
                },
                'section_childs' => [
                  {
                    'cmdname' => 'section',
                    'extra' => {
                      'associated_node' => {
                        'cmdname' => 'node',
                        'extra' => {
                          'normalized' => 'section'
                        }
                      },
                      'section_directions' => {
                        'up' => {}
                      },
                      'section_level' => 2,
                      'section_number' => '1.1'
                    }
                  }
                ],
                'section_directions' => {
                  'up' => {}
                },
                'section_level' => 1,
                'section_number' => '1',
                'toplevel_directions' => {
                  'prev' => {},
                  'up' => {}
                }
              }
            },
            {
              'cmdname' => 'unnumbered',
              'extra' => {
                'associated_node' => {
                  'cmdname' => 'node',
                  'extra' => {
                    'normalized' => 'Unnumbered'
                  }
                },
                'section_childs' => [
                  {
                    'cmdname' => 'section',
                    'extra' => {
                      'associated_node' => {
                        'cmdname' => 'node',
                        'extra' => {
                          'normalized' => 'Section-within-unnumbered'
                        }
                      },
                      'section_directions' => {
                        'up' => {}
                      },
                      'section_level' => 2
                    }
                  }
                ],
                'section_directions' => {
                  'prev' => {},
                  'up' => {}
                },
                'section_level' => 1,
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
                    'normalized' => 'Chapter-with-unnumbsubsec'
                  }
                },
                'section_childs' => [
                  {
                    'cmdname' => 'unnumberedsec',
                    'extra' => {
                      'associated_node' => {
                        'cmdname' => 'node',
                        'extra' => {
                          'normalized' => 'unnumbered-sec'
                        }
                      },
                      'section_directions' => {
                        'up' => {}
                      },
                      'section_level' => 2
                    }
                  }
                ],
                'section_directions' => {
                  'prev' => {},
                  'up' => {}
                },
                'section_level' => 1,
                'section_number' => '2',
                'toplevel_directions' => {
                  'prev' => {},
                  'up' => {}
                }
              }
            },
            {
              'cmdname' => 'appendix',
              'extra' => {
                'associated_node' => {
                  'cmdname' => 'node',
                  'extra' => {
                    'normalized' => 'Appendix-for-float'
                  }
                },
                'section_directions' => {
                  'prev' => {},
                  'up' => {}
                },
                'section_level' => 1,
                'section_number' => 'A',
                'toplevel_directions' => {
                  'prev' => {},
                  'up' => {}
                }
              }
            },
            {
              'cmdname' => 'unnumbered',
              'extra' => {
                'associated_node' => {
                  'cmdname' => 'node',
                  'extra' => {
                    'normalized' => 'list-of-floats'
                  }
                },
                'section_directions' => {
                  'prev' => {},
                  'up' => {}
                },
                'section_level' => 1,
                'toplevel_directions' => {
                  'prev' => {},
                  'up' => {}
                }
              }
            }
          ],
          'section_level' => 0,
          'sectioning_root' => {},
          'toplevel_directions' => {}
        }
      }
    ],
    'section_level' => -1
  }
};
$result_sectioning{'numbering_captions_listoffloats'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[0]{'extra'}{'section_directions'}{'up'} = $result_sectioning{'numbering_captions_listoffloats'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[0];
$result_sectioning{'numbering_captions_listoffloats'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[0]{'extra'}{'section_directions'}{'up'} = $result_sectioning{'numbering_captions_listoffloats'}{'extra'}{'section_childs'}[0];
$result_sectioning{'numbering_captions_listoffloats'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[0]{'extra'}{'toplevel_directions'}{'prev'} = $result_sectioning{'numbering_captions_listoffloats'}{'extra'}{'section_childs'}[0];
$result_sectioning{'numbering_captions_listoffloats'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[0]{'extra'}{'toplevel_directions'}{'up'} = $result_sectioning{'numbering_captions_listoffloats'}{'extra'}{'section_childs'}[0];
$result_sectioning{'numbering_captions_listoffloats'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[1]{'extra'}{'section_childs'}[0]{'extra'}{'section_directions'}{'up'} = $result_sectioning{'numbering_captions_listoffloats'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[1];
$result_sectioning{'numbering_captions_listoffloats'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[1]{'extra'}{'section_directions'}{'prev'} = $result_sectioning{'numbering_captions_listoffloats'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[0];
$result_sectioning{'numbering_captions_listoffloats'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[1]{'extra'}{'section_directions'}{'up'} = $result_sectioning{'numbering_captions_listoffloats'}{'extra'}{'section_childs'}[0];
$result_sectioning{'numbering_captions_listoffloats'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[1]{'extra'}{'toplevel_directions'}{'prev'} = $result_sectioning{'numbering_captions_listoffloats'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[0];
$result_sectioning{'numbering_captions_listoffloats'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[1]{'extra'}{'toplevel_directions'}{'up'} = $result_sectioning{'numbering_captions_listoffloats'}{'extra'}{'section_childs'}[0];
$result_sectioning{'numbering_captions_listoffloats'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[2]{'extra'}{'section_childs'}[0]{'extra'}{'section_directions'}{'up'} = $result_sectioning{'numbering_captions_listoffloats'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[2];
$result_sectioning{'numbering_captions_listoffloats'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[2]{'extra'}{'section_directions'}{'prev'} = $result_sectioning{'numbering_captions_listoffloats'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[1];
$result_sectioning{'numbering_captions_listoffloats'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[2]{'extra'}{'section_directions'}{'up'} = $result_sectioning{'numbering_captions_listoffloats'}{'extra'}{'section_childs'}[0];
$result_sectioning{'numbering_captions_listoffloats'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[2]{'extra'}{'toplevel_directions'}{'prev'} = $result_sectioning{'numbering_captions_listoffloats'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[1];
$result_sectioning{'numbering_captions_listoffloats'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[2]{'extra'}{'toplevel_directions'}{'up'} = $result_sectioning{'numbering_captions_listoffloats'}{'extra'}{'section_childs'}[0];
$result_sectioning{'numbering_captions_listoffloats'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[3]{'extra'}{'section_directions'}{'prev'} = $result_sectioning{'numbering_captions_listoffloats'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[2];
$result_sectioning{'numbering_captions_listoffloats'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[3]{'extra'}{'section_directions'}{'up'} = $result_sectioning{'numbering_captions_listoffloats'}{'extra'}{'section_childs'}[0];
$result_sectioning{'numbering_captions_listoffloats'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[3]{'extra'}{'toplevel_directions'}{'prev'} = $result_sectioning{'numbering_captions_listoffloats'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[2];
$result_sectioning{'numbering_captions_listoffloats'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[3]{'extra'}{'toplevel_directions'}{'up'} = $result_sectioning{'numbering_captions_listoffloats'}{'extra'}{'section_childs'}[0];
$result_sectioning{'numbering_captions_listoffloats'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[4]{'extra'}{'section_directions'}{'prev'} = $result_sectioning{'numbering_captions_listoffloats'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[3];
$result_sectioning{'numbering_captions_listoffloats'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[4]{'extra'}{'section_directions'}{'up'} = $result_sectioning{'numbering_captions_listoffloats'}{'extra'}{'section_childs'}[0];
$result_sectioning{'numbering_captions_listoffloats'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[4]{'extra'}{'toplevel_directions'}{'prev'} = $result_sectioning{'numbering_captions_listoffloats'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[3];
$result_sectioning{'numbering_captions_listoffloats'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[4]{'extra'}{'toplevel_directions'}{'up'} = $result_sectioning{'numbering_captions_listoffloats'}{'extra'}{'section_childs'}[0];
$result_sectioning{'numbering_captions_listoffloats'}{'extra'}{'section_childs'}[0]{'extra'}{'sectioning_root'} = $result_sectioning{'numbering_captions_listoffloats'};

$result_nodes{'numbering_captions_listoffloats'} = [
  {
    'cmdname' => 'node',
    'extra' => {
      'associated_section' => {
        'cmdname' => 'top',
        'extra' => {}
      },
      'node_directions' => {
        'next' => {
          'cmdname' => 'node',
          'extra' => {
            'associated_section' => {
              'cmdname' => 'chapter',
              'extra' => {
                'section_number' => '1'
              }
            },
            'node_directions' => {
              'next' => {
                'cmdname' => 'node',
                'extra' => {
                  'associated_section' => {
                    'cmdname' => 'unnumbered',
                    'extra' => {}
                  },
                  'node_directions' => {
                    'next' => {
                      'cmdname' => 'node',
                      'extra' => {
                        'associated_section' => {
                          'cmdname' => 'chapter',
                          'extra' => {
                            'section_number' => '2'
                          }
                        },
                        'node_directions' => {
                          'next' => {
                            'cmdname' => 'node',
                            'extra' => {
                              'associated_section' => {
                                'cmdname' => 'appendix',
                                'extra' => {
                                  'section_number' => 'A'
                                }
                              },
                              'node_directions' => {
                                'next' => {
                                  'cmdname' => 'node',
                                  'extra' => {
                                    'associated_section' => {
                                      'cmdname' => 'unnumbered',
                                      'extra' => {}
                                    },
                                    'node_directions' => {
                                      'prev' => {},
                                      'up' => {}
                                    },
                                    'normalized' => 'list-of-floats'
                                  }
                                },
                                'prev' => {},
                                'up' => {}
                              },
                              'normalized' => 'Appendix-for-float'
                            }
                          },
                          'prev' => {},
                          'up' => {}
                        },
                        'normalized' => 'Chapter-with-unnumbsubsec'
                      }
                    },
                    'prev' => {},
                    'up' => {}
                  },
                  'normalized' => 'Unnumbered'
                }
              },
              'prev' => {},
              'up' => {}
            },
            'normalized' => 'chapter'
          }
        }
      },
      'normalized' => 'Top'
    }
  },
  {},
  {
    'cmdname' => 'node',
    'extra' => {
      'associated_section' => {
        'cmdname' => 'section',
        'extra' => {
          'section_number' => '1.1'
        }
      },
      'node_directions' => {
        'up' => {}
      },
      'normalized' => 'section'
    }
  },
  {},
  {
    'cmdname' => 'node',
    'extra' => {
      'associated_section' => {
        'cmdname' => 'section',
        'extra' => {}
      },
      'node_directions' => {
        'up' => {}
      },
      'normalized' => 'Section-within-unnumbered'
    }
  },
  {},
  {
    'cmdname' => 'node',
    'extra' => {
      'associated_section' => {
        'cmdname' => 'unnumberedsec',
        'extra' => {}
      },
      'node_directions' => {
        'up' => {}
      },
      'normalized' => 'unnumbered-sec'
    }
  },
  {},
  {}
];
$result_nodes{'numbering_captions_listoffloats'}[0]{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'prev'} = $result_nodes{'numbering_captions_listoffloats'}[0]{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'next'};
$result_nodes{'numbering_captions_listoffloats'}[0]{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'up'} = $result_nodes{'numbering_captions_listoffloats'}[0];
$result_nodes{'numbering_captions_listoffloats'}[0]{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'prev'} = $result_nodes{'numbering_captions_listoffloats'}[0]{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'next'};
$result_nodes{'numbering_captions_listoffloats'}[0]{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'up'} = $result_nodes{'numbering_captions_listoffloats'}[0];
$result_nodes{'numbering_captions_listoffloats'}[0]{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'prev'} = $result_nodes{'numbering_captions_listoffloats'}[0]{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'next'};
$result_nodes{'numbering_captions_listoffloats'}[0]{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'up'} = $result_nodes{'numbering_captions_listoffloats'}[0];
$result_nodes{'numbering_captions_listoffloats'}[0]{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'prev'} = $result_nodes{'numbering_captions_listoffloats'}[0]{'extra'}{'node_directions'}{'next'};
$result_nodes{'numbering_captions_listoffloats'}[0]{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'up'} = $result_nodes{'numbering_captions_listoffloats'}[0];
$result_nodes{'numbering_captions_listoffloats'}[0]{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'prev'} = $result_nodes{'numbering_captions_listoffloats'}[0];
$result_nodes{'numbering_captions_listoffloats'}[0]{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'up'} = $result_nodes{'numbering_captions_listoffloats'}[0];
$result_nodes{'numbering_captions_listoffloats'}[1] = $result_nodes{'numbering_captions_listoffloats'}[0]{'extra'}{'node_directions'}{'next'};
$result_nodes{'numbering_captions_listoffloats'}[2]{'extra'}{'node_directions'}{'up'} = $result_nodes{'numbering_captions_listoffloats'}[0]{'extra'}{'node_directions'}{'next'};
$result_nodes{'numbering_captions_listoffloats'}[3] = $result_nodes{'numbering_captions_listoffloats'}[0]{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'next'};
$result_nodes{'numbering_captions_listoffloats'}[4]{'extra'}{'node_directions'}{'up'} = $result_nodes{'numbering_captions_listoffloats'}[0]{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'next'};
$result_nodes{'numbering_captions_listoffloats'}[5] = $result_nodes{'numbering_captions_listoffloats'}[0]{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'next'};
$result_nodes{'numbering_captions_listoffloats'}[6]{'extra'}{'node_directions'}{'up'} = $result_nodes{'numbering_captions_listoffloats'}[0]{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'next'};
$result_nodes{'numbering_captions_listoffloats'}[7] = $result_nodes{'numbering_captions_listoffloats'}[0]{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'next'};
$result_nodes{'numbering_captions_listoffloats'}[8] = $result_nodes{'numbering_captions_listoffloats'}[0]{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'next'};

$result_menus{'numbering_captions_listoffloats'} = [
  {
    'extra' => {
      'menus' => [
        {}
      ],
      'normalized' => 'Top'
    }
  },
  {
    'extra' => {
      'menu_directions' => {
        'next' => {
          'extra' => {
            'menu_directions' => {
              'next' => {
                'extra' => {
                  'menu_directions' => {
                    'next' => {
                      'extra' => {
                        'menu_directions' => {
                          'next' => {
                            'extra' => {
                              'menu_directions' => {
                                'prev' => {},
                                'up' => {}
                              },
                              'normalized' => 'list-of-floats'
                            }
                          },
                          'prev' => {},
                          'up' => {}
                        },
                        'normalized' => 'Appendix-for-float'
                      }
                    },
                    'prev' => {},
                    'up' => {}
                  },
                  'menus' => [
                    {}
                  ],
                  'normalized' => 'Chapter-with-unnumbsubsec'
                }
              },
              'prev' => {},
              'up' => {}
            },
            'menus' => [
              {}
            ],
            'normalized' => 'Unnumbered'
          }
        },
        'up' => {}
      },
      'menus' => [
        {}
      ],
      'normalized' => 'chapter'
    }
  },
  {
    'extra' => {
      'menu_directions' => {
        'up' => {}
      },
      'normalized' => 'section'
    }
  },
  {},
  {
    'extra' => {
      'menu_directions' => {
        'up' => {}
      },
      'normalized' => 'Section-within-unnumbered'
    }
  },
  {},
  {
    'extra' => {
      'menu_directions' => {
        'up' => {}
      },
      'normalized' => 'unnumbered-sec'
    }
  },
  {},
  {}
];
$result_menus{'numbering_captions_listoffloats'}[1]{'extra'}{'menu_directions'}{'next'}{'extra'}{'menu_directions'}{'next'}{'extra'}{'menu_directions'}{'next'}{'extra'}{'menu_directions'}{'next'}{'extra'}{'menu_directions'}{'prev'} = $result_menus{'numbering_captions_listoffloats'}[1]{'extra'}{'menu_directions'}{'next'}{'extra'}{'menu_directions'}{'next'}{'extra'}{'menu_directions'}{'next'};
$result_menus{'numbering_captions_listoffloats'}[1]{'extra'}{'menu_directions'}{'next'}{'extra'}{'menu_directions'}{'next'}{'extra'}{'menu_directions'}{'next'}{'extra'}{'menu_directions'}{'next'}{'extra'}{'menu_directions'}{'up'} = $result_menus{'numbering_captions_listoffloats'}[0];
$result_menus{'numbering_captions_listoffloats'}[1]{'extra'}{'menu_directions'}{'next'}{'extra'}{'menu_directions'}{'next'}{'extra'}{'menu_directions'}{'next'}{'extra'}{'menu_directions'}{'prev'} = $result_menus{'numbering_captions_listoffloats'}[1]{'extra'}{'menu_directions'}{'next'}{'extra'}{'menu_directions'}{'next'};
$result_menus{'numbering_captions_listoffloats'}[1]{'extra'}{'menu_directions'}{'next'}{'extra'}{'menu_directions'}{'next'}{'extra'}{'menu_directions'}{'next'}{'extra'}{'menu_directions'}{'up'} = $result_menus{'numbering_captions_listoffloats'}[0];
$result_menus{'numbering_captions_listoffloats'}[1]{'extra'}{'menu_directions'}{'next'}{'extra'}{'menu_directions'}{'next'}{'extra'}{'menu_directions'}{'prev'} = $result_menus{'numbering_captions_listoffloats'}[1]{'extra'}{'menu_directions'}{'next'};
$result_menus{'numbering_captions_listoffloats'}[1]{'extra'}{'menu_directions'}{'next'}{'extra'}{'menu_directions'}{'next'}{'extra'}{'menu_directions'}{'up'} = $result_menus{'numbering_captions_listoffloats'}[0];
$result_menus{'numbering_captions_listoffloats'}[1]{'extra'}{'menu_directions'}{'next'}{'extra'}{'menu_directions'}{'prev'} = $result_menus{'numbering_captions_listoffloats'}[1];
$result_menus{'numbering_captions_listoffloats'}[1]{'extra'}{'menu_directions'}{'next'}{'extra'}{'menu_directions'}{'up'} = $result_menus{'numbering_captions_listoffloats'}[0];
$result_menus{'numbering_captions_listoffloats'}[1]{'extra'}{'menu_directions'}{'up'} = $result_menus{'numbering_captions_listoffloats'}[0];
$result_menus{'numbering_captions_listoffloats'}[2]{'extra'}{'menu_directions'}{'up'} = $result_menus{'numbering_captions_listoffloats'}[1];
$result_menus{'numbering_captions_listoffloats'}[3] = $result_menus{'numbering_captions_listoffloats'}[1]{'extra'}{'menu_directions'}{'next'};
$result_menus{'numbering_captions_listoffloats'}[4]{'extra'}{'menu_directions'}{'up'} = $result_menus{'numbering_captions_listoffloats'}[1]{'extra'}{'menu_directions'}{'next'};
$result_menus{'numbering_captions_listoffloats'}[5] = $result_menus{'numbering_captions_listoffloats'}[1]{'extra'}{'menu_directions'}{'next'}{'extra'}{'menu_directions'}{'next'};
$result_menus{'numbering_captions_listoffloats'}[6]{'extra'}{'menu_directions'}{'up'} = $result_menus{'numbering_captions_listoffloats'}[1]{'extra'}{'menu_directions'}{'next'}{'extra'}{'menu_directions'}{'next'};
$result_menus{'numbering_captions_listoffloats'}[7] = $result_menus{'numbering_captions_listoffloats'}[1]{'extra'}{'menu_directions'}{'next'}{'extra'}{'menu_directions'}{'next'}{'extra'}{'menu_directions'}{'next'};
$result_menus{'numbering_captions_listoffloats'}[8] = $result_menus{'numbering_captions_listoffloats'}[1]{'extra'}{'menu_directions'}{'next'}{'extra'}{'menu_directions'}{'next'}{'extra'}{'menu_directions'}{'next'}{'extra'}{'menu_directions'}{'next'};

$result_errors{'numbering_captions_listoffloats'} = [];


$result_floats{'numbering_captions_listoffloats'} = {
  '' => [
    {
      'cmdname' => 'float',
      'extra' => {
        'caption' => {
          'cmdname' => 'caption',
          'extra' => {
            'float' => {}
          }
        },
        'float_number' => '1',
        'float_section' => {
          'cmdname' => 'top',
          'extra' => {}
        },
        'float_type' => '',
        'normalized' => 'label-but-no-type',
        'shortcaption' => {
          'cmdname' => 'shortcaption',
          'extra' => {
            'float' => {}
          }
        }
      }
    },
    {
      'cmdname' => 'float',
      'extra' => {
        'float_number' => '2',
        'float_section' => {},
        'float_type' => '',
        'normalized' => 'label-but-no-type-and-no-caption'
      }
    },
    {
      'cmdname' => 'float',
      'extra' => {
        'float_section' => {},
        'float_type' => ''
      }
    },
    {
      'cmdname' => 'float',
      'extra' => {
        'caption' => {
          'cmdname' => 'caption',
          'extra' => {
            'float' => {}
          }
        },
        'float_section' => {},
        'float_type' => '',
        'shortcaption' => {
          'cmdname' => 'shortcaption',
          'extra' => {
            'float' => {}
          }
        }
      }
    },
    {
      'cmdname' => 'float',
      'extra' => {
        'caption' => {
          'cmdname' => 'caption',
          'extra' => {
            'float' => {}
          }
        },
        'float_number' => '3',
        'float_section' => {},
        'float_type' => '',
        'normalized' => 'label-but-no-type-2',
        'shortcaption' => {
          'cmdname' => 'shortcaption',
          'extra' => {
            'float' => {}
          }
        }
      }
    },
    {
      'cmdname' => 'float',
      'extra' => {
        'caption' => {
          'cmdname' => 'caption',
          'extra' => {
            'float' => {}
          }
        },
        'float_number' => '1.1',
        'float_section' => {
          'cmdname' => 'chapter',
          'extra' => {
            'section_number' => '1'
          }
        },
        'float_type' => '',
        'normalized' => 'label-but-no-type-in-chapter',
        'shortcaption' => {
          'cmdname' => 'shortcaption',
          'extra' => {
            'float' => {}
          }
        }
      }
    },
    {
      'cmdname' => 'float',
      'extra' => {
        'caption' => {
          'cmdname' => 'caption',
          'extra' => {
            'float' => {}
          }
        },
        'float_number' => '5',
        'float_section' => {
          'cmdname' => 'unnumbered',
          'extra' => {}
        },
        'float_type' => '',
        'normalized' => 'label-but-no-type-in-unnumbered',
        'shortcaption' => {
          'cmdname' => 'shortcaption',
          'extra' => {
            'float' => {}
          }
        }
      }
    },
    {
      'cmdname' => 'float',
      'extra' => {
        'caption' => {
          'cmdname' => 'caption',
          'extra' => {
            'float' => {}
          }
        },
        'float_number' => '2.1',
        'float_section' => {
          'cmdname' => 'unnumberedsec',
          'extra' => {}
        },
        'float_type' => '',
        'normalized' => 'label-but-no-type-in-unnumbered-subsec-in-chapter',
        'shortcaption' => {
          'cmdname' => 'shortcaption',
          'extra' => {
            'float' => {}
          }
        }
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
        'float_number' => '1',
        'float_section' => {},
        'float_type' => 'Text',
        'normalized' => 'text-with-a-lot-of-features',
        'shortcaption' => {
          'cmdname' => 'shortcaption',
          'extra' => {
            'float' => {}
          }
        }
      }
    },
    {
      'cmdname' => 'float',
      'extra' => {
        'caption' => {
          'cmdname' => 'caption',
          'extra' => {
            'float' => {}
          }
        },
        'float_section' => {},
        'float_type' => 'Text',
        'shortcaption' => {
          'cmdname' => 'shortcaption',
          'extra' => {
            'float' => {}
          }
        }
      }
    },
    {
      'cmdname' => 'float',
      'extra' => {
        'caption' => {
          'cmdname' => 'caption',
          'extra' => {
            'float' => {}
          }
        },
        'float_number' => '1.1',
        'float_section' => {},
        'float_type' => 'Text',
        'normalized' => 'text-in-chapter'
      }
    },
    {
      'cmdname' => 'float',
      'extra' => {
        'caption' => {
          'cmdname' => 'caption',
          'extra' => {
            'float' => {}
          }
        },
        'float_number' => '1.2',
        'float_section' => {},
        'float_type' => 'Text',
        'normalized' => 'float-with-a-lot-of-features-and-no-shortcaption'
      }
    },
    {
      'cmdname' => 'float',
      'extra' => {
        'float_number' => '1.3',
        'float_section' => {
          'cmdname' => 'section',
          'extra' => {
            'section_number' => '1.1'
          }
        },
        'float_type' => 'Text',
        'normalized' => 'text-in-section'
      }
    },
    {
      'cmdname' => 'float',
      'extra' => {
        'caption' => {
          'cmdname' => 'caption',
          'extra' => {
            'float' => {}
          }
        },
        'float_number' => '5',
        'float_section' => {},
        'float_type' => 'Text',
        'normalized' => 'unnumbered-float',
        'shortcaption' => {
          'cmdname' => 'shortcaption',
          'extra' => {
            'float' => {}
          }
        }
      }
    },
    {
      'cmdname' => 'float',
      'extra' => {
        'caption' => {
          'cmdname' => 'caption',
          'extra' => {
            'float' => {}
          }
        },
        'float_number' => '6',
        'float_section' => {
          'cmdname' => 'section',
          'extra' => {}
        },
        'float_type' => 'Text',
        'normalized' => 'Section-within-unnumbered-float',
        'shortcaption' => {
          'cmdname' => 'shortcaption',
          'extra' => {
            'float' => {}
          }
        }
      }
    },
    {
      'cmdname' => 'float',
      'extra' => {
        'caption' => {
          'cmdname' => 'caption',
          'extra' => {
            'float' => {}
          }
        },
        'float_number' => '2.1',
        'float_section' => {
          'cmdname' => 'chapter',
          'extra' => {
            'section_number' => '2'
          }
        },
        'float_type' => 'Text',
        'normalized' => 'Chapter-with-subsec-float',
        'shortcaption' => {
          'cmdname' => 'shortcaption',
          'extra' => {
            'float' => {}
          }
        }
      }
    },
    {
      'cmdname' => 'float',
      'extra' => {
        'caption' => {
          'cmdname' => 'caption',
          'extra' => {
            'float' => {}
          }
        },
        'float_number' => '2.2',
        'float_section' => {},
        'float_type' => 'Text',
        'normalized' => 'unnumbered-sec-float',
        'shortcaption' => {
          'cmdname' => 'shortcaption',
          'extra' => {
            'float' => {}
          }
        }
      }
    },
    {
      'cmdname' => 'float',
      'extra' => {
        'caption' => {
          'cmdname' => 'caption',
          'extra' => {
            'float' => {}
          }
        },
        'float_number' => 'A.1',
        'float_section' => {
          'cmdname' => 'appendix',
          'extra' => {
            'section_number' => 'A'
          }
        },
        'float_type' => 'Text',
        'normalized' => 'appendix-sec-float',
        'shortcaption' => {
          'cmdname' => 'shortcaption',
          'extra' => {
            'float' => {}
          }
        }
      }
    }
  ],
  'Warning' => [
    {
      'cmdname' => 'float',
      'extra' => {
        'caption' => {
          'cmdname' => 'caption',
          'extra' => {
            'float' => {}
          }
        },
        'float_number' => '1',
        'float_section' => {},
        'float_type' => 'Warning',
        'normalized' => 'warning-in-top',
        'shortcaption' => {
          'cmdname' => 'shortcaption',
          'extra' => {
            'float' => {}
          }
        }
      }
    },
    {
      'cmdname' => 'float',
      'extra' => {
        'caption' => {
          'cmdname' => 'caption',
          'extra' => {
            'float' => {}
          }
        },
        'float_number' => '1.1',
        'float_section' => {},
        'float_type' => 'Warning',
        'normalized' => 'warning-in-chapter',
        'shortcaption' => {
          'cmdname' => 'shortcaption',
          'extra' => {
            'float' => {}
          }
        }
      }
    }
  ],
  "th\x{e9}or\x{e8}me" => [
    {
      'cmdname' => 'float',
      'extra' => {
        'caption' => {
          'cmdname' => 'caption',
          'extra' => {
            'float' => {}
          }
        },
        'float_number' => '1.1',
        'float_section' => {},
        'float_type' => "th\x{e9}or\x{e8}me",
        'normalized' => 'theoreme'
      }
    }
  ]
};
$result_floats{'numbering_captions_listoffloats'}{''}[0]{'extra'}{'caption'}{'extra'}{'float'} = $result_floats{'numbering_captions_listoffloats'}{''}[0];
$result_floats{'numbering_captions_listoffloats'}{''}[0]{'extra'}{'shortcaption'}{'extra'}{'float'} = $result_floats{'numbering_captions_listoffloats'}{''}[0];
$result_floats{'numbering_captions_listoffloats'}{''}[1]{'extra'}{'float_section'} = $result_floats{'numbering_captions_listoffloats'}{''}[0]{'extra'}{'float_section'};
$result_floats{'numbering_captions_listoffloats'}{''}[2]{'extra'}{'float_section'} = $result_floats{'numbering_captions_listoffloats'}{''}[0]{'extra'}{'float_section'};
$result_floats{'numbering_captions_listoffloats'}{''}[3]{'extra'}{'caption'}{'extra'}{'float'} = $result_floats{'numbering_captions_listoffloats'}{''}[3];
$result_floats{'numbering_captions_listoffloats'}{''}[3]{'extra'}{'float_section'} = $result_floats{'numbering_captions_listoffloats'}{''}[0]{'extra'}{'float_section'};
$result_floats{'numbering_captions_listoffloats'}{''}[3]{'extra'}{'shortcaption'}{'extra'}{'float'} = $result_floats{'numbering_captions_listoffloats'}{''}[3];
$result_floats{'numbering_captions_listoffloats'}{''}[4]{'extra'}{'caption'}{'extra'}{'float'} = $result_floats{'numbering_captions_listoffloats'}{''}[4];
$result_floats{'numbering_captions_listoffloats'}{''}[4]{'extra'}{'float_section'} = $result_floats{'numbering_captions_listoffloats'}{''}[0]{'extra'}{'float_section'};
$result_floats{'numbering_captions_listoffloats'}{''}[4]{'extra'}{'shortcaption'}{'extra'}{'float'} = $result_floats{'numbering_captions_listoffloats'}{''}[4];
$result_floats{'numbering_captions_listoffloats'}{''}[5]{'extra'}{'caption'}{'extra'}{'float'} = $result_floats{'numbering_captions_listoffloats'}{''}[5];
$result_floats{'numbering_captions_listoffloats'}{''}[5]{'extra'}{'shortcaption'}{'extra'}{'float'} = $result_floats{'numbering_captions_listoffloats'}{''}[5];
$result_floats{'numbering_captions_listoffloats'}{''}[6]{'extra'}{'caption'}{'extra'}{'float'} = $result_floats{'numbering_captions_listoffloats'}{''}[6];
$result_floats{'numbering_captions_listoffloats'}{''}[6]{'extra'}{'shortcaption'}{'extra'}{'float'} = $result_floats{'numbering_captions_listoffloats'}{''}[6];
$result_floats{'numbering_captions_listoffloats'}{''}[7]{'extra'}{'caption'}{'extra'}{'float'} = $result_floats{'numbering_captions_listoffloats'}{''}[7];
$result_floats{'numbering_captions_listoffloats'}{''}[7]{'extra'}{'shortcaption'}{'extra'}{'float'} = $result_floats{'numbering_captions_listoffloats'}{''}[7];
$result_floats{'numbering_captions_listoffloats'}{'Text'}[0]{'extra'}{'caption'}{'extra'}{'float'} = $result_floats{'numbering_captions_listoffloats'}{'Text'}[0];
$result_floats{'numbering_captions_listoffloats'}{'Text'}[0]{'extra'}{'float_section'} = $result_floats{'numbering_captions_listoffloats'}{''}[0]{'extra'}{'float_section'};
$result_floats{'numbering_captions_listoffloats'}{'Text'}[0]{'extra'}{'shortcaption'}{'extra'}{'float'} = $result_floats{'numbering_captions_listoffloats'}{'Text'}[0];
$result_floats{'numbering_captions_listoffloats'}{'Text'}[1]{'extra'}{'caption'}{'extra'}{'float'} = $result_floats{'numbering_captions_listoffloats'}{'Text'}[1];
$result_floats{'numbering_captions_listoffloats'}{'Text'}[1]{'extra'}{'float_section'} = $result_floats{'numbering_captions_listoffloats'}{''}[0]{'extra'}{'float_section'};
$result_floats{'numbering_captions_listoffloats'}{'Text'}[1]{'extra'}{'shortcaption'}{'extra'}{'float'} = $result_floats{'numbering_captions_listoffloats'}{'Text'}[1];
$result_floats{'numbering_captions_listoffloats'}{'Text'}[2]{'extra'}{'caption'}{'extra'}{'float'} = $result_floats{'numbering_captions_listoffloats'}{'Text'}[2];
$result_floats{'numbering_captions_listoffloats'}{'Text'}[2]{'extra'}{'float_section'} = $result_floats{'numbering_captions_listoffloats'}{''}[5]{'extra'}{'float_section'};
$result_floats{'numbering_captions_listoffloats'}{'Text'}[3]{'extra'}{'caption'}{'extra'}{'float'} = $result_floats{'numbering_captions_listoffloats'}{'Text'}[3];
$result_floats{'numbering_captions_listoffloats'}{'Text'}[3]{'extra'}{'float_section'} = $result_floats{'numbering_captions_listoffloats'}{''}[5]{'extra'}{'float_section'};
$result_floats{'numbering_captions_listoffloats'}{'Text'}[5]{'extra'}{'caption'}{'extra'}{'float'} = $result_floats{'numbering_captions_listoffloats'}{'Text'}[5];
$result_floats{'numbering_captions_listoffloats'}{'Text'}[5]{'extra'}{'float_section'} = $result_floats{'numbering_captions_listoffloats'}{''}[6]{'extra'}{'float_section'};
$result_floats{'numbering_captions_listoffloats'}{'Text'}[5]{'extra'}{'shortcaption'}{'extra'}{'float'} = $result_floats{'numbering_captions_listoffloats'}{'Text'}[5];
$result_floats{'numbering_captions_listoffloats'}{'Text'}[6]{'extra'}{'caption'}{'extra'}{'float'} = $result_floats{'numbering_captions_listoffloats'}{'Text'}[6];
$result_floats{'numbering_captions_listoffloats'}{'Text'}[6]{'extra'}{'shortcaption'}{'extra'}{'float'} = $result_floats{'numbering_captions_listoffloats'}{'Text'}[6];
$result_floats{'numbering_captions_listoffloats'}{'Text'}[7]{'extra'}{'caption'}{'extra'}{'float'} = $result_floats{'numbering_captions_listoffloats'}{'Text'}[7];
$result_floats{'numbering_captions_listoffloats'}{'Text'}[7]{'extra'}{'shortcaption'}{'extra'}{'float'} = $result_floats{'numbering_captions_listoffloats'}{'Text'}[7];
$result_floats{'numbering_captions_listoffloats'}{'Text'}[8]{'extra'}{'caption'}{'extra'}{'float'} = $result_floats{'numbering_captions_listoffloats'}{'Text'}[8];
$result_floats{'numbering_captions_listoffloats'}{'Text'}[8]{'extra'}{'float_section'} = $result_floats{'numbering_captions_listoffloats'}{''}[7]{'extra'}{'float_section'};
$result_floats{'numbering_captions_listoffloats'}{'Text'}[8]{'extra'}{'shortcaption'}{'extra'}{'float'} = $result_floats{'numbering_captions_listoffloats'}{'Text'}[8];
$result_floats{'numbering_captions_listoffloats'}{'Text'}[9]{'extra'}{'caption'}{'extra'}{'float'} = $result_floats{'numbering_captions_listoffloats'}{'Text'}[9];
$result_floats{'numbering_captions_listoffloats'}{'Text'}[9]{'extra'}{'shortcaption'}{'extra'}{'float'} = $result_floats{'numbering_captions_listoffloats'}{'Text'}[9];
$result_floats{'numbering_captions_listoffloats'}{'Warning'}[0]{'extra'}{'caption'}{'extra'}{'float'} = $result_floats{'numbering_captions_listoffloats'}{'Warning'}[0];
$result_floats{'numbering_captions_listoffloats'}{'Warning'}[0]{'extra'}{'float_section'} = $result_floats{'numbering_captions_listoffloats'}{''}[0]{'extra'}{'float_section'};
$result_floats{'numbering_captions_listoffloats'}{'Warning'}[0]{'extra'}{'shortcaption'}{'extra'}{'float'} = $result_floats{'numbering_captions_listoffloats'}{'Warning'}[0];
$result_floats{'numbering_captions_listoffloats'}{'Warning'}[1]{'extra'}{'caption'}{'extra'}{'float'} = $result_floats{'numbering_captions_listoffloats'}{'Warning'}[1];
$result_floats{'numbering_captions_listoffloats'}{'Warning'}[1]{'extra'}{'float_section'} = $result_floats{'numbering_captions_listoffloats'}{''}[5]{'extra'}{'float_section'};
$result_floats{'numbering_captions_listoffloats'}{'Warning'}[1]{'extra'}{'shortcaption'}{'extra'}{'float'} = $result_floats{'numbering_captions_listoffloats'}{'Warning'}[1];
$result_floats{'numbering_captions_listoffloats'}{"th\x{e9}or\x{e8}me"}[0]{'extra'}{'caption'}{'extra'}{'float'} = $result_floats{'numbering_captions_listoffloats'}{"th\x{e9}or\x{e8}me"}[0];
$result_floats{'numbering_captions_listoffloats'}{"th\x{e9}or\x{e8}me"}[0]{'extra'}{'float_section'} = $result_floats{'numbering_captions_listoffloats'}{''}[5]{'extra'}{'float_section'};



$result_converted{'plaintext'}->{'numbering_captions_listoffloats'} = 'Test floats
***********

Text 1: An example of float caption...

No label but caption and shortcaption.

Text: C No label

No type but caption and shortcaption.

1: C No type

No type but label and no caption nor shortcaption.

2

No label, no type, no caption no shortcaption.

No label, no type, but caption and shortcaption.

C No label, no type, but caption and shortcaption.

Second float with no type.

3: C No type 2

A warning

Warning 1: C A warning

1 A chapter
***********

Text in chapter

Text 1.1: C Text in chapter

Text 1.2: An example of float caption, no shortcaption...

A théorème

théorème 1.1: C A théorème

float with no type.

1.1: C No type in chapter

A warning

Warning 1.1: C A warning in chapter

1.1 A section
=============

A text in float no caption a label a type.

Text 1.3
Unnumbered
**********

unnum

Text 5: C unnumbered float

float with no type.

5: C No type in unnumbered

Section within unnumbered
=========================

Section within unnumbered

Text 6: C Section within unnumbered

2 Chapter with unnumbsubsec
***************************

Chap

Text 2.1: C Chapter with subsec

unnumbered sec
==============

Chap

Text 2.2: C unnumbered sec float

float with no type.

2.1: C No type in unnumbered subsec in chapter

Appendix A Appendix for float
*****************************

Appendix

Text A.1: C appendix sec float

list of floats
**************

See Text 1.3: text in section.  And (see Text 1.1: text in chapter).
See Text 1: text with a lot of features.

   And now a ref (without manual or printed manual) cross ref: text with
a lot of features.

   And now a ref (with manual without printed manual) cross ref:
(manual)text with a lot of features.

   And now a ref (without manual with a printed manual) cross ref: text
with a lot of features in ‘printed manual title’.

   A ref to float without type 1: label but no type.

* Menu:

* Text 1: text with a lot of features.   TeX and someething
* Text 1.1: text in chapter.             C Text in chapter
* Text 1.2: float with a lot of features and no shortcaption.
                                         An example of float caption, no
                                         shortcaption...
* Text 1.3: text in section.             
* Text 5: unnumbered float.              SC unnumbered float
* Text 6: Section within unnumbered float.
                                         SC Section within unnumbered
* Text 2.1: Chapter with subsec float.   SC Chapter with subsec
* Text 2.2: unnumbered sec float.        SC unnumbered sec float
* Text A.1: appendix sec float.          SC appendix sec float

* Menu:

* théorème 1.1: theoreme.                C A théorème

';


$result_converted{'html'}->{'numbering_captions_listoffloats'} = '<!DOCTYPE html>
<html>
<!-- Created by texinfo, https://www.gnu.org/software/texinfo/ -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Test floats</title>

<meta name="description" content="Test floats">
<meta name="keywords" content="Test floats">
<meta name="resource-type" content="document">
<meta name="distribution" content="global">
<meta name="viewport" content="width=device-width,initial-scale=1">

<link href="#Top" rel="start" title="Top">
<style type="text/css">
<!--
a.copiable-link {visibility: hidden; text-decoration: none; line-height: 0em}
span:hover a.copiable-link {visibility: visible}
-->
</style>


</head>

<body lang="en">
<div class="top-level-extent" id="Top">
<div class="nav-panel">
<p>
Next: <a href="#chapter" accesskey="n" rel="next">A chapter</a> &nbsp; </p>
</div>
<h1 class="top" id="Test-floats"><span>Test floats<a class="copiable-link" href="#Test-floats"> &para;</a></span></h1>

<div class="float" id="text-with-a-lot-of-features">

<div class="caption"><p><strong class="strong">Text 1: </strong>An example of float caption<small class="enddots">...</small></p></div></div>
<div class="float">
<p>No label but caption and shortcaption.
</p>
<div class="caption"><p><strong class="strong">Text: </strong>C No label</p></div></div>
<div class="float" id="label-but-no-type">
<p>No type but caption and shortcaption.
</p>
<div class="caption"><p><strong class="strong">1: </strong>C No type</p></div></div>

<div class="float" id="label-but-no-type-and-no-caption">
<p>No type but label and no caption nor shortcaption.
</p>
<div class="type-number-float"><p><strong class="strong">2</strong></p></div></div>

<div class="float">
<p>No label, no type, no caption no shortcaption.
</p>
</div>
<div class="float">
<p>No label, no type, but caption and shortcaption.
</p><div class="caption"><p>C No label, no type, but caption and shortcaption.</p></div></div>
<div class="float" id="label-but-no-type-2">
<p>Second float with no type.
</p>
<div class="caption"><p><strong class="strong">3: </strong>C No type 2</p></div></div>
<div class="float" id="warning-in-top">
<p>A warning
</p>
<div class="caption"><p><strong class="strong">Warning 1: </strong>C A warning</p></div></div>

<ul class="mini-toc">
<li><a href="#chapter" accesskey="1">A chapter</a></li>
<li><a href="#Unnumbered" accesskey="2">Unnumbered</a></li>
<li><a href="#Chapter-with-unnumbsubsec" accesskey="3">Chapter with unnumbsubsec</a></li>
<li><a href="#Appendix-for-float" accesskey="4">Appendix for float</a></li>
<li><a href="#list-of-floats" accesskey="5">list of floats</a></li>
</ul>
<hr>
<div class="chapter-level-extent" id="chapter">
<div class="nav-panel">
<p>
Next: <a href="#Unnumbered" accesskey="n" rel="next">Unnumbered</a>, Previous: <a href="#Top" accesskey="p" rel="prev">Test floats</a>, Up: <a href="#Top" accesskey="u" rel="up">Test floats</a> &nbsp; </p>
</div>
<h2 class="chapter" id="A-chapter"><span>1 A chapter<a class="copiable-link" href="#A-chapter"> &para;</a></span></h2>

<div class="float" id="text-in-chapter">
<p>Text in chapter
</p>
<div class="caption"><p><strong class="strong">Text 1.1: </strong>C Text in chapter</p></div></div>
<div class="float" id="float-with-a-lot-of-features-and-no-shortcaption">
<div class="caption"><p><strong class="strong">Text 1.2: </strong>An example of float caption, no shortcaption<small class="enddots">...</small></p></div></div>
<div class="float" id="theoreme">
<p>A th&eacute;or&egrave;me
</p>
<div class="caption"><p><strong class="strong">th&eacute;or&egrave;me 1.1: </strong>C A th&eacute;or&egrave;me</p></div></div>
<div class="float" id="label-but-no-type-in-chapter">
<p>float with no type.
</p>
<div class="caption"><p><strong class="strong">1.1: </strong>C No type in chapter</p></div></div>
<div class="float" id="warning-in-chapter">
<p>A warning
</p>
<div class="caption"><p><strong class="strong">Warning 1.1: </strong>C A warning in chapter</p></div></div>

<ul class="mini-toc">
<li><a href="#section" accesskey="1">A section</a></li>
</ul>
<hr>
<div class="section-level-extent" id="section">
<div class="nav-panel">
<p>
Up: <a href="#chapter" accesskey="u" rel="up">A chapter</a> &nbsp; </p>
</div>
<h3 class="section" id="A-section"><span>1.1 A section<a class="copiable-link" href="#A-section"> &para;</a></span></h3>

<div class="float" id="text-in-section">

<p>A text in float no caption a label a type.
</p>
<div class="type-number-float"><p><strong class="strong">Text 1.3</strong></p></div></div>
<hr>
</div>
</div>
<div class="unnumbered-level-extent" id="Unnumbered">
<div class="nav-panel">
<p>
Next: <a href="#Chapter-with-unnumbsubsec" accesskey="n" rel="next">Chapter with unnumbsubsec</a>, Previous: <a href="#chapter" accesskey="p" rel="prev">A chapter</a>, Up: <a href="#Top" accesskey="u" rel="up">Test floats</a> &nbsp; </p>
</div>
<h2 class="unnumbered" id="Unnumbered-1"><span>Unnumbered<a class="copiable-link" href="#Unnumbered-1"> &para;</a></span></h2>

<div class="float" id="unnumbered-float">
<p>unnum
</p><div class="caption"><p><strong class="strong">Text 5: </strong>C unnumbered float</p></div></div><div class="float" id="label-but-no-type-in-unnumbered">
<p>float with no type.
</p>
<div class="caption"><p><strong class="strong">5: </strong>C No type in unnumbered</p></div></div>

<ul class="mini-toc">
<li><a href="#Section-within-unnumbered" accesskey="1">Section within unnumbered</a></li>
</ul>
<hr>
<div class="section-level-extent" id="Section-within-unnumbered">
<div class="nav-panel">
<p>
Up: <a href="#Unnumbered" accesskey="u" rel="up">Unnumbered</a> &nbsp; </p>
</div>
<h3 class="section" id="Section-within-unnumbered-1"><span>Section within unnumbered<a class="copiable-link" href="#Section-within-unnumbered-1"> &para;</a></span></h3>


<div class="float" id="Section-within-unnumbered-float">
<p>Section within unnumbered
</p><div class="caption"><p><strong class="strong">Text 6: </strong>C Section within unnumbered</p></div></div>
<hr>
</div>
</div>
<div class="chapter-level-extent" id="Chapter-with-unnumbsubsec">
<div class="nav-panel">
<p>
Next: <a href="#Appendix-for-float" accesskey="n" rel="next">Appendix for float</a>, Previous: <a href="#Unnumbered" accesskey="p" rel="prev">Unnumbered</a>, Up: <a href="#Top" accesskey="u" rel="up">Test floats</a> &nbsp; </p>
</div>
<h2 class="chapter" id="Chapter-with-unnumbsubsec-1"><span>2 Chapter with unnumbsubsec<a class="copiable-link" href="#Chapter-with-unnumbsubsec-1"> &para;</a></span></h2>

<div class="float" id="Chapter-with-subsec-float">
<p>Chap
</p><div class="caption"><p><strong class="strong">Text 2.1: </strong>C Chapter with subsec</p></div></div>
<ul class="mini-toc">
<li><a href="#unnumbered-sec" accesskey="1">unnumbered sec</a></li>
</ul>
<hr>
<div class="unnumberedsec-level-extent" id="unnumbered-sec">
<div class="nav-panel">
<p>
Up: <a href="#Chapter-with-unnumbsubsec" accesskey="u" rel="up">Chapter with unnumbsubsec</a> &nbsp; </p>
</div>
<h3 class="unnumberedsec" id="unnumbered-sec-1"><span>unnumbered sec<a class="copiable-link" href="#unnumbered-sec-1"> &para;</a></span></h3>

<div class="float" id="unnumbered-sec-float">
<p>Chap
</p><div class="caption"><p><strong class="strong">Text 2.2: </strong>C unnumbered sec float</p></div></div>
<div class="float" id="label-but-no-type-in-unnumbered-subsec-in-chapter">
<p>float with no type.
</p>
<div class="caption"><p><strong class="strong">2.1: </strong>C No type in unnumbered subsec in chapter</p></div></div>
<hr>
</div>
</div>
<div class="appendix-level-extent" id="Appendix-for-float">
<div class="nav-panel">
<p>
Next: <a href="#list-of-floats" accesskey="n" rel="next">list of floats</a>, Previous: <a href="#Chapter-with-unnumbsubsec" accesskey="p" rel="prev">Chapter with unnumbsubsec</a>, Up: <a href="#Top" accesskey="u" rel="up">Test floats</a> &nbsp; </p>
</div>
<h2 class="appendix" id="Appendix-for-float-1"><span>Appendix A Appendix for float<a class="copiable-link" href="#Appendix-for-float-1"> &para;</a></span></h2>

<div class="float" id="appendix-sec-float">

<p>Appendix
</p><div class="caption"><p><strong class="strong">Text A.1: </strong>C appendix sec float</p></div></div>
<hr>
</div>
<div class="unnumbered-level-extent" id="list-of-floats">
<div class="nav-panel">
<p>
Previous: <a href="#Appendix-for-float" accesskey="p" rel="prev">Appendix for float</a>, Up: <a href="#Top" accesskey="u" rel="up">Test floats</a> &nbsp; </p>
</div>
<h2 class="unnumbered" id="list-of-floats-1"><span>list of floats<a class="copiable-link" href="#list-of-floats-1"> &para;</a></span></h2>

<p>See <a class="ref" href="#text-in-section">Text 1.3</a>.
And (see <a class="pxref" href="#text-in-chapter">Text 1.1</a>).
See <a class="xref" href="#text-with-a-lot-of-features">Text 1</a>.
</p>
<p>And now a ref (without manual or printed manual)
<a class="ref" href="#text-with-a-lot-of-features">title</a>.
</p>
<p>And now a ref (with manual without printed manual)
<a data-manual="manual" href="manual.html#text-with-a-lot-of-features">title</a>.
</p>
<p>And now a ref (without manual with a printed manual)
&lsquo;title&rsquo; in <cite class="cite">printed manual title</cite>.
</p>
<p>A ref to float without type <a class="ref" href="#label-but-no-type">1</a>.
</p>
<dl class="listoffloats">
<dt><a href="#text-with-a-lot-of-features">Text 1</a></dt><dd class="shortcaption-in-listoffloats"><p>TeX and someething</p></dd>
<dt><a href="#text-in-chapter">Text 1.1</a></dt><dd class="caption-in-listoffloats"><p>C Text in chapter</p></dd>
<dt><a href="#float-with-a-lot-of-features-and-no-shortcaption">Text 1.2</a></dt><dd class="caption-in-listoffloats"><p>An example of float caption, no shortcaption<small class="enddots">...</small></p></dd>
<dt><a href="#text-in-section">Text 1.3</a></dt><dd></dd>
<dt><a href="#unnumbered-float">Text 5</a></dt><dd class="shortcaption-in-listoffloats"><p>SC unnumbered float</p></dd>
<dt><a href="#Section-within-unnumbered-float">Text 6</a></dt><dd class="shortcaption-in-listoffloats"><p>SC Section within unnumbered</p></dd>
<dt><a href="#Chapter-with-subsec-float">Text 2.1</a></dt><dd class="shortcaption-in-listoffloats"><p>SC Chapter with subsec</p></dd>
<dt><a href="#unnumbered-sec-float">Text 2.2</a></dt><dd class="shortcaption-in-listoffloats"><p>SC unnumbered sec float</p></dd>
<dt><a href="#appendix-sec-float">Text A.1</a></dt><dd class="shortcaption-in-listoffloats"><p>SC appendix sec float</p></dd>
</dl>
<dl class="listoffloats">
<dt><a href="#theoreme">th&eacute;or&egrave;me 1.1</a></dt><dd class="caption-in-listoffloats"><p>C A th&eacute;or&egrave;me</p></dd>
</dl>

</div>
</div>



</body>
</html>
';


$result_converted{'xml'}->{'numbering_captions_listoffloats'} = '<node name="Top" spaces=" "><nodename>Top</nodename><nodenext automatic="on">chapter</nodenext></node>
<top spaces=" "><sectiontitle>Test floats</sectiontitle>

<float name="text-with-a-lot-of-features" type="Text" number="1" spaces=" " endspaces=" "><floattype>Text</floattype><floatname spaces=" ">text with a lot of features</floatname>

<caption spaces=" "><para>An example of float caption&enddots;</para></caption>
<shortcaption><para>&tex; and someething</para></shortcaption>
</float>

<float type="Text" spaces=" " endspaces=" "><floattype>Text</floattype>
<para>No label but caption and shortcaption.
</para>
<caption><para>C No label</para></caption>
<shortcaption><para>SC No label</para></shortcaption>
</float>

<float name="label-but-no-type" type="" number="1" spaces=" " endspaces=" "><floatname>label but no type</floatname>
<para>No type but caption and shortcaption.
</para>
<caption><para>C No type</para></caption>
<shortcaption><para>SC No type</para></shortcaption>
</float>


<float name="label-but-no-type-and-no-caption" type="" number="2" spaces=" " endspaces=" "><floatname>label but no type and no caption</floatname>
<para>No type but label and no caption nor shortcaption.
</para>
</float>


<float type="" endspaces=" ">
<para>No label, no type, no caption no shortcaption.
</para>
</float>

<float type="" endspaces=" ">
<para>No label, no type, but caption and shortcaption.
</para><caption><para>C No label, no type, but caption and shortcaption.</para></caption>
<shortcaption><para>SC No label, no type, but caption and shortcaption.</para></shortcaption>
</float>

<float name="label-but-no-type-2" type="" number="3" spaces=" " endspaces=" "><floatname>label but no type 2</floatname>
<para>Second float with no type.
</para>
<caption><para>C No type 2</para></caption>
<shortcaption><para>SC No type 2</para></shortcaption>
</float>

<float name="warning-in-top" type="Warning" number="1" spaces=" " endspaces=" "><floattype>Warning</floattype><floatname spaces=" ">warning in top</floatname>
<para>A warning
</para>
<caption><para>C A warning</para></caption>
<shortcaption><para>SC A warning</para></shortcaption>
</float>

<menu endspaces=" ">
<menuentry><menuleadingtext>* </menuleadingtext><menunode>chapter</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode>Unnumbered</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode>Chapter with unnumbsubsec</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode>Appendix for float</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode>list of floats</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry></menu>

</top>
<node name="chapter" spaces=" "><nodename>chapter</nodename><nodenext automatic="on">Unnumbered</nodenext><nodeprev automatic="on">Top</nodeprev><nodeup automatic="on">Top</nodeup></node>
<chapter spaces=" "><sectiontitle>A chapter</sectiontitle>

<float name="text-in-chapter" type="Text" number="1.1" spaces=" " endspaces=" "><floattype>Text</floattype><floatname spaces=" ">text in chapter</floatname>
<para>Text in chapter
</para>
<caption><para>C Text in chapter</para></caption>
</float>

<float name="float-with-a-lot-of-features-and-no-shortcaption" type="Text" number="1.2" spaces=" " endspaces=" "><floattype>Text</floattype><floatname spaces=" ">float with a lot of features and no shortcaption</floatname>
<caption spaces=" "><para>An example of float caption, no shortcaption&enddots;</para></caption>
</float>

<float name="theoreme" type="théorème" number="1.1" spaces=" " endspaces=" "><floattype>th<accent type="acute" bracketed="off">e</accent>or<accent type="grave" bracketed="off">e</accent>me</floattype><floatname spaces=" ">theoreme</floatname>
<para>A th<accent type="acute" bracketed="off">e</accent>or<accent type="grave" bracketed="off">e</accent>me
</para>
<caption><para>C A th<accent type="acute" bracketed="off">e</accent>or<accent type="grave" bracketed="off">e</accent>me</para></caption>
</float>

<float name="label-but-no-type-in-chapter" type="" number="1.1" spaces=" " endspaces=" "><floatname>label but no type in chapter</floatname>
<para>float with no type.
</para>
<caption><para>C No type in chapter</para></caption>
<shortcaption><para>SC No type in chapter</para></shortcaption>
</float>

<float name="warning-in-chapter" type="Warning" number="1.1" spaces=" " endspaces=" "><floattype>Warning</floattype><floatname spaces=" ">warning in chapter</floatname>
<para>A warning
</para>
<caption><para>C A warning in chapter</para></caption>
<shortcaption><para>SC A warning in chapter</para></shortcaption>
</float>

<menu endspaces=" ">
<menuentry><menuleadingtext>* </menuleadingtext><menunode>section</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry></menu>

<node name="section" spaces=" "><nodename>section</nodename><nodeup automatic="on">chapter</nodeup></node>
<section spaces=" "><sectiontitle>A section</sectiontitle>

<float name="text-in-section" type="Text" number="1.3" spaces=" " endspaces=" "><floattype>Text</floattype><floatname spaces=" ">text in section</floatname>

<para>A text in float no caption a label a type.
</para>
</float>

</section>
</chapter>
<node name="Unnumbered" spaces=" "><nodename>Unnumbered</nodename><nodenext automatic="on">Chapter with unnumbsubsec</nodenext><nodeprev automatic="on">chapter</nodeprev><nodeup automatic="on">Top</nodeup></node>
<unnumbered spaces=" "><sectiontitle>Unnumbered</sectiontitle>

<menu endspaces=" ">
<menuentry><menuleadingtext>* </menuleadingtext><menunode>Section within unnumbered</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry></menu>
<float name="unnumbered-float" type="Text" number="5" spaces=" " endspaces=" "><floattype>Text</floattype><floatname spaces=" ">unnumbered float</floatname>
<para>unnum
</para><shortcaption><para>SC unnumbered float</para></shortcaption>
<caption><para>C unnumbered float</para></caption>
</float>
<float name="label-but-no-type-in-unnumbered" type="" number="5" spaces=" " endspaces=" "><floatname>label but no type in unnumbered</floatname>
<para>float with no type.
</para>
<caption><para>C No type in unnumbered</para></caption>
<shortcaption><para>SC No type in unnumbered</para></shortcaption>
</float>


<node name="Section-within-unnumbered" spaces=" "><nodename>Section within unnumbered</nodename><nodeup automatic="on">Unnumbered</nodeup></node>
<section spaces=" "><sectiontitle>Section within unnumbered</sectiontitle>


<float name="Section-within-unnumbered-float" type="Text" number="6" spaces=" " endspaces=" "><floattype>Text</floattype><floatname spaces=" ">Section within unnumbered float</floatname>
<para>Section within unnumbered
</para><shortcaption><para>SC Section within unnumbered</para></shortcaption>
<caption><para>C Section within unnumbered</para></caption>
</float>

</section>
</unnumbered>
<node name="Chapter-with-unnumbsubsec" spaces=" "><nodename>Chapter with unnumbsubsec</nodename><nodenext automatic="on">Appendix for float</nodenext><nodeprev automatic="on">Unnumbered</nodeprev><nodeup automatic="on">Top</nodeup></node>
<chapter spaces=" "><sectiontitle>Chapter with unnumbsubsec</sectiontitle>

<menu endspaces=" ">
<menuentry><menuleadingtext>* </menuleadingtext><menunode>unnumbered sec</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry></menu>
<float name="Chapter-with-subsec-float" type="Text" number="2.1" spaces=" " endspaces=" "><floattype>Text</floattype><floatname spaces=" ">Chapter with subsec float</floatname>
<para>Chap
</para><shortcaption><para>SC Chapter with subsec</para></shortcaption>
<caption><para>C Chapter with subsec</para></caption>
</float>

<node name="unnumbered-sec" spaces=" "><nodename>unnumbered sec</nodename><nodeup automatic="on">Chapter with unnumbsubsec</nodeup></node>
<unnumberedsec spaces=" "><sectiontitle>unnumbered sec</sectiontitle>

<float name="unnumbered-sec-float" type="Text" number="2.2" spaces=" " endspaces=" "><floattype>Text</floattype><floatname spaces=" ">unnumbered sec float</floatname>
<para>Chap
</para><shortcaption><para>SC unnumbered sec float</para></shortcaption>
<caption><para>C unnumbered sec float</para></caption>
</float>

<float name="label-but-no-type-in-unnumbered-subsec-in-chapter" type="" number="2.1" spaces=" " endspaces=" "><floatname>label but no type in unnumbered subsec in chapter</floatname>
<para>float with no type.
</para>
<caption><para>C No type in unnumbered subsec in chapter</para></caption>
<shortcaption><para>SC No type in unnumbered subsec in chapter</para></shortcaption>
</float>

</unnumberedsec>
</chapter>
<node name="Appendix-for-float" spaces=" "><nodename>Appendix for float</nodename><nodenext automatic="on">list of floats</nodenext><nodeprev automatic="on">Chapter with unnumbsubsec</nodeprev><nodeup automatic="on">Top</nodeup></node>
<appendix spaces=" "><sectiontitle>Appendix for float</sectiontitle>

<float name="appendix-sec-float" type="Text" number="A.1" spaces=" " endspaces=" "><floattype>Text</floattype><floatname spaces=" ">appendix sec float</floatname>

<para>Appendix
</para><shortcaption><para>SC appendix sec float</para></shortcaption>
<caption><para>C appendix sec float</para></caption>
</float>

</appendix>
<node name="list-of-floats" spaces=" "><nodename>list of floats</nodename><nodeprev automatic="on">Appendix for float</nodeprev><nodeup automatic="on">Top</nodeup></node>
<unnumbered spaces=" "><sectiontitle>list of floats</sectiontitle>

<para>See <ref label="text-in-section"><xrefnodename>text in section</xrefnodename></ref>.
And (<pxref label="text-in-chapter"><xrefnodename>text in chapter</xrefnodename></pxref>).
<xref label="text-with-a-lot-of-features"><xrefnodename>text with a lot of features</xrefnodename></xref>.
</para>
<para>And now a ref (without manual or printed manual)
<ref label="text-with-a-lot-of-features"><xrefnodename>text with a lot of features</xrefnodename><xrefinfoname spaces=" ">cross ref</xrefinfoname><xrefprinteddesc spaces=" ">title</xrefprinteddesc></ref>.
</para>
<para>And now a ref (with manual without printed manual)
<ref label="text-with-a-lot-of-features" manual="manual"><xrefnodename>text with a lot of features</xrefnodename><xrefinfoname spaces=" ">cross ref</xrefinfoname><xrefprinteddesc spaces=" ">title</xrefprinteddesc><xrefinfofile spaces=" ">manual</xrefinfofile></ref>.
</para>
<para>And now a ref (without manual with a printed manual)
<ref label="text-with-a-lot-of-features"><xrefnodename>text with a lot of features</xrefnodename><xrefinfoname spaces=" ">cross ref</xrefinfoname><xrefprinteddesc spaces=" ">title</xrefprinteddesc><xrefprintedname spaces=" ">printed manual title</xrefprintedname></ref>.
</para>
<para>A ref to float without type <ref label="label-but-no-type"><xrefnodename>label but no type</xrefnodename></ref>.
</para>
<listoffloats type="Text" spaces=" ">Text</listoffloats>
<listoffloats type="théorème" spaces=" ">th<accent type="acute" bracketed="off">e</accent>or<accent type="grave" bracketed="off">e</accent>me</listoffloats>

</unnumbered>
<bye></bye>
<postambleafterend>

</postambleafterend>';


$result_converted{'latex'}->{'numbering_captions_listoffloats'} = '\\documentclass{book}
\\usepackage{amsfonts}
\\usepackage{amsmath}
\\usepackage[gen]{eurosym}
\\usepackage{textcomp}
\\usepackage{graphicx}
\\usepackage{etoolbox}
\\usepackage{titleps}
\\usepackage[utf8]{inputenc}
\\usepackage[T1]{fontenc}
\\usepackage{float}
% use hidelinks to remove boxes around links to be similar to Texinfo TeX
\\usepackage[hidelinks]{hyperref}

\\makeatletter
\\newcommand{\\Texinfosettitle}{No Title}%

% new float for type `\'
\\newfloat{TexinfoFloat}{htb}{tfl}[chapter]
\\floatname{TexinfoFloat}{}
% new float for type `Text\'
\\newfloat{TexinfoFloatText}{htb}{tfl}[chapter]
\\floatname{TexinfoFloatText}{}
% new float for type `Warning\'
\\newfloat{TexinfoFloatWarning}{htb}{tfl}[chapter]
\\floatname{TexinfoFloatWarning}{}
% new float for type `théorème\'
\\newfloat{TexinfoFloattheoreme}{htb}{tfl}[chapter]
\\floatname{TexinfoFloattheoreme}{}
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
\\label{anchor:text-with-a-lot-of-features}%
\\label{anchor:label-but-no-type}%
\\label{anchor:label-but-no-type-and-no-caption}%
\\label{anchor:label-but-no-type-2}%
\\label{anchor:warning-in-top}%
\\chapter{{A chapter}}
\\label{anchor:chapter}%

\\begin{TexinfoFloatText}
Text in chapter

\\caption{C Text in chapter}
\\label{anchor:text-in-chapter}%
\\end{TexinfoFloatText}

\\begin{TexinfoFloatText}
\\caption{An example of float caption, no shortcaption\\dots{}}
\\label{anchor:float-with-a-lot-of-features-and-no-shortcaption}%
\\end{TexinfoFloatText}

\\begin{TexinfoFloattheoreme}
A th\\\'{e}or\\`{e}me

\\caption{C A th\\\'{e}or\\`{e}me}
\\label{anchor:theoreme}%
\\end{TexinfoFloattheoreme}

\\begin{TexinfoFloat}
float with no type.

\\caption[SC No type in chapter]{C No type in chapter}
\\label{anchor:label-but-no-type-in-chapter}%
\\end{TexinfoFloat}

\\begin{TexinfoFloatWarning}
A warning

\\caption[SC A warning in chapter]{C A warning in chapter}
\\label{anchor:warning-in-chapter}%
\\end{TexinfoFloatWarning}


\\section{{A section}}
\\label{anchor:section}%

\\begin{TexinfoFloatText}

A text in float no caption a label a type.

\\label{anchor:text-in-section}%
\\end{TexinfoFloatText}

\\chapter*{{Unnumbered}}
\\label{anchor:Unnumbered}%

\\begin{TexinfoFloatText}
unnum
\\caption[SC unnumbered float]{C unnumbered float}
\\label{anchor:unnumbered-float}%
\\end{TexinfoFloatText}
\\begin{TexinfoFloat}
float with no type.

\\caption[SC No type in unnumbered]{C No type in unnumbered}
\\label{anchor:label-but-no-type-in-unnumbered}%
\\end{TexinfoFloat}


\\section{{Section within unnumbered}}
\\label{anchor:Section-within-unnumbered}%


\\begin{TexinfoFloatText}
Section within unnumbered
\\caption[SC Section within unnumbered]{C Section within unnumbered}
\\label{anchor:Section-within-unnumbered-float}%
\\end{TexinfoFloatText}

\\chapter{{Chapter with unnumbsubsec}}
\\label{anchor:Chapter-with-unnumbsubsec}%

\\begin{TexinfoFloatText}
Chap
\\caption[SC Chapter with subsec]{C Chapter with subsec}
\\label{anchor:Chapter-with-subsec-float}%
\\end{TexinfoFloatText}

\\section*{{unnumbered sec}}
\\label{anchor:unnumbered-sec}%

\\begin{TexinfoFloatText}
Chap
\\caption[SC unnumbered sec float]{C unnumbered sec float}
\\label{anchor:unnumbered-sec-float}%
\\end{TexinfoFloatText}

\\begin{TexinfoFloat}
float with no type.

\\caption[SC No type in unnumbered subsec in chapter]{C No type in unnumbered subsec in chapter}
\\label{anchor:label-but-no-type-in-unnumbered-subsec-in-chapter}%
\\end{TexinfoFloat}

\\appendix
\\chapter{{Appendix for float}}
\\label{anchor:Appendix-for-float}%

\\begin{TexinfoFloatText}

Appendix
\\caption[SC appendix sec float]{C appendix sec float}
\\label{anchor:appendix-sec-float}%
\\end{TexinfoFloatText}

\\chapter*{{list of floats}}
\\label{anchor:list-of-floats}%

See \\hyperref[anchor:text-in-section]{Text~\\ref*{anchor:text-in-section}}.
And (see \\hyperref[anchor:text-in-chapter]{Text~\\ref*{anchor:text-in-chapter}}).
See \\hyperref[anchor:text-with-a-lot-of-features]{Text~\\ref*{anchor:text-with-a-lot-of-features}}.

And now a ref (without manual or printed manual)
\\hyperref[anchor:text-with-a-lot-of-features]{title}.

And now a ref (with manual without printed manual)
Section ``title\'\' in \\texttt{manual}.

And now a ref (without manual with a printed manual)
Section ``title\'\' in \\textsl{printed manual title}.

A ref to float without type \\hyperref[anchor:label-but-no-type]{\\ref*{anchor:label-but-no-type}}.

\\listof{TexinfoFloatText}{}
\\listof{TexinfoFloattheoreme}{}

\\end{document}
';

1;
