#!/usr/bin/gawk -f
#
# Употреба: ./101.awk data.csv | less

BEGIN {
	FS = ",";
}

{
	# Прескочи заглавље
	if (NR == 1) {
		next;
	}

	# Корисне константе
	printf("Процесирамо %d. ред у фајлу: %s\n", NR, FILENAME);
	printf("Број колона у тренутном реду: %d\n", NF);

	# Рад са стринговима
	printf("Назив филма: %s (%d)\n", toupper($2), $1);
	printf("Назив филма садржи %d карактера.\n", length($2));
	printf("Главни глумац: %s\n", $3);

	# Релациони оператори
	if ($1 < 2000) {
		print("Филм је изашао у 20. веку.");
	}

	if ($1 == 1982) {
		print("Филм је из 1982. године.");
	}

	# Регуларни изрази
	if ($2 ~ /[0-9]/) {
		print("Назив филма садржи број.");
	}

	if ($3 ~ /[A-Z][a-z]+\ Damon/ && $1 !~ /[0-9]{3}2/) {
		print("Регуларни израз одговара.");
	}

	# Инкрементација бројача
	counter_years[$1]++;
	counter_actors[$3]++;

	print("========================================");
}

END {
	print("Филмови по годинама:");
	for (year in counter_years) {
		printf("- %d: %d\n", year, counter_years[year]);
	}

	print("Филмови по глумцима:");
	for (actor in counter_actors) {
		printf("- %s: %d\n", actor, counter_actors[actor]);
	}

	print("Крај.");
}
