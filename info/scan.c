/* scan.c -- scanning Info files and nodes

   Copyright 1993-2025 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.

   Originally written by Brian Fox. */

#include "info.h"
#include "session.h"
#include "scan.h"
#include "util.h"
#include "search.h"
#include "tag.h"

#include <langinfo.h>
#if HAVE_ICONV
# include <iconv.h>
#endif

/* Variable which holds the most recent filename parsed as a result of
   calling info_parse_xxx (). */
char *info_parsed_filename = NULL;

/* Variable which holds the most recent nodename parsed as a result of
   calling info_parse_xxx (). */
char *info_parsed_nodename = NULL;

/* Read a filename surrounded by "(" and ")", accounting for matching
   characters, and place it in *FILENAME if FILENAME is not null.  Return
   length of read filename.  On error, set *FILENAME to null and return 0.  */
static size_t
read_bracketed_filename (char *string, char **filename)
{
  register size_t i = 0;
  int count = 0; /* Level of nesting. */
  int first_close = -1; /* First ")" encountered. */

  if (*string != '(')
    return 0;

  string++;
  count = 1;
  for (i = 0; string[i]; i++)
    {
      if (string[i] == '(')
        count++;
      else if (string[i] == ')')
        {
          if (first_close == -1)
            first_close = i;

          count--;
          if (count == 0)
            break;
        }
    }

  /* If string ended before brackets were balanced, take the first ")" as
     terminating the filename. */
  if (count > 0)
    {
      if (first_close == -1)
        {
          if (filename)
            *filename = 0;
          return 0;
        }
      i = first_close;
    }

  if (filename)
    {
      *filename = xcalloc (1, i + 1);
      memcpy (*filename, string, i);
    }

  return i + 2; /* Length of filename plus "(" and ")". */
}

/* Parse the filename and nodename out of STRING, saving in
   INFO_PARSED_FILENAME and INFO_PARSED_NODENAME.  These variables should not
   be freed by calling code.  If either is missing, the relevant variable is
   set to a null pointer. */
void
info_parse_node (char *string)
{
  int nodename_len;

  free (info_parsed_filename);
  free (info_parsed_nodename);
  info_parsed_filename = 0;
  info_parsed_nodename = 0;

  /* Special case of nothing passed.  Return nothing. */
  if (!string || !*string)
    return;

  string += skip_whitespace_and_newlines (string);

  string += read_bracketed_filename (string, &info_parsed_filename);

  /* Parse out nodename. */
  string += skip_whitespace_and_newlines (string);
  nodename_len = read_quoted_string (string, "", 0, &info_parsed_nodename);

  if (nodename_len != 0)
    {
      canonicalize_whitespace (info_parsed_nodename);
    }
}

#define INFO_QUOTE '\177'
#define INFO_QUOTE_STR "\177"

/* Set *OUTPUT to a copy of the string starting at START and finishing at
   a character in TERMINATOR, unless START[0] == INFO_QUOTE, in which case
   copy string from START+1 until the next occurence of INFO_QUOTE.  If
   TERMINATOR is an empty string, finish at a null character.   LINES is
   the number of lines that the string can span.  If LINES is zero, there is no
   limit.  Return length of string including any quoting characters.  Return
   0 if input was invalid. */
size_t
read_quoted_string (char *start, char *terminator, size_t lines, char **output)
{
  size_t len;
  char *nl = 0, saved_char;

  if (lines)
    {
      size_t i;
      nl = start;
      for (i = 0; i < lines; i++)
        {
          nl = strchr (nl, '\n');
          if (!nl)
            break; /* End of input string reached. */
          nl++;
        }
      if (nl)
        {
          saved_char = *nl;
          *nl = '\0';
        }
    }

  if (start[0] != INFO_QUOTE)
    {
      len = strcspn (start, terminator);

      if (*terminator && !start[len])
        {
          len = 0;
          *output = 0;
        }
      else
        {
          *output = xmalloc (len + 1);
          strncpy (*output, start, len);
          (*output)[len] = '\0';
        }
    }
  else
    {
      len = strcspn (start + 1, INFO_QUOTE_STR);

      if (*terminator && !(start + 1)[len])
        {
          /* No closing quote byte. */
          len = 0;
          *output = 0;
        }
      else
        {
          *output = xmalloc (len + 1);
          strncpy (*output, start + 1, len);
          (*output)[len] = '\0';
          len += 2; /* Count the two quote bytes. */
        }

    }

  if (nl)
    *nl = saved_char;
  return len;
}


/* **************************************************************** */
/*                                                                  */
/*                  Finding and Building Menus                      */
/*                                                                  */
/* **************************************************************** */

/* Get the entry associated with LABEL in the menu of NODE.  Return a
   pointer to the ENTRY if found, or null.  Return value should not
   be freed by caller.  If SLOPPY, allow initial matches, like
   "Buffers" for a LABEL "buffer". */
const REFERENCE *
info_get_menu_entry_by_label (const NODE *node, const char *label, int sloppy)
{
  register int i;
  int best_guess = -1;
  REFERENCE *entry;
  REFERENCE **references = node->references;

  if (!references)
    return 0;

  for (i = 0; (entry = references[i]); i++)
    {
      if (entry->type != REFERENCE_MENU_ITEM)
        continue;
      if (mbscasecmp (label, entry->label) == 0)
        return entry; /* Exact, case-insensitive match. */
      else if (sloppy && best_guess == -1
               && (mbsncasecmp (entry->label, label, strlen (label)) == 0))
        best_guess = i;
    }

  if (sloppy && best_guess != -1)
    return references[best_guess];

  return 0;
}

/* A utility function for concatenating REFERENCE **.  Returns a new
   REFERENCE ** which is the concatenation of REF1 and REF2.  */
