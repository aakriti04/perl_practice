use strict;
use warnings;
use Data::Dumper;
use lib '.';
use lib 'F:/aakriti/Perl/workspace/modulesAndOOPerl/CommunicationPackage';
use CommunicationPackage::Speak qw(test greet);

$|=1;
sub main {
	test();
	greet();
	
	my @dogs = qw(retriever labrador alsatian);
	
	print Dumper(@dogs);
	
}


main();