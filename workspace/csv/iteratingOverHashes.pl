use strict;
use warnings;
use Data::Dumper;

$|=1;

sub main{
	my %foods = (
		"mice" => "cheese",
		"dogs" => "meat",
		"birds" => "seeds"
	);
	
	my ($one, $two, $three) = (1,2,3);
	print "The value of \$two is $two\n";
	
	while (my ($key, $value) = each %foods){
		print "$key: $value\n";
	}
	
	my @animals = keys %foods;
	print Dumper(@animals);
	
	print "In for \n";
	foreach my $key(sort keys %foods){
		my $value = $foods{$key};
		
		print"$key: $value\n";
	}
	
	
}

main();