#!/usr/bin/perl

# UTF-8
use utf8;
binmode(STDOUT, "encoding(UTF-8)");

# Скалари - стрингови
$fn = "Милош";
$ln = "Милановић";

print("Поздрав!\n");
print("Моје име је $fn $ln.\n");
print("Завршио сам ЕТШ \"Никола Тесла\" у Београду.\n");

# Скалари - бројеви
printf("%d\n", 10); # Цео број
printf("%d\n", -10); # Негативан цео број

printf("%.2f\n", 5.2); # Реалан број

printf("%d\n", 10e3); # Научна нотација
printf("%d\n", 0b101); # Бинарни запис
printf("%d\n", 0xff); # Хексадецимални запис

# Вектори - низови
@cities = (
	"Београд",
	"Беч", "Братислава", "Праг", "Дрезден",
	"Рим", "Барселона", "Кан", "Ница", "Монако", "Венеција"
);

printf("Најлепши град: %s\n", $cities[0]);

# FOR петља
foreach $city (@cities) {
	printf("- %s\n", $city);
}

# Вектори - хешеви (речници, асоцијативни низови)
%capitals = ("Србија", "Београд", "Румунија", "Букурешт");
$capitals{"Грчка"} = "Атина";

printf("Главни град Србије: %s.\n", $capitals{"Србија"});

# IF-ELSE кондиционал
if (exists($capitals{"Грчка"})) {
	printf("Главни град Грчке: %s.\n", $capitals{"Грчка"});
} else {
	print("Главни град Грчке: непознато.\n");
}

# IF-ELSIF-ELSE кондиционал
if (1 == 5) {
	print "1\n";
} elsif (4 == 2) {
	print "2\n";
} else {
	print "3\n";
}

# Аритметичке операције
printf("PEMDAS: %d\n", (18 / 6 * 5) - 14 / 7);
printf("Степеновање: %d\n", 5**2);
printf("Остатак: %d\n", 5 % 2);

# Инкрементација
$x = 2;
printf("%d\n", ++$x); # 3
printf("%d\n", $x++); # И даље 3...
printf("%d\n", $x); # 4

# Текстуални излаз
open($fw, ">:encoding(UTF-8)", "f.txt") or die("Грешка #1!");

$fw->print("Поздрав!\n");
$fw->print("Да ли ово ради?\n");

$fw->close();

# Текстуални улаз
open($fr, "<:encoding(UTF-8)", "f.txt") or die("Грешка #2!");

while(!$fr->eof) {
	print($fr->getc);
}

$fr->close();

# DO...WHILE петља
$i = 1;
do {
	printf("%d\n", $i);
	$i += 1;
} while ($i < 5);

# Рад са стринговима
print("Дужина стринга: ", length("Тест"), "\n");
print(lc("Тест"), "\n", uc("Тест"), "\n");
print(substr("Универзитет Сингидунум", 12), "\n");

# Рад са датумом (POSIX модул)
use POSIX;

print(POSIX::strftime("%H:%M:%S\n", localtime()));
print(POSIX::strftime("%d.%m.%Y\n", localtime()));
