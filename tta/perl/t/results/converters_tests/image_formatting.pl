use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'image_formatting'} = {
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
                  'text' => 'top'
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
                  'text' => 'chap'
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
        'normalized' => 'chap'
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
      'cmdname' => 'chapter',
      'contents' => [
        {
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'Chapter'
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
              'cmdname' => 'code',
              'contents' => [
                {
                  'contents' => [
                    {
                      'cmdname' => '@'
                    },
                    {
                      'text' => 'image'
                    },
                    {
                      'cmdname' => '{'
                    },
                    {
                      'text' => 'f--ile'
                    },
                    {
                      'cmdname' => '}'
                    }
                  ],
                  'type' => 'brace_container'
                }
              ],
              'source_info' => {
                'line_nr' => 7
              }
            },
            {
              'text' => ' '
            },
            {
              'cmdname' => 'image',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'f--ile'
                    }
                  ],
                  'type' => 'brace_arg'
                }
              ],
              'extra' => {
                'input_encoding_name' => 'utf-8'
              },
              'source_info' => {
                'line_nr' => 7
              }
            },
            {
              'text' => '
'
            },
            {
              'cmdname' => 'code',
              'contents' => [
                {
                  'contents' => [
                    {
                      'cmdname' => '@'
                    },
                    {
                      'text' => 'image'
                    },
                    {
                      'cmdname' => '{'
                    },
                    {
                      'text' => 'f--ile,l--i'
                    },
                    {
                      'cmdname' => '}'
                    }
                  ],
                  'type' => 'brace_container'
                }
              ],
              'source_info' => {
                'line_nr' => 8
              }
            },
            {
              'text' => ' '
            },
            {
              'cmdname' => 'image',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'f--ile'
                    }
                  ],
                  'type' => 'brace_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => 'l--i'
                    }
                  ],
                  'type' => 'brace_arg'
                }
              ],
              'extra' => {
                'input_encoding_name' => 'utf-8'
              },
              'source_info' => {
                'line_nr' => 8
              }
            },
            {
              'text' => '
'
            },
            {
              'cmdname' => 'code',
              'contents' => [
                {
                  'contents' => [
                    {
                      'cmdname' => '@'
                    },
                    {
                      'text' => 'image'
                    },
                    {
                      'cmdname' => '{'
                    },
                    {
                      'text' => 'f--ile,,l--e'
                    },
                    {
                      'cmdname' => '}'
                    }
                  ],
                  'type' => 'brace_container'
                }
              ],
              'source_info' => {
                'line_nr' => 9
              }
            },
            {
              'text' => ' '
            },
            {
              'cmdname' => 'image',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'f--ile'
                    }
                  ],
                  'type' => 'brace_arg'
                },
                {
                  'type' => 'brace_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => 'l--e'
                    }
                  ],
                  'type' => 'brace_arg'
                }
              ],
              'extra' => {
                'input_encoding_name' => 'utf-8'
              },
              'source_info' => {
                'line_nr' => 9
              }
            },
            {
              'text' => '
'
            },
            {
              'cmdname' => 'code',
              'contents' => [
                {
                  'contents' => [
                    {
                      'cmdname' => '@'
                    },
                    {
                      'text' => 'image'
                    },
                    {
                      'cmdname' => '{'
                    },
                    {
                      'text' => 'f--ile,,,alt'
                    },
                    {
                      'cmdname' => '}'
                    }
                  ],
                  'type' => 'brace_container'
                }
              ],
              'source_info' => {
                'line_nr' => 10
              }
            },
            {
              'text' => ' '
            },
            {
              'cmdname' => 'image',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'f--ile'
                    }
                  ],
                  'type' => 'brace_arg'
                },
                {
                  'type' => 'brace_arg'
                },
                {
                  'type' => 'brace_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => 'alt'
                    }
                  ],
                  'type' => 'brace_arg'
                }
              ],
              'extra' => {
                'input_encoding_name' => 'utf-8'
              },
              'source_info' => {
                'line_nr' => 10
              }
            },
            {
              'text' => '
'
            },
            {
              'cmdname' => 'code',
              'contents' => [
                {
                  'contents' => [
                    {
                      'cmdname' => '@'
                    },
                    {
                      'text' => 'image'
                    },
                    {
                      'cmdname' => '{'
                    },
                    {
                      'text' => 'f--ile,,,,e-d-xt'
                    },
                    {
                      'cmdname' => '}'
                    }
                  ],
                  'type' => 'brace_container'
                }
              ],
              'source_info' => {
                'line_nr' => 11
              }
            },
            {
              'text' => ' '
            },
            {
              'cmdname' => 'image',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'f--ile'
                    }
                  ],
                  'type' => 'brace_arg'
                },
                {
                  'type' => 'brace_arg'
                },
                {
                  'type' => 'brace_arg'
                },
                {
                  'type' => 'brace_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => 'e--xt'
                    }
                  ],
                  'type' => 'brace_arg'
                }
              ],
              'extra' => {
                'input_encoding_name' => 'utf-8'
              },
              'source_info' => {
                'line_nr' => 11
              }
            },
            {
              'text' => '
'
            },
            {
              'cmdname' => 'code',
              'contents' => [
                {
                  'contents' => [
                    {
                      'cmdname' => '@'
                    },
                    {
                      'text' => 'image'
                    },
                    {
                      'cmdname' => '{'
                    },
                    {
                      'text' => 'f--ile,aze,az,alt,e--xt'
                    },
                    {
                      'cmdname' => '}'
                    }
                  ],
                  'type' => 'brace_container'
                }
              ],
              'source_info' => {
                'line_nr' => 12
              }
            },
            {
              'text' => ' '
            },
            {
              'cmdname' => 'image',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'f--ile'
                    }
                  ],
                  'type' => 'brace_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => 'aze'
                    }
                  ],
                  'type' => 'brace_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => 'az'
                    }
                  ],
                  'type' => 'brace_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => 'alt'
                    }
                  ],
                  'type' => 'brace_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => 'e--xt'
                    }
                  ],
                  'type' => 'brace_arg'
                }
              ],
              'extra' => {
                'input_encoding_name' => 'utf-8'
              },
              'source_info' => {
                'line_nr' => 12
              }
            },
            {
              'text' => '
'
            },
            {
              'cmdname' => 'code',
              'contents' => [
                {
                  'contents' => [
                    {
                      'cmdname' => '@'
                    },
                    {
                      'text' => 'image'
                    },
                    {
                      'cmdname' => '{'
                    },
                    {
                      'text' => 'f--ile,aze,az,alt,'
                    }
                  ],
                  'type' => 'brace_container'
                }
              ],
              'source_info' => {
                'line_nr' => 13
              }
            },
            {
              'text' => ' '
            },
            {
              'cmdname' => 'image',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'f--ile'
                    }
                  ],
                  'type' => 'brace_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => 'aze'
                    }
                  ],
                  'type' => 'brace_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => 'az'
                    }
                  ],
                  'type' => 'brace_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => 'alt'
                    }
                  ],
                  'type' => 'brace_arg'
                },
                {
                  'type' => 'brace_arg'
                }
              ],
              'extra' => {
                'input_encoding_name' => 'utf-8'
              },
              'source_info' => {
                'line_nr' => 13
              }
            },
            {
              'text' => '
'
            },
            {
              'cmdname' => 'code',
              'contents' => [
                {
                  'contents' => [
                    {
                      'cmdname' => '@'
                    },
                    {
                      'text' => 'image'
                    },
                    {
                      'cmdname' => '{'
                    },
                    {
                      'text' => 'f-ile,aze,,a--lt'
                    },
                    {
                      'cmdname' => '}'
                    }
                  ],
                  'type' => 'brace_container'
                }
              ],
              'source_info' => {
                'line_nr' => 14
              }
            },
            {
              'text' => ' '
            },
            {
              'cmdname' => 'image',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'f-ile'
                    }
                  ],
                  'type' => 'brace_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => 'aze'
                    }
                  ],
                  'type' => 'brace_arg'
                },
                {
                  'type' => 'brace_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => 'a--lt'
                    }
                  ],
                  'type' => 'brace_arg'
                }
              ],
              'extra' => {
                'input_encoding_name' => 'utf-8'
              },
              'source_info' => {
                'line_nr' => 14
              }
            },
            {
              'text' => '
'
            },
            {
              'cmdname' => 'code',
              'contents' => [
                {
                  'contents' => [
                    {
                      'cmdname' => '@'
                    },
                    {
                      'text' => 'image'
                    },
                    {
                      'cmdname' => '{'
                    },
                    {
                      'cmdname' => '@'
                    },
                    {
                      'text' => 'file'
                    },
                    {
                      'cmdname' => '{'
                    },
                    {
                      'text' => 'f--ile'
                    },
                    {
                      'cmdname' => '}'
                    },
                    {
                      'cmdname' => '@'
                    },
                    {
                      'cmdname' => '@'
                    },
                    {
                      'cmdname' => '@'
                    },
                    {
                      'text' => '.,aze,az,alt,'
                    },
                    {
                      'cmdname' => '@'
                    },
                    {
                      'text' => 'file'
                    },
                    {
                      'cmdname' => '{'
                    },
                    {
                      'text' => 'file ext'
                    },
                    {
                      'cmdname' => '}'
                    },
                    {
                      'text' => ' e--xt'
                    },
                    {
                      'cmdname' => '@'
                    },
                    {
                      'cmdname' => '}'
                    }
                  ],
                  'type' => 'brace_container'
                }
              ],
              'source_info' => {
                'line_nr' => 15
              }
            },
            {
              'text' => ' '
            },
            {
              'cmdname' => 'image',
              'contents' => [
                {
                  'contents' => [
                    {
                      'cmdname' => 'file',
                      'contents' => [
                        {
                          'contents' => [
                            {
                              'text' => 'f--ile'
                            }
                          ],
                          'type' => 'brace_container'
                        }
                      ],
                      'source_info' => {
                        'line_nr' => 15
                      }
                    },
                    {
                      'cmdname' => '@'
                    },
                    {
                      'cmdname' => '.'
                    }
                  ],
                  'type' => 'brace_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => 'aze'
                    }
                  ],
                  'type' => 'brace_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => 'az'
                    }
                  ],
                  'type' => 'brace_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => 'alt'
                    }
                  ],
                  'type' => 'brace_arg'
                },
                {
                  'contents' => [
                    {
                      'cmdname' => 'file',
                      'contents' => [
                        {
                          'contents' => [
                            {
                              'text' => 'file ext'
                            }
                          ],
                          'type' => 'brace_container'
                        }
                      ],
                      'source_info' => {
                        'line_nr' => 15
                      }
                    },
                    {
                      'text' => ' e--xt'
                    },
                    {
                      'cmdname' => '}'
                    }
                  ],
                  'type' => 'brace_arg'
                }
              ],
              'extra' => {
                'input_encoding_name' => 'utf-8'
              },
              'source_info' => {
                'line_nr' => 15
              }
            },
            {
              'text' => '
'
            },
            {
              'cmdname' => 'image',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'image'
                    }
                  ],
                  'type' => 'brace_arg'
                }
              ],
              'extra' => {
                'input_encoding_name' => 'utf-8'
              },
              'source_info' => {
                'line_nr' => 16
              }
            },
            {
              'text' => ' '
            },
            {
              'cmdname' => 'image',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'image'
                    }
                  ],
                  'type' => 'brace_arg'
                }
              ],
              'extra' => {
                'input_encoding_name' => 'utf-8'
              },
              'source_info' => {
                'line_nr' => 16
              }
            },
            {
              'text' => '
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
          'cmdname' => 'example',
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
                  'cmdname' => 'code',
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'cmdname' => '@'
                        },
                        {
                          'text' => 'image'
                        },
                        {
                          'cmdname' => '{'
                        },
                        {
                          'text' => 'f--ile'
                        },
                        {
                          'cmdname' => '}'
                        }
                      ],
                      'type' => 'brace_container'
                    }
                  ],
                  'source_info' => {
                    'line_nr' => 19
                  }
                },
                {
                  'text' => ' '
                },
                {
                  'cmdname' => 'image',
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'f--ile'
                        }
                      ],
                      'type' => 'brace_arg'
                    }
                  ],
                  'extra' => {
                    'input_encoding_name' => 'utf-8'
                  },
                  'source_info' => {
                    'line_nr' => 19
                  }
                },
                {
                  'text' => '
'
                },
                {
                  'cmdname' => 'code',
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'cmdname' => '@'
                        },
                        {
                          'text' => 'image'
                        },
                        {
                          'cmdname' => '{'
                        },
                        {
                          'text' => 'f--ile,l--i'
                        },
                        {
                          'cmdname' => '}'
                        }
                      ],
                      'type' => 'brace_container'
                    }
                  ],
                  'source_info' => {
                    'line_nr' => 20
                  }
                },
                {
                  'text' => ' '
                },
                {
                  'cmdname' => 'image',
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'f--ile'
                        }
                      ],
                      'type' => 'brace_arg'
                    },
                    {
                      'contents' => [
                        {
                          'text' => 'l--i'
                        }
                      ],
                      'type' => 'brace_arg'
                    }
                  ],
                  'extra' => {
                    'input_encoding_name' => 'utf-8'
                  },
                  'source_info' => {
                    'line_nr' => 20
                  }
                },
                {
                  'text' => '
'
                },
                {
                  'cmdname' => 'code',
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'cmdname' => '@'
                        },
                        {
                          'text' => 'image'
                        },
                        {
                          'cmdname' => '{'
                        },
                        {
                          'text' => 'f--ile,,l--e'
                        },
                        {
                          'cmdname' => '}'
                        }
                      ],
                      'type' => 'brace_container'
                    }
                  ],
                  'source_info' => {
                    'line_nr' => 21
                  }
                },
                {
                  'text' => ' '
                },
                {
                  'cmdname' => 'image',
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'f--ile'
                        }
                      ],
                      'type' => 'brace_arg'
                    },
                    {
                      'type' => 'brace_arg'
                    },
                    {
                      'contents' => [
                        {
                          'text' => 'l--e'
                        }
                      ],
                      'type' => 'brace_arg'
                    }
                  ],
                  'extra' => {
                    'input_encoding_name' => 'utf-8'
                  },
                  'source_info' => {
                    'line_nr' => 21
                  }
                },
                {
                  'text' => '
'
                },
                {
                  'cmdname' => 'code',
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'cmdname' => '@'
                        },
                        {
                          'text' => 'image'
                        },
                        {
                          'cmdname' => '{'
                        },
                        {
                          'text' => 'f--ile,,,alt'
                        },
                        {
                          'cmdname' => '}'
                        }
                      ],
                      'type' => 'brace_container'
                    }
                  ],
                  'source_info' => {
                    'line_nr' => 22
                  }
                },
                {
                  'text' => ' '
                },
                {
                  'cmdname' => 'image',
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'f--ile'
                        }
                      ],
                      'type' => 'brace_arg'
                    },
                    {
                      'type' => 'brace_arg'
                    },
                    {
                      'type' => 'brace_arg'
                    },
                    {
                      'contents' => [
                        {
                          'text' => 'alt'
                        }
                      ],
                      'type' => 'brace_arg'
                    }
                  ],
                  'extra' => {
                    'input_encoding_name' => 'utf-8'
                  },
                  'source_info' => {
                    'line_nr' => 22
                  }
                },
                {
                  'text' => '
'
                },
                {
                  'cmdname' => 'code',
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'cmdname' => '@'
                        },
                        {
                          'text' => 'image'
                        },
                        {
                          'cmdname' => '{'
                        },
                        {
                          'text' => 'f--ile,,,,e-d-xt'
                        },
                        {
                          'cmdname' => '}'
                        }
                      ],
                      'type' => 'brace_container'
                    }
                  ],
                  'source_info' => {
                    'line_nr' => 23
                  }
                },
                {
                  'text' => ' '
                },
                {
                  'cmdname' => 'image',
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'f--ile'
                        }
                      ],
                      'type' => 'brace_arg'
                    },
                    {
                      'type' => 'brace_arg'
                    },
                    {
                      'type' => 'brace_arg'
                    },
                    {
                      'type' => 'brace_arg'
                    },
                    {
                      'contents' => [
                        {
                          'text' => 'e--xt'
                        }
                      ],
                      'type' => 'brace_arg'
                    }
                  ],
                  'extra' => {
                    'input_encoding_name' => 'utf-8'
                  },
                  'source_info' => {
                    'line_nr' => 23
                  }
                },
                {
                  'text' => '
'
                },
                {
                  'cmdname' => 'code',
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'cmdname' => '@'
                        },
                        {
                          'text' => 'image'
                        },
                        {
                          'cmdname' => '{'
                        },
                        {
                          'text' => 'f--ile,aze,az,alt,e--xt'
                        },
                        {
                          'cmdname' => '}'
                        }
                      ],
                      'type' => 'brace_container'
                    }
                  ],
                  'source_info' => {
                    'line_nr' => 24
                  }
                },
                {
                  'text' => ' '
                },
                {
                  'cmdname' => 'image',
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'f--ile'
                        }
                      ],
                      'type' => 'brace_arg'
                    },
                    {
                      'contents' => [
                        {
                          'text' => 'aze'
                        }
                      ],
                      'type' => 'brace_arg'
                    },
                    {
                      'contents' => [
                        {
                          'text' => 'az'
                        }
                      ],
                      'type' => 'brace_arg'
                    },
                    {
                      'contents' => [
                        {
                          'text' => 'alt'
                        }
                      ],
                      'type' => 'brace_arg'
                    },
                    {
                      'contents' => [
                        {
                          'text' => 'e--xt'
                        }
                      ],
                      'type' => 'brace_arg'
                    }
                  ],
                  'extra' => {
                    'input_encoding_name' => 'utf-8'
                  },
                  'source_info' => {
                    'line_nr' => 24
                  }
                },
                {
                  'text' => '
'
                },
                {
                  'cmdname' => 'code',
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'cmdname' => '@'
                        },
                        {
                          'text' => 'image'
                        },
                        {
                          'cmdname' => '{'
                        },
                        {
                          'text' => 'f-ile,aze,,a--lt'
                        },
                        {
                          'cmdname' => '}'
                        }
                      ],
                      'type' => 'brace_container'
                    }
                  ],
                  'source_info' => {
                    'line_nr' => 25
                  }
                },
                {
                  'text' => ' '
                },
                {
                  'cmdname' => 'image',
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'f-ile'
                        }
                      ],
                      'type' => 'brace_arg'
                    },
                    {
                      'contents' => [
                        {
                          'text' => 'aze'
                        }
                      ],
                      'type' => 'brace_arg'
                    },
                    {
                      'type' => 'brace_arg'
                    },
                    {
                      'contents' => [
                        {
                          'text' => 'a--lt'
                        }
                      ],
                      'type' => 'brace_arg'
                    }
                  ],
                  'extra' => {
                    'input_encoding_name' => 'utf-8'
                  },
                  'source_info' => {
                    'line_nr' => 25
                  }
                },
                {
                  'text' => '
'
                },
                {
                  'cmdname' => 'code',
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'cmdname' => '@'
                        },
                        {
                          'text' => 'image'
                        },
                        {
                          'cmdname' => '{'
                        },
                        {
                          'cmdname' => '@'
                        },
                        {
                          'text' => 'file'
                        },
                        {
                          'cmdname' => '{'
                        },
                        {
                          'text' => 'f--ile'
                        },
                        {
                          'cmdname' => '}'
                        },
                        {
                          'cmdname' => '@'
                        },
                        {
                          'cmdname' => '@'
                        },
                        {
                          'cmdname' => '@'
                        },
                        {
                          'text' => '.,aze,az,alt,'
                        },
                        {
                          'cmdname' => '@'
                        },
                        {
                          'text' => 'file'
                        },
                        {
                          'cmdname' => '{'
                        },
                        {
                          'text' => 'file ext'
                        },
                        {
                          'cmdname' => '}'
                        },
                        {
                          'text' => ' e--xt'
                        },
                        {
                          'cmdname' => '@'
                        },
                        {
                          'cmdname' => '}'
                        }
                      ],
                      'type' => 'brace_container'
                    }
                  ],
                  'source_info' => {
                    'line_nr' => 26
                  }
                },
                {
                  'text' => ' '
                },
                {
                  'cmdname' => 'image',
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'cmdname' => 'file',
                          'contents' => [
                            {
                              'contents' => [
                                {
                                  'text' => 'f--ile'
                                }
                              ],
                              'type' => 'brace_container'
                            }
                          ],
                          'source_info' => {
                            'line_nr' => 26
                          }
                        },
                        {
                          'cmdname' => '@'
                        },
                        {
                          'cmdname' => '.'
                        }
                      ],
                      'type' => 'brace_arg'
                    },
                    {
                      'contents' => [
                        {
                          'text' => 'aze'
                        }
                      ],
                      'type' => 'brace_arg'
                    },
                    {
                      'contents' => [
                        {
                          'text' => 'az'
                        }
                      ],
                      'type' => 'brace_arg'
                    },
                    {
                      'contents' => [
                        {
                          'text' => 'alt'
                        }
                      ],
                      'type' => 'brace_arg'
                    },
                    {
                      'contents' => [
                        {
                          'cmdname' => 'file',
                          'contents' => [
                            {
                              'contents' => [
                                {
                                  'text' => 'file ext'
                                }
                              ],
                              'type' => 'brace_container'
                            }
                          ],
                          'source_info' => {
                            'line_nr' => 26
                          }
                        },
                        {
                          'text' => ' e--xt'
                        },
                        {
                          'cmdname' => '}'
                        }
                      ],
                      'type' => 'brace_arg'
                    }
                  ],
                  'extra' => {
                    'input_encoding_name' => 'utf-8'
                  },
                  'source_info' => {
                    'line_nr' => 26
                  }
                },
                {
                  'text' => '
'
                },
                {
                  'cmdname' => 'image',
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'image'
                        }
                      ],
                      'type' => 'brace_arg'
                    }
                  ],
                  'extra' => {
                    'input_encoding_name' => 'utf-8'
                  },
                  'source_info' => {
                    'line_nr' => 27
                  }
                },
                {
                  'text' => ' '
                },
                {
                  'cmdname' => 'image',
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'image'
                        }
                      ],
                      'type' => 'brace_arg'
                    }
                  ],
                  'extra' => {
                    'input_encoding_name' => 'utf-8'
                  },
                  'source_info' => {
                    'line_nr' => 27
                  }
                },
                {
                  'text' => '
'
                }
              ],
              'type' => 'preformatted'
            },
            {
              'cmdname' => 'end',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'example'
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
                'text_arg' => 'example'
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
          'source_info' => {
            'line_nr' => 18
          }
        },
        {
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'cmdname' => 'image',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'f--ile'
                }
              ],
              'type' => 'brace_arg'
            },
            {
              'type' => 'brace_arg'
            },
            {
              'type' => 'brace_arg'
            },
            {
              'contents' => [
                {
                  'text' => 'a very long alt argument that could span more than one line who knows'
                }
              ],
              'type' => 'brace_arg'
            }
          ],
          'extra' => {
            'input_encoding_name' => 'utf-8'
          },
          'source_info' => {
            'line_nr' => 30
          }
        },
        {
          'text' => '
'
        },
        {
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'contents' => [
            {
              'text' => 'in para
'
            },
            {
              'cmdname' => 'image',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'f--ile'
                    }
                  ],
                  'type' => 'brace_arg'
                },
                {
                  'type' => 'brace_arg'
                },
                {
                  'type' => 'brace_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => 'a very long alt argument that could span more than one line who knows'
                    }
                  ],
                  'type' => 'brace_arg'
                }
              ],
              'extra' => {
                'input_encoding_name' => 'utf-8'
              },
              'source_info' => {
                'line_nr' => 33
              }
            },
            {
              'text' => '.
'
            }
          ],
          'type' => 'paragraph'
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
        'line_nr' => 5
      }
    }
  ],
  'type' => 'document_root'
};