REFERENCE **
info_concatenate_references (REFERENCE * const *ref1,
                             REFERENCE * const *ref2)
{
  register int i, j;
  REFERENCE **result;
  int size = 0;

  /* Get the total size of the slots that we will need. */
  if (ref1)
    {
      for (i = 0; ref1[i]; i++);
      size += i;
    }

  if (ref2)
    {
      for (i = 0; ref2[i]; i++);
      size += i;
    }

  result = xmalloc ((1 + size) * sizeof (REFERENCE *));

  /* Copy the contents over. */

  j = 0;
  if (ref1)
    {
      for (i = 0; ref1[i]; i++)
        result[j++] = ref1[i];
    }

  if (ref2)
    {
      for (i = 0; ref2[i]; i++)
        result[j++] = ref2[i];
    }

  result[j] = NULL;
  return result;
}

/* Copy a reference structure.  Copy each field into new memory.  */
REFERENCE *
info_copy_reference (const REFERENCE *src)
{
  REFERENCE *dest = xmalloc (sizeof (REFERENCE));
  dest->label = src->label ? xstrdup (src->label) : NULL;
  dest->filename = src->filename ? xstrdup (src->filename) : NULL;
  dest->nodename = src->nodename ? xstrdup (src->nodename) : NULL;
  dest->start = src->start;
  dest->end = src->end;
  dest->line_number = src->line_number;
  dest->type = src->type;

  return dest;
}

/* Copy a list of references, copying in reference in turn with
   info_copy_reference. */
REFERENCE **
info_copy_references (REFERENCE * const *ref1)
{
  int i;
  REFERENCE **result;
  int size;

  if (!ref1)
    return 0;

  /* Get the total size of the slots that we will need. */
  for (i = 0; ref1[i]; i++);
  size = i;

  result = xmalloc ((1 + size) * sizeof (REFERENCE *));

  /* Copy the contents over. */
  for (i = 0; ref1[i]; i++)
    result[i] = info_copy_reference (ref1[i]);
  result[i] = NULL;

  return result;
}

void
info_reference_free (REFERENCE *ref)
{
  if (ref)
    {
      free (ref->label);
      free (ref->filename);
      free (ref->nodename);
      free (ref);
    }
}

/* Free the data associated with REFERENCES. */
void
info_free_references (REFERENCE **references)
{
  register int i;
  REFERENCE *entry;

  if (references)
    {
      for (i = 0; references && (entry = references[i]); i++)
        info_reference_free (entry);

      free (references);
    }
}

/* Return new REFERENCE with filename and nodename fields set. */
REFERENCE *
info_new_reference (const char *filename, const char *nodename)
{
  REFERENCE *r = xmalloc (sizeof (REFERENCE));
  r->label = 0;
  r->filename = filename ? xstrdup (filename) : 0;
  r->nodename = nodename ? xstrdup (nodename) : 0;
  r->start = 0;
  r->end = 0;
  r->line_number = 0;
  r->type = 0;
  return r;
}

/* Free a NODE object that is suitable for being placed in a window. */
void
free_history_node (NODE *n)
{
  if (n && (n->flags & N_IsInternal))
    {
      free (n->contents);
      info_free_references (n->references);
      free (n->next); free (n->prev); free (n->up);
      free (n->nodename);
    }
  free (n);
}



/* Search for sequences of whitespace or newlines in STRING, replacing
   all such sequences with just a single space.  Remove whitespace from
   start and end of string. */
void
canonicalize_whitespace (char *string)
{
  register int i, j;
  int len, whitespace_found, whitespace_loc = 0;
  char *temp;

  if (!string)
    return;

  len = strlen (string);
  temp = xmalloc (1 + len);

  /* Search for sequences of whitespace or newlines.  Replace all such
     sequences in the string with just a single space. */

  whitespace_found = 0;
  for (i = 0, j = 0; string[i]; i++)
    {
      if (whitespace_or_newline (string[i]))
        {
          whitespace_found++;
          whitespace_loc = i;
          continue;
        }
      else
        {
          if (whitespace_found && whitespace_loc)
            {
              whitespace_found = 0;

              /* Suppress whitespace at start of string. */
              if (j)
                temp[j++] = ' ';
            }

          temp[j++] = string[i];
        }
    }

  /* Kill trailing whitespace. */
  if (j && whitespace (temp[j - 1]))
    j--;

  temp[j] = '\0';
  strcpy (string, temp);
  free (temp);
}



/* **************************************************************** */
/*                                                                  */
/*                          Scanning node                           */
/*                                                                  */
/* **************************************************************** */

/* Whether to strip syntax from the text of nodes. */
int preprocess_nodes_p;

/* Whether contents of nodes should be rewritten. */
static int rewrite_p;

/* inptr is moved forward through the body of a node. */
static char *inptr;

/* Pointer to first byte of node (after node separator). */
static char *input_start;

/* Number of bytes in node contents. */
static size_t input_length;

struct text_buffer output_buf;

/* Pointer into a tags table for the file to the anchor we need to adjust as
   a result of byte counts changing due to character encoding conversion or
   inserted/deleted text. */
static TAG **anchor_to_adjust;
/* Offset within file buffer of first byte of node, used for anchor
   adjustment. */
static int node_offset;

/* Difference so far between the number of bytes input in the file and
   bytes output.  Used to adjust the values of anchors in nodes. */
static long int output_bytes_difference;

/* Whether we are converting the character encoding of the file. */
static int convert_encoding_p;

#if HAVE_ICONV

/* Whether text in file is encoded in UTF-8. */
static int file_is_in_utf8;

/* Used for conversion from file encoding to output encoding. */
static iconv_t iconv_to_output;

/* Conversion from file encoding to UTF-8. */
static iconv_t iconv_to_utf8;

#endif /* HAVE_ICONV */

