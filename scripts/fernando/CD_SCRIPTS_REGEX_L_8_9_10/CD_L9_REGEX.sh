#!/bin/sh
#Este script para etiquetado de intervenciones de los diputados del CD
#autores: fg, mc
#fecha: 12/08/2014
#ETIQUETADO CON XML 
#(al convertir los discursos en pdf ha sido más cómodo etiquetarlos en XML que en HTML, por las etiquetas que usa el conversor, en este caso ADOBE ACROBAT X PRO)
#perl -pi -e 's///g' *.xml



##PARTE 1 
##PORTADA, ORDEN DEL DÍA Y SUMARIO

# headings (se quedan dentro de speech, pero se arregla en otro one-liner)
perl -pi -e 's/(<P>|<H4>|<LI_Title>)(—*\s*?\p{Lu}\p{Lu}+.*?\p{Lu}+.*?)(<\/P>|<\/H4>|<\/LI_Title>)/XXZZheadingYYWWXXZZPYYWW$2XXZZPYYWWXXZZ\/headingYYWW/g' *.xml

# dejarlo todo en una línea
perl -pi -e 's/(\n|\r)+//g' *.xml

# Datos portada
perl -pi -e 's/<\?xml version.*?(CORTES GENERALES)/XXZZ?xml version="1.0" encoding="UTF-8" standalone="no"?YYWWXXZZPYYWWXXZZ!DOCTYPE ecpc_CD SYSTEM "cd.dtd"YYWWXXZZPYYWWXXZZecpc_CDYYWWXXZZPYYWWXXZZheaderYYWWXXZZPYYWWXXZZlegislature begin="20080401" end="20111213"YYWWVIIIXXZZ\/legislatureYYWWXXZZPYYWW$1/g' *.xml

#datos portada 2
perl -pi -e 's/(CORTES GENERALES)(.*?Núm.*?)<\/P>.*?<P>(Sesión.*?)<\/P>.*?(celebrada.*?)<P>.*?(ORDEN DEL DÍA:)/XXZZtitleYYWW$2$4XXZZ\/titleYYWWXXZZPYYWWXXZZlabelYYWW$3XXZZ\/labelYYWWXXZZPYYWWXXZZdateYYWW$4XXZZ\/dateYYWWXXZZPYYWWXXZZplaceYYWW$1XXZZ\/placeYYWWXXZZPYYWWXXZZeditionYYWW$2XXZZ\/editionYYWWXXZZPYYWWXXZZindexYYWWXXZZPYYWWXXZZindexitemYYWWXXZZPYYWW$5XXZZPYYWW/g' *.xml

#orden del día
perl -pi -e 's/(ORDEN DEL DÍA:XXZZPYYWW)(.*?)(SUMARIO)/$1$2XXZZPYYWWXXZZ\/indexitemYYWWXXZZPYYWWXXZZindexitemYYWWXXZZPYYWW$3:/g' *.xml

# sumario
perl -pi -e 's/(SUMARIO)(.*?)(<P>|<H4>|<LI_Title>)(—*\s*?\p{Lu}\p{Lu}+?[^\p{Ll}]\s*?\p{Lu}\p{Lu}+?[^\p{Ll}]\s*?\p{Lu}\p{Lu}.*?[^\p{Ll}][^\p{Ll}]\s*?\(Núm.*?de exp.*?\))/$1$2XXZZPYYWWXXZZ\/indexitemYYWWXXZZPYYWWXXZZ\/indexYYWWXXZZPYYWWXXZZ\/headerYYWWXXZZPYYWWXXZZPYYWWXXZZbodyYYWWXXZZPYYWWXXZZPYYWWXXZZchair who="Bono Martínez, José"YYWWXXZZPYYWWXXZZPYYWW$3$4$5/g' *.xml



##PARTE 2
##INTERVENCIONES

