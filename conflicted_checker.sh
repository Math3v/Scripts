#!/bin/bash
#
# Script to count conflicted copies on Dropbox and send-notify to user
NUMBER=`find /home/matej/Dropbox/FIIT_INFO_2011/ -type f \( -name "*conflicted*" -and -not -name "conflicted.txt" \) | wc -l`

/usr/bin/notify-send -u normal -t 600 "$NUMBER conflicted copies."
