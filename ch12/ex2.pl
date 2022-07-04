#!/usr/bin/env perl

# Make a program to identify the oldest file named on the command line
# and report its age in days. What does it do if the list is empty?
# (That is, if no files are mentioned on the command line.)

use strict;
use warnings;

@ARGV or die "File names must be provided as arguments.\n";

my $oldest_file = shift;
my $largest_age = -M $oldest_file;

# I originally built up a hash with ARGV and iterated through it, and
# then realized the hash was an unnecessary step in the process.
for (@ARGV) {
	my $current_age = -M;
	if ($current_age > $largest_age) {
		($oldest_file, $largest_age) = ($_, $current_age);
	}
}

printf "%s is the oldest file and it is %.2f days old\n", $oldest_file, $largest_age;
