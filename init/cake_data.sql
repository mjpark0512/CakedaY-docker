-- MySQL dump 10.13  Distrib 8.0.41, for Linux (aarch64)
--
-- Host: localhost    Database: cakeday_db
-- ------------------------------------------------------
-- Server version	8.0.41

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cake`
--

DROP TABLE IF EXISTS `cake`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cake` (
  `cake_id` int NOT NULL AUTO_INCREMENT,
  `seller_id` int NOT NULL,
  `category_id` int NOT NULL,
  `cake_name` varchar(50) NOT NULL,
  `description` text,
  `cake_img` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`cake_id`),
  KEY `seller_id` (`seller_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `cake_ibfk_1` FOREIGN KEY (`seller_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `cake_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cake`
--

LOCK TABLES `cake` WRITE;
/*!40000 ALTER TABLE `cake` DISABLE KEYS */;
/*!40000 ALTER TABLE `cake` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cake_filling`
--

DROP TABLE IF EXISTS `cake_filling`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cake_filling` (
  `cake_filling_id` int NOT NULL AUTO_INCREMENT,
  `cake_filling_name` varchar(20) NOT NULL,
  PRIMARY KEY (`cake_filling_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cake_filling`
--

LOCK TABLES `cake_filling` WRITE;
/*!40000 ALTER TABLE `cake_filling` DISABLE KEYS */;
/*!40000 ALTER TABLE `cake_filling` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cake_shape`
--

DROP TABLE IF EXISTS `cake_shape`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cake_shape` (
  `cake_shape_id` int NOT NULL AUTO_INCREMENT,
  `cake_shape_name` varchar(20) NOT NULL,
  PRIMARY KEY (`cake_shape_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cake_shape`
--

LOCK TABLES `cake_shape` WRITE;
/*!40000 ALTER TABLE `cake_shape` DISABLE KEYS */;
/*!40000 ALTER TABLE `cake_shape` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cake_size`
--

DROP TABLE IF EXISTS `cake_size`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cake_size` (
  `cake_size_id` int NOT NULL AUTO_INCREMENT,
  `cake_size_name` varchar(20) NOT NULL,
  PRIMARY KEY (`cake_size_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cake_size`
--

LOCK TABLES `cake_size` WRITE;
/*!40000 ALTER TABLE `cake_size` DISABLE KEYS */;
/*!40000 ALTER TABLE `cake_size` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cake_type`
--

DROP TABLE IF EXISTS `cake_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cake_type` (
  `cake_type_id` int NOT NULL AUTO_INCREMENT,
  `cake_type_name` varchar(20) NOT NULL,
  PRIMARY KEY (`cake_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cake_type`
--

LOCK TABLES `cake_type` WRITE;
/*!40000 ALTER TABLE `cake_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `cake_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cake_variants`
--

DROP TABLE IF EXISTS `cake_variants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cake_variants` (
  `variant_id` int NOT NULL AUTO_INCREMENT,
  `cake_id` int NOT NULL,
  `cake_shape_id` int NOT NULL,
  `cake_type_id` int NOT NULL,
  `cake_size_id` int NOT NULL,
  `cake_filling_id` int NOT NULL,
  PRIMARY KEY (`variant_id`),
  KEY `cake_id` (`cake_id`),
  KEY `cake_shape_id` (`cake_shape_id`),
  KEY `cake_type_id` (`cake_type_id`),
  KEY `cake_size_id` (`cake_size_id`),
  KEY `cake_filling_id` (`cake_filling_id`),
  CONSTRAINT `cake_variants_ibfk_1` FOREIGN KEY (`cake_id`) REFERENCES `cake` (`cake_id`),
  CONSTRAINT `cake_variants_ibfk_2` FOREIGN KEY (`cake_shape_id`) REFERENCES `cake_shape` (`cake_shape_id`),
  CONSTRAINT `cake_variants_ibfk_3` FOREIGN KEY (`cake_type_id`) REFERENCES `cake_type` (`cake_type_id`),
  CONSTRAINT `cake_variants_ibfk_4` FOREIGN KEY (`cake_size_id`) REFERENCES `cake_size` (`cake_size_id`),
  CONSTRAINT `cake_variants_ibfk_5` FOREIGN KEY (`cake_filling_id`) REFERENCES `cake_filling` (`cake_filling_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cake_variants`
--

LOCK TABLES `cake_variants` WRITE;
/*!40000 ALTER TABLE `cake_variants` DISABLE KEYS */;
/*!40000 ALTER TABLE `cake_variants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(50) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorite`
--

DROP TABLE IF EXISTS `favorite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorite` (
  `user_id` int NOT NULL,
  `cake_id` int NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`,`cake_id`),
  KEY `cake_id` (`cake_id`),
  CONSTRAINT `favorite_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `favorite_ibfk_2` FOREIGN KEY (`cake_id`) REFERENCES `cake` (`cake_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorite`
--

LOCK TABLES `favorite` WRITE;
/*!40000 ALTER TABLE `favorite` DISABLE KEYS */;
/*!40000 ALTER TABLE `favorite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `seller_id` int NOT NULL,
  `user_id` int NOT NULL,
  `pickup_date` date NOT NULL,
  `pickup_time` time NOT NULL,
  `lettering_message` text,
  `memo` text,
  `sample_img` varchar(255) DEFAULT NULL,
  `order_state` enum('ì˜ˆì•½ìš”ì²­','ì ‘ìˆ˜ì™„ë£Œ','í”½ì—…ì™„ë£Œ','ì·¨ì†Œ') NOT NULL,
  `total_price` decimal(10,2) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`order_id`),
  KEY `seller_id` (`seller_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`seller_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `order_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_detail` (
  `order_detail_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `cake_id` int NOT NULL,
  `variant_id` int NOT NULL,
  `quantity` int NOT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`order_detail_id`),
  KEY `order_id` (`order_id`),
  KEY `cake_id` (`cake_id`),
  KEY `variant_id` (`variant_id`),
  CONSTRAINT `order_detail_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`),
  CONSTRAINT `order_detail_ibfk_2` FOREIGN KEY (`cake_id`) REFERENCES `cake` (`cake_id`),
  CONSTRAINT `order_detail_ibfk_3` FOREIGN KEY (`variant_id`) REFERENCES `cake_variants` (`variant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_detail`
--

LOCK TABLES `order_detail` WRITE;
/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `payment_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `owner_id` int NOT NULL,
  `user_id` int NOT NULL,
  `payment_method` enum('ì¹´ì¹´ì˜¤íŽ˜ì´','ë¬´í†µìž¥ìž…ê¸ˆ','ì¹´ë“œ') NOT NULL,
  `payment_status` enum('ëŒ€ê¸°','ì™„ë£Œ','í™˜ë¶ˆ') NOT NULL,
  `payment_amount` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `order_id` (`order_id`),
  KEY `owner_id` (`owner_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`),
  CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`owner_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `payment_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recommendation`
--

DROP TABLE IF EXISTS `recommendation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recommendation` (
  `rec_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `cake_id` int NOT NULL,
  `algorithm_type` enum('ê¸°ë³¸','ì¸ê¸°','ë§žì¶¤í˜•') DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`rec_id`),
  KEY `user_id` (`user_id`),
  KEY `cake_id` (`cake_id`),
  CONSTRAINT `recommendation_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `recommendation_ibfk_2` FOREIGN KEY (`cake_id`) REFERENCES `cake` (`cake_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recommendation`
--

LOCK TABLES `recommendation` WRITE;
/*!40000 ALTER TABLE `recommendation` DISABLE KEYS */;
/*!40000 ALTER TABLE `recommendation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `review_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `cake_id` int NOT NULL,
  `shop_id` int DEFAULT NULL,
  `rating` double NOT NULL,
  `comment` text,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`review_id`),
  KEY `user_id` (`user_id`),
  KEY `cake_id` (`cake_id`),
  KEY `shop_id` (`shop_id`),
  CONSTRAINT `review_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `review_ibfk_2` FOREIGN KEY (`cake_id`) REFERENCES `cake` (`cake_id`),
  CONSTRAINT `review_ibfk_3` FOREIGN KEY (`shop_id`) REFERENCES `shop` (`shop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop`
--

DROP TABLE IF EXISTS `shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop` (
  `shop_id` int NOT NULL AUTO_INCREMENT,
  `owner_id` int NOT NULL,
  `shop_name` varchar(20) NOT NULL,
  `shop_number` varchar(11) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`shop_id`),
  KEY `owner_id` (`owner_id`),
  CONSTRAINT `shop_ibfk_1` FOREIGN KEY (`owner_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop`
--

LOCK TABLES `shop` WRITE;
/*!40000 ALTER TABLE `shop` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `phone_number` varchar(11) NOT NULL,
  `favorite_area` varchar(5) NOT NULL,
  `nickname` varchar(20) NOT NULL,
  `profile_img` varchar(255) DEFAULT NULL,
  `user_name` varchar(20) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'01012345678','','','strawberry_profile.jpg','','2025-04-02 05:41:20','2025-04-02 05:41:20'),(2,'01023456789','','','dino_profile.jpg','','2025-04-02 05:41:20','2025-04-02 05:41:20'),(3,'01034567890','','','matcha_profile.jpg','','2025-04-02 05:41:20','2025-04-02 05:41:20');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_role` (
  `user_id` int NOT NULL,
  `role` enum('buyer','seller') NOT NULL,
  `create_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_role_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-02  5:51:13
