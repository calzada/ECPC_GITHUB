#!/bin/sh
#Este script para etiquetado de intervenciones de los diputados del CD a partir de la Legislatura X número 53 (a partir de este núm. se producen cambios importantes en los textos)
#autores: fg, mc
#fecha: 11/11/2014
#ETIQUETADO CON XML 
#(al convertir los discursos en pdf ha sido más cómodo etiquetarlos en XML que en HTML, por las etiquetas que usa el conversor, en este caso ADOBE ACROBAT X PRO)
#perl -pi -e 's///g' *.xml



##PARTE 1 
##PORTADA, ORDEN DEL DÍA Y SUMARIO

# 1 dejarlo todo en una línea
perl -pi -e 's/(\n|\r)+//g' *.xml

# 2 headings
perl -pi -e 's/(<PARRAFO_NEGRITA_SIN_>)(.*?\p{Lu}\p{Lu}+.*?\p{Lu}+.*?)(<\/PARRAFO_NEGRITA_SIN_>)/XXZZheadingYYWWXXZZPYYWW$2XXZZPYYWWXXZZ\/headingYYWW/g' *.xml

# 3 Datos portada
perl -pi -e 's/<\?xml version.*?(DIARIO DE SESIONES DEL CONGRESO DE LOS DIPUTADOS)/XXZZ?xml version="1.0" encoding="UTF-8" standalone="no"?YYWWXXZZPYYWWXXZZ!DOCTYPE ecpc_CD SYSTEM "cd.dtd"YYWWXXZZPYYWWXXZZecpc_CDYYWWXXZZPYYWWXXZZheaderYYWWXXZZPYYWWXXZZlegislature begin="20111213" end="20151212"YYWWXXXZZ\/legislatureYYWWXXZZPYYWW$1/g' *.xml

# 4 datos portada 2
perl -pi -e 's/(DIARIO DE SESIONES DEL CONGRESO DE LOS DIPUTADOS)<\/.*?(Año.*?Núm\.\s.*?)Pág\..*?(Sesión.*?)<\/.*?(celebrada el.*?)<\/.*?(ORDEN DEL DÍA:)/XXZZtitleYYWW$1 PLENO Y DIPUTACIÓN PERMANENTE $2 $4XXZZ\/titleYYWWXXZZPYYWWXXZZlabelYYWW$3XXZZ\/labelYYWWXXZZPYYWWXXZZdateYYWW$4XXZZ\/dateYYWWXXZZPYYWWXXZZplaceYYWWCORTES GENERALESXXZZ\/placeYYWWXXZZPYYWWXXZZeditionYYWW$1 PLENO Y DIPUTACIÓN PERMANENTE $2XXZZ\/editionYYWWXXZZPYYWWXXZZindexYYWWXXZZPYYWWXXZZindexitemYYWWXXZZPYYWW$5XXZZPYYWW/g' *.xml

# 5 orden del día
perl -pi -e 's/(ORDEN DEL DÍA:XXZZPYYWW)(.*?)(>)(SUMARIO|sumario|Sumario|S U M A R I O)(<)/$1$2$3XXZZPYYWWXXZZ\/indexitemYYWWXXZZPYYWWXXZZindexitemYYWWXXZZPYYWWSUMARIO:XXZZPYYWW$5/g' *.xml

# 6 sumario
perl -pi -e 's/(SUMARIO:XXZZPYYWW)(.*?)(XXZZheadingYYWWXXZZPYYWW)/$1$2XXZZPYYWWXXZZ\/indexitemYYWWXXZZPYYWWXXZZ\/indexYYWWXXZZPYYWWXXZZ\/headerYYWWXXZZPYYWWXXZZPYYWWXXZZbodyYYWWXXZZPYYWWXXZZPYYWWXXZZchair who="Posada Moreno, Jesús"YYWWXXZZPYYWWXXZZPYYWW$3/g' *.xml



##PARTE 2
##INTERVENCIONES
# 7 intervenciones PRESIDENTe/a: (del congreso) 1
perl -pi -e 's/(<PARRAFO_2>)El señor\s*?(PRESIDENTE):(.*?)(<PARRAFO_2>)/$1XXZZPYYWWXXZZinterventionYYWWXXZZPYYWWXXZZspeakerYYWWXXZZPYYWWXXZZnameYYWWPOSADA MORENOXXZZ\/nameYYWWXXZZPYYWWXXZZpostYYWW$2XXZZ\/postYYWWXXZZPYYWWXXZZ\/speakerYYWWXXZZPYYWWXXZZspeech language="ES"YYWWXXZZPYYWW$3XXZZPYYWWXXZZ\/speechYYWWXXZZPYYWWXXZZ\/interventionYYWWXXZZPYYWW$4/g' *.xml

