# DO NOT EDIT! GENERATED AUTOMATICALLY!
# Copyright (C) 2002-2024 Free Software Foundation, Inc.
#
# This file is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This file is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this file.  If not, see <https://www.gnu.org/licenses/>.
#
# As a special exception to the GNU General Public License,
# this file may be distributed as part of a program that
# contains a configuration script generated by Autoconf, under
# the same distribution terms as the rest of that program.
#
# Generated by gnulib-tool.
#
# This file represents the compiled summary of the specification in
# gnulib-cache.m4. It lists the computed macro invocations that need
# to be invoked from configure.ac.
# In projects that use version control, this file can be treated like
# other built files.


# This macro should be invoked from ./configure.ac, in the section
# "Checks for programs", right after AC_PROG_CC, and certainly before
# any checks for libraries, header files, types and library functions.
AC_DEFUN([gl_EARLY],
[
  m4_pattern_forbid([^gl_[A-Z]])dnl the gnulib macro namespace
  m4_pattern_allow([^gl_ES$])dnl a valid locale name
  m4_pattern_allow([^gl_LIBOBJS$])dnl a variable
  m4_pattern_allow([^gl_LTLIBOBJS$])dnl a variable

  # Pre-early section.
  AC_REQUIRE([gl_USE_SYSTEM_EXTENSIONS])
  AC_REQUIRE([gl_PROG_AR_RANLIB])

  # Code from module absolute-header:
  # Code from module access:
  # Code from module alloca-opt:
  # Code from module array-mergesort:
  # Code from module assert-h:
  # Code from module attribute:
  # Code from module c99:
  # Code from module close:
  # Code from module dup2:
  # Code from module environ:
  # Code from module errno:
  # Code from module euidaccess:
  # Code from module extensions:
  # This is actually already done in the pre-early phase.
  # AC_REQUIRE([gl_USE_SYSTEM_EXTENSIONS])
  # Code from module extensions-aix:
  AC_REQUIRE([gl_USE_AIX_EXTENSIONS])
  # Code from module extern-inline:
  # Code from module fcntl:
  # Code from module fcntl-h:
  # Code from module fd-hook:
  # Code from module filename:
  # Code from module float:
  # Code from module free-posix:
  # Code from module gen-header:
  # Code from module getdelim:
  # Code from module getdtablesize:
  # Code from module getgroups:
  # Code from module getline:
  # Code from module gettext-h:
  # Code from module gperf:
  # Code from module group-member:
  # Code from module havelib:
  # Code from module iconv:
  # Code from module idx:
  # Code from module include_next:
  # Code from module inline:
  # Code from module inttypes-incomplete:
  # Code from module largefile:
  AC_REQUIRE([AC_SYS_LARGEFILE])
  # Code from module libunistring:
  # Code from module limits-h:
  # Code from module locale:
  # Code from module malloc-gnu:
  # Code from module malloc-posix:
  # Code from module malloca:
  # Code from module mbszero:
  # Code from module memchr:
  # Code from module msvc-inval:
  # Code from module msvc-nothrow:
  # Code from module multiarch:
  # Code from module pathmax:
  # Code from module rawmemchr:
  # Code from module realloc-gnu:
  # Code from module realloc-posix:
  # Code from module root-uid:
  # Code from module setenv:
  # Code from module size_max:
  # Code from module snippet/_Noreturn:
  # Code from module snippet/arg-nonnull:
  # Code from module snippet/c++defs:
  # Code from module snippet/warn-on-use:
  # Code from module ssize_t:
  # Code from module stat:
  # Code from module stat-time:
  # Code from module std-gnu11:
  # Code from module stdbool:
  # Code from module stdckdint:
  # Code from module stddef:
  # Code from module stdint:
  # Code from module stdio:
  gl_STDIO_H_EARLY
  # Code from module stdlib:
  # Code from module strchrnul:
  # Code from module streq:
  # Code from module string:
  # Code from module strndup:
  # Code from module strnlen:
  # Code from module sys_stat:
  # Code from module sys_types:
  AC_REQUIRE([AC_USE_SYSTEM_EXTENSIONS])
  # Code from module time-h:
  # Code from module uchar:
  # Code from module unicase/base:
  # Code from module unicase/cased:
  # Code from module unicase/empty-prefix-context:
  # Code from module unicase/empty-suffix-context:
  # Code from module unicase/ignorable:
  # Code from module unicase/special-casing:
  # Code from module unicase/tolower:
  # Code from module unicase/toupper:
  # Code from module unicase/u8-casemap:
  # Code from module unicase/u8-tolower:
  # Code from module unicase/u8-toupper:
  # Code from module unictype/base:
  # Code from module unictype/category-L:
  # Code from module unictype/category-M:
  # Code from module unictype/category-Mn:
  # Code from module unictype/category-Nd:
  # Code from module unictype/category-test:
  # Code from module unictype/combining-class:
  # Code from module unictype/ctype-upper:
  # Code from module unictype/property-alphabetic:
  # Code from module unictype/property-join-control:
  # Code from module unictype/property-soft-dotted:
  # Code from module unictype/property-test:
  # Code from module uninorm/base:
  # Code from module uninorm/canonical-decomposition:
  # Code from module uninorm/compat-decomposition:
  # Code from module uninorm/composition:
  # Code from module uninorm/decompose-internal:
  # Code from module uninorm/decomposition:
  # Code from module uninorm/decomposition-table:
  # Code from module uninorm/nfc:
  # Code from module uninorm/nfd:
  # Code from module uninorm/nfkd:
  # Code from module uninorm/u8-normalize:
  # Code from module unistd:
  # Code from module unistr/base:
  # Code from module unistr/u32-next:
  # Code from module unistr/u32-strmbtouc:
  # Code from module unistr/u8-cpy:
  # Code from module unistr/u8-mbsnlen:
  # Code from module unistr/u8-mbtouc:
  # Code from module unistr/u8-mbtouc-unsafe:
  # Code from module unistr/u8-mbtoucr:
  # Code from module unistr/u8-next:
  # Code from module unistr/u8-strlen:
  # Code from module unistr/u8-strmbtouc:
  # Code from module unistr/u8-uctomb:
  # Code from module unitypes:
  # Code from module uniwidth/base:
  # Code from module uniwidth/u8-strwidth:
  # Code from module uniwidth/u8-width:
  # Code from module uniwidth/width:
  # Code from module unsetenv:
  # Code from module vararrays:
  # Code from module vasnprintf:
  # Code from module vasprintf:
  # Code from module wchar:
  # Code from module wctype-h:
  # Code from module xalloc-oversized:
  # Code from module xsize:
])

