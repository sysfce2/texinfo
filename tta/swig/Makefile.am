# Copyright 2024-2025 Free Software Foundation, Inc.
#
# This file is free software; as a special exception the author gives
# unlimited permission to copy and/or distribute it, with or without
# modifications, as long as this notice is preserved.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY, to the extent permitted by law; without even the
# implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

SUBDIRS = .

if ! DISABLE_XS
SUBDIRS += perl
endif

if SWIG_PYTHON_INTERFACE
if DISABLE_XS
SUBDIRS += python
else
# linking with libperl is needed if there is C Perl code in Texinfo libraries
if LIBPERL_LINK
SUBDIRS += python
endif
endif
endif

DIST_SUBDIRS = perl python

BUILT_SOURCES = python/python_texinfo_wrap.c \
                perl/perl_texinfo_wrap.c

SWIG_include_directories = -I$(srcdir)/../C/main -I$(srcdir)/../C/convert
SWIG_header_dependencies = $(srcdir)/../C/main/source_mark_types.h \
                           $(srcdir)/../C/convert/swig_element_data.h \
                           $(srcdir)/../C/convert/swig_text_options.h \
                           $(srcdir)/../C/convert/swig_error_messages_types.h

# tell Make how to create the generated SWIG files
$(srcdir)/python/python_texinfo_wrap.c: $(srcdir)/texinfo.i $(SWIG_header_dependencies)
	$(SWIG) $(AX_SWIG_PYTHON_OPT) $(SWIG_include_directories) -outdir $(srcdir)/python -o $@ $<

$(srcdir)/perl/perl_texinfo_wrap.c: $(srcdir)/texinfo.i $(SWIG_header_dependencies)
	$(SWIG) $(SWIG_include_directories) -perl -outdir $(srcdir)/perl -o $@ $<

EXTRA_DIST = README texinfo.i TODO