# 8 intervenciones PRESIDENTe/a: (del congreso) 2
perl -pi -e 's/(<PARRAFO_2>)La señora\s*?(PRESIDENTA):(.*?)(<PARRAFO_2>)/$1XXZZPYYWWXXZZinterventionYYWWXXZZPYYWWXXZZspeakerYYWWXXZZPYYWWXXZZnameYYWWPOSADA MORENOXXZZ\/nameYYWWXXZZPYYWWXXZZpostYYWW$2XXZZ\/postYYWWXXZZPYYWWXXZZ\/speakerYYWWXXZZPYYWWXXZZspeech language="ES"YYWWXXZZPYYWW$3XXZZPYYWWXXZZ\/speechYYWWXXZZPYYWWXXZZ\/interventionYYWWXXZZPYYWW$4/g' *.xml

# 9 intervenciones vicepres 1 (quitado PRESIDENTE)
perl -pi -e 's/(<PARRAFO_2>)El señor\s*?(VICEPRESIDENTE|PRESIDENTE DEL GOBIERNO)\s*?\((\p{Lu}\p{Ll}.+?\p{Ll})\):(.*?)(<PARRAFO_2>)/$1XXZZPYYWWXXZZinterventionYYWWXXZZPYYWWXXZZspeakerYYWWXXZZPYYWWXXZZnameYYWW$3XXZZ\/nameYYWWXXZZPYYWWXXZZpostYYWW$2XXZZ\/postYYWWXXZZPYYWWXXZZ\/speakerYYWWXXZZPYYWWXXZZspeech language="ES"YYWWXXZZPYYWW$4XXZZPYYWWXXZZ\/speechYYWWXXZZPYYWWXXZZ\/interventionYYWWXXZZPYYWW$5/g' *.xml

# 10 intervenciones vicepres 2 (quitada PRESIDENTA)
perl -pi -e 's/(<PARRAFO_2>)La señora\s*?(VICEPRESIDENTA|PRESIDENTA DEL GOBIERNO)\s*?\((\p{Lu}\p{Ll}.+?\p{Ll})\):(.*?)(<PARRAFO_2>)/$1XXZZPYYWWXXZZinterventionYYWWXXZZPYYWWXXZZspeakerYYWWXXZZPYYWWXXZZnameYYWW$3XXZZ\/nameYYWWXXZZPYYWWXXZZpostYYWW$2XXZZ\/postYYWWXXZZPYYWWXXZZ\/speakerYYWWXXZZPYYWWXXZZspeech language="ES"YYWWXXZZPYYWW$4XXZZPYYWWXXZZ\/speechYYWWXXZZPYYWWXXZZ\/interventionYYWWXXZZPYYWW$5/g' *.xml

# 11 intervenciones ministros/as CARGO EN MAYÚSCULS Y ORADOR EN MINÚSCULAS Y PARÉNTESIS 1
perl -pi -e 's/(<PARRAFO_2>)El señor (MINISTR\p{Lu}.*?\p{Lu}\p{Lu})\s*?\((\p{Lu}\p{Ll}.+?\p{Ll})\):(.*?)(<PARRAFO_2>)/$1XXZZPYYWWXXZZinterventionYYWWXXZZPYYWWXXZZspeakerYYWWXXZZPYYWWXXZZnameYYWW$3XXZZ\/nameYYWWXXZZPYYWWXXZZpostYYWW$2XXZZ\/postYYWWXXZZPYYWWXXZZ\/speakerYYWWXXZZPYYWWXXZZspeech language="ES"YYWWXXZZPYYWW$4XXZZPYYWWXXZZ\/speechYYWWXXZZPYYWWXXZZ\/interventionYYWWXXZZPYYWW$5/g' *.xml

# 12 intervenciones ministros/as CARGO EN MAYÚSCULS Y ORADOR EN MINÚSCULAS Y PARÉNTESIS 2
perl -pi -e 's/(<PARRAFO_2>)La señora (MINISTR\p{Lu}.*?\p{Lu}\p{Lu})\s*?\((\p{Lu}\p{Ll}.+?\p{Ll})\):(.*?)(<PARRAFO_2>)/$1XXZZPYYWWXXZZinterventionYYWWXXZZPYYWWXXZZspeakerYYWWXXZZPYYWWXXZZnameYYWW$3XXZZ\/nameYYWWXXZZPYYWWXXZZpostYYWW$2XXZZ\/postYYWWXXZZPYYWWXXZZ\/speakerYYWWXXZZPYYWWXXZZspeech language="ES"YYWWXXZZPYYWW$4XXZZPYYWWXXZZ\/speechYYWWXXZZPYYWWXXZZ\/interventionYYWWXXZZPYYWW$5/g' *.xml

