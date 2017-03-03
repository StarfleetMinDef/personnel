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
 
--
-- Dumping data for table `abilities`
--
 
LOCK TABLES `abilities` WRITE;
/*!40000 ALTER TABLE `abilities` DISABLE KEYS */;
INSERT INTO `abilities` VALUES (1,'Edit Profile','profile_edit','<p>Edit a member's profile</p>'),(2,'Promote','promotion_add','Add a promotion to a member's record and change the member's rank to it if applicable'),(3,'Award','award_add','Give a member an award'),(4,'View Any Profile','profile_view_any','View any member's profile'),(5,'Delete Promotion','promotion_delete','Delete a member's promotion and demote them if applicable'),(6,'Give Award','awarding_add','Give a member an award'),(7,'Delete Awarding','awarding_delete','Remove an award from a member's record'),(8,'Give Qualification','qualification_add','Give qualification to a member'),(9,'Delete Qualification','qualification_delete','Delete a qualification from a member's service record'),(10,'Promote Any Member','promotion_add_any',''),(11,'Delete Any Promotion','promotion_delete_any',''),(12,'Give Award to Any Member','awarding_add_any',''),(13,'Delete Any Awarding','awarding_delete_any',''),(14,'Give Qualification to Any Member','qualification_add_any',''),(15,'Delete Any Qualification','qualification_delete_any',''),(16,'Assign Member','assignment_add',''),(17,'Assign Any Member','assignment_add_any',''),(18,'Delete Assignment','assignment_delete',''),(19,'Delete Any Assignment','assignment_delete_any',''),(20,'Add Unit','unit_add',''),(21,'Discharge','discharge',''),(22,'Admin','admin','<p>Full access, including admin panel</p>'),(23,'Post Event AAR','event_aar',''),(24,'Process Any Enlistment','enlistment_process_any',''),(25,'Edit Any Profile','profile_edit_any','Edit any member's profile'),(26,'Modify Any Enlistment','enlistment_edit_any','Modify any member's enlistment'),(27,'View Any Event','event_view_any',''),(28,'Post Any Event AAR','event_aar_any',''),(29,'View Any Unit Statistics','unit_stats_any',''),(30,'Admin: Events','admin-events','');
/*!40000 ALTER TABLE `abilities` ENABLE KEYS */;
UNLOCK TABLES;
 
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
 
LOCK TABLES `assignments` WRITE;
/*!40000 ALTER TABLE `assignments` DISABLE KEYS */;
INSERT INTO `assignments` VALUES (16367,1,596,'',196,0,'2014-11-30',NULL);
/*!40000 ALTER TABLE `assignments` ENABLE KEYS */;
UNLOCK TABLES;
  
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
 
--
-- Dumping data for table `class_permissions`
--
 
LOCK TABLES `class_permissions` WRITE;
/*!40000 ALTER TABLE `class_permissions` DISABLE KEYS */;
INSERT INTO `class_permissions` VALUES (4,NULL,4);
/*!40000 ALTER TABLE `class_permissions` ENABLE KEYS */;
UNLOCK TABLES;
 
  
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
 
LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,'AD','Andorra'),(2,'AE','United Arab Emirates'),(3,'AF','Afghanistan'),(4,'AG','Antigua and Barbuda'),(5,'AI','Anguilla'),(6,'AL','Albania'),(7,'AM','Armenia'),(8,'AN','Netherlands Antilles'),(9,'AO','Angola'),(10,'AQ','Antarctica'),(11,'AR','Argentina'),(12,'AS','American Samoa'),(13,'AT','Austria'),(14,'AU','Australia'),(15,'AW','Aruba'),(16,'AZ','Azerbaijan'),(17,'BA','Bosnia and Herzegovina'),(18,'BB','Barbados'),(19,'BD','Bangladesh'),(20,'BE','Belgium'),(21,'BF','Burkina Faso'),(22,'BG','Bulgaria'),(23,'BH','Bahrain'),(24,'BI','Burundi'),(25,'BJ','Benin'),(26,'BM','Bermuda'),(27,'BN','Brunei Darussalam'),(28,'BO','Bolivia'),(29,'BR','Brazil'),(30,'BS','Bahamas'),(31,'BT','Bhutan'),(32,'BV','Bouvet Island'),(33,'BW','Botswana'),(34,'BY','Belarus'),(35,'BZ','Belize'),(36,'CA','Canada'),(37,'CC','Cocos (Keeling) Islands'),(38,'CD','Congo, The Democratic Republic of the'),(39,'CF','Central African Republic'),(40,'CG','Congo'),(41,'CH','Switzerland'),(42,'CI','Cote d'Ivoire'),(43,'CK','Cook Islands'),(44,'CL','Chile'),(45,'CM','Cameroon'),(46,'CN','China'),(47,'CO','Colombia'),(48,'CR','Costa Rica'),(49,'CS','Serbia and Montenegro'),(50,'CU','Cuba'),(51,'CV','Cape Verde'),(52,'CX','Christmas Island'),(53,'CY','Cyprus'),(54,'CZ','Czech Republic'),(55,'DE','Germany'),(56,'DJ','Djibouti'),(57,'DK','Denmark'),(58,'DM','Dominica'),(59,'DO','Dominican Republic'),(60,'DZ','Algeria'),(61,'EC','Ecuador'),(62,'EE','Estonia'),(63,'EG','Egypt'),(64,'EH','Western Sahara'),(65,'ER','Eritrea'),(66,'ES','Spain'),(67,'ET','Ethiopia'),(68,'FI','Finland'),(69,'FJ','Fiji'),(70,'FK','Falkland Islands (Malvinas)'),(71,'FM','Micronesia, Federated States of'),(72,'FO','Faroe Islands'),(73,'FR','France'),(74,'GA','Gabon'),(75,'GB','United Kingdom'),(76,'GD','Grenada'),(77,'GE','Georgia'),(78,'GF','French Guiana'),(79,'GH','Ghana'),(80,'GI','Gibraltar'),(81,'GL','Greenland'),(82,'GM','Gambia'),(83,'GN','Guinea'),(84,'GP','Guadeloupe'),(85,'GQ','Equatorial Guinea'),(86,'GR','Greece'),(87,'GS','South Georgia and the South Sandwich Islands'),(88,'GT','Guatemala'),(89,'GU','Guam'),(90,'GW','Guinea-bissau'),(91,'GY','Guyana'),(92,'HK','Hong Kong'),(93,'HM','Heard Island and McDonald Islands'),(94,'HN','Honduras'),(95,'HR','Croatia'),(96,'HT','Haiti'),(97,'HU','Hungary'),(98,'ID','Indonesia'),(99,'IE','Ireland'),(100,'IL','Israel'),(101,'IN','India'),(102,'IO','British Indian Ocean Territory'),(103,'IQ','Iraq'),(104,'IR','Iran, Islamic Republic of'),(105,'IS','Iceland'),(106,'IT','Italy'),(107,'JM','Jamaica'),(108,'JO','Jordan'),(109,'JP','Japan'),(110,'KE','Kenya'),(111,'KG','Kyrgyzstan'),(112,'KH','Cambodia'),(113,'KI','Kiribati'),(114,'KM','Comoros'),(115,'KN','Saint Kitts and Nevis'),(116,'KP','Korea, Democratic People's Republic of'),(117,'KR','Korea, Republic of'),(118,'KW','Kuwait'),(119,'KY','Cayman Islands'),(120,'KZ','Kazakhstan'),(121,'LA','Lao People's Democratic Republic'),(122,'LB','Lebanon'),(123,'LC','Saint Lucia'),(124,'LI','Liechtenstein'),(125,'LK','Sri Lanka'),(126,'LR','Liberia'),(127,'LS','Lesotho'),(128,'LT','Lithuania'),(129,'LU','Luxembourg'),(130,'LV','Latvia'),(131,'LY','Libyan Arab Jamahiriya'),(132,'MA','Morocco'),(133,'MC','Monaco'),(134,'MD','Moldova, Republic of'),(135,'MG','Madagascar'),(136,'MH','Marshall Islands'),(137,'MK','Macedonia, the Former Yugoslav Republic of'),(138,'ML','Mali'),(139,'MM','Myanmar'),(140,'MN','Mongolia'),(141,'MO','Macao'),(142,'MP','Northern Mariana Islands'),(143,'MQ','Martinique'),(144,'MR','Mauritania'),(145,'MS','Montserrat'),(146,'MT','Malta'),(147,'MU','Mauritius'),(148,'MV','Maldives'),(149,'MW','Malawi'),(150,'MX','Mexico'),(151,'MY','Malaysia'),(152,'MZ','Mozambique'),(153,'NA','Namibia'),(154,'NC','New Caledonia'),(155,'NE','Niger'),(156,'NF','Norfolk Island'),(157,'NG','Nigeria'),(158,'NI','Nicaragua'),(159,'NL','Netherlands'),(160,'NO','Norway'),(161,'NP','Nepal'),(162,'NR','Nauru'),(163,'NU','Niue'),(164,'NZ','New Zealand'),(165,'OM','Oman'),(166,'PA','Panama'),(167,'PE','Peru'),(168,'PF','French Polynesia'),(169,'PG','Papua New Guinea'),(170,'PH','Philippines'),(171,'PK','Pakistan'),(172,'PL','Poland'),(173,'PM','Saint Pierre and Miquelon'),(174,'PN','Pitcairn'),(175,'PR','Puerto Rico'),(176,'PS','Palestinian Territory, Occupied'),(177,'PT','Portugal'),(178,'PW','Palau'),(179,'PY','Paraguay'),(180,'QA','Qatar'),(181,'RE','Reunion'),(182,'RO','Romania'),(183,'RU','Russian Federation'),(184,'RW','Rwanda'),(185,'SA','Saudi Arabia'),(186,'SB','Solomon Islands'),(187,'SC','Seychelles'),(188,'SD','Sudan'),(189,'SE','Sweden'),(190,'SG','Singapore'),(191,'SH','Saint Helena'),(192,'SI','Slovenia'),(193,'SJ','Svalbard and Jan Mayen'),(194,'SK','Slovakia'),(195,'SL','Sierra Leone'),(196,'SM','San Marino'),(197,'SN','Senegal'),(198,'SO','Somalia'),(199,'SR','Suriname'),(200,'ST','Sao Tome and Principe'),(201,'SV','El Salvador'),(202,'SY','Syrian Arab Republic'),(203,'SZ','Swaziland'),(204,'TC','Turks and Caicos Islands'),(205,'TD','Chad'),(206,'TF','French Southern Territories'),(207,'TG','Togo'),(208,'TH','Thailand'),(209,'TJ','Tajikistan'),(210,'TK','Tokelau'),(211,'TL','Timor-leste'),(212,'TM','Turkmenistan'),(213,'TN','Tunisia'),(214,'TO','Tonga'),(215,'TR','Turkey'),(216,'TT','Trinidad and Tobago'),(217,'TV','Tuvalu'),(218,'TW','Taiwan'),(219,'TZ','Tanzania, United Republic of'),(220,'UA','Ukraine'),(221,'UG','Uganda'),(222,'UM','United States Minor Outlying Islands'),(223,'US','United States'),(224,'UY','Uruguay'),(225,'UZ','Uzbekistan'),(226,'VA','Vatican City State'),(227,'VC','Saint Vincent and the Grenadines'),(228,'VE','Venezuela'),(229,'VG','Virgin Islands, British'),(230,'VI','Virgin Islands, U.S.'),(231,'VN','Vietnam'),(232,'VU','Vanuatu'),(233,'WF','Wallis and Futuna'),(234,'WS','Samoa'),(235,'YE','Yemen'),(236,'YT','Mayotte'),(237,'ZA','South Africa'),(238,'ZM','Zambia'),(239,'ZW','Zimbabwe');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;
  
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
 
--
-- Dumping data for table `members`
--
 
LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES (1,'N/A','Tester','Test','E',NULL,223,NULL,2,NULL,'','',NULL,NULL,1);
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;
  
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
 
--
-- Dumping data for table `positions`
--
 
LOCK TABLES `positions` WRITE;
/*!40000 ALTER TABLE `positions` DISABLE KEYS */;
INSERT INTO `positions` VALUES (196,'Rifleman',1,0,'',0);
/*!40000 ALTER TABLE `positions` ENABLE KEYS */;
UNLOCK TABLES;
 
  
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
 
--
-- Dumping data for table `ranks`
--
 
LOCK TABLES `ranks` WRITE;
/*!40000 ALTER TABLE `ranks` DISABLE KEYS */;
INSERT INTO `ranks` VALUES (1,'Cadet','Rec.',NULL,'',1),(2,'Private','Pvt.','E-7','pvt',2),(3,'Private, First Class','PFC','E-6','pfc',3),(4,'Technician, 5th Grade','T/5','E-5','t5',4),(5,'Corporal','Cpl.','E-5','cpl',5),(6,'Technician, 4th Grade','T/4','E-4','t4',6),(7,'Sergeant','Sgt.','E-4','sgt',7),(8,'Technician, 3rd Grade','T/3','E-3','t3',8),(9,'Staff Sergeant','SSgt.','E-3','ssgt',9),(10,'Technical Sergeant','TSgt.','E-2','tsgt',10),(11,'First Sergeant','FSgt.','E-1','fsgt',11),(12,'Master Sergeant','MSgt.','E-1','msgt',12),(13,'Warrant Officer','W/O','W-1','wo',13),(14,'Chief Warrant Officer','CWO','W-2','cwo',14),(15,'Second Lieutenant','2Lt.','O-1','2lt',15),(16,'First Lieutenant','1Lt.','O-2','1lt',16),(17,'Captain','Cpt.','O-3','cpt',17),(18,'Major','Maj.','O-4','maj',18),(19,'Lieutenant Colonel','Lt. Col.','O-5','ltcol',19),(20,'Colonel','Col.','O-6','col',20);
/*!40000 ALTER TABLE `ranks` ENABLE KEYS */;
UNLOCK TABLES;
  
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
 
LOCK TABLES `units` WRITE;
/*!40000 ALTER TABLE `units` DISABLE KEYS */;
INSERT INTO `units` VALUES (596,'Battalion Headquarters','Bn HQ','','',1,NULL,'','Combat',1);
/*!40000 ALTER TABLE `units` ENABLE KEYS */;
UNLOCK TABLES;
  
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
 
--
-- Dumping data for table `unit_permissions`
--
 
LOCK TABLES `unit_permissions` WRITE;
/*!40000 ALTER TABLE `unit_permissions` DISABLE KEYS */;
INSERT INTO `unit_permissions` VALUES (30,596,0,22);
/*!40000 ALTER TABLE `unit_permissions` ENABLE KEYS */;
UNLOCK TABLES;
  
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
 
LOCK TABLES `usertracking` WRITE;
/*!40000 ALTER TABLE `usertracking` DISABLE KEYS */;
INSERT INTO `usertracking` VALUES (121,'1c3567237e08606330619d3c4d57f78e','1','/personnel-api/index.php/admin/units/insert','POST','2014-11-30 18:29:43','73.188.53.21','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36','http://dev.timwis.com/personnel-api/index.php/admin/units/add'),(122,'1c3567237e08606330619d3c4d57f78e','1','/personnel-api/index.php/admin/positions/insert','POST','2014-11-30 18:30:14','73.188.53.21','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36','http://dev.timwis.com/personnel-api/index.php/admin/positions/add'),(123,'1c3567237e08606330619d3c4d57f78e','1','/personnel-api/index.php/admin/unit_permissions/insert','POST','2014-11-30 18:30:46','73.188.53.21','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36','http://dev.timwis.com/personnel-api/index.php/admin/unit_permissions/add'),(124,'1c3567237e08606330619d3c4d57f78e','1','/personnel-api/index.php/admin/class_permissions/update/4','POST','2014-11-30 18:30:57','73.188.53.21','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36','http://dev.timwis.com/personnel-api/index.php/admin/class_permissions/edit/4');
/*!40000 ALTER TABLE `usertracking` ENABLE KEYS */;
UNLOCK TABLES;
  
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
