#! /usr/bin/perl
use strict;
use CGI qw( :standard );
use CGI::Carp qw(warningsToBrowser fatalsToBrowser);
use Digest::MD5 qw(md5 md5_hex md5_base64);
use MIME::Base64;
my $loggedIn = 0;
my $old_sess = cookie("CGISESSID");
if(!($old_sess)) {
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
		my $expires = gmtime(time() + 86400);
		my $auth = md5_hex(@data[0]."/".@data[3]);
		my $rand = rand(10000000);
		my $str = encode_base64(@data[0]."/".@data[3]."/".int($rand)."/".$auth);
		print "Set-Cookie: CGISESSID=$str; expires=$expires; \n";
		$loggedIn = 1;
	    }
	}
    }
}
if($loggedIn == 1) {
    print "Location: index.html\n\n";
    print header();
}
else {
    print header();
    print start_html("Error");
    print p("Login error.");
    print end_html();
}
