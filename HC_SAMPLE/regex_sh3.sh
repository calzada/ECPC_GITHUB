#!/bin/sh

#ESTA VERSIÓN SE BASA EN regex_sh2.sh, PERO SE SUSTITUYEN LAS BÚSQUEDAS POR LAS EXPLICACIONES <!--.*?--> Y ADEMÁS EMPEZAMOS LIMPIANDO TODOS LOS ESPACIOS EN BLANCO, QUITANDO <!--Mirrored --> E INTENTANDO QUE TODOS LOS DISCURSOS TENGAN EXACTAMENTE LA MISMA ESTRUCTURA (CON \n y TODO).

#EXPLICACIÓN: Los comandos que aparecen a continuación con oneliners de perl. Mediante este .sh se ejecutarán todos de una vez y en este orden.

#EJECUCIÓN: Coloca el script y los archivos que vas a procesar en la misma carpeta y escribe en la terminal "sh regex_sh3.sh". Si añades en líneas aparte más búsquedas y reemplazos o comandos de la terminal se ejecutarán también de una sola tirada. Incluso se podrían pasar otros scripts (como el de añadir los metadatos) aquí mismo.

#WARNINGS: 
#(1) SI EL SCRIPT TARDA MUCHO EN LA FASE DE TRABAJO, CONVIENE SECCIONARLO POR PARTES Y PASAR ESTAS PARTES POR SEPARADO.

#2 RECORDAR XZXZPYWYW: <P> 

# 3. RECORDAR: XZXZ = <; YWYW = > 
#PARTE 1

#PASAR HTML_NUMBERS.SH O PASAR SCRIPT DE MARIMAR Y RECORDAR QUE AL FINAL HAY QUE CAMBIAR SSSQQQ POR SINGLE QUOTES OR &#039;

perl -pi -e 's/&nbsp;/ /g' hc061204.xml
sh html_numbers.sh
#perl entities.pl *.hmtl

#LIMPIEZA INCIAL PARA QUE TODOS LOS DOCUMENTOS ESTÉN IGUAL
perl -pi -e 's/\s+$//g;' hc061204.xml
perl -pi -e 's/\s+</</g;' hc061204.xml
perl -pi -e 's/^\s//g;' hc061204.xml
perl -pi -e 's/<\!-- Mirrored.*?GMT -->//g;' hc061204.xml
perl -pi -e 's/(<P>|<p>)//g;' hc061204.xml
perl -pi -e 's/(<\/P>|<\/p>)//g;' hc061204.xml
perl -pi -e 's/(\n+|\r+)//g;' hc061204.xml
perl -pi -e 's/(<\!--(META NAME|meta name)="Colno")/\n$1/g;' hc061204.xml
perl -pi -e 's/<(html|HTML)>.*?<(a name|A NAME)="column_\p{N}+"><\/(a|A)><(b|B)>\p{N}+\p{Z}+\p{L}+\p{Z}+\p{N}+\p{Z}+:\p{Z}+Column\p{Z}+\p{N}+<\/(b|B)>//g;' hc061204.xml
perl -pi -e 's/<(hr|HR)>(.*?)<\/(body|BODY)>//g;' hc061204.xml
perl -pi -e 's/..DOCTYPE HTML PUBLIC ..\/\/W3C\/\/DTD HTML.*?\/\/EN.>//g' hc061204.xml
perl -pi -e 's/<\/(HTML|html)>(<!--.*?-->)*?<.*?>//g;' hc061204.xml
perl -pi -e 's/<\/HTML><HTML>//g;' hc061204.xml
perl -pi -e 's/<(HEAD|head)><link rel="shortcut icon".*?<\/(TD|td)><\/(TR|tr)><\/(TABLE|table)><(HR|hr)>//g' hc061204.xml
#CON ESTA REGEX SE CONGELA EL SCRIPT perl -pi -e 's/(\n+|\r+)//g;' hc061204.xml

#CERRAR Y ABRIR NUESTROS DOCUMENTOS
perl -pi -e 's/<\/HTML>/XZXZ\/speechYWYWXZXZPYWYWXZXZ\/interventionYWYWXZXZPYWYWXZXZPYWYWXZXZ\/bodyYWYWXZXZPYWYWXZXZPYWYWXZXZ\/ecpc_hcYWYW/g;' hc061204.xml
perl -pi -e 's/<(H2|h2).*?center.*?>.*?House of Commons.*?<\/(H2|h2)>.*?<(H4|h4).*?center.*?>.*?(Monday|Tuesday|Wednesday|Thursday|Friday|Saturday|Sunday)\p{Z}+(\p{N}+)(\&nbsp;)*?\p{Z}*?(\p{L}+.)*?\p{Z}+(\p{N}+).*?<\/(H4|h4)/XZXZ\?xml version="1\.0" encoding="UTF-8" standalone="no"\?YWYWXZXZPYWYWXZXZ!DOCTYPE ecpc_hc SYSTEM "hc\.dtd"YWYWXZXZPYWYWXZXZecpc_hcYWYWXZXZPYWYWXZXZheader filename="XY" language="EN"YWYWXZXZPYWYWXZXZtitleYWYWHouse of Commons Hansard DebatesXZXZ\/titleYWYWXZXZPYWYWXZXZlabelYWYWDebatesXZXZ\/labelYWYWXZXZPYWYWXZXZdateYWYW$4 $5 $7 $8XZXZ\/dateYWYWXZXZPYWYWXZXZplaceYWYWHouse of CommonsXZXZ\/placeYWYWXZXZPYWYWXZXZeditionYWYWHansardXZXZ\/editionYWYWXZXZPYWYWXZXZindexYWYWXZXZPYWYWXZXZindextitleYWYWIndexXZXZ\/indextitleYWYWXZXZPYWYWXZXZ\/indexYWYWXZXZPYWYWXZXZ\/headerYWYWXZXZPYWYWXZXZbodyYWYWXZXZPYWYW/g;' hc061204.xml

