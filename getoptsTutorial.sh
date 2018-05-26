#!/bin/bash



# 0 - stdin
# 1 - stdout
# 2 - stderr 
# while getopts ":a:" opt; do
# 	case $opt in
# 		a)
# 			echo "-a was triggered, Parameter: $OPTARG" >&2
# 			;;
# 		\?)
# 			echo "Invalid option: -$OPTARG" >&2
# 			exit 1
# 			;;
# 		:)
# 			echo "Option -$OPTARG requires an argument." >&2
# 			exit 1
# 			;;
# 	esac
# done

while getopts ":a:" opt; do
  case $opt in
    a)
      echo "-a was triggered, Parameter: $OPTARG" >&2
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      exit 1
      ;;
  esac
done