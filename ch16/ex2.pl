#!/usr/bin/env perl

# Modify the previous program to send the output of the command to a
# file called ls.out in the current directory. The error output should
# go to a file called ls.err (You don't need to do anything special
# about the fact that either of these files may end up being empty).

use strict;
use warnings;

chdir '/tmp' or die "Could not cd to /tmp directory: $!\n";
exec 'ls -l > ls.out 2> ls.err';

# Alternatively:
#
# use strict;
# use warnings;
#
# chdir '/tmp' or die "Could not cd to /tmp directory: $!\n";
# open STDOUT, '>', 'ls.out' or die "Could not open ls.out for writing: $!\n";
# open STDERR, '>', 'ls.err' or die "Could not open ls.err for writing: $!\n";
# exec 'ls', '-l' or die "Cannot exec ls: $!\n";
