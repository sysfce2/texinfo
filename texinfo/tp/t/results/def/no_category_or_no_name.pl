use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors);

$result_trees{'no_category_or_no_name'} = {
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
          'contents' => [
            {
              'parent' => {},
              'text' => 'no category no name
'
            }
          ],
          'parent' => {},
          'type' => 'paragraph'
        }
      ],
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
      'type' => 'empty_line_after_command'
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line'
    },
    {
      'cmdname' => 'deffn',
      'contents' => [
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
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'only category'
                    }
                  ],
                  'parent' => {},
                  'type' => 'bracketed'
                },
                {
                  'parent' => {},
                  'text' => '
'
                }
              ],
              'parent' => {},
              'type' => 'block_line_arg'
            }
          ],
          'extra' => {
            'def_args' => [
              [
                'category',
                {
                  'contents' => [],
                  'parent' => {},
                  'type' => 'bracketed_def_content'
                }
              ]
            ],
            'def_command' => 'deffn',
            'def_parsed_hash' => {
              'category' => {}
            },
            'original_def_cmdname' => 'deffn'
          },
          'parent' => {},
          'type' => 'def_line'
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'no name
'
            }
          ],
          'parent' => {},
          'type' => 'paragraph'
        }
      ],
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 5,
        'macro' => ''
      },
      'parent' => {}
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line_after_command'
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line'
    },
    {
      'cmdname' => 'deffn',
      'contents' => [
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
                  'text' => 'a b c d 
'
                }
              ],
              'parent' => {},
              'type' => 'block_line_arg'
            }
          ],
          'extra' => {
            'def_args' => [
              [
                'category',
                {
                  'text' => 'a'
                }
              ],
              [
                'spaces',
                {
                  'text' => ' ',
                  'type' => 'spaces'
                }
              ],
              [
                'name',
                {
                  'text' => 'b'
                }
              ],
              [
                'spaces',
                {
                  'text' => ' ',
                  'type' => 'spaces'
                }
              ],
              [
                'arg',
                {
                  'text' => 'c'
                }
              ],
              [
                'spaces',
                {
                  'text' => ' ',
                  'type' => 'spaces'
                }
              ],
              [
                'arg',
                {
                  'text' => 'd'
                }
              ]
            ],
            'def_command' => 'deffn',
            'def_parsed_hash' => {
              'category' => {},
              'name' => {}
            },
            'index_entry' => {
              'command' => {},
              'content' => [
                {}
              ],
              'index_at_command' => 'deffn',
              'index_name' => 'fn',
              'index_prefix' => 'f',
              'number' => 1
            },
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
                  'text' => 'deffnx_category
'
                }
              ],
              'parent' => {},
              'type' => 'misc_line_arg'
            }
          ],
          'cmdname' => 'deffnx',
          'extra' => {
            'def_args' => [
              [
                'category',
                {
                  'text' => 'deffnx_category'
                }
              ]
            ],
            'def_command' => 'deffn',
            'def_parsed_hash' => {
              'category' => {}
            },
            'original_def_cmdname' => 'deffnx'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 10,
            'macro' => ''
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
                  'text' => ' 
',
                  'type' => 'empty_line_after_command'
                }
              ],
              'parent' => {},
              'type' => 'misc_line_arg'
            }
          ],
          'cmdname' => 'deffnx',
          'extra' => {
            'def_command' => 'deffn',
            'original_def_cmdname' => 'deffnx'
          },
          'line_nr' => {
            'file_name' => '',
            'line_nr' => 11,
            'macro' => ''
          },
          'parent' => {},
          'type' => 'def_line'
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'with deffnx missing category or name
'
            }
          ],
          'parent' => {},
          'type' => 'paragraph'
        }
      ],
      'line_nr' => {
        'file_name' => '',
        'line_nr' => 9,
        'macro' => ''
      },
      'parent' => {}
    },
    {
      'parent' => {},
      'text' => '
',
      'type' => 'empty_line_after_command'
    }
  ],
  'type' => 'text_root'
};
$result_trees{'no_category_or_no_name'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'no_category_or_no_name'}{'contents'}[0]{'contents'}[0]{'args'}[0];
$result_trees{'no_category_or_no_name'}{'contents'}[0]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'no_category_or_no_name'}{'contents'}[0]{'contents'}[0];
$result_trees{'no_category_or_no_name'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'no_category_or_no_name'}{'contents'}[0];
$result_trees{'no_category_or_no_name'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'no_category_or_no_name'}{'contents'}[0]{'contents'}[1];
$result_trees{'no_category_or_no_name'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'no_category_or_no_name'}{'contents'}[0];
$result_trees{'no_category_or_no_name'}{'contents'}[0]{'parent'} = $result_trees{'no_category_or_no_name'};
$result_trees{'no_category_or_no_name'}{'contents'}[1]{'parent'} = $result_trees{'no_category_or_no_name'};
$result_trees{'no_category_or_no_name'}{'contents'}[2]{'parent'} = $result_trees{'no_category_or_no_name'};
$result_trees{'no_category_or_no_name'}{'contents'}[3]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'no_category_or_no_name'}{'contents'}[3]{'contents'}[0]{'args'}[0];
$result_trees{'no_category_or_no_name'}{'contents'}[3]{'contents'}[0]{'args'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'no_category_or_no_name'}{'contents'}[3]{'contents'}[0]{'args'}[0]{'contents'}[1];
$result_trees{'no_category_or_no_name'}{'contents'}[3]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'no_category_or_no_name'}{'contents'}[3]{'contents'}[0]{'args'}[0];
$result_trees{'no_category_or_no_name'}{'contents'}[3]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'no_category_or_no_name'}{'contents'}[3]{'contents'}[0]{'args'}[0];
$result_trees{'no_category_or_no_name'}{'contents'}[3]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'no_category_or_no_name'}{'contents'}[3]{'contents'}[0];
$result_trees{'no_category_or_no_name'}{'contents'}[3]{'contents'}[0]{'extra'}{'def_args'}[0][1]{'contents'} = $result_trees{'no_category_or_no_name'}{'contents'}[3]{'contents'}[0]{'args'}[0]{'contents'}[1]{'contents'};
$result_trees{'no_category_or_no_name'}{'contents'}[3]{'contents'}[0]{'extra'}{'def_args'}[0][1]{'parent'} = $result_trees{'no_category_or_no_name'}{'contents'}[3]{'contents'}[0]{'args'}[0];
$result_trees{'no_category_or_no_name'}{'contents'}[3]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'no_category_or_no_name'}{'contents'}[3]{'contents'}[0]{'extra'}{'def_args'}[0][1];
$result_trees{'no_category_or_no_name'}{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'no_category_or_no_name'}{'contents'}[3];
$result_trees{'no_category_or_no_name'}{'contents'}[3]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'no_category_or_no_name'}{'contents'}[3]{'contents'}[1];
$result_trees{'no_category_or_no_name'}{'contents'}[3]{'contents'}[1]{'parent'} = $result_trees{'no_category_or_no_name'}{'contents'}[3];
$result_trees{'no_category_or_no_name'}{'contents'}[3]{'parent'} = $result_trees{'no_category_or_no_name'};
$result_trees{'no_category_or_no_name'}{'contents'}[4]{'parent'} = $result_trees{'no_category_or_no_name'};
$result_trees{'no_category_or_no_name'}{'contents'}[5]{'parent'} = $result_trees{'no_category_or_no_name'};
$result_trees{'no_category_or_no_name'}{'contents'}[6]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'no_category_or_no_name'}{'contents'}[6]{'contents'}[0]{'args'}[0];
$result_trees{'no_category_or_no_name'}{'contents'}[6]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'no_category_or_no_name'}{'contents'}[6]{'contents'}[0]{'args'}[0];
$result_trees{'no_category_or_no_name'}{'contents'}[6]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'no_category_or_no_name'}{'contents'}[6]{'contents'}[0];
$result_trees{'no_category_or_no_name'}{'contents'}[6]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'no_category_or_no_name'}{'contents'}[6]{'contents'}[0]{'extra'}{'def_args'}[0][1];
$result_trees{'no_category_or_no_name'}{'contents'}[6]{'contents'}[0]{'extra'}{'def_parsed_hash'}{'name'} = $result_trees{'no_category_or_no_name'}{'contents'}[6]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'no_category_or_no_name'}{'contents'}[6]{'contents'}[0]{'extra'}{'index_entry'}{'command'} = $result_trees{'no_category_or_no_name'}{'contents'}[6]{'contents'}[0];
$result_trees{'no_category_or_no_name'}{'contents'}[6]{'contents'}[0]{'extra'}{'index_entry'}{'content'}[0] = $result_trees{'no_category_or_no_name'}{'contents'}[6]{'contents'}[0]{'extra'}{'def_args'}[2][1];
$result_trees{'no_category_or_no_name'}{'contents'}[6]{'contents'}[0]{'parent'} = $result_trees{'no_category_or_no_name'}{'contents'}[6];
$result_trees{'no_category_or_no_name'}{'contents'}[6]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'no_category_or_no_name'}{'contents'}[6]{'contents'}[1]{'args'}[0];
$result_trees{'no_category_or_no_name'}{'contents'}[6]{'contents'}[1]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'no_category_or_no_name'}{'contents'}[6]{'contents'}[1]{'args'}[0];
$result_trees{'no_category_or_no_name'}{'contents'}[6]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'no_category_or_no_name'}{'contents'}[6]{'contents'}[1];
$result_trees{'no_category_or_no_name'}{'contents'}[6]{'contents'}[1]{'extra'}{'def_parsed_hash'}{'category'} = $result_trees{'no_category_or_no_name'}{'contents'}[6]{'contents'}[1]{'extra'}{'def_args'}[0][1];
$result_trees{'no_category_or_no_name'}{'contents'}[6]{'contents'}[1]{'parent'} = $result_trees{'no_category_or_no_name'}{'contents'}[6];
$result_trees{'no_category_or_no_name'}{'contents'}[6]{'contents'}[2]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'no_category_or_no_name'}{'contents'}[6]{'contents'}[2]{'args'}[0];
$result_trees{'no_category_or_no_name'}{'contents'}[6]{'contents'}[2]{'args'}[0]{'parent'} = $result_trees{'no_category_or_no_name'}{'contents'}[6]{'contents'}[2];
$result_trees{'no_category_or_no_name'}{'contents'}[6]{'contents'}[2]{'parent'} = $result_trees{'no_category_or_no_name'}{'contents'}[6];
$result_trees{'no_category_or_no_name'}{'contents'}[6]{'contents'}[3]{'contents'}[0]{'parent'} = $result_trees{'no_category_or_no_name'}{'contents'}[6]{'contents'}[3];
$result_trees{'no_category_or_no_name'}{'contents'}[6]{'contents'}[3]{'parent'} = $result_trees{'no_category_or_no_name'}{'contents'}[6];
$result_trees{'no_category_or_no_name'}{'contents'}[6]{'parent'} = $result_trees{'no_category_or_no_name'};
$result_trees{'no_category_or_no_name'}{'contents'}[7]{'parent'} = $result_trees{'no_category_or_no_name'};

$result_texis{'no_category_or_no_name'} = '@deffn
no category no name
@end deffn

@deffn {only category}
no name
@end deffn

@deffn a b c d 
@deffnx deffnx_category
@deffnx 
with deffnx missing category or name
@end deffn
';


$result_texts{'no_category_or_no_name'} = 'no category no name

only category
no name

a b c d 
deffnx_category
with deffnx missing category or name
';

$result_errors{'no_category_or_no_name'} = [
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
    'error_line' => ':5: warning: Missing name for @deffn
',
    'file_name' => '',
    'line_nr' => 5,
    'macro' => '',
    'text' => 'Missing name for @deffn',
    'type' => 'warning'
  },
  {
    'error_line' => ':10: warning: Missing name for @deffnx
',
    'file_name' => '',
    'line_nr' => 10,
    'macro' => '',
    'text' => 'Missing name for @deffnx',
    'type' => 'warning'
  },
  {
    'error_line' => ':11: warning: Missing category for @deffnx
',
    'file_name' => '',
    'line_nr' => 11,
    'macro' => '',
    'text' => 'Missing category for @deffnx',
    'type' => 'warning'
  }
];


1;
