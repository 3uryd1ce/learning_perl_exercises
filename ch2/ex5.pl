#!/usr/bin/env perl

# Write a program that prompts for and reads a string and a number (on
# separate lines of input) and prints out the string the number of times
# indicated by the number on separate lines. (Hint: use the x operator.)
# If the user enters "fred" and "3", the output should be three lines,
# each saying "fred". If the user enters "fred" and "299792," there may
# be a lot of output.

use strict;
use warnings;

print "Input a string:", "\n";
my $string = <STDIN>;

print "Input the number of times the string will be repeated:", "\n";
my $repeats = <STDIN>;

print $string x $repeats, "\n";
