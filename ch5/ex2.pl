#!/usr/bin/env perl

# Write a program that asks the user to enter a list of strings on
# separate lines, printing each string in a right-justified,
# 20-character column. To be certain that the output is in the proper
# columns, print a "ruler line" of digits as well. (This is simply a
# debugging aid.) Make sure that you're not using a 19-character column
# by mistake! For example, entering hello, good-bye should give output
# something like this:
#
# 123456789012345678901234567890123456789012345678901234567890
#                hello
#             good-bye

use strict;
use warnings;

print "Please enter some strings and then exit (CTRL-D):", "\n";

# chomp is needed because a newline is a character, and that will throw
# off the alignment.
chomp(my @strings = <STDIN>);

print "1234567890" x 2, "\n";
printf "%20s\n" x @strings, @strings;
