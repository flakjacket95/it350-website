#!/usr/bin/perl
use strict;
use CGI qw( :standard );
use CGI::Carp qw(warningsToBrowser fatalsToBrowser);
###Testing
use CGI::Session;

# Start the session.                                                                                                                                                                                         
# This reads the cookies and resumes a previous session if present.                                                                                                                                          
my $session = new CGI::Session("driver:File", undef, {Directory=>'/tmp'});
my $sid = $session->id();

# Get the username from the current session                                                                                                                                                                  
# This was set with the login.pl script.                                                                                                                                                                     
my $username = $session->param('username');
###Checks for no-login and returns to the homepage if so                                                                                                                                                     
if(!($username)) {
    print "Location: index.html\n\n"
}
print header();
print start_html("Status's");
print ("<link rel=\"stylesheet\" type=\"text/css\" href=\"styles.css\">"); 
print ("<div class=\"container\">");

my $frnd = "friend/".$username.".txt";
open(my $frndfile,  $frnd);
while(my $nm = <$frndfile>) {
    chomp $nm;
    my $fname = "status/".$nm.".txt";
    open(my $myfile,  $fname);
    while(my $line = <$myfile>) {
	chomp $line;
	print("<div class = \"post\"><p>$nm posted a status</p><p>$line</p></div>");
	###Splits the array on tabs. 
	my @words = split /\t/, $line;
    }
    
}
print ("</div>");
print end_html();
