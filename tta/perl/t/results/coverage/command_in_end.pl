use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'command_in_end'} = '*document_root C1
 *before_node_section C1
  *@quotation C4 l1
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *paragraph C2
    {In quotation\\n}
    *@end C1 l3
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     *line_arg C1
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
      *@code C1 l3
       *brace_container C1
        {quotation}
   {empty_line:\\n}
   *@quotation C4 l5
    *arguments_line C1
     *block_line_arg
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
    *paragraph C2
     {In quotation\\n}
     *@end C1 l7
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
     |EXTRA
     |text_arg:{q}
      *line_arg C2
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {q}
       *@code C1 l7
        *brace_container C1
         {uotation}
    {empty_line:\\n}
    *@quotation C4 l9
     *arguments_line C1
      *block_line_arg
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
     *paragraph C2
      {In quotation\\n}
      *@end C1 l11
      |INFO
      |spaces_before_argument:
       |{spaces_before_argument: }
      |EXTRA
      |text_arg:{qu}
       *line_arg C2
       |INFO
       |spaces_after_argument:
        |{spaces_after_argument:\\n}
        {qu}
        *@code C1 l11
         *brace_container C1
          {otation}
     {empty_line:\\n}
     *@quotation C10 l13
      *arguments_line C1
       *block_line_arg
       |INFO
       |spaces_after_argument:
        |{spaces_after_argument:\\n}
      *paragraph C2
       {In quotation\\n}
       *@end C1 l15
       |INFO
       |spaces_before_argument:
        |{spaces_before_argument: }
       |EXTRA
       |text_arg:{quotn}
        *line_arg C3
        |INFO
        |spaces_after_argument:
         |{spaces_after_argument:\\n}
         {quot}
         *@asis C1 l15
          *brace_container C1
           {atio}
         {n}
      {empty_line:\\n}
      *@quotation C3 l17
       *arguments_line C1
        *block_line_arg
        |INFO
        |spaces_after_argument:
         |{spaces_after_argument:\\n}
       *paragraph C1
        {In quotation\\n}
       *@end C1 l19
       |INFO
       |spaces_before_argument:
        |{spaces_before_argument: }
       |EXTRA
       |text_arg:{quotation}
        *line_arg C3
        |INFO
        |spaces_after_argument:
         |{spaces_after_argument:\\n}
         {q}
         *@asis C1 l19
          *brace_container
         {uotation}
      {empty_line:\\n}
      *@quotation C3 l21
       *arguments_line C1
        *block_line_arg
        |INFO
        |spaces_after_argument:
         |{spaces_after_argument:\\n}
       *paragraph C1
        {In quotation\\n}
       *@end C1 l23
       |INFO
       |spaces_before_argument:
        |{spaces_before_argument: }
       |EXTRA
       |text_arg:{quotation}
        *line_arg C3
        |INFO
        |spaces_after_argument:
         |{spaces_after_argument:\\n}
         {qu}
         *@asis C1 l23
          *brace_container
         {otation}
      {empty_line:\\n}
      *@quotation C3 l25
       *arguments_line C1
        *block_line_arg
        |INFO
        |spaces_after_argument:
         |{spaces_after_argument:\\n}
       *paragraph C1
        {In quotation\\n}
       *@end C1 l27
       |INFO
       |spaces_before_argument:
        |{spaces_before_argument: }
       |EXTRA
       |text_arg:{quotation}
        *line_arg C3
        |INFO
        |spaces_after_argument:
         |{spaces_after_argument:\\n}
         {quot}
         *@asis C1 l27
          *brace_container
         {ation}
      {empty_line:\\n}
      *@verbatim C3 l29
       *arguments_line C1
        *block_line_arg
        |INFO
        |spaces_after_argument:
         |{spaces_after_argument:\\n}
       {raw:In verbatim\\n}
       {raw:@end verb@code{a}tim\\n}
';


$result_texis{'command_in_end'} = '@quotation
In quotation
@end @code{quotation}

@quotation
In quotation
@end q@code{uotation}

@quotation
In quotation
@end qu@code{otation}

@quotation
In quotation
@end quot@asis{atio}n

@quotation
In quotation
@end q@asis{}uotation

@quotation
In quotation
@end qu@asis{}otation

@quotation
In quotation
@end quot@asis{}ation

@verbatim
In verbatim
@end verb@code{a}tim
';


