#!/bin/sh

echo '\n\n';
echo 'INTERVENCIONES\n'

#Con el modificador i en el reemplazo no tenemos en cuenta las mayusculas

echo '16º Etiquetar wqn con los datos de los oradores (wqn = intervenciones por escrito).'
# 16º Etiquetar wqn con los datos de los oradores (wqn = intervenciones por escrito)

#perl -pi -e 's/<!--(META|meta)\p{Z}+?(NAME|name)="Colno"\p{Z}+?(CONTENT|content)="\p{N}+"-->\p{Z}*?<(A|a)\p{Z}+?(NAME|name)="\p{N}+-\p{N}+_wqn\p{N}+">\p{Z}*?<\/(A|a)>\p{Z}*?<(B|b)>\p{Z}*?(\p{L}.*?\p{L})\p{Z}*?(\(.*?\))*?\p{Z}*?(:)*?\p{Z}*?<\/(B|b)>\p{Z}*?<!--(.*?)-->\p{Z}*?(\(.*?\))*?(:)*?\p{Z}*?(\p{L}|<)/XZXZintervention id="inXYXY"YWYWXZXZPYWYWXZXZwriterYWYWXZXZPYWYWXZXZnameYWYW$12XZXZ\/nameYWYWXZXZPYWYWXZXZ\/writerYWYWXZXZPYWYWXZXZwriting id="XYXY" language="EN"YWYW$15/g' *.xml
#perl -pi -e 's/<!--(META|meta)\p{Z}+?(NAME|name)="Colno"\p{Z}+?(CONTENT|content)="\p{N}+"-->\p{Z}*?<(A|a)\p{Z}+?(NAME|name)="\p{N}+">\p{Z}*?<\/(A|a)>\p{Z}*?<(B|b)>\p{Z}*?(\p{L}.*?\p{L})\p{Z}*?(\(.*?\))*?\p{Z}*?(:)*?\p{Z}*?<\/(B|b)>\p{Z}*?<!--(.*?)-->\p{Z}*?(\(.*?\))*?(:)*?\p{Z}*?(\p{L}|<)/XZXZintervention id="inXYXY"YWYWXZXZPYWYWXZXZwriterYWYWXZXZPYWYWXZXZnameYWYW$12XZXZ\/nameYWYWXZXZPYWYWXZXZ\/writerYWYWXZXZPYWYWXZXZwriting id="XYXY" language="EN"YWYW$15/g' *.xml

#perl -pi -e 's/<!--(META|meta).*?-->\p{Z}*?<(A|a)\p{Z}+?(NAME|name)="\p{N}+-\p{N}+_wqn\p{N}+">\p{Z}*?<\/(A|a)>\p{Z}*?<(B|b)>\p{Z}*?\p{L}.*?\p{L}\p{Z}*?\(.*?\)*?\p{Z}*?:*?\p{Z}*?<\/(B|b)>\p{Z}*?<!--(.*?)-->\p{Z}*?(\(.*?\))*?:*?\p{Z}*?(\p{L}|<)/XZXZintervention id="inXYXY"YWYWXZXZPYWYWXZXZwriterYWYWXZXZPYWYWXZXZnameYWYW$7XZXZ\/nameYWYWXZXZPYWYWXZXZ\/writerYWYWXZXZPYWYWXZXZwriting id="XYXY" language="EN"YWYW$9/g' *.xml
#perl -pi -e 's/<!--(META|meta).*?-->\p{Z}*?<(A|a)\p{Z}+?(NAME|name)="\p{N}+">\p{Z}*?<\/(A|a)>\p{Z}*?<(B|b)>\p{Z}*?\p{L}.*?\p{L}\p{Z}*?\(.*?\)*?\p{Z}*?:*?\p{Z}*?<\/(B|b)>\p{Z}*?<!--(.*?)-->\p{Z}*?(\(.*?\))*?:*?\p{Z}*?(\p{L}|<)/XZXZintervention id="inXYXY"YWYWXZXZPYWYWXZXZwriterYWYWXZXZPYWYWXZXZnameYWYW$7XZXZ\/nameYWYWXZXZPYWYWXZXZ\/writerYWYWXZXZPYWYWXZXZwriting id="XYXY" language="EN"YWYW$9/g' *.xml

