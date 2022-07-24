#!/usr/bin/env perl

# Using given and smart matching, write a program that reports all the
# divisors (except 1 and the number itself) of a number you specify on
# the command line. For instance, for the number 99, your program should
# report it is divisible by 3, 9, 11, and 33. If the number is prime (it
# has no divisors), report that the number is prime instead. If the
# command line argument is not a number, report the error and don't try
# to compute the divisors. Although you could do this with if constructs
# and with dumb matching, only use smart matching.

use strict;
use warnings;
use v5.10.1; # given-when

sub divisors {
	my $number = shift;

	my @divisors;
	for my $divisor ( 2 .. ($number / 2) ) {
		push @divisors, $divisor unless $number % $divisor;
	}

	return @divisors;
}


chomp(my $given_number = shift);
$given_number or die "Provide a number to discover divisors for.\n";

given ($given_number) {
	when (/\D/a) { die "Input contains something other than a positive integer.\n"; }

	my @divisors = &divisors($_);
	my @null_array;

	when (@divisors ~~ @null_array) { say "$_ is prime."; }
	default { say "$_ can be divided by " .  join ' ', @divisors; }
}
