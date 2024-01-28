use strict;
use warnings;


$|=1;
sub main {
	my $command = 'dir';
	my @output = `$command` ; # or `ls -l`;
	print join('', @output);
	
}
main();