use strict;
use warnings;

use File::Copy;

$|=1;
sub main {
	if (copy('F:\aakriti\Perl\collaterals\story.txt','F:\aakriti\Perl\collaterals\story_copy.txt')){
		print "File copied\n";
	} else {
		print "Unable to copy file\n";
	}
	
	if (copy('F:\aakriti\Perl\collaterals\story.txt','F:\aakriti\Perl\collaterals\story_copy1.txt')){
		print "File copied\n";
	} else {
		print "Unable to copy file\n";
	} 
	if (move('F:\aakriti\Perl\collaterals\story_copy1.txt','F:\aakriti\Perl\collaterals\story_move.txt')){
		print "File moved\n";
	} else {
		print "Unable to move file\n";
	}
	
	if (copy('F:\aakriti\Perl\collaterals\story_move.txt','F:\aakriti\Perl\collaterals\story_copy2.txt')){
		print "File copied\n";
	} else {
		print "Unable to copy file\n";
	} 
	
	unlink('F:\aakriti\Perl\collaterals\story_copy2.txt');
	print "File deleted\n";
	
}
main();