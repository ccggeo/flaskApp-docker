-- MySQL dump 10.15  Distrib 10.0.34-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: myflaskapp
-- ------------------------------------------------------
-- Server version	10.0.34-MariaDB-0ubuntu0.16.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `users`
--

CREATE DATABASE IF NOT EXISTS myflaskapp;
USE myflaskapp;





DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `username` varchar(30) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `register_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'connor123','connor123','connor123','$5$rounds=535000$P.R9uLrwJSAbOWQN$VSQmIcTzRBXPBuk9B01NEJrCoCwv/VmCgEVTzaW7Kq7','2018-03-29 13:37:59'),(2,'connor123','connor123','connor123','$5$rounds=535000$dePr.v.e41Px8bBs$MPdYKhFe62XAvUSe5rsheXdS7Sey5e0RGy/65mgLJX2','2018-03-29 13:41:48'),(3,'connor123','connor123','connor123','$5$rounds=535000$ZDWVRCJmotE822IJ$4UkWc6Dy9aquZZSxRLjnH8RCkM37/iVt9tffQDfgjf3','2018-03-29 13:42:14'),(4,'connor123','connor123','connor123','$5$rounds=535000$jSdK7FHz1CxoTzx.$i63W8iqBVgj1V3H6CFc/LOiHpENpSaZoV9XCNVgcDt.','2018-03-29 13:43:25'),(5,'connor123','connor123','connor123','$5$rounds=535000$HFiwT5wtusniqUD7$arWvXxpVpcSbt/4Cph9pm0lhp08ETz6YiJZQRs2wfCD','2018-03-29 13:47:09'),(6,'Jesus Christ','jchrist@gmail.com','jchrist','$5$rounds=535000$WxUgTDRDpbdJsKaE$pDVWuyo5uitEfdY/AxqiP5BisWa67/dHvL2wOLUCwKD','2018-03-29 13:50:46'),(7,'katie','price12','kprice@gmail.com','$5$rounds=535000$uGSkY/IRyXMPQrwb$8czWISYAHnXDv5yyxWoL5Uf8wG6Ne.Y5fuVbjMGvhf9','2018-03-29 13:53:23'),(8,'90000000','90000000','90000000','$5$rounds=535000$X49JNbORN8mfVV0i$BGWD8UEv60TXHqchKfPXDVQFZYL4AzENWiyhRZ/u4.9','2018-03-29 14:29:34'),(9,'90000000','90000000','90000000','$5$rounds=535000$aAqaBG02bxSK32Nl$01wYcSKAbAhXk1GKegfRpEJrNi0eCMnve0QDD7vSDz4','2018-03-29 14:30:47'),(10,'90000000','90000000','90000000','$5$rounds=535000$KCTj2EiKtsQVOhEV$8EpdqubpRsdfQNZVQnaM5rRCweE2nLfLSimOFdCZFB5','2018-03-29 14:31:59'),(11,'90000000','90000000','90000000','$5$rounds=535000$OFhg7cUnve4MprbR$11jEBDjfoSfokE2b3skbWwIOEtYiUAyPCD0E5/TbJE0','2018-03-29 14:32:26'),(12,'90000000','90000000','90000000','$5$rounds=535000$vNUD3rxeYDJEAv/u$A52hh74WCvq4MDb4L2Mn9y0YB1ajTw9jr6pE88uR3.4','2018-03-29 14:34:22'),(13,'90000000','90000000','90000000','$5$rounds=535000$Oqq/DEDndDvGJgDI$7578cL0ldbzsNgm8ePcTTBi4MuMzG/QW4QlTosZyiEC','2018-03-29 14:36:40'),(14,'    sess.init_app(app)','    sess.init_app(app)','    sess.init_app(app)','$5$rounds=535000$OyjeL42HCubLFu4n$lYQ5ggMrlALIgrnl59dgProYE1Q5guGxF/rrK5qxUX/','2018-03-29 14:36:50'),(15,'    sess.init_app(app)','    sess.init_app(app)','    sess.init_app(app)','$5$rounds=535000$zE2WKXP4xi9KpifR$O9By6P01nASrJvPUAvff4gjsehToD0KgemtYFv5ariC','2018-03-29 14:37:16'),(16,'Princeton','p@glalglgdl.com','pirg9ufhgushfdigh','$5$rounds=535000$cKX4U2O2QyPUypOl$CrCq2F8P25GLBwAnYJhgG1vyvtri0Tm5FyKhJVTY3p9','2018-03-31 15:36:25');
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

-- Dump completed on 2018-04-03 17:20:14
