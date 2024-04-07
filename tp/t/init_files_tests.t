use strict;

use lib '.';
use Texinfo::ModulePath (undef, undef, undef, 'updirs' => 2);

require 't/test_utils.pl';

my @test_cases = (
['redefined_need',
'@need 0.1
', {'init_files' => ['redefine_need.init']}],
['modified_translation',
'@error{}.

@documentlanguage fr

fr @error{}.

@documentlanguage pt

pt @error{}.

', {'init_files' => ['command_translation_modified.init']}],
['macro_defined_txiinternalvalue_in_translation',
'@sp 1

@sp 2

',{'init_files' => ['translate_txiinternalvalue_macro.init'],
}],
);

my $direction_strings_test_text = '@node Top
@top top

@node chap
@chapter Chap

@node chap2
@chapter Chap 2

@node sec1
@section Sec 1

@node sec2
@section Sec 2

@node sec3
@section Sec 3
';

my $documentation_examples_text = '
@settitle @email{someone@@example.com, me} @sansserif{in--title} @error{} @equiv{}

@contents

@node Top
@top top

@node chapter
@chapter Chapter

@sansserif{in--text} @- p--n. @error{} @equiv{}
@xref{my node}@footnote{in footnote}.
@titlefont{in titlefont}
@email{a@@b.c, someone}
@sc{in Sc}
@var{in var}

@math{@sansserif{in--math} @- a=b @error{} @equiv{}}

@indentedblock
@example
@sansserif{in--example} @- c. @error{} @equiv{}
@email{a@@example}
@end example
@end indentedblock

@display
@email{a@@display}
@end display

@cindex @file{e1}
@cindex i2

@vindex    

@documentlanguage fr

@error{}.

@equiv{}

@contents

@node my node
@chapter New node

@documentlanguage pl

@error{}.

@equiv{}

@node Index
@appendix Index

@printindex cp

';

my @file_tests = (
['customize_translations',
'
@contents

@node Top
@top top

@node Chapter
@chapter chap

@error{}.

@documentlanguage fr
@node Chapter fr
@chapter chap fr

@error{}.

@node section fr
@section sec fr

@documentlanguage de
@node Chapter de
@chapter chap de

@error{}.

@node Last chapter
@chapter Last Chapter

', {'init_files' => ['translated_strings_customization.pm']},
   {'SPLIT' => 'chapter'}],
['undefined_node_filename',
'@node Top

@node chap Other
',{'init_files' => ['undef_node_file_name.init'],
}, {'VERBOSE' => 1}],
['customize_special_element',
'
@contents
@shortcontents

@node Top
@top top

@node Chapter
@chapter chap

@documentlanguage fr
@node Chapter fr
@chapter chap fr

Text@footnote{In footnote}.
', {'init_files' => ['special_element_customization.pm']}],
['documentation_examples',
$documentation_examples_text,
{'init_files' => ['documentation_examples.pm']},
],
['documentation_examples_texi2html',
$documentation_examples_text,
{'init_files' => ['documentation_examples.pm']},
{'TEXI2HTML' => 1, 'CONTENTS_OUTPUT_LOCATION' => 'inline'},
],
['sc_formatting_with_css',
'@settitle{In title @sc{my string} NEXT}

@sc{in sc}. OUT.

@example
@sc{small case in example} MORE text.
@end example

',{'init_files' => ['sc_formatting_with_css.pm']},
],
# tests translation in parser of def object type index entry, when already
# in a translation (of the Next button).
['translation_in_parser_in_translation',
'@documentlanguage fr

@node Top
@top top

@node chap
@chapter Chap

@deftypeop da db dc dd de
DOC
@end deftypeop

', {'init_files' => ['translation_in_parser_in_translation.pm']}],
# usefull to setup a base for comparison with the next test
['directions_string_base',
$direction_strings_test_text,],
['directions_string_undef',
$direction_strings_test_text,
{'init_files' => ['directions_string_undef.pm']},],
# test texi2html style buttons and directions strings undef
['directions_string_undef_texi2html',
$direction_strings_test_text,
{'init_files' => ['directions_string_undef.pm']},
{'TEXI2HTML' => 1},
],
['redefined_buttons_functions',
$direction_strings_test_text,
{'init_files' => ['redefined_buttons.pm']},
],
);

foreach my $test (@test_cases) {
  push @{$test->[2]->{'test_formats'}}, 'html';
}

foreach my $test (@file_tests) {
  push @{$test->[2]->{'test_formats'}}, 'file_html';
  $test->[2]->{'test_input_file_name'} = $test->[0] . '.texi';
  $test->[2]->{'full_document'} = 1 unless (exists($test->[2]->{'full_document'}));
}

run_all('init_files_tests', [@test_cases, @file_tests]);
