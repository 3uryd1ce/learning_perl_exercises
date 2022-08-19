#!/usr/bin/env perl

# If your operating system supports it, write a program that works like
# ln, making a hard link from the first command-line argument to the
# second. (You don't need to handle options of ln or more arguments.) If
# your system doesn't have hard links, just print out a message telling
# which operation you would perform if it were available. Hint: this
# program has something in common with the previous one--recognizing
# that could save you time in coding.

use strict;
use warnings;
use File::Basename;
use File::Spec;

my ( $source, $target ) = @ARGV;
$source or die "Hard link source must be provided.\n";
$target or die "Hard link target must be provided.\n";

if ( -d $target ) {
	my $basename = basename $source;
	my $target = File::Spec->catfile( $target, $basename );
}

link $source, $target
	or die "Hard link of $source to $target failed: $!\n";