# hacer distinción donde empieza una intervención señalando que es un párrafo diferente 1 ¿PASAR ESTE DOS VECES?
perl -pi -e 's/(<P>|<H4>)(El señor\s\p{Lu}\p{Lu}+?.*?\p{Lu}\p{Lu}.*?:)/<PARRAFO_2>$2/g' *.xml

perl -pi -e 's/(<P>|<H4>)(El señor\s\p{Lu}\p{Lu}+?.*?\p{Lu}\p{Lu}.*?:)/<PARRAFO_2>$2/g' *.xml

# hacer distinción donde empieza una intervención señalando que es un párrafo diferente 2
perl -pi -e 's/(<P>|<H4>)(La señora\s\p{Lu}\p{Lu}+?.*?\p{Lu}\p{Lu}.*?:)/<PARRAFO_2>$2/g' *.xml

perl -pi -e 's/(<P>|<H4>)(La señora\s\p{Lu}\p{Lu}+?.*?\p{Lu}\p{Lu}.*?:)/<PARRAFO_2>$2/g' *.xml

# intervenciones PRESIDENTe/a: (del congreso) 1
perl -pi -e 's/(<PARRAFO_2>)El señor\s*?(PRESIDENTE):(.*?)(<PARRAFO_2>)/$1XXZZPYYWWXXZZinterventionYYWWXXZZPYYWWXXZZspeakerYYWWXXZZPYYWWXXZZnameYYWWBONO MARTÍNEZXXZZ\/nameYYWWXXZZPYYWWXXZZpostYYWW$2XXZZ\/postYYWWXXZZPYYWWXXZZ\/speakerYYWWXXZZPYYWWXXZZspeech language="ES"YYWWXXZZPYYWW$3XXZZPYYWWXXZZ\/speechYYWWXXZZPYYWWXXZZ\/interventionYYWWXXZZPYYWW$4/g' *.xml

# intervenciones PRESIDENTe/a: (del congreso) 2
perl -pi -e 's/(<PARRAFO_2>)La señora\s*?(PRESIDENTA):(.*?)(<PARRAFO_2>)/$1XXZZPYYWWXXZZinterventionYYWWXXZZPYYWWXXZZspeakerYYWWXXZZPYYWWXXZZnameYYWWBONO MARTÍNEZXXZZ\/nameYYWWXXZZPYYWWXXZZpostYYWW$2XXZZ\/postYYWWXXZZPYYWWXXZZ\/speakerYYWWXXZZPYYWWXXZZspeech language="ES"YYWWXXZZPYYWW$3XXZZPYYWWXXZZ\/speechYYWWXXZZPYYWWXXZZ\/interventionYYWWXXZZPYYWW$4/g' *.xml

# intervenciones vicepres 1 (quitado PRESIDENTE)
perl -pi -e 's/(<PARRAFO_2>)El señor\s*?(VICEPRESIDENTE|PRESIDENTE DEL GOBIERNO)\s*?\((\p{Lu}\p{Ll}.+?\p{Ll})\):(.*?)(<PARRAFO_2>)/$1XXZZPYYWWXXZZinterventionYYWWXXZZPYYWWXXZZspeakerYYWWXXZZPYYWWXXZZnameYYWW$3XXZZ\/nameYYWWXXZZPYYWWXXZZpostYYWW$2XXZZ\/postYYWWXXZZPYYWWXXZZ\/speakerYYWWXXZZPYYWWXXZZspeech language="ES"YYWWXXZZPYYWW$4XXZZPYYWWXXZZ\/speechYYWWXXZZPYYWWXXZZ\/interventionYYWWXXZZPYYWW$5/g' *.xml

