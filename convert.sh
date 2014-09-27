#!/bin/bash


# set -x 
# encodings=( utf-16 utf-8 iso-8859-1 iso-8859-2 iso-8859-5 us-ascii utf-16be utf-16le )

encodings=( `iconv -l | tr -s "," " " | tr -d "//"` )

echo ${encodings[@]}

for encoding in ${encodings[@]}; do
	# preconv -e ISO-8859-2 -D $encoding get_the_gringo.srt > $encoding.srt
	# enca -L czech -x $encoding get_the_gringo.srt > $encoding.srt
	iconv -f ISO-8859-2 -t $encoding get_the_gringo.srt > $encoding.srt
done
