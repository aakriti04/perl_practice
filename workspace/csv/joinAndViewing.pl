use strict;
use warnings;
use Data::Dumper;

$|=1;

sub main{
	my $input = 'test.csv';
	unless(open(INPUT, $input)) {
		die "\nCannot open $input\n";
	}
	
   # to remove headers of csv- THIS WILL START FROM LINE TWO IN WHILE LOOP
   <INPUT>;
	while(my $line = <INPUT>){
		print "ORG:'$line'\n"; #contains a newline character.there clisong ' goes to next line
		# for this chomp is to be used
		my @values = split ',', $line;
		
		print(join '|', @values); # or print join '|', @values;
		
		print Dumper(@values);	# this has new line character for the last split value of each row	
		
		chomp $line;
		
		print "'$line'\n"; 
		@values = split ',', $line;
		
		print Dumper(@values);
		
		#to remove spaces between tokens if separated by space,space.
		
		@values = split /\s*,\s*/, $line; #converting the delimeter to regex
		
		print Dumper(@values);
		
		
		
	}
	close INPUT;
}

main();