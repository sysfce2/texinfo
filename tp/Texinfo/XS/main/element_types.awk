# Copyright 2014-2024 Free Software Foundation, Inc.
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3 of the License,
# or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#

BEGIN {
    if (srcdir == "") {
        srcdir = "."
    }
    ETH = srcdir "/element_types.h"
    ETC = srcdir "/element_types.c"
    ETD = srcdir "/types_data.c"

    print "/* This file automatically generated by element_types.awk */" > ETH
    print "#ifndef ELEMENT_TYPES_H"                                      > ETH
    print "#define ELEMENT_TYPES_H"                                      > ETH
    print "enum element_type {"                                          > ETH
    print "ET_NONE,"                                                     > ETH

    print "/* This file automatically generated by element_types.awk */" > ETD
    print ""                                                             > ETD
    print "#include \"types_data.h\""                                    > ETD
    print ""                                                             > ETD
    print "TYPE type_data[] = {"                                         > ETD
    print "0, 0,"                                                        > ETD
}

!/^$/ && !/^#/ {
    print "ET_" $1 ","                                                > ETH
    array = array "\"" $1 "\",\n"
    t = $1
    types[t] = $2

    last_type = "ET_" $1
}


END {
    print "};"                                                        > ETH     
    print                                                             > ETH 
    print "#define TXI_TREE_TYPES_NUMBER (" last_type " +1)"          > ETH
    print                                                             > ETH
    print "extern char *element_type_names[];"                        > ETH
    print "#endif"                                                    > ETH


    print "char *element_type_names[] = {"                            > ETC
    print "0,"                                                        > ETC     
    print array                                                       > ETC     
    print "};"                                                        > ETC     

    for (t in types) {
        flags_str = ""
        if (types[t] != "") {
            split(types[t], flags_array, ",")
            for (flag_idx in flags_array) {
              if (flag_idx == 1) {
                flags_str = flags_array[flag_idx]
              } else {
                old_str = flags_str
                flags_str = old_str "," flags_array[flag_idx]
              }
            }
        }
        if (flags_str == "") {
            flags = "0"
        } else {
            flags = "TF_" flags_str
            gsub (/,/, " | TF_", flags)
        }
        print "\"" t "\", " flags "," > ETD
    }
    print "};" > ETD
}

function output_array (string)
{
    print string > ETC
}
