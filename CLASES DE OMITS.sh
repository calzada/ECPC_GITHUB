OMIT ADDRESSEE
# 8º Etiquetar ...was asked
perl -pi -e 's/<(H4|h4).*?>(.*?was asked.*?)(<.*?>)*?<\/(H4|h4)>/XZXZomit desc="addressee"YZYZ$2XZXZ\/omitYWYW/g' *.xml

OMIT TIME
# 9º Etiquetar hora entre omits: <H5>
perl -pi -e 's/<(H5|h5).*?>(\p{N}+\.*?\p{N}*?.*?)(am|pm)<\/(H5|h5)>/XZXZomit desc="time"YWYW$2$3XZXZ\/omitYWYW/g;' *.xml

OMIT TIME
#PARA ETIQUETAR HORA DENTRO DE OMIT DESC="DIV"
perl -pi -e 's/\[(\p{N}+.*?\p{N}*?\p{Z}*?)(AM|PM|am|pm)/XZXZomit desc="time"YWYW$1$2XZXZ\/omitYWYW/g' *.html

OMIT DIV
# 11º Etiquetar votaciones (en ingles se llaman divisions porque la camara se separa fisicamente en votos a favor y votos en contra. Apertura de la division
perl -pi -e 's/<!-- division -->/XZXZomit desc="div"YWYW/g;' *.xml

OMIT DOC
# 13.1 Etiquetar numeracion referida a documentos
perl -pi -e 's/\[(P)*?(\p{N}+)\p{P}*?\]/XZXZomit desc="doc"YWYW$1$2XZXZ\/omitYWYW/g;' *.xml
perl -pi -e 's/\((Standing.*?)(\p{N}+)\p{P}*?\)/XZXZomit desc="doc"YWYW$1$2XZXZ\/omitYWYW/g;' *.xml
perl -pi -e 's/\[\p{Z}*?Bill\p{Z}*?(\p{N}+)\p{P}*?\]/XZXZomit desc="doc"YWYWBill $1$2XZXZ\/omitYWYW/g;' *.xml
perl -pi -e 's/\(\p{Z}*?Bill\p{Z}*?(\p{N}+)\p{P}*?\)/XZXZomit desc="doc"YWYWBill $1$2XZXZ\/omitYWYW/g;' *.xml

OMIT REACTION
# 13.5 Para etiquetar las reacciones
perl -pi -e 's/\[(.*?Interruption.*?|.*?Laughter.*?|.*?Hon.\p{Z}*?Members.*?)\]/XZXZomit desc="reaction"YWYW$1XZXZ\/omitYWYW/g;' *.html
perl -pi -e 's/<i>(\p{Z}+rose.*?XZXZ)/IITT$1/g;' *.html
perl -pi -e 's/<i>(\p{Z}*?rose.*?)(<\/i>)+?/XZXZomit desc="reaction"YWYW$1XZXZ\/omitYWYW/g;' *.html
perl -pi -e 's/IITT/<i>/g;' *.html

OMIT UNKNOWN
#PARA ETIQUETAR RESTO DE OMITS. PUEDE HABER DOCUMENTOS DE LEYES, NOMBRES DE ORADORES, INCLUSO ALGÚN QUE OTRO TIPO DE REACCIÓN
perl -pi -e 's/\[(.*?)(\])+?/XZXZomit desc="UNKNOWN"YWYW$1XZXZ\/omitYWYW/g' *.html

OMIT REFDOC, REFNAME
#HAY QUE COMMPROBAR ESTOS DOS REEMPLAZOS CUANDO YA ESTÉ TODO POR SI NO HA FUNCIONADO. LOS OMITS PIENSO QUE ESTARÁN BIEN PERO LA CLASE DE OMITS ES DUDOSA
perl -pi -e 's/\[\p{Z}*?(<i>)*?\p{Z}*?(Mr\.*?|Mrs\.*?|Ms|Dr\.*?|Sir|Rev.*?|.on\.*?\p{Z}*?\.ember|Lady|Lord)*?(\p{Z}*?\p{L}+?\p{Z}*?\p{L}*?\.*?\p{Z}+?\p{L}+?)(-\p{L}+?)*?(\p{Z}*?\.*?)(\p{Z}*?<\/i>\p{Z}*?)*?(\.*?)\p{Z}*?\]/XZXZomit desc="refname"YWYW\$1$2$3$4$5$6$7XZXZ\/omitYWYW/g' hc061204.xml
perl -pi -e 's/\[(.*?)\]/XZXZomit desc="refdoc"YWYW$1XZXZ\/omitYWYW/g' hc061204.xml