# 13 intervenciones normales, dos apellidos en mayúsc y :  1
perl -pi -e 's/(<PARRAFO_2>)El señor\s*?(\p{Lu}\p{Lu}+?.*?\p{Lu}\p{Lu}):(.*?)(<PARRAFO_2>)/$1XXZZPYYWWXXZZinterventionYYWWXXZZPYYWWXXZZspeakerYYWWXXZZPYYWWXXZZnameYYWW$2XXZZ\/nameYYWWXXZZPYYWWXXZZpostYYWWNAXXZZ\/postYYWWXXZZPYYWWXXZZ\/speakerYYWWXXZZPYYWWXXZZspeech language="ES"YYWWXXZZPYYWW$3XXZZPYYWWXXZZ\/speechYYWWXXZZPYYWWXXZZ\/interventionYYWWXXZZPYYWW$4/g' *.xml

# 14 intervenciones normales, dos apellidos en mayúsc y :  2
perl -pi -e 's/(<PARRAFO_2>)La señora\s*?(\p{Lu}\p{Lu}+?.*?\p{Lu}\p{Lu}):(.*?)(<PARRAFO_2>)/$1XXZZPYYWWXXZZinterventionYYWWXXZZPYYWWXXZZspeakerYYWWXXZZPYYWWXXZZnameYYWW$2XXZZ\/nameYYWWXXZZPYYWWXXZZpostYYWWNAXXZZ\/postYYWWXXZZPYYWWXXZZ\/speakerYYWWXXZZPYYWWXXZZspeech language="ES"YYWWXXZZPYYWW$3XXZZPYYWWXXZZ\/speechYYWWXXZZPYYWWXXZZ\/interventionYYWWXXZZPYYWW$4/g' *.xml

# 15 OMITS
perl -pi -e 's/(\s|\.|,|>|…|!|\?|;|—|-)(\(.*?\))(\s|\.|,|<|…|¡|¿|:|;|—|-)/$1XXZZomitYYWW$2XXZZ\/omitYYWW$3/g' *.xml

# 16 hay veces que no procede omitir algo entre paréntesis, esto se deberá tener en cuenta a la hora de la revisión, algunos ejemplos:
perl -pi -e 's/XXZZomitYYWW(\(Convergència i Unió\))XXZZ\/omitYYWW/$1/g' *.xml

perl -pi -e 's/XXZZomitYYWW(\(Convergència I Unió\))XXZZ\/omitYYWW/$1/g' *.xml

perl -pi -e 's/XXZZomitYYWW(\(CONVERGÈNCIA I UNIÓ\))XXZZ\/omitYYWW/$1/g' *.xml

perl -pi -e 's/XXZZomitYYWW(\(EAJ-PNV\))XXZZ\/omitYYWW/$1/g' *.xml
 
perl -pi -e 's/XXZZomitYYWW(\(PNV\))XXZZ\/omitYYWW/$1/g' *.xml

# 17 números de página
perl -pi -e 's/<NUM_PAGINA_SUMARIO><Link><\/Link>(.*?)<\/NUM_PAGINA_SUMARIO>/XXZZpage_numberYYWWPágina $1XXZZ\/page_numberYYWW/g' *.xml

# 18 etiqueta chair who presi 1
perl -pi -e 's/(XXZZomitYYWW\(El señor presidente|XXZZomitYYWW\(La señora presidenta)(\socupa la Presidencia\)XXZZ\/omitYYWW)/XXZZPYYWWXXZZ\/chairYYWWXXZZPYYWW$1$2XXZZPYYWWXXZZchair who="Posada Moreno, Jesús"YYWWXXZZPYYWW/g' *.xml

# 19 etiqueta chair who presi 2
perl -pi -e 's/(XXZZPYYWWXXZZ\/chairYYWW)(XXZZPYYWWXXZZomitYYWW\(El señor presidente|XXZZPYYWWXXZZomitYYWW\(La señora presidenta)(\socupa la Presidencia\)XXZZ\/omitYYWW)(XXZZPYYWWXXZZchair who="Posada Moreno, Jesús"YYWWXXZZPYYWW)(.*?)(XXZZ\/speechYYWWXXZZPYYWWXXZZ\/interventionYYWW)/$5$6XXZZPYYWW$1XXZZPYYWW$2$3XXZZPYYWW$4/g' *.xml

