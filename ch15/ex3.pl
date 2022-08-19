#!/usr/bin/env perl

# Using for-when, write a program that goes through a list of files on
# the command line and reports if each file is readable, writable, or
# executable. You don't need to use smart matching.

use strict;
use warnings;
use v5.10.1;  # when

@ARGV or die "Provide files to check rwx permissions.\n";

for (@ARGV) {
	when ( !-e ) { say "$_ does not exist!"; }
	when ( -r _ ) { say "$_ is readable."; continue; }
	when ( -w _ ) { say "$_ is writable."; continue; }
	when ( -x _ ) { say "$_ is executable."; }
	default { say "$_ is not readable, writable, or executable."; }
}
