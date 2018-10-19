#!/bin/bash
#
# Bourne Again SHell 101

# Кориснички улаз
echo -n "First name: "
read fn
echo -n "Last name: "
read ln
echo "$fn $ln"

# Променљиве
fn="Милош"
ln="Милановић"
echo "$fn $ln"

year_of_birth=1993
current_year=$(date +%Y)
printf "Година: %d\n" $(($current_year - $year_of_birth))

# IF-THEN-ELSE кондиционал (стрингови)
if [ "foo" = "bar" ]; then
	echo "1"
else
	echo "2"
fi

# IF-THEN-ELIF-ELSE кондиционал (бројеви)
if [ 1 -eq 5 ]; then
	echo "1"
elif [ 1 -eq 3 ]; then
	echo "2"
else
	echo "3"
fi

# FOR петља
for fruit in "Бресква" "Јабука" "Банана"
do
	echo "$fruit"
done

# Низови
fruits=("Бресква" "Јабука" "Банана")
echo ${fruits[0]}
echo ${fruits[1]}
echo ${fruits[2]}

# WHILE петља
number=0
while [ $number -le 10 ]
do
	number=$(($number + 1))

	if [ $number -lt 2 ]; then
		continue
	fi

	if [ $number -gt 5 ]; then
		break
	fi

	echo "$number"
done

# CASE кондиционал (switch)
echo -n "Унесите A, B или C: "
read letter

case "$letter" in
	A)
		echo "а)"
	;;
	B)
		echo "б)"
	;;
	C)
		echo "ц)"
	;;
	*)
		echo "Нисте унели валидну опцију!"
	;;
esac

# Дугачак текст
echo \
"Поздрав!
Да ли ово ради?
Ок?"

# Алтернатива: HERE документ
grep "foo" <<END
foo
bar
baz
END

# Функције
function hello() {
	echo "Поздрав!"
}
hello

# Специјални параметри
printf "ПИД: %d\n" $$
printf "Фајл: %s\n" $0
printf "Број прослеђених аргумената: %d\n" $#

for arg in $*
do
	echo $arg
done

if [ $# -gt 0 ]; then
	printf "Први аргумент: %s\n" $1
fi
