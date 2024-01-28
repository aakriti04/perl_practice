use strict;
use warnings;
use Data::Dumper;

$|=1;

sub main {
	
	my %hash1 = (
		"mice" => "cheese",
		"dogs" => "meat",
		"birds" => "seeds"
	);
	
	my @test;
	
	push @test, %hash1;
	print Dumper(@test);
	
	my @test1;
	
	push @test1, \%hash1;
	print Dumper(@test1);
	
	print "$test1[0]{'mice'}\n";
	print "$test1[0]->{'dogs'}\n";
	$test1[1]= \%hash1;
	print Dumper(@test1);
	print "$test1[1]{'birds'}\n";
	
}


main();