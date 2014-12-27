#!/bin/bash


#set -x

FROMF=$1
WHICH=$2
RESULT=$3

pdftk A=$FROMF cat A$WHICH output tmp.pdf

pdfunite $RESULT tmp.pdf tmp2.pdf

mv tmp2.pdf $RESULT

rm tmp.pdf
