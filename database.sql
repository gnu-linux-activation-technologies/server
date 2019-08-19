-- MariaDB dump 10.17  Distrib 10.4.7-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: glat
-- ------------------------------------------------------
-- Server version	10.4.7-MariaDB

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
-- Table structure for table `oem_licenses`
--

DROP TABLE IF EXISTS `oem_licenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oem_licenses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_key` varchar(29) COLLATE utf8mb4_unicode_ci NOT NULL,
  `linux_user` int(10) NOT NULL,
  `gnu_user` int(10) NOT NULL,
  `hwid` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vendor` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_key` (`product_key`),
  UNIQUE KEY `gnu_user` (`gnu_user`),
  UNIQUE KEY `linux_user` (`linux_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oem_licenses`
--

LOCK TABLES `oem_licenses` WRITE;
/*!40000 ALTER TABLE `oem_licenses` DISABLE KEYS */;
/*!40000 ALTER TABLE `oem_licenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oem_vendors`
--

DROP TABLE IF EXISTS `oem_vendors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oem_vendors` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oem_vendors`
--

LOCK TABLES `oem_vendors` WRITE;
/*!40000 ALTER TABLE `oem_vendors` DISABLE KEYS */;
/*!40000 ALTER TABLE `oem_vendors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `retail_licenses`
--

DROP TABLE IF EXISTS `retail_licenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `retail_licenses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `linux_user` int(10) NOT NULL,
  `gnu_user` int(10) NOT NULL,
  `hwid` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `blacklisted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_key` (`product_key`),
  UNIQUE KEY `linux_user` (`linux_user`),
  UNIQUE KEY `gnu_user` (`gnu_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `retail_licenses`
--

LOCK TABLES `retail_licenses` WRITE;
/*!40000 ALTER TABLE `retail_licenses` DISABLE KEYS */;
/*!40000 ALTER TABLE `retail_licenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volume_licenses`
--

DROP TABLE IF EXISTS `volume_licenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volume_licenses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `linux_user` int(10) NOT NULL,
  `gnu_user` int(10) NOT NULL,
  `blacklisted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `linux_user` (`linux_user`),
  UNIQUE KEY `gnu_user` (`gnu_user`),
  UNIQUE KEY `product_key` (`product_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volume_licenses`
--

LOCK TABLES `volume_licenses` WRITE;
/*!40000 ALTER TABLE `volume_licenses` DISABLE KEYS */;
/*!40000 ALTER TABLE `volume_licenses` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 1970-01-01 00:00:00
