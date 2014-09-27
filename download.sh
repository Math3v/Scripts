#!/bin/bash
set -x
#http://lase.ynet.sk/lasesearch.php?hosttype=FTP&dnsName=sadista%2eynet%2esk&path=%2fSerials%2fBig%20Bang%20Theory%5fEN%2fThe%2eBig%2eBang%2eTheory%2eS07%2e720p%20x264%2fThe%2eBig%2eBang%2eTheory%2eS07E15%2e720p%2eHDTV%2eX264%2dDIMENSION%2f#http://lase.ynet.sk/lasesearch.php?hosttype=FTP&dnsName=sadista%2eynet%2esk&path=%2fSerials%2fBig%20Bang%20Theory_EN%2fThe%2eBig%2eBang%2eTheory%2eS07%2e720p%20x264%2fThe%2eBig%2eBang%2eTheory%2eS07E16%2e720p%2eHDTV%2eX264-DIMENSION%2f

for i in {16..23}
do
  URL="ftp://147.175.186.186/Serials/Big%20Bang%20Theory_EN/The.Big.Bang.Theory.S07.720p%20x264/The.Big.Bang.Theory.S07E$i.720p.HDTV.X264-DIMENSION/"
  echo "Downloading $i..."
  echo $URL
  read
  wget -r "$URL"
  read
done
