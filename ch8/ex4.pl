#!/usr/bin/env perl

# Modify the program from the previous exercise to use named captures
# instead of relying on $1. Update the code to display that label name,
# something like 'word' contains 'Wilma'.

use strict;
use warnings;
use v5.14;

while (<>) {
	chomp;
	if (/    # begin pattern

	\b       # word boundary
	(?<word> # capture group goes to a label named word
	\w*a)    # any number of word characters followed by a
	\b       # word boundary

	/xpa) {  # end pattern
		print "Matched: |${^PREMATCH}<${^MATCH}>${^POSTMATCH}|", "\n";
		print "'word' contains '$+{word}'", "\n";
	} else {
		print "No match: |$_|", "\n";
	}
}
