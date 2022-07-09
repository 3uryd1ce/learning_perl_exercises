#!/usr/bin/env perl

# Make a program that looks through a given string for every occurrence
# of a given substring, printing out the positions where the substring
# is found. For example, given the input string "This is a test." and
# the substring "is", it should report positions 2 and 5. If the
# substring were "a", it should report 8. What does it report if the
# substring is "t"?

use strict;
use warnings;
use v5.10; # say

say "Please enter a string to search:";
chomp(my $given_string = <STDIN>);

say "Please enter a substring to find:";
chomp(my $given_substring = <STDIN>);

my $position = 0;

while (($position = index $given_string, $given_substring, $position) != -1) {
	say "'$given_substring' was found at $position in '$given_string'";
	$position++;
}
