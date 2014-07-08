#!/bin/bash

#SCRIPT PARA ETIQUETAR DISCUSOS DEL PE EN EN. EL TRABAJO SE HA BASADO EN DISCURSOS DE 2010

#AUTORA: MARÍA CALZADA

#FECHA: 15 DE SEPTIEMBRE DE 2013

#PARTE 1

#BG|ES|CS|DA|DE|ET|EL|EN|FR|GA|HR|IT|LV|LT|HU|MT|NL|PL|PT|RO|SK|SL|FI|SV
#PPE|S_and_D|ALDE|Verts-ALE|ECR|GUE-NGL|EFD|NI|UNKNOWN|NA


#Hay que etiquetar: 
	#Etiquetas estructurales
	#(Vice)President, Chair
	#Intervenciones:
		#Speaker, affiliation, post, partidos políticos speech y language (apertura y cierre)
		#Writer, affiliation, post, partidos políticos, writing y language (apertura y cierre)
	#omit
	
	#Como no puede haerse en este orden se seguirá el nombre que permite el HTML: Etiquetas estructurales/ language/ omit/ (Vice)President y cargos vinculados a los partidos/ apertura de writing / apertura y cierre de speech y chair/ post ajenos a partidos / affiliation / affiliation y post que faltan / cierre de name / speaker / speech y writing (sobre todo cuando se fusionan speaker y writing 


	
#Etiquetas estructurales

perl -pi -e 's/(\n|\r)/QWQWÑLÑL/g' *.xml

#INDEX

#Para el primer item

perl -pi -e 's/<td width="16" align="left" valign="top">1\.?\p{Z}(.*?)<\/a><\/td><\/tr>/XXZZindexYYWWQWQWÑLÑLXXZZindextitleYYWWIndexXXZZ\/indextitleYYWWQWQWÑLÑLQWQWÑLÑLXXZZindexitem number="1"YYWW$1XXZZ\/indexitemYYWW/g' *.xml

#Para el resto de items
perl -pi -e 's/<td width="16" align="left" valign="top">\W*?(\p{N}+\.*?\p{N}*?)\.*?(.*?)<\/a><\/td><\/tr>/XXZZindexitem number="$1"YYWW$2XXZZ\/indexitemYYWW/g' *.xml


#<header filename="EN20050110" language="EN">

perl -pi -e 's/TEXT\+CRE\+(\p{N}+?)\+ITEMS\+DOC\+XML\+V0\/\/FR/XXZZ\?xml version="1\.0" encoding="UTF-8" standalone="no"\?YYWWQWQWÑLÑLXXZZ\!DOCTYPE ecpc_EP SYSTEM "ep\.dtd"YYWWQWQWÑLÑLQWQWÑLÑLXXZZecpc_EPYYWWQWQWÑLÑLQWQWÑLÑLXXZZheader filename="EN$1" language="EN"YYWWQWQWÑLÑLQWQWÑLÑLXXZZlegislature begin="20090714" end="201405__"YYWW7thXXZZ\/legislatureYYWW/g' *.xml

perl -pi -e 's/<td colspan="2" align="left" valign="top" style="background-image\:url\(\/img\/struct\/navigation\/gradient_blue\.gif\)" class="title_TA">(Debates)<\/td>//g' *.xml

#<label>Monday 10 January 2005 </label>
#<date>Monday 10 January 2005 </date>
#<place> Strasbourg</place>

perl -pi -e 's/<td class="doc_title" align="left" valign="top" bgcolor="\#F5F5F5">\W*?(\p{L}+\W*?,\W*?\p{N}+\W*?\p{L}+\W*?\p{N}+)\W*?-\W*?(\p{L}+)<\/td>/XXZZtitleYYWW$1XXZZ\/titleYYWWXXZZlabelYYWWDebatesXXZZ\/labelYYWWQWQWÑLÑLXXZZdateYYWW$1XXZZ\/dateYYWWQWQWÑLÑLXXZZplaceYYWW$2XXZZ\/placeYYWW/g' *.xml

#OJ

perl -pi -e 's/<td class="doc_title" align="right" valign="top" bgcolor="\#F5F5F5">(OJ edition)<\/td>/XXZZeditionYYWW$1XXZZ\/editionYYWW/g' *.xml

#Eliminar antes de la primera etiqueta

perl -pi -e 's/<.DOCTYPE html PUBLIC.+?(XXZZ)/$1/g' *.xml

#Cierre de la sesión

perl -pi -e 's/(Last\p{Z}*?updated.\p{Z}*\p{N}+\p{Z}*\p{L}+\p{Z}*\p{N}*).*(Legal\p{Z}notice)/XXZZ\/chairYYWWQWQWÑLÑLQWQWÑLÑLXXZZ\/bodyYYWWQWQWÑLÑLQWQWÑLÑLXXZZbackYYWWQWQWÑLÑLQWQWÑLÑLXXZZupdateYYWW$1XXZZ\/updateYYWWQWQWÑLÑLXXZZdisclaimerYYWW$2XXZZ\/disclaimerYYWWQWQWÑLÑLQWQWÑLÑLXXZZ\/backYWYWQWQWÑLÑLQWQWÑLÑLXXZZ\/ecpc_EPYWYW/g' *.xml

