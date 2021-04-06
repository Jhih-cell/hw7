-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: website
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `family`
--

DROP TABLE IF EXISTS `family`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `family` (
  `FamilyId` varchar(100) NOT NULL,
  `FamilyName` varchar(10) DEFAULT NULL,
  `FamilySex` varchar(10) DEFAULT NULL,
  `BirthDate` datetime DEFAULT NULL,
  `PhoneNumber` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`FamilyId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `family`
--

LOCK TABLES `family` WRITE;
/*!40000 ALTER TABLE `family` DISABLE KEYS */;
INSERT INTO `family` VALUES ('bce0e4ae-ac70-4131-aa6f-d1e25b87fad9','泰冷','男生','1995-01-23 00:00:00','0977654258'),('91dcde4b-10b3-421e-ab8e-bb6bc23b4350','泰瘦','女生','1985-07-10 00:00:00','0944623456'),('91b18f1f-4ef8-4066-97c4-28daea585db5','泰胖','女生','2003-05-13 00:00:00',''),('3ad93ba4-c799-4a32-ac2e-8abc74dd6375','泰熱','男生','2001-12-10 00:00:00','0934567890'),('34bf1b6f-191d-40e9-9a8c-3c282e6a700d','泰肝','女生','2007-10-11 00:00:00',''),('de8cb5db-2061-4d35-a662-ba5f528fadba','泰賢','男生','1977-02-03 00:00:00','0944589456');
/*!40000 ALTER TABLE `family` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `content` varchar(255) NOT NULL,
  `time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `message_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (2,1,'test','2021-03-27 13:12:45'),(3,2,'Hello AV8D','2021-03-27 15:11:18'),(4,3,'Here I come!','2021-03-27 15:11:51');
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '獨立編號',
  `name` varchar(255) NOT NULL COMMENT '姓名',
  `username` varchar(255) NOT NULL COMMENT '帳戶名稱',
  `password` varchar(255) NOT NULL COMMENT '帳戶密碼',
  `time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '註冊時間',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Helen','Blueberry','123','2021-03-27 13:09:14'),(2,'Harley','piupiu','ppp','2021-03-27 13:19:50'),(3,'June','ply','123','2021-03-27 13:20:02'),(34,'apple','yuchen','123','2021-03-29 21:33:51'),(35,'yiao','yi','222','2021-03-29 21:35:39'),(36,'han','eee','111','2021-03-29 22:13:08'),(37,'mmm','mmm','mmm','2021-03-29 22:38:57'),(38,'dd','dd','dd','2021-03-29 23:05:31'),(39,'q','q','o','2021-03-29 23:05:48'),(40,'ccc','ccc','ccc','2021-03-30 00:42:01'),(41,'1','piu','pp','2021-03-30 07:46:18'),(42,'','yy','','2021-03-30 07:47:44'),(43,'han','ww','ww','2021-03-30 07:53:06'),(44,'Li','888','222','2021-03-30 08:04:57'),(45,'Wang','ee','i','2021-03-30 08:14:11'),(46,'9','9','9','2021-03-30 08:29:41'),(47,'qqqq','eeeeee','ii','2021-03-30 08:57:37'),(48,'yyy','y','tt','2021-03-30 09:03:10'),(49,'123','123','123','2021-03-30 09:07:52'),(50,'000','000000','00','2021-03-30 09:11:00'),(51,'tttttt','uu','3','2021-03-30 09:16:42'),(53,'HL','HL','88','2021-03-31 20:52:18'),(54,'hsin','hsin','yy','2021-03-31 21:07:33'),(55,'HL','pp','p','2021-04-06 21:00:14');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-06 21:18:31
