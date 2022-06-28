#!/usr/bin/env perl

# Using the pattern test program, make a pattern that matches if any
# word (in the \w sense of word) ends with the letter a. Does it match
# wilma but not barney? Does it match Mrs. Wilma Flintstone? What about
# wilma&fred? Try it on the sample text file from the Exercises in
# Chapter 7 (and add these test strings if they weren’t already in
# there).

use strict;
use warnings;
use v5.10;

while (<>) {
	chomp;
	if (/   # begin pattern

	\b      # word boundary
	\w*a    # any number of word characters followed by 'a'
	\b      # word boundary

	/xpa) { # end pattern
		print "Matched: |${^PREMATCH}<${^MATCH}>${^POSTMATCH}|\n";
	} else {
		print "No match: |$_|\n";
	}
}