#Borrar html innecesario

perl -pi -e 's/(XXZZ\/legislatureYYWW)"?>?.*(XXZZtitleYYWW)/QWQWÑLÑLQWQWÑLÑL$1QWQWÑLÑLQWQWÑLÑL$2/g' *.xml

#Cerrar index 

perl -pi -e 's/(XXZZheader filename.*XXZZ\/indexitemYYWW)/$1QWQWÑLÑLXXZZ\/indexYYWWQWQWÑLÑLQWQWÑLÑLXXZZ\/headerYYWWQWQWÑLÑLQWQWÑLÑLXXZZbodyYYWW/g' *.xml

#Etiquetar headings

perl -pi -e 's/<img src="\/img\/struct\/functional\/arrow_title_doc\.gif" width="8" height="14" border="0" align="absmiddle" alt="" \/>\p{Z}*?(\p{N}+)(.*?)<\/td>/XXZZheading number="$1"YYWW$2XXZZ\/headingYYWW/g' *.xml

# ______________________________________________________________________________
#LANGUAGE

perl -pi -e 's/<p class="contents">\p{Z}*?<span class="italic">\((\p{Lu}\p{Lu})\)\p{Z}*?<\/span>/XXZZspeech id="spXY" language="$1"YYWW/g' *.xml


#Etiquetar lenguas que quedan

perl -pi -e 's/<span class="italic">\p{Z}*\((\p{Lu}\p{Lu})\)\p{Z}*<\/span>/XXZZspeech id="spXY" language="$1"YYWW/g' *.xml

perl -pi -e 's/\(<span class="italic">\W*?(\p{Lu}\p{Lu})\W*?<\/span>/XXZZspeech id="spXY" language="$1"YYWW/g' *.xml

# ______________________________________________________________________________

#Primeros OMIT

perl -pi -e 's/<span class="italic">\p{Z}*?(\(.+?\))/XXZZomitYYWW$1XXZZ\/omitYYWW/g' *.xml

# ______________________________________________________________________________
#CARGOS: (Vice)President y cargos vinculados a los partidos

#President/Vice-President

perl -pi -e 's/<span class="doc_subtitle_level1_bis">\W*?(President|Vice-President)\.*?\W*?<\/span>(.+?)(<\/td>\W*?<td width="16">\W*<\/td>)/XXZZintervention id="inXY"YYWWQWQWÑLÑLXXZZspeakerYYWWQWQWÑLÑLXXZZnameYYWWUNKNOWNXXZZ\/nameYYWWQWQWÑLÑLXXZZaffiliationYYWWQWQWÑLÑLXXZZnational_partyYYWWUNKNOWNXXZZ\/national_partyYYWWQWQWÑLÑLXXZZep group="UNKNOWN"\/YYWWQWQWÑLÑLXXZZ\/affiliationYYWWQWQWÑLÑLXXZZpostYYWW$1XXZZ\/postYYWWQWQWÑLÑLXXZZ\/speakerYYWWQWQWÑLÑLXXZZspeech id="spXY" language="UNKNOWN"YYWW$2XXZZ\/speechYYWWQWQWÑLÑLXXZZ\/interventionYYWW/g' *.xml


#ON BEHALF

perl -pi -e 's/<span class="italic">(on\W*?behalf\W*?of.*?)<\/span>/XXZZpostYYWW$1XXZZ\/postYYWW/g' *.xml

#Cambiar el partido de S and P

perl -pi -e 's/S\&amp;D/S_and_D/g' *.xml

perl -pi -e 's/Verts.+?ALE/Verts-ALE/g' *.xml

perl -pi -e 's/GUE\/NGL/GUE-NGL/g' *.xml

# ______________________________________________________________________________
#Intervention: writing/speech y chair

#ABRE LOS WRITINGS

perl -pi -e 's/(<span class="doc_subtitle_level1_bis">)(\W*?\p{L}+\W+\p{L}+\W*?\p{L}*?\W*?\p{L}*?\W*?\p{L}*?\W*?-*?\W*?\p{L}*?\W*?\p{L}*?\W*?\p{L}*?\W*?\p{L}*?)\W+\((\p{Lu}+|Verts-ALE|GUE-NGL|S_and_D|UNKNOWN)QWQWÑLÑL\),*?(QWQWÑLÑL)*?\W*?<\/span>\W*?(QWQWÑLÑL)*?,*?\W*?<span class="italic">\W*?in\W*?writing\W*?\.*?\W*?<\/span>/XXZZinterventionYYWWQWQWÑLÑLXXZZwriterYYWWQWQWÑLÑLXXZZnameYYWW$2XXZZ\/nameYYWWQWQWÑLÑLXXZZaffiliationYYWWQWQWÑLÑLXXZZnational_partyYYWWUNKNOWNXXZZ\/national_partyYYWWQWQWÑLÑLXXZZep group="$3"\/YYWWQWQWÑLÑLXXZZ\/affiliationYYWWQWQWÑLÑLXXZZpostYYWWNAXXZZ\/postYYWWQWQWÑLÑL/g' *.xml


