/* This file automatically generated by command_data.awk */
#ifndef COMMAND_IDS_H
#define COMMAND_IDS_H

/* Useful aliases */
#define CM_hex_09 CM_TAB
#define CM_hex_0a CM_NEWLINE
#define CM_hex_20 CM_SPACE
#define CM_hex_21 CM_EXCLAMATION_MARK
#define CM_hex_22 CM_POUND_SIGN
#define CM_hex_27 CM_APOSTROPHE
#define CM_hex_2a CM_ASTERISK
#define CM_hex_2c CM_COMMA
#define CM_hex_2d CM_HYPHEN
#define CM_hex_2e CM_FULL_STOP
#define CM_hex_2f CM_SLASH
#define CM_hex_3a CM_COLON
#define CM_hex_3d CM_EQUALS
#define CM_hex_3f CM_QUESTION_MARK
#define CM_hex_40 CM_AT_SIGN
#define CM_hex_5c CM_BACKSLASH
#define CM_hex_5e CM_CIRCUMFLEX
#define CM_hex_60 CM_BACKQUOTE
#define CM_hex_7b CM_OPEN_BRACE
#define CM_hex_7c CM_VERTICAL_BAR
#define CM_hex_7d CM_CLOSE_BRACE
#define CM_hex_7e CM_TILDE

/* Defined on MS-Windows */
#undef CM_NONE

