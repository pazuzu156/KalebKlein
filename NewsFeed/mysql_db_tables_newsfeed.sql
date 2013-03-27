/*
 * NewsFeed Example by Kaleb Klein
 *
 * (c) 2013 Kaleb Klein. All Rights Reserved
 * 
 * File: mysql_db_tables_newsfeed.sql
 * About: This file is used to create the tables
 *      in the database for you to house your entries
*/

CREATE TABLE IF NOT EXISTS `newsfeed` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `link` varchar(255) NOT NULL,
  `postedon` date NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `newsfeed_headers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
);