#!/bin/sh

#PARTE 2

perl -pi -e 's/<\/HTML>/XZXZ\/speechYWYWXZXZPYWYWXZXZ\/interventionYWYWXZXZPYWYWXZXZPYWYWXZXZ\/bodyYWYWXZXZPYWYWXZXZPYWYWXZXZ\/ecpc_hcYWYW/g;' hc061204.xml
perl -pi -e 's/<(H2|h2).*?center.*?>.*?House of Commons.*?<\/(H2|h2)>.*?<(H4|h4).*?center.*?>.*?(Monday|Tuesday|Wednesday|Thursday|Friday|Saturday|Sunday)\p{Z}+(\p{N}+)(\&nbsp;)*?\p{Z}*?(January|February|March|April|May|June|July|August|September|October|November|December).*?(\p{N}+).*?<\/(H4|h4)/XZXZ\?xml version="1\.0" encoding="UTF-8" standalone="no"\?YWYWXZXZPYWYWXZXZ!DOCTYPE ecpc_hc SYSTEM "hc\.dtd"YWYWXZXZPYWYWXZXZecpc_hcYWYWXZXZPYWYWXZXZheader filename="XY" language="EN"YWYWXZXZPYWYWXZXZtitleYWYWHouse of Commons Hansard DebatesXZXZ\/titleYWYWXZXZPYWYWXZXZlabelYWYWDebatesXZXZ\/labelYWYWXZXZPYWYWXZXZdateYWYW$4 $5 $7 $8XZXZ\/dateYWYWXZXZPYWYWXZXZplaceYWYWHouse of CommonsXZXZ\/placeYWYWXZXZPYWYWXZXZeditionYWYWHansardXZXZ\/editionYWYWXZXZPYWYWXZXZindexYWYWXZXZPYWYWXZXZindextitleYWYWIndexXZXZ\/indextitleYWYWXZXZPYWYWXZXZ\/indexYWYWXZXZPYWYWXZXZ\/headerYWYWXZXZPYWYWXZXZbodyYWYWXZXZPYWYW/g;' hc061204.xml

#ETIQUETAR PRINCIPIO (POR SI ACASO; NO SIEMPRE APARECE) 
perl -pi -e 's/(<h4|H4)(.*?center.*?>THE.*?PARLIAMENTARY.*?DEBATES.*?OFFICIAL REPORT.*?UNITED.*?KINGDOM.*?OF.*?GREAT.*?BRITAIN.*?AND.*?NORTHERN.*?IRELAND.*?SERIES.*?VOLUME.*?\p{N}+?.*?VOLUME OF.*?SESSION\p{Z}*?\p{N}+?.\p{N}+?.*?)(<\/h4>|<\/H4>)(.*?)(XZXZ.xml version..1\.0..*?YWYWXZXZPYWYWXZXZbodyYWYWXZXZPYWYW)/$5XZXZPYWYWXZXZomit desc="title"YWYW$1$2$3XZXZ\/omitYWYWXZXZPYWYWXZXZ/g' hc061204.xml
perl -pi -e 's/.*?(XZXZ.xml version..1\.0.)/$1/g' hc061204.xml






perl -pi -e 's/(XZXZomit desc="title"YWYW).*?(THE).*?(PARLIAMENTARY).*?(DEBATES).*?(OFFICIAL).*?(REPORT).*?(IN).*?(THE)/$1$2 $3 $4 $5 $6 $7 $8/g' hc061204.xml

perl -pi -e 's/(SESSION).*?(OF).*?(.*?PARLIAMENT).*?(OF).*?(THE).*?(UNITED.*?KINGDOM.*?OF.*?GREAT.*?BRITAIN.*?AND.*NORTHERN.*?IRELAND).*?\[(WHICH.*?OPENED.*?)\].*?(YEAR.*?OF.*?THE)/$1 $2 $3 $4 $5 $6 ($7) $8/g' hc061204.xml

perl -pi -e 's/(REIGN).*?(OF).*?(HER).*?(MAJESTY).*?(QUEEN).*?(ELIZABETH.*?II).*?(\p{Lu}+.*?SERIES).*?(VOLUME.*?\p{N}+).*?(\p{Lu}.*?VOLUME.*?OF.*?SESSION.*?\p{N}+-\p{N}+)<+?/$1 $2 $3 $4 $5 $6 $7 $8 $9XZXZ\/omitYWYWXZXZPYWYWXZXZ</g' hc061204.xml


#FALTA PONER, NO SE PARA QUE ESTA
perl -pi -e 's/\p{Z}+(H4|h4)>//g' hc061204.xml

