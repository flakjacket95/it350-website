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
if(!($username)) {
    print "Location: index.html\n\n"
}
my $searchkey=param("googlesearch");

print header();
print start_html("Search");

#print ("<p>Here is the key word $searchkey</p>");

print ("<link rel=\"stylesheet\" type=\"text/css\" href=\"styles.css\">"); 
print ("<div class=\"container\">");
	
my $myfile;
my $DIR = "status/";
opendir(DIR,$DIR) or die "Cannot open $DIR\n";
my @files = readdir(DIR);
print @files;
closedir(DIR);
foreach my $file (@files) {
    next if ($file !~ /\.txt$/i);\
	open($myfile, $file);
    while(my $line = <$myfile>) {
	chomp($line);		
	my @words = split /\t/, $line;
	if($line =~ /$searchkey/) {
	    print("<div class = \"post\"><p>Search key found</p><p>$line</p></div>");
	}
    }
}
	
	

print ("</div>");

print end_html();
