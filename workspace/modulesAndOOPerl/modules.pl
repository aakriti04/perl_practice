use strict;
use warnings;
use Data::Dumper;
use lib 'F:/aakriti/Perl/workspace/modulesAndOOPerl';
# use Speak; # - before using exporter in Speak
use Speak qw(test greet);
# use Speak; # - with @EXPORT

$|=1;
sub main {
	#Speak::test();
	
	#after using Exporter
	test();
	greet();
	
	my @dogs = qw(retriever labrador alsatian);
	
	print Dumper(@dogs);
	
}


main();