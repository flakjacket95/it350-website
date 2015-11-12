#! /usr/bin/perl

use strict;
use CGI qw( :standard );
use CGI::Carp qw(warningsToBrowser fatalsToBrowser); 
use CGI::Session;

# Start the session.                                                                                                                                                                                         
# This reads the cookies and resumes a previous session if present.                                                                                                                                          
my $session = new CGI::Session("driver:File", undef, {Directory=>'/tmp'});
my $sid = $session->id();
###For testing only###                                                                                                                                                                                       
#print "Set-Cookie: user=testing; expires=$expires; \n";
###For testing only###
my $username = $session->param('username');
if(!($username)) {
    print "Location: index.html\n\n"
}

print header();
print start_html("Status Update");


my $status = param("special");
my $time = localtime();
my $mood = param("mood");
my $location = param("location");

my $fname = "status/".$username.".txt";
open(my $file, ">>", $fname);
print $file "status\t$status\ttime\t$time\tmood\t$mood\tlocation\t$location\n";
close($file);

print p("A status update has been recorded!");
print end_html();
