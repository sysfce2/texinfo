use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'shortcontents_no_top'} = {
  'contents' => [
    {
      'type' => 'before_node_section'
    },
    {
      'cmdname' => 'chapter',
      'contents' => [
        {
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'chap'
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
        },
        {
          'text' => '
',
          'type' => 'empty_line'
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
        'line_nr' => 1
      }
    },
    {
      'cmdname' => 'chapter',
      'contents' => [
        {
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'chap2'
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
        },
        {
          'text' => '
',
          'type' => 'empty_line'
        }
      ],
      'extra' => {
        'section_number' => '2'
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
      'cmdname' => 'section',
      'contents' => [
        {
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'sec'
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
        },
        {
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'cmdname' => 'shortcontents',
          'contents' => [
            {
              'text' => '
',
              'type' => 'rawline_arg'
            }
          ],
          'extra' => {},
          'source_info' => {
            'line_nr' => 7
          }
        }
      ],
      'extra' => {
        'section_number' => '2.1'
      },
      'info' => {
        'spaces_before_argument' => {
          'text' => ' '
        }
      },
      'source_info' => {
        'line_nr' => 5
      }
    }
  ],
  'type' => 'document_root'
};

$result_texis{'shortcontents_no_top'} = '@chapter chap

@chapter chap2

@section sec

@shortcontents
';


$result_texts{'shortcontents_no_top'} = '1 chap
******

2 chap2
*******

2.1 sec
=======

';

$result_sectioning{'shortcontents_no_top'} = {
  'extra' => {
    'section_childs' => [
      {
        'cmdname' => 'chapter',
        'extra' => {
          'section_directions' => {},
          'section_level' => 1,
          'section_number' => '1',
          'sectioning_root' => {},
          'toplevel_directions' => {}
        }
      },
      {
        'cmdname' => 'chapter',
        'extra' => {
          'section_childs' => [
            {
              'cmdname' => 'section',
              'extra' => {
                'section_directions' => {
                  'up' => {}
                },
                'section_level' => 2,
                'section_number' => '2.1'
              }
            }
          ],
          'section_directions' => {
            'prev' => {}
          },
          'section_level' => 1,
          'section_number' => '2',
          'toplevel_directions' => {
            'prev' => {}
          }
        }
      }
    ],
    'section_level' => 0
  }
};
$result_sectioning{'shortcontents_no_top'}{'extra'}{'section_childs'}[0]{'extra'}{'sectioning_root'} = $result_sectioning{'shortcontents_no_top'};
$result_sectioning{'shortcontents_no_top'}{'extra'}{'section_childs'}[1]{'extra'}{'section_childs'}[0]{'extra'}{'section_directions'}{'up'} = $result_sectioning{'shortcontents_no_top'}{'extra'}{'section_childs'}[1];
$result_sectioning{'shortcontents_no_top'}{'extra'}{'section_childs'}[1]{'extra'}{'section_directions'}{'prev'} = $result_sectioning{'shortcontents_no_top'}{'extra'}{'section_childs'}[0];
$result_sectioning{'shortcontents_no_top'}{'extra'}{'section_childs'}[1]{'extra'}{'toplevel_directions'}{'prev'} = $result_sectioning{'shortcontents_no_top'}{'extra'}{'section_childs'}[0];

$result_errors{'shortcontents_no_top'} = [];


$result_floats{'shortcontents_no_top'} = {};



$result_converted{'html'}->{'shortcontents_no_top'} = '<!DOCTYPE html>
<html>
<!-- Created by texinfo, https://www.gnu.org/software/texinfo/ -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Untitled Document</title>

<meta name="description" content="Untitled Document">
<meta name="keywords" content="Untitled Document">
<meta name="resource-type" content="document">
<meta name="distribution" content="global">
<meta name="viewport" content="width=device-width,initial-scale=1">

<style type="text/css">
<!--
a.copiable-link {visibility: hidden; text-decoration: none; line-height: 0em}
span:hover a.copiable-link {visibility: visible}
ul.toc-numbered-mark {list-style: none}
-->
</style>


</head>

<body lang="en">
<div class="chapter-level-extent" id="chap">
<h2 class="chapter"><span>1 chap<a class="copiable-link" href="#chap"> &para;</a></span></h2>

</div>
<div class="chapter-level-extent" id="chap2">
<h2 class="chapter"><span>2 chap2<a class="copiable-link" href="#chap2"> &para;</a></span></h2>

<ul class="mini-toc">
<li><a href="#sec" accesskey="1">sec</a></li>
</ul>
<div class="section-level-extent" id="sec">
<h3 class="section"><span>2.1 sec<a class="copiable-link" href="#sec"> &para;</a></span></h3>

<div class="region-shortcontents" id="SEC_Shortcontents">
<h2 class="shortcontents-heading">Short Table of Contents</h2>

<div class="shortcontents">
<ul class="toc-numbered-mark">
<li><a id="stoc-chap" href="#chap">1 chap</a></li>
<li><a id="stoc-chap2" href="#chap2">2 chap2</a></li>

</ul>
</div>
</div>
</div>
</div>



</body>
</html>
';

$result_converted_errors{'html'}->{'shortcontents_no_top'} = [
  {
    'error_line' => 'warning: must specify a title with a title command or @top
',
    'text' => 'must specify a title with a title command or @top',
    'type' => 'warning'
  }
];


1;
