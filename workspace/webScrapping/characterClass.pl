use strict;
use warnings;



$|=1;

sub main{
	my $content = "The 39 Steps -  a GREAT book - colours_15 ==%== ABBCCBBCCABCA";
	
	if($content =~ /(\d+)/){
		print "Matched '$1'\n";
	}else {
		print "No match\n"
	}
	
	# OR
	
	if($content =~ /([0-9]+)/){
		print "Matched '$1'\n";
	}else {
		print "No match\n"
	}
	
	if($content =~ /([A-Z]{2,})/){
		print "Matched '$1'\n";
	}else {
		print "No match\n"
	}
	if($content =~ /(c[A-Za-z0-9_]{2,})/){
		print "Matched '$1'\n";
	}else {
		print "No match\n"
	}
	if($content =~ /([\=\%]{2,})/){
		print "Matched '$1'\n";
	}else {
		print "No match\n"
	}
	if($content =~ /([ABC]{3,})/){
		print "Matched '$1'\n";
	}else {
		print "No match\n"
	}
	if($content =~ /([^0-9T\s]{5,})/){ # exclude ^
		print "Matched '$1'\n";
	}else {
		print "No match\n"
	}
	
}

main();