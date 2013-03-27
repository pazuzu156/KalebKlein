<?php

/*
 * NewsFeed Example by Kaleb Klein
 *
 * (c) 2013 Kaleb Klein. All Rights Reserved
 * 
 * File: index.php
 * About: This is the home page. This file
 *		pretty much takes the json part of
 *		the feed, and parses the json into
 *		a readable format
*/

// Check if the get strings are in the url
// If so, make sure they are used, else give
// The defaults to the NewsFeed class
if(isset($_GET['count']) || isset($_GET['order'])) {
	$count = $_GET['count'];
	$order = $_GET['order'];
} else {
	$count = 50;
	$order = 'desc';
}

// An array that is used to build our URL string
$url = array (
	'base' => 'http://localhost/newsfeed',
	'order' => $order,
	'count' => $count,
	'feed' => 'feed.json'
);

// Check if the file can be opened, implode the url
// Into a browser readable URL to make the catch
if(!$json = @file_get_contents(implode('/', $url))) {
	die("<h1>Error: File couldn't be opened or doesn't exist!</h1>");
}

// This checks if we can decode the json returned. If not,
// Then there's probably no entries. Let the user know.
if(!$json = @json_decode($json)) {
	echo "<h1>Error: The news feed is empty. There isn't anything for you to see here.</h1>";
	exit;
}

// Workaround for a single entry if that is the
// Specified count in the URL. Possible bug, will
// Fix soon.
if(count($json[0]->item) == 1) {
	$r .= "<strong>" . $json[0]->item->title . "</strong>";
	$r .= "<p>" . $json[0]->item->description . "</p>";
	$r .= "<small>Permalink: <a href=\"" . $json[0]->item->link . "\" target=\"_blank\">" . $json[0]->item->link . "</a> Post #" . $json[0]->item->id . "</small><hr>";
	echo $r;
	exit; // Exit when the single count script is done, so nothing else decides to break
}

// If there are more than one entry in the count limit,
// Then this is run. This grabs every entry up to the
// Limit given, and displays them
$r = '';
for($i = 0; $i < count($json[0]->item); $i++) {
	$r .= "<strong>" . $json[0]->item[$i]->title . "</strong>";
	$r .= "<p>" . $json[0]->item[$i]->description . "</p>";
	$r .= "<small>Permalink: <a href=\"" . $json[0]->item[$i]->link . "\" target=\"_blank\">" . $json[0]->item[$i]->link . "</a> Post #" . $json[0]->item[$i]->id . "</small><hr>";
}

echo $r;

?>