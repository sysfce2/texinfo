use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'on_subheading_line'} = {
  'contents' => [
    {
      'contents' => [
        {
          'cmdname' => 'subheading',
          'contents' => [
            {
              'contents' => [
                {
                  'cmdname' => 'noindent',
                  'source_info' => {
                    'line_nr' => 1
                  }
                },
                {
                  'text' => ' ',
                  'type' => 'ignorable_spaces_after_command'
                },
                {
                  'text' => 'Text '
                },
                {
                  'cmdname' => 'titlefont',
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'in titlefont'
                        }
                      ],
                      'type' => 'brace_container'
                    }
                  ],
                  'extra' => {},
                  'source_info' => {
                    'line_nr' => 1
                  }
                },
                {
                  'text' => ' '
                },
                {
                  'cmdname' => 'anchor',
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'in anchor'
                        }
                      ],
                      'type' => 'brace_arg'
                    }
                  ],
                  'extra' => {
                    'is_target' => 1,
                    'normalized' => 'in-anchor'
                  },
                  'source_info' => {
                    'line_nr' => 1
                  }
                },
                {
                  'cmdname' => 'footnote',
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'contents' => [
                            {
                              'text' => 'footnote'
                            }
                          ],
                          'type' => 'paragraph'
                        }
                      ],
                      'type' => 'brace_command_context'
                    }
                  ],
                  'extra' => {},
                  'source_info' => {
                    'line_nr' => 1
                  }
                },
                {
                  'text' => ' '
                },
                {
                  'cmdname' => 'exdent',
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'exdent'
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
                    'line_nr' => 1
                  }
                }
              ],
              'type' => 'line_arg'
            }
          ],
          'extra' => {},
          'info' => {
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'line_nr' => 1
          }
        }
      ],
      'type' => 'before_node_section'
    }
  ],
  'type' => 'document_root'
};

$result_texis{'on_subheading_line'} = '@subheading @noindent Text @titlefont{in titlefont} @anchor{in anchor}@footnote{footnote} @exdent exdent
';


$result_texts{'on_subheading_line'} = 'Text in titlefont  exdent
-------------------------
';

$result_errors{'on_subheading_line'} = [
  {
    'error_line' => 'warning: @noindent should not appear on @subheading line
',
    'line_nr' => 1,
    'text' => '@noindent should not appear on @subheading line',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: @titlefont should not appear on @subheading line
',
    'line_nr' => 1,
    'text' => '@titlefont should not appear on @subheading line',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: @anchor should not appear on @subheading line
',
    'line_nr' => 1,
    'text' => '@anchor should not appear on @subheading line',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: @footnote should not appear on @subheading line
',
    'line_nr' => 1,
    'text' => '@footnote should not appear on @subheading line',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: @exdent should only appear at the beginning of a line
',
    'line_nr' => 1,
    'text' => '@exdent should only appear at the beginning of a line',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: @exdent should not appear on @subheading line
',
    'line_nr' => 1,
    'text' => '@exdent should not appear on @subheading line',
    'type' => 'warning'
  }
];


$result_floats{'on_subheading_line'} = {};


1;
