use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'inlinefmtspaces'} = {
  'contents' => [
    {
      'contents' => [
        {
          'contents' => [
            {
              'text' => 'A '
            },
            {
              'cmdname' => 'inlinefmt',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'plaintext'
                    }
                  ],
                  'info' => {
                    'spaces_after_argument' => {
                      'text' => ' '
                    },
                    'spaces_before_argument' => {
                      'text' => ' '
                    }
                  },
                  'type' => 'brace_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => 'plaintext `` '
                    },
                    {
                      'cmdname' => 'lbracechar',
                      'contents' => [
                        {
                          'type' => 'brace_container'
                        }
                      ],
                      'source_info' => {
                        'line_nr' => 1
                      }
                    },
                    {
                      'text' => ' '
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
                'format' => 'plaintext'
              },
              'info' => {
                'spaces_after_cmd_before_arg' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'line_nr' => 1
              }
            },
            {
              'text' => ' a.  Now html
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
                  'info' => {
                    'spaces_after_argument' => {
                      'text' => ' '
                    },
                    'spaces_before_argument' => {
                      'text' => ' '
                    }
                  },
                  'type' => 'brace_arg'
                },
                {
                  'contents' => [
                    {
                      'text' => 'in <i>'
                    },
                    {
                      'cmdname' => 'acronym',
                      'contents' => [
                        {
                          'contents' => [
                            {
                              'text' => 'HTML'
                            }
                          ],
                          'type' => 'brace_arg'
                        }
                      ],
                      'source_info' => {
                        'line_nr' => 2
                      }
                    },
                    {
                      'text' => '</i>'
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
                'format' => 'html'
              },
              'source_info' => {
                'line_nr' => 2
              }
            },
            {
              'text' => '.
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

$result_texis{'inlinefmtspaces'} = 'A @inlinefmt { plaintext , plaintext `` @lbracechar{} } a.  Now html
@inlinefmt{ html , in <i>@acronym{HTML}</i>}.
';


$result_texts{'inlinefmtspaces'} = 'A plaintext " {  a.  Now html
in <i>HTML</i>.
';

$result_errors{'inlinefmtspaces'} = [];


$result_floats{'inlinefmtspaces'} = {};



$result_converted{'plaintext'}->{'inlinefmtspaces'} = 'A plaintext " { a.  Now html .
';


$result_converted{'html_text'}->{'inlinefmtspaces'} = '<p>A  a.  Now html
in &lt;i&gt;<abbr class="acronym">HTML</abbr>&lt;/i&gt;.
</p>';


$result_converted{'xml'}->{'inlinefmtspaces'} = '<para>A <inlinefmt spacesaftercmd=" "><inlinefmtformat spaces=" ">plaintext </inlinefmtformat><inlinefmtcontent spaces=" ">plaintext &textldquo; &lbracechar; </inlinefmtcontent></inlinefmt> a.  Now html
<inlinefmt><inlinefmtformat spaces=" ">html </inlinefmtformat><inlinefmtcontent spaces=" ">in &lt;i&gt;<acronym><acronymword>HTML</acronymword></acronym>&lt;/i&gt;</inlinefmtcontent></inlinefmt>.
</para>';


$result_converted{'docbook'}->{'inlinefmtspaces'} = '<para>A  a.  Now html
.
</para>';


$result_converted{'latex_text'}->{'inlinefmtspaces'} = 'A  a.  Now html
.
';

1;
