use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'quotation_author'} = {
  'contents' => [
    {
      'contents' => [
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
              'cmdname' => 'author',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'First Author'
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
                'quotation' => {}
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'line_nr' => 3
              }
            },
            {
              'contents' => [
                {
                  'text' => 'quotation
'
                },
                {
                  'cmdname' => 'author',
                  'contents' => [
                    {
                      'contents' => [
                        {
                          'text' => 'S'
                        },
                        {
                          'cmdname' => '~',
                          'contents' => [
                            {
                              'contents' => [
                                {
                                  'text' => 'e'
                                }
                              ],
                              'type' => 'following_arg'
                            }
                          ],
                          'source_info' => {
                            'line_nr' => 5
                          }
                        },
                        {
                          'text' => 'cond author'
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
                    'quotation' => {}
                  },
                  'info' => {
                    'spaces_before_argument' => {
                      'text' => ' '
                    }
                  },
                  'source_info' => {
                    'line_nr' => 5
                  }
                },
                {
                  'text' => 'quotation continues.
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
              'cmdname' => 'end',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'quotation'
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
                'text_arg' => 'quotation'
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'line_nr' => 8
              }
            }
          ],
          'extra' => {
            'authors' => [
              {},
              {}
            ]
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
$result_trees{'quotation_author'}{'contents'}[0]{'contents'}[0]{'contents'}[2]{'extra'}{'quotation'} = $result_trees{'quotation_author'}{'contents'}[0]{'contents'}[0];
$result_trees{'quotation_author'}{'contents'}[0]{'contents'}[0]{'contents'}[3]{'contents'}[1]{'extra'}{'quotation'} = $result_trees{'quotation_author'}{'contents'}[0]{'contents'}[0];
$result_trees{'quotation_author'}{'contents'}[0]{'contents'}[0]{'extra'}{'authors'}[0] = $result_trees{'quotation_author'}{'contents'}[0]{'contents'}[0]{'contents'}[2];
$result_trees{'quotation_author'}{'contents'}[0]{'contents'}[0]{'extra'}{'authors'}[1] = $result_trees{'quotation_author'}{'contents'}[0]{'contents'}[0]{'contents'}[3]{'contents'}[1];

$result_texis{'quotation_author'} = '@quotation

@author First Author
quotation
@author S@~econd author
quotation continues.

@end quotation
';


$result_texts{'quotation_author'} = '
First Author
quotation
Se~cond author
quotation continues.

';

$result_errors{'quotation_author'} = [];


$result_floats{'quotation_author'} = {};



$result_converted{'plaintext'}->{'quotation_author'} = '     quotation quotation continues.

                           -- _First Author_
                          -- _Sẽcond author_
';


$result_converted{'html_text'}->{'quotation_author'} = '<blockquote class="quotation">

<p>quotation
quotation continues.
</p>
</blockquote>
<div class="center">&mdash; <em class="emph">First Author</em>
</div><div class="center">&mdash; <em class="emph">S&#7869;cond author</em>
</div>';


$result_converted{'xml'}->{'quotation_author'} = '<quotation endspaces=" ">

<author spaces=" ">First Author</author>
<para>quotation
<author spaces=" ">S<accent type="tilde" bracketed="off">e</accent>cond author</author>
quotation continues.
</para>
</quotation>
';


$result_converted{'latex_text'}->{'quotation_author'} = '\\begin{quote}

quotation
quotation continues.

\\end{quote}
\\begin{center}
--- \\emph{First Author}
\\end{center}
\\begin{center}
--- \\emph{S\\~{e}cond author}
\\end{center}
';


$result_converted{'docbook'}->{'quotation_author'} = '<blockquote><attribution>First Author</attribution>
<attribution>S&#7869;cond author</attribution>

<para>quotation
quotation continues.
</para>
</blockquote>';

1;
