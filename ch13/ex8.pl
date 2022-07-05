#!/usr/bin/env perl

# If your operating system supports it, write a program to find any
# symbolic links in the current directory and print out their values
# (like ls -l would: name -> value).

use strict;
use warnings;

opendir my $current_directory_fh, '.'
	or die "Could not open the current directory for reading: $!\n";

while (readdir $current_directory_fh) {
	my $link_target = readlink $_;
	next unless $link_target;
	print "$_ -> $link_target", "\n";
}

closedir $current_directory_fh;