#Para etiquetar writings de más de una persona que ya tienen etiquetado speech y la lengua

perl -pi -e 's/<span class="italic">\W*?in writing\.*?\W*?<\/span>(QWQWÑLÑL)*?–*?\W*?XXZZspeech id="spXY" language="(\p{Lu}+)"YYWW(QWQWÑLÑL)*?\)*?\W*?(.+?)<\/td>\W*?<td width="16">\W*?<\/td>/XXZZ\/COMMON_writerYYWWQWQWÑLÑLXXZZCOMMON_writing id="wrXY" language="$2"YYWW$4XXZZ\/COMMON_writingYYWWQWQWÑLÑLXXZZ\/interventionYYWW/g' *.xml

#Para etiquetar writings de más de una persona sin speech ni lengua (la lengua será EN)

perl -pi -e 's/<span class="italic">\W*?in writing\.*?\W*?<\/span>(QWQWÑLÑL)*?–*?\W*?(.+?)<\/td>\W*?<td width="16">\W*?<\/td>/XXZZ\/COMMON_writerYYWWQWQWÑLÑLXXZZCOMMON_writing id="wrXY" language="EN"YYWW$2XXZZ\/COMMON_writingYYWWQWQWÑLÑLXXZZ\/interventionYYWW/g' *.xml

#Quitar QWQWÑLÑL después del partido político con el fin de poder etiquetar el inicio de writing al estar el encabezado todo en un párrafo

perl -pi -e 's/\((PPE|S_and_D|ALDE|Verts-ALE|ECR|GUE-NGL|EFD|NI|UNKNOWN|NA)QWQWÑLÑL\)\s*?(,|\.)*?/\($1\)/g' *.xml

#Quitar QWQWÑLÑL antes de COMMON_writer con el fin de poder etiquetar el inicio de writing al estar el encabezado todo en un párrafo

perl -pi -e 's/QWQWÑLÑL(XXZZ\/COMMON_writerYYWW)/$1/g' *.xml

#Restituir \n (para poder abrir bien los writings a más de una persona)

perl -pi -e 's/QWQWÑLÑL/\n/g' *.xml

#Añadir inicio de writer a más de una persona.

perl -pi -e 's/<span class="doc_subtitle_level1_bis">(.+?)\W+?\((PPE|S_and_D|ALDE|Verts-ALE|ECR|GUE-NGL|EFD|NI|UNKNOWN|NA)\)\W*?,*?\W*?<\/span>\W*?(XXZZ\/COMMON_writerYYWW)/XXZZintervention id="inXY"YYWWQWQWÑLÑLXXZZCOMMON_writerYYWWQWQWÑLÑLXXZZnameYYWW$1XXZZ\/nameYYWWQWQWÑLÑLXXZZaffiliationYYWWQWQWÑLÑLXXZZnational_partyYYWWUNKNOWNXXZZ\/national_partyYYWWQWQWÑLÑLXXZZep group="$2"\/YYWWQWQWÑLÑLXXZZ\/affiliationYYWWQWQWÑLÑLXXZZpostYYWWNAXXZZ\/postYYWWQWQWÑLÑLQWQWÑLÑL$3/g' *.xml


#Cambiar \n por QWQWÑLÑL

perl -pi -e 's/\n/QWQWÑLÑL/g' *.xml


#ABRE Y CIERRA LA INTERVENCIÓN 
perl -pi -e 's/<span class="doc_subtitle_level1_bis">(.*?),?\W*?<\/span>(.*?)<\/td>\W*?<td width="16">\W*?<\/td>/XXZZintervention id="inXY"YYWWQWQWÑLÑLXXZZspeakerYYWWQWQWÑLÑLXXZZnameYYWW$1XXZZ\/nameYYWW$2XXZZ\/speechYYWWQWQWÑLÑLXXZZ\/interventionYYWW/g' *.xml


#Para cerrar writing

perl -pi -e 's/(XXZZwriterYYWW)+?(.+?)(<\/td><td width="16">\W*?<\/td>)/$1$2QWQWÑLÑLXXZZ\/writingYYWWQWQWÑLÑLXXZZ\/interventionYYWW/g' *.xml


#CHAIR

perl -pi -e 's/<p class="contents" align="center"><span class="bold">(IN THE CHAIR:\p{Z}*?.*?)<\/span>.*?<span class="italic">\p{Z}*?(.+?)\p{Z}*?<\/span>.+?(<\/td><\/tr><\/table>)+?/XXZZomitYYWW$1QWQWÑLÑL$2XXZZ\/omitYYWW/g' *.xml
# ______________________________________________________________________________

#Limpieza y post ajenos a los partidos políticos

#Para eliminar etiquetas innecesarias de HTML después de omit
perl -pi -e 's/(XXZZ\/omitYYWW)<\/span>QWQWÑLÑL\W*?<\/p>QWQWÑLÑL\W*?<\/td>\W*<td width="16">\W*<\/td>/$1QWQWÑLÑLQWQWÑLÑL/g' *.xml


