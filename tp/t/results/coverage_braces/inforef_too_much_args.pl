use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'inforef_too_much_args'} = {
  'contents' => [
    {
      'contents' => [],
      'parent' => {},
      'type' => 'before_node_section'
    },
    {
      'args' => [
        {
          'contents' => [
            {
              'parent' => {},
              'text' => 'chapter'
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
                      'text' => 'chapter'
                    }
                  ],
                  'parent' => {},
                  'type' => 'brace_command_arg'
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'cross ref name'
                    }
                  ],
                  'extra' => {
                    'spaces_before_argument' => ' '
                  },
                  'parent' => {},
                  'type' => 'brace_command_arg'
                },
                {
                  'contents' => [
                    {
                      'parent' => {},
                      'text' => 'file name, spurious arg'
                    }
                  ],
                  'extra' => {
                    'spaces_before_argument' => ' '
                  },
                  'parent' => {},
                  'type' => 'brace_command_arg'
                }
              ],
              'cmdname' => 'inforef',
              'contents' => [],
              'extra' => {
                'node_argument' => {
                  'node_content' => [
                    {}
                  ]
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
              'text' => '
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
            'normalized' => 'chapter'
          }
        ],
        'normalized' => 'chapter',
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
$result_trees{'inforef_too_much_args'}{'contents'}[0]{'parent'} = $result_trees{'inforef_too_much_args'};
$result_trees{'inforef_too_much_args'}{'contents'}[1]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'inforef_too_much_args'}{'contents'}[1]{'args'}[0];
$result_trees{'inforef_too_much_args'}{'contents'}[1]{'args'}[0]{'parent'} = $result_trees{'inforef_too_much_args'}{'contents'}[1];
$result_trees{'inforef_too_much_args'}{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'inforef_too_much_args'}{'contents'}[1];
$result_trees{'inforef_too_much_args'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[0]{'parent'} = $result_trees{'inforef_too_much_args'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[0];
$result_trees{'inforef_too_much_args'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[0]{'parent'} = $result_trees{'inforef_too_much_args'}{'contents'}[1]{'contents'}[1]{'contents'}[0];
$result_trees{'inforef_too_much_args'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[1]{'contents'}[0]{'parent'} = $result_trees{'inforef_too_much_args'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[1];
$result_trees{'inforef_too_much_args'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[1]{'parent'} = $result_trees{'inforef_too_much_args'}{'contents'}[1]{'contents'}[1]{'contents'}[0];
$result_trees{'inforef_too_much_args'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[2]{'contents'}[0]{'parent'} = $result_trees{'inforef_too_much_args'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[2];
$result_trees{'inforef_too_much_args'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[2]{'parent'} = $result_trees{'inforef_too_much_args'}{'contents'}[1]{'contents'}[1]{'contents'}[0];
$result_trees{'inforef_too_much_args'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'extra'}{'node_argument'}{'node_content'}[0] = $result_trees{'inforef_too_much_args'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'args'}[0]{'contents'}[0];
$result_trees{'inforef_too_much_args'}{'contents'}[1]{'contents'}[1]{'contents'}[0]{'parent'} = $result_trees{'inforef_too_much_args'}{'contents'}[1]{'contents'}[1];
$result_trees{'inforef_too_much_args'}{'contents'}[1]{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'inforef_too_much_args'}{'contents'}[1]{'contents'}[1];
$result_trees{'inforef_too_much_args'}{'contents'}[1]{'contents'}[1]{'parent'} = $result_trees{'inforef_too_much_args'}{'contents'}[1];
$result_trees{'inforef_too_much_args'}{'contents'}[1]{'extra'}{'node_content'}[0] = $result_trees{'inforef_too_much_args'}{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'inforef_too_much_args'}{'contents'}[1]{'extra'}{'nodes_manuals'}[0]{'node_content'}[0] = $result_trees{'inforef_too_much_args'}{'contents'}[1]{'args'}[0]{'contents'}[0];
$result_trees{'inforef_too_much_args'}{'contents'}[1]{'parent'} = $result_trees{'inforef_too_much_args'};

$result_texis{'inforef_too_much_args'} = '@node chapter

@inforef{chapter, cross ref name, file name, spurious arg}
';


$result_texts{'inforef_too_much_args'} = '
chapter
';

$result_nodes{'inforef_too_much_args'} = {
  'cmdname' => 'node',
  'extra' => {
    'normalized' => 'chapter'
  }
};

$result_menus{'inforef_too_much_args'} = {
  'cmdname' => 'node',
  'extra' => {
    'normalized' => 'chapter'
  }
};

$result_errors{'inforef_too_much_args'} = [
  {
    'error_line' => 'warning: @inforef is obsolete.
',
    'file_name' => '',
    'line_nr' => 3,
    'macro' => '',
    'text' => '@inforef is obsolete.',
    'type' => 'warning'
  }
];


$result_floats{'inforef_too_much_args'} = {};



$result_converted{'plaintext'}->{'inforef_too_much_args'} = '*note cross ref name: (file name, spurious arg)chapter.
';


$result_converted{'html_text'}->{'inforef_too_much_args'} = '<h4 class="node" id="chapter">chapter</h4>

<p>See <a data-manual="file name, spurious arg" href="file%20name%2c%20spurious%20arg.html#chapter">(file name, spurious arg)cross ref name</a>
</p>';

1;
