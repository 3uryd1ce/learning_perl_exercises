#!/usr/bin/env perl

# Using the subroutine from the previous problem, make a program to
# calculate the sum of the numbers from 1 to 1,000.

use strict;
use warnings;

sub total {
	my $sum;
	for (@_) {
		$sum += $_;
	}

	return $sum;
}

print &total(1..1000), "\n";
