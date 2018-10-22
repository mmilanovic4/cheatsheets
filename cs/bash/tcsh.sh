#!/usr/bin/tcsh
#
# Разлике између Bash и tcsh љуски

# Кориснички улаз
echo -n "First name: "
set fn = "$<"
echo -n "Last name: "
set ln = "$<"
echo "$fn $ln"

# Променљиве
set fn = "Милош"
set ln = "Милановић"
echo "$fn $ln"

set year_of_birth = 1993
set current_year = `date +%Y`

@ years = $current_year - $year_of_birth
echo "Година: $years"

# Низови
set fruits = ("Бресква" "Јабука" "Банана")
echo $fruits[1]
echo $fruits[2]
echo $fruits[3]

echo $fruits
echo $fruits[2-3]
echo "Величина низа: $#fruits"

# Додељивање вредности аритметичке операције променљивој
set x = 1
@ x++
echo $x
@ y = (4 > 6)
echo $y

unset x
if ( $?x != 0 ) then
	echo "x: $x"
else
	echo "x није дефинисан."
endif

echo "#1"
echo "#2"

goto third_block
exit

third_block:
echo "#3"

onintr close

while ( 1 )
	echo "!"
	sleep 1
end

close:
echo "Крај програма..."
