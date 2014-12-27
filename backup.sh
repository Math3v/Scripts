#!/bin/bash
# Backup selected folders

WD="/home/matej"	#Working directory
cd $WD

touch matej_`date +%d%m%Y`.tar.gz

echo "Creating archive..."
tar czf matej_`date +%d%m%Y`_important.tar.gz bin/ Documents/ Pictures/ .thunderbird/
echo "Exiting..."
#tar cvzf matej_24112014.tar.gz bin/ .thunderbird/ Documents/ Pictures/ vpworkspace/ workspace/ 