#!/bin/sh

#PARTE 3

#ETIQUETAR ENCUENTRO DE LA CÁMARA, PRAYERS Y CHAIR.
perl -pi -e 's/<(H4|h4).*?center.*?(The.*?House.*?met.*?at.*?)<\/(H4|h4)>.*?<(H4|h4|H3|h3).*?center.*?(PRAYERS|Prayers).*?<\/(H4|h4|H3|h3)>.*?<(H4|h4).*?center.*?\[(.*?in.*?the.*?Chair.*?)\].*?<\/(H4|h4)>/XZXZomit desc="starttime"YWYW$2XZXZ\/omitYWYWXZXZPYWYWXZXZomit desc="title"YWYW$5XZXZ\/omitYWYWXZXZPYWYWXZXZomit desc="chair"YWYW$8XZXZ\/omitYWYW/g' hc061204.xml

#BORRAR FECHAS NO DESEADAS
perl -pi -e 's/<(b|B)>\p{N}+\p{Z}+\p{L}+\p{Z}+\p{N}+\p{Z}+:\p{Z}+\p{L}+\p{Z}+\p{N}+<\/(b|B)>//g;' hc061204.xml


#ETIQUETAR "... WAS ASKED"
perl -pi -e 's/<(H4|h4).*?>(.*?was asked.*?)(<.*?>)*?<\/(H4|h4)>/XZXZomit desc="addressee"YZYZ$2XZXZ\/omitYWYW/g' hc061204.xml



#ETIQUETAR HORA ENTRE OMITS: <H5>
perl -pi -e 's/<(H5|h5).*?>(\p{N}+\.*?\p{N}*?.*?)(am|pm)<\/(H5|h5)>/XZXZomit desc="time"YWYW$2$3XZXZ\/omitYWYW/g;' hc061204.xml

	
#ETIQUETAR HEADINGS DE DIVERSOS TIPOS
perl -pi -e 's/<(H|h)\p{N}+.*?>(.*?)<\/(H|h)\p{N}+>/XZXZheading number="XY"YWYW$2XZXZ\/headingYWYW/g' hc061204.xml




#ETIQUETAR VOTACIONES (QUE EN INGLÉS SE LLAMAN DIVISIONS PORQUE LA CÁMARA SE SEPARA FÍSICAMENTE EN VOTOS A FAVOR Y VOTOS EN CONTRA. APERTURA DE LA DIVISIÓN
perl -pi -e 's/<!-- division -->/XZXZomit desc="div"YWYW/g;' hc061204.xml


#CIERRE DE LA DIVISION. ATENCIÓN. AQUÍ EL REEMPLAZO SE INICIA CON UN ESPACIO EN BLANCO
perl -pi -e 's/(<i>\p{Z}*?)*?(Question accordingly.*?)(<\!-- end division -->|<\/i><br>)/ $2XZXZ\/omitYWYW/g;' hc061204.xml





#ETIQUETAR MÁS OMITS

#PARA ETIQUETAR NUMERACIÓN REFERIDA A DOCUMENTOS
perl -pi -e 's/\[(P)*?(\p{N}+)\p{P}*?\]/XZXZomit desc="doc"YWYW$1$2XZXZ\/omitYWYW/g;' hc061204.xml
perl -pi -e 's/\[\p{Z}*?Bill\p{Z}*?(\p{N}+)\p{P}*?\]/XZXZomit desc="doc"YWYWBill $1$2XZXZ\/omitYWYW/g;' hc061204.xml

#PARA CAMBIAR CORCHETES POR PARÉNTESIS EN TÍTULOS..
perl -pi -e 's/(\p{Z}*?)\[(\p{Z}*?\p{Lu}{3,})+\](\p{Z}*?)/$1($2)$3/g;' hc061204.xml




#PARA CAMBIAR CORCHETES POR PARÉNTESIS DESPUÉS DE "THAT THIS HOUSE DO NOW ADJOURN
perl -pi -e 's/now adjourn.*?<i>\p{Z}*?.*?\[(.*?)\](<\/i>)?/now adjourn\. \($1\)/g' hc061204.xml



AQUIIIIIIIIIIII

#PARA CAMBIAR CORCHETES POR PARÉNTESIS EN THIS DAY.
perl -pi -e 's/\[(\p{Z}*?this day\p{Z}*?\p{P}*?\p{Z}*?)\]/\($1\)/g;' hc061204.xml

#PARA ETIQUETAR LAS REACCIONES QUE HE IDENTIFICADO DE MOMENTO
perl -pi -e 's/\[(.*?Interruption.*?|.*?Laughter.*?|.*?Hon.\p{Z}*?Members.*?)\]/XZXZomit desc="reaction"YWYW$1XZXZ\/omitYWYW/g;' hc061204.xml

#PARA ETIQUETAR HORA DENTRO DE OMIT DESC="DIV"
perl -pi -e 's/\[(\p{N}+.*?\p{N}*?\p{Z}*?)(AM|PM|am|pm)/XZXZomit desc="time"YWYW$1$2XZXZ\/omitYWYW/g' hc061204.xml



