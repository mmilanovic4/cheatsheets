#!/bin/bash
#
# Bourne Again Shell 104

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
