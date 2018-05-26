#!/bin/bash

SCRIPT_PATH1="/Users/dansajjad/Documents/test2/script1.sh"; 
SCRIPT_PATH2="/Users/dansajjad/Documents/test2/script2.sh";

# SCRIPT_PATH1=~/script1.sh;
# SCRIPT_PATH2=~/script2.sh;

echo ;

if [ $1 ]; then
	folder=$1;
else 
	folder='.';
fi

source $SCRIPT_PATH1 $folder && source $SCRIPT_PATH2 ~/dirs.txt ~/files.txt


