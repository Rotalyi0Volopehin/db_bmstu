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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-11  4:11:31
