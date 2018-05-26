#!/bin/bash

echo ">>>> Create a script which sets several variables, and then unsets some of them."

var1='My name is';
var2='Dan';

echo $var1 $var2

echo ">>>> Demonstrate that the variables have been unset."

unset var2;
echo "$var1 $var2 | var2 has been unset";

echo ">>>> Set a few constants."
declare -r MY_FIRST_NAME="DAN";

echo ">>>> Attempt to change the values of the constant variables."
MY_FIRST_NAME="JIM";

echo ">>>> Attempt to unset constants."
unset MY_FIRST_NAME;


# exec "$0"

echo ">>>> CREATING ALIASES <<<<<"

echo ">>> One must use a variable.  use the alias with different values for the variable and demonstrate that changing the variable makes the alias work differently or produce a different result"


alias myAlias1='echo $var3';

var3="Today is sunny";
myAlias1

var3="Tomorrow will be windy";
myAlias1

echo ">>> One alias must use a constant;"
alias showList='ls $lsOptions';
lsOptions='-ltr';
showList


echo ">>> One must use both a constant and a variable."
declare -r RECURSIVE_SORT_BY_SIZE='-RS';
alias listFilesRecursive='ls $RECURSIVE_SORT_BY_SIZE $1';

listFilesRecursive '-ls'



echo ">>>> USING EXEC <<<<<<<<"

echo ">>> Create a file with some text in it."

echo -e "I like cats.\n I like fast cars.\n I swim.\n  The sun is out today.\n It will rain tomorrow.\n" > sampleText.txt


echo ">>> Create a script which uses read to get input from a user in a loop."
echo ">>> Use exec to redirect input from the file with the text in it."

exec < sampleText.txt;

i=0


while [ $i -ne 5 ]; do 
	echo '>>> Enter a sentence';
	read str;
	let "i++";
	echo "$str";
done