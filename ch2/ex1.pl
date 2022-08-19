#!/usr/bin/env perl

# Write a program that computes the circumference of a circle with a
# radius of 12.5. Circumference is 2 times pi times the radius
# (approximately 2 times 3.141592654). The answer you get should be
# about 78.5.

use strict;
use warnings;

my $radius = 12.5;
my $approx_pi = 3.141592654;

print 2 * $radius * $approx_pi, "\n";
