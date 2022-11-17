CREATE DATABASE  IF NOT EXISTS `sem` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `sem`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: sem
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
-- Table structure for table `product_report`
--

DROP TABLE IF EXISTS `product_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_report` (
  `prod_id` int DEFAULT NULL,
  `prod_name` varchar(45) DEFAULT NULL,
  `prod_measure` double DEFAULT NULL,
  `prod_col` int DEFAULT NULL,
  `prod_price` int DEFAULT NULL,
  `rep_year` int DEFAULT NULL,
  `rep_month` int DEFAULT NULL,
  `rep_id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`rep_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_report`
--

LOCK TABLES `product_report` WRITE;
/*!40000 ALTER TABLE `product_report` DISABLE KEYS */;
INSERT INTO `product_report` VALUES (1,'Говядина',0.5,12,45,NULL,NULL,1),(2,'Рис',0.3,13,35,NULL,NULL,2),(3,'Вкусный сок',0.4,11,55,NULL,NULL,3),(1,'Говядина',0.5,12,45,12,12,4),(2,'Рис',0.3,15,35,12,12,5),(3,'Вкусный сок',0.4,2,55,12,12,6),(1,'Говядина',0.5,12,45,2022,1,7),(2,'Рис',0.3,15,35,2022,1,8),(3,'Вкусный сок',0.4,2,55,2022,1,9),(1,'Говядина',0.5,12,45,2022,2,10),(2,'Рис',0.3,15,35,2022,2,11),(3,'Вкусный сок',0.4,2,55,2022,2,12),(1,'Говядина',0.5,12,45,13,14,31),(2,'Рис',0.3,15,35,13,15,32),(3,'Вкусный сок',0.4,2,55,13,14,33);
/*!40000 ALTER TABLE `product_report` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-18  0:10:03