#PARA ETIQUETAR RESTO DE OMITS. HAY QUE COMMPROBAR ESTOS DOS REEMPLAZOS CUANDO YA ESTÉ TODO POR SI NO HA FUNCIONADO. LOS OMITS PIENSO QUE ESTARÁN BIEN PERO LA CLASE DE OMITS ES DUDOSA.

perl -pi -e 's/\[\p{Z}*?(<i>)*?\p{Z}*?(Mr\.*?|Mrs\.*?|Ms|Dr\.*?|Sir|Rev.*?|.on\.*?\p{Z}*?\.ember|Lady|Lord)*?(\p{Z}*?\p{L}+?\p{Z}*?\p{L}*?\.*?\p{Z}+?\p{L}+?)(-\p{L}+?)*?(\p{Z}*?\.*?)(\p{Z}*?<\/i>\p{Z}*?)*?(\.*?)\p{Z}*?\]/XZXZomit desc="refname"YWYW\$1$2$3$4$5$6$7XZXZ\/omitYWYW/g' hc061204.xml

perl -pi -e 's/\[(.*?)\]/XZXZomit desc="refdoc"YWYW$1XZXZ\/omitYWYW/g' hc061204.xml

#PARA ETIQUETAR ROSE DENTRO DE OMIT. NO SÉ SI SERÁ MEJOR ETIQUETAR EL FINAL DEL TODO CUANDO NO HAYA HTML. PERO DE MOMENTO FUNCIONA ASÍ AUNQUE PUEDE HABER EXCEPCIONES
perl -pi -e 's/<i>(\p{Z}+rose.*?XZXZ)/IITT$1/g;' hc061204.xml
perl -pi -e 's/<i>(\p{Z}*?rose.*?)(<\/i>)+?/XZXZomit desc="reaction"YWYW$1XZXZ\/omitYWYW/g;' hc061204.xml
perl -pi -e 's/IITT/<i>/g;' hc061204.xml
perl -pi -e 's/(-->)(<i>)*?\p{Z}*?(rose—)/$1XZXZomit desc="reaction"YWYW$3XZXZ\/omitYWYW/g' hc061204.xml
perl -pi -e 's/(YWYW)\p{Z}+?(rose—)/$1$2/g' hc061204.xml

#QUITAR NÚMEROS QUE ANTECEDEN A LAS PREGUNTAS ESCRITAS. ATENCIÓN POR SI HUBIERA UN Q.1 (QUE NO HE QUITADO)

perl -pi -e 's/(<b>)\p{Z}*?\p{N}+\./$1/g' hc061204.xml
perl -pi -e 's/(CONTENT="\p{N}+"-->\p{Z}*?)T\.*?\p{N}+\./$1/g' hc061204.xml
perl -pi -e 's/(<!--\p{Z}*?)\p{N}+/$1/g' hc061204.xml
perl -pi -e 's/(XZXZ\/headingYWYW\p{Z}*?)\p{N}+\./$1/g' hc061204.xml
perl -pi -e 's/(<\/a>)\p{Z}*?\p{N}+\./$1/g' hc061204.xml

#EMPEZAMOS CON LAS INTERVENCIONES

# WQN WITH DETAILS (es decir aquellas intervenciones por escrito en las que se ponen todos los datos de los oradores)

perl -pi -e 's/<!--META NAME="Colno" CONTENT="\p{N}+"-->\p{Z}*?<A NAME="\p{N}+-\p{N}+_wqn\p{N}+">\p{Z}*?<\/A>\p{Z}*?<B>\p{Z}*?(\p{L}.*?\p{L})\p{Z}*?(\(.*?\))*?\p{Z}*?(:)*?\p{Z}*?<\/B>\p{Z}*?<!--(.*?)-->\p{Z}*?(\(.*?\))*?(:)*?\p{Z}*?(\p{L}|<)/XZXZintervention id="inXYXY"YWYWXZXZPYWYWXZXZwriterYWYWXZXZPYWYWXZXZnameYWYW$4XZXZ\/nameYWYWXZXZPYWYWXZXZ\/writerYWYWXZXZPYWYWXZXZwriting id="XYXY" language="EN"YWYW$7/g' hc061204.xml

#WQN WITHOUT DETAILS
perl -pi -e 's/<!--META NAME="Colno" CONTENT="\p{N}+"-->\p{Z}*?<A NAME="\p{N}+-\p{N}+_wqn\p{N}+">\p{Z}*?<\/A>\p{Z}*?<B>\p{Z}*?(\p{L}.*?\p{L})\p{Z}*?(\(.*?\))*?\p{Z}*?(:)*?\p{Z}*?<\/B>\p{Z}*?<!--(.*?)-->\p{Z}*?(\(.*?\))*?(:)*?\p{Z}*?(\p{L}|<|\p{P}\p{L})/XZXZintervention id="inXYXY"YWYWXZXZPYWYWXZXZwriterYWYWXZXZPYWYWXZXZnameYWYW$4XZXZ\/nameYWYWXZXZPYWYWXZXZ\/writerYWYWXZXZPYWYWXZXZwriting id="XYXY" language="EN"YWYW$7/g' hc061204.xml

