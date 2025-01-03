use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'section_in_nested_block_commands'} = {
  'contents' => [
    {
      'contents' => [
        {
          'cmdname' => 'table',
          'contents' => [
            {
              'contents' => [
                {
                  'contents' => [
                    {
                      'cmdname' => 'strong',
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
                  'type' => 'block_line_arg'
                }
              ],
              'type' => 'arguments_line'
            },
            {
              'contents' => [
                {
                  'contents' => [
                    {
                      'cmdname' => 'item',
                      'contents' => [
                        {
                          'contents' => [
                            {
                              'text' => 'item'
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
                        'line_nr' => 2
                      }
                    }
                  ],
                  'type' => 'table_term'
                },
                {
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'table line
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
                          'text' => '
',
                          'type' => 'empty_line'
                        },
                        {
                          'contents' => [
                            {
                              'text' => 'in quotation
'
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
                      'source_info' => {
                        'line_nr' => 5
                      }
                    }
                  ],
                  'type' => 'table_definition'
                }
              ],
              'type' => 'table_entry'
            }
          ],
          'extra' => {
            'command_as_argument' => {}
          },
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
    },
    {
      'cmdname' => 'section',
      'contents' => [
        {
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'a section'
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
        'section_number' => '1'
      },
      'info' => {
        'spaces_before_argument' => {
          'text' => ' '
        }
      },
      'source_info' => {
        'line_nr' => 9
      }
    }
  ],
  'type' => 'document_root'
};
$result_trees{'section_in_nested_block_commands'}{'contents'}[0]{'contents'}[0]{'extra'}{'command_as_argument'} = $result_trees{'section_in_nested_block_commands'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'contents'}[0]{'contents'}[0];

$result_texis{'section_in_nested_block_commands'} = '@table @strong
@item item
table line

@quotation

in quotation

@section a section
';


$result_texts{'section_in_nested_block_commands'} = 'item
table line


in quotation

1 a section
===========
';

$result_sectioning{'section_in_nested_block_commands'} = {
  'extra' => {
    'section_childs' => [
      {
        'cmdname' => 'section',
        'extra' => {
          'section_level' => 2,
          'section_number' => '1',
          'sectioning_root' => {}
        }
      }
    ],
    'section_level' => 1
  }
};
$result_sectioning{'section_in_nested_block_commands'}{'extra'}{'section_childs'}[0]{'extra'}{'sectioning_root'} = $result_sectioning{'section_in_nested_block_commands'};

$result_errors{'section_in_nested_block_commands'} = [
  {
    'error_line' => '@section seen before @end quotation
',
    'line_nr' => 9,
    'text' => '@section seen before @end quotation',
    'type' => 'error'
  },
  {
    'error_line' => '@section seen before @end table
',
    'line_nr' => 9,
    'text' => '@section seen before @end table',
    'type' => 'error'
  }
];


$result_floats{'section_in_nested_block_commands'} = {};



$result_converted{'plaintext'}->{'section_in_nested_block_commands'} = '*item*
     table line

          in quotation

1 a section
===========

';


$result_converted{'xml'}->{'section_in_nested_block_commands'} = '<table commandarg="strong" spaces=" ">
<tableentry><tableterm><item spaces=" "><itemformat command="strong">item</itemformat></item>
</tableterm><tableitem><para>table line
</para>
<quotation>

<para>in quotation
</para>
</quotation>
</tableitem></tableentry></table>
<section spaces=" "><sectiontitle>a section</sectiontitle>
</section>
';

1;
