#!/usr/bin/env perl

# Write a new program (not the test program!) that prints out any input
# line ending with whitespace (other than just a newline). Put a marker
# character at the end of the output line so as to make the whitespace
# visible.

use strict;
use warnings;
use v5.14;

while (<>) {
	chomp;

	if (/\s\z/a) {
		print "This line ends in whitespace: {$_}", "\n";
	}
}
