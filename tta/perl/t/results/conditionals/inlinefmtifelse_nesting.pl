use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'inlinefmtifelse_nesting'} = {
  'contents' => [
    {
      'contents' => [
        {
          'contents' => [
            {
              'cmdname' => 'inlinefmtifelse',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'info'
                    }
                  ],
                  'type' => 'brace_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => ' @footnote{See.}',
                      'type' => 'raw'
                    }
                  ],
                  'type' => 'elided_brace_command_arg'
                },
                {
                  'contents' => [
                    {
                      'cmdname' => 'emph',
                      'contents' => [
                        {
                          'contents' => [
                            {
                              'text' => 'text'
                            }
                          ],
                          'type' => 'brace_container'
                        }
                      ],
                      'source_info' => {
                        'line_nr' => 1
                      }
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
              'extra' => {
                'expand_index' => 2,
                'format' => 'info'
              },
              'source_info' => {
                'line_nr' => 1
              }
            },
            {
              'text' => '
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

$result_texis{'inlinefmtifelse_nesting'} = '@inlinefmtifelse{info, @footnote{See.}, @emph{text}}
';


$result_texts{'inlinefmtifelse_nesting'} = 'text
';

$result_errors{'inlinefmtifelse_nesting'} = [];


$result_floats{'inlinefmtifelse_nesting'} = {};


1;
