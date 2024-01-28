use strict;
use warnings;

use LWP::Simple;

$|=1;

sub main{
	my $content = get("https://caveofpython.com/learn-python/python-virtual-environments/");
	
	unless(defined($content)){
		die "URL unreadchabe\n";
	}
	
	if($content =~ m'<code class=".*?">(.+?)</code>'ig){   # m for match and i for ignore case
		print "line: $1\n";
	} else {
		print "Could not find\n";
	}
	
	
}

main();

# other scrappering modules can also be used:
# https://metacpan.org/pod/Web::Scraper
# https://stackoverflow.com/questions/4861319/how-can-i-get-started-with-web-page-scraping-using-perl