static void
init_conversion (FILE_BUFFER *fb)
{
  char *target_encoding;

  convert_encoding_p = 0;

  /* Node being processed does not come from an Info file. */
  if (!fb)
    return;

#if !HAVE_ICONV
  return;
#else
  file_is_in_utf8 = 0;

  /* Don't process file if encoding is unknown. */
  if (!fb->encoding)
    return;

  /* Read name of character encoding from environment locale */
  target_encoding = nl_langinfo (CODESET);

  /* Don't convert the contents if the locale
     uses the same character encoding as the file */
  if (!strcasecmp(target_encoding, fb->encoding))
    return;

  /* Check if an iconv conversion from file locale to system
     locale exists */
  iconv_to_output = iconv_open (target_encoding, fb->encoding);
  if (iconv_to_output == (iconv_t) -1)
    return; /* Return if no conversion function implemented */

  if (   !strcasecmp ("UTF8",  fb->encoding)
      || !strcasecmp ("UTF-8", fb->encoding))
    file_is_in_utf8 = 1;

  if (!file_is_in_utf8)
    {
      iconv_to_utf8 = iconv_open ("UTF-8", fb->encoding);
      if (iconv_to_utf8 == (iconv_t) -1)
        {
          /* Return if no conversion function implemented */
          iconv_close (iconv_to_output);
          iconv_to_output = (iconv_t) -1;
          return;
        }
    }

  convert_encoding_p = 1;
  rewrite_p = 1;
#endif /* HAVE_ICONV */
}

static void
close_conversion (void)
{
#if HAVE_ICONV
  if (convert_encoding_p)
    {
      iconv_close (iconv_to_output);
      iconv_to_output = (iconv_t) -1;
      if (!file_is_in_utf8) iconv_close (iconv_to_utf8);
    }
#endif
}

static void
init_output_stream (FILE_BUFFER *fb)
{
  init_conversion (fb);
  output_bytes_difference = 0;

  if (rewrite_p)
    text_buffer_init (&output_buf);
}

static size_t saved_offset;
static char *saved_inptr;
static long saved_difference;

static void
save_conversion_state (void)
{
  saved_offset = text_buffer_off (&output_buf);
  saved_inptr = inptr;
  saved_difference = output_bytes_difference;
}

/* Go back to the saved state of the output stream. */
static void
reset_conversion (void)
{
  text_buffer_off (&output_buf) = saved_offset;
  inptr = saved_inptr;
  output_bytes_difference = saved_difference;
}

/* Copy bytes from input to output with no encoding conversion. */
static void
copy_direct (long n)
{
  text_buffer_add_string (&output_buf, inptr, n);
  inptr += n;
}

/* Read one character at *FROM and write out a sequence
   of bytes representing that character in ASCII.  *FROM
   is advanced past the read character. */
static int
degrade_utf8 (char **from, size_t *from_left)
{
  static struct encoding_replacement
  {
    char *from_string;
    char *to_string;
  } er[] = {
    {"\xE2\x80\x98","'"}, /* Opening single quote */
    {"\xE2\x80\x99","'"}, /* Closing single quote */
    {"\xE2\x80\x9C","\""},/* Opening double quote */
    {"\xE2\x80\x9D","\""},/* Closing double quote */
    {"\xC2\xA9","(C)"},   /* Copyright symbol */
    {"\xC2\xBB",">>"},    /* Closing double angle brackets */

    {"\xE2\x86\x92","->"},/* Right arrow */
    {"\xE2\x87\x92","=>"},/* Right double arrow */
    {"\xE2\x8A\xA3","-|"},/* Print symbol */
    {"\xE2\x98\x85","-!-"}, /* Point symbol */
    {"\xE2\x86\xA6","==>"}, /* Expansion symbol */

    {"\xE2\x80\x90","-"},  /* Hyphen */
    {"\xE2\x80\x91","-"},  /* Non-breaking hyphen */
    {"\xE2\x80\x92","-"},  /* Figure dash */
    {"\xE2\x80\x93","-"},  /* En dash */
    {"\xE2\x80\x94","--"},  /* Em dash */
    {"\xE2\x88\x92","-"},  /* Minus sign */
    {"\xE2\x80\xA6","..."},  /* Ellipsis */
    {"\xE2\x80\xA2","*"},  /* Bullet */

    {"\xC3\xA0","a`"},   /* Lower case letter a with grave accent */
    {"\xC3\xA2","a^"},   /* Lower case letter a with circumflex */
    {"\xC3\xA4","a\""},  /* Lower case letter a with diaeresis */
    {"\xC3\xA6","ae"},   /* Lower case letter ae ligature */
    {"\xC3\xA9","e'"},   /* Lower case letter e with acute accent */
    {"\xC3\xA8","e`"},   /* Lower case letter e with grave accent */
    {"\xC3\xAA","e^"},   /* Lower case letter e with circumflex */
    {"\xC3\xAB","e\""},  /* Lower case letter e with diaeresis */
    {"\xC3\xB6","o\""},  /* Lower case letter o with diaeresis */
    {"\xC3\xBC","u\""},  /* Lower case letter u with diaeresis */
    {"\xC3\x84", "A\""},  /* Upper case letter A with diaeresis. */
    {"\xC3\x96", "O\""},  /* Upper case letter O with diaeresis. */
    {"\xC3\x9c", "U\""},  /* Upper case letter U with diaeresis. */

    {"\xC3\xB1","n~"},  /* Lower case letter n with tilde */
    {"\xC3\x87","C,"},  /* Upper case letter C with cedilla */
    {"\xC3\xA7","c,"},  /* Lower case letter c with cedilla */
    {"\xC3\x9f","ss"},  /* Lower case letter sharp s */

    {0, 0}
  };

  struct encoding_replacement *erp;

  for (erp = er; erp->from_string != 0; erp++)
    {
      /* Avoid reading past end of input. */
      size_t width = strlen (erp->from_string);
      if (width > *from_left)
        continue;

      if (!strncmp (erp->from_string, *from, width))
        {
          text_buffer_add_string (&output_buf, erp->to_string,
                                  strlen(erp->to_string));
          *from += width;
          *from_left -= width;
          return 1;
        }
    }

  /* Failing this, just print a question mark.  Maybe we should use SUB
     (^Z) (ASCII substitute character code) instead, or pass through the
     original bytes. */
  text_buffer_add_string (&output_buf, "?", 1);

  /* Ideally we would advance one UTF-8 character.  This would
     require knowing its length in bytes. */
  (*from)++;
  (*from_left)--;

  return 0;
}

/* Convert N bytes from input to output encoding and write to
   output buffer.  Return number of bytes over N written. */
