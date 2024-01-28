use strict;
use warnings;
use Data::Dumper;

$|=1;

sub main{
	my $input = "test_clean.csv";
	
	unless(open(INPUT, $input)){
		die "\ncannot open $input\n";
	}
	
	my $header = <INPUT>;
	chomp $header;
	my @header  = split /\s*,\s*/, $header;
	my @data;
	my $totalPayment=0;
	LINE: while(my $line = <INPUT>){
		chomp $line;
		
		
		$line =~ /\S+/ or next;
		$line =~ s/^\s*|\s*$//g;
		$line =~ s/\$|approx\.|\?//g;
		
		
		my @values = split /\s*,\s*/, $line;
		# print Dumper(@values);
		if (scalar(@values)<3){
			print "Invalid line: $line\n";
			next;
		}
		foreach my $value(@values){
			if($value eq ''){
				print "Invalid line: $line\n";
				next LINE;
			}
		}
		# print "line: $line\n";
		my ($name, $payment, $date) = @values;
		$totalPayment += $payment;
#		my %row = (
#			'Name'=>$name,
#			'Payment'=>$payment,
#			'Date'=>$date,			
#		);
#		my %row = (
#			$header[0]=>$name,
#			$header[1]=>$payment,
#			$header[2]=>$date,			
#		);
		my %row;
		for(my $i=0; $i<@header;$i++){
			$row{$header[$i]}=$values[$i];
		}
		push @data, \%row;
		
		
	}
	
	my $totalPayment_1 = 0;
	foreach my $data(@data){
		$totalPayment_1 += $data->{'Payment'};
	}
	close INPUT;
	print Dumper(@data);
	print "\nTotal payment: $totalPayment\n";
	print "\nTotal paymen1t: $totalPayment_1\n";
}
main();