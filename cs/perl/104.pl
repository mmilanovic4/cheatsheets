#!/usr/bin/perl

# UTF-8
use utf8;
binmode(STDOUT, "encoding(UTF-8)");

# Регуларни изрази

# MATCH
sub verify_first_and_last_name {
	$name = shift;

	if ($name =~ m/^[A-Z][a-z]+\ [A-Z][a-z]+$/) {
		return 1;
	}
	return 0;
}

print(verify_first_and_last_name("john doe"), "\n");
print(verify_first_and_last_name("John Doe"), "\n");

# MATCH + EXTRACT
$str = "My name is John Doe and her name is Jane Doe.";
@names = $str =~ m/([A-Z][a-z]+\ [A-Z][a-z]+)/g;

foreach $name (@names) {
	printf("%s\n", $name);
}

# SUBSTITUTE
$str =~ s/(?:[A-Z][a-z]+\ [A-Z][a-z]+)/Lorem Ipsum/g;
print($str, "\n");

# SUBSTITUTE - CHANGE ORDER
$str = "Today it's MM-DD-YYYY.";
$str =~ s/([A-Z]{2})\-([A-Z]{2})\-([A-Z]{4})/$2.$1.$3/;
print($str, "\n");
