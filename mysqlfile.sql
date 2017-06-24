-- TSALESIS EVANGELOS
-- AM: 1779
-- Εντολές ερωτημάτων στο τέλος του αρχείου

-- MySQL dump 10.13  Distrib 5.5.27, for Win32 (x86)
--
-- Host: localhost    Database: set2_
-- ------------------------------------------------------
-- Server version	5.5.27

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
-- Table structure for table `business`
--

DROP TABLE IF EXISTS `business`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `business` (
  `bid` int(11) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `category` varchar(20) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `country` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`bid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `business`
--

LOCK TABLES `business` WRITE;
/*!40000 ALTER TABLE `business` DISABLE KEYS */;
INSERT INTO `business` VALUES (1,'Urban','Bar','Thessaloniki','Greece'),(2,'Oregano','Grill','Xwra','Greece'),(3,'Beanhive','Restaurant','Dublin','Ireland'),(4,'Schinovatis','Cafe','Athens','Greece'),(5,'Arcadia','Restaurant','Athens','Greece'),(6,'Petrino','Restaurant','Arta','Greece'),(7,'Taf','Cafe','Athens','Greece'),(8,'Elxate','Pub','Thessaloniki','Greece'),(9,'Roka','Restaurant','London','England'),(10,'Chevalier','Cafe','Ioannina','Greece'),(11,'Balsamico','Restaurant','Ioannina','Greece'),(12,'Paprika','Restaurant','Ioannina','Greece');
/*!40000 ALTER TABLE `business` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `business_rev`
--

DROP TABLE IF EXISTS `business_rev`;
/*!50001 DROP VIEW IF EXISTS `business_rev`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `business_rev` (
  `bid` tinyint NOT NULL,
  `grade` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `greek_restaurants`
--

DROP TABLE IF EXISTS `greek_restaurants`;
/*!50001 DROP VIEW IF EXISTS `greek_restaurants`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `greek_restaurants` (
  `bid` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `category` tinyint NOT NULL,
  `city` tinyint NOT NULL,
  `country` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review` (
  `bid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `stars` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`bid`,`uid`),
  KEY `uid` (`uid`),
  CONSTRAINT `review_ibfk_1` FOREIGN KEY (`bid`) REFERENCES `business` (`bid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `review_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (1,1,3,'2015-12-10'),(1,3,4,'2015-12-10'),(2,1,5,'2015-05-08'),(2,4,1,'2013-11-03'),(2,5,2,'2013-11-03'),(2,9,1,'2014-05-03'),(3,1,1,'2015-12-10'),(3,2,2,'2015-10-10'),(3,3,5,'2015-01-01'),(4,1,3,'2015-12-10'),(4,5,3,'2015-05-08'),(4,6,1,'2015-03-31'),(4,7,3,'2015-05-08'),(5,1,3,'2015-07-31'),(5,2,1,'2015-10-10'),(5,7,3,'2013-11-03'),(6,1,3,'2015-10-10'),(6,7,3,'2014-05-03'),(7,1,3,'2015-07-31'),(7,7,3,'2015-12-10'),(8,7,1,'2015-12-10'),(8,8,1,'2015-10-10'),(9,1,2,'2015-03-31'),(9,2,4,'2015-05-08'),(9,3,1,'2014-05-03'),(9,5,1,'2015-12-10'),(9,9,5,'2015-03-31'),(11,2010,2,'2015-03-31'),(12,2010,5,'2015-12-11');
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `uid` int(11) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Andreas'),(2,'Aris'),(3,'Anna'),(4,'Dimitris'),(5,'Katerina'),(6,'Kostas'),(7,'Maria'),(8,'Panos'),(9,'Petros'),(2010,'Vasilis');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `business_rev`
--

/*!50001 DROP TABLE IF EXISTS `business_rev`*/;
/*!50001 DROP VIEW IF EXISTS `business_rev`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `business_rev` AS select `review`.`bid` AS `bid`,avg(`review`.`stars`) AS `grade` from `review` group by `review`.`bid` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `greek_restaurants`
--

/*!50001 DROP TABLE IF EXISTS `greek_restaurants`*/;
/*!50001 DROP VIEW IF EXISTS `greek_restaurants`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `greek_restaurants` AS select `business`.`bid` AS `bid`,`business`.`name` AS `name`,`business`.`category` AS `category`,`business`.`city` AS `city`,`business`.`country` AS `country` from `business` where ((`business`.`category` = 'Restaurant') and (`business`.`country` = 'Greece')) */;
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

-- Dump completed on 2015-12-11 22:20:14



/* ******* ΕΝΤΟΛΕΣ ΕΡΩΤΗΜΑΤΩΝ *******

(β)(i)
select distinct business.city 
from business 
where category = "Restaurant" and business.bid in 
(select review.bid 
from review, review as review1 
where review.bid = review1.bid and review.stars = 1 and review1.stars = 5);

(ii)
select distinct review.uid 
from review 
where not exists 
(select business.bid 
from business 
where business.category="Restaurant" and business.city="Athens" and not exists 
(select review1.bid 
from review as review1 
where review1.bid = business.bid and review.uid = review1.uid and review1.stars = 3));

(iii)
select business.name 
from business, review 
where business.bid = review.bid and business.category="Restaurant" and business.country="Greece" and exists 
(select review1.bid 
from review as review1 
where review.bid = review1.bid and review.uid <> review1.uid) 
group by business.bid 
order by avg(review.stars) desc
limit 3;

(iv)
select business.bid, business.name, user.uid, user.name, review.stars, review.date 
from review, business, user 
where business.bid = review.bid and review.uid = user.uid and business.country="Greece" 
order by date desc 
limit 3;

(v)
select distinct user.uid, user.name, count(distinct country) 
from user, business 
where exists 
(select * 
from review 
where business.bid = review.bid and user.uid = review.uid) 
group by user.uid 
having count(distinct country) >= 3 
order by count(distinct country) desc, user.uid asc;


(γ) (i)
Η όψη είναι updatable αν:
	αναφέρεται σε ένα μόνο πίνακα
	περιέχει πρωτεύον κλειδί της βασικής σχέσης
	περιέχει όλα τα γνωρίσματα με not null περιορισμό που δεν έχουν default τιμή.

create view Greek_Restaurants as 
select * 
from business 
where category="Restaurant" and country="Greece";

Μεταφορά του εστιατορίου “Petrino” με bid=6 από Αθήνα στην Άρτα:
update Greek_Restaurants set city=”Arta” where bid = 6; 

(ii)
create view BUSINESS_REV(bid, grade) as 
select bid, avg(stars) 
from review 
group by bid;

Εισαγωγή πλειάδας στο review:
insert into review values (3,3,5,'2015-01-01');

Kαι παρατήρηση αλλαγής της τιμής του μέσου αριθμού αστεριών για επιχείρηση με bid = 3 (δες output.txt)


(δ)
insert into review(bid, uid, stars, date) 
select business.bid, 2010, 5, '2015-12-11'  
from business 
where business.category = "Restaurant" and business.city = "Ioannina" and business.bid not in 
(select review.bid 
from review 
where review.uid = 2010);

*/

