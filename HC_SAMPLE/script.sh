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