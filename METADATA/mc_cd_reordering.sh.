<speaker>
<name>Borrell Fontelles, Josep</name>
<birth_date>19470424</birth_date>
<birth_place country="ES">Pobla de Segur</birth_place>
<status>NA</status>
<gender>male</gender>
<institution>
<io>
<eu body="EP"/>
</io>
</institution>
<constituency country="ES"/>
<affiliation>
<national_party>Partido Socialista Obrero Español</national_party>
<ep group="PSE"/>
</affiliation>
<post>NA</post>
</speaker>

#perl -pi -e 's/^(<name>)/\n$1/g' *.xml

#Unnecessary. Just to see entrie better now that I am working. 
perl -pi -e 's/^(<name>)/\n$1/g' *.xml

#When there is a birth_date and a birth_place, place it next to name

perl -pi -e 's/(<gender>.*?<\/gender><constituency>.*?<\/constituency><partido_nacional>.*?<\/partido_nacional><grupo_europeo>.*?<\/grupo_europeo><legislatura>.*?<\/legislatura>)\p{Z}*?(<fecha_nacimiento>.*?<\/fecha_nacimiento><lugar_nacimiento>.*?<\/lugar_nacimiento>)/
$2<status>NA</status>$1/g' *.xml

#When there is no birth_date or birth_place, add UNKNOWN

perl -pi -e 's/(<gender>.*?<\/gender>)(<constituency>)/
<birth_date>UNKNOWN<\/birth_date><birth_place country="UNKNOWN">UNKNOWN<\/birth_place><status>NA</status>$1$2/g' *.xml

 
#Adding institution and ni before constituency

perl -pi -e 's/(<\/gender>)(<constituency>.*?<\/constituency>)/$1<institution><ni country="Spain">CD<\/ni><\/institution>$2<affiliation>/g' *.xml

#national party and cd group tags in English
perl -pi -e 's/<partido_nacional>(.*?)<\/partido_nacional><grupo_europeo>.*?\(\p{Z}+?(.*?)\p{Z}*?\)<\/grupo_europeo>/<national_party>$1</national_party><cd group="$2"/><\/affiliation>/g' *.xml

#Translating the ligislatura tag into term

perl -pi -e 's/<legislatura>/<additional_info><term>/g' *.xml

perl -pi -e 's/<\/legislatura>/<\/term>/g' *.xml

#taxes

perl -pi -e 's/<descripcion_personal>(.*?)<\/descripcion_personal>(.*?)<fecha_alta>(.*?)<\/fecha_alta><sustituye_a>(.*?)<\/sustituye_a>/<taxes>$2<\/taxes><starting_date>$3<\/starting_date><replacing>$4<\/replacing><personal_cv>$1<\/personal_cv><official_cv>/g' *.xml

perl -pi -e 's/<descripcion_personal>(.*?)<\/descripcion_personal>(.*?)<fecha_alta>(.*?)<\/fecha_alta>/<taxes>$2<\/taxes><starting_date>$3<\/starting_date><personal_cv>$1<\/personal_cv><official_cv>/g' *.xml


#cargos ocupados en el CD durante la legislatura will go under <cd_cv>

perl -pi -e 's/\p{Z}+?<Cargos_ocupados>/\. /g' *.xml

perl -pi -e 's/<\/Cargos_ocupados>/<\/official_cv><\/additional_info>/g' *.xml


#Cleaning undesired info

perl -pi -e 's/Volver a la página anterior cargaLegSesion.*?Horario de Registro/<\/official_cv><\/additional_info>/g' *.xml

#Deleting two birth_date and birth_place

perl -pi -e 's/<fecha_nacimiento>(.*?)<\/fecha_nacimiento><lugar_nacimiento>(.*?)<\/lugar_nacimiento>(<status>NA<\/status>)<birth_date>UNKNOWN<\/birth_date><birth_place country="UNKNOWN">UNKNOWN<\/birth_place><status>NA<\/status>)/<birth_date>$1<\/birth_date><birth_place country="ES">$2<\/birth_place>$3/g' *.xml

perl -pi -e 's/<fecha_nacimiento>(.*?)<\/fecha_nacimiento><lugar_nacimiento>(.*?)<\/lugar_nacimiento><birth_date>UNKNOWN<\/birth_date><birth_place country="UNKNOWN">UNKNOWN<\/birth_place>(<status>NA<\/status>)/<birth_date>$1<\/birth_date><birth_place country="ES">$2<\/birth_place>$3/g' *.xml

#Deleting and unnecessary dot adn nbsp;

perl -pi -e 's/\p{Z}+?\.(<\/birth_place>)/$1/g' *.xml

perl -pi -e 's/>nbsp;/>/g' *.xml

# Homogenising country

perl -pi -e 's/(country=.)Spain(.)/$1ES$2/g' *.xml

#Deleting \n before <name>
perl -pi -e 's/\n^(<name>)/$1/g' *.xml
