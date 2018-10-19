#!/usr/bin/perl

# UTF-8
use utf8;
binmode(STDOUT, "encoding(UTF-8)");

package Foo;

BEGIN {
	print("BEGIN блок.\n");
}

END {
	print("END блок.\n");
}

sub hello() {
	print("Поздрав!\n");
}

return 1;
