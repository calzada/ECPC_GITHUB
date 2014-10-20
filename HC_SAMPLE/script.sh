#!/bin/sh

echo '1º Quitar etiqueta de html \&nbsp;'
# 1º Quitar etiqueta de html \&nbsp;
perl -pi -e 's/\&nbsp;/ /g' *.xml

echo '2º Limpieza inicial para que todos los documentos esten igual'
# 2º Limpieza inicial para que todos los documentos esten igual
perl -pi -e 's/\s+$//g;' *.xml
perl -pi -e 's/\s+</</g;' *.xml
perl -pi -e 's/^\s//g;' *.xml
perl -pi -e 's/<\!-- Mirrored.*?GMT -->//g;' *.xml
perl -pi -e 's/(<P>|<p>)//g;' *.xml
perl -pi -e 's/(<\/P>|<\/p>)//g;' *.xml
perl -pi -e 's/(\n+|\r+)//g;' *.xml
perl -pi -e 's/(<\!--(META NAME|meta name)=\"Colno\")/\n$1/g;' *.xml
perl -pi -e 's/<(html|HTML)>.*?<(a name|A NAME)=\"column_\p{N}+\"><\/(a|A)><(b|B)>\p{N}+\p{Z}+\p{L}+\p{Z}+\p{N}+\p{Z}+:\p{Z}+Column\p{Z}+\p{N}+<\/(b|B)>//g;' *.xml
perl -pi -e 's/<(hr|HR)>(.*?)<\/(body|BODY)>//g;' *.xml
perl -pi -e 's/..DOCTYPE HTML PUBLIC ..\/\/W3C\/\/DTD HTML.*?\/\/EN.>//g' *.xml
perl -pi -e 's/<\/(HTML|html)>(<!--.*?-->)*?<.*?>//g;' *.xml
perl -pi -e 's/<\/HTML><HTML>//g;' *.xml
perl -pi -e 's/<(HEAD|head)><link rel=\"shortcut icon\".*?<\/(TD|td)><\/(TR|tr)><\/(TABLE|table)><(HR|hr)>//g' *.xml

echo '3º Cerrar y abrir nuestros documentos'
# 3º Cerrar y abrir nuestros documentos
perl -pi -e 's/<\/HTML>/XZXZ\/speechYWYWXZXZPYWYWXZXZ\/interventionYWYWXZXZPYWYWXZXZPYWYWXZXZ\/bodyYWYWXZXZPYWYWXZXZPYWYWXZXZ\/ecpc_hcYWYW/g;' *.xml
perl -pi -e 's/<(H2|h2).*?center.*?>.*?House of Commons.*?<\/(H2|h2)>.*?<(H4|h4).*?center.*?>.*?(Monday|Tuesday|Wednesday|Thursday|Friday|Saturday|Sunday)\p{Z}+(\p{N}+)\p{Z}*?(\p{L}+).*?\p{Z}+(\p{N}+).*?<\/(H4|h4)>/XZXZ\?xml version=\"1\.0\" encoding=\"UTF-8\" standalone=\"no\"\?YWYWXZXZPYWYWXZXZ!DOCTYPE ecpc_hc SYSTEM \"hc\.dtd\"YWYWXZXZPYWYWXZXZecpc_hcYWYWXZXZPYWYWXZXZheader filename=\"XY\" language=\"EN\"YWYWXZXZPYWYWXZXZtitleYWYWHouse of Commons Hansard DebatesXZXZ\/titleYWYWXZXZPYWYWXZXZlabelYWYWDebatesXZXZ\/labelYWYWXZXZPYWYWXZXZdateYWYW$4 $5 $7 $8XZXZ\/dateYWYWXZXZPYWYWXZXZplaceYWYWHouse of CommonsXZXZ\/placeYWYWXZXZPYWYWXZXZeditionYWYWHansardXZXZ\/editionYWYWXZXZPYWYWXZXZindexYWYWXZXZPYWYWXZXZindextitleYWYWIndexXZXZ\/indextitleYWYWXZXZPYWYWXZXZ\/indexYWYWXZXZPYWYWXZXZ\/headerYWYWXZXZPYWYWXZXZbodyYWYWXZXZPYWYW/g;' *.xml
perl -pi -e 's/<(H2|h2).*?center.*?>.*?House of Commons.*?<\/(H2|h2)>.*?<(H4|h4).*?center.*?>.*?(Monday|Tuesday|Wednesday|Thursday|Friday|Saturday|Sunday)\p{Z}+(\p{N}+)\p{Z}*?(January|February|March|April|May|June|July|August|September|October|November|December).*?(\p{N}+).*?<\/(H4|h4)>/XZXZ\?xml version=\"1\.0\" encoding=\"UTF-8\" standalone=\"no\"\?YWYWXZXZPYWYWXZXZ!DOCTYPE ecpc_hc SYSTEM \"hc\.dtd\"YWYWXZXZPYWYWXZXZecpc_hcYWYWXZXZPYWYWXZXZheader filename=\"XY\" language=\"EN\"YWYWXZXZPYWYWXZXZtitleYWYWHouse of Commons Hansard DebatesXZXZ\/titleYWYWXZXZPYWYWXZXZlabelYWYWDebatesXZXZ\/labelYWYWXZXZPYWYWXZXZdateYWYW$4 $5 $7 $8XZXZ\/dateYWYWXZXZPYWYWXZXZplaceYWYWHouse of CommonsXZXZ\/placeYWYWXZXZPYWYWXZXZeditionYWYWHansardXZXZ\/editionYWYWXZXZPYWYWXZXZindexYWYWXZXZPYWYWXZXZindextitleYWYWIndexXZXZ\/indextitleYWYWXZXZPYWYWXZXZ\/indexYWYWXZXZPYWYWXZXZ\/headerYWYWXZXZPYWYWXZXZbodyYWYWXZXZPYWYW/g;' *.xml

