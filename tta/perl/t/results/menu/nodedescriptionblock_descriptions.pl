use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'nodedescriptionblock_descriptions'} = {
  'contents' => [
    {
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
                  'text' => 'test of nodedescriptionblock used in menu'
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
                      'text' => 'toto'
                    }
                  ],
                  'extra' => {
                    'node_content' => {
                      'contents' => [
                        {}
                      ]
                    },
                    'normalized' => 'toto'
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
                'line_nr' => 5
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
                      'text' => 'titi'
                    }
                  ],
                  'extra' => {
                    'node_content' => {
                      'contents' => [
                        {}
                      ]
                    },
                    'normalized' => 'titi'
                  },
                  'type' => 'menu_entry_node'
                },
                {
                  'text' => '::  ',
                  'type' => 'menu_entry_separator'
                },
                {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'desc of titi
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
                'line_nr' => 6
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
                      'text' => 'name of other'
                    }
                  ],
                  'type' => 'menu_entry_name'
                },
                {
                  'text' => ': ',
                  'type' => 'menu_entry_separator'
                },
                {
                  'contents' => [
                    {
                      'text' => 'other'
                    }
                  ],
                  'extra' => {
                    'node_content' => {
                      'contents' => [
                        {}
                      ]
                    },
                    'normalized' => 'other'
                  },
                  'type' => 'menu_entry_node'
                },
                {
                  'text' => '.',
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
                'line_nr' => 7
              },
              'type' => 'menu_entry'
            },
            {
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => '
',
                      'type' => 'after_menu_description_line'
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
                      'text' => 'a somewhat long node without description nor following space'
                    }
                  ],
                  'extra' => {
                    'node_content' => {
                      'contents' => [
                        {}
                      ]
                    },
                    'normalized' => 'a-somewhat-long-node-without-description-nor-following-space'
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
                'line_nr' => 9
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
                      'text' => 'node double nodedescriptionblock'
                    }
                  ],
                  'extra' => {
                    'node_content' => {
                      'contents' => [
                        {}
                      ]
                    },
                    'normalized' => 'node-double-nodedescriptionblock'
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
                'line_nr' => 10
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
                'line_nr' => 11
              }
            }
          ],
          'source_info' => {
            'line_nr' => 4
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
                  'text' => 'toto'
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
        'node_description' => {
          'cmdname' => 'nodedescription',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'toto is there:: and the '
                },
                {
                  'cmdname' => 'emph',
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'is a description'
                        }
                      ],
                      'type' => 'brace_container'
                    }
                  ],
                  'source_info' => {
                    'line_nr' => 16
                  }
                },
                {
                  'cmdname' => 'w',
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'slightly long'
                        }
                      ],
                      'type' => 'brace_container'
                    }
                  ],
                  'source_info' => {
                    'line_nr' => 16
                  }
                },
                {
                  'text' => ' and '
                },
                {
                  'cmdname' => 'verb',
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'vv somewhat',
                          'type' => 'raw'
                        }
                      ],
                      'type' => 'brace_container'
                    }
                  ],
                  'info' => {
                    'delimiter' => ':'
                  },
                  'source_info' => {
                    'line_nr' => 16
                  }
                },
                {
                  'text' => ' '
                },
                {
                  'cmdname' => 'ringaccent',
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'a'
                        }
                      ],
                      'type' => 'following_arg'
                    }
                  ],
                  'info' => {
                    'spaces_after_cmd_before_arg' => {
                      'text' => ' '
                    }
                  },
                  'source_info' => {
                    'line_nr' => 16
                  }
                },
                {
                  'text' => 'nexpected'
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
            'element_node' => {}
          },
          'info' => {
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'line_nr' => 16
          }
        },
        'node_long_description' => {
          'cmdname' => 'nodedescriptionblock',
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
                  'text' => 'Block along line node description for toto
'
                }
              ],
              'type' => 'paragraph'
            },
            {
              'cmdname' => 'end',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'nodedescriptionblock'
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
                'text_arg' => 'nodedescriptionblock'
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'line_nr' => 20
              }
            }
          ],
          'extra' => {
            'element_node' => {}
          },
          'source_info' => {
            'line_nr' => 18
          }
        },
        'normalized' => 'toto'
      },
      'info' => {
        'spaces_before_argument' => {
          'text' => ' '
        }
      },
      'source_info' => {
        'line_nr' => 13
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
                  'text' => 'Toto'
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
        {},
        {
          'text' => '
',
          'type' => 'empty_line'
        },
        {},
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
        'line_nr' => 14
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
                  'text' => 'titi'
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
        'node_description' => {
          'cmdname' => 'nodedescriptionblock',
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
                  'text' => 'description of titi in block
'
                }
              ],
              'type' => 'paragraph'
            },
            {
              'cmdname' => 'end',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'nodedescriptionblock'
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
                'text_arg' => 'nodedescriptionblock'
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'line_nr' => 27
              }
            }
          ],
          'extra' => {
            'element_node' => {}
          },
          'source_info' => {
            'line_nr' => 25
          }
        },
        'node_long_description' => {},
        'normalized' => 'titi'
      },
      'info' => {
        'spaces_before_argument' => {
          'text' => ' '
        }
      },
      'source_info' => {
        'line_nr' => 22
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
                  'text' => 'Titi'
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
        {},
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
        'line_nr' => 23
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
                  'text' => 'other'
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
        'node_description' => {
          'cmdname' => 'nodedescriptionblock',
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
                  'text' => 'Long description of other
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
                  'text' => 'Para2
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
              'cmdname' => 'quotation',
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
                      'text' => 'a quotation in description
'
                    }
                  ],
                  'type' => 'paragraph'
                },
                {
                  'cmdname' => 'end',
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'quotation'
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
                    'text_arg' => 'quotation'
                  },
                  'info' => {
                    'spaces_before_argument' => {
                      'text' => ' '
                    }
                  },
                  'source_info' => {
                    'line_nr' => 39
                  }
                }
              ],
              'source_info' => {
                'line_nr' => 37
              }
            },
            {
              'cmdname' => 'end',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'nodedescriptionblock'
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
                'text_arg' => 'nodedescriptionblock'
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
            'element_node' => {}
          },
          'source_info' => {
            'line_nr' => 32
          }
        },
        'node_long_description' => {},
        'normalized' => 'other'
      },
      'info' => {
        'spaces_before_argument' => {
          'text' => ' '
        }
      },
      'source_info' => {
        'line_nr' => 29
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
                  'text' => 'Other'
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
        {},
        {
          'text' => '
',
          'type' => 'empty_line'
        }
      ],
      'extra' => {
        'section_number' => '3'
      },
      'info' => {
        'spaces_before_argument' => {
          'text' => ' '
        }
      },
      'source_info' => {
        'line_nr' => 30
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
                  'text' => 'a somewhat long node without description nor following space'
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
        'node_description' => {
          'cmdname' => 'nodedescription',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'not as long as the node'
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
            'element_node' => {}
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
        'node_long_description' => {
          'cmdname' => 'nodedescriptionblock',
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
                  'text' => 'Block description before, not as long as the node
'
                }
              ],
              'type' => 'paragraph'
            },
            {
              'cmdname' => 'end',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'nodedescriptionblock'
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
                'text_arg' => 'nodedescriptionblock'
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
            'element_node' => {}
          },
          'source_info' => {
            'line_nr' => 45
          }
        },
        'normalized' => 'a-somewhat-long-node-without-description-nor-following-space'
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
      'cmdname' => 'chapter',
      'contents' => [
        {
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'Somewhat long'
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
        {},
        {
          'text' => '
',
          'type' => 'empty_line'
        },
        {},
        {
          'text' => '
',
          'type' => 'empty_line'
        }
      ],
      'extra' => {
        'section_number' => '4'
      },
      'info' => {
        'spaces_before_argument' => {
          'text' => ' '
        }
      },
      'source_info' => {
        'line_nr' => 43
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
                  'text' => 'node double nodedescriptionblock'
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
        'node_description' => {
          'cmdname' => 'nodedescriptionblock',
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
                  'text' => 'block desc 1
'
                }
              ],
              'type' => 'paragraph'
            },
            {
              'cmdname' => 'end',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'nodedescriptionblock'
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
                'text_arg' => 'nodedescriptionblock'
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'line_nr' => 56
              }
            }
          ],
          'extra' => {
            'element_node' => {}
          },
          'source_info' => {
            'line_nr' => 54
          }
        },
        'node_long_description' => {},
        'normalized' => 'node-double-nodedescriptionblock'
      },
      'info' => {
        'spaces_before_argument' => {
          'text' => ' '
        }
      },
      'source_info' => {
        'line_nr' => 51
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
                  'text' => 'test double'
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
        {},
        {
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'cmdname' => 'nodedescriptionblock',
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
                  'text' => 'block desc 2
'
                }
              ],
              'type' => 'paragraph'
            },
            {
              'cmdname' => 'end',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'nodedescriptionblock'
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
                'text_arg' => 'nodedescriptionblock'
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'line_nr' => 60
              }
            }
          ],
          'extra' => {
            'element_node' => {}
          },
          'source_info' => {
            'line_nr' => 58
          }
        },
        {
          'text' => '
',
          'type' => 'empty_line'
        }
      ],
      'extra' => {
        'section_number' => '5'
      },
      'info' => {
        'spaces_before_argument' => {
          'text' => ' '
        }
      },
      'source_info' => {
        'line_nr' => 52
      }
    }
  ],
  'type' => 'document_root'
};
$result_trees{'nodedescriptionblock_descriptions'}{'contents'}[2]{'contents'}[2]{'contents'}[1]{'contents'}[1]{'extra'}{'node_content'}{'contents'}[0] = $result_trees{'nodedescriptionblock_descriptions'}{'contents'}[2]{'contents'}[2]{'contents'}[1]{'contents'}[1]{'contents'}[0];
$result_trees{'nodedescriptionblock_descriptions'}{'contents'}[2]{'contents'}[2]{'contents'}[2]{'contents'}[1]{'extra'}{'node_content'}{'contents'}[0] = $result_trees{'nodedescriptionblock_descriptions'}{'contents'}[2]{'contents'}[2]{'contents'}[2]{'contents'}[1]{'contents'}[0];
$result_trees{'nodedescriptionblock_descriptions'}{'contents'}[2]{'contents'}[2]{'contents'}[3]{'contents'}[3]{'extra'}{'node_content'}{'contents'}[0] = $result_trees{'nodedescriptionblock_descriptions'}{'contents'}[2]{'contents'}[2]{'contents'}[3]{'contents'}[3]{'contents'}[0];
$result_trees{'nodedescriptionblock_descriptions'}{'contents'}[2]{'contents'}[2]{'contents'}[5]{'contents'}[1]{'extra'}{'node_content'}{'contents'}[0] = $result_trees{'nodedescriptionblock_descriptions'}{'contents'}[2]{'contents'}[2]{'contents'}[5]{'contents'}[1]{'contents'}[0];
$result_trees{'nodedescriptionblock_descriptions'}{'contents'}[2]{'contents'}[2]{'contents'}[6]{'contents'}[1]{'extra'}{'node_content'}{'contents'}[0] = $result_trees{'nodedescriptionblock_descriptions'}{'contents'}[2]{'contents'}[2]{'contents'}[6]{'contents'}[1]{'contents'}[0];
$result_trees{'nodedescriptionblock_descriptions'}{'contents'}[3]{'extra'}{'node_description'}{'extra'}{'element_node'} = $result_trees{'nodedescriptionblock_descriptions'}{'contents'}[3];
$result_trees{'nodedescriptionblock_descriptions'}{'contents'}[3]{'extra'}{'node_long_description'}{'extra'}{'element_node'} = $result_trees{'nodedescriptionblock_descriptions'}{'contents'}[3];
$result_trees{'nodedescriptionblock_descriptions'}{'contents'}[4]{'contents'}[2] = $result_trees{'nodedescriptionblock_descriptions'}{'contents'}[3]{'extra'}{'node_description'};
$result_trees{'nodedescriptionblock_descriptions'}{'contents'}[4]{'contents'}[4] = $result_trees{'nodedescriptionblock_descriptions'}{'contents'}[3]{'extra'}{'node_long_description'};
$result_trees{'nodedescriptionblock_descriptions'}{'contents'}[5]{'extra'}{'node_description'}{'extra'}{'element_node'} = $result_trees{'nodedescriptionblock_descriptions'}{'contents'}[5];
$result_trees{'nodedescriptionblock_descriptions'}{'contents'}[5]{'extra'}{'node_long_description'} = $result_trees{'nodedescriptionblock_descriptions'}{'contents'}[5]{'extra'}{'node_description'};
$result_trees{'nodedescriptionblock_descriptions'}{'contents'}[6]{'contents'}[2] = $result_trees{'nodedescriptionblock_descriptions'}{'contents'}[5]{'extra'}{'node_description'};
$result_trees{'nodedescriptionblock_descriptions'}{'contents'}[7]{'extra'}{'node_description'}{'extra'}{'element_node'} = $result_trees{'nodedescriptionblock_descriptions'}{'contents'}[7];
$result_trees{'nodedescriptionblock_descriptions'}{'contents'}[7]{'extra'}{'node_long_description'} = $result_trees{'nodedescriptionblock_descriptions'}{'contents'}[7]{'extra'}{'node_description'};
$result_trees{'nodedescriptionblock_descriptions'}{'contents'}[8]{'contents'}[2] = $result_trees{'nodedescriptionblock_descriptions'}{'contents'}[7]{'extra'}{'node_description'};
$result_trees{'nodedescriptionblock_descriptions'}{'contents'}[9]{'extra'}{'node_description'}{'extra'}{'element_node'} = $result_trees{'nodedescriptionblock_descriptions'}{'contents'}[9];
$result_trees{'nodedescriptionblock_descriptions'}{'contents'}[9]{'extra'}{'node_long_description'}{'extra'}{'element_node'} = $result_trees{'nodedescriptionblock_descriptions'}{'contents'}[9];
$result_trees{'nodedescriptionblock_descriptions'}{'contents'}[10]{'contents'}[2] = $result_trees{'nodedescriptionblock_descriptions'}{'contents'}[9]{'extra'}{'node_long_description'};
$result_trees{'nodedescriptionblock_descriptions'}{'contents'}[10]{'contents'}[4] = $result_trees{'nodedescriptionblock_descriptions'}{'contents'}[9]{'extra'}{'node_description'};
$result_trees{'nodedescriptionblock_descriptions'}{'contents'}[11]{'extra'}{'node_description'}{'extra'}{'element_node'} = $result_trees{'nodedescriptionblock_descriptions'}{'contents'}[11];
$result_trees{'nodedescriptionblock_descriptions'}{'contents'}[11]{'extra'}{'node_long_description'} = $result_trees{'nodedescriptionblock_descriptions'}{'contents'}[11]{'extra'}{'node_description'};
$result_trees{'nodedescriptionblock_descriptions'}{'contents'}[12]{'contents'}[2] = $result_trees{'nodedescriptionblock_descriptions'}{'contents'}[11]{'extra'}{'node_description'};
$result_trees{'nodedescriptionblock_descriptions'}{'contents'}[12]{'contents'}[4]{'extra'}{'element_node'} = $result_trees{'nodedescriptionblock_descriptions'}{'contents'}[11];

