#!/usr/bin/env perl

# Write a program that changes to some particular (hardcoded) directory,
# like the system's root directory, then executes the ls -l command to
# get a long-format directory listing in that directory (If you use a
# non-Unix system, use your own system's command to get a detailed
# directory listing).

use strict;
use warnings;

chdir '/tmp' or die "Could not cd to /tmp directory: $!\n";
exec 'ls', '-l';
