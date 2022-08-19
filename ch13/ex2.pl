#!/usr/bin/env perl

# Modify the program to include all files, not just the ones that don't
# begin with a dot.

use strict;
use warnings;
use v5.14;  # character set modifiers

print "Enter a directory name to list its contents (blank means home)", "\n";
chomp( my $provided_directory = <STDIN> );

if ( $provided_directory =~ /\A\s*\z/a ) {
	chdir or die "Could not change to the home directory: $!\n";
}
else {
	chdir $provided_directory
		or die "Could not change directory to $provided_directory: $!\n";
}

my @all_files = glob '.* *';
print( join( "\n", @all_files ), "\n" );