# 20 etiqueta chair who vicepresi 1
perl -pi -e 's/(XXZZomitYYWW\(El señor vicepresidente,\s|XXZZomitYYWW\(La señora vicepresidenta,\s)(.*?)(,\socupa la Presidencia\)XXZZ\/omitYYWW)/XXZZPYYWWXXZZ\/chairYYWWXXZZPYYWW$1$2$3XXZZPYYWWXXZZchair who="$2"YYWWXXZZPYYWW/g' *.xml

# 21 etiqueta chair who vicepresi 2
perl -pi -e 's/(XXZZPYYWWXXZZ\/chairYYWW)(XXZZPYYWWXXZZomitYYWW\(El señor vicepresidente,\s|XXZZPYYWWXXZZomitYYWW\(La señora vicepresidenta,\s)(.*?)(,\socupa la Presidencia\)XXZZ\/omitYYWW)(XXZZPYYWWXXZZchair who=".+?"YYWWXXZZPYYWW)(.*?)(XXZZ\/speechYYWWXXZZPYYWWXXZZ\/interventionYYWW)/$6$7XXZZPYYWW$1XXZZPYYWW$2$3$4XXZZPYYWW$5/g' *.xml

# 22 etiquetas headings se quedan dentro de speech, arreglar:
perl -pi -e 's/(XXZZheadingYYWW.*?XXZZ\/headingYYWW)(XXZZPYYWWXXZZ\/speechYYWWXXZZPYYWWXXZZ\/interventionYYWW)/$2XXZZPYYWWXXZZPYYWW$1XXZZPYYWWXXZZPYYWW/g' *.xml



##PARTE 3
##CIERRE Y LIMPIEZA

# 23 cierre body back y ecpc_CD al final del documento
perl -pi -e 's/(>)$/$1XXZZPYYWWXXZZ\/speechYYWWXXZZPYYWWXXZZ\/interventionYYWWXXZZPYYWWXXZZPYYWWXXZZPYYWWXXZZ\/chairYYWWXXZZPYYWWXXZZPYYWWXXZZ\/bodyYYWWXXZZPYYWWXXZZPYYWWXXZZbackYYWWXXZZ!-- Edita: Congreso de los Diputados XXZZPYYWWCalle Floridablanca, s\/n\. 28071 Madrid XXZZPYYWWTeléf\.: 91 390 60 00\. Fax: 91 429 87 07\. http:\/\/www\.congreso\.es XXZZPYYWWImprime y distribuye:  Imprenta Nacional BOE XXZZPYYWWAvenida de Manoteras, 54\. 28050 Madrid Teléf.: 902 365 303\. http:\/\/www\.boe\.esXXZZPYYWWDepósito legal: M\. 12\.580 - 1961  --YYWWXXZZ\/backYYWWXXZZPYYWWXXZZ\/ecpc_CDYYWW/g' *.xml

# 24 Eliminar "Página" sobrante
perl -pi -e 's/(>)Página(<)/$1$2/g' *.xml

# 25 párrafos, se transforma <PARRAFO>, <PARRAFO_2>, <PARRAFO_NEGRITA_SUMA>, etc.
perl -pi -e 's/<PARRAFO.*?>/XXZZPYYWW/g' *.xml

# 26 párrafos
perl -pi -e 's/XXZZPYYWW/\n/g' *.xml

# 27 quitar las etiquetas que queden
perl -pi -e 's/<.*?>//g' *.xml

# 28 transformar nuestras etiquetas
perl -pi -e 's/XXZZ/</g' *.xml

perl -pi -e 's/YYWW/>/g' *.xml



##PARTE 4
##PARCHEADO
# 29 detalle headings OK
perl -pi -e 's/<\/heading><heading>/<\/heading>\n\n<heading>/g' *.xml

# 30 quitar espacios sobrantes al principio de línea OK
perl -pi -e 's/^\s(\w)/$1/g' *.xml

perl -pi -e 's/^\s(…\w)/$1/g' *.xml

perl -pi -e 's/^\s(…\s\w)/$1/g' *.xml

# 31 omit en hora de cierre de sesión OK
perl -pi -e 's/(Eran las.*?|Era la.*?)(de la noche\.|de la tarde\.|de la mañana\.|de la madrugada\.|del mediodía\.)/<omit>$1$2<\/omit>/g' *.xml

