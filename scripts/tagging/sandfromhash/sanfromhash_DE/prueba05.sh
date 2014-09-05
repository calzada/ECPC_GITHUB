#!/bin/bash
#prueba05.sh
perl replace_rose_hc05.pl hc*.xml
perl sandrfromhash05.pl -table tabla05.txt hc*.xml -regex
perl format05.pl hc*.xml
perl sandrfromhashbirth05.pl -table birth05.txt hc*.xml -regex
perl formatbirth05.pl hc*.xml