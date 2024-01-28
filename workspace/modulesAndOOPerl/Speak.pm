package Speak;

use Exporter qw(import); #Exporter pacake has a subroutine named import


@EXPORT_OK = qw(test greet);
#@EXPORT = qw(test); #not considereed good practice as it might conflict with other modules of the loading perl script.
sub test {
	print "Hello World\n";	
}

sub greet {
	print "How is it going?\n";
	
}

#return 1;
1; #modules finish with 1 as return value
#"A Perl module must end with a true value or else it is considered not to have loaded...A module can end with false to indicate failure but this is rarely used and it would instead die()". 