use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors);

use utf8;

$result_trees{'all_empty_def'} = {
  'contents' => [
    {
      'cmdname' => 'deffn',
      'contents' => [
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => '
',
                  'type' => 'empty_line_after_command'
                }
              ],
              'parent' => {},
              'type' => 'block_line_arg'
            }
          ],
          'extra' => {
            'def_command' => 'deffn',
            'original_def_cmdname' => 'deffn'
          },
          'parent' => {},
          'type' => 'def_line'
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => ' ',
                  'type' => 'empty_spaces_after_command'
                },
                {
                  'parent' => {},
                  'text' => 'deffn'
                },
                {
                  'parent' => {},
                  'text' => '
',
                  'type' => 'spaces_at_end'
                }
              ],
              'parent' => {},
              'type' => 'misc_line_arg'
            }
          ],
          'cmdname' => 'end',
          'extra' => {
            'command' => {},
            'command_argument' => 'deffn',
            'text_arg' => 'deffn'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 2,
            'macro' => ''
          },
          'parent' => {}
        }
      ],
      'extra' => {
        'end_command' => {}
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 1,
        'macro' => ''
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
      'cmdname' => 'defvr',
      'contents' => [
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => '
',
                  'type' => 'empty_line_after_command'
                }
              ],
              'parent' => {},
              'type' => 'block_line_arg'
            }
          ],
          'extra' => {
            'def_command' => 'defvr',
            'original_def_cmdname' => 'defvr'
          },
          'parent' => {},
          'type' => 'def_line'
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => ' ',
                  'type' => 'empty_spaces_after_command'
                },
                {
                  'parent' => {},
                  'text' => 'defvr'
                },
                {
                  'parent' => {},
                  'text' => '
',
                  'type' => 'spaces_at_end'
                }
              ],
              'parent' => {},
              'type' => 'misc_line_arg'
            }
          ],
          'cmdname' => 'end',
          'extra' => {
            'command' => {},
            'command_argument' => 'defvr',
            'text_arg' => 'defvr'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 5,
            'macro' => ''
          },
          'parent' => {}
        }
      ],
      'extra' => {
        'end_command' => {}
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 4,
        'macro' => ''
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
      'cmdname' => 'deftypefn',
      'contents' => [
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => '
',
                  'type' => 'empty_line_after_command'
                }
              ],
              'parent' => {},
              'type' => 'block_line_arg'
            }
          ],
          'extra' => {
            'def_command' => 'deftypefn',
            'original_def_cmdname' => 'deftypefn'
          },
          'parent' => {},
          'type' => 'def_line'
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => ' ',
                  'type' => 'empty_spaces_after_command'
                },
                {
                  'parent' => {},
                  'text' => 'deftypefn'
                },
                {
                  'parent' => {},
                  'text' => '
',
                  'type' => 'spaces_at_end'
                }
              ],
              'parent' => {},
              'type' => 'misc_line_arg'
            }
          ],
          'cmdname' => 'end',
          'extra' => {
            'command' => {},
            'command_argument' => 'deftypefn',
            'text_arg' => 'deftypefn'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 8,
            'macro' => ''
          },
          'parent' => {}
        }
      ],
      'extra' => {
        'end_command' => {}
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 7,
        'macro' => ''
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
      'cmdname' => 'deftypeop',
      'contents' => [
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => '
',
                  'type' => 'empty_line_after_command'
                }
              ],
              'parent' => {},
              'type' => 'block_line_arg'
            }
          ],
          'extra' => {
            'def_command' => 'deftypeop',
            'original_def_cmdname' => 'deftypeop'
          },
          'parent' => {},
          'type' => 'def_line'
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => ' ',
                  'type' => 'empty_spaces_after_command'
                },
                {
                  'parent' => {},
                  'text' => 'deftypeop'
                },
                {
                  'parent' => {},
                  'text' => '
',
                  'type' => 'spaces_at_end'
                }
              ],
              'parent' => {},
              'type' => 'misc_line_arg'
            }
          ],
          'cmdname' => 'end',
          'extra' => {
            'command' => {},
            'command_argument' => 'deftypeop',
            'text_arg' => 'deftypeop'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 11,
            'macro' => ''
          },
          'parent' => {}
        }
      ],
      'extra' => {
        'end_command' => {}
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 10,
        'macro' => ''
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
      'cmdname' => 'deftypevr',
      'contents' => [
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => '
',
                  'type' => 'empty_line_after_command'
                }
              ],
              'parent' => {},
              'type' => 'block_line_arg'
            }
          ],
          'extra' => {
            'def_command' => 'deftypevr',
            'original_def_cmdname' => 'deftypevr'
          },
          'parent' => {},
          'type' => 'def_line'
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => ' ',
                  'type' => 'empty_spaces_after_command'
                },
                {
                  'parent' => {},
                  'text' => 'deftypevr'
                },
                {
                  'parent' => {},
                  'text' => '
',
                  'type' => 'spaces_at_end'
                }
              ],
              'parent' => {},
              'type' => 'misc_line_arg'
            }
          ],
          'cmdname' => 'end',
          'extra' => {
            'command' => {},
            'command_argument' => 'deftypevr',
            'text_arg' => 'deftypevr'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 14,
            'macro' => ''
          },
          'parent' => {}
        }
      ],
      'extra' => {
        'end_command' => {}
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 13,
        'macro' => ''
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
      'cmdname' => 'defcv',
      'contents' => [
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => '
',
                  'type' => 'empty_line_after_command'
                }
              ],
              'parent' => {},
              'type' => 'block_line_arg'
            }
          ],
          'extra' => {
            'def_command' => 'defcv',
            'original_def_cmdname' => 'defcv'
          },
          'parent' => {},
          'type' => 'def_line'
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => ' ',
                  'type' => 'empty_spaces_after_command'
                },
                {
                  'parent' => {},
                  'text' => 'defcv'
                },
                {
                  'parent' => {},
                  'text' => '
',
                  'type' => 'spaces_at_end'
                }
              ],
              'parent' => {},
              'type' => 'misc_line_arg'
            }
          ],
          'cmdname' => 'end',
          'extra' => {
            'command' => {},
            'command_argument' => 'defcv',
            'text_arg' => 'defcv'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 17,
            'macro' => ''
          },
          'parent' => {}
        }
      ],
      'extra' => {
        'end_command' => {}
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 16,
        'macro' => ''
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
      'cmdname' => 'deftypecv',
      'contents' => [
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => '
',
                  'type' => 'empty_line_after_command'
                }
              ],
              'parent' => {},
              'type' => 'block_line_arg'
            }
          ],
          'extra' => {
            'def_command' => 'deftypecv',
            'original_def_cmdname' => 'deftypecv'
          },
          'parent' => {},
          'type' => 'def_line'
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => ' ',
                  'type' => 'empty_spaces_after_command'
                },
                {
                  'parent' => {},
                  'text' => 'deftypecv'
                },
                {
                  'parent' => {},
                  'text' => '
',
                  'type' => 'spaces_at_end'
                }
              ],
              'parent' => {},
              'type' => 'misc_line_arg'
            }
          ],
          'cmdname' => 'end',
          'extra' => {
            'command' => {},
            'command_argument' => 'deftypecv',
            'text_arg' => 'deftypecv'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 20,
            'macro' => ''
          },
          'parent' => {}
        }
      ],
      'extra' => {
        'end_command' => {}
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 19,
        'macro' => ''
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
      'cmdname' => 'defop',
      'contents' => [
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => '
',
                  'type' => 'empty_line_after_command'
                }
              ],
              'parent' => {},
              'type' => 'block_line_arg'
            }
          ],
          'extra' => {
            'def_command' => 'defop',
            'original_def_cmdname' => 'defop'
          },
          'parent' => {},
          'type' => 'def_line'
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => ' ',
                  'type' => 'empty_spaces_after_command'
                },
                {
                  'parent' => {},
                  'text' => 'defop'
                },
                {
                  'parent' => {},
                  'text' => '
',
                  'type' => 'spaces_at_end'
                }
              ],
              'parent' => {},
              'type' => 'misc_line_arg'
            }
          ],
          'cmdname' => 'end',
          'extra' => {
            'command' => {},
            'command_argument' => 'defop',
            'text_arg' => 'defop'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 23,
            'macro' => ''
          },
          'parent' => {}
        }
      ],
      'extra' => {
        'end_command' => {}
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 22,
        'macro' => ''
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
      'cmdname' => 'deftp',
      'contents' => [
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => '
',
                  'type' => 'empty_line_after_command'
                }
              ],
              'parent' => {},
              'type' => 'block_line_arg'
            }
          ],
          'extra' => {
            'def_command' => 'deftp',
            'original_def_cmdname' => 'deftp'
          },
          'parent' => {},
          'type' => 'def_line'
        },
        {
          'args' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => ' ',
                  'type' => 'empty_spaces_after_command'
                },
                {
                  'parent' => {},
                  'text' => 'deftp'
                },
                {
                  'parent' => {},
                  'text' => '
',
                  'type' => 'spaces_at_end'
                }
              ],
              'parent' => {},
              'type' => 'misc_line_arg'
            }
          ],
          'cmdname' => 'end',
          'extra' => {
            'command' => {},
            'command_argument' => 'deftp',
            'text_arg' => 'deftp'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 26,
            'macro' => ''
          },
          'parent' => {}
        }
      ],
      'extra' => {
        'end_command' => {}
      },
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 25,
        'macro' => ''
      },
      'parent' => {}
    }
  ],
  'type' => 'text_root'
};
$result_trees{'all_empty_def'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_empty_def'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'all_empty_def'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'all_empty_def'}{'contents'}[0]{'contents'}[0];
$result_trees{'all_empty_def'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_empty_def'}{'contents'}[0];
$result_trees{'all_empty_def'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_empty_def'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'all_empty_def'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'all_empty_def'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'all_empty_def'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'all_empty_def'}{'contents'}[0]{'contents'}[1]{'args'}[0];
$result_trees{'all_empty_def'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'all_empty_def'}{'contents'}[0]{'contents'}[1];
$result_trees{'all_empty_def'}{'contents'}[0]{'contents'}[1]{'extra'}{'command'} = $result_trees{'all_empty_def'}{'contents'}[0];
$result_trees{'all_empty_def'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'all_empty_def'}{'contents'}[0];
$result_trees{'all_empty_def'}{'contents'}[0]{'extra'}{'end_command'} = $result_trees{'all_empty_def'}{'contents'}[0]{'contents'}[1];
$result_trees{'all_empty_def'}{'contents'}[0]{'parent'} = $result_trees{'all_empty_def'};
$result_trees{'all_empty_def'}{'contents'}[1]{'parent'} = $result_trees{'all_empty_def'};
$result_trees{'all_empty_def'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_empty_def'}{'contents'}[2]{'contents'}[0]{'args'}[0];
$result_trees{'all_empty_def'}{'contents'}[2]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'all_empty_def'}{'contents'}[2]{'contents'}[0];
$result_trees{'all_empty_def'}{'contents'}[2]{'contents'}[0]{'parent'} = $result_trees{'all_empty_def'}{'contents'}[2];
$result_trees{'all_empty_def'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_empty_def'}{'contents'}[2]{'contents'}[1]{'args'}[0];
$result_trees{'all_empty_def'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'all_empty_def'}{'contents'}[2]{'contents'}[1]{'args'}[0];
$result_trees{'all_empty_def'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'all_empty_def'}{'contents'}[2]{'contents'}[1]{'args'}[0];
$result_trees{'all_empty_def'}{'contents'}[2]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'all_empty_def'}{'contents'}[2]{'contents'}[1];
$result_trees{'all_empty_def'}{'contents'}[2]{'contents'}[1]{'extra'}{'command'} = $result_trees{'all_empty_def'}{'contents'}[2];
$result_trees{'all_empty_def'}{'contents'}[2]{'contents'}[1]{'parent'} = $result_trees{'all_empty_def'}{'contents'}[2];
$result_trees{'all_empty_def'}{'contents'}[2]{'extra'}{'end_command'} = $result_trees{'all_empty_def'}{'contents'}[2]{'contents'}[1];
$result_trees{'all_empty_def'}{'contents'}[2]{'parent'} = $result_trees{'all_empty_def'};
$result_trees{'all_empty_def'}{'contents'}[3]{'parent'} = $result_trees{'all_empty_def'};
$result_trees{'all_empty_def'}{'contents'}[4]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_empty_def'}{'contents'}[4]{'contents'}[0]{'args'}[0];
$result_trees{'all_empty_def'}{'contents'}[4]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'all_empty_def'}{'contents'}[4]{'contents'}[0];
$result_trees{'all_empty_def'}{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'all_empty_def'}{'contents'}[4];
$result_trees{'all_empty_def'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_empty_def'}{'contents'}[4]{'contents'}[1]{'args'}[0];
$result_trees{'all_empty_def'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'all_empty_def'}{'contents'}[4]{'contents'}[1]{'args'}[0];
$result_trees{'all_empty_def'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'all_empty_def'}{'contents'}[4]{'contents'}[1]{'args'}[0];
$result_trees{'all_empty_def'}{'contents'}[4]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'all_empty_def'}{'contents'}[4]{'contents'}[1];
$result_trees{'all_empty_def'}{'contents'}[4]{'contents'}[1]{'extra'}{'command'} = $result_trees{'all_empty_def'}{'contents'}[4];
$result_trees{'all_empty_def'}{'contents'}[4]{'contents'}[1]{'parent'} = $result_trees{'all_empty_def'}{'contents'}[4];
$result_trees{'all_empty_def'}{'contents'}[4]{'extra'}{'end_command'} = $result_trees{'all_empty_def'}{'contents'}[4]{'contents'}[1];
$result_trees{'all_empty_def'}{'contents'}[4]{'parent'} = $result_trees{'all_empty_def'};
$result_trees{'all_empty_def'}{'contents'}[5]{'parent'} = $result_trees{'all_empty_def'};
$result_trees{'all_empty_def'}{'contents'}[6]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_empty_def'}{'contents'}[6]{'contents'}[0]{'args'}[0];
$result_trees{'all_empty_def'}{'contents'}[6]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'all_empty_def'}{'contents'}[6]{'contents'}[0];
$result_trees{'all_empty_def'}{'contents'}[6]{'contents'}[0]{'parent'} = $result_trees{'all_empty_def'}{'contents'}[6];
$result_trees{'all_empty_def'}{'contents'}[6]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_empty_def'}{'contents'}[6]{'contents'}[1]{'args'}[0];
$result_trees{'all_empty_def'}{'contents'}[6]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'all_empty_def'}{'contents'}[6]{'contents'}[1]{'args'}[0];
$result_trees{'all_empty_def'}{'contents'}[6]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'all_empty_def'}{'contents'}[6]{'contents'}[1]{'args'}[0];
$result_trees{'all_empty_def'}{'contents'}[6]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'all_empty_def'}{'contents'}[6]{'contents'}[1];
$result_trees{'all_empty_def'}{'contents'}[6]{'contents'}[1]{'extra'}{'command'} = $result_trees{'all_empty_def'}{'contents'}[6];
$result_trees{'all_empty_def'}{'contents'}[6]{'contents'}[1]{'parent'} = $result_trees{'all_empty_def'}{'contents'}[6];
$result_trees{'all_empty_def'}{'contents'}[6]{'extra'}{'end_command'} = $result_trees{'all_empty_def'}{'contents'}[6]{'contents'}[1];
$result_trees{'all_empty_def'}{'contents'}[6]{'parent'} = $result_trees{'all_empty_def'};
$result_trees{'all_empty_def'}{'contents'}[7]{'parent'} = $result_trees{'all_empty_def'};
$result_trees{'all_empty_def'}{'contents'}[8]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_empty_def'}{'contents'}[8]{'contents'}[0]{'args'}[0];
$result_trees{'all_empty_def'}{'contents'}[8]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'all_empty_def'}{'contents'}[8]{'contents'}[0];
$result_trees{'all_empty_def'}{'contents'}[8]{'contents'}[0]{'parent'} = $result_trees{'all_empty_def'}{'contents'}[8];
$result_trees{'all_empty_def'}{'contents'}[8]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_empty_def'}{'contents'}[8]{'contents'}[1]{'args'}[0];
$result_trees{'all_empty_def'}{'contents'}[8]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'all_empty_def'}{'contents'}[8]{'contents'}[1]{'args'}[0];
$result_trees{'all_empty_def'}{'contents'}[8]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'all_empty_def'}{'contents'}[8]{'contents'}[1]{'args'}[0];
$result_trees{'all_empty_def'}{'contents'}[8]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'all_empty_def'}{'contents'}[8]{'contents'}[1];
$result_trees{'all_empty_def'}{'contents'}[8]{'contents'}[1]{'extra'}{'command'} = $result_trees{'all_empty_def'}{'contents'}[8];
$result_trees{'all_empty_def'}{'contents'}[8]{'contents'}[1]{'parent'} = $result_trees{'all_empty_def'}{'contents'}[8];
$result_trees{'all_empty_def'}{'contents'}[8]{'extra'}{'end_command'} = $result_trees{'all_empty_def'}{'contents'}[8]{'contents'}[1];
$result_trees{'all_empty_def'}{'contents'}[8]{'parent'} = $result_trees{'all_empty_def'};
$result_trees{'all_empty_def'}{'contents'}[9]{'parent'} = $result_trees{'all_empty_def'};
$result_trees{'all_empty_def'}{'contents'}[10]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_empty_def'}{'contents'}[10]{'contents'}[0]{'args'}[0];
$result_trees{'all_empty_def'}{'contents'}[10]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'all_empty_def'}{'contents'}[10]{'contents'}[0];
$result_trees{'all_empty_def'}{'contents'}[10]{'contents'}[0]{'parent'} = $result_trees{'all_empty_def'}{'contents'}[10];
$result_trees{'all_empty_def'}{'contents'}[10]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_empty_def'}{'contents'}[10]{'contents'}[1]{'args'}[0];
$result_trees{'all_empty_def'}{'contents'}[10]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'all_empty_def'}{'contents'}[10]{'contents'}[1]{'args'}[0];
$result_trees{'all_empty_def'}{'contents'}[10]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'all_empty_def'}{'contents'}[10]{'contents'}[1]{'args'}[0];
$result_trees{'all_empty_def'}{'contents'}[10]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'all_empty_def'}{'contents'}[10]{'contents'}[1];
$result_trees{'all_empty_def'}{'contents'}[10]{'contents'}[1]{'extra'}{'command'} = $result_trees{'all_empty_def'}{'contents'}[10];
$result_trees{'all_empty_def'}{'contents'}[10]{'contents'}[1]{'parent'} = $result_trees{'all_empty_def'}{'contents'}[10];
$result_trees{'all_empty_def'}{'contents'}[10]{'extra'}{'end_command'} = $result_trees{'all_empty_def'}{'contents'}[10]{'contents'}[1];
$result_trees{'all_empty_def'}{'contents'}[10]{'parent'} = $result_trees{'all_empty_def'};
$result_trees{'all_empty_def'}{'contents'}[11]{'parent'} = $result_trees{'all_empty_def'};
$result_trees{'all_empty_def'}{'contents'}[12]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_empty_def'}{'contents'}[12]{'contents'}[0]{'args'}[0];
$result_trees{'all_empty_def'}{'contents'}[12]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'all_empty_def'}{'contents'}[12]{'contents'}[0];
$result_trees{'all_empty_def'}{'contents'}[12]{'contents'}[0]{'parent'} = $result_trees{'all_empty_def'}{'contents'}[12];
$result_trees{'all_empty_def'}{'contents'}[12]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_empty_def'}{'contents'}[12]{'contents'}[1]{'args'}[0];
$result_trees{'all_empty_def'}{'contents'}[12]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'all_empty_def'}{'contents'}[12]{'contents'}[1]{'args'}[0];
$result_trees{'all_empty_def'}{'contents'}[12]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'all_empty_def'}{'contents'}[12]{'contents'}[1]{'args'}[0];
$result_trees{'all_empty_def'}{'contents'}[12]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'all_empty_def'}{'contents'}[12]{'contents'}[1];
$result_trees{'all_empty_def'}{'contents'}[12]{'contents'}[1]{'extra'}{'command'} = $result_trees{'all_empty_def'}{'contents'}[12];
$result_trees{'all_empty_def'}{'contents'}[12]{'contents'}[1]{'parent'} = $result_trees{'all_empty_def'}{'contents'}[12];
$result_trees{'all_empty_def'}{'contents'}[12]{'extra'}{'end_command'} = $result_trees{'all_empty_def'}{'contents'}[12]{'contents'}[1];
$result_trees{'all_empty_def'}{'contents'}[12]{'parent'} = $result_trees{'all_empty_def'};
$result_trees{'all_empty_def'}{'contents'}[13]{'parent'} = $result_trees{'all_empty_def'};
$result_trees{'all_empty_def'}{'contents'}[14]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_empty_def'}{'contents'}[14]{'contents'}[0]{'args'}[0];
$result_trees{'all_empty_def'}{'contents'}[14]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'all_empty_def'}{'contents'}[14]{'contents'}[0];
$result_trees{'all_empty_def'}{'contents'}[14]{'contents'}[0]{'parent'} = $result_trees{'all_empty_def'}{'contents'}[14];
$result_trees{'all_empty_def'}{'contents'}[14]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_empty_def'}{'contents'}[14]{'contents'}[1]{'args'}[0];
$result_trees{'all_empty_def'}{'contents'}[14]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'all_empty_def'}{'contents'}[14]{'contents'}[1]{'args'}[0];
$result_trees{'all_empty_def'}{'contents'}[14]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'all_empty_def'}{'contents'}[14]{'contents'}[1]{'args'}[0];
$result_trees{'all_empty_def'}{'contents'}[14]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'all_empty_def'}{'contents'}[14]{'contents'}[1];
$result_trees{'all_empty_def'}{'contents'}[14]{'contents'}[1]{'extra'}{'command'} = $result_trees{'all_empty_def'}{'contents'}[14];
$result_trees{'all_empty_def'}{'contents'}[14]{'contents'}[1]{'parent'} = $result_trees{'all_empty_def'}{'contents'}[14];
$result_trees{'all_empty_def'}{'contents'}[14]{'extra'}{'end_command'} = $result_trees{'all_empty_def'}{'contents'}[14]{'contents'}[1];
$result_trees{'all_empty_def'}{'contents'}[14]{'parent'} = $result_trees{'all_empty_def'};
$result_trees{'all_empty_def'}{'contents'}[15]{'parent'} = $result_trees{'all_empty_def'};
$result_trees{'all_empty_def'}{'contents'}[16]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_empty_def'}{'contents'}[16]{'contents'}[0]{'args'}[0];
$result_trees{'all_empty_def'}{'contents'}[16]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'all_empty_def'}{'contents'}[16]{'contents'}[0];
$result_trees{'all_empty_def'}{'contents'}[16]{'contents'}[0]{'parent'} = $result_trees{'all_empty_def'}{'contents'}[16];
$result_trees{'all_empty_def'}{'contents'}[16]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'all_empty_def'}{'contents'}[16]{'contents'}[1]{'args'}[0];
$result_trees{'all_empty_def'}{'contents'}[16]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'all_empty_def'}{'contents'}[16]{'contents'}[1]{'args'}[0];
$result_trees{'all_empty_def'}{'contents'}[16]{'contents'}[1]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'all_empty_def'}{'contents'}[16]{'contents'}[1]{'args'}[0];
$result_trees{'all_empty_def'}{'contents'}[16]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'all_empty_def'}{'contents'}[16]{'contents'}[1];
$result_trees{'all_empty_def'}{'contents'}[16]{'contents'}[1]{'extra'}{'command'} = $result_trees{'all_empty_def'}{'contents'}[16];
$result_trees{'all_empty_def'}{'contents'}[16]{'contents'}[1]{'parent'} = $result_trees{'all_empty_def'}{'contents'}[16];
$result_trees{'all_empty_def'}{'contents'}[16]{'extra'}{'end_command'} = $result_trees{'all_empty_def'}{'contents'}[16]{'contents'}[1];
$result_trees{'all_empty_def'}{'contents'}[16]{'parent'} = $result_trees{'all_empty_def'};

