use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'utf8_enable_encoding'} = {
  'contents' => [
    {
      'contents' => [
        {
          'cmdname' => 'documentencoding',
          'contents' => [
            {
              'contents' => [
                {
                  'text' => 'utf-8'
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
            'input_encoding_name' => 'utf-8',
            'text_arg' => 'utf-8'
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
          'text' => '
',
          'type' => 'empty_line'
        },
        {
          'contents' => [
            {
              'text' => 'AA '
            },
            {
              'cmdname' => '^',
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
                'line_nr' => 3
              }
            },
            {
              'text' => ' --- -- \'` \'\' ``'
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

$result_texis{'utf8_enable_encoding'} = '@documentencoding utf-8

AA @^e --- -- \'` \'\' ``';


$result_texts{'utf8_enable_encoding'} = '
AA e^ -- - \'` " "';

$result_errors{'utf8_enable_encoding'} = [];


$result_floats{'utf8_enable_encoding'} = {};



$result_converted{'html_text'}->{'utf8_enable_encoding'} = '
<p>AA ê — – ’‘ ” “</p>';

1;
