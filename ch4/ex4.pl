#!/usr/bin/env perl

# Write a subroutine named greet that welcomes the person you name by telling
# them the name of the last person it greeted:
#
# greet( "Fred" );
# greet( "Barney" );
#
# This sequence of statements should print:
# Hi Fred! You are the first one here!
# Hi Barney! Fred is also here!

use strict;
use warnings;
use v5.10;

sub greet {
	state $previous_name;
	my $name = shift;

	if ($previous_name) {
		print "Hi $name! $previous_name is also here!", "\n";
	} else {
		print "Hi $name! You are the first one here!", "\n";
	}

	$previous_name = $name;
}

greet("Fred");
greet("Barney");
