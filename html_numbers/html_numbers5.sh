#!/bin/sh -x

perl -pi -e 's/\&#x21;/\!/g' *.xml
perl -pi -e 's/\&#x22;/\"/g' *.xml
perl -pi -e 's/\&#x23;/\#/g' *.xml
perl -pi -e 's/\&#x24;/\$/g' *.xml
perl -pi -e 's/\&#x25;/\%/g' *.xml
perl -pi -e 's/\&#x26;/\&/g' *.xml
perl -pi -e 's/\&#x27;/\'/g' *.xml
perl -pi -e 's/\&#x28;/\(/g' *.xml
perl -pi -e 's/\&#x29;/\)/g' *.xml
perl -pi -e 's/\&#x2A;/\*/g' *.xml
perl -pi -e 's/\&#x2B;/\+/g' *.xml
perl -pi -e 's/\&#x2C;/,/g' *.xml
perl -pi -e 's/\&#x2D;/\-/g' *.xml
perl -pi -e 's/\&#x2E;/\./g' *.xml
perl -pi -e 's/\&#x2F;/\//g' *.xml

perl -pi -e 's/\&#x3A;/\:/g' *.xml
perl -pi -e 's/\&#x3B;/;/g' *.xml
perl -pi -e 's/\&#x3C;/</g' *.xml
perl -pi -e 's/\&#x3D;/\=/g' *.xml
perl -pi -e 's/\&#x3E;/>/g' *.xml
perl -pi -e 's/\&#x3F;/\?/g' *.xml

perl -pi -e 's/\&#x60;/\`/g' *.xml

