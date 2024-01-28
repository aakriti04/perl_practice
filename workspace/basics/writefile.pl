use strict;
use warnings;

$| = 1;

sub main {

	#	my $output = 'output.txt';
	#	open(OUTPUT, '>'.$output) or die "Can't open file for write\n";
	#	# > is required to let the perl know to create a file for write.
	#	print OUTPUT "Hello\n";
	#	close(OUTPUT);

	my $input = 'F:\aakriti\Perl\workspace\basics\story.txt';
	my $output = 'output.txt';
	open(INPUT, $input ) or die("Input file not found... \n");
	open(OUTPUT, '>'.$output) or die "Can't open file for write\n";


	while ( my $line = <INPUT> ) {
		if ( $line =~ /\begg\b/ ) {
			# \b is for word boundary to match the whole word.
			
			# REPLACEMENT OF WORD 'you' with U
			$line =~ s/\byou\b/U/ig;
			print OUTPUT $line;
		}
	}
	close(INPUT);
	close(OUTPUT);
}

main();