# This macro should be invoked from ./configure.ac, in the section
# "Check for header files, types and library functions".
AC_DEFUN([gl_INIT],
[
  AM_CONDITIONAL([GL_COND_LIBTOOL], [true])
  gl_cond_libtool=true
  gl_m4_base='gnulib/m4'
  m4_pushdef([AC_LIBOBJ], m4_defn([gl_LIBOBJ]))
  m4_pushdef([AC_REPLACE_FUNCS], m4_defn([gl_REPLACE_FUNCS]))
  m4_pushdef([AC_LIBSOURCES], m4_defn([gl_LIBSOURCES]))
  m4_pushdef([gl_LIBSOURCES_LIST], [])
  m4_pushdef([gl_LIBSOURCES_DIR], [])
  m4_pushdef([GL_MACRO_PREFIX], [gl])
  m4_pushdef([GL_MODULE_INDICATOR_PREFIX], [GL])
  gl_COMMON
  gl_source_base='gnulib/lib'
  gl_source_base_prefix=
  gl_FUNC_ACCESS
  gl_CONDITIONAL([GL_COND_OBJ_ACCESS], [test $REPLACE_ACCESS = 1])
  gl_UNISTD_MODULE_INDICATOR([access])
  gl_FUNC_ALLOCA
  gl_CONDITIONAL_HEADER([alloca.h])
  AC_PROG_MKDIR_P
  gl_ASSERT_H
  gl_CONDITIONAL_HEADER([assert.h])
  AC_PROG_MKDIR_P
  gl_FUNC_CLOSE
  gl_CONDITIONAL([GL_COND_OBJ_CLOSE], [test $REPLACE_CLOSE = 1])
  gl_UNISTD_MODULE_INDICATOR([close])
  gl_MODULE_INDICATOR([close])
  gl_FUNC_DUP2
  gl_CONDITIONAL([GL_COND_OBJ_DUP2], [test $REPLACE_DUP2 = 1])
  AM_COND_IF([GL_COND_OBJ_DUP2], [
    gl_PREREQ_DUP2
  ])
  gl_UNISTD_MODULE_INDICATOR([dup2])
  gl_ENVIRON
  gl_UNISTD_MODULE_INDICATOR([environ])
  gl_HEADER_ERRNO_H
  gl_CONDITIONAL_HEADER([errno.h])
  AC_PROG_MKDIR_P
  gl_FUNC_EUIDACCESS
  gl_CONDITIONAL([GL_COND_OBJ_EUIDACCESS], [test $HAVE_EUIDACCESS = 0])
  AM_COND_IF([GL_COND_OBJ_EUIDACCESS], [
    gl_PREREQ_EUIDACCESS
  ])
  gl_UNISTD_MODULE_INDICATOR([euidaccess])
  AC_REQUIRE([gl_EXTERN_INLINE])
  gl_FUNC_FCNTL
  gl_CONDITIONAL([GL_COND_OBJ_FCNTL],
                 [test $HAVE_FCNTL = 0 || test $REPLACE_FCNTL = 1])
  gl_FCNTL_MODULE_INDICATOR([fcntl])
  gl_FCNTL_H
  gl_FCNTL_H_REQUIRE_DEFAULTS
  AC_PROG_MKDIR_P
  gl_FLOAT_H
  gl_CONDITIONAL_HEADER([float.h])
  AC_PROG_MKDIR_P
  gl_CONDITIONAL([GL_COND_OBJ_FLOAT],
                 [test $REPLACE_FLOAT_LDBL = 1 || test $REPLACE_FLOAT_SNAN = 1])
  gl_CONDITIONAL([GL_COND_OBJ_ITOLD], [test $REPLACE_ITOLD = 1])
  dnl Prerequisites of lib/float.c.
  AC_REQUIRE([gl_BIGENDIAN])
  gl_FUNC_FREE
  gl_CONDITIONAL([GL_COND_OBJ_FREE], [test $REPLACE_FREE = 1])
  AM_COND_IF([GL_COND_OBJ_FREE], [
    gl_PREREQ_FREE
  ])
  gl_STDLIB_MODULE_INDICATOR([free-posix])
  gl_FUNC_GETDELIM
  gl_CONDITIONAL([GL_COND_OBJ_GETDELIM],
                 [test $HAVE_GETDELIM = 0 || test $REPLACE_GETDELIM = 1])
  AM_COND_IF([GL_COND_OBJ_GETDELIM], [
    gl_PREREQ_GETDELIM
  ])
  gl_STDIO_MODULE_INDICATOR([getdelim])
  gl_FUNC_GETDTABLESIZE
  gl_CONDITIONAL([GL_COND_OBJ_GETDTABLESIZE],
                 [test $HAVE_GETDTABLESIZE = 0 || test $REPLACE_GETDTABLESIZE = 1])
  AM_COND_IF([GL_COND_OBJ_GETDTABLESIZE], [
    gl_PREREQ_GETDTABLESIZE
  ])
  gl_UNISTD_MODULE_INDICATOR([getdtablesize])
  gl_FUNC_GETGROUPS
  gl_CONDITIONAL([GL_COND_OBJ_GETGROUPS],
                 [test $HAVE_GETGROUPS = 0 || test $REPLACE_GETGROUPS = 1])
  gl_UNISTD_MODULE_INDICATOR([getgroups])
  gl_FUNC_GETLINE
  gl_CONDITIONAL([GL_COND_OBJ_GETLINE], [test $REPLACE_GETLINE = 1])
  AM_COND_IF([GL_COND_OBJ_GETLINE], [
    gl_PREREQ_GETLINE
  ])
  gl_STDIO_MODULE_INDICATOR([getline])
  AC_SUBST([LIBINTL])
  AC_SUBST([LTLIBINTL])
  gl_FUNC_GROUP_MEMBER
  gl_CONDITIONAL([GL_COND_OBJ_GROUP_MEMBER], [test $HAVE_GROUP_MEMBER = 0])
  AM_COND_IF([GL_COND_OBJ_GROUP_MEMBER], [
    gl_PREREQ_GROUP_MEMBER
  ])
  gl_UNISTD_MODULE_INDICATOR([group-member])
  AC_DEFUN([gl_HAVE_MODULE_HAVELIB])
  AM_ICONV
  m4_ifdef([gl_ICONV_MODULE_INDICATOR],
    [gl_ICONV_MODULE_INDICATOR([iconv])])
  gl_INLINE
  gl_INTTYPES_INCOMPLETE
  gl_INTTYPES_H_REQUIRE_DEFAULTS
  AC_PROG_MKDIR_P
  AC_REQUIRE([gl_LARGEFILE])
  gl_LIBUNISTRING
  gl_LIMITS_H
  gl_CONDITIONAL_HEADER([limits.h])
  AC_PROG_MKDIR_P
  gl_LOCALE_H
  gl_LOCALE_H_REQUIRE_DEFAULTS
  AC_PROG_MKDIR_P
  gl_FUNC_MALLOC_GNU
  if test $REPLACE_MALLOC_FOR_MALLOC_GNU = 1; then
    AC_LIBOBJ([malloc])
  fi
  gl_STDLIB_MODULE_INDICATOR([malloc-gnu])
  AC_REQUIRE([gl_FUNC_MALLOC_POSIX])
  if test $REPLACE_MALLOC_FOR_MALLOC_POSIX = 1; then
    AC_LIBOBJ([malloc])
  fi
  gl_STDLIB_MODULE_INDICATOR([malloc-posix])
  gl_MALLOCA
  AC_REQUIRE([AC_TYPE_MBSTATE_T])
  gl_MBSTATE_T_BROKEN
  gl_MUSL_LIBC
  gl_WCHAR_MODULE_INDICATOR([mbszero])
  gl_FUNC_MEMCHR
  gl_CONDITIONAL([GL_COND_OBJ_MEMCHR], [test $REPLACE_MEMCHR = 1])
  AM_COND_IF([GL_COND_OBJ_MEMCHR], [
    gl_PREREQ_MEMCHR
  ])
  gl_STRING_MODULE_INDICATOR([memchr])
  AC_REQUIRE([gl_MSVC_INVAL])
  gl_CONDITIONAL([GL_COND_OBJ_MSVC_INVAL],
                 [test $HAVE_MSVC_INVALID_PARAMETER_HANDLER = 1])
  AC_REQUIRE([gl_MSVC_NOTHROW])
  gl_CONDITIONAL([GL_COND_OBJ_MSVC_NOTHROW],
                 [test $HAVE_MSVC_INVALID_PARAMETER_HANDLER = 1])
  gl_MODULE_INDICATOR([msvc-nothrow])
  gl_MULTIARCH
  gl_PATHMAX
  gl_FUNC_RAWMEMCHR
  gl_CONDITIONAL([GL_COND_OBJ_RAWMEMCHR], [test $HAVE_RAWMEMCHR = 0])
  AM_COND_IF([GL_COND_OBJ_RAWMEMCHR], [
    gl_PREREQ_RAWMEMCHR
  ])
  gl_STRING_MODULE_INDICATOR([rawmemchr])
  gl_FUNC_REALLOC_GNU
  if test $REPLACE_REALLOC_FOR_REALLOC_GNU = 1; then
    AC_LIBOBJ([realloc])
  fi
  gl_STDLIB_MODULE_INDICATOR([realloc-gnu])
  gl_FUNC_REALLOC_POSIX
  if test $REPLACE_REALLOC_FOR_REALLOC_POSIX = 1; then
    AC_LIBOBJ([realloc])
  fi
  gl_STDLIB_MODULE_INDICATOR([realloc-posix])
  gl_FUNC_SETENV
  gl_CONDITIONAL([GL_COND_OBJ_SETENV],
                 [test $HAVE_SETENV = 0 || test $REPLACE_SETENV = 1])
  gl_STDLIB_MODULE_INDICATOR([setenv])
  gl_SIZE_MAX
  gt_TYPE_SSIZE_T
  gl_FUNC_STAT
  gl_CONDITIONAL([GL_COND_OBJ_STAT], [test $REPLACE_STAT = 1])
  AM_COND_IF([GL_COND_OBJ_STAT], [
    case "$host_os" in
      mingw* | windows*)
        AC_LIBOBJ([stat-w32])
        ;;
    esac
    gl_PREREQ_STAT
  ])
  gl_SYS_STAT_MODULE_INDICATOR([stat])
  gl_MODULE_INDICATOR([stat])
  gl_STAT_TIME
  gl_STAT_BIRTHTIME
  gl_C_BOOL
  AC_CHECK_HEADERS_ONCE([stdckdint.h])
  if test $ac_cv_header_stdckdint_h = yes; then
    GL_GENERATE_STDCKDINT_H=false
  else
    GL_GENERATE_STDCKDINT_H=true
  fi
  gl_CONDITIONAL_HEADER([stdckdint.h])
  AC_PROG_MKDIR_P
  gl_STDDEF_H
  gl_STDDEF_H_REQUIRE_DEFAULTS
  gl_CONDITIONAL_HEADER([stddef.h])
  AC_PROG_MKDIR_P
  gl_STDINT_H
  gl_CONDITIONAL_HEADER([stdint.h])
  dnl Because of gl_REPLACE_LIMITS_H:
  gl_CONDITIONAL_HEADER([limits.h])
  AC_PROG_MKDIR_P
  gl_STDIO_H
  gl_STDIO_H_REQUIRE_DEFAULTS
  AC_PROG_MKDIR_P
  gl_CONDITIONAL([GL_COND_OBJ_STDIO_READ], [test $REPLACE_STDIO_READ_FUNCS = 1])
  gl_CONDITIONAL([GL_COND_OBJ_STDIO_WRITE], [test $REPLACE_STDIO_WRITE_FUNCS = 1])
  dnl No need to create extra modules for these functions. Everyone who uses
  dnl <stdio.h> likely needs them.
  gl_STDIO_MODULE_INDICATOR([fscanf])
  gl_MODULE_INDICATOR([fscanf])
  gl_STDIO_MODULE_INDICATOR([scanf])
  gl_MODULE_INDICATOR([scanf])
  gl_STDIO_MODULE_INDICATOR([fgetc])
  gl_STDIO_MODULE_INDICATOR([getc])
  gl_STDIO_MODULE_INDICATOR([getchar])
  gl_STDIO_MODULE_INDICATOR([fgets])
  gl_STDIO_MODULE_INDICATOR([fread])
  dnl No need to create extra modules for these functions. Everyone who uses
  dnl <stdio.h> likely needs them.
  gl_STDIO_MODULE_INDICATOR([fprintf])
  gl_STDIO_MODULE_INDICATOR([printf])
  gl_STDIO_MODULE_INDICATOR([vfprintf])
  gl_STDIO_MODULE_INDICATOR([vprintf])
  gl_STDIO_MODULE_INDICATOR([fputc])
  gl_STDIO_MODULE_INDICATOR([putc])
  gl_STDIO_MODULE_INDICATOR([putchar])
  gl_STDIO_MODULE_INDICATOR([fputs])
  gl_STDIO_MODULE_INDICATOR([puts])
  gl_STDIO_MODULE_INDICATOR([fwrite])
  gl_STDLIB_H
  gl_STDLIB_H_REQUIRE_DEFAULTS
  AC_PROG_MKDIR_P
  gl_FUNC_STRCHRNUL
  gl_CONDITIONAL([GL_COND_OBJ_STRCHRNUL],
                 [test $HAVE_STRCHRNUL = 0 || test $REPLACE_STRCHRNUL = 1])
  AM_COND_IF([GL_COND_OBJ_STRCHRNUL], [
    gl_PREREQ_STRCHRNUL
  ])
  gl_STRING_MODULE_INDICATOR([strchrnul])
  gl_STRING_H
  gl_STRING_H_REQUIRE_DEFAULTS
  AC_PROG_MKDIR_P
  gl_FUNC_STRNDUP
  gl_CONDITIONAL([GL_COND_OBJ_STRNDUP],
                 [test $HAVE_STRNDUP = 0 || test $REPLACE_STRNDUP = 1])
  gl_STRING_MODULE_INDICATOR([strndup])
  gl_FUNC_STRNLEN
  gl_CONDITIONAL([GL_COND_OBJ_STRNLEN],
                 [test $HAVE_DECL_STRNLEN = 0 || test $REPLACE_STRNLEN = 1])
  AM_COND_IF([GL_COND_OBJ_STRNLEN], [
    gl_PREREQ_STRNLEN
  ])
  gl_STRING_MODULE_INDICATOR([strnlen])
  gl_SYS_STAT_H
  gl_SYS_STAT_H_REQUIRE_DEFAULTS
  AC_PROG_MKDIR_P
  gl_SYS_TYPES_H
  gl_SYS_TYPES_H_REQUIRE_DEFAULTS
  AC_PROG_MKDIR_P
  gl_TIME_H
  gl_TIME_H_REQUIRE_DEFAULTS
  AC_PROG_MKDIR_P
  gl_UCHAR_H
  gl_UCHAR_H_REQUIRE_DEFAULTS
  AC_PROG_MKDIR_P
  gl_LIBUNISTRING_LIBHEADER([1.2], [unicase.h])
  gl_UNICASE_H
  gl_UNICASE_H_REQUIRE_DEFAULTS
  AC_PROG_MKDIR_P
  AC_REQUIRE([AC_C_INLINE])
  gl_UNICASE_H_REQUIRE_DEFAULTS
  gl_LIBUNISTRING_MODULE_WITH_VARIABLE([0.9.11], [unicase/empty-prefix-context])
  gl_UNICASE_H_REQUIRE_DEFAULTS
  gl_LIBUNISTRING_MODULE_WITH_VARIABLE([0.9.11], [unicase/empty-suffix-context])
  AC_REQUIRE([AC_C_INLINE])
  AC_PROG_MKDIR_P
  gl_LIBUNISTRING_MODULE([1.3], [unicase/tolower])
  gl_LIBUNISTRING_MODULE([1.3], [unicase/toupper])
  gl_LIBUNISTRING_MODULE([1.3], [unicase/u8-tolower])
  gl_LIBUNISTRING_MODULE([1.3], [unicase/u8-toupper])
  gl_LIBUNISTRING_LIBHEADER([1.3], [unictype.h])
  gl_UNICTYPE_H
  gl_UNICTYPE_H_REQUIRE_DEFAULTS
  AC_PROG_MKDIR_P
  gl_UNICTYPE_H_REQUIRE_DEFAULTS
  gl_LIBUNISTRING_MODULE_WITH_VARIABLE([1.3], [unictype/category-L])
  gl_UNICTYPE_H_REQUIRE_DEFAULTS
  gl_LIBUNISTRING_MODULE_WITH_VARIABLE([1.3], [unictype/category-M])
  gl_UNICTYPE_H_REQUIRE_DEFAULTS
  gl_LIBUNISTRING_MODULE_WITH_VARIABLE([1.3], [unictype/category-Mn])
  gl_UNICTYPE_H_REQUIRE_DEFAULTS
  gl_LIBUNISTRING_MODULE_WITH_VARIABLE([1.3], [unictype/category-Nd])
  AC_REQUIRE([AC_C_INLINE])
  gl_LIBUNISTRING_MODULE([0.9.8], [unictype/category-test])
  gl_LIBUNISTRING_MODULE([1.3], [unictype/combining-class])
  AC_REQUIRE([AC_C_INLINE])
  gl_LIBUNISTRING_MODULE([1.3], [unictype/ctype-upper])
  AC_REQUIRE([AC_C_INLINE])
  gl_UNICTYPE_H_REQUIRE_DEFAULTS
  gl_LIBUNISTRING_MODULE_WITH_VARIABLE([1.3], [unictype/property-alphabetic])
  AC_REQUIRE([AC_C_INLINE])
  gl_UNICTYPE_H_REQUIRE_DEFAULTS
  gl_LIBUNISTRING_MODULE_WITH_VARIABLE([0.9.8], [unictype/property-join-control])
  AC_REQUIRE([AC_C_INLINE])
  gl_UNICTYPE_H_REQUIRE_DEFAULTS
  gl_LIBUNISTRING_MODULE_WITH_VARIABLE([1.1], [unictype/property-soft-dotted])
  gl_LIBUNISTRING_MODULE([0.9.8], [unictype/property-test])
  gl_LIBUNISTRING_LIBHEADER([1.2], [uninorm.h])
  gl_UNINORM_H
  gl_UNINORM_H_REQUIRE_DEFAULTS
  AC_PROG_MKDIR_P
  gl_LIBUNISTRING_MODULE([1.3], [uninorm/canonical-decomposition])
  gl_LIBUNISTRING_MODULE([1.3], [uninorm/composition])
  gl_LIBUNISTRING_MODULE([1.3], [uninorm/decomposition])
  AC_REQUIRE([AC_C_INLINE])
  gl_UNINORM_H_REQUIRE_DEFAULTS
  gl_LIBUNISTRING_MODULE_WITH_VARIABLE([1.3], [uninorm/nfc])
  gl_UNINORM_H_REQUIRE_DEFAULTS
  gl_LIBUNISTRING_MODULE_WITH_VARIABLE([1.3], [uninorm/nfd])
  gl_UNINORM_H_REQUIRE_DEFAULTS
  gl_LIBUNISTRING_MODULE_WITH_VARIABLE([1.3], [uninorm/nfkd])
  gl_MODULE_INDICATOR_FOR_TESTS([uninorm/u8-normalize])
  gl_LIBUNISTRING_MODULE([1.3], [uninorm/u8-normalize])
  gl_UNISTD_H
  gl_UNISTD_H_REQUIRE_DEFAULTS
  AC_PROG_MKDIR_P
  gl_LIBUNISTRING_LIBHEADER([1.2], [unistr.h])
  AC_PROG_MKDIR_P
  gl_LIBUNISTRING_MODULE([0.9], [unistr/u32-next])
  gl_LIBUNISTRING_MODULE([0.9], [unistr/u32-strmbtouc])
  gl_LIBUNISTRING_MODULE([0.9], [unistr/u8-cpy])
  gl_LIBUNISTRING_MODULE([1.2], [unistr/u8-mbsnlen])
  gl_MODULE_INDICATOR([unistr/u8-mbtouc])
  gl_LIBUNISTRING_MODULE([1.2], [unistr/u8-mbtouc])
  gl_MODULE_INDICATOR([unistr/u8-mbtouc-unsafe])
  gl_LIBUNISTRING_MODULE([0.9.4], [unistr/u8-mbtouc-unsafe])
  gl_MODULE_INDICATOR([unistr/u8-mbtoucr])
  gl_LIBUNISTRING_MODULE([0.9], [unistr/u8-mbtoucr])
  gl_LIBUNISTRING_MODULE([0.9], [unistr/u8-next])
  gl_LIBUNISTRING_MODULE([0.9], [unistr/u8-strlen])
  gl_LIBUNISTRING_MODULE([0.9], [unistr/u8-strmbtouc])
  gl_MODULE_INDICATOR([unistr/u8-uctomb])
  gl_LIBUNISTRING_MODULE([0.9], [unistr/u8-uctomb])
  gl_LIBUNISTRING_LIBHEADER([0.9.11], [unitypes.h])
  AC_PROG_MKDIR_P
  AH_VERBATIM([unitypes_restrict], [
  /* This definition is a duplicate of the one in unitypes.h.
     It is here so that we can cope with an older version of unitypes.h
     that does not contain this definition and that is pre-installed among
     the public header files.  */
  # if defined __restrict \
       || 2 < __GNUC__ + (95 <= __GNUC_MINOR__) \
       || __clang_major__ >= 3
  #  define _UC_RESTRICT __restrict
  # elif 199901L <= __STDC_VERSION__ || defined restrict
  #  define _UC_RESTRICT restrict
  # else
  #  define _UC_RESTRICT
  # endif
  ])
  gl_LIBUNISTRING_LIBHEADER([0.9.11], [uniwidth.h])
  AC_PROG_MKDIR_P
  gl_LIBUNISTRING_MODULE([1.3], [uniwidth/u8-strwidth])
  gl_LIBUNISTRING_MODULE([1.3], [uniwidth/u8-width])
  gl_LIBUNISTRING_MODULE([1.3], [uniwidth/width])
  gl_FUNC_UNSETENV
  gl_CONDITIONAL([GL_COND_OBJ_UNSETENV],
                 [test $HAVE_UNSETENV = 0 || test $REPLACE_UNSETENV = 1])
  AM_COND_IF([GL_COND_OBJ_UNSETENV], [
    gl_PREREQ_UNSETENV
  ])
  gl_STDLIB_MODULE_INDICATOR([unsetenv])
  AC_C_VARARRAYS
  AC_REQUIRE([AC_C_RESTRICT])
  gl_FUNC_VASNPRINTF
  gl_FUNC_VASPRINTF
  gl_STDIO_MODULE_INDICATOR([vasprintf])
  m4_ifdef([AM_XGETTEXT_OPTION],
    [AM_][XGETTEXT_OPTION([--flag=asprintf:2:c-format])
     AM_][XGETTEXT_OPTION([--flag=vasprintf:2:c-format])])
  gl_WCHAR_H
  gl_WCHAR_H_REQUIRE_DEFAULTS
  AC_PROG_MKDIR_P
  gl_WCTYPE_H
  gl_WCTYPE_H_REQUIRE_DEFAULTS
  AC_PROG_MKDIR_P
  gl_XSIZE
  # End of code from modules
  m4_ifval(gl_LIBSOURCES_LIST, [
    m4_syscmd([test ! -d ]m4_defn([gl_LIBSOURCES_DIR])[ ||
      for gl_file in ]gl_LIBSOURCES_LIST[ ; do
        if test ! -r ]m4_defn([gl_LIBSOURCES_DIR])[/$gl_file ; then
          echo "missing file ]m4_defn([gl_LIBSOURCES_DIR])[/$gl_file" >&2
          exit 1
        fi
      done])dnl
      m4_if(m4_sysval, [0], [],
        [AC_FATAL([expected source file, required through AC_LIBSOURCES, not found])])
  ])
  m4_popdef([GL_MODULE_INDICATOR_PREFIX])
  m4_popdef([GL_MACRO_PREFIX])
  m4_popdef([gl_LIBSOURCES_DIR])
  m4_popdef([gl_LIBSOURCES_LIST])
  m4_popdef([AC_LIBSOURCES])
  m4_popdef([AC_REPLACE_FUNCS])
  m4_popdef([AC_LIBOBJ])
  AC_CONFIG_COMMANDS_PRE([
    gl_libobjs=
    gl_ltlibobjs=
    gl_libobjdeps=
    if test -n "$gl_LIBOBJS"; then
      # Remove the extension.
changequote(,)dnl
      sed_drop_objext='s/\.o$//;s/\.obj$//'
      sed_dirname1='s,//*,/,g'
      sed_dirname2='s,\(.\)/$,\1,'
      sed_dirname3='s,^[^/]*$,.,'
      sed_dirname4='s,\(.\)/[^/]*$,\1,'
      sed_basename1='s,.*/,,'
changequote([, ])dnl
      for i in `for i in $gl_LIBOBJS; do echo "$i"; done | sed -e "$sed_drop_objext" | sort | uniq`; do
        gl_libobjs="$gl_libobjs $i.$ac_objext"
        gl_ltlibobjs="$gl_ltlibobjs $i.lo"
        i_dir=`echo "$i" | sed -e "$sed_dirname1" -e "$sed_dirname2" -e "$sed_dirname3" -e "$sed_dirname4"`
        i_base=`echo "$i" | sed -e "$sed_basename1"`
        gl_libobjdeps="$gl_libobjdeps $i_dir/\$(DEPDIR)/$i_base.Plo"
      done
    fi
    AC_SUBST([gl_LIBOBJS], [$gl_libobjs])
    AC_SUBST([gl_LTLIBOBJS], [$gl_ltlibobjs])
    AC_SUBST([gl_LIBOBJDEPS], [$gl_libobjdeps])
  ])
  gltests_libdeps=
  gltests_ltlibdeps=
  m4_pushdef([AC_LIBOBJ], m4_defn([gltests_LIBOBJ]))
  m4_pushdef([AC_REPLACE_FUNCS], m4_defn([gltests_REPLACE_FUNCS]))
  m4_pushdef([AC_LIBSOURCES], m4_defn([gltests_LIBSOURCES]))
  m4_pushdef([gltests_LIBSOURCES_LIST], [])
  m4_pushdef([gltests_LIBSOURCES_DIR], [])
  m4_pushdef([GL_MACRO_PREFIX], [gltests])
  m4_pushdef([GL_MODULE_INDICATOR_PREFIX], [GL])
  gl_COMMON
  gl_source_base='tests'
  gl_source_base_prefix=
changequote(,)dnl
  gltests_WITNESS=IN_`echo "${PACKAGE-$PACKAGE_TARNAME}" | LC_ALL=C tr abcdefghijklmnopqrstuvwxyz ABCDEFGHIJKLMNOPQRSTUVWXYZ | LC_ALL=C sed -e 's/[^A-Z0-9_]/_/g'`_GNULIB_TESTS
changequote([, ])dnl
  AC_SUBST([gltests_WITNESS])
  gl_module_indicator_condition=$gltests_WITNESS
  m4_pushdef([gl_MODULE_INDICATOR_CONDITION], [$gl_module_indicator_condition])
  m4_popdef([gl_MODULE_INDICATOR_CONDITION])
  m4_ifval(gltests_LIBSOURCES_LIST, [
    m4_syscmd([test ! -d ]m4_defn([gltests_LIBSOURCES_DIR])[ ||
      for gl_file in ]gltests_LIBSOURCES_LIST[ ; do
        if test ! -r ]m4_defn([gltests_LIBSOURCES_DIR])[/$gl_file ; then
          echo "missing file ]m4_defn([gltests_LIBSOURCES_DIR])[/$gl_file" >&2
          exit 1
        fi
      done])dnl
      m4_if(m4_sysval, [0], [],
        [AC_FATAL([expected source file, required through AC_LIBSOURCES, not found])])
  ])
  m4_popdef([GL_MODULE_INDICATOR_PREFIX])
  m4_popdef([GL_MACRO_PREFIX])
  m4_popdef([gltests_LIBSOURCES_DIR])
  m4_popdef([gltests_LIBSOURCES_LIST])
  m4_popdef([AC_LIBSOURCES])
  m4_popdef([AC_REPLACE_FUNCS])
  m4_popdef([AC_LIBOBJ])
  AC_CONFIG_COMMANDS_PRE([
    gltests_libobjs=
    gltests_ltlibobjs=
    gltests_libobjdeps=
    if test -n "$gltests_LIBOBJS"; then
      # Remove the extension.
changequote(,)dnl
      sed_drop_objext='s/\.o$//;s/\.obj$//'
      sed_dirname1='s,//*,/,g'
      sed_dirname2='s,\(.\)/$,\1,'
      sed_dirname3='s,^[^/]*$,.,'
      sed_dirname4='s,\(.\)/[^/]*$,\1,'
      sed_basename1='s,.*/,,'
changequote([, ])dnl
      for i in `for i in $gltests_LIBOBJS; do echo "$i"; done | sed -e "$sed_drop_objext" | sort | uniq`; do
        gltests_libobjs="$gltests_libobjs $i.$ac_objext"
        gltests_ltlibobjs="$gltests_ltlibobjs $i.lo"
        i_dir=`echo "$i" | sed -e "$sed_dirname1" -e "$sed_dirname2" -e "$sed_dirname3" -e "$sed_dirname4"`
        i_base=`echo "$i" | sed -e "$sed_basename1"`
        gltests_libobjdeps="$gltests_libobjdeps $i_dir/\$(DEPDIR)/$i_base.Plo"
      done
    fi
    AC_SUBST([gltests_LIBOBJS], [$gltests_libobjs])
    AC_SUBST([gltests_LTLIBOBJS], [$gltests_ltlibobjs])
    AC_SUBST([gltests_LIBOBJDEPS], [$gltests_libobjdeps])
  ])
  AC_REQUIRE([gl_CC_GNULIB_WARNINGS])
])

