#!/bin/sh -x

perl -pi -e 's/\&#x20;//g' *.xml

perl -pi -e 's/\&#x30;/0/g' *.xml
perl -pi -e 's/\&#x31;/1/g' *.xml
perl -pi -e 's/\&#x32;/2/g' *.xml
perl -pi -e 's/\&#x33;/3/g' *.xml
perl -pi -e 's/\&#x34;/4/g' *.xml
perl -pi -e 's/\&#x35;/5/g' *.xml
perl -pi -e 's/\&#x36;/6/g' *.xml
perl -pi -e 's/\&#x37;/7/g' *.xml
perl -pi -e 's/\&#x38;/8/g' *.xml
perl -pi -e 's/\&#x39;/9/g' *.xml

perl -pi -e 's/\&#x40;/@/g' *.xml
perl -pi -e 's/\&#x41;/A/g' *.xml
perl -pi -e 's/\&#x42;/B/g' *.xml
perl -pi -e 's/\&#x43;/C/g' *.xml
perl -pi -e 's/\&#x44;/D/g' *.xml
perl -pi -e 's/\&#x45;/E/g' *.xml
perl -pi -e 's/\&#x46;/F/g' *.xml
perl -pi -e 's/\&#x47;/G/g' *.xml
perl -pi -e 's/\&#x48;/H/g' *.xml
perl -pi -e 's/\&#x49;/I/g' *.xml
perl -pi -e 's/\&#x4A;/J/g' *.xml
perl -pi -e 's/\&#x4B;/K/g' *.xml
perl -pi -e 's/\&#x4C;/L/g' *.xml
perl -pi -e 's/\&#x4D;/M/g' *.xml
perl -pi -e 's/\&#x4E;/N/g' *.xml
perl -pi -e 's/\&#x4F;/O/g' *.xml
perl -pi -e 's/\&#x50;/P/g' *.xml
perl -pi -e 's/\&#x51;/Q/g' *.xml
perl -pi -e 's/\&#x52;/R/g' *.xml
perl -pi -e 's/\&#x53;/S/g' *.xml
perl -pi -e 's/\&#x54;/T/g' *.xml
perl -pi -e 's/\&#x55;/U/g' *.xml
perl -pi -e 's/\&#x56;/V/g' *.xml
perl -pi -e 's/\&#x57;/W/g' *.xml
perl -pi -e 's/\&#x58;/x/g' *.xml
perl -pi -e 's/\&#x59;/Y/g' *.xml
perl -pi -e 's/\&#x5A;/Z/g' *.xml
perl -pi -e 's/\&#x5B;/\[/g' *.xml
perl -pi -e 's/\&#x5C;/\\/g' *.xml
perl -pi -e 's/\&#x5D;/\]/g' *.xml
perl -pi -e 's/\&#x5E;/\^/g' *.xml
perl -pi -e 's/\&#x5F;/_/g' *.xml
perl -pi -e 's/\&#x61;/a/g' *.xml
perl -pi -e 's/\&#x62;/b/g' *.xml
perl -pi -e 's/\&#x63;/c/g' *.xml
perl -pi -e 's/\&#x64;/d/g' *.xml
perl -pi -e 's/\&#x65;/e/g' *.xml
perl -pi -e 's/\&#x66;/f/g' *.xml
perl -pi -e 's/\&#x67;/g/g' *.xml
perl -pi -e 's/\&#x68;/h/g' *.xml
perl -pi -e 's/\&#x69;/i/g' *.xml
perl -pi -e 's/\&#x6A;/j/g' *.xml
perl -pi -e 's/\&#x6B;/k/g' *.xml
perl -pi -e 's/\&#x6C;/l/g' *.xml
perl -pi -e 's/\&#x6D;/m/g' *.xml
perl -pi -e 's/\&#x6E;/n/g' *.xml
perl -pi -e 's/\&#x6F;/o/g' *.xml
perl -pi -e 's/\&#x70;/p/g' *.xml
perl -pi -e 's/\&#x71;/q/g' *.xml
perl -pi -e 's/\&#x72;/r/g' *.xml
perl -pi -e 's/\&#x73;/s/g' *.xml
perl -pi -e 's/\&#x74;/t/g' *.xml
perl -pi -e 's/\&#x75;/u/g' *.xml
perl -pi -e 's/\&#x76;/v/g' *.xml
perl -pi -e 's/\&#x77;/w/g' *.xml
perl -pi -e 's/\&#x78;/x/g' *.xml
perl -pi -e 's/\&#x79;/y/g' *.xml
perl -pi -e 's/\&#x7A;/z/g' *.xml
perl -pi -e 's/\&#x7B;/\{/g' *.xml
perl -pi -e 's/\&#x7C;/\|/g' *.xml
perl -pi -e 's/\&#x7D;/\}/g' *.xml
perl -pi -e 's/\&#x7E;/~/g' *.xml
perl -pi -e 's/\&#x7F;//g' *.xml
perl -pi -e 's/\&#xA0;//g' *.xml
perl -pi -e 's/\&#xA1;/¡/g' *.xml
perl -pi -e 's/\&#xA2;/¢/g' *.xml
perl -pi -e 's/\&#xA3;/£/g' *.xml
perl -pi -e 's/\&#xA4;/¤/g' *.xml
perl -pi -e 's/\&#xA5;/¥/g' *.xml
perl -pi -e 's/\&#xA6;/\¦/g' *.xml
perl -pi -e 's/\&#xA7;/§/g' *.xml
perl -pi -e 's/\&#xA8;/¨/g' *.xml
perl -pi -e 's/\&#xA9;/©/g' *.xml
perl -pi -e 's/\&#xAA;/ª/g' *.xml
perl -pi -e 's/\&#xAB;/«/g' *.xml
perl -pi -e 's/\&#xAC;/¬/g' *.xml
perl -pi -e 's/\&#xAD;/­/g' *.xml
perl -pi -e 's/\&#xAE;/®/g' *.xml
perl -pi -e 's/\&#xAF;/¯/g' *.xml
perl -pi -e 's/\&#xB0;/°/g' *.xml
perl -pi -e 's/\&#xB1;/±/g' *.xml
perl -pi -e 's/\&#xB2;/²/g' *.xml
perl -pi -e 's/\&#xB3;/³/g' *.xml
perl -pi -e 's/\&#xB4;/\´/g' *.xml
perl -pi -e 's/\&#xB5;/µ/g' *.xml
perl -pi -e 's/\&#xB6;/¶/g' *.xml
perl -pi -e 's/\&#xB7;/·/g' *.xml
perl -pi -e 's/\&#xB8;/¸/g' *.xml
perl -pi -e 's/\&#xB9;/¹/g' *.xml
perl -pi -e 's/\&#xBA;/º/g' *.xml
perl -pi -e 's/\&#xBB;/»/g' *.xml
perl -pi -e 's/\&#xBC;/¼/g' *.xml
perl -pi -e 's/\&#xBD;/½/g' *.xml
perl -pi -e 's/\&#xBE;/¾/g' *.xml
perl -pi -e 's/\&#xBF;/¿/g' *.xml
perl -pi -e 's/\&#xC0;/À/g' *.xml
perl -pi -e 's/\&#xC1;/Á/g' *.xml
perl -pi -e 's/\&#xC2;/Â/g' *.xml
perl -pi -e 's/\&#xC3;/Ã/g' *.xml
perl -pi -e 's/\&#xC4;/Ä/g' *.xml
perl -pi -e 's/\&#xC5;/Å/g' *.xml
perl -pi -e 's/\&#xC6;/Æ/g' *.xml
perl -pi -e 's/\&#xC7;/Ç/g' *.xml
perl -pi -e 's/\&#xC8;/È/g' *.xml
perl -pi -e 's/\&#xC9;/É/g' *.xml
perl -pi -e 's/\&#xCA;/Ê/g' *.xml
perl -pi -e 's/\&#xCB;/Ë/g' *.xml
perl -pi -e 's/\&#xCC;/Ì/g' *.xml
perl -pi -e 's/\&#xCD;/Í/g' *.xml
perl -pi -e 's/\&#xCE;/Î/g' *.xml
perl -pi -e 's/\&#xCF;/Ï/g' *.xml
perl -pi -e 's/\&#xD0;/Ð/g' *.xml
perl -pi -e 's/\&#xD1;/Ñ/g' *.xml
perl -pi -e 's/\&#xD2;/Ò/g' *.xml
perl -pi -e 's/\&#xD3;/Ó/g' *.xml
perl -pi -e 's/\&#xD4;/Ô/g' *.xml
perl -pi -e 's/\&#xD5;/Õ/g' *.xml
perl -pi -e 's/\&#xD6;/Ö/g' *.xml
perl -pi -e 's/\&#xD7;/×/g' *.xml
perl -pi -e 's/\&#xD8;/Ø/g' *.xml
perl -pi -e 's/\&#xD9;/Ù/g' *.xml
perl -pi -e 's/\&#xDA;/Ú/g' *.xml
perl -pi -e 's/\&#xDB;/Û/g' *.xml
perl -pi -e 's/\&#xDC;/Ü/g' *.xml
perl -pi -e 's/\&#xDD;/Ý/g' *.xml
perl -pi -e 's/\&#xDE;/Þ/g' *.xml
perl -pi -e 's/\&#xDF;/ß/g' *.xml
perl -pi -e 's/\&#xE0;/à/g' *.xml
perl -pi -e 's/\&#xE1;/á/g' *.xml
perl -pi -e 's/\&#xE2;/â/g' *.xml
perl -pi -e 's/\&#xE3;/ã/g' *.xml
perl -pi -e 's/\&#xE4;/ä/g' *.xml
perl -pi -e 's/\&#xE5;/å/g' *.xml
perl -pi -e 's/\&#xE6;/æ/g' *.xml
perl -pi -e 's/\&#xE7;/ç/g' *.xml
perl -pi -e 's/\&#xE8;/è/g' *.xml
perl -pi -e 's/\&#xE9;/é/g' *.xml
perl -pi -e 's/\&#xEA;/ê/g' *.xml
perl -pi -e 's/\&#xEB;/ë/g' *.xml
perl -pi -e 's/\&#xEC;/ì/g' *.xml
perl -pi -e 's/\&#xED;/í/g' *.xml
perl -pi -e 's/\&#xEE;/î/g' *.xml
perl -pi -e 's/\&#xEF;/ï/g' *.xml
perl -pi -e 's/\&#xF0;/ð/g' *.xml
perl -pi -e 's/\&#xF1;/ñ/g' *.xml
perl -pi -e 's/\&#xF2;/ò/g' *.xml
perl -pi -e 's/\&#xF3;/ó/g' *.xml
perl -pi -e 's/\&#xF4;/ô/g' *.xml
perl -pi -e 's/\&#xF5;/õ/g' *.xml
perl -pi -e 's/\&#xF6;/ö/g' *.xml
perl -pi -e 's/\&#xF7;/÷/g' *.xml
perl -pi -e 's/\&#xF8;/ø/g' *.xml
perl -pi -e 's/\&#xF9;/ù/g' *.xml
perl -pi -e 's/\&#xFA;/ú/g' *.xml
perl -pi -e 's/\&#xFB;/û/g' *.xml
perl -pi -e 's/\&#xFC;/ü/g' *.xml
perl -pi -e 's/\&#xFD;/ý/g' *.xml
perl -pi -e 's/\&#xFE;/þ/g' *.xml
perl -pi -e 's/\&#xFF;/ÿ/g' *.xml
perl -pi -e 's/\&#x152;/Œ/g' *.xml
perl -pi -e 's/\&#x153;/œ/g' *.xml
perl -pi -e 's/\&#x160;/Š/g' *.xml
perl -pi -e 's/\&#x161;/š/g' *.xml
perl -pi -e 's/\&#x178;/Ÿ/g' *.xml
perl -pi -e 's/\&#x192;/ƒ/g' *.xml
perl -pi -e 's/\&#x2013;/–/g' *.xml
perl -pi -e 's/\&#x2014;/—/g' *.xml
perl -pi -e 's/\&#x2018;/\‘/g' *.xml
perl -pi -e 's/\&#x2019;/\’/g' *.xml
perl -pi -e 's/\&#x201A;/‚/g' *.xml
perl -pi -e 's/\&#x201C;/\“/g' *.xml
perl -pi -e 's/\&#x201D;/\”/g' *.xml
perl -pi -e 's/\&#x201E;/„/g' *.xml
perl -pi -e 's/\&#x2020;/†/g' *.xml
perl -pi -e 's/\&#x2021;/‡/g' *.xml
perl -pi -e 's/\&#x2022;/•/g' *.xml
perl -pi -e 's/\&#x2026;/…/g' *.xml
perl -pi -e 's/\&#x2030;/‰/g' *.xml
perl -pi -e 's/\&#x20AC;/€/g' *.xml
perl -pi -e 's/\&#x2122;/™/g' *.xml
