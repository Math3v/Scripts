#!/bin/bash
# Matej Minarik
# Delete last first lines in .log files in 
#+/var/log directory

set -x

DIRECTORY="/var/log"
SUFFIX_TO_SEARCH=".log"
NO_OF_LINES_TO_KEEP=1000
NO_OF_LINES_TO_PROCESS_FILE=5000
LOGFILE="/home/matej/.log/delete_logs.log"
TIME="\[`date +%H:%M:%S`\]: "
DEPTH=1

if [ ! -f $LOGFILE ];
then
	touch $LOGFILE
fi

# Logging started
echo "$TIME '$0' started logging" >> $LOGFILE

echo "$TIME Cd to '$DIRECTORY'" >> $LOGFILE
cd $DIRECTORY
if [ ! $? -eq 0 ];
then
	echo "$TIME Cannot cd to '$DIRECTORY'" >> $LOGFILE
	echo "$TIME '$0' exiting now" >> $LOGFILE
	exit 1
fi

# Find all files in current directory with suffix
LOG_FILES=( `find $DIRECTORY -maxdepth $DEPTH -name \"*$SUFFIX_TO_SEARCH\"` )


# Process each of files, rename logfile to logfile.old
# Then tail -n lines to origin file
# Remove .old logfile
for FILE in ${LOG_FILES[@]};
do
	echo "$TIME Proccessing '$FILE' with '`wc -l $FILE`' lines" >> $LOGFILE
	if [ `wc -l $FILE` -gt $NO_OF_LINES_TO_PROCESS_FILE ];
	then
		mv $FILE $FILE.old
		tail -n $NO_OF_LINES_TO_KEEP $FILE.old > $FILE
		rm $FILE.old
	fi
done

