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

#open(my $myfile,  $fname);
#while(my $line = <$myfile>) 
#    chomp $line;
 #   print("<div class = \"post\"><p>$user posted a status</p><p>$line</p></div>");
    ###Splits the array on tabs. 
  #  my @words = split /\t/, $line;
    ###This prints out the array - for easy reading
    #print Dumper \@words;
	
my $myfile;
my $DIR = "/status";
opendir(DIR,$DIR) or die "Cannot open $DIR\n";
    my @files = readdir(DIR);
    closedir(DIR);
    foreach my $file (@files) {
        next if ($file !~ /\.txt$/i);\
		open($myfile, "", $file);
        while(my $line = <$myfile>) {
			chomp($line);		
			my @words = split /\s/, $line;
			foreach my $word (@words) {
				if($word eq $searchkey) {
					print("<div class = \"post\"><p>Search key found</p><p>$line</p></div>");
				}
			}
		}
    }
	
	

print ("</div>");

print end_html();
