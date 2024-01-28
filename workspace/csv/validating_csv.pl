use strict;
use warnings;
use Data::Dumper;

$|=1;

# error while printing if blank line in csv(Use of uninitialized value in concatenation (.) or string at)
sub main{
	my $input = 'test_validate.csv';
	
	unless(open(INPUT, $input)) {
		die "\nCannot open $input\n";
	}
	<INPUT>;
	
	my @data;
	LINE: while(my $line =<INPUT>){
		# check for blank line
		$line =~ /\S+/ or next;
#		print "line: $line\n";
		chomp $line;
		# check in invalid number of values in a line
		my @values = split /\s*,\s*/, $line;
		my($name, $payment, $date)=@values;
		
		if(scalar(@values) <3){
			print "Invlaid line:$line\n";
			next;
		}
		
		#check for non-empty value
		
		foreach my $value(@values){
			if($value eq ''){
				print "Invalid line $line\n";
				next LINE;
			}
		}
		
		my %values =(
			"Name"=> $name,
			"Payment"=> $payment,
			"Date"=>$date,
		);
		push @data, \%values;
	}
	print Dumper(@data);
	
	close INPUT;
	
	foreach my $d(@data){
		print $d->{"Payment"}. "\n";
	}
	print "Data: $data[3]{'Name'}";
}

main();