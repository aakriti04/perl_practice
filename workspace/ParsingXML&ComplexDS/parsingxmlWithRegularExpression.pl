use strict;
use warnings;
use Data::Dumper;

use Getopt::Std;

$|=1;

sub main {
	my %opts;
	
	#Get command line options
	getopts('d:r',\%opts);
	
	if(!checkusage(\%opts)) {
		usage();
		exit();
	}
	my $input_dir = $opts{"d"};
	my @files =  get_files($input_dir);
#	print Dumper(\@files);

	process_files(\@files, $input_dir);
}

sub process_files {
	my ($files, $input_dir) = @_;
	print "$input_dir\n";
	print Dumper($files);
	
	foreach my $file(@${files}) {
		
		process_file($file, $input_dir);
	}
}

sub process_file {
	my ($file, $input_dir) =@_;
	
	print "processing $file in $input_dir ...\n";
	
	my $filepath  = "$input_dir/$file";
	open(INPUTFILE, $filepath) or die "Unable to open $filepath\n";
	$/ = "<entry>"; #regular expression
	my $count = 0;
	while(my $chunk = <INPUTFILE>) {
		print "\n\n$count: $chunk";
		my ($band) = $chunk =~ m'<band>(.*?)</band>'; #($band) is enclosed in () as to get the value of regexp (.*?) and not just 0/1 for true or false
		unless(defined($band)) {
			next;
		}
		print "BAND: $band\n";
		
		my @albums = $chunk =~ m'<album>(.*?)</album>'sg;
		print "found ".scalar(@albums). " for $band ...\n";
		
		print Dumper(@albums);
		$count++;
	}
	close(INPUTFILE);
}

sub get_files { 
	my $input_dir = shift;
	unless(opendir(INPUTDIR, $input_dir)){
		die "\nUnable to open directory '$input_dir'";
	}
	my @files = readdir(INPUTDIR);
	close(INPUTDIR);
	@files = grep(/\.xml$/, @files);
	return @files;
	
	
}
sub checkusage {
	my $opts = shift;
	
	my $r = $opts->{"r"};
	my $d = $opts->{"d"};
	
	# Image a is optional; don't really need to refer to it here at all.
	
	# r is optional
	# d is mandatory.
	
	unless(defined($d)) {
		return 0;
	}
	
	return 1;
}

sub usage {
	print <<USAGE;
	
usage: perl main.pl <options>
	-d <directory>	specify directory in which to find XML files.
	-r run the program; process the files

example usage:
	# Process files in currect directory.
	perl main.pl -d . -r
	
USAGE
}

main();