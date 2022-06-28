#!/usr/bin/env perl

# Make a program that prints each line of its input that contains a
# period (.), ignoring other lines of input. Try it on the small text
# file from the previous exercise: does it notice Mr. Slate?

use strict;
use warnings;

while (<>) {
	if (/\./) {
		print;
	}
}
