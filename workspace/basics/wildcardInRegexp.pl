use strict;
use warnings;

$| = 1;

sub main {

	my $file = 'F:\aakriti\Perl\workspace\basics\story.txt';

	open( INPUT, $file ) or die("Input file not found... \n");
	while ( my $line = <INPUT> ) {
		if ( $line =~ /I.h.d/ ) {
			# . for matching any single character including space
			print $line;
		}
	}
	close(INPUT);
}
main();
