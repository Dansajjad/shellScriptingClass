#!/bin/bash

echo "hello world"

# 1 = false 
# 0 = true

# find temp in current directory
test -e temp
echo $?
# find Documents in current directory
test -e Documents
echo $?

test -e test2
echo $?


# Display File size 
echo ">>> Find size of Documents if it exists" 


if [ -e Documents ]; then
	echo "Size of Documents: $(stat -f%z Documents)"
fi


# Find folder called Documents
echo ">>> Find folder called Documents"
 
if [ -e Documents ]
then
	echo "Found documents"
else
	echo "Documents not Found"
fi

if [ -e temp ]
then
	echo "Temp found"
else 
	echo "Temp not found"
fi

if [ $(id -u) = "0" ]
then 
	echo "superuser"
else
	echo "not superueser"
fi


echo -n "Enter a number b/w 1 & 3 inclusive > "
read character

if [ "$character" = "1" ]; then
	echo "You entered 1"
else 
	if [ "$character" = "2" ]; then
		echo "you entered 2"
	else 
		if [ "$character" = "3" ]; then
			echo "you entered 3"
		else 
			echo "You did not enter a #"
			echo "b/w 1 & 3"
		fi
	fi
fi


echo ">>> If Else <10, 50 - 100, > 500" 
echo -n "Enter a number> "
read character

if [ "$character" -lt  "10" ]; then
	echo "number < 10"
elif [ "$character" -gt "50" ] && [ "$character" -lt "100" ]; then 
	echo "number between 50 and 100"
elif [ "$character" -gt "500" ]; then
	echo "number > 500"
fi 


echo ">>> If Else using case statements"
echo -n "Enter a number > "
read character

case $character in
	([0-9]) echo "less than 10";;
	(5[0-9] | 6[0-9] | 7[0-9] | 8[0-9] | 9[0-9]) echo "between 50 and 100";;
esac


echo ">>> List all directories in the folder"

for fn in *; do
	if [ -d "$fn" ]; then 
		echo "$fn is a directory"
	elif [ -f "$fn" ]; then 
		echo "$fn is a file"
	fi
done


echo ">>> Adding 7 until 37"
for ((i=7; i<=37; i+=7)) 
	do
		echo $i
	done


	
echo ">>> Until number is 10"
echo -n ">>> Enter a number > "
read character

until [ "$character" -eq "10" ]; do
	read -r -p "Enter a number > " character
done

echo ">>> Keep asking until yes"

while true;
do
    read -r -p "Are you feeling well. Enter yes or no > " answer   
    if [[ $answer -ne 'yes' ]]
    then
        echo 'Please enter again'
    else
        exit 0
    fi
done


exit 0
