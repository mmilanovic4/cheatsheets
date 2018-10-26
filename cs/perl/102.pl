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

# LWP - The World-Wide Web library for Perl
use LWP;

$ua = LWP::UserAgent->new();
$ua->agent("Agent Smith v2.0");

# GET захтев
$get = HTTP::Request->new(GET => "https://httpbin.org/get");

$res = $ua->request($get);

if ($res->is_success) {
	print($res->content, "\n");
} else {
	print($res->status_line, "\n");
}

undef($res);

# POST захтев
$post = HTTP::Request->new(POST => "https://httpbin.org/post");
$post->content_type("application/x-www-form-urlencoded");
$post->content("fn=John&ln=Doe");

$res = $ua->request($post);

if ($res->is_success) {
	print($res->content, "\n");
} else {
	print($res->status_line, "\n");
}

undef($res);

# Преузимање ресурса са Веба
$link = "https://imgs.xkcd.com/comics/dear_diary.png";
$status = $ua->mirror($link, "S.png");

unless ($status->is_success) {
	print($status->status_line, "\n");
}
