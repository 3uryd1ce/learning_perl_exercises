#!/usr/bin/env perl

# Modify the program from the previous exercise so that, if the user
# enters a number less than zero, the reported circumference will be
# zero, rather than negative.

use strict;
use warnings;

print "Input a radius:", "\n";

my $radius = <STDIN>;
my $approx_pi= 3.141592654;

if ($radius < 0) {
	print 0, "\n";
} else {
	print 2 * $radius * $approx_pi, "\n";
}
