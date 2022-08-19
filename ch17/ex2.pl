#!/usr/bin/env perl

# Write a program to make a report of the access and modification times
# (in the epoch time) of the files in the current directory. Use stat to
# get the times, using a list slice to extract the elements. Report your
# results in three columns, like this:
#
# fred.txt          1294145029        1290880566
# barney.txt        1294197219        1290810036
# betty.txt         1287707076        1274433310

use autodie;
use strict;
use warnings;

for ( glob '*' ) {
	my ( $atime, $mtime ) = (stat)[ 8, 9 ];
	next unless -f _;

	printf "%-20s %10d %10d\n", $_, $atime, $mtime;
}