static int
copy_converting (long n)
{
#if !HAVE_ICONV
  return 0;
#else
  size_t bytes_left, orig_bytes_left;
  int extra_at_end;
  size_t iconv_ret;
  long output_start;

  size_t utf8_char_free;
  char utf8_char[4]; /* Maximum 4 bytes in a UTF-8 character */
  char *utf8_char_ptr, *orig_inptr;
  size_t i;

  /* Use n as an estimate of how many bytes will be required
     in target encoding. */
  text_buffer_alloc (&output_buf, (size_t) n);

  output_start = text_buffer_off (&output_buf);
  bytes_left = n;
  extra_at_end = 0;
  while (1)
    {
      iconv_ret = text_buffer_iconv (&output_buf, iconv_to_output,
                                     (ICONV_CONST char **)&inptr, &bytes_left);

      /* Make sure libiconv flushes out the last converted character.
         This is required when the conversion is stateful, in which
         case libiconv might not output the last character, waiting to
         see whether it should be combined with the next one.  */
      if (iconv_ret != (size_t) -1
          && text_buffer_iconv (&output_buf, iconv_to_output,
                                NULL, NULL) != (size_t) -1)
        /* Success: all of input converted. */
        break;

      /* There's been an error while converting. */
      switch (errno)
        {
        case EINVAL:
          /* Incomplete byte sequence at end of input buffer.  Try to read
             more. */

          /* input_length - 2 is offset of last-but-one byte within input.
             This checks if there is at least one more byte within node
             contents. */
          if (inptr - input_start + (bytes_left - 1) <= input_length - 2)
            {
              bytes_left++;
              extra_at_end++;
            }
          else
            {
              copy_direct (bytes_left);
              bytes_left = 0;
            }
          continue;
        default: /* Unknown error */
          info_error (_("Error converting file character encoding"));

          /* Skip past current input and hope we don't get an
             error next time. */
          inptr += bytes_left;
          return 0;
        case EILSEQ:
          /* Byte sequence in input not recognized.  Degrade to ASCII.  */
          break;
        }

      /* Flush any waiting input in iconv_to_output and enter the
         default shift state. */
      text_buffer_iconv (&output_buf, iconv_to_output, NULL, NULL);

      if (file_is_in_utf8)
        {
          degrade_utf8 (&inptr, &bytes_left);
          continue;
        }

      /* If file is not in UTF-8, we degrade to ASCII in two steps:
         first convert the character to UTF-8, then look up a replacement
         string.  Note that mixing iconv_to_output and iconv_to_utf8
         on the same input may not work well if the input encoding
         is stateful.  We could deal with this by always converting to
         UTF-8 first; then we could mix conversions on the UTF-8 stream. */

      /* We want to read exactly one character.  Do this by
         restricting size of output buffer. */
      utf8_char_ptr = utf8_char;
      orig_inptr = inptr;
      orig_bytes_left = bytes_left;
      for (i = 1; i <= 4; i++)
        {
          utf8_char_free = i;
          errno = 0;
          iconv_ret = iconv (iconv_to_utf8, (ICONV_CONST char **)&inptr,
                             &bytes_left, &utf8_char_ptr, &utf8_char_free);
          if ((iconv_ret == (size_t) -1 && errno != E2BIG)
              /* If we managed to convert a character: */
              || utf8_char_ptr > utf8_char)
            break;
        }

      /* errno == E2BIG if iconv ran out of output buffer,
         which is expected. */
      if (iconv_ret == (size_t) -1 && errno != E2BIG)
        {
          /* Character is not recognized.  Copy a single byte.  */
          inptr = orig_inptr;    /* iconv might have incremented inptr  */
          copy_direct (1);
          bytes_left = orig_bytes_left - 1;
        }
      else
        {
          utf8_char_ptr = utf8_char;
          /* i is width of UTF-8 character */
          degrade_utf8 (&utf8_char_ptr, &i);
          /* If we are done, make sure iconv flushes the last character.  */
          if (bytes_left <= 0)
            {
              utf8_char_ptr = utf8_char;
              i = 4;
              iconv (iconv_to_utf8, NULL, NULL,
                     &utf8_char_ptr, &utf8_char_free);
              if (utf8_char_ptr > utf8_char)
                {
                  utf8_char_ptr = utf8_char;
                  degrade_utf8 (&utf8_char_ptr, &i);
                }
            }
        }
    }

  /* Must cast because the difference between unsigned size_t is always
     positive. */
  output_bytes_difference +=
    n - ((signed long) text_buffer_off (&output_buf) - output_start);

  return extra_at_end;
#endif /* HAVE_ICONV */
}

/* Functions below are named from the perspective of the preprocess_nodes_p
   flag being on. */

/* Copy text from input node contents, possibly converting the
   character encoding and adjusting anchor offsets at the same time. */
static void
copy_input_to_output (long n)
{
  if (rewrite_p)
    {
      long bytes_left;

      bytes_left = n;
      while (bytes_left > 0)
        {
          if (!convert_encoding_p)
            {
              copy_direct (bytes_left);
              bytes_left = 0;
            }
          else
            {
              long bytes_to_convert;
              long extra_written;

              bytes_to_convert = bytes_left;

              if (anchor_to_adjust)
                {
                  /* Check there is an anchor in the input. */
                  long first_anchor =
                    (*anchor_to_adjust)->nodestart - node_offset;

                  if (first_anchor < 0)
                    anchor_to_adjust = 0; /* error in input file */
                  else if (first_anchor < (inptr-input_start) + bytes_left)
                    {
                      /* Convert enough to pass the first anchor in input. */
                      bytes_to_convert = first_anchor - (inptr-input_start)+1;
                      if (bytes_to_convert < 0)
                        {
                          bytes_to_convert = bytes_left;
                          anchor_to_adjust = 0;
                        }
                    }
                }

              /* copy_converting may read more than bytes_to_convert
                 bytes if its input ends in an incomplete byte sequence. */
              extra_written = copy_converting (bytes_to_convert);

              bytes_left -= bytes_to_convert + extra_written;
            }

          /* Check if we have gone past any anchors and
             adjust with output_bytes_difference. */
          if (anchor_to_adjust)
            while ((*anchor_to_adjust)->nodestart - node_offset
                   <= inptr - input_start)
              {
                (*anchor_to_adjust)->nodestart_adjusted
                   = (*anchor_to_adjust)->nodestart - output_bytes_difference;

                anchor_to_adjust++;
                if (!*anchor_to_adjust
                    || !((*anchor_to_adjust)->flags & T_IsAnchor))
                  {
                    anchor_to_adjust = 0;
                    break;
                  }
              }
        }
    }
  else
    inptr += n;
}