# Like AC_LIBOBJ, except that the module name goes
# into gl_LIBOBJS instead of into LIBOBJS.
AC_DEFUN([gl_LIBOBJ], [
  AS_LITERAL_IF([$1], [gl_LIBSOURCES([$1.c])])dnl
  gl_LIBOBJS="$gl_LIBOBJS $1.$ac_objext"
])

# Like AC_REPLACE_FUNCS, except that the module name goes
# into gl_LIBOBJS instead of into LIBOBJS.
AC_DEFUN([gl_REPLACE_FUNCS], [
  m4_foreach_w([gl_NAME], [$1], [AC_LIBSOURCES(gl_NAME[.c])])dnl
  AC_CHECK_FUNCS([$1], , [gl_LIBOBJ($ac_func)])
])

# Like AC_LIBSOURCES, except the directory where the source file is
# expected is derived from the gnulib-tool parameterization,
# and alloca is special cased (for the alloca-opt module).
# We could also entirely rely on EXTRA_lib..._SOURCES.
AC_DEFUN([gl_LIBSOURCES], [
  m4_foreach([_gl_NAME], [$1], [
    m4_if(_gl_NAME, [alloca.c], [], [
      m4_define([gl_LIBSOURCES_DIR], [gnulib/lib])
      m4_append([gl_LIBSOURCES_LIST], _gl_NAME, [ ])
    ])
  ])
])

