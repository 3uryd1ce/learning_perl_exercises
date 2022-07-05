#!/usr/bin/env perl

# If your operating system supports it, fix up the program from the
# previous exercise to allow an optional -s switch before the other
# arguments to indicate that you want to make a soft link instead of a
# hard link. (Even if you don't have hard links, see whether you can at
# least make soft links with this program.)

use strict;
use warnings;
use File::Basename;
use File::Spec;
use Getopt::Std;


our $opt_s;
getopts('s');

my ($source, $target) = @ARGV;
$source or die "Link source must be provided.\n";
$target or die "Link target must be provided.\n";


if (-d $target) {
	my $basename = basename $source;
	my $target = File::Spec->catfile($target, $basename);
}

if ($opt_s) {
	symlink $source, $target or die "Link of $source to $target failed: $!\n";
} else {
	link $source, $target or die "Link of $source to $target failed: $!\n";
}