$result_texts{'command_in_end'} = 'In quotation

In quotation

In quotation

In quotation

In quotation

In quotation

In quotation

In verbatim
@end verb@code{a}tim
';

$result_errors{'command_in_end'} = [
  {
    'error_line' => 'warning: @code should not appear in @end
',
    'line_nr' => 3,
    'text' => '@code should not appear in @end',
    'type' => 'warning'
  },
  {
    'error_line' => 'bad argument to @end: @code{quotation}
',
    'line_nr' => 3,
    'text' => 'bad argument to @end: @code{quotation}',
    'type' => 'error'
  },
  {
    'error_line' => 'warning: @code should not appear in @end
',
    'line_nr' => 7,
    'text' => '@code should not appear in @end',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: unknown @end q
',
    'line_nr' => 7,
    'text' => 'unknown @end q',
    'type' => 'warning'
  },
  {
    'error_line' => 'bad argument to @end: q@code{uotation}
',
    'line_nr' => 7,
    'text' => 'bad argument to @end: q@code{uotation}',
    'type' => 'error'
  },
  {
    'error_line' => 'warning: @code should not appear in @end
',
    'line_nr' => 11,
    'text' => '@code should not appear in @end',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: unknown @end qu
',
    'line_nr' => 11,
    'text' => 'unknown @end qu',
    'type' => 'warning'
  },
  {
    'error_line' => 'bad argument to @end: qu@code{otation}
',
    'line_nr' => 11,
    'text' => 'bad argument to @end: qu@code{otation}',
    'type' => 'error'
  },
  {
    'error_line' => 'warning: @asis should not appear in @end
',
    'line_nr' => 15,
    'text' => '@asis should not appear in @end',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: unknown @end quotn
',
    'line_nr' => 15,
    'text' => 'unknown @end quotn',
    'type' => 'warning'
  },
  {
    'error_line' => 'bad argument to @end: quot@asis{atio}n
',
    'line_nr' => 15,
    'text' => 'bad argument to @end: quot@asis{atio}n',
    'type' => 'error'
  },
  {
    'error_line' => 'warning: @asis should not appear in @end
',
    'line_nr' => 19,
    'text' => '@asis should not appear in @end',
    'type' => 'warning'
  },
  {
    'error_line' => 'bad argument to @end: q@asis{}uotation
',
    'line_nr' => 19,
    'text' => 'bad argument to @end: q@asis{}uotation',
    'type' => 'error'
  },
  {
    'error_line' => 'warning: @asis should not appear in @end
',
    'line_nr' => 23,
    'text' => '@asis should not appear in @end',
    'type' => 'warning'
  },
  {
    'error_line' => 'bad argument to @end: qu@asis{}otation
',
    'line_nr' => 23,
    'text' => 'bad argument to @end: qu@asis{}otation',
    'type' => 'error'
  },
  {
    'error_line' => 'warning: @asis should not appear in @end
',
    'line_nr' => 27,
    'text' => '@asis should not appear in @end',
    'type' => 'warning'
  },
  {
    'error_line' => 'bad argument to @end: quot@asis{}ation
',
    'line_nr' => 27,
    'text' => 'bad argument to @end: quot@asis{}ation',
    'type' => 'error'
  },
  {
    'error_line' => 'no matching `@end verbatim\'
',
    'line_nr' => 29,
    'text' => 'no matching `@end verbatim\'',
    'type' => 'error'
  },
  {
    'error_line' => 'no matching `@end quotation\'
',
    'line_nr' => 13,
    'text' => 'no matching `@end quotation\'',
    'type' => 'error'
  },
  {
    'error_line' => 'no matching `@end quotation\'
',
    'line_nr' => 9,
    'text' => 'no matching `@end quotation\'',
    'type' => 'error'
  },
  {
    'error_line' => 'no matching `@end quotation\'
',
    'line_nr' => 5,
    'text' => 'no matching `@end quotation\'',
    'type' => 'error'
  },
  {
    'error_line' => 'no matching `@end quotation\'
',
    'line_nr' => 1,
    'text' => 'no matching `@end quotation\'',
    'type' => 'error'
  }
];


$result_nodes_list{'command_in_end'} = '';

$result_sections_list{'command_in_end'} = '';

$result_sectioning_root{'command_in_end'} = '';

$result_headings_list{'command_in_end'} = '';

1;
