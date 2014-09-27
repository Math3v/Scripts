#!/bin/bash
# Script to run wifi
# Moved to crontab -e
# Run as root

echo "Waiting ..."
#sleep 15
echo "Connecting ..."

/sbin/iwconfig wlan0 essid "TP-LINK_A3A415"
/sbin/dhclient wlan0

echo "Exiting ..."
exit 0
