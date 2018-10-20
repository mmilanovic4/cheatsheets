#!/bin/bash
#
# Bourne Again Shell 103

# CTRL + C
trap "printf \"\nSIGINT примљен. Прекидам извршавање скрипта...\n\"; exit 1" 2

while true
do
	echo "!"
	sleep 1
done
