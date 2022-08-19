#!/usr/bin/env perl

# Extra credit exercise: write a subroutine, called &above_average,
# which takes a list of numbers and returns the ones which are above the
# average (mean). (Hint: make another subroutine that calculates the
# average by dividing the total by the number of items.) Try your
# subroutine in this test program.
#
# my @fred = above_average(1..10);
# print "\@fred is @fred\n";
# print "(Should be 6 7 8 9 10)\n";
# my @barney = above_average(100, 1..10);
# print "\@barney is @barney\n";
# print "(Should be just 100)\n";

use strict;
use warnings;

sub total {
	my $sum;
	for (@_) {
		$sum += $_;
	}

	return $sum;
}

sub average {
	@_ == 0
		and die "The 'average' subroutine cannot be passed zero arguments\n";
	my $number_of_elements = @_;
	my $sum = &total(@_);

	return $sum / $number_of_elements;
}

sub above_average {
	my $mean = &average(@_);
	my @above_average_numbers;

	for (@_) {
		if ( $_ > $mean ) {
			push @above_average_numbers, $_;
		}
	}

	return @above_average_numbers;
}

my @fred = above_average( 1 .. 10 );
print "\@fred is @fred\n";
print "(Should be 6 7 8 9 10)\n";
my @barney = above_average( 100, 1 .. 10 );
print "\@barney is @barney\n";
print "(Should be just 100)\n";
