use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'noindent_after_smallexample'} = {
  'contents' => [
    {
      'contents' => [
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'To obtain.
'
            }
          ],
          'parent' => {},
          'type' => 'paragraph'
        },
        {
          'args' => [
            {
              'extra' => {
                'spaces_after_argument' => '
'
              },
              'parent' => {},
              'type' => 'block_line_arg'
            }
          ],
          'cmdname' => 'smallexample',
          'contents' => [
            {
              'contents' => [
                {
                  'parent' => {},
                  'text' => '$ wget \'http://savannah.gnu.org/cgi-bin/viewcvs/config/config/config.guess?rev=HEAD&content-type=text/plain\'
'
                },
                {
                  'parent' => {},
                  'text' => '$ wget \'http://savannah.gnu.org/cgi-bin/viewcvs/config/config/config.sub?rev=HEAD&content-type=text/plain\'
'
                }
              ],
              'parent' => {},
              'type' => 'preformatted'
            },
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'smallexample'
                    }
                  ],
                  'extra' => {
                    'spaces_after_argument' => '
'
                  },
                  'parent' => {},
                  'type' => 'line_arg'
                }
              ],
              'cmdname' => 'end',
              'extra' => {
                'spaces_before_argument' => ' ',
                'text_arg' => 'smallexample'
              },
              'parent' => {},
              'source_info' => {
                'file_name' => '',
                'line_nr' => 5,
                'macro' => ''
              }
            }
          ],
          'parent' => {},
          'source_info' => {
            'file_name' => '',
            'line_nr' => 2,
            'macro' => ''
          }
        },
        {
          'cmdname' => 'noindent',
          'parent' => {},
          'source_info' => {
            'file_name' => '',
            'line_nr' => 6,
            'macro' => ''
          }
        },
        {
          'parent' => {},
          'text' => '
',
          'type' => 'ignorable_spaces_after_command'
        },
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'Less recent versions are also present.
'
            }
          ],
          'extra' => {
            'noindent' => 1
          },
          'parent' => {},
          'type' => 'paragraph'
        }
      ],
      'parent' => {},
      'type' => 'before_node_section'
    }
  ],
  'type' => 'document_root'
};
$result_trees{'noindent_after_smallexample'}{'contents'}[0]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'noindent_after_smallexample'}{'contents'}[0]{'contents'}[0];
$result_trees{'noindent_after_smallexample'}{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'noindent_after_smallexample'}{'contents'}[0];
$result_trees{'noindent_after_smallexample'}{'contents'}[0]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'noindent_after_smallexample'}{'contents'}[0]{'contents'}[1];
$result_trees{'noindent_after_smallexample'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[0]{'parent'} = $result_trees{'noindent_after_smallexample'}{'contents'}[0]{'contents'}[1]{'contents'}[0];
$result_trees{'noindent_after_smallexample'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'noindent_after_smallexample'}{'contents'}[0]{'contents'}[1]{'contents'}[0];
$result_trees{'noindent_after_smallexample'}{'contents'}[0]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'noindent_after_smallexample'}{'contents'}[0]{'contents'}[1];
$result_trees{'noindent_after_smallexample'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'noindent_after_smallexample'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'args'}[0];
$result_trees{'noindent_after_smallexample'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'noindent_after_smallexample'}{'contents'}[0]{'contents'}[1]{'contents'}[1];
$result_trees{'noindent_after_smallexample'}{'contents'}[0]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'noindent_after_smallexample'}{'contents'}[0]{'contents'}[1];
$result_trees{'noindent_after_smallexample'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'noindent_after_smallexample'}{'contents'}[0];
$result_trees{'noindent_after_smallexample'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'noindent_after_smallexample'}{'contents'}[0];
$result_trees{'noindent_after_smallexample'}{'contents'}[0]{'contents'}[3]{'parent'} = $result_trees{'noindent_after_smallexample'}{'contents'}[0];
$result_trees{'noindent_after_smallexample'}{'contents'}[0]{'contents'}[4]{'contents'}[0]{'parent'} = $result_trees{'noindent_after_smallexample'}{'contents'}[0]{'contents'}[4];
$result_trees{'noindent_after_smallexample'}{'contents'}[0]{'contents'}[4]{'parent'} = $result_trees{'noindent_after_smallexample'}{'contents'}[0];
$result_trees{'noindent_after_smallexample'}{'contents'}[0]{'parent'} = $result_trees{'noindent_after_smallexample'};

