#!/usr/bin/env perl

# Using the pattern test program, make a pattern to match the string
# match. Try the program with the input string beforematchafter. Does
# the output show the three parts of the match in the right order?

use strict;
use warnings;

while (<>) {
	chomp;
	if (/match/p) {
		print "Matched: |${^PREMATCH}<${^MATCH}>${^POSTMATCH}|", "\n";
	}
	else {
		print "No match: |$_|", "\n";
	}
}
