use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'verb_in_xref'} = {
  'contents' => [
    {
      'parent' => {},
      'type' => 'before_node_section'
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'Top'
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
      'cmdname' => 'node',
      'contents' => [
        {
          'parent' => {},
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'contents' => [
            {
              'args' => [
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'Top'
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                },
                {
                  'contents' => [
                    {
                      'args' => [
                        {
                          'contents' => [
                            {
                              'parent' => {},
                              'text' => 'with
',
                              'type' => 'raw'
                            },
                            {
                              'parent' => {},
                              'text' => 'verb
',
                              'type' => 'raw'
                            },
                            {
                              'parent' => {},
                              'text' => '
',
                              'type' => 'raw'
                            },
                            {
                              'parent' => {},
                              'text' => 'ggg ',
                              'type' => 'raw'
                            }
                          ],
                          'parent' => {},
                          'type' => 'brace_command_arg'
                        }
                      ],
                      'cmdname' => 'verb',
                      'extra' => {
                        'delimiter' => '*'
                      },
                      'parent' => {},
                      'source_info' => {
                        'file_name' => '',
                        'line_nr' => 3,
                        'macro' => ''
                      }
                    }
                  ],
                  'extra' => {
                    'spaces_before_argument' => ' '
                  },
                  'parent' => {},
                  'type' => 'brace_command_arg'
                }
              ],
              'cmdname' => 'xref',
              'extra' => {
                'label' => {},
                'node_argument' => {
                  'node_content' => [
                    {}
                  ],
                  'normalized' => 'Top'
                }
              },
              'parent' => {},
              'source_info' => {
                'file_name' => '',
                'line_nr' => 3,
                'macro' => ''
              }
            },
            {
              'parent' => {},
              'text' => '.
'
            }
          ],
          'parent' => {},
          'type' => 'paragraph'
        }
      ],
      'extra' => {
        'node_content' => [
          {}
        ],
        'nodes_manuals' => [
          {
            'node_content' => [
              {}
            ],
            'normalized' => 'Top'
          }
        ],
        'normalized' => 'Top',
        'spaces_before_argument' => ' '
      },
      'parent' => {},
      'source_info' => {
        'file_name' => '',
        'line_nr' => 1,
        'macro' => ''
      }
    }
  ],
  'type' => 'document_root'
};
$result_trees{'verb_in_xref'}{'contents'}[0]{'parent'} = $result_trees{'verb_in_xref'};
$result_trees{'verb_in_xref'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'verb_in_xref'}{'contents'}[1]{'args'}[0];
$result_trees{'verb_in_xref'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'verb_in_xref'}{'contents'}[1];
$result_trees{'verb_in_xref'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'verb_in_xref'}{'contents'}[1];
$result_trees{'verb_in_xref'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'verb_in_xref'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[0];
$result_trees{'verb_in_xref'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'verb_in_xref'}{'contents'}[1]{'contents'}[1]{'contents'}[0];
$result_trees{'verb_in_xref'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[1]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'verb_in_xref'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[1]{'contents'}[0]{'args'}[0];
$result_trees{'verb_in_xref'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[1]{'contents'}[0]{'args'}[0]{'contents'}[1]{'parent'} = $result_trees{'verb_in_xref'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[1]{'contents'}[0]{'args'}[0];
$result_trees{'verb_in_xref'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[1]{'contents'}[0]{'args'}[0]{'contents'}[2]{'parent'} = $result_trees{'verb_in_xref'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[1]{'contents'}[0]{'args'}[0];
$result_trees{'verb_in_xref'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[1]{'contents'}[0]{'args'}[0]{'contents'}[3]{'parent'} = $result_trees{'verb_in_xref'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[1]{'contents'}[0]{'args'}[0];
$result_trees{'verb_in_xref'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[1]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'verb_in_xref'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[1]{'contents'}[0];
$result_trees{'verb_in_xref'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'verb_in_xref'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[1];
$result_trees{'verb_in_xref'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[1]{'parent'} = $result_trees{'verb_in_xref'}{'contents'}[1]{'contents'}[1]{'contents'}[0];
$result_trees{'verb_in_xref'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'extra'}{'label'} = $result_trees{'verb_in_xref'}{'contents'}[1];
$result_trees{'verb_in_xref'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'extra'}{'node_argument'}{'node_content'}[0] = $result_trees{'verb_in_xref'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[0];
$result_trees{'verb_in_xref'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'verb_in_xref'}{'contents'}[1]{'contents'}[1];
$result_trees{'verb_in_xref'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'verb_in_xref'}{'contents'}[1]{'contents'}[1];
$result_trees{'verb_in_xref'}{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'verb_in_xref'}{'contents'}[1];
$result_trees{'verb_in_xref'}{'contents'}[1]{'extra'}{'node_content'}[0] = $result_trees{'verb_in_xref'}{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'verb_in_xref'}{'contents'}[1]{'extra'}{'nodes_manuals'}[0]{'node_content'}[0] = $result_trees{'verb_in_xref'}{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'verb_in_xref'}{'contents'}[1]{'parent'} = $result_trees{'verb_in_xref'};

$result_texis{'verb_in_xref'} = '@node Top

@xref{Top, @verb{*with
verb

ggg *}}.
';


$result_texts{'verb_in_xref'} = '
Top.
';

$result_nodes{'verb_in_xref'} = {
  'cmdname' => 'node',
  'extra' => {
    'normalized' => 'Top'
  }
};

$result_menus{'verb_in_xref'} = {
  'cmdname' => 'node',
  'extra' => {
    'normalized' => 'Top'
  }
};

$result_errors{'verb_in_xref'} = [
  {
    'error_line' => 'warning: @verb should not appear in @xref
',
    'file_name' => '',
    'line_nr' => 3,
    'macro' => '',
    'text' => '@verb should not appear in @xref',
    'type' => 'warning'
  }
];


$result_floats{'verb_in_xref'} = {};



$result_converted{'plaintext'}->{'verb_in_xref'} = '*Note with
verb

ggg : Top.
';


$result_converted{'html_text'}->{'verb_in_xref'} = '<h1 class="node" id="Top">Top</h1>

<p>See <a class="xref" href="#Top"><code class="verb">with
verb

ggg </code></a>.
</p>';


$result_converted{'latex_text'}->{'verb_in_xref'} = '\\label{anchor:Top}%
';

1;