#Borrar un punto innecesario

perl -pi -e 's/<span class="italic">\W*?\.\W*?<\/span>//g' *.xml

#Para etiquetar el post

perl -pi -e 's/QWQWÑLÑL<span class="italic">(.+?)\.(<\/span>)?/QWQWÑLÑLXXZZpostYYWW$1XXZZ\/postYYWWQWQWÑLÑL/g' *.xml


perl -pi -e 's/<span class="bold"><span class="italic">(.+?)<\/span>/XZXZomitYWYW$1XZXZ\/omitYWYW/g' *.xml


#Falta saber qué hacemos con extractos de los discursos que están en italics
#<span class="italic">

#perl -pi -e 's/<span class="italic">(.+?)<\/span>/XZXZomit type="italic"YWYW$1XZXZ\/omitYWYW/g' *.xml


#Quitar html

perl -pi -e 's/<.*?>//g' *.xml


#Quitar espacios en blanco al principio de línea

perl -pi -e 's/( )+QWQWÑLÑL/QWQWÑLÑL/g' *.xml

# ______________________________________________________________________________
#Etiquetar partidos políticos

#1


perl -pi -e 's/\((\p{Lu}+)(QWQWÑLÑL)*?\)*?,*?\W*?(XXZZ\/nameYYWW)/$3QWQWÑLÑLXXZZaffiliationYYWWQWQWÑLÑLXXZZnational_partyYYWWUNKNOWNXXZZ\/national_partyYYWWQWQWÑLÑLXXZZep group="$1"\/YYWWQWQWÑLÑLXXZZ\/affiliationYYWWQWQWÑLÑL/g' *.xml


#2

perl -pi -e 's/\((S_and_D|Verts-ALE|GUE-NGL)(QWQWÑLÑL)*?(XXZZ\/nameYYWW)/$3QWQWÑLÑLXXZZaffiliationYYWWQWQWÑLÑLXXZZnational_partyYYWWUNKNOWNXXZZ\/national_partyYYWWQWQWÑLÑLXXZZep group="$1"\/YYWWQWQWÑLÑLXXZZ\/affiliationYYWWQWQWÑLÑL/g' *.xml



#restituir \n

perl -pi -e 's/QWQWÑLÑL/\n/g' *.xml

# ______________________________________________________________________________
 #Limpieza

#Eliminar espacio en blanco antes de intervenciòn


perl -pi -e 's/^( )+\n/\n/g' *.xml

perl -pi -e 's/^( )+(XXZZ)/$2/g' *xml

perl -pi -e 's/^( )*–( )+//g' *.xml

#Cambiar \n

perl -pi -e 's/\n/QWQWÑLÑL/g' *.xml

#Limpiar espacios en blanco, guiones innecesarios y \n innecesarias 

perl -pi -e 's/(QWQWÑLÑL)( )/$1/g' *.xml


perl -pi -e 's/QWQWÑLÑLQWQWÑLÑLQWQWÑLÑL/QWQWÑLÑLQWQWÑLÑL/g' *.xml

perl -pi -e 's/QWQWÑLÑLQWQWÑLÑLQWQWÑLÑL/QWQWÑLÑLQWQWÑLÑL/g' *.xml

perl -pi -e 's/QWQWÑLÑLQWQWÑLÑLQWQWÑLÑL/QWQWÑLÑLQWQWÑLÑL/g' *.xml

#Cambiar XXZZ por < y YYWW por >

perl -pi -e 's/XXZZ/</g' *.xml

perl -pi -e 's/YYWW/>/g' *.xml

perl -pi -e 's/XZXZ/</g' *.xml

perl -pi -e 's/YWYW/>/g' *.xml

perl -pi -e 's/>\W+</></g' *.xml

perl -pi -e 's/(>)( )*?\.( )*?/$1/g' *.xml

perl -pi -e 's/(>)( )+/$1/g' *.xml

perl -pi -e 's/(QWQWÑLÑL)QWQWÑLÑL(<\/speech>)/$1$2/g' *.xml

perl -pi -e 's/(QWQWÑLÑL)QWQWÑLÑL(<\/writing>)/$1$2/g' *.xml

perl -pi -e 's/(QWQWÑLÑL)QWQWÑLÑL(<\/COMMON_writing>)/$1$2/g' *.xml

#Restituir \n

perl -pi -e 's/QWQWÑLÑL/\n/g' *.xml

#Cambiar de sitio texto que no está entre etiquetas (sobre todo después de headings)

perl -pi -e 's/(<\/\p{L}+>)(\p{L}|\p{P})(.+?)(\n|<)/<omit>$2$3<\/omit>$1$4/g' *.xml

#Cambiar \n por QWQWÑLÑL

perl -pi -e 's/\n/QWQWÑLÑL/g' *.xml

#___________________________________________________________________________________

#En intevención: affiliation + post (que faltan)

#1 Añadimos afiliación antes de post

