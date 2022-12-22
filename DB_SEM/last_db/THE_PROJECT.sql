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
-- Temporary view structure for view `alpha`
--

DROP TABLE IF EXISTS `alpha`;
/*!50001 DROP VIEW IF EXISTS `alpha`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `alpha` AS SELECT 
 1 AS `b`,
 1 AS `courier_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `client_id` int NOT NULL AUTO_INCREMENT,
  `client_name` varchar(45) NOT NULL,
  `client_surname` varchar(45) DEFAULT NULL,
  `client_adress` varchar(45) DEFAULT NULL,
  `client_telephone` varchar(45) DEFAULT NULL,
  `client_date` date NOT NULL,
  `client_deliver_number` int DEFAULT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,'Виви','Палыч','Химки','+7-812-322-322-33','2022-03-11',1),(2,'Иван','Иванов','Москва','+7-812-300-322-33','2022-03-10',3),(3,'Михаил','Иванов','Москва','+7-812-200-322-33','2022-03-09',228),(4,'Мария','Рилс','Химки','+7-812-300-322-31','2022-03-08',1),(5,'Степан','Степанов','Москва','+7-800-300-300-33','2022-03-07',2),(6,'Иван','Иванов','Химки','+7-812-100-322-33','2022-03-06',4),(7,'Михаил','Рилс','Москва','+7-800-555-35-55','2022-01-21',2),(8,'Михаил','Снилс','Королёв','+7-800-555-77-55','2022-01-21',5),(9,'Михаил','Новичков','Москва','+7-800-555-76-55','2013-01-01',1),(10,'Виталий','Нерук','Москва','+7-800-555-78-55','2013-03-01',19),(11,'Димитрий','Ортес','Химки','+7-800-555-70-55','2013-04-01',11),(12,'Сергей','Серен','Москва','+7-800-333-77-55','2013-05-01',12),(13,'Андрей','Новик','Москва','+7-800-555-07-55','2013-06-01',22),(14,'Денис','Новиг','Королёв','+7-322-228-98-99','2013-07-03',2);
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courier`
--

DROP TABLE IF EXISTS `courier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courier` (
  `courier_id` int NOT NULL AUTO_INCREMENT,
  `courier_name` varchar(45) DEFAULT NULL,
  `courier_surname` varchar(45) DEFAULT NULL,
  `courier_ex` varchar(45) DEFAULT NULL,
  `courier_birth` date DEFAULT NULL,
  `courier_age` int DEFAULT NULL,
  `courier_telephone` varchar(45) DEFAULT NULL,
  `courier_date_start` date DEFAULT NULL,
  `courier_date_end` date DEFAULT NULL,
  `courier_salary` float DEFAULT NULL,
  PRIMARY KEY (`courier_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courier`
--

LOCK TABLES `courier` WRITE;
/*!40000 ALTER TABLE `courier` DISABLE KEYS */;
INSERT INTO `courier` VALUES (1,'Шнырь','Курьер','муж',NULL,23,NULL,NULL,NULL,0),(2,'Виталий','Блекхол','муж',NULL,45,NULL,NULL,NULL,10000),(3,'Олег','Бочаров','муж',NULL,33,NULL,NULL,NULL,50000),(4,'Олег','Иванов','муж',NULL,18,NULL,NULL,NULL,10000),(5,'Димитрий','Степанько','муж',NULL,19,NULL,NULL,NULL,0),(6,'Степан','Лентяев','муж',NULL,16,NULL,NULL,NULL,-228);
/*!40000 ALTER TABLE `courier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dispatcher`
--

DROP TABLE IF EXISTS `dispatcher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dispatcher` (
  `dispatcher_id` int NOT NULL AUTO_INCREMENT,
  `dispatcher_name` varchar(45) DEFAULT NULL,
  `dispatcher_surname` varchar(45) DEFAULT NULL,
  `dispatcher_ex` varchar(45) DEFAULT NULL,
  `dispatcher_birth` date DEFAULT NULL,
  `dispatcher_age` int DEFAULT NULL,
  `dispatcher_telephone` varchar(45) DEFAULT NULL,
  `dispatcher_date_start` date DEFAULT NULL,
  `dispatcher_date_end` date DEFAULT NULL,
  `dispatcher_salary` float DEFAULT NULL,
  PRIMARY KEY (`dispatcher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dispatcher`
--

LOCK TABLES `dispatcher` WRITE;
/*!40000 ALTER TABLE `dispatcher` DISABLE KEYS */;
INSERT INTO `dispatcher` VALUES (1,'Виталий','Цаль','муж','1989-07-03',NULL,NULL,NULL,'2022-12-21',2280),(2,'Владимир','Батько','муж','1990-02-03',NULL,NULL,NULL,NULL,1337);
/*!40000 ALTER TABLE `dispatcher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `executive`
--

DROP TABLE IF EXISTS `executive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `executive` (
  `executive_id` int NOT NULL AUTO_INCREMENT,
  `executive_name` varchar(45) DEFAULT NULL,
  `executive_surname` varchar(45) DEFAULT NULL,
  `executive_ex` varchar(45) DEFAULT NULL,
  `executive_birth` date DEFAULT NULL,
  `executive_age` int DEFAULT NULL,
  `executive_date_end` date DEFAULT NULL,
  `executive_salary` float DEFAULT NULL,
  PRIMARY KEY (`executive_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `executive`
--

LOCK TABLES `executive` WRITE;
/*!40000 ALTER TABLE `executive` DISABLE KEYS */;
INSERT INTO `executive` VALUES (1,'Владелец','Неприкасаемый','муж','1981-01-01',NULL,NULL,222222);
/*!40000 ALTER TABLE `executive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `external_user`
--

DROP TABLE IF EXISTS `external_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `external_user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `ex_user_password` varchar(255) DEFAULT NULL,
  `ex_user_login` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `external_user`
--

LOCK TABLES `external_user` WRITE;
/*!40000 ALTER TABLE `external_user` DISABLE KEYS */;
INSERT INTO `external_user` VALUES (1,'111','wewe'),(2,'222','ivan'),(3,'333','mixa');
/*!40000 ALTER TABLE `external_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `internal_user`
--

DROP TABLE IF EXISTS `internal_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `internal_user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `in_user_password` varchar(255) DEFAULT NULL,
  `in_user_login` varchar(32) DEFAULT NULL,
  `user_group` varchar(45) DEFAULT NULL,
  `owner_courier_id` int DEFAULT NULL,
  `owner_dispatcher_id` int DEFAULT NULL,
  `owner_executive_id` int DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `user_owner_id_idx` (`owner_courier_id`),
  KEY `owner_dispatcher_id_idx` (`owner_dispatcher_id`),
  KEY `owner_executive_id_idx` (`owner_executive_id`),
  CONSTRAINT `owner_courier_id` FOREIGN KEY (`owner_courier_id`) REFERENCES `courier` (`courier_id`),
  CONSTRAINT `owner_dispatcher_id` FOREIGN KEY (`owner_dispatcher_id`) REFERENCES `dispatcher` (`dispatcher_id`),
  CONSTRAINT `owner_executive_id` FOREIGN KEY (`owner_executive_id`) REFERENCES `executive` (`executive_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `internal_user`
--

LOCK TABLES `internal_user` WRITE;
/*!40000 ALTER TABLE `internal_user` DISABLE KEYS */;
INSERT INTO `internal_user` VALUES (1,'123','best_worker','courier',1,NULL,NULL),(2,'snake','solid','dispatcher',NULL,1,NULL),(3,'boss','big','executive',NULL,NULL,1);
/*!40000 ALTER TABLE `internal_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `menu_id` int NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(45) DEFAULT NULL,
  `menu_weight` float DEFAULT NULL,
  `menu_price` float DEFAULT NULL,
  `menu_speciality` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'Маргарита',600,400,NULL),(2,'Пепперони',550,500,NULL),(3,'Легион овощей',450,350,NULL),(4,'Купа Трупа',200,200,'dessert'),(5,'Лимонад',250,150,'drink');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_report`
--

DROP TABLE IF EXISTS `menu_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_report` (
  `menu_report_id` int NOT NULL AUTO_INCREMENT,
  `menu_report_amount` int DEFAULT NULL,
  `menu_report_summary_price` float DEFAULT NULL,
  `menu_report_date` date DEFAULT NULL,
  `menu_id` int NOT NULL,
  PRIMARY KEY (`menu_report_id`),
  KEY `menu_report_menu_id_idx` (`menu_id`),
  CONSTRAINT `menu_report_menu_id` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=249 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_report`
--

LOCK TABLES `menu_report` WRITE;
/*!40000 ALTER TABLE `menu_report` DISABLE KEYS */;
INSERT INTO `menu_report` VALUES (60,1,400,'2017-03-03',1),(61,2,1000,'2017-03-03',2),(62,2,200,'2017-03-03',4),(63,2,350,'2017-03-03',3),(91,33,11550,'2022-03-15',3),(93,1,400,'2022-12-21',1),(94,1,400,'2022-12-21',1),(95,1,400,'2022-12-21',1),(96,1,400,'2022-12-21',1),(97,1,400,'2022-12-21',1),(98,1,400,'2022-12-21',1),(99,2,1000,'2022-12-21',2),(100,1,500,'2022-12-21',2),(101,1,500,'2022-12-21',2),(102,1,500,'2022-12-21',2),(103,1,500,'2022-12-21',2),(104,1,500,'2022-12-21',2),(105,1,500,'2022-12-21',2),(106,1,500,'2022-12-21',2),(107,1,500,'2022-12-21',2),(108,1,500,'2022-12-21',2),(109,3,1050,'2022-12-21',3),(110,5,1000,'2022-12-21',4),(111,1,200,'2022-12-21',4),(112,1,200,'2022-12-21',4),(113,1,200,'2022-12-21',4),(114,1,200,'2022-12-21',4),(115,1,200,'2022-12-21',4),(116,1,200,'2022-12-21',4),(117,1,200,'2022-12-21',4),(118,4,600,'2022-12-21',5),(119,1,400,'2022-12-21',1),(120,1,400,'2022-12-21',1),(121,1,400,'2022-12-21',1),(122,1,400,'2022-12-21',1),(123,1,400,'2022-12-21',1),(124,1,400,'2022-12-21',1),(125,2,1000,'2022-12-21',2),(126,1,500,'2022-12-21',2),(127,1,500,'2022-12-21',2),(128,1,500,'2022-12-21',2),(129,1,500,'2022-12-21',2),(130,1,500,'2022-12-21',2),(131,1,500,'2022-12-21',2),(132,1,500,'2022-12-21',2),(133,1,500,'2022-12-21',2),(134,1,500,'2022-12-21',2),(135,3,1050,'2022-12-21',3),(136,5,1000,'2022-12-21',4),(137,1,200,'2022-12-21',4),(138,1,200,'2022-12-21',4),(139,1,200,'2022-12-21',4),(140,1,200,'2022-12-21',4),(141,1,200,'2022-12-21',4),(142,1,200,'2022-12-21',4),(143,1,200,'2022-12-21',4),(144,4,600,'2022-12-21',5),(145,1,400,'2022-12-21',1),(146,1,400,'2022-12-21',1),(147,1,400,'2022-12-21',1),(148,1,400,'2022-12-21',1),(149,1,400,'2022-12-21',1),(150,1,400,'2022-12-21',1),(151,2,1000,'2022-12-21',2),(152,1,500,'2022-12-21',2),(153,1,500,'2022-12-21',2),(154,1,500,'2022-12-21',2),(155,1,500,'2022-12-21',2),(156,1,500,'2022-12-21',2),(157,1,500,'2022-12-21',2),(158,1,500,'2022-12-21',2),(159,1,500,'2022-12-21',2),(160,1,500,'2022-12-21',2),(161,3,1050,'2022-12-21',3),(162,5,1000,'2022-12-21',4),(163,1,200,'2022-12-21',4),(164,1,200,'2022-12-21',4),(165,1,200,'2022-12-21',4),(166,1,200,'2022-12-21',4),(167,1,200,'2022-12-21',4),(168,1,200,'2022-12-21',4),(169,1,200,'2022-12-21',4),(170,4,600,'2022-12-21',5),(171,1,400,'2022-12-21',1),(172,1,400,'2022-12-21',1),(173,1,400,'2022-12-21',1),(174,1,400,'2022-12-21',1),(175,1,400,'2022-12-21',1),(176,1,400,'2022-12-21',1),(177,2,1000,'2022-12-21',2),(178,1,500,'2022-12-21',2),(179,1,500,'2022-12-21',2),(180,1,500,'2022-12-21',2),(181,1,500,'2022-12-21',2),(182,1,500,'2022-12-21',2),(183,1,500,'2022-12-21',2),(184,1,500,'2022-12-21',2),(185,1,500,'2022-12-21',2),(186,1,500,'2022-12-21',2),(187,3,1050,'2022-12-21',3),(188,5,1000,'2022-12-21',4),(189,1,200,'2022-12-21',4),(190,1,200,'2022-12-21',4),(191,1,200,'2022-12-21',4),(192,1,200,'2022-12-21',4),(193,1,200,'2022-12-21',4),(194,1,200,'2022-12-21',4),(195,1,200,'2022-12-21',4),(196,4,600,'2022-12-21',5),(197,1,400,'2022-12-21',1),(198,1,400,'2022-12-21',1),(199,1,400,'2022-12-21',1),(200,1,400,'2022-12-21',1),(201,1,400,'2022-12-21',1),(202,1,400,'2022-12-21',1),(203,2,1000,'2022-12-21',2),(204,1,500,'2022-12-21',2),(205,1,500,'2022-12-21',2),(206,1,500,'2022-12-21',2),(207,1,500,'2022-12-21',2),(208,1,500,'2022-12-21',2),(209,1,500,'2022-12-21',2),(210,1,500,'2022-12-21',2),(211,1,500,'2022-12-21',2),(212,1,500,'2022-12-21',2),(213,3,1050,'2022-12-21',3),(214,5,1000,'2022-12-21',4),(215,1,200,'2022-12-21',4),(216,1,200,'2022-12-21',4),(217,1,200,'2022-12-21',4),(218,1,200,'2022-12-21',4),(219,1,200,'2022-12-21',4),(220,1,200,'2022-12-21',4),(221,1,200,'2022-12-21',4),(222,4,600,'2022-12-21',5),(223,1,400,'2022-12-21',1),(224,1,400,'2022-12-21',1),(225,1,400,'2022-12-21',1),(226,1,400,'2022-12-21',1),(227,1,400,'2022-12-21',1),(228,1,400,'2022-12-21',1),(229,2,1000,'2022-12-21',2),(230,1,500,'2022-12-21',2),(231,1,500,'2022-12-21',2),(232,1,500,'2022-12-21',2),(233,1,500,'2022-12-21',2),(234,1,500,'2022-12-21',2),(235,1,500,'2022-12-21',2),(236,1,500,'2022-12-21',2),(237,1,500,'2022-12-21',2),(238,1,500,'2022-12-21',2),(239,3,1050,'2022-12-21',3),(240,5,1000,'2022-12-21',4),(241,1,200,'2022-12-21',4),(242,1,200,'2022-12-21',4),(243,1,200,'2022-12-21',4),(244,1,200,'2022-12-21',4),(245,1,200,'2022-12-21',4),(246,1,200,'2022-12-21',4),(247,1,200,'2022-12-21',4),(248,4,600,'2022-12-21',5);
/*!40000 ALTER TABLE `menu_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `new_table`
--

DROP TABLE IF EXISTS `new_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `new_table` (
  `idnew_table` int NOT NULL,
  `timerr` time DEFAULT NULL,
  PRIMARY KEY (`idnew_table`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `new_table`
--

LOCK TABLES `new_table` WRITE;
/*!40000 ALTER TABLE `new_table` DISABLE KEYS */;
INSERT INTO `new_table` VALUES (1,'00:00:01'),(2,'-01:49:53');
/*!40000 ALTER TABLE `new_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_meal`
--

DROP TABLE IF EXISTS `order_meal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_meal` (
  `order_meal_id` int NOT NULL AUTO_INCREMENT,
  `order_meal_amount` int DEFAULT NULL,
  `menu_id` int DEFAULT NULL,
  `order_id` int DEFAULT NULL,
  PRIMARY KEY (`order_meal_id`),
  KEY `pizza_order_meal_id_idx` (`order_id`),
  KEY `menu_order_meal_id_idx` (`menu_id`),
  CONSTRAINT `menu_order_meal_id` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`menu_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `pizza_order_meal_id` FOREIGN KEY (`order_id`) REFERENCES `pizza_order` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_meal`
--

LOCK TABLES `order_meal` WRITE;
/*!40000 ALTER TABLE `order_meal` DISABLE KEYS */;
INSERT INTO `order_meal` VALUES (1,1,1,1),(2,2,1,1),(4,1,1,282),(6,2,2,282),(8,3,3,282),(10,4,5,282),(12,5,4,282),(14,1,1,284),(16,1,2,286),(18,1,1,288),(20,1,1,290),(22,1,1,292),(24,1,1,294),(26,1,4,296),(28,1,4,298),(30,1,4,300),(32,1,4,302),(34,1,4,304),(36,1,2,306),(38,1,2,308),(40,1,2,310),(42,1,2,312),(44,1,2,314),(46,1,2,316),(48,1,2,318),(50,1,2,320),(52,1,4,322),(54,1,4,324);
/*!40000 ALTER TABLE `order_meal` ENABLE KEYS */;
UNLOCK TABLES;

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
  `courier_id` int DEFAULT NULL,
  `dispatcher_id` int NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `courier_id_idx` (`order_id`),
  KEY `client_pizza_order_idx` (`client_id`),
  KEY `dispatcher_pizza_order_idx` (`dispatcher_id`),
  KEY `order_courier_id_idx` (`courier_id`),
  CONSTRAINT `order_client_id` FOREIGN KEY (`client_id`) REFERENCES `client` (`client_id`),
  CONSTRAINT `order_courier_id` FOREIGN KEY (`courier_id`) REFERENCES `courier` (`courier_id`)
) ENGINE=InnoDB AUTO_INCREMENT=325 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pizza_order`
--

LOCK TABLES `pizza_order` WRITE;
/*!40000 ALTER TABLE `pizza_order` DISABLE KEYS */;
INSERT INTO `pizza_order` VALUES (1,'2020-03-01','00:00:00','00:00:00','00:00:00',777,0,'yes','yes',10,1,1,1),(2,'2020-03-02','00:00:00','00:00:00','00:00:00',666,0,'yes','yes',10,2,1,2),(3,'2020-03-03','00:00:00','00:00:00','00:00:00',555,0,'yes','yes',1,3,2,1),(4,'2020-03-04','00:00:00','00:00:00','00:00:00',540,0,'yes','yes',4,4,2,2),(5,'2020-03-05','00:00:00','00:00:00','00:00:00',543,0,'yes','yes',5,2,3,1),(6,'2020-03-06','00:00:00','00:00:00','00:00:00',689,0,'yes','yes',5,2,3,2),(7,'2020-03-07','00:00:00','00:00:00','00:00:00',670,0,'no','no',1,1,4,2),(8,'2020-03-08','00:00:00','00:00:00','00:00:00',650,0,'no','yes',3,3,4,2),(9,'2020-03-09','00:00:00','00:00:00','00:00:00',1999,0,'yes','no',2,4,4,1),(10,'2020-03-10','00:00:00','00:00:00','00:00:00',2000,0,'no','no',1,1,4,2),(11,'2020-03-01','00:00:00','00:00:00','00:00:00',600,0,'yes','yes',1,1,1,1),(12,'2020-03-02','00:00:00','00:00:00','00:00:00',800,0,'yes','yes',2,2,1,2),(13,'2020-03-03','00:00:00','00:00:00','00:00:00',900,0,'yes','yes',3,3,2,1),(14,'2020-03-04','00:00:00','00:00:00','00:00:00',1500,0,'yes','yes',4,4,2,2),(15,'2020-03-05','00:00:00','00:00:00','00:00:00',1400,0,'yes','yes',5,2,3,1),(16,'2020-03-06','00:00:00','00:00:00','00:00:00',1000,0,'yes','yes',5,2,3,2),(17,'2020-03-07','00:00:00','00:00:00','00:00:00',1000,0,'no','no',4,1,4,1),(18,'2020-03-08','00:00:00','00:00:00','00:00:00',1000,0,'no','yes',3,3,4,2),(19,'2020-03-09','00:00:00','00:00:00','00:00:00',1900,0,'yes','no',2,4,4,1),(20,'2020-03-10','00:00:00','00:00:00','00:00:00',400,0,'no','no',1,1,4,2),(21,'2020-03-01','00:00:00','00:00:00','00:00:00',500,0,'yes','yes',1,1,1,1),(22,'2020-03-02','00:00:00','00:00:00','00:00:00',1500,0,'yes','yes',2,2,1,2),(23,'2020-03-03','00:00:00','00:00:00','00:00:00',300,0,'yes','yes',3,3,2,1),(24,'2020-03-04','00:00:00','00:00:00','00:00:00',651,0,'yes','yes',4,4,2,2),(25,'2020-03-05','00:00:00','00:00:00','00:00:00',2000,0,'yes','yes',5,2,3,1),(26,'2020-03-06','00:00:00','00:00:00','00:00:00',350,0,'yes','yes',5,2,3,2),(27,'2020-03-07','00:00:00','00:00:00','00:00:00',500,0,'no','no',4,1,4,1),(28,'2020-03-08','00:00:00','00:00:00','00:00:00',1500,0,'no','yes',3,3,4,2),(29,'2020-03-09','00:00:00','00:00:00','00:00:00',499,0,'yes','no',2,4,4,1),(30,'2020-03-10','00:00:00','00:00:00','00:00:00',760,0,'no','no',1,1,4,2),(31,'2020-03-11','00:00:00','00:00:00','00:00:00',1999,0,'no','yes',1,4,2,1),(32,'2020-03-01','00:00:00','00:00:00','00:00:00',400,0,'yes','yes',1,1,1,1),(33,'2020-03-02','00:00:00','00:00:00','00:00:00',30000,0,'yes','yes',2,2,1,2),(34,'2020-03-03','00:00:00','00:00:00','00:00:00',2000,0,'yes','yes',3,3,2,1),(35,'2020-03-04','00:00:00','00:00:00','00:00:00',450,0,'yes','yes',4,4,2,2),(36,'2020-03-05','00:00:00','00:00:00','00:00:00',650,0,'yes','yes',5,2,3,1),(37,'2020-03-06','00:00:00','00:00:00','00:00:00',500,0,'yes','yes',5,2,3,2),(38,'2020-03-07','00:00:00','00:00:00','00:00:00',499,0,'no','no',4,1,4,1),(39,'2020-03-08','00:00:00','00:00:00','00:00:00',250,0,'no','yes',3,3,4,2),(40,'2020-03-09','00:00:00','00:00:00','00:00:00',450,0,'yes','no',2,4,4,1),(41,'2020-03-10','00:00:00','00:00:00','00:00:00',670,0,'no','no',1,1,4,2),(42,'2020-03-11','00:00:00','00:00:00','00:00:00',890,0,'no','yes',1,4,2,1),(43,'2017-03-01',NULL,NULL,NULL,1,1,'yes','yes',5,1,5,1),(206,'2020-03-05',NULL,NULL,NULL,500,0,'yes','yes',4,2,2,2),(207,'2017-03-28',NULL,NULL,NULL,1400,2,'yes','yes',1,1,1,1),(208,'2017-03-21',NULL,NULL,NULL,1200,3,'yes','yes',5,2,1,2),(209,'2017-03-23',NULL,NULL,NULL,500,2,'yes','yes',5,1,1,1),(210,'2017-03-04',NULL,NULL,NULL,400,1,'yes','yes',5,2,5,2),(211,'2017-03-11',NULL,NULL,NULL,1000,2,'yes','yes',5,1,5,1),(212,'2017-03-11',NULL,NULL,NULL,228,4,'no','no',10,1,3,2),(213,'2022-03-11',NULL,NULL,NULL,228,4,'no','no',NULL,1,3,2),(267,'2022-12-20','23:44:24','23:45:14','00:00:50',60,1,'yes','yes',9,1,1,2),(269,'2022-12-20',NULL,NULL,NULL,45,1,'no','yes',NULL,1,NULL,2),(271,'2022-12-20',NULL,NULL,NULL,45,1,'no','yes',NULL,1,NULL,2),(273,'2022-12-20',NULL,NULL,NULL,45,1,'no','yes',NULL,1,NULL,1),(275,'2022-12-20',NULL,NULL,NULL,50,1,'no','yes',NULL,1,NULL,2),(277,'2022-12-20',NULL,NULL,NULL,45,1,'no','yes',NULL,1,NULL,1),(279,'2022-12-20',NULL,NULL,NULL,25,1,'no','yes',NULL,1,NULL,2),(282,'2022-12-20',NULL,NULL,NULL,415,15,'no','yes',NULL,1,NULL,2),(284,'2022-12-20',NULL,NULL,NULL,50,1,'no','yes',NULL,1,NULL,1),(286,'2022-12-20',NULL,NULL,NULL,60,1,'no','yes',NULL,1,NULL,2),(288,'2022-12-20',NULL,NULL,NULL,50,1,'no','yes',NULL,1,NULL,2),(290,'2022-12-20',NULL,NULL,NULL,50,1,'no','yes',NULL,1,NULL,1),(292,'2022-12-20',NULL,NULL,NULL,50,1,'no','yes',NULL,1,NULL,2),(294,'2022-12-20',NULL,NULL,NULL,50,1,'no','yes',NULL,1,NULL,1),(296,'2022-12-20',NULL,NULL,NULL,30,1,'no','yes',NULL,1,NULL,2),(298,'2022-12-20',NULL,NULL,NULL,30,1,'no','yes',NULL,1,NULL,2),(300,'2022-12-20',NULL,NULL,NULL,30,1,'no','yes',NULL,1,NULL,1),(302,'2022-12-20',NULL,NULL,NULL,30,1,'no','yes',NULL,1,NULL,2),(304,'2022-12-20',NULL,NULL,NULL,30,1,'no','yes',NULL,1,NULL,1),(306,'2022-12-20',NULL,NULL,NULL,60,1,'no','yes',NULL,1,NULL,2),(308,'2022-12-20',NULL,NULL,NULL,60,1,'no','yes',NULL,1,NULL,2),(310,'2022-12-20',NULL,NULL,NULL,60,1,'no','yes',NULL,1,NULL,1),(312,'2022-12-20',NULL,NULL,NULL,60,1,'no','yes',NULL,1,NULL,1),(314,'2022-12-20',NULL,NULL,NULL,60,1,'no','yes',NULL,1,NULL,1),(316,'2022-12-20',NULL,NULL,NULL,60,1,'no','yes',NULL,1,NULL,2),(318,'2022-12-20',NULL,NULL,NULL,60,1,'no','yes',NULL,1,NULL,1),(320,'2022-12-20',NULL,NULL,NULL,60,1,'no','yes',NULL,1,NULL,1),(322,'2022-12-20',NULL,NULL,NULL,30,1,'no','yes',NULL,1,NULL,2),(324,'2022-12-20',NULL,NULL,NULL,30,1,'no','yes',NULL,1,NULL,1);
/*!40000 ALTER TABLE `pizza_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profit_report`
--

DROP TABLE IF EXISTS `profit_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profit_report` (
  `profit_report_id` int NOT NULL AUTO_INCREMENT,
  `profit` double DEFAULT NULL,
  `courier_salary` double DEFAULT NULL,
  `dispatcher_salary` double DEFAULT NULL,
  `executive_salary` double DEFAULT NULL,
  `total` double DEFAULT NULL,
  `profit_report_date` date DEFAULT NULL,
  PRIMARY KEY (`profit_report_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profit_report`
--

LOCK TABLES `profit_report` WRITE;
/*!40000 ALTER TABLE `profit_report` DISABLE KEYS */;
INSERT INTO `profit_report` VALUES (1,71700,69772,3617,222222,-223911,'2022-12-21'),(2,1950,69772,3617,222222,-293661,'2017-03-21'),(3,0,69772,3617,222222,-295611,'2022-11-21');
/*!40000 ALTER TABLE `profit_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'toto_pizza'
--

