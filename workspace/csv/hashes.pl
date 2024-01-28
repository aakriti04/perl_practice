use strict;
use warnings;
use Data::Dumper;

$|=1;


sub main{
	# Hashes will not remember your key order
	my %months = (
		"Jan"=>1,
		"Feb"=>2,
		"Mar"=>3,
		"Apr"=>4,
		"Jul"=>7,
		"Jun"=>6,
		"Aug"=>8,
		May=>5,
	);	
	
	print $months{"Jan"}. "\n";
	print $months{May}. "\n";
	
	my %days = (
		1=>"Monday",
		2=>"Tuesday",
		3=>"Wednesday",
	);
	
	print $days{1}."\n";
	
	my @months = keys %months;
	
	foreach my $month (@months){
		my $value=$months{$month};
		
		print "$month: $value\n";
		
	}
	
	print "\n\nusing WHILE\n\n";
	while( my($key, $value) = each %days){
		print "$key: $value\n";
	}
}

main();