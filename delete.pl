#! /usr/bin/perl
use strict;
use CGI qw( :standard );
use CGI::Carp qw(warningsToBrowser fatalsToBrowser);
use CGI::Session;
require 'feed.pl';
# Start the session.                                                                                                                  
# This reads the cookies and resumes a previous session if present.                                                                         
my $session = new CGI::Session("driver:File", undef, {Directory=>'/tmp'});
my $sid = $session->id();

# Get the username from the current session                                                                                             
# This was set with the login.pl script.                                                                                                    
my $username = $session->param('username');
###Checks for no-login and returns to the homepage if so                                                                                 
if(!($session->param('admin'))) {
	print "Location: main.pl\n\n";
}
if(!($username)) {
    print "Location: index.html\n\n";
}
print header();
print start_html("Delete Users");
print "<link rel=\"stylesheet\" type=\"text/css\" href=\"styles.css\">";
print '
<body>
	<div class="header">
		<a href="main.pl" ><img src="logo.png" class="logo" alt="Logo" width="140" height="140"/></a>
	';
if(!($session->param('admin')))
{
    my $fname = "log_menu.html";
    open(my $myfile, $fname);
    while (my $line = <$myfile>) {
	chomp $line;
	print $line;
    }
}
else {
    my $fname = "admin_menu.html";
    open(my $myfile, $fname);
    while (my $line = <$myfile>) {
        chomp $line;
        print $line;
    }
}

my $fname = "passwords.txt";
open(my $userFile, $fname);
while(my $line = <$userFile>) {
	chomp $line;
	my @words = split / /, $line;
	print('$words[0]\n');
}