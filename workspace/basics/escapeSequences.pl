use strict;
use warnings;

$|=1;

sub main {
	# \d - digit
	# \s space
	# \S - non-space
	# \w alphanumeric including underscore
	my $text ='I am 117 years old tomorrow.'; #'' TO NOT BE ABLE TO ESCAPE ANY SPECIAL CHARACTER
	if($text =~ /(\d*)/) {
		print "matched: '$1'\n"; #matched: ''
	}
	if($text =~ /(\d+)/) {
		print "matched: '$1'\n"; #matched: '117'
	}
	if($text =~ /(am\s+\d+)/) {
		print "matched: '$1'\n"; #matched: 'am 117'
	}
	if($text =~ /(y\S*)/) {
		print "matched: '$1'\n"; #matched: 'years'
	}
	$text ='Iam117years_oldtomorrow.'; #'' TO NOT BE ABLE TO ESCAPE ANY SPECIAL CHARACTER
	if($text =~ /(\w*)/) {
		print "matched: '$1'\n"; #matched: 'Iam117years_oldtomorrow' \.\ is not matched
	}
	#NUMERIC QUNATIFIERS
	# * zero or more of the preceding character as many as possible
	# + one or more of the preceding character as many as possible
	# *? zero or more of the preceding character as few as possible
	# +? one or more of the preceding character as few as possible
	# {5} five of the preceding
	# {3,6} atleast three and atmost 6
	# {3,} atleast three
	
	$text = 'DE75883';
	if($text =~ /(DE\d\d\d\d\d)/){
		print "matched: '$1'\n"; #matched: 'DE75883'
	}
	if($text =~ /(DE\d{5})/){
		print "matched: '$1'\n";  #matched: 'DE75883'
	}
	if($text =~ /(DE\d{3,6})/){
		print "matched: '$1'\n";  #matched: 'DE75883'
	}
	if($text =~ /(DE\d{3,})/){
		print "matched: '$1'\n";  #matched: 'DE75883'
	}
	if($text =~ /(DE\d{7,})/){
		print "matched: '$1'\n";  
	} else {
		print "not matched 7\n"; #not matched 7
	}
	$text = 'DE$75883';
	if($text =~ /(DE\$\d{5})/){
		print "matched: '$1'\n";  #matched: 'DE$75883' ESCAPE $
	}
}
main();