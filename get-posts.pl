sub printFeed() {
    my $frnd = "friend/".$username.".txt";
    open(my $frndfile,  $frnd);
    while(my $nm = <$frndfile>) {
	chomp $nm;
	my $fname = "status/".$nm.".txt";
	open(my $myfile,  $fname);
	while(my $line = <$myfile>) {
	    chomp $line;
	    print("<div class = \"post\"><p>$nm posted a status</p><p>$line</p></div>");
	    ###Splits the array on tabs. 
	    my @words = split /\t/, $line;
	}
	
    }
}