perl -pi -e 's/<\/speech>\n<\/intervention>\n\n(<omit>(Eran las.*?|Era la.*?)(de la noche\.|de la tarde\.|de la mañana\.|de la madrugada\.|del mediodía\.)<\/omit>\n<\/speech>\n<\/intervention>)/$1/g' *.xml

# 32 añadir etiquetas OK
perl -pi -e 's/(<\/intervention>\n)La señora\s(.*?)(<\/name>\n<post>NA<\/post>)/$1\n<intervention>\n<speaker>\n<name>$2$3/g' *.xml

perl -pi -e 's/(<\/intervention>\n)El señor\s(.*?)(<\/name>\n<post>NA<\/post>)/$1\n<intervention>\n<speaker>\n<name>$2$3/g' *.xml

# 33 añadir etiquetas OK
perl -pi -e 's/(\w\.)\sEl señor\s(\p{Lu}\p{Lu}+?.*?\p{Lu}\p{Lu})(<\/name>)/$1\n<\/speech>\n<\/intervention>\n\n<intervention>\n<speaker>\n<name>$2$3/g' *.xml

perl -pi -e 's/(\w\.)\sLa señora\s(\p{Lu}\p{Lu}+?.*?\p{Lu}\p{Lu})(<\/name>)/$1\n<\/speech>\n<\/intervention>\n\n<intervention>\n<speaker>\n<name>$2$3/g' *.xml

perl -pi -e 's/(\w\.\n)\s*?El señor\s*?(\p{Lu}\p{Lu}+?.*?\p{Lu}\p{Lu}\p{Lu}+?<\/name>\n<post>NA<\/post>\n<\/speaker>\n<speech language="ES">)/$1<\/speech>\n<\/intervention>\n\n<intervention>\n<speaker>\n<name>$2/g' *.xml

perl -pi -e 's/(\w\.\n)\s*?La señora\s*?(\p{Lu}\p{Lu}+?.*?\p{Lu}\p{Lu}\p{Lu}+?<\/name>\n<post>NA<\/post>\n<\/speaker>\n<speech language="ES">)/$1<\/speech>\n<\/intervention>\n\n<intervention>\n<speaker>\n<name>$2/g' *.xml

perl -pi -e 's/(<\/intervention>\n)La señora (\p{Lu}\p{Lu}+?.*?\p{Lu}\p{Lu}\p{Lu}+?.*?)\((.*?)\):\s/$1\n<intervention>\n<speaker>\n<name>$3<\/name>\n<post>$2<\/post>\n<\/speaker>\n<speech language="ES">\n/g' *.xml

perl -pi -e 's/(<\/intervention>\n)El señor (\p{Lu}\p{Lu}+?.*?\p{Lu}\p{Lu}\p{Lu}+?.*?)\((.*?)\):\s/$1\n<intervention>\n<speaker>\n<name>$3<\/name>\n<post>$2<\/post>\n<\/speaker>\n<speech language="ES">\n/g' *.xml



##A PARTIR DE AQUÍ LOS ONE-LINERS EN SCRIPT FALLAN, LA TERMINAL NO LOS PASA
##PASAR POR JEDIT DE UNO EN UNO AL DIRECTORIO EN TODOS LOS DOCS
# 34 texto fuera de intervención NO
perl -pi -e 's/(<\/speech>\n<\/intervention>)\n\n(Efectuada.*?\n)/$2$1\n\n/g' *.xml

# 35 corrección NO
perl -pi -e 's/(IU, ICV-EUiA, CHA)<\/name>\n<post>NA<\/post>\n<\/speaker>\n<speech language="ES">\n/$1: /g' *.xml

# 36 quitar saltos de párrafo sobrantes NO
perl -pi -e 's/(<\/intervention>\n\n)\n\n*?(<intervention>)/$1$2/g' *.xml

perl -pi -e 's/(<\/intervention>\n\n)\n(<intervention>)/$1$2/g' *.xml

# 37 corrección faltan datos NO
perl -pi -e 's/(<\/speech>\n<\/intervention>\n\n*)(El señor)(.*?)(<\/name>)/$1\n<intervention>\n<speaker>\n<name>$3$4/g' *.xml

perl -pi -e 's/(<\/speech>\n<\/intervention>\n\n*)(La señora)(.*?)(<\/name>)/$1\n<intervention>\n<speaker>\n<name>$3$4/g' *.xml

# 38 añadir cierres donde hacen falta NO
perl -pi -e 's/(<\/omit>\s*?\n)(<intervention>\n<speaker>)/$1<\/speech>\n<\/intervention>\n\n$2/g' *.xml

