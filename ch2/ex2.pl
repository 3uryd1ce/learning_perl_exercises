#!/usr/bin/env perl

# Modify the program from the previous exercise to prompt for and accept
# a radius from the person running the program. So, if the user enters
# 12.5 for the radius, she should get the same number as in the previous
# exercise.

use strict;
use warnings;

print "Input a radius:", "\n";

my $radius = <STDIN>;
my $approx_pi= 3.141592654;

print 2 * $radius * $approx_pi, "\n";
