-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Czas wygenerowania: 03 Mar 2017, 07:37
-- Wersja serwera: 5.5.46-0ubuntu0.14.04.2
-- Wersja PHP: 5.5.9-1ubuntu4.14
 
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";
 
 
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
 
--
-- Baza danych: `personnel_v2`
--
 
-- --------------------------------------------------------
 
--
-- Struktura tabeli dla tabeli `abilities`
--
 
CREATE TABLE IF NOT EXISTS `abilities` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Ability''s ID',
  `name` varchar(40) NOT NULL COMMENT 'Ability''s Name',
  `abbr` varchar(24) NOT NULL COMMENT 'Ability''s Abbreviation',
  `description` text NOT NULL COMMENT 'Detailed description of Ability',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='List of abilities' AUTO_INCREMENT=64 ;
 
-- --------------------------------------------------------
 
--
-- Struktura tabeli dla tabeli `assignments`
--
 
CREATE TABLE IF NOT EXISTS `assignments` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` mediumint(8) unsigned NOT NULL COMMENT 'User ID',
  `unit_id` mediumint(8) unsigned NOT NULL,
  `position` varchar(64) NOT NULL,
  `position_id` mediumint(8) unsigned DEFAULT '35',
  `access_level` tinyint(1) NOT NULL DEFAULT '0',
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ttt` (`member_id`,`unit_id`,`position_id`,`start_date`),
  KEY `Unit ID` (`unit_id`),
  KEY `position_id` (`position_id`),
  KEY `Member ID` (`member_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16911 ;
 
-- --------------------------------------------------------
 
--
-- Struktura tabeli dla tabeli `attendance`
--
 
CREATE TABLE IF NOT EXISTS `attendance` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Attendance log ID',
  `event_id` mediumint(8) unsigned NOT NULL COMMENT 'Event ID',
  `member_id` mediumint(8) unsigned NOT NULL COMMENT 'Member ID',
  `attended` tinyint(1) DEFAULT NULL COMMENT 'Has member attended',
  `excused` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Has member posted absence',
  PRIMARY KEY (`id`),
  UNIQUE KEY `event and member` (`event_id`,`member_id`),
  KEY `Event ID` (`event_id`),
  KEY `User ID` (`member_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Log of attendance' AUTO_INCREMENT=462647 ;
 
-- --------------------------------------------------------
 
--
-- Struktura tabeli dla tabeli `awardings`
--
 
CREATE TABLE IF NOT EXISTS `awardings` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `member_id` mediumint(8) unsigned NOT NULL,
  `date` date NOT NULL,
  `award_id` mediumint(8) unsigned NOT NULL,
  `forum_id` enum('PHPBB','SMF','Vanilla') DEFAULT NULL COMMENT 'Which forums',
  `topic_id` mediumint(8) NOT NULL COMMENT 'Negative means old forums',
  PRIMARY KEY (`id`),
  KEY `User ID` (`member_id`),
  KEY `Award ID` (`award_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15797 ;
 
-- --------------------------------------------------------
 
--
-- Struktura tabeli dla tabeli `awards`
--
 
CREATE TABLE IF NOT EXISTS `awards` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(16) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `game` enum('N/A','DH','DOD','Arma 3','RS') NOT NULL,
  `image` varchar(255) NOT NULL DEFAULT '',
  `thumbnail` varchar(255) NOT NULL DEFAULT '',
  `bar` varchar(255) NOT NULL DEFAULT '',
  `active` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `order` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=134 ;
 
-- --------------------------------------------------------
 
--
-- Struktura tabeli dla tabeli `banlog`
--
 
CREATE TABLE IF NOT EXISTS `banlog` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `roid` varchar(24) NOT NULL,
  `uid` varchar(24) NOT NULL,
  `guid` varchar(40) NOT NULL COMMENT 'GUID',
  `handle` varchar(32) DEFAULT NULL,
  `ip` varchar(20) DEFAULT NULL,
  `date` date NOT NULL,
  `id_admin` mediumint(8) unsigned NOT NULL,
  `id_poster` mediumint(8) unsigned NOT NULL,
  `reason` text,
  `comments` text,
  `unbanned` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_admin` (`id_admin`),
  KEY `id_poster` (`id_poster`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2071 ;
 
-- --------------------------------------------------------
 
--
-- Struktura tabeli dla tabeli `class_permissions`
--
 
CREATE TABLE IF NOT EXISTS `class_permissions` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `class` enum('Combat','Staff','Training') DEFAULT NULL COMMENT 'Units table class',
  `ability_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ability_id` (`ability_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;
 
-- --------------------------------------------------------
 
--
-- Struktura tabeli dla tabeli `class_roles`
--
 
CREATE TABLE IF NOT EXISTS `class_roles` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `class` enum('Combat','Staff','Training') DEFAULT NULL,
  `role_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;
 
-- --------------------------------------------------------
 
--
-- Struktura tabeli dla tabeli `countries`
--
 
CREATE TABLE IF NOT EXISTS `countries` (
  `id` smallint(4) NOT NULL AUTO_INCREMENT COMMENT 'Country ID',
  `abbr` char(2) NOT NULL,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=241 ;
 
-- --------------------------------------------------------
 
--
-- Struktura tabeli dla tabeli `demerits`
--
 
CREATE TABLE IF NOT EXISTS `demerits` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` mediumint(8) unsigned NOT NULL,
  `author_member_id` mediumint(8) unsigned DEFAULT NULL,
  `forum_id` enum('PHPBB','SMF','Vanilla') DEFAULT NULL COMMENT 'Which forums',
  `topic_id` mediumint(8) NOT NULL,
  `date` date NOT NULL,
  `reason` text,
  PRIMARY KEY (`id`),
  KEY `User ID` (`member_id`),
  KEY `Author ID` (`author_member_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=293 ;
 
-- --------------------------------------------------------
 
--
-- Struktura tabeli dla tabeli `discharges`
--
 
CREATE TABLE IF NOT EXISTS `discharges` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Discharge''s ID',
  `member_id` mediumint(8) unsigned NOT NULL COMMENT 'ID of discharged member ',
  `date` date NOT NULL COMMENT 'Date of discharge',
  `type` enum('Honorable','General','Dishonorable') NOT NULL DEFAULT 'General' COMMENT 'Type of discharge',
  `reason` text NOT NULL COMMENT 'Description of discharging reason',
  `was_reversed` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Was the discharge reversed?',
  `forum_id` enum('PHPBB','SMF','Vanilla') DEFAULT NULL COMMENT 'Which forums',
  `topic_id` varchar(20) NOT NULL COMMENT 'ID of forum''s topic',
  PRIMARY KEY (`id`),
  KEY `Member ID` (`member_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='List of members'' discharges' AUTO_INCREMENT=2315 ;
 
-- --------------------------------------------------------
 
--
-- Struktura tabeli dla tabeli `eloas`
--
 
CREATE TABLE IF NOT EXISTS `eloas` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'LOA''s ID',
  `member_id` mediumint(8) unsigned NOT NULL COMMENT 'Member''s ID',
  `posting_date` datetime NOT NULL COMMENT 'Date of posting',
  `start_date` date NOT NULL COMMENT 'Planned start date',
  `end_date` date NOT NULL COMMENT 'Planned end date',
  `return_date` date DEFAULT NULL COMMENT 'Actual date of the return',
  `reason` text NOT NULL COMMENT 'Reason for LOA',
  `availability` text COMMENT 'Is member availaible during LOA',
  PRIMARY KEY (`id`),
  KEY `Member ID` (`member_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Extended Leaves of Absence' AUTO_INCREMENT=3293 ;
 
-- --------------------------------------------------------
 
--
-- Struktura tabeli dla tabeli `enlistments`
--
 
CREATE TABLE IF NOT EXISTS `enlistments` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Enlistment ID',
  `member_id` mediumint(8) unsigned NOT NULL COMMENT 'Enlistee''s ID',
  `date` date NOT NULL COMMENT 'Enlistment Date',
  `liaison_member_id` mediumint(8) unsigned DEFAULT NULL COMMENT 'Member ID of Enlistment Liaison',
  `forum_id` enum('PHPBB','SMF','Vanilla') DEFAULT NULL COMMENT 'Which forums',
  `topic_id` mediumint(8) NOT NULL COMMENT 'ID of forums topic ',
  `unit_id` mediumint(8) unsigned DEFAULT NULL COMMENT 'Unit ID of Training Platoon',
  `status` enum('Pending','Accepted','Denied','Withdrawn','AWOL') NOT NULL DEFAULT 'Pending' COMMENT 'Status of enlistment',
  `first_name` varchar(30) NOT NULL COMMENT 'Recruit''s First Name',
  `middle_name` varchar(1) NOT NULL COMMENT 'Recruit''s Middle Initial',
  `last_name` varchar(40) NOT NULL COMMENT 'Recruit''s Last Name',
  `age` varchar(8) NOT NULL COMMENT 'Recruit''s age',
  `country_id` smallint(4) DEFAULT NULL COMMENT 'Country ID',
  `timezone` enum('EST','GMT','Either','Neither') DEFAULT NULL COMMENT 'Prefered time zone',
  `game` enum('DH','RS','Arma 3') DEFAULT 'DH' COMMENT 'Chosen game',
  `ingame_name` varchar(60) NOT NULL COMMENT 'In-game Name',
  `steam_name` varchar(60) NOT NULL COMMENT 'Steamfriends Name',
  `steam_id` tinytext NOT NULL,
  `email` varchar(60) NOT NULL COMMENT 'Working e-mail',
  `experience` text NOT NULL,
  `recruiter` varchar(128) NOT NULL,
  `recruiter_member_id` mediumint(8) unsigned DEFAULT NULL COMMENT 'Recruiter''s MemberID',
  `comments` text NOT NULL COMMENT 'Comments from Recruit',
  `body` text NOT NULL COMMENT 'The enlistment papers',
  `units` text NOT NULL COMMENT 'List of previous units',
  PRIMARY KEY (`id`),
  KEY `Member ID` (`member_id`),
  KEY `Liaison ID` (`liaison_member_id`),
  KEY `Country` (`country_id`),
  KEY `Recruiter` (`recruiter_member_id`),
  KEY `Unit ID` (`unit_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Enlistments into 29th ID' AUTO_INCREMENT=8144 ;
 
-- --------------------------------------------------------
 
--
-- Struktura tabeli dla tabeli `events`
--
 
CREATE TABLE IF NOT EXISTS `events` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `datetime` datetime NOT NULL,
  `unit_id` mediumint(8) unsigned DEFAULT NULL,
  `title` varchar(64) NOT NULL,
  `type` varchar(32) NOT NULL,
  `mandatory` tinyint(1) NOT NULL DEFAULT '0',
  `server` varchar(32) NOT NULL,
  `server_id` mediumint(8) unsigned DEFAULT NULL,
  `report` text NOT NULL,
  `reporter_member_id` mediumint(8) unsigned DEFAULT NULL,
  `report_posting_date` datetime DEFAULT NULL COMMENT 'Date of AAR posting',
  `report_edit_date` datetime DEFAULT NULL COMMENT 'Date of last AAR editing',
  PRIMARY KEY (`id`),
  KEY `Unit ID` (`unit_id`),
  KEY `Reporter's ID` (`reporter_member_id`),
  KEY `Server ID` (`server_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21956 ;
 
-- --------------------------------------------------------
 
--
-- Struktura tabeli dla tabeli `finances`
--
 
CREATE TABLE IF NOT EXISTS `finances` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Finance ID',
  `date` date NOT NULL COMMENT 'Date of entry',
  `member_id` mediumint(8) unsigned DEFAULT NULL COMMENT 'Member ID',
  `vendor` enum('N/A','Game Servers','Branzone','Dreamhost','Nuclear Fallout','Other') NOT NULL COMMENT 'Vendor of services',
  `amount_received` float DEFAULT NULL COMMENT 'Amount received',
  `amount_paid` float DEFAULT NULL COMMENT 'Amount paid',
  `fee` float DEFAULT NULL COMMENT 'Fee',
  `forum_id` enum('PHPBB','SMF','Vanilla') DEFAULT NULL COMMENT 'Which forums',
  `topic_id` varchar(20) DEFAULT NULL COMMENT 'ID of forums'' topic',
  `notes` text NOT NULL COMMENT 'Additional notes',
  PRIMARY KEY (`id`),
  KEY `Member ID` (`member_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Finances Ledger' AUTO_INCREMENT=2864 ;
 
-- --------------------------------------------------------
 
--
-- Struktura tabeli dla tabeli `log`
--
 
CREATE TABLE IF NOT EXISTS `log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Log record ID',
  `table` varchar(20) NOT NULL COMMENT 'Name of table',
  `table_record_id` mediumint(8) unsigned NOT NULL COMMENT 'ID of table''s record',
  `action` enum('Add','Edit','Delete') NOT NULL DEFAULT 'Add' COMMENT 'Action taken',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time of action',
  `member_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Log of actions' AUTO_INCREMENT=1 ;
 
-- --------------------------------------------------------
 
--
-- Struktura tabeli dla tabeli `maps`
--
 
CREATE TABLE IF NOT EXISTS `maps` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `game` enum('Arma 3','DH','RS','') DEFAULT NULL,
  `descriptions` text NOT NULL,
  `type` enum('A/A','A/D') NOT NULL,
  `style` enum('Training','Infantry','Combined Arms','Tank') NOT NULL,
  `teams` enum('Germany/USSR','Germany/USA','Germany/Commonwealth','Japan/USA') NOT NULL,
  `size` enum('Small','Medium','Large') NOT NULL,
  `linearity` tinyint(1) NOT NULL DEFAULT '1',
  `notes` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;
 
-- --------------------------------------------------------
 
--
-- Struktura tabeli dla tabeli `members`
--
 
CREATE TABLE IF NOT EXISTS `members` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `status` enum('N/A','Cadet','Active Duty','Reservist','Retired','Discharged') NOT NULL,
  `last_name` varchar(32) NOT NULL DEFAULT '',
  `first_name` varchar(32) NOT NULL DEFAULT '',
  `middle_name` varchar(32) NOT NULL DEFAULT '',
  `name_prefix` varchar(8) DEFAULT NULL,
  `country_id` smallint(4) DEFAULT NULL COMMENT 'Country ID',
  `city` varchar(32) DEFAULT NULL,
  `rank_id` mediumint(8) unsigned NOT NULL DEFAULT '1',
  `primary_assignment_id` mediumint(8) unsigned DEFAULT NULL,
  `steam_id` tinytext NOT NULL,
  `email` varchar(255) NOT NULL DEFAULT '',
  `im_type` enum('AIM','''MSN','''ICQ','''YIM','''Skype') DEFAULT NULL COMMENT 'Instant Messenger Type',
  `im_handle` varchar(100) DEFAULT NULL COMMENT 'Instant Messenger Handle',
  `forum_member_id` mediumint(8) unsigned NOT NULL COMMENT 'Member ID on forums',
  PRIMARY KEY (`id`),
  KEY `Assignment` (`primary_assignment_id`),
  KEY `Rank` (`rank_id`),
  KEY `CountryID` (`country_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=87254 ;
 
-- --------------------------------------------------------
 
--
-- Struktura tabeli dla tabeli `notes`
--
 
CREATE TABLE IF NOT EXISTS `notes` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Note''s ID',
  `member_id` mediumint(8) unsigned NOT NULL COMMENT 'Member ID of note''s subject',
  `author_member_id` mediumint(8) unsigned NOT NULL COMMENT 'Member ID of note''s author',
  `date_add` datetime NOT NULL COMMENT 'Date & Time of adding',
  `date_mod` datetime DEFAULT NULL COMMENT 'Date & Time of last modification',
  `access` enum('Public','Members Only','Personal','Squad Level','Platoon Level','Company Level','Battalion HQ','Officers Only','Military Police','Lighthouse') NOT NULL COMMENT 'Access level',
  `subject` varchar(120) NOT NULL COMMENT 'Note''s subject',
  `content` text NOT NULL COMMENT 'Note''s text',
  PRIMARY KEY (`id`),
  KEY `Author ID` (`author_member_id`),
  KEY `Member ID` (`member_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Notes' AUTO_INCREMENT=2246 ;
 
-- --------------------------------------------------------
 
--
-- Struktura tabeli dla tabeli `passes`
--
 
CREATE TABLE IF NOT EXISTS `passes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Pass ID',
  `member_id` mediumint(8) unsigned NOT NULL COMMENT 'Receiver''s Member ID',
  `author_id` mediumint(8) unsigned NOT NULL COMMENT 'Author''s Member ID',
  `recruit_id` mediumint(8) unsigned DEFAULT NULL COMMENT 'Recruit''s Member ID (pass for recruiting)',
  `add_date` date DEFAULT NULL COMMENT 'Date of adding the WP record',
  `start_date` date NOT NULL COMMENT 'Data of start ',
  `end_date` date NOT NULL COMMENT 'Date of end',
  `type` enum('Recruitment','Recurring Donation','Award','Other') DEFAULT NULL COMMENT 'Type of Weapon Pass',
  `reason` text NOT NULL COMMENT 'Reason for pass',
  PRIMARY KEY (`id`),
  KEY `RecruitID` (`recruit_id`),
  KEY `MemberID` (`member_id`),
  KEY `AuthorID` (`author_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3253 ;
 
-- --------------------------------------------------------
 
--
-- Struktura tabeli dla tabeli `positions`
--
 
CREATE TABLE IF NOT EXISTS `positions` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(250) NOT NULL COMMENT 'Name of position',
  `active` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Is position active',
  `order` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `access_level` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'is access granted?',
  `AIT` enum('Leadership','Rifle','Submachine Gun','Automatic Rifle','Combat Engineer','Machine Gun','Armor','Mortar','Pilot','Sniper','N/A','Grenadier') NOT NULL DEFAULT 'N/A' COMMENT 'AIT associated with position',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=252 ;
 
-- --------------------------------------------------------
 
--
-- Struktura tabeli dla tabeli `promotions`
--
 
CREATE TABLE IF NOT EXISTS `promotions` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Promotion ID',
  `member_id` mediumint(8) unsigned NOT NULL COMMENT 'ID of promoted member',
  `date` date NOT NULL COMMENT 'Date of promotion',
  `old_rank_id` mediumint(8) unsigned DEFAULT NULL,
  `new_rank_id` mediumint(8) unsigned NOT NULL COMMENT 'Rank after promotion',
  `forum_id` enum('PHPBB','SMF','Vanilla') DEFAULT NULL COMMENT 'ID of forum where promotion was posted',
  `topic_id` mediumint(8) NOT NULL COMMENT 'ID of forums topic ',
  PRIMARY KEY (`id`),
  KEY `User ID` (`member_id`),
  KEY `New Rank` (`new_rank_id`),
  KEY `Old Rank` (`old_rank_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='V: Users <-> Rank' AUTO_INCREMENT=4191 ;
 
-- --------------------------------------------------------
 
--
-- Struktura tabeli dla tabeli `qualifications`
--
 
CREATE TABLE IF NOT EXISTS `qualifications` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `member_id` mediumint(8) unsigned NOT NULL,
  `standard_id` mediumint(8) unsigned NOT NULL,
  `date` date DEFAULT NULL,
  `author_member_id` mediumint(8) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `MemberStandard` (`member_id`,`standard_id`),
  KEY `User ID` (`member_id`),
  KEY `AIT Standard ID` (`standard_id`),
  KEY `Author` (`author_member_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='V: Users <-> Standards' AUTO_INCREMENT=300056 ;
 
-- --------------------------------------------------------
 
--
-- Struktura tabeli dla tabeli `ranks`
--
 
CREATE TABLE IF NOT EXISTS `ranks` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '',
  `abbr` varchar(8) NOT NULL DEFAULT '',
  `grade` varchar(4) DEFAULT NULL,
  `filename` varchar(32) NOT NULL DEFAULT '',
  `order` smallint(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=24 ;
 
-- --------------------------------------------------------
 
--
-- Struktura tabeli dla tabeli `schedules`
--
 
CREATE TABLE IF NOT EXISTS `schedules` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Schedule ID',
  `unit_id` mediumint(8) unsigned NOT NULL COMMENT 'Unit ID',
  `type` varchar(40) NOT NULL COMMENT 'Type of event',
  `server_id` mediumint(8) unsigned NOT NULL COMMENT 'Server ID',
  `mandatory` tinyint(1) NOT NULL COMMENT 'Is mandatory?',
  `day_of_week` enum('0','1','2','3','4','5','6') NOT NULL COMMENT 'Day of week',
  `hour_of_day` time NOT NULL COMMENT 'Time of drill (UTC)',
  PRIMARY KEY (`id`),
  KEY `Unit ID` (`unit_id`),
  KEY `Server ID` (`server_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Schedule of regular events' AUTO_INCREMENT=33 ;
 
-- --------------------------------------------------------
 
--
-- Struktura tabeli dla tabeli `servers`
--
 
CREATE TABLE IF NOT EXISTS `servers` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Server ID',
  `name` varchar(40) NOT NULL COMMENT 'Server Name',
  `abbr` varchar(4) NOT NULL COMMENT 'Abbreviation of Server Name',
  `address` varchar(15) NOT NULL COMMENT 'IP address of server',
  `port` mediumint(6) NOT NULL COMMENT 'Port of Server',
  `game` enum('DH','Arma 3','RS') NOT NULL DEFAULT 'DH' COMMENT 'Type of game ',
  `active` tinyint(1) NOT NULL COMMENT 'Is server active',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='List of 29th servers' AUTO_INCREMENT=15 ;
 
-- --------------------------------------------------------
 
--
-- Struktura tabeli dla tabeli `standards`
--
 
CREATE TABLE IF NOT EXISTS `standards` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `weapon` enum('EIB','Rifle','Automatic Rifle','Machine Gun','Armor','Sniper','Mortar','SLT','Combat Engineer','Submachine Gun','Pilot','Grenadier') NOT NULL DEFAULT 'Rifle',
  `game` enum('DH','RS','Arma 3','') NOT NULL DEFAULT 'DH',
  `badge` enum('N/A','Marksman','Sharpshooter','Expert') NOT NULL DEFAULT 'Sharpshooter',
  `description` text NOT NULL,
  `details` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Standards required to achieve a badge for AIT' AUTO_INCREMENT=622 ;
 
-- --------------------------------------------------------
 
--
-- Struktura tabeli dla tabeli `units`
--
 
CREATE TABLE IF NOT EXISTS `units` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `abbr` varchar(32) NOT NULL,
  `old_path` varchar(32) NOT NULL,
  `path` varchar(32) NOT NULL,
  `order` tinyint(4) NOT NULL DEFAULT '0',
  `game` enum('DH','RS','Arma 3') DEFAULT NULL COMMENT 'Game ',
  `timezone` varchar(3) NOT NULL,
  `class` enum('Combat','Staff','Training') NOT NULL DEFAULT 'Training' COMMENT 'Type of unit',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `steam_group_abbr` varchar(30) NOT NULL COMMENT 'Abbreviation of Unit''s Steam Group',
  `slogan` varchar(200) NOT NULL COMMENT 'Unit''s Slogan',
  `logo` varchar(40) NOT NULL COMMENT 'Filename of a unit''s logo',
  `nickname` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=876 ;
 
-- --------------------------------------------------------
 
--
-- Struktura tabeli dla tabeli `unit_permissions`
--
 
CREATE TABLE IF NOT EXISTS `unit_permissions` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `unit_id` mediumint(8) unsigned NOT NULL,
  `access_level` tinyint(1) NOT NULL DEFAULT '1',
  `ability_id` mediumint(9) unsigned NOT NULL COMMENT 'ID of ability',
  PRIMARY KEY (`id`),
  UNIQUE KEY `combo` (`unit_id`,`access_level`,`ability_id`),
  KEY `Unit ID` (`unit_id`),
  KEY `Ability ID` (`ability_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=581 ;
 
-- --------------------------------------------------------
 
--
-- Struktura tabeli dla tabeli `unit_roles`
--
 
CREATE TABLE IF NOT EXISTS `unit_roles` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `unit_id` mediumint(8) unsigned DEFAULT NULL,
  `access_level` tinyint(1) NOT NULL DEFAULT '0',
  `role_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unit_id` (`unit_id`,`role_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=209 ;
 
-- --------------------------------------------------------
 
--
-- Struktura tabeli dla tabeli `usertracking`
--
 
CREATE TABLE IF NOT EXISTS `usertracking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` varchar(100) NOT NULL,
  `user_identifier` varchar(255) NOT NULL,
  `request_uri` text NOT NULL,
  `request_method` varchar(16) NOT NULL,
  `datetime` datetime NOT NULL,
  `client_ip` varchar(50) NOT NULL,
  `client_user_agent` text NOT NULL,
  `referer_page` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=77366 ;
 
--
-- Ograniczenia dla zrzutów tabel
--
 
--
-- Ograniczenia dla tabeli `assignments`
--
ALTER TABLE `assignments`
  ADD CONSTRAINT `assignments_ibfk_2` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `assignments_ibfk_4` FOREIGN KEY (`position_id`) REFERENCES `positions` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `assignments_ibfk_5` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`) ON UPDATE CASCADE;
 
--
-- Ograniczenia dla tabeli `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `attendance_ibfk_2` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`) ON UPDATE CASCADE;
 
--
-- Ograniczenia dla tabeli `awardings`
--
ALTER TABLE `awardings`
  ADD CONSTRAINT `awardings_ibfk_2` FOREIGN KEY (`award_id`) REFERENCES `awards` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `awardings_ibfk_3` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`) ON UPDATE CASCADE;
 
--
-- Ograniczenia dla tabeli `class_permissions`
--
ALTER TABLE `class_permissions`
  ADD CONSTRAINT `class_permissions_ibfk_1` FOREIGN KEY (`ability_id`) REFERENCES `abilities` (`id`) ON UPDATE CASCADE;
 
--
-- Ograniczenia dla tabeli `demerits`
--
ALTER TABLE `demerits`
  ADD CONSTRAINT `demerits_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `demerits_ibfk_2` FOREIGN KEY (`author_member_id`) REFERENCES `members` (`id`) ON UPDATE CASCADE;
 
--
-- Ograniczenia dla tabeli `discharges`
--
ALTER TABLE `discharges`
  ADD CONSTRAINT `discharges_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`) ON UPDATE CASCADE;
 
--
-- Ograniczenia dla tabeli `eloas`
--
ALTER TABLE `eloas`
  ADD CONSTRAINT `eloas_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`) ON UPDATE CASCADE;
 
--
-- Ograniczenia dla tabeli `enlistments`
--
ALTER TABLE `enlistments`
  ADD CONSTRAINT `enlistments_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `enlistments_ibfk_2` FOREIGN KEY (`liaison_member_id`) REFERENCES `members` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `enlistments_ibfk_5` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `enlistments_ibfk_6` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `enlistments_ibfk_7` FOREIGN KEY (`recruiter_member_id`) REFERENCES `members` (`id`) ON UPDATE CASCADE;
 
--
-- Ograniczenia dla tabeli `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `events_ibfk_3` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `events_ibfk_4` FOREIGN KEY (`server_id`) REFERENCES `servers` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `events_ibfk_5` FOREIGN KEY (`reporter_member_id`) REFERENCES `members` (`id`) ON UPDATE CASCADE;
 
--
-- Ograniczenia dla tabeli `finances`
--
ALTER TABLE `finances`
  ADD CONSTRAINT `finances_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`) ON UPDATE CASCADE;
 
--
-- Ograniczenia dla tabeli `members`
--
ALTER TABLE `members`
  ADD CONSTRAINT `members_ibfk_2` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `members_ibfk_3` FOREIGN KEY (`rank_id`) REFERENCES `ranks` (`id`) ON UPDATE CASCADE;
 
--
-- Ograniczenia dla tabeli `notes`
--
ALTER TABLE `notes`
  ADD CONSTRAINT `notes_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `notes_ibfk_2` FOREIGN KEY (`author_member_id`) REFERENCES `members` (`id`) ON UPDATE CASCADE;
 
--
-- Ograniczenia dla tabeli `passes`
--
ALTER TABLE `passes`
  ADD CONSTRAINT `passes_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `passes_ibfk_2` FOREIGN KEY (`author_id`) REFERENCES `members` (`id`) ON UPDATE CASCADE;
 
--
-- Ograniczenia dla tabeli `promotions`
--
ALTER TABLE `promotions`
  ADD CONSTRAINT `promotions_ibfk_5` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `promotions_ibfk_6` FOREIGN KEY (`old_rank_id`) REFERENCES `ranks` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `promotions_ibfk_7` FOREIGN KEY (`new_rank_id`) REFERENCES `ranks` (`id`) ON UPDATE CASCADE;
 
--
-- Ograniczenia dla tabeli `qualifications`
--
ALTER TABLE `qualifications`
  ADD CONSTRAINT `qualifications_ibfk_4` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `qualifications_ibfk_5` FOREIGN KEY (`standard_id`) REFERENCES `standards` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `qualifications_ibfk_6` FOREIGN KEY (`author_member_id`) REFERENCES `members` (`id`) ON UPDATE CASCADE;
 
--
-- Ograniczenia dla tabeli `schedules`
--
ALTER TABLE `schedules`
  ADD CONSTRAINT `schedules_ibfk_1` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `schedules_ibfk_2` FOREIGN KEY (`server_id`) REFERENCES `servers` (`id`) ON UPDATE CASCADE;
 
--
-- Ograniczenia dla tabeli `unit_roles`
--
ALTER TABLE `unit_roles`
  ADD CONSTRAINT `unit_roles_ibfk_1` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`) ON UPDATE CASCADE;
 
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
