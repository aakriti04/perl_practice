use strict;
use warnings;
use Data::Dumper;

use Getopt::Std;

$|=1;

#sub main{
#	
#	print "Main\n";
#	print "var: \n";
#	print Dumper(@ARGV);
#	print $ARGV[0];
#	
#}
#main();

sub main{
	my %opts;
	getopts('fx:', \%opts); #\% - means reference to hash, : is for key value pair
	print Dumper(%opts);
	
	my $file = $opts{'x'};
	
	print "file: $file\n";
	
}
main();