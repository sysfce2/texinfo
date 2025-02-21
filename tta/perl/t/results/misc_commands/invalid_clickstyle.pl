use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'invalid_clickstyle'} = {
  'contents' => [
    {
      'contents' => [
        {
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'cmdname' => 'clickstyle',
          'contents' => [
            {
              'text' => '@result',
              'type' => 'rawline_arg'
            }
          ],
          'extra' => {},
          'info' => {
            'arg_line' => ' @result on the same line
'
          },
          'source_info' => {
            'line_nr' => 2
          }
        },
        {
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'contents' => [
            {
              'text' => 'A '
            },
            {
              'cmdname' => 'click',
              'contents' => [
                {
                  'type' => 'brace_container'
                }
              ],
              'extra' => {
                'clickstyle' => 'result'
              },
              'source_info' => {
                'line_nr' => 4
              }
            },
            {
              'text' => ' (result on the same line).
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
          'cmdname' => 'clickstyle',
          'contents' => [
            {
              'text' => '@nocmd',
              'type' => 'rawline_arg'
            }
          ],
          'extra' => {},
          'info' => {
            'arg_line' => ' @nocmd
'
          },
          'source_info' => {
            'line_nr' => 6
          }
        },
        {
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'contents' => [
            {
              'text' => 'A '
            },
            {
              'cmdname' => 'click',
              'contents' => [
                {
                  'type' => 'brace_container'
                }
              ],
              'extra' => {
                'clickstyle' => 'nocmd'
              },
              'source_info' => {
                'line_nr' => 8
              }
            },
            {
              'text' => ' (nocmd).
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
          'cmdname' => 'clickstyle',
          'extra' => {},
          'info' => {
            'arg_line' => ' something
'
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
          'contents' => [
            {
              'text' => 'A '
            },
            {
              'cmdname' => 'click',
              'contents' => [
                {
                  'type' => 'brace_container'
                }
              ],
              'extra' => {
                'clickstyle' => 'nocmd'
              },
              'source_info' => {
                'line_nr' => 12
              }
            },
            {
              'text' => ' (something).
'
            }
          ],
          'type' => 'paragraph'
        }
      ],
      'type' => 'before_node_section'
    }
  ],
  'type' => 'document_root'
};

$result_texis{'invalid_clickstyle'} = '
@clickstyle @result on the same line

A @click{} (result on the same line).

@clickstyle @nocmd

A @click{} (nocmd).

@clickstyle something

A @click{} (something).
';


$result_texts{'invalid_clickstyle'} = '

A => (result on the same line).


A  (nocmd).


A  (something).
';

$result_errors{'invalid_clickstyle'} = [
  {
    'error_line' => 'warning: remaining argument on @clickstyle line: on the same line
',
    'line_nr' => 2,
    'text' => 'remaining argument on @clickstyle line: on the same line',
    'type' => 'warning'
  },
  {
    'error_line' => '@clickstyle should only accept an @-command as argument, not ` something
\'
',
    'line_nr' => 10,
    'text' => '@clickstyle should only accept an @-command as argument, not ` something
\'',
    'type' => 'error'
  }
];


$result_floats{'invalid_clickstyle'} = {};


1;
