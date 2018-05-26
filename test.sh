#!/bin/bash
# set -x

# sayword () {
#   echo $1
# }
# sayword $2


alias listdir='ls';
alias sayme='echo me';

function test1() {
	alias sayIt='echo meeeeee2'
	sayIt;
}

echo '>>>>>>>>>>>>>> Running functions'

test1;
# test1;

echo '>>>>>>>>>>>>>> Outside'
