#!/bin/bash
# Extract slide from pdf and add it to another
# Author: Matej Minarik

SRC=$1			# Source pdf file
NUM=$2			# NO. of slide to extract
DST=$3			# Destination pdf file

TMP1="tmp.pdf"
TMP2="tmp2.pdf"

if [[ "$#" -ne 3 ]];
then
  echo "Usage: $0 <source-pdf-file> <which-slide> <destination-pdf-file>"
  echo "$0 (C) Matej Minarik"
  exit 0
fi

which pdftk
if [[ $? != 0 ]];
then
  echo "Error: pdftk is not installed"
  exit 1
fi

which pdfunite
if [[ $? != 0 ]];
then
  echo "Error: pdfunite is not installed"
  exit 1
fi

pdftk A=$SRC cat A$NUM output $TMP1
pdfunite $DST $TMP1 $TMP2

mv $TMP2 $DST
rm $TMP1