static void
skip_input (size_t n)
{
  if (preprocess_nodes_p)
    {
      inptr += n;
      output_bytes_difference += n;
    }
  else if (rewrite_p)
    {
      /* We are expanding tags only.  Do not skip input. */
      copy_input_to_output (n);
    }
  else
    {
      inptr += n;
    }
}

static void
write_extra_bytes_to_output (char *input, long n)
{
  if (preprocess_nodes_p)
    {
      text_buffer_add_string (&output_buf, input, n);
      output_bytes_difference -= n;
    }
}

/* Like write_extra_bytes_to_output, but writes bytes even when
   preprocess_nodes=Off.  Note n could be 0 for an index tag. */
static void
write_tag_contents (char *input, long n)
{
  if (rewrite_p && n > 0)
    {
      text_buffer_add_string (&output_buf, input, n);
      output_bytes_difference -= n;
    }
}

/* Like skip_input, but skip even when !preprocess_nodes_p. */
static void
skip_tag_contents (long n)
{
  if (rewrite_p)
    {
      inptr += n;
      output_bytes_difference += n;
    }
}

/* Read first line of node and set next, prev and up. */
static void
parse_top_node_line (NODE *node)
{
  char **store_in = 0;
  char *nodename;
  char *ptr;
  size_t value_length;

  /* If the first line is empty, leave it in.  This is the case
     in the index-apropos window. */
  if (*node->contents == '\n')
    return;

  node->next = node->prev = node->up = 0;
  ptr = node->contents;

  while (1)
    {
      store_in = 0;

      ptr += skip_whitespace (ptr);

      /* Check what field we are looking at */
      if (!strncasecmp (ptr, INFO_FILE_LABEL, strlen(INFO_FILE_LABEL)))
        {
          ptr += strlen (INFO_FILE_LABEL);
        }
      else if (!strncasecmp (ptr, INFO_NODE_LABEL, strlen(INFO_NODE_LABEL)))
        {
          ptr += strlen (INFO_NODE_LABEL);
        }
      else if (!strncasecmp (ptr, INFO_PREV_LABEL, strlen(INFO_PREV_LABEL)))
        {
          ptr += strlen (INFO_PREV_LABEL);
          store_in = &node->prev;
        }
      else if (!strncasecmp (ptr, INFO_ALTPREV_LABEL,
                             strlen(INFO_ALTPREV_LABEL)))
        {
          ptr += strlen (INFO_ALTPREV_LABEL);
          store_in = &node->prev;
        }
      else if (!strncasecmp (ptr, INFO_NEXT_LABEL, strlen(INFO_NEXT_LABEL)))
        {
          ptr += strlen (INFO_NEXT_LABEL);
          store_in = &node->next;
        }
      else if (!strncasecmp (ptr, INFO_UP_LABEL, strlen(INFO_UP_LABEL)))
        {
          ptr += strlen (INFO_UP_LABEL);
          store_in = &node->up;
        }
      else
        {
          store_in = 0;
          /* Not recognized - code below will skip to next comma */
        }
      ptr += skip_whitespace (ptr);

      /* Get length of a bracketed filename component. */
      if (*ptr != '(')
        value_length = 0;
      else
        value_length = read_bracketed_filename (ptr, 0);

      /* Get length of node name, or filename if following "File:".  Note
         that "." is not included in the second argument here in order to
         support this character in file names. */
      value_length += read_quoted_string (ptr + value_length,
                                          "\n\r\t,", 1, &nodename);
      if (store_in)
        {
          *store_in = xmalloc (value_length + 1);
          strncpy (*store_in, ptr, value_length);
          (*store_in)[value_length] = '\0';
        }

      free (nodename);
      ptr += value_length;

      if (*ptr == '\n' || !*ptr)
        break;

      ptr += 1; /* Point after field terminator */
    }
}

/* Output, replace or hide text introducing a reference.  INPTR starts on
   the first byte of a sequence introducing a reference and finishes on the
   first (non-whitespace) byte of the reference label. */
static int
scan_reference_marker (REFERENCE *entry, int in_parentheses)
{
  /* When preprocess_nodes is Off, we position the cursor on
     the "*" when moving between references. */
  if (!preprocess_nodes_p)
    {
      if (rewrite_p)
        entry->start = text_buffer_off(&output_buf);
      else
        entry->start = inptr - input_start;
    }

  /* Check what we found based on first character of match */
  if (inptr[0] == '\n')
    {
      entry->type = REFERENCE_MENU_ITEM;
      if (!preprocess_nodes_p)
        entry->start++;
    }
  else
    entry->type = REFERENCE_XREF;

  if (entry->type == REFERENCE_MENU_ITEM)
    copy_input_to_output (strlen ("\n* "));
  else
    {
      /* Only match "*Note" if it is followed by a whitespace character so that
         it will not be recognized if, e.g., it is surrounded in inverted
         commas. */
      if (!strchr (" \t\r\n", inptr[strlen ("*Note")]))
        {
          copy_input_to_output (strlen ("*Note:"));
          return 0;
        }

      /* Cross-references can be generated by four different Texinfo
         commands.  @inforef and @xref output "*Note " in Info format,
         and "See" in HTML and print.  @ref and @pxref output "*note "
         in Info format, and either nothing at all or "see" in HTML
         and print.  Unfortunately, there is no easy way to distinguish
         between these latter two cases. */
      /* TODO: Internationalize these strings, but only if we know the
         language of the document. */
      if (inptr[1] == 'N')
        {
          write_extra_bytes_to_output ("See", 3);
          in_parentheses = 1;
        }
      else if (in_parentheses)
        {
          write_extra_bytes_to_output ("see", 3);
          /* Only output the "see" for input like "(*note ...)", which
             would have come from a use of @pxref.  We used to output "see" for
             "*note" in more circumstances, with a list of words where to
             suppress it (to avoid "see *note" turning into "see see"), but
             such a list can't be complete or reliable.  It's better to remove
             it with more enthusiasm, then if the document writer wants a "see"
             to appear, they can add one themselves. */
        }

      skip_input (strlen ("*Note"));
      if (!in_parentheses)
        skip_input (skip_whitespace (inptr));
    }

  /* Copy any white space before label. */
  copy_input_to_output (skip_whitespace_and_newlines (inptr));

  return 1;
}

