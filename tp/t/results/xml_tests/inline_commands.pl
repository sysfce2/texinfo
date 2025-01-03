use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'inline_commands'} = {
  'contents' => [
    {
      'contents' => [
        {
          'contents' => [
            {
              'cmdname' => 'inlineraw',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'xml'
                    }
                  ],
                  'type' => 'brace_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => '<sc>xml inlineraw</sc>'
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
                'expand_index' => 1,
                'format' => 'xml'
              },
              'source_info' => {
                'line_nr' => 1
              }
            },
            {
              'text' => '
'
            },
            {
              'cmdname' => 'inlineraw',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'html'
                    }
                  ],
                  'type' => 'brace_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => ' <code>html</code>',
                      'type' => 'raw'
                    }
                  ],
                  'type' => 'elided_brace_command_arg'
                }
              ],
              'extra' => {
                'format' => 'html'
              },
              'source_info' => {
                'line_nr' => 2
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
              'cmdname' => 'inlinefmt',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'xml'
                    }
                  ],
                  'type' => 'brace_arg'
                },
                {
                  'contents' => [
                    {
                      'cmdname' => 'env',
                      'contents' => [
                        {
                          'contents' => [
                            {
                              'text' => 'inlinefmt'
                            }
                          ],
                          'type' => 'brace_container'
                        }
                      ],
                      'source_info' => {
                        'line_nr' => 4
                      }
                    },
                    {
                      'text' => ', xml'
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
                'expand_index' => 1,
                'format' => 'xml'
              },
              'source_info' => {
                'line_nr' => 4
              }
            },
            {
              'text' => '
'
            },
            {
              'cmdname' => 'inlinefmt',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'html'
                    }
                  ],
                  'type' => 'brace_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => ' @env{inlinefmt}, html',
                      'type' => 'raw'
                    }
                  ],
                  'type' => 'elided_brace_command_arg'
                }
              ],
              'extra' => {
                'format' => 'html'
              },
              'source_info' => {
                'line_nr' => 5
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
              'cmdname' => 'inlinefmtifelse',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'xml'
                    }
                  ],
                  'type' => 'brace_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => 'xml '
                    },
                    {
                      'cmdname' => 'code',
                      'contents' => [
                        {
                          'contents' => [
                            {
                              'text' => 'inlinefmtifelse'
                            }
                          ],
                          'type' => 'brace_container'
                        }
                      ],
                      'source_info' => {
                        'line_nr' => 7
                      }
                    }
                  ],
                  'info' => {
                    'spaces_before_argument' => {
                      'text' => ' '
                    }
                  },
                  'type' => 'brace_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => ' else xml',
                      'type' => 'raw'
                    }
                  ],
                  'type' => 'elided_brace_command_arg'
                }
              ],
              'extra' => {
                'expand_index' => 1,
                'format' => 'xml'
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
              'cmdname' => 'inlinefmtifelse',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'html'
                    }
                  ],
                  'type' => 'brace_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => ' html @var{inlinefmtifelse}',
                      'type' => 'raw'
                    }
                  ],
                  'type' => 'elided_brace_command_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => 'else html'
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
                'format' => 'html'
              },
              'source_info' => {
                'line_nr' => 8
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

$result_texis{'inline_commands'} = '@inlineraw{xml, <sc>xml inlineraw</sc>}
@inlineraw{html, <code>html</code>}

@inlinefmt{xml, @env{inlinefmt}, xml}
@inlinefmt{html, @env{inlinefmt}, html}

@inlinefmtifelse{xml, xml @code{inlinefmtifelse}, else xml}
@inlinefmtifelse{html, html @var{inlinefmtifelse}, else html}
';


$result_texts{'inline_commands'} = '<sc>xml inlineraw</sc>


inlinefmt, xml


xml inlinefmtifelse
else html
';

$result_errors{'inline_commands'} = [];


$result_floats{'inline_commands'} = {};



$result_converted{'xml'}->{'inline_commands'} = '<para><sc>xml inlineraw</sc>
<inlineraw><inlinerawformat>html</inlinerawformat><inlinerawcontent> &lt;code&gt;html&lt;/code&gt;</inlinerawcontent></inlineraw>
</para>
<para><env>inlinefmt</env>, xml
<inlinefmt><inlinefmtformat>html</inlinefmtformat><inlinefmtcontent> @env{inlinefmt}, html</inlinefmtcontent></inlinefmt>
</para>
<para>xml <code>inlinefmtifelse</code>
<inlinefmtifelse><inlinefmtifelseformat>html</inlinefmtifelseformat><inlinefmtifelsecontentif> html @var{inlinefmtifelse}</inlinefmtifelsecontentif><inlinefmtifelsecontentelse spaces=" ">else html</inlinefmtifelsecontentelse></inlinefmtifelse>
</para>';

1;
