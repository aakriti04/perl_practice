use strict;
use warnings;
use Data::Dumper;

use Getopt::Std;

$|=1;

=pod
	this is an example of 
	mlti line comment

=cut

sub main{
	my %opts;
	getopts('f:m', \%opts); #\% - means reference to hash, : is for key value pair
	
	if(!checkUsage()){
		usage();
	}
}

sub checkUsage{
	
	
	return 0; # boolean - 0 or 1
}

sub usage{
	print "Incorrect options\n";
	my $help = <<USAGE;

usage: perl main.pl <options>
	-f <file name> specify XML file name to parse
	-a turn off error checking
	
example usage:
	perl main.pl -f test.xml -a

	
USAGE

	die $help; 
}
main();