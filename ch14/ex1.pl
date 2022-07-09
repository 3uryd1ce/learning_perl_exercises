#!/usr/bin/env perl

# Write a program to read in a list of numbers and sort them
# numerically, print ing out the resulting list in a right-justified
# column. Try it out on this sample data:
#
# 17 1000 04 1.50 3.14159 –10 1.5 4 2001 90210 666

use strict;
use warnings;
use v5.14; # character set modifier

my @numbers;
my $greatest_length = 0;

while (<>) {
	chomp;
	unless (/\A -? [\d.]+ \z/ax) {
		warn "'$_' is not a number from start to finish.\n";
		next;
	}

	$greatest_length = length if ($greatest_length < length);

	push @numbers, $_;
}

my @sorted_numbers = sort { $a <=> $b } @numbers;

printf "%${greatest_length}g\n" x @sorted_numbers, @sorted_numbers;
