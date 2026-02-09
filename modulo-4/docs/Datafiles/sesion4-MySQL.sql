CREATE DATABASE  IF NOT EXISTS `sesion4` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `sesion4`;
-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: sesion4
-- ------------------------------------------------------
-- Server version	8.0.43

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
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brands` (
  `Id` int NOT NULL,
  `nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brands`
--

LOCK TABLES `brands` WRITE;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
INSERT INTO `brands` VALUES (1,'Toyota'),(2,'Honda'),(3,'Ford'),(4,'Chevrolet'),(5,'Nissan'),(6,'Hyundai'),(7,'Volkswagen'),(8,'Mazda'),(9,'Subaru'),(10,'Kia'),(11,'BMW'),(12,'Mercedes-Benz'),(13,'Audi'),(14,'Lexus'),(15,'Ford'),(16,'Chevrolet'),(17,'Tesla'),(18,'Toyota'),(19,'Jeep'),(20,'Nissan');
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cars`
--

DROP TABLE IF EXISTS `cars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cars` (
  `Id` int NOT NULL,
  `BrandId` int NOT NULL,
  `ModelId` int NOT NULL,
  `RentalsAverageByMonth` int NOT NULL,
  `HourPrice` decimal(19,4) NOT NULL,
  `Image` varchar(50) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_Cars_Brands` (`BrandId`),
  KEY `FK_Cars_Model` (`ModelId`),
  CONSTRAINT `FK_Cars_Brands` FOREIGN KEY (`BrandId`) REFERENCES `brands` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_Cars_Model` FOREIGN KEY (`ModelId`) REFERENCES `model` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cars`
--

LOCK TABLES `cars` WRITE;
/*!40000 ALTER TABLE `cars` DISABLE KEYS */;
INSERT INTO `cars` VALUES (1,1,1,50,80.0000,'camry.png'),(2,2,2,45,75.0000,'civic.png'),(3,3,3,60,70.0000,'escape.png'),(4,4,4,55,65.0000,'malibu.png'),(5,5,5,52,60.0000,'altima.png'),(6,6,6,48,55.0000,'elantra.png'),(7,7,7,58,50.0000,'jetta.png'),(8,8,8,51,45.0000,'mazda3.png'),(9,9,9,53,40.0000,'impreza.png'),(10,10,10,47,35.0000,'forte.png'),(11,11,11,70,80.0000,'3series.png'),(12,12,12,75,75.0000,'cclass.png'),(13,13,13,72,70.0000,'a4.png'),(14,14,14,78,65.0000,'is.png'),(15,15,15,85,60.0000,'mustang.png'),(16,16,16,80,55.0000,'camaro.png'),(17,17,17,90,50.0000,'model3.png'),(18,18,18,65,45.0000,'rav4.png'),(19,19,19,68,40.0000,'cherokee.png'),(20,20,20,62,35.0000,'rogue.png'),(24,4,21,20,112.0000,'blazer.png'),(25,11,22,32,120.0000,'7series.png');
/*!40000 ALTER TABLE `cars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model`
--

DROP TABLE IF EXISTS `model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model` (
  `Id` int NOT NULL,
  `Nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model`
--

LOCK TABLES `model` WRITE;
/*!40000 ALTER TABLE `model` DISABLE KEYS */;
INSERT INTO `model` VALUES (1,'Camry'),(2,'Civic'),(3,'Escape'),(4,'Malibu'),(5,'Altima'),(6,'Elantra'),(7,'Jetta'),(8,'Mazda3'),(9,'Impreza'),(10,'Forte'),(11,'3Series'),(12,'CClass'),(13,'A4'),(14,'IS'),(15,'Mustang'),(16,'Camaro'),(17,'Model3'),(18,'Rav4'),(19,'Cherokee'),(20,'Rogue'),(21,'Blazer'),(22,'7Series');
/*!40000 ALTER TABLE `model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `Id` int NOT NULL,
  `Description` longtext NOT NULL,
  `CreatedAt` date NOT NULL,
  `CarId` int DEFAULT NULL,
  `NotificationTypeId` int NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_Notifications_Cars` (`CarId`),
  KEY `FK_Notifications_NotificationType` (`NotificationTypeId`),
  CONSTRAINT `FK_Notifications_Cars` FOREIGN KEY (`CarId`) REFERENCES `cars` (`Id`) ON DELETE SET NULL,
  CONSTRAINT `FK_Notifications_NotificationType` FOREIGN KEY (`NotificationTypeId`) REFERENCES `notificationtype` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES (1,'\"KIA FORTE\" was updated','2024-03-01',10,1),(2,'\"NISSAN ALTIMA\" was removed from the list','2024-03-02',5,2);
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notificationtype`
--

DROP TABLE IF EXISTS `notificationtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notificationtype` (
  `id` int NOT NULL,
  `Nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notificationtype`
--

LOCK TABLES `notificationtype` WRITE;
/*!40000 ALTER TABLE `notificationtype` DISABLE KEYS */;
INSERT INTO `notificationtype` VALUES (1,'update'),(2,'delete');
/*!40000 ALTER TABLE `notificationtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rental`
--

DROP TABLE IF EXISTS `rental`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rental` (
  `Id` int NOT NULL,
  `UserId` int NOT NULL,
  `CarId` int NOT NULL,
  `StartDate` date NOT NULL,
  `EndDate` date NOT NULL,
  `Cost` decimal(19,2) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_Rental_Cars` (`CarId`),
  KEY `FK_Rental_Users` (`UserId`),
  CONSTRAINT `FK_Rental_Cars` FOREIGN KEY (`CarId`) REFERENCES `cars` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_Rental_Users` FOREIGN KEY (`UserId`) REFERENCES `users` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rental`
--

LOCK TABLES `rental` WRITE;
/*!40000 ALTER TABLE `rental` DISABLE KEYS */;
INSERT INTO `rental` VALUES (2,1,1,'2024-04-12','2024-04-15',15360.00),(3,1,2,'2023-10-21','2023-10-25',7200.00),(4,2,1,'2023-10-30','2023-11-09',19200.00),(5,3,3,'2023-11-10','2023-11-14',6720.00),(6,3,4,'2023-11-15','2023-11-20',7800.00),(7,4,11,'2023-11-21','2023-11-22',1560.00),(8,5,5,'2024-04-20','2024-04-27',2880.00),(9,5,5,'2024-04-20','2024-04-27',5760.00),(10,6,6,'2023-11-15','2023-12-25',5280.00),(11,7,1,'2024-04-20','2024-04-27',9600.00),(12,7,2,'2024-04-20','2024-04-27',7200.00),(13,8,3,'2023-12-21','2023-12-24',5040.00),(14,8,4,'2023-12-25','2023-12-26',1560.00),(15,9,5,'2023-12-27','2023-12-30',2880.00),(16,9,5,'2024-01-01','2024-01-05',5760.00),(17,10,6,'2024-01-06','2024-01-10',3960.00),(18,10,4,'2024-01-11','2024-01-15',6240.00),(19,11,1,'2024-01-16','2024-01-20',5760.00),(21,8,24,'2024-04-22','2024-04-27',672.00),(22,8,25,'2024-04-18','2024-04-21',480.00),(23,10,25,'2024-04-22','2024-04-28',784.00),(26,10,24,'2024-04-17','2024-04-21',600.00),(27,3,25,'2024-01-07','2024-02-09',3840.00);
/*!40000 ALTER TABLE `rental` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `Id` int NOT NULL,
  `FirstName` varchar(255) NOT NULL,
  `LastName` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `IsEmployee` tinyint(1) NOT NULL,
  `Password` varchar(255) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'John','Doe','john.doe@example.com',0,'password123'),(2,'Jane','Smith','jane.smith@example.com',0,'securepass456'),(3,'Michael','Johnson','michael.johnson@example.com',0,'userpass789'),(4,'Emily','Brown','emily.brown@example.com',0,'pass1234'),(5,'Christopher','Williams','chris.williams@example.com',0,'securepass567'),(6,'Amanda','Martinez','amanda.martinez@example.com',0,'pass5678'),(7,'Daniel','Davis','daniel.davis@example.com',0,'userpass345'),(8,'Olivia','Rodriguez','olivia.rodriguez@example.com',0,'securepass890'),(9,'Ethan','Martinez','ethan.martinez@example.com',0,'pass7890'),(10,'Sophia','Garcia','sophia.garcia@example.com',0,'userpass234'),(11,'Liam','Smith','liam.smith@example.com',0,'securepass123'),(12,'Isabella','Taylor','isabella.taylor@example.com',0,'pass2345'),(13,'Mason','Jones','mason.jones@example.com',0,'userpass456'),(14,'Ava','White','ava.white@example.com',0,'securepass678'),(15,'Noah','Clark','noah.clark@example.com',0,'pass3456'),(16,'Emma','Lee','emma.lee@example.com',0,'userpass789'),(17,'Liam','Miller','liam.miller@example.com',0,'securepass901'),(18,'Olivia','Garcia','olivia.garcia@example.com',0,'pass4567'),(19,'Elijah','Brown','elijah.brown@example.com',0,'userpass012'),(20,'Ava','Davis','ava.davis@example.com',0,'securepass789'),(23,'Admin','Admin','company.system@example.com',1,'adminpass41');
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

-- Dump completed on 2025-09-30 17:50:32
