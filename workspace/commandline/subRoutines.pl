use strict;
use warnings;
use Data::Dumper;

use Getopt::Std;

$|=1;



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
}
main();