perl -pi -e 's/<!--meta.*?-->\p{Z}*?<a\p{Z}+?name="\p{N}+-\p{N}+_wqn\p{N}+">\p{Z}*?<\/a>\p{Z}*?<b>\p{Z}*?\p{L}.*?\p{L}\p{Z}*?\(.*?\)*?\p{Z}*?:*?\p{Z}*?<\/b>\p{Z}*?<!--(.*?)-->\p{Z}*?(\(.*?\))*?:*?\p{Z}*?(\p{L}|<)/XZXZintervention id="inXYXY"YWYWXZXZPYWYWXZXZwriterYWYWXZXZPYWYWXZXZnameYWYW$1XZXZ\/nameYWYWXZXZPYWYWXZXZ\/writerYWYWXZXZPYWYWXZXZwriting id="XYXY" language="EN"YWYW$3/gi' *.xml
perl -pi -e 's/<!--meta.*?-->\p{Z}*?<a\p{Z}+?name="\p{N}+">\p{Z}*?<\/a>\p{Z}*?<b>\p{Z}*?\p{L}.*?\p{L}\p{Z}*?\(.*?\)*?\p{Z}*?:*?\p{Z}*?<\/b>\p{Z}*?<!--(.*?)-->\p{Z}*?(\(.*?\))*?:*?\p{Z}*?(\p{L}|<)/XZXZintervention id="inXYXY"YWYWXZXZPYWYWXZXZwriterYWYWXZXZPYWYWXZXZnameYWYW$1XZXZ\/nameYWYWXZXZPYWYWXZXZ\/writerYWYWXZXZPYWYWXZXZwriting id="XYXY" language="EN"YWYW$3/gi' *.xml

echo '17º Etiquetar wqn con los datos de los oradores (wqn = intervenciones por escrito) que tienen un omit delante'
# 17º Etiquetar wqn con los datos de los oradores (wqn = intervenciones por escrito) que tienen un omit delante

#perl -pi -e 's/<(A|a)\p{Z}+?(name|NAME)="\p{N}+-\p{N}+.htm_wqn\p{N}+">\p{Z}*?<\/(A|a)>\p{Z}*?<(A|a)\p{Z}+?(NAME|name)="\p{N}+">\p{Z}*?<\/(A|a)>\n<!--(META|meta)\p{Z}+?(NAME|name)="Colno"\p{Z}+?(CONTENT|content)="\p{N}+"--> (XZXZomit.*?omitYWYW)<(A|a)\p{Z}+?(NAME|name)="\p{N}+">\p{Z}*?<\/(A|a)><(B|b)>\p{Z}*?(\p{L}.*?\p{L})\p{Z}*?(\(.*?\))*?\p{Z}*?(:)*?\p{Z}*?<\/(B|b)>\p{Z}*?<!--(.*?)-->\p{Z}*?(\(.*?\))*?(:)*?\p{Z}*?(\p{L}|<)/$10XZXZintervention id="inXYXY"YWYWXZXZPYWYWXZXZwriterYWYWXZXZPYWYWXZXZnameYWYW$19XZXZ\/nameYWYWXZXZPYWYWXZXZ\/writerYWYWXZXZPYWYWXZXZwriting id="XYXY" language="EN"YWYW$22/g' *.xml
#perl -0777 -i -pe 'BEGIN{undef $/;} s/<a\p{Z}+?name="\p{N}+-\p{N}+.htm_wqn\p{N}+">\p{Z}*?<\/a>\p{Z}*?<a\p{Z}+?name="\p{N}+">\p{Z}*?<\/a>.*<!--meta.*?-->\p{Z}*?(XZXZomit.*?omitYWYW).*?:*?\p{Z}*?<\/b>\p{Z}*?<!--(.*?)-->\p{Z}*?(\(.*?\))*?:*?\p{Z}*?(\p{L}|<)/XZXZintervention id="inXYXY"YWYWXZXZPYWYWXZXZwriterYWYWXZXZPYWYWXZXZnameYWYW$2XZXZ\/nameYWYWXZXZPYWYWXZXZ\/writerYWYWXZXZPYWYWXZXZwriting id="XYXY" language="EN"YWYW$1$4/smgi' *.xml
#perl -0pe 's/<a\p{Z}+?name="\p{N}+-\p{N}+.htm_wqn\p{N}+">\p{Z}*?<\/a>\p{Z}*?<a\p{Z}+?name="\p{N}+">\p{Z}*?<\/a>\n<!--meta.*?-->\p{Z}*?(XZXZomit.*?omitYWYW).*?:*?\p{Z}*?<\/b>\p{Z}*?<!--(.*?)-->\p{Z}*?(\(.*?\))*?:*?\p{Z}*?(\p{L}|<)/XZXZintervention id="inXYXY"YWYWXZXZPYWYWXZXZwriterYWYWXZXZPYWYWXZXZnameYWYW$2XZXZ\/nameYWYWXZXZPYWYWXZXZ\/writerYWYWXZXZPYWYWXZXZwriting id="XYXY" language="EN"YWYW$1$4/gi' *.xml

