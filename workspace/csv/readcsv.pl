use strict;
use warnings;

$|=1;

sub main{
	my $input = 'test.csv';
	unless(open(INPUT, $input)) {
		die "\nCannot open $input\n";
	}
	
#	while(<INPUT>){
#		print $_;
#	}

   # to remove headers of csv- THIS WILL START FROM LINE TWO IN WHILE LOOP
   <INPUT>;
	while(my $line = <INPUT>){
		# print $line;
		# split line
		my @values = split ',', $line;
		#print "values: @values\n";
		print $values[0] . "\n";
		
	}
	close INPUT;
}

main();