#!/bin/bash
# Count lines of java files in specific directory
# Author: Matej Minarik

echo `find $1 -name "*.java" -exec wc -l {} \; | cut -d " " -f 1 | tr -s "\n" "+"`0 | bc