# 39 añadir etiquetas NO
perl -pi -e 's/(\.\s*?\n)(<intervention>\n<speaker>\n<name>)/$1<\/speech>\n<\/intervention>\n\n$2/g' *.xml

# 40 añadir etiquetas NO
perl -pi -e 's/(…\s*?\n|\?\s*?\n)(<intervention>\n<speaker>\n<name>)/$1<\/speech>\n<\/intervention>\n\n$2/g' *.xml

# 41 añadir etiquetas NO
perl -pi -e 's/(<intervention>\n<speaker>\n<name>)(.*?):\s/$1$2<\/name>\n<post>NA<\/post>\n<\/speaker>\n<speech language="ES">\n/g' *.xml

# 42 añadir etiquetas NO
perl -pi -e 's/El señor\s*?(\p{Lu}\p{Lu}+?.*?\p{Lu}\p{Lu}):\s/\n<intervention>\n<speaker>\n<name>$1<\/name>\n<post>NA<\/post>\n<\/speaker>\n<speech language="ES">\n/g' *.xml

perl -pi -e 's/La señora\s*?(\p{Lu}\p{Lu}+?.*?\p{Lu}\p{Lu}):\s/\n<intervention>\n<speaker>\n<name>$1<\/name>\n<post>NA<\/post>\n<\/speaker>\n<speech language="ES">\n/g' *.xml

# 43 añadir etiquetas NO
perl -pi -e 's/\nEl señor\s*?(\p{Lu}\p{Lu}+?.*?\p{Lu}\p{Lu})(<\/name>)/<intervention>\n<speaker>\n<name>$1$2/g' *.xml

perl -pi -e 's/\nLa señora\s*?(\p{Lu}\p{Lu}+?.*?\p{Lu}\p{Lu})(<\/name>)/<intervention>\n<speaker>\n<name>$1$2/g' *.xml

# 44 añadir etiquetas NO
perl -pi -e 's/(<\/omit>)\s(<intervention>)/$1\n<\/speech>\n<\/intervention>\n\n$2/g' *.xml

# 45 corrección vicepresidencia NO
perl -pi -e 's/<name>VICEPRESIDENTA<\/name>\n<post>NA<\/post>/<name>Villalobos Talero<\/name>\n<post>VICEPRESIDENTA<\/post>/g' *.xml

# 46 corrección presidencia NO
perl -pi -e 's/<name>PRESIDENTE<\/name>\n<post>NA<\/post>/<name>POSADA MORENO<\/name>\n<post>PRESIDENTE<\/post>/g' *.xml

# 47 el señor MAYÚSCULAS (Nombre) NO
perl -pi -e 's/(\n)El señor (\p{Lu}.*?\p{Lu}\p{Lu})\s*?<omit>\((\p{Lu}\p{Ll}.+?\p{Ll})\)<\/omit>:\s/$1\n<intervention>\n<speaker>\n<name>$3<\/name>\n<post>$2<\/post>\n<\/speaker>\n<speech language="ES">\n/g' *.xml

perl -pi -e 's/(\n)La señora (\p{Lu}.*?\p{Lu}\p{Lu})\s*?<omit>\((\p{Lu}\p{Ll}.+?\p{Ll})\)<\/omit>:\s/$1\n<intervention>\n<speaker>\n<name>$3<\/name>\n<post>$2<\/post>\n<\/speaker>\n<speech language="ES">\n/g' *.xml

# 48 corregir final de algunos heading NO
perl -pi -e 's/(\w\.)\s(<heading>)/$1\n<\/speech>\n<\/intervention>\n\n$2/g' *.xml

# 49 etiquetas sobrantes NO
perl -pi -e 's/(<heading>\n.*?)<\/name>\n<post>NA<\/post>\n<\/speaker>\n<speech language="ES">\n(.*?\n<\/heading>)/$1 $2/g' *.xml

# 50 name y post fallo: el nombre en paréntesis y el cargo se quedan dentro de name NO
perl -pi -e 's/(<name>)(.*?)\s\((.*?)\)(<\/name>\n)(<post>)(.*?)(<\/post>)/$1$3$4$5$2$7/g' *.xml

perl -pi -e 's/(<name>)(.*?)\((.*?)\)(<\/name>\n)(<post>)(.*?)(<\/post>)/$1$3$4$5$2$7/g' *.xml

# 51 name y post fallo 2: el nombre en paréntesis y el cargo se quedan dentro de post NO
perl -pi -e 's/(<intervention>\n<speaker>\n<name>).*?(<\/name>\n<post>)(.*?)\s\((.*?)\):\s/$1$4$2$3<\/post>\n<\/speaker>\n<speech language="ES">\n/g' *.xml

