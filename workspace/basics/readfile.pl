use strict;
use warnings;

$| = 1;

sub main {

# my keyword in Perl declares the listed variable to be local 
# to the enclosing block in which it is defined. 
# The purpose of my is to define static scoping.
# https://www.geeksforgeeks.org/perl-my-keyword/
	my $file = 'F:\aakriti\Perl\workspace\basics\story.txt';

# if use die() without \n, then will print line number of error also 
	open( INPUT, $file ) or die("Input file not found... \n");
# INPUT is a file handler - convention is to keep it in upper case
	while ( my $line = <INPUT> ) {
		if ( $line =~ / egg / ) {
			print $line;
		}
	}
	close(INPUT);
}
main();
