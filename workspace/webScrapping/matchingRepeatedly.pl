use strict;
use warnings;

use LWP::Simple;

$|=1;

sub main{
	my $content = get("https://caveofpython.com/learn-python/python-virtual-environments/");
	
	unless(defined($content)){
		die "URL unreadchabe\n";
	}
	
#	if($content =~ m'<code class=".*?">(.+?)</code>'ig){   # m for match and i for ignore case
#		print "line: $1\n";
#	} else {
#		print "Could not find\n";
#	}
	
#	while($content =~ m|(<code class="">(.+?)</code>)|sig){ # s dor singe line, to be able to match across multiple lines
#		print "line: $1\n";
#		print "line 2: $2\n";
#	}
	
	while($content =~ m|(<\s*code\s+[^>]*class\s*\=\s*['"]([^>'"]*)['"][^>]*>([^<>]*)</.*?>)|sig){ # s dor singe line, to be able to match across multiple lines
		print "line: $1\n";
		print "line 2: $2\n";
		print "line 3: $3\n";
	}
	
	
}

main();