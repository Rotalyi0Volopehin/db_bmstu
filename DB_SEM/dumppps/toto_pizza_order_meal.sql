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
-- Table structure for table `order_meal`
--

DROP TABLE IF EXISTS `order_meal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_meal` (
  `order_meal_id` int NOT NULL AUTO_INCREMENT,
  `order_meal_amount` int DEFAULT NULL,
  `menu_id` int NOT NULL,
  `order_id` int NOT NULL,
  PRIMARY KEY (`order_meal_id`),
  KEY `order_meal_pizza_order_id_idx` (`order_id`),
  KEY `order_meal_menu_id_idx` (`menu_id`),
  CONSTRAINT `order_meal_menu_id` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`menu_id`),
  CONSTRAINT `order_meal_pizza_order_id` FOREIGN KEY (`order_id`) REFERENCES `pizza_order` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_meal`
--

LOCK TABLES `order_meal` WRITE;
/*!40000 ALTER TABLE `order_meal` DISABLE KEYS */;
INSERT INTO `order_meal` VALUES (11,1,1,210),(12,2,2,208),(13,1,4,208),(105,1,4,208),(106,1,3,208),(108,1,3,210);
/*!40000 ALTER TABLE `order_meal` ENABLE KEYS */;
UNLOCK TABLES;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `order_meal_AFTER_INSERT` AFTER INSERT ON `order_meal` FOR EACH ROW BEGIN
 DECLARE m_id int;
 DECLARE am int;
 
 DECLARE ydat int;
 DECLARE mdat int;
 
 DECLARE yydat int;
 DECLARE mmdat int;
 
 DECLARE s int;

 SELECT DISTINCT year(menu_report_date) INTO ydat FROM menu_report;
 SELECT DISTINCT month(menu_report_date) INTO mdat FROM menu_report;

 SELECT DISTINCT year(order_date_create) INTO yydat FROM pizza_order JOIN order_meal using (order_id) WHERE (order_id = new.order_id);
 SELECT DISTINCT month(order_date_create) INTO mmdat FROM pizza_order JOIN order_meal using (order_id) WHERE (order_id = new.order_id);
 

 IF yydat=ydat AND mmdat=mdat THEN
	IF (new.menu_id IN (SELECT menu_id FROM menu_report WHERE year(menu_report_date)=ydat AND month(menu_report_date)=mdat)) THEN /*проверка на новый menu_id в таблице menu_report*/
		SELECT menu_report_amount INTO am FROM menu_report WHERE menu_id = new.menu_id;
		UPDATE menu_report SET menu_report_amount=am+new.order_meal_amount WHERE menu_id=new.menu_id;
	ELSE
		SELECT DISTINCT menu_price INTO s FROM menu WHERE menu_id = new.menu_id ;
		INSERT INTO menu_report VALUES (NULL,new.order_meal_amount,s*new.order_meal_amount,DATE(CONCAT_WS('-', yydat, mmdat,day(curdate()))),new.menu_id);
    END IF;
END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `toto_pizza` CHARACTER SET utf8mb3 COLLATE utf8_general_ci ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-11  4:11:31
