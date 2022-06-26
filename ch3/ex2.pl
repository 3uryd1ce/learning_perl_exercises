#!/usr/bin/env perl

# Write a program that reads a list of numbers (on separate lines) until
# end-of-input and then prints for each number the corresponding
# person's name from the list shown below. (Hardcode this list of names
# into your program. That is, it should appear in your program's source
# code.) For example, if the input numbers were 1, 2, 4, and 2, the
# output names would be fred, betty, dino, and betty:
#
# fred betty barney dino wilma pebbles bamm-bamm

use strict;
use warnings;

my @list_of_people = qw(
	fred
	betty
	barney
	dino
	wilma
	pebbles
	bamm-bamm
);

print "Enter numbers from 0 to 6 in any order and then exit (CTRL-D):", "\n";

for (<STDIN>) {
	print $list_of_people[$_], "\n";
}
