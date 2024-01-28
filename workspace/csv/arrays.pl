use strict;
use warnings;
use Data::Dumper;

$|=1;

sub main{
	my $input = 'test.csv';
	unless(open(INPUT, $input)) {
		die "\nCannot open $input\n";
	}
	
   <INPUT>;
   
   my @lines;
   my $count = 0;
	while(my $line = <INPUT>){	
		chomp $line;
		my @values = split ',', $line;
			
#		$lines[$count]=$line;
#		$count++;

#OR
		push @lines, $line;
	
	}
	close INPUT;
	
	foreach my $line (@lines){
		print "$line\n";
	}
}

main();

sub array_of_arrays{
	print "-------------------------------\n\n";
	my @animals = ('dog', 'cat','rabbit');
	my @fruits = ('apple', 'banana', 'orange');
	my @values;
	my @values2;
	
	push @values, @animals;
	push @values, @fruits;
	
	print Dumper(@values);
	print "As nested arrays in an array\n";
	push @values2, \@animals;
	push @values2, \@fruits;
	
	print Dumper(@values2);
	
	my $fruits_ref = \@fruits;
	print "Fruits ref: $fruits_ref\n";
	print "Ref: $fruits_ref->[0]\n";
	
}

array_of_arrays();

sub main2{
	
	print"-----------------------------------\n";
	my $input = 'test.csv';
	unless(open(INPUT, $input)) {
		die "\nCannot open $input\n";
	}
	
   <INPUT>;
   
   my @lines;
   my $count = 0;
	while(my $line = <INPUT>){	
		chomp $line;
		my @values = split ',', $line;
			
		push @lines, \@values;
	
	}
	close INPUT;
	
	foreach my $line (@lines){
		print Dumper($line);
		print "Name: ". $line->[0]."\n"; #this can be called as derference
	}
	
	print "test multi-dimensional array: $lines[0][1]\n";
}

main2();
