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
-- Table structure for table `external_user`
--

DROP TABLE IF EXISTS `external_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `external_user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `ex_user_password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `user_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ex_user_login` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `external_user`
--

LOCK TABLES `external_user` WRITE;
/*!40000 ALTER TABLE `external_user` DISABLE KEYS */;
INSERT INTO `external_user` VALUES (1,'111','шнырь','111'),(2,'222','клиент','222');
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
  `in_user_password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `user_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `in_user_login` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `user_group` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `internal_user`
--

LOCK TABLES `internal_user` WRITE;
/*!40000 ALTER TABLE `internal_user` DISABLE KEYS */;
INSERT INTO `internal_user` VALUES (1,'321','vasya','vasya','employee'),(2,'322','cool_admin','admin','admin'),(3,'323','papich','best','employee');
/*!40000 ALTER TABLE `internal_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `new_table`
--

DROP TABLE IF EXISTS `new_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `new_table` (
  `idnew_table` int NOT NULL,
  PRIMARY KEY (`idnew_table`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `new_table`
--

LOCK TABLES `new_table` WRITE;
/*!40000 ALTER TABLE `new_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `new_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_list`
--

DROP TABLE IF EXISTS `order_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_list` (
  `orders_list_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int DEFAULT NULL,
  `prod_id` int DEFAULT NULL,
  `prod_amount` int DEFAULT NULL,
  PRIMARY KEY (`orders_list_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_list`
--

LOCK TABLES `order_list` WRITE;
/*!40000 ALTER TABLE `order_list` DISABLE KEYS */;
INSERT INTO `order_list` VALUES (1,3,1,2),(2,3,2,2),(3,11,1,1),(4,14,1,3),(5,15,1,2);
/*!40000 ALTER TABLE `order_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_report`
--

DROP TABLE IF EXISTS `product_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_report` (
  `prod_id` int DEFAULT NULL,
  `prod_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `prod_measure` double DEFAULT NULL,
  `prod_col` int DEFAULT NULL,
  `prod_price` int DEFAULT NULL,
  `rep_year` int DEFAULT NULL,
  `rep_month` int DEFAULT NULL,
  `rep_id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`rep_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_report`
--

LOCK TABLES `product_report` WRITE;
/*!40000 ALTER TABLE `product_report` DISABLE KEYS */;
INSERT INTO `product_report` VALUES (1,'Говядина',0.5,12,45,NULL,NULL,1),(2,'Рис',0.3,13,35,NULL,NULL,2),(3,'Вкусный сок',0.4,11,55,NULL,NULL,3),(1,'Говядина',0.5,12,45,12,12,4),(2,'Рис',0.3,15,35,12,12,5),(3,'Вкусный сок',0.4,2,55,12,12,6),(1,'Говядина',0.5,12,45,2022,1,7),(2,'Рис',0.3,15,35,2022,1,8),(3,'Вкусный сок',0.4,2,55,2022,1,9),(1,'Говядина',0.5,12,45,2022,2,10),(2,'Рис',0.3,15,35,2022,2,11),(3,'Вкусный сок',0.4,2,55,2022,2,12),(1,'Говядина',0.5,12,45,13,14,31),(2,'Рис',0.3,15,35,13,15,32),(3,'Вкусный сок',0.4,2,55,13,14,33);
/*!40000 ALTER TABLE `product_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supermarket`
--

DROP TABLE IF EXISTS `supermarket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supermarket` (
  `prod_id` int NOT NULL AUTO_INCREMENT,
  `prod_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `prod_measure` double DEFAULT NULL,
  `prod_price` int DEFAULT NULL,
  `prod_col` int DEFAULT NULL,
  PRIMARY KEY (`prod_id`)
) ENGINE=InnoDB AUTO_INCREMENT=229 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supermarket`
--

LOCK TABLES `supermarket` WRITE;
/*!40000 ALTER TABLE `supermarket` DISABLE KEYS */;
INSERT INTO `supermarket` VALUES (1,'Говядина',0.5,45,12),(2,'Рис',0.3,35,15),(3,'Вкусный сок',0.4,55,2),(228,'Сломай логины',NULL,NULL,NULL);
/*!40000 ALTER TABLE `supermarket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_orders`
--

DROP TABLE IF EXISTS `user_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_orders`
--

LOCK TABLES `user_orders` WRITE;
/*!40000 ALTER TABLE `user_orders` DISABLE KEYS */;
INSERT INTO `user_orders` VALUES (2,NULL,'2022-12-02'),(3,2,'2022-12-02'),(4,2,'2022-12-01'),(5,2,'2022-12-01'),(6,2,'2022-12-01'),(7,2,'2022-12-01'),(8,2,'2022-12-01'),(9,2,'2022-12-01'),(10,2,'2022-12-01'),(11,2,'2022-12-01'),(12,2,'2022-12-01'),(13,2,'2022-12-01'),(14,2,'2022-12-01'),(15,2,'2022-12-01');
/*!40000 ALTER TABLE `user_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'sem'
--

--
-- Dumping routines for database 'sem'
--
/*!50003 DROP PROCEDURE IF EXISTS `news` */;
ALTER DATABASE `sem` CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `news`(mon integer, yea integer)
BEGIN
	DECLARE done int DEFAULT 0;
    DECLARE pprod_id int;
    DECLARE pprod_measure double;
    DECLARE pprod_name varchar(45);
    DECLARE pprod_col int;
    DECLARE pprod_price int;
    
    DECLARE A CURSOR FOR SELECT DISTINCT prod_id, supermarket.prod_name, supermarket.prod_measure, supermarket.prod_col, supermarket.prod_price
	FROM product_report JOIN supermarket using (prod_id);
    
    DECLARE EXIT HANDLER for SQLSTATE '02000' set done=1;
    OPEN A;
    WHILE done=0 DO
		FETCH A INTO pprod_id, pprod_name, pprod_measure, pprod_col, pprod_price;
        INSERT INTO product_report VALUES (pprod_id, pprod_name, pprod_measure, pprod_col, pprod_price, yea, mon, NULL);
    END WHILE;
    CLOSE A;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `sem` CHARACTER SET utf8mb3 COLLATE utf8_general_ci ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-01 22:59:31
