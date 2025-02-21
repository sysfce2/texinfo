use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'japanese_shift_jis'} = {
  'contents' => [
    {
      'contents' => [
        {
          'contents' => [
            {
              'contents' => [
                {
                  'text' => '\\input texinfo @c -*- coding: utf-8; mode: texinfo; -*-
',
                  'type' => 'text_before_beginning'
                }
              ],
              'type' => 'preamble_before_beginning'
            },
            {
              'cmdname' => 'documentencoding',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'shift_jis'
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
                'input_encoding_name' => 'shift_jis',
                'text_arg' => 'shift_jis'
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'file_name' => 'japanese_shift_jis.texi',
                'line_nr' => 2
              }
            }
          ],
          'type' => 'preamble_before_setfilename'
        },
        {
          'contents' => [
            {
              'cmdname' => 'setfilename',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'japanese_shift_jis.info'
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
                'text_arg' => 'japanese_shift_jis.info'
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'file_name' => 'japanese_shift_jis.texi',
                'line_nr' => 3
              }
            },
            {
              'cmdname' => 'settitle',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'GNU LilyPond -- Manuel d\'initiation japanese'
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
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'file_name' => 'japanese_shift_jis.texi',
                'line_nr' => 4
              }
            },
            {
              'text' => '
',
              'type' => 'empty_line'
            },
            {
              'cmdname' => 'documentlanguage',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'ja'
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
                'text_arg' => 'ja'
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'file_name' => 'japanese_shift_jis.texi',
                'line_nr' => 6
              }
            },
            {
              'text' => '
',
              'type' => 'empty_line'
            }
          ],
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
        'file_name' => 'japanese_shift_jis.texi',
        'line_nr' => 8
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
                  'text' => "GNU LilyPond --- \x{5b66}\x{7fd2}\x{30de}\x{30cb}\x{30e5}\x{30a2}\x{30eb}"
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
          'cmdname' => 'copying',
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
                  'text' => 'Copyright '
                },
                {
                  'cmdname' => 'copyright',
                  'contents' => [
                    {
                      'type' => 'brace_container'
                    }
                  ],
                  'source_info' => {
                    'file_name' => 'japanese_shift_jis.texi',
                    'line_nr' => 12
                  }
                },
                {
                  'text' => " 1999--2008 \x{8457}\x{4f5c}\x{8005}\x{4e00}\x{540c}
"
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
                  'cmdname' => 'emph',
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'The translation of the following copyright notice is provided
'
                        },
                        {
                          'text' => 'for courtesy to non-English speakers, but only the notice in English
'
                        },
                        {
                          'text' => 'legally counts.'
                        }
                      ],
                      'type' => 'brace_container'
                    }
                  ],
                  'source_info' => {
                    'file_name' => 'japanese_shift_jis.texi',
                    'line_nr' => 14
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
                  'cmdname' => 'emph',
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => "\x{4ee5}\x{4e0b}\x{306f}\x{82f1}\x{8a9e}\x{3092}\x{8a71}\x{3055}\x{306a}\x{3044}\x{4eba}\x{3005}\x{306e}\x{305f}\x{3081}\x{306e}\x{8457}\x{4f5c}\x{6a29}\x{306b}\x{3064}\x{3044}\x{3066}\x{306e}\x{6ce8}\x{610f}\x{66f8}\x{304d}\x{3067}\x{3059}\x{3002}\x{3057}\x{304b}\x{3057}\x{306a}\x{304c}\x{3089}\x{3001}
"
                        },
                        {
                          'text' => "\x{82f1}\x{8a9e}\x{3067}\x{66f8}\x{304b}\x{308c}\x{305f}\x{6ce8}\x{610f}\x{66f8}\x{304d}\x{3060}\x{3051}\x{304c}\x{6cd5}\x{7684}\x{306b}\x{6709}\x{52b9}\x{3067}\x{3059}\x{3002}"
                        }
                      ],
                      'type' => 'brace_container'
                    }
                  ],
                  'source_info' => {
                    'file_name' => 'japanese_shift_jis.texi',
                    'line_nr' => 18
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
              'cmdname' => 'end',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'copying'
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
                'text_arg' => 'copying'
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'file_name' => 'japanese_shift_jis.texi',
                'line_nr' => 20
              }
            }
          ],
          'source_info' => {
            'file_name' => 'japanese_shift_jis.texi',
            'line_nr' => 11
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
          'contents' => [
            {
              'text' => "\x{3053}\x{308c}\x{306f} GNU LilyPond \x{30d0}\x{30fc}\x{30b8}\x{30e7}\x{30f3} 
"
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
                      'text' => 'Preface'
                    }
                  ],
                  'extra' => {
                    'node_content' => {
                      'contents' => [
                        {}
                      ]
                    },
                    'normalized' => 'Preface'
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
                'file_name' => 'japanese_shift_jis.texi',
                'line_nr' => 26
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
                      'text' => 'Introduction'
                    }
                  ],
                  'extra' => {
                    'node_content' => {
                      'contents' => [
                        {}
                      ]
                    },
                    'normalized' => 'Introduction'
                  },
                  'type' => 'menu_entry_node'
                },
                {
                  'text' => '::                   ',
                  'type' => 'menu_entry_separator'
                },
                {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => "LilyPond \x{3068}\x{306f}\x{4f55}\x{306a}\x{306e}\x{304b}\x{3001}\x{306a}\x{305c} LilyPond \x{3092}\x{4f7f}\x{3046}\x{306e}\x{304b}\x{3001}\x{3069}\x{3046}\x{3084}\x{3063}\x{3066} LilyPond \x{3092}\x{4f7f}\x{3046}\x{306e}\x{304b}
"
                        }
                      ],
                      'type' => 'preformatted'
                    }
                  ],
                  'type' => 'menu_entry_description'
                }
              ],
              'source_info' => {
                'file_name' => 'japanese_shift_jis.texi',
                'line_nr' => 27
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
                'file_name' => 'japanese_shift_jis.texi',
                'line_nr' => 28
              }
            }
          ],
          'source_info' => {
            'file_name' => 'japanese_shift_jis.texi',
            'line_nr' => 25
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
        'file_name' => 'japanese_shift_jis.texi',
        'line_nr' => 9
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
                  'text' => 'Preface'
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
        'normalized' => 'Preface'
      },
      'info' => {
        'spaces_before_argument' => {
          'text' => ' '
        }
      },
      'source_info' => {
        'file_name' => 'japanese_shift_jis.texi',
        'line_nr' => 30
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
                  'text' => 'Preface'
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
              'text' => "\x{305d}\x{308c}\x{306f} 1995 \x{5e74}\x{306e}\x{3042}\x{308b}\x{65e5}\x{306e} EJE (Eindhoven Youth Orchestra) \x{306e}\x{30ea}\x{30cf}\x{30fc}\x{30b5}\x{30eb}\x{4e2d}\x{306e}\x{3067}\x{304d}\x{3054}\x{3068}\x{3067}\x{3057}\x{305f} \x{2212} \x{3042}\x{308b}\x{5909}\x{308f}\x{308a}\x{8005}\x{306e}\x{30d0}\x{30a4}\x{30aa}\x{30ea}\x{30f3}\x{594f}\x{8005}\x{3067}\x{3042}\x{308b}\x{30b8}\x{30e3}\x{30f3}\x{306f}\x{540c}\x{3058}\x{304f}\x{5909}\x{308f}\x{308a}\x{8005}\x{306e}\x{30d5}\x{30ec}\x{30f3}\x{30c1}\x{30db}\x{30eb}\x{30f3}\x{594f}\x{8005}\x{306e}\x{30cf}\x{30f3}-\x{30a6}\x{30a7}\x{30f3}\x{306b}\x{5f7c}\x{304c}\x{304b}\x{304b}\x{308f}\x{3063}\x{3066}\x{3044}\x{308b}\x{65b0}\x{3057}\x{3044}\x{5927}\x{304d}\x{306a}\x{30d7}\x{30ed}\x{30b8}\x{30a7}\x{30af}\x{30c8}\x{306e}\x{3053}\x{3068}\x{3092}\x{8a71}\x{3057}\x{307e}\x{3057}\x{305f}\x{3002}\x{305d}\x{308c}\x{306f}\x{97f3}\x{697d}\x{3092}\x{51fa}\x{7248}\x{3059}\x{308b}\x{305f}\x{3081}\x{306e}\x{81ea}\x{52d5}\x{5316}\x{3055}\x{308c}\x{305f}\x{30b7}\x{30b9}\x{30c6}\x{30e0}\x{3067}\x{3059} (\x{6b63}\x{78ba}\x{306b}\x{306f}\x{3001}\x{305d}\x{308c}\x{306f} MPP \x{2212} MusiXTeX \x{306e}\x{30d7}\x{30ea}\x{30d7}\x{30ed}\x{30bb}\x{30c3}\x{30b5}\x{3067}\x{3059})\x{3002}\x{305d}\x{308c}\x{3092}\x{805e}\x{3044}\x{3066}\x{30cf}\x{30f3}-\x{30a6}\x{30a7}\x{30f3}\x{306f}\x{3059}\x{3050}\x{306b}\x{697d}\x{8b5c}\x{304b}\x{3089}\x{3044}\x{304f}\x{3064}\x{304b}\x{306e}\x{90e8}\x{5206}\x{3092}\x{30d7}\x{30ea}\x{30f3}\x{30c8}\x{30a2}\x{30a6}\x{30c8}\x{3057}\x{305f}\x{3044}\x{3068}\x{601d}\x{3044}\x{3001}\x{5f7c}\x{306f}\x{305d}\x{306e}\x{305f}\x{3081}\x{306e}\x{30bd}\x{30d5}\x{30c8}\x{30a6}\x{30a7}\x{30a2}\x{3092}\x{63a2}\x{3057}\x{59cb}\x{3081}\x{3001}\x{3059}\x{3050}\x{306b}\x{305d}\x{306e}\x{865c}\x{306b}\x{306a}\x{3063}\x{3066}\x{3057}\x{307e}\x{3044}\x{307e}\x{3057}\x{305f}\x{3002}\x{305d}\x{308c}\x{304c} MPP \x{306e}\x{7d42}\x{308f}\x{308a}\x{3092}\x{6c7a}\x{5b9a}\x{4ed8}\x{3051}\x{307e}\x{3057}\x{305f}\x{3002}\x{591a}\x{304f}\x{306e}\x{54f2}\x{5b66}\x{7684}\x{8003}\x{5bdf}\x{3092}\x{542b}\x{307f}\x{767d}\x{71b1}\x{3057}\x{305f} email \x{306e}\x{4ea4}\x{63db}\x{306e}\x{5f8c}\x{3001}\x{30cf}\x{30f3}-\x{30a6}\x{30a7}\x{30f3}\x{306f} 1996 \x{5e74}\x{306b} LilyPond \x{306e}\x{88fd}\x{4f5c}\x{3092}\x{958b}\x{59cb}\x{3057}\x{307e}\x{3057}\x{305f}\x{3002}\x{3053}\x{306e}\x{6642}\x{3001}\x{30b8}\x{30e3}\x{30f3}\x{306f}\x{30cf}\x{30f3}-\x{30a6}\x{30a7}\x{30f3}\x{306e}\x{65b0}\x{3057}\x{3044}\x{30d7}\x{30ed}\x{30b8}\x{30a7}\x{30af}\x{30c8}\x{306b}\x{5f15}\x{304d}\x{305a}\x{308a}\x{8fbc}\x{307e}\x{308c}\x{307e}\x{3057}\x{305f}\x{3002}
"
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
        'file_name' => 'japanese_shift_jis.texi',
        'line_nr' => 31
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
                  'text' => 'Introduction'
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
        'normalized' => 'Introduction'
      },
      'info' => {
        'spaces_before_argument' => {
          'text' => ' '
        }
      },
      'source_info' => {
        'file_name' => 'japanese_shift_jis.texi',
        'line_nr' => 36
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
                  'text' => 'Introduction'
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
              'text' => "\x{3053}\x{306e}\x{7ae0}\x{3067}\x{306f}\x{8aad}\x{8005}\x{306b} LilyPond \x{3068}\x{3053}\x{306e}\x{30c9}\x{30ad}\x{30e5}\x{30e1}\x{30f3}\x{30c8}\x{306b}\x{3064}\x{3044}\x{3066}\x{306e}\x{7d39}\x{4ecb}\x{3092}\x{884c}\x{3044}\x{307e}\x{3059}\x{3002}
"
            }
          ],
          'type' => 'paragraph'
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
        'file_name' => 'japanese_shift_jis.texi',
        'line_nr' => 37
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
    }
  ],
  'type' => 'document_root'
};
$result_trees{'japanese_shift_jis'}{'contents'}[2]{'contents'}[7]{'contents'}[1]{'contents'}[1]{'extra'}{'node_content'}{'contents'}[0] = $result_trees{'japanese_shift_jis'}{'contents'}[2]{'contents'}[7]{'contents'}[1]{'contents'}[1]{'contents'}[0];
$result_trees{'japanese_shift_jis'}{'contents'}[2]{'contents'}[7]{'contents'}[2]{'contents'}[1]{'extra'}{'node_content'}{'contents'}[0] = $result_trees{'japanese_shift_jis'}{'contents'}[2]{'contents'}[7]{'contents'}[2]{'contents'}[1]{'contents'}[0];

