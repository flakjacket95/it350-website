#! /usr/bin/perl

use strict;
use CGI qw( :standard );
use CGI::Carp qw(warningsToBrowser fatalsToBrowser); 
my $expires = gmtime(time() + 86400);
###For testing only###                                                                                                                                                                                       
#print "Set-Cookie: user=testing; expires=$expires; \n";
###For testing only###

print header();
print start_html("Status Update");


my $status = param("special");
my $user = cookie("user");
my $time = localtime();
my $mood = param("mood");
my $location = param("location");

my $fname = "status/".$user.".txt";
open(my $file, ">>", $fname);
print $file "status\t$status\ttime\t$time\tmood\t$mood\tlocation\t$location\n";
close($file);

print p("A status update has been recorded!");
print end_html();