$result_texis{'image_formatting'} = '@node Top
@top top

@node chap
@chapter Chapter

@code{@@image@{f--ile@}} @image{f--ile}
@code{@@image@{f--ile,l--i@}} @image{f--ile,l--i}
@code{@@image@{f--ile,,l--e@}} @image{f--ile,,l--e}
@code{@@image@{f--ile,,,alt@}} @image{f--ile,,,alt}
@code{@@image@{f--ile,,,,e-d-xt@}} @image{f--ile,,,,e--xt}
@code{@@image@{f--ile,aze,az,alt,e--xt@}} @image{f--ile,aze,az,alt,e--xt}
@code{@@image@{f--ile,aze,az,alt,} @image{f--ile,aze,az,alt,}
@code{@@image@{f-ile,aze,,a--lt@}} @image{f-ile,aze,,a--lt}
@code{@@image@{@@file@{f--ile@}@@@@@@.,aze,az,alt,@@file@{file ext@} e--xt@@@}} @image{@file{f--ile}@@@.,aze,az,alt,@file{file ext} e--xt@}}
@image{image} @image{image}

@example
@code{@@image@{f--ile@}} @image{f--ile}
@code{@@image@{f--ile,l--i@}} @image{f--ile,l--i}
@code{@@image@{f--ile,,l--e@}} @image{f--ile,,l--e}
@code{@@image@{f--ile,,,alt@}} @image{f--ile,,,alt}
@code{@@image@{f--ile,,,,e-d-xt@}} @image{f--ile,,,,e--xt}
@code{@@image@{f--ile,aze,az,alt,e--xt@}} @image{f--ile,aze,az,alt,e--xt}
@code{@@image@{f-ile,aze,,a--lt@}} @image{f-ile,aze,,a--lt}
@code{@@image@{@@file@{f--ile@}@@@@@@.,aze,az,alt,@@file@{file ext@} e--xt@@@}} @image{@file{f--ile}@@@.,aze,az,alt,@file{file ext} e--xt@}}
@image{image} @image{image}
@end example

