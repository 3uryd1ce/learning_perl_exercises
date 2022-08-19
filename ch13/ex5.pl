#!/usr/bin/env perl

# Write a program that works like mv, renaming the first command-line
# argument to the second command-line argument. (You don't need to
# handle any of the options of mv or additional arguments.) Remember to
# allow for the destination to be a directory; if it is, use the same
# original basename in the new directory.

use strict;
use warnings;
use File::Basename;
use File::Spec;

my ( $file_to_move, $destination ) = @ARGV;
$file_to_move or die "File name to move must be provided.\n";
$destination or die "Destination must be provided.\n";

if ( -d $destination ) {
	my $basename = basename $file_to_move;
	$destination = File::Spec->catfile( $destination, $basename );
}

rename $file_to_move, $destination
	or die "Rename from $file_to_move to $destination failed: $!\n";
