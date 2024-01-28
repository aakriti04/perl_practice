use strict;
use warnings;

use LWP::Simple;

$|=1;

sub main{
	my $content = get("https://caveofpython.com/learn-python/python-virtual-environments/");
	
	unless(defined($content)){
		die "URL unreadchabe\n";
	}

	# extract all class
	my @classes =  $content =~ m|class="([^"']*?)"|ig;
	
	if (@classes == 0){
		print "no matches\n";
	} else {
		foreach my $class(@classes){
			print "class: $class\n";
		}
	}
	
	
}

main();