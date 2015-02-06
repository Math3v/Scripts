#!/bin/bash
# Script to connect to specific wireless network
# Run as root
# THIS SCRIPT IS NOT TESTED!

# Uncomment to debug
#set -x

echo "Connecting to $1 ..."

if [ -x /sbin/iwconfig ]
then
  /sbin/iwconfig wlan0 essid $1
fi

if [ -x /sbin/dhclient ]
then
  /sbin/dhclient wlan0
fi

echo "Exiting ..."
