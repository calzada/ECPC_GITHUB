#HAY QUE APLICAR DESPUÉS DE PASARLOS TODOS

perl -pi -e 's/\n/QWQWÑLÑL/g' *.xml

#QUITAR CIERRE DE CHAIR. YA ESTÁ QUITADO EN EL NUEVO SCRIPT

perl -pi -e 's/<\/chair>//g' *.xml

#LA REFERENCIA DE LOS WRITINGS NO ESTÁ BIEN

perl -pi -e 's/(writing ref=")sp(XY")/$1wr$2/g' *.xml


#QUITAR GUION ANTES DE SEPARACIÓN DE PÁRRAFO

perl -pi -e 's/–QWQWÑLÑL/QWQWÑLÑL/g' *.xml
perl -pi -e 's/QWQWÑLÑL–/QWQWÑLÑL/g' *.xml

#QUITAR PUNTUACIÓN ENTRE ETIQUETAS. sigue  sn funcionar para resolver esto: <post>on behalf of the EFD Group</post>. – <speech ref="spXY" language="IT">

perl -pi -e 's/>\W+?</></g' *.xml

perl -pi -e 's/(<\/(name|affiliation|post|national_party)>)(<)/$1QWQWÑLÑL$2/g' *.xml


#UNKNOWN ESTÁ MAL ESCRITO

perl -pi -e 's/UNKNONW/UNKNOWN/g' *.xml

#NO ESTÁ BIEN CERRADO AFFILIATION

perl -pi -e 's/(<ep group=")(PPE|S_and_D|ALDE|Verts-ALE|ECR|GUE-NGL|EFD|NI|UNKNOWN|NA)("\/>QWQWÑLÑL)(?!<\/affiliation>)/$1$2$3<\/affiliation>/g' *.xml

#ETIQUETAR PRIMERO  FUSIÓN SPEECH / WRITING / UNKNONW (VER DOC PROBLEMAS.TXT)


perl -pi -e 's/<speaker>QWQWÑLÑL(<name>.+?<\/name>QWQWÑLÑL<affiliation>QWQWÑLÑL<national_party>UNKNOWN<\/national_party>QWQWÑLÑL<ep group=")(PPE|S_and_D|ALDE|Verts-ALE|ECR|GUE-NGL|EFD|NI|UNKNOWN|NA)("\/>QWQWÑLÑL<\/affiliation>QWQWÑLÑL<post>.+?<\/post>QWQWÑLÑL)<\/speaker>QWQWÑLÑL<speech ref="spXY" language="(BG|ES|CS|DA|DE|ET|EL|EN|FR|GA|HR|IT|LV|LT|HU|MT|NL|PL|PT|RO|SK|SL|FI|SV)"><post>in writing<\/post>QWQWÑLÑL<\/speaker>QWQWÑLÑL<speech ref="spXY" language="(BG|ES|CS|DA|DE|ET|EL|EN|FR|GA|HR|IT|LV|LT|HU|MT|NL|PL|PT|RO|SK|SL|FI|SV)">\((BG|ES|CS|DA|DE|ET|EL|EN|FR|GA|HR|IT|LV|LT|HU|MT|NL|PL|PT|RO|SK|SL|FI|SV)\)/<writer>QWQWÑLÑL$1$2$3<\/writer>QWQWÑLÑL<writing ref="wrXY" language="$6">/g' *.xml


#REPETICIÓN DE AFILIACIÓN

perl -pi -e 's/(<name>.+?<\/name>QWQWÑLÑL<affiliation>QWQWÑLÑL)<national_party>UNKNOWN<\/national_party>QWQWÑLÑL<ep group="(PPE|S_and_D|ALDE|Verts-ALE|ECR|GUE-NGL|EFD|NI|UNKNOWN|NA)"\/>QWQWÑLÑL<affiliation>QWQWÑLÑL(<national_party>UNKNOWN<\/national_party>QWQWÑLÑL<ep group="(PPE|S_and_D|ALDE|Verts-ALE|ECR|GUE-NGL|EFD|NI|UNKNOWN|NA)"\/>QWQWÑLÑL<\/affiliation>)/$1$2/g' *.xml


#ALGUNOS WRITING NO ESTÁN BIEN ABIERTOS

perl -pi -e 's/(<\/writer>QWQWÑLÑL<writing )ref="wrXY" language="(BG|ES|CS|DA|DE|ET|EL|EN|FR|GA|HR|IT|LV|LT|HU|MT|NL|PL|PT|RO|SK|SL|FI|SV)">\s*?(QWQWÑLÑL)*?\s*?<speech (ref="spXY" language=)"(BG|ES|CS|DA|DE|ET|EL|EN|FR|GA|HR|IT|LV|LT|HU|MT|NL|PL|PT|RO|SK|SL|FI|SV)"(>)/$1$4"$5"$6/g' *.xml


perl -pi -e 's/(<\/speaker>QWQWÑLÑL<speech )ref="spXY" language="(BG|ES|CS|DA|DE|ET|EL|EN|FR|GA|HR|IT|LV|LT|HU|MT|NL|PL|PT|RO|SK|SL|FI|SV)">\s*?(QWQWÑLÑL)*?\s*?<speech (ref="spXY" language=)"(BG|ES|CS|DA|DE|ET|EL|EN|FR|GA|HR|IT|LV|LT|HU|MT|NL|PL|PT|RO|SK|SL|FI|SV)"(>)/$1$4"$5"$6/g' *.xml

#Cambiar QWQWÑLÑL por \n

perl -pi -e 's/QWQWÑLÑL/\n/g' *.xml
