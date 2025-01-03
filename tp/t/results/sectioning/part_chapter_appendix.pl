use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'part_chapter_appendix'} = {
  'contents' => [
    {
      'contents' => [
        {
          'text' => '
',
          'type' => 'empty_line'
        }
      ],
      'type' => 'before_node_section'
    },
    {
      'cmdname' => 'part',
      'contents' => [
        {
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'Part 1'
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
      'extra' => {},
      'info' => {
        'spaces_before_argument' => {
          'text' => ' '
        }
      },
      'source_info' => {
        'line_nr' => 2
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
                  'text' => 'chapter'
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
        'associated_part' => {},
        'section_number' => '1'
      },
      'info' => {
        'spaces_before_argument' => {
          'text' => ' '
        }
      },
      'source_info' => {
        'line_nr' => 4
      }
    },
    {
      'cmdname' => 'appendix',
      'contents' => [
        {
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'Appendix'
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
        'section_number' => 'A'
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
  'type' => 'document_root'
};
$result_trees{'part_chapter_appendix'}{'contents'}[2]{'extra'}{'associated_part'} = $result_trees{'part_chapter_appendix'}{'contents'}[1];

$result_texis{'part_chapter_appendix'} = '
@part Part 1

@chapter chapter

@appendix Appendix
';


$result_texts{'part_chapter_appendix'} = '
Part 1
******

1 chapter
*********

Appendix A Appendix
*******************
';

$result_sectioning{'part_chapter_appendix'} = {
  'extra' => {
    'section_childs' => [
      {
        'cmdname' => 'part',
        'extra' => {
          'part_associated_section' => {
            'cmdname' => 'chapter',
            'extra' => {
              'associated_part' => {},
              'section_directions' => {
                'up' => {}
              },
              'section_level' => 1,
              'section_number' => '1',
              'toplevel_directions' => {}
            }
          },
          'section_childs' => [
            {}
          ],
          'section_directions' => {},
          'section_level' => 0,
          'sectioning_root' => {}
        }
      },
      {
        'cmdname' => 'appendix',
        'extra' => {
          'section_directions' => {
            'prev' => {}
          },
          'section_level' => 1,
          'section_number' => 'A',
          'toplevel_directions' => {
            'prev' => {}
          }
        }
      }
    ],
    'section_level' => -1
  }
};
$result_sectioning{'part_chapter_appendix'}{'extra'}{'section_childs'}[0]{'extra'}{'part_associated_section'}{'extra'}{'associated_part'} = $result_sectioning{'part_chapter_appendix'}{'extra'}{'section_childs'}[0];
$result_sectioning{'part_chapter_appendix'}{'extra'}{'section_childs'}[0]{'extra'}{'part_associated_section'}{'extra'}{'section_directions'}{'up'} = $result_sectioning{'part_chapter_appendix'}{'extra'}{'section_childs'}[0];
$result_sectioning{'part_chapter_appendix'}{'extra'}{'section_childs'}[0]{'extra'}{'section_childs'}[0] = $result_sectioning{'part_chapter_appendix'}{'extra'}{'section_childs'}[0]{'extra'}{'part_associated_section'};
$result_sectioning{'part_chapter_appendix'}{'extra'}{'section_childs'}[0]{'extra'}{'sectioning_root'} = $result_sectioning{'part_chapter_appendix'};
$result_sectioning{'part_chapter_appendix'}{'extra'}{'section_childs'}[1]{'extra'}{'section_directions'}{'prev'} = $result_sectioning{'part_chapter_appendix'}{'extra'}{'section_childs'}[0];
$result_sectioning{'part_chapter_appendix'}{'extra'}{'section_childs'}[1]{'extra'}{'toplevel_directions'}{'prev'} = $result_sectioning{'part_chapter_appendix'}{'extra'}{'section_childs'}[0]{'extra'}{'part_associated_section'};

$result_errors{'part_chapter_appendix'} = [];


$result_floats{'part_chapter_appendix'} = {};



$result_converted{'xml'}->{'part_chapter_appendix'} = '
<part spaces=" "><sectiontitle>Part 1</sectiontitle>

<chapter spaces=" "><sectiontitle>chapter</sectiontitle>

</chapter>
</part>
<appendix spaces=" "><sectiontitle>Appendix</sectiontitle>
</appendix>
';

1;
