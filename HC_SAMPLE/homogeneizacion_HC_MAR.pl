#!/usr/bin/perl
use warnings;
use strict;
use Getopt::Long;    # process command line options

# Process options
my $debug         = 0;
my $opt_suffix    = "_";
Getopt::Long::GetOptions(
    "debug"     =>  \$debug,
 ) or exit;

while ( @ARGV ) {
	
	# $input_file and $output_filenames
	my $input_file  = shift @ARGV;
	my $output_file = newFilename($input_file . $opt_suffix);
	if ( $debug ) { print "\nDEBUG: \$output_file = $output_file\n" }
	
	# Open input and output files
	open( "INFILE", "< $input_file" ) or die "ERROR: Cannot open input file: $input_file\n\n";
	print "Reading from input file:  $input_file\n";
	open( "OUTFILE", "> $output_file" ) or die "ERROR: Cannot open output file: $output_file\n\n";
	print "Writing to output file:   $output_file\n";
		
	while (my $line=<INFILE>) {

		# Replacement 1
		if ( $line =~  /<span\p{Z}+?class\p{Z}*?=\p{Z}*?"breadcrumbElement">.*?<\/span>/) {
			$line =~ s/<span\p{Z}+?class\p{Z}*?=\p{Z}*?"breadcrumbElement">.*?<\/span>//g;
		    $/ = "\n";
		}
		# Replacement 2
		elsif ( $line =~ /<a\p{Z}+?href\p{Z}*?=\p{Z}*?".*?">.*?<\/a>/) {
            $line =~ s/<a\p{Z}+?href\p{Z}*?=\p{Z}*?".*?">.*?<\/a>//g;  
			$/ = "\n";
		}
		print OUTFILE $line;
	}
	
	close (INFILE);
	close (OUTFILE);
	
	&renameFile($input_file, $output_file);
}

# Return a valid filename that doesn't already exist
# $ = newFilename($filename)
sub newFilename {
    my $filename = $_[0];
    while ( -e $filename ) {
        $filename .= "_";
    }
    return $filename;
}

sub renameFile {
	#rename output_files, input_files
	my $old_suffix = "_old.xml";
	my $original_input = $_[0];
	my $original_output = $_[1];
	my $number_of_characters = length($original_input);
	my $original_sin_ext = substr($original_input,0,$number_of_characters - 4);
	system("mv",$_[0],$original_sin_ext . $old_suffix);
	system("mv",$_[1],$original_input);
}	



