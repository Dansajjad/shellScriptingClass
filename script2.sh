#!/bin/bash
echo "Homework script 2: Output directory stat";

# The second script should 
# read and output the names of directories from the dirs.txt and 
# display the filename and file size (use the stat command) for each file in files.txt



echo "List of Directories"
while IFS='' read -r line || [[ -n "$line" ]]; do
	echo "$(basename $line)"
done < "$1"

echo "Filename & sizes"
while IFS='' read -r line || [[ -n "$line" ]]; do
	echo "Size of $(basename $line): $(stat -f%z $line)"
done < "$2"