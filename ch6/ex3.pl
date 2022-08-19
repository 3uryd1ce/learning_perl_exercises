#!/usr/bin/env perl

# Write a program to list all of the keys and values in %ENV. Print the
# results in two columns in ASCIIbetical order. For extra credit,
# arrange the output to vertically align both columns. The length
# function can help you figure out how wide to make the first column.
# Once you get the program running, try setting some new environment
# variables and ensuring that they show up in your output.

use strict;
use warnings;

my $width = 0;

for ( keys %ENV ) {
	if ( length > $width ) {
		$width = length;
	}
}

for ( sort keys %ENV ) {
	printf "%-${width}s %s\n", $_, $ENV{$_};
}
