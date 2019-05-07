
<?php
//'REQUEST_URI'
// echo "Content-type: text/html\r\n\r\n";
echo "<html><head><title>CGI Response</title></head>\r\n";
echo "<hr>\r\n";
echo "<p>\r\n";
echo "The data received by the server is:\r\n";
echo "<p>\r\n";
echo $_SERVER["QUERY_STRING"];
// echo " in {’QUERY_STRING’} variable\r\n";
echo "<p>\r\n";
echo "<hr>\r\n";
echo "</body></html>\r\n";
?>
