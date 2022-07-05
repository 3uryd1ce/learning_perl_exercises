#!/usr/bin/env perl

# Write a program that works like rm, deleting any files named on the
# command line. (You don't need to handle any of the options of rm.)

use strict;
use warnings;

@ARGV or die "File names to delete must be provided.\n";

for (@ARGV) {
	unlink $_ or warn "$_ could not be deleted: $!\n";
}