# Like AC_LIBOBJ, except that the module name goes
# into gltests_LIBOBJS instead of into LIBOBJS.
AC_DEFUN([gltests_LIBOBJ], [
  AS_LITERAL_IF([$1], [gltests_LIBSOURCES([$1.c])])dnl
  gltests_LIBOBJS="$gltests_LIBOBJS $1.$ac_objext"
])

# Like AC_REPLACE_FUNCS, except that the module name goes
# into gltests_LIBOBJS instead of into LIBOBJS.
AC_DEFUN([gltests_REPLACE_FUNCS], [
  m4_foreach_w([gl_NAME], [$1], [AC_LIBSOURCES(gl_NAME[.c])])dnl
  AC_CHECK_FUNCS([$1], , [gltests_LIBOBJ($ac_func)])
])

# Like AC_LIBSOURCES, except the directory where the source file is
# expected is derived from the gnulib-tool parameterization,
# and alloca is special cased (for the alloca-opt module).
# We could also entirely rely on EXTRA_lib..._SOURCES.
AC_DEFUN([gltests_LIBSOURCES], [
  m4_foreach([_gl_NAME], [$1], [
    m4_if(_gl_NAME, [alloca.c], [], [
      m4_define([gltests_LIBSOURCES_DIR], [tests])
      m4_append([gltests_LIBSOURCES_LIST], _gl_NAME, [ ])
    ])
  ])
])

