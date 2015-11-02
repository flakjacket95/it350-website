#! /usr/bin/perl

use strict;
use CGI qw( :standard );
use CGI::Carp qw(warningsToBrowser fatalsToBrowser); 

print header(); print start_html();

my $status = param("special");
my $user = cookie("User");
my $time = localtime();
my $mood = param("mood");
my $location = param("location");

open(my $file, ">>", "status/$user.txt");
print $file "status\t$status\ttime\t$time\tmood\t$mood\tlocation\t$location\n";
close($file);

print end_html();