@image{f--ile,,,a very long alt argument that could span more than one line who knows}

in para
@image{f--ile,,,a very long alt argument that could span more than one line who knows}.
';


$result_texts{'image_formatting'} = 'top
***

1 Chapter
*********

@image{f--ile} f--ile
@image{f--ile,l--i} f--ile
@image{f--ile,,l--e} f--ile
@image{f--ile,,,alt} f--ile
@image{f--ile,,,,e-d-xt} f--ile
@image{f--ile,aze,az,alt,e--xt} f--ile
@image{f--ile,aze,az,alt, f--ile
@image{f-ile,aze,,a--lt} f-ile
@image{@file{f--ile}@@@.,aze,az,alt,@file{file ext} e--xt@} f--ile@.
image image

@image{f--ile} f--ile
@image{f--ile,l--i} f--ile
@image{f--ile,,l--e} f--ile
@image{f--ile,,,alt} f--ile
@image{f--ile,,,,e-d-xt} f--ile
@image{f--ile,aze,az,alt,e--xt} f--ile
@image{f-ile,aze,,a--lt} f-ile
@image{@file{f--ile}@@@.,aze,az,alt,@file{file ext} e--xt@} f--ile@.
image image

f--ile

in para
f--ile.
';

$result_sectioning{'image_formatting'} = {
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
                    'normalized' => 'chap'
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
$result_sectioning{'image_formatting'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[0]{'extra'}{'section_directions'}{'up'} = $result_sectioning{'image_formatting'}{'extra'}{'section_childs'}[0];
$result_sectioning{'image_formatting'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[0]{'extra'}{'toplevel_directions'}{'prev'} = $result_sectioning{'image_formatting'}{'extra'}{'section_childs'}[0];
$result_sectioning{'image_formatting'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[0]{'extra'}{'toplevel_directions'}{'up'} = $result_sectioning{'image_formatting'}{'extra'}{'section_childs'}[0];
$result_sectioning{'image_formatting'}{'extra'}{'section_childs'}[0]{'extra'}{'sectioning_root'} = $result_sectioning{'image_formatting'};

$result_nodes{'image_formatting'} = [
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
              'prev' => {},
              'up' => {}
            },
            'normalized' => 'chap'
          }
        }
      },
      'normalized' => 'Top'
    }
  },
  {}
];
$result_nodes{'image_formatting'}[0]{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'prev'} = $result_nodes{'image_formatting'}[0];
$result_nodes{'image_formatting'}[0]{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'up'} = $result_nodes{'image_formatting'}[0];
$result_nodes{'image_formatting'}[1] = $result_nodes{'image_formatting'}[0]{'extra'}{'node_directions'}{'next'};

