-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: ai_recommendation_database
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `user_tool_interactions`
--

DROP TABLE IF EXISTS `user_tool_interactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_tool_interactions` (
  `interaction_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `tool_id` int DEFAULT NULL,
  `interaction_type` varchar(255) NOT NULL,
  `interaction_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`interaction_id`),
  KEY `user_id` (`user_id`),
  KEY `tool_id` (`tool_id`),
  CONSTRAINT `user_tool_interactions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `personnel_information_database`.`user` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `user_tool_interactions_ibfk_2` FOREIGN KEY (`tool_id`) REFERENCES `ai_tools` (`tool_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_tool_interactions`
--

LOCK TABLES `user_tool_interactions` WRITE;
/*!40000 ALTER TABLE `user_tool_interactions` DISABLE KEYS */;
INSERT INTO `user_tool_interactions` VALUES (1,1,1,'view','2024-10-29 05:52:11'),(2,1,2,'usage','2024-10-29 05:52:11'),(3,2,3,'usage','2024-10-29 05:52:11'),(4,3,4,'like','2024-10-29 05:52:11'),(5,4,1,'view','2024-10-29 05:52:11'),(6,5,3,'rating','2024-10-29 05:52:11'),(7,6,2,'usage','2024-10-29 05:52:11');
/*!40000 ALTER TABLE `user_tool_interactions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-29 11:33:35
