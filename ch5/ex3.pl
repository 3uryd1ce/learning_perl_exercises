#!/usr/bin/env perl

# Modify the previous program to let the user choose the column width,
# so that entering 30, hello, good-bye (on separate lines) would put the
# strings at the 30th column. (Hint: see "Interpolation of Scalar
# Variables into Strings" on page 32 in Chapter 2, about controlling
# variable interpolation.) For extra credit, make the ruler line longer
# when the selected width is larger.

use strict;
use warnings;

sub generate_ruler {
	my $ruler_width = shift;

	my @ruler;
	my $count = 0;

	while ( @ruler < $ruler_width ) {
		if ( $count == 9 ) {
			$count = 0;
		}
		else {
			$count += 1;
		}

		push @ruler, $count;
	}

	return @ruler;
}

print "Please enter the column width on line one:", "\n";
chomp( my $column_width = <STDIN> );

print "Please enter some strings and then exit (CTRL-D):", "\n";
chomp( my @strings = <STDIN> );

print &generate_ruler($column_width), "\n";
printf "%${column_width}s\n" x @strings, @strings;
