use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'multiline_image_and_align'} = {
  'contents' => [
    {
      'contents' => [
        {
          'args' => [
            {
              'contents' => [
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'text' => 'figure'
                        }
                      ],
                      'type' => 'brace_command_container'
                    }
                  ],
                  'cmdname' => 'image',
                  'extra' => {
                    'input_encoding_name' => 'utf-8'
                  },
                  'source_info' => {
                    'line_nr' => 1
                  }
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
          'cmdname' => 'center',
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
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'text' => 'CCCC '
                },
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'text' => 'figure'
                        }
                      ],
                      'type' => 'brace_command_container'
                    }
                  ],
                  'cmdname' => 'image',
                  'extra' => {
                    'input_encoding_name' => 'utf-8'
                  },
                  'source_info' => {
                    'line_nr' => 3
                  }
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
          'cmdname' => 'center',
          'info' => {
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'line_nr' => 3
          }
        },
        {
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'text' => 'fffffffffffffffffffffffffffffffffffffff '
                },
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'text' => 'figure'
                        }
                      ],
                      'type' => 'brace_command_container'
                    }
                  ],
                  'cmdname' => 'image',
                  'extra' => {
                    'input_encoding_name' => 'utf-8'
                  },
                  'source_info' => {
                    'line_nr' => 5
                  }
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
          'cmdname' => 'center',
          'info' => {
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'line_nr' => 5
          }
        },
        {
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'text' => 'dddd '
                },
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'text' => 'figure'
                        }
                      ],
                      'type' => 'brace_command_container'
                    }
                  ],
                  'cmdname' => 'image',
                  'extra' => {
                    'input_encoding_name' => 'utf-8'
                  },
                  'source_info' => {
                    'line_nr' => 7
                  }
                },
                {
                  'text' => ' iiiii'
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
          'cmdname' => 'center',
          'info' => {
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'line_nr' => 7
          }
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
          'cmdname' => 'flushright',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'AAA
'
                },
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'text' => 'figure'
                        }
                      ],
                      'type' => 'brace_command_container'
                    }
                  ],
                  'cmdname' => 'image',
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
                  'text' => 'BBB '
                },
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'text' => 'figure'
                        }
                      ],
                      'type' => 'brace_command_container'
                    }
                  ],
                  'cmdname' => 'image',
                  'extra' => {
                    'input_encoding_name' => 'utf-8'
                  },
                  'source_info' => {
                    'line_nr' => 13
                  }
                },
                {
                  'text' => ' gggg '
                },
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'text' => 'figure'
                        }
                      ],
                      'type' => 'brace_command_container'
                    }
                  ],
                  'cmdname' => 'image',
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
                  'text' => 'HHH
