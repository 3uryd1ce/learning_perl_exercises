#!/usr/bin/env perl

# (Unix only) Write an infinite loop program that catches signals and
# reports which signal it caught and how many times it has seen that
# signal before. Exit if you catch the INT signal. If you can use the
# command-line kill, you can send signals like so:
#
# $ kill -USR1 12345
#
# If you can't use the command-line kill, write another program to send
# signals to it. You might be able to get away with a Perl one-liner:
#
# $ perl -e 'kill HUP =>  12345'

use strict;
use warnings;
use v5.10; # say

my %signal_count;

sub int_handler { say 'Interrupted, exiting...'; exit; }

sub usr1_handler {
	$signal_count{'USR1'}++;
	say 'Caught USR1: ' . $signal_count{'USR1'};
}

sub usr2_handler {
	$signal_count{'USR2'}++;
	say 'Caught USR2: ' . $signal_count{'USR2'};
}

$SIG{'INT'} = 'int_handler';
$SIG{'USR1'} = 'usr1_handler';
$SIG{'USR2'} = 'usr2_handler';

while (1) { sleep 1; }
