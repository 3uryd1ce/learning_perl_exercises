#!/usr/bin/env perl

# Install the Module::CoreList module from CPAN. Print a list of all of
# the modules that came with Perl 5.14. To build a hash whose keys are
# the names of the modules that came with a given version of perl, use
# this line:
#
# my %modules = %{ $Module::CoreList::version{5.014} };

use strict;
use warnings;

use Module::CoreList;

my %modules = %{ $Module::CoreList::version{5.014} };

for (sort keys %modules) {
	print $_, "\n";
}
