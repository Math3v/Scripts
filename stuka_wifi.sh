#!/bin/bash
# Script to run wifi
# Moved to crontab -e
# Run as root

echo "Waiting ..."
#sleep 15
echo "Connecting ..."

/sbin/iwconfig wlan0 essid "Stuka7"
/sbin/dhclient wlan0

echo "Exiting ..."
exit 0
