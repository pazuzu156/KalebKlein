<?php

/*
 * NewsFeed Example by Kaleb Klein
 *
 * (c) 2013 Kaleb Klein. All Rights Reserved
 * 
 * File: NewsFeed.php
 * About: This is the NewsFeed class. This class
 *      Parses the news feed into either json or
 *      xml based on the type given to the class
 *      upon conception.
*/

class NewsFeed
{
	// Create the class variables
	private $_type, $_order, $_limit;

	// Constructor for the class setting
    // The defaults to our class variables
	public function __construct()
	{
		$this->_order = 'DESC';
		$this->_limit = 50;
	}

	// For setting the order the feed
    // Entries are displayed
	public function order($order)
	{
		if (strtolower($order) == 'asc')
		{
			$this->_order = 'ASC';
		}
		elseif (strtolower($order) == 'desc')
		{
			$this->_order = 'DESC';
		}
		else
			return;
	}

	// Setting the encoding type of our feed
    // This is used to parse in either xml or json
	public function setEncodingType($type)
	{
		if (strtolower($type) == 'xml')
		{
			$this->_type = 'xml';
		}
		elseif (strtolower($type) == 'json')
		{
			$this->_type = 'json';
		}
		else
			return;
	}

	// For setting the entry count limit
	public function limit($limit)
	{
		$this->_limit = $limit;
	}

	// This parses our feed. After everything is set, we want to
    // Grab all the entries, and wrap it with XML code, then parse
    // That into json code if json is the encoding type specified.
    // Else, we're just going to keep it all in XML
	public function parse()
	{
		// Grab everything using our class variables to specify how we want them obtained
		$q = mysql_query("SELECT * FROM `newsfeed` ORDER BY `id` " . $this->order . " LIMIT " . $this->limit);

		// This checks if we're parsing xml or json, and puts the opening xml in if xml is what we're using
        // Else, we're giving nothing, to keep from adding un-needed code in our json output
		$rss = ($this->type=='xml') ? "<?xml version=\"1.0\" encoding=\"utf-8\" ?>
        <rss version=\"2.0\">\n" : '';

        // This gets the headers for the feed. This is needed
        // For adding the channel information into the feed
        $h = mysql_query("SELECT * FROM `newsfeed_headers`");

        // A simple check to see if there are any headers, else
        // There isn't a feed to process, let them know. If there
        // Are, we need to add these into the XML
        if (mysql_num_rows($h) == 0)
        {
        	return "The headers for the feed are empty. Nothing to process.";
        }
        else
        {
        	while ($r = mysql_fetch_array($q))
        	{
        		$rss .= " <channel>\n";
        		$rss .= "	<title>" . $r['title'] . "</title>\n";
        		$rss .= "	<description>" . $r['description'] . "</description>\n";
        		$rss .= "	<link>" . $r['link'] . "</link>\n";
        		$rss .= "	<copyright>" . date("Y") . $r['author'] . "</copyright>\n";
        	}
        }

        // A simple check to see if there are any entries.
        // If not, there's nothing to process, let them know.
        // If there are, we need to add the entries into the
        // XML code
        if (mysql_num_rows($q) == 0)
        {
        	return "There are no entries in this feed. Nothing to process.";
        }
        else
        {
        	while ($r = mysql_fetch_array($q))
        	{
        		$rss .= "		<item>\n";
                $rss .= "           <id>" . $r['id'] . "</id>\n";
				$rss .= "			<title>" . $r['title'] . "</title>\n";
		    	$rss .= "			<description>" . strip_tags($r['description']) . "</description>\n";
				$rss .= "			<link>http://www.kalebklein.com/posts/" . $r['link'] . "</link>\n";
				$rss .= "		</item>\n";
        	}
        }

        // The ending pieces to the feed. And a check
        // if we're parsing xml or not. Json doesn't
        // Need the trailing </rss> at the end
        $rss .= "</channel>\n";
        $rss .= ($this->type=='xml') ? '</rss>' : '';

        // The big part of our parsing method. Check if all
        // The needed parts type/order/limit are specified,
        // If not, something is wrong with the URL, let them know
        // Else, process everything needed
        if (!$this->_type || !$this->_order || !$this->_limit)
        {
        	$return = "<h1>Feed Parsing Error!</h1>\n";
			$return .= "<p>Something went wrong when trying to parse the feed for you. Please recheck the URL.</p>";
			return $return;
        }
        elseif ($this->_type == 'json')
        {
        	header("Content-type: application/json"); // Make sure we set the headers for the json script
            $json = simplexml_load_string($rss); // Break the xml into an array
            return "[" . json_encode($json) . "]"; // Encode the array into a json string and return it
        }
        elseif ($this->_type == 'xml')
        {
        	header("Content-type: application/xml"); // Make sure we set the headers for the XML script
			return $rss; // Return the XML
        }
	}
}