perl -0777 -i -pe 'BEGIN{undef $/;} s/<a\p{Z}+?name="\p{N}+-\p{N}+.htm_wqn\p{N}+">\p{Z}*?<\/a>\p{Z}*?<a\p{Z}+?name="\p{N}+">\p{Z}*?<\/a>\n<!--meta\p{Z}+?name="Colno"\p{Z}+?CONTENT="\p{N}+"-->\p{Z}*?(XZXZomit.*?omitYWYW)\p{Z}*?<a\p{Z}*?name="\p{N}+">\p{Z}*?<\/a><b>.*?:*?\p{Z}*?<\/b>\p{Z}*?<!--(.*?)-->\p{Z}*?(\(.*?\))*?:*?\p{Z}*?(\p{L}|<)/\nXZXZintervention id="inXYXY"YWYWXZXZPYWYWXZXZwriterYWYWXZXZPYWYWXZXZnameYWYW$2XZXZ\/nameYWYWXZXZPYWYWXZXZ\/writerYWYWXZXZPYWYWXZXZwriting id="XYXY" language="EN"YWYW$1$4/smgi' *.xml

echo '18º Etiquetar spmin con los datos de los oradores que son ministros (spmin = ministros)'
# 18º Etiquetar spmin con los datos de los oradores que son ministros (spmin = ministros)

perl -pi -e 's/<!--META NAME="Colno" CONTENT="\p{N}+"-->\p{Z}*?<A NAME="\p{N}+-\p{N}+_spmin\p{N}+">\p{Z}*?<\/A>\p{Z}*?<B>\p{Z}*?(\p{L}.*?\p{L})\p{Z}*?(\(.*?\))*?\p{Z}*?(:)*?\p{Z}*?<\/B>\p{Z}*?<!--(.*?)-->\p{Z}*?(:)*?\p{Z}*?(\p{L}|<|\p{P}\p{L})/XZXZintervention id="inXYXY"YWYWXZXZPYWYWXZXZspeakerYWYWXZXZPYWYWXZXZnameYWYW$4XZXZ\/nameYWYWXZXZPYWYWXZXZpostYWYW$1XZXZ\/postYWYWXZXZPYWYWXZXZ\/speakerYWYWXZXZPYWYWXZXZspeech id="XYXY" language="EN"YWYW$6/gi' *.xml
perl -pi -e 's/<!--meta\p{Z}+?name="Colno"\p{Z}+?CONTENT="\p{N}+"-->\p{Z}*?<a\p{Z}+?name="\p{N}+-\p{N}+\.htm_spmin\p{N}+">\p{Z}*?<\/a><a\p{Z}+?name="\p{N}+">\p{Z}*?<\/a>\p{Z}*?<b>\p{Z}*?(\p{L}.*?\p{L})\p{Z}*?(\(.*?\))*?\p{Z}*?:*?\p{Z}*?<\/b>\p{Z}*?<!--(.*?)-->\p{Z}*?:*?\p{Z}*?(\p{L}|<|\p{P}\p{L})/XZXZintervention id="inXYXY"YWYWXZXZPYWYWXZXZspeakerYWYWXZXZPYWYWXZXZnameYWYW$3XZXZ\/nameYWYWXZXZPYWYWXZXZpostYWYW$1XZXZ\/postYWYWXZXZPYWYWXZXZ\/speakerYWYWXZXZPYWYWXZXZspeech id="XYXY" language="EN"YWYW$4/gi' *.xml

echo '19º Etiquetar Mr. Speaker'
# 19º Etiquetar Mr. Speaker
perl -pi -e 's/<!--meta\p{Z}+?name="Colno"\p{Z}+?CONTENT="\p{N}+"-->\p{Z}*?<a\p{Z}+?name="\p{N}+?-\p{N}+?.htm_spnew\p{N}+?">\p{Z}*?<\/a>\p{Z}*?<a\p{Z}+?name="\p{N}+?">\p{Z}*?<\/a>\p{Z}*?<b>Mr\p{Z}+?Speaker:*?<\/b>\p{Z}*?<!--(.*?)-->\p{Z}*?(\p{L}|<)//gi' *.xml
