use strict;

use lib '.';
use Texinfo::ModulePath (undef, undef, 'updirs' => 2);

require 't/test_utils.pl';

my @test_cases = (
['kbdinputstyle_and_kbd',
'
@kbd{default kbdinputstyle}
@example
@kbd{in example default kbdinputstyle}
@end example

@kbdinputstyle code
@kbd{code kbdinputstyle}
@example
@kbd{in example code kbdinputstyle}
@end example

@kbdinputstyle example
@kbd{example kbdinputstyle}
@example
@kbd{in example example kbdinputstyle}
@end example

@kbdinputstyle distinct
@kbd{distinct kbdinputstyle}
@example
@kbd{in example distinct kbdinputstyle}
@end example
'],
);

my @file_tests = (
['settitle_and_headings',
'@setfilename settitle_and_headings.info
@settitle Title @* for a manual

@headings double

@chapter chap
'],
# default case
['titlepage_and_headings',
'@setfilename titlepage_and_headings.info

@titlepage
in titlepage
@end titlepage

'],
# note that those tests with 'latex' do not really correspond to
# what happens for real documents, as in real documents,
# LaTeX default (start chapter on odd page) is switched
# to Texinfo default (@setchapternewpage on).  With 'file_latex',
# the correspond to the actual output
['titlepage_and_setchapternewpage_odd',
'@setfilename titlepage_and_setchapternewpage_odd.info

@setchapternewpage odd

@titlepage
in titlepage
@end titlepage

'],
['no_titlepage_and_setchapternewpage_odd',
'@setfilename no_titlepage_and_setchapternewpage_odd.info
@setchapternewpage odd
'],
['titlepage_and_setchapternewpage_on',
'@setfilename titlepage_and_setchapternewpage_on.info
@setchapternewpage on

@titlepage
in titlepage
@end titlepage

'],
['no_titlepage_and_setchapternewpage_on',
'@setfilename no_titlepage_and_setchapternewpage_on.info
@setchapternewpage on
'],
['two_setchapternewpage_odd_on',
'@setfilename two_setchapternewpage_odd_on.info
@setchapternewpage odd

@setchapternewpage on
'],
['two_setchapternewpage_on_odd',
'@setfilename two_setchapternewpage_on_odd.info
@setchapternewpage on

@setchapternewpage odd
'],
['three_setchapternewpage_on_odd_off',
'@setfilename three_setchapternewpage_on_odd_off.info
@setchapternewpage on

@setchapternewpage odd

@setchapternewpage off
'],
# With 'latex' test type this is more like what would actually 
# happen in the default case with output to a file, switching
# to @setchapternewpage on in preamble, then odd and then the
# title page
['setchapternewpage_on_odd_titlepage',
'@setfilename setchapternewpage_on_odd_titlepage.info
@setchapternewpage on

@setchapternewpage odd

@titlepage
in titlepage
@end titlepage
'],
['titlepage_in_top_node',
'@setfilename titlepage_in_top_node.info

@node Top
@top top sectionning

In top

@titlepage
@title the TTitle
@end titlepage

@node chap
@chapter chap

in chap
'],
['titlepage_no_author',
'@setfilename titlepage_no_author.info
@titlepage
@title Some manual tested
@end titlepage

@node Top
@top section top

@node chapter
@chapter Chapter

In chapter
'],
['titlepage_no_title',
'@setfilename titlepage_no_title.info
@titlepage
@titlefont{Some manual tested}

@author Some Author
@end titlepage

@node Top
@top section top

@node chapter
@chapter Chapter

In chapter
'],
['titlepage_long_title',
'@setfilename titlepage_long_title.info
@titlepage
@title a title than is long, very long, veeeeeeeeeeeeeeeeery long, it seems to never stop and it is not so interesting only very long oh an end of line @* and the title continue and keep on being unfinished until it is the end

@end titlepage

@node Top
@top section top

@node chapter
@chapter Chapter

In chapter
'],
# FIXME texi2pdf output has a blank page after the main title page
# thanks to the second page, while two newpage do not produce two pages
['titlepage_classical',
'@setfilename titlepage_classical.info

@copying
in Copying
@end copying

@titlepage
@title Some manual tested
@subtitle Subtitle manual tested
@subtitle Subtitle 2 manual tested
@author First author
@author Second author

@page
@c The following two commands start the copyright page.
@page
@vskip 0pt plus 1filll
@insertcopying
@end titlepage

@node Top
@top section top

@node chapter
@chapter Chapter

In chapter

'],
['titlepage_with_commands_classical',
'@setfilename titlepage_with_commands_classical.info

@copying
in Copying
@end copying

@titlepage
@title Some manual @* tested
@subtitle Subtitle manual @* tested
@subtitle Subtitle 2 manual @* tested
@author First @* author
@author Second @* author@footnote{Something
about the address of author.

Something about the life. 
@displaymath
\frac{a}{b}
@end displaymath
}
@page
@c The following two commands start the copyright page.
@page
@vskip 0pt plus 1filll
@insertcopying
@end titlepage

@node Top
@top section top

@node chapter
@chapter Chapter

In chapter

']
);

foreach my $test (@test_cases) {
  $test->[2]->{'test_formats'} = ['latex'];
}

foreach my $test (@file_tests) {
  $test->[2]->{'test_formats'} = ['latex', 'file_latex'];
}

our ($arg_test_case, $arg_generate, $arg_debug);

run_all ('latex_tests', [@test_cases, @file_tests], $arg_test_case,
   $arg_generate, $arg_debug);

1;
