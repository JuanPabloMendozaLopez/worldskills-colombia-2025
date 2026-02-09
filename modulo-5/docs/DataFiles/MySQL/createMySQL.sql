CREATE DATABASE  IF NOT EXISTS `sesion5` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `sesion5`;
-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: sesion5
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
-- Table structure for table `estadio`
--

DROP TABLE IF EXISTS `estadio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estadio` (
  `Id` int NOT NULL,
  `Nome` varchar(255) NOT NULL,
  `Estado` varchar(255) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imagens`
--

DROP TABLE IF EXISTS `imagens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imagens` (
  `Codigo` int NOT NULL,
  `Arquivo` longblob,
  PRIMARY KEY (`Codigo`),
  CONSTRAINT `FK_Imagens_Jogador` FOREIGN KEY (`Codigo`) REFERENCES `jogador` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jogador`
--

DROP TABLE IF EXISTS `jogador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jogador` (
  `Id` int NOT NULL,
  `Nome` varchar(255) NOT NULL,
  `Nascimento` datetime(6) NOT NULL,
  `Posicao` varchar(255) NOT NULL,
  `QTDEFaltas` int DEFAULT '0',
  `QTDECartoesAmarelo` int DEFAULT '0',
  `QTDECartoesVermelho` int DEFAULT '0',
  `QTDEGols` int DEFAULT '0',
  `Informacoes` longtext,
  `NumeroCamisa` int DEFAULT NULL,
  `SelecaoID` int DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK__Jogador__Selecao__4222D4EF` (`SelecaoID`),
  CONSTRAINT `FK__Jogador__Selecao__4222D4EF` FOREIGN KEY (`SelecaoID`) REFERENCES `selecao` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jogo`
--

DROP TABLE IF EXISTS `jogo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jogo` (
  `Id` int NOT NULL,
  `SelecaoCasa` int DEFAULT NULL,
  `SelecaoVisitante` int DEFAULT NULL,
  `PlacarCasa` int NOT NULL DEFAULT '0',
  `PlacarVisitante` int NOT NULL DEFAULT '0',
  `PenaltisCasa` int NOT NULL DEFAULT '0',
  `PenaltisVisitante` int NOT NULL DEFAULT '0',
  `Data` datetime(6) DEFAULT NULL,
  `Estadio` int DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK__Jogo__Estadio__4316F928` (`Estadio`),
  KEY `FK__Jogo__SelecaoCas__440B1D61` (`SelecaoCasa`),
  KEY `FK__Jogo__SelecaoVis__44FF419A` (`SelecaoVisitante`),
  CONSTRAINT `FK__Jogo__Estadio__4316F928` FOREIGN KEY (`Estadio`) REFERENCES `estadio` (`Id`),
  CONSTRAINT `FK__Jogo__SelecaoCas__440B1D61` FOREIGN KEY (`SelecaoCasa`) REFERENCES `selecao` (`Id`),
  CONSTRAINT `FK__Jogo__SelecaoVis__44FF419A` FOREIGN KEY (`SelecaoVisitante`) REFERENCES `selecao` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `selecao`
--

DROP TABLE IF EXISTS `selecao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `selecao` (
  `Id` int NOT NULL,
  `Nome` varchar(255) NOT NULL,
  `Bandeira` longblob,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `Id` int NOT NULL,
  `Nome` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Apelido` varchar(255) NOT NULL,
  `Senha` varchar(255) NOT NULL,
  `Perfil` varchar(50) NOT NULL DEFAULT 'Normal',
  `Bloqueado` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UQ__Usuario__A9D1053490BABCF1` (`Email`),
  UNIQUE KEY `UQ__Usuario__571DBAE61224E8A3` (`Apelido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-30 18:33:00