$result_texis{'nodedescriptionblock_descriptions'} = '@node Top
@top test of nodedescriptionblock used in menu

@menu
* toto::
* titi::  desc of titi
* name of other: other.

* a somewhat long node without description nor following space::
* node double nodedescriptionblock::
@end menu

@node toto
@chapter Toto

@nodedescription toto is there:: and the @emph{is a description}@w{slightly long} and @verb{:vv somewhat:} @ringaccent anexpected

@nodedescriptionblock
Block along line node description for toto
@end nodedescriptionblock

@node titi
@chapter Titi

@nodedescriptionblock
description of titi in block
@end nodedescriptionblock

@node other
@chapter Other

@nodedescriptionblock
Long description of other

Para2

@quotation
a quotation in description
@end quotation
@end nodedescriptionblock

@node a somewhat long node without description nor following space
@chapter Somewhat long

@nodedescriptionblock
Block description before, not as long as the node
@end nodedescriptionblock

@nodedescription not as long as the node

@node node double nodedescriptionblock
@chapter test double

@nodedescriptionblock
block desc 1
@end nodedescriptionblock

@nodedescriptionblock
block desc 2
@end nodedescriptionblock

';


$result_texts{'nodedescriptionblock_descriptions'} = 'test of nodedescriptionblock used in menu
*****************************************