$result_menus{'image_formatting'} = [
  {
    'extra' => {
      'normalized' => 'Top'
    }
  },
  {
    'extra' => {
      'normalized' => 'chap'
    }
  }
];

$result_errors{'image_formatting'} = [];


$result_floats{'image_formatting'} = {};



$result_converted{'plaintext'}->{'image_formatting'} = 'top
***

1 Chapter
*********

‘@image{f--ile}’ Image description""\\. ‘@image{f--ile,l--i}’ Image description""\\. ‘@image{f--ile,,l--e}’ Image description""\\.
‘@image{f--ile,,,alt}’ Image description""\\. ‘@image{f--ile,,,,e-d-xt}’ Image description""\\.
‘@image{f--ile,aze,az,alt,e--xt}’ Image description""\\. ‘@image{f--ile,aze,az,alt,’ Image description""\\.
‘@image{f-ile,aze,,a--lt}’ [a-lt]
‘@image{@file{f--ile}@@@.,aze,az,alt,@file{file ext} e--xt@}’ [alt] aaa
bbb
ccc aaa
bbb
ccc

     @image{f--ile} Image description""\\.
     @image{f--ile,l--i} Image description""\\.
     @image{f--ile,,l--e} Image description""\\.
     @image{f--ile,,,alt} Image description""\\.
     @image{f--ile,,,,e-d-xt} Image description""\\.
     @image{f--ile,aze,az,alt,e--xt} Image description""\\.
     @image{f-ile,aze,,a--lt} [a-lt]
     @image{@file{f--ile}@@@.,aze,az,alt,@file{file ext} e--xt@} [alt]
     aaa
bbb
ccc aaa
bbb
ccc

Image description""\\.

   in para Image description""\\..
';


$result_converted{'html_text'}->{'image_formatting'} = '<div class="top-level-extent" id="Top">
<h1 class="top" id="top"><span>top<a class="copiable-link" href="#top"> &para;</a></span></h1>

<ul class="mini-toc">
<li><a href="#chap" accesskey="1">Chapter</a></li>
</ul>
<hr>
<div class="chapter-level-extent" id="chap">
<h2 class="chapter" id="Chapter"><span>1 Chapter<a class="copiable-link" href="#Chapter"> &para;</a></span></h2>

<p><code class="code">@image{f--ile}</code> <img class="image" src="f--ile.png" alt="f--ile">
<code class="code">@image{f--ile,l--i}</code> <img class="image" src="f--ile.png" alt="f--ile">
<code class="code">@image{f--ile,,l--e}</code> <img class="image" src="f--ile.png" alt="f--ile">
<code class="code">@image{f--ile,,,alt}</code> <img class="image" src="f--ile.png" alt="alt">
<code class="code">@image{f--ile,,,,e-d-xt}</code> <img class="image" src="f--ile.png" alt="f--ile">
<code class="code">@image{f--ile,aze,az,alt,e--xt}</code> <img class="image" src="f--ile.png" alt="alt">
<code class="code">@image{f--ile,aze,az,alt,</code> <img class="image" src="f--ile.png" alt="alt">
<code class="code">@image{f-ile,aze,,a--lt}</code> <img class="image" src="f-ile.jpg" alt="a&ndash;lt">
<code class="code">@image{@file{f--ile}@@@.,aze,az,alt,@file{file ext} e--xt@}</code> <img class="image" src="f--ile%40.file%20ext%20e--xt%7d" alt="alt">
<img class="image" src="image.jpg" alt="image"> <img class="image" src="image.jpg" alt="image">
</p>
<div class="example">
<pre class="example-preformatted"><code class="code">@image{f--ile}</code> <img class="image" src="f--ile.png" alt="f--ile">
<code class="code">@image{f--ile,l--i}</code> <img class="image" src="f--ile.png" alt="f--ile">
<code class="code">@image{f--ile,,l--e}</code> <img class="image" src="f--ile.png" alt="f--ile">
<code class="code">@image{f--ile,,,alt}</code> <img class="image" src="f--ile.png" alt="alt">
<code class="code">@image{f--ile,,,,e-d-xt}</code> <img class="image" src="f--ile.png" alt="f--ile">
<code class="code">@image{f--ile,aze,az,alt,e--xt}</code> <img class="image" src="f--ile.png" alt="alt">
<code class="code">@image{f-ile,aze,,a--lt}</code> <img class="image" src="f-ile.jpg" alt="a&ndash;lt">
<code class="code">@image{@file{f--ile}@@@.,aze,az,alt,@file{file ext} e--xt@}</code> <img class="image" src="f--ile%40.file%20ext%20e--xt%7d" alt="alt">
<img class="image" src="image.jpg" alt="image"> <img class="image" src="image.jpg" alt="image">
</pre></div>

<img class="image" src="f--ile.png" alt="a very long alt argument that could span more than one line who knows">

<p>in para
<img class="image" src="f--ile.png" alt="a very long alt argument that could span more than one line who knows">.
</p></div>
</div>
';

$result_converted_errors{'html_text'}->{'image_formatting'} = [
  {
    'error_line' => 'warning: @image file `f-ile\' (for HTML) not found, using `f-ile.jpg\'
',
    'line_nr' => 14,
    'text' => '@image file `f-ile\' (for HTML) not found, using `f-ile.jpg\'',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: @image file `f--ile@.\' (for HTML) not found, using `f--ile@.file ext e--xt}\'
',
    'line_nr' => 15,
    'text' => '@image file `f--ile@.\' (for HTML) not found, using `f--ile@.file ext e--xt}\'',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: @image file `image\' (for HTML) not found, using `image.jpg\'
',
    'line_nr' => 16,
    'text' => '@image file `image\' (for HTML) not found, using `image.jpg\'',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: @image file `image\' (for HTML) not found, using `image.jpg\'
',
    'line_nr' => 16,
    'text' => '@image file `image\' (for HTML) not found, using `image.jpg\'',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: @image file `f-ile\' (for HTML) not found, using `f-ile.jpg\'
',
    'line_nr' => 25,
    'text' => '@image file `f-ile\' (for HTML) not found, using `f-ile.jpg\'',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: @image file `f--ile@.\' (for HTML) not found, using `f--ile@.file ext e--xt}\'
',
    'line_nr' => 26,
    'text' => '@image file `f--ile@.\' (for HTML) not found, using `f--ile@.file ext e--xt}\'',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: @image file `image\' (for HTML) not found, using `image.jpg\'
',
    'line_nr' => 27,
    'text' => '@image file `image\' (for HTML) not found, using `image.jpg\'',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: @image file `image\' (for HTML) not found, using `image.jpg\'
',
    'line_nr' => 27,
    'text' => '@image file `image\' (for HTML) not found, using `image.jpg\'',
    'type' => 'warning'
  }
];



