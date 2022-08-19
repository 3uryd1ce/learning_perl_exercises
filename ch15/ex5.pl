#!/usr/bin/env perl

# Modify the program from the previous exercise to also report if the
# number is odd or even, if the number is prime (you find no divisors
# other than 1 and the number itself), and if it is divisible by your
# favorite number. Again, only use smart matching.

use strict;
use warnings;
use v5.10.1;  # given-when

sub divisors {
	my $number = shift;

	my @divisors;
	for my $divisor ( 2 .. ( $number / 2 ) ) {
		push @divisors, $divisor unless $number % $divisor;
	}

	return @divisors;
}

chomp( my $given_number = shift );
$given_number or die "Provide a number to discover divisors for.\n";

given ($given_number) {
	when (/\D/a) {
		die "Input contains something other than a positive integer.\n";
	}

	my @divisors = &divisors($_);
	my @null_array;

	when ( @divisors ~~ 2 ) { say "$_ is an even number."; continue; }
	when ( !@divisors ~~ 2 ) { say "$_ is an odd number."; continue; }
	when ( 7 ~~ @divisors ) { say 'Divisible by 7!'; continue; }
	when ( @divisors ~~ @null_array ) { say "$_ is prime."; }
	default { say "$_ can be divided by " . join ' ', @divisors; }
}
