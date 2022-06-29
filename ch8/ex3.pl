#!/usr/bin/env perl

# Modify the program from the previous exercise so that the word ending
# with the letter a is captured into $1. Update the code to display that
# variable's contents in single quotes, something like $1 contains
# 'Wilma'.

use strict;
use warnings;
use v5.14;

while (<>) {
	chomp;
	if (/   # begin pattern

	\b      # word boundary
	(\w*a)  # any number of word characters followed by 'a'
	\b      # word boundary

	/xpa) { # end of pattern
		print "Matched: |${^PREMATCH}<${^MATCH}>${^POSTMATCH}|", "\n";
		print "\$1 contains '$1'", "\n";
	} else {
		print "No match: |$_|", "\n";
	}
}