perl -pi -e 's/(<intervention>\n<speaker>\n<name>).*?(<\/name>\n<post>)(.*?)\s<omit>\((.*?)\)<\/omit>:\s/$1$4$2$3<\/post>\n<\/speaker>\n<speech language="ES">\n/g' *.xml

# 52 arreglar algunas partes de heading que se quedan en medio de intervenciones NO
perl -pi -e 's/(\p{Ll}\p{Ll}+?\.\s*?)\n(\p{Lu}\p{Lu}+.*?\p{Lu}+.*?\s*?)(\n<\/speech>\n<\/intervention>)/$1$3\n\n<heading>\n$2\n<\/heading>\n/g' *.xml

perl -pi -e 's/(\p{Ll}\p{Ll}+?\.\s*?)\n(\p{Lu}\p{Lu}+.*?\p{Lu}+.*?\.\s*?)(\n<\/speech>\n<\/intervention>)/$1$3\n\n<heading>\n$2\n<\/heading>\n/g' *.xml

perl -pi -e 's/(\p{Ll}\p{Ll}+?\.\s*?)\n(— \p{Lu}\p{Lu}+.*?\p{Lu}+.*?\s*?)(\n<\/speech>\n<\/intervention>)/$1$3\n\n<heading>\n$2\n<\/heading>\n/g' *.xml

perl -pi -e 's/(\.\s*?)\n(— \p{Lu}\p{Lu}+.*?\p{Lu}+.*?\s*?)(\n<\/speech>\n<\/intervention>)/$1$3\n\n<heading>\n$2\n<\/heading>\n/g' *.xml

perl -pi -e 's/(\.\s*?)\n(\p{Lu}\p{Lu}+.*?\p{Lu}+.*?\s*?)(\n<\/speech>\n<\/intervention>)/$1$3\n\n<heading>\n$2\n<\/heading>\n/g' *.xml

perl -pi -e 's/(<\/omit>\s*?)\n(\p{Lu}\p{Lu}+.*?\p{Lu}+.*?\.\s*?)(\n<\/speech>\n<\/intervention>)/$1$3\n\n<heading>\n$2\n<\/heading>\n/g' *.xml

perl -pi -e 's/(\w\.\s*?)\n(\p{Lu}\p{Lu}+.*?\p{Lu}+\.\s<omit>\(.*?\)<\/omit>)\s*?(\n<\/speech>\n<\/intervention>)/$1$3\n\n<heading>\n$2\n<\/heading>\n/g' *.xml

perl -pi -e 's/(<\/omit>\s*?)\n(\p{Lu}\p{Lu}+.*?\p{Lu}+\.\s<omit>\(.*?\)<\/omit>)\s*?(\n<\/speech>\n<\/intervention>)/$1$3\n\n<heading>\n$2\n<\/heading>\n/g' *.xml

perl -pi -e 's/(\n\n)(\p{Lu}\p{Lu}+.*?\p{Lu}+.*?:\s*?)(\n<\/speech>\n<\/intervention>)/$1<heading>\n$2\n<\/heading>\n/g' *.xml

perl -pi -e 's/(\n\n)(\p{Lu}\p{Lu}+.*?\p{Lu}+.*?\.\s*?)(\n<\/speech>\n<\/intervention>)/$1<heading>\n$2\n<\/heading>\n/g' *.xml

perl -pi -e 's/(\w\.\s*?\n)(\p{Lu}\p{Lu}+.*?\p{Lu}.*?)<\/name>\n<post>NA<\/post>\n<\/speaker>\n<speech language="ES">/$1<\/speech>\n<\/intervention>\n\n<heading>\n$2\n<\/heading>\n\n/g' *.xml

perl -pi -e 's/(\p{Ll}\.\s*?<omit>.*?<\/omit>)\s(<heading>\n—*\s*?\p{Lu}\p{Lu}+.*?\p{Lu}+.*?\n<\/heading>)/$1\n<\/speech>\n<\/intervention>\n\n$2/g' *.xml

perl -pi -e 's/(\p{Ll}\.\s*?<omit>.*?<\/omit>)\s(\p{Lu}\p{Lu}+.*?\p{Lu}+.*?)\n<\/speech>\n<\/intervention>/$1\n<\/speech>\n<\/intervention>\n\n<heading>\n$2\n<\/heading>\n/g' *.xml