* toto::
* titi::  desc of titi
* name of other: other.

* a somewhat long node without description nor following space::
* node double nodedescriptionblock::

1 Toto
******



2 Titi
******


3 Other
*******


4 Somewhat long
***************



5 test double
*************



';

$result_sectioning{'nodedescriptionblock_descriptions'} = {
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
                    'normalized' => 'toto'
                  }
                },
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
              'cmdname' => 'chapter',
              'extra' => {
                'associated_node' => {
                  'cmdname' => 'node',
                  'extra' => {
                    'normalized' => 'titi'
                  }
                },
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
              'cmdname' => 'chapter',
              'extra' => {
                'associated_node' => {
                  'cmdname' => 'node',
                  'extra' => {
                    'normalized' => 'other'
                  }
                },
                'section_directions' => {
                  'prev' => {},
                  'up' => {}
                },
                'section_level' => 1,
                'section_number' => '3',
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
                    'normalized' => 'a-somewhat-long-node-without-description-nor-following-space'
                  }
                },
                'section_directions' => {
                  'prev' => {},
                  'up' => {}
                },
                'section_level' => 1,
                'section_number' => '4',
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
                    'normalized' => 'node-double-nodedescriptionblock'
                  }
                },
                'section_directions' => {
                  'prev' => {},
                  'up' => {}
                },
                'section_level' => 1,
                'section_number' => '5',
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
$result_sectioning{'nodedescriptionblock_descriptions'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[0]{'extra'}{'section_directions'}{'up'} = $result_sectioning{'nodedescriptionblock_descriptions'}{'extra'}{'section_childs'}[0];
$result_sectioning{'nodedescriptionblock_descriptions'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[0]{'extra'}{'toplevel_directions'}{'prev'} = $result_sectioning{'nodedescriptionblock_descriptions'}{'extra'}{'section_childs'}[0];
$result_sectioning{'nodedescriptionblock_descriptions'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[0]{'extra'}{'toplevel_directions'}{'up'} = $result_sectioning{'nodedescriptionblock_descriptions'}{'extra'}{'section_childs'}[0];
$result_sectioning{'nodedescriptionblock_descriptions'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[1]{'extra'}{'section_directions'}{'prev'} = $result_sectioning{'nodedescriptionblock_descriptions'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[0];
$result_sectioning{'nodedescriptionblock_descriptions'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[1]{'extra'}{'section_directions'}{'up'} = $result_sectioning{'nodedescriptionblock_descriptions'}{'extra'}{'section_childs'}[0];
$result_sectioning{'nodedescriptionblock_descriptions'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[1]{'extra'}{'toplevel_directions'}{'prev'} = $result_sectioning{'nodedescriptionblock_descriptions'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[0];
$result_sectioning{'nodedescriptionblock_descriptions'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[1]{'extra'}{'toplevel_directions'}{'up'} = $result_sectioning{'nodedescriptionblock_descriptions'}{'extra'}{'section_childs'}[0];
$result_sectioning{'nodedescriptionblock_descriptions'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[2]{'extra'}{'section_directions'}{'prev'} = $result_sectioning{'nodedescriptionblock_descriptions'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[1];
$result_sectioning{'nodedescriptionblock_descriptions'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[2]{'extra'}{'section_directions'}{'up'} = $result_sectioning{'nodedescriptionblock_descriptions'}{'extra'}{'section_childs'}[0];
$result_sectioning{'nodedescriptionblock_descriptions'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[2]{'extra'}{'toplevel_directions'}{'prev'} = $result_sectioning{'nodedescriptionblock_descriptions'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[1];
$result_sectioning{'nodedescriptionblock_descriptions'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[2]{'extra'}{'toplevel_directions'}{'up'} = $result_sectioning{'nodedescriptionblock_descriptions'}{'extra'}{'section_childs'}[0];
$result_sectioning{'nodedescriptionblock_descriptions'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[3]{'extra'}{'section_directions'}{'prev'} = $result_sectioning{'nodedescriptionblock_descriptions'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[2];
$result_sectioning{'nodedescriptionblock_descriptions'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[3]{'extra'}{'section_directions'}{'up'} = $result_sectioning{'nodedescriptionblock_descriptions'}{'extra'}{'section_childs'}[0];
$result_sectioning{'nodedescriptionblock_descriptions'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[3]{'extra'}{'toplevel_directions'}{'prev'} = $result_sectioning{'nodedescriptionblock_descriptions'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[2];
$result_sectioning{'nodedescriptionblock_descriptions'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[3]{'extra'}{'toplevel_directions'}{'up'} = $result_sectioning{'nodedescriptionblock_descriptions'}{'extra'}{'section_childs'}[0];
$result_sectioning{'nodedescriptionblock_descriptions'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[4]{'extra'}{'section_directions'}{'prev'} = $result_sectioning{'nodedescriptionblock_descriptions'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[3];
$result_sectioning{'nodedescriptionblock_descriptions'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[4]{'extra'}{'section_directions'}{'up'} = $result_sectioning{'nodedescriptionblock_descriptions'}{'extra'}{'section_childs'}[0];
$result_sectioning{'nodedescriptionblock_descriptions'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[4]{'extra'}{'toplevel_directions'}{'prev'} = $result_sectioning{'nodedescriptionblock_descriptions'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[3];
$result_sectioning{'nodedescriptionblock_descriptions'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[4]{'extra'}{'toplevel_directions'}{'up'} = $result_sectioning{'nodedescriptionblock_descriptions'}{'extra'}{'section_childs'}[0];
$result_sectioning{'nodedescriptionblock_descriptions'}{'extra'}{'section_childs'}[0]{'extra'}{'sectioning_root'} = $result_sectioning{'nodedescriptionblock_descriptions'};

$result_nodes{'nodedescriptionblock_descriptions'} = [
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
                          'cmdname' => 'chapter',
                          'extra' => {
                            'section_number' => '3'
                          }
                        },
                        'node_directions' => {
                          'next' => {
                            'cmdname' => 'node',
                            'extra' => {
                              'associated_section' => {
                                'cmdname' => 'chapter',
                                'extra' => {
                                  'section_number' => '4'
                                }
                              },
                              'node_directions' => {
                                'next' => {
                                  'cmdname' => 'node',
                                  'extra' => {
                                    'associated_section' => {
                                      'cmdname' => 'chapter',
                                      'extra' => {
                                        'section_number' => '5'
                                      }
                                    },
                                    'node_directions' => {
                                      'prev' => {},
                                      'up' => {}
                                    },
                                    'normalized' => 'node-double-nodedescriptionblock'
                                  }
                                },
                                'prev' => {},
                                'up' => {}
                              },
                              'normalized' => 'a-somewhat-long-node-without-description-nor-following-space'
                            }
                          },
                          'prev' => {},
                          'up' => {}
                        },
                        'normalized' => 'other'
                      }
                    },
                    'prev' => {},
                    'up' => {}
                  },
                  'normalized' => 'titi'
                }
              },
              'prev' => {},
              'up' => {}
            },
            'normalized' => 'toto'
          }
        }
      },
      'normalized' => 'Top'
    }
  },
  {},
  {},
  {},
  {},
  {}
];
$result_nodes{'nodedescriptionblock_descriptions'}[0]{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'prev'} = $result_nodes{'nodedescriptionblock_descriptions'}[0]{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'next'};
$result_nodes{'nodedescriptionblock_descriptions'}[0]{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'up'} = $result_nodes{'nodedescriptionblock_descriptions'}[0];
$result_nodes{'nodedescriptionblock_descriptions'}[0]{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'prev'} = $result_nodes{'nodedescriptionblock_descriptions'}[0]{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'next'};
$result_nodes{'nodedescriptionblock_descriptions'}[0]{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'up'} = $result_nodes{'nodedescriptionblock_descriptions'}[0];
$result_nodes{'nodedescriptionblock_descriptions'}[0]{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'prev'} = $result_nodes{'nodedescriptionblock_descriptions'}[0]{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'next'};
$result_nodes{'nodedescriptionblock_descriptions'}[0]{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'up'} = $result_nodes{'nodedescriptionblock_descriptions'}[0];
$result_nodes{'nodedescriptionblock_descriptions'}[0]{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'prev'} = $result_nodes{'nodedescriptionblock_descriptions'}[0]{'extra'}{'node_directions'}{'next'};
$result_nodes{'nodedescriptionblock_descriptions'}[0]{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'up'} = $result_nodes{'nodedescriptionblock_descriptions'}[0];
$result_nodes{'nodedescriptionblock_descriptions'}[0]{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'prev'} = $result_nodes{'nodedescriptionblock_descriptions'}[0];
$result_nodes{'nodedescriptionblock_descriptions'}[0]{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'up'} = $result_nodes{'nodedescriptionblock_descriptions'}[0];
$result_nodes{'nodedescriptionblock_descriptions'}[1] = $result_nodes{'nodedescriptionblock_descriptions'}[0]{'extra'}{'node_directions'}{'next'};
$result_nodes{'nodedescriptionblock_descriptions'}[2] = $result_nodes{'nodedescriptionblock_descriptions'}[0]{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'next'};
$result_nodes{'nodedescriptionblock_descriptions'}[3] = $result_nodes{'nodedescriptionblock_descriptions'}[0]{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'next'};
$result_nodes{'nodedescriptionblock_descriptions'}[4] = $result_nodes{'nodedescriptionblock_descriptions'}[0]{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'next'};
$result_nodes{'nodedescriptionblock_descriptions'}[5] = $result_nodes{'nodedescriptionblock_descriptions'}[0]{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'next'};

$result_menus{'nodedescriptionblock_descriptions'} = [
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
                              'normalized' => 'node-double-nodedescriptionblock'
                            }
                          },
                          'prev' => {},
                          'up' => {}
                        },
                        'normalized' => 'a-somewhat-long-node-without-description-nor-following-space'
                      }
                    },
                    'prev' => {},
                    'up' => {}
                  },
                  'normalized' => 'other'
                }
              },
              'prev' => {},
              'up' => {}
            },
            'normalized' => 'titi'
          }
        },
        'up' => {}
      },
      'normalized' => 'toto'
    }
  },
  {},
  {},
  {},
  {}
];
$result_menus{'nodedescriptionblock_descriptions'}[1]{'extra'}{'menu_directions'}{'next'}{'extra'}{'menu_directions'}{'next'}{'extra'}{'menu_directions'}{'next'}{'extra'}{'menu_directions'}{'next'}{'extra'}{'menu_directions'}{'prev'} = $result_menus{'nodedescriptionblock_descriptions'}[1]{'extra'}{'menu_directions'}{'next'}{'extra'}{'menu_directions'}{'next'}{'extra'}{'menu_directions'}{'next'};
$result_menus{'nodedescriptionblock_descriptions'}[1]{'extra'}{'menu_directions'}{'next'}{'extra'}{'menu_directions'}{'next'}{'extra'}{'menu_directions'}{'next'}{'extra'}{'menu_directions'}{'next'}{'extra'}{'menu_directions'}{'up'} = $result_menus{'nodedescriptionblock_descriptions'}[0];
$result_menus{'nodedescriptionblock_descriptions'}[1]{'extra'}{'menu_directions'}{'next'}{'extra'}{'menu_directions'}{'next'}{'extra'}{'menu_directions'}{'next'}{'extra'}{'menu_directions'}{'prev'} = $result_menus{'nodedescriptionblock_descriptions'}[1]{'extra'}{'menu_directions'}{'next'}{'extra'}{'menu_directions'}{'next'};
$result_menus{'nodedescriptionblock_descriptions'}[1]{'extra'}{'menu_directions'}{'next'}{'extra'}{'menu_directions'}{'next'}{'extra'}{'menu_directions'}{'next'}{'extra'}{'menu_directions'}{'up'} = $result_menus{'nodedescriptionblock_descriptions'}[0];
$result_menus{'nodedescriptionblock_descriptions'}[1]{'extra'}{'menu_directions'}{'next'}{'extra'}{'menu_directions'}{'next'}{'extra'}{'menu_directions'}{'prev'} = $result_menus{'nodedescriptionblock_descriptions'}[1]{'extra'}{'menu_directions'}{'next'};
$result_menus{'nodedescriptionblock_descriptions'}[1]{'extra'}{'menu_directions'}{'next'}{'extra'}{'menu_directions'}{'next'}{'extra'}{'menu_directions'}{'up'} = $result_menus{'nodedescriptionblock_descriptions'}[0];
$result_menus{'nodedescriptionblock_descriptions'}[1]{'extra'}{'menu_directions'}{'next'}{'extra'}{'menu_directions'}{'prev'} = $result_menus{'nodedescriptionblock_descriptions'}[1];
$result_menus{'nodedescriptionblock_descriptions'}[1]{'extra'}{'menu_directions'}{'next'}{'extra'}{'menu_directions'}{'up'} = $result_menus{'nodedescriptionblock_descriptions'}[0];
$result_menus{'nodedescriptionblock_descriptions'}[1]{'extra'}{'menu_directions'}{'up'} = $result_menus{'nodedescriptionblock_descriptions'}[0];
$result_menus{'nodedescriptionblock_descriptions'}[2] = $result_menus{'nodedescriptionblock_descriptions'}[1]{'extra'}{'menu_directions'}{'next'};
$result_menus{'nodedescriptionblock_descriptions'}[3] = $result_menus{'nodedescriptionblock_descriptions'}[1]{'extra'}{'menu_directions'}{'next'}{'extra'}{'menu_directions'}{'next'};
$result_menus{'nodedescriptionblock_descriptions'}[4] = $result_menus{'nodedescriptionblock_descriptions'}[1]{'extra'}{'menu_directions'}{'next'}{'extra'}{'menu_directions'}{'next'}{'extra'}{'menu_directions'}{'next'};
$result_menus{'nodedescriptionblock_descriptions'}[5] = $result_menus{'nodedescriptionblock_descriptions'}[1]{'extra'}{'menu_directions'}{'next'}{'extra'}{'menu_directions'}{'next'}{'extra'}{'menu_directions'}{'next'}{'extra'}{'menu_directions'}{'next'};

$result_errors{'nodedescriptionblock_descriptions'} = [
  {
    'error_line' => 'warning: @verb should not appear on @nodedescription line
',
    'line_nr' => 16,
    'text' => '@verb should not appear on @nodedescription line',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: multiple node @nodedescriptionblock
',
    'line_nr' => 58,
    'text' => 'multiple node @nodedescriptionblock',
    'type' => 'warning'
  }
];


$result_floats{'nodedescriptionblock_descriptions'} = {};



$result_converted{'plaintext'}->{'nodedescriptionblock_descriptions'} = 'test of nodedescriptionblock used in menu
*****************************************

* Menu:

* toto::                       toto is there:: and the _is a
                               description_slightly long and vv somewhat
                               ånexpected
* titi::  desc of titi
* name of other: other.        Long description of other

                               Para2

                                   a quotation in description

* a somewhat long node without description nor following space::  not as long
                               as the node
* node double nodedescriptionblock::  block desc 1

1 Toto
******

2 Titi
******

3 Other
*******

4 Somewhat long
***************

5 test double
*************

';


$result_converted{'html'}->{'nodedescriptionblock_descriptions'} = '<!DOCTYPE html>
<html>
<!-- Created by texinfo, https://www.gnu.org/software/texinfo/ -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>test of nodedescriptionblock used in menu</title>

<meta name="description" content="test of nodedescriptionblock used in menu">
<meta name="keywords" content="test of nodedescriptionblock used in menu">
<meta name="resource-type" content="document">
<meta name="distribution" content="global">
<meta name="viewport" content="width=device-width,initial-scale=1">

<link href="#Top" rel="start" title="Top">
<style type="text/css">
<!--
a.copiable-link {visibility: hidden; text-decoration: none; line-height: 0em}
pre.menu-comment-preformatted {font-family: serif}
span:hover a.copiable-link {visibility: visible}
td.menu-entry-description {vertical-align: top; padding-left: 1em}
td.menu-entry-destination {vertical-align: top}
th.menu-comment {text-align:left}
-->
</style>


</head>

<body lang="en">
<div class="top-level-extent" id="Top">
<div class="nav-panel">
<p>
Next: <a href="#toto" accesskey="n" rel="next">Toto</a> &nbsp; </p>
</div>
<h1 class="top" id="test-of-nodedescriptionblock-used-in-menu"><span>test of nodedescriptionblock used in menu<a class="copiable-link" href="#test-of-nodedescriptionblock-used-in-menu"> &para;</a></span></h1>

<table class="menu">
<tr><td class="menu-entry-destination">&bull; <a href="#toto" accesskey="1">toto</a>:</td><td class="menu-entry-description">toto is there:: and the <em class="emph">is a description</em>slightly&nbsp;long<!-- /@w --> and <code class="verb">vv&nbsp;somewhat</code> &aring;nexpected</td></tr>
<tr><td class="menu-entry-destination">&bull; <a href="#titi" accesskey="2">titi</a>:</td><td class="menu-entry-description">desc of titi
</td></tr>
<tr><td class="menu-entry-destination">&bull; <a href="#other" accesskey="3">name of other</a>:</td><td class="menu-entry-description">Long description of other

<p>Para2
</p>
<blockquote class="quotation">
<p>a quotation in description
</p></blockquote>
</td></tr>
<tr><th class="menu-comment" colspan="2"><pre class="menu-comment-preformatted">

</pre></th></tr><tr><td class="menu-entry-destination">&bull; <a href="#a-somewhat-long-node-without-description-nor-following-space" accesskey="4">a somewhat long node without description nor following space</a>:</td><td class="menu-entry-description">not as long as the node</td></tr>
<tr><td class="menu-entry-destination">&bull; <a href="#node-double-nodedescriptionblock" accesskey="5">node double nodedescriptionblock</a>:</td><td class="menu-entry-description">block desc 1
</td></tr>
</table>

<hr>
<div class="chapter-level-extent" id="toto">
<div class="nav-panel">
<p>
Next: <a href="#titi" accesskey="n" rel="next">Titi</a>, Previous: <a href="#Top" accesskey="p" rel="prev">test of nodedescriptionblock used in menu</a>, Up: <a href="#Top" accesskey="u" rel="up">test of nodedescriptionblock used in menu</a> &nbsp; </p>
</div>
<h2 class="chapter" id="Toto"><span>1 Toto<a class="copiable-link" href="#Toto"> &para;</a></span></h2>



<hr>
</div>
<div class="chapter-level-extent" id="titi">
<div class="nav-panel">
<p>
Next: <a href="#other" accesskey="n" rel="next">Other</a>, Previous: <a href="#toto" accesskey="p" rel="prev">Toto</a>, Up: <a href="#Top" accesskey="u" rel="up">test of nodedescriptionblock used in menu</a> &nbsp; </p>
</div>
<h2 class="chapter" id="Titi"><span>2 Titi<a class="copiable-link" href="#Titi"> &para;</a></span></h2>


<hr>
</div>
<div class="chapter-level-extent" id="other">
<div class="nav-panel">
<p>
Next: <a href="#a-somewhat-long-node-without-description-nor-following-space" accesskey="n" rel="next">Somewhat long</a>, Previous: <a href="#titi" accesskey="p" rel="prev">Titi</a>, Up: <a href="#Top" accesskey="u" rel="up">test of nodedescriptionblock used in menu</a> &nbsp; </p>
</div>
<h2 class="chapter" id="Other"><span>3 Other<a class="copiable-link" href="#Other"> &para;</a></span></h2>


<hr>
</div>
<div class="chapter-level-extent" id="a-somewhat-long-node-without-description-nor-following-space">
<div class="nav-panel">
<p>
Next: <a href="#node-double-nodedescriptionblock" accesskey="n" rel="next">test double</a>, Previous: <a href="#other" accesskey="p" rel="prev">Other</a>, Up: <a href="#Top" accesskey="u" rel="up">test of nodedescriptionblock used in menu</a> &nbsp; </p>
</div>
<h2 class="chapter" id="Somewhat-long"><span>4 Somewhat long<a class="copiable-link" href="#Somewhat-long"> &para;</a></span></h2>



<hr>
</div>
<div class="chapter-level-extent" id="node-double-nodedescriptionblock">
<div class="nav-panel">
<p>
Previous: <a href="#a-somewhat-long-node-without-description-nor-following-space" accesskey="p" rel="prev">Somewhat long</a>, Up: <a href="#Top" accesskey="u" rel="up">test of nodedescriptionblock used in menu</a> &nbsp; </p>
</div>
<h2 class="chapter" id="test-double"><span>5 test double<a class="copiable-link" href="#test-double"> &para;</a></span></h2>



</div>
</div>



</body>
</html>
';


$result_converted{'xml'}->{'nodedescriptionblock_descriptions'} = '<node name="Top" spaces=" "><nodename>Top</nodename><nodenext automatic="on">toto</nodenext></node>
<top spaces=" "><sectiontitle>test of nodedescriptionblock used in menu</sectiontitle>

<menu endspaces=" ">
<menuentry><menuleadingtext>* </menuleadingtext><menunode>toto</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode>titi</menunode><menuseparator>::  </menuseparator><menudescription><pre xml:space="preserve">desc of titi
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menutitle>name of other</menutitle><menuseparator>: </menuseparator><menunode>other</menunode><menuseparator>.</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menucomment><pre xml:space="preserve">
</pre></menucomment><menuentry><menuleadingtext>* </menuleadingtext><menunode>a somewhat long node without description nor following space</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode>node double nodedescriptionblock</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry></menu>

</top>
<node name="toto" spaces=" "><nodename>toto</nodename><nodenext automatic="on">titi</nodenext><nodeprev automatic="on">Top</nodeprev><nodeup automatic="on">Top</nodeup></node>
<chapter spaces=" "><sectiontitle>Toto</sectiontitle>

<nodedescription spaces=" ">toto is there:: and the <emph>is a description</emph><w>slightly long</w> and <verb delimiter=":">vv somewhat</verb> <accent type="ring" spacesaftercmd=" " bracketed="off">a</accent>nexpected</nodedescription>

<nodedescriptionblock endspaces=" ">
<para>Block along line node description for toto
</para></nodedescriptionblock>

</chapter>
<node name="titi" spaces=" "><nodename>titi</nodename><nodenext automatic="on">other</nodenext><nodeprev automatic="on">toto</nodeprev><nodeup automatic="on">Top</nodeup></node>
<chapter spaces=" "><sectiontitle>Titi</sectiontitle>

<nodedescriptionblock endspaces=" ">
<para>description of titi in block
</para></nodedescriptionblock>

</chapter>
<node name="other" spaces=" "><nodename>other</nodename><nodenext automatic="on">a somewhat long node without description nor following space</nodenext><nodeprev automatic="on">titi</nodeprev><nodeup automatic="on">Top</nodeup></node>
<chapter spaces=" "><sectiontitle>Other</sectiontitle>

<nodedescriptionblock endspaces=" ">
<para>Long description of other
</para>
<para>Para2
</para>
<quotation endspaces=" ">
<para>a quotation in description
</para></quotation>
</nodedescriptionblock>

</chapter>
<node name="a-somewhat-long-node-without-description-nor-following-space" spaces=" "><nodename>a somewhat long node without description nor following space</nodename><nodenext automatic="on">node double nodedescriptionblock</nodenext><nodeprev automatic="on">other</nodeprev><nodeup automatic="on">Top</nodeup></node>
<chapter spaces=" "><sectiontitle>Somewhat long</sectiontitle>

<nodedescriptionblock endspaces=" ">
<para>Block description before, not as long as the node
</para></nodedescriptionblock>

<nodedescription spaces=" ">not as long as the node</nodedescription>

</chapter>
<node name="node-double-nodedescriptionblock" spaces=" "><nodename>node double nodedescriptionblock</nodename><nodeprev automatic="on">a somewhat long node without description nor following space</nodeprev><nodeup automatic="on">Top</nodeup></node>
<chapter spaces=" "><sectiontitle>test double</sectiontitle>

<nodedescriptionblock endspaces=" ">
<para>block desc 1
</para></nodedescriptionblock>

<nodedescriptionblock endspaces=" ">
<para>block desc 2
</para></nodedescriptionblock>

</chapter>
';

1;
