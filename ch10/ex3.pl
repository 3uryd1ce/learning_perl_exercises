#!/usr/bin/env perl

# Modify the program from Exercise 3 in Chapter 6 (the environment
# lister) to print (undefined value) for environment variables without a
# value. You can set the new environment variables in the program.
# Ensure that your program reports the right thing for variables with a
# false value. If you are using Perl 5.10 or later, use the // operator.
# Otherwise, use the conditional operator.

use strict;
use warnings;

my %env_var;
$ENV{BOGUS} = undef;
$ENV{BOGUS2} = 0;
my $width = 0;

for (keys %ENV) {
	if (length > $width) {
		$width = length;
	}
}

for (sort keys %ENV) {
	printf "%-${width}s %s\n", $_, $ENV{$_} // '(undefined value)';
}