echo '4º Etiquetar principio (no siempre aparece asi)'
# 4º Etiquetar principio (no siempre aparece asi)
perl -pi -e 's/(<h4|H4)(.*?center.*?>THE.*?PARLIAMENTARY.*?DEBATES.*?OFFICIAL REPORT.*?UNITED.*?KINGDOM.*?OF.*?GREAT.*?BRITAIN.*?AND.*?NORTHERN.*?IRELAND.*?SERIES.*?VOLUME.*?\p{N}+?.*?VOLUME OF.*?SESSION\p{Z}*?\p{N}+?.\p{N}+?.*?)(<\/h4>|<\/H4>)(.*?)(XZXZ.xml version..1\.0..*?YWYWXZXZPYWYWXZXZbodyYWYWXZXZPYWYW)/$5XZXZPYWYWXZXZomit desc=\"title\"YWYW$1$2$3XZXZ\/omitYWYWXZXZPYWYWXZXZ/g' *.xml
perl -pi -e 's/.*?(XZXZ.xml version..1\.0.)/$1/g' *.xml

echo '5º No siempre aparecen'
# 5º No siempren aparecen
perl -pi -e 's/(XZXZomit desc="title"YWYW).*?(THE).*?(PARLIAMENTARY).*?(DEBATES).*?(OFFICIAL).*?(REPORT).*?(IN).*?(THE)/$1$2 $3 $4 $5 $6 $7 $8/g' *.xml
perl -pi -e 's/(SESSION).*?(OF).*?(.*?PARLIAMENT).*?(OF).*?(THE).*?(UNITED.*?KINGDOM.*?OF.*?GREAT.*?BRITAIN.*?AND.*NORTHERN.*?IRELAND).*?\[(WHICH.*?OPENED.*?)\].*?(YEAR.*?OF.*?THE)/$1 $2 $3 $4 $5 $6 ($7) $8/g' *.xml
perl -pi -e 's/(REIGN).*?(OF).*?(HER).*?(MAJESTY).*?(QUEEN).*?(ELIZABETH.*?II).*?(\p{Lu}+.*?SERIES).*?(VOLUME.*?\p{N}+).*?(\p{Lu}.*?VOLUME.*?OF.*?SESSION.*?\p{N}+-\p{N}+)<+?/$1 $2 $3 $4 $5 $6 $7 $8 $9XZXZ\/omitYWYWXZXZPYWYWXZXZ</g' *.xml
perl -pi -e 's/\p{Z}+(H4|h4)>//g' *.xml

echo '6º Etiquetar encuentro de la camara, prayers y chair'
# 6 Etiquetar encuentro de la camara, prayers y chair
perl -pi -e 's/<(H4|h4).*?center.*?(The.*?House.*?met.*?at.*?)<\/(H4|h4)>.*?<(H4|h4|H3|h3).*?center.*?(PRAYERS|Prayers).*?<\/(H4|h4|H3|h3)>.*?<(H4|h4).*?center.*?\[(.*?in.*?the.*?Chair.*?)\].*?<\/(H4|h4)>/XZXZomit desc="starttime"YWYW$2XZXZ\/omitYWYWXZXZPYWYWXZXZomit desc="title"YWYW$5XZXZ\/omitYWYWXZXZPYWYWXZXZomit desc="chair"YWYW$8XZXZ\/omitYWYW/g' *.xml

echo '7º Borrar fechas no deseadas'
# 7º Borrar fechas no deseadas
perl -pi -e 's/<(b|B)>\p{N}+\p{Z}+\p{L}+\p{Z}+\p{N}+\p{Z}+:\p{Z}+\p{L}+\p{Z}+\p{N}+<\/(b|B)>//g;' *.xml

