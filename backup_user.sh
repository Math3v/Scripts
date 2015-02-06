#!/bin/bash
# Backup /home/`whoami` directory
# Author: Matej Minarik

# Uncomment for debug
set -x

# Variable definitions
SRC_DIR=/home/`whoami`
TMP_DIR=/tmp/`whoami`
DST_DIR=/home/`whoami`

mkdir $TMP_DIR

if [ -d $SRC_DIR ]; then
  cp -r $SRC_DIR $TMP_DIR
fi

touch $DST_DIR/backup_`whoami`_`date +%F`.tar.gz
tar -pPczf $DST_DIR/backup_`whoami`_`date +%F`.tar.gz $TMP_DIR

# Clean temporary files and directories
rm -rf $TMP_DIR
