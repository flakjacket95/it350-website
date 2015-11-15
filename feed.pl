sub printFeed {
    my $username = @_[0];
    my $fname = "status/".$username.".txt";
    
    open(my $myfile,  $fname);
    while(my $line = <$myfile>) {
	chomp $line;
	print("<div class = \"post\"><p>$username posted a status</p><p>$line</p></div>");
	###Splits the array on tabs. 
	my @words = split /\t/, $line;
	###This prints out the array - for easy reading
	#print Dumper \@words;
    }
}
1;
