#!/bin/bash

# >>>>>>>>>>>>>>>> ASSIGNMENT 05.06.18 with echos for help

# get f

# arguments: 
# 	folder path
# 	options 
# option -d to change name to dirs.list
# option --files-list to change name to files.list


# run cmd 
# get user entered folder
# loop over folder content

# echo Hello $0;

# # folder='folder1'

dirTxtFile='dirs.txt';
fileTxtFile='files.txt';




function recurse {
	echo 'running recurser >>>'
	for i in $1*; do
		if [[ -f $i ]]; then
			echo '>>>1 |' File $i '>>>>' $1 '>>>' ${i##*/};
			# echo $PWD/${i##*/} >> ~/$fileTxtFile
			echo $i >> ~/$fileTxtFile
		elif [[ -d $i ]]; then
			echo '>>>2 |' Dir $i;
			echo '>>>3 |' $PWD;
			# echo $PWD/${i##*/} >> ~/$dirTxtFile
			echo $i >> ~/$dirTxtFile

			recurse $i;
		fi
	done
}

# echo '>>>> FIRST ARG | ' $1;

cd ~ ;
touch dirs.txt;
cd -; 
# recurse $1

echo '>>><<<<<'

# Accept options and change file names
for p in $(seq 1 $#)
do
  echo $p
  echo "${!p}"
  case "${!p}" in
  	-d) 
		echo 'argument d'
		p=$((p+1));
		dirTxtFile="${!p}"
		echo "Filename changed to $dirTxtFile";
		;;
    --files-list)
      p=$((p+1))
      fileTxtFile="${!p}"
      echo "Filename changed to $fileTxtFile";
      ;;
    *) 
		if [ -d ${!p} ]; then
			echo "<<<DIR>> ${!p}";
  			recurse ${!p};
		fi
  esac
done
echo $filename



# shift $((OPTIND-1));

# while getopts "a:b:c"; do 
# 	echo $OPTARG
# done

# while getopt "ad" opt; do
# 	# echo "$1";
# 	case $opt in
# 		a)
# 			echo "-a was triggered!" >&2
# 			;;
# 		d)
# 			echo "-d was triggered!" >&2
# 			;;      
# 		"files-list") 
# 			echo "-files-list was triggered!" >&2
# 			;;  
# 		\?)
# 			echo "Invalid option: -$OPTARG" >&2
# 			;;
# 	esac
# done



# while getopts d:-files-list: param; do 
# case $param in 
# 	d) 
# 		echo '-d is triggered';
# 		echo "$OPTARG"
# 		;;
# 	--files-list)
# 		echo '-d is files-list';
# 		echo "$OPTARG"
# 		;;
# 	*) 
# 		echo 'others triggered'
# 		echo "$OPTARG"
# esac
# done









# for p in $(seq 1 $#)
# do
#   echo '>>>>2 |' $p
#   echo '>>>>3 |' "${!p}"
#   case "${!p}" in
#    -a)
#       echo ">>>>4 argument a"
#       #argument without parameter
#       ;;
#    --filename)
#       p=$((p+1))
#       filename="${!p}"
#       ;;
#   esac
# done
# echo '>>>>5 |' $filename

