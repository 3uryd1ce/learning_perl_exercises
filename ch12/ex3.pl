#!/usr/bin/env perl

# Make a program that uses stacked file test operators to list all files
# named on the command line that are readable, writable, and owned by
# you.

use strict;
use warnings;

@ARGV or die "File names must be provided as arguments.\n";

for (@ARGV) {
	if ( -r -w -o $_ ) {
		print "$_ is readable, writable, and owned by " . getpwuid($<) . "\n";
	}
}
