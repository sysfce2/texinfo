use vars qw(%result_texis %result_texts %result_trees %result_errors 
   %result_indices %result_sectioning %result_nodes %result_menus
   %result_floats %result_converted %result_converted_errors 
   %result_elements %result_directions_text %result_indices_sort_strings);

use utf8;

$result_trees{'sc_with_utf8_enable_encoding'} = {
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
          'contents' => [
            {
              'cmdname' => 'sc',
              'contents' => [
                {
                  'contents' => [
                    {
                      'text' => 'in sc'
                    }
                  ],
                  'type' => 'brace_container'
                }
              ],
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

$result_texis{'sc_with_utf8_enable_encoding'} = '@documentencoding utf-8
@sc{in sc}.
';


$result_texts{'sc_with_utf8_enable_encoding'} = 'IN SC.
';

$result_errors{'sc_with_utf8_enable_encoding'} = [];


$result_floats{'sc_with_utf8_enable_encoding'} = {};



$result_converted{'plaintext'}->{'sc_with_utf8_enable_encoding'} = 'IN SC.
';

1;
