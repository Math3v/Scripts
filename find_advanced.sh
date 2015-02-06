#!/bin/bash
# Find specific text in .h and .cpp files
# Author: Matej Minarik

find . \( -iname '*.h' -or -iname '*.cpp' \) -exec grep -iEH $1 {} \;
