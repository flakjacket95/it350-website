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
if(!($username)) {
    print "Location: index.html\n\n"
}
# Standard HTML headers.
print header();
print start_html();

print h1("Checked for your session!");
print p("Found session: $sid");
print p("username = $username");
print p("Check your cookies! No username!");

print end_html();
