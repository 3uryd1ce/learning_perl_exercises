#!/usr/bin/env perl

# Write a program using DateTime to compute the interval between now and a
# date that you enter as the year, month, and day on the command line:
#
# $ perl duration.pl 1960 9 30
# 50 years, 8 months, and 20 days

use strict;
use warnings;
use v5.14; # character set modifiers

# Would rather not use an external module, but the book said to.
use DateTime;


my $given_year = $ARGV[0];
$given_year =~ /\A\d{4}\z/a or die "The first argument must be a year with four digits.\n";

my $given_month = $ARGV[1];
$given_month =~ /\A\d+\z/a or die "The second argument must be a month as an integer.\n";

my $given_day = $ARGV[2];
$given_day =~ /\A\d+\z/a or die "The third argument must be a day as an integer.\n";


my $datetime_now = DateTime->today();
my $given_datetime = DateTime->new(
	year => $given_year,
	month => $given_month,
	day => $given_day,
);


my $duration = $datetime_now > $given_datetime
	? $datetime_now->subtract_datetime($given_datetime)
	: $given_datetime->subtract_datetime($datetime_now);

my @units = $duration->in_units( qw(years months days) );

printf "%d years, %d months, and %d days\n", @units;
