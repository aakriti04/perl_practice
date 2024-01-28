use strict;
use warnings;

$|=1;

sub main {
	my $val = "hello world";
	print "$val\n";
	my @ids = (
		'aakritibhardwaj@gmail.com',
		'aakriti.bhardwaj@gmail.com',
		'aakriti04@yahoo,com',
		'aakriti_04@gmail.com',
		'aakriti',
	);
	foreach my $id(@ids){
		print "id: $id - ";
		if ( $id =~ /\w+\@\w+\.\w+/){
			print"valid..\n";
		} else {
			print "invalid..\n";
		}
	}
}

main();

sub regex {
	print "In regex\n";
	my $text = 'The code for this device is GP8765. There is more text';
	# machine code - Two alphnumeric characters followed by 4 digits
	if ($text =~ /(\w{2}\d{4})/){
		print "machine code: $1\n";
	} else {
		print "machine code not found\n";
	}
	
	# match everthing after 'is<space> uptil . and not anything after dot'
	
	if ($text =~ /is\s+(\S*?)\./) {
		print "TEXT: $1\n";
	}
	#or
	if ($text =~ /\bis\b\s(.+?)\./) {
		print "TEXT: $1\n";
	}
	#or
	if ($text =~ /is\s(\S+?)\./) {
		print "TEXT: $1\n";
	}
	
	if ($text =~ /is\s(\w{2}\d{2,6})\./) {
		print "TEXT: $1\n";
	}
}

regex();
