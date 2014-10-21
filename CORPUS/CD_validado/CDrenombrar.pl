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
		if($line =~ /<date.*?celebrada.*?(\d{1,2}.*?\d{4}).*?$/) {
		      $line =~ s/<date.*?celebrada.*?(\d{1,2}.*?\d{4}).*?$/$1/g;
		      $line =~ s/\s//g;
		      $line =~ s/de//g;
		      $line =~ s/[A-Z]/[a-z]/g;
		      if ( $line =~ /enero/ ) {
		          $line =~ s/enero/01/g;
		      }
		      if ( $line =~ /febrero/ ) {
		          $line =~ s/febrero/02/g;
		      }
		      if ( $line =~ /marzo/ ) {
		          $line =~ s/marzo/03/g;
		      }
		      if ( $line =~ /abril/ ) {
		          $line =~ s/abril/04/g;
		      }
		      if ( $line =~ /mayo/ ) {
		          $line =~ s/mayo/05/g;
		      }
		      if ( $line =~ /junio/ ) {
		          $line =~ s/junio/06/g;
		      }
		      if ( $line =~ /julio/ ) {
		          $line =~ s/julio/07/g;
		      }
		      if ( $line =~ /agosto/ ) {
		          $line =~ s/agosto/08/g;
		      }
		      if ( $line =~ /septiembre/ ) {
		          $line =~ s/septiembre/09/g;
		      }
		      if ( $line =~ /octubre/ ) {
		          $line =~ s/octubre/10/g;
		      }
		      if ( $line =~ /noviembre/ ) {
		          $line =~ s/noviembre/11/g;
		      }
		      if ( $line =~ /diciembre/ ) {
		          $line =~ s/diciembre/12/g;
		      }
		      $myLength = length($line);
		      if ( $line = 7) {
		          $line =~ s/(\d{1})(\d{2})(\d{2})(\d{2})/$4$2$1/g;
		      }
		      else {
		          $line =~ s/(\d{2})(\d{2})(\d{2})(\d{2})/$4$2$1/g;
		      }
		      print 'LINE: ' . $line . "\n";
		      my $status = rename($input_file, $line . ".xml");
		      print "STATUS" . $status . "\n";
		}
	}
    close(INFILE);	
}