#!/bin/sh -x

perl -pi -e 's/\&aelig;/æ/g' *.xml
perl -pi -e 's/\&Aelig;/æ/g' *.xml
perl -pi -e 's/\&aelig/æ/g' *.xml


perl -pi -e 's/\&LT;/</g' *.xml
perl -pi -e 's/\&GT;/>/g' *.xml

perl -pi -e 's/\&#0133;/.../g' *.xml

perl -pi -e 's/\&#129;//g' *.xml

perl -pi -e 's/\&#131;/ƒ/g' *.xml
perl -pi -e 's/\&#132;/„/g' *.xml
perl -pi -e 's/\&#133;/…/g' *.xml
perl -pi -e 's/\&#134;/†/g' *.xml
perl -pi -e 's/\&#137;/‰/g' *.xml
perl -pi -e 's/\&#137;/š/g' *.xml
perl -pi -e 's/\&#139;/‹/g' *.xml

perl -pi -e 's/\&#140;/œ/g' *.xml
perl -pi -e 's/\&#142;/ž/g' *.xml
perl -pi -e 's/\&#143;//g' *.xml
perl -pi -e 's/\&#144;//g' *.xml
perl -pi -e 's/\&#149;/•/g' *.xml

perl -pi -e 's/\&#152;/à/g' *.xml
perl -pi -e 's/\&#154;/š/g' *.xml
perl -pi -e 's/\&#156;/œ/g' *.xml
perl -pi -e 's/\&#158;/ž/g' *.xml


perl -pi -e 's/\&#232;/è/g' *.xml

perl -pi -e 's/\&#941;/έ/g' *.xml
perl -pi -e 's/\&#972;/ό/g' *.xml

perl -pi -e 's/\&#x2020;/†/g' *.xml



perl -pi -e 's/\&#x1F2C;/Ἤ/g' *.xml
perl -pi -e 's/\&#x1F30;/ἰ/g' *.xml

perl -pi -e 's/\&#x1F74;/ὴ/g' *.xml
perl -pi -e 's/\&#x1F74;/έ/g' *.xml

perl -pi -e 's/\&#x1F40;/ὀ/g' *.xml

perl -pi -e 's/\&#x1F77;/ί/g' *.xml

perl -pi -e 's/\&#x1F79;/ό/g' *.xml

perl -pi -e 's/\&#x1F78;/ὸ/g' *.xml

perl -pi -e 's/\&#x1F78;/ἀ/g' *.xml