'
                },
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'text' => 'figure'
                        }
                      ],
                      'type' => 'brace_command_container'
                    }
                  ],
                  'cmdname' => 'image',
                  'extra' => {
                    'input_encoding_name' => 'utf-8'
                  },
                  'source_info' => {
                    'line_nr' => 16
                  }
                },
                {
                  'text' => ' JJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJ
'
                }
              ],
              'type' => 'paragraph'
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'text' => 'flushright'
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
                'text_arg' => 'flushright'
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'line_nr' => 17
              }
            }
          ],
          'source_info' => {
            'line_nr' => 9
          }
        },
        {
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
                          'text' => 'figure'
                        }
                      ],
                      'type' => 'brace_command_container'
                    },
                    {
                      'info' => {
                        'spaces_before_argument' => {
                          'text' => ' '
                        }
                      },
                      'type' => 'brace_command_container'
                    },
                    {
                      'info' => {
                        'spaces_before_argument' => {
                          'text' => ' '
                        }
                      },
                      'type' => 'brace_command_container'
                    },
                    {
                      'info' => {
                        'spaces_before_argument' => {
                          'text' => ' '
                        }
                      },
                      'type' => 'brace_command_container'
                    },
                    {
                      'contents' => [
                        {
                          'text' => 'txt'
                        }
                      ],
                      'type' => 'brace_command_container'
                    }
                  ],
                  'cmdname' => 'image',
                  'extra' => {
                    'input_encoding_name' => 'utf-8'
                  },
                  'source_info' => {
                    'line_nr' => 19
                  }
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
          'cmdname' => 'center',
          'info' => {
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'line_nr' => 19
          }
        },
        {
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'text' => 'CCCC '
                },
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'text' => 'figure'
                        }
                      ],
                      'type' => 'brace_command_container'
                    },
                    {
                      'info' => {
                        'spaces_before_argument' => {
                          'text' => ' '
                        }
                      },
                      'type' => 'brace_command_container'
                    },
                    {
                      'info' => {
                        'spaces_before_argument' => {
                          'text' => ' '
                        }
                      },
                      'type' => 'brace_command_container'
                    },
                    {
                      'info' => {
                        'spaces_before_argument' => {
                          'text' => ' '
                        }
                      },
                      'type' => 'brace_command_container'
                    },
                    {
                      'contents' => [
                        {
                          'text' => 'txt'
                        }
                      ],
                      'type' => 'brace_command_container'
                    }
                  ],
                  'cmdname' => 'image',
                  'extra' => {
                    'input_encoding_name' => 'utf-8'
                  },
                  'source_info' => {
                    'line_nr' => 21
                  }
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
          'cmdname' => 'center',
          'info' => {
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'line_nr' => 21
          }
        },
        {
          'text' => '  
',
          'type' => 'empty_line'
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'text' => 'fffffffffffffffffffffffffffffffffffffff '
                },
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'text' => 'figure'
                        }
                      ],
                      'type' => 'brace_command_container'
                    },
                    {
                      'info' => {
                        'spaces_before_argument' => {
                          'text' => ' '
                        }
                      },
                      'type' => 'brace_command_container'
                    },
                    {
                      'info' => {
                        'spaces_before_argument' => {
                          'text' => ' '
                        }
                      },
                      'type' => 'brace_command_container'
                    },
                    {
                      'info' => {
                        'spaces_before_argument' => {
                          'text' => ' '
                        }
                      },
                      'type' => 'brace_command_container'
                    },
                    {
                      'contents' => [
                        {
                          'text' => 'txt'
                        }
                      ],
                      'type' => 'brace_command_container'
                    }
                  ],
                  'cmdname' => 'image',
                  'extra' => {
                    'input_encoding_name' => 'utf-8'
                  },
                  'source_info' => {
                    'line_nr' => 23
                  }
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
          'cmdname' => 'center',
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
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'text' => 'dddd '
                },
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'text' => 'figure'
                        }
                      ],
                      'type' => 'brace_command_container'
                    },
                    {
                      'info' => {
                        'spaces_before_argument' => {
                          'text' => ' '
                        }
                      },
                      'type' => 'brace_command_container'
                    },
                    {
                      'info' => {
                        'spaces_before_argument' => {
                          'text' => ' '
                        }
                      },
                      'type' => 'brace_command_container'
                    },
                    {
                      'info' => {
                        'spaces_before_argument' => {
                          'text' => ' '
                        }
                      },
                      'type' => 'brace_command_container'
                    },
                    {
                      'contents' => [
                        {
                          'text' => 'txt'
                        }
                      ],
                      'type' => 'brace_command_container'
                    }
                  ],
                  'cmdname' => 'image',
                  'extra' => {
                    'input_encoding_name' => 'utf-8'
                  },
                  'source_info' => {
                    'line_nr' => 25
                  }
                },
                {
                  'text' => ' iiiii'
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
          'cmdname' => 'center',
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
          'cmdname' => 'flushright',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'AAA
'
                },
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'text' => 'figure'
                        }
                      ],
                      'type' => 'brace_command_container'
                    },
                    {
                      'info' => {
                        'spaces_before_argument' => {
                          'text' => ' '
                        }
                      },
                      'type' => 'brace_command_container'
                    },
                    {
                      'info' => {
                        'spaces_before_argument' => {
                          'text' => ' '
                        }
                      },
                      'type' => 'brace_command_container'
                    },
                    {
                      'info' => {
                        'spaces_before_argument' => {
                          'text' => ' '
                        }
                      },
                      'type' => 'brace_command_container'
                    },
                    {
                      'contents' => [
                        {
                          'text' => 'txt'
                        }
                      ],
                      'type' => 'brace_command_container'
                    }
                  ],
                  'cmdname' => 'image',
                  'extra' => {
                    'input_encoding_name' => 'utf-8'
                  },
                  'source_info' => {
                    'line_nr' => 29
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
              'contents' => [
                {
                  'text' => 'BBB '
                },
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'text' => 'figure'
                        }
                      ],
                      'type' => 'brace_command_container'
                    },
                    {
                      'info' => {
                        'spaces_before_argument' => {
                          'text' => ' '
                        }
                      },
                      'type' => 'brace_command_container'
                    },
                    {
                      'info' => {
                        'spaces_before_argument' => {
                          'text' => ' '
                        }
                      },
                      'type' => 'brace_command_container'
                    },
                    {
                      'info' => {
                        'spaces_before_argument' => {
                          'text' => ' '
                        }
                      },
                      'type' => 'brace_command_container'
                    },
                    {
                      'contents' => [
                        {
                          'text' => 'txt'
                        }
                      ],
                      'type' => 'brace_command_container'
                    }
                  ],
                  'cmdname' => 'image',
                  'extra' => {
                    'input_encoding_name' => 'utf-8'
                  },
                  'source_info' => {
                    'line_nr' => 31
                  }
                },
                {
                  'text' => ' gggg '
                },
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'text' => 'figure'
                        }
                      ],
                      'type' => 'brace_command_container'
                    },
                    {
                      'info' => {
                        'spaces_before_argument' => {
                          'text' => ' '
                        }
                      },
                      'type' => 'brace_command_container'
                    },
                    {
                      'info' => {
                        'spaces_before_argument' => {
                          'text' => ' '
                        }
                      },
                      'type' => 'brace_command_container'
                    },
                    {
                      'info' => {
                        'spaces_before_argument' => {
                          'text' => ' '
                        }
                      },
                      'type' => 'brace_command_container'
                    },
                    {
                      'contents' => [
                        {
                          'text' => 'txt'
                        }
                      ],
                      'type' => 'brace_command_container'
                    }
                  ],
                  'cmdname' => 'image',
                  'extra' => {
                    'input_encoding_name' => 'utf-8'
                  },
                  'source_info' => {
                    'line_nr' => 31
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
              'contents' => [
                {
                  'text' => 'HHH
'
                },
                {
                  'args' => [
                    {
                      'contents' => [
                        {
                          'text' => 'figure'
                        }
                      ],
                      'type' => 'brace_command_container'
                    },
                    {
                      'info' => {
                        'spaces_before_argument' => {
                          'text' => ' '
                        }
                      },
                      'type' => 'brace_command_container'
                    },
                    {
                      'info' => {
                        'spaces_before_argument' => {
                          'text' => ' '
                        }
                      },
                      'type' => 'brace_command_container'
                    },
                    {
                      'info' => {
                        'spaces_before_argument' => {
                          'text' => ' '
                        }
                      },
                      'type' => 'brace_command_container'
                    },
                    {
                      'contents' => [
                        {
                          'text' => 'txt'
                        }
                      ],
                      'type' => 'brace_command_container'
                    }
                  ],
                  'cmdname' => 'image',
                  'extra' => {
                    'input_encoding_name' => 'utf-8'
                  },
                  'source_info' => {
                    'line_nr' => 34
                  }
                },
                {
                  'text' => ' JJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJ
'
                }
              ],
              'type' => 'paragraph'
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'text' => 'flushright'
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
                'text_arg' => 'flushright'
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'line_nr' => 35
              }
            }
          ],
          'source_info' => {
            'line_nr' => 27
          }
        }
      ],
      'type' => 'before_node_section'
    }
  ],
  'type' => 'document_root'
};