# intervenciones vicepres 2 (quitada PRESIDENTA)
perl -pi -e 's/(<PARRAFO_2>)La señora\s*?(VICEPRESIDENTA|PRESIDENTA DEL GOBIERNO)\s*?\((\p{Lu}\p{Ll}.+?\p{Ll})\):(.*?)(<PARRAFO_2>)/$1XXZZPYYWWXXZZinterventionYYWWXXZZPYYWWXXZZspeakerYYWWXXZZPYYWWXXZZnameYYWW$3XXZZ\/nameYYWWXXZZPYYWWXXZZpostYYWW$2XXZZ\/postYYWWXXZZPYYWWXXZZ\/speakerYYWWXXZZPYYWWXXZZspeech language="ES"YYWWXXZZPYYWW$4XXZZPYYWWXXZZ\/speechYYWWXXZZPYYWWXXZZ\/interventionYYWWXXZZPYYWW$5/g' *.xml

#intervenciones ministros/as CARGO EN MAYÚSCULS Y ORADOR EN MINÚSCULAS Y PARÉNTESIS 1
perl -pi -e 's/(<PARRAFO_2>)El señor (MINISTR\p{Lu}.*?\p{Lu}\p{Lu})\s*?\((\p{Lu}\p{Ll}.+?\p{Ll})\):(.*?)(<PARRAFO_2>)/$1XXZZPYYWWXXZZinterventionYYWWXXZZPYYWWXXZZspeakerYYWWXXZZPYYWWXXZZnameYYWW$3XXZZ\/nameYYWWXXZZPYYWWXXZZpostYYWW$2XXZZ\/postYYWWXXZZPYYWWXXZZ\/speakerYYWWXXZZPYYWWXXZZspeech language="ES"YYWWXXZZPYYWW$4XXZZPYYWWXXZZ\/speechYYWWXXZZPYYWWXXZZ\/interventionYYWWXXZZPYYWW$5/g' *.xml

#intervenciones ministros/as CARGO EN MAYÚSCULS Y ORADOR EN MINÚSCULAS Y PARÉNTESIS 2
perl -pi -e 's/(<PARRAFO_2>)La señora (MINISTR\p{Lu}.*?\p{Lu}\p{Lu})\s*?\((\p{Lu}\p{Ll}.+?\p{Ll})\):(.*?)(<PARRAFO_2>)/$1XXZZPYYWWXXZZinterventionYYWWXXZZPYYWWXXZZspeakerYYWWXXZZPYYWWXXZZnameYYWW$3XXZZ\/nameYYWWXXZZPYYWWXXZZpostYYWW$2XXZZ\/postYYWWXXZZPYYWWXXZZ\/speakerYYWWXXZZPYYWWXXZZspeech language="ES"YYWWXXZZPYYWW$4XXZZPYYWWXXZZ\/speechYYWWXXZZPYYWWXXZZ\/interventionYYWWXXZZPYYWW$5/g' *.xml

#intervenciones normales, dos apellidos en mayúsc y :  1
perl -pi -e 's/(<PARRAFO_2>)El señor\s*?(\p{Lu}\p{Lu}+?.*?\p{Lu}\p{Lu}):(.*?)(<PARRAFO_2>)/$1XXZZPYYWWXXZZinterventionYYWWXXZZPYYWWXXZZspeakerYYWWXXZZPYYWWXXZZnameYYWW$2XXZZ\/nameYYWWXXZZPYYWWXXZZpostYYWWNAXXZZ\/postYYWWXXZZPYYWWXXZZ\/speakerYYWWXXZZPYYWWXXZZspeech language="ES"YYWWXXZZPYYWW$3XXZZPYYWWXXZZ\/speechYYWWXXZZPYYWWXXZZ\/interventionYYWWXXZZPYYWW$4/g' *.xml