# SPMIN
perl -pi -e 's/<!--META NAME="Colno" CONTENT="\p{N}+"-->\p{Z}*?<A NAME="\p{N}+-\p{N}+_spmin\p{N}+">\p{Z}*?<\/A>\p{Z}*?<B>\p{Z}*?(\p{L}.*?\p{L})\p{Z}*?(\(.*?\))*?\p{Z}*?(:)*?\p{Z}*?<\/B>\p{Z}*?<!--(.*?)-->\p{Z}*?(:)*?\p{Z}*?(\p{L}|<|\p{P}\p{L})/XZXZintervention id="inXYXY"YWYWXZXZPYWYWXZXZspeakerYWYWXZXZPYWYWXZXZnameYWYW$4XZXZ\/nameYWYWXZXZPYWYWXZXZpostYWYW$1XZXZ\/postYWYWXZXZPYWYWXZXZ\/speakerYWYWXZXZPYWYWXZXZspeech id="XYXY" language="EN"YWYW$6/g' hc061204.xml

#PARA LIMPIAR NOMBRES ENTRE PARÉNTESIS DE SPMIN
#perl -pi -e 's/XZXZnameYWYW\((.*?)\)XZXZ\/nameYWYW/XZXZnameYWYW$1XZXZ\/nameYWYW/g' hc061204.xml

#PARA ETIQUETAR MR. SPEAKER Y MR. DEPUTY SPEAKER. NO FUNCIONA

perl -pi -e 's/<!--META NAME="Colno" CONTENT="\p{N}+"-->

\p{Z}*?<A NAME="\p{N}+-\p{N}+_spnew\p{N}+">\p{Z}*?<\/A>\p{Z}*?<B> \p{Z}*?(Mr\. Speaker|Mr\. Deputy Speaker|Madam Speaker|Madam Deputy Speaker)(:)*? \p{Z}*?<\/B>\p{Z}*? <!--(Mr\. Speaker|Mr\. Deputy Speaker|Madam Speaker|Madam Deputy Speaker)-->\p{Z}*?(:)*?(\p{L}|<|\p{P}|\p{M}|\p{Z})/XZXZintervention id="inXYXY"YWYWXZXZPYWYWXZXZspeakerYWYWXZXZPYWYWXZXZnameYWYWXZXZ\/nameYWYWXZXZPYWYWXZXZpostYWYW$3XZXZ\/postYWYWXZXZPYWYWXZXZ\/speakerYWYWXZXZPYWYWXZXZspeech id="XYXY" language="EN"YWYW$5/g' hc061204.xml

#PARA ANALIZAR:
<!--META NAME="Colno" CONTENT="15"--><A NAME="40105-04_spnew6"></A><B> Mr. Speaker:</B><!--Mr. Speaker--> 
<!--meta name="Colno" CONTENT="35"--><a name="90112-0006.htm_spnew1"></a><a name="0901122000519"></a><b>Mr. Speaker:</b><!--Mr. Speaker--> 

<!--meta name="Colno" CONTENT="184"--><a name="50111-12_spmin1"></a><b>Mr. Deputy Speaker:</b><!--Mr. Deputy Speaker--> 
<!--META NAME="Colno" CONTENT="48"--><A NAME="40105-14_spmin0"></A><B>Mr. Deputy Speaker  (Sir Michael Lord):</B><!--Sir Michael Lord-->
<!--meta name="Colno" CONTENT="183"--><a name="50111-12_spmin0"></a><b>Mr. Deputy Speaker  (Mr. Deputy Speaker Sir Alan Haselhurst):</b><!--Mr. Deputy Speaker Sir Alan Haselhurst--> 
<!--meta name="Colno" CONTENT="71"--><a name="90112-0011.htm_spnew0"></a><a name="09011218000091"></a><b>Mr. Deputy Speaker (Sir Alan Haselhurst):</b><!--Mr. Deputy Speaker--> 
<!--meta name="Colno" CONTENT="239"--><a name="80108-0016.htm_spnew23"></a><a name="08010898002468"></a><b>Mr. Deputy Speaker (Sir Michael Lord):</b><!--Mr. Deputy Speaker--> 
<!--meta name="Colno" CONTENT="244"--><a name="80108-0017.htm_spnew5"></a><a name="08010898002477"></a><b>Mr. Deputy Speaker:</b><!--Mr. Deputy Speaker--> 

<!--meta name="Colno" CONTENT="222"-->Mr. Deputy Speaker<i> forthwith declared the main Question, as amended, to be agreed to.</i><a name="stpa_o242"></a><a name="80108-0014.htm_para1"></a><a name="08010898001124"></a>
<!--meta name="Colno" CONTENT="222"--><i> Resolved,</i><a name="80108-0014.htm_brev0"></a><a name="08010898001286"></a><ul><p class="tabletext">That this House applauds the Government for taking decisive action to correct the flaws of rail privatisation; welcomes the fact that the railway is carrying 40 per cent. more passengers and 47 per cent. more freight than in 1997 with improving punctuality and safety standards and record investment in infrastructure; and looks forward to seeing the results of the investigation by the Office of Rail Regulation into Network Rail’s performance, following the unacceptable engineering overruns experienced by passengers during Christmas and the New Year.</ul><br><meta name="Date" content="8 Jan 2008"><notus-date day="8" month="1" year="2008" textMonth="Jan"></notus-date><a name="column_223"></a><br><a name="80108-0014.htm_subhd0"></a><a name="sbhd_1"></a><a name="08010898000001">XZXZheading number="XY"YWYWHigher EducationXZXZ/headingYWYW</a><a name="st_o256"></a><a name="08010898001125"></a>
<!--meta name="Colno" CONTENT="223"--><a name="80108-0014.htm_spnew0"></a><a name="08010898002406"></a><b>Mr. Deputy Speaker (Sir Alan Haselhurst):</b><!--Mr. Deputy Speaker--> We now come to the debate on higher education and adult learners. I have to announce that Mr. Speaker has selected the amendment in the name of the Prime Minister. I remind the House that there will be a 10-minute limit on Back-Bench contributions to the debate.<a name="ordayhd_13"></a><a name="80108-0014.htm_ordayhd0"></a><a name="08010898001313"></a>XZXZomit desc="time"YWYW7.24 pmXZXZ/omitYWYW<a name="st_o257"></a><a name="08010898001126"></a>


