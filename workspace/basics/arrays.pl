use strict;
use warnings;

$|=1; #for removing the o/p buffer

sub main {
	my @files = (
		'F:\aakriti\Perl\workspace\basics\logo.png',
		'F:\aakriti\Perl\workspace\basics\download.html',
		'F:\aakriti\Perl\workspace\basics\missing.txt',
	);
	foreach my $file(@files) {
		if(-f $file){
			print "File found: $file\n";
		} else {
			print "File not found: $file\n";
		}
	}
	
}

main();