perl -pi -e 's/(<\/name>QWQWÑLÑL)<post>(on behalf of )+?(the )*?(.+?)( Group)*?\.*?<\/post>/$1<affiliation>QWQWÑLÑL<national_party>UNKNOWN<\/national_party>QWQWÑLÑL<ep group="$4"\/>QWQWÑLÑL<\/affiliation>QWQWÑLÑL<post>on behalf of $3$4$5<\/post>/g' *.xml


perl -pi -e s'/(<post>on behalf of the .+? Group)\.\W+<\/post>/$1<\/post>/g' *.xml

perl -pi -e 's/(<ep group=")the\W+(.+?)\W+Group\.\W(")+\/>/$1$2$3\/>/g' *.xml

perl -pi -e 's/(<ep group=")the\W+(.+?)("\/>)/$1$2$3/g' *.xml

#2 Añadimos post detrás de afilación


perl -pi -e 's/(<\/affiliation>)(?!QWQWÑLÑL<post>)/$1QWQWÑLÑL<post>NA<\/post>/g' *.xml


#Quitamos repetición de cierre de name y etiquetado de partidos políticos. HACE FALTA?

perl -pi -e 's/(<\/name>)(<\/name>)/$1/g' *.xml

perl -pi -e 's/(\W+?)\((\p{Lu}+|Verts-ALE|GUE-NGL|S_and_D|UNKNOWN|NA)(QWQWÑLÑL)*?\s*?\)\s*?,( )*?(<\/name>)/$5QWQWÑLÑL<affiliation>QWQWÑLÑL<national_party>UNKNOWN<\/national_party>QWQWÑLÑL<ep group="$2"\/>QWQWÑLÑL<\/affiliation>QWQWÑLÑL<post>NA<\/post>/g' *.xml

perl -pi -e 's/(\W+?)\((\p{Lu}+|Verts-ALE|GUE-NGL|S_and_D|UNKNOWN|NA)(QWQWÑLÑL)*?\)*?,*?QWQWÑLÑL(<speech)/<\/name>QWQWÑLÑL<affiliation>QWQWÑLÑL<national_party>UNKNOWN<\/national_party>QWQWÑLÑL<ep group="$2"\/>QWQWÑLÑL<\/affiliation>QWQWÑLÑL<post>NA<\/post>$4/g' *.xml

# ______________________________________________________________________________

#Limpiar y arreglar cierre de name

perl -pi -e 's/ (<\/name>)/$1/g' *.xml

perl -pi -e 's/\s+<\/name>/$1/g' *.xml

perl -pi -e 's/QWQWÑLÑL(\))/$1/g' *.xml

perl -pi -e 's/QWQWÑLÑL(\.)/$1/g' *.xml

perl -pi -e 's/(<name>\W*?\p{L}+\W+\p{L}+\W*?\p{L}*?\W*?\p{L}*?\W*?\p{L}*?\W*?-*?\W*?\p{L}*?\W*?\p{L}*?\W*?\p{L}*?\W*?\p{L}*?),*?(QWQWÑLÑL)/$1<\/name>QWQWÑLÑL/g' *.xml

#En teoría este no hace falta
perl -pi -e 's/(<\/post>QWQWÑLÑL)<\/name>QWQWÑLÑL/$1/g' *.xml

#Todavía falta añadir algún que otro <affiliation>

perl -pi -e 's/(<\/name>QWQWÑLÑL)(<post>)/$1<affiliation>QWQWÑLÑL<national_party>UNKNOWN<\/national_party>QWQWÑLÑL<ep group="NA"\/>QWQWÑLÑL<\/affiliation>QWQWÑLÑL$2/g' *.xml


#Por seguridad
perl -pi -e 's/(<\/affiliation>)(?!QWQWÑLÑL<post>)/$1QWQWÑLÑL<post>NA<\/post>/g' *.xml


#Todavía sobran \n después del post

perl -pi -e 's/(<\/post>QWQWÑLÑL)QWQWÑLÑL/$1/g' *.xml

# ______________________________________________________________________________

#Cierre de speaker

#Añadir cierre de speaker después de cierre de post

perl -pi -e 's/(<\/post>)\W*?(QWQWÑLÑL)\W*?-*?/$1$2<\/speaker>/g' *.xml

#Quitar la repetición de dos /speaker

perl -pi -e 's/(<\/speaker>)<\/speaker>/$1/g' *.xml

#Cambiar COMMON_writer por WRITER_COMMON para poder hacer los siguientes cambios.

perl -pi -e 's/COMMON_writer/writer_COMMON/g' *.xml

#Añadir speaker antes de name cuando todavía no está todo

perl -pi -e 's/(<intervention id="inXY">QWQWÑLÑL)(?!<writer)/$1<speaker>/g' *.xml

#Quitar la repetición de dos speaker

perl -pi -e 's/(<speaker>)(QWQWÑLÑL)*?<speaker>/$1/g' *.xml

#Volver a cambiar writer_COMMON por COMMON_writer

perl -pi -e 's/writer_COMMON/COMMON_writer/g' *.xml

