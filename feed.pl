#!/usr/bin/perl
use strict;
use CGI qw( :standard );
use CGI::Carp qw(warningsToBrowser fatalsToBrowser);
###Testing
use Data::Dumper qw(Dumper);
my $expires = gmtime(time() + 86400);
###For testing only###                                                                                                                                                                                
print "Set-Cookie: user=test; expires=$expires; \n";
###For testing only### x


my $user = cookie("user");

print header();
print start_html("Status's");

my $fname = "status/".$user.".txt";

open(my $myfile,  $fname);
while(my $line = <$myfile>) {
    chomp $line;
    print("<div class = \"post\"><p>$user posted a status</p><p>$line</p></div>");
    ###Splits the array on tabs. 
    my @words = split /\t/, $line;
    ###This prints out the array - for easy reading
    print Dumper \@words;
}

print end_html();
