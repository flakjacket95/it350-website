#! /usr/bin/perl

use strict;
use CGI qw( :standard );
use CGI::Carp qw(warningsToBrowser fatalsToBrowser); 
my $expires = gmtime(time() + 86400);

print header();
print start_html("Add Friend");

my $user = cookie("user");
my $time = localtime();
my $friend = param("friend");

my $fname = "friend/".$friend.".txt";
open(my $file, ">>", $fname);

my $exists = 0;
while(my $check = <$file>) {
	
	chomp($check);
	if($friend eq $check) {
		$exists = 1
	}
}
close($file);

if(!$exists) {
	open(my $write, ">>", $fname);
	print $write "$friend\n";
	close($write);
}

print end_html();