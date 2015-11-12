#! /usr/bin/perl
use strict;
use CGI ();
use CGI qw( :standard );
use CGI::Carp qw(warningsToBrowser fatalsToBrowser);
use Digest::MD5 qw(md5 md5_hex md5_base64);
use MIME::Base64;
use CGI::Session;

my $session = new CGI::Session("driver:File", undef, {Directory=>'/tmp'});
my $sid = $session->id();

#print $session->header();
$session->flush();
my $loggedIn = 0;

my $user = param("username");
my $pass = param("password");
### Do valid user checking and password validation here
my $fname = "passwords.txt";
open(my $myfile,  $fname);
while(my $line = <$myfile>) {
    chomp $line;
    my @data = split /\t/, $line;
    if($user eq @data[0]) {
	if(md5_base64($pass . @data[2]) eq @data[1]) {
	    #Log the user in
	    #Set our cookie
	    $session->param('username', $user);
	    $loggedIn = 1;
	}
    }
}
my $username = $session->param('username');
if($username) {
##Looked this up so our script is just a background script
    print CGI::redirect(-uri => "index.html",
			-cookie =>$session->cookie(),
			-status => 302);
}
else {
    print header();
    print start_html("Error");
    print p("Login error.");
    print end_html();
}