perl -pi -e 's/(\p{Ll}\.\s<omit>.*?<\/omit>)\s(\p{Lu}\p{Lu}+.*?\p{Lu}+.*?)\n<\/speech>\n<\/intervention>/$1\n<\/speech>\n<\/intervention>\n\n<heading>\n$2\n<\/heading>\n/g' *.xml

perl -pi -e 's/(\p{Ll}\.\s<omit>.*?<\/omit>)\s(\p{Lu}\p{Lu}+.*?\p{Lu}+.*?)\n<\/speech>\n<\/intervention>/$1\n<\/speech>\n<\/intervention>\n\n<heading>\n$2\n<\/heading>\n/g' *.xml

perl -pi -e 's/(\.)(<heading>\n\p{Lu}+.*?\p{Lu}\p{Lu}+.*?\n<\/heading>)(\n—.*?\n)(<\/speech>\n<\/intervention>)/$1\n$4\n\n$2\n\n<heading>$3<\/heading>/g' *.xml

# 53 añadir etiquetas NO
perl -pi -e 's/(\w\w\.\s*?)(<intervention>\n<speaker>)/$1\n<\/speech>\n<\/intervention>\n\n$2/g' *.xml

# 54 quitar saltos se párrafo y repeticiones sobrantes NO
perl -pi -e 's/(\n<\/speech>\n<\/intervention>)\n<\/speech>\n<\/intervention>/$1/g' *.xml

perl -pi -e 's/\n(\n<\/speech>\n<\/intervention>)/$1/g' *.xml

# 55 añadir cierres NO
perl -pi -e 's/(\w\.\n)\n(<intervention>\n<speaker>)/$1<\/speech>\n<\/intervention>\n\n$2/g' *.xml



## PARTE 5
## PARCHEADO 2
# añadir algunos núms de pág
perl -pi -e 's/\.\.\.(\d\d+?)(\n)/<page_number>Página $1<\/page_number>$2/g' *.xml

# corregir algunos headings 1
perl -pi -e 's/(<\/omit>\.)(<heading>\n.*?\n<\/heading>)/$1\n<\/speech>\n<\/intervention>\n\n$2/g' *.xml

perl -pi -e 's/(\w\.)(<heading>\n.*?\n<\/heading>)/$1\n<\/speech>\n<\/intervention>\n\n$2/g' *.xml

# corregir algunos headings 2
perl -pi -e 's/(\w\.\n)(— DE LA DIPUTADA.*?)<\/name>\n<post>NA<\/post>\n<\/speaker>\n<speech language="ES">\n(.*?\n)(<\/speech>\n<\/intervention>)/$1$4\n\n<heading>$2$3<\/heading>/g' *.xml

perl -pi -e 's/(\w\.\n)(— DEL DIPUTADO.*?)<\/name>\n<post>NA<\/post>\n<\/speaker>\n<speech language="ES">\n(.*?\n)(<\/speech>\n<\/intervention>)/$1$4\n\n<heading>$2$3<\/heading>/g' *.xml

# corregir algunos headings 3
perl -pi -e 's/(<\/heading>)(\n.*?\n)<\/speech>\n<\/intervention>/$1\n\n<heading>$2<\/heading>/g' *.xml

# corregir minist, etc
perl -pi -e 's/(<name>)(.*?)<omit>\((.*?)\)<\/omit>(<\/name>\n<post>)NA(<\/post>)/#$1$3$4$2$5/g' *.xml












##FALTA COMPLETAR DATOS ORADORES CON SCRIPT QUE DIRIJA A DATOS DIPUTADOS 					OK

##IMPORTANTE: EL NOMBRE DEL/DE LA PRESIDENTE/A del CD SE DEBE CAMBIAR EN CADA SCRIPT PARA CADA LEGISLATURA 	OK
##IMPORTANTE: BEGIN Y END DE CADA LEGISLATURA SE DEBE CAMBIAR EN CADA SCRIPT					OK


##CUIDADO CON LAS MAYÚSCULAS, EN jEdit NO SOLEMOS DIFERENCIAR AL TRABAJAR, PERO PERL LAS TIENE EN CUENTA

##El conjunto de metacaracteres para expresiones regulares es el siguiente:
## \ ^ $ . [ ] { } | ( ) * + ?
#Estos caracteres, en una expresión regular, son interpretados en su significado especial y no como los caracteres que normalmente representan. Una búsqueda que implique alguno de estos caracteres obligará a "escaparlo" de la interpretación mediante \, como se hace para evitar la interpretación por el shell de los metacaracteres del shell. En una expresión regular, el caracter ? representa "un caracter cualquiera"; si escribimos \?, estamos representando el caracter ? tal cual, sin significado adicional.