$result_texis{'noindent_after_smallexample'} = 'To obtain.
@smallexample
$ wget \'http://savannah.gnu.org/cgi-bin/viewcvs/config/config/config.guess?rev=HEAD&content-type=text/plain\'
$ wget \'http://savannah.gnu.org/cgi-bin/viewcvs/config/config/config.sub?rev=HEAD&content-type=text/plain\'
@end smallexample
@noindent
Less recent versions are also present.
';


$result_texts{'noindent_after_smallexample'} = 'To obtain.
$ wget \'http://savannah.gnu.org/cgi-bin/viewcvs/config/config/config.guess?rev=HEAD&content-type=text/plain\'
$ wget \'http://savannah.gnu.org/cgi-bin/viewcvs/config/config/config.sub?rev=HEAD&content-type=text/plain\'
Less recent versions are also present.
';

$result_errors{'noindent_after_smallexample'} = [];


$result_floats{'noindent_after_smallexample'} = {};



$result_converted{'plaintext'}->{'noindent_after_smallexample'} = 'To obtain.
     $ wget \'http://savannah.gnu.org/cgi-bin/viewcvs/config/config/config.guess?rev=HEAD&content-type=text/plain\'
     $ wget \'http://savannah.gnu.org/cgi-bin/viewcvs/config/config/config.sub?rev=HEAD&content-type=text/plain\'
Less recent versions are also present.
';


$result_converted{'html_text'}->{'noindent_after_smallexample'} = '<p>To obtain.
</p><div class="example smallexample">
<pre class="example-preformatted">$ wget \'http://savannah.gnu.org/cgi-bin/viewcvs/config/config/config.guess?rev=HEAD&amp;content-type=text/plain\'
$ wget \'http://savannah.gnu.org/cgi-bin/viewcvs/config/config/config.sub?rev=HEAD&amp;content-type=text/plain\'
</pre></div>
<p>Less recent versions are also present.
</p>';


$result_converted{'latex'}->{'noindent_after_smallexample'} = '\\documentclass{book}
\\usepackage{amsfonts}
\\usepackage{amsmath}
\\usepackage[gen]{eurosym}
\\usepackage[T1]{fontenc}
\\usepackage{textcomp}
\\usepackage{graphicx}
\\usepackage{microtype}
\\usepackage{etoolbox}
\\usepackage{titleps}
\\usepackage{float}
% use hidelinks to remove boxes around links to be similar to Texinfo TeX
\\usepackage[hidelinks]{hyperref}
\\usepackage[utf8]{inputenc}

\\makeatletter
\\newcommand{\\GNUTexinfosettitle}{No Title}%

% redefine the \\mainmatter command such that it does not clear page
% as if in double page
\\renewcommand\\mainmatter{\\clearpage\\@mainmattertrue\\pagenumbering{arabic}}
\\newenvironment{GNUTexinfopreformatted}{%
  \\par\\GNUTobeylines\\obeyspaces\\frenchspacing\\parskip=\\z@\\parindent=\\z@}{}
{\\catcode`\\^^M=13 \\gdef\\GNUTobeylines{\\catcode`\\^^M=13 \\def^^M{\\null\\par}}}
\\newenvironment{GNUTexinfoindented}{\\begin{list}{}{}\\item\\relax}{\\end{list}}

\\AtBeginEnvironment{GNUTexinfopreformatted}{\\microtypesetup{activate=false}}

% used for substitutions in commands
\\newcommand{\\GNUTexinfoplaceholder}[1]{}

\\newpagestyle{single}{\\sethead[\\chaptername{} \\thechapter{} \\chaptertitle{}][][\\thepage]
                              {\\chaptername{} \\thechapter{} \\chaptertitle{}}{}{\\thepage}}

\\renewcommand{\\includegraphics}[1]{\\fbox{FIG \\detokenize{#1}}}

\\makeatother
% set default for @setchapternewpage
\\makeatletter
\\patchcmd{\\chapter}{\\if@openright\\cleardoublepage\\else\\clearpage\\fi}{\\GNUTexinfoplaceholder{setchapternewpage placeholder}\\clearpage}{}{}
\\makeatother
\\pagestyle{single}%

To obtain.
\\begin{GNUTexinfopreformatted}%
\\ttfamily \\footnotesize \\$ wget \'http://savannah.gnu.org/cgi-bin/viewcvs/config/config/config.guess?rev=HEAD\\&content-type=text/plain\'
\\$ wget \'http://savannah.gnu.org/cgi-bin/viewcvs/config/config/config.sub?rev=HEAD\\&content-type=text/plain\'
\\end{GNUTexinfopreformatted}
\\noindent{}Less recent versions are also present.
\\end{document}
';

1;