/* Output reference label and update ENTRY.  INPTR should be on the first
   non-whitespace byte of label when this function is called.  It is left
   at the first character after the colon terminating the label.  Return 0 if
   invalid syntax is encountered. */
static int
scan_reference_label (REFERENCE *entry, int in_index)
{
  size_t max_lines;
  size_t len, label_len = 0;

  /* Handle case of cross-reference like (FILE)NODE::. */
  if (inptr[0] == '(' && !in_index)
    label_len = read_bracketed_filename (inptr, &entry->filename);

  /* Search forward to ":" to get label name.  Cross-references may have
     a newline in the middle. */
  if (entry->type == REFERENCE_MENU_ITEM)
    max_lines = 1;
  else
    max_lines = 2;
  if (!in_index || inptr[label_len] == INFO_QUOTE)
    {
      len = read_quoted_string (inptr + label_len, ":", max_lines,
                                &entry->nodename);
      canonicalize_whitespace (entry->nodename);
      if (!len && !entry->filename)
        return 0; /* Input invalid. */
      label_len += len;
    }
  else
    {
      /* If in an index node, go forward to the last colon on the line
         (not preceded by a newline, NUL or DEL).  This is in order to
         support index entries containing colons.  This should work fine
         as long as the node name does not contain a colon as well. */

      char *p;
      size_t n, m = 0;
      p = inptr + label_len;

      while (1)
        {
          n = strcspn (p, ":\n");
          if (p[n] == ':')
            {
              m += n + 1;
              p += n + 1;
              continue;
            }
          break;
        }
      if (m == 0)
        return 0; /* no : found */
      label_len += m - 1;
    }

#if HAVE_ICONV
  if (iconv_to_output != (iconv_t) -1 && iconv_to_output != (iconv_t) 0)
    {
      static struct text_buffer label_text;
      size_t iconv_ret;
      size_t inbytesleft = label_len;
      char *p = inptr;
      text_buffer_reset (&label_text);
      text_buffer_alloc (&label_text, label_len);

      while (1)
        {
          iconv_ret = text_buffer_iconv (&label_text, iconv_to_output,
                                         (ICONV_CONST char **)&p,
                                         &inbytesleft);

          /* Make sure libiconv flushes out the last converted character. */
          if (iconv_ret != (size_t) -1
                && text_buffer_iconv (&label_text, iconv_to_output,
                       NULL, NULL) != (size_t) -1)
            break; /* Success: all of input converted. */

          /* There's been an error while converting. */
          goto no_convert;
        }

      text_buffer_add_char (&label_text, '\0');
      entry->label = strdup (label_text.base);
    }
  else
#endif
    {
  no_convert:
      entry->label = xmalloc (label_len + 1);
      memcpy (entry->label, inptr, label_len);
      entry->label[label_len] = '\0';
    }
  canonicalize_whitespace (entry->label);

  if (preprocess_nodes_p)
    entry->start = text_buffer_off (&output_buf);

  /* Write text of label. */
  copy_input_to_output (label_len);

  if (rewrite_p)
    entry->end = text_buffer_off (&output_buf);
  else
    entry->end = inptr - input_start;

  /* Colon after label. */
  if (*inptr)
    skip_input (1);
  /* Don't mess up the margin of a menu description. */
  if (entry->type == REFERENCE_MENU_ITEM)
    write_extra_bytes_to_output (" ", 1);

  return 1;
}

/* INPTR should be at the first character after the colon
   terminating the label.  Return 0 on syntax error. */
