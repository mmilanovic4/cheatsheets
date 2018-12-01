#!/bin/bash
#
# Bourne Again Shell 102

# getopt парсовање аргумената
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

# Путање
echo $(basename ~/.bashrc)
echo $(realpath ~/.bashrc)

# Тестирање да ли фајл постоји
if [ -f ~/.bashrc ]; then
	echo 'Фајл постоји'
fi

if [ -d ~/Desktop ]; then
	echo 'Директоријум постоји'
fi

# FOR петља кроз све *.sh фајлове у активном директоријуму
for f in *.sh;
do
	echo $(realpath $f)
done

# CTRL + C
trap "printf \"\nSIGINT примљен. Прекидам извршавање скрипта...\n\"; exit 1" 2

while true
do
	echo "!"
	sleep 1
done
