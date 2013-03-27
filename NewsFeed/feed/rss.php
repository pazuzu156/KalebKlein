<?php

/*
 * NewsFeed Example by Kaleb Klein
 *
 * (c) 2013 Kaleb Klein. All Rights Reserved
 * 
 * File: rss.php
 * About: This file is used to grab all the feed entries
 *			as well as utilize the RESTful URL states
*/

// Array holding all database info for connection
$db = array(
	'host' => 'YOUR_HOST',
	'user' => 'YOUR_USER',
	'pass' => 'YOUR_PASSWORD',
	'name' => 'YOUR_DATABASE'
);

// Make connection to database
$connect = mysql_connect($db['host'], $db['user'], $db['pass']);
mysql_select_db($db['name']);

require('NewsFeed.php'); // Required to run this file!

/*
 * This allows for the following URLs to be used to create the feed
 *
 * The two on the line below are default everything. Parses json or xml
 * depending on the extension provided
 * http://www.example.com/feed.xml or http://www.example.com/feed.json
 *
 * The two on the line below have a number before the feed itself. This
 * allows for a limit to be placed on how many entries you want to grab
 * Without it, the default is a limit to 50 entries
 * http://www.example.com/1/feed.xml or http://www.example.com/1/feed.json
 *
 * The mountain of URLs below allow for the order to be set whether in ascending
 * or in descending order. You can also include the count limit as well within the
 * URL. The order of everything is as follows: Order/Limit/Feed WARNING: It must
 * be written in this order if you use every limitation. And the feed always comes last
 * http://www.example.com/desc/feed.xml or http://www.example.com/desc/feed.json
 * http://www.example.com/desc/1/feed.xml or http://www.example.com/desc/1/feed.json
*/

$type = substr($_GET['type'], 1, strlen($_GET['type'])); // So there is no . at the beginning of the type
$feed = new NewsFeed(); // Instantiate a new NewsFeed object
$feed->set_encoding_type($type); // Set the encoding type: xml or json. MUST BE USED!
$feed->order($_GET['order']); // Set the order, ascending or descending.
$feed->limit($_GET['limit']); // Set the count limit of entries to display
echo $feed->parse(); // Parse the news feed into the encoding specified earlier

mysql_close($connect); // Close database connection

?>