static int
scan_reference_target (REFERENCE *entry, NODE *node, int in_parentheses)
{
  size_t i;

  /* This entry continues with a specific target.  Parse the
     file name and node name from the specification. */

  if (entry->type == REFERENCE_XREF)
    {
      size_t length = 0; /* Length of specification */
      char *target_start = inptr;
      char *nl_off = 0;
      size_t space_at_start_of_line = 0;

      length += skip_whitespace_and_newlines (inptr);

      length += read_bracketed_filename (inptr + length, &entry->filename);

      length += skip_whitespace_and_newlines (inptr + length);

      /* Get the node name. */
      length += read_quoted_string (inptr + length, ",.", 2, &entry->nodename);

      skip_input (length);

      /* Check if there is a newline in the target. */
      nl_off = strchr (target_start, '\n');
      if (nl_off)
        {
          if (nl_off < inptr)
            space_at_start_of_line = skip_whitespace (nl_off + 1);
          else
            nl_off = 0;
        }
      canonicalize_whitespace (entry->nodename);

      if (entry->filename)
        {
          /* Heuristic of whether it's worth outputing a newline before the
             filename.  This checks whether the newline appears more
             than half way through the text, and therefore which side is
             longer. */
          if (nl_off
              && nl_off < target_start + (length - space_at_start_of_line) / 2)
            {
              size_t i;
              write_extra_bytes_to_output ("\n", 1);

              for (i = 0; i < space_at_start_of_line; i++)
                write_extra_bytes_to_output (" ", 1);
              skip_input (strspn (inptr, " "));
              nl_off = 0;
            }
          else

          if (*inptr != '\n')
            {
              write_extra_bytes_to_output (" ", 1);
            }
          write_extra_bytes_to_output ("(", 1);
          write_extra_bytes_to_output (entry->filename,
                                       strlen (entry->filename));
          write_extra_bytes_to_output (" manual)",
                                       strlen (" manual)"));
        }

      /* Hide terminating punctuation if we are in a reference
         like "(*note Label:(file)node.)". */
      if (in_parentheses && inptr[0] == '.')
        skip_input (1);

      /* Copy any terminating punctuation before the optional newline. */
      copy_input_to_output (strspn (inptr, ".),"));

      /* Output a newline if one is needed.  Don't do it at the end of
         a paragraph. */
      if (nl_off && *inptr != '\n')
        {
          size_t i;

          write_extra_bytes_to_output ("\n", 1);
          for (i = 0; i < space_at_start_of_line; i++)
            write_extra_bytes_to_output (" ", 1);
          skip_input (strspn (inptr, " "));
        }
    }
  else /* entry->type == REFERENCE_MENU_ITEM */
    {
      size_t line_len;
      size_t length = 0; /* Length of specification */

      length = skip_whitespace (inptr);
      length += read_bracketed_filename (inptr + length, &entry->filename);
      length += strspn (inptr + length, " ");

      /* Get the node name. */
      entry->nodename = 0;
      char *node_start = inptr + length;

      /* First check for . followed by space or end of line. */
      if (*node_start != INFO_QUOTE)
        {
          /* Confine search to present line. */
          char *nl = strchr (node_start, '\n');
          if (nl)
            *nl = '\0';

          char *node_end = strstr (node_start, ". ");
          if (!node_end)
            {
              /* Check for . at end of line. */
              if (nl && nl > node_start && nl[-1] == '.')
                node_end = &nl[-1];
            }

          if (nl)
            *nl = '\n';

          if (node_end)
            {
              entry->nodename = xmalloc (node_end - node_start + 1);
              memcpy (entry->nodename, node_start,
                      node_end - node_start);
              entry->nodename[node_end - node_start] = '\0';
              length += node_end - node_start;
            }
        }
      if (!entry->nodename)
        {
          length += read_quoted_string (inptr + length, ",.\t\n", 2,
                                        &entry->nodename);
        }
      if (inptr[length] == '.') /* A '.' terminating the entry. */
        length++;
      canonicalize_whitespace (entry->nodename);

      if (node->flags & N_IsDir)
        {
          /* Set line_len to length of line so far. */

          char *linestart;
          linestart = memrchr (input_start, '\n', inptr - input_start);
          if (!linestart)
            linestart = input_start;
          else
            linestart++; /* Point to first character after newline. */
          line_len = inptr - linestart;
        }

      if (node->flags & N_IsIndex)
        /* Show the name of the node the index entry refers to. */
        copy_input_to_output (length);
      else
        {
          skip_input (length);

          if ((node->flags & N_IsDir) && inptr[strspn (inptr, " ")] == '\n')
            {
              /* For a dir node, if there is no more text in this line,
                 check if there is a menu entry description in the next
                 line to the right of the end of the label, and display it
                 in this line. */
              skip_input (strspn (inptr, " "));
              if (line_len <= strspn (inptr + 1, " "))
                skip_input (1 + line_len);
            }
          else
            {
              for (i = 0; i < length; i++)
                write_extra_bytes_to_output (" ", 1);
            }
        }

      /* Parse "(line ...)" part of menus, if any.  */
      {
        char *lineptr = inptr;
        /* Skip any whitespace first, and then a newline in case the item
           was so long to contain the ``(line ...)'' string in the same
           physical line.  */
        lineptr += skip_whitespace (inptr);
        if (*lineptr == '\n')
          lineptr += 1 + skip_whitespace (lineptr + 1);

        if (!strncmp (lineptr, "(line ", strlen ("(line ")))
          {
            lineptr += strlen ("(line ");
            entry->line_number = strtol (lineptr, 0, 0);
          }
        else
          entry->line_number = 0;
      }
    }

  return 1;
}

/* BASE is earlier in a block of allocated memory than PTR, and the block
   extends until at least BASE + LEN - 1.  Return PTR[INDEX], unless this
   could be outside the allocated block, in which case return 0. */
static char
safe_string_index (char *ptr, long index, char *base, long len)
{
  long offset = ptr - base;

  if (   offset + index < 0
      || offset + index >= len)
    return 0;

  return ptr[index];
}

/* Process an in index marker ("^@^H[index^@^H]") or an image marker
   ("^@^H[image ...^@^H]"). */
static void
scan_info_tag (NODE *node, int *in_index, FILE_BUFFER *fb)
{
  char *p, *p1;
  struct text_buffer *expansion = xmalloc (sizeof (struct text_buffer));

  p = inptr;
  p1 = p;

  text_buffer_init (expansion);

  if (tag_expand (&p1, input_start + input_length, expansion, in_index))
    {
      if (*in_index)
        node->flags |= N_IsIndex;

      if (!rewrite_p)
        {
          rewrite_p = 1;
          init_output_stream (fb);

          /* Put inptr back to start so that
             copy_input_to_output below gets all
             preceding contents. */
          inptr = node->contents;
        }

      /* Write out up to tag. */
      copy_input_to_output (p - inptr);

      write_tag_contents (text_buffer_base (expansion),
                          text_buffer_off (expansion));
      /* Skip past body of tag. */
      skip_tag_contents (p1 - inptr);
    }
  else
    {
      /* It was not a valid tag. */
      copy_input_to_output (p - inptr + 1);
    }

  text_buffer_free (expansion);
  free (expansion);
}

#define looking_at_string(contents, string) \
  (!strncasecmp (contents, string, strlen (string)))

static char *
forward_to_info_syntax (char *contents)
{
  /* Loop until just before the end of the input.  The '- 3' prevents us
     accessing memory after the end of the input, and none of the strings we
     are looking for are shorter than 3 bytes. */
  while (contents < input_start + input_length - 3)
    {
      /* Menu entry comes first to optimize for the case of looking through a
         long index node. */
      if (looking_at_string (contents, INFO_MENU_ENTRY_LABEL)
          || looking_at_string (contents, INFO_XREF_LABEL)
          || !memcmp (contents, "\0\b[", 3))
        return contents;
      contents++;
    }
  return 0;
}

