-- phpMyAdmin SQL Dump
-- version 2.11.9.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 10, 2011 at 10:27 AM
-- Server version: 5.0.67
-- PHP Version: 5.2.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `socialwall`
--

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE IF NOT EXISTS `groups` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(10) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Table structure for table `tokens`
--

CREATE TABLE IF NOT EXISTS `tokens` (
  `id` bigint(7) NOT NULL auto_increment,
  `fb_id` bigint(10) NOT NULL,
  `fb_at` varchar(79) NOT NULL,
  `fb_ts` varchar(32) NOT NULL,
  `fb_sk` varchar(35) NOT NULL,
  `tw_id` varchar(12) NOT NULL,
  `tw_at` varchar(79) NOT NULL,
  `tw_ts` varchar(32) NOT NULL,
  `gb_at` varchar(30) NOT NULL,
  `gb_ts` varchar(30) NOT NULL,
  `user_id` varchar(30) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Table structure for table `used`
--

CREATE TABLE IF NOT EXISTS `used` (
  `id` int(10) NOT NULL auto_increment,
  `user_id` varchar(30) NOT NULL,
  `photo_id` varchar(30) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(6) NOT NULL auto_increment,
  `firstName` varchar(20) NOT NULL,
  `lastName` varchar(20) NOT NULL,
  `userName` varchar(15) NOT NULL,
  `password` varchar(50) NOT NULL,
  `phoneNumber` varchar(13) NOT NULL,
  `country` varchar(8) NOT NULL,
  `sex` varchar(6) NOT NULL,
  `live` int(1) NOT NULL,
  `activated` int(1) NOT NULL,
  `regtime` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `group_id` int(1) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=119 ;
