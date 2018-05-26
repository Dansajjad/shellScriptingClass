#!/bin/bash

set -o errexit




# $0: name of script
# $#: # of params passed
# $*: expand all params

echo "My program name is $0 and you passed $# parameters which are $*";



# I'm using an indirect reference to the variable by using the "eval" command to evaluate a string as bash.   The string passed to eval is "echo $1"  since the first $ is escaped, and the 2nd one isn't the 2nd $i will get expanded into 1, 2, 3, etc.   Eval will then evaluate the line "echo $1" which outputs the value of the first parameter.

for (( i=1; i<=$#; i++ )); 
	do
		echo -n "Parameter $i is "; eval echo \$$i;
done 



# $$ is the process id of the current running process.   If you put that in a script, it will be the PID of the script which should change every time
echo $$



# Indirect variable references
var=23
echo "\$var  = $var"
echo "\$\$var = $$var"
echo "\\\$\$var = \$$var"


a=letter_of_alphabet
letter_of_alphabet=z

# direct reference
echo "a = $a"

#indirect reference
  eval a=\$$a
# ^^^        Forcing an eval(uation), and ...
#        ^   Escaping the first $ ...
# ------------------------------------------------------------------------
# The 'eval' forces an update of $a, sets it to the updated value of \$$a.
# So, we see why 'eval' so often shows up in indirect reference notation.
# ------------------------------------------------------------------------

echo "Now a = $a"



# New way to indirect reference
c=letter
letter=x

echo "c = $c"; # direct reference
echo  "Now c = ${!c}" # indirect reference


echo ">>>><<<<<<"



echo $#

if [ "$#" -gt "5" ]; then
 set -- "$1" "$2" "$3" "$4"
fi

echo $# $*




echo "Type the year that you want to check (4 digits), followed by [ENTER]:"

while read year; do
	if (( 
		("$year" % 400 == "0") || 
		(("$year" % 4 == "0") && ("$year" %100 != "0")) 
	)); then
	echo "$year is a leap year."
else 
	echo "$year is not a leap year"
fi

done


# OLDER WORK - UNCOMMENT IF NEEDED



# echo "hello world"

# # 1 = false 
# # 0 = true

# # find temp in current directory
# test -e temp
# echo $?
# # find Documents in current directory
# test -e Documents
# echo $?

# test -e test2
# echo $?


# # Display File size 
# echo ">>> Find size of Documents if it exists" 


# if [ -e Documents ]; then
# 	echo "Size of Documents: $(stat -f%z Documents)"
# fi


# # Find folder called Documents
# echo ">>> Find folder called Documents"
 
# if [ -e Documents ]
# then
# 	echo "Found documents"
# else
# 	echo "Documents not Found"
# fi

# if [ -e temp ]
# then
# 	echo "Temp found"
# else 
# 	echo "Temp not found"
# fi

# if [ $(id -u) = "0" ]
# then 
# 	echo "superuser"
# else
# 	echo "not superueser"
# fi


# echo -n "Enter a number b/w 1 & 3 inclusive > "
# read character

# if [ "$character" = "1" ]; then
# 	echo "You entered 1"
# else 
# 	if [ "$character" = "2" ]; then
# 		echo "you entered 2"
# 	else 
# 		if [ "$character" = "3" ]; then
# 			echo "you entered 3"
# 		else 
# 			echo "You did not enter a #"
# 			echo "b/w 1 & 3"
# 		fi
# 	fi
# fi


# echo ">>> If Else <10, 50 - 100, > 500" 
# echo -n "Enter a number> "
# read character

# if [ "$character" -lt  "10" ]; then
# 	echo "number < 10"
# elif [ "$character" -gt "50" ] && [ "$character" -lt "100" ]; then 
# 	echo "number between 50 and 100"
# elif [ "$character" -gt "500" ]; then
# 	echo "number > 500"
# fi 


# echo ">>> If Else using case statements"
# echo -n "Enter a number > "
# read character

# case $character in
# 	([0-9]) echo "less than 10";;
# 	(5[0-9] | 6[0-9] | 7[0-9] | 8[0-9] | 9[0-9]) echo "between 50 and 100";;
# esac


# echo ">>> List all directories in the folder"

# for fn in *; do
# 	if [ -d "$fn" ]; then 
# 		echo "$fn is a directory"
# 	elif [ -f "$fn" ]; then 
# 		echo "$fn is a file"
# 	fi
# done


# echo ">>> Adding 7 until 37"
# for ((i=7; i<=37; i+=7)) 
# 	do
# 		echo $i
# 	done


	
# echo ">>> Until number is 10"
# echo -n ">>> Enter a number > "
# read character

# until [ "$character" -eq "10" ]; do
# 	read -r -p "Enter a number > " character
# done

# echo ">>> Keep asking until yes"

# while true;
# do
#     read -r -p "Are you feeling well. Enter yes or no > " answer   
#     if [[ $answer -ne 'yes' ]]
#     then
#         echo 'Please enter again'
#     else
#         exit 0
#     fi
# done


# exit 0
