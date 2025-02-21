use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'definfoenclose'} = {
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
              'text' => 'definfoenclose phoo,//,\\  '
            },
            {
              'cmdname' => 'definfoenclose',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'phoo,//,\\'
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
                'misc_args' => [
                  'phoo',
                  '//',
                  '\\'
                ]
              },
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
              'cmdname' => 'phoo',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'bar'
                    }
                  ],
                  'type' => 'brace_container'
                }
              ],
              'extra' => {
                'begin' => '//',
                'end' => '\\'
              },
              'info' => {
                'command_name' => 'phoo'
              },
              'source_info' => {
                'line_nr' => 4
              },
              'type' => 'definfoenclose_command'
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
              'text' => 'definfoenclose phi,:,:  '
            },
            {
              'cmdname' => 'definfoenclose',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'phi,:,:'
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
                'misc_args' => [
                  'phi',
                  ':',
                  ':'
                ]
              },
              'info' => {
                'spaces_before_argument' => {
                  'text' => ' '
                }
              },
              'source_info' => {
                'line_nr' => 6
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
          'contents' => [
            {
              'cmdname' => 'phi',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'bar'
                    }
                  ],
                  'type' => 'brace_container'
                }
              ],
              'extra' => {
                'begin' => ':',
                'end' => ':'
              },
              'info' => {
                'command_name' => 'phi'
              },
              'source_info' => {
                'line_nr' => 8
              },
              'type' => 'definfoenclose_command'
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
              'cmdname' => 'strong',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'very strong'
                    }
                  ],
                  'type' => 'brace_container'
                }
              ],
              'source_info' => {
                'line_nr' => 10
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
          'cmdname' => 'definfoenclose',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'strong,(strong:,:)'
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
            'misc_args' => [
              'strong',
              '(strong:',
              ':)'
            ]
          },
          'info' => {
            'spaces_before_argument' => {
              'text' => ' '
            }
          },
          'source_info' => {
            'line_nr' => 12
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
              'cmdname' => 'strong',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => ' is it really strong? '
                    }
                  ],
                  'type' => 'brace_container'
                }
              ],
              'extra' => {
                'begin' => '(strong:',
                'end' => ':)'
              },
              'info' => {
                'command_name' => 'strong'
              },
              'source_info' => {
                'line_nr' => 14
              },
              'type' => 'definfoenclose_command'
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

$result_texis{'definfoenclose'} = '
definfoenclose phoo,//,\\  @definfoenclose phoo,//,\\

@phoo{bar}

definfoenclose phi,:,:  @definfoenclose phi,:,:

@phi{bar}

@strong{very strong}

@definfoenclose strong,(strong:,:)

@strong{ is it really strong? }
';


$result_texts{'definfoenclose'} = '
definfoenclose phoo,//,\\  
bar

definfoenclose phi,:,:  
bar

very strong


 is it really strong? 
';

$result_errors{'definfoenclose'} = [
  {
    'error_line' => 'warning: @definfoenclose is obsolete
',
    'line_nr' => 2,
    'text' => '@definfoenclose is obsolete',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: @definfoenclose should only appear at the beginning of a line
',
    'line_nr' => 2,
    'text' => '@definfoenclose should only appear at the beginning of a line',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: @definfoenclose is obsolete
',
    'line_nr' => 6,
    'text' => '@definfoenclose is obsolete',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: @definfoenclose should only appear at the beginning of a line
',
    'line_nr' => 6,
    'text' => '@definfoenclose should only appear at the beginning of a line',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: @definfoenclose is obsolete
',
    'line_nr' => 12,
    'text' => '@definfoenclose is obsolete',
    'type' => 'warning'
  }
];


$result_floats{'definfoenclose'} = {};



$result_converted{'plaintext'}->{'definfoenclose'} = 'definfoenclose phoo,//,\\

   //bar\\

   definfoenclose phi,:,:

   :bar:

   *very strong*

   (strong: is it really strong?  :)
';


$result_converted{'html_text'}->{'definfoenclose'} = '
<p>definfoenclose phoo,//,\\  </p>
<p>//bar\\
</p>
<p>definfoenclose phi,:,:  </p>
<p>:bar:
</p>
<p><strong class="strong">very strong</strong>
</p>

<p>(strong: is it really strong? :)
</p>';


$result_converted{'latex'}->{'definfoenclose'} = '\\documentclass{book}
\\usepackage{amsfonts}
\\usepackage{amsmath}
\\usepackage[gen]{eurosym}
\\usepackage{textcomp}
\\usepackage{graphicx}
\\usepackage{etoolbox}
\\usepackage{titleps}
\\usepackage[utf8]{inputenc}
\\usepackage[T1]{fontenc}
\\usepackage{float}
% use hidelinks to remove boxes around links to be similar to Texinfo TeX
\\usepackage[hidelinks]{hyperref}

\\makeatletter
\\newcommand{\\Texinfosettitle}{No Title}%

% redefine the \\mainmatter command such that it does not clear page
% as if in double page
\\renewcommand\\mainmatter{\\clearpage\\@mainmattertrue\\pagenumbering{arabic}}
\\newenvironment{Texinfopreformatted}{%
  \\par\\GNUTobeylines\\obeyspaces\\frenchspacing\\parskip=\\z@\\parindent=\\z@}{}
{\\catcode`\\^^M=13 \\gdef\\GNUTobeylines{\\catcode`\\^^M=13 \\def^^M{\\null\\par}}}
\\newenvironment{Texinfoindented}{\\begin{list}{}{}\\item\\relax}{\\end{list}}

% used for substitutions in commands
\\newcommand{\\Texinfoplaceholder}[1]{}

\\newpagestyle{single}{\\sethead[\\chaptername{} \\thechapter{} \\chaptertitle{}][][\\thepage]
                              {\\chaptername{} \\thechapter{} \\chaptertitle{}}{}{\\thepage}}

% allow line breaking at underscore
\\let\\Texinfounderscore\\_
\\renewcommand{\\_}{\\Texinfounderscore\\discretionary{}{}{}}
\\renewcommand{\\includegraphics}[1]{\\fbox{FIG \\detokenize{#1}}}

\\makeatother
% set default for @setchapternewpage
\\makeatletter
\\patchcmd{\\chapter}{\\if@openright\\cleardoublepage\\else\\clearpage\\fi}{\\Texinfoplaceholder{setchapternewpage placeholder}\\clearpage}{}{}
\\makeatother
\\pagestyle{single}%


definfoenclose phoo,//,\\textbackslash{}  
bar

definfoenclose phi,:,:  
bar

\\textbf{very strong}


\\textbf{ is it really strong? }
\\end{document}
';


$result_converted{'docbook'}->{'definfoenclose'} = '
<para>definfoenclose phoo,//,\\  </para>
<para>bar
</para>
<para>definfoenclose phi,:,:  </para>
<para>bar
</para>
<para><emphasis role="bold">very strong</emphasis>
</para>

<para> is it really strong? 
</para>';

1;
