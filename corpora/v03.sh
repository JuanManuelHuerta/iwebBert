
grep "^<p>"   ../wikipedia/enwiki-20181001-corpus.xml | \
    perl -ape 's/\>/\> /g' |\
    perl -ape 's/\</ \</g'|  perl -ape 's/\<[^\>]*link[^\<]*\>//g' |\
    perl -ape 's/\<\/*h\>//g' |\
    perl -ape 's/\<math\>.*<\/math\>/ /g' |\
    perl -ape 's/http.{?}\:\/[^ +]/ /g' |\
    perl -ape 's/\([^\)]*\)/ /g' | grep -vx '.\{,60\}'| head -2000000 > tmp.txt

perl -ape 's/\<\/*p\>/ /g' tmp.txt | perl -ape 's/ +([\,\.\;\?\!\-]) +/$1 /g' | perl -ape 's/ +/ /g' |  head -2000000 > wikipedia.v03.txt

#rm tmp.txt