# PARA ETIQUETAR HONORABLE MEMBERS
perl -pi -e 's/<!--META NAME="Colno" CONTENT="\p{N}+"-->\p{Z}*?<A NAME="\p{N}+-\p{N}+_spnew\p{N}+">\p{Z}*?<\/A>\p{Z}*?<B>\p{Z}*?(\p{L}.*?on\.*?\p{Z}*?Members)\p{Z}*?(:)*?\p{Z}*?<\/B>\p{Z}*?<!--.*?-->\p{Z}*?(:)*?\p{Z}*?(\p{P}\p{L}|<|\p{L})/XZXZintervention id="inXYXY"YWYWXZXZPYWYWXZXZspeakerYWYWXZXZPYWYWXZXZnameYWYW$1XZXZ\/nameYWYWXZXZPYWYWXZXZ\/speakerYWYWXZXZPYWYWXZXZspeech id="XYXY" language="EN"YWYW$3/g' hc061204.xml

#SPNEW WITH DETAILS
perl -pi -e 's/<!--META NAME="Colno" CONTENT="\p{N}+"-->\p{Z}*?<A NAME="\p{N}+-\p{N}+_spnew\p{N}+">\p{Z}*?<\/A>\p{Z}*?<B>\p{Z}*?(\p{L}.*?\p{L})\p{Z}*?(\(.*?\))*?\p{Z}*?(:)*?\p{Z}*?<\/B>\p{Z}*?<!--(.*?)-->\p{Z}*?(\(.*?\))*?\p{Z}*?(:)*?\p{Z}*?(\p{L}|<)/XZXZintervention id="inXYXY"YWYWXZXZPYWYWXZXZspeakerYWYWXZXZPYWYWXZXZnameYWYW$4XZXZ\/nameYWYWXZXZPYWYWXZXZ\/speakerYWYWXZXZPYWYWXZXZspeech id="XYXY" language="EN"YWYW$7/g' hc061204.xml

#SPNEW WITHOUT DETAILS
perl -pi -e 's/<!--META NAME="Colno" CONTENT="\p{N}+"-->\p{Z}*?<A NAME="\p{N}+-\p{N}+_spnew\p{N}+">\p{Z}*?<\/A>\p{Z}*?<B>\p{Z}*?(\p{L}.*?\p{L})\p{Z}*?(:)*?\p{Z}*?<\/B>\p{Z}*?<!--(.*?)-->\p{Z}*?(:)*?\p{Z}*?(\p{L}|<|&#\p{N}+)/XZXZintervention id="inXYXY"YWYWXZXZPYWYWXZXZspeakerYWYWXZXZPYWYWXZXZnameYWYW$3XZXZ\/nameYWYWXZXZPYWYWXZXZ\/speakerYWYWXZXZPYWYWXZXZspeech id="XYXY" language="EN"YWYW$5/g' hc061204.xml

#ULTIMOS FLECOS

#PARA BORRAR DIVISION NO. 21 9: 29 PM. 
perl -pi -e 's/(Division No\.\p{Z}+?\p{N}+?XZXZPYWYW\p{N}+?:\p{N}+?\p{Z}+?)(am|pm)//g' hc061204.xml

#PARA ELMINAR LOS NÚMEROS (3.) ANTES DEL HEADING AL PRINCIPIO DE LÍNEA
perl -pi -e 's/(XZXZheading number=")XY(" type="sbhd\p{N}+"YWYW.*?XZXZ\/headingYWYWXZXZPYWYW)(\p{N}+)\.\p{Z}+(XZXZ)/$1$3$2$4/g' hc061204.xml

#PARA PONER HEADINGS EN LÍNEA APARTE
#perl -pi -e 's/(XZXZheading)/XZXZPYWYWXZXZPYWYW$1/g' hc061204.xml

#PARA ASEGURARNOS QUE NO HAY MÁS DE DOS \N DELANTE DE LOS HEADINGS
#perl -pi -e 's/XZXZPYWYWXZXZPYWYW(XZXZPYWYW)+(XZXZheading)/XZXZPYWYWXZXZPYWYW$2/g' hc061204.xml

#PARA CERRAR SPEECH AND INTERVENTION (AQUÍ CERRAREMOS TODOS LOS SPEECH E INTERVENTIONS Y PARA QUITAR UN INDESEADO /SPEECH / INTERVENTION INICIAL, PRIMERO NUMERAREMOS LAS INTERVENTIONS Y LUEGO QUITAREMOS EL /SPEECH /INTERVENTION QUE APARECE DELANTE DE INTERVENTION="1"

