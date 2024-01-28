use strict;
use warnings;
use Data::Dumper;

use Getopt::Std;

$|=1;


sub main{
	my %opts;
	getopts('af:r', \%opts); #\% - means reference to hash, : is for key value pair
	
	if(!checkUsage(\%opts)){ # passing refernce to hash
		usage();
	}
	
}



sub checkUsage {
	my $opts = shift;
	
	 my $a =  $opts->{"a"};
	 my $r = $opts->{"r"};
	 my $f = $opts->{"f"};
	 
	 
	 # Imagine a is optional; don't really need to refer to it here at all.
	
	# r is mandatory: it means "run the program"
	# f is mandatory.
	
	unless(defined($r) and defined($f)) {
		return 0;
	}
	
	unless ($f =~ /\.xml$/i){
		print "Input file must have the extension .xml\n";
		return 0;
	}
	return 1; 
}

sub usage{
	print "Incorrect options\n";
	my $help = <<USAGE;

usage: perl main.pl <options>
	-f <file name> specify XML file name to parse
	-a turn off error checking
	-r run the program
	
example usage:
	perl main.pl -f test.xml -a -r

	
USAGE

	die $help; 
}
main();