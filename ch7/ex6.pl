#!/usr/bin/env perl

# Extra credit exercise: write a program that prints out any input line
# that mentions both wilma and fred.

use strict;
use warnings;

while (<>) {
	if (/(wilma.*fred|fred.*wilma)/) {
	#if (/wilma/ && /fred/) { # also possible, but not introduced yet
		print;
	}
}
