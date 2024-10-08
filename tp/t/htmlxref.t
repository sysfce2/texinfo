use strict;

use lib '.';
use Texinfo::ModulePath (undef, undef, undef, 'updirs' => 2);

require 't/test_utils.pl';

my @test_cases = (
['htmlxref',
  undef, {'test_file' => 'test_refs.texi' },
  {'HTMLXREF_FILE' => 'htmlxref-test.cnf',
   'SPLIT' => '', 'NODE_NAME_IN_MENU' => 0,
   'USE_NODES' => 0}
],
['htmlxref_nodes',
  undef, {'test_file' => 'test_refs.texi' },
  {'HTMLXREF_FILE' => 'htmlxref-test.cnf',
   'SPLIT' => 'node',,
   'USE_NODES' => 1}
],
['htmlxref_only_mono',
  undef, {'test_file' => 'test_refs.texi' },
  {'HTMLXREF_FILE' => 'htmlxref-mono.cnf',
   'SPLIT' => '', 'NODE_NAME_IN_MENU' => 0,
   'USE_NODES' => 0}
],
['htmlxref_only_mono_nodes',
  undef, {'test_file' => 'test_refs.texi' },
  {'HTMLXREF_FILE' => 'htmlxref-mono.cnf',
   'SPLIT' => 'node',
   'USE_NODES' => 1}
],
['htmlxref_only_split',
  undef, {'test_file' => 'test_refs.texi' },
  {'HTMLXREF_FILE' => 'htmlxref-split.cnf',
   'SPLIT' => '', 'NODE_NAME_IN_MENU' => 0,
   'USE_NODES' => 0}
],
['htmlxref_only_split_nodes',
  undef, {'test_file' => 'test_refs.texi' },
  {'HTMLXREF_FILE' => 'htmlxref-split.cnf',
   'SPLIT' => 'node',
   'USE_NODES' => 1}
],
['htmlxref_no_urlprefix_first',
'@node top
@top top

@node chap
@chapter Chap

@xref{,,,manual}.

@xref{,,,manual2}.

',
{'full_document' => 1,
 'test_input_file_name' => 'htmlxref_no_urlprefix_first.texi'},
{'HTMLXREF_FILE' => 'htmlxref-no_urlprefix_first.cnf'}
],

);

foreach my $test (@test_cases) {
  push @{$test->[2]->{'test_formats'}}, 'file_html';
  $test->[3]->{'FORMAT_MENU'} = 'menu';
}

our ($arg_test_case, $arg_generate, $arg_debug);

run_all('htmlxref', [@test_cases]);
