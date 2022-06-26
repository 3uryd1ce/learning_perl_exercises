#!/usr/bin/env perl

# Write a program that prompts for and reads two numbers (on separate
# lines of input) and prints out the product of the two numbers
# multiplied together.

use strict;
use warnings;

print "Input the first number:", "\n";
my $first_number = <STDIN>;

print "Input the second number:", "\n";
my $second_number = <STDIN>;

print $first_number * $second_number, "\n";
