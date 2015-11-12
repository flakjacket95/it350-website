#! /usr/bin/perl
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
print header();
print start_html("MidHub");
print "<link rel=\"stylesheet\" type=\"text/css\" href=\"styles.css\">";
print '
<body>
	<div class="header">
		<a href="index.html" ><img src="logo.png" class="logo" alt="Logo" width="140" height="140"/></a>
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
print '
</div> 
	<div class="container">
		<form action="search.pl" method="post" class="form">
		  Search:
		  <input type="search" name="googlesearch" placeholder="Search away...">
		  <input type="submit">
		</form>
		<div class="post">  
			 <p>John Davin posted a status:</p> 
			 <p>Paragraphs are the building blocks of papers. Many students define paragraphs in terms of length: a paragraph is a group of at least five sentences, a paragraph is half a page long, etc. In reality, though, the unity and coherence of ideas among sentences is what constitutes a paragraph. A paragraph is defined as “a group of sentences or a single sentence that forms a unit” (Lunsford and Connors 116). Length and appearance do not determine whether a section in a paper is a paragraph. For instance, in some styles of writing, particularly journalistic styles, a paragraph can be just one sentence long. Ultimately, a paragraph is a sentence or group of sentences that support one main idea. In this handout, we will refer to this as the “controlling idea,” because it controls what happens in the rest of the paragraph.</p> 
			 <p style="font-size:small"> Posted 10:45 am</p> 
		 </div>
		 <div class="post">  
			 <p>John Davin posted a status:</p> 
			 <p>Paragraphs are the building blocks of papers. Many students define paragraphs in terms of length: a paragraph is a group of at least five sentences, a paragraph is half a page long, etc. In reality, though, the unity and coherence of ideas among sentences is what constitutes a paragraph. A paragraph is defined as “a group of sentences or a single sentence that forms a unit” (Lunsford and Connors 116). Length and appearance do not determine whether a section in a paper is a paragraph. For instance, in some styles of writing, particularly journalistic styles, a paragraph can be just one sentence long. Ultimately, a paragraph is a sentence or group of sentences that support one main idea. In this handout, we will refer to this as the “controlling idea,” because it controls what happens in the rest of the paragraph.</p> 
			 <p style="font-size:small"> Posted 10:45 am</p> 
		 </div>
		 <p class="clear"> Test</p>
	</div>
	<div class="footer">
		<div class="element">
			Contact Us <br>
			Members List
		</div>	
	</div>

  
  
  
  
  
  
  
  
  
  
  
  
  
  <!-- ***************************************************************
       Below this point is text you should include on every IT350 page
       *************************************************************** -->

  <!-- Below is a script to output the time at which this page was last modified.
       Later in the course we will learn how this works.  -->
  <!-- This makes a button you can click on to validate your page - also include this on every page -->
  <p> <br/><br/></p>
  <hr/>
  <p>
   	<script type = "text/javascript">
	 document.write(\'<a href="http://zee.cs.usna.edu:8888/html5/?doc=\'+document.location+\'">\' +
        \'<img src="http://www.w3.org/html/logo/img/mark-word-icon.png"\'+
		\'alt="Valid HTML 5!" height="50" width="50" />\'+
      \'</a>\');
	</script>  
    This page last modified 
    <script type="text/javascript">
      document.write(document.lastModified);
    </script>
  </p>


</body>

</html>
  
';