$result_converted{'xml'}->{'image_formatting'} = '<node name="Top" spaces=" "><nodename>Top</nodename><nodenext automatic="on">chap</nodenext></node>
<top spaces=" "><sectiontitle>top</sectiontitle>

</top>
<node name="chap" spaces=" "><nodename>chap</nodename><nodeprev automatic="on">Top</nodeprev><nodeup automatic="on">Top</nodeup></node>
<chapter spaces=" "><sectiontitle>Chapter</sectiontitle>

<para><code>&arobase;image&lbrace;f--ile&rbrace;</code> <image where="inline"><imagefile>f--ile</imagefile></image>
<code>&arobase;image&lbrace;f--ile,l--i&rbrace;</code> <image where="inline"><imagefile>f--ile</imagefile><imagewidth>l--i</imagewidth></image>
<code>&arobase;image&lbrace;f--ile,,l--e&rbrace;</code> <image where="inline"><imagefile>f--ile</imagefile><imageheight>l--e</imageheight></image>
<code>&arobase;image&lbrace;f--ile,,,alt&rbrace;</code> <image where="inline"><imagefile>f--ile</imagefile><alttext>alt</alttext></image>
<code>&arobase;image&lbrace;f--ile,,,,e-d-xt&rbrace;</code> <image where="inline"><imagefile>f--ile</imagefile><imageextension>e--xt</imageextension></image>
<code>&arobase;image&lbrace;f--ile,aze,az,alt,e--xt&rbrace;</code> <image where="inline"><imagefile>f--ile</imagefile><imagewidth>aze</imagewidth><imageheight>az</imageheight><alttext>alt</alttext><imageextension>e--xt</imageextension></image>
<code>&arobase;image&lbrace;f--ile,aze,az,alt,</code> <image where="inline"><imagefile>f--ile</imagefile><imagewidth>aze</imagewidth><imageheight>az</imageheight><alttext>alt</alttext><imageextension></imageextension></image>
<code>&arobase;image&lbrace;f-ile,aze,,a--lt&rbrace;</code> <image where="inline"><imagefile>f-ile</imagefile><imagewidth>aze</imagewidth><alttext>a&textndash;lt</alttext></image>
<code>&arobase;image&lbrace;&arobase;file&lbrace;f--ile&rbrace;&arobase;&arobase;&arobase;.,aze,az,alt,&arobase;file&lbrace;file ext&rbrace; e--xt&arobase;&rbrace;</code> <image where="inline"><imagefile><file>f--ile</file>&arobase;&eosperiod;</imagefile><imagewidth>aze</imagewidth><imageheight>az</imageheight><alttext>alt</alttext><imageextension><file>file ext</file> e--xt&rbrace;</imageextension></image>
<image where="inline"><imagefile>image</imagefile></image> <image where="inline"><imagefile>image</imagefile></image>
</para>
<example endspaces=" ">
<pre xml:space="preserve"><code>&arobase;image&lbrace;f--ile&rbrace;</code> <image where="inline"><imagefile>f--ile</imagefile></image>
<code>&arobase;image&lbrace;f--ile,l--i&rbrace;</code> <image where="inline"><imagefile>f--ile</imagefile><imagewidth>l--i</imagewidth></image>
<code>&arobase;image&lbrace;f--ile,,l--e&rbrace;</code> <image where="inline"><imagefile>f--ile</imagefile><imageheight>l--e</imageheight></image>
<code>&arobase;image&lbrace;f--ile,,,alt&rbrace;</code> <image where="inline"><imagefile>f--ile</imagefile><alttext>alt</alttext></image>
<code>&arobase;image&lbrace;f--ile,,,,e-d-xt&rbrace;</code> <image where="inline"><imagefile>f--ile</imagefile><imageextension>e--xt</imageextension></image>
<code>&arobase;image&lbrace;f--ile,aze,az,alt,e--xt&rbrace;</code> <image where="inline"><imagefile>f--ile</imagefile><imagewidth>aze</imagewidth><imageheight>az</imageheight><alttext>alt</alttext><imageextension>e--xt</imageextension></image>
<code>&arobase;image&lbrace;f-ile,aze,,a--lt&rbrace;</code> <image where="inline"><imagefile>f-ile</imagefile><imagewidth>aze</imagewidth><alttext>a--lt</alttext></image>
<code>&arobase;image&lbrace;&arobase;file&lbrace;f--ile&rbrace;&arobase;&arobase;&arobase;.,aze,az,alt,&arobase;file&lbrace;file ext&rbrace; e--xt&arobase;&rbrace;</code> <image where="inline"><imagefile><file>f--ile</file>&arobase;&eosperiod;</imagefile><imagewidth>aze</imagewidth><imageheight>az</imageheight><alttext>alt</alttext><imageextension><file>file ext</file> e--xt&rbrace;</imageextension></image>
<image where="inline"><imagefile>image</imagefile></image> <image where="inline"><imagefile>image</imagefile></image>
</pre></example>