enum command_id {
CM_NONE,

CM_hex_09,
CM_hex_0a,
CM_hex_20,
CM_hex_21,
CM_hex_22,
CM_hex_26,
CM_hex_27,
CM_hex_2a,
CM_hex_2c,
CM_hex_2d,
CM_hex_2e,
CM_hex_2f,
CM_hex_3a,
CM_hex_3d,
CM_hex_3f,
CM_hex_40,
CM_AA,
CM_AE,
CM_DH,
CM_H,
CM_L,
CM_LaTeX,
CM_O,
CM_OE,
CM_TH,
CM_TeX,
CM_U,
CM_hex_5c,
CM_hex_5e,
CM_hex_60,
CM_aa,
CM_abbr,
CM_acronym,
CM_ae,
CM_afivepaper,
CM_afourlatex,
CM_afourpaper,
CM_afourwide,
CM_alias,
CM_allowcodebreaks,
CM_ampchar,
CM_anchor,
CM_appendix,
CM_appendixsec,
CM_appendixsection,
CM_appendixsubsec,
CM_appendixsubsubsec,
CM_arrow,
CM_asis,
CM_atchar,
CM_author,
CM_b,
CM_backslashchar,
CM_bsixpaper,
CM_bullet,
CM_bye,
CM_c,
CM_caption,
CM_cartouche,
CM_center,
CM_centerchap,
CM_chapheading,
CM_chapter,
CM_cite,
CM_clear,
CM_click,
CM_clicksequence,
CM_clickstyle,
CM_code,
CM_codequotebacktick,
CM_codequoteundirected,
CM_columnfractions,
CM_comma,
CM_command,
CM_comment,
CM_contents,
CM_copying,
CM_copyright,
CM_defblock,
CM_defcodeindex,
CM_defcv,
CM_defcvx,
CM_deffn,
CM_deffnx,
CM_defindex,
CM_definfoenclose,
CM_defivar,
CM_defivarx,
CM_defline,
CM_defmac,
CM_defmacx,
CM_defmethod,
CM_defmethodx,
CM_defop,
CM_defopt,
CM_defoptx,
CM_defopx,
CM_defspec,
CM_defspecx,
CM_deftp,
CM_deftpx,
CM_deftypecv,
CM_deftypecvx,
CM_deftypefn,
CM_deftypefnnewline,
CM_deftypefnx,
CM_deftypefun,
CM_deftypefunx,
CM_deftypeivar,
CM_deftypeivarx,
CM_deftypemethod,
CM_deftypemethodx,
CM_deftypeop,
CM_deftypeopx,
CM_deftypevar,
CM_deftypevarx,
CM_deftypevr,
CM_deftypevrx,
CM_defun,
CM_defunx,
CM_defvar,
CM_defvarx,
CM_defvr,
CM_defvrx,
CM_detailmenu,
CM_dfn,
CM_dh,
CM_dircategory,
CM_direntry,
CM_display,
CM_displaymath,
CM_dmn,
CM_docbook,
CM_documentdescription,
CM_documentencoding,
CM_documentlanguage,
CM_dotaccent,
CM_dotless,
CM_dots,
CM_email,
CM_emph,
CM_end,
CM_enddots,
CM_enumerate,
CM_env,
CM_equiv,
CM_error,
CM_errormsg,
CM_euro,
CM_evenfooting,
CM_evenfootingmarks,
CM_evenheading,
CM_evenheadingmarks,
CM_everyfooting,
CM_everyfootingmarks,
CM_everyheading,
CM_everyheadingmarks,
CM_example,
CM_exampleindent,
CM_exclamdown,
CM_exdent,
CM_expansion,
CM_file,
CM_finalout,
CM_firstparagraphindent,
CM_float,
CM_flushleft,
CM_flushright,
CM_fonttextsize,
CM_footnote,
CM_footnotestyle,
CM_format,
CM_frenchspacing,
CM_ftable,
CM_geq,
CM_group,
CM_guillemetleft,
CM_guillemetright,
CM_guillemotleft,
CM_guillemotright,
CM_guilsinglleft,
CM_guilsinglright,
CM_hashchar,
CM_heading,
CM_headings,
CM_headitem,
CM_headitemfont,
CM_html,
CM_hyphenation,
CM_i,
CM_ifclear,
CM_ifcommanddefined,
CM_ifcommandnotdefined,
CM_ifdocbook,
CM_ifhtml,
CM_ifinfo,
CM_iflatex,
CM_ifnotdocbook,
CM_ifnothtml,
CM_ifnotinfo,
CM_ifnotlatex,
CM_ifnotplaintext,
CM_ifnottex,
CM_ifnotxml,
CM_ifplaintext,
CM_ifset,
CM_iftex,
CM_ifxml,
CM_ignore,
CM_image,
CM_include,
CM_indent,
CM_indentedblock,
CM_indicateurl,
CM_inforef,
CM_inlinefmt,
CM_inlinefmtifelse,
CM_inlineifclear,
CM_inlineifset,
CM_inlineraw,
CM_insertcopying,
CM_item,
CM_item_LINE,
CM_itemize,
CM_itemx,
CM_kbd,
CM_kbdinputstyle,
CM_key,
CM_l,
CM_latex,
CM_lbracechar,
CM_leq,
CM_linemacro,
CM_lisp,
CM_listoffloats,
CM_lowersections,
CM_macro,
CM_majorheading,
CM_math,
CM_menu,
CM_microtype,
CM_minus,
CM_multitable,
CM_need,
CM_node,
CM_noindent,
CM_novalidate,
CM_o,
CM_oddfooting,
CM_oddfootingmarks,
CM_oddheading,
CM_oddheadingmarks,
CM_oe,
CM_ogonek,
CM_option,
CM_ordf,
CM_ordm,
CM_page,
CM_pagesizes,
CM_paragraphindent,
CM_part,
CM_point,
CM_pounds,
CM_print,
CM_printindex,
CM_pxref,
CM_questiondown,
CM_quotation,
CM_quotedblbase,
CM_quotedblleft,
CM_quotedblright,
CM_quoteleft,
CM_quoteright,
CM_quotesinglbase,
CM_r,
CM_raggedright,
CM_raisesections,
CM_rbracechar,
CM_ref,
CM_refill,
CM_registeredsymbol,
CM_result,
CM_ringaccent,
CM_rmacro,
CM_samp,
CM_sansserif,
CM_sc,
CM_section,
CM_seealso,
CM_seeentry,
CM_set,
CM_setchapternewpage,
CM_setfilename,
CM_settitle,
CM_shortcaption,
CM_shortcontents,
CM_shorttitlepage,
CM_slanted,
CM_smallbook,
CM_smalldisplay,
CM_smallexample,
CM_smallformat,
CM_smallindentedblock,
CM_smalllisp,
CM_smallquotation,
CM_sortas,
CM_sp,
CM_ss,
CM_strong,
CM_sub,
CM_subentry,
CM_subheading,
CM_subsection,
CM_subsubheading,
CM_subsubsection,
CM_subtitle,
CM_summarycontents,
CM_sup,
CM_syncodeindex,
CM_synindex,
CM_t,
CM_tab,
CM_table,
CM_tex,
CM_textdegree,
CM_th,
CM_thischapter,
CM_thischaptername,
CM_thischapternum,
CM_thisfile,
CM_thispage,
CM_thissection,
CM_thissectionname,
CM_thissectionnum,
CM_thistitle,
CM_tie,
CM_tieaccent,
CM_title,
CM_titlefont,
CM_titlepage,
CM_today,
CM_top,
CM_txiinternalvalue,
CM_u,
CM_ubaraccent,
CM_udotaccent,
CM_unmacro,
CM_unnumbered,
CM_unnumberedsec,
CM_unnumberedsubsec,
CM_unnumberedsubsubsec,
CM_uref,
CM_urefbreakstyle,
CM_url,
CM_v,
CM_value,
CM_var,
CM_verb,
CM_verbatim,
CM_verbatiminclude,
CM_vskip,
CM_vtable,
CM_w,
CM_xml,
CM_xref,
CM_xrefautomaticsectiontitle,
CM_hex_7b,
CM_hex_7c,
CM_hex_7d,
CM_hex_7e,
};
#endif
