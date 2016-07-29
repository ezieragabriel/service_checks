#!/bin/bash

echo "Enter name of log file:"
read FILE

if [ -f $FILE ]
then
	LAST=$(tail -1 $FILE)
	case $LAST in
		"OK"*)
			echo "\"OK\""
			exit 0
		;;
		"WARNING"*)
			echo "\"WARNING\""
			exit 1
		;;
		"CRITICAL"*)
			echo "\"CRITICAL\""
			exit 2
		;;
		*)
			echo "\"UNKNOWN\""
			exit 3
		;;
	esac
else
	echo "ERROR: File not found in directory."
	exit 1
fi
