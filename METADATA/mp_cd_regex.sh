#!/bin/sh
#Este script para extraer la información de los diputados del CD
#autores: ace, fg, mc
#fecha: 27/03/2014 (en magdalena festa plena)
#perl -pi -e 's///g' .html


#Para poner todo el texto en una línea

perl -pi -e 's/(\n|\r)+//g' *.html

#Para Borrar información no necesaria antes de los datos del diputado. 


perl -pi -e 's/^.*<div id="(datos_diputado)">/XXZZ$1YYWW/g' *.html

#Bajas

perl -pi -e 's/<li><div class="dip_rojo">Causó baja el (.*?)\.?<\/div><\/li>/XXZZbajaYYWW$1XXZZ\/bajaYYWW/g' *.html


#Sustituido por

perl -pi -e 's/<li>Sustituido por(.*?)<\/li>/XXZZsustituido_porYYWW$1XXZZ\/sustituido_porYYWW/g' *.html

#Altas

perl -pi -e 's/<li><div class="dip_rojo">\p{Z}*?(Fecha alta:|.*?alta)\p{Z}+(\d+?\/\d+?\/\d+)\p{Z}*?\.?\p{Z}*?<\/div><\/li>/
XXZZfecha_altaYYWW$2XXZZ\/fecha_altaYYWW/g' *.html

#Sustituye_a

perl -pi -e 's/<li>\p{Z}*?(.ustituyó|.ustituye)\p{Z}+a(.*?)<\/li>/XXZZsustituye_aYYWW$1XXZZ\/sustituye_aYYWW/g' *.html

#Histórico
#Fin datos diputado

perl -pi -e 's/<p class="titular_historico">Histórico<\/p>(.*?)<div class="paginacion" id="enlaceHistory" style="display:none;"\s*?>.*$/XXZZCargos_ocupadosYYWW$1XXZZ\/Cargos_ocupadosYYWWXXZZ\/datos_diputadoYYWW/g' *.html


#Para poner nuestra etiqueta de nombre

perl -pi -e 's/<div class="nombre_dip">(.+?)<\/div>/XXZZnameYYWW$1XXZZ\/nameYYWW/g' *.html


#Para etiquetar género masculino y constituency

perl -pi -e 's/<div class="dip_rojo">(\s|\t)*?Diputado por(\s|\t)*?(.*?)\.*?(\s|\t)*?<\/div>/XXZZgenderYYWWmaleXXZZ\/genderYYWWXXZZconstituencyYYWW$3XXZZ\/constituencyYYWW/g' *.html


#Para etiquetar género femenino y constituency

perl -pi -e 's/<div class="dip_rojo">(\s|\t)*?Diputada por(\s|\t)*?(.*?)\.*?(\s|\t)*?<\/div>/XXZZgenderYYWWfemaleXXZZ\/genderYYWWXXZZconstituencyYYWW$3XXZZ\/constituencyYYWW/g' *.html


#Etiquetar el partido

perl -pi -e 's/<p class="nombre_grupo">(.*?)<\/p>/XXZZpartido_nacionalYYWW$1XXZZ\/partido_nacionalYYWW/g' *.html

#Etiquetar el grupo 

perl -pi -e 's/<div class="dip_rojo"><a href=.*?class=.. >(.*?)<\/a><\/div>/
XXZZgrupo_europeoYYWW$1XXZZ\/grupo_europeoYYWW/g' *.html

#Etiquetar fecha y lugar de nacimiento. SOLO HAY MEMORIA PARA 9 REEMPLAZOS ES DECIR $9. \W cubre los casos de (\s|\t)

perl -pi -e 's/<li>\W*?Nacid.\W+?el\W+?(\d+)\W+?de\W+?(.*?)\W+?de\W+?(\d+)\W+?en\W+?(.*?)\p{Z}+<\/li>/XXZZfecha_nacimientoYYWW$1 de $2 de $3XXZZ\/fecha_nacimientoYYWWXXZZlugar_nacimientoYYWW$4XXZZ\/lugar_nacimientoYYWW/g' *.html


#Etiquetar legislatura
perl -pi -e 's/<div class="principal">(.*?)<\/div>/XXZZlegislaturaYYWW$1XXZZ\/legislaturaYYWW/g' *.html

#Etiquetar descripción personal

perl -pi -e 's/<li>\p{Z}*?(.*?)\.*?<\/li>\W+?<li><\/li><br>/XXZZdescripcion_personalYYWW$1XXZZ\/descripcion_personalYYWW/g' *.html

# Eliminar texto en rojo

perl -pi -e 's/<\!--(.*?)-->//g' *.html

#Para borrar html innecesario

perl -pi -e 's/<.*?>//g' *.html

# Cambiar nuevas etiquetas a formato XML

perl -pi -e 's/XXZZ/</g' *.html

perl -pi -e 's/YYWW/>/g' *.html

#Cambiar \t por \s

perl -pi -e 's/\t/ /g' *.html

#Cambiar \n por \s

perl -pi -e 's/\n/ /g' *.html

#Quitar \s innecesarias

perl -pi -e 's/(\p{Z})(\p{Z})+/$1/g' *.html


#Quitar \s innecesarias después de > innecesarias para que no haya espacios en blanco innecesarios

perl -pi -e 's/(>)\s+?/$1/g' *.html

#Quitar Ficha personal

perl -pi -e 's/Ficha personal//g' *.html

#Repetir nombre y separar del resto con \t

perl -pi -e 's/(<datos_diputado>)(<partido_nacional>.*?<\/partido_nacional>)(<legislatura>.*? <\/legislatura>)(<name>.*?<\/name>)(<gender>.*?<\/gender>)(<constituency>.*?<\/constituency>)(<grupo_europeo>.*?<\/grupo_europeo>)/$1\n$4\t$4$5$6$2$7$3/g' *.html

#Añadir \n delante de </datos_diputado>
perl -pi -e 's/(<\/Cargos_ocupados>)(<\/datos_diputado>)/$1\n$2/g' *.html

#Pegar denominación xml al principio del documento

perl -pi -e 's/^^(<datos_diputado>)/<\?xml version="1\.0" encoding=\"UTF-8\" standalone="no"\?>\n<\!DOCTYPE datos_diputado SYSTEM "mp_CD\.dtd">\n$1/g' *.html

#Para eliminar &nbsp; y cambiar por espacio en blanco

perl -pi -e 's/\&nbsp;/ /g' *.html



#---------------------------------------------------------------------------
#Pegar todos los documentos

cat *.html > total.xml

perl -pi -e 's/<\?xml version="1\.0" encoding=\"UTF-8\" standalone="no"\?>\n<\!DOCTYPE datos_diputado SYSTEM "mp_CD\.dtd">\n$1//g' total.xml

perl -pi -e 's/<datos_diputado>//g' total.xml

perl -pi -e 's/<\/datos_diputado>//g' total.xml






