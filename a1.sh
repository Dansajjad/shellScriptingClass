#!/bin/bash



string='Old string';

echo '>>>>> RUNNING a1.sh';

function saySomething() {
	echo ......
	echo "$1";
}

function testSetVal () {
	echo 'BEFORE';
	thisFunc=$1; # function
	thisVar=$2; # the variable
	thisFuncParam=$3; # param to the fn

	# string="$($thisFunc $thisFuncParam)";
	$($thisVar=$thisFunc $thisFuncParam);

	# $($thisFunc $thisFuncParam) | $thisVar;

	# echo "AFTER...: $thisVar";
	# echo 'string: $string';
}
