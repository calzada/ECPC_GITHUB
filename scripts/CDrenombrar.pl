#!/usr/bin/perl
use warnings;
use strict;
use Getopt::Long;    # process command line options

# Process options
my $debug         = 0;
Getopt::Long::GetOptions(
    "debug"     =>  \$debug,
 ) or exit;

# Banner
print "\n\n";
print " ###############################\n";
print " ### renombrar.pl            ###\n";
print " ###############################\n\n";

while ( @ARGV ) {
	
	# $input_file and $output_filenames
	my $input_file  = shift @ARGV;
	
	# Open input file
	open( "INFILE", "< $input_file" );
    
    while (my $line=<INFILE>) {
		if($line =~ /<.*?DS\.\WCongreso de los Diputados.*?\d{2}\/\d{2}\/\d{4}.*?$/) {
		      $line =~ s/<.*?DS\.\WCongreso de los Diputados.*?(\d{2})\/(\d{2})\/\d{2}(\d{2}).*?$/CD$3$2$1/g;
		      $line =~ s/\s//g;
		      rename($input_file, $line . ".xml");
		}
	}
    close(INFILE);	
}