# ______________________________________________________________________________

#Etiquetar speech y writing

#Primero hemos de introducir de nuevo speakers faltantes y borrar la repetición speaker speaker o speaker writer

perl -pi -e 's/(<\/post>)\W*?(QWQWÑLÑL)-*?/$1$2<\/speaker>/g' *.xml

#Hace falta?
perl -pi -e 's/(<\/speaker>)<\/speaker>/$1/g' *.xml

#Hace falta?
perl -pi -e 's/\s+<\/name>/$1/g' *.xml

#Elminar doble cierre de name

perl -pi -e 's/<\/name>(QWQWÑLÑL)*?<\/name>/<\/name>/g' *.xml

#Poner QWQWÑLÑL detrás de speaker cuando haga falta

perl -pi -e 's/(<\/speaker>)\s*?(<speech)/$1QWQWÑLÑL$2/g' *.xml

#Añadir speech cuando seguimos a un speaker que tiene solo texto detrás

perl -pi -e 's/(<\/speaker>)(?!QWQWÑLÑL)/$1QWQWÑLÑL<speech id="spXY" language="EN">/g' *.xml

#Cambiar speaker speech por writer writing donde haga falta. 

perl -pi -e 's/(<writer>QWQWÑLÑL<name>\W*?\p{L}+\W+\p{L}+\W*?\p{L}*?\W*?\p{L}*?\W*?\p{L}*?\W*?-*?\W*?\p{L}*?\W*?\p{L}*?\W*?\p{L}*?\W*?\p{L}*?<\/name>QWQWÑLÑL<affiliation>QWQWÑLÑL<national_party>UNKNOWN<\/national_party>QWQWÑLÑL<ep group=")(PPE|S_and_D|ALDE|Verts-ALE|ECR|GUE-NGL|EFD|NI|UNKNOWN|NA)("\/>QWQWÑLÑL<\/affiliation>QWQWÑLÑL<post>NA<\/post>QWQWÑLÑL)<\/speaker>QWQWÑLÑL<speech/$1$2$3<\/writer>QWQWÑLÑL<writing/g' *.xml
#estoy aquí
#Si hace falta poner esto
#perl -pi -e 's/(<\/speaker>QWQWÑLÑL)(?!<speech)/$1<\/speech)/g' *.xml

#Cambiar COMMON_writing por writing_COMMON para poder hacer los cambios siguientes

perl -pi -e 's/COMMON_writing/writing_COMMON/g' *.xml

#Quitar si se duplica speech hay que quitarlo.HACE FALTA?
#perl -pi -e 's/<speech>(QWQWÑLÑL)*?\W*?-*?\W*?<(speech|writing)/<$2/g' *.xml


#_______________________________________________________
#últimos flecos. 

#LLegados a este punto se repiten dos veces el cierre de name.

perl -pi -e 's/(<\/name>)<\/name>/$1/g' *.xml

#Asegurarnos de que no hay \n innecesarios entre etiquetas

perl -pi -e 's/(<speaker>|<\/name>|<\/affiliation>|<\/post>)\s*?QWQWÑLÑL\s*?QWWÑLÑL/$1QWQWÑLÑL/g' *.xml

perl -pi -e 's/QWQWÑLÑL(<\/name>)/$1/g' *.xml

#A veces affiliation va antes que el cierre de name

perl -pi -e 's/(<affiliation>)(QWQWÑLÑL)*?(<\/name>)/$3QWQWÑLÑL$1/g' *.xml


#no se ha cerrado bien NAME. HACE FALTA???
#perl -pi -e 's/(<name>\W*?\p{L}+\W+\p{L}+\W*?\p{L}*?\W*?\p{L}*?\W*?\p{L}*?\W*?-*?\W*?\p{L}*?\W*?\p{L}*?\W*?\p{L}*?\W*?\p{L}*?)\W+\((\p{Lu}+|Verts-ALE|GUE-NGL|S_and_D|UNKNOWN)\)QWQWÑLÑL(<post>.+?<\/post>)/$1<\/name>QWQWÑLÑL<affiliation>QWQWÑLÑL<national_party>UNKNOWN<\/national_party>QWQWÑLÑL<ep group="$2"\/>QWQWÑLÑL<\/affiliation>QWQWÑLÑL$3QWQWÑLÑL/g' *.xml


#perl -pi -e 's/(<name>\W*?\p{L}+\W+\p{L}+\W*?\p{L}*?\W*?\p{L}*?\W*?\p{L}*?\W*?-*?\W*?\p{L}*?\W*?\p{L}*?\W*?\p{L}*?\W*?\p{L}*?)\W+\((\p{Lu}+|Verts-ALE|GUE-NGL|S_and_D|UNKNOWN)\)QWQWÑLÑL\W*?(QWQWÑLÑL)*?\W*?(<speech)/$1<\/name>QWQWÑLÑL<affiliation>QWQWÑLÑL<national_party>UNKNOWN<\/national_party>QWQWÑLÑL<ep group="$2"\/>QWQWÑLÑL<\/affiliation>QWQWÑLÑL<post>NA<\/post>QWQWÑLÑL<\/speaker>QWQWÑLÑL$4QWQWÑLÑL/g' *.xml

