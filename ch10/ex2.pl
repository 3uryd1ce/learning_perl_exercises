#!/usr/bin/env perl

# Modify the program from the previous exercise to print extra debugging
# information as it goes along, such as the secret number it chose. Make
# your change such that you can turn it off, but your program emits no
# warnings if you turn it off. If you are using Perl 5.10 or later, use
# the // operator. Otherwise, use the conditional operator.

use strict;
use warnings;
use v5.14;  # character set modifiers

my $debug_toggle = $ENV{DEBUG} // 1;

my $secret_number = int( 1 + rand 100 );

print "The secret number is $secret_number", "\n" if $debug_toggle;
print 'Choose a number between 1 and 100.', "\n";

# naked block to practice it. I would probably use a while loop here
# otherwise.
{
	chomp( my $guess = <STDIN> // '' );
	print "Processing your guess of \"$guess\" ...", "\n" if $debug_toggle;

	if ( $guess =~ /\A(?:quit|exit|\s*)\z/ai ) {
		print 'Exiting.', "\n";
		last;
	}
	elsif ( $guess =~ /\D/a || $guess > 100 || $guess < 1 ) {
		print "$guess is not a number between 1 and 100, try again.", "\n";
		redo;
	}
	elsif ( $guess == $secret_number ) {
		print 'You got it!', "\n";
		last;
	}
	elsif ( $guess < $secret_number ) {
		print 'Too low.', "\n";
		redo;
	}
	elsif ( $guess > $secret_number ) {
		print 'Too high.', "\n";
		redo;
	}
	else {
		print 'This should never happen. Does this also count as winning?',
			"\n";
		last;
	}
}