$result_texis{'japanese_shift_jis'} = '\\input texinfo @c -*- coding: utf-8; mode: texinfo; -*-
@documentencoding shift_jis
@setfilename japanese_shift_jis.info
@settitle GNU LilyPond -- Manuel d\'initiation japanese

@documentlanguage ja

@node Top
@top GNU LilyPond --- 学習マニュアル

@copying
Copyright @copyright{} 1999--2008 著作者一同

@emph{The translation of the following copyright notice is provided
for courtesy to non-English speakers, but only the notice in English
legally counts.}

@emph{以下は英語を話さない人々のための著作権についての注意書きです。しかしながら、
英語で書かれた注意書きだけが法的に有効です。}
@end copying


これは GNU LilyPond バージョン 

@menu
* Preface::
* Introduction::                   LilyPond とは何なのか、なぜ LilyPond を使うのか、どうやって LilyPond を使うのか
@end menu

@node Preface
@chapter Preface

それは 1995 年のある日の EJE (Eindhoven Youth Orchestra) のリハーサル中のできごとでした − ある変わり者のバイオリン奏者であるジャンは同じく変わり者のフレンチホルン奏者のハン-ウェンに彼がかかわっている新しい大きなプロジェクトのことを話しました。それは音楽を出版するための自動化されたシステムです (正確には、それは MPP − MusiXTeX のプリプロセッサです)。それを聞いてハン-ウェンはすぐに楽譜からいくつかの部分をプリントアウトしたいと思い、彼はそのためのソフトウェアを探し始め、すぐにその虜になってしまいました。それが MPP の終わりを決定付けました。多くの哲学的考察を含み白熱した email の交換の後、ハン-ウェンは 1996 年に LilyPond の製作を開始しました。この時、ジャンはハン-ウェンの新しいプロジェクトに引きずり込まれました。


