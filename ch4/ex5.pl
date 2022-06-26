#!/usr/bin/env perl

# Modify the previous program to tell each new person the names of all
# the people it has previously greeted:
#
# greet( "Fred" );
# greet( "Barney" );
# greet( "Wilma" );
# greet( "Betty" );
#
# This sequence of statements should print:
#
# Hi Fred! You are the first one here!
# Hi Barney! I've seen: Fred
# Hi Wilma! I've seen: Fred Barney
# Hi Betty! I've seen: Fred Barney Wilma

use strict;
use warnings;
use v5.10;

sub greet {
	state @previous_names;
	my $name = shift;

	if (@previous_names) {
		print "Hi $name! I've seen: @previous_names", "\n";
	} else {
		print "Hi $name! You are the first one here!", "\n";
	}

	push @previous_names, $name;
}

greet("Fred");
greet("Barney");
greet("Wilma");
greet("Betty");
