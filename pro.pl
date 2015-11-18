sub printFeed {
    my $username = @_[0];
    my $fname = "bio/".$username.".txt";
    
    open(my $myfile,  $fname);
    while(my $line = <$myfile>) {
	chomp $line;
	print("<div class = \"post\"><p>Profile of $username</p><p>$line</p></div>");
	###Splits the array on tabs. 
	my @words = split /\t/, $line;
	###This prints out the array - for easy reading
	#print Dumper \@words;
    }
}
1;