@node Introduction
@chapter Introduction

この章では読者に LilyPond とこのドキュメントについての紹介を行います。

@bye
';


$result_texts{'japanese_shift_jis'} = '

GNU LilyPond -- 学習マニュアル
******************************



これは GNU LilyPond バージョン 

* Preface::
* Introduction::                   LilyPond とは何なのか、なぜ LilyPond を使うのか、どうやって LilyPond を使うのか

1 Preface
*********

それは 1995 年のある日の EJE (Eindhoven Youth Orchestra) のリハーサル中のできごとでした − ある変わり者のバイオリン奏者であるジャンは同じく変わり者のフレンチホルン奏者のハン-ウェンに彼がかかわっている新しい大きなプロジェクトのことを話しました。それは音楽を出版するための自動化されたシステムです (正確には、それは MPP − MusiXTeX のプリプロセッサです)。それを聞いてハン-ウェンはすぐに楽譜からいくつかの部分をプリントアウトしたいと思い、彼はそのためのソフトウェアを探し始め、すぐにその虜になってしまいました。それが MPP の終わりを決定付けました。多くの哲学的考察を含み白熱した email の交換の後、ハン-ウェンは 1996 年に LilyPond の製作を開始しました。この時、ジャンはハン-ウェンの新しいプロジェクトに引きずり込まれました。


