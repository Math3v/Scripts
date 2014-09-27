#!/bin/bash
#
# This script is to make a .tar.gz folder to backup dropbox folder.
# Matej Minarik (C) backup_dropbox.sh
#

dropbox="/home/matej/Dropbox/FIIT_INFO_2011"   # Dropbox directory to backup
gz="dropbox_backup_`date +%d%m%y`.tar.gz"      # .gz file
temp="/tmp/temp_drop" 			       # temporary folder in /tmp 
path="/home/matej"			       # path/to/save/.tar.gz file
logfile="/home/matej/.log/dropbox_backup.log"  # .log file to log all backups
errfile="/home/matej/.log/dropbox_backup.err"  # .err file to log all errors
time="[`date +%H:%M:%S`]:" 		       # Time variable to .log and .err file

# Log
if [ ! -f $logfile ]; then                     # the first time the log file wont exist
	touch $logfile;
fi
if [ ! -f $errfile ]; then		       # the first time the err file wont exist
	touch $errfile;
fi 
echo "$time Making backup of '$dropbox' to '$path' with '$temp' temp file at `date`." >> $logfile # log message
echo "$time Error log from backup_dropbox.sh from `date`" >> $errfile                             # err message

# Redirect stdout(1) and stderr(2) to $logfile
#exec 6>&1 # save fd of stdout(1)
#exec 7>&2 # save fd of stderr(2)
#exec 1>> $logfile
#exec 2>> $errfile

# Use to resore: exec 1>&6 6>&-
#                exec 2>&7 7&-

#
# Creating $temp directory to store all files temporary.
#
mkdir $temp
if [ ! -d $temp ]; then 
	echo "$time Can\`t create '$temp'" >> $logfile
	exit 1; 
fi


#
# Copying files to $temp directory.
# 'cp -r' was adding extra backslashes before space characters 
# Below is my solution of this problem, but it is a FAIL solution. Need to be repaired, soon !!!
# This solution works fine, but need to be checked. .log and .err files are fine, output is 
# correct.
# 
# Drobox is now renamed to FIIT_INFO_2011, need to check log files, if it is correct.
# This problem remains, I want to know the answer.
# 

# unset dropbox
# dropbox="/home/matej/Dropbox/FIIT INFO 2011"
echo "$time Copying '$dropbox' to '$temp' direcrory" >> $logfile
cp -r "$dropbox" $temp
echo "$time Copying finished." >> $logfile
# unset dropbox
# dropbox="/home/matej/Dropbox/FIIT\ INFO\ 2011"

#
# Making a $gz .tar.gz file in $path.
#
echo "$time Making a '$path/$gz' file" >> $logfile
touch $path/$gz
if [ ! -f $path/$gz ]; then
	 # If $path/$gz file cannot be created.
	echo "$time Can\`t make '$path/$gz' file." >> $logfile
	echo "$time Removing '$temp' folder." >> $logfile
	rm -r $temp
	if [ -d $temp ]; then
		echo "$time Can\`t remove '$temp' file. Exiting." >> $logfile
		exit 1;
	fi
	echo "$time Exiting now." >> $logfile
	exit 1;
fi

#
# Tar .tar.gz file. 
#
/bin/tar -czf $path/$gz $temp
echo "$time '$gz' have been created." >> $logfile

#
# Removing temporary folder.
#
echo "$time Removing '$temp' folder." >> $logfile
rm -r $temp
if [ ! -d $temp ]; then 
	echo "$time '$temp' have been removed."; >> $logfile
else 
	echo "$time '$temp' cannot be removed. Exiting." >> $logfile
exit 1
fi

echo "$time Successful exiting of the backup script." >> $logfile

exit 0
