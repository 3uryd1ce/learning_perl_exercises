#!/usr/bin/env perl

# Modify the previous program to change every Fred to Wilma and every
# Wilma to Fred. Now input like fred&wilma should look like Wilma&Fred
# in the output.

use strict;
use warnings;

if ( !defined @ARGV ) {
	die "$0 [input_file] [...]\n";
}

for (@ARGV) {
	my $input_file = $_;
	my $output_file = "$input_file.out";

	open my $input_fh, '<', $input_file or die "Can't open $input_file: $!";
	open my $output_fh, '>', $output_file or die "Can't open $output_file: $!";

	while (<$input_fh>) {
		s/(wilma|fred)(.*?)(fred|wilma)/$3$2$1/gi;
		print $output_fh $_;
	}

	close $input_fh;
	close $output_fh;
}

# book had a creative solution: using a placeholder string.
# it is probably less expensive than the regular expression I wrote.
#
# while (<$in_fh>) {
# 	chomp;
# 	s/Fred/\n/gi;    # Replace all FREDs
# 	s/Wilma/Fred/gi; # Replace all WILMAs
# 	s/\n/Wilma/g;    # Replace the placeholder
# 	print $out_fh "$_\n";
# }
