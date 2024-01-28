use strict;
use warnings;
use Data::Dumper;
use XML::Simple;

use Getopt::Std;
use DBI;

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

	my @data = process_files(\@files, $input_dir);
	add_to_database(\@data);
	print Dumper(@data);
	
	
}

sub add_to_database {
	
	my $data = shift;
	
	my $host = "sql6.freesqldatabase.com";
	my $database = "sql6638399";
	my $user = "sql6638399";
	my $password = "Brfg6fkH8s";
	
	# Create a database handle
	my $dbh = DBI->connect("DBI:mysql:database=$database;host=$host", $user, $password, {RaiseError => 1});
	
	unless(defined($dbh)) {
		die "Cannot connect to db\n";
		
	}
	print "Connected to Database\n";
	
	my $sth_bands = $dbh->prepare('insert into Bands (name) values (?)');
	my $sth_albums = $dbh->prepare('insert into Albums (name,position,band_id) values (?,?,?)');
	
	unless($sth_bands){
		die "Error preparing Bands insert SQL\n";
	}
	unless($sth_albums){
		die "Error preparing Albums insert SQL\n";
	}
	
	$dbh->do('delete from Albums') or die "Can't Clean Albums table\n";
	$dbh->do('delete from Bands') or die "Can't Clean Bands table\n";
	
	foreach my $data(@$data) {
		my $band_name = $data->{"name"};
		my $albums = $data->{"albums"};
		
		print "Inserting $band_name into db\n";
		unless($sth_bands->execute($band_name)){
			die "Error executing SQL\n";
		}
		my $band_id = $sth_bands->{'mysql_insertid'};
		
		foreach my $album(@$albums) {
			
			my $album_name  = $album->{"name"};
			my $album_position = $album->{"position"};
			
			unless($sth_albums->execute($album_name,$album_position, $band_id)) {
				die "Unable to execute albums insert\n";
			}
		}
	}
	
	$sth_bands->finish();
	$sth_albums->finish();
	$dbh->disconnect();
	print "Completed.\n";
	
}

sub process_files {
	my ($files, $input_dir) = @_;
#	print "$input_dir\n";
#	print Dumper($files);
	my @data;
	foreach my $file(@${files}) {
		
		my @bands = process_file($file, $input_dir);
		#print Dumper(@bands);
		push @data , @bands;
	}
	return @data;
}

sub process_file {
	my ($file, $input_dir) =@_;
	
	print "processing $file in $input_dir ...\n";
	
	my $filepath  = "$input_dir/$file";
	open(INPUTFILE, $filepath) or die "Unable to open $filepath\n";
	undef $/;
	my $content = <INPUTFILE>;
	close(INPUTFILE);
#	print $content;
	my $parser =  new XML::Simple;
	my $dom =$parser->XMLin($content, ForceArray => 1);

	my @output;
	foreach my $band(@{$dom->{"entry"}}) {
		my $band_name = $band->{"band"}[0];

		my $albums = $band->{"album"};
		my @albums;

		foreach my $album(@$albums) {
			my $album_name = $album->{"name"}[0];
			my $chartposition = $album->{"chartposition"}[0];

			push @albums, {
				"name" => $album_name,
				"position" => $chartposition,
			};
		}
		push @output, {
			"name" => $band_name,
			"albums" => \@albums,
		};

	}
	return @output;
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