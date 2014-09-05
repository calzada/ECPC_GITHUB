#!/usr/bin/env perl
use warnings;
use strict;
use Getopt::Long;    # process command line options
use Dumpvalue;       # used for debugging hash data structures
 
&usage if ( @ARGV < 3 );

sub usage {
    print "\n
search_replace_table.pl by Chris Koknat
    special thanks to David Irving and Kenneth K on PerlMonks
    
Purpose:
    Search and replace on files using a two-column table file
    
Options:
    -table file
    Use this file for all search/replace.
    The format is as follows:
    search1    replace1
    search2    replace2
    search3    replace3
    
    Example:
    foo        BA
    BA         BAH
    
    -reverse
    Use column 2 to search, and column 1 to replace
    Default is to use column 1 to search, and column 2 to replace
    
    -suffix
    The default output filename is the name of the input file, appended with _
    Use this option to change the suffix
    
    -regex
    Treat the entries in the table file as Perl regular expressions (^,\$,[,],etc)
        
Usage examples:
    search_replace_table.pl  -table tablefile  file
    search_replace_table.pl  -table tablefile  *.stil
    search_replace_table.pl  -table tablefile  file  -suffix _fixed
    
";
    exit;
}

# Process options
my $debug         = 0;
my $opt_reverse   = 0;
my $opt_tablefile = "";
my $opt_suffix    = "_";
my $opt_regex     = 0;
Getopt::Long::GetOptions(
    "debug"     =>  \$debug,
    "reverse"   =>  \$opt_reverse,
    "table=s"   =>  \$opt_tablefile,
    "suffix=s"  =>  \$opt_suffix,
    "regex"     =>  \$opt_regex,
) or exit;

# Banner
print "\n\n";
print " ###############################\n";
print " ### sandrfromhash05.pl      ###\n";
print " ###############################\n\n";

# Read table file
my $table_ref;
if ( $opt_tablefile ) {
    $table_ref = read_table_file($opt_tablefile,$opt_reverse)
}
else {
    print "ERROR:  You need to specify a table file with the -table option\n";
    print "Exiting.\n\n";
    exit 1;
}

if ( $debug ) {
    print "\nDEBUG: Dumping \$table_ref:\n";
    Dumpvalue->new->dumpValue(\$table_ref);
}

# Sort the keys early to save time
my @keys_ordered = reverse sort { length $a <=> length $b } keys %{$table_ref};
if ( $debug ) { print "\nDEBUG: \@keys_ordered = @keys_ordered\n" }

# Loop through input files
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
    
    # Loop through input file
    my $replacecount = 0;
    LINE: while ( my $line = <INFILE> ) {
        if ($debug>=2) { print "DEBUG: $.   $line"; }
        my $old_line = $line;
        my $new_line = $line;
        my $old_count = 0;
        my $new_count = 0;
        KEY: for my $key ( @keys_ordered ) {
            if ($debug) { print "DEBUG:  \$key = $key\n" }
            my $regex = ( $opt_regex ? $key : quotemeta($key) );
            if ( $debug ) { print "DEBUG:  \$regex = $regex\n" }
            if ( $debug ) { print "DEBUG:  \$old_line = $old_line" }
            my $backtrack_line = $new_line;
            my $tmp_line = $old_line;
            if ( $old_count = ( $tmp_line =~ s/$regex/$table_ref->{$key}/g ) ) {
                if ( $debug ) { print "DEBUG:  \$old_count = $old_count\n" }
                $new_count = ( $new_line =~ s/$regex/$table_ref->{$key}/g );
                if ( $debug ) { print "DEBUG:  \$new_count = $new_count\n" }
                if ( $debug ) { print "DEBUG:  \$new_line = $new_line" }
                if ( $new_count != $old_count ) {
                    if ($debug) { print "DEBUG:  Match count failure for key $key on ($old_count/$new_count) on line $.: $old_line" }
                    $new_count = $old_count;
                    $new_line = $backtrack_line;
                    next KEY;
                }
                if ( $debug ) { print "DEBUG:  line $. replacing $key with $table_ref->{$key}\n" }
                $replacecount += $new_count;
            }
            else { } # do nothing
        }
        print OUTFILE $new_line;
        next LINE;
    } 

	close (INFILE);
	close (OUTFILE);
	
	&renameFile($input_file, $output_file);
    
}

print "\nDone.\n\n";


###########################
### END OF MAIN PROGRAM ###
###########################


# $ = read_table_file($filename,$opt_reverse)
# Reads 2-column table mapping file, returns hash reference
sub read_table_file {
    my $reverse = 0;
    my $table_file = $_[0];
    if ( defined $_[1]  and  $_[1] == 1 ) {
        $reverse = 1;
    }
    my %map;
    open( "MAPFILE", "< $table_file" )  or die "ERROR: Cannot open file for reading:  $table_file\n\n";
    print "Reading from table file $table_file\n";
    while ( my $line = <MAPFILE> ) {

        # blank line or # comment
        if ( $line =~ /^\s*$/  or  $line =~ /^\s*#/ ) {
            # do nothing
        }
        
        # search_term    replace_term
        # xtals_in       XTAL_SSIN
        elsif ( $line =~ /^\s*(\S+)\s+(\S+)/ ) {
            my ($key,$value) = ($1,$2);
            if ( $reverse ) {
                if ( defined $map{$value} ) {
                    print "ERROR:  Table file $table_file contains 2 entries for $value in the right column!\n";
                    print "        1st entry was:  $map{$value}  $value\n";
                    print "        2nd entry was:  $key  $value  on line $.\n";
                    print "Exiting.\n\n";
                    exit 1;
                }
                else {
                    $map{$value} = $key;
                }
            }
            else {
                if ( defined $map{$key} ) {
                    print "ERROR:  Table file $table_file contains 2 entries for $key in the left column!\n";
                    print "        1st entry was:  $key  $map{$key}\n";
                    print "        2nd entry was:  $key  $value  on line $.\n";
                    print "Exiting.\n\n";
                    exit 1;
                }
                else {
                    $map{$key} = $value;
                }
            }
        }
        
        # Unknown
        else {
            print "ERROR:  Did not understand line in config file:  $line";
            exit 1;
        }
    }
    return \%map;
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
	my $old_suffix = ".xml_old_new";
	my $original_input = $_[0];
	my $original_output = $_[1];
	my $number_of_characters = length($original_input);
	my $original_sin_ext = substr($original_input,0,$number_of_characters - 4);
	rename($_[0],$original_sin_ext . $old_suffix);
	rename($_[1],$original_input);
	
}