#perl -pi -e 's/(<name>\W*?\p{L}+\W+\p{L}+\W*?\p{L}*?\W*?\p{L}*?\W*?\p{L}*?\W*?-*?\W*?\p{L}*?\W*?\p{L}*?\W*?\p{L}*?\W*?\p{L}*?)\W+\((\p{Lu}+|Verts-ALE|GUE-NGL|S_and_D|UNKNOWN)\)\.*?\W*?QWQWÑLÑL(<speech)/
#$1<\/name>QWQWÑLÑL<affiliation>QWQWÑLÑL<national_party>UNKNOWN<\/national_party>QWQWÑLÑL<ep group="$2"\/>QWQWÑLÑL<\/affiliation>QWQWÑLÑL<post>NA<\/post>QWQWÑLÑL<\/speaker>QWQWÑLÑL$3QWQWÑLÑL/g' *.xml

#Queda algún post etiquetado como in writing

#perl -pi -e 's/<post>\W*?,*?in writing\W*?<\/post>/<post>NA<\/post>/g' *.xml

#Queda algún in writing

#perl -pi -e 's/(<writer>QWQWÑLÑL)(<name>\W*?\p{L}+\W+\p{L}+\W*?\p{L}*?\W*?\p{L}*?\W*?\p{L}*?\W*?-*?\W*?\p{L}*?\W*?\p{L}*?\W*?\p{L}*?\W*?\p{L}*?)\W+\((\p{Lu}+|Verts-ALE|GUE-NGL|S_and_D|UNKNOWN)\),*?\W*?in writing\.*?QWQWÑLÑL<speech id/$1$2<\/name>QWQWÑLÑL<affiliation>QWQWÑLÑL<national_party>UNKNOWN<\/national_party>QWQWÑLÑL<ep group="$3"\/>QWQWÑLÑL<\/affiliation>QWQWÑLÑL<post>NA<\/post>QWQWÑLÑL<\/writer>QWQWÑLÑL<writing ref/g' *.xml


#Intervention no tiene id

perl -pi -e 's/<intervention>/<intervention id="inXY">/g' *.xml

#Quitar asteriscos innecesarios

perl -pi -e 's/QWQWÑLÑL\*+QWQWÑLÑL//g' *.xml

#Quitar la repetición de dos name

#perl -pi -e 's/(<\/name>)(<\/name>)/$1/g' *.xml

#Arreglar coma a principio de párrafo

perl -pi -e 's/QWQWÑLÑL,(\W)/,$1/g' *.xml

perl -pi -e 's/QWQWÑLÑL\)(\W*?)/\)$1/g' *.xml

perl -pi -e 's/QWQWÑLÑL\](\W*?)/\]$1/g' *.xml

#Quitar dos speech seguidos
perl -pi -e 's/<speech id="spXY" language="EN">\s*?–*?\s*?(<speech id="spXY" language="\p{Lu}\p{Lu}">)/$1/g' *.xml


#_______________________________________________________
#Cambiar id por ref para hacer una primera validación. Cuando ya lo tengamos todo etiquetado no aplicaremos este bloque de cambios. 

#intervention id --> intervention ref

perl -pi -e 's/<intervention id/<intervention ref/g' *.xml

#speech id  --> speech ref

perl -pi -e 's/<speech id/<speech ref/g' *.xml

#writing id --> writing ref

perl -pi -e 's/<writing id/<writing ref/g' *.xml

#writing_COMMON id --> writing_COMMON ref

perl -pi -e 's/<writing_COMMON id/<writing_COMMON ref/g' *.xml

#Cambiar QWQWÑLÑL por \n

perl -pi -e 's/QWQWÑLÑL/\n/g' *.xml

#––––––––––––––––––––––––––––––––––––––––––––––––––––––––
#HAY QUE APLICAR DESPUÉS DE PASARLOS TODOS

perl -pi -e 's/\n/QWQWÑLÑL/g' *.xml

#ETIQUETAR PRIMERO  FUSIÓN SPEECH / WRITING / UNKNONW (VER DOC PROBLEMAS.TXT). PROBABLEMENTE ESTO NO HARÁ FALTA PORQUE EN ESTE SCRIPT YA HE SOLUCIONADO EL PROBLEMA DE UNKNONW

#UNKNOWN ESTÁ MAL ESCRITO

perl -pi -e 's/UNKNOWN/UNKNOWN/g' *.xml


#ALGUNOS WRITING NO ESTÁN BIEN ABIERTOS

perl -pi -e 's/(<\/writer>QWQWÑLÑL<writing )ref=".+?" language="(BG|ES|CS|DA|DE|ET|EL|EN|FR|GA|HR|IT|LV|LT|HU|MT|NL|PL|PT|RO|SK|SL|FI|SV)">\W*?\.*?–\W*?(QWQWÑLÑL)*?\W*?<speech (ref=".+?" language=)"(BG|ES|CS|DA|DE|ET|EL|EN|FR|GA|HR|IT|LV|LT|HU|MT|NL|PL|PT|RO|SK|SL|FI|SV)"(>)/$1$4"$5"$6/g' *.xml

