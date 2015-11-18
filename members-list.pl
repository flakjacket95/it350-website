#! /usr/bin/perl
use strict;
use CGI qw( :standard );
use CGI::Carp qw(warningsToBrowser fatalsToBrowser);

print header();
print start_html("MidHub");
print "<link rel=\"stylesheet\" type=\"text/css\" href=\"styles.css\">";
print '
<body>
	<div class="header">
		<a href="main.pl" ><img src="logo.png" class="logo" alt="Logo" width="140" height="140"/></a>
	';
print '
</div> 
	<div class="container">
		<form action="search.pl" method="post" class="form">
		  Search:
		  <input type="search" name="googlesearch" placeholder="Search away...">
		  <input type="submit">
		</form>
';
&printFeed($username);
print '
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