$result_texis{'multiline_image_and_align'} = '@center @image{figure}

@center CCCC @image{figure} 

@center fffffffffffffffffffffffffffffffffffffff @image{figure}

@center dddd @image{figure} iiiii

@flushright
AAA
@image{figure}

BBB @image{figure} gggg @image{figure}

HHH
@image{figure} JJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJ
@end flushright

@center @image{figure, , , ,txt}

@center CCCC @image{figure, , , ,txt} 
  
@center fffffffffffffffffffffffffffffffffffffff @image{figure, , , ,txt}

@center dddd @image{figure, , , ,txt} iiiii

@flushright
AAA
@image{figure, , , ,txt}

BBB @image{figure, , , ,txt} gggg @image{figure, , , ,txt}

HHH
@image{figure, , , ,txt} JJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJ
@end flushright
';


$result_texts{'multiline_image_and_align'} = 'figure

CCCC figure

fffffffffffffffffffffffffffffffffffffff figure

dddd figure iiiii

AAA
figure

BBB figure gggg figure

HHH
figure JJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJ

figure

CCCC figure
  
fffffffffffffffffffffffffffffffffffffff figure

dddd figure iiiii

AAA
figure

BBB figure gggg figure

HHH
figure JJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJ
';

$result_errors{'multiline_image_and_align'} = [];


$result_floats{'multiline_image_and_align'} = {};



$result_converted{'info'}->{'multiline_image_and_align'} = 'This is , produced from .

                               1  A  B  
                               2  C  D
                               3  E  F

                        CCCC   1  A  B  
                               2  C  D
                               3  E  F

fffffffffffffffffffffffffffffffffffffff   1  A  B  
                               2  C  D
                               3  E  F

                        dddd   1  A  B  
                               2  C  D
                           3  E  F iiiii

                                                                    AAA
                                                             1  A  B  
                                                             2  C  D
                                                             3  E  F

                                                       BBB   1  A  B  
                                                             2  C  D
                                              3  E  F gggg   1  A  B  
                                                             2  C  D
                                                             3  E  F

                                                                    HHH
                                                             1  A  B  
                                                             2  C  D
                        3  E  F JJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJ

 [image src="figure.txt" text="  1  A  B  
  2  C  D
  3  E  F" ]

CCCC  [image src="figure.txt" text="  1  A  B  
  2  C  D
  3  E  F" ]

fffffffffffffffffffffffffffffffffffffff  [image src="figure.txt" text="  1  A  B  
  2  C  D
  3  E  F" ]

dddd  [image src="figure.txt" text="  1  A  B  
  2  C  D
  3  E  F" ] iiiii

                                                                    AAA
 [image src="figure.txt" text="  1  A  B  
  2  C  D
  3  E  F" ]

BBB  [image src="figure.txt" text="  1  A  B  
  2  C  D
  3  E  F" ] gggg  [image src="figure.txt" text="  1  A  B  
  2  C  D
  3  E  F" ]

                                                                    HHH
 [image src="figure.txt" text="  1  A  B  
  2  C  D
  3  E  F" ] JJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJ

Tag Table:

End Tag Table


Local Variables:
coding: utf-8
End:
';

$result_converted_errors{'info'}->{'multiline_image_and_align'} = [
  {
    'error_line' => 'warning: document without nodes
',
    'text' => 'document without nodes',
    'type' => 'warning'
  }
];


1;
