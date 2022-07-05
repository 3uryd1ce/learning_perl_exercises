#!/usr/bin/env perl

# If you used a directory handle for the previous exercise, rewrite it
# to use a glob. Or if you used a glob, try it now with a directory
# handle.

use strict;
use warnings;
use v5.14; # character set modifiers


print "Enter a directory name to list its contents (blank means home)", "\n";
chomp(my $provided_directory = <STDIN>);

if ($provided_directory =~ /\A\s*\z/a) {
	chdir or die "Could not change to the home directory: $!\n";
} else {
	chdir $provided_directory or die "Could not change directory to $provided_directory: $!\n";
}


opendir my $current_directory_fh, '.'
	or die "Could not open $provided_directory for reading: $!\n";

my @all_files;
while (readdir $current_directory_fh) {
	push @all_files, $_;
}

closedir $current_directory_fh;


print(join("\n", sort @all_files), "\n");
