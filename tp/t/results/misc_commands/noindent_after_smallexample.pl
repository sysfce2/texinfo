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
              'contents' => [],
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
                'command_argument' => 'smallexample',
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
          'extra' => {
            'end_command' => {}
          },
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
          'extra' => {
            'command' => {}
          },
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line_after_command'
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
$result_trees{'noindent_after_smallexample'}{'contents'}[0]{'contents'}[1]{'extra'}{'end_command'} = $result_trees{'noindent_after_smallexample'}{'contents'}[0]{'contents'}[1]{'contents'}[1];
$result_trees{'noindent_after_smallexample'}{'contents'}[0]{'contents'}[1]{'parent'} = $result_trees{'noindent_after_smallexample'}{'contents'}[0];
$result_trees{'noindent_after_smallexample'}{'contents'}[0]{'contents'}[2]{'parent'} = $result_trees{'noindent_after_smallexample'}{'contents'}[0];
$result_trees{'noindent_after_smallexample'}{'contents'}[0]{'contents'}[3]{'extra'}{'command'} = $result_trees{'noindent_after_smallexample'}{'contents'}[0]{'contents'}[2];
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


$result_converted{'latex_text'}->{'noindent_after_smallexample'} = 'To obtain.
\\begin{GNUTexinfopreformatted}
\\ttfamily \\footnotesize \\$ wget \'http://savannah.gnu.org/cgi-bin/viewcvs/config/config/config.guess?rev=HEAD\\&content-type=text/plain\'
\\$ wget \'http://savannah.gnu.org/cgi-bin/viewcvs/config/config/config.sub?rev=HEAD\\&content-type=text/plain\'
\\end{GNUTexinfopreformatted}
\\noindent{}Less recent versions are also present.
';

1;
