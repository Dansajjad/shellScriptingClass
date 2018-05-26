#! /bin/bash
#
# this file is called 'dosomething.sh'
#


echo 'executing file dosomething.sh';

source setaliases.sh; # source the setaliases.sh script

debug=true;
that="change me";






# Based on input from the user, enable or disable debugging (you can also make this a command line argument instead of user input).
echo "Do you want to turn on debugging? Enter 'yes' or 'no' followed by [ENTER]:"
read debugFlag
echo ">>> You entered $debugFlag"


if [ "$debugFlag" = "yes" ]; then
	# turn ON debug mode
	echo 'Turning on debugging';
	set -x
elif [ "$debugFlag" = "no" ]; then
	echo 'Turning off debugging';
	# turn OFF debug mode
	set +x
fi


# Use a trap to output some message before the program exits when a user hits Control-C
trap trapCtrlC SIGINT # trap ctrl-c and call trapCtrlC()

function trapCtrlC() {
    echo ".... Trapped Ctrl-c";
}


# Use a trap to execute your 'cleanup' function from your function library when the program exits
trap cleanup SIGINT