# This macro records the list of files which have been installed by
# gnulib-tool and may be removed by future gnulib-tool invocations.
AC_DEFUN([gl_FILE_LIST], [
  build-aux/config.rpath
  lib/_Noreturn.h
  lib/access.c
  lib/alloca.in.h
  lib/arg-nonnull.h
  lib/array-mergesort.h
  lib/asnprintf.c
  lib/asprintf.c
  lib/assert.in.h
  lib/attribute.h
  lib/c++defs.h
  lib/close.c
  lib/dup2.c
  lib/errno.in.h
  lib/euidaccess.c
  lib/fcntl.c
  lib/fcntl.in.h
  lib/fd-hook.c
  lib/fd-hook.h
  lib/filename.h
  lib/float+.h
  lib/float.c
  lib/float.in.h
  lib/free.c
  lib/getdelim.c
  lib/getdtablesize.c
  lib/getgroups.c
  lib/getline.c
  lib/gettext.h
  lib/group-member.c
  lib/idx.h
  lib/intprops-internal.h
  lib/inttypes.in.h
  lib/itold.c
  lib/libunistring.valgrind
  lib/limits.in.h
  lib/localcharset.h
  lib/locale.in.h
  lib/malloc.c
  lib/malloca.c
  lib/malloca.h
  lib/mbszero.c
  lib/memchr.c
  lib/memchr.valgrind
  lib/msvc-inval.c
  lib/msvc-inval.h
  lib/msvc-nothrow.c
  lib/msvc-nothrow.h
  lib/pathmax.h
  lib/printf-args.c
  lib/printf-args.h
  lib/printf-parse.c
  lib/printf-parse.h
  lib/rawmemchr.c
  lib/rawmemchr.valgrind
  lib/realloc.c
  lib/root-uid.h
  lib/setenv.c
  lib/size_max.h
  lib/stat-time.c
  lib/stat-time.h
  lib/stat-w32.c
  lib/stat-w32.h
  lib/stat.c
  lib/stdckdint.in.h
  lib/stddef.in.h
  lib/stdint.in.h
  lib/stdio-read.c
  lib/stdio-write.c
  lib/stdio.in.h
  lib/stdlib.in.h
  lib/strchrnul.c
  lib/strchrnul.valgrind
  lib/streq.h
  lib/string.in.h
  lib/strndup.c
  lib/strnlen.c
  lib/sys_stat.in.h
  lib/sys_types.in.h
  lib/time.in.h
  lib/uchar.in.h
  lib/unicase.in.h
  lib/unicase/cased.c
  lib/unicase/cased.h
  lib/unicase/caseprop.h
  lib/unicase/context.h
  lib/unicase/empty-prefix-context.c
  lib/unicase/empty-suffix-context.c
  lib/unicase/ignorable.c
  lib/unicase/ignorable.h
  lib/unicase/simple-mapping.h
  lib/unicase/special-casing-table.gperf
  lib/unicase/special-casing.c
  lib/unicase/special-casing.in.h
  lib/unicase/tolower.c
  lib/unicase/tolower.h
  lib/unicase/toupper.c
  lib/unicase/toupper.h
  lib/unicase/u-casemap.h
  lib/unicase/u8-casemap.c
  lib/unicase/u8-tolower.c
  lib/unicase/u8-toupper.c
  lib/unicase/unicasemap.h
  lib/unictype.in.h
  lib/unictype/bitmap.h
  lib/unictype/categ_L.c
  lib/unictype/categ_L.h
  lib/unictype/categ_M.c
  lib/unictype/categ_M.h
  lib/unictype/categ_Mn.c
  lib/unictype/categ_Mn.h
  lib/unictype/categ_Nd.c
  lib/unictype/categ_Nd.h
  lib/unictype/categ_test.c
  lib/unictype/combiningclass.c
  lib/unictype/combiningclass.h
  lib/unictype/ctype_upper.c
  lib/unictype/ctype_upper.h
  lib/unictype/pr_alphabetic.c
  lib/unictype/pr_alphabetic.h
  lib/unictype/pr_join_control.c
  lib/unictype/pr_join_control.h
  lib/unictype/pr_soft_dotted.c
  lib/unictype/pr_soft_dotted.h
  lib/unictype/pr_test.c
  lib/uninorm.in.h
  lib/uninorm/canonical-decomposition.c
  lib/uninorm/compat-decomposition.c
  lib/uninorm/composition-table-bounds.h
  lib/uninorm/composition-table.gperf
  lib/uninorm/composition.c
  lib/uninorm/decompose-internal.c
  lib/uninorm/decompose-internal.h
  lib/uninorm/decomposition-table.c
  lib/uninorm/decomposition-table.h
  lib/uninorm/decomposition-table1.h
  lib/uninorm/decomposition-table2.h
  lib/uninorm/decomposition.c
  lib/uninorm/nfc.c
  lib/uninorm/nfd.c
  lib/uninorm/nfkd.c
  lib/uninorm/normalize-internal.h
  lib/uninorm/u-normalize-internal.h
  lib/uninorm/u8-normalize.c
  lib/unistd.c
  lib/unistd.in.h
  lib/unistr.in.h
  lib/unistr/u-cpy.h
  lib/unistr/u32-next.c
  lib/unistr/u32-strmbtouc.c
  lib/unistr/u8-cpy.c
  lib/unistr/u8-mbsnlen.c
  lib/unistr/u8-mbtouc-aux.c
  lib/unistr/u8-mbtouc-unsafe-aux.c
  lib/unistr/u8-mbtouc-unsafe.c
  lib/unistr/u8-mbtouc.c
  lib/unistr/u8-mbtoucr.c
  lib/unistr/u8-next.c
  lib/unistr/u8-strlen.c
  lib/unistr/u8-strmbtouc.c
  lib/unistr/u8-uctomb-aux.c
  lib/unistr/u8-uctomb.c
  lib/unitypes.in.h
  lib/uniwidth.in.h
  lib/uniwidth/cjk.h
  lib/uniwidth/u8-strwidth.c
  lib/uniwidth/u8-width.c
  lib/uniwidth/width.c
  lib/uniwidth/width0.h
  lib/uniwidth/width2.h
  lib/unsetenv.c
  lib/vasnprintf.c
  lib/vasnprintf.h
  lib/vasprintf.c
  lib/verify.h
  lib/warn-on-use.h
  lib/wchar.in.h
  lib/wctype-h.c
  lib/wctype.in.h
  lib/xalloc-oversized.h
  lib/xsize.c
  lib/xsize.h
  m4/00gnulib.m4
  m4/absolute-header.m4
  m4/access.m4
  m4/alloca.m4
  m4/assert_h.m4
  m4/c-bool.m4
  m4/close.m4
  m4/codeset.m4
  m4/dup2.m4
  m4/eealloc.m4
  m4/environ.m4
  m4/errno_h.m4
  m4/euidaccess.m4
  m4/exponentd.m4
  m4/extensions-aix.m4
  m4/extensions.m4
  m4/extern-inline.m4
  m4/fcntl-o.m4
  m4/fcntl.m4
  m4/fcntl_h.m4
  m4/float_h.m4
  m4/free.m4
  m4/getdelim.m4
  m4/getdtablesize.m4
  m4/getgroups.m4
  m4/getline.m4
  m4/gnulib-common.m4
  m4/group-member.m4
  m4/host-cpu-c-abi.m4
  m4/iconv.m4
  m4/include_next.m4
  m4/inline.m4
  m4/intmax_t.m4
  m4/inttypes.m4
  m4/inttypes_h.m4
  m4/largefile.m4
  m4/lib-ld.m4
  m4/lib-link.m4
  m4/lib-prefix.m4
  m4/libunistring-base.m4
  m4/libunistring.m4
  m4/limits-h.m4
  m4/locale-en.m4
  m4/locale-ja.m4
  m4/locale-zh.m4
  m4/locale_h.m4
  m4/malloc.m4
  m4/malloca.m4
  m4/math_h.m4
  m4/mbrtowc.m4
  m4/mbstate_t.m4
  m4/memchr.m4
  m4/mmap-anon.m4
  m4/msvc-inval.m4
  m4/msvc-nothrow.m4
  m4/multiarch.m4
  m4/musl.m4
  m4/off64_t.m4
  m4/off_t.m4
  m4/pathmax.m4
  m4/pid_t.m4
  m4/printf.m4
  m4/rawmemchr.m4
  m4/realloc.m4
  m4/setenv.m4
  m4/size_max.m4
  m4/ssize_t.m4
  m4/stat-time.m4
  m4/stat.m4
  m4/std-gnu11.m4
  m4/stddef_h.m4
  m4/stdint.m4
  m4/stdint_h.m4
  m4/stdio_h.m4
  m4/stdlib_h.m4
  m4/strchrnul.m4
  m4/string_h.m4
  m4/strndup.m4
  m4/strnlen.m4
  m4/sys_stat_h.m4
  m4/sys_types_h.m4
  m4/time_h.m4
  m4/uchar_h.m4
  m4/unicase_h.m4
  m4/unictype_h.m4
  m4/uninorm_h.m4
  m4/unistd_h.m4
  m4/vararrays.m4
  m4/vasnprintf.m4
  m4/vasprintf.m4
  m4/warn-on-use.m4
  m4/wchar_h.m4
  m4/wctype_h.m4
  m4/wint_t.m4
  m4/xsize.m4
  m4/zzgnulib.m4
])
