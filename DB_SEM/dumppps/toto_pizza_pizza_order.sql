CREATE DATABASE  IF NOT EXISTS `toto_pizza` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `toto_pizza`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: toto_pizza
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `pizza_order`
--

DROP TABLE IF EXISTS `pizza_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pizza_order` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `order_date_create` date DEFAULT NULL,
  `order_time_depart` time DEFAULT NULL,
  `order_time_arrive` time DEFAULT NULL,
  `order_time_ordery` time DEFAULT NULL,
  `order_summary_price` float DEFAULT NULL,
  `order_meals_amount` int DEFAULT NULL,
  `order_status_deliver` varchar(45) DEFAULT NULL,
  `order_status_payment` varchar(45) DEFAULT NULL,
  `order_client_mark` int DEFAULT NULL,
  `client_id` int NOT NULL,
  `courier_id` int NOT NULL,
  `dispatcher_id` int NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `courier_id_idx` (`order_id`),
  KEY `client_pizza_order_idx` (`client_id`),
  KEY `dispatcher_pizza_order_idx` (`dispatcher_id`),
  KEY `order_courier_id_idx` (`courier_id`),
  CONSTRAINT `order_client_id` FOREIGN KEY (`client_id`) REFERENCES `client` (`client_id`),
  CONSTRAINT `order_courier_id` FOREIGN KEY (`courier_id`) REFERENCES `courier` (`courier_id`),
  CONSTRAINT `order_dispatcher_id` FOREIGN KEY (`dispatcher_id`) REFERENCES `dispatcher` (`dispatcher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=212 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pizza_order`
--

LOCK TABLES `pizza_order` WRITE;
/*!40000 ALTER TABLE `pizza_order` DISABLE KEYS */;
INSERT INTO `pizza_order` VALUES (1,'2020-03-01','00:00:00','00:00:00','00:00:00',777,0,'yes','yes',1,1,1,1),(2,'2020-03-02','00:00:00','00:00:00','00:00:00',666,0,'yes','yes',2,2,1,2),(3,'2020-03-03','00:00:00','00:00:00','00:00:00',555,0,'yes','yes',3,3,2,1),(4,'2020-03-04','00:00:00','00:00:00','00:00:00',540,0,'yes','yes',4,4,2,2),(5,'2020-03-05','00:00:00','00:00:00','00:00:00',543,0,'yes','yes',5,2,3,1),(6,'2020-03-06','00:00:00','00:00:00','00:00:00',689,0,'yes','yes',5,2,3,2),(7,'2020-03-07','00:00:00','00:00:00','00:00:00',670,0,'no','no',4,1,4,1),(8,'2020-03-08','00:00:00','00:00:00','00:00:00',650,0,'no','yes',3,3,4,2),(9,'2020-03-09','00:00:00','00:00:00','00:00:00',1999,0,'yes','no',2,4,4,1),(10,'2020-03-10','00:00:00','00:00:00','00:00:00',2000,0,'no','no',1,1,4,2),(11,'2020-03-01','00:00:00','00:00:00','00:00:00',600,0,'yes','yes',1,1,1,1),(12,'2020-03-02','00:00:00','00:00:00','00:00:00',800,0,'yes','yes',2,2,1,2),(13,'2020-03-03','00:00:00','00:00:00','00:00:00',900,0,'yes','yes',3,3,2,1),(14,'2020-03-04','00:00:00','00:00:00','00:00:00',1500,0,'yes','yes',4,4,2,2),(15,'2020-03-05','00:00:00','00:00:00','00:00:00',1400,0,'yes','yes',5,2,3,1),(16,'2020-03-06','00:00:00','00:00:00','00:00:00',1000,0,'yes','yes',5,2,3,2),(17,'2020-03-07','00:00:00','00:00:00','00:00:00',1000,0,'no','no',4,1,4,1),(18,'2020-03-08','00:00:00','00:00:00','00:00:00',1000,0,'no','yes',3,3,4,2),(19,'2020-03-09','00:00:00','00:00:00','00:00:00',1900,0,'yes','no',2,4,4,1),(20,'2020-03-10','00:00:00','00:00:00','00:00:00',400,0,'no','no',1,1,4,2),(21,'2020-03-01','00:00:00','00:00:00','00:00:00',500,0,'yes','yes',1,1,1,1),(22,'2020-03-02','00:00:00','00:00:00','00:00:00',1500,0,'yes','yes',2,2,1,2),(23,'2020-03-03','00:00:00','00:00:00','00:00:00',300,0,'yes','yes',3,3,2,1),(24,'2020-03-04','00:00:00','00:00:00','00:00:00',651,0,'yes','yes',4,4,2,2),(25,'2020-03-05','00:00:00','00:00:00','00:00:00',2000,0,'yes','yes',5,2,3,1),(26,'2020-03-06','00:00:00','00:00:00','00:00:00',350,0,'yes','yes',5,2,3,2),(27,'2020-03-07','00:00:00','00:00:00','00:00:00',500,0,'no','no',4,1,4,1),(28,'2020-03-08','00:00:00','00:00:00','00:00:00',1500,0,'no','yes',3,3,4,2),(29,'2020-03-09','00:00:00','00:00:00','00:00:00',499,0,'yes','no',2,4,4,1),(30,'2020-03-10','00:00:00','00:00:00','00:00:00',760,0,'no','no',1,1,4,2),(31,'2020-03-11','00:00:00','00:00:00','00:00:00',1999,0,'no','yes',1,4,2,1),(32,'2020-03-01','00:00:00','00:00:00','00:00:00',400,0,'yes','yes',1,1,1,1),(33,'2020-03-02','00:00:00','00:00:00','00:00:00',30000,0,'yes','yes',2,2,1,2),(34,'2020-03-03','00:00:00','00:00:00','00:00:00',2000,0,'yes','yes',3,3,2,1),(35,'2020-03-04','00:00:00','00:00:00','00:00:00',450,0,'yes','yes',4,4,2,2),(36,'2020-03-05','00:00:00','00:00:00','00:00:00',650,0,'yes','yes',5,2,3,1),(37,'2020-03-06','00:00:00','00:00:00','00:00:00',500,0,'yes','yes',5,2,3,2),(38,'2020-03-07','00:00:00','00:00:00','00:00:00',499,0,'no','no',4,1,4,1),(39,'2020-03-08','00:00:00','00:00:00','00:00:00',250,0,'no','yes',3,3,4,2),(40,'2020-03-09','00:00:00','00:00:00','00:00:00',450,0,'yes','no',2,4,4,1),(41,'2020-03-10','00:00:00','00:00:00','00:00:00',670,0,'no','no',1,1,4,2),(42,'2020-03-11','00:00:00','00:00:00','00:00:00',890,0,'no','yes',1,4,2,1),(43,'2017-03-01',NULL,NULL,NULL,1,1,'yes','yes',5,1,5,1),(206,'2020-03-05',NULL,NULL,NULL,500,0,'yes','yes',4,2,2,2),(207,'2017-03-28',NULL,NULL,NULL,1400,2,'no','yes',1,1,1,1),(208,'2017-03-21',NULL,NULL,NULL,1200,3,'yes','yes',5,2,1,2),(209,'2017-03-23',NULL,NULL,NULL,500,2,'yes','yes',5,1,1,1),(210,'2017-03-04',NULL,NULL,NULL,400,1,'yes','yes',5,2,5,2),(211,'2017-03-11',NULL,NULL,NULL,1000,2,'yes','yes',5,1,5,1);
/*!40000 ALTER TABLE `pizza_order` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-11  4:11:30
