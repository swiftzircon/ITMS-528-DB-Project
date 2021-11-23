-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: training_records
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `cert`
--

DROP TABLE IF EXISTS `cert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cert` (
  `cert_ID` int NOT NULL,
  `cert_Name` text,
  `cert_provider` text,
  `cert_desc` text,
  PRIMARY KEY (`cert_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cert`
--

LOCK TABLES `cert` WRITE;
/*!40000 ALTER TABLE `cert` DISABLE KEYS */;
INSERT INTO `cert` VALUES (1,'CompTia+ A+','CompTia','https://www.comptia.org/certifications/a'),(2,'Google IT Cert','Google','https://grow.google/intl/ssa/google-certificates'),(3,'CompTia Security+','CompTia','https://www.comptia.org/certifications/security'),(4,'CISSP','(ISC)2','Cybersecurity Strategy and Implementation|https://www.isc2.org/Certifications/CISSP#'),(5,'CISM','ISACA','https://www.isaca.org/credentialing/cism'),(6,'SSCP','(ISC)2','System Security Certified Practioner|https://www.isc2.org/Certifications/SSCP'),(7,'policy training','on-site','general awareness training');
/*!40000 ALTER TABLE `cert` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `controls`
--

DROP TABLE IF EXISTS `controls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `controls` (
  `control_ID` int NOT NULL,
  `control_title` text,
  `control_manager_roleID` int NOT NULL,
  `control_description` text,
  PRIMARY KEY (`control_ID`),
  KEY `control_manager_roleID_idx` (`control_manager_roleID`),
  CONSTRAINT `control_manager_roleID` FOREIGN KEY (`control_manager_roleID`) REFERENCES `roles` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `controls`
--

LOCK TABLES `controls` WRITE;
/*!40000 ALTER TABLE `controls` DISABLE KEYS */;
INSERT INTO `controls` VALUES (1,'AC-2',1,'Account Managment'),(2,'AC-5',3,'Separation of Duties'),(3,'AC-8',3,'System Use Notification'),(4,'AC-7',1,'Unsuccessful Logon Attempt'),(5,'AT-4',3,'Security Training Records'),(6,'AU-8',2,'Time Stamps'),(7,'CA-5',2,'Plan Of Action/Milestones');
/*!40000 ALTER TABLE `controls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `role_id` int NOT NULL,
  `role_title` text,
  `role_desc` text,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'DB_Admin','full access'),(2,'DB_Manager','DB functions'),(3,'DB_Designer','create + reverse engineering'),(4,'DB_BasicUser','view DB');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `template`
--

DROP TABLE IF EXISTS `template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `template` (
  `reportID` bigint NOT NULL,
  `userID` int DEFAULT NULL,
  `role_ID` int DEFAULT NULL,
  `certificationID` int DEFAULT NULL,
  `date_of_completion` datetime DEFAULT NULL,
  `report_date` datetime DEFAULT NULL,
  PRIMARY KEY (`reportID`),
  KEY `userID_idx` (`userID`),
  KEY `certificationID_idx` (`certificationID`),
  CONSTRAINT `certificationID` FOREIGN KEY (`certificationID`) REFERENCES `cert` (`cert_ID`),
  CONSTRAINT `userID` FOREIGN KEY (`userID`) REFERENCES `users` (`user_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `template`
--

LOCK TABLES `template` WRITE;
/*!40000 ALTER TABLE `template` DISABLE KEYS */;
INSERT INTO `template` VALUES (1,1,1,5,'2000-05-05 00:00:00','2000-05-06 00:00:00'),(2,1,1,4,'2002-10-30 00:00:00','2002-10-30 00:00:00'),(3,2,1,5,'2000-04-13 00:00:00','2000-06-08 00:00:00'),(4,2,1,4,'2002-10-30 00:00:00','2002-10-30 00:00:00'),(5,3,2,6,'2001-06-06 00:00:00','2001-09-24 00:00:00'),(6,3,2,3,'2001-01-13 00:00:00','2001-09-24 00:00:00'),(7,4,2,6,'2002-08-02 00:00:00','2002-10-16 00:00:00'),(8,4,2,3,'2002-05-25 00:00:00','2002-10-16 00:00:00'),(9,5,3,1,'2002-04-04 00:00:00','2002-10-16 00:00:00'),(10,5,3,2,'2002-04-04 00:00:00','2002-10-16 00:00:00'),(11,6,3,1,'2000-09-05 00:00:00','2001-11-28 00:00:00'),(12,6,3,2,'2001-06-15 00:00:00','2001-11-28 00:00:00'),(13,7,3,1,'2000-04-30 00:00:00','2001-01-31 00:00:00'),(14,7,3,2,'2000-12-18 00:00:00','2001-01-31 00:00:00');
/*!40000 ALTER TABLE `template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_ID` int NOT NULL,
  `user_fname` text,
  `user_lname` text,
  `user_startDate` datetime DEFAULT NULL,
  `user_roleID` int DEFAULT NULL,
  PRIMARY KEY (`user_ID`),
  KEY `user_roleID_idx` (`user_roleID`),
  CONSTRAINT `user_roleID` FOREIGN KEY (`user_roleID`) REFERENCES `roles` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Piotr','Rajchel','2000-05-05 00:00:00',1),(2,'Yuping','Jiang','2000-07-06 00:00:00',1),(3,'Anthea','Gonzalez','2001-09-23 00:00:00',2),(4,'Sai','Teja Raju','2002-10-15 00:00:00',2),(5,'Kemelbek','Tashkulov','2002-10-15 00:00:00',3),(6,'Magdalena','Boufal','2001-11-27 00:00:00',3),(7,'Muhammad','Zahid','2001-01-30 00:00:00',3);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-23 16:19:45
