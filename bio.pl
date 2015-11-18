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


my $home = param("hometown");
my $time = localtime();
my $cur = param("curschool");
my $prev = param("prevschool");
my $employ = param("employment");

my $fname = "bio/".$username.".txt";
open(my $file, ">>", $fname);
print $file "hometown\t$home\ttime\t$time\tcurschool\t$cur\tprevschool\t$prev\temployment\t$employ\tlocation\t$location\n";
close($file);

print p("Bio info update has been recorded!");
print end_html();
