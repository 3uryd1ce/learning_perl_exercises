#!/usr/bin/env perl

# Write a program to ask the user for a directory name, then change to
# that directory. If the user enters a line with nothing but whitespace,
# change to his or her home directory as a default. After changing, list
# the ordinary directory contents (not the items whose names begin with a
# dot) in alphabetical order. (Hint: will that be easier to do with a
# directory handle or with a glob?) If the directory change doesn't
# succeed, just alert the user--but don't try showing the contents.

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

my @all_files = glob '*';
print( join( "\n", @all_files ), "\n" );
