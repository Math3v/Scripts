#!/bin/bash
# Backup /home/`whoami` directory
# author: Matej Minarik

# Uncomment for debug
set -x

#BCKUP_DIR=/home/`whoami`
#TMP_DIR=/tmp/`whoami`
#DST_DIR=/home/`whoami`

BCKUP_DIR=/home/matej/test
TMP_DIR=/tmp/test
DST_DIR=/home/matej

mkdir $TMP_DIR

if [ -d $BCKUP_DIR ]; then
  cp -r $BCKUP_DIR $TMP_DIR
fi

touch $DST_DIR/backup_`whoami`_`date +%F`.tar.gz
tar -pPczf $DST_DIR/backup_`whoami`_`date +%F`.tar.gz $TMP_DIR

# Clean temporary files and directories
rm -rf $TMP_DIR