perl -pi -e 's/(<\/speaker>QWQWÑLÑL<speech )ref=".+?" language="(BG|ES|CS|DA|DE|ET|EL|EN|FR|GA|HR|IT|LV|LT|HU|MT|NL|PL|PT|RO|SK|SL|FI|SV)">\W*?\.*?–\W*?(QWQWÑLÑL)*?\W*?<speech (ref=".+?" language=)"(BG|ES|CS|DA|DE|ET|EL|EN|FR|GA|HR|IT|LV|LT|HU|MT|NL|PL|PT|RO|SK|SL|FI|SV)"(>)/$1$4"$5"$6/g' *.xml

#LA REFERENCIA DE LOS WRITINGS NO ESTÁ BIEN

perl -pi -e 's/(writing ref=")sp(XY")/$1wr$2/g' *.xml

#NO ESTÁ BIEN CERRADO AFFILIATION

perl -pi -e 's/(<ep group=")(PPE|S_and_D|ALDE|Verts-ALE|ECR|GUE-NGL|EFD|NI|UNKNOWN|NA)("\/>QWQWÑLÑL)(?!<\/affiliation>)/$1$2$3<\/affiliation>/g' *.xml

perl -pi -e 's/<speaker>QWQWÑLÑL(<name>(.+?)<\/name>QWQWÑLÑL<affiliation>QWQWÑLÑL<national_party>UNKNOWN<\/national_party>QWQWÑLÑL<ep group=)"(PPE|S_and_D|ALDE|Verts-ALE|ECR|GUE-NGL|EFD|NI|UNKNOWN|NA)"(\/>QWQWÑLÑL<\/affiliation>QWQWÑLÑL<post>)(.+?)(<\/post>QWQWÑLÑL)<\/speaker>QWQWÑLÑL<speech ref="spXY" language="(BG|ES|CS|DA|DE|ET|EL|EN|FR|GA|HR|IT|LV|LT|HU|MT|NL|PL|PT|RO|SK|SL|FI|SV)">\W*?<post>in writing<\/post>QWQWÑLÑL<\/speaker>QWQWÑLÑL<speech ref="spXY" language="(BG|ES|CS|DA|DE|ET|EL|EN|FR|GA|HR|IT|LV|LT|HU|MT|NL|PL|PT|RO|SK|SL|FI|SV)">\W*?\((BG|ES|CS|DA|DE|ET|EL|EN|FR|GA|HR|IT|LV|LT|HU|MT|NL|PL|PT|RO|SK|SL|FI|SV)\)/<writer>QWQWÑLÑL$1$2$3$4$5<\/writer>QWQWÑLÑL<writing ref="wrXY" language="$8">/g' *.xml


#REPETICIÓN DE AFILIACIÓN

perl -pi -e 's/(<name>.+?<\/name>QWQWÑLÑL<affiliation>QWQWÑLÑL)<national_party>UNKNOWN<\/national_party>QWQWÑLÑL<ep group="(PPE|S_and_D|ALDE|Verts-ALE|ECR|GUE-NGL|EFD|NI|UNKNOWN|NA)"\/>QWQWÑLÑL<affiliation>QWQWÑLÑL(<national_party>UNKNOWN<\/national_party>QWQWÑLÑL<ep group="(PPE|S_and_D|ALDE|Verts-ALE|ECR|GUE-NGL|EFD|NI|UNKNOWN|NA)"\/>QWQWÑLÑL<\/affiliation>)/$1$2/g' *.xml

#QUITAR GUION ANTES DE SEPARACIÓN DE PÁRRAFO

perl -pi -e 's/–QWQWÑLÑL/QWQWÑLÑL/g' *.xml

#QUITAR PUNTUACIÓN ENTRE ETIQUETAS

perl -pi -e 's/>(\s*?\p{P}+?\s*?)*?</></g' *.xml

#LIMPIEZA DE SÍMBOLOS DE IDIOMAS

#Suprimimos un omit innecesario
perl -pi -e 's/<omit>">fr - français<\/omit>//g' *.xml

#Quitamos ruido al principio del documento
perl -pi -e 's/\n/QWQWÑLÑL/g' *.xml

perl -pi -e 's/(<\/legislature>QWQWÑLÑLQWQWÑLÑL)(\p{L}+,\W+?\p{N}{1,2}\W+?\p{L}+?\W+?\p{N}+)\W+?-\W+?(\p{L}+)QWQWÑLÑL(<edition>)/$1<title>$2 - $3<\/title>QWQWÑLÑL<label>Debates<\/label>QWQWÑLÑL<date>$2<\/date>QWQWÑLÑL<place>$3<\/place>QWQWÑLÑL$4/g' *.xml


#Cambiar QWQWÑLÑL por \n

perl -pi -e 's/QWQWÑLÑL/\n/g' *.xml