#intervenciones normales, dos apellidos en mayúsc y :  2
perl -pi -e 's/(<PARRAFO_2>)La señora\s*?(\p{Lu}\p{Lu}+?.*?\p{Lu}\p{Lu}):(.*?)(<PARRAFO_2>)/$1XXZZPYYWWXXZZinterventionYYWWXXZZPYYWWXXZZspeakerYYWWXXZZPYYWWXXZZnameYYWW$2XXZZ\/nameYYWWXXZZPYYWWXXZZpostYYWWNAXXZZ\/postYYWWXXZZPYYWWXXZZ\/speakerYYWWXXZZPYYWWXXZZspeech language="ES"YYWWXXZZPYYWW$3XXZZPYYWWXXZZ\/speechYYWWXXZZPYYWWXXZZ\/interventionYYWWXXZZPYYWW$4/g' *.xml


# etiqueta chair who vice
perl -pi -e 's/(\(El señor vicepresidente,\s|\(La señora vicepresidenta,\s)(.*?)(,\socupa la Presidencia\.\))/XXZZPYYWWXXZZ\/chairYYWWXXZZPYYWW$1$2$3XXZZPYYWWXXZZchair who="$2"YYWWXXZZPYYWW/g' *.xml

# etiqueta chair who de vicepresidente/a
perl -pi -e 's/(XXZZPYYWWXXZZ\/chairYYWW)(XXZZPYYWW\(El señor vicepresidente,\s|XXZZPYYWW\(La señora vicepresidenta,\s)(.*?)(,\socupa la Presidencia\.\))(XXZZPYYWWXXZZchair who=".+?"YYWWXXZZPYYWW)(.*?)(XXZZ\/speechYYWWXXZZPYYWWXXZZ\/interventionYYWW)/$6$7XXZZPYYWW$1XXZZPYYWW$2$3$4XXZZPYYWW$5/g' *.xml


# etiqueta chair who presi
perl -pi -e 's/(\(El señor presidente|\(La señora presidenta)(\socupa la Presidencia\.\))/XXZZPYYWWXXZZ\/chairYYWWXXZZPYYWW$1$2XXZZPYYWWXXZZchair who="Bono Martínez, José"YYWWXXZZPYYWW/g' *.xml

# etiqueta chair who de presidente
perl -pi -e 's/(XXZZPYYWWXXZZ\/chairYYWW)(XXZZPYYWW\(El señor presidente|XXZZPYYWW\(La señora presidenta)(\socupa la Presidencia\.\))(XXZZPYYWWXXZZchair who="Bono Martínez, José"YYWWXXZZPYYWW)(.*?)(XXZZ\/speechYYWWXXZZPYYWWXXZZ\/interventionYYWW)/$5$6XXZZPYYWW$1XXZZPYYWW$2$3XXZZPYYWW$4/g' *.xml

# etiquetas headings se quedan dentro de speech, arreglar:
perl -pi -e 's/(XXZZheadingYYWW.*?XXZZ\/headingYYWW)(XXZZPYYWWXXZZ\/speechYYWWXXZZPYYWWXXZZ\/interventionYYWW)/$2XXZZPYYWWXXZZPYYWW$1XXZZPYYWW/g' *.xml


##PARTE 3
##CIERRE Y LIMPIEZA

#cierre body back y ecpc_CD al final del documento
perl -pi -e 's/(>)(Edita:.*?Depósito legal:.*?<\/P>)(.*?\Z)/$1$3XXZZPYYWWXXZZ\/chairYYWWXXZZPYYWWXXZZPYYWWXXZZ\/bodyYYWWXXZZPYYWWXXZZPYYWWXXZZbackYYWW$2XXZZ\/backYYWWXXZZPYYWWXXZZ\/ecpc_CDYYWW/g' *.xml

# párrafos 1
perl -pi -e 's/<P>/XXZZPYYWW/g' *.xml

# párrafos 2
perl -pi -e 's/XXZZPYYWW/\n/g' *.xml

# quitar "Página"
perl -pi -e 's/\nPágina//g' *.xml

# quitar las etiquetas que queden
perl -pi -e 's/<.*?>//g' *.xml

