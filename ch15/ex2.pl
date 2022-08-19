#!/usr/bin/env perl

# Write a program using given-when that takes a number as its input,
# then prints "Fizz" if it is divisible by 3, "Bin" if it is divisible
# by 5, and "Sausage" if it is divisible by 7. For a number like 15, it
# should print "Fizz" and "Bin" since 15 is divisible by both 3 and 5.
# What's the first number for which your program prints "Fizz Bin
# Sausage"?

use strict;
use warnings;
use v5.10.1;  # given-when

for ( 1 .. 105 ) {
	my $string = '';
	given ($_) {
		when ( $_ % 3 == 0 ) { $string .= ' Fizz'; continue; }
		when ( $_ % 5 == 0 ) { $string .= ' Bin'; continue; }
		when ( $_ % 7 == 0 ) { $string .= ' Sausage'; }
	}
	say $_ . $string;
}
