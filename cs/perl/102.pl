#!/usr/bin/perl

# UTF-8
use utf8;
binmode(STDOUT, "encoding(UTF-8)");

# Функције
sub sum {
	$x = shift;
	$y = shift;

	if (!$x && !$y) {
		return 0;
	}

	return $x + $y;
}

print(sum(2, 3), "\n");
print(sum(7, 4), "\n");

# Учитавање модула
require Foo;

Foo::hello();
