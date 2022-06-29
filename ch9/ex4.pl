#!/usr/bin/env perl

# Extra credit exercise: write a program to add a copyright line to all
# of your exercise answers so far, by placing a line like:
# ## Copyright (C) 20XX by Yours Truly
# in the file immediately after the "shebang" line. You should edit the
# files "in place," keeping a backup. Presume that the program will be
# invoked with the filenames to edit already on the command line.

use strict;
use warnings;

$^I = '.bak';
my $copyright_string = "## Copyright (C) 2022 by Yours Truly";

while (<>) {
	s{
		(\A                 # beginning of string
		[#]!/usr/bin/       # #!/usr/bin/
		(?:env[ ]perl|perl) # either 'env perl' or 'perl'
		\Z)                 # end of string including newline
							#
							# the pattern should match either of these:
							# #!/usr/bin/perl
							# #!/usr/bin/env perl
	}
	{$1\n$copyright_string}x; # interpolate match, add a newline,
							  # and then the copyright.
							  #
							  # note that this cannot be spaced the
							  # same as the pattern, because the
							  # spaces and newlines will show up in
							  # the replacement despite `/x`.

	print;
}

# here is a much cleaner solution provided by the book
# (forgot about the string concatenation assignment operator)
#
# $^I = ".bak"; # make backups
# while (<>) {
# 	if (/\A#!/) { # is it the shebang line?
# 		$_ .= "## Copyright (C) 20XX by Yours Truly\n";
# 	}
# 	print;
# }
