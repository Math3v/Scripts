#!/bin/bash
# Script to update grive folder
# Matej Minarik

# set -x 

# While X server and internet connection start successfully
sleep 45

GRIVE_FOLDER=/home/matej/grive
LOGFILE=/home/matej/.log/grive.log

if [ ! -f $LOGFILE ];
then
	touch $LOGFILE
fi

# Redirect stdout and stderr to $LOGFILE
#exec 6>&1        # save fd of stdout
#exec 7>&2        # save fd of stderr
#exec 1 >> $LOGFILE
#exec 2 >> $LOGFILE

echo "'$0' starting at `date`" >> $LOGFILE

cd $GRIVE_FOLDER

if [ ! $? -eq 0 ];
then
	echo "Cannot reach '$GRIVE_FOLDER'" >> $LOGFILE
	echo "Exiting now" >> $LOGFILE
	exit 1
fi

grive

if [ ! $? -eq 0 ];
then
	echo "Cannot execute grive command" >> $LOGFILE
	echo "Exiting now" >> $LOGFILE
	exit 1
fi

echo "'$0' successful exiting at `date`" >> $LOGFILE
exit 0