--
-- Dumping routines for database 'toto_pizza'
--
/*!50003 DROP PROCEDURE IF EXISTS `money` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `money`(mon integer, yea integer)
BEGIN
    DECLARE plus int DEFAULT 0;
    DECLARE c_salary int;
    DECLARE d_salary int;
    DECLARE e_salary int;
    DECLARE total int DEFAULT 0;
    
    SELECT SUM(menu_report_summary_price) INTO plus FROM menu_report WHERE YEAR(menu_report_date)=yea AND MONTH(menu_report_date)=mon;
    IF plus is NULL THEN
		SET plus = 0;
    END IF;
    SELECT SUM(courier_salary) INTO c_salary FROM courier;
	SELECT SUM(dispatcher_salary) INTO d_salary FROM dispatcher;
	SELECT SUM(executive_salary) INTO e_salary FROM executive;
    SET total = plus-c_salary-d_salary-e_salary;
    INSERT INTO profit_report VALUES (NULL,plus,c_salary,d_salary,e_salary,total,DATE(CONCAT_WS('-', yea, mon,day(curdate()))));
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `reported` */;
ALTER DATABASE `toto_pizza` CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `reported`(mon integer, yea integer)
BEGIN
	DECLARE done int DEFAULT 0;
    DECLARE me_id int;
    DECLARE m_amount int;
    DECLARE pric int;
    DECLARE s int;
    
    DECLARE A CURSOR FOR SELECT menu_id,order_meal_amount,(menu_price*order_meal_amount) as s 
    FROM menu JOIN order_meal using (menu_id) JOIN pizza_order using(order_id) 
    WHERE YEAR(order_date_create)=yea AND MONTH(order_date_create)=mon;
    
    DECLARE EXIT HANDLER for SQLSTATE '02000' set done=1;
    OPEN A;
    WHILE done=0 DO
		FETCH A INTO me_id,m_amount,s;
        INSERT INTO menu_report VALUES (NULL,m_amount,s,DATE(CONCAT_WS('-', yea, mon,day(curdate()))),me_id);
    END WHILE;
    CLOSE A;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `toto_pizza` CHARACTER SET utf8mb3 COLLATE utf8_general_ci ;

--
-- Final view structure for view `alpha`
--

/*!50001 DROP VIEW IF EXISTS `alpha`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `alpha` AS select count(`pizza_order`.`order_id`) AS `b`,`pizza_order`.`courier_id` AS `courier_id` from `pizza_order` where ((`pizza_order`.`order_date_create` like '2020-%') and (`pizza_order`.`order_status_deliver` = 'yes')) group by `pizza_order`.`courier_id` */;
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

-- Dump completed on 2022-12-22 15:03:11
