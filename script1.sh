#!/bin/bash

echo ">>> Homework script 1: Test if a directory or file and write to file <<<";

dirTxtFile='dirs.txt';
fileTxtFile='files.txt';

function recurse {
	for i in $1/*; do
		if [[ -f $i ]]; then
			echo "${i:2}"  >> ~/$fileTxtFile # slice off first 2 characters
		elif [[ -d $i ]]; then
			echo "${i:2}" >> ~/$dirTxtFile # slice off first 2 characters
			recurse $i;
		fi
	done
}

# Accept options and change file names
for p in $(seq 1 $#)
do
  case "${!p}" in
  	-d) 
		echo 'argument d'
		p=$((p+1));
		dirTxtFile="${!p}"
		;;
    --files-list)
      p=$((p+1))
      fileTxtFile="${!p}"
      ;;
    *) 
		if [ -d ${!p} ]; then
  			recurse ${!p};
		fi
  esac
done