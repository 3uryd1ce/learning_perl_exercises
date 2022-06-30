#!/usr/bin/env perl

# Make a program that will repeatedly ask the user to guess a secret
# number from 1 to 100 until the user guesses the secret number. Your
# program should pick the number at random by using the magical formula
# int(1 + rand 100). When the user guesses wrong, the program should
# respond, "Too high" or "Too low." If the user enters the word quit or
# exit, or if the user enters a blank line, the program should quit. Of
# course, if the user guesses correctly, the program should quit then as
# well!

use strict;
use warnings;
use v5.14; # character set modifiers

my $secret_number = int(1 + rand 100);

print 'Choose a number between 1 and 100.', "\n";

# naked block to practice it. I would probably use a while loop here
# otherwise.
{
	chomp(my $guess = <STDIN> // '');

	if ($guess =~ /\A(?:quit|exit|\s*)\z/ai) {
		print 'Exiting.', "\n";
		last;
	} elsif ($guess =~ /\D/a || $guess > 100 || $guess < 1) {
		print "$guess is not a number between 1 and 100, try again.", "\n";
		redo;
	} elsif ($guess == $secret_number) {
		print 'You got it!', "\n";
		last;
	} elsif ($guess < $secret_number) {
		print 'Too low.', "\n";
		redo;
	} elsif ($guess > $secret_number) {
		print 'Too high.', "\n";
		redo;
	} else {
		print 'This should never happen. Does this also count as winning?', "\n";
		last;
	}
}
