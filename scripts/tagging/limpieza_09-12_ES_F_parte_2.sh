#!/bin/bash

#SCRIPT PARA ETIQUETAR DISCUSOS DEL PE EN EN. EL TRABAJO SE HA BASADO EN DISCURSOS DE 2010

#AUTORA: MARÍA CALZADA

#FECHA: 15 DE SEPTIEMBRE DE 2013

#PARTE 2

#BG|ES|CS|DA|DE|ET|EL|EN|FR|GA|HR|IT|LV|LT|HU|MT|NL|PL|PT|RO|SK|SL|FI|SV
#PPE|S_and_D|ALDE|Verts-ALE|ECR|GUE-NGL|EFD|NI|UNKNOWN|NA

perl -pi -e 's/\n/QWQWÑLÑL/g' *.xml


#Quitar chair

perl -pi -e 's/<\/chair>//g' *.xml

#Borrar código lenguas innecesario al principio de los documentos

perl -pi -e 's/(7th)<omit>">fr - français<\/omit>(<\/legislature>)QWQWÑLÑLhr - hrvatskiQWQWÑLÑLit - italianoQWQWÑLÑLlv - latviešu valodaQWQWÑLÑLlt - lietuvių kalbaQWQWÑLÑLhu - magyarQWQWÑLÑLmt - MaltiQWQWÑLÑLnl - NederlandsQWQWÑLÑLpl - polskiQWQWÑLÑLpt - portuguêsQWQWÑLÑLro - românăQWQWÑLÑLsk - slovenčinaQWQWÑLÑLsl - slovenščinaQWQWÑLÑLfi - suomiQWQWÑLÑLsv - svenskaQWQWÑLÑL Índice QWQWÑLÑLQWQWÑLÑLQWQWÑLÑL/$1$2/g' *.xml

perl -pi -e 's/(<\/legislature>)\s*(.+?)-(.+?)QWQWÑLÑL(<edition>)/$1<title>$2<\/title>QWQWÑLÑL<label>Debates<\/label>QWQWÑLÑL<date>$2<\/date>QWQWÑLÑL<place>$3<\/place>QWQWÑLÑL$4/g' *.xml

#FALTA CIERRE DE SPEAKER

#<post>en nombre del Grupo EFD</post>. – <speech ref="spXY" language="DA">

perl -pi -e 's/(<\/post>)(QWQWÑLÑL)*?\W+?(QWQWÑLÑL)?(<speech)/$1QWQWÑLÑL<\/speaker>QWQWÑLÑL$4/g' *.xml

#SE SOLAPAN WRITINGS Y SPEECHES

#<writing ref="..XY" language="EN">. – <speech ref="spXY" language="NL">

perl -pi -e 's/(<writing ref="..XY" )language="EN">(QWQWÑLÑL)*?\W+?(QWQWÑLÑL)?<speech ref="spXY" (language="\p{Lu}\p{Lu}">)/$1$4/g' *.xml


#<writing ref="spXY" language="EN">.
#–<speech ref="spXY" language="PL">

perl -pi -e 's/(<writing ref="spXY" )language="EN">\W*?QWQWÑLÑL\W*?<speech ref="spXY" (language="\p{Lu}\p{Lu}">)/$1$2/g' *.xml

#SE SOLAPAN WRITINGS Y SPEECHES

#<speech ref="spXY" language="EN">. – <speech ref="spXY" language="EL">

perl -pi -e 's/(<speech ref="spXY" )language="EN">(QWQWÑLÑL)?\W+(QWQWÑLÑL)?<speech ref="spXY" (language="\p{Lu}\p{Lu}">)/$1$4/g' *.xml

#NO APARECE AFILIACIÓN CON EL PRESIDENTE

perl -pi -e 's/<speaker>QWQWÑLÑL<name>El Presidente<\/name>/<speaker>QWQWÑLÑL<name>UNKNOWN<\/name>QWQWÑLÑL<affiliation>QWQWÑLÑL<national_party>UNKNONW<\/national_party>QWQWÑLÑL<ep group="NA"\/>QWQWÑLÑL<\/affiliation>QWQWÑLÑL<post>Presidente<\/post>QWQWÑLÑL<\/speaker>QWQWÑLÑL<speech ref="spXY" language="UNKNOWN">/g' *.xml

