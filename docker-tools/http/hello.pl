#!/usr/bin/perl
print "Content-type: text/html\r\n\r\n";
print "<html><head><title>CGI Response</title>
</head>\r\n";
print "<hr>\r\n";
print "<p>\r\n";
print "The data received by the server is:\r\n";
print "<p>\r\n";
print "$ENV{’QUERY_STRING’}\r\n";
print "<p>\r\n";
print "<hr>\r\n";
print "</body></html>\r\n";
