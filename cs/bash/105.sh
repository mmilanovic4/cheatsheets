#!/bin/bash
#
# Bourne Again Shell 105

A=0
B=0
C=0

while getopts a:bc arg;
do
	case $arg in
		a)
			A=$OPTARG
		;;
		b)
			B=1
		;;
		c)
			C=1
		;;
		\?)
			printf "Аргумент на позицији %s није валидан.\n" $OPTIND >&2
		;;
	esac
done

# Употреба: -a 2 -b -c | -a 2 -bc | -bca 2

printf "A: %s\n" $A
printf "B: %s\n" $B
printf "C: %s\n" $C