echo '8º Etiquetar ...was asked'
# 8º Etiquetar ...was asked
perl -pi -e 's/<(H4|h4).*?>(.*?was asked.*?)(<.*?>)*?<\/(H4|h4)>/XZXZomit desc="addressee"YZYZ$2XZXZ\/omitYWYW/g' *.xml

echo '9º Etiquetar hora entre omits: <H5>'
# 9º Etiquetar hora entre omits: <H5>
perl -pi -e 's/<(H5|h5).*?>(\p{N}+\.*?\p{N}*?.*?)\p{Z}(am|pm)<\/(H5|h5)>/XZXZomit desc="time"YWYW$2$3XZXZ\/omitYWYW/g;' *.xml

echo '10º Etiquetar headings de diversos tipos'
# 10º Etiquetar headings de diversos tipos
perl -pi -e 's/<(H|h)\p{N}+.*?>(.*?)<\/(H|h)\p{N}+>/XZXZheading number="XY"YWYW$2XZXZ\/headingYWYW/g' *.xml

echo '11º Etiquetar votaciones (en ingles se llaman divisions porque la camara se separa fisicamente en votos a favor y votos en contra. Apertura de la division'
# 11º Etiquetar votaciones (en ingles se llaman divisions porque la camara se separa fisicamente en votos a favor y votos en contra. Apertura de la division
perl -pi -e 's/<!-- division -->/XZXZomit desc="div"YWYW/g;' *.xml

echo '12º Cerrar la division. (ATENCION: aqui el reemplazo se inicia con un espacio en blanco'
# 12º Cerrar la division. (ATENCION: aqui el reemplazo se inicia con un espacio en blanco
perl -pi -e 's/(<i>\p{Z}*?)+?(Question accordingly.*?)(<\!-- end division -->|<\/i><br>)/ $2XZXZ\/omitYWYW/g;' *.xml

echo '13º Etiquetar mas omits'
# 13º Etiquetar mas omits

echo '13.1 Etiquetar numeracion referida a documentos'
# 13.1 Etiquetar numeracion referida a documentos
perl -pi -e 's/\[(P)*?(\p{N}+)\p{P}*?\]/XZXZomit desc="doc"YWYW$1$2XZXZ\/omitYWYW/g;' *.xml
perl -pi -e 's/\((Standing.*?)(\p{N}+)\p{P}*?\)/XZXZomit desc="doc"YWYW$1$2XZXZ\/omitYWYW/g;' *.xml
perl -pi -e 's/\[\p{Z}*?Bill\p{Z}*?(\p{N}+)\p{P}*?\]/XZXZomit desc="doc"YWYWBill $1$2XZXZ\/omitYWYW/g;' *.xml
perl -pi -e 's/\(\p{Z}*?Bill\p{Z}*?(\p{N}+)\p{P}*?\)/XZXZomit desc="doc"YWYWBill $1$2XZXZ\/omitYWYW/g;' *.xml

echo '13.2 Cambiar corchetes por parentesis en titulos'
# 13.2 Cambiar corchetes por parentesis en titulos
perl -pi -e 's/(\p{Z}*?)\[(\p{Z}*?\p{Lu}{3,})+\](\p{Z}*?)/$1($2)$3/g;' *.xml

echo '13.3 Para cambiar corchetes por parentesis después de: that this house do now adjourn'
# 13.3 Para cambiar corchetes por parentesis después de that this house do now adjourn
perl -pi -e 's/now adjourn.*?<i>\p{Z}*?.*?\[(.*?)\](<\/i>)?/now adjourn\. \($1\)/g' *.xml

echo '13.4 Para cambiar corchetes por parentesis en: this day'
# 13.4 Para cambiar corchetes por parentesis en: this day
perl -pi -e 's/\[(\p{Z}*?this day\p{Z}*?\p{P}*?\p{Z}*?)\]/\($1\)/g;' *.xml

echo '13.5 Para etiquetar las reacciones'
# 13.5 Para etiquetar las reacciones
perl -pi -e 's/\[(.*?Interruption.*?|.*?Laughter.*?|.*?Hon.\p{Z}*?Members.*?)\]/XZXZomit desc="reaction"YWYW$1XZXZ\/omitYWYW/g;' *.xml

echo '13.6 Para etiquetar hora dentro de omit desc=div'
# 13.6 Para etiquetar hora dentro de omit desc=div
perl -pi -e 's/\[(\p{N}+.*?\p{N}*?\p{Z}*?)\p{Z}(AM|PM|am|pm)/XZXZomit desc="time"YWYW$1$2XZXZ\/omitYWYW/g' *.xml


