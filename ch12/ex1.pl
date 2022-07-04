#!/usr/bin/env perl

# Make a program that takes a list of files named on the command line
# and reports for each one whether it's readable, writable, executable,
# or doesn't exist. (Hint: it may be helpful to have a function that
# will do all of the file tests for one file at a time.) What does it
# report about a file that has been chmod'ed to 0? (That is, if you're
# on a Unix system, use the command chmod 0 some_file to mark that file
# as neither being readable, writable, nor executable.) In most shells,
# use a star as the argument to mean all of the normal files in the
# current directory. That is, you could type something like ./ex12-2 *
# to ask the program for the attributes of many files at once.

use strict;
use warnings;


sub test_file {
	my $file = shift;
	return 'does not exist' unless -e $file;

	my @perms;

	push @perms, 'readable' if -r _;
	push @perms, 'writable' if -w _;
	push @perms, 'executable' if -x _;

	@perms
		? return 'is ' . join ', ', @perms
		: return 'exists';
}


@ARGV or die "No file names were provided.\n";

for (@ARGV) {
	print "$_ " . test_file($_) . "\n";
}
