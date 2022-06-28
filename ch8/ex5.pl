#!/usr/bin/perl

# Extra credit exercise: modify the program from the previous exercise
# so that immediately following the word ending in a it will also
# capture up-to-five characters (if there are that many characters, of
# course) in a separate capture variable. Update the code to display
# both capture variables. For example, if the input string says I saw
# Wilma yesterday, the up-to-five characters are "yest". If the input is
# I, Wilma!, the extra capture should have just one character. Does your
# pattern still match just plain wilma?

use strict;
use warnings;
use v5.10;

while (<>) {
	chomp;
	if (/    # begin pattern

	\b       # begin word boundary
	(\w*a)   # any number of word characters followed by 'a'
	\b       # end word boundary

	(.{0,5}) # up to five non whitespace characters

	/xpa) {  # end pattern
		print "Matched: |${^PREMATCH}<${^MATCH}>${^POSTMATCH}|\n";
		print "\$1 contains '$1'\n";
		print "\$2 contains '$2'\n";
	} else {
		print "No match: |$_|\n";
	}
}
