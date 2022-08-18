#!/usr/bin/env perl

# Modify your answer to Exercise 2 to report the times using the YYYY-MM-
# DD format. Use a map with localtime and a slice to turn the epoch times
# into the date strings that you need. Note the localtime documentation
# about the year and month values it returns. Your report should look like
# this:
#
# fred.txt          2011-10-15        2011-09-28
# barney.txt        2011-10-13        2011-08-11
# betty.txt         2011-10-15        2010-07-24

use autodie;
use strict;
use warnings;

for my $file (glob '*') {
	my ($atime, $mtime) = (stat $file)[8, 9];
	next unless -f _;

	my ($formatted_atime, $formatted_mtime) = map {
		my ($year, $month, $day) = (localtime $_)[5, 4, 3];
		$month++; $year += 1900;
		sprintf '%4d-%02d-%02d', $year, $month, $day;
	} ($atime, $mtime);

	printf "%-20s %10s %10s\n", $file, $formatted_atime, $formatted_mtime;
}