/* Scan contents of NODE, recording cross-references and similar.

   Convert character encoding of node contents to that of the user if the two
   are known to be different.  If PREPROCESS_NODES_P == 1, remove Info syntax
   in contents.

   If FB is non-null, it is the file containing the node, and TAG_PTR is an
   offset into FB->tags.  If the node contents are rewritten, adjust anchors
   that occur in the node and store adjusted value as TAG->nodestart_adjusted,
   otherwise simply copy TAG->nodestart to TAG->nodestart_adjusted for each
   anchor in the node. */
void
scan_node_contents (NODE *node, FILE_BUFFER *fb, TAG **tag_ptr)
{
  int in_menu = 0;
  char *match;

  REFERENCE **refs = NULL;
  size_t refs_index = 0, refs_slots = 0;

  /* Whether an index tag was seen. */
  int in_index = 0;

  rewrite_p = preprocess_nodes_p;

  init_output_stream (fb);

  if (fb)
    {
      char *file_contents;

      /* Set anchor_to_adjust to first anchor in node, if any. */
      anchor_to_adjust = tag_ptr + 1;
      if (!*anchor_to_adjust)
        anchor_to_adjust = 0;
      else if (*anchor_to_adjust
               && !((*anchor_to_adjust)->flags & T_IsAnchor))
        anchor_to_adjust = 0;

      if (!node->subfile)
        file_contents = fb->contents;
      else
        {
          FILE_BUFFER *f = info_find_subfile (node->subfile);
          if (!f)
            return; /* This shouldn't happen. */
          file_contents = f->contents;
        }
      node_offset = (*tag_ptr)->nodestart
        + skip_node_separator (file_contents + (*tag_ptr)->nodestart);
    }
  else
    anchor_to_adjust = 0;

  /* Initialize refs to point to array of one null pointer in case
     there are no results.  This way we know if refs has been initialized
     even if it is empty. */
  refs = calloc (1, sizeof *refs);
  refs_slots = 1;

  parse_top_node_line (node);

  /* This should be the only time we assign to inptr in this function -
     all other assignment should be done with the helper functions above. */
  inptr = node->contents;
  input_start = node->contents;
  input_length = node->nodelen;


  while ((match = forward_to_info_syntax (inptr))
          && match < node->contents + node->nodelen)
    {
      int in_parentheses = 0;
      REFERENCE *entry;

      /* Write out up to match */
      copy_input_to_output (match - inptr);

      if ((in_menu && match[0] == '\n') || match[0] == '*')
        {
          /* Menu entry or cross reference. */
          /* Create REFERENCE entity. */
          entry = info_new_reference (0, 0);

          if (safe_string_index (inptr, -1, input_start, input_length) == '('
             && safe_string_index (inptr, 1, input_start, input_length) == 'n')
            in_parentheses = 1;

          save_conversion_state ();

          if (!scan_reference_marker (entry, in_parentheses))
            goto not_a_reference;

          if (!scan_reference_label (entry, in_index))
            goto not_a_reference;

          /* If this reference entry continues with another ':' then the target
             of the reference is given by the label. */
          if (*inptr == ':')
            {
              int label_len;
              skip_input (1);
              if (entry->type == REFERENCE_MENU_ITEM)
                write_extra_bytes_to_output (" ", 1);

              /* Remove the DEL bytes from a label like "(FOO)^?BAR^?::". */
              label_len = strlen (entry->label);
              if (label_len >= 2 && entry->label[label_len - 1] == INFO_QUOTE)
                {
                  char *p = strchr (entry->label, INFO_QUOTE);
                  memmove (p, p + 1, label_len - (p - entry->label) - 1);
                  entry->label[label_len - 2] = '\0';
                }
            }
          else
            {
              /* Proceed to read the rest of the reference. */
              /* TODO: we should probably not allow references of the form
                 "(file)node1:node2." or "(file1)node1:(file2)node2", so
                 bail out here if entry->filename is non-null. */

              free (entry->filename); entry->filename = 0;
              free (entry->nodename); entry->nodename = 0;
              if (!scan_reference_target (entry, node, in_parentheses))
                goto not_a_reference;
            }

          if (0)
            {
              char *cur_inptr;

 not_a_reference:
              /* This is not a menu entry or reference.  Do not add to our
                 list. */
              cur_inptr = inptr;
              reset_conversion ();
              copy_input_to_output (cur_inptr - inptr);

              info_reference_free (entry);
              continue;
            }

          add_pointer_to_array (entry, refs_index, refs, refs_slots, 50);
        }
      /* Was "* Menu:" seen?  If so, search for menu entries hereafter. */
      else if (!in_menu && !strncmp (match, INFO_MENU_LABEL,
                               strlen (INFO_MENU_LABEL)))
        {
          in_menu = 1;
          skip_input (strlen ("\n* Menu:"));
          if (*inptr == '\n')
            skip_input (strspn (inptr, "\n") - 1); /* Keep one newline. */

        }
      else if (match[0] == '\0') /* Info tag */
        {
          scan_info_tag (node, &in_index, fb);
        }
      else
        copy_input_to_output (1);
    }

  /* If we haven't accidentally gone past the end of the node, write
     out the rest of it. */
  if (inptr < node->contents + node->nodelen)
    copy_input_to_output ((node->contents + node->nodelen) - inptr);

  /* Null to terminate buffer. */
  if (rewrite_p)
    text_buffer_add_string (&output_buf, "\0", 1);

  /* Free resources used in character encoding conversion. */
  close_conversion ();

  node->references = refs;

  if (rewrite_p)
    {
      if (node->flags & N_WasRewritten)
        free (node->contents);
      node->contents = text_buffer_base (&output_buf);
      node->flags |= N_WasRewritten;

      /* output_buf.off is the offset of the next character to be
         written.  Subtracting 1 gives the offset of our terminating
         null, that is, the length. */
      node->nodelen = text_buffer_off (&output_buf) - 1;
    }
  else if (fb && tag_ptr)
    {
      /* Set nodestart_adjusted for all of the anchors in this node. */
      tag_ptr++;
      while (*tag_ptr && ((*tag_ptr)->flags & T_IsAnchor))
        {
          (*tag_ptr)->nodestart_adjusted = (*tag_ptr)->nodestart
                                             - output_bytes_difference;
          tag_ptr++;
        }
    }
}

