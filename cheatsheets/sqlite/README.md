# SQLite

**Прављење нове табеле**

```
CREATE TABLE `person` (
	`first_name` TEXT NOT NULL,
	`last_name` TEXT NOT NULL,
	`email` TEXT NOT NULL UNIQUE,
	`year_of_birth` INTEGER,
	`salary` REAL DEFAULT 0
);
```

**Корисне наредбе**

```
# Помоћ/излаз
.help
.quit

# Листање табела
.tables
.tables p%

# Шема табеле
.schema person

# Приказ редова унутар табеле
.headers on
.separator \t
SELECT rowid, * FROM `person`;

# Информације о учитаним базама података
.databases

# Увоз података из екстерног фајла
.mode csv
.import data.csv person

# Извоз података у екстерни фајл
.mode csv
.once exported.csv
SELECT rowid, * FROM `person` WHERE rowid = 1;

# Извоз базе података
.output dump.sqlite
.dump person

# Извршавање наредби на систему
.system pwd
```
