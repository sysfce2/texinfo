use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'bad_documentlanguage'} = {
  'contents' => [
    {
      'contents' => [
        {
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'contents' => [
            {
              'text' => 'documentlanguage '
            },
            {
              'cmdname' => 'documentlanguage',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'en'
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
                'text_arg' => 'en'
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => '  '
                }
              },
              'source_info' => {
                'line_nr' => 2
              }
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
          'cmdname' => 'documentlanguage',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'en '
                },
                {
                  'cmdname' => 'documentlanguage',
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'en'
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
                    'text_arg' => 'en'
                  },
                  'info' => {
                    'spaces_before_argument' => {
                      'text' => '  '
                    }
                  },
                  'source_info' => {
                    'line_nr' => 4
                  }
                }
              ],
              'type' => 'line_arg'
            }
          ],
          'extra' => {
            'text_arg' => 'en '
          },
          'info' => {
            'spaces_before_argument' => {
              'text' => '  '
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
          'cmdname' => 'documentlanguage',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'en  after documentlanguage'
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
            'text_arg' => 'en  after documentlanguage'
          },
          'info' => {
            'spaces_before_argument' => {
              'text' => '  '
            }
          },
          'source_info' => {
            'line_nr' => 6
          }
        }
      ],
      'type' => 'before_node_section'
    }
  ],
  'type' => 'document_root'
};

$result_texis{'bad_documentlanguage'} = '
documentlanguage @documentlanguage  en 

@documentlanguage  en @documentlanguage  en  

@documentlanguage  en  after documentlanguage
';


$result_texts{'bad_documentlanguage'} = '
documentlanguage 

';

$result_errors{'bad_documentlanguage'} = [
  {
    'error_line' => 'warning: @documentlanguage should only appear at the beginning of a line
',
    'line_nr' => 2,
    'text' => '@documentlanguage should only appear at the beginning of a line',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: @documentlanguage should only appear at the beginning of a line
',
    'line_nr' => 4,
    'text' => '@documentlanguage should only appear at the beginning of a line',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: @documentlanguage should not appear in @documentlanguage
',
    'line_nr' => 4,
    'text' => '@documentlanguage should not appear in @documentlanguage',
    'type' => 'warning'
  },
  {
    'error_line' => 'bad argument to @documentlanguage: en @documentlanguage  en
',
    'line_nr' => 4,
    'text' => 'bad argument to @documentlanguage: en @documentlanguage  en',
    'type' => 'error'
  },
  {
    'error_line' => 'warning: en  after documentlanguage is not a valid language code
',
    'line_nr' => 6,
    'text' => 'en  after documentlanguage is not a valid language code',
    'type' => 'warning'
  }
];


$result_floats{'bad_documentlanguage'} = {};


1;
