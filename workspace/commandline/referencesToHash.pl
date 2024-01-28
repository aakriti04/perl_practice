use strict;
use warnings;
use Data::Dumper;

use Getopt::Std;

$|=1;


sub main{
	my %opts;
	getopts('af:c', \%opts); #\% - means reference to hash, : is for key value pair
	
	if(!checkUsage(\%opts)){ # passing refernce to hash
		usage();
	}
	
	my $opts_ref = \%opts; # this is a reference to hash and not actual hash
	
	# use hash directly
	print $opts{"f"} . "\n";
	
	
	#use reference to hash
	print $opts_ref->{"f"} . "\n";
	
}



sub checkUsage {
	my $opts_ref = shift;
	print $opts_ref->{"f"} . "\n"; #local to this sub

	return 1; # boolean - 0 or 1
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