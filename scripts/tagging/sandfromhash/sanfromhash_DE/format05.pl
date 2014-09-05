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

# Banner
print "\n\n";
print " ###############################\n";
print " ### format05.pl             ###\n";
print " ###############################\n\n";

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
		if($line =~ /<header/) {
		  print OUTFILE $line . "<legislature begin=\"20050505\" end=\"20100506\">54th</legislature>" . "\n";
		}
		elsif($line =~ /<edition/) {
		  print OUTFILE $line . "<index>" . "\n" . "<indextitle>Index</indextitle>" . "\n" . "</index>" . "\n";
		}
		elsif ( $line =~ /p{Z}/ ){ #Si la linea leida contiene la cadena {Z}
    
			#poner < al final de la linea para usar >< como marca de separacion entre lineas
			my $last_position = rindex($line,">");
			my $new_line = substr($line,0,$last_position+1) . "<"; 
				
			# Numero de caracteres de la nueva linea
			my $number_of_characters = length($new_line);

			# Numero de caracteres leidos al recorrer la linea, inicialmente 0
			my $characters_read = 0;
			my $position = 0;
			
			# subcadena a encontrar en la linea leida
			my $substring = "><";

			# Mientras no se haya recorrido toda la linea
			while($position != -1) {
				# encontrar la primera ocurrencia de la subcadena "><" en la linea a partir de una posicion dada
				$position = index($new_line, $substring, $characters_read);
				# $RESULT = substr(EXPR, OFFSET, LENGTH);
				my $string = substr($new_line,$characters_read,$position + 1 - $characters_read);
				$string =~ s/\\p{Z}/ /g;
				$string =~ s/&/and/g;
				if($string =~ /<\/affiliation/) {
					print OUTFILE $string;
				}
				else {
					print OUTFILE $string . "\n";
				}
				$characters_read = $position + 1;
			}
		}
		#Copiar en el fichero el resto de lineas salvo las que contienen las etiquetas: 
		elsif( $line !~ /(<index|<affiliation|<post>on\Wbehalf\Wof|<gender|<status)/) {
			print OUTFILE $line;
		}
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
	my $old_suffix = ".xml_old_new_old";
	my $original_input = $_[0];
	my $original_output = $_[1];
	my $number_of_characters = length($original_input);
	my $original_sin_ext = substr($original_input,0,$number_of_characters - 4);
# 	LINUX
#	system("mv",$_[0],$original_sin_ext . $old_suffix);
#	system("mv",$_[1],$original_input);
#	WINDOWS	
	rename($_[0],$original_sin_ext . $old_suffix);
	rename($_[1],$original_input);
	
}

