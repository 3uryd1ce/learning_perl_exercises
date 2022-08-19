#!/usr/bin/env perl

# Make a program that reads a list of strings from a file, one string
# per line, and then lets the user interactively enter patterns that may
# match some of the strings. For each pattern, the program should tell
# how many strings from the file matched, then which ones those were.
# Don't reread the file for each new pattern; keep the strings in
# memory. The filename may be hardcoded in the file. If a pattern is
# invalid (for example, if it has unmatched parentheses), the program
# should simply report that error and let the user continue trying
# patterns. When the user enters a blank line instead of a pattern, the
# program should quit. (If you need a file full of interesting strings
# to try matching, try the file sample_text in the files you've surely
# downloaded by now from the O'Reilly website; see the Preface.)

use autodie;
use strict;
use warnings;

use feature 'say';

my $sample_text = './sample_text.txt';

open my $sample_fh, '<', $sample_text;
chomp( my @lines = <$sample_fh> );
close $sample_fh;

while (1) {
	say 'Please enter a regular expression (or a blank line to quit):';
	chomp( my $regexp = <STDIN> // exit );
	exit if $regexp =~ /\A \s* \z/ax;

	my @matching_lines;
	unless (
		eval {
			@matching_lines = grep { /$regexp/ } @lines;
		}
		)
	{
		print STDERR "Failed to scan file: $@" if $@;
		next;
	}

	my $number_of_lines = @matching_lines;

	print map { "> $_\n" } @matching_lines;
	say "$number_of_lines matches found.";
}
