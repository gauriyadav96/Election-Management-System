CREATE DATABASE  IF NOT EXISTS `electionsystem` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `electionsystem`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: electionsystem
-- ------------------------------------------------------
-- Server version	5.7.20-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `campaign`
--

DROP TABLE IF EXISTS `campaign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `campaign` (
  `CampaignID` varchar(60) NOT NULL,
  `CampaignName` varchar(60) NOT NULL,
  `FundSpent` varchar(45) NOT NULL,
  `ReceivedDonations` varchar(45) NOT NULL,
  `Managerid` varchar(45) NOT NULL,
  `NoOfVolunteers` int(11) NOT NULL,
  `CandidateID` int(11) NOT NULL,
  `PartyID` varchar(60) NOT NULL,
  PRIMARY KEY (`CampaignID`),
  KEY `CandidateID` (`CandidateID`),
  KEY `PartyID` (`PartyID`),
  CONSTRAINT `campaign_ibfk_1` FOREIGN KEY (`CandidateID`) REFERENCES `candidates` (`CandidateID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `campaign_ibfk_2` FOREIGN KEY (`PartyID`) REFERENCES `candidates` (`PartyID`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaign`
--

LOCK TABLES `campaign` WRITE;
/*!40000 ALTER TABLE `campaign` DISABLE KEYS */;
INSERT INTO `campaign` VALUES ('a','Telling It Like It Is !','0.50','0.34','m3',620,2005,'p2'),('b','Your Future To Believe In','1.45','1.75','m2',3400,1002,'p1'),('c','From Hope to Higher Ground','0.95','0.92','m5',300,2003,'p2'),('d','Forward Together','3.30','3.50','m1',6000,1001,'p1'),('e','People Fighting Back','1.64','1.62','m1',850,3005,'p3'),('f','Stronger Together','1.95','2.10','m4',1100,1005,'p1'),('g','Reform, Prosperity,Peace','1.72','1.74','m5',565,3003,'p3'),('h','Heal.Inspire.Revive','1.25','1.4','m3',874,2002,'p2'),('i','Hillary For America','3.23','3.32','m5',1320,1001,'p1'),('j','Fighting For Us','1.25','0.96','m5',770,1003,'p1'),('k','A Time For Truth','1.85','1.98','m4',1250,2004,'p2'),('l','Live Free','1.45','1.30','m2',600,1004,'p1'),('m','Right To Rise','1.32','1.39','m4',780,3004,'p3'),('n','It\'s never too late to do the right thing','1.72','1.81','m2',680,3002,'p3'),('o','What Do We Have To Lose','3.17','3.15','m3',1280,2001,'p2'),('p','Citizenship Matters','2.27','2.35','m3',1280,3001,'p3'),('q','Ready For Change, Ready To Lead','2.84','2.83','m2',1200,1001,'p1'),('r','Make America Great again','3.25','3.33','m4',5600,2001,'p2');
/*!40000 ALTER TABLE `campaign` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campaignmanager`
--

DROP TABLE IF EXISTS `campaignmanager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `campaignmanager` (
  `ManagerID` varchar(45) NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Gender` varchar(45) NOT NULL,
  `Experience` varchar(60) NOT NULL,
  `Rating` int(11) DEFAULT NULL,
  PRIMARY KEY (`ManagerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaignmanager`
--

LOCK TABLES `campaignmanager` WRITE;
/*!40000 ALTER TABLE `campaignmanager` DISABLE KEYS */;
INSERT INTO `campaignmanager` VALUES ('m1','Dow Constantine','M','4',9),('m2','Kim Ferguson','F','4',8),('m3','Max Pollard','M','3.5',8),('m4','Richard Miller','M','5',9),('m5','Kate Peterson','F','2.5',7);
/*!40000 ALTER TABLE `campaignmanager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `candidates`
--

DROP TABLE IF EXISTS `candidates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `candidates` (
  `CandidateID` int(11) NOT NULL,
  `CandidateName` varchar(45) NOT NULL,
  `PartyID` varchar(60) NOT NULL,
  `Categoryid` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`CandidateID`),
  KEY `PartyID` (`PartyID`),
  KEY `Categoryid` (`Categoryid`),
  CONSTRAINT `candidates_ibfk_1` FOREIGN KEY (`PartyID`) REFERENCES `party` (`PartyID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `candidates_ibfk_2` FOREIGN KEY (`Categoryid`) REFERENCES `category` (`CategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidates`
--

LOCK TABLES `candidates` WRITE;
/*!40000 ALTER TABLE `candidates` DISABLE KEYS */;
INSERT INTO `candidates` VALUES (1001,'Hillary Clinton','p1','c1'),(1002,'Brooks Salazar','p1','c2'),(1003,'Ryan Calkins','p1','c3'),(1004,'John Creighton','p1','c4'),(1005,'Lisa Espinosa','p1','c6'),(2001,'Donald J.Trump','p2','c1'),(2002,'Mike Pence','p2','c2'),(2003,'Rex Tillerson','p2','c3'),(2004,'Steve Mnuchin','p2','c4'),(2005,'Wilbur Ross','p2','c5'),(3001,'Ahmed Abdi','p3','c1'),(3002,'Stephine Bowwman','p3','c2'),(3003,'Preeti Shridhra','p3','c3'),(3004,'Sonny Perdue','p3','c5'),(3005,'Ben Carson','p3','c6');
/*!40000 ALTER TABLE `candidates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `candidates_uses_media`
--

DROP TABLE IF EXISTS `candidates_uses_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `candidates_uses_media` (
  `CandidateID` int(11) NOT NULL,
  `MediaID` varchar(45) NOT NULL,
  KEY `CandidateID` (`CandidateID`),
  KEY `MediaID` (`MediaID`),
  CONSTRAINT `candidates_uses_media_ibfk_1` FOREIGN KEY (`CandidateID`) REFERENCES `candidates` (`CandidateID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `candidates_uses_media_ibfk_2` FOREIGN KEY (`MediaID`) REFERENCES `media` (`MediaID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidates_uses_media`
--

LOCK TABLES `candidates_uses_media` WRITE;
/*!40000 ALTER TABLE `candidates_uses_media` DISABLE KEYS */;
INSERT INTO `candidates_uses_media` VALUES (1005,'media4'),(1001,'media2'),(1005,'media7'),(2003,'media1'),(2003,'media2'),(2003,'media6'),(1001,'media5'),(1001,'media7'),(1003,'media5'),(1001,'media3'),(1001,'media4'),(1002,'media1'),(1002,'media8'),(1002,'media6'),(1003,'media2'),(1005,'media3'),(1003,'media5'),(2002,'media5'),(1004,'media1'),(1004,'media8'),(2001,'media2'),(2001,'media7'),(2001,'media5'),(2001,'media6'),(2001,'media8'),(2005,'media1'),(2003,'media2'),(2005,'media7'),(2005,'media3'),(2002,'media3'),(2003,'media5'),(2003,'media6'),(2004,'media7'),(3005,'media6'),(3005,'media7'),(2004,'media4'),(3005,'media2'),(3005,'media4'),(3001,'media2'),(3001,'media5'),(3001,'media6'),(3002,'media4'),(3002,'media2'),(3004,'media8'),(3004,'media5'),(3004,'media2'),(3003,'media2'),(3003,'media5'),(3003,'media8');
/*!40000 ALTER TABLE `candidates_uses_media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `CategoryID` varchar(60) NOT NULL,
  `CategoryName` varchar(45) NOT NULL,
  PRIMARY KEY (`CategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES ('c1','Presidential'),('c2','US Senator'),('c3','Judge'),('c4','State Senator'),('c5','County Executive'),('c6','City Council');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `city` (
  `CityID` int(11) NOT NULL,
  `CityName` varchar(45) NOT NULL,
  `StateID` int(11) NOT NULL,
  PRIMARY KEY (`CityID`),
  KEY `StateID` (`StateID`),
  CONSTRAINT `city_ibfk_1` FOREIGN KEY (`StateID`) REFERENCES `state` (`StateID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (21,'NewYork City',2),(22,'Buffalo',2),(23,'Rochester',2),(31,'Newark',3),(32,'Trenton',3),(33,'Jersey City',3),(41,'Los Angeles',4),(42,'King County',4),(43,'Orange County',4);
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `completeelectionsummary`
--

DROP TABLE IF EXISTS `completeelectionsummary`;
/*!50001 DROP VIEW IF EXISTS `completeelectionsummary`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `completeelectionsummary` AS SELECT 
 1 AS `electionid`,
 1 AS `electionname`,
 1 AS `total_voters`,
 1 AS `winner_total`,
 1 AS `candidatename`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `election`
--

DROP TABLE IF EXISTS `election`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `election` (
  `ElectionID` varchar(45) NOT NULL,
  `ElectionName` varchar(45) NOT NULL,
  `ElectionDate` varchar(45) NOT NULL,
  `CategoryID` varchar(60) NOT NULL,
  PRIMARY KEY (`ElectionID`),
  KEY `CategoryID` (`CategoryID`),
  CONSTRAINT `election_ibfk_1` FOREIGN KEY (`CategoryID`) REFERENCES `category` (`CategoryID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `election`
--

LOCK TABLES `election` WRITE;
/*!40000 ALTER TABLE `election` DISABLE KEYS */;
INSERT INTO `election` VALUES ('e01','General Presidential 2012','2012-01-12','c1'),('e02','General US Senator 2012','2012-04-27','c2'),('e03','General Judge 2012','2012-09-06','c3'),('e04','Primary State Senator 2013','2013-01-04','c4'),('e05','Primary County Executive 2013','2013-07-04','c5'),('e06','Primary City Council 2013','2013-09-25','c6'),('e07','General US Senator 2014','2014-03-26','c2'),('e08','General Judge 2014','2014-09-11','c3'),('e09','Primary State Senator 2015','2015-02-23','c4'),('e10','Primary County Executive 2015','2015-07-09','c5'),('e11','Primary City Council 2015','2015-09-23','c6'),('e12','General Presidential 2016','2016-01-26','c1'),('e13','General US Senator 2016','2016-04-30','c2'),('e14','General Judge 2016','2016-10-01','c3'),('e15','Primary State Senator 2017','2017-01-13','c4'),('e16','Primary County Executive 2017','2017-07-04','c5'),('e17','Primary City Council 2017','2017-10-24','c6'),('e18','General US Senator 2018','2018-03-31','c2'),('e19','General Judge 2018','2018-09-02','c3'),('e20','Primary State Senator 2019','2019-01-31','c4'),('e21','Primary County Executive 2019','2019-07-06','c5'),('e22','Primary City Council 2019','2019-09-13','c6'),('e23','General Presidential 2020','2020-01-12','c1'),('e24','General US Senator 2020','2020-04-19','c2'),('e25','General Judge 2020','2020-09-11','c3');
/*!40000 ALTER TABLE `election` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `election_has_candidates`
--

DROP TABLE IF EXISTS `election_has_candidates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `election_has_candidates` (
  `ElectionID` varchar(45) NOT NULL,
  `CandidateID` int(11) NOT NULL,
  KEY `ElectionID` (`ElectionID`),
  KEY `CandidateID` (`CandidateID`),
  CONSTRAINT `election_has_candidates_ibfk_1` FOREIGN KEY (`ElectionID`) REFERENCES `election` (`ElectionID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `election_has_candidates_ibfk_2` FOREIGN KEY (`CandidateID`) REFERENCES `candidates` (`CandidateID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `election_has_candidates`
--

LOCK TABLES `election_has_candidates` WRITE;
/*!40000 ALTER TABLE `election_has_candidates` DISABLE KEYS */;
INSERT INTO `election_has_candidates` VALUES ('e01',1001),('e01',2001),('e01',3001),('e02',1002),('e02',2002),('e02',3002),('e03',1003),('e03',2003),('e03',3003),('e04',1004),('e04',2004),('e05',2005),('e05',3004),('e06',1005),('e06',3005),('e07',1002),('e07',2002),('e07',3002),('e08',1003),('e08',2003),('e08',3003),('e09',1004),('e09',2004),('e10',2005),('e10',3004),('e11',1005),('e11',3005),('e12',1001),('e12',2001),('e12',3001),('e13',1002),('e13',2002),('e13',3002),('e14',1003),('e14',2003),('e14',3003),('e15',1004),('e15',2004),('e16',2005),('e16',3004),('e17',1005),('e17',3005),('e18',1002),('e18',2002),('e18',3002),('e19',1003),('e19',2003),('e19',3003),('e20',1004),('e20',2004),('e21',2005),('e21',3004),('e22',1005),('e22',3005),('e23',1001),('e23',2001),('e23',3001),('e24',1002),('e24',2002),('e24',3002),('e25',1003),('e25',2003),('e25',3003);
/*!40000 ALTER TABLE `election_has_candidates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media` (
  `MediaID` varchar(45) NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Type` varchar(45) NOT NULL,
  `Popularity` varchar(45) NOT NULL,
  PRIMARY KEY (`MediaID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES ('media1','BBC','TV','39.21%'),('media2','The New York Times','Newspaper','52.65%'),('media3','WABC','Radio','31%'),('media4','CNN','TV','46%'),('media5','FOX25','TV','56.2%'),('media6','WBZ','Radio','29.3%'),('media7','USA Today','Newspaper','56%'),('media8','The WallStreet Journal','Newspaper','44.86%');
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `party`
--

DROP TABLE IF EXISTS `party`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `party` (
  `PartyID` varchar(60) NOT NULL,
  `PartyName` varchar(45) NOT NULL,
  `Symbol` varchar(45) NOT NULL,
  PRIMARY KEY (`PartyID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `party`
--

LOCK TABLES `party` WRITE;
/*!40000 ALTER TABLE `party` DISABLE KEYS */;
INSERT INTO `party` VALUES ('p1','Democrats','Deer'),('p2','Republican','Elephant'),('p3','Independents','Horse');
/*!40000 ALTER TABLE `party` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `precient`
--

DROP TABLE IF EXISTS `precient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `precient` (
  `PrecientID` int(11) NOT NULL,
  `PrecientName` varchar(45) NOT NULL,
  `CityID` int(11) NOT NULL,
  `StateID` int(11) NOT NULL,
  PRIMARY KEY (`PrecientID`),
  KEY `CityID` (`CityID`),
  KEY `StateID` (`StateID`),
  CONSTRAINT `precient_ibfk_1` FOREIGN KEY (`CityID`) REFERENCES `city` (`CityID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `precient_ibfk_2` FOREIGN KEY (`StateID`) REFERENCES `state` (`StateID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `precient`
--

LOCK TABLES `precient` WRITE;
/*!40000 ALTER TABLE `precient` DISABLE KEYS */;
INSERT INTO `precient` VALUES (211,'Bronx',21,2),(212,'Brooklyn',21,2),(213,'Manhattan',21,2),(221,'Alden',22,2),(222,'Buffalo',22,2),(223,'Williamsville',22,2),(231,'Brighton',23,2),(232,'Gates',23,2),(233,'Hamlin',23,2),(311,'Bloomfield',31,3),(312,'Caldwell',31,3),(313,'Irvington',31,3),(321,'Hamilton',32,3),(322,'Lawrence',32,3),(323,'Pennington',32,3),(331,'Atlantic',33,3),(332,'Burlington',33,3),(333,'Cumberland',33,3),(411,'Arcadia',41,4),(412,'Long Beach',41,4),(413,'Los Angeles',41,4),(421,'Avenal',42,4),(422,'Hanford',42,4),(423,'Lemoore',42,4),(431,'Tustin',43,4),(432,'Stanton',43,4),(433,'Irvine',43,4);
/*!40000 ALTER TABLE `precient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `roleid` varchar(70) NOT NULL,
  `rolename` varchar(70) DEFAULT NULL,
  `privileges` varchar(70) DEFAULT NULL,
  PRIMARY KEY (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES ('r1','Poll Worker','SELECT_EXECUTE'),('r2','Election Admin','ALL');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles123`
--

DROP TABLE IF EXISTS `roles123`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles123` (
  `roleid` varchar(70) NOT NULL,
  `rolename` varchar(70) DEFAULT NULL,
  `privileges` varchar(70) DEFAULT NULL,
  PRIMARY KEY (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles123`
--

LOCK TABLES `roles123` WRITE;
/*!40000 ALTER TABLE `roles123` DISABLE KEYS */;
INSERT INTO `roles123` VALUES ('r1','Poll Worker','SELECT_EXECUTE'),('r2','Election Admin','ALL');
/*!40000 ALTER TABLE `roles123` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `session`
--

DROP TABLE IF EXISTS `session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `session` (
  `Username` varchar(70) DEFAULT NULL,
  `Creation_Date` varchar(70) DEFAULT NULL,
  `Creation_Time` varchar(70) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `session`
--

LOCK TABLES `session` WRITE;
/*!40000 ALTER TABLE `session` DISABLE KEYS */;
INSERT INTO `session` VALUES ('John','2017-12-13','20:53:39'),('Jack','2017-12-13','20:58:19'),('Gauri','2017-12-13','21:02:25');
/*!40000 ALTER TABLE `session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `state`
--

DROP TABLE IF EXISTS `state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `state` (
  `StateID` int(11) NOT NULL,
  `StateName` varchar(45) NOT NULL,
  PRIMARY KEY (`StateID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `state`
--

LOCK TABLES `state` WRITE;
/*!40000 ALTER TABLE `state` DISABLE KEYS */;
INSERT INTO `state` VALUES (2,'New York'),(3,'New Jersey'),(4,'California');
/*!40000 ALTER TABLE `state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `totalvoters`
--

DROP TABLE IF EXISTS `totalvoters`;
/*!50001 DROP VIEW IF EXISTS `totalvoters`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `totalvoters` AS SELECT 
 1 AS `electionid`,
 1 AS `electionname`,
 1 AS `Total_voters`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `useraccount123`
--

DROP TABLE IF EXISTS `useraccount123`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `useraccount123` (
  `username` varchar(70) NOT NULL,
  `pwd` varchar(70) DEFAULT NULL,
  `hostname` varchar(70) DEFAULT NULL,
  `roleid` varchar(70) DEFAULT NULL,
  PRIMARY KEY (`username`),
  KEY `roleid` (`roleid`),
  CONSTRAINT `useraccount123_ibfk_1` FOREIGN KEY (`roleid`) REFERENCES `roles` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `useraccount123`
--

LOCK TABLES `useraccount123` WRITE;
/*!40000 ALTER TABLE `useraccount123` DISABLE KEYS */;
INSERT INTO `useraccount123` VALUES ('Gauri','*384F41980A268B224BE3FCA849F17A99E7A04280','localhost','r2'),('Jack','1d6c1e168e362bc0092f247399003a88','localhost','r1'),('John','6e0b7076126a29d5dfcbd54835387b7b','localhost','r1');
/*!40000 ALTER TABLE `useraccount123` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER timerabc
AFTER
INSERT ON useraccount123
FOR EACH ROW 
BEGIN
    insert into session(username,creation_date,creation_time)
values(NEW.username,curdate(),curtime());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `vote`
--

DROP TABLE IF EXISTS `vote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vote` (
  `BallotID` varchar(60) NOT NULL,
  `ElectionID` varchar(45) NOT NULL,
  `CandidateID` int(11) DEFAULT NULL,
  `PartyID` varchar(60) DEFAULT NULL,
  `PrecientID` int(11) NOT NULL,
  `VoteStatus` varchar(45) NOT NULL,
  KEY `ElectionID` (`ElectionID`),
  KEY `PartyID` (`PartyID`),
  KEY `BallotID` (`BallotID`),
  KEY `PrecientID` (`PrecientID`),
  CONSTRAINT `vote_ibfk_1` FOREIGN KEY (`ElectionID`) REFERENCES `election` (`ElectionID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `vote_ibfk_2` FOREIGN KEY (`PartyID`) REFERENCES `party` (`PartyID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `vote_ibfk_3` FOREIGN KEY (`BallotID`) REFERENCES `voter_info` (`BallotID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `vote_ibfk_4` FOREIGN KEY (`PrecientID`) REFERENCES `precient` (`PrecientID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vote`
--

LOCK TABLES `vote` WRITE;
/*!40000 ALTER TABLE `vote` DISABLE KEYS */;
INSERT INTO `vote` VALUES ('211-00','e01',1001,'p1',211,'Yes'),('211-04','e02',2002,'p2',211,'Yes'),('211-05','e03',1003,'p1',211,'Yes'),('211-06','e04',1004,'p1',211,'Yes'),('211-09','e05',3004,'p3',211,'Yes'),('211-21','e06',1005,'p1',211,'Yes'),('211-24','e07',1002,'p1',211,'Yes'),('211-34','e08',2003,'p2',211,'Yes'),('211-52','e09',1004,'p1',211,'Yes'),('211-53','e10',2005,'p2',211,'Yes'),('211-54','e11',NULL,NULL,211,'No'),('211-61','e12',NULL,NULL,211,'No'),('211-62','e13',1002,'p1',211,'Yes'),('211-69','e14',2003,'p2',211,'Yes'),('211-72','e15',1004,'p1',211,'Yes'),('221-04','e16',2005,'p2',221,'Yes'),('221-05','e17',1005,'p1',221,'Yes'),('221-06','e18',1002,'p1',221,'Yes'),('221-09','e19',1003,'p1',221,'Yes'),('221-18','e20',1004,'p1',221,'Yes'),('221-22','e21',2005,'p2',221,'Yes'),('221-25','e22',1005,'p1',221,'Yes'),('221-48','e23',NULL,NULL,221,'No'),('221-49','e24',NULL,NULL,221,'No'),('221-50','e25',1001,'p1',221,'Yes'),('221-67','e01',2001,'p2',221,'Yes'),('221-68','e02',2002,'p2',221,'Yes'),('221-69','e03',1003,'p1',221,'Yes'),('221-79','e04',1004,'p1',221,'Yes'),('221-81','e05',2005,'p2',221,'Yes'),('231-19','e06',1005,'p1',231,'Yes'),('231-20','e07',1002,'p1',231,'Yes'),('231-30','e08',2003,'p2',231,'Yes'),('231-33','e09',1004,'p1',231,'Yes'),('231-37','e10',NULL,NULL,231,'No'),('231-40','e11',NULL,NULL,231,'No'),('231-42','e12',1001,'p1',231,'Yes'),('231-49','e13',2002,'p2',231,'Yes'),('231-50','e14',1003,'p1',231,'Yes'),('231-51','e15',2004,'p2',231,'Yes'),('231-52','e16',3004,'p3',231,'Yes'),('231-53','e17',1005,'p1',231,'Yes'),('231-70','e18',2002,'p2',231,'Yes'),('231-72','e19',1003,'p1',231,'Yes'),('231-74','e20',1004,'p1',231,'Yes'),('311-04','e21',2005,'p2',311,'Yes'),('311-08','e22',NULL,NULL,311,'No'),('311-11','e23',NULL,NULL,311,'No'),('311-13','e24',1002,'p1',311,'Yes'),('311-20','e25',1003,'p1',311,'Yes'),('311-24','e01',1001,'p1',311,'Yes'),('311-36','e02',2002,'p2',311,'Yes'),('311-43','e03',2003,'p2',311,'Yes'),('311-53','e04',1004,'p1',311,'Yes'),('311-56','e05',3004,'p3',311,'Yes'),('311-73','e06',3005,'p3',311,'Yes'),('311-75','e07',2002,'p2',311,'Yes'),('311-82','e08',1003,'p1',311,'Yes'),('311-87','e09',NULL,NULL,311,'No'),('311-90','e10',NULL,NULL,311,'No'),('321-08','e11',1005,'p1',321,'Yes'),('321-10','e12',2001,'p2',321,'Yes'),('321-18','e13',2002,'p2',321,'Yes'),('321-27','e14',2003,'p2',321,'Yes'),('321-30','e15',2004,'p2',321,'Yes'),('321-33','e16',3004,'p3',321,'Yes'),('321-37','e17',1005,'p1',321,'Yes'),('321-47','e18',1002,'p1',321,'Yes'),('321-52','e19',2003,'p2',321,'Yes'),('321-54','e20',2004,'p2',321,'Yes'),('321-63','e21',NULL,NULL,321,'No'),('321-64','e22',NULL,NULL,321,'No'),('321-70','e23',1001,'p1',321,'Yes'),('321-75','e24',1002,'p1',321,'Yes'),('321-77','e25',1003,'p1',321,'Yes'),('331-00','e01',2001,'p2',331,'Yes'),('331-04','e02',1002,'p1',331,'Yes'),('331-05','e03',3003,'p3',331,'Yes'),('331-08','e04',1004,'p1',331,'Yes'),('331-12','e05',3004,'p3',331,'Yes'),('331-17','e06',3005,'p3',331,'Yes'),('331-18','e07',1002,'p1',331,'Yes'),('331-21','e08',NULL,NULL,331,'No'),('331-34','e09',NULL,NULL,331,'No'),('331-36','e10',2005,'p2',331,'Yes'),('331-47','e11',1005,'p1',331,'Yes'),('331-48','e12',1001,'p1',331,'Yes'),('331-52','e13',1002,'p1',331,'Yes'),('331-68','e14',2003,'p2',331,'Yes'),('331-74','e15',1004,'p1',331,'Yes'),('411-00','e16',2004,'p2',411,'Yes'),('411-04','e17',1005,'p1',411,'Yes'),('411-05','e18',1002,'p1',411,'Yes'),('411-07','e19',2003,'p2',411,'Yes'),('411-11','e20',NULL,NULL,411,'No'),('411-18','e21',NULL,NULL,411,'No'),('411-20','e22',1005,'p1',411,'Yes'),('411-30','e23',2001,'p2',411,'Yes'),('411-34','e24',2002,'p2',411,'Yes'),('411-42','e25',1003,'p1',411,'Yes'),('411-44','e01',1001,'p1',411,'Yes'),('411-54','e02',2002,'p2',411,'Yes'),('411-69','e03',2003,'p2',411,'Yes'),('411-75','e04',2004,'p2',411,'Yes'),('411-77','e05',3004,'p3',411,'Yes'),('421-11','e06',1005,'p1',421,'Yes'),('421-12','e07',NULL,NULL,421,'No'),('421-13','e08',NULL,NULL,421,'No'),('421-19','e09',1004,'p1',421,'Yes'),('421-21','e10',2005,'p2',421,'Yes'),('421-23','e11',1005,'p1',421,'Yes'),('421-32','e12',1001,'p1',421,'Yes'),('421-39','e13',1002,'p1',421,'Yes'),('421-41','e14',2003,'p2',421,'Yes'),('421-62','e15',2004,'p2',421,'Yes'),('421-71','e16',3004,'p3',421,'Yes'),('421-74','e17',1005,'p1',421,'Yes'),('421-75','e18',1002,'p1',421,'Yes'),('421-76','e19',NULL,NULL,421,'No'),('421-81','e20',NULL,NULL,421,'No'),('431-07','e21',3004,'p3',431,'Yes'),('431-08','e22',1005,'p1',431,'Yes'),('431-25','e23',1001,'p1',431,'Yes'),('431-37','e24',2002,'p2',431,'Yes'),('431-40','e25',1003,'p1',431,'Yes'),('431-41','e01',3001,'p3',431,'Yes'),('431-45','e02',1002,'p1',431,'Yes'),('431-52','e03',2003,'p2',431,'Yes'),('431-53','e04',1004,'p1',431,'Yes'),('431-54','e05',3004,'p3',431,'Yes'),('431-56','e06',NULL,NULL,431,'No'),('431-57','e07',NULL,NULL,431,'No'),('431-58','e08',3003,'p3',431,'Yes'),('431-59','e09',NULL,NULL,431,'No'),('431-61','e10',2005,'p2',431,'Yes');
/*!40000 ALTER TABLE `vote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voter_info`
--

DROP TABLE IF EXISTS `voter_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voter_info` (
  `BallotID` varchar(60) NOT NULL,
  `FirstName` varchar(45) NOT NULL,
  `LastName` varchar(45) NOT NULL,
  `DateOfBirth` date NOT NULL,
  `Gender` varchar(45) DEFAULT NULL,
  `Street` varchar(45) NOT NULL,
  `City` varchar(45) NOT NULL,
  `State` varchar(45) NOT NULL,
  `SSN` varchar(45) NOT NULL,
  `PrecientID` int(11) DEFAULT NULL,
  `EmailID` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`BallotID`),
  UNIQUE KEY `SSN` (`SSN`),
  KEY `PrecientID` (`PrecientID`),
  CONSTRAINT `voter_info_ibfk_1` FOREIGN KEY (`PrecientID`) REFERENCES `precient` (`PrecientID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voter_info`
--

LOCK TABLES `voter_info` WRITE;
/*!40000 ALTER TABLE `voter_info` DISABLE KEYS */;
INSERT INTO `voter_info` VALUES ('211-00','Goldarina','Goulter','1986-08-17','Female','2 Brown Lane','NewYork City','New York','790-16-4053',211,'ggoulter4@redcross.org'),('211-04','Darcy','Brokenshaw','1996-01-13','Female','56 Scofield Parkway','NewYork City','New York','842-89-7603',211,'dbrokenshaw0@networksolutions.com'),('211-05','Dick','Keelin','1983-12-10','Male','24 Sunnyside Road','NewYork City','New York','318-53-4884',211,'dkeelin1@usatoday.com'),('211-06','Washington','Agneau','1982-12-25','Male','98516 Bay Center','NewYork City','New York','139-04-5028',211,'wagneaua@nasa.gov'),('211-09','Winnie','Gardiner','1973-12-20','Female','1 Eagle Crest Parkway','NewYork City','New York','292-91-2197',211,'wgardiner9@nba.com'),('211-21','Jephthah','Mandrake','1970-09-09','Male','75 Straubel Street','NewYork City','New York','459-16-9568',211,'jmandrakeh@networksolutions.com'),('211-24','Jackie','Trewhitt','1966-02-22','Male','9739 Declaration Avenue','NewYork City','New York','743-31-9658',211,'jtrewhittg@mac.com'),('211-34','Maribel','Fairchild','1959-10-21','Female','85 Warner Pass','NewYork City','New York','687-83-4302',211,'mfairchild2@comsenz.com'),('211-52','Talbot','Barkaway','1965-05-01','Male','49 Vera Alley','NewYork City','New York','665-94-4207',211,'tbarkaway6@homestead.com'),('211-53','Brew','Eskrick','1969-01-29','Male','29 Waywood Pass','NewYork City','New York','672-30-7124',211,'beskrickj@ebay.co.uk'),('211-54','Valle','Alfonsetti','1986-07-16','Male','4 Stang Way','NewYork City','New York','221-63-7646',211,'valfonsettic@army.mil'),('211-61','Hervey','Anetts','1976-11-02','Male','93026 Kennedy Crossing','NewYork City','New York','876-19-1613',211,'hanetts8@answers.com'),('211-62','Rudiger','Bowler','1964-02-23','Male','17 Vera Park','NewYork City','New York','113-89-2152',211,'rbowler7@goo.gl'),('211-69','Millie','Hakonsson','1994-09-20','Female','27 Corry Point','NewYork City','New York','446-73-6387',211,'mhakonssone@xinhuanet.com'),('211-72','Worthy','Ewbanck','1980-03-04','Male','4 Green Ridge Circle','NewYork City','New York','385-05-3672',211,'wewbancki@wiley.com'),('221-04','Georgianna','Atley','1987-07-05','Female','3565 Novick Pass','Buffalo','New York','597-25-4935',221,'gatley2@51.la'),('221-05','Denyse','Kitcat','1993-09-13','Female','6197 Ryan Court','Buffalo','New York','125-81-3162',221,'dkitcat0@nifty.com'),('221-06','Munmro','Bugs','1983-03-14','Male','40 Maple Wood Parkway','Buffalo','New York','151-18-4905',221,'mbugsg@discovery.com'),('221-09','Gianna','Extance','1989-11-04','Female','2528 Summit Alley','Buffalo','New York','432-36-2696',221,'gextance9@ftc.gov'),('221-18','Fidel','Bamfield','1995-04-27','Male','1 Glacier Hill Crossing','Buffalo','New York','737-80-6207',221,'fbamfieldj@xinhuanet.com'),('221-22','Hermon','Loads','1962-05-07','Male','070 Delaware Crossing','Buffalo','New York','679-95-9902',221,'hloads4@soundcloud.com'),('221-25','Hayyim','Yann','1980-09-10','Male','167 Scofield Way','Buffalo','New York','410-10-9830',221,'hyann6@europa.eu'),('221-48','Granthem','Perico','1981-06-25','Male','1936 Susan Parkway','Buffalo','New York','692-24-9293',221,'gpericod@google.fr'),('221-49','Alec','Newtown','1954-07-31','Male','0596 Heffernan Plaza','Buffalo','New York','372-83-5111',221,'anewtowna@opensource.org'),('221-50','Towny','Daubney','1970-02-06','Male','1488 Spenser Way','Buffalo','New York','899-49-3956',221,'tdaubneye@sbwire.com'),('221-67','Benedick','Yegorkin','1960-09-27','Male','18790 Rigney Junction','Buffalo','New York','753-92-2571',221,'byegorkini@hao123.com'),('221-68','Bjorn','Juszkiewicz','1979-06-13','Male','418 Kensington Circle','Buffalo','New York','681-06-4238',221,'bjuszkiewiczc@youtu.be'),('221-69','Sig','Heintsch','1985-02-02','Male','3490 Bayside Pass','Buffalo','New York','839-56-7886',221,'sheintschh@google.com'),('221-79','Elden','McIntosh','1956-09-11','Male','70955 Raven Court','Buffalo','New York','326-26-6463',221,'emcintosh3@tuttocitta.it'),('221-81','Eb','Symmons','1952-11-14','Male','1 Blue Bill Park Circle','Buffalo','New York','147-22-0239',221,'esymmonsf@ed.gov'),('231-19','Tally','Garken','1952-01-06','Male','11201 Dennis Terrace','Rochester','New York','606-38-4378',231,'tgarkenh@myspace.com'),('231-20','Martyn','Padbery','1957-05-20','Male','5 Meadow Valley Center','Rochester','New York','607-74-8596',231,'mpadbery2@typepad.com'),('231-30','Susan','Mallall','1982-01-24','Female','8884 Commercial Avenue','Rochester','New York','649-75-3660',231,'smallalla@jimdo.com'),('231-33','Aldous','Bassford','1987-08-31','Male','22157 Center Drive','Rochester','New York','160-97-8429',231,'abassfordf@ocn.ne.jp'),('231-37','Fara','Harrop','1990-07-07','Female','896 Bunker Hill Terrace','Rochester','New York','347-78-2950',231,'fharrop0@walmart.com'),('231-40','Maison','Harwood','1992-10-07','Male','0 Mosinee Center','Rochester','New York','503-79-9033',231,'mharwoodd@delicious.com'),('231-42','Trude','Farny','1982-12-07','Female','83221 Merchant Way','Rochester','New York','855-77-5859',231,'tfarnyj@apple.com'),('231-49','Isadore','Erik','1993-04-16','Male','8578 Meadow Valley Way','Rochester','New York','642-91-7593',231,'ierikb@networkadvertising.org'),('231-50','Merry','Acock','1948-04-18','Female','9517 Petterle Avenue','Rochester','New York','524-10-5927',231,'macock8@va.gov'),('231-51','Truda','Lopes','1959-12-09','Female','1784 Kings Point','Rochester','New York','811-75-1626',231,'tlopes5@sourceforge.net'),('231-52','Brandtr','Zelner','1992-04-30','Male','29796 Coleman Crossing','Rochester','New York','893-40-3345',231,'bzelneri@mapquest.com'),('231-53','Hanan','Undy','1966-07-17','Male','779 6th Pass','Rochester','New York','405-97-5170',231,'hundy1@usgs.gov'),('231-70','Tracie','Sturzaker','1957-02-21','Male','2732 Stephen Avenue','Rochester','New York','267-43-0660',231,'tsturzakerc@gizmodo.com'),('231-72','Eugine','Betteriss','1974-08-04','Female','861 Texas Road','Rochester','New York','717-96-9159',231,'ebetteriss3@gov.uk'),('231-74','Mauricio','Knagges','1951-01-18','Male','52 Sauthoff Center','Rochester','New York','362-66-1512',231,'mknagges7@state.gov'),('311-04','Reade','Rawsen','1979-12-12','Male','096 Waywood Circle','Newark','New Jersey','681-59-3641',311,'rrawsene@homestead.com'),('311-08','Trey','Sweett','1963-01-25','Male','7 Hagan Plaza','Newark','New Jersey','842-73-5429',311,'tsweett2@miitbeian.gov.cn'),('311-11','Conny','Pennuzzi','1970-02-27','Female','071 Oakridge Alley','Newark','New Jersey','602-05-1945',311,'cpennuzzi8@ucoz.com'),('311-13','Bordy','Van Der Straaten','1967-02-02','Male','7 Corben Circle','Newark','New Jersey','676-05-2619',311,'bvanderstraaten6@bloglovin.com'),('311-20','Kevin','Llewelly','1974-02-12','Male','156 Doe Crossing Parkway','Newark','New Jersey','358-73-1788',311,'kllewellya@rediff.com'),('311-24','Ange','Petracchi','1958-05-04','Male','339 Lawn Trail','Newark','New Jersey','496-41-7118',311,'apetracchic@dyndns.org'),('311-36','Rani','Bollen','1968-01-29','Female','415 2nd Junction','Newark','New Jersey','409-50-3766',311,'rbollend@va.gov'),('311-43','Virge','Denial','1967-02-05','Male','26 Mosinee Hill','Newark','New Jersey','204-59-5700',311,'vdeniali@clickbank.net'),('311-53','Maritsa','Davidovitch','1969-02-02','Female','0 Ridge Oak Road','Newark','New Jersey','754-57-2705',311,'mdavidovitchf@businesswire.com'),('311-56','Koenraad','Dine-Hart','1983-03-02','Male','2353 Kenwood Road','Newark','New Jersey','345-08-9363',311,'kdinehartb@list-manage.com'),('311-73','Evanne','Porkiss','1989-11-09','Female','1685 Hauk Court','Newark','New Jersey','583-26-5867',311,'eporkissh@discovery.com'),('311-75','Legra','Pedgrift','1970-02-15','Female','61 Ridgeway Parkway','Newark','New Jersey','588-94-4082',311,'lpedgriftj@histats.com'),('311-82','Natalie','Still','1962-10-19','Female','40386 Arapahoe Court','Newark','New Jersey','469-78-8597',311,'nstill1@samsung.com'),('311-87','Jethro','Barnett','1996-07-16','Male','4 Debs Pass','Newark','New Jersey','309-76-4713',311,'jbarnett7@networksolutions.com'),('311-90','Mathilde','Bargery','1954-07-01','Female','6494 Old Gate Trail','Newark','New Jersey','296-32-6670',311,'mbargery3@pinterest.com'),('321-08','Corette','Sandland','1958-06-04','Female','41 Acker Street','Trenton','New Jersey','810-55-8703',321,'csandland6@yolasite.com'),('321-10','Hatty','Landeg','1967-07-24','Female','9 5th Terrace','Trenton','New Jersey','519-88-2073',321,'hlandeg0@behance.net'),('321-18','Hester','Harryman','1953-07-30','Female','7 Glendale Road','Trenton','New Jersey','801-15-0073',321,'hharrymanb@pen.io'),('321-27','Lolly','Towsey','1991-12-21','Female','044 Northport Drive','Trenton','New Jersey','146-51-3617',321,'ltowsey5@yellowpages.com'),('321-30','Marshal','Yemm','1970-12-07','Male','45 Holy Cross Street','Trenton','New Jersey','122-51-4790',321,'myemma@csmonitor.com'),('321-33','Phoebe','Chandlar','1991-10-09','Female','65 Grim Street','Trenton','New Jersey','170-19-0507',321,'pchandlar9@weibo.com'),('321-37','Livvie','Gooday','1990-07-27','Female','96 Gina Road','Trenton','New Jersey','874-64-9554',321,'lgoodayc@paypal.com'),('321-47','Park','Wigmore','1992-07-01','Male','21 Sunbrook Crossing','Trenton','New Jersey','636-81-4396',321,'pwigmorei@netvibes.com'),('321-52','Nataniel','FitzGilbert','1968-10-01','Male','51 Mosinee Terrace','Trenton','New Jersey','814-76-2519',321,'nfitzgilbert4@google.ru'),('321-54','Damian','Bernadzki','1976-04-02','Male','7 Kenwood Way','Trenton','New Jersey','815-71-1997',321,'dbernadzkid@meetup.com'),('321-63','Vergil','Axelby','1958-12-12','Male','7129 Killdeer Terrace','Trenton','New Jersey','845-61-7771',321,'vaxelby2@bravesites.com'),('321-64','Sammy','Berzen','1975-04-06','Female','81072 Elmside Pass','Trenton','New Jersey','889-18-9053',321,'sberzenf@bloomberg.com'),('321-70','Lenee','Buxam','1961-06-18','Female','2 Lindbergh Lane','Trenton','New Jersey','880-34-8241',321,'lbuxam1@posterous.com'),('321-75','Astrid','Lander','1968-03-20','Female','76 Butterfield Pass','Trenton','New Jersey','155-26-5630',321,'alander3@vistaprint.com'),('321-77','Ivy','Wickrath','1970-11-04','Female','34 Jay Hill','Trenton','New Jersey','422-33-1848',321,'iwickrath7@fda.gov'),('331-00','Sherlocke','Laughnan','1989-02-15','Male','06 Grayhawk Junction','Jersey City','New Jersey','452-86-6228',331,'slaughnan9@multiply.com'),('331-04','Darill','Bamford','1958-05-26','Male','94599 Rusk Alley','Jersey City','New Jersey','751-12-7986',331,'dbamford5@pen.io'),('331-05','Joya','Aldersey','1954-07-15','Female','3 1st Point','Jersey City','New Jersey','758-68-5157',331,'jalderseyc@census.gov'),('331-08','Malissa','Kirley','1955-12-11','Female','68719 Scott Lane','Jersey City','New Jersey','326-20-1028',331,'mkirley0@theguardian.com'),('331-12','Row','McMackin','1953-11-24','Female','44 Homewood Junction','Jersey City','New Jersey','828-70-9562',331,'rmcmackin1@biblegateway.com'),('331-17','Hendrika','Graben','1969-09-18','Female','15 Lindbergh Way','Jersey City','New Jersey','129-91-1988',331,'hgrabenb@pinterest.com'),('331-18','Ninon','Arderne','1967-01-19','Female','76902 Calypso Center','Jersey City','New Jersey','500-04-4514',331,'narderne6@marketwatch.com'),('331-21','Mellicent','Van Halle','1969-07-23','Female','34 Fulton Park','Jersey City','New Jersey','644-82-9233',331,'mvanhalle8@imgur.com'),('331-34','Simon','Smorthit','1992-12-26','Male','13025 Mallard Road','Jersey City','New Jersey','513-71-1803',331,'ssmorthit3@sohu.com'),('331-36','Raynard','Bevar','1986-01-29','Male','1 Dixon Drive','Jersey City','New Jersey','229-82-9553',331,'rbevarh@bing.com'),('331-47','Helyn','Twittey','1990-02-18','Female','2 Heath Hill','Jersey City','New Jersey','727-68-8746',331,'htwitteye@google.nl'),('331-48','Blakeley','Scoterbosh','1972-12-23','Female','567 Barby Junction','Jersey City','New Jersey','265-30-7528',331,'bscoterbosh4@accuweather.com'),('331-52','Leesa','Embling','1992-05-13','Female','1502 Dixon Junction','Jersey City','New Jersey','227-40-6781',331,'lemblingi@ow.ly'),('331-68','Shelagh','Hairyes','1953-04-14','Female','4 Starling Way','Jersey City','New Jersey','383-64-3308',331,'shairyes2@twitter.com'),('331-74','Imojean','Henmarsh','1961-12-27','Female','91 Stoughton Plaza','Jersey City','New Jersey','671-81-7055',331,'ihenmarshf@reference.com'),('411-00','Carling','Andrzejowski','1962-04-28','Male','605 Sutteridge Avenue','Los Angeles','California','810-94-6898',411,'candrzejowski4@t-online.de'),('411-04','Janelle','Farge','1990-10-15','Female','90 Oneill Street','Los Angeles','California','717-31-6980',411,'jfargee@ed.gov'),('411-05','Kimberli','Kleinplac','1981-08-18','Female','648 Acker Junction','Los Angeles','California','455-16-0433',411,'kkleinplacb@washingtonpost.com'),('411-07','Bernardina','Warbeys','1987-05-27','Female','9 Claremont Parkway','Los Angeles','California','453-45-0466',411,'bwarbeys3@noaa.gov'),('411-11','Stella','Pulster','1964-06-01','Female','32 Haas Park','Los Angeles','California','726-04-7114',411,'spulster6@ucsd.edu'),('411-18','Krishnah','Cattini','1974-11-16','Male','381 Manley Parkway','Los Angeles','California','459-81-9053',411,'kcattinic@indiegogo.com'),('411-20','Delano','Pinnion','1996-12-01','Male','41 Forest Park','Los Angeles','California','325-38-6947',411,'dpinnionh@loc.gov'),('411-30','Lydon','Northley','1992-07-02','Male','15336 Goodland Place','Los Angeles','California','225-80-4327',411,'lnorthley0@sciencedaily.com'),('411-34','Latrena','Tooth','1948-10-01','Female','63 Toban Circle','Los Angeles','California','541-93-1275',411,'ltooth1@mediafire.com'),('411-42','Pattie','Maggs','1976-09-21','Female','0810 Barnett Plaza','Los Angeles','California','238-58-6424',411,'pmaggsi@howstuffworks.com'),('411-44','Michel','Coggan','1972-05-24','Female','710 Springview Crossing','Los Angeles','California','626-31-7125',411,'mcoggan7@walmart.com'),('411-54','Corrinne','Corrington','1964-10-03','Female','80725 Declaration Pass','Los Angeles','California','533-95-2508',411,'ccorringtonf@theguardian.com'),('411-69','Rosana','Irvine','1997-06-24','Female','631 Washington Court','Los Angeles','California','386-19-3130',411,'rirvine9@statcounter.com'),('411-75','Layne','Isaacs','1983-12-30','Female','6 Twin Pines Road','Los Angeles','California','368-23-1407',411,'lisaacs2@livejournal.com'),('411-77','Fawne','Pawelec','1968-11-22','Female','80254 Schurz Road','Los Angeles','California','404-18-5658',411,'fpawelec5@shinystat.com'),('421-11','Kip','Tutchener','1961-03-29','Female','21 Hanover Center','King County','California','229-84-9680',421,'ktutchener8@wordpress.org'),('421-12','Orly','Kinchley','1951-09-27','Female','49 Briar Crest Street','King County','California','783-50-6410',421,'okinchleya@vistaprint.com'),('421-13','Opalina','Barnet','1950-03-02','Female','4577 Kim Street','King County','California','790-32-5839',421,'obarnetd@simplemachines.org'),('421-19','Felicdad','Bowes','1975-05-10','Female','194 Talmadge Drive','King County','California','671-51-4394',421,'fbowese@blogtalkradio.com'),('421-21','Mike','Bonnefin','1966-05-17','Male','76204 Monterey Trail','King County','California','539-63-2571',421,'mbonnefin5@xing.com'),('421-23','Bartholemy','Walch','1954-03-30','Male','427 Northfield Avenue','King County','California','462-35-7657',421,'bwalchc@mapquest.com'),('421-32','Corby','Whittingham','1954-05-05','Male','12 Blue Bill Park Trail','King County','California','529-89-2585',421,'cwhittinghamb@usatoday.com'),('421-39','Verena','Hardwin','1997-01-22','Female','2 Harbort Way','King County','California','872-48-5081',421,'vhardwin9@fda.gov'),('421-41','Monty','Wadham','1957-01-07','Male','233 Pankratz Lane','King County','California','146-89-6677',421,'mwadhamg@pbs.org'),('421-62','Glen','Scarfe','1977-04-06','Male','35 Hooker Street','King County','California','209-67-8547',421,'gscarfe6@geocities.jp'),('421-71','Cedric','Lawland','1956-07-30','Male','04809 Calypso Way','King County','California','177-53-2372',421,'clawland1@craigslist.org'),('421-74','Bebe','Kidson','1976-12-25','Female','8 Waubesa Center','King County','California','619-25-6158',421,'bkidson2@yahoo.co.jp'),('421-75','Aldric','Forst','1994-01-01','Male','6035 Browning Avenue','King County','California','304-28-8704',421,'aforstj@businesswire.com'),('421-76','Salmon','Mayberry','1987-11-23','Male','743 Stuart Drive','King County','California','744-42-5229',421,'smayberry4@apache.org'),('421-81','Cheslie','Bauld','1972-06-05','Female','4 Cordelia Terrace','King County','California','242-67-6050',421,'cbauldf@reverbnation.com'),('431-07','Ora','Reams','1974-10-10','Female','380 Swallow Plaza','Orange County','California','298-99-3674',431,'oreamsa@squidoo.com'),('431-08','Adey','Lerego','1993-04-01','Female','5 Goodland Crossing','Orange County','California','708-57-8289',431,'aleregoe@netscape.com'),('431-25','Linnea','Todhunter','1952-04-30','Female','49173 American Road','Orange County','California','494-29-8066',431,'ltodhunter7@narod.ru'),('431-37','Michaela','Gaspar','1969-08-03','Female','084 Clarendon Avenue','Orange County','California','873-87-2910',431,'mgaspar2@engadget.com'),('431-40','Raddie','Rolling','1997-08-10','Male','8 Buena Vista Plaza','Orange County','California','743-76-5121',431,'rrollingf@booking.com'),('431-41','Verene','Rigg','1952-01-29','Female','6 International Terrace','Orange County','California','525-33-1675',431,'vriggb@live.com'),('431-45','Michaelina','Kropp','1954-03-07','Female','18 Ohio Point','Orange County','California','390-85-9346',431,'mkropp3@opensource.org'),('431-52','Agata','Moggle','1956-04-11','Female','3 Bobwhite Avenue','Orange County','California','407-98-6130',431,'amoggleh@sbwire.com'),('431-53','Jobina','Chevin','1965-02-11','Female','1 Main Way','Orange County','California','498-71-8679',431,'jchevin4@earthlink.net'),('431-54','Thedric','Chrishop','1954-01-20','Male','78143 Bunting Way','Orange County','California','660-17-8672',431,'tchrishopc@meetup.com'),('431-56','Deana','Dreus','1973-04-12','Female','0934 Londonderry Junction','Orange County','California','855-32-8864',431,'ddreus8@phpbb.com'),('431-57','Alex','Roundtree','1960-04-02','Male','45220 Northwestern Center','Orange County','California','217-42-5093',431,'aroundtree1@si.edu'),('431-58','Cass','Alekseicik','1979-02-20','Male','6593 Westport Lane','Orange County','California','313-35-3572',431,'calekseicikd@alibaba.com'),('431-59','Lucius','Trippack','1961-02-21','Male','040 Elgar Court','Orange County','California','581-50-4258',431,'ltrippacki@walmart.com'),('431-61','Kari','Raubenheimer','1962-06-06','Female','2 Talmadge Terrace','Orange County','California','411-52-0007',431,'kraubenheimerj@umn.edu');
/*!40000 ALTER TABLE `voter_info` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER triggervoter
BEFORE 
INSERT ON Voter_Info 
FOR EACH ROW BEGIN
    IF (NEW.precientid NOT IN (select precientid from precient)) THEN 
        SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Warning: NO SUCH PRECIENT EXISTS';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `votesummary`
--

DROP TABLE IF EXISTS `votesummary`;
/*!50001 DROP VIEW IF EXISTS `votesummary`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `votesummary` AS SELECT 
 1 AS `electionid`,
 1 AS `winner_total`,
 1 AS `candidatename`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `winner`
--

DROP TABLE IF EXISTS `winner`;
/*!50001 DROP VIEW IF EXISTS `winner`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `winner` AS SELECT 
 1 AS `electionid`,
 1 AS `electionname`,
 1 AS `candidateid`,
 1 AS `candidatename`,
 1 AS `partyname`,
 1 AS `Total_Votes`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'electionsystem'
--

--
-- Dumping routines for database 'electionsystem'
--
/*!50003 DROP FUNCTION IF EXISTS `Income` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `Income`(a VARCHAR(100),b VARCHAR(100)) RETURNS varchar(100) CHARSET utf8
BEGIN
DECLARE ans VARCHAR(100);
SET ans=0;
SET ans=a-b;
RETURN ans;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `campaigndetails` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `campaigndetails`(IN v varchar(60))
BEGIN
SELECT c.campaignid, c.campaignname,cm.mediaid,mm.name,c.fundspent,c.receiveddonations,TRUNCATE(Income(c.FundSpent,c.ReceivedDonations),2) AS INCOME_Million,c.managerid,m.name as Manager_Name,c.noofvolunteers,c.CandidateID,a.candidatename
FROM Campaign c
inner join candidates_uses_media cm
INNER JOIN candidates a
INNER JOIN campaignManager m
INNER JOIN media mm
ON c.candidateid=a.candidateid AND m.managerid=c.managerid AND mm.MediaID=cm.MediaID AND cm.candidateid=a.CandidateID
where c.candidateid=v
order by campaignid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `campaignrevenue` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `campaignrevenue`(IN b varchar(60))
BEGIN
SELECT c.campaignid, c.campaignname, a.candidatename,p.partyname,TRUNCATE(Income(c.FundSpent,c.ReceivedDonations),2) AS INCOME_Million
FROM Campaign c
INNER JOIN candidates a
INNER JOIN Party p
ON c.candidateid=a.candidateid AND p.partyid=a.PartyID
WHERE Campaignid= b
order by income_million desc;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `electionresult` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `electionresult`(IN a varchar(60))
BEGIN
SELECT t.electionid, t.electionname, t.candidateid,t.candidatename,max(t.total)as totalVote, t.candidateid 
FROM (SELECT electionid, electionname, candidateid, candidatename, max(total_votes) AS Total
FROM Winner GROUP BY candidateid, electionid) t 
WHERE electionid = a
GROUP BY t.electionid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `completeelectionsummary`
--

/*!50001 DROP VIEW IF EXISTS `completeelectionsummary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `completeelectionsummary` AS select `t`.`electionid` AS `electionid`,`t`.`electionname` AS `electionname`,`t`.`Total_voters` AS `total_voters`,`s`.`winner_total` AS `winner_total`,`s`.`candidatename` AS `candidatename` from (`electionsystem`.`totalvoters` `t` join `electionsystem`.`votesummary` `s` on((`t`.`electionid` = `s`.`electionid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `totalvoters`
--

/*!50001 DROP VIEW IF EXISTS `totalvoters`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `totalvoters` AS select `v`.`ElectionID` AS `electionid`,`e`.`ElectionName` AS `electionname`,count(`v`.`BallotID`) AS `Total_voters` from (`vote` `v` join `election` `e` on((`v`.`ElectionID` = `e`.`ElectionID`))) where (`v`.`VoteStatus` = 'yes') group by `v`.`ElectionID` order by `v`.`ElectionID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `votesummary`
--

/*!50001 DROP VIEW IF EXISTS `votesummary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `votesummary` AS select `t`.`electionid` AS `electionid`,max(`t`.`totalvotes`) AS `winner_total`,`t`.`candidatename` AS `candidatename` from (select `v`.`ElectionID` AS `electionid`,`c`.`CandidateName` AS `candidatename`,count(`v`.`CandidateID`) AS `totalvotes` from (`electionsystem`.`vote` `v` join `electionsystem`.`candidates` `c` on((`c`.`CandidateID` = `v`.`CandidateID`))) where (`v`.`VoteStatus` = 'yes') group by `v`.`ElectionID`,`v`.`CandidateID`) `t` group by `t`.`electionid` order by `t`.`electionid` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `winner`
--

/*!50001 DROP VIEW IF EXISTS `winner`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `winner` AS select `v`.`ElectionID` AS `electionid`,`e`.`ElectionName` AS `electionname`,`v`.`CandidateID` AS `candidateid`,`c`.`CandidateName` AS `candidatename`,`p`.`PartyName` AS `partyname`,count(`v`.`CandidateID`) AS `Total_Votes` from (((`vote` `v` join `candidates` `c`) join `election` `e`) join `party` `p` on(((`v`.`ElectionID` = `e`.`ElectionID`) and (`v`.`CandidateID` = `c`.`CandidateID`) and (`v`.`PartyID` = `p`.`PartyID`)))) where ((`v`.`CandidateID` is not null) and (`v`.`VoteStatus` = 'yes')) group by `v`.`ElectionID`,`v`.`CandidateID` order by `v`.`ElectionID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-13 21:12:26