# omitir: Se cumple una regla, cuando está entre paréntesis algo normal (presidente), (PNV), etc, no debemos usar omitir. Debemos usar omitir en comentarios tipo: (loquesea .|!|?)
perl -pi -e 's/\((.*?)(\.|\?|\!)\)/XXZZomitYYWW\($1$2\)XXZZ\/omitYYWW/g' *.xml

# transformar nuestras etiquetas
perl -pi -e 's/XXZZ/</g' *.xml

perl -pi -e 's/YYWW/>/g' *.xml

# etiquetar el número de página
perl -pi -e 's/\.\s\.\s(\d+?\s)/<page_number>Página\s$1<\/page_number>/g' *.xml

# etiquetar el número de página 2
perl -pi -e 's/\.\.\s(\d+?\s)/<page_number>Página $1<\/page_number>/g' *.xml

# etiquetar el número de página 2
perl -pi -e 's/\.\.\s\n(\d+?\s)/<page_number>Página $1<\/page_number>/g' *.xml



## PARTE 4
## PARCHEADO


# corrección faltan datos
perl -pi -e 's/(<\/speech>\n<\/intervention>\n)(El señor)(.*?)(<\/name>)/$1\n<intervention>\n<speaker>\n<name>$3$4/g' *.xml

perl -pi -e 's/(<\/speech>\n<\/intervention>\n)(La señora)(.*?)(<\/name>)/$1\n<intervention>\n<speaker>\n<name>$3$4/g' *.xml

# omit en hora de cierre de sesión
perl -pi -e 's/(Eran las.*?|Era la.*?)(de la noche\.|de la tarde\.|de la mañana\.|de la madrugada\.|del mediodía\.)/<omit>$1$2<\/omit>/g' *.xml





##EJEMPLOS DE ALGUNOS ONELINERS QUE AÑADO Y PARECEN NO FUNCIONAR, LOS IRÉ AÑADIENDO AL ARCHIVO "ECPC PARCHEADO ESPECÍFICO.TXT"
# quitar "Página"
#perl -pi -e 's/\n^Página//g' *.xml

# quitar \n que sobra en title
#perl -pi -e 's/<title>(.*?)\n(.*?)<\/title>/<title>$1$2<\/title>/g' *.xml

# quitar \n que sobra en edition
#perl -pi -e 's/<edition>(.*?)\n(.*?)<\/edition>/<edition>$1$2<\/edition>/g' *.xml

# fallo PRESIDENTE después de un heading 
#perl -pi -e 's/<name>PRESIDENTE<\/name>\n<post>NA<\/post>/<name>BONO MARTÍNEZ<\/name>\n<post>PRESIDENTE<\/post>/g' *.xml










##FALTA COMPLETAR DATOS ORADORES CON SCRIPT QUE DIRIJA A DATOS DIPUTADOS 					OK

##IMPORTANTE: EL NOMBRE DEL/ DE LA PRESIDENTE/A del CD SE DEBE CAMBIAR EN CADA SCRIPT PARA CADA LEGISLATURA 	OK
##IMPORTANTE: BEGIN Y END DE CADA LEGISLATURA SE DEBE CAMBIAR EN CADA SCRIPT					OK


##CUIDADO CON LAS MAYÚSCULAS, EN jEdit NO SOLEMOS DIFERENCIAR AL TRABAJAR, PERO PERL LAS TIENE EN CUENTA

##El conjunto de metacaracteres para expresiones regulares es el siguiente:
## \ ^ $ . [ ] { } | ( ) * + ?
#Estos caracteres, en una expresión regular, son interpretados en su significado especial y no como los caracteres que normalmente representan. Una búsqueda que implique alguno de estos caracteres obligará a "escaparlo" de la interpretación mediante \, como se hace para evitar la interpretación por el shell de los metacaracteres del shell. En una expresión regular, el caracter ? representa "un caracter cualquiera"; si escribimos \?, estamos representando el caracter ? tal cual, sin significado adicional.
