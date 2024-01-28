use strict;
use warnings;
use Data::Dumper;

use Getopt::Std;

$|=1;


sub main{
	my %opts;
	getopts('f:m', \%opts); #\% - means reference to hash, : is for key value pair
	
	if(!checkUsage("Hello", 7)){
		usage();
	}
}

sub checkUsage {
	# my ($greetings, $number) = @_;
	
#	my $greetings = shift @_;
#	my $number  = shift @_;

	my $greetings = shift ;
	my $number  = shift ;
	
	print "greeting: $greetings\n";
	print "number: $number";
	
	
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