#ME HE QUEDADO POR AQUÍ. AHORA HE DE HACER UN ESTUDIO DE LAS PARTES DE LOS DISCURSOS Y LUEGO PODRÉ ETIQUETAR CON MÁS FACILIDAD LOS CASOS PROBLEMÁTICOS DE DISCURSOS QUE EMPIEZAN CON RESPUESTAS A PRETUNTAS O QUE EMPIEZAN CON PRIVATE BUSINESS O EN LOS QUE SE VOTA ETC.

#MODIFICAR PRIMERA INTERVENCIÓN
#ETIQUETAR LA PRIMERA INTERVENCIÓN CON PRUEBA (PUEDE HABER DOS CASOS)
perl -pi -e 's/(XZXZomitYWYWMr\. Speaker in the ChairXZXZ\/omitYWYWXZXZheading .*?XZXZPYWYW)XZXZintervention/$1XZXZPYWYWXZXZXZXZPRUEBA/g' hc061204.xml
perl -pi -e 's/(XZXZomitYWYWMr\. Speaker in the ChairXZXZ\/omitYWYWXZXZomit .*?XZXZPYWYW)XZXZintervention/$1XZXZPYWYWXZXZPRUEBA/g' hc061204.xml

#ETIQUETAR LA PRIMERA INTERVENCIÓN CON PRUEBA (EN UN CASO EXTRAÑO EN EL QUE NO SE ETIQUETA LA PRIMERA INTERVENCIÓN)
perl -pi -e 's/(XZXZomitYWYWMr\. Speaker in the ChairXZXZ\/omitYWYWXZXZomit.*?XZXZPYWYW)<A NAME = "\p{N}+-\p{N}+_para\p{N}+"><\/a><\!--META NAME="Speaker".*?-->/$1XZXZPYWYWXZXZPRUEBA id="inXYXY"YWYWXZXZPYWYWXZXZspeakerYWYWXZXZPYWYWXZXZnameYWYWXZXZ\/nameYWYWXZXZPYWYWXZXZpostYWYWMr\. SpeakerXZXZ\/postYWYWXZXZPYWYWXZXZ\/speakerYWYWXZXZPYWYWXZXZspeech id="XYXY" language="EN"YWYW/g' hc061204.xml

#VOLVER A AÑADIR UN CIERRE DE OMIT QUE FALTA
perl -pi -e 's/(XZXZomitYWYW.*?)\p{Z}+?(XZXZomitYWYW)/$1XZXZ\/omitYWYW$2/g' hc061204.xml

# ETIQUETAR UN CASO DE PRIMERA INTERVENCIÓN DE SPEAKER
#PARA ELLO QUITAR TODOS LOS PÁRRAFOS 0 QUE ANTES ESTÉN ETIQUETADOS CON INTERVENCIÓN

perl -pi -e 's/(language="EN"YWYW.*?XZXZPYWYW)<A NAME = "\p{N}+?-\p{N}+?_para0">/$1/g' hc061204.xml

#DESPUÉS BUSCAMOS EL CASO QUE QUEDA DE PARAGRAPH 0 Y LE PONEMOS INTERVENTION DELANTE

perl -pi -e 's/<A NAME = "\p{N}+?-\p{N}+?_para0"><\/a><\!--META NAME="Speaker" CONTENT=""-->/

#DESPUÉS HAY QUE PEGAR LAS ETIQUETAS DE CIERRE DE SPEECH E INTERVENTION
#***EN ESTA PRIMERA CERRAMOS AQUELLOS CASOS EN LOS QUE HAY UN CIERRE DE OMIT DESPUÉS TRES SALTOS DE PÁRRAFO Y DESPUÉS INTERVENTION. PENSAMOS QUE ESE CIERRE SIEMPRE EQUIVALE A CIERRE DE WRITING. HABRÁ QUE BUSCAR AQUELLOS WRITINGS ACABADOS EN /SPEECH Y CAMBIARLOS
perl -pi -e 's/(XZXZomitYWYW.*?XZXZ\/omitYWYW)(XZXZPYWYWXZXZPYWYWXZXZPYWYWXZXZintervention)/$1XZXZ\/speechYWYWXZXZ\/interventionYWYW$2/g' hc061204.xml

#AQUÍ ESTÁN LOS CASOS EN LOS QUE LOS DISCURSOS ACABAN EN UN OMIT Y LUEGO EN DOS SALTOS DE PÁRRAFO Y LUEGO INTERVENTION. HAY QUE ASEGURARSE DE SI EL CIERRE ES SPEECH O WRITING
perl -pi -e 's/(<i>)*?(XZXZomitYWYW.*?XZXZ\/omitYWYW)(<\/i>)*?(XZXZPYWYWXZXZPYWYW)(<.*?>)*?(XZXZintervention/)/$2XZXZ\/speechYWYWXZXZ\/interventionYWYW$4$6/g' *.hmtl

