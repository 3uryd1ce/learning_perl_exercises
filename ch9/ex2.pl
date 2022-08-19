#!/usr/bin/env perl

# Write a program that makes a modified copy of a text file. In the
# copy, every string Fred (case-insensitive) should be replaced with
# Larry. (So, Manfred Mann should become ManLarry Mann.) The input file
# name should be given on the command line (don't ask the user!), and
# the output filename should be the corresponding file name ending with
# .out.

use strict;
use warnings;

if ( !defined @ARGV ) {
	die "$0 [input_file] [...]\n";
}

for (@ARGV) {
	my $input_file = $_;
	my $output_file = "$input_file.out";

	open my $input_fh, '<', $input_file or die "Can't open $input_file: $!";
	open my $output_fh, '>', $output_file or die "Can't open $output_file: $!";

	while (<$input_fh>) {
		s/fred/Larry/gi;
		print $output_fh $_;
	}

	close $input_fh;
	close $output_fh;
}
