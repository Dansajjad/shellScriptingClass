# echo ">>> Type the name of file or directory, followed by [ENTER]:"
# read fn

# echo ">>> You entered $fn"

listAllFiles() {

	echo $1;

	echo "running function listName. Args: $1"
	if [ -d "$fn" ]; then 
		echo "$fn is a directory";
		# echo $fn >> $defaultDirFileName;
	elif [ -f "$fn" ]; then 
		echo "$fn is a file";
		# echo $fn >> $defaultFilesName;
	fi	
}

# listAllFiles $fn;


listFileSizes() {
	echo '>>>' $1;
	for i; do
		echo "Size of file: $(stat -f%z $i)"
	done
} 


# defaultDirFileName='dirs.txt';
# defaultFilesName='files.txt';







# echo ">>> List all directories in the folder $fn"

# listName() {
# 	echo '>>>> ' $1;
# 	if [ -d "$fn" ]; then 
# 		echo "$fn is a directory"
# 	elif [ -f "$fn" ]; then 
# 		echo "$fn is a file"
# 	fi
# }


# listName $PWD;


# # recurser() {
# # 	folderx=$PWD;

# # 	for fn in *; do
# # 		if [ -d "$fn" ]; then 
# # 			echo "$fn is a directory"
# # 			echo $folderx'/'$defaultDirFileName
# # 			# echo $fn >> $folderx"/"$defaultDirFileName
# # 			cd $fn;
# # 			recurser "$fn";

# # 		elif [ -f "$fn" ]; then 
# # 			echo "$fn is a file"
# # 		fi
# # 	done
# # }

# # recurser "$fn";
	


# # get f

# # arguments: 
# 	# folder path
# 	# options 
# # option -d to change name to dirs.list
# # option --files-list to change name to files.list


# # run cmd 
# # get user entered folder
# # loop over folder content
# 	# 



