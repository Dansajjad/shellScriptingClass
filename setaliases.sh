#!/bin/bash
#
# this file is called setaliases.sh
#


# Create a function library script which contains any functions and aliases you need for this assignment and make use of them in your main script.

function logCustomMessage() {
	echo ">>>>>>: $1";
}

# Create a 'cleanup' function which will simply output a nice message that you're cleaning things up (you don't need it to actually do any cleanup since we're not making a mess)

function cleanup() {
	echo 'Please wait while we cleanup'
	counter=5
	while [ $counter != 0 ]; do
		echo "...$counter";
		let counter=counter-1;
	done
	echo 'All done'
}

# Create a function that takes 3 parameters.  
	# 1st is a function to call, 
	# 2nd is the variable name to set to the output of that function call
	# 3rd variable is the parameter(s) to the function. (i'd call mine "setval"  and I'd use it like this "setval thisfunc thisvar thisfuncparam") (see this  (Links to an external site.)Links to an external site.for help on how to do this)

function setVal () {
	thisFunc=$1;
	thisVar=$2;
	thisFuncParam=$3;

	thisVar=$($thisFunc $thisFuncParam);
	# that=$($thisFunc $thisFuncParam);
}


# Create a function that will output the extension of a file name (i.e. if given "log.txt", it will return "txt") (there are lots of ways to split the string, look into the cut command or tldp's string-manimupation page (Links to an external site.)Links to an external site. )
function getExtension() {
	# extension=`echo "$1" | cut -d'.' -f2`
	fullFileName=$1;
	extension="${fullFileName##*.}"
	echo $extension;
}


# Create a function that will output the base name of a file name (i.e. if given "log.txt", it will return "log") -- use a different method of getting the part of the string you want than was used in the get extension function.
function getBaseName() {
	fullFileName=$1
	baseName="${fullFileName%.*}"
	echo $baseName;
}



# Create at least 4 aliases total and use each of them somewhere in your scripts. you could make one that does a long listing (ls -l) and one which calls that on all files to mimic "ls -l -a", or do whatever seems fun for you.
# Create a(n) alias(es) which execute some of your common commands, including any combination of functions you may find interesting.
alias bn='getBaseName';
alias ext='getExtension';

alias getip="ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'"
alias removeNewLine="tr -d '\n'"
# Make at least one alias that calls another alias.
alias copy_ip="logCustomMessage 'Copying IP'; getip | removeNewLine | pbcopy; logCustomMessage 'You IP is: $(pbpaste)'" # calls another alias, calls common commands

# Specifically, make one alias called "setthat" which uses setval to set a variable called "that" ..  "setthat somefunc". 
alias setthat="setVal logCustomMessage that .....: ; logCustomMessage 'New prefix for logging set' "  # I COULD NOT FIGURE THIS OUT