#BUSCAR MIRRORED FROM
#DESPUÉS DEL PARRAFO DE MIRRORED HAY TRES CASOS: UNO CUANDO EL PÁRRAFO DE MIRRORED VA SEGUIGO DE DOS SALTOS DE PÁRRAFO Y LUEGO LA INTERVENCIÓN
#CUANDO VA SEGUIDO DE UN HEADING ASÍ: XZXZheading number="XY" type="sbhd0"YWYWSchool TransportXZXZ/headingYWYWXZXZPYWYWXZXZintervention id="inXYXY"YWYW
#CUANDO VA SEGUIDO DE OMIT

#ANTES DEL PÁRRAFO DE MIRRORED, 
#TEXTO NORMAL DE UNA INTERVENTION Y UN SALTO DE PÁRRAFO
#&#151;<i>XZXZomitYWYWInterruption.XZXZ/omitYWYW</i>XZXZPYWYW<!-- Mirrored 
#<a name="column_5"></a></P>XZXZPYWYW<!-- Mirrored from

#<\!-- Mirrored from www.publications.parliament.uk\/pa\/cm\p{N}+\/cmhansrd\/vo\p{N}+\/debtext\/\p{N}+-\p{N}+\.htm by HTTrack Website Copier\/\p{N}+\.x XZXZomitYWYWXR&CO'\p{N}+XZXZ\/omitYWYW.*?GMT -->


#EL CASO MÁS COMPLICADO ES CUANDO EL MIRRORED PARTE UNA VOTACIÓN. ES DECIR VA DETRÁS DE <i>The House divided:</i> Ayes \p{N}+, Noes \p{N}+.XZXZomit desc="division"YWYW luego hay un montón de votos; luego algo así Question accordingly negatived.XZXZPYWYWXZXZ/omitYWYW</FONT> luego intervención del speaker que habla (<!--META NAME="Speaker" CONTENT=""-->) para decir lo que ha pasado en la votación depués ENTRE MEDIAS EL MIRRORED y luego un omit y palabras del speaker introducidas por <!--META NAME="Speaker" CONTENT=""--> y finalmente se cierra el division

#VAMOS CON AQUELLOS CASOS EN LOS QUE HAY HEADINGS DELANTE DEL FINAL DEL SPEECH Y LA INTERVENTION




perl -pi -e 's/(YWYW)(XZXZPYWYW)+?(XZXZintervention)/$1XZXZ\/speechYWYWXZXZPYWYWXZXZ\/interventionYWYWXZXZPYWYWXZXZPYWYW$3/g' hc061204.xml


#AÑADIR \N DESPUÉS DE LAS ETIQUETAS DE BODY Y /HEADING
perl -pi -e 's/

perl -pi -e 's/(XZXZ)(body|\/heading)(YWYW)XZXZPYWYW(XZXZ)/$1$2$3XZXZPYWYWXZXZPYWYW$4/g' hc061204.xml

#QUITAR ESPACIOS ANTES DE /SPEECH (POR SI ACASO)

#perl -pi -e 's/XZXZPYWYW(XZXZPYWYW)+(XZXZ\/speechYWYW)/XZXZPYWYWXZXZ\/speechYWYW/g' hc061204.xml

#CAMBIAR ORDEN DE HEADING /SPEECH E /INTERVENTION PARA QUE EL HEADING QUEDE FUERA DE LA INTERVENCIÓN

perl -pi -e 's/(XZXZheading number="XY" type="sbhd\p{N}+"YWYW.*?XZXZ\/headingYWYW)(XZXZPYWYW)*?(XZXZ\/speechYWYW(XZXZPYWYW)*?XZXZ\/interventionYWYW)/$3XZXZPYWYW$1/g' hc061204.xml

#ELIMINAR <.*?>
perl -pi -e 's/<.*?>//g' hc061204.xml

#QUITAR 3 ESPACIOS DE SALTOS DE PÁRRAFO INNECESARIOS
perl -pi -e 's/XZXZPYWYWXZXZPYWYWXZXZPYWYWXZXZPYWYW/XZXZPYWYW/g' hc061204.xml
perl -pi -e 's/XZXZPYWYWXZXZPYWYWXZXZPYWYW/XZXZPYWYW/g' hc061204.xml
perl -pi -e 's/XZXZPYWYW(XZXZPYWYW)+(XZXZ\/speechYWYW)/XZXZPYWYWXZXZ\/speechYWYW/g' hc061204.xml

#DESPUÉS #VOLVER A RESTITUIR \n A PARTIR DE XZXZPYWYW
perl -pi -e 's/XZXZPYWYW/\n/g' hc061204.xml

#SUSTITUIR XZXZ POR <
perl -pi -e 's/XZXZ/</g' hc061204.xml

#SUSTITUIR YWYW POR >
perl -pi -e 's/YWYW/>/g' hc061204.xml


#BORRAR HORAS
perl -pi -e 's/^\p{N}+\.\p{N}+\p{Z}+(am|pm)//g' hc061204.xml
	

#DEJAR NOMBRE Y APELLIDO (QUITÁR TÍTULO)
perl -pi -e 's/(<name>).*?(Mr\.*?|Mrs|Dr\.*?|Miss|Sir|Hon|Rt Hon|Rev.*?)\p{Z}+(.*?)(<\/name>)/$1$3$4/g' hc061204.xml

#BORRAR ROSE
perl -pi -e 's/<i>\p{Z}*?rose&#151;//g' hc061204.xml
