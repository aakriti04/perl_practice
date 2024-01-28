use strict;
use warnings;

$| = 1;

sub main {

	my $file = 'F:\aakriti\Perl\workspace\basics\story.txt';

	open( INPUT, $file ) or die("Input file not found... \n");
	while ( my $line = <INPUT> ) {
		if ( $line =~ /(I.h..)(.(.).)/ ) {
			# quantifiers -  . + .*(Greedy) .*?(Non-greedy)
			print "First match: $1 \t Second Match: $2 \t Third match: $3\n";
		}
	}
	close(INPUT);
}
main();