perl -pi -e 's/(<speech ref="spXY" language="UNKNOWN">)QWQWÑLÑL<affiliation>QWQWÑLÑL<national_party>UNKNOWN<\/national_party>QWQWÑLÑL<ep group="NA"\/>QWQWÑLÑL<\/affiliation>QWQWÑLÑL<\/speaker>QWQWÑLÑL<speech ref="spXY" language="UNKNOWN">/$1/g' *.xml

#APARECE NAME Y POST SIN AFILIACIÓN

perl -pi -e 's/(<name>\W*?\p{L}+\W+\p{L}+\W*?\p{L}*?\W*?\p{L}*?\W*?\p{L}*?\W*?-*?\W*?\p{L}*?\W*?\p{L}*?\W*?\p{L}*?\W*?\p{L}*?<\/name>)QWQWÑLÑL(<post>)/$1QWQWÑLÑL<affiliation>QWQWÑLÑL<national_party>UNKNONW<\/national_party>QWQWÑLÑL<ep group="NA"\/>QWQWÑLÑL<\/affiliation>QWQWÑLÑL$2/g' *.xml


#APARECEN SPEECH Y COMMON_WRITER

#</speaker>
#<speech ref="spXY" language="EN"></COMMON_writer>
#<writing_COMMON ref="wrXY" language="SV">

#</speaker>
#<speech ref="spXY" language="EN"></COMMON_writer>
#<writing_COMMON ref="wrXY" language="EN">


perl -pi -e 's/<\/speaker>QWQWÑLÑL<speech ref="spXY" language="EN">(<\/COMMON_writer>QWQWÑLÑL<writing_COMMON ref="wrXY" language="\p{Lu}\p{Lu}">)/$1/g' *.xml

#<writing_COMMON ref="wrXY" language="EN"><speech ref="spXY" language="DA">

perl -pi -e 's/(<writing_COMMON ref="wrXY" )language="EN">\W*?(QWQWÑLÑL)*?<speech ref="spXY" (language="\p{Lu}\p{Lu}">)/$1$3/g' *.xml


#POST SIN ETIQUETAR

perl -pi -e 's/(<name>.+?<\/name>)\s*?\,\s*?(\p{L}.+)\./$1QWQWÑLÑL<affiliation>QWQWÑLÑL<national_party>UNKNONW<\/national_party>QWQWÑLÑL<ep group="NA"\/>QWQWÑLÑL<\/affiliation>QWQWÑLÑL<post>$2<\/post>/g' *.xml


perl -pi -e 's/(<\/post>)(QWQWÑLÑL)*?\W+?(QWQWÑLÑL)?(<speech)/$1QWQWÑLÑL<\/speaker>QWQWÑLÑL$4/g' *.xml

#SE SOLPAN OMIT Y POST

#<omit>(
#<post>Para ver los resultados y otros detalles de las votaciones: véase el Acta)</omit></post>
#</speaker>
#<speech ref="spXY" language="EN"></speech>

#Primero quitar esto

#</omit></post>
#</speaker>
#<speech ref="spXY" language="EN"></speech>

perl -pi -e 's/(<\/omit>)<\/post>QWQWÑLÑL<\/speaker>QWQWÑLÑL<speech ref="spXY" language="EN">/$1/g' *.xml

perl -pi -e 's/(<\/omit>)(<\/speech>)/$1QWQWÑLÑL$2/g' *.xml

#<omit>(
#<post>El Parlamento acepta la enmienda oral)</omit>

perl -pi -e 's/(<omit>)\(QWQWÑLÑL<post>/$1/g' *.xml

#FALTA CIERRE DE SPEAKER

perl -pi -e 's/(<\/post>)QWQWÑLÑL(<speech)/$1QWQWÑLÑL<\/speaker>QWQWÑLÑL$2/g' *.xml

#POR SI FALTA CIERRE DE WRITING

perl -pi -e 's/(<\/post>)QWQWÑLÑL(<writing)/$1QWQWÑLÑL<\/writer>QWQWÑLÑL$2/g' *.xml

#POR SI FALTA CIERRE DE COMMON_WRITER

perl -pi -e 's/(<\/post>)QWQWÑLÑL(<writing_COMMON)/$1QWQWÑLÑL<\/COMMON_writer>QWQWÑLÑL$2/g' *.xml


perl -pi -e 's/QWQWÑLÑL/\n/g' *.xml

#RECORDAR PASAR EL DOCUMENTO "LIMPIEZA_3_JEDIT.txt"

