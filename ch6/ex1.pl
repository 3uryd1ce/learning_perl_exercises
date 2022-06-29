#!/usr/bin/env perl

# Write a program that will ask the user for a given name and report the
# corresponding family name. Use the names of people you know, or (if
# you spend so much time on the computer that you don't know any actual
# people) use the following table:
#
# fred => flintstone
# barney => rubble
# wilma => flintstone

use strict;
use warnings;

my %last_names = (
	fred => 'flintstone',
	barney => 'rubble',
	wilma => 'flintstone',
);

print 'fred, barney, or wilma?', "\n";
chomp(my $first_name = <STDIN>);

if (exists($last_names{$first_name})) {
	print "I see you're a fan of $first_name $last_names{$first_name}.", "\n";
} else {
	die "A last name for \"$first_name\" could not be found.", "\n";
}