<image><imagefile>f--ile</imagefile><alttext>a very long alt argument that could span more than one line who knows</alttext></image>

<para>in para
<image where="inline"><imagefile>f--ile</imagefile><alttext>a very long alt argument that could span more than one line who knows</alttext></image>.
</para></chapter>
';


$result_converted{'docbook'}->{'image_formatting'} = '<chapter label="1" id="chap">
<title>Chapter</title>

<para><literal>@image{f--ile}</literal> <inlinemediaobject><imageobject><imagedata fileref="f--ile.png" format="PNG"></imagedata></imageobject><textobject><literallayout>Image description&quot;&quot;\\.</literallayout></textobject></inlinemediaobject>
<literal>@image{f--ile,l--i}</literal> <inlinemediaobject><imageobject><imagedata fileref="f--ile.png" format="PNG"></imagedata></imageobject><textobject><literallayout>Image description&quot;&quot;\\.</literallayout></textobject></inlinemediaobject>
<literal>@image{f--ile,,l--e}</literal> <inlinemediaobject><imageobject><imagedata fileref="f--ile.png" format="PNG"></imagedata></imageobject><textobject><literallayout>Image description&quot;&quot;\\.</literallayout></textobject></inlinemediaobject>
<literal>@image{f--ile,,,alt}</literal> <inlinemediaobject><imageobject><imagedata fileref="f--ile.png" format="PNG"></imagedata></imageobject><textobject><literallayout>Image description&quot;&quot;\\.</literallayout></textobject></inlinemediaobject>
<literal>@image{f--ile,,,,e-d-xt}</literal> <inlinemediaobject><imageobject><imagedata fileref="f--ile.png" format="PNG"></imagedata></imageobject><textobject><literallayout>Image description&quot;&quot;\\.</literallayout></textobject></inlinemediaobject>
<literal>@image{f--ile,aze,az,alt,e--xt}</literal> <inlinemediaobject><imageobject><imagedata fileref="f--ile.png" format="PNG"></imagedata></imageobject><textobject><literallayout>Image description&quot;&quot;\\.</literallayout></textobject></inlinemediaobject>
<literal>@image{f--ile,aze,az,alt,</literal> <inlinemediaobject><imageobject><imagedata fileref="f--ile.png" format="PNG"></imagedata></imageobject><textobject><literallayout>Image description&quot;&quot;\\.</literallayout></textobject></inlinemediaobject>
<literal>@image{f-ile,aze,,a--lt}</literal> <inlinemediaobject><imageobject><imagedata fileref="f-ile.jpg" format="JPG"></imagedata></imageobject></inlinemediaobject>
<literal>@image{@file{f--ile}@@@.,aze,az,alt,@file{file ext} e--xt@}</literal> <inlinemediaobject><imageobject><imagedata fileref="f--ile@..jpg" format="JPG"></imagedata></imageobject></inlinemediaobject>
<inlinemediaobject><imageobject><imagedata fileref="image.jpg" format="JPG"></imagedata></imageobject><textobject><literallayout>aaa
bbb
ccc</literallayout></textobject></inlinemediaobject> <inlinemediaobject><imageobject><imagedata fileref="image.jpg" format="JPG"></imagedata></imageobject><textobject><literallayout>aaa
bbb
ccc</literallayout></textobject></inlinemediaobject>
</para>
<screen><literal>@image{f--ile}</literal> <inlinemediaobject><imageobject><imagedata fileref="f--ile.png" format="PNG"></imagedata></imageobject><textobject><literallayout>Image description&quot;&quot;\\.</literallayout></textobject></inlinemediaobject>
<literal>@image{f--ile,l--i}</literal> <inlinemediaobject><imageobject><imagedata fileref="f--ile.png" format="PNG"></imagedata></imageobject><textobject><literallayout>Image description&quot;&quot;\\.</literallayout></textobject></inlinemediaobject>
<literal>@image{f--ile,,l--e}</literal> <inlinemediaobject><imageobject><imagedata fileref="f--ile.png" format="PNG"></imagedata></imageobject><textobject><literallayout>Image description&quot;&quot;\\.</literallayout></textobject></inlinemediaobject>
<literal>@image{f--ile,,,alt}</literal> <inlinemediaobject><imageobject><imagedata fileref="f--ile.png" format="PNG"></imagedata></imageobject><textobject><literallayout>Image description&quot;&quot;\\.</literallayout></textobject></inlinemediaobject>
<literal>@image{f--ile,,,,e-d-xt}</literal> <inlinemediaobject><imageobject><imagedata fileref="f--ile.png" format="PNG"></imagedata></imageobject><textobject><literallayout>Image description&quot;&quot;\\.</literallayout></textobject></inlinemediaobject>
<literal>@image{f--ile,aze,az,alt,e--xt}</literal> <inlinemediaobject><imageobject><imagedata fileref="f--ile.png" format="PNG"></imagedata></imageobject><textobject><literallayout>Image description&quot;&quot;\\.</literallayout></textobject></inlinemediaobject>
<literal>@image{f-ile,aze,,a--lt}</literal> <inlinemediaobject><imageobject><imagedata fileref="f-ile.jpg" format="JPG"></imagedata></imageobject></inlinemediaobject>
<literal>@image{@file{f--ile}@@@.,aze,az,alt,@file{file ext} e--xt@}</literal> <inlinemediaobject><imageobject><imagedata fileref="f--ile@..jpg" format="JPG"></imagedata></imageobject></inlinemediaobject>
<inlinemediaobject><imageobject><imagedata fileref="image.jpg" format="JPG"></imagedata></imageobject><textobject><literallayout>aaa
bbb
ccc</literallayout></textobject></inlinemediaobject> <inlinemediaobject><imageobject><imagedata fileref="image.jpg" format="JPG"></imagedata></imageobject><textobject><literallayout>aaa
bbb
ccc</literallayout></textobject></inlinemediaobject>
</screen>
<informalfigure><mediaobject><imageobject><imagedata fileref="f--ile.png" format="PNG"></imagedata></imageobject><textobject><literallayout>Image description&quot;&quot;\\.</literallayout></textobject></mediaobject></informalfigure>

<para>in para
<inlinemediaobject><imageobject><imagedata fileref="f--ile.png" format="PNG"></imagedata></imageobject><textobject><literallayout>Image description&quot;&quot;\\.</literallayout></textobject></inlinemediaobject>.
</para></chapter>
';

$result_converted_errors{'docbook'}->{'image_formatting'} = [
  {
    'error_line' => 'warning: @image file `f-ile\' not found, using `f-ile.jpg\'
',
    'line_nr' => 14,
    'text' => '@image file `f-ile\' not found, using `f-ile.jpg\'',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: @image file `f--ile@.\' not found, using `f--ile@..jpg\'
',
    'line_nr' => 15,
    'text' => '@image file `f--ile@.\' not found, using `f--ile@..jpg\'',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: @image file `f-ile\' not found, using `f-ile.jpg\'
',
    'line_nr' => 25,
    'text' => '@image file `f-ile\' not found, using `f-ile.jpg\'',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: @image file `f--ile@.\' not found, using `f--ile@..jpg\'
',
    'line_nr' => 26,
    'text' => '@image file `f--ile@.\' not found, using `f--ile@..jpg\'',
    'type' => 'warning'
  }
];



$result_converted{'latex_text'}->{'image_formatting'} = '\\label{anchor:Top}%
\\chapter{{Chapter}}
\\label{anchor:chap}%

\\texttt{@image\\{f{-}{-}ile\\}} \\includegraphics{f--ile}
\\texttt{@image\\{f{-}{-}ile,l{-}{-}i\\}} \\includegraphics[width=l--i]{f--ile}
\\texttt{@image\\{f{-}{-}ile{,}{,}l{-}{-}e\\}} \\includegraphics[height=l--e]{f--ile}
\\texttt{@image\\{f{-}{-}ile{,}{,},alt\\}} \\includegraphics{f--ile}
\\texttt{@image\\{f{-}{-}ile{,}{,}{,}{,}e-d-xt\\}} \\includegraphics{f--ile}
\\texttt{@image\\{f{-}{-}ile,aze,az,alt,e{-}{-}xt\\}} \\includegraphics[width=aze,height=az]{f--ile}
\\texttt{@image\\{f{-}{-}ile,aze,az,alt,} \\includegraphics[width=aze,height=az]{f--ile}
\\texttt{@image\\{f-ile,aze{,}{,}a{-}{-}lt\\}} \\includegraphics[width=aze]{f-ile}
\\texttt{@image\\{@file\\{f{-}{-}ile\\}@@@.,aze,az,alt,@file\\{file ext\\}\\ e{-}{-}xt@\\}} \\includegraphics[width=aze,height=az]{f--ile@.}
\\includegraphics{image} \\includegraphics{image}

\\begin{Texinfoindented}
\\begin{Texinfopreformatted}%
\\ttfamily \\texttt{@image\\{f{-}{-}ile\\}}\\ \\includegraphics{f--ile}
\\texttt{@image\\{f{-}{-}ile,l{-}{-}i\\}}\\ \\includegraphics[width=l--i]{f--ile}
\\texttt{@image\\{f{-}{-}ile{,}{,}l{-}{-}e\\}}\\ \\includegraphics[height=l--e]{f--ile}
\\texttt{@image\\{f{-}{-}ile{,}{,},alt\\}}\\ \\includegraphics{f--ile}
\\texttt{@image\\{f{-}{-}ile{,}{,}{,}{,}e-d-xt\\}}\\ \\includegraphics{f--ile}
\\texttt{@image\\{f{-}{-}ile,aze,az,alt,e{-}{-}xt\\}}\\ \\includegraphics[width=aze,height=az]{f--ile}
\\texttt{@image\\{f-ile,aze{,}{,}a{-}{-}lt\\}}\\ \\includegraphics[width=aze]{f-ile}
\\texttt{@image\\{@file\\{f{-}{-}ile\\}@@@.,aze,az,alt,@file\\{file ext\\}\\ e{-}{-}xt@\\}}\\ \\includegraphics[width=aze,height=az]{f--ile@.}
\\includegraphics{image}\\ \\includegraphics{image}
\\end{Texinfopreformatted}
\\end{Texinfoindented}

\\includegraphics{f--ile}

in para
\\includegraphics{f--ile}.
';

$result_converted_errors{'latex_text'}->{'image_formatting'} = [
  {
    'error_line' => 'warning: @image file `f-ile\' (for LaTeX) not found
',
    'line_nr' => 14,
    'text' => '@image file `f-ile\' (for LaTeX) not found',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: @image file `f--ile@.\' (for LaTeX) not found
',
    'line_nr' => 15,
    'text' => '@image file `f--ile@.\' (for LaTeX) not found',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: @image file `image\' (for LaTeX) not found
',
    'line_nr' => 16,
    'text' => '@image file `image\' (for LaTeX) not found',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: @image file `image\' (for LaTeX) not found
',
    'line_nr' => 16,
    'text' => '@image file `image\' (for LaTeX) not found',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: @image file `f-ile\' (for LaTeX) not found
',
    'line_nr' => 25,
    'text' => '@image file `f-ile\' (for LaTeX) not found',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: @image file `f--ile@.\' (for LaTeX) not found
',
    'line_nr' => 26,
    'text' => '@image file `f--ile@.\' (for LaTeX) not found',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: @image file `image\' (for LaTeX) not found
',
    'line_nr' => 27,
    'text' => '@image file `image\' (for LaTeX) not found',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: @image file `image\' (for LaTeX) not found
',
    'line_nr' => 27,
    'text' => '@image file `image\' (for LaTeX) not found',
    'type' => 'warning'
  }
];



$result_converted{'info'}->{'image_formatting'} = 'This is , produced from .


File: ,  Node: Top,  Next: chap,  Up: (dir)

top
***

* Menu:

* chap::


File: ,  Node: chap,  Prev: Top,  Up: Top

1 Chapter
*********

‘@image{f--ile}’  [image src="f--ile.png" text="Image description\\"\\"\\\\." ] ‘@image{f--ile,l--i}’  [image src="f--ile.png" text="Image description\\"\\"\\\\." ] ‘@image{f--ile,,l--e}’  [image src="f--ile.png" text="Image description\\"\\"\\\\." ]
‘@image{f--ile,,,alt}’  [image src="f--ile.png" alt="alt" text="Image description\\"\\"\\\\." ] ‘@image{f--ile,,,,e-d-xt}’  [image src="f--ile.png" text="Image description\\"\\"\\\\." ]
‘@image{f--ile,aze,az,alt,e--xt}’  [image src="f--ile.png" alt="alt" text="Image description\\"\\"\\\\." ] ‘@image{f--ile,aze,az,alt,’  [image src="f--ile.png" alt="alt" text="Image description\\"\\"\\\\." ]
‘@image{f-ile,aze,,a--lt}’ [a-lt]
‘@image{@file{f--ile}@@@.,aze,az,alt,@file{file ext} e--xt@}’ [alt] aaa
bbb
ccc aaa
bbb
ccc

     @image{f--ile}  [image src="f--ile.png" text="Image description\\"\\"\\\\." ]
     @image{f--ile,l--i}  [image src="f--ile.png" text="Image description\\"\\"\\\\." ]
     @image{f--ile,,l--e}  [image src="f--ile.png" text="Image description\\"\\"\\\\." ]
     @image{f--ile,,,alt}  [image src="f--ile.png" alt="alt" text="Image description\\"\\"\\\\." ]
     @image{f--ile,,,,e-d-xt}  [image src="f--ile.png" text="Image description\\"\\"\\\\." ]
     @image{f--ile,aze,az,alt,e--xt}  [image src="f--ile.png" alt="alt" text="Image description\\"\\"\\\\." ]
     @image{f-ile,aze,,a--lt} [a-lt]
     @image{@file{f--ile}@@@.,aze,az,alt,@file{file ext} e--xt@} [alt]
     aaa
bbb
ccc aaa
bbb
ccc

 [image src="f--ile.png" alt="a very long alt argument that could span more than one line who knows" text="Image description\\"\\"\\\\." ]

   in para  [image src="f--ile.png" alt="a very long alt argument that could span more than one line who knows" text="Image description\\"\\"\\\\." ].


Tag Table:
Node: Top27
Node: chap102

End Tag Table


Local Variables:
coding: utf-8
End:
';

1;
