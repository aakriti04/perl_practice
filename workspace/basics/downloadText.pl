use strict;
use warnings;

use LWP::Simple;

sub main {
	print "Downloading....\n";

# print get("https://stackoverflow.com/questions/3365518/should-i-choose-activeperl-or-strawberry-perl-for-windows");
# getstore("https://stackoverflow.com/questions/3365518/should-i-choose-activeperl-or-strawberry-perl-for-windows", "download.html");
	my $code = getstore(
"https://www.gravatar.com/avatar/b6116ac3c4b5835c6745570ea73a85c1?s=64&d=identicon&r=PG",
		"logo.png"
	);
	if ( $code == 200 ) {
		print "Success\n";
	}
	else {
		print "Failed\n";
	}

	# '' - interpreted as literal string without special characters
	#  "" -  special characters are interpreted
	print "Finished downloading....\n";
}

main();
