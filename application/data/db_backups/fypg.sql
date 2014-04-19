-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Host: localhost:443
-- Generation Time: Apr 16, 2014 at 04:34 PM
-- Server version: 5.5.24
-- PHP Version: 5.3.26

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `findyourperfect_new`
--

-- --------------------------------------------------------

--
-- Table structure for table `appsettings`
--

CREATE TABLE IF NOT EXISTS `appsettings` (
  `variable` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `settingType` tinytext NOT NULL,
  KEY `variable` (`variable`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `calendar`
--

CREATE TABLE IF NOT EXISTS `calendar` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `monthRangeMin` int(11) NOT NULL,
  `monthRangeMax` int(11) NOT NULL,
  `type` enum('local','google') NOT NULL DEFAULT 'local',
  `googleUserName` varchar(255) DEFAULT NULL,
  `googlePassWord` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `calendar`
--

INSERT INTO `calendar` (`id`, `name`, `monthRangeMin`, `monthRangeMax`, `type`, `googleUserName`, `googlePassWord`) VALUES
(1, 'default', -1, 12, 'local', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `calendarevents`
--

CREATE TABLE IF NOT EXISTS `calendarevents` (
  `eventId` int(11) NOT NULL AUTO_INCREMENT,
  `calendarId` int(11) NOT NULL,
  `year` int(4) NOT NULL,
  `month` int(2) NOT NULL,
  `day` int(2) NOT NULL,
  `eventName` varchar(255) NOT NULL,
  `linkOne` varchar(255) NOT NULL,
  `linkTwo` varchar(255) NOT NULL,
  `eventContent` longtext NOT NULL,
  PRIMARY KEY (`eventId`),
  KEY `eventName` (`eventName`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `calendarevents`
--

INSERT INTO `calendarevents` (`eventId`, `calendarId`, `year`, `month`, `day`, `eventName`, `linkOne`, `linkTwo`, `eventContent`) VALUES
(1, 1, 2012, 10, 15, 'Test Event', 'http://linkone.com', 'http://linktwo', 'This is some test content for an event on Oct 15th 2012.'),
(2, 1, 2012, 10, 14, 'Test Event Two', '', '', 'event two content'),
(8, 0, 2012, 10, 17, 'The seventeenth', 'sdvwge', 'rbgwretg', 'event on the 17th'),
(9, 1, 2012, 10, 3, 'asfqerf', 'dfverv', 'adfvwerv', 'dafvwefrvw'),
(10, 1, 2012, 10, 18, 'Bday', 'sdvq', 'avqr', 'cal id = 1, eventId = 10, day = 18th, month = 10, year = 2012'),
(11, 1, 2012, 10, 29, 'New Event', 'link One', 'Link Two', 'This is some content etc');

-- --------------------------------------------------------

--
-- Table structure for table `calendarweeks`
--

CREATE TABLE IF NOT EXISTS `calendarweeks` (
  `weekId` int(11) NOT NULL AUTO_INCREMENT,
  `calendarId` int(11) DEFAULT NULL,
  `headingColor` varchar(7) DEFAULT NULL,
  `weekHeading` mediumtext,
  `headingLink` varchar(255) DEFAULT NULL,
  `monthId` int(11) DEFAULT NULL,
  `monthName` varchar(45) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  PRIMARY KEY (`weekId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `categoryId` int(11) NOT NULL AUTO_INCREMENT,
  `rootId` int(11) NOT NULL,
  `categoryName` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `uri` varchar(255) NOT NULL,
  `parentId` int(11) NOT NULL,
  `lft` int(11) NOT NULL,
  `rgt` int(11) NOT NULL,
  `isLocked` int(11) NOT NULL,
  `isContent` int(11) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`categoryId`),
  KEY `url` (`uri`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=56 ;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`categoryId`, `rootId`, `categoryName`, `uri`, `parentId`, `lft`, `rgt`, `isLocked`, `isContent`, `icon`) VALUES
(1, 1, 'Site', 'Site', 0, 1, 50, 0, 0, NULL),
(2, 2, 'Pages', 'page', 1, 2, 41, 0, 1, NULL),
(3, 0, 'About Us', 'About-Us', 2, 3, 4, 0, 1, NULL),
(4, 0, 'Interest', 'Interest', 6, 0, 0, 1, 0, NULL),
(5, 0, 'News', 'News', 2, 35, 36, 1, 1, NULL),
(6, 0, 'Fypg', 'Fypg', 0, 0, 0, 0, 0, NULL),
(7, 0, 'Categories', 'Categories', 6, 0, 0, 1, 0, NULL),
(8, 0, 'Accommodations', 'Accommodations', 7, 0, 0, 1, 0, 'accommodations.png'),
(9, 0, 'Attractions', 'Attractions', 7, 0, 0, 1, 0, 'attractions.png'),
(10, 0, 'Beaches', 'Beaches', 7, 0, 0, 1, 0, 'beaches.png'),
(11, 0, 'Deals', 'Deals', 7, 0, 0, 1, 0, 'deals.png'),
(12, 0, 'Amusement', 'Amusement', 4, 0, 0, 1, 0, 'amusement.png'),
(13, 0, 'Auto', 'Auto', 4, 0, 0, 1, 0, 'auto.png'),
(14, 0, 'Bed and Breakfast', 'Bed-And-Breakfast', 4, 0, 0, 1, 0, 'bandb.png'),
(15, 0, 'Beach', 'Beach', 4, 0, 0, 1, 0, 'beach.png'),
(17, 0, 'test1', 'test1', 2, 39, 40, 0, 1, NULL),
(18, 0, 'Family Fun', 'Family-Fun', 7, 0, 0, 1, 0, 'familyfun.png'),
(19, 0, 'Girls Trip', 'Girls-Trip', 7, 0, 0, 1, 0, 'girlstrip.png'),
(22, 0, 'Events', 'Events', 7, 0, 0, 1, 0, 'events.png'),
(23, 0, 'Golf', 'Golf', 7, 0, 0, 1, 0, 'golf.png'),
(24, 0, 'Guys Trip', 'Guys-Trip', 7, 0, 0, 1, 0, 'guystrip.png'),
(26, 0, 'Spas', 'Spas', 7, 0, 0, 1, 0, 'spas.png'),
(27, 0, 'Biking', 'Biking', 4, 0, 0, 1, 0, 'biking.png'),
(28, 0, 'Camp', 'Camp', 4, 0, 0, 1, 0, 'camp.png'),
(29, 0, 'Casino', 'Casino', 4, 0, 0, 1, 0, 'casino.png'),
(30, 0, 'Caverns', 'Caverns', 4, 0, 0, 1, 0, 'caverns.png'),
(31, 0, 'CivilWar', 'Civil-War', 4, 0, 0, 1, 0, 'civilwar.png'),
(32, 0, 'Cruises', 'Cruises', 4, 0, 0, 1, 0, 'cruises.png'),
(33, 0, 'Deal', 'Deal', 4, 0, 0, 1, 0, 'deal.png'),
(34, 0, 'Dining', 'Dining', 4, 0, 0, 1, 0, 'dining.png'),
(35, 0, 'Entertainment', 'Entertainment', 4, 0, 0, 1, 0, 'entertainment.png'),
(36, 0, 'Family Fun', 'Family-Fun', 4, 0, 0, 1, 0, 'familyfun.png'),
(37, 0, 'Featured', 'Featured', 4, 0, 0, 1, 0, 'featured.png'),
(38, 0, 'Festivals', 'Festivals', 4, 0, 0, 1, 0, 'festivals.png'),
(39, 0, 'Fishing', 'Fishing', 4, 0, 0, 1, 0, 'fishing.png'),
(40, 0, 'Girls Trip', 'Girls-Trip', 4, 0, 0, 1, 0, 'girlstrip.png'),
(41, 0, 'Golf', 'Golf', 4, 0, 0, 1, 0, 'golf.png'),
(42, 0, 'Guys Trip', 'GuysTrip', 4, 0, 0, 1, 0, 'guystrip.png'),
(43, 0, 'Heritage', 'Heritage', 4, 0, 0, 1, 0, 'heritage.png'),
(44, 0, 'Historic', 'Historic', 4, 0, 0, 1, 0, 'historic.png'),
(45, 0, 'Horses', 'Horses', 4, 0, 0, 1, 0, 'horses.png'),
(46, 0, 'Hunting', 'Hunting', 4, 0, 0, 1, 0, 'hunting.png'),
(47, 0, 'Lakes', 'Lakes', 4, 0, 0, 1, 0, 'lakes.png'),
(48, 0, 'Mountains', 'Mountains', 4, 0, 0, 1, 0, 'mountains.png'),
(49, 0, 'Museums', 'Museums', 4, 0, 0, 1, 0, 'museums.png'),
(50, 0, 'Music', 'Music', 4, 0, 0, 1, 0, 'music.png'),
(51, 0, 'Parks', 'Parks', 4, 0, 0, 1, 0, 'parks.png'),
(52, 0, 'Skiing', 'Skiing', 4, 0, 0, 1, 0, 'skiing.png'),
(53, 0, 'Spas', 'Spas', 4, 0, 0, 1, 0, 'spas.png'),
(54, 0, 'Tennis', 'Tennis', 4, 0, 0, 1, 0, 'tennis.png'),
(55, 0, 'Wineries', 'Wineries', 4, 0, 0, 1, 0, 'wineries.png');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE IF NOT EXISTS `events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `startDate` varchar(255) NOT NULL,
  `endDate` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `categories` mediumtext NOT NULL,
  `eventContent` longtext NOT NULL,
  `addrCity` varchar(255) NOT NULL,
  `addrState` varchar(255) NOT NULL,
  `addrStreetOne` varchar(255) NOT NULL,
  `addrStreetTwo` varchar(255) NOT NULL,
  `addrZip` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `startDate` (`startDate`,`endDate`,`title`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=33 ;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `userId`, `startDate`, `endDate`, `title`, `categories`, `eventContent`, `addrCity`, `addrState`, `addrStreetOne`, `addrStreetTwo`, `addrZip`) VALUES
(23, 36, '2014-03-19', '2014-03-24', 'test_eventbham', '', '<p>test content</p>\r\n', 'Birmingham', '1', '11 20th Street', '', '35215'),
(24, 36, '2014-03-31', '2015-02-26', 'testbham_images', '', '<p><img alt="" src="/modules/media/images/Default/gps.JPG" style="height:480px; width:640px" /></p>\r\n\r\n<p>test test</p>\r\n', 'Birmingham', '1', '11 20th Street', '', '35215'),
(25, 0, '2014-04-14', '2014-04-19', 'Searchable Event', '', '<p>This is the first test of a searchable event. Events should be searchable by date, and the date search should find events based on a range query.</p>\r\n', 'Birmingham', 'AL', '2025 Kentucky Ave', 'Suite A', '35216'),
(26, 0, '2014-04-12', '2014-04-30', 'Searchable Event Two', '', '<p>This event will maybe be searchable if we can make the planets align so that all is right in the universe.</p>\r\n', 'Birmingham', 'AL', '2025 Kentucky Ave', 'Suite A', '35216'),
(27, 0, '2014-04-13', '2014-04-21', 'Searchable Event Three', '', '<p>Event three for search testing</p>\r\n', 'Birmingham', 'AL', '2025 Kentucky Ave', 'Suite A', '35216'),
(28, 0, '2014-04-12', '2014-04-30', 'Searchable Event Four', '', '<p>another event to test searching a different field type since this is by date.</p>\r\n', 'Birmingham', 'AL', '2025 Kentucky Ave', 'Suite A', '35216'),
(29, 0, '2014-04-28', '2014-04-30', 'Searchable Event Five', '', '<p>This is seachable event five. we are trying to get the content and title in here.</p>\r\n', 'Birmingham', 'AL', '2025 Kentucky Ave', 'Suite A', '35216'),
(30, 0, '2014-04-28', '2014-05-02', 'Searchable Event Six', '', '<p>Number six in the count down</p>\r\n', 'Birmingham', 'AL', '2025 Kentucky Ave', 'Suite A', '35216'),
(31, 0, '2014-05-01', '2014-05-03', 'Testing Callback', '', '<p>Testing callback function</p>\r\n', 'Birmingham', 'AL', '2025 Kentucky Ave', 'Suite A', '35216'),
(32, 0, '2014-05-03', '2014-05-06', 'Searchable Seven', '', '<p>This is event seven in the test sequence.</p>\r\n', 'Birmingham', 'AL', '2025 Kentucky Ave', 'Suite A', '35216');

-- --------------------------------------------------------

--
-- Table structure for table `getaways`
--

CREATE TABLE IF NOT EXISTS `getaways` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `companyUri` varchar(255) NOT NULL,
  `templateId` varchar(255) DEFAULT NULL,
  `templateColor` varchar(255) DEFAULT NULL,
  `startDate` varchar(255) NOT NULL,
  `endDate` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `getawayUrl` varchar(255) NOT NULL,
  `category` mediumtext NOT NULL,
  `content` longtext NOT NULL,
  `addrCity` varchar(255) NOT NULL,
  `addrState` varchar(255) NOT NULL,
  `addrStreetOne` varchar(255) NOT NULL,
  `addrStreetTwo` varchar(255) NOT NULL,
  `addrZip` varchar(255) NOT NULL,
  `topImage` varchar(255) DEFAULT NULL,
  `rightImage` varchar(255) DEFAULT NULL,
  `bottomImage` varchar(255) DEFAULT NULL,
  `leftImage` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `startDate` (`startDate`,`endDate`,`title`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=166 ;

--
-- Dumping data for table `getaways`
--

INSERT INTO `getaways` (`id`, `userId`, `companyUri`, `templateId`, `templateColor`, `startDate`, `endDate`, `title`, `getawayUrl`, `category`, `content`, `addrCity`, `addrState`, `addrStreetOne`, `addrStreetTwo`, `addrZip`, `topImage`, `rightImage`, `bottomImage`, `leftImage`) VALUES
(1, 17, 'Ross Bridge', 'templateThree', NULL, '', '', 'Ross Bridge', 'http://www.rtjgolf.com/rossbridge/', '', '<p>Beautifully carved into the rolling terrain of Shannon Valley, Ross Bridge will challenge even the best golfers. The course meanders through indigenous landscape and around the 259-room Renaissance Ross Bridge Golf Resort & Spa.</p> \r\n\r\n<p>Ross Bridge is one of the longest courses in the world but offers multiple tees for golfers of all levels. The beauty and challenge of each hole leads many to believe there is not one signature hole but possibly eighteen.</p>', 'Birmingham', 'AL', '4000 Grand Ave', '', '35226', 'top1.png', 'medium1.png', '', 'medium2.png'),
(162, 0, '', 'templateTwo', 'Blue', '2014-04-12', '2014-04-18', 'One', 'http://one.com', '', '<p>This is getaway One and will have the first categories assigned. Edited.</p>\r\n', 'Birmingham', 'AL', '2025 Kentucky Ave', 'Suite A', '35216', NULL, NULL, NULL, NULL),
(163, 0, '', 'templateTwo', 'Yellow', '2014-04-12', '2014-04-18', 'Two', 'http://two.com', '', '<p>This is getaway Two. It is being edited so that it will have the third category and interest assigned to it. It previously had the second category and interest attached to it.</p>\r\n\r\n<p>Current:</p>\r\n\r\n<p>Beaches and Bed and Breakfast</p>\r\n\r\n<p>Prior:</p>\r\n\r\n<p>Attractions and Auto</p>\r\n\r\n<p>&nbsp;</p>\r\n', 'Birmingham', 'AL', '2025 Kentucky Ave', 'Suite A', '35216', NULL, NULL, NULL, NULL),
(165, 0, '', 'templateThree', 'Yellow', '2014-04-25', '2014-04-29', 'Four', 'http://four.com', '', '<p>This is four and will have the fourth categories assigned, but will also have the last categories assigned.</p>\r\n', 'Birmingham', 'AL', '2025 Kentucky Ave', 'Suite A', '35216', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `getaways_by_categories`
--

CREATE TABLE IF NOT EXISTS `getaways_by_categories` (
  `recordId` int(11) NOT NULL AUTO_INCREMENT,
  `getawayId` int(11) NOT NULL,
  `categoryId` int(11) NOT NULL,
  PRIMARY KEY (`recordId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=495 ;

--
-- Dumping data for table `getaways_by_categories`
--

INSERT INTO `getaways_by_categories` (`recordId`, `getawayId`, `categoryId`) VALUES
(1, 1, 8),
(483, 165, 11),
(484, 165, 26),
(485, 165, 15),
(486, 165, 55),
(487, 163, 10),
(488, 163, 14),
(493, 162, 18),
(494, 162, 27);

-- --------------------------------------------------------

--
-- Table structure for table `icons`
--

CREATE TABLE IF NOT EXISTS `icons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `skinId` int(11) NOT NULL,
  `fileName` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=58 ;

--
-- Dumping data for table `icons`
--

INSERT INTO `icons` (`id`, `skinId`, `fileName`, `type`) VALUES
(1, 3, 'accommodations.png', 'category'),
(2, 3, 'attractions.png', 'category'),
(3, 3, 'beaches.png', 'category'),
(4, 3, 'deals.png', 'category'),
(5, 3, 'destinations.png', 'category'),
(6, 3, 'events.png', 'category'),
(7, 3, 'familyfun.png', 'category'),
(8, 3, 'girlstrip.png', 'category'),
(9, 3, 'golf.png', 'category'),
(10, 3, 'guystrip.png', 'category'),
(11, 3, 'interests.png', 'category'),
(12, 3, 'spas.png', 'category'),
(13, 3, 'amusement.png', 'interest'),
(14, 3, 'auto.png', 'interest'),
(15, 3, 'bandb.png', 'interest'),
(16, 3, 'beach.png', 'interest'),
(17, 3, 'biking.png', 'interest'),
(18, 3, 'camp.png', 'interest'),
(19, 3, 'casino.png', 'interest'),
(20, 3, 'caverns.png', 'interest'),
(21, 3, 'civilwar.png', 'interest'),
(22, 3, 'cruises.png', 'interest'),
(23, 3, 'deal.png', 'interest'),
(24, 3, 'dining.png', 'interest'),
(25, 3, 'entertainment.png', 'interest'),
(26, 3, 'familyfun.png', 'interest'),
(27, 3, 'featured.png', 'interest'),
(28, 3, 'festivals.png', 'interest'),
(29, 3, 'fishing.png', 'interest'),
(30, 3, 'girlstrip.png', 'interest'),
(31, 3, 'golf.png', 'interest'),
(32, 3, 'guystrip.png', 'interest'),
(33, 3, 'heritage.png', 'interest'),
(34, 3, 'historic.png', 'interest'),
(35, 3, 'horses.png', 'interest'),
(36, 3, 'hunting.png', 'interest'),
(37, 3, 'lakes.png', 'interest'),
(38, 3, 'mountains', 'interest'),
(39, 3, 'museums.png', 'interest'),
(40, 3, 'music.png', 'interest'),
(41, 3, 'parks.png', 'interest'),
(42, 3, 'skiing.png', 'interest'),
(43, 3, 'spas.png', 'interest'),
(44, 3, 'tennis.png', 'interest'),
(45, 3, 'wineries.png', 'interest'),
(46, 3, 'accommodations.png', 'quickref'),
(47, 3, 'beaches.png', 'quickref'),
(48, 3, 'deals.png', 'quickref'),
(49, 3, 'destinations.png', 'quickref'),
(50, 3, 'events.png', 'quickref'),
(51, 3, 'familyfun.png', 'quickref'),
(52, 3, 'girlstrip.png', 'quickref'),
(53, 3, 'golf.png', 'quickref'),
(54, 3, 'guystrip.png', 'quickref'),
(55, 3, 'interests.png', 'quickref'),
(56, 3, 'spas.png', 'quickref'),
(57, 3, 'attractions.png', 'quickref');

-- --------------------------------------------------------

--
-- Table structure for table `installedmodules`
--

CREATE TABLE IF NOT EXISTS `installedmodules` (
  `moduleId` int(3) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `nameSpace` varchar(255) NOT NULL,
  `publicName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`moduleId`),
  UNIQUE KEY `name` (`name`,`nameSpace`),
  KEY `publicName` (`publicName`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `installedmodules`
--

INSERT INTO `installedmodules` (`moduleId`, `name`, `nameSpace`, `publicName`) VALUES
(1, 'admin', 'Admin_', 'Admin Area'),
(2, 'user', 'User_', NULL),
(3, 'pages', 'Pages_', NULL),
(4, 'media', 'Media_', 'Gallery'),
(5, 'contact', 'Contact_', 'Contact'),
(6, 'Calendar', 'Calendar_', 'Calendar'),
(7, 'search', 'Search_', 'Search'),
(8, 'testimonials', 'Testimonials_', 'Testimonials');

-- --------------------------------------------------------

--
-- Table structure for table `lang`
--

CREATE TABLE IF NOT EXISTS `lang` (
  `langKey` varchar(255) NOT NULL,
  `langText` mediumtext NOT NULL,
  `locale` varchar(5) NOT NULL,
  PRIMARY KEY (`langKey`),
  KEY `locale` (`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `lang`
--

INSERT INTO `lang` (`langKey`, `langText`, `locale`) VALUES
('headerImageUserNotice', 'Page Header images must be width = X and Height = N', 'en_US'),
('welcomeGuest', 'Welcome back guest.', 'en_US');

-- --------------------------------------------------------

--
-- Table structure for table `log`
--

CREATE TABLE IF NOT EXISTS `log` (
  `logId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `fileId` int(11) NOT NULL DEFAULT '0',
  `userName` varchar(255) DEFAULT NULL,
  `timeStamp` varchar(255) NOT NULL,
  `priorityName` varchar(20) NOT NULL,
  `priority` int(1) NOT NULL,
  `message` mediumtext NOT NULL,
  PRIMARY KEY (`logId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mediaalbums`
--

CREATE TABLE IF NOT EXISTS `mediaalbums` (
  `albumId` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) NOT NULL DEFAULT '0',
  `albumName` varchar(255) NOT NULL,
  `userId` int(11) NOT NULL,
  `role` varchar(255) NOT NULL DEFAULT 'guest',
  `passWord` varchar(40) DEFAULT NULL,
  `albumDesc` mediumtext,
  `serverPath` varchar(255) NOT NULL,
  `timestamp` varchar(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`albumId`),
  KEY `albumName` (`albumName`,`userId`),
  KEY `role` (`role`),
  KEY `parentId` (`parentId`),
  KEY `serverPath` (`serverPath`),
  KEY `timestamp` (`timestamp`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `mediaalbums`
--

INSERT INTO `mediaalbums` (`albumId`, `parentId`, `albumName`, `userId`, `role`, `passWord`, `albumDesc`, `serverPath`, `timestamp`) VALUES
(-3, 0, 'Slider', 1, 'guest', NULL, NULL, '', '0'),
(-2, 0, 'Media', 1, 'guest', NULL, 'This is the default Album for the Media module. This album can not be deleted as the system is dependent upon it for correct operation.', '', '0'),
(-1, 0, 'Pages', 1, 'guest', NULL, 'This is the default Album for the Pages module. This album can not be deleted as the system is dependent upon it for correct operation.', '', '0'),
(1, -2, 'Default', 1, 'guest', NULL, NULL, 'Default', '0'),
(2, -2, 'testing', 0, 'guest', NULL, NULL, 'testing', '0'),
(3, -2, 'testing', 0, 'guest', NULL, NULL, 'testing', '0'),
(4, -2, 'Testing', 0, 'guest', NULL, NULL, 'Testing', '0');

-- --------------------------------------------------------

--
-- Table structure for table `mediafiles`
--

CREATE TABLE IF NOT EXISTS `mediafiles` (
  `fileId` int(11) NOT NULL AUTO_INCREMENT,
  `albumId` int(11) DEFAULT NULL,
  `fileName` varchar(255) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `alt` varchar(255) DEFAULT NULL,
  `description` mediumtext,
  `order` int(11) NOT NULL,
  `timestamp` varchar(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`fileId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `mediafiles`
--

INSERT INTO `mediafiles` (`fileId`, `albumId`, `fileName`, `title`, `alt`, `description`, `order`, `timestamp`) VALUES
(1, -3, 'slider-default-one.png', NULL, NULL, '', 0, '1353951475'),
(2, -3, 'slider-default-three.png', NULL, NULL, '', 0, '1353951475'),
(3, -3, 'slider-default-two.png', NULL, NULL, '', 0, '1353951476'),
(12, 2, 'Sites.png', NULL, NULL, '', 0, '1382387921'),
(13, 1, 'gps.JPG', NULL, NULL, '', 0, '1385565193'),
(14, 1, 'gps.JPG', NULL, NULL, '', 0, '1385565208'),
(15, 1, 'gps.JPG', NULL, NULL, '', 0, '1386003032'),
(16, 1, 'gps.JPG', NULL, NULL, '', 0, '1386343609'),
(17, 1, 'interior-01.jpg', NULL, NULL, '', 0, '1386359164'),
(18, 1, 'gps.JPG', NULL, NULL, '', 0, '1386601262');

-- --------------------------------------------------------

--
-- Table structure for table `modulesettings`
--

CREATE TABLE IF NOT EXISTS `modulesettings` (
  `moduleName` varchar(255) NOT NULL,
  `variable` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `settingType` tinytext NOT NULL,
  `role` varchar(255) NOT NULL DEFAULT 'admin',
  PRIMARY KEY (`variable`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `modulesettings`
--

INSERT INTO `modulesettings` (`moduleName`, `variable`, `value`, `settingType`, `role`) VALUES
('contact', 'addressLine1', '', 'TextBox', 'admin'),
('contact', 'addressLine2', '', 'TextBox', 'admin'),
('user', 'adminUserCountPerPage', '5', 'Text', 'dxadmin'),
('general', 'allowTags', '<h1>,<h2>,<h3>,<h4>,<h5>,<h6>,<hr>', 'Textarea', 'admin'),
('getaways', 'bottomImageHeight', '60', 'TextBox', 'admin'),
('getaways', 'bottomImageWidth', '200', 'TextBox', 'admin'),
('contact', 'contactFaxNumber', '', 'TextBox', 'admin'),
('contact', 'contactPhoneNumber', '', 'TextBox', 'admin'),
('contact', 'emailAddress', '', 'TextBox', 'admin'),
('general', 'enableCaptcha', '1', 'CheckBox', 'dxadmin'),
('contact', 'enableContactInfo', '1', 'CheckBox', 'admin'),
('general', 'enableDebugMode', '1', 'CheckBox', 'dxadmin'),
('general', 'enableFbOpenGraph', '0', 'CheckBox', 'dxadmin'),
('general', 'enableFbPageLink', '1', 'CheckBox', 'dxadmin'),
('general', 'enableHomeTab', '1', 'CheckBox', 'admin'),
('general', 'enableLinkLogo', '1', 'CheckBox', 'admin'),
('general', 'enableLogging', '1', 'CheckBox', 'dxadmin'),
('user', 'enableMainMenuLogin', '1', 'CheckBox', 'admin'),
('general', 'enableMobileSupport', '1', 'CheckBox', 'dxadmin'),
('media', 'enableOnHoverDescriptions', '0', 'CheckBox', 'dxadmin'),
('user', 'enableRegistration', '1', 'CheckBox', 'admin'),
('general', 'enableSearch', '1', 'CheckBox', 'dxadmin'),
('user', 'enableUserLogin', '1', 'CheckBox', 'dxadmin'),
('general', 'facebookAppId', '431812843521907', 'TextBox', 'dxadmin'),
('general', 'facebookAppSecret', 'd86702c59bd48f3a76bc57d923cd237e', 'TextBox', 'dxadmin'),
('contact', 'facebookUrl', 'http://www.facebook.com', 'TextBox', 'dxadmin'),
('general', 'homeDealsTitle', 'Deals', 'TextBox', 'admin'),
('general', 'homeEventsTitle', 'Events', 'TextBox', 'admin'),
('general', 'homeFeaturedTitle', 'Featured', 'TextBox', 'admin'),
('general', 'isInstalled', '0', 'CheckBox', 'dxadmin'),
('getaways', 'leftImageHeight', '60', 'TextBox', 'admin'),
('getaways', 'leftImageWidth', '60', 'TextBox', 'admin'),
('pages', 'lockCategories', '1', 'CheckBox', 'dxadmin'),
('general', 'mobileSkinName', 'jquery.mobile', 'TextBox', 'dxadmin'),
('general', 'remoteLicenseKey', 'SingleDomain18446aad51de8a3a596b594c3fcca5d137cf8c34', 'Textarea', 'dxadmin'),
('getaways', 'rightImageHeight', '200', 'TextBox', 'admin'),
('getaways', 'rightImageWidth', '60', 'TextBox', 'admin'),
('general', 'seoDescription', 'Custom CMS', 'Textarea', 'admin'),
('general', 'seoKeyWords', '', 'Textarea', 'admin'),
('general', 'sessionLength', '86400', 'TextBox', 'admin'),
('user', 'showEmail', '1', 'CheckBox', 'admin'),
('media', 'showFileDescription', '1', 'CheckBox', 'admin'),
('media', 'showFileTitleInGallery', '1', 'CheckBox', 'dxadmin'),
('media', 'showFileUploadTime', '0', 'CheckBox', 'dxadmin'),
('media', 'showMostRecentFirst', '1', 'CheckBox', 'dxadmin'),
('general', 'showOnlineList', '1', 'CheckBox', 'dxadmin'),
('pages', 'showPageHeading', '1', 'CheckBox', 'dxadmin'),
('media', 'showRecentByDate', '1', 'CheckBox', 'dxadmin'),
('media', 'showRecentCount', '4', 'TextBox', 'dxadmin'),
('media', 'showRecentImagesOnHome', '1', 'CheckBox', 'dxadmin'),
('media', 'showRecentInGallery', '1', 'CheckBox', 'dxadmin'),
('media', 'showRecentNumDays', '14', 'TextBox', 'dxadmin'),
('getaways', 'sidebarLabelFive', 'More Info', 'TextBox', 'dxadmin'),
('getaways', 'sidebarLabelFour', 'Contact', 'TextBox', 'dxadmin'),
('getaways', 'sidebarLabelThree', 'Website', 'TextBox', 'dxadmin'),
('getaways', 'sidebarLabelTwo', 'Location', 'TextBox', 'dxadmin'),
('general', 'siteEmail', 'testing@test.com', 'TextBox', 'admin'),
('general', 'siteName', 'Find Your Perfect Getaway', 'TextBox', 'admin'),
('getaways', 'topImageHeight', '50', 'TextBox', 'admin'),
('getaways', 'topImageWidth', '200', 'TextBox', 'admin'),
('contact', 'twitterUrl', 'http://www.twitter.com', 'TextBox', 'admin'),
('general', 'webMasterEmail', 'noreply@dirextion.com', 'TextBox', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `newsletter`
--

CREATE TABLE IF NOT EXISTS `newsletter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `company` varchar(255) NOT NULL,
  `type` enum('all','newsletter','offers','') NOT NULL DEFAULT 'all',
  `exported` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pagecomments`
--

CREATE TABLE IF NOT EXISTS `pagecomments` (
  `commentId` int(11) NOT NULL AUTO_INCREMENT,
  `pageId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `createdDate` int(11) NOT NULL,
  `modifiedDate` int(11) NOT NULL,
  `visibility` enum('public','private') NOT NULL,
  `commentText` longtext NOT NULL,
  PRIMARY KEY (`commentId`),
  KEY `pageId` (`pageId`,`userId`,`createdDate`,`modifiedDate`,`visibility`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pagefiles`
--

CREATE TABLE IF NOT EXISTS `pagefiles` (
  `fileId` int(11) NOT NULL AUTO_INCREMENT,
  `fileName` varchar(255) NOT NULL,
  `pageId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `isMainImage` int(1) DEFAULT NULL,
  PRIMARY KEY (`fileId`),
  KEY `pageId` (`pageId`,`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE IF NOT EXISTS `pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoryId` int(11) NOT NULL,
  `userId` int(11) NOT NULL DEFAULT '0',
  `role` varchar(100) NOT NULL DEFAULT 'guest',
  `label` varchar(50) NOT NULL,
  `isLanding` tinyint(1) NOT NULL DEFAULT '0',
  `featured` int(11) NOT NULL,
  `uri` varchar(255) NOT NULL COMMENT 'page is queried by this value',
  `visibility` enum('public','private') NOT NULL DEFAULT 'public',
  `createdDate` int(11) DEFAULT NULL,
  `publishDate` int(11) DEFAULT NULL,
  `modifiedDate` int(11) DEFAULT NULL,
  `archivedDate` int(11) DEFAULT NULL,
  `pageOrder` int(11) DEFAULT NULL,
  `content` longtext NOT NULL,
  `keyWords` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `reindex` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `featuredImage` varchar(255) DEFAULT NULL,
  `linkText` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`visibility`,`createdDate`,`modifiedDate`,`archivedDate`,`pageOrder`),
  KEY `role` (`role`),
  KEY `url` (`uri`),
  KEY `pageName` (`label`),
  KEY `categoryId` (`categoryId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=33 ;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `categoryId`, `userId`, `role`, `label`, `isLanding`, `featured`, `uri`, `visibility`, `createdDate`, `publishDate`, `modifiedDate`, `archivedDate`, `pageOrder`, `content`, `keyWords`, `description`, `reindex`, `image`, `featuredImage`, `linkText`) VALUES
(1, 1, 0, 'guest', 'Home', 1, 0, 'Site/Home', 'public', NULL, NULL, NULL, NULL, NULL, '<p><span style="color:#FFFFFF"><font face="arial, helvetica, sans"><span style="font-size:12px"><span style="background-color:#006400">Blah blah</span></span></font></span></p>\r\n', 'Aurora CMS, Site Management Software, Php, MySQL', 'This page is served via Aurora CMS, its really cool software.', 9000, NULL, NULL, 'Home page'),
(6, 3, 0, 'guest', 'About Us Home', 1, 0, 'About-Us/About-Us-Home', 'public', NULL, NULL, NULL, NULL, NULL, '<p><span style="font-size:16px"><span style="color:rgb(0, 0, 0); font-family:arial,helvetica,sans">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris vel orci id ante euismod commodo. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ac dapibus augue. Maecenas a sagittis erat. Aenean hendrerit ante non libero lacinia, sit amet congue lorem porttitor. Vivamus vel lectus vel velit mattis pretium. In ut erat sit amet orci eleifend pretium eu vel tortor.</span></span></p>\r\n\r\n<p><span style="font-size:16px"><span style="color:rgb(0, 0, 0); font-family:arial,helvetica,sans">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris vel orci id ante euismod commodo. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ac dapibus augue. Maecenas a sagittis erat. Aenean hendrerit ante non libero lacinia, sit amet congue lorem porttitor. Vivamus vel lectus vel velit mattis pretium. In ut erat sit amet orci eleifend pretium eu vel tortor.</span></span></p>\r\n\r\n<p><span style="font-size:16px"><span style="color:rgb(0, 0, 0); font-family:arial,helvetica,sans">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris vel orci id ante euismod commodo. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ac dapibus augue. Maecenas a sagittis erat. Aenean hendrerit ante non libero lacinia, sit amet congue lorem porttitor. Vivamus vel lectus vel velit mattis pretium. In ut erat sit amet orci eleifend pretium eu vel tortor.</span></span></p>\r\n\r\n<p><span style="font-size:16px"><span style="color:rgb(0, 0, 0); font-family:arial,helvetica,sans">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris vel orci id ante euismod commodo. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ac dapibus augue. Maecenas a sagittis erat. Aenean hendrerit ante non libero lacinia, sit amet congue lorem porttitor. Vivamus vel lectus vel velit mattis pretium. In ut erat sit amet orci eleifend pretium eu vel tortor.</span></span></p>\r\n', '', '', 0, NULL, NULL, ''),
(30, 17, 0, 'guest', 'test page', 1, 0, 'test1/test-page', 'public', NULL, NULL, NULL, NULL, NULL, '<p>grgrtsr</p>\r\n', '', '', 0, NULL, NULL, ''),
(31, 17, 0, 'Platinum_Level', 'test', 0, 1, 'test1/test', 'public', NULL, NULL, NULL, NULL, NULL, '<p>blah</p>\r\n', '', '', 0, NULL, NULL, ''),
(32, 5, 0, 'guest', 'New Section Intro', 1, 0, 'News/New-Section-Intro', 'public', NULL, NULL, NULL, NULL, NULL, '<p>This is the page that will serve as the landing area for the news section.</p>\r\n', 'News', 'Travel news that helps you find the best prices on the best trips', 5, NULL, NULL, 'New Intro');

-- --------------------------------------------------------

--
-- Table structure for table `page_categories`
--

CREATE TABLE IF NOT EXISTS `page_categories` (
  `rowId` int(11) NOT NULL AUTO_INCREMENT,
  `pageId` int(11) NOT NULL,
  `categoryId` int(11) NOT NULL,
  PRIMARY KEY (`rowId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Page To Category Intersection' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `page_categories`
--

INSERT INTO `page_categories` (`rowId`, `pageId`, `categoryId`) VALUES
(1, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `plugins`
--

CREATE TABLE IF NOT EXISTS `plugins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class` varchar(255) NOT NULL,
  `module` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `libNameSpace` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='holds all installed action helpers' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `plugins`
--

INSERT INTO `plugins` (`id`, `class`, `module`, `type`, `libNameSpace`) VALUES
(1, 'User_Plugin_LocationManager', 'User', 'Action', 'Locations_');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `roleId` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(255) NOT NULL,
  `inheritsFrom` varchar(255) NOT NULL,
  `publicName` varchar(100) NOT NULL,
  PRIMARY KEY (`roleId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`roleId`, `role`, `inheritsFrom`, `publicName`) VALUES
(1, 'admin', 'jradmin', 'Administrator'),
(2, 'jradmin', 'moderator', 'Jr. Administrator'),
(3, 'moderator', 'user', 'Moderator'),
(4, 'user', 'guest', 'Standard User'),
(5, 'guest', 'none', 'Guest'),
(6, 'Bronze_Level', 'user', 'Bronze Level'),
(7, 'Silver_Level', 'Bronze_Level', 'Silver Level'),
(8, 'Gold_Level', 'Silver_Level', 'Gold Level'),
(9, 'Platinum_Level', 'Gold_Level', 'Platinum Level');

-- --------------------------------------------------------

--
-- Table structure for table `session`
--

CREATE TABLE IF NOT EXISTS `session` (
  `id` char(32) NOT NULL DEFAULT '',
  `modified` int(11) DEFAULT NULL,
  `lifetime` int(11) DEFAULT NULL,
  `data` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `session`
--

INSERT INTO `session` (`id`, `modified`, `lifetime`, `data`) VALUES
('022d1imao685njpppcec41qjs2mpakht', 1397385888, 86400, '.Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.75.14 (KHTML, like Gecko) Version/7.0.3 Safari/537.75.14|a:1:{s:7:"storage";s:3154:"a:6:{s:12:"browser_type";s:7:"desktop";s:6:"config";a:3:{s:23:"identification_sequence";s:14:"mobile,desktop";s:7:"storage";a:1:{s:7:"adapter";s:7:"Session";}s:6:"mobile";a:1:{s:8:"features";a:1:{s:9:"classname";s:45:"Zend_Http_UserAgent_Features_Adapter_Browscap";}}}s:12:"device_class";s:27:"Zend_Http_UserAgent_Desktop";s:6:"device";s:2571:"a:6:{s:10:"_aFeatures";a:28:{s:21:"browser_compatibility";s:6:"Safari";s:14:"browser_engine";s:11:"AppleWebKit";s:12:"browser_name";s:6:"Safari";s:13:"browser_token";s:21:"Intel Mac OS X 10_9_2";s:15:"browser_version";s:5:"7.0.3";s:7:"comment";a:2:{s:4:"full";s:32:"Macintosh; Intel Mac OS X 10_9_2";s:6:"detail";a:2:{i:0;s:9:"Macintosh";i:1;s:22:" Intel Mac OS X 10_9_2";}}s:18:"compatibility_flag";s:9:"Macintosh";s:15:"device_os_token";s:9:"Macintosh";s:6:"others";a:2:{s:4:"full";s:72:"AppleWebKit/537.75.14 (KHTML, like Gecko) Version/7.0.3 Safari/537.75.14";s:6:"detail";a:3:{i:0;a:3:{i:0;s:41:"AppleWebKit/537.75.14 (KHTML, like Gecko)";i:1;s:11:"AppleWebKit";i:2;s:9:"537.75.14";}i:1;a:3:{i:0;s:13:"Version/7.0.3";i:1;s:7:"Version";i:2;s:5:"7.0.3";}i:2;a:3:{i:0;s:16:"Safari/537.75.14";i:1;s:6:"Safari";i:2;s:9:"537.75.14";}}}s:12:"product_name";s:7:"Mozilla";s:15:"product_version";s:3:"5.0";s:10:"user_agent";s:11:"Mozilla/5.0";s:18:"is_wireless_device";b:0;s:9:"is_mobile";b:0;s:10:"is_desktop";b:1;s:9:"is_tablet";b:0;s:6:"is_bot";b:0;s:8:"is_email";b:0;s:7:"is_text";b:0;s:25:"device_claims_web_support";b:0;s:9:"client_ip";s:12:"96.37.159.19";s:11:"php_version";s:6:"5.3.26";s:9:"server_os";s:6:"apache";s:17:"server_os_version";s:6:"2.2.24";s:18:"server_http_accept";s:63:"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8";s:27:"server_http_accept_language";s:5:"en-us";s:9:"server_ip";s:12:"192.168.1.16";s:11:"server_name";s:18:"fypg.dirextion.net";}s:7:"_aGroup";a:2:{s:12:"product_info";a:21:{i:0;s:21:"browser_compatibility";i:1;s:14:"browser_engine";i:2;s:12:"browser_name";i:3;s:13:"browser_token";i:4;s:15:"browser_version";i:5;s:7:"comment";i:6;s:18:"compatibility_flag";i:7;s:15:"device_os_token";i:8;s:6:"others";i:9;s:12:"product_name";i:10;s:15:"product_version";i:11;s:10:"user_agent";i:12;s:18:"is_wireless_device";i:13;s:9:"is_mobile";i:14;s:10:"is_desktop";i:15;s:9:"is_tablet";i:16;s:6:"is_bot";i:17;s:8:"is_email";i:18;s:7:"is_text";i:19;s:25:"device_claims_web_support";i:20;s:9:"client_ip";}s:11:"server_info";a:7:{i:0;s:11:"php_version";i:1;s:9:"server_os";i:2;s:17:"server_os_version";i:3;s:18:"server_http_accept";i:4;s:27:"server_http_accept_language";i:5;s:9:"server_ip";i:6;s:11:"server_name";}}s:8:"_browser";s:6:"Safari";s:15:"_browserVersion";s:5:"7.0.3";s:10:"_userAgent";s:119:"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.75.14 (KHTML, like Gecko) Version/7.0.3 Safari/537.75.14";s:7:"_images";a:6:{i:0;s:4:"jpeg";i:1;s:3:"gif";i:2;s:3:"png";i:3;s:5:"pjpeg";i:4;s:5:"x-png";i:5;s:3:"bmp";}}";s:10:"user_agent";s:119:"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.75.14 (KHTML, like Gecko) Version/7.0.3 Safari/537.75.14";s:11:"http_accept";s:63:"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8";}";}sysData|a:1:{s:12:"referringUri";s:14:"/events/search";}Zend_Auth|a:1:{s:7:"storage";O:8:"stdClass":3:{s:6:"userId";s:1:"0";s:8:"userName";s:7:"dxadmin";s:4:"role";s:7:"dxadmin";}}'),
('0nehte5vj8pn3r0435s7hkc8f4n8jk8j', 1397399143, 86400, '.Mozilla/5.0 (Android; Tablet; rv:23.0) Gecko/23.0 Firefox/23.0|a:1:{s:7:"storage";s:3120:"a:6:{s:12:"browser_type";s:6:"mobile";s:6:"config";a:3:{s:23:"identification_sequence";s:14:"mobile,desktop";s:7:"storage";a:1:{s:7:"adapter";s:7:"Session";}s:6:"mobile";a:1:{s:8:"features";a:1:{s:9:"classname";s:45:"Zend_Http_UserAgent_Features_Adapter_Browscap";}}}s:12:"device_class";s:26:"Zend_Http_UserAgent_Mobile";s:6:"device";s:2666:"a:6:{s:10:"_aFeatures";a:54:{s:21:"browser_compatibility";s:7:"Firefox";s:14:"browser_engine";s:5:"Gecko";s:12:"browser_name";s:15:"Default Browser";s:13:"browser_token";s:6:"Tablet";s:15:"browser_version";s:3:"0.0";s:7:"comment";s:15:"Default Browser";s:18:"compatibility_flag";s:7:"Android";s:15:"device_os_token";s:7:"rv:23.0";s:6:"others";a:2:{s:4:"full";s:23:"Gecko/23.0 Firefox/23.0";s:6:"detail";a:2:{i:0;a:3:{i:0;s:10:"Gecko/23.0";i:1;s:5:"Gecko";i:2;s:4:"23.0";}i:1;a:3:{i:0;s:12:"Firefox/23.0";i:1;s:7:"Firefox";i:2;s:4:"23.0";}}}s:12:"product_name";s:7:"Mozilla";s:15:"product_version";s:3:"5.0";s:10:"user_agent";s:11:"Mozilla/5.0";s:18:"is_wireless_device";b:0;s:9:"is_mobile";b:1;s:10:"is_desktop";b:0;s:9:"is_tablet";b:0;s:6:"is_bot";b:0;s:8:"is_email";b:0;s:7:"is_text";b:0;s:25:"device_claims_web_support";b:0;s:9:"client_ip";s:13:"64.53.243.105";s:11:"php_version";s:6:"5.3.26";s:9:"server_os";s:6:"apache";s:17:"server_os_version";s:6:"2.2.24";s:9:"server_ip";s:12:"192.168.1.16";s:11:"server_name";s:18:"fypg.dirextion.net";s:18:"browser_name_regex";s:6:"¤^.*$¤";s:20:"browser_name_pattern";s:1:"*";s:14:"mobile_browser";s:15:"Default Browser";s:22:"mobile_browser_version";s:3:"0.0";s:8:"majorver";s:1:"0";s:8:"minorver";s:1:"0";s:9:"device_os";s:7:"unknown";s:16:"platform_version";s:7:"unknown";s:5:"alpha";s:0:"";s:4:"beta";s:0:"";s:5:"win16";s:0:"";s:5:"win32";s:0:"";s:5:"win64";s:0:"";s:6:"frames";s:0:"";s:7:"iframes";s:0:"";s:6:"tables";s:0:"";s:7:"cookies";s:0:"";s:16:"backgroundsounds";s:0:"";s:10:"javascript";s:0:"";s:8:"vbscript";s:0:"";s:11:"javaapplets";s:0:"";s:15:"activexcontrols";s:0:"";s:14:"ismobiledevice";s:0:"";s:19:"issyndicationreader";s:0:"";s:7:"crawler";s:0:"";s:10:"cssversion";s:1:"0";s:10:"aolversion";s:1:"0";s:6:"markup";s:0:"";}s:7:"_aGroup";a:2:{s:12:"product_info";a:21:{i:0;s:21:"browser_compatibility";i:1;s:14:"browser_engine";i:2;s:12:"browser_name";i:3;s:13:"browser_token";i:4;s:15:"browser_version";i:5;s:7:"comment";i:6;s:18:"compatibility_flag";i:7;s:15:"device_os_token";i:8;s:6:"others";i:9;s:12:"product_name";i:10;s:15:"product_version";i:11;s:10:"user_agent";i:12;s:18:"is_wireless_device";i:13;s:9:"is_mobile";i:14;s:10:"is_desktop";i:15;s:9:"is_tablet";i:16;s:6:"is_bot";i:17;s:8:"is_email";i:18;s:7:"is_text";i:19;s:25:"device_claims_web_support";i:20;s:9:"client_ip";}s:11:"server_info";a:5:{i:0;s:11:"php_version";i:1;s:9:"server_os";i:2;s:17:"server_os_version";i:3;s:9:"server_ip";i:4;s:11:"server_name";}}s:8:"_browser";s:15:"Default Browser";s:15:"_browserVersion";s:3:"0.0";s:10:"_userAgent";s:62:"Mozilla/5.0 (Android; Tablet; rv:23.0) Gecko/23.0 Firefox/23.0";s:7:"_images";a:0:{}}";s:10:"user_agent";s:62:"Mozilla/5.0 (Android; Tablet; rv:23.0) Gecko/23.0 Firefox/23.0";s:11:"http_accept";N;}";}sysData|a:1:{s:12:"referringUri";s:12:"/favicon.ico";}'),
('14993oi125qp5lei2h6q3cq27u8g2it0', 1397404815, 86400, '.Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.75.14 (KHTML, like Gecko) Version/7.0.3 Safari/537.75.14|a:1:{s:7:"storage";s:3155:"a:6:{s:12:"browser_type";s:7:"desktop";s:6:"config";a:3:{s:23:"identification_sequence";s:14:"mobile,desktop";s:7:"storage";a:1:{s:7:"adapter";s:7:"Session";}s:6:"mobile";a:1:{s:8:"features";a:1:{s:9:"classname";s:45:"Zend_Http_UserAgent_Features_Adapter_Browscap";}}}s:12:"device_class";s:27:"Zend_Http_UserAgent_Desktop";s:6:"device";s:2572:"a:6:{s:10:"_aFeatures";a:28:{s:21:"browser_compatibility";s:6:"Safari";s:14:"browser_engine";s:11:"AppleWebKit";s:12:"browser_name";s:6:"Safari";s:13:"browser_token";s:21:"Intel Mac OS X 10_9_2";s:15:"browser_version";s:5:"7.0.3";s:7:"comment";a:2:{s:4:"full";s:32:"Macintosh; Intel Mac OS X 10_9_2";s:6:"detail";a:2:{i:0;s:9:"Macintosh";i:1;s:22:" Intel Mac OS X 10_9_2";}}s:18:"compatibility_flag";s:9:"Macintosh";s:15:"device_os_token";s:9:"Macintosh";s:6:"others";a:2:{s:4:"full";s:72:"AppleWebKit/537.75.14 (KHTML, like Gecko) Version/7.0.3 Safari/537.75.14";s:6:"detail";a:3:{i:0;a:3:{i:0;s:41:"AppleWebKit/537.75.14 (KHTML, like Gecko)";i:1;s:11:"AppleWebKit";i:2;s:9:"537.75.14";}i:1;a:3:{i:0;s:13:"Version/7.0.3";i:1;s:7:"Version";i:2;s:5:"7.0.3";}i:2;a:3:{i:0;s:16:"Safari/537.75.14";i:1;s:6:"Safari";i:2;s:9:"537.75.14";}}}s:12:"product_name";s:7:"Mozilla";s:15:"product_version";s:3:"5.0";s:10:"user_agent";s:11:"Mozilla/5.0";s:18:"is_wireless_device";b:0;s:9:"is_mobile";b:0;s:10:"is_desktop";b:1;s:9:"is_tablet";b:0;s:6:"is_bot";b:0;s:8:"is_email";b:0;s:7:"is_text";b:0;s:25:"device_claims_web_support";b:0;s:9:"client_ip";s:13:"64.53.243.105";s:11:"php_version";s:6:"5.3.26";s:9:"server_os";s:6:"apache";s:17:"server_os_version";s:6:"2.2.24";s:18:"server_http_accept";s:63:"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8";s:27:"server_http_accept_language";s:5:"en-us";s:9:"server_ip";s:12:"192.168.1.16";s:11:"server_name";s:18:"fypg.dirextion.net";}s:7:"_aGroup";a:2:{s:12:"product_info";a:21:{i:0;s:21:"browser_compatibility";i:1;s:14:"browser_engine";i:2;s:12:"browser_name";i:3;s:13:"browser_token";i:4;s:15:"browser_version";i:5;s:7:"comment";i:6;s:18:"compatibility_flag";i:7;s:15:"device_os_token";i:8;s:6:"others";i:9;s:12:"product_name";i:10;s:15:"product_version";i:11;s:10:"user_agent";i:12;s:18:"is_wireless_device";i:13;s:9:"is_mobile";i:14;s:10:"is_desktop";i:15;s:9:"is_tablet";i:16;s:6:"is_bot";i:17;s:8:"is_email";i:18;s:7:"is_text";i:19;s:25:"device_claims_web_support";i:20;s:9:"client_ip";}s:11:"server_info";a:7:{i:0;s:11:"php_version";i:1;s:9:"server_os";i:2;s:17:"server_os_version";i:3;s:18:"server_http_accept";i:4;s:27:"server_http_accept_language";i:5;s:9:"server_ip";i:6;s:11:"server_name";}}s:8:"_browser";s:6:"Safari";s:15:"_browserVersion";s:5:"7.0.3";s:10:"_userAgent";s:119:"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.75.14 (KHTML, like Gecko) Version/7.0.3 Safari/537.75.14";s:7:"_images";a:6:{i:0;s:4:"jpeg";i:1;s:3:"gif";i:2;s:3:"png";i:3;s:5:"pjpeg";i:4;s:5:"x-png";i:5;s:3:"bmp";}}";s:10:"user_agent";s:119:"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.75.14 (KHTML, like Gecko) Version/7.0.3 Safari/537.75.14";s:11:"http_accept";s:63:"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8";}";}sysData|a:1:{s:12:"referringUri";s:1:"/";}'),
('25b9ceps8ijrfb4pp04c6a00mha8hk2r', 1397378102, 86400, '.Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.75.14 (KHTML, like Gecko) Version/7.0.3 Safari/537.75.14|a:1:{s:7:"storage";s:3154:"a:6:{s:12:"browser_type";s:7:"desktop";s:6:"config";a:3:{s:23:"identification_sequence";s:14:"mobile,desktop";s:7:"storage";a:1:{s:7:"adapter";s:7:"Session";}s:6:"mobile";a:1:{s:8:"features";a:1:{s:9:"classname";s:45:"Zend_Http_UserAgent_Features_Adapter_Browscap";}}}s:12:"device_class";s:27:"Zend_Http_UserAgent_Desktop";s:6:"device";s:2571:"a:6:{s:10:"_aFeatures";a:28:{s:21:"browser_compatibility";s:6:"Safari";s:14:"browser_engine";s:11:"AppleWebKit";s:12:"browser_name";s:6:"Safari";s:13:"browser_token";s:21:"Intel Mac OS X 10_9_2";s:15:"browser_version";s:5:"7.0.3";s:7:"comment";a:2:{s:4:"full";s:32:"Macintosh; Intel Mac OS X 10_9_2";s:6:"detail";a:2:{i:0;s:9:"Macintosh";i:1;s:22:" Intel Mac OS X 10_9_2";}}s:18:"compatibility_flag";s:9:"Macintosh";s:15:"device_os_token";s:9:"Macintosh";s:6:"others";a:2:{s:4:"full";s:72:"AppleWebKit/537.75.14 (KHTML, like Gecko) Version/7.0.3 Safari/537.75.14";s:6:"detail";a:3:{i:0;a:3:{i:0;s:41:"AppleWebKit/537.75.14 (KHTML, like Gecko)";i:1;s:11:"AppleWebKit";i:2;s:9:"537.75.14";}i:1;a:3:{i:0;s:13:"Version/7.0.3";i:1;s:7:"Version";i:2;s:5:"7.0.3";}i:2;a:3:{i:0;s:16:"Safari/537.75.14";i:1;s:6:"Safari";i:2;s:9:"537.75.14";}}}s:12:"product_name";s:7:"Mozilla";s:15:"product_version";s:3:"5.0";s:10:"user_agent";s:11:"Mozilla/5.0";s:18:"is_wireless_device";b:0;s:9:"is_mobile";b:0;s:10:"is_desktop";b:1;s:9:"is_tablet";b:0;s:6:"is_bot";b:0;s:8:"is_email";b:0;s:7:"is_text";b:0;s:25:"device_claims_web_support";b:0;s:9:"client_ip";s:12:"96.37.159.19";s:11:"php_version";s:6:"5.3.26";s:9:"server_os";s:6:"apache";s:17:"server_os_version";s:6:"2.2.24";s:18:"server_http_accept";s:63:"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8";s:27:"server_http_accept_language";s:5:"en-us";s:9:"server_ip";s:12:"192.168.1.16";s:11:"server_name";s:18:"fypg.dirextion.net";}s:7:"_aGroup";a:2:{s:12:"product_info";a:21:{i:0;s:21:"browser_compatibility";i:1;s:14:"browser_engine";i:2;s:12:"browser_name";i:3;s:13:"browser_token";i:4;s:15:"browser_version";i:5;s:7:"comment";i:6;s:18:"compatibility_flag";i:7;s:15:"device_os_token";i:8;s:6:"others";i:9;s:12:"product_name";i:10;s:15:"product_version";i:11;s:10:"user_agent";i:12;s:18:"is_wireless_device";i:13;s:9:"is_mobile";i:14;s:10:"is_desktop";i:15;s:9:"is_tablet";i:16;s:6:"is_bot";i:17;s:8:"is_email";i:18;s:7:"is_text";i:19;s:25:"device_claims_web_support";i:20;s:9:"client_ip";}s:11:"server_info";a:7:{i:0;s:11:"php_version";i:1;s:9:"server_os";i:2;s:17:"server_os_version";i:3;s:18:"server_http_accept";i:4;s:27:"server_http_accept_language";i:5;s:9:"server_ip";i:6;s:11:"server_name";}}s:8:"_browser";s:6:"Safari";s:15:"_browserVersion";s:5:"7.0.3";s:10:"_userAgent";s:119:"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.75.14 (KHTML, like Gecko) Version/7.0.3 Safari/537.75.14";s:7:"_images";a:6:{i:0;s:4:"jpeg";i:1;s:3:"gif";i:2;s:3:"png";i:3;s:5:"pjpeg";i:4;s:5:"x-png";i:5;s:3:"bmp";}}";s:10:"user_agent";s:119:"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.75.14 (KHTML, like Gecko) Version/7.0.3 Safari/537.75.14";s:11:"http_accept";s:63:"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8";}";}sysData|a:1:{s:12:"referringUri";s:7:"/events";}'),
('3osuh0mt89sku9808orhj5q2srr72oe8', 1397406554, 86400, '.Mozilla/5.0 (Linux; U; Android 2.3.3; en-us; DROIDX Build/4.5.1_57_DX5-3) AppleWebKit/533.1 (KHTML, like Gecko) Version/4.0 Mobile Safari/533.1|a:1:{s:7:"storage";s:4135:"a:6:{s:12:"browser_type";s:6:"mobile";s:6:"config";a:3:{s:23:"identification_sequence";s:14:"mobile,desktop";s:7:"storage";a:1:{s:7:"adapter";s:7:"Session";}s:6:"mobile";a:1:{s:8:"features";a:1:{s:9:"classname";s:45:"Zend_Http_UserAgent_Features_Adapter_Browscap";}}}s:12:"device_class";s:26:"Zend_Http_UserAgent_Mobile";s:6:"device";s:3503:"a:6:{s:10:"_aFeatures";a:58:{s:21:"browser_compatibility";s:6:"Safari";s:14:"browser_engine";s:11:"AppleWebKit";s:16:"browser_language";s:5:"en-us";s:12:"browser_name";s:7:"Android";s:15:"browser_version";s:3:"4.0";s:7:"comment";s:19:"Android Browser 4.0";s:18:"compatibility_flag";s:5:"Linux";s:15:"device_os_token";s:13:"Android 2.3.3";s:6:"others";a:2:{s:4:"full";s:69:"AppleWebKit/533.1 (KHTML, like Gecko) Version/4.0 Mobile Safari/533.1";s:6:"detail";a:4:{i:0;a:3:{i:0;s:37:"AppleWebKit/533.1 (KHTML, like Gecko)";i:1;s:11:"AppleWebKit";i:2;s:5:"533.1";}i:1;a:3:{i:0;s:11:"Version/4.0";i:1;s:7:"Version";i:2;s:3:"4.0";}i:2;a:3:{i:0;s:6:"Mobile";i:1;s:6:"Mobile";i:2;s:0:"";}i:3;a:3:{i:0;s:12:"Safari/533.1";i:1;s:6:"Safari";i:2;s:5:"533.1";}}}s:12:"product_name";s:7:"Mozilla";s:15:"product_version";s:3:"5.0";s:14:"security_level";s:15:"strong security";s:10:"user_agent";s:11:"Mozilla/5.0";s:18:"is_wireless_device";b:0;s:9:"is_mobile";b:1;s:10:"is_desktop";b:0;s:9:"is_tablet";b:0;s:6:"is_bot";b:0;s:8:"is_email";b:0;s:7:"is_text";b:0;s:25:"device_claims_web_support";b:0;s:9:"client_ip";s:14:"174.251.82.231";s:11:"php_version";s:6:"5.3.26";s:9:"server_os";s:6:"apache";s:17:"server_os_version";s:6:"2.2.24";s:18:"server_http_accept";s:90:"application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5";s:27:"server_http_accept_language";s:5:"en-US";s:9:"server_ip";s:12:"192.168.1.16";s:11:"server_name";s:18:"fypg.dirextion.net";s:18:"browser_name_regex";s:115:"¤^mozilla/5\\.0 \\(linux.*android 2\\.3.*\\).*applewebkit/.*\\(.*khtml, like gecko.*\\).*version/4\\.0.*mobile safari/.*$¤";s:20:"browser_name_pattern";s:95:"Mozilla/5.0 (Linux*Android 2.3*)*AppleWebKit/*(*KHTML, like Gecko*)*Version/4.0*Mobile Safari/*";s:6:"parent";s:19:"Android Browser 4.0";s:16:"platform_version";s:3:"2.3";s:14:"mobile_browser";s:7:"Android";s:22:"mobile_browser_version";s:3:"4.0";s:8:"majorver";s:1:"4";s:8:"minorver";s:1:"0";s:9:"device_os";s:7:"Android";s:6:"frames";s:1:"1";s:7:"iframes";s:1:"1";s:6:"tables";s:1:"1";s:7:"cookies";s:1:"1";s:10:"javascript";s:1:"1";s:14:"ismobiledevice";s:1:"1";s:10:"cssversion";s:1:"3";s:5:"alpha";s:0:"";s:4:"beta";s:0:"";s:5:"win16";s:0:"";s:5:"win32";s:0:"";s:5:"win64";s:0:"";s:16:"backgroundsounds";s:0:"";s:8:"vbscript";s:0:"";s:11:"javaapplets";s:0:"";s:15:"activexcontrols";s:0:"";s:19:"issyndicationreader";s:0:"";s:7:"crawler";s:0:"";s:10:"aolversion";s:1:"0";s:6:"markup";s:0:"";}s:7:"_aGroup";a:2:{s:12:"product_info";a:22:{i:0;s:21:"browser_compatibility";i:1;s:14:"browser_engine";i:2;s:16:"browser_language";i:3;s:12:"browser_name";i:4;s:15:"browser_version";i:5;s:7:"comment";i:6;s:18:"compatibility_flag";i:7;s:15:"device_os_token";i:8;s:6:"others";i:9;s:12:"product_name";i:10;s:15:"product_version";i:11;s:14:"security_level";i:12;s:10:"user_agent";i:13;s:18:"is_wireless_device";i:14;s:9:"is_mobile";i:15;s:10:"is_desktop";i:16;s:9:"is_tablet";i:17;s:6:"is_bot";i:18;s:8:"is_email";i:19;s:7:"is_text";i:20;s:25:"device_claims_web_support";i:21;s:9:"client_ip";}s:11:"server_info";a:7:{i:0;s:11:"php_version";i:1;s:9:"server_os";i:2;s:17:"server_os_version";i:3;s:18:"server_http_accept";i:4;s:27:"server_http_accept_language";i:5;s:9:"server_ip";i:6;s:11:"server_name";}}s:8:"_browser";s:7:"Android";s:15:"_browserVersion";s:3:"4.0";s:10:"_userAgent";s:143:"Mozilla/5.0 (Linux; U; Android 2.3.3; en-us; DROIDX Build/4.5.1_57_DX5-3) AppleWebKit/533.1 (KHTML, like Gecko) Version/4.0 Mobile Safari/533.1";s:7:"_images";a:0:{}}";s:10:"user_agent";s:143:"Mozilla/5.0 (Linux; U; Android 2.3.3; en-us; DROIDX Build/4.5.1_57_DX5-3) AppleWebKit/533.1 (KHTML, like Gecko) Version/4.0 Mobile Safari/533.1";s:11:"http_accept";s:90:"application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5";}";}sysData|a:1:{s:12:"referringUri";s:1:"/";}'),
('5045vv448aujii3rgg0cg258agbg176v', 1397634588, 86400, '.Mozilla/5.0 (iPhone; CPU iPhone OS 7_0_6 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11B651 Safari/9537.53|a:1:{s:7:"storage";s:4141:"a:6:{s:12:"browser_type";s:6:"mobile";s:6:"config";a:3:{s:23:"identification_sequence";s:14:"mobile,desktop";s:7:"storage";a:1:{s:7:"adapter";s:7:"Session";}s:6:"mobile";a:1:{s:8:"features";a:1:{s:9:"classname";s:45:"Zend_Http_UserAgent_Features_Adapter_Browscap";}}}s:12:"device_class";s:26:"Zend_Http_UserAgent_Mobile";s:6:"device";s:3542:"a:6:{s:10:"_aFeatures";a:60:{s:13:"browser_build";s:7:"9537.53";s:21:"browser_compatibility";s:6:"Safari";s:14:"browser_engine";s:11:"AppleWebKit";s:12:"browser_name";s:6:"Safari";s:13:"browser_token";s:33:"CPU iPhone OS 7_0_6 like Mac OS X";s:15:"browser_version";s:3:"0.0";s:7:"comment";s:14:"Safari Generic";s:18:"compatibility_flag";s:6:"iPhone";s:6:"device";s:6:"iphone";s:15:"device_os_token";s:9:"iPhone OS";s:8:"firmware";s:6:"11B651";s:6:"others";a:2:{s:4:"full";s:81:"AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11B651 Safari/9537.53";s:6:"detail";a:4:{i:0;a:3:{i:0;s:40:"AppleWebKit/537.51.1 (KHTML, like Gecko)";i:1;s:11:"AppleWebKit";i:2;s:8:"537.51.1";}i:1;a:3:{i:0;s:11:"Version/7.0";i:1;s:7:"Version";i:2;s:3:"7.0";}i:2;a:3:{i:0;s:13:"Mobile/11B651";i:1;s:6:"Mobile";i:2;s:6:"11B651";}i:3;a:3:{i:0;s:14:"Safari/9537.53";i:1;s:6:"Safari";i:2;s:7:"9537.53";}}}s:12:"product_name";s:7:"Mozilla";s:15:"product_version";s:3:"5.0";s:10:"user_agent";s:11:"Mozilla/5.0";s:18:"is_wireless_device";b:0;s:9:"is_mobile";b:1;s:10:"is_desktop";b:0;s:9:"is_tablet";b:0;s:6:"is_bot";b:0;s:8:"is_email";b:0;s:7:"is_text";b:0;s:25:"device_claims_web_support";b:0;s:9:"client_ip";s:12:"96.37.159.19";s:11:"php_version";s:6:"5.3.26";s:9:"server_os";s:6:"apache";s:17:"server_os_version";s:6:"2.2.24";s:18:"server_http_accept";s:63:"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8";s:27:"server_http_accept_language";s:5:"en-us";s:9:"server_ip";s:12:"192.168.1.16";s:11:"server_name";s:18:"fypg.dirextion.net";s:18:"browser_name_regex";s:84:"¤^mozilla/5\\.0 \\(.*mac os x.*\\) .*applewebkit/.* \\(khtml, like gecko\\) .*safari/.*$¤";s:20:"browser_name_pattern";s:69:"Mozilla/5.0 (*Mac OS X*) *AppleWebKit/* (KHTML, like Gecko) *Safari/*";s:6:"parent";s:14:"Safari Generic";s:9:"device_os";s:6:"MacOSX";s:14:"mobile_browser";s:6:"Safari";s:6:"frames";s:1:"1";s:7:"iframes";s:1:"1";s:6:"tables";s:1:"1";s:7:"cookies";s:1:"1";s:10:"javascript";s:1:"1";s:11:"javaapplets";s:1:"1";s:10:"cssversion";s:1:"1";s:22:"mobile_browser_version";s:3:"0.0";s:8:"majorver";s:1:"0";s:8:"minorver";s:1:"0";s:16:"platform_version";s:7:"unknown";s:5:"alpha";s:0:"";s:4:"beta";s:0:"";s:5:"win16";s:0:"";s:5:"win32";s:0:"";s:5:"win64";s:0:"";s:16:"backgroundsounds";s:0:"";s:8:"vbscript";s:0:"";s:15:"activexcontrols";s:0:"";s:14:"ismobiledevice";s:0:"";s:19:"issyndicationreader";s:0:"";s:7:"crawler";s:0:"";s:10:"aolversion";s:1:"0";s:6:"markup";s:6:"iphone";}s:7:"_aGroup";a:2:{s:12:"product_info";a:24:{i:0;s:13:"browser_build";i:1;s:21:"browser_compatibility";i:2;s:14:"browser_engine";i:3;s:12:"browser_name";i:4;s:13:"browser_token";i:5;s:15:"browser_version";i:6;s:7:"comment";i:7;s:18:"compatibility_flag";i:8;s:6:"device";i:9;s:15:"device_os_token";i:10;s:8:"firmware";i:11;s:6:"others";i:12;s:12:"product_name";i:13;s:15:"product_version";i:14;s:10:"user_agent";i:15;s:18:"is_wireless_device";i:16;s:9:"is_mobile";i:17;s:10:"is_desktop";i:18;s:9:"is_tablet";i:19;s:6:"is_bot";i:20;s:8:"is_email";i:21;s:7:"is_text";i:22;s:25:"device_claims_web_support";i:23;s:9:"client_ip";}s:11:"server_info";a:7:{i:0;s:11:"php_version";i:1;s:9:"server_os";i:2;s:17:"server_os_version";i:3;s:18:"server_http_accept";i:4;s:27:"server_http_accept_language";i:5;s:9:"server_ip";i:6;s:11:"server_name";}}s:8:"_browser";s:6:"Safari";s:15:"_browserVersion";s:3:"0.0";s:10:"_userAgent";s:137:"Mozilla/5.0 (iPhone; CPU iPhone OS 7_0_6 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11B651 Safari/9537.53";s:7:"_images";a:0:{}}";s:10:"user_agent";s:137:"Mozilla/5.0 (iPhone; CPU iPhone OS 7_0_6 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11B651 Safari/9537.53";s:11:"http_accept";s:63:"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8";}";}sysData|a:1:{s:12:"referringUri";s:7:"/events";}'),
('6q3qrmdj9rrks46jbnleej6slull2o51', 1397361882, 86400, '.Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.75.14 (KHTML, like Gecko) Version/7.0.3 Safari/537.75.14|a:1:{s:7:"storage";s:3154:"a:6:{s:12:"browser_type";s:7:"desktop";s:6:"config";a:3:{s:23:"identification_sequence";s:14:"mobile,desktop";s:7:"storage";a:1:{s:7:"adapter";s:7:"Session";}s:6:"mobile";a:1:{s:8:"features";a:1:{s:9:"classname";s:45:"Zend_Http_UserAgent_Features_Adapter_Browscap";}}}s:12:"device_class";s:27:"Zend_Http_UserAgent_Desktop";s:6:"device";s:2571:"a:6:{s:10:"_aFeatures";a:28:{s:21:"browser_compatibility";s:6:"Safari";s:14:"browser_engine";s:11:"AppleWebKit";s:12:"browser_name";s:6:"Safari";s:13:"browser_token";s:21:"Intel Mac OS X 10_9_2";s:15:"browser_version";s:5:"7.0.3";s:7:"comment";a:2:{s:4:"full";s:32:"Macintosh; Intel Mac OS X 10_9_2";s:6:"detail";a:2:{i:0;s:9:"Macintosh";i:1;s:22:" Intel Mac OS X 10_9_2";}}s:18:"compatibility_flag";s:9:"Macintosh";s:15:"device_os_token";s:9:"Macintosh";s:6:"others";a:2:{s:4:"full";s:72:"AppleWebKit/537.75.14 (KHTML, like Gecko) Version/7.0.3 Safari/537.75.14";s:6:"detail";a:3:{i:0;a:3:{i:0;s:41:"AppleWebKit/537.75.14 (KHTML, like Gecko)";i:1;s:11:"AppleWebKit";i:2;s:9:"537.75.14";}i:1;a:3:{i:0;s:13:"Version/7.0.3";i:1;s:7:"Version";i:2;s:5:"7.0.3";}i:2;a:3:{i:0;s:16:"Safari/537.75.14";i:1;s:6:"Safari";i:2;s:9:"537.75.14";}}}s:12:"product_name";s:7:"Mozilla";s:15:"product_version";s:3:"5.0";s:10:"user_agent";s:11:"Mozilla/5.0";s:18:"is_wireless_device";b:0;s:9:"is_mobile";b:0;s:10:"is_desktop";b:1;s:9:"is_tablet";b:0;s:6:"is_bot";b:0;s:8:"is_email";b:0;s:7:"is_text";b:0;s:25:"device_claims_web_support";b:0;s:9:"client_ip";s:12:"96.37.159.19";s:11:"php_version";s:6:"5.3.26";s:9:"server_os";s:6:"apache";s:17:"server_os_version";s:6:"2.2.24";s:18:"server_http_accept";s:63:"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8";s:27:"server_http_accept_language";s:5:"en-us";s:9:"server_ip";s:12:"192.168.1.16";s:11:"server_name";s:18:"fypg.dirextion.net";}s:7:"_aGroup";a:2:{s:12:"product_info";a:21:{i:0;s:21:"browser_compatibility";i:1;s:14:"browser_engine";i:2;s:12:"browser_name";i:3;s:13:"browser_token";i:4;s:15:"browser_version";i:5;s:7:"comment";i:6;s:18:"compatibility_flag";i:7;s:15:"device_os_token";i:8;s:6:"others";i:9;s:12:"product_name";i:10;s:15:"product_version";i:11;s:10:"user_agent";i:12;s:18:"is_wireless_device";i:13;s:9:"is_mobile";i:14;s:10:"is_desktop";i:15;s:9:"is_tablet";i:16;s:6:"is_bot";i:17;s:8:"is_email";i:18;s:7:"is_text";i:19;s:25:"device_claims_web_support";i:20;s:9:"client_ip";}s:11:"server_info";a:7:{i:0;s:11:"php_version";i:1;s:9:"server_os";i:2;s:17:"server_os_version";i:3;s:18:"server_http_accept";i:4;s:27:"server_http_accept_language";i:5;s:9:"server_ip";i:6;s:11:"server_name";}}s:8:"_browser";s:6:"Safari";s:15:"_browserVersion";s:5:"7.0.3";s:10:"_userAgent";s:119:"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.75.14 (KHTML, like Gecko) Version/7.0.3 Safari/537.75.14";s:7:"_images";a:6:{i:0;s:4:"jpeg";i:1;s:3:"gif";i:2;s:3:"png";i:3;s:5:"pjpeg";i:4;s:5:"x-png";i:5;s:3:"bmp";}}";s:10:"user_agent";s:119:"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.75.14 (KHTML, like Gecko) Version/7.0.3 Safari/537.75.14";s:11:"http_accept";s:63:"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8";}";}sysData|a:1:{s:12:"referringUri";s:9:"/getaways";}'),
('9g345bfhpt8bgpe60oncraiuukdopa8t', 1397492229, 86400, '.Mozilla/5.0 (iPad; U; CPU OS 4_3 like Mac OS X; en-us) AppleWebKit/533.17.9 (KHTML, like Gecko) Version/5.0.2 Mobile/8F192 Safari/6533.18.5|a:1:{s:7:"storage";s:4344:"a:6:{s:12:"browser_type";s:6:"mobile";s:6:"config";a:3:{s:23:"identification_sequence";s:14:"mobile,desktop";s:7:"storage";a:1:{s:7:"adapter";s:7:"Session";}s:6:"mobile";a:1:{s:8:"features";a:1:{s:9:"classname";s:45:"Zend_Http_UserAgent_Features_Adapter_Browscap";}}}s:12:"device_class";s:26:"Zend_Http_UserAgent_Mobile";s:6:"device";s:3716:"a:6:{s:10:"_aFeatures";a:61:{s:13:"browser_build";s:9:"6533.18.5";s:21:"browser_compatibility";s:6:"Safari";s:14:"browser_engine";s:11:"AppleWebKit";s:16:"browser_language";s:5:"en-us";s:12:"browser_name";s:6:"Safari";s:15:"browser_version";s:3:"5.0";s:7:"comment";s:17:"Mobile Safari 5.0";s:18:"compatibility_flag";s:4:"iPad";s:6:"device";s:4:"ipad";s:15:"device_os_token";s:9:"iPhone OS";s:8:"firmware";s:5:"8F192";s:6:"others";a:2:{s:4:"full";s:84:"AppleWebKit/533.17.9 (KHTML, like Gecko) Version/5.0.2 Mobile/8F192 Safari/6533.18.5";s:6:"detail";a:4:{i:0;a:3:{i:0;s:40:"AppleWebKit/533.17.9 (KHTML, like Gecko)";i:1;s:11:"AppleWebKit";i:2;s:8:"533.17.9";}i:1;a:3:{i:0;s:13:"Version/5.0.2";i:1;s:7:"Version";i:2;s:5:"5.0.2";}i:2;a:3:{i:0;s:12:"Mobile/8F192";i:1;s:6:"Mobile";i:2;s:5:"8F192";}i:3;a:3:{i:0;s:16:"Safari/6533.18.5";i:1;s:6:"Safari";i:2;s:9:"6533.18.5";}}}s:12:"product_name";s:7:"Mozilla";s:15:"product_version";s:3:"5.0";s:14:"security_level";s:15:"strong security";s:10:"user_agent";s:11:"Mozilla/5.0";s:18:"is_wireless_device";b:0;s:9:"is_mobile";b:1;s:10:"is_desktop";b:0;s:9:"is_tablet";b:0;s:6:"is_bot";b:0;s:8:"is_email";b:0;s:7:"is_text";b:0;s:25:"device_claims_web_support";b:0;s:9:"client_ip";s:11:"192.168.1.1";s:11:"php_version";s:6:"5.3.26";s:9:"server_os";s:6:"apache";s:17:"server_os_version";s:6:"2.2.24";s:18:"server_http_accept";s:90:"application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5";s:27:"server_http_accept_language";s:5:"en-us";s:9:"server_ip";s:12:"192.168.1.16";s:11:"server_name";s:18:"fypg.dirextion.net";s:18:"browser_name_regex";s:133:"¤^mozilla/5\\.0 \\(ipad.*cpu.*os 4_3.* like mac os x.*\\).*applewebkit/.*\\(.*khtml, like gecko.*\\).*version/5\\.0\\..*mobile/.*safari/.*$¤";s:20:"browser_name_pattern";s:110:"Mozilla/5.0 (iPad*CPU*OS 4_3* like Mac OS X*)*AppleWebKit/*(*KHTML, like Gecko*)*Version/5.0.*Mobile/*Safari/*";s:6:"parent";s:17:"Mobile Safari 5.0";s:16:"platform_version";s:3:"4.3";s:14:"mobile_browser";s:6:"Safari";s:22:"mobile_browser_version";s:3:"5.0";s:8:"majorver";s:1:"5";s:8:"minorver";s:1:"0";s:9:"device_os";s:3:"iOS";s:6:"frames";s:1:"1";s:7:"iframes";s:1:"1";s:6:"tables";s:1:"1";s:7:"cookies";s:1:"1";s:10:"javascript";s:1:"1";s:14:"ismobiledevice";s:1:"1";s:10:"cssversion";s:1:"3";s:5:"alpha";s:0:"";s:4:"beta";s:0:"";s:5:"win16";s:0:"";s:5:"win32";s:0:"";s:5:"win64";s:0:"";s:16:"backgroundsounds";s:0:"";s:8:"vbscript";s:0:"";s:11:"javaapplets";s:0:"";s:15:"activexcontrols";s:0:"";s:19:"issyndicationreader";s:0:"";s:7:"crawler";s:0:"";s:10:"aolversion";s:1:"0";s:6:"markup";s:6:"iphone";}s:7:"_aGroup";a:2:{s:12:"product_info";a:25:{i:0;s:13:"browser_build";i:1;s:21:"browser_compatibility";i:2;s:14:"browser_engine";i:3;s:16:"browser_language";i:4;s:12:"browser_name";i:5;s:15:"browser_version";i:6;s:7:"comment";i:7;s:18:"compatibility_flag";i:8;s:6:"device";i:9;s:15:"device_os_token";i:10;s:8:"firmware";i:11;s:6:"others";i:12;s:12:"product_name";i:13;s:15:"product_version";i:14;s:14:"security_level";i:15;s:10:"user_agent";i:16;s:18:"is_wireless_device";i:17;s:9:"is_mobile";i:18;s:10:"is_desktop";i:19;s:9:"is_tablet";i:20;s:6:"is_bot";i:21;s:8:"is_email";i:22;s:7:"is_text";i:23;s:25:"device_claims_web_support";i:24;s:9:"client_ip";}s:11:"server_info";a:7:{i:0;s:11:"php_version";i:1;s:9:"server_os";i:2;s:17:"server_os_version";i:3;s:18:"server_http_accept";i:4;s:27:"server_http_accept_language";i:5;s:9:"server_ip";i:6;s:11:"server_name";}}s:8:"_browser";s:6:"Safari";s:15:"_browserVersion";s:3:"5.0";s:10:"_userAgent";s:139:"Mozilla/5.0 (iPad; U; CPU OS 4_3 like Mac OS X; en-us) AppleWebKit/533.17.9 (KHTML, like Gecko) Version/5.0.2 Mobile/8F192 Safari/6533.18.5";s:7:"_images";a:0:{}}";s:10:"user_agent";s:139:"Mozilla/5.0 (iPad; U; CPU OS 4_3 like Mac OS X; en-us) AppleWebKit/533.17.9 (KHTML, like Gecko) Version/5.0.2 Mobile/8F192 Safari/6533.18.5";s:11:"http_accept";s:90:"application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5";}";}sysData|a:1:{s:12:"referringUri";s:1:"/";}'),
('daa1dk61hlu1j218khbt0ivn8ks47lnu', 1397391175, 86400, '.Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:24.0) Gecko/20100101 Firefox/24.0|a:1:{s:7:"storage";s:2979:"a:6:{s:12:"browser_type";s:7:"desktop";s:6:"config";a:3:{s:23:"identification_sequence";s:14:"mobile,desktop";s:7:"storage";a:1:{s:7:"adapter";s:7:"Session";}s:6:"mobile";a:1:{s:8:"features";a:1:{s:9:"classname";s:45:"Zend_Http_UserAgent_Features_Adapter_Browscap";}}}s:12:"device_class";s:27:"Zend_Http_UserAgent_Desktop";s:6:"device";s:2442:"a:6:{s:10:"_aFeatures";a:29:{s:21:"browser_compatibility";s:7:"Firefox";s:14:"browser_engine";s:5:"Gecko";s:16:"browser_language";s:7:"rv:24.0";s:12:"browser_name";s:7:"Firefox";s:13:"browser_token";s:6:"Ubuntu";s:15:"browser_version";s:4:"24.0";s:7:"comment";a:2:{s:4:"full";s:32:"X11; Ubuntu; Linux i686; rv:24.0";s:6:"detail";a:4:{i:0;s:3:"X11";i:1;s:7:" Ubuntu";i:2;s:11:" Linux i686";i:3;s:8:" rv:24.0";}}s:18:"compatibility_flag";s:3:"X11";s:15:"device_os_token";s:10:"Linux i686";s:6:"others";a:2:{s:4:"full";s:27:"Gecko/20100101 Firefox/24.0";s:6:"detail";a:2:{i:0;a:3:{i:0;s:14:"Gecko/20100101";i:1;s:5:"Gecko";i:2;s:8:"20100101";}i:1;a:3:{i:0;s:12:"Firefox/24.0";i:1;s:7:"Firefox";i:2;s:4:"24.0";}}}s:12:"product_name";s:7:"Mozilla";s:15:"product_version";s:3:"5.0";s:10:"user_agent";s:11:"Mozilla/5.0";s:18:"is_wireless_device";b:0;s:9:"is_mobile";b:0;s:10:"is_desktop";b:1;s:9:"is_tablet";b:0;s:6:"is_bot";b:0;s:8:"is_email";b:0;s:7:"is_text";b:0;s:25:"device_claims_web_support";b:0;s:9:"client_ip";s:15:"174.252.161.102";s:11:"php_version";s:6:"5.3.26";s:9:"server_os";s:6:"apache";s:17:"server_os_version";s:6:"2.2.24";s:18:"server_http_accept";s:63:"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8";s:27:"server_http_accept_language";s:14:"en-US,en;q=0.5";s:9:"server_ip";s:12:"192.168.1.16";s:11:"server_name";s:18:"fypg.dirextion.net";}s:7:"_aGroup";a:2:{s:12:"product_info";a:22:{i:0;s:21:"browser_compatibility";i:1;s:14:"browser_engine";i:2;s:16:"browser_language";i:3;s:12:"browser_name";i:4;s:13:"browser_token";i:5;s:15:"browser_version";i:6;s:7:"comment";i:7;s:18:"compatibility_flag";i:8;s:15:"device_os_token";i:9;s:6:"others";i:10;s:12:"product_name";i:11;s:15:"product_version";i:12;s:10:"user_agent";i:13;s:18:"is_wireless_device";i:14;s:9:"is_mobile";i:15;s:10:"is_desktop";i:16;s:9:"is_tablet";i:17;s:6:"is_bot";i:18;s:8:"is_email";i:19;s:7:"is_text";i:20;s:25:"device_claims_web_support";i:21;s:9:"client_ip";}s:11:"server_info";a:7:{i:0;s:11:"php_version";i:1;s:9:"server_os";i:2;s:17:"server_os_version";i:3;s:18:"server_http_accept";i:4;s:27:"server_http_accept_language";i:5;s:9:"server_ip";i:6;s:11:"server_name";}}s:8:"_browser";s:7:"Firefox";s:15:"_browserVersion";s:4:"24.0";s:10:"_userAgent";s:74:"Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:24.0) Gecko/20100101 Firefox/24.0";s:7:"_images";a:6:{i:0;s:4:"jpeg";i:1;s:3:"gif";i:2;s:3:"png";i:3;s:5:"pjpeg";i:4;s:5:"x-png";i:5;s:3:"bmp";}}";s:10:"user_agent";s:74:"Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:24.0) Gecko/20100101 Firefox/24.0";s:11:"http_accept";s:63:"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8";}";}sysData|a:1:{s:12:"referringUri";s:18:"/events/display/31";}Zend_Auth|a:1:{s:7:"storage";O:8:"stdClass":3:{s:6:"userId";s:1:"0";s:8:"userName";s:7:"dxadmin";s:4:"role";s:7:"dxadmin";}}'),
('ds8eo4hnop19rali836nvor46nakp32p', 1397417516, 86400, '.Mozilla/5.0 (iPhone; CPU iPhone OS 6_1_3 like Mac OS X) AppleWebKit/536.26 (KHTML, like Gecko) Version/6.0 Mobile/10B329 Safari/8536.25|a:1:{s:7:"storage";s:4151:"a:6:{s:12:"browser_type";s:6:"mobile";s:6:"config";a:3:{s:23:"identification_sequence";s:14:"mobile,desktop";s:7:"storage";a:1:{s:7:"adapter";s:7:"Session";}s:6:"mobile";a:1:{s:8:"features";a:1:{s:9:"classname";s:45:"Zend_Http_UserAgent_Features_Adapter_Browscap";}}}s:12:"device_class";s:26:"Zend_Http_UserAgent_Mobile";s:6:"device";s:3554:"a:6:{s:10:"_aFeatures";a:60:{s:13:"browser_build";s:7:"8536.25";s:21:"browser_compatibility";s:6:"Safari";s:14:"browser_engine";s:11:"AppleWebKit";s:12:"browser_name";s:6:"Safari";s:13:"browser_token";s:33:"CPU iPhone OS 6_1_3 like Mac OS X";s:15:"browser_version";s:3:"6.0";s:7:"comment";s:10:"Safari 6.0";s:18:"compatibility_flag";s:6:"iPhone";s:6:"device";s:6:"iphone";s:15:"device_os_token";s:9:"iPhone OS";s:8:"firmware";s:6:"10B329";s:6:"others";a:2:{s:4:"full";s:79:"AppleWebKit/536.26 (KHTML, like Gecko) Version/6.0 Mobile/10B329 Safari/8536.25";s:6:"detail";a:4:{i:0;a:3:{i:0;s:38:"AppleWebKit/536.26 (KHTML, like Gecko)";i:1;s:11:"AppleWebKit";i:2;s:6:"536.26";}i:1;a:3:{i:0;s:11:"Version/6.0";i:1;s:7:"Version";i:2;s:3:"6.0";}i:2;a:3:{i:0;s:13:"Mobile/10B329";i:1;s:6:"Mobile";i:2;s:6:"10B329";}i:3;a:3:{i:0;s:14:"Safari/8536.25";i:1;s:6:"Safari";i:2;s:7:"8536.25";}}}s:12:"product_name";s:7:"Mozilla";s:15:"product_version";s:3:"5.0";s:10:"user_agent";s:11:"Mozilla/5.0";s:18:"is_wireless_device";b:0;s:9:"is_mobile";b:1;s:10:"is_desktop";b:0;s:9:"is_tablet";b:0;s:6:"is_bot";b:0;s:8:"is_email";b:0;s:7:"is_text";b:0;s:25:"device_claims_web_support";b:0;s:9:"client_ip";s:12:"66.87.88.202";s:11:"php_version";s:6:"5.3.26";s:9:"server_os";s:6:"apache";s:17:"server_os_version";s:6:"2.2.24";s:18:"server_http_accept";s:63:"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8";s:27:"server_http_accept_language";s:5:"en-us";s:9:"server_ip";s:12:"192.168.1.16";s:11:"server_name";s:18:"fypg.dirextion.net";s:18:"browser_name_regex";s:99:"¤^mozilla/5\\.0 \\(.*mac os x.*\\) .*applewebkit/.* \\(khtml, like gecko\\) .*version/6\\.0.* safari/.*$¤";s:20:"browser_name_pattern";s:82:"Mozilla/5.0 (*Mac OS X*) *AppleWebKit/* (KHTML, like Gecko) *Version/6.0* Safari/*";s:6:"parent";s:10:"Safari 6.0";s:9:"device_os";s:6:"MacOSX";s:14:"mobile_browser";s:6:"Safari";s:22:"mobile_browser_version";s:3:"6.0";s:8:"majorver";s:1:"6";s:8:"minorver";s:1:"0";s:6:"frames";s:1:"1";s:7:"iframes";s:1:"1";s:6:"tables";s:1:"1";s:7:"cookies";s:1:"1";s:10:"javascript";s:1:"1";s:11:"javaapplets";s:1:"1";s:10:"cssversion";s:1:"3";s:16:"platform_version";s:7:"unknown";s:5:"alpha";s:0:"";s:4:"beta";s:0:"";s:5:"win16";s:0:"";s:5:"win32";s:0:"";s:5:"win64";s:0:"";s:16:"backgroundsounds";s:0:"";s:8:"vbscript";s:0:"";s:15:"activexcontrols";s:0:"";s:14:"ismobiledevice";s:0:"";s:19:"issyndicationreader";s:0:"";s:7:"crawler";s:0:"";s:10:"aolversion";s:1:"0";s:6:"markup";s:6:"iphone";}s:7:"_aGroup";a:2:{s:12:"product_info";a:24:{i:0;s:13:"browser_build";i:1;s:21:"browser_compatibility";i:2;s:14:"browser_engine";i:3;s:12:"browser_name";i:4;s:13:"browser_token";i:5;s:15:"browser_version";i:6;s:7:"comment";i:7;s:18:"compatibility_flag";i:8;s:6:"device";i:9;s:15:"device_os_token";i:10;s:8:"firmware";i:11;s:6:"others";i:12;s:12:"product_name";i:13;s:15:"product_version";i:14;s:10:"user_agent";i:15;s:18:"is_wireless_device";i:16;s:9:"is_mobile";i:17;s:10:"is_desktop";i:18;s:9:"is_tablet";i:19;s:6:"is_bot";i:20;s:8:"is_email";i:21;s:7:"is_text";i:22;s:25:"device_claims_web_support";i:23;s:9:"client_ip";}s:11:"server_info";a:7:{i:0;s:11:"php_version";i:1;s:9:"server_os";i:2;s:17:"server_os_version";i:3;s:18:"server_http_accept";i:4;s:27:"server_http_accept_language";i:5;s:9:"server_ip";i:6;s:11:"server_name";}}s:8:"_browser";s:6:"Safari";s:15:"_browserVersion";s:3:"6.0";s:10:"_userAgent";s:135:"Mozilla/5.0 (iPhone; CPU iPhone OS 6_1_3 like Mac OS X) AppleWebKit/536.26 (KHTML, like Gecko) Version/6.0 Mobile/10B329 Safari/8536.25";s:7:"_images";a:0:{}}";s:10:"user_agent";s:135:"Mozilla/5.0 (iPhone; CPU iPhone OS 6_1_3 like Mac OS X) AppleWebKit/536.26 (KHTML, like Gecko) Version/6.0 Mobile/10B329 Safari/8536.25";s:11:"http_accept";s:63:"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8";}";}sysData|a:1:{s:12:"referringUri";s:1:"/";}'),
('gl5oqd2bjinjqq4gbu389eh6u20veema', 1397494264, 86400, '.Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6; rv:18.0) Gecko/20100101 Firefox/18.0|a:1:{s:7:"storage";s:2942:"a:6:{s:12:"browser_type";s:7:"desktop";s:6:"config";a:3:{s:23:"identification_sequence";s:14:"mobile,desktop";s:7:"storage";a:1:{s:7:"adapter";s:7:"Session";}s:6:"mobile";a:1:{s:8:"features";a:1:{s:9:"classname";s:45:"Zend_Http_UserAgent_Features_Adapter_Browscap";}}}s:12:"device_class";s:27:"Zend_Http_UserAgent_Desktop";s:6:"device";s:2398:"a:6:{s:10:"_aFeatures";a:28:{s:21:"browser_compatibility";s:7:"Firefox";s:14:"browser_engine";s:5:"Gecko";s:12:"browser_name";s:7:"Firefox";s:13:"browser_token";s:19:"Intel Mac OS X 10.6";s:15:"browser_version";s:4:"18.0";s:7:"comment";a:2:{s:4:"full";s:39:"Macintosh; Intel Mac OS X 10.6; rv:18.0";s:6:"detail";a:3:{i:0;s:9:"Macintosh";i:1;s:20:" Intel Mac OS X 10.6";i:2;s:8:" rv:18.0";}}s:18:"compatibility_flag";s:9:"Macintosh";s:15:"device_os_token";s:7:"rv:18.0";s:6:"others";a:2:{s:4:"full";s:27:"Gecko/20100101 Firefox/18.0";s:6:"detail";a:2:{i:0;a:3:{i:0;s:14:"Gecko/20100101";i:1;s:5:"Gecko";i:2;s:8:"20100101";}i:1;a:3:{i:0;s:12:"Firefox/18.0";i:1;s:7:"Firefox";i:2;s:4:"18.0";}}}s:12:"product_name";s:7:"Mozilla";s:15:"product_version";s:3:"5.0";s:10:"user_agent";s:11:"Mozilla/5.0";s:18:"is_wireless_device";b:0;s:9:"is_mobile";b:0;s:10:"is_desktop";b:1;s:9:"is_tablet";b:0;s:6:"is_bot";b:0;s:8:"is_email";b:0;s:7:"is_text";b:0;s:25:"device_claims_web_support";b:0;s:9:"client_ip";s:11:"192.168.1.1";s:11:"php_version";s:6:"5.3.26";s:9:"server_os";s:6:"apache";s:17:"server_os_version";s:6:"2.2.24";s:18:"server_http_accept";s:63:"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8";s:27:"server_http_accept_language";s:14:"en-US,en;q=0.5";s:9:"server_ip";s:12:"192.168.1.16";s:11:"server_name";s:18:"fypg.dirextion.net";}s:7:"_aGroup";a:2:{s:12:"product_info";a:21:{i:0;s:21:"browser_compatibility";i:1;s:14:"browser_engine";i:2;s:12:"browser_name";i:3;s:13:"browser_token";i:4;s:15:"browser_version";i:5;s:7:"comment";i:6;s:18:"compatibility_flag";i:7;s:15:"device_os_token";i:8;s:6:"others";i:9;s:12:"product_name";i:10;s:15:"product_version";i:11;s:10:"user_agent";i:12;s:18:"is_wireless_device";i:13;s:9:"is_mobile";i:14;s:10:"is_desktop";i:15;s:9:"is_tablet";i:16;s:6:"is_bot";i:17;s:8:"is_email";i:18;s:7:"is_text";i:19;s:25:"device_claims_web_support";i:20;s:9:"client_ip";}s:11:"server_info";a:7:{i:0;s:11:"php_version";i:1;s:9:"server_os";i:2;s:17:"server_os_version";i:3;s:18:"server_http_accept";i:4;s:27:"server_http_accept_language";i:5;s:9:"server_ip";i:6;s:11:"server_name";}}s:8:"_browser";s:7:"Firefox";s:15:"_browserVersion";s:4:"18.0";s:10:"_userAgent";s:81:"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6; rv:18.0) Gecko/20100101 Firefox/18.0";s:7:"_images";a:6:{i:0;s:4:"jpeg";i:1;s:3:"gif";i:2;s:3:"png";i:3;s:5:"pjpeg";i:4;s:5:"x-png";i:5;s:3:"bmp";}}";s:10:"user_agent";s:81:"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6; rv:18.0) Gecko/20100101 Firefox/18.0";s:11:"http_accept";s:63:"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8";}";}sysData|a:1:{s:12:"referringUri";s:18:"/admin/page/create";}Zend_Auth|a:1:{s:7:"storage";O:8:"stdClass":3:{s:6:"userId";s:1:"0";s:8:"userName";s:7:"dxadmin";s:4:"role";s:7:"dxadmin";}}'),
('hhs4je88pgq6qh9rmaa4hdb8mb7q4gk1', 1397501787, 86400, '.Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.75.14 (KHTML, like Gecko) Version/7.0.3 Safari/537.75.14|a:1:{s:7:"storage";s:3153:"a:6:{s:12:"browser_type";s:7:"desktop";s:6:"config";a:3:{s:23:"identification_sequence";s:14:"mobile,desktop";s:7:"storage";a:1:{s:7:"adapter";s:7:"Session";}s:6:"mobile";a:1:{s:8:"features";a:1:{s:9:"classname";s:45:"Zend_Http_UserAgent_Features_Adapter_Browscap";}}}s:12:"device_class";s:27:"Zend_Http_UserAgent_Desktop";s:6:"device";s:2570:"a:6:{s:10:"_aFeatures";a:28:{s:21:"browser_compatibility";s:6:"Safari";s:14:"browser_engine";s:11:"AppleWebKit";s:12:"browser_name";s:6:"Safari";s:13:"browser_token";s:21:"Intel Mac OS X 10_9_2";s:15:"browser_version";s:5:"7.0.3";s:7:"comment";a:2:{s:4:"full";s:32:"Macintosh; Intel Mac OS X 10_9_2";s:6:"detail";a:2:{i:0;s:9:"Macintosh";i:1;s:22:" Intel Mac OS X 10_9_2";}}s:18:"compatibility_flag";s:9:"Macintosh";s:15:"device_os_token";s:9:"Macintosh";s:6:"others";a:2:{s:4:"full";s:72:"AppleWebKit/537.75.14 (KHTML, like Gecko) Version/7.0.3 Safari/537.75.14";s:6:"detail";a:3:{i:0;a:3:{i:0;s:41:"AppleWebKit/537.75.14 (KHTML, like Gecko)";i:1;s:11:"AppleWebKit";i:2;s:9:"537.75.14";}i:1;a:3:{i:0;s:13:"Version/7.0.3";i:1;s:7:"Version";i:2;s:5:"7.0.3";}i:2;a:3:{i:0;s:16:"Safari/537.75.14";i:1;s:6:"Safari";i:2;s:9:"537.75.14";}}}s:12:"product_name";s:7:"Mozilla";s:15:"product_version";s:3:"5.0";s:10:"user_agent";s:11:"Mozilla/5.0";s:18:"is_wireless_device";b:0;s:9:"is_mobile";b:0;s:10:"is_desktop";b:1;s:9:"is_tablet";b:0;s:6:"is_bot";b:0;s:8:"is_email";b:0;s:7:"is_text";b:0;s:25:"device_claims_web_support";b:0;s:9:"client_ip";s:11:"192.168.1.1";s:11:"php_version";s:6:"5.3.26";s:9:"server_os";s:6:"apache";s:17:"server_os_version";s:6:"2.2.24";s:18:"server_http_accept";s:63:"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8";s:27:"server_http_accept_language";s:5:"en-us";s:9:"server_ip";s:12:"192.168.1.16";s:11:"server_name";s:18:"fypg.dirextion.net";}s:7:"_aGroup";a:2:{s:12:"product_info";a:21:{i:0;s:21:"browser_compatibility";i:1;s:14:"browser_engine";i:2;s:12:"browser_name";i:3;s:13:"browser_token";i:4;s:15:"browser_version";i:5;s:7:"comment";i:6;s:18:"compatibility_flag";i:7;s:15:"device_os_token";i:8;s:6:"others";i:9;s:12:"product_name";i:10;s:15:"product_version";i:11;s:10:"user_agent";i:12;s:18:"is_wireless_device";i:13;s:9:"is_mobile";i:14;s:10:"is_desktop";i:15;s:9:"is_tablet";i:16;s:6:"is_bot";i:17;s:8:"is_email";i:18;s:7:"is_text";i:19;s:25:"device_claims_web_support";i:20;s:9:"client_ip";}s:11:"server_info";a:7:{i:0;s:11:"php_version";i:1;s:9:"server_os";i:2;s:17:"server_os_version";i:3;s:18:"server_http_accept";i:4;s:27:"server_http_accept_language";i:5;s:9:"server_ip";i:6;s:11:"server_name";}}s:8:"_browser";s:6:"Safari";s:15:"_browserVersion";s:5:"7.0.3";s:10:"_userAgent";s:119:"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.75.14 (KHTML, like Gecko) Version/7.0.3 Safari/537.75.14";s:7:"_images";a:6:{i:0;s:4:"jpeg";i:1;s:3:"gif";i:2;s:3:"png";i:3;s:5:"pjpeg";i:4;s:5:"x-png";i:5;s:3:"bmp";}}";s:10:"user_agent";s:119:"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.75.14 (KHTML, like Gecko) Version/7.0.3 Safari/537.75.14";s:11:"http_accept";s:63:"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8";}";}sysData|a:1:{s:12:"referringUri";s:1:"/";}'),
('htn8nvut3j939q82smnia8t0os915nl1', 1397634588, 86400, '.Mozilla/5.0 (iPhone; CPU iPhone OS 7_0_6 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11B651 Safari/9537.53|a:1:{s:7:"storage";s:4141:"a:6:{s:12:"browser_type";s:6:"mobile";s:6:"config";a:3:{s:23:"identification_sequence";s:14:"mobile,desktop";s:7:"storage";a:1:{s:7:"adapter";s:7:"Session";}s:6:"mobile";a:1:{s:8:"features";a:1:{s:9:"classname";s:45:"Zend_Http_UserAgent_Features_Adapter_Browscap";}}}s:12:"device_class";s:26:"Zend_Http_UserAgent_Mobile";s:6:"device";s:3542:"a:6:{s:10:"_aFeatures";a:60:{s:13:"browser_build";s:7:"9537.53";s:21:"browser_compatibility";s:6:"Safari";s:14:"browser_engine";s:11:"AppleWebKit";s:12:"browser_name";s:6:"Safari";s:13:"browser_token";s:33:"CPU iPhone OS 7_0_6 like Mac OS X";s:15:"browser_version";s:3:"0.0";s:7:"comment";s:14:"Safari Generic";s:18:"compatibility_flag";s:6:"iPhone";s:6:"device";s:6:"iphone";s:15:"device_os_token";s:9:"iPhone OS";s:8:"firmware";s:6:"11B651";s:6:"others";a:2:{s:4:"full";s:81:"AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11B651 Safari/9537.53";s:6:"detail";a:4:{i:0;a:3:{i:0;s:40:"AppleWebKit/537.51.1 (KHTML, like Gecko)";i:1;s:11:"AppleWebKit";i:2;s:8:"537.51.1";}i:1;a:3:{i:0;s:11:"Version/7.0";i:1;s:7:"Version";i:2;s:3:"7.0";}i:2;a:3:{i:0;s:13:"Mobile/11B651";i:1;s:6:"Mobile";i:2;s:6:"11B651";}i:3;a:3:{i:0;s:14:"Safari/9537.53";i:1;s:6:"Safari";i:2;s:7:"9537.53";}}}s:12:"product_name";s:7:"Mozilla";s:15:"product_version";s:3:"5.0";s:10:"user_agent";s:11:"Mozilla/5.0";s:18:"is_wireless_device";b:0;s:9:"is_mobile";b:1;s:10:"is_desktop";b:0;s:9:"is_tablet";b:0;s:6:"is_bot";b:0;s:8:"is_email";b:0;s:7:"is_text";b:0;s:25:"device_claims_web_support";b:0;s:9:"client_ip";s:12:"96.37.159.19";s:11:"php_version";s:6:"5.3.26";s:9:"server_os";s:6:"apache";s:17:"server_os_version";s:6:"2.2.24";s:18:"server_http_accept";s:63:"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8";s:27:"server_http_accept_language";s:5:"en-us";s:9:"server_ip";s:12:"192.168.1.16";s:11:"server_name";s:18:"fypg.dirextion.net";s:18:"browser_name_regex";s:84:"¤^mozilla/5\\.0 \\(.*mac os x.*\\) .*applewebkit/.* \\(khtml, like gecko\\) .*safari/.*$¤";s:20:"browser_name_pattern";s:69:"Mozilla/5.0 (*Mac OS X*) *AppleWebKit/* (KHTML, like Gecko) *Safari/*";s:6:"parent";s:14:"Safari Generic";s:9:"device_os";s:6:"MacOSX";s:14:"mobile_browser";s:6:"Safari";s:6:"frames";s:1:"1";s:7:"iframes";s:1:"1";s:6:"tables";s:1:"1";s:7:"cookies";s:1:"1";s:10:"javascript";s:1:"1";s:11:"javaapplets";s:1:"1";s:10:"cssversion";s:1:"1";s:22:"mobile_browser_version";s:3:"0.0";s:8:"majorver";s:1:"0";s:8:"minorver";s:1:"0";s:16:"platform_version";s:7:"unknown";s:5:"alpha";s:0:"";s:4:"beta";s:0:"";s:5:"win16";s:0:"";s:5:"win32";s:0:"";s:5:"win64";s:0:"";s:16:"backgroundsounds";s:0:"";s:8:"vbscript";s:0:"";s:15:"activexcontrols";s:0:"";s:14:"ismobiledevice";s:0:"";s:19:"issyndicationreader";s:0:"";s:7:"crawler";s:0:"";s:10:"aolversion";s:1:"0";s:6:"markup";s:6:"iphone";}s:7:"_aGroup";a:2:{s:12:"product_info";a:24:{i:0;s:13:"browser_build";i:1;s:21:"browser_compatibility";i:2;s:14:"browser_engine";i:3;s:12:"browser_name";i:4;s:13:"browser_token";i:5;s:15:"browser_version";i:6;s:7:"comment";i:7;s:18:"compatibility_flag";i:8;s:6:"device";i:9;s:15:"device_os_token";i:10;s:8:"firmware";i:11;s:6:"others";i:12;s:12:"product_name";i:13;s:15:"product_version";i:14;s:10:"user_agent";i:15;s:18:"is_wireless_device";i:16;s:9:"is_mobile";i:17;s:10:"is_desktop";i:18;s:9:"is_tablet";i:19;s:6:"is_bot";i:20;s:8:"is_email";i:21;s:7:"is_text";i:22;s:25:"device_claims_web_support";i:23;s:9:"client_ip";}s:11:"server_info";a:7:{i:0;s:11:"php_version";i:1;s:9:"server_os";i:2;s:17:"server_os_version";i:3;s:18:"server_http_accept";i:4;s:27:"server_http_accept_language";i:5;s:9:"server_ip";i:6;s:11:"server_name";}}s:8:"_browser";s:6:"Safari";s:15:"_browserVersion";s:3:"0.0";s:10:"_userAgent";s:137:"Mozilla/5.0 (iPhone; CPU iPhone OS 7_0_6 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11B651 Safari/9537.53";s:7:"_images";a:0:{}}";s:10:"user_agent";s:137:"Mozilla/5.0 (iPhone; CPU iPhone OS 7_0_6 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11B651 Safari/9537.53";s:11:"http_accept";s:63:"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8";}";}sysData|a:1:{s:12:"referringUri";s:1:"/";}');
INSERT INTO `session` (`id`, `modified`, `lifetime`, `data`) VALUES
('j5aq9o3rja2suev38tnb4lltsqtrkd79', 1397634588, 86400, '.Mozilla/5.0 (iPhone; CPU iPhone OS 7_0_6 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11B651 Safari/9537.53|a:1:{s:7:"storage";s:4141:"a:6:{s:12:"browser_type";s:6:"mobile";s:6:"config";a:3:{s:23:"identification_sequence";s:14:"mobile,desktop";s:7:"storage";a:1:{s:7:"adapter";s:7:"Session";}s:6:"mobile";a:1:{s:8:"features";a:1:{s:9:"classname";s:45:"Zend_Http_UserAgent_Features_Adapter_Browscap";}}}s:12:"device_class";s:26:"Zend_Http_UserAgent_Mobile";s:6:"device";s:3542:"a:6:{s:10:"_aFeatures";a:60:{s:13:"browser_build";s:7:"9537.53";s:21:"browser_compatibility";s:6:"Safari";s:14:"browser_engine";s:11:"AppleWebKit";s:12:"browser_name";s:6:"Safari";s:13:"browser_token";s:33:"CPU iPhone OS 7_0_6 like Mac OS X";s:15:"browser_version";s:3:"0.0";s:7:"comment";s:14:"Safari Generic";s:18:"compatibility_flag";s:6:"iPhone";s:6:"device";s:6:"iphone";s:15:"device_os_token";s:9:"iPhone OS";s:8:"firmware";s:6:"11B651";s:6:"others";a:2:{s:4:"full";s:81:"AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11B651 Safari/9537.53";s:6:"detail";a:4:{i:0;a:3:{i:0;s:40:"AppleWebKit/537.51.1 (KHTML, like Gecko)";i:1;s:11:"AppleWebKit";i:2;s:8:"537.51.1";}i:1;a:3:{i:0;s:11:"Version/7.0";i:1;s:7:"Version";i:2;s:3:"7.0";}i:2;a:3:{i:0;s:13:"Mobile/11B651";i:1;s:6:"Mobile";i:2;s:6:"11B651";}i:3;a:3:{i:0;s:14:"Safari/9537.53";i:1;s:6:"Safari";i:2;s:7:"9537.53";}}}s:12:"product_name";s:7:"Mozilla";s:15:"product_version";s:3:"5.0";s:10:"user_agent";s:11:"Mozilla/5.0";s:18:"is_wireless_device";b:0;s:9:"is_mobile";b:1;s:10:"is_desktop";b:0;s:9:"is_tablet";b:0;s:6:"is_bot";b:0;s:8:"is_email";b:0;s:7:"is_text";b:0;s:25:"device_claims_web_support";b:0;s:9:"client_ip";s:12:"96.37.159.19";s:11:"php_version";s:6:"5.3.26";s:9:"server_os";s:6:"apache";s:17:"server_os_version";s:6:"2.2.24";s:18:"server_http_accept";s:63:"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8";s:27:"server_http_accept_language";s:5:"en-us";s:9:"server_ip";s:12:"192.168.1.16";s:11:"server_name";s:18:"fypg.dirextion.net";s:18:"browser_name_regex";s:84:"¤^mozilla/5\\.0 \\(.*mac os x.*\\) .*applewebkit/.* \\(khtml, like gecko\\) .*safari/.*$¤";s:20:"browser_name_pattern";s:69:"Mozilla/5.0 (*Mac OS X*) *AppleWebKit/* (KHTML, like Gecko) *Safari/*";s:6:"parent";s:14:"Safari Generic";s:9:"device_os";s:6:"MacOSX";s:14:"mobile_browser";s:6:"Safari";s:6:"frames";s:1:"1";s:7:"iframes";s:1:"1";s:6:"tables";s:1:"1";s:7:"cookies";s:1:"1";s:10:"javascript";s:1:"1";s:11:"javaapplets";s:1:"1";s:10:"cssversion";s:1:"1";s:22:"mobile_browser_version";s:3:"0.0";s:8:"majorver";s:1:"0";s:8:"minorver";s:1:"0";s:16:"platform_version";s:7:"unknown";s:5:"alpha";s:0:"";s:4:"beta";s:0:"";s:5:"win16";s:0:"";s:5:"win32";s:0:"";s:5:"win64";s:0:"";s:16:"backgroundsounds";s:0:"";s:8:"vbscript";s:0:"";s:15:"activexcontrols";s:0:"";s:14:"ismobiledevice";s:0:"";s:19:"issyndicationreader";s:0:"";s:7:"crawler";s:0:"";s:10:"aolversion";s:1:"0";s:6:"markup";s:6:"iphone";}s:7:"_aGroup";a:2:{s:12:"product_info";a:24:{i:0;s:13:"browser_build";i:1;s:21:"browser_compatibility";i:2;s:14:"browser_engine";i:3;s:12:"browser_name";i:4;s:13:"browser_token";i:5;s:15:"browser_version";i:6;s:7:"comment";i:7;s:18:"compatibility_flag";i:8;s:6:"device";i:9;s:15:"device_os_token";i:10;s:8:"firmware";i:11;s:6:"others";i:12;s:12:"product_name";i:13;s:15:"product_version";i:14;s:10:"user_agent";i:15;s:18:"is_wireless_device";i:16;s:9:"is_mobile";i:17;s:10:"is_desktop";i:18;s:9:"is_tablet";i:19;s:6:"is_bot";i:20;s:8:"is_email";i:21;s:7:"is_text";i:22;s:25:"device_claims_web_support";i:23;s:9:"client_ip";}s:11:"server_info";a:7:{i:0;s:11:"php_version";i:1;s:9:"server_os";i:2;s:17:"server_os_version";i:3;s:18:"server_http_accept";i:4;s:27:"server_http_accept_language";i:5;s:9:"server_ip";i:6;s:11:"server_name";}}s:8:"_browser";s:6:"Safari";s:15:"_browserVersion";s:3:"0.0";s:10:"_userAgent";s:137:"Mozilla/5.0 (iPhone; CPU iPhone OS 7_0_6 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11B651 Safari/9537.53";s:7:"_images";a:0:{}}";s:10:"user_agent";s:137:"Mozilla/5.0 (iPhone; CPU iPhone OS 7_0_6 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11B651 Safari/9537.53";s:11:"http_accept";s:63:"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8";}";}sysData|a:1:{s:12:"referringUri";s:1:"/";}'),
('jcapcsg6v1gcfn07vch0516319frrv2l', 1397402322, 86400, '.Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.75.14 (KHTML, like Gecko) Version/7.0.3 Safari/537.75.14|a:1:{s:7:"storage";s:3154:"a:6:{s:12:"browser_type";s:7:"desktop";s:6:"config";a:3:{s:23:"identification_sequence";s:14:"mobile,desktop";s:7:"storage";a:1:{s:7:"adapter";s:7:"Session";}s:6:"mobile";a:1:{s:8:"features";a:1:{s:9:"classname";s:45:"Zend_Http_UserAgent_Features_Adapter_Browscap";}}}s:12:"device_class";s:27:"Zend_Http_UserAgent_Desktop";s:6:"device";s:2571:"a:6:{s:10:"_aFeatures";a:28:{s:21:"browser_compatibility";s:6:"Safari";s:14:"browser_engine";s:11:"AppleWebKit";s:12:"browser_name";s:6:"Safari";s:13:"browser_token";s:21:"Intel Mac OS X 10_9_2";s:15:"browser_version";s:5:"7.0.3";s:7:"comment";a:2:{s:4:"full";s:32:"Macintosh; Intel Mac OS X 10_9_2";s:6:"detail";a:2:{i:0;s:9:"Macintosh";i:1;s:22:" Intel Mac OS X 10_9_2";}}s:18:"compatibility_flag";s:9:"Macintosh";s:15:"device_os_token";s:9:"Macintosh";s:6:"others";a:2:{s:4:"full";s:72:"AppleWebKit/537.75.14 (KHTML, like Gecko) Version/7.0.3 Safari/537.75.14";s:6:"detail";a:3:{i:0;a:3:{i:0;s:41:"AppleWebKit/537.75.14 (KHTML, like Gecko)";i:1;s:11:"AppleWebKit";i:2;s:9:"537.75.14";}i:1;a:3:{i:0;s:13:"Version/7.0.3";i:1;s:7:"Version";i:2;s:5:"7.0.3";}i:2;a:3:{i:0;s:16:"Safari/537.75.14";i:1;s:6:"Safari";i:2;s:9:"537.75.14";}}}s:12:"product_name";s:7:"Mozilla";s:15:"product_version";s:3:"5.0";s:10:"user_agent";s:11:"Mozilla/5.0";s:18:"is_wireless_device";b:0;s:9:"is_mobile";b:0;s:10:"is_desktop";b:1;s:9:"is_tablet";b:0;s:6:"is_bot";b:0;s:8:"is_email";b:0;s:7:"is_text";b:0;s:25:"device_claims_web_support";b:0;s:9:"client_ip";s:12:"96.37.159.19";s:11:"php_version";s:6:"5.3.26";s:9:"server_os";s:6:"apache";s:17:"server_os_version";s:6:"2.2.24";s:18:"server_http_accept";s:63:"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8";s:27:"server_http_accept_language";s:5:"en-us";s:9:"server_ip";s:12:"192.168.1.16";s:11:"server_name";s:18:"fypg.dirextion.net";}s:7:"_aGroup";a:2:{s:12:"product_info";a:21:{i:0;s:21:"browser_compatibility";i:1;s:14:"browser_engine";i:2;s:12:"browser_name";i:3;s:13:"browser_token";i:4;s:15:"browser_version";i:5;s:7:"comment";i:6;s:18:"compatibility_flag";i:7;s:15:"device_os_token";i:8;s:6:"others";i:9;s:12:"product_name";i:10;s:15:"product_version";i:11;s:10:"user_agent";i:12;s:18:"is_wireless_device";i:13;s:9:"is_mobile";i:14;s:10:"is_desktop";i:15;s:9:"is_tablet";i:16;s:6:"is_bot";i:17;s:8:"is_email";i:18;s:7:"is_text";i:19;s:25:"device_claims_web_support";i:20;s:9:"client_ip";}s:11:"server_info";a:7:{i:0;s:11:"php_version";i:1;s:9:"server_os";i:2;s:17:"server_os_version";i:3;s:18:"server_http_accept";i:4;s:27:"server_http_accept_language";i:5;s:9:"server_ip";i:6;s:11:"server_name";}}s:8:"_browser";s:6:"Safari";s:15:"_browserVersion";s:5:"7.0.3";s:10:"_userAgent";s:119:"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.75.14 (KHTML, like Gecko) Version/7.0.3 Safari/537.75.14";s:7:"_images";a:6:{i:0;s:4:"jpeg";i:1;s:3:"gif";i:2;s:3:"png";i:3;s:5:"pjpeg";i:4;s:5:"x-png";i:5;s:3:"bmp";}}";s:10:"user_agent";s:119:"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.75.14 (KHTML, like Gecko) Version/7.0.3 Safari/537.75.14";s:11:"http_accept";s:63:"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8";}";}sysData|a:1:{s:12:"referringUri";s:1:"/";}'),
('k4jceipc66du130ho7tb9ifm4ql00a6r', 1397563771, 86400, '.Mozilla/5.0 (iPad; CPU OS 7_0 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A465 Safari/9537.53|a:1:{s:7:"storage";s:4024:"a:6:{s:12:"browser_type";s:6:"mobile";s:6:"config";a:3:{s:23:"identification_sequence";s:14:"mobile,desktop";s:7:"storage";a:1:{s:7:"adapter";s:7:"Session";}s:6:"mobile";a:1:{s:8:"features";a:1:{s:9:"classname";s:45:"Zend_Http_UserAgent_Features_Adapter_Browscap";}}}s:12:"device_class";s:26:"Zend_Http_UserAgent_Mobile";s:6:"device";s:3477:"a:6:{s:10:"_aFeatures";a:60:{s:13:"browser_build";s:7:"9537.53";s:21:"browser_compatibility";s:6:"Safari";s:14:"browser_engine";s:11:"AppleWebKit";s:12:"browser_name";s:6:"Safari";s:13:"browser_token";s:24:"CPU OS 7_0 like Mac OS X";s:15:"browser_version";s:3:"0.0";s:7:"comment";s:14:"Safari Generic";s:18:"compatibility_flag";s:4:"iPad";s:6:"device";s:4:"ipad";s:15:"device_os_token";s:9:"iPhone OS";s:8:"firmware";s:6:"11A465";s:6:"others";a:2:{s:4:"full";s:81:"AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A465 Safari/9537.53";s:6:"detail";a:4:{i:0;a:3:{i:0;s:40:"AppleWebKit/537.51.1 (KHTML, like Gecko)";i:1;s:11:"AppleWebKit";i:2;s:8:"537.51.1";}i:1;a:3:{i:0;s:11:"Version/7.0";i:1;s:7:"Version";i:2;s:3:"7.0";}i:2;a:3:{i:0;s:13:"Mobile/11A465";i:1;s:6:"Mobile";i:2;s:6:"11A465";}i:3;a:3:{i:0;s:14:"Safari/9537.53";i:1;s:6:"Safari";i:2;s:7:"9537.53";}}}s:12:"product_name";s:7:"Mozilla";s:15:"product_version";s:3:"5.0";s:10:"user_agent";s:11:"Mozilla/5.0";s:18:"is_wireless_device";b:0;s:9:"is_mobile";b:1;s:10:"is_desktop";b:0;s:9:"is_tablet";b:0;s:6:"is_bot";b:0;s:8:"is_email";b:0;s:7:"is_text";b:0;s:25:"device_claims_web_support";b:0;s:9:"client_ip";s:12:"96.37.159.19";s:11:"php_version";s:6:"5.3.26";s:9:"server_os";s:6:"apache";s:17:"server_os_version";s:6:"2.2.24";s:18:"server_http_accept";s:22:"text/html, */*; q=0.01";s:27:"server_http_accept_language";s:5:"en-us";s:9:"server_ip";s:12:"192.168.1.16";s:11:"server_name";s:18:"fypg.dirextion.net";s:18:"browser_name_regex";s:84:"¤^mozilla/5\\.0 \\(.*mac os x.*\\) .*applewebkit/.* \\(khtml, like gecko\\) .*safari/.*$¤";s:20:"browser_name_pattern";s:69:"Mozilla/5.0 (*Mac OS X*) *AppleWebKit/* (KHTML, like Gecko) *Safari/*";s:6:"parent";s:14:"Safari Generic";s:9:"device_os";s:6:"MacOSX";s:14:"mobile_browser";s:6:"Safari";s:6:"frames";s:1:"1";s:7:"iframes";s:1:"1";s:6:"tables";s:1:"1";s:7:"cookies";s:1:"1";s:10:"javascript";s:1:"1";s:11:"javaapplets";s:1:"1";s:10:"cssversion";s:1:"1";s:22:"mobile_browser_version";s:3:"0.0";s:8:"majorver";s:1:"0";s:8:"minorver";s:1:"0";s:16:"platform_version";s:7:"unknown";s:5:"alpha";s:0:"";s:4:"beta";s:0:"";s:5:"win16";s:0:"";s:5:"win32";s:0:"";s:5:"win64";s:0:"";s:16:"backgroundsounds";s:0:"";s:8:"vbscript";s:0:"";s:15:"activexcontrols";s:0:"";s:14:"ismobiledevice";s:0:"";s:19:"issyndicationreader";s:0:"";s:7:"crawler";s:0:"";s:10:"aolversion";s:1:"0";s:6:"markup";s:6:"iphone";}s:7:"_aGroup";a:2:{s:12:"product_info";a:24:{i:0;s:13:"browser_build";i:1;s:21:"browser_compatibility";i:2;s:14:"browser_engine";i:3;s:12:"browser_name";i:4;s:13:"browser_token";i:5;s:15:"browser_version";i:6;s:7:"comment";i:7;s:18:"compatibility_flag";i:8;s:6:"device";i:9;s:15:"device_os_token";i:10;s:8:"firmware";i:11;s:6:"others";i:12;s:12:"product_name";i:13;s:15:"product_version";i:14;s:10:"user_agent";i:15;s:18:"is_wireless_device";i:16;s:9:"is_mobile";i:17;s:10:"is_desktop";i:18;s:9:"is_tablet";i:19;s:6:"is_bot";i:20;s:8:"is_email";i:21;s:7:"is_text";i:22;s:25:"device_claims_web_support";i:23;s:9:"client_ip";}s:11:"server_info";a:7:{i:0;s:11:"php_version";i:1;s:9:"server_os";i:2;s:17:"server_os_version";i:3;s:18:"server_http_accept";i:4;s:27:"server_http_accept_language";i:5;s:9:"server_ip";i:6;s:11:"server_name";}}s:8:"_browser";s:6:"Safari";s:15:"_browserVersion";s:3:"0.0";s:10:"_userAgent";s:126:"Mozilla/5.0 (iPad; CPU OS 7_0 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A465 Safari/9537.53";s:7:"_images";a:0:{}}";s:10:"user_agent";s:126:"Mozilla/5.0 (iPad; CPU OS 7_0 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A465 Safari/9537.53";s:11:"http_accept";s:22:"text/html, */*; q=0.01";}";}sysData|a:1:{s:12:"referringUri";s:7:"/events";}'),
('lk14dtef7moe3pd2dfb979ls4829inb9', 1397173554, 86400, '.Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.75.14 (KHTML, like Gecko) Version/7.0.3 Safari/537.75.14|a:1:{s:7:"storage";s:3155:"a:6:{s:12:"browser_type";s:7:"desktop";s:6:"config";a:3:{s:23:"identification_sequence";s:14:"mobile,desktop";s:7:"storage";a:1:{s:7:"adapter";s:7:"Session";}s:6:"mobile";a:1:{s:8:"features";a:1:{s:9:"classname";s:45:"Zend_Http_UserAgent_Features_Adapter_Browscap";}}}s:12:"device_class";s:27:"Zend_Http_UserAgent_Desktop";s:6:"device";s:2572:"a:6:{s:10:"_aFeatures";a:28:{s:21:"browser_compatibility";s:6:"Safari";s:14:"browser_engine";s:11:"AppleWebKit";s:12:"browser_name";s:6:"Safari";s:13:"browser_token";s:21:"Intel Mac OS X 10_9_2";s:15:"browser_version";s:5:"7.0.3";s:7:"comment";a:2:{s:4:"full";s:32:"Macintosh; Intel Mac OS X 10_9_2";s:6:"detail";a:2:{i:0;s:9:"Macintosh";i:1;s:22:" Intel Mac OS X 10_9_2";}}s:18:"compatibility_flag";s:9:"Macintosh";s:15:"device_os_token";s:9:"Macintosh";s:6:"others";a:2:{s:4:"full";s:72:"AppleWebKit/537.75.14 (KHTML, like Gecko) Version/7.0.3 Safari/537.75.14";s:6:"detail";a:3:{i:0;a:3:{i:0;s:41:"AppleWebKit/537.75.14 (KHTML, like Gecko)";i:1;s:11:"AppleWebKit";i:2;s:9:"537.75.14";}i:1;a:3:{i:0;s:13:"Version/7.0.3";i:1;s:7:"Version";i:2;s:5:"7.0.3";}i:2;a:3:{i:0;s:16:"Safari/537.75.14";i:1;s:6:"Safari";i:2;s:9:"537.75.14";}}}s:12:"product_name";s:7:"Mozilla";s:15:"product_version";s:3:"5.0";s:10:"user_agent";s:11:"Mozilla/5.0";s:18:"is_wireless_device";b:0;s:9:"is_mobile";b:0;s:10:"is_desktop";b:1;s:9:"is_tablet";b:0;s:6:"is_bot";b:0;s:8:"is_email";b:0;s:7:"is_text";b:0;s:25:"device_claims_web_support";b:0;s:9:"client_ip";s:13:"64.53.243.105";s:11:"php_version";s:6:"5.3.26";s:9:"server_os";s:6:"apache";s:17:"server_os_version";s:6:"2.2.24";s:18:"server_http_accept";s:63:"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8";s:27:"server_http_accept_language";s:5:"en-us";s:9:"server_ip";s:12:"192.168.1.16";s:11:"server_name";s:18:"fypg.dirextion.net";}s:7:"_aGroup";a:2:{s:12:"product_info";a:21:{i:0;s:21:"browser_compatibility";i:1;s:14:"browser_engine";i:2;s:12:"browser_name";i:3;s:13:"browser_token";i:4;s:15:"browser_version";i:5;s:7:"comment";i:6;s:18:"compatibility_flag";i:7;s:15:"device_os_token";i:8;s:6:"others";i:9;s:12:"product_name";i:10;s:15:"product_version";i:11;s:10:"user_agent";i:12;s:18:"is_wireless_device";i:13;s:9:"is_mobile";i:14;s:10:"is_desktop";i:15;s:9:"is_tablet";i:16;s:6:"is_bot";i:17;s:8:"is_email";i:18;s:7:"is_text";i:19;s:25:"device_claims_web_support";i:20;s:9:"client_ip";}s:11:"server_info";a:7:{i:0;s:11:"php_version";i:1;s:9:"server_os";i:2;s:17:"server_os_version";i:3;s:18:"server_http_accept";i:4;s:27:"server_http_accept_language";i:5;s:9:"server_ip";i:6;s:11:"server_name";}}s:8:"_browser";s:6:"Safari";s:15:"_browserVersion";s:5:"7.0.3";s:10:"_userAgent";s:119:"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.75.14 (KHTML, like Gecko) Version/7.0.3 Safari/537.75.14";s:7:"_images";a:6:{i:0;s:4:"jpeg";i:1;s:3:"gif";i:2;s:3:"png";i:3;s:5:"pjpeg";i:4;s:5:"x-png";i:5;s:3:"bmp";}}";s:10:"user_agent";s:119:"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.75.14 (KHTML, like Gecko) Version/7.0.3 Safari/537.75.14";s:11:"http_accept";s:63:"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8";}";}sysData|a:1:{s:12:"referringUri";s:12:"/favicon.ico";}'),
('mongi712pc4a5kselep0b39ekgdk5qi6', 1397403658, 86400, '.Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.116 Safari/537.36|a:1:{s:7:"storage";s:3211:"a:6:{s:12:"browser_type";s:7:"desktop";s:6:"config";a:3:{s:23:"identification_sequence";s:14:"mobile,desktop";s:7:"storage";a:1:{s:7:"adapter";s:7:"Session";}s:6:"mobile";a:1:{s:8:"features";a:1:{s:9:"classname";s:45:"Zend_Http_UserAgent_Features_Adapter_Browscap";}}}s:12:"device_class";s:27:"Zend_Http_UserAgent_Desktop";s:6:"device";s:2616:"a:6:{s:10:"_aFeatures";a:28:{s:21:"browser_compatibility";s:6:"Safari";s:14:"browser_engine";s:11:"AppleWebKit";s:12:"browser_name";s:6:"Chrome";s:13:"browser_token";s:21:"Intel Mac OS X 10_9_2";s:15:"browser_version";s:13:"34.0.1847.116";s:7:"comment";a:2:{s:4:"full";s:32:"Macintosh; Intel Mac OS X 10_9_2";s:6:"detail";a:2:{i:0;s:9:"Macintosh";i:1;s:22:" Intel Mac OS X 10_9_2";}}s:18:"compatibility_flag";s:9:"Macintosh";s:15:"device_os_token";s:9:"Macintosh";s:6:"others";a:2:{s:4:"full";s:73:"AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.116 Safari/537.36";s:6:"detail";a:3:{i:0;a:3:{i:0;s:38:"AppleWebKit/537.36 (KHTML, like Gecko)";i:1;s:11:"AppleWebKit";i:2;s:6:"537.36";}i:1;a:3:{i:0;s:20:"Chrome/34.0.1847.116";i:1;s:6:"Chrome";i:2;s:13:"34.0.1847.116";}i:2;a:3:{i:0;s:13:"Safari/537.36";i:1;s:6:"Safari";i:2;s:6:"537.36";}}}s:12:"product_name";s:7:"Mozilla";s:15:"product_version";s:3:"5.0";s:10:"user_agent";s:11:"Mozilla/5.0";s:18:"is_wireless_device";b:0;s:9:"is_mobile";b:0;s:10:"is_desktop";b:1;s:9:"is_tablet";b:0;s:6:"is_bot";b:0;s:8:"is_email";b:0;s:7:"is_text";b:0;s:25:"device_claims_web_support";b:0;s:9:"client_ip";s:13:"64.53.243.105";s:11:"php_version";s:6:"5.3.26";s:9:"server_os";s:6:"apache";s:17:"server_os_version";s:6:"2.2.24";s:18:"server_http_accept";s:74:"text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8";s:27:"server_http_accept_language";s:14:"en-US,en;q=0.8";s:9:"server_ip";s:12:"192.168.1.16";s:11:"server_name";s:18:"fypg.dirextion.net";}s:7:"_aGroup";a:2:{s:12:"product_info";a:21:{i:0;s:21:"browser_compatibility";i:1;s:14:"browser_engine";i:2;s:12:"browser_name";i:3;s:13:"browser_token";i:4;s:15:"browser_version";i:5;s:7:"comment";i:6;s:18:"compatibility_flag";i:7;s:15:"device_os_token";i:8;s:6:"others";i:9;s:12:"product_name";i:10;s:15:"product_version";i:11;s:10:"user_agent";i:12;s:18:"is_wireless_device";i:13;s:9:"is_mobile";i:14;s:10:"is_desktop";i:15;s:9:"is_tablet";i:16;s:6:"is_bot";i:17;s:8:"is_email";i:18;s:7:"is_text";i:19;s:25:"device_claims_web_support";i:20;s:9:"client_ip";}s:11:"server_info";a:7:{i:0;s:11:"php_version";i:1;s:9:"server_os";i:2;s:17:"server_os_version";i:3;s:18:"server_http_accept";i:4;s:27:"server_http_accept_language";i:5;s:9:"server_ip";i:6;s:11:"server_name";}}s:8:"_browser";s:6:"Chrome";s:15:"_browserVersion";s:13:"34.0.1847.116";s:10:"_userAgent";s:120:"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.116 Safari/537.36";s:7:"_images";a:6:{i:0;s:4:"jpeg";i:1;s:3:"gif";i:2;s:3:"png";i:3;s:5:"pjpeg";i:4;s:5:"x-png";i:5;s:3:"bmp";}}";s:10:"user_agent";s:120:"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.116 Safari/537.36";s:11:"http_accept";s:74:"text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8";}";}sysData|a:1:{s:12:"referringUri";s:12:"/favicon.ico";}'),
('msa026csauq7f9u216cmbjudpe4sen2h', 1397400683, 86400, '.Mozilla/5.0 (iPad; CPU OS 7_1 like Mac OS X) AppleWebKit/537.51.2 (KHTML, like Gecko) Version/7.0 Mobile/11D167 Safari/9537.53|a:1:{s:7:"storage";s:4106:"a:6:{s:12:"browser_type";s:6:"mobile";s:6:"config";a:3:{s:23:"identification_sequence";s:14:"mobile,desktop";s:7:"storage";a:1:{s:7:"adapter";s:7:"Session";}s:6:"mobile";a:1:{s:8:"features";a:1:{s:9:"classname";s:45:"Zend_Http_UserAgent_Features_Adapter_Browscap";}}}s:12:"device_class";s:26:"Zend_Http_UserAgent_Mobile";s:6:"device";s:3518:"a:6:{s:10:"_aFeatures";a:60:{s:13:"browser_build";s:7:"9537.53";s:21:"browser_compatibility";s:6:"Safari";s:14:"browser_engine";s:11:"AppleWebKit";s:12:"browser_name";s:6:"Safari";s:13:"browser_token";s:24:"CPU OS 7_1 like Mac OS X";s:15:"browser_version";s:3:"0.0";s:7:"comment";s:14:"Safari Generic";s:18:"compatibility_flag";s:4:"iPad";s:6:"device";s:4:"ipad";s:15:"device_os_token";s:9:"iPhone OS";s:8:"firmware";s:6:"11D167";s:6:"others";a:2:{s:4:"full";s:81:"AppleWebKit/537.51.2 (KHTML, like Gecko) Version/7.0 Mobile/11D167 Safari/9537.53";s:6:"detail";a:4:{i:0;a:3:{i:0;s:40:"AppleWebKit/537.51.2 (KHTML, like Gecko)";i:1;s:11:"AppleWebKit";i:2;s:8:"537.51.2";}i:1;a:3:{i:0;s:11:"Version/7.0";i:1;s:7:"Version";i:2;s:3:"7.0";}i:2;a:3:{i:0;s:13:"Mobile/11D167";i:1;s:6:"Mobile";i:2;s:6:"11D167";}i:3;a:3:{i:0;s:14:"Safari/9537.53";i:1;s:6:"Safari";i:2;s:7:"9537.53";}}}s:12:"product_name";s:7:"Mozilla";s:15:"product_version";s:3:"5.0";s:10:"user_agent";s:11:"Mozilla/5.0";s:18:"is_wireless_device";b:0;s:9:"is_mobile";b:1;s:10:"is_desktop";b:0;s:9:"is_tablet";b:0;s:6:"is_bot";b:0;s:8:"is_email";b:0;s:7:"is_text";b:0;s:25:"device_claims_web_support";b:0;s:9:"client_ip";s:12:"96.37.159.19";s:11:"php_version";s:6:"5.3.26";s:9:"server_os";s:6:"apache";s:17:"server_os_version";s:6:"2.2.24";s:18:"server_http_accept";s:63:"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8";s:27:"server_http_accept_language";s:5:"en-us";s:9:"server_ip";s:12:"192.168.1.16";s:11:"server_name";s:18:"fypg.dirextion.net";s:18:"browser_name_regex";s:84:"¤^mozilla/5\\.0 \\(.*mac os x.*\\) .*applewebkit/.* \\(khtml, like gecko\\) .*safari/.*$¤";s:20:"browser_name_pattern";s:69:"Mozilla/5.0 (*Mac OS X*) *AppleWebKit/* (KHTML, like Gecko) *Safari/*";s:6:"parent";s:14:"Safari Generic";s:9:"device_os";s:6:"MacOSX";s:14:"mobile_browser";s:6:"Safari";s:6:"frames";s:1:"1";s:7:"iframes";s:1:"1";s:6:"tables";s:1:"1";s:7:"cookies";s:1:"1";s:10:"javascript";s:1:"1";s:11:"javaapplets";s:1:"1";s:10:"cssversion";s:1:"1";s:22:"mobile_browser_version";s:3:"0.0";s:8:"majorver";s:1:"0";s:8:"minorver";s:1:"0";s:16:"platform_version";s:7:"unknown";s:5:"alpha";s:0:"";s:4:"beta";s:0:"";s:5:"win16";s:0:"";s:5:"win32";s:0:"";s:5:"win64";s:0:"";s:16:"backgroundsounds";s:0:"";s:8:"vbscript";s:0:"";s:15:"activexcontrols";s:0:"";s:14:"ismobiledevice";s:0:"";s:19:"issyndicationreader";s:0:"";s:7:"crawler";s:0:"";s:10:"aolversion";s:1:"0";s:6:"markup";s:6:"iphone";}s:7:"_aGroup";a:2:{s:12:"product_info";a:24:{i:0;s:13:"browser_build";i:1;s:21:"browser_compatibility";i:2;s:14:"browser_engine";i:3;s:12:"browser_name";i:4;s:13:"browser_token";i:5;s:15:"browser_version";i:6;s:7:"comment";i:7;s:18:"compatibility_flag";i:8;s:6:"device";i:9;s:15:"device_os_token";i:10;s:8:"firmware";i:11;s:6:"others";i:12;s:12:"product_name";i:13;s:15:"product_version";i:14;s:10:"user_agent";i:15;s:18:"is_wireless_device";i:16;s:9:"is_mobile";i:17;s:10:"is_desktop";i:18;s:9:"is_tablet";i:19;s:6:"is_bot";i:20;s:8:"is_email";i:21;s:7:"is_text";i:22;s:25:"device_claims_web_support";i:23;s:9:"client_ip";}s:11:"server_info";a:7:{i:0;s:11:"php_version";i:1;s:9:"server_os";i:2;s:17:"server_os_version";i:3;s:18:"server_http_accept";i:4;s:27:"server_http_accept_language";i:5;s:9:"server_ip";i:6;s:11:"server_name";}}s:8:"_browser";s:6:"Safari";s:15:"_browserVersion";s:3:"0.0";s:10:"_userAgent";s:126:"Mozilla/5.0 (iPad; CPU OS 7_1 like Mac OS X) AppleWebKit/537.51.2 (KHTML, like Gecko) Version/7.0 Mobile/11D167 Safari/9537.53";s:7:"_images";a:0:{}}";s:10:"user_agent";s:126:"Mozilla/5.0 (iPad; CPU OS 7_1 like Mac OS X) AppleWebKit/537.51.2 (KHTML, like Gecko) Version/7.0 Mobile/11D167 Safari/9537.53";s:11:"http_accept";s:63:"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8";}";}sysData|a:1:{s:12:"referringUri";s:6:"/test1";}'),
('n0rn1ohq9am2vfsrlgdp2pcq1kohl113', 1397508936, 86400, '.Mozilla/5.0 (iPhone; CPU iPhone OS 7_0_6 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11B651 Safari/9537.53|a:1:{s:7:"storage";s:4140:"a:6:{s:12:"browser_type";s:6:"mobile";s:6:"config";a:3:{s:23:"identification_sequence";s:14:"mobile,desktop";s:7:"storage";a:1:{s:7:"adapter";s:7:"Session";}s:6:"mobile";a:1:{s:8:"features";a:1:{s:9:"classname";s:45:"Zend_Http_UserAgent_Features_Adapter_Browscap";}}}s:12:"device_class";s:26:"Zend_Http_UserAgent_Mobile";s:6:"device";s:3541:"a:6:{s:10:"_aFeatures";a:60:{s:13:"browser_build";s:7:"9537.53";s:21:"browser_compatibility";s:6:"Safari";s:14:"browser_engine";s:11:"AppleWebKit";s:12:"browser_name";s:6:"Safari";s:13:"browser_token";s:33:"CPU iPhone OS 7_0_6 like Mac OS X";s:15:"browser_version";s:3:"0.0";s:7:"comment";s:14:"Safari Generic";s:18:"compatibility_flag";s:6:"iPhone";s:6:"device";s:6:"iphone";s:15:"device_os_token";s:9:"iPhone OS";s:8:"firmware";s:6:"11B651";s:6:"others";a:2:{s:4:"full";s:81:"AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11B651 Safari/9537.53";s:6:"detail";a:4:{i:0;a:3:{i:0;s:40:"AppleWebKit/537.51.1 (KHTML, like Gecko)";i:1;s:11:"AppleWebKit";i:2;s:8:"537.51.1";}i:1;a:3:{i:0;s:11:"Version/7.0";i:1;s:7:"Version";i:2;s:3:"7.0";}i:2;a:3:{i:0;s:13:"Mobile/11B651";i:1;s:6:"Mobile";i:2;s:6:"11B651";}i:3;a:3:{i:0;s:14:"Safari/9537.53";i:1;s:6:"Safari";i:2;s:7:"9537.53";}}}s:12:"product_name";s:7:"Mozilla";s:15:"product_version";s:3:"5.0";s:10:"user_agent";s:11:"Mozilla/5.0";s:18:"is_wireless_device";b:0;s:9:"is_mobile";b:1;s:10:"is_desktop";b:0;s:9:"is_tablet";b:0;s:6:"is_bot";b:0;s:8:"is_email";b:0;s:7:"is_text";b:0;s:25:"device_claims_web_support";b:0;s:9:"client_ip";s:11:"192.168.1.1";s:11:"php_version";s:6:"5.3.26";s:9:"server_os";s:6:"apache";s:17:"server_os_version";s:6:"2.2.24";s:18:"server_http_accept";s:63:"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8";s:27:"server_http_accept_language";s:5:"en-us";s:9:"server_ip";s:12:"192.168.1.16";s:11:"server_name";s:18:"fypg.dirextion.net";s:18:"browser_name_regex";s:84:"¤^mozilla/5\\.0 \\(.*mac os x.*\\) .*applewebkit/.* \\(khtml, like gecko\\) .*safari/.*$¤";s:20:"browser_name_pattern";s:69:"Mozilla/5.0 (*Mac OS X*) *AppleWebKit/* (KHTML, like Gecko) *Safari/*";s:6:"parent";s:14:"Safari Generic";s:9:"device_os";s:6:"MacOSX";s:14:"mobile_browser";s:6:"Safari";s:6:"frames";s:1:"1";s:7:"iframes";s:1:"1";s:6:"tables";s:1:"1";s:7:"cookies";s:1:"1";s:10:"javascript";s:1:"1";s:11:"javaapplets";s:1:"1";s:10:"cssversion";s:1:"1";s:22:"mobile_browser_version";s:3:"0.0";s:8:"majorver";s:1:"0";s:8:"minorver";s:1:"0";s:16:"platform_version";s:7:"unknown";s:5:"alpha";s:0:"";s:4:"beta";s:0:"";s:5:"win16";s:0:"";s:5:"win32";s:0:"";s:5:"win64";s:0:"";s:16:"backgroundsounds";s:0:"";s:8:"vbscript";s:0:"";s:15:"activexcontrols";s:0:"";s:14:"ismobiledevice";s:0:"";s:19:"issyndicationreader";s:0:"";s:7:"crawler";s:0:"";s:10:"aolversion";s:1:"0";s:6:"markup";s:6:"iphone";}s:7:"_aGroup";a:2:{s:12:"product_info";a:24:{i:0;s:13:"browser_build";i:1;s:21:"browser_compatibility";i:2;s:14:"browser_engine";i:3;s:12:"browser_name";i:4;s:13:"browser_token";i:5;s:15:"browser_version";i:6;s:7:"comment";i:7;s:18:"compatibility_flag";i:8;s:6:"device";i:9;s:15:"device_os_token";i:10;s:8:"firmware";i:11;s:6:"others";i:12;s:12:"product_name";i:13;s:15:"product_version";i:14;s:10:"user_agent";i:15;s:18:"is_wireless_device";i:16;s:9:"is_mobile";i:17;s:10:"is_desktop";i:18;s:9:"is_tablet";i:19;s:6:"is_bot";i:20;s:8:"is_email";i:21;s:7:"is_text";i:22;s:25:"device_claims_web_support";i:23;s:9:"client_ip";}s:11:"server_info";a:7:{i:0;s:11:"php_version";i:1;s:9:"server_os";i:2;s:17:"server_os_version";i:3;s:18:"server_http_accept";i:4;s:27:"server_http_accept_language";i:5;s:9:"server_ip";i:6;s:11:"server_name";}}s:8:"_browser";s:6:"Safari";s:15:"_browserVersion";s:3:"0.0";s:10:"_userAgent";s:137:"Mozilla/5.0 (iPhone; CPU iPhone OS 7_0_6 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11B651 Safari/9537.53";s:7:"_images";a:0:{}}";s:10:"user_agent";s:137:"Mozilla/5.0 (iPhone; CPU iPhone OS 7_0_6 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11B651 Safari/9537.53";s:11:"http_accept";s:63:"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8";}";}sysData|a:1:{s:12:"referringUri";s:7:"/events";}'),
('onncinm3kjnuqo4unntjh3i63q31vo8h', 1397101498, 86400, '.Mozilla/5.0 (iPhone; CPU iPhone OS 7_1 like Mac OS X) AppleWebKit/537.51.2 (KHTML, like Gecko) Version/7.0 Mobile/11D167 Safari/9537.53|a:1:{s:7:"storage";s:4137:"a:6:{s:12:"browser_type";s:6:"mobile";s:6:"config";a:3:{s:23:"identification_sequence";s:14:"mobile,desktop";s:7:"storage";a:1:{s:7:"adapter";s:7:"Session";}s:6:"mobile";a:1:{s:8:"features";a:1:{s:9:"classname";s:45:"Zend_Http_UserAgent_Features_Adapter_Browscap";}}}s:12:"device_class";s:26:"Zend_Http_UserAgent_Mobile";s:6:"device";s:3540:"a:6:{s:10:"_aFeatures";a:60:{s:13:"browser_build";s:7:"9537.53";s:21:"browser_compatibility";s:6:"Safari";s:14:"browser_engine";s:11:"AppleWebKit";s:12:"browser_name";s:6:"Safari";s:13:"browser_token";s:31:"CPU iPhone OS 7_1 like Mac OS X";s:15:"browser_version";s:3:"0.0";s:7:"comment";s:14:"Safari Generic";s:18:"compatibility_flag";s:6:"iPhone";s:6:"device";s:6:"iphone";s:15:"device_os_token";s:9:"iPhone OS";s:8:"firmware";s:6:"11D167";s:6:"others";a:2:{s:4:"full";s:81:"AppleWebKit/537.51.2 (KHTML, like Gecko) Version/7.0 Mobile/11D167 Safari/9537.53";s:6:"detail";a:4:{i:0;a:3:{i:0;s:40:"AppleWebKit/537.51.2 (KHTML, like Gecko)";i:1;s:11:"AppleWebKit";i:2;s:8:"537.51.2";}i:1;a:3:{i:0;s:11:"Version/7.0";i:1;s:7:"Version";i:2;s:3:"7.0";}i:2;a:3:{i:0;s:13:"Mobile/11D167";i:1;s:6:"Mobile";i:2;s:6:"11D167";}i:3;a:3:{i:0;s:14:"Safari/9537.53";i:1;s:6:"Safari";i:2;s:7:"9537.53";}}}s:12:"product_name";s:7:"Mozilla";s:15:"product_version";s:3:"5.0";s:10:"user_agent";s:11:"Mozilla/5.0";s:18:"is_wireless_device";b:0;s:9:"is_mobile";b:1;s:10:"is_desktop";b:0;s:9:"is_tablet";b:0;s:6:"is_bot";b:0;s:8:"is_email";b:0;s:7:"is_text";b:0;s:25:"device_claims_web_support";b:0;s:9:"client_ip";s:14:"166.147.120.35";s:11:"php_version";s:6:"5.3.26";s:9:"server_os";s:6:"apache";s:17:"server_os_version";s:6:"2.2.24";s:18:"server_http_accept";s:63:"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8";s:27:"server_http_accept_language";s:5:"en-us";s:9:"server_ip";s:12:"192.168.1.16";s:11:"server_name";s:18:"fypg.dirextion.net";s:18:"browser_name_regex";s:84:"¤^mozilla/5\\.0 \\(.*mac os x.*\\) .*applewebkit/.* \\(khtml, like gecko\\) .*safari/.*$¤";s:20:"browser_name_pattern";s:69:"Mozilla/5.0 (*Mac OS X*) *AppleWebKit/* (KHTML, like Gecko) *Safari/*";s:6:"parent";s:14:"Safari Generic";s:9:"device_os";s:6:"MacOSX";s:14:"mobile_browser";s:6:"Safari";s:6:"frames";s:1:"1";s:7:"iframes";s:1:"1";s:6:"tables";s:1:"1";s:7:"cookies";s:1:"1";s:10:"javascript";s:1:"1";s:11:"javaapplets";s:1:"1";s:10:"cssversion";s:1:"1";s:22:"mobile_browser_version";s:3:"0.0";s:8:"majorver";s:1:"0";s:8:"minorver";s:1:"0";s:16:"platform_version";s:7:"unknown";s:5:"alpha";s:0:"";s:4:"beta";s:0:"";s:5:"win16";s:0:"";s:5:"win32";s:0:"";s:5:"win64";s:0:"";s:16:"backgroundsounds";s:0:"";s:8:"vbscript";s:0:"";s:15:"activexcontrols";s:0:"";s:14:"ismobiledevice";s:0:"";s:19:"issyndicationreader";s:0:"";s:7:"crawler";s:0:"";s:10:"aolversion";s:1:"0";s:6:"markup";s:6:"iphone";}s:7:"_aGroup";a:2:{s:12:"product_info";a:24:{i:0;s:13:"browser_build";i:1;s:21:"browser_compatibility";i:2;s:14:"browser_engine";i:3;s:12:"browser_name";i:4;s:13:"browser_token";i:5;s:15:"browser_version";i:6;s:7:"comment";i:7;s:18:"compatibility_flag";i:8;s:6:"device";i:9;s:15:"device_os_token";i:10;s:8:"firmware";i:11;s:6:"others";i:12;s:12:"product_name";i:13;s:15:"product_version";i:14;s:10:"user_agent";i:15;s:18:"is_wireless_device";i:16;s:9:"is_mobile";i:17;s:10:"is_desktop";i:18;s:9:"is_tablet";i:19;s:6:"is_bot";i:20;s:8:"is_email";i:21;s:7:"is_text";i:22;s:25:"device_claims_web_support";i:23;s:9:"client_ip";}s:11:"server_info";a:7:{i:0;s:11:"php_version";i:1;s:9:"server_os";i:2;s:17:"server_os_version";i:3;s:18:"server_http_accept";i:4;s:27:"server_http_accept_language";i:5;s:9:"server_ip";i:6;s:11:"server_name";}}s:8:"_browser";s:6:"Safari";s:15:"_browserVersion";s:3:"0.0";s:10:"_userAgent";s:135:"Mozilla/5.0 (iPhone; CPU iPhone OS 7_1 like Mac OS X) AppleWebKit/537.51.2 (KHTML, like Gecko) Version/7.0 Mobile/11D167 Safari/9537.53";s:7:"_images";a:0:{}}";s:10:"user_agent";s:135:"Mozilla/5.0 (iPhone; CPU iPhone OS 7_1 like Mac OS X) AppleWebKit/537.51.2 (KHTML, like Gecko) Version/7.0 Mobile/11D167 Safari/9537.53";s:11:"http_accept";s:63:"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8";}";}sysData|a:1:{s:12:"referringUri";s:9:"/About-Us";}'),
('p5k25fccip5d38sjjlld0ihkk503ro2r', 1397386315, 86400, '.Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.75.14 (KHTML, like Gecko) Version/7.0.3 Safari/537.75.14|a:1:{s:7:"storage";s:3154:"a:6:{s:12:"browser_type";s:7:"desktop";s:6:"config";a:3:{s:23:"identification_sequence";s:14:"mobile,desktop";s:7:"storage";a:1:{s:7:"adapter";s:7:"Session";}s:6:"mobile";a:1:{s:8:"features";a:1:{s:9:"classname";s:45:"Zend_Http_UserAgent_Features_Adapter_Browscap";}}}s:12:"device_class";s:27:"Zend_Http_UserAgent_Desktop";s:6:"device";s:2571:"a:6:{s:10:"_aFeatures";a:28:{s:21:"browser_compatibility";s:6:"Safari";s:14:"browser_engine";s:11:"AppleWebKit";s:12:"browser_name";s:6:"Safari";s:13:"browser_token";s:21:"Intel Mac OS X 10_9_2";s:15:"browser_version";s:5:"7.0.3";s:7:"comment";a:2:{s:4:"full";s:32:"Macintosh; Intel Mac OS X 10_9_2";s:6:"detail";a:2:{i:0;s:9:"Macintosh";i:1;s:22:" Intel Mac OS X 10_9_2";}}s:18:"compatibility_flag";s:9:"Macintosh";s:15:"device_os_token";s:9:"Macintosh";s:6:"others";a:2:{s:4:"full";s:72:"AppleWebKit/537.75.14 (KHTML, like Gecko) Version/7.0.3 Safari/537.75.14";s:6:"detail";a:3:{i:0;a:3:{i:0;s:41:"AppleWebKit/537.75.14 (KHTML, like Gecko)";i:1;s:11:"AppleWebKit";i:2;s:9:"537.75.14";}i:1;a:3:{i:0;s:13:"Version/7.0.3";i:1;s:7:"Version";i:2;s:5:"7.0.3";}i:2;a:3:{i:0;s:16:"Safari/537.75.14";i:1;s:6:"Safari";i:2;s:9:"537.75.14";}}}s:12:"product_name";s:7:"Mozilla";s:15:"product_version";s:3:"5.0";s:10:"user_agent";s:11:"Mozilla/5.0";s:18:"is_wireless_device";b:0;s:9:"is_mobile";b:0;s:10:"is_desktop";b:1;s:9:"is_tablet";b:0;s:6:"is_bot";b:0;s:8:"is_email";b:0;s:7:"is_text";b:0;s:25:"device_claims_web_support";b:0;s:9:"client_ip";s:12:"96.37.159.19";s:11:"php_version";s:6:"5.3.26";s:9:"server_os";s:6:"apache";s:17:"server_os_version";s:6:"2.2.24";s:18:"server_http_accept";s:63:"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8";s:27:"server_http_accept_language";s:5:"en-us";s:9:"server_ip";s:12:"192.168.1.16";s:11:"server_name";s:18:"fypg.dirextion.net";}s:7:"_aGroup";a:2:{s:12:"product_info";a:21:{i:0;s:21:"browser_compatibility";i:1;s:14:"browser_engine";i:2;s:12:"browser_name";i:3;s:13:"browser_token";i:4;s:15:"browser_version";i:5;s:7:"comment";i:6;s:18:"compatibility_flag";i:7;s:15:"device_os_token";i:8;s:6:"others";i:9;s:12:"product_name";i:10;s:15:"product_version";i:11;s:10:"user_agent";i:12;s:18:"is_wireless_device";i:13;s:9:"is_mobile";i:14;s:10:"is_desktop";i:15;s:9:"is_tablet";i:16;s:6:"is_bot";i:17;s:8:"is_email";i:18;s:7:"is_text";i:19;s:25:"device_claims_web_support";i:20;s:9:"client_ip";}s:11:"server_info";a:7:{i:0;s:11:"php_version";i:1;s:9:"server_os";i:2;s:17:"server_os_version";i:3;s:18:"server_http_accept";i:4;s:27:"server_http_accept_language";i:5;s:9:"server_ip";i:6;s:11:"server_name";}}s:8:"_browser";s:6:"Safari";s:15:"_browserVersion";s:5:"7.0.3";s:10:"_userAgent";s:119:"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.75.14 (KHTML, like Gecko) Version/7.0.3 Safari/537.75.14";s:7:"_images";a:6:{i:0;s:4:"jpeg";i:1;s:3:"gif";i:2;s:3:"png";i:3;s:5:"pjpeg";i:4;s:5:"x-png";i:5;s:3:"bmp";}}";s:10:"user_agent";s:119:"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.75.14 (KHTML, like Gecko) Version/7.0.3 Safari/537.75.14";s:11:"http_accept";s:63:"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8";}";}sysData|a:1:{s:12:"referringUri";s:11:"/user/login";}'),
('pbtfk6hatb14i26knq9treu4cm457qht', 1397403563, 86400, '.Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.75.14 (KHTML, like Gecko) Version/7.0.3 Safari/537.75.14|a:1:{s:7:"storage";s:3155:"a:6:{s:12:"browser_type";s:7:"desktop";s:6:"config";a:3:{s:23:"identification_sequence";s:14:"mobile,desktop";s:7:"storage";a:1:{s:7:"adapter";s:7:"Session";}s:6:"mobile";a:1:{s:8:"features";a:1:{s:9:"classname";s:45:"Zend_Http_UserAgent_Features_Adapter_Browscap";}}}s:12:"device_class";s:27:"Zend_Http_UserAgent_Desktop";s:6:"device";s:2572:"a:6:{s:10:"_aFeatures";a:28:{s:21:"browser_compatibility";s:6:"Safari";s:14:"browser_engine";s:11:"AppleWebKit";s:12:"browser_name";s:6:"Safari";s:13:"browser_token";s:21:"Intel Mac OS X 10_9_2";s:15:"browser_version";s:5:"7.0.3";s:7:"comment";a:2:{s:4:"full";s:32:"Macintosh; Intel Mac OS X 10_9_2";s:6:"detail";a:2:{i:0;s:9:"Macintosh";i:1;s:22:" Intel Mac OS X 10_9_2";}}s:18:"compatibility_flag";s:9:"Macintosh";s:15:"device_os_token";s:9:"Macintosh";s:6:"others";a:2:{s:4:"full";s:72:"AppleWebKit/537.75.14 (KHTML, like Gecko) Version/7.0.3 Safari/537.75.14";s:6:"detail";a:3:{i:0;a:3:{i:0;s:41:"AppleWebKit/537.75.14 (KHTML, like Gecko)";i:1;s:11:"AppleWebKit";i:2;s:9:"537.75.14";}i:1;a:3:{i:0;s:13:"Version/7.0.3";i:1;s:7:"Version";i:2;s:5:"7.0.3";}i:2;a:3:{i:0;s:16:"Safari/537.75.14";i:1;s:6:"Safari";i:2;s:9:"537.75.14";}}}s:12:"product_name";s:7:"Mozilla";s:15:"product_version";s:3:"5.0";s:10:"user_agent";s:11:"Mozilla/5.0";s:18:"is_wireless_device";b:0;s:9:"is_mobile";b:0;s:10:"is_desktop";b:1;s:9:"is_tablet";b:0;s:6:"is_bot";b:0;s:8:"is_email";b:0;s:7:"is_text";b:0;s:25:"device_claims_web_support";b:0;s:9:"client_ip";s:13:"64.53.243.105";s:11:"php_version";s:6:"5.3.26";s:9:"server_os";s:6:"apache";s:17:"server_os_version";s:6:"2.2.24";s:18:"server_http_accept";s:63:"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8";s:27:"server_http_accept_language";s:5:"en-us";s:9:"server_ip";s:12:"192.168.1.16";s:11:"server_name";s:18:"fypg.dirextion.net";}s:7:"_aGroup";a:2:{s:12:"product_info";a:21:{i:0;s:21:"browser_compatibility";i:1;s:14:"browser_engine";i:2;s:12:"browser_name";i:3;s:13:"browser_token";i:4;s:15:"browser_version";i:5;s:7:"comment";i:6;s:18:"compatibility_flag";i:7;s:15:"device_os_token";i:8;s:6:"others";i:9;s:12:"product_name";i:10;s:15:"product_version";i:11;s:10:"user_agent";i:12;s:18:"is_wireless_device";i:13;s:9:"is_mobile";i:14;s:10:"is_desktop";i:15;s:9:"is_tablet";i:16;s:6:"is_bot";i:17;s:8:"is_email";i:18;s:7:"is_text";i:19;s:25:"device_claims_web_support";i:20;s:9:"client_ip";}s:11:"server_info";a:7:{i:0;s:11:"php_version";i:1;s:9:"server_os";i:2;s:17:"server_os_version";i:3;s:18:"server_http_accept";i:4;s:27:"server_http_accept_language";i:5;s:9:"server_ip";i:6;s:11:"server_name";}}s:8:"_browser";s:6:"Safari";s:15:"_browserVersion";s:5:"7.0.3";s:10:"_userAgent";s:119:"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.75.14 (KHTML, like Gecko) Version/7.0.3 Safari/537.75.14";s:7:"_images";a:6:{i:0;s:4:"jpeg";i:1;s:3:"gif";i:2;s:3:"png";i:3;s:5:"pjpeg";i:4;s:5:"x-png";i:5;s:3:"bmp";}}";s:10:"user_agent";s:119:"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.75.14 (KHTML, like Gecko) Version/7.0.3 Safari/537.75.14";s:11:"http_accept";s:63:"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8";}";}sysData|a:1:{s:12:"referringUri";s:6:"/test1";}'),
('s5pp1li14mdns97g4f74mhl0qlbu6gmh', 1397404150, 86400, '.Mozilla/5.0 (iPhone; CPU iPhone OS 6_1_3 like Mac OS X) AppleWebKit/536.26 (KHTML, like Gecko) Version/6.0 Mobile/10B329 Safari/8536.25|a:1:{s:7:"storage";s:4150:"a:6:{s:12:"browser_type";s:6:"mobile";s:6:"config";a:3:{s:23:"identification_sequence";s:14:"mobile,desktop";s:7:"storage";a:1:{s:7:"adapter";s:7:"Session";}s:6:"mobile";a:1:{s:8:"features";a:1:{s:9:"classname";s:45:"Zend_Http_UserAgent_Features_Adapter_Browscap";}}}s:12:"device_class";s:26:"Zend_Http_UserAgent_Mobile";s:6:"device";s:3553:"a:6:{s:10:"_aFeatures";a:60:{s:13:"browser_build";s:7:"8536.25";s:21:"browser_compatibility";s:6:"Safari";s:14:"browser_engine";s:11:"AppleWebKit";s:12:"browser_name";s:6:"Safari";s:13:"browser_token";s:33:"CPU iPhone OS 6_1_3 like Mac OS X";s:15:"browser_version";s:3:"6.0";s:7:"comment";s:10:"Safari 6.0";s:18:"compatibility_flag";s:6:"iPhone";s:6:"device";s:6:"iphone";s:15:"device_os_token";s:9:"iPhone OS";s:8:"firmware";s:6:"10B329";s:6:"others";a:2:{s:4:"full";s:79:"AppleWebKit/536.26 (KHTML, like Gecko) Version/6.0 Mobile/10B329 Safari/8536.25";s:6:"detail";a:4:{i:0;a:3:{i:0;s:38:"AppleWebKit/536.26 (KHTML, like Gecko)";i:1;s:11:"AppleWebKit";i:2;s:6:"536.26";}i:1;a:3:{i:0;s:11:"Version/6.0";i:1;s:7:"Version";i:2;s:3:"6.0";}i:2;a:3:{i:0;s:13:"Mobile/10B329";i:1;s:6:"Mobile";i:2;s:6:"10B329";}i:3;a:3:{i:0;s:14:"Safari/8536.25";i:1;s:6:"Safari";i:2;s:7:"8536.25";}}}s:12:"product_name";s:7:"Mozilla";s:15:"product_version";s:3:"5.0";s:10:"user_agent";s:11:"Mozilla/5.0";s:18:"is_wireless_device";b:0;s:9:"is_mobile";b:1;s:10:"is_desktop";b:0;s:9:"is_tablet";b:0;s:6:"is_bot";b:0;s:8:"is_email";b:0;s:7:"is_text";b:0;s:25:"device_claims_web_support";b:0;s:9:"client_ip";s:11:"68.57.86.42";s:11:"php_version";s:6:"5.3.26";s:9:"server_os";s:6:"apache";s:17:"server_os_version";s:6:"2.2.24";s:18:"server_http_accept";s:63:"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8";s:27:"server_http_accept_language";s:5:"en-us";s:9:"server_ip";s:12:"192.168.1.16";s:11:"server_name";s:18:"fypg.dirextion.net";s:18:"browser_name_regex";s:99:"¤^mozilla/5\\.0 \\(.*mac os x.*\\) .*applewebkit/.* \\(khtml, like gecko\\) .*version/6\\.0.* safari/.*$¤";s:20:"browser_name_pattern";s:82:"Mozilla/5.0 (*Mac OS X*) *AppleWebKit/* (KHTML, like Gecko) *Version/6.0* Safari/*";s:6:"parent";s:10:"Safari 6.0";s:9:"device_os";s:6:"MacOSX";s:14:"mobile_browser";s:6:"Safari";s:22:"mobile_browser_version";s:3:"6.0";s:8:"majorver";s:1:"6";s:8:"minorver";s:1:"0";s:6:"frames";s:1:"1";s:7:"iframes";s:1:"1";s:6:"tables";s:1:"1";s:7:"cookies";s:1:"1";s:10:"javascript";s:1:"1";s:11:"javaapplets";s:1:"1";s:10:"cssversion";s:1:"3";s:16:"platform_version";s:7:"unknown";s:5:"alpha";s:0:"";s:4:"beta";s:0:"";s:5:"win16";s:0:"";s:5:"win32";s:0:"";s:5:"win64";s:0:"";s:16:"backgroundsounds";s:0:"";s:8:"vbscript";s:0:"";s:15:"activexcontrols";s:0:"";s:14:"ismobiledevice";s:0:"";s:19:"issyndicationreader";s:0:"";s:7:"crawler";s:0:"";s:10:"aolversion";s:1:"0";s:6:"markup";s:6:"iphone";}s:7:"_aGroup";a:2:{s:12:"product_info";a:24:{i:0;s:13:"browser_build";i:1;s:21:"browser_compatibility";i:2;s:14:"browser_engine";i:3;s:12:"browser_name";i:4;s:13:"browser_token";i:5;s:15:"browser_version";i:6;s:7:"comment";i:7;s:18:"compatibility_flag";i:8;s:6:"device";i:9;s:15:"device_os_token";i:10;s:8:"firmware";i:11;s:6:"others";i:12;s:12:"product_name";i:13;s:15:"product_version";i:14;s:10:"user_agent";i:15;s:18:"is_wireless_device";i:16;s:9:"is_mobile";i:17;s:10:"is_desktop";i:18;s:9:"is_tablet";i:19;s:6:"is_bot";i:20;s:8:"is_email";i:21;s:7:"is_text";i:22;s:25:"device_claims_web_support";i:23;s:9:"client_ip";}s:11:"server_info";a:7:{i:0;s:11:"php_version";i:1;s:9:"server_os";i:2;s:17:"server_os_version";i:3;s:18:"server_http_accept";i:4;s:27:"server_http_accept_language";i:5;s:9:"server_ip";i:6;s:11:"server_name";}}s:8:"_browser";s:6:"Safari";s:15:"_browserVersion";s:3:"6.0";s:10:"_userAgent";s:135:"Mozilla/5.0 (iPhone; CPU iPhone OS 6_1_3 like Mac OS X) AppleWebKit/536.26 (KHTML, like Gecko) Version/6.0 Mobile/10B329 Safari/8536.25";s:7:"_images";a:0:{}}";s:10:"user_agent";s:135:"Mozilla/5.0 (iPhone; CPU iPhone OS 6_1_3 like Mac OS X) AppleWebKit/536.26 (KHTML, like Gecko) Version/6.0 Mobile/10B329 Safari/8536.25";s:11:"http_accept";s:63:"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8";}";}sysData|a:1:{s:12:"referringUri";s:9:"/About-Us";}'),
('t2hht1t1ijj5losffabnhdnltil6pfk7', 1397399571, 86400, '.Mozilla/5.0 (Android; Tablet; rv:23.0) Gecko/23.0 Firefox/23.0|a:1:{s:7:"storage";s:3412:"a:6:{s:12:"browser_type";s:6:"mobile";s:6:"config";a:3:{s:23:"identification_sequence";s:14:"mobile,desktop";s:7:"storage";a:1:{s:7:"adapter";s:7:"Session";}s:6:"mobile";a:1:{s:8:"features";a:1:{s:9:"classname";s:45:"Zend_Http_UserAgent_Features_Adapter_Browscap";}}}s:12:"device_class";s:26:"Zend_Http_UserAgent_Mobile";s:6:"device";s:2889:"a:6:{s:10:"_aFeatures";a:56:{s:21:"browser_compatibility";s:7:"Firefox";s:14:"browser_engine";s:5:"Gecko";s:12:"browser_name";s:15:"Default Browser";s:13:"browser_token";s:6:"Tablet";s:15:"browser_version";s:3:"0.0";s:7:"comment";s:15:"Default Browser";s:18:"compatibility_flag";s:7:"Android";s:15:"device_os_token";s:7:"rv:23.0";s:6:"others";a:2:{s:4:"full";s:23:"Gecko/23.0 Firefox/23.0";s:6:"detail";a:2:{i:0;a:3:{i:0;s:10:"Gecko/23.0";i:1;s:5:"Gecko";i:2;s:4:"23.0";}i:1;a:3:{i:0;s:12:"Firefox/23.0";i:1;s:7:"Firefox";i:2;s:4:"23.0";}}}s:12:"product_name";s:7:"Mozilla";s:15:"product_version";s:3:"5.0";s:10:"user_agent";s:11:"Mozilla/5.0";s:18:"is_wireless_device";b:0;s:9:"is_mobile";b:1;s:10:"is_desktop";b:0;s:9:"is_tablet";b:0;s:6:"is_bot";b:0;s:8:"is_email";b:0;s:7:"is_text";b:0;s:25:"device_claims_web_support";b:0;s:9:"client_ip";s:13:"64.53.243.105";s:11:"php_version";s:6:"5.3.26";s:9:"server_os";s:6:"apache";s:17:"server_os_version";s:6:"2.2.24";s:18:"server_http_accept";s:63:"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8";s:27:"server_http_accept_language";s:14:"en-US,en;q=0.5";s:9:"server_ip";s:12:"192.168.1.16";s:11:"server_name";s:18:"fypg.dirextion.net";s:18:"browser_name_regex";s:6:"¤^.*$¤";s:20:"browser_name_pattern";s:1:"*";s:14:"mobile_browser";s:15:"Default Browser";s:22:"mobile_browser_version";s:3:"0.0";s:8:"majorver";s:1:"0";s:8:"minorver";s:1:"0";s:9:"device_os";s:7:"unknown";s:16:"platform_version";s:7:"unknown";s:5:"alpha";s:0:"";s:4:"beta";s:0:"";s:5:"win16";s:0:"";s:5:"win32";s:0:"";s:5:"win64";s:0:"";s:6:"frames";s:0:"";s:7:"iframes";s:0:"";s:6:"tables";s:0:"";s:7:"cookies";s:0:"";s:16:"backgroundsounds";s:0:"";s:10:"javascript";s:0:"";s:8:"vbscript";s:0:"";s:11:"javaapplets";s:0:"";s:15:"activexcontrols";s:0:"";s:14:"ismobiledevice";s:0:"";s:19:"issyndicationreader";s:0:"";s:7:"crawler";s:0:"";s:10:"cssversion";s:1:"0";s:10:"aolversion";s:1:"0";s:6:"markup";s:0:"";}s:7:"_aGroup";a:2:{s:12:"product_info";a:21:{i:0;s:21:"browser_compatibility";i:1;s:14:"browser_engine";i:2;s:12:"browser_name";i:3;s:13:"browser_token";i:4;s:15:"browser_version";i:5;s:7:"comment";i:6;s:18:"compatibility_flag";i:7;s:15:"device_os_token";i:8;s:6:"others";i:9;s:12:"product_name";i:10;s:15:"product_version";i:11;s:10:"user_agent";i:12;s:18:"is_wireless_device";i:13;s:9:"is_mobile";i:14;s:10:"is_desktop";i:15;s:9:"is_tablet";i:16;s:6:"is_bot";i:17;s:8:"is_email";i:18;s:7:"is_text";i:19;s:25:"device_claims_web_support";i:20;s:9:"client_ip";}s:11:"server_info";a:7:{i:0;s:11:"php_version";i:1;s:9:"server_os";i:2;s:17:"server_os_version";i:3;s:18:"server_http_accept";i:4;s:27:"server_http_accept_language";i:5;s:9:"server_ip";i:6;s:11:"server_name";}}s:8:"_browser";s:15:"Default Browser";s:15:"_browserVersion";s:3:"0.0";s:10:"_userAgent";s:62:"Mozilla/5.0 (Android; Tablet; rv:23.0) Gecko/23.0 Firefox/23.0";s:7:"_images";a:0:{}}";s:10:"user_agent";s:62:"Mozilla/5.0 (Android; Tablet; rv:23.0) Gecko/23.0 Firefox/23.0";s:11:"http_accept";s:63:"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8";}";}sysData|a:1:{s:12:"referringUri";s:18:"/events/display/24";}');
INSERT INTO `session` (`id`, `modified`, `lifetime`, `data`) VALUES
('v4ts9qadpjthlnjr8ju1m7mt5654s56t', 1397167201, 86400, '.Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.152 Safari/537.36|a:1:{s:7:"storage";s:3209:"a:6:{s:12:"browser_type";s:7:"desktop";s:6:"config";a:3:{s:23:"identification_sequence";s:14:"mobile,desktop";s:7:"storage";a:1:{s:7:"adapter";s:7:"Session";}s:6:"mobile";a:1:{s:8:"features";a:1:{s:9:"classname";s:45:"Zend_Http_UserAgent_Features_Adapter_Browscap";}}}s:12:"device_class";s:27:"Zend_Http_UserAgent_Desktop";s:6:"device";s:2614:"a:6:{s:10:"_aFeatures";a:28:{s:21:"browser_compatibility";s:6:"Safari";s:14:"browser_engine";s:11:"AppleWebKit";s:12:"browser_name";s:6:"Chrome";s:13:"browser_token";s:21:"Intel Mac OS X 10_6_8";s:15:"browser_version";s:13:"33.0.1750.152";s:7:"comment";a:2:{s:4:"full";s:32:"Macintosh; Intel Mac OS X 10_6_8";s:6:"detail";a:2:{i:0;s:9:"Macintosh";i:1;s:22:" Intel Mac OS X 10_6_8";}}s:18:"compatibility_flag";s:9:"Macintosh";s:15:"device_os_token";s:9:"Macintosh";s:6:"others";a:2:{s:4:"full";s:73:"AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.152 Safari/537.36";s:6:"detail";a:3:{i:0;a:3:{i:0;s:38:"AppleWebKit/537.36 (KHTML, like Gecko)";i:1;s:11:"AppleWebKit";i:2;s:6:"537.36";}i:1;a:3:{i:0;s:20:"Chrome/33.0.1750.152";i:1;s:6:"Chrome";i:2;s:13:"33.0.1750.152";}i:2;a:3:{i:0;s:13:"Safari/537.36";i:1;s:6:"Safari";i:2;s:6:"537.36";}}}s:12:"product_name";s:7:"Mozilla";s:15:"product_version";s:3:"5.0";s:10:"user_agent";s:11:"Mozilla/5.0";s:18:"is_wireless_device";b:0;s:9:"is_mobile";b:0;s:10:"is_desktop";b:1;s:9:"is_tablet";b:0;s:6:"is_bot";b:0;s:8:"is_email";b:0;s:7:"is_text";b:0;s:25:"device_claims_web_support";b:0;s:9:"client_ip";s:11:"192.168.1.1";s:11:"php_version";s:6:"5.3.26";s:9:"server_os";s:6:"apache";s:17:"server_os_version";s:6:"2.2.24";s:18:"server_http_accept";s:74:"text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8";s:27:"server_http_accept_language";s:14:"en-US,en;q=0.8";s:9:"server_ip";s:12:"192.168.1.16";s:11:"server_name";s:18:"fypg.dirextion.net";}s:7:"_aGroup";a:2:{s:12:"product_info";a:21:{i:0;s:21:"browser_compatibility";i:1;s:14:"browser_engine";i:2;s:12:"browser_name";i:3;s:13:"browser_token";i:4;s:15:"browser_version";i:5;s:7:"comment";i:6;s:18:"compatibility_flag";i:7;s:15:"device_os_token";i:8;s:6:"others";i:9;s:12:"product_name";i:10;s:15:"product_version";i:11;s:10:"user_agent";i:12;s:18:"is_wireless_device";i:13;s:9:"is_mobile";i:14;s:10:"is_desktop";i:15;s:9:"is_tablet";i:16;s:6:"is_bot";i:17;s:8:"is_email";i:18;s:7:"is_text";i:19;s:25:"device_claims_web_support";i:20;s:9:"client_ip";}s:11:"server_info";a:7:{i:0;s:11:"php_version";i:1;s:9:"server_os";i:2;s:17:"server_os_version";i:3;s:18:"server_http_accept";i:4;s:27:"server_http_accept_language";i:5;s:9:"server_ip";i:6;s:11:"server_name";}}s:8:"_browser";s:6:"Chrome";s:15:"_browserVersion";s:13:"33.0.1750.152";s:10:"_userAgent";s:120:"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.152 Safari/537.36";s:7:"_images";a:6:{i:0;s:4:"jpeg";i:1;s:3:"gif";i:2;s:3:"png";i:3;s:5:"pjpeg";i:4;s:5:"x-png";i:5;s:3:"bmp";}}";s:10:"user_agent";s:120:"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.152 Safari/537.36";s:11:"http_accept";s:74:"text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8";}";}sysData|a:1:{s:12:"referringUri";s:12:"/favicon.ico";}Zend_Auth|a:1:{s:7:"storage";O:8:"stdClass":3:{s:6:"userId";s:1:"0";s:8:"userName";s:7:"dxadmin";s:4:"role";s:7:"dxadmin";}}'),
('vc4ivc3gp4teu732o84rsvfs15hi729g', 1397489947, 86400, '.Mozilla/5.0 (iPhone; CPU iPhone OS 7_0_6 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11B651 Safari/9537.53|a:1:{s:7:"storage";s:4140:"a:6:{s:12:"browser_type";s:6:"mobile";s:6:"config";a:3:{s:23:"identification_sequence";s:14:"mobile,desktop";s:7:"storage";a:1:{s:7:"adapter";s:7:"Session";}s:6:"mobile";a:1:{s:8:"features";a:1:{s:9:"classname";s:45:"Zend_Http_UserAgent_Features_Adapter_Browscap";}}}s:12:"device_class";s:26:"Zend_Http_UserAgent_Mobile";s:6:"device";s:3541:"a:6:{s:10:"_aFeatures";a:60:{s:13:"browser_build";s:7:"9537.53";s:21:"browser_compatibility";s:6:"Safari";s:14:"browser_engine";s:11:"AppleWebKit";s:12:"browser_name";s:6:"Safari";s:13:"browser_token";s:33:"CPU iPhone OS 7_0_6 like Mac OS X";s:15:"browser_version";s:3:"0.0";s:7:"comment";s:14:"Safari Generic";s:18:"compatibility_flag";s:6:"iPhone";s:6:"device";s:6:"iphone";s:15:"device_os_token";s:9:"iPhone OS";s:8:"firmware";s:6:"11B651";s:6:"others";a:2:{s:4:"full";s:81:"AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11B651 Safari/9537.53";s:6:"detail";a:4:{i:0;a:3:{i:0;s:40:"AppleWebKit/537.51.1 (KHTML, like Gecko)";i:1;s:11:"AppleWebKit";i:2;s:8:"537.51.1";}i:1;a:3:{i:0;s:11:"Version/7.0";i:1;s:7:"Version";i:2;s:3:"7.0";}i:2;a:3:{i:0;s:13:"Mobile/11B651";i:1;s:6:"Mobile";i:2;s:6:"11B651";}i:3;a:3:{i:0;s:14:"Safari/9537.53";i:1;s:6:"Safari";i:2;s:7:"9537.53";}}}s:12:"product_name";s:7:"Mozilla";s:15:"product_version";s:3:"5.0";s:10:"user_agent";s:11:"Mozilla/5.0";s:18:"is_wireless_device";b:0;s:9:"is_mobile";b:1;s:10:"is_desktop";b:0;s:9:"is_tablet";b:0;s:6:"is_bot";b:0;s:8:"is_email";b:0;s:7:"is_text";b:0;s:25:"device_claims_web_support";b:0;s:9:"client_ip";s:11:"192.168.1.1";s:11:"php_version";s:6:"5.3.26";s:9:"server_os";s:6:"apache";s:17:"server_os_version";s:6:"2.2.24";s:18:"server_http_accept";s:63:"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8";s:27:"server_http_accept_language";s:5:"en-us";s:9:"server_ip";s:12:"192.168.1.16";s:11:"server_name";s:18:"fypg.dirextion.net";s:18:"browser_name_regex";s:84:"¤^mozilla/5\\.0 \\(.*mac os x.*\\) .*applewebkit/.* \\(khtml, like gecko\\) .*safari/.*$¤";s:20:"browser_name_pattern";s:69:"Mozilla/5.0 (*Mac OS X*) *AppleWebKit/* (KHTML, like Gecko) *Safari/*";s:6:"parent";s:14:"Safari Generic";s:9:"device_os";s:6:"MacOSX";s:14:"mobile_browser";s:6:"Safari";s:6:"frames";s:1:"1";s:7:"iframes";s:1:"1";s:6:"tables";s:1:"1";s:7:"cookies";s:1:"1";s:10:"javascript";s:1:"1";s:11:"javaapplets";s:1:"1";s:10:"cssversion";s:1:"1";s:22:"mobile_browser_version";s:3:"0.0";s:8:"majorver";s:1:"0";s:8:"minorver";s:1:"0";s:16:"platform_version";s:7:"unknown";s:5:"alpha";s:0:"";s:4:"beta";s:0:"";s:5:"win16";s:0:"";s:5:"win32";s:0:"";s:5:"win64";s:0:"";s:16:"backgroundsounds";s:0:"";s:8:"vbscript";s:0:"";s:15:"activexcontrols";s:0:"";s:14:"ismobiledevice";s:0:"";s:19:"issyndicationreader";s:0:"";s:7:"crawler";s:0:"";s:10:"aolversion";s:1:"0";s:6:"markup";s:6:"iphone";}s:7:"_aGroup";a:2:{s:12:"product_info";a:24:{i:0;s:13:"browser_build";i:1;s:21:"browser_compatibility";i:2;s:14:"browser_engine";i:3;s:12:"browser_name";i:4;s:13:"browser_token";i:5;s:15:"browser_version";i:6;s:7:"comment";i:7;s:18:"compatibility_flag";i:8;s:6:"device";i:9;s:15:"device_os_token";i:10;s:8:"firmware";i:11;s:6:"others";i:12;s:12:"product_name";i:13;s:15:"product_version";i:14;s:10:"user_agent";i:15;s:18:"is_wireless_device";i:16;s:9:"is_mobile";i:17;s:10:"is_desktop";i:18;s:9:"is_tablet";i:19;s:6:"is_bot";i:20;s:8:"is_email";i:21;s:7:"is_text";i:22;s:25:"device_claims_web_support";i:23;s:9:"client_ip";}s:11:"server_info";a:7:{i:0;s:11:"php_version";i:1;s:9:"server_os";i:2;s:17:"server_os_version";i:3;s:18:"server_http_accept";i:4;s:27:"server_http_accept_language";i:5;s:9:"server_ip";i:6;s:11:"server_name";}}s:8:"_browser";s:6:"Safari";s:15:"_browserVersion";s:3:"0.0";s:10:"_userAgent";s:137:"Mozilla/5.0 (iPhone; CPU iPhone OS 7_0_6 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11B651 Safari/9537.53";s:7:"_images";a:0:{}}";s:10:"user_agent";s:137:"Mozilla/5.0 (iPhone; CPU iPhone OS 7_0_6 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11B651 Safari/9537.53";s:11:"http_accept";s:63:"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8";}";}sysData|a:1:{s:12:"referringUri";s:1:"/";}');

-- --------------------------------------------------------


--
-- Table structure for table `skins`
--

CREATE TABLE IF NOT EXISTS `skins` (
  `skinId` int(11) NOT NULL AUTO_INCREMENT,
  `skinName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`skinId`),
  UNIQUE KEY `skinName` (`skinName`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `skins`
--

INSERT INTO `skins` (`skinId`, `skinName`) VALUES
(1, 'default'),
(2, 'topquality'),
(3, 'fypg')
(4, 'catsitter');

-- --------------------------------------------------------

--
-- Table structure for table `skin_settings`
--

CREATE TABLE IF NOT EXISTS `skin_settings` (
  `recordId` int(11) NOT NULL AUTO_INCREMENT,
  `skinId` int(11) NOT NULL,
  `spec` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`recordId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `skin_settings`
--

INSERT INTO `skin_settings` (`recordId`, `skinId`, `spec`, `value`) VALUES
(1, 1, 'skinVersion', '1.1.0'),
(2, 1, 'appVersion', '1.1.0'),
(3, 1, 'isCurrentSkin', '0'),
(4, 2, 'skinVersion', '1.1.0'),
(5, 2, 'appVersion', '1.1.0'),
(6, 2, 'isCurrentSkin', '0'),
(7, 3, 'skinVersion', '1.1.0'),
(8, 3, 'appVersion', '1.1.0'),
(9, 3, 'isCurrentSkin', '0'),
(10, 4, 'skinVersion', '1.1.0'),
(11, 4, 'appVersion', '1.1.0'),
(12, 4, 'isCurrentSkin', '1');

-- --------------------------------------------------------
--
-- Table structure for table `slider`
--

CREATE TABLE IF NOT EXISTS `slider` (
  `slideId` int(11) NOT NULL AUTO_INCREMENT,
  `order` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `content` longtext NOT NULL,
  PRIMARY KEY (`slideId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `slider`
--

INSERT INTO `slider` (`slideId`, `order`, `position`, `image`, `content`) VALUES
(1, 2, 0, 'image1.png', ''),
(2, 3, 0, 'image2.png', ''),
(3, 1, 0, 'Festival_Settings.png', '');

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

CREATE TABLE IF NOT EXISTS `testimonials` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guestName` varchar(255) NOT NULL,
  `content` longtext NOT NULL,
  `rating` int(1) DEFAULT NULL,
  `isApproved` tinyint(1) NOT NULL DEFAULT '0',
  `createdDate` int(11) NOT NULL,
  `updatedDate` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `userId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `userName` varchar(128) NOT NULL,
  `firstName` varchar(128) NOT NULL,
  `lastName` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `passWord` char(40) NOT NULL,
  `salt` char(32) NOT NULL,
  `role` varchar(100) NOT NULL DEFAULT 'user',
  `uStatus` varchar(8) NOT NULL DEFAULT 'disabled',
  `registeredDate` varchar(11) NOT NULL,
  `hash` int(10) NOT NULL,
  `companyName` varchar(255) NOT NULL,
  `companyUri` varchar(255) NOT NULL,
  PRIMARY KEY (`userId`),
  KEY `email_pass` (`email`,`passWord`),
  KEY `email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=39 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userId`, `title`, `userName`, `firstName`, `lastName`, `email`, `passWord`, `salt`, `role`, `uStatus`, `registeredDate`, `hash`, `companyName`, `companyUri`) VALUES
(0, '', 'dxadmin', '', '', '', 'e1da551374f0a6f136916647ab0f157cc192ea22', '', 'dxadmin', 'enabled', '', 0, 'Dirextion', ''),
(13, '', 'jreese', 'Jason', 'Reese', 'jreese2442@aol.com', '3e80a31c1a1fcd2cd8b3d05532618cd44c7a6631', '', 'admin', 'enabled', '1387579838', 1387579838, 'Find Your Perfect Getaway', ''),
(17, '', 'rossBridge', '', '', '', '', '', 'Platinum_Level', 'enabled', '', 0, 'Ross Bridge Golf Resort and Spa', ''),
(18, '', 'gmooncasino', 'Golden', 'Moon', 'testing@gmoon.com', '', '', 'Bronze_Level', 'disabled', '', 0, 'Golden Moon Casino', ''),
(32, '', 'test', 'test', 'test', 'test@gmail.com', '', '', 'Platinum_Level', 'disabled', '', 0, 'test', ''),
(33, '', 'newtest', 'newtest', 'test', 'test@gmail.com', '', '', 'Platinum_Level', 'disabled', '', 0, 'newtest', ''),
(35, '', 'jthai', 'test', 'test', 'test@gmail.com', '', '', 'Platinum_Level', 'disabled', '', 0, 'test test', 'test-test'),
(36, '', 'Birmingham', 'Birmingham', 'Alamama', 'info@cityofbirmingham.com', '', '', 'Platinum_Level', 'disabled', '', 0, 'Birmingham', 'Birmingham'),
(37, '', 'scott', 'Scott', 'Jaquith', 'scott@cityofscott.com', '', '', 'Platinum_Level', 'disabled', '', 0, 'City of Scott', 'City-of-Scott'),
(38, '', 'seaisland', 'Sea', 'Island', 'jthai@dirextion.com', '', '', 'Bronze_Level', 'disabled', '', 0, 'Sea Island', 'Sea-Island');

-- --------------------------------------------------------

--
-- Table structure for table `user_locations`
--

CREATE TABLE IF NOT EXISTS `user_locations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL COMMENT 'foreign key to user table primaryKey',
  `primary` tinyint(1) NOT NULL,
  `addrStreetOne` text NOT NULL,
  `addrStreetTwo` text NOT NULL,
  `addrCity` varchar(255) NOT NULL,
  `addrState` varchar(255) NOT NULL,
  `addrZip` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Holds secondary user info for profiles' AUTO_INCREMENT=42 ;

--
-- Dumping data for table `user_locations`
--

INSERT INTO `user_locations` (`id`, `userId`, `primary`, `addrStreetOne`, `addrStreetTwo`, `addrCity`, `addrState`, `addrZip`) VALUES
(0, 0, 0, '2025 Kentucky Ave', 'Suite A', 'Birmingham', 'AL', '35216'),
(1, 1, 0, '123 Test street', 'Apt. 115', 'Testville', 'AL', '90210'),
(2, 1, 0, '214 Another Test Street', '', 'SOme Test City', 'AnotherTestState', '90211'),
(3, 17, 0, '4000 Grand Ave', '', 'Birmingham', 'AL', '35226'),
(4, 18, 0, '123 Golden Street', '', 'Pearl', 'AL', '35242'),
(5, 19, 1, '123 Test St.', 'Apt. 113', 'OneVille', 'AL', '35216'),
(7, 9, 0, '123 Randall Road', 'Apt. 20', 'Randallville', 'AL', '35216'),
(9, 19, 0, '222 Test Two Ave', 'Apt. 222', 'Twoville', 'AL', '35216'),
(10, 19, 0, '333 Test Three St', '', 'ThreeVille', 'AL', '35226'),
(14, 19, 0, '222 Test Two Ave', 'Apt. 222', 'FourVille', 'AL', '35216'),
(15, 19, 0, '333 Test Three St', '', 'FiveVilleTesting', 'AL', '35226'),
(16, 22, 0, '1111 Jaquith Ave.', '', 'Scott', 'AL', '12345'),
(17, 19, 0, '100 NewStreet', '', 'NewvilleEdit', 'AL', '35555'),
(18, 22, 0, '1112', '', 'Scott', 'AL', '12345'),
(25, 15, 0, '1245 Test Street', '', 'TesterVille', 'AL', '55555'),
(26, 19, 0, '1222 new street', '', 'A new City', 'AL', '555'),
(27, 25, 0, '1234 test', '', 'birmingham', 'alabama', '35226'),
(29, 28, 0, '1234 test rd', '', 'Birmingham', '1', '35226'),
(34, 32, 0, '1234 test rd', '', 'Birmingham', '1', '35226'),
(35, 33, 0, '1234 test rd', '', 'Birmingham', '1', '35226'),
(37, 35, 0, '1234 test rd', '', 'Birmingham', 'AL', '35226'),
(38, 36, 0, '11 20th Street', '', 'Birmingham', 'Alabama', '35215'),
(39, 37, 0, '1234 test drive', '', 'Scott', '1', '35147'),
(40, 0, 0, '2025 Kentucky Ave ', 'Suite A', 'Birmingham', 'AL', '35126'),
(41, 38, 0, '100 Cloister Dr', '', 'Sea Island', 'GA', '31561');

-- --------------------------------------------------------

--
-- Table structure for table `user_profile`
--

CREATE TABLE IF NOT EXISTS `user_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL COMMENT 'foreign key to user table primaryKey',
  `group` varchar(20) NOT NULL,
  `company` varchar(255) NOT NULL,
  `companyUri` varchar(255) NOT NULL,
  `addrStreetOne` text NOT NULL,
  `addrStreetTwo` text NOT NULL,
  `addrCity` varchar(255) NOT NULL,
  `addrState` varchar(255) NOT NULL,
  `addrZip` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `company` (`company`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Holds secondary user info for profiles' AUTO_INCREMENT=4 ;

--
-- Dumping data for table `user_profile`
--

INSERT INTO `user_profile` (`id`, `userId`, `group`, `company`, `companyUri`, `addrStreetOne`, `addrStreetTwo`, `addrCity`, `addrState`, `addrZip`) VALUES
(1, 15, '', 'Dirextion', 'Dirextion', '123 Abc St.', 'Apt. 113', 'Hoover', '1', '35216'),
(3, 17, '', 'Ross Bridge Golf Resort and Spa', 'rossBridge', '4000 Grand Ave', '', 'Birmingham', '1', '35226');
