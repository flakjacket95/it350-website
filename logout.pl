#!/usr/bin/perl
use strict;
use CGI qw( :standard );
use CGI::Carp qw(warningsToBrowser fatalsToBrowser); 
use CGI::Session;

# Start the session.
# This reads the cookies and resumes a previous session if present.
my $session = new CGI::Session("driver:File", undef, {Directory=>'/tmp'});
my $sid = $session->id();

# Get the username from the current session
# This was set with the login.pl script.
my $username = $session->param('username');
###Checks for no-login and returns to the homepage if so
if($username) {
    $session->delete();
}
print "Location: index.html\n\n";
print header();
#From here down just do like always
# Standard HTML headers.
