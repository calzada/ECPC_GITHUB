#!/bin/sh

echo "1º Cambiar extension de los ficheros de htm y html a xml\n";
#1º Cambiar extension de los ficheros de htm y html a xml
for i in *.html; do mv "$i" "${i/.html}".xml; done
