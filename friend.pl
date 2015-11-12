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
print start_html("Add Friend");

my $time = localtime();
my $friend = param("friend");

my $fname = "friend/$username.txt";
open(my $file, ">>", $fname);
print("$username  $friend\n");

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