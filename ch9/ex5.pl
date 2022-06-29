#!/usr/bin/env perl

# Extra extra credit exercise: modify the previous program so that it
# doesn't edit the files that already contain the copyright line. As a
# hint on that, you might need to know that the name of the file being
# read by the diamond operator is in $ARGV.

use strict;
use warnings;

$^I = '.bak';
my $copyright_string = '## Copyright (C) 2022 by Yours Truly';
my $count = 0;

my %files_to_edit;
for (@ARGV) {
	$files_to_edit{$_} = 1;
}

@ARGV = keys %files_to_edit;

while (<>) {
	if (/\A#!/) {
		$_ .= "$copyright_string\n";
		delete $files_to_edit{$ARGV};
	}

	print;
}
