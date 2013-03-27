NewsFeed Class
==============

This class is for obtaining a simple news feed to parse it in either XML or JSON.

Usage
-----
To use this, you need to include it into a file<br>
Then use it by doing the following:<br><br>
&lt;?php<br>
<br>
$type = substr($_GET['type'], 1, strlen($_GET['type']));<br>
$feed = new NewsFeed();<br>
$feed->set_encoding_type($type);<br>
$feed->order($_GET['order']);<br>
$feed->limit($_GET['limit']);<br>
$feed->parse();
?&gt;

Changelog
---------
Version: 1.0 - initial release