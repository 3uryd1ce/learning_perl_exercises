#!/usr/bin/env perl

# Make a pattern that will match three consecutive copies of whatever is
# currently contained in $what. That is, if $what is fred, your pattern
# should match fred fredfred. If $what is fred|barney, your pattern
# should match fredfredbarney or barneyfredfred or barneybarneybarney or
# many other variations. (Hint: you should set $what at the top of the
# pattern test program with a statement like my $what = 'fred|barney';.)

use strict;
use warnings;

my $what = 'fred|barney';

while (<>) {
	if (/($what){3}/) {
		print $_, "\n";
	}
}
