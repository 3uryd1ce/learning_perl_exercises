#!/usr/bin/env perl

# Rewrite your number guessing program from Exercise 1 in Chapter 10 to
# use given. How would you handle non-numeric input? You don't need to
# use smart matching.

use strict;
use warnings;
use v5.14; # character set modifiers

my $secret_number = int(1 + rand 100);

print 'Choose a number between 1 and 100.', "\n";

while (1) {
	chomp(my $guess = <STDIN> // '');

	given ($guess) {
		when ($_ =~ /\A (?:quit|exit|\s*) \z/aix) { say 'Exiting.'; last; }
		when ($_ =~ /\D/ax) { say 'Contains something other than a number.'; }
		when ($_ > 100) { say 'Guess cannot be greater than 100.'; }
		when ($_ < 1) { say 'Guess cannot be less than 1.'; }
		when ($_ == $secret_number) { say 'You got it!'; last; }
		when ($_ < $secret_number) { say 'Too low.'; }
		when ($_ > $secret_number) { say 'Too high.'; }
		default { say 'This should never happen. Does this also count as winning?'; last; }
	}
}
