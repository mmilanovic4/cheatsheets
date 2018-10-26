##!/bin/bash
#
# Stream editor 101

printf "Сви редови који садрже име \"Милош\":\n"
sed -n '/Милош/ p' data.txt

echo
printf "Сви редови између 1 и 3 (укључујући 1 и 3):\n"
sed -n '1,3 p' data.txt

echo
printf "Прве две линије фајла:\n"
sed '2 q' data.txt

echo
printf "[APPEND] Додајемо нови запис након петог реда:\n"
sed '5 a Никола Тесла' data.txt

echo
printf "[INSERT] Убацујемо нови запис испред записа \"Милош Црњански\"\n"
sed '/Црњански/ i Никола Тесла' data.txt

echo
printf "[CHANGE] Мењамо ред са записом \"Милош Црњански\"\n"
sed '/Црњански/ c Иво Андрић' data.txt

echo
printf "[SUBSTITUTE] Мењамо ред са записом \"Милош Црњански\"\n"
sed 's/Милош Црњански/Иво Андрић/g' data.txt

echo
printf "[NEXT] Прескочи трећу линију\n"
sed -n '3 n; p' data.txt

echo
printf "[DELETE] Уколни линије између 1 и 5 (укључујући 1 и 5)\n"
sed -n '1,5 d; p' data.txt

echo
printf "[NOT оператор] Обриши све линије сем треће\n"
sed -n '3!d; p' data.txt

# Додатак: корисне grep наредбе
grep "colo" ~/.vimrc

# Претрага неосетљива на величину слова
grep "Colo" --ignore-case ~/.vimrc
grep "Colo" -i ~/.vimrc

# Рекурзивно греповање
grep "colo nord" --recursive ~/.*rc
grep "colo nord" -r ~/.*rc

# Рекурзивно греповање, укључујући и симболичке линкове
grep "colo nord" -R ~/.*rc

# Број линије
grep "colo" --line-number ~/.vimrc
grep "colo" -n ~/.vimrc

# Регуларни изрази
grep "^colo\ [a-z]+$" --perl-regexp ~/.vimrc
grep "^colo\ [a-z]+$" -P ~/.vimrc