$result_texis{'all_empty_def'} = '@deffn
@end deffn

@defvr
@end defvr

@deftypefn
@end deftypefn

@deftypeop
@end deftypeop

@deftypevr
@end deftypevr

@defcv
@end defcv

@deftypecv
@end deftypecv

@defop
@end defop

@deftp
@end deftp
';


$result_texts{'all_empty_def'} = '







';

$result_errors{'all_empty_def'} = [
  {
    'error_line' => ':1: warning: Missing category for @deffn
',
    'file_name' => '',
    'line_nr' => 1,
    'macro' => '',
    'text' => 'Missing category for @deffn',
    'type' => 'warning'
  },
  {
    'error_line' => ':4: warning: Missing category for @defvr
',
    'file_name' => '',
    'line_nr' => 4,
    'macro' => '',
    'text' => 'Missing category for @defvr',
    'type' => 'warning'
  },
  {
    'error_line' => ':7: warning: Missing category for @deftypefn
',
    'file_name' => '',
    'line_nr' => 7,
    'macro' => '',
    'text' => 'Missing category for @deftypefn',
    'type' => 'warning'
  },
  {
    'error_line' => ':10: warning: Missing category for @deftypeop
',
    'file_name' => '',
    'line_nr' => 10,
    'macro' => '',
    'text' => 'Missing category for @deftypeop',
    'type' => 'warning'
  },
  {
    'error_line' => ':13: warning: Missing category for @deftypevr
',
    'file_name' => '',
    'line_nr' => 13,
    'macro' => '',
    'text' => 'Missing category for @deftypevr',
    'type' => 'warning'
  },
  {
    'error_line' => ':16: warning: Missing category for @defcv
',
    'file_name' => '',
    'line_nr' => 16,
    'macro' => '',
    'text' => 'Missing category for @defcv',
    'type' => 'warning'
  },
  {
    'error_line' => ':19: warning: Missing category for @deftypecv
',
    'file_name' => '',
    'line_nr' => 19,
    'macro' => '',
    'text' => 'Missing category for @deftypecv',
    'type' => 'warning'
  },
  {
    'error_line' => ':22: warning: Missing category for @defop
',
    'file_name' => '',
    'line_nr' => 22,
    'macro' => '',
    'text' => 'Missing category for @defop',
    'type' => 'warning'
  },
  {
    'error_line' => ':25: warning: Missing category for @deftp
',
    'file_name' => '',
    'line_nr' => 25,
    'macro' => '',
    'text' => 'Missing category for @deftp',
    'type' => 'warning'
  }
];


1;
