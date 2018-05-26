#!/bin/bash


getListOfFilesInDir() {
	cd $1;
	printf %s\\n *
	cd -;
}


getSizeOfFile() {
	for i; do
		echo "Size of file $i: $(stat -f%z $i)"
	done
}


$1 ${@:2}