2 Introduction
**************

この章では読者に LilyPond とこのドキュメントについての紹介を行います。

';

$result_sectioning{'japanese_shift_jis'} = {
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
                    'normalized' => 'Preface'
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
                    'normalized' => 'Introduction'
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
$result_sectioning{'japanese_shift_jis'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[0]{'extra'}{'section_directions'}{'up'} = $result_sectioning{'japanese_shift_jis'}{'extra'}{'section_childs'}[0];
$result_sectioning{'japanese_shift_jis'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[0]{'extra'}{'toplevel_directions'}{'prev'} = $result_sectioning{'japanese_shift_jis'}{'extra'}{'section_childs'}[0];
$result_sectioning{'japanese_shift_jis'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[0]{'extra'}{'toplevel_directions'}{'up'} = $result_sectioning{'japanese_shift_jis'}{'extra'}{'section_childs'}[0];
$result_sectioning{'japanese_shift_jis'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[1]{'extra'}{'section_directions'}{'prev'} = $result_sectioning{'japanese_shift_jis'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[0];
$result_sectioning{'japanese_shift_jis'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[1]{'extra'}{'section_directions'}{'up'} = $result_sectioning{'japanese_shift_jis'}{'extra'}{'section_childs'}[0];
$result_sectioning{'japanese_shift_jis'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[1]{'extra'}{'toplevel_directions'}{'prev'} = $result_sectioning{'japanese_shift_jis'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[0];
$result_sectioning{'japanese_shift_jis'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[1]{'extra'}{'toplevel_directions'}{'up'} = $result_sectioning{'japanese_shift_jis'}{'extra'}{'section_childs'}[0];
$result_sectioning{'japanese_shift_jis'}{'extra'}{'section_childs'}[0]{'extra'}{'sectioning_root'} = $result_sectioning{'japanese_shift_jis'};

$result_nodes{'japanese_shift_jis'} = [
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
                    'prev' => {},
                    'up' => {}
                  },
                  'normalized' => 'Introduction'
                }
              },
              'prev' => {},
              'up' => {}
            },
            'normalized' => 'Preface'
          }
        }
      },
      'normalized' => 'Top'
    }
  },
  {},
  {}
];
$result_nodes{'japanese_shift_jis'}[0]{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'prev'} = $result_nodes{'japanese_shift_jis'}[0]{'extra'}{'node_directions'}{'next'};
$result_nodes{'japanese_shift_jis'}[0]{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'up'} = $result_nodes{'japanese_shift_jis'}[0];
$result_nodes{'japanese_shift_jis'}[0]{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'prev'} = $result_nodes{'japanese_shift_jis'}[0];
$result_nodes{'japanese_shift_jis'}[0]{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'up'} = $result_nodes{'japanese_shift_jis'}[0];
$result_nodes{'japanese_shift_jis'}[1] = $result_nodes{'japanese_shift_jis'}[0]{'extra'}{'node_directions'}{'next'};
$result_nodes{'japanese_shift_jis'}[2] = $result_nodes{'japanese_shift_jis'}[0]{'extra'}{'node_directions'}{'next'}{'extra'}{'node_directions'}{'next'};

$result_menus{'japanese_shift_jis'} = [
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
              'prev' => {},
              'up' => {}
            },
            'normalized' => 'Introduction'
          }
        },
        'up' => {}
      },
      'normalized' => 'Preface'
    }
  },
  {}
];
$result_menus{'japanese_shift_jis'}[1]{'extra'}{'menu_directions'}{'next'}{'extra'}{'menu_directions'}{'prev'} = $result_menus{'japanese_shift_jis'}[1];
$result_menus{'japanese_shift_jis'}[1]{'extra'}{'menu_directions'}{'next'}{'extra'}{'menu_directions'}{'up'} = $result_menus{'japanese_shift_jis'}[0];
$result_menus{'japanese_shift_jis'}[1]{'extra'}{'menu_directions'}{'up'} = $result_menus{'japanese_shift_jis'}[0];
$result_menus{'japanese_shift_jis'}[2] = $result_menus{'japanese_shift_jis'}[1]{'extra'}{'menu_directions'}{'next'};

$result_errors{'japanese_shift_jis'} = [
  {
    'error_line' => 'warning: encoding `shift_jis\' is not a canonical texinfo encoding
',
    'file_name' => 'japanese_shift_jis.texi',
    'line_nr' => 2,
    'text' => 'encoding `shift_jis\' is not a canonical texinfo encoding',
    'type' => 'warning'
  }
];


$result_floats{'japanese_shift_jis'} = {};


1;
