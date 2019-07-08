<?php

$dbh = new PDO('sqlite:db.sqlite');
$dbh->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_OBJ);

$st = $dbh->query('SELECT rowid, * FROM `person`;');
while ($row = $st->fetch()) {
	var_dump($row);
}
