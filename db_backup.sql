-- MySQL dump 10.13  Distrib 8.0.46, for Linux (x86_64)
--
-- Host: localhost    Database: ez_aldeen
-- ------------------------------------------------------
-- Server version	8.0.46

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
-- Table structure for table `attendances`
--

DROP TABLE IF EXISTS `attendances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attendances` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `attendance_date` date NOT NULL,
  `status` enum('حاضر','غائب') COLLATE utf8mb4_unicode_ci NOT NULL,
  `excused_reason` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `student_id` bigint unsigned NOT NULL,
  `halakat_id` bigint unsigned NOT NULL,
  `recorded_by` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_student_attendance` (`student_id`,`halakat_id`,`attendance_date`),
  KEY `attendances_recorded_by_foreign` (`recorded_by`),
  KEY `attendances_halakat_id_attendance_date_index` (`halakat_id`,`attendance_date`),
  KEY `attendances_student_id_attendance_date_index` (`student_id`,`attendance_date`),
  KEY `attendances_date_status_index` (`attendance_date`,`status`),
  CONSTRAINT `attendances_halakat_id_foreign` FOREIGN KEY (`halakat_id`) REFERENCES `halakat` (`id`),
  CONSTRAINT `attendances_recorded_by_foreign` FOREIGN KEY (`recorded_by`) REFERENCES `users` (`id`),
  CONSTRAINT `attendances_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=378 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendances`
--

LOCK TABLES `attendances` WRITE;
/*!40000 ALTER TABLE `attendances` DISABLE KEYS */;
INSERT INTO `attendances` VALUES (1,'2026-03-01','حاضر',NULL,22,1,2,NULL,NULL),(2,'2026-03-15','حاضر',NULL,22,1,2,NULL,NULL),(3,'2026-04-01','غائب','مرض',22,1,2,NULL,NULL),(4,'2026-03-05','حاضر',NULL,23,1,2,NULL,NULL),(5,'2026-03-20','غائب','ظروف عائلية',23,1,2,NULL,NULL),(7,'2026-03-18','حاضر',NULL,24,2,3,NULL,NULL),(8,'2026-03-10','غائب','مرض',25,2,3,NULL,NULL),(9,'2026-04-01','حاضر',NULL,25,2,3,NULL,NULL),(10,'2026-03-01','حاضر',NULL,26,3,4,NULL,NULL),(11,'2026-03-15','حاضر',NULL,26,3,4,NULL,NULL),(12,'2026-03-05','حاضر',NULL,27,3,4,NULL,NULL),(13,'2026-03-22','غائب','سفر',27,3,4,NULL,NULL),(14,'2026-03-01','حاضر',NULL,28,4,5,NULL,NULL),(15,'2026-03-20','حاضر',NULL,28,4,5,NULL,NULL),(16,'2026-03-12','حاضر',NULL,29,4,5,NULL,NULL),(17,'2026-04-05','غائب','مرض',29,4,5,NULL,NULL),(20,'2026-05-12','حاضر','NULL',31,5,6,NULL,'2026-05-13 13:00:35'),(22,'2026-03-01','حاضر',NULL,32,6,7,NULL,NULL),(23,'2026-03-20','حاضر',NULL,32,6,7,NULL,NULL),(24,'2026-03-15','حاضر',NULL,33,6,7,NULL,NULL),(25,'2026-04-01','غائب','مرض',33,6,7,NULL,NULL),(26,'2026-03-05','حاضر',NULL,34,7,8,NULL,NULL),(27,'2026-03-22','حاضر',NULL,34,7,8,NULL,NULL),(28,'2026-03-10','غائب','ظروف عائلية',35,7,8,NULL,NULL),(29,'2026-04-01','حاضر',NULL,35,7,8,NULL,NULL),(30,'2026-03-01','حاضر',NULL,36,8,9,NULL,NULL),(31,'2026-03-18','حاضر',NULL,36,8,9,NULL,NULL),(32,'2026-03-25','حاضر',NULL,37,8,9,NULL,NULL),(33,'2026-04-05','غائب','سفر',37,8,9,NULL,NULL),(34,'2026-03-01','حاضر',NULL,38,9,10,NULL,NULL),(35,'2026-03-20','حاضر',NULL,38,9,10,NULL,NULL),(36,'2026-03-28','غائب','مرض',39,9,10,NULL,NULL),(37,'2026-04-10','حاضر',NULL,39,9,10,NULL,NULL),(38,'2026-03-05','حاضر',NULL,40,10,11,NULL,NULL),(39,'2026-03-25','حاضر',NULL,40,10,11,NULL,NULL),(40,'2026-03-15','حاضر',NULL,41,10,11,NULL,NULL),(41,'2026-04-01','غائب','ظروف عائلية',41,10,11,NULL,NULL),(44,'2026-05-12','حاضر','NULL',1,5,6,'2026-05-12 17:09:17','2026-05-12 17:09:17'),(87,'2026-03-10','حاضر',NULL,31,5,6,NULL,NULL),(88,'2026-04-01','حاضر',NULL,31,5,6,NULL,NULL),(250,'2026-05-13','غائب','مرض',22,1,2,NULL,NULL),(251,'2026-05-13','حاضر',NULL,23,1,3,NULL,NULL),(252,'2026-05-13','حاضر',NULL,24,2,4,NULL,NULL),(253,'2026-05-13','حاضر',NULL,25,2,5,NULL,NULL),(254,'2026-05-13','حاضر',NULL,26,3,6,NULL,NULL),(255,'2026-05-13','غائب','ظروف عائلية',27,3,7,NULL,NULL),(256,'2026-05-13','حاضر',NULL,28,4,8,NULL,NULL),(257,'2026-05-13','حاضر',NULL,29,4,9,NULL,NULL),(259,'2026-05-13','حاضر',NULL,31,5,11,NULL,NULL),(260,'2026-05-13','غائب','سفر',32,6,12,NULL,NULL),(261,'2026-05-13','حاضر',NULL,33,6,13,NULL,NULL),(262,'2026-05-13','حاضر',NULL,34,7,14,NULL,NULL),(263,'2026-05-13','حاضر',NULL,35,7,15,NULL,NULL),(264,'2026-05-13','حاضر',NULL,36,8,16,NULL,NULL),(265,'2026-05-13','غائب','امتحان',38,9,17,NULL,NULL),(266,'2026-05-13','حاضر',NULL,39,9,18,NULL,NULL),(267,'2026-05-13','حاضر',NULL,40,10,19,NULL,NULL),(268,'2026-05-13','حاضر',NULL,41,10,20,NULL,NULL),(269,'2026-05-19','غائب','لاتكرر الغياب',26,3,1,'2026-05-19 14:11:40','2026-05-19 14:40:36'),(270,'2026-05-21','حاضر','حضور جديد اليوم للحلقة الحاليه',23,2,1,'2026-05-21 09:50:50','2026-05-21 09:50:50'),(271,'2026-05-23','حاضر',NULL,23,2,3,'2026-05-23 11:44:56','2026-05-23 11:44:56'),(272,'2026-05-23','غائب','مرض',24,2,3,'2026-05-23 11:44:56','2026-05-23 11:44:56'),(273,'2026-05-23','حاضر',NULL,25,2,3,'2026-05-23 12:17:37','2026-05-23 12:17:37'),(274,'2026-05-24','حاضر',NULL,25,2,3,'2026-05-24 07:07:34','2026-05-24 07:07:34'),(275,'2026-05-24','غائب','مرض',24,2,3,'2026-05-24 07:07:34','2026-05-24 07:07:34'),(276,'2026-05-28','حاضر',NULL,25,2,3,'2026-05-28 10:54:26','2026-05-28 10:54:26'),(277,'2026-05-28','غائب','مرض',24,2,3,'2026-05-28 10:54:26','2026-05-28 10:54:26'),(278,'2026-05-31','حاضر',NULL,22,1,2,'2026-05-31 19:12:32','2026-05-31 19:12:32'),(279,'2026-05-31','غائب','مرض',49,1,2,'2026-05-31 19:12:32','2026-05-31 19:12:32'),(280,'2026-05-31','حاضر',NULL,31,5,6,'2026-05-31 19:21:22','2026-05-31 19:21:22'),(281,'2026-05-31','حاضر',NULL,39,5,6,'2026-05-31 19:21:22','2026-05-31 19:21:22'),(283,'2026-05-31','غائب',NULL,35,1,2,'2026-05-31 19:25:02','2026-05-31 19:25:02'),(284,'2026-05-31','غائب','مسافر',23,2,3,'2026-05-31 19:27:14','2026-05-31 19:27:14'),(285,'2026-05-31','غائب','مرض',25,2,3,'2026-05-31 19:27:14','2026-05-31 19:27:14'),(286,'2026-05-31','حاضر',NULL,24,2,3,'2026-05-31 19:27:14','2026-05-31 19:27:14'),(287,'2026-05-31','غائب','مريضه',29,4,5,'2026-05-31 19:35:34','2026-05-31 19:35:34'),(288,'2026-05-31','حاضر',NULL,28,4,5,'2026-05-31 19:35:34','2026-05-31 19:35:34'),(289,'2026-05-31','حاضر',NULL,32,6,7,'2026-05-31 19:41:28','2026-05-31 19:41:28'),(290,'2026-05-31','غائب','لا يوجد عذر',33,6,7,'2026-05-31 19:41:28','2026-05-31 19:41:28'),(291,'2026-05-31','حاضر',NULL,40,9,10,'2026-05-31 19:49:59','2026-05-31 19:49:59'),(292,'2026-05-31','غائب','f',38,9,10,'2026-05-31 19:49:59','2026-05-31 19:49:59'),(293,'2026-05-31','حاضر',NULL,36,8,9,'2026-05-31 20:00:32','2026-05-31 20:00:32'),(294,'2026-05-31','غائب','jfjdj',41,10,11,'2026-05-31 20:02:04','2026-05-31 20:02:04'),(295,'2026-06-01','حاضر',NULL,41,10,11,'2026-06-01 19:24:17','2026-06-01 19:24:17'),(296,'2026-06-02','حاضر','حاضر سيدي',41,10,1,'2026-06-01 19:33:44','2026-06-01 19:33:44'),(297,'2026-06-02','حاضر','يثي',22,1,1,'2026-06-01 19:35:50','2026-06-01 19:35:50'),(298,'2026-06-01','حاضر',NULL,22,1,2,'2026-06-01 20:51:40','2026-06-01 20:51:40'),(299,'2026-06-01','حاضر',NULL,49,1,2,'2026-06-01 20:51:40','2026-06-01 20:51:40'),(300,'2026-06-01','غائب','بتبتبت',35,1,2,'2026-06-01 20:51:40','2026-06-01 20:51:40'),(301,'2026-06-01','حاضر',NULL,31,5,6,'2026-06-01 21:56:29','2026-06-01 21:56:29'),(302,'2026-06-01','غائب',NULL,39,5,6,'2026-06-01 21:56:29','2026-06-01 21:56:29'),(304,'2026-06-01','حاضر',NULL,23,2,3,'2026-06-01 22:33:11','2026-06-01 22:33:11'),(305,'2026-06-01','حاضر',NULL,25,2,3,'2026-06-01 22:33:11','2026-06-01 22:33:11'),(306,'2026-06-01','غائب',NULL,24,2,3,'2026-06-01 22:33:11','2026-06-01 22:33:11'),(307,'2026-06-01','حاضر',NULL,32,6,7,'2026-06-01 22:55:17','2026-06-01 22:55:17'),(308,'2026-06-01','غائب',NULL,33,6,7,'2026-06-01 22:55:17','2026-06-01 22:55:17'),(309,'2026-06-03','حاضر',NULL,22,1,2,'2026-06-03 19:22:11','2026-06-03 19:22:11'),(310,'2026-06-03','غائب',NULL,49,1,2,'2026-06-03 19:22:13','2026-06-03 19:22:13'),(311,'2026-06-03','غائب',NULL,35,1,2,'2026-06-03 19:22:13','2026-06-03 19:22:13'),(312,'2026-06-03','غائب',NULL,23,2,3,'2026-06-03 19:24:23','2026-06-03 19:24:23'),(313,'2026-06-03','حاضر',NULL,25,2,3,'2026-06-03 19:24:23','2026-06-03 19:24:23'),(314,'2026-06-03','غائب',NULL,24,2,3,'2026-06-03 19:24:23','2026-06-03 19:24:23'),(315,'2026-06-03','حاضر',NULL,27,3,4,'2026-06-03 19:42:15','2026-06-03 19:42:15'),(316,'2026-06-03','حاضر',NULL,26,3,4,'2026-06-03 19:42:16','2026-06-03 19:42:16'),(317,'2026-06-03','حاضر',NULL,31,5,6,'2026-06-03 20:10:12','2026-06-03 20:10:12'),(318,'2026-06-03','حاضر',NULL,39,5,6,'2026-06-03 20:10:12','2026-06-03 20:10:12'),(320,'2026-06-03','حاضر',NULL,32,6,7,'2026-06-03 20:13:04','2026-06-03 20:13:04'),(321,'2026-06-03','غائب','لاتغيبي ولي',33,6,7,'2026-06-03 20:13:05','2026-06-03 20:13:05'),(322,'2026-06-03','حاضر',NULL,40,9,10,'2026-06-03 21:55:40','2026-06-03 21:55:40'),(323,'2026-06-03','حاضر',NULL,38,9,10,'2026-06-03 21:55:41','2026-06-03 21:55:41'),(324,'2026-06-04','حاضر',NULL,40,9,10,'2026-06-04 08:07:11','2026-06-04 08:07:11'),(325,'2026-06-04','غائب',NULL,38,9,10,'2026-06-04 08:07:11','2026-06-04 08:07:11'),(326,'2026-06-04','حاضر',NULL,32,6,7,'2026-06-04 19:25:11','2026-06-04 19:25:11'),(327,'2026-06-04','حاضر',NULL,33,6,7,'2026-06-04 19:25:12','2026-06-04 19:25:12'),(328,'2026-06-04','حاضر',NULL,23,2,3,'2026-06-04 19:26:58','2026-06-04 19:26:58'),(329,'2026-06-04','حاضر',NULL,25,2,3,'2026-06-04 19:26:59','2026-06-04 19:26:59'),(330,'2026-06-04','غائب','عم تغييب كتير',24,2,3,'2026-06-04 19:26:59','2026-06-04 19:26:59'),(331,'2026-06-04','حاضر',NULL,41,10,11,'2026-06-04 21:14:22','2026-06-04 21:14:22'),(332,'2026-06-04','غائب','ليش عم تغييب',50,1,2,'2026-06-04 21:17:42','2026-06-04 21:17:42'),(333,'2026-06-04','حاضر',NULL,22,1,2,'2026-06-04 21:17:43','2026-06-04 21:17:43'),(334,'2026-06-04','حاضر',NULL,49,1,2,'2026-06-04 21:17:43','2026-06-04 21:17:43'),(335,'2026-06-04','حاضر',NULL,35,1,2,'2026-06-04 21:17:43','2026-06-04 21:17:43'),(336,'2026-06-05','حاضر',NULL,23,2,3,'2026-06-05 01:15:20','2026-06-05 01:15:20'),(337,'2026-06-05','غائب',NULL,25,2,3,'2026-06-05 01:15:20','2026-06-05 01:15:20'),(338,'2026-06-05','غائب',NULL,24,2,3,'2026-06-05 01:15:20','2026-06-05 01:15:20'),(339,'2026-06-05','غائب','مابقى تغيبي',27,3,4,'2026-06-05 01:17:09','2026-06-05 01:17:09'),(340,'2026-06-05','حاضر',NULL,26,3,4,'2026-06-05 01:17:09','2026-06-05 01:17:09'),(341,'2026-06-08','حاضر',NULL,27,3,4,'2026-06-08 22:19:14','2026-06-08 22:19:14'),(342,'2026-06-08','غائب','لاعاد تغيب يا ولد',26,3,4,'2026-06-08 22:19:14','2026-06-08 22:19:14'),(343,'2026-06-08','حاضر',NULL,50,1,2,'2026-06-08 22:42:37','2026-06-08 22:42:37'),(344,'2026-06-08','حاضر',NULL,22,1,2,'2026-06-08 22:42:38','2026-06-08 22:42:38'),(345,'2026-06-08','حاضر',NULL,49,1,2,'2026-06-08 22:42:38','2026-06-08 22:42:38'),(346,'2026-06-08','غائب','لك شوووووح',35,1,2,'2026-06-08 22:42:38','2026-06-08 22:42:38'),(347,'2026-06-09','غائب','غياب متكرر',27,3,4,'2026-06-09 00:48:13','2026-06-09 00:48:13'),(348,'2026-06-09','غائب','اخر انذار لك',26,3,4,'2026-06-09 00:48:13','2026-06-09 00:48:13'),(349,'2026-06-09','حاضر',NULL,31,5,6,'2026-06-09 16:29:46','2026-06-09 16:29:46'),(350,'2026-06-09','حاضر',NULL,39,5,6,'2026-06-09 16:29:47','2026-06-09 16:29:47'),(352,'2026-06-10','حاضر',NULL,31,5,6,'2026-06-10 11:40:24','2026-06-10 11:40:24'),(354,'2026-06-10','حاضر',NULL,39,5,6,'2026-06-10 11:40:30','2026-06-10 11:40:30'),(355,'2026-06-10','حاضر',NULL,32,6,7,'2026-06-10 12:27:53','2026-06-10 12:27:53'),(356,'2026-06-10','حاضر',NULL,33,6,7,'2026-06-10 12:27:54','2026-06-10 12:27:54'),(357,'2026-06-10','غائب',NULL,40,2,3,'2026-06-10 22:14:51','2026-06-10 22:14:51'),(358,'2026-06-10','غائب',NULL,23,2,3,'2026-06-10 22:14:51','2026-06-10 22:14:51'),(359,'2026-06-10','غائب',NULL,25,2,3,'2026-06-10 22:14:51','2026-06-10 22:14:51'),(360,'2026-06-10','حاضر',NULL,24,2,3,'2026-06-10 22:14:52','2026-06-10 22:14:52'),(361,'2026-06-10','حاضر',NULL,22,1,2,'2026-06-10 22:18:13','2026-06-10 22:18:13'),(362,'2026-06-10','حاضر',NULL,49,1,2,'2026-06-10 22:18:13','2026-06-10 22:18:13'),(363,'2026-06-10','حاضر',NULL,35,1,2,'2026-06-10 22:18:13','2026-06-10 22:18:13'),(364,'2026-06-11','حاضر',NULL,22,1,2,'2026-06-11 09:21:18','2026-06-11 09:21:18'),(365,'2026-06-11','حاضر',NULL,49,1,2,'2026-06-11 09:21:18','2026-06-11 09:21:18'),(366,'2026-06-11','غائب',NULL,35,1,2,'2026-06-11 09:21:18','2026-06-11 09:21:18'),(367,'2026-06-12','حاضر',NULL,22,1,2,'2026-06-12 22:30:16','2026-06-12 22:30:16'),(368,'2026-06-12','حاضر',NULL,49,1,2,'2026-06-12 22:30:17','2026-06-12 22:30:17'),(369,'2026-06-12','حاضر',NULL,35,1,2,'2026-06-12 22:30:17','2026-06-12 22:30:17'),(370,'2026-06-12','حاضر',NULL,31,5,6,'2026-06-12 22:32:19','2026-06-12 22:32:19'),(371,'2026-06-12','حاضر',NULL,39,5,6,'2026-06-12 22:32:20','2026-06-12 22:32:20'),(372,'2026-06-13','غائب',NULL,31,5,6,'2026-06-13 14:45:28','2026-06-13 14:45:28'),(373,'2026-06-13','حاضر',NULL,39,5,6,'2026-06-13 14:45:30','2026-06-13 14:45:30'),(374,'2026-06-13','حاضر',NULL,22,1,2,'2026-06-13 14:47:01','2026-06-13 14:47:01'),(375,'2026-06-13','حاضر',NULL,49,1,2,'2026-06-13 14:47:02','2026-06-13 14:47:02'),(376,'2026-06-13','غائب',NULL,35,1,2,'2026-06-13 14:47:02','2026-06-13 14:47:02'),(377,'2026-06-13','حاضر',NULL,51,1,2,'2026-06-13 22:20:52','2026-06-13 22:20:52');
/*!40000 ALTER TABLE `attendances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `halakat`
--

DROP TABLE IF EXISTS `halakat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `halakat` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notes` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `teacher_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `halakat_teacher_id_unique` (`teacher_id`),
  CONSTRAINT `halakat_teacher_id_foreign` FOREIGN KEY (`teacher_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `halakat`
--

LOCK TABLES `halakat` WRITE;
/*!40000 ALTER TABLE `halakat` DISABLE KEYS */;
INSERT INTO `halakat` VALUES (1,'حلقة الفجر','حلقة الصباح الباكر',2,'2026-05-12 13:17:41','2026-05-12 13:17:41',NULL),(2,'حلقة التحفيظ الصباحية','للمبتدئين',3,'2026-05-12 13:17:41','2026-05-12 13:17:41',NULL),(3,'حلقة المراجعة','للمتقدمين',4,'2026-05-12 13:17:41','2026-05-12 13:17:41',NULL),(4,'حلقة التجويد','تجويد وترتيل',5,'2026-05-12 13:17:41','2026-05-12 13:17:41',NULL),(5,'حلقة حفظ المختصر',NULL,6,'2026-05-12 13:17:41','2026-05-12 13:17:41',NULL),(6,'حلقة التميز','طلاب متفوقون',7,'2026-05-12 13:17:41','2026-05-12 13:17:41',NULL),(7,'حلقة النور',NULL,8,'2026-05-12 13:17:41','2026-05-12 13:17:41',NULL),(8,'حلقة الرحمة','للأطفال',9,'2026-05-12 13:17:41','2026-05-12 13:17:41',NULL),(9,'حلقة الفرقان','حفظ القرآن الكريم',10,'2026-05-12 13:17:41','2026-05-12 13:17:41',NULL),(10,'حلقة البركة','للمبتدئين',11,'2026-05-12 13:17:41','2026-05-12 13:17:41',NULL),(11,'حلقة الهدى','تجويد وحفظ',12,'2026-05-12 13:17:41','2026-05-13 18:59:17','2026-05-13 18:59:17'),(12,'حلقة الحكمة','للمراجعة المتقدمة',13,'2026-05-12 13:17:41','2026-05-13 18:59:13','2026-05-13 18:59:13'),(13,'حلقة الصبر',NULL,14,'2026-05-12 13:17:41','2026-05-13 18:59:09','2026-05-13 18:59:09'),(14,'حلقة الشكر','للإتقان',15,'2026-05-12 13:17:41','2026-05-13 18:59:04','2026-05-13 18:59:04'),(15,'حلقة الإخلاص','لحفاظ الجزء الثلاثون',16,'2026-05-12 13:17:41','2026-05-13 18:58:54','2026-05-13 18:58:54'),(16,'حلقة التوبة','بانتظار مدرس',NULL,'2026-05-12 13:17:41','2026-05-13 12:42:52','2026-05-13 12:42:52'),(17,'حلقة الاستقامة',NULL,NULL,'2026-05-12 13:17:41','2026-05-13 12:42:48','2026-05-13 12:42:48'),(18,'حلقة التقوى','حلقة جديدة',NULL,'2026-05-12 13:17:41','2026-05-13 12:42:42','2026-05-13 12:42:42'),(19,'حلقة الورع','قيد التأسيس',NULL,'2026-05-12 13:17:41','2026-05-13 12:42:45','2026-05-13 12:42:45'),(20,'حلقة اليقين',NULL,NULL,'2026-05-12 13:17:41','2026-05-13 12:42:37','2026-05-13 12:42:37');
/*!40000 ALTER TABLE `halakat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `halakat_students`
--

DROP TABLE IF EXISTS `halakat_students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `halakat_students` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `student_id` bigint unsigned NOT NULL,
  `halakat_id` bigint unsigned NOT NULL,
  `joined_at` date NOT NULL,
  `left_at` date DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_enrollment` (`student_id`,`halakat_id`,`joined_at`),
  KEY `halakat_students_student_id_index` (`student_id`),
  KEY `halakat_students_halakat_id_index` (`halakat_id`),
  KEY `halakat_students_student_active_index` (`student_id`,`is_active`),
  CONSTRAINT `halakat_students_halakat_id_foreign` FOREIGN KEY (`halakat_id`) REFERENCES `halakat` (`id`),
  CONSTRAINT `halakat_students_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `halakat_students`
--

LOCK TABLES `halakat_students` WRITE;
/*!40000 ALTER TABLE `halakat_students` DISABLE KEYS */;
INSERT INTO `halakat_students` VALUES (1,22,1,'2025-09-01','2026-06-05',0,'2026-05-12 13:17:41','2026-06-05 18:41:10'),(2,23,1,'2025-09-15','2026-05-21',0,'2026-05-12 13:17:41','2026-05-21 09:17:46'),(3,24,2,'2025-09-01',NULL,1,'2026-05-12 13:17:41','2026-05-12 13:17:41'),(4,25,2,'2025-10-01',NULL,1,'2026-05-12 13:17:41','2026-05-12 13:17:41'),(5,26,3,'2025-09-01',NULL,1,'2026-05-12 13:17:41','2026-05-12 13:17:41'),(6,27,3,'2025-09-20',NULL,1,'2026-05-12 13:17:41','2026-05-12 13:17:41'),(7,28,4,'2025-08-15',NULL,1,'2026-05-12 13:17:41','2026-05-12 13:17:41'),(8,29,4,'2025-10-10',NULL,1,'2026-05-12 13:17:41','2026-05-12 13:17:41'),(9,30,5,'2025-09-01',NULL,1,'2026-05-12 13:17:41','2026-05-12 13:17:41'),(10,31,5,'2025-11-01',NULL,1,'2026-05-12 13:17:41','2026-05-12 13:17:41'),(11,32,6,'2025-09-01',NULL,1,'2026-05-12 13:17:41','2026-05-12 13:17:41'),(12,33,6,'2025-10-05',NULL,1,'2026-05-12 13:17:41','2026-05-12 13:17:41'),(13,34,7,'2025-09-10',NULL,1,'2026-05-12 13:17:41','2026-05-12 13:17:41'),(14,35,7,'2025-09-25','2026-05-31',0,'2026-05-12 13:17:41','2026-05-31 10:58:02'),(15,36,8,'2025-09-01',NULL,1,'2026-05-12 13:17:41','2026-05-12 13:17:41'),(16,37,8,'2025-10-20',NULL,1,'2026-05-12 13:17:41','2026-05-12 13:17:41'),(17,38,9,'2025-09-01',NULL,1,'2026-05-12 13:17:41','2026-05-12 13:17:41'),(18,39,9,'2025-11-15','2026-05-16',0,'2026-05-12 13:17:41','2026-05-16 20:14:38'),(19,40,10,'2025-09-01','2026-05-19',0,'2026-05-12 13:17:41','2026-05-19 10:44:27'),(20,41,10,'2025-10-01',NULL,1,'2026-05-12 13:17:41','2026-05-12 13:17:41'),(21,24,1,'2025-09-01','2025-10-15',0,'2026-05-12 13:17:41','2026-05-12 13:17:41'),(22,27,2,'2025-08-01','2025-09-19',0,'2026-05-12 13:17:41','2026-05-12 13:17:41'),(23,31,4,'2025-09-01','2025-10-31',0,'2026-05-12 13:17:41','2026-05-12 13:17:41'),(24,35,6,'2025-09-01','2025-10-04',0,'2026-05-12 13:17:41','2026-05-12 13:17:41'),(25,39,8,'2025-09-01','2025-11-14',0,'2026-05-12 13:17:41','2026-05-12 13:17:41'),(26,39,10,'2026-05-16','2026-05-17',0,'2026-05-16 20:14:38','2026-05-17 16:25:32'),(27,39,5,'2026-05-17',NULL,1,'2026-05-17 16:25:32','2026-05-17 16:25:32'),(28,40,9,'2026-05-19','2026-06-05',0,'2026-05-19 10:44:27','2026-06-05 19:02:07'),(29,23,2,'2026-05-21',NULL,1,'2026-05-21 09:17:46','2026-05-21 09:17:46'),(30,49,1,'2026-05-21',NULL,1,'2026-05-21 13:36:48','2026-05-21 13:36:48'),(31,35,1,'2026-05-31',NULL,1,'2026-05-31 10:58:02','2026-05-31 10:58:02'),(32,50,1,'2026-06-04',NULL,1,'2026-06-04 19:29:15','2026-06-04 19:29:15'),(33,22,2,'2026-06-05','2026-06-05',0,'2026-06-05 18:41:11','2026-06-05 18:41:50'),(34,22,1,'2026-06-05',NULL,1,'2026-06-05 18:41:50','2026-06-05 18:41:50'),(35,40,2,'2026-06-05',NULL,1,'2026-06-05 19:02:07','2026-06-05 19:02:07'),(36,51,1,'2026-06-13',NULL,1,'2026-06-13 22:14:00','2026-06-13 22:14:00'),(37,52,5,'2026-06-13',NULL,1,'2026-06-13 22:26:17','2026-06-13 22:26:17'),(38,53,6,'2026-06-13',NULL,1,'2026-06-13 22:29:19','2026-06-13 22:29:19'),(39,54,8,'2026-06-13',NULL,1,'2026-06-13 22:53:29','2026-06-13 22:53:29'),(40,55,8,'2026-06-13',NULL,1,'2026-06-13 23:23:25','2026-06-13 23:23:25');
/*!40000 ALTER TABLE `halakat_students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_01_01_000000_create_users_table',1),(2,'0001_01_01_000001_create_cache_table',1),(3,'0001_01_01_000002_create_jobs_table',1),(4,'2026_04_29_071541_create_personal_access_tokens_table',1),(5,'2026_04_29_072810_create_halakat_table',1),(6,'2026_04_29_072843_create_halakat_students_table',1),(7,'2026_04_29_072856_create_surah_table',1),(8,'2026_04_29_072917_create_quran_pages_table',1),(9,'2026_04_29_072946_create_quran_progress_table',1),(10,'2026_04_29_073024_create_attendances_table',1),(11,'2026_04_29_073034_create_notes_table',1),(12,'2026_04_29_130540_add_email_to_users_table',1),(13,'2026_05_07_072359_make_teacher_id_nullable_in_halakat_table',1),(14,'2026_05_07_134723_remove_unique_student_id_from_halakat_students_table',1),(15,'2026_05_10_143016_add_deleted_at_to_halakat_table',2),(16,'2026_05_12_154520_student_achievements_table',3),(17,'2026_05_12_161704_add_memorize_type_to_quran_progress_table',4),(18,'2026_05_14_103828_make_teacher_id_nullable_in_quran_progress',5),(19,'2026_05_14_104853_make_halakat_id_nullable_in_quran_progress',6),(20,'2026_05_14_111245_add_juz_number_to_quran_progress',7),(21,'2026_05_14_112430_make_quran_page_number_nullable_in_quran_progress',8),(22,'2026_05_16_133224_make_quran_page_number_nullable_in_quran_progress',9),(23,'2026_05_16_212051_change_juz_number_to_json_in_quran_progress',10),(24,'2026_05_16_215939_make_surah_id_nullable_in_quran_progress',11),(25,'2026_05_25_083907_add_performance_indexes',12),(26,'2026_06_13_220115_add_gender_to_users_table',13);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notes`
--

DROP TABLE IF EXISTS `notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `student_id` bigint unsigned NOT NULL,
  `sender_id` bigint unsigned NOT NULL,
  `halakat_id` bigint unsigned DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notes_sender_id_foreign` (`sender_id`),
  KEY `notes_halakat_id_foreign` (`halakat_id`),
  KEY `notes_student_id_created_at_index` (`student_id`,`created_at`),
  CONSTRAINT `notes_halakat_id_foreign` FOREIGN KEY (`halakat_id`) REFERENCES `halakat` (`id`) ON DELETE SET NULL,
  CONSTRAINT `notes_sender_id_foreign` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`),
  CONSTRAINT `notes_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notes`
--

LOCK TABLES `notes` WRITE;
/*!40000 ALTER TABLE `notes` DISABLE KEYS */;
INSERT INTO `notes` VALUES (1,22,2,1,'أداء ممتاز في الحفظ، استمر على هذا المستوى',NULL,NULL),(2,23,2,1,'تحتاج إلى مراجعة سورة البقرة أكثر',NULL,NULL),(3,24,3,2,'ممتاز! أتممت حفظ سورة يس بإتقان',NULL,NULL),(4,25,3,2,'تحسن واضح في التلاوة والتجويد',NULL,NULL),(5,26,4,3,'تم ترقية الطالب إلى المستوى المتقدم',NULL,NULL),(6,27,4,3,'يحتاج مزيد من الجهد في حفظ سورة الرحمن',NULL,NULL),(7,28,5,4,'النطق يحتاج تحسين في بعض الكلمات',NULL,NULL),(8,29,5,4,'تقرر منح الطالب شهادة تقدير',NULL,NULL),(9,30,6,5,'حفظ رائع لسورة النبأ، استمر على هذا النهج',NULL,NULL),(10,31,1,NULL,'تم قبول الطالب في برنامج التحفيظ المكثف',NULL,NULL),(11,32,7,6,'تقدم ممتاز في حفظ سورة البقرة',NULL,NULL),(12,33,7,6,'يحتاج التركيز على مخارج الحروف',NULL,NULL),(13,34,8,7,'أداء ممتاز في حفظ الجزء الثلاثون',NULL,NULL),(14,35,1,NULL,'تم تحويل الطالب إلى حلقة أخرى لتحسين المستوى',NULL,NULL),(15,36,9,8,'حفظ متقن للسور القصيرة',NULL,NULL),(16,37,9,8,'يحتاج تحسين سرعة التلاوة',NULL,NULL),(17,38,10,9,'تقدم ملحوظ في حفظ سورة الواقعة',NULL,NULL),(18,39,10,9,'بداية جيدة في حفظ القرآن، شجعه في البيت',NULL,NULL),(19,40,11,10,'يحتاج مراجعة يومية لسورة إبراهيم',NULL,NULL),(20,41,11,10,'حفظ ممتاز لسورة الفاتحة والبقرة',NULL,NULL),(21,24,1,NULL,'طالب متميز يُرشح للمشاركة في مسابقة حفظ القرآن',NULL,NULL),(22,28,5,4,'انضباط ممتاز في الحضور والمراجعة',NULL,NULL),(23,32,7,6,'يحتاج مراجعة الآيات المنسوخة في سورة البقرة',NULL,NULL),(24,36,1,NULL,'تم منحه شهادة تقدير لحفظه الجزء الثلاثون',NULL,NULL),(25,38,10,9,'أخوه الأكبر يشرفه ويساعده في المراجعة',NULL,NULL);
/*!40000 ALTER TABLE `notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  KEY `personal_access_tokens_expires_at_index` (`expires_at`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
INSERT INTO `personal_access_tokens` VALUES (1,'App\\Models\\User',11,'auth_Token','b0275bcf8283435e7052c25101262c753b7e77b3de9be4399ff3e4126c7ba3d3','[\"*\"]','2026-05-20 12:37:01',NULL,'2026-05-20 12:35:27','2026-05-20 12:37:01'),(2,'App\\Models\\User',2,'auth_Token','fa6af17a6b61ceae0e5944616b262d9ef2b014c6e9bdd33b189bed50a0502898','[\"*\"]','2026-05-21 09:47:23',NULL,'2026-05-21 09:47:06','2026-05-21 09:47:23'),(3,'App\\Models\\User',3,'auth_Token','919c75c6e8ec489519790ec501acd2584611e1c0652562144ddc641fa3a97960','[\"*\"]','2026-05-21 09:52:12',NULL,'2026-05-21 09:51:58','2026-05-21 09:52:12'),(4,'App\\Models\\User',2,'test2','0f40258e38fbd2a5737b97f1008ef339a2cfa781210ede57d00c90afc3506bdc','[\"*\"]','2026-05-21 19:32:57',NULL,'2026-05-21 19:32:19','2026-05-21 19:32:57'),(5,'App\\Models\\User',2,'auth_Token','e95d67de4d5b80e7adc40d496d85ccf57191bd74c6c51120761887b366722a50','[\"*\"]',NULL,NULL,'2026-05-21 22:18:08','2026-05-21 22:18:08'),(6,'App\\Models\\User',2,'auth_Token','a9db32cd442061c777bc52342d2a140abb7001836ca15e5f2a59fb6f133322f2','[\"*\"]','2026-05-21 22:18:59',NULL,'2026-05-21 22:18:08','2026-05-21 22:18:59'),(8,'App\\Models\\User',3,'auth_Token','f48b9da4e99a0681a2ad15a11199ecb67992aa2d5143fe0eb82a976181d4f346','[\"*\"]','2026-05-23 12:17:35',NULL,'2026-05-21 23:26:43','2026-05-23 12:17:35'),(9,'App\\Models\\User',3,'auth_Token','3ed0d41c4e7bd6aa02b71d3f98cc3cb9c0e5c3f98a5b6f16a214e214d14953f0','[\"*\"]','2026-05-23 11:42:09',NULL,'2026-05-23 11:41:08','2026-05-23 11:42:09'),(10,'App\\Models\\User',3,'auth_Token','94772a76cbd9ce8bbce301d5c81cea6741931db179ed9d6c15e406ed7f7f3977','[\"*\"]',NULL,NULL,'2026-05-24 07:03:11','2026-05-24 07:03:11'),(11,'App\\Models\\User',3,'auth_Token','bad67821bf21aaf5f6eb8e0084e0007770051448e03f99f5537e48be45f70f75','[\"*\"]','2026-05-28 10:54:23',NULL,'2026-05-24 07:04:39','2026-05-28 10:54:23'),(12,'App\\Models\\User',2,'auth_Token','7f2ccc1faba61806bbac3ff055af11f85252ca20a3da6ee2393820f2dfa40455','[\"*\"]','2026-05-24 07:11:44',NULL,'2026-05-24 07:11:10','2026-05-24 07:11:44'),(14,'App\\Models\\User',2,'auth_Token','7fbd68b83648b2edb79f6c7bccb071fa5ad1cb617061fba508ce4cc052f4d598','[\"*\"]','2026-05-31 21:01:38',NULL,'2026-05-28 10:43:35','2026-05-31 21:01:38'),(15,'App\\Models\\User',2,'auth_Token','07ce53923c7281e72959f0737946284d028d375fc8b745a1f12481aa9e2e997e','[\"*\"]','2026-05-31 21:12:49',NULL,'2026-05-28 10:52:05','2026-05-31 21:12:49'),(25,'App\\Models\\User',2,'auth_Token','28070c810a084026ff5f430877c446caed3701850ca6c62b94ff57c7d350687b','[\"*\"]','2026-05-31 20:24:24',NULL,'2026-05-31 20:22:37','2026-05-31 20:24:24'),(26,'App\\Models\\User',2,'auth_Token','b971a626877d604059589f65d842b77b41f0104272711b7d91b62abf5f2536ff','[\"*\"]','2026-06-08 22:57:55',NULL,'2026-06-01 19:23:23','2026-06-08 22:57:55'),(27,'App\\Models\\User',2,'auth_Token','7f2995522fd6a23d2345ba13d940602197a170941ab3aa568974a9dd58e84585','[\"*\"]','2026-06-03 20:39:00',NULL,'2026-06-01 19:40:24','2026-06-03 20:39:00'),(30,'App\\Models\\User',3,'auth_Token','3e3e66f8e30496b290e614bdb801dcf60d1c79171a7293aba53cbb87d82a5bd2','[\"*\"]','2026-06-01 22:52:12',NULL,'2026-06-01 22:32:53','2026-06-01 22:52:12'),(31,'App\\Models\\User',7,'auth_Token','db3816bffbb8acd5c8daf01337ffc007073edd8f161cbded8fd4fccda4512f22','[\"*\"]','2026-06-03 12:40:48',NULL,'2026-06-01 22:54:54','2026-06-03 12:40:48'),(32,'App\\Models\\User',6,'auth_Token','4799f36a4a24c3a48d5a5c51f4a1627ed90d8317d259406bd8ef4e89d2dafffc','[\"*\"]',NULL,NULL,'2026-06-03 14:51:04','2026-06-03 14:51:04'),(33,'App\\Models\\User',6,'auth_Token','1bf5d58b1cb38407682d8f1cefc554e22e1c5f55a7edfe9a74f6b1a39ef12937','[\"*\"]',NULL,NULL,'2026-06-03 14:54:15','2026-06-03 14:54:15'),(34,'App\\Models\\User',6,'auth_Token','6edc992044b44a6e230d50c3b923e41bfe7a4f328c62bf213c24230fcc12f3cc','[\"*\"]',NULL,NULL,'2026-06-03 14:57:53','2026-06-03 14:57:53'),(35,'App\\Models\\User',2,'auth_Token','1414624d216d32520b7ae8b919cd8a4787ec25d13a188207e702351e9d4331e8','[\"*\"]',NULL,NULL,'2026-06-03 14:58:29','2026-06-03 14:58:29'),(36,'App\\Models\\User',2,'auth_Token','4ea140897bec850f69d8f5a60a65a6136cb23c86c2ea0dc1dc6c3c0839255551','[\"*\"]',NULL,NULL,'2026-06-03 14:59:18','2026-06-03 14:59:18'),(53,'App\\Models\\User',10,'auth_Token','df4bfab76fc4667b23081a1047b23ca1d84b0b3920a27a921d8598f0303c8b30','[\"*\"]','2026-06-04 19:40:08',NULL,'2026-06-04 09:22:19','2026-06-04 19:40:08'),(56,'App\\Models\\User',6,'auth_Token','740c4bd95a1da7e0105c848ecdf03c6b5785aa8128e7c50518f012a19e74d617','[\"*\"]','2026-06-09 00:51:29',NULL,'2026-06-04 20:05:26','2026-06-09 00:51:29'),(79,'App\\Models\\User',24,'auth_Token','20c974335ef502af2ddb8a5def5da7dea77cd500725afc7ae8a731faeed496d4','[\"*\"]','2026-06-10 22:10:02',NULL,'2026-06-10 21:24:31','2026-06-10 22:10:02'),(87,'App\\Models\\User',49,'auth_Token','83940b50c9728b1bd05296ee98379733a3210112cc8ad8cabfe5c344fcc77a1f','[\"*\"]',NULL,NULL,'2026-06-10 23:42:17','2026-06-10 23:42:17'),(93,'App\\Models\\User',24,'auth_Token','a6ba1b59a99f5eb66167d69c20572eb99c8d6c896e444c8a20479ee22d5f6f62','[\"*\"]','2026-06-13 15:00:39',NULL,'2026-06-13 15:00:29','2026-06-13 15:00:39'),(94,'App\\Models\\User',24,'auth_Token','227010113d3c733707dbd570f82819284df875ab2b63225cb5ab18fd3c4774d0','[\"*\"]','2026-06-13 21:14:55',NULL,'2026-06-13 21:12:56','2026-06-13 21:14:55'),(96,'App\\Models\\User',2,'auth_Token','e1b0996a1257932b742439383dddda409b9533c648cffa15648a38584f05d703','[\"*\"]','2026-06-13 23:17:37',NULL,'2026-06-13 22:20:05','2026-06-13 23:17:37');
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quran_pages`
--

DROP TABLE IF EXISTS `quran_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quran_pages` (
  `page_number` smallint unsigned NOT NULL,
  `juz_number` tinyint unsigned NOT NULL,
  `juz_name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`page_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quran_pages`
--

LOCK TABLES `quran_pages` WRITE;
/*!40000 ALTER TABLE `quran_pages` DISABLE KEYS */;
INSERT INTO `quran_pages` VALUES (1,1,'الجزء الأول'),(2,1,'الجزء الأول'),(3,1,'الجزء الأول'),(4,1,'الجزء الأول'),(5,1,'الجزء الأول'),(6,1,'الجزء الأول'),(7,1,'الجزء الأول'),(8,1,'الجزء الأول'),(9,1,'الجزء الأول'),(10,1,'الجزء الأول'),(11,1,'الجزء الأول'),(12,1,'الجزء الأول'),(13,1,'الجزء الأول'),(14,1,'الجزء الأول'),(15,1,'الجزء الأول'),(16,1,'الجزء الأول'),(17,1,'الجزء الأول'),(18,1,'الجزء الأول'),(19,1,'الجزء الأول'),(20,1,'الجزء الأول'),(21,2,'الجزء الثاني'),(22,2,'الجزء الثاني'),(23,2,'الجزء الثاني'),(24,2,'الجزء الثاني'),(25,2,'الجزء الثاني'),(26,2,'الجزء الثاني'),(27,2,'الجزء الثاني'),(28,2,'الجزء الثاني'),(29,2,'الجزء الثاني'),(30,2,'الجزء الثاني'),(31,2,'الجزء الثاني'),(32,2,'الجزء الثاني'),(33,2,'الجزء الثاني'),(34,2,'الجزء الثاني'),(35,2,'الجزء الثاني'),(36,2,'الجزء الثاني'),(37,2,'الجزء الثاني'),(38,2,'الجزء الثاني'),(39,2,'الجزء الثاني'),(40,2,'الجزء الثاني'),(41,3,'الجزء الثالث'),(42,3,'الجزء الثالث'),(43,3,'الجزء الثالث'),(44,3,'الجزء الثالث'),(45,3,'الجزء الثالث'),(46,3,'الجزء الثالث'),(47,3,'الجزء الثالث'),(48,3,'الجزء الثالث'),(49,3,'الجزء الثالث'),(50,3,'الجزء الثالث'),(51,3,'الجزء الثالث'),(52,3,'الجزء الثالث'),(53,3,'الجزء الثالث'),(54,3,'الجزء الثالث'),(55,3,'الجزء الثالث'),(56,3,'الجزء الثالث'),(57,3,'الجزء الثالث'),(58,3,'الجزء الثالث'),(59,3,'الجزء الثالث'),(60,3,'الجزء الثالث'),(61,4,'الجزء الرابع'),(62,4,'الجزء الرابع'),(63,4,'الجزء الرابع'),(64,4,'الجزء الرابع'),(65,4,'الجزء الرابع'),(66,4,'الجزء الرابع'),(67,4,'الجزء الرابع'),(68,4,'الجزء الرابع'),(69,4,'الجزء الرابع'),(70,4,'الجزء الرابع'),(71,4,'الجزء الرابع'),(72,4,'الجزء الرابع'),(73,4,'الجزء الرابع'),(74,4,'الجزء الرابع'),(75,4,'الجزء الرابع'),(76,4,'الجزء الرابع'),(77,4,'الجزء الرابع'),(78,4,'الجزء الرابع'),(79,4,'الجزء الرابع'),(80,4,'الجزء الرابع'),(81,5,'الجزء الخامس'),(82,5,'الجزء الخامس'),(83,5,'الجزء الخامس'),(84,5,'الجزء الخامس'),(85,5,'الجزء الخامس'),(86,5,'الجزء الخامس'),(87,5,'الجزء الخامس'),(88,5,'الجزء الخامس'),(89,5,'الجزء الخامس'),(90,5,'الجزء الخامس'),(91,5,'الجزء الخامس'),(92,5,'الجزء الخامس'),(93,5,'الجزء الخامس'),(94,5,'الجزء الخامس'),(95,5,'الجزء الخامس'),(96,5,'الجزء الخامس'),(97,5,'الجزء الخامس'),(98,5,'الجزء الخامس'),(99,5,'الجزء الخامس'),(100,5,'الجزء الخامس'),(101,6,'الجزء السادس'),(102,6,'الجزء السادس'),(103,6,'الجزء السادس'),(104,6,'الجزء السادس'),(105,6,'الجزء السادس'),(106,6,'الجزء السادس'),(107,6,'الجزء السادس'),(108,6,'الجزء السادس'),(109,6,'الجزء السادس'),(110,6,'الجزء السادس'),(111,6,'الجزء السادس'),(112,6,'الجزء السادس'),(113,6,'الجزء السادس'),(114,6,'الجزء السادس'),(115,6,'الجزء السادس'),(116,6,'الجزء السادس'),(117,6,'الجزء السادس'),(118,6,'الجزء السادس'),(119,6,'الجزء السادس'),(120,6,'الجزء السادس'),(121,7,'الجزء السابع'),(122,7,'الجزء السابع'),(123,7,'الجزء السابع'),(124,7,'الجزء السابع'),(125,7,'الجزء السابع'),(126,7,'الجزء السابع'),(127,7,'الجزء السابع'),(128,7,'الجزء السابع'),(129,7,'الجزء السابع'),(130,7,'الجزء السابع'),(131,7,'الجزء السابع'),(132,7,'الجزء السابع'),(133,7,'الجزء السابع'),(134,7,'الجزء السابع'),(135,7,'الجزء السابع'),(136,7,'الجزء السابع'),(137,7,'الجزء السابع'),(138,7,'الجزء السابع'),(139,7,'الجزء السابع'),(140,7,'الجزء السابع'),(141,8,'الجزء الثامن'),(142,8,'الجزء الثامن'),(143,8,'الجزء الثامن'),(144,8,'الجزء الثامن'),(145,8,'الجزء الثامن'),(146,8,'الجزء الثامن'),(147,8,'الجزء الثامن'),(148,8,'الجزء الثامن'),(149,8,'الجزء الثامن'),(150,8,'الجزء الثامن'),(151,8,'الجزء الثامن'),(152,8,'الجزء الثامن'),(153,8,'الجزء الثامن'),(154,8,'الجزء الثامن'),(155,8,'الجزء الثامن'),(156,8,'الجزء الثامن'),(157,8,'الجزء الثامن'),(158,8,'الجزء الثامن'),(159,8,'الجزء الثامن'),(160,8,'الجزء الثامن'),(161,9,'الجزء التاسع'),(162,9,'الجزء التاسع'),(163,9,'الجزء التاسع'),(164,9,'الجزء التاسع'),(165,9,'الجزء التاسع'),(166,9,'الجزء التاسع'),(167,9,'الجزء التاسع'),(168,9,'الجزء التاسع'),(169,9,'الجزء التاسع'),(170,9,'الجزء التاسع'),(171,9,'الجزء التاسع'),(172,9,'الجزء التاسع'),(173,9,'الجزء التاسع'),(174,9,'الجزء التاسع'),(175,9,'الجزء التاسع'),(176,9,'الجزء التاسع'),(177,9,'الجزء التاسع'),(178,9,'الجزء التاسع'),(179,9,'الجزء التاسع'),(180,9,'الجزء التاسع'),(181,10,'الجزء العاشر'),(182,10,'الجزء العاشر'),(183,10,'الجزء العاشر'),(184,10,'الجزء العاشر'),(185,10,'الجزء العاشر'),(186,10,'الجزء العاشر'),(187,10,'الجزء العاشر'),(188,10,'الجزء العاشر'),(189,10,'الجزء العاشر'),(190,10,'الجزء العاشر'),(191,10,'الجزء العاشر'),(192,10,'الجزء العاشر'),(193,10,'الجزء العاشر'),(194,10,'الجزء العاشر'),(195,10,'الجزء العاشر'),(196,10,'الجزء العاشر'),(197,10,'الجزء العاشر'),(198,10,'الجزء العاشر'),(199,10,'الجزء العاشر'),(200,10,'الجزء العاشر'),(201,11,'الجزء الحادي عشر'),(202,11,'الجزء الحادي عشر'),(203,11,'الجزء الحادي عشر'),(204,11,'الجزء الحادي عشر'),(205,11,'الجزء الحادي عشر'),(206,11,'الجزء الحادي عشر'),(207,11,'الجزء الحادي عشر'),(208,11,'الجزء الحادي عشر'),(209,11,'الجزء الحادي عشر'),(210,11,'الجزء الحادي عشر'),(211,11,'الجزء الحادي عشر'),(212,11,'الجزء الحادي عشر'),(213,11,'الجزء الحادي عشر'),(214,11,'الجزء الحادي عشر'),(215,11,'الجزء الحادي عشر'),(216,11,'الجزء الحادي عشر'),(217,11,'الجزء الحادي عشر'),(218,11,'الجزء الحادي عشر'),(219,11,'الجزء الحادي عشر'),(220,11,'الجزء الحادي عشر'),(221,12,'الجزء الثاني عشر'),(222,12,'الجزء الثاني عشر'),(223,12,'الجزء الثاني عشر'),(224,12,'الجزء الثاني عشر'),(225,12,'الجزء الثاني عشر'),(226,12,'الجزء الثاني عشر'),(227,12,'الجزء الثاني عشر'),(228,12,'الجزء الثاني عشر'),(229,12,'الجزء الثاني عشر'),(230,12,'الجزء الثاني عشر'),(231,12,'الجزء الثاني عشر'),(232,12,'الجزء الثاني عشر'),(233,12,'الجزء الثاني عشر'),(234,12,'الجزء الثاني عشر'),(235,12,'الجزء الثاني عشر'),(236,12,'الجزء الثاني عشر'),(237,12,'الجزء الثاني عشر'),(238,12,'الجزء الثاني عشر'),(239,12,'الجزء الثاني عشر'),(240,12,'الجزء الثاني عشر'),(241,13,'الجزء الثالث عشر'),(242,13,'الجزء الثالث عشر'),(243,13,'الجزء الثالث عشر'),(244,13,'الجزء الثالث عشر'),(245,13,'الجزء الثالث عشر'),(246,13,'الجزء الثالث عشر'),(247,13,'الجزء الثالث عشر'),(248,13,'الجزء الثالث عشر'),(249,13,'الجزء الثالث عشر'),(250,13,'الجزء الثالث عشر'),(251,13,'الجزء الثالث عشر'),(252,13,'الجزء الثالث عشر'),(253,13,'الجزء الثالث عشر'),(254,13,'الجزء الثالث عشر'),(255,13,'الجزء الثالث عشر'),(256,13,'الجزء الثالث عشر'),(257,13,'الجزء الثالث عشر'),(258,13,'الجزء الثالث عشر'),(259,13,'الجزء الثالث عشر'),(260,13,'الجزء الثالث عشر'),(261,14,'الجزء الرابع عشر'),(262,14,'الجزء الرابع عشر'),(263,14,'الجزء الرابع عشر'),(264,14,'الجزء الرابع عشر'),(265,14,'الجزء الرابع عشر'),(266,14,'الجزء الرابع عشر'),(267,14,'الجزء الرابع عشر'),(268,14,'الجزء الرابع عشر'),(269,14,'الجزء الرابع عشر'),(270,14,'الجزء الرابع عشر'),(271,14,'الجزء الرابع عشر'),(272,14,'الجزء الرابع عشر'),(273,14,'الجزء الرابع عشر'),(274,14,'الجزء الرابع عشر'),(275,14,'الجزء الرابع عشر'),(276,14,'الجزء الرابع عشر'),(277,14,'الجزء الرابع عشر'),(278,14,'الجزء الرابع عشر'),(279,14,'الجزء الرابع عشر'),(280,14,'الجزء الرابع عشر'),(281,15,'الجزء الخامس عشر'),(282,15,'الجزء الخامس عشر'),(283,15,'الجزء الخامس عشر'),(284,15,'الجزء الخامس عشر'),(285,15,'الجزء الخامس عشر'),(286,15,'الجزء الخامس عشر'),(287,15,'الجزء الخامس عشر'),(288,15,'الجزء الخامس عشر'),(289,15,'الجزء الخامس عشر'),(290,15,'الجزء الخامس عشر'),(291,15,'الجزء الخامس عشر'),(292,15,'الجزء الخامس عشر'),(293,15,'الجزء الخامس عشر'),(294,15,'الجزء الخامس عشر'),(295,15,'الجزء الخامس عشر'),(296,15,'الجزء الخامس عشر'),(297,15,'الجزء الخامس عشر'),(298,15,'الجزء الخامس عشر'),(299,15,'الجزء الخامس عشر'),(300,15,'الجزء الخامس عشر'),(301,16,'الجزء السادس عشر'),(302,16,'الجزء السادس عشر'),(303,16,'الجزء السادس عشر'),(304,16,'الجزء السادس عشر'),(305,16,'الجزء السادس عشر'),(306,16,'الجزء السادس عشر'),(307,16,'الجزء السادس عشر'),(308,16,'الجزء السادس عشر'),(309,16,'الجزء السادس عشر'),(310,16,'الجزء السادس عشر'),(311,16,'الجزء السادس عشر'),(312,16,'الجزء السادس عشر'),(313,16,'الجزء السادس عشر'),(314,16,'الجزء السادس عشر'),(315,16,'الجزء السادس عشر'),(316,16,'الجزء السادس عشر'),(317,16,'الجزء السادس عشر'),(318,16,'الجزء السادس عشر'),(319,16,'الجزء السادس عشر'),(320,16,'الجزء السادس عشر'),(321,17,'الجزء السابع عشر'),(322,17,'الجزء السابع عشر'),(323,17,'الجزء السابع عشر'),(324,17,'الجزء السابع عشر'),(325,17,'الجزء السابع عشر'),(326,17,'الجزء السابع عشر'),(327,17,'الجزء السابع عشر'),(328,17,'الجزء السابع عشر'),(329,17,'الجزء السابع عشر'),(330,17,'الجزء السابع عشر'),(331,17,'الجزء السابع عشر'),(332,17,'الجزء السابع عشر'),(333,17,'الجزء السابع عشر'),(334,17,'الجزء السابع عشر'),(335,17,'الجزء السابع عشر'),(336,17,'الجزء السابع عشر'),(337,17,'الجزء السابع عشر'),(338,17,'الجزء السابع عشر'),(339,17,'الجزء السابع عشر'),(340,17,'الجزء السابع عشر'),(341,18,'الجزء الثامن عشر'),(342,18,'الجزء الثامن عشر'),(343,18,'الجزء الثامن عشر'),(344,18,'الجزء الثامن عشر'),(345,18,'الجزء الثامن عشر'),(346,18,'الجزء الثامن عشر'),(347,18,'الجزء الثامن عشر'),(348,18,'الجزء الثامن عشر'),(349,18,'الجزء الثامن عشر'),(350,18,'الجزء الثامن عشر'),(351,18,'الجزء الثامن عشر'),(352,18,'الجزء الثامن عشر'),(353,18,'الجزء الثامن عشر'),(354,18,'الجزء الثامن عشر'),(355,18,'الجزء الثامن عشر'),(356,18,'الجزء الثامن عشر'),(357,18,'الجزء الثامن عشر'),(358,18,'الجزء الثامن عشر'),(359,18,'الجزء الثامن عشر'),(360,18,'الجزء الثامن عشر'),(361,19,'الجزء التاسع عشر'),(362,19,'الجزء التاسع عشر'),(363,19,'الجزء التاسع عشر'),(364,19,'الجزء التاسع عشر'),(365,19,'الجزء التاسع عشر'),(366,19,'الجزء التاسع عشر'),(367,19,'الجزء التاسع عشر'),(368,19,'الجزء التاسع عشر'),(369,19,'الجزء التاسع عشر'),(370,19,'الجزء التاسع عشر'),(371,19,'الجزء التاسع عشر'),(372,19,'الجزء التاسع عشر'),(373,19,'الجزء التاسع عشر'),(374,19,'الجزء التاسع عشر'),(375,19,'الجزء التاسع عشر'),(376,19,'الجزء التاسع عشر'),(377,19,'الجزء التاسع عشر'),(378,19,'الجزء التاسع عشر'),(379,19,'الجزء التاسع عشر'),(380,19,'الجزء التاسع عشر'),(381,20,'الجزء العشرون'),(382,20,'الجزء العشرون'),(383,20,'الجزء العشرون'),(384,20,'الجزء العشرون'),(385,20,'الجزء العشرون'),(386,20,'الجزء العشرون'),(387,20,'الجزء العشرون'),(388,20,'الجزء العشرون'),(389,20,'الجزء العشرون'),(390,20,'الجزء العشرون'),(391,20,'الجزء العشرون'),(392,20,'الجزء العشرون'),(393,20,'الجزء العشرون'),(394,20,'الجزء العشرون'),(395,20,'الجزء العشرون'),(396,20,'الجزء العشرون'),(397,20,'الجزء العشرون'),(398,20,'الجزء العشرون'),(399,20,'الجزء العشرون'),(400,20,'الجزء العشرون'),(401,21,'الجزء الحادي والعشرون'),(402,21,'الجزء الحادي والعشرون'),(403,21,'الجزء الحادي والعشرون'),(404,21,'الجزء الحادي والعشرون'),(405,21,'الجزء الحادي والعشرون'),(406,21,'الجزء الحادي والعشرون'),(407,21,'الجزء الحادي والعشرون'),(408,21,'الجزء الحادي والعشرون'),(409,21,'الجزء الحادي والعشرون'),(410,21,'الجزء الحادي والعشرون'),(411,21,'الجزء الحادي والعشرون'),(412,21,'الجزء الحادي والعشرون'),(413,21,'الجزء الحادي والعشرون'),(414,21,'الجزء الحادي والعشرون'),(415,21,'الجزء الحادي والعشرون'),(416,21,'الجزء الحادي والعشرون'),(417,21,'الجزء الحادي والعشرون'),(418,21,'الجزء الحادي والعشرون'),(419,21,'الجزء الحادي والعشرون'),(420,21,'الجزء الحادي والعشرون'),(421,22,'الجزء الثاني والعشرون'),(422,22,'الجزء الثاني والعشرون'),(423,22,'الجزء الثاني والعشرون'),(424,22,'الجزء الثاني والعشرون'),(425,22,'الجزء الثاني والعشرون'),(426,22,'الجزء الثاني والعشرون'),(427,22,'الجزء الثاني والعشرون'),(428,22,'الجزء الثاني والعشرون'),(429,22,'الجزء الثاني والعشرون'),(430,22,'الجزء الثاني والعشرون'),(431,22,'الجزء الثاني والعشرون'),(432,22,'الجزء الثاني والعشرون'),(433,22,'الجزء الثاني والعشرون'),(434,22,'الجزء الثاني والعشرون'),(435,22,'الجزء الثاني والعشرون'),(436,22,'الجزء الثاني والعشرون'),(437,22,'الجزء الثاني والعشرون'),(438,22,'الجزء الثاني والعشرون'),(439,22,'الجزء الثاني والعشرون'),(440,22,'الجزء الثاني والعشرون'),(441,23,'الجزء الثالث والعشرون'),(442,23,'الجزء الثالث والعشرون'),(443,23,'الجزء الثالث والعشرون'),(444,23,'الجزء الثالث والعشرون'),(445,23,'الجزء الثالث والعشرون'),(446,23,'الجزء الثالث والعشرون'),(447,23,'الجزء الثالث والعشرون'),(448,23,'الجزء الثالث والعشرون'),(449,23,'الجزء الثالث والعشرون'),(450,23,'الجزء الثالث والعشرون'),(451,23,'الجزء الثالث والعشرون'),(452,23,'الجزء الثالث والعشرون'),(453,23,'الجزء الثالث والعشرون'),(454,23,'الجزء الثالث والعشرون'),(455,23,'الجزء الثالث والعشرون'),(456,23,'الجزء الثالث والعشرون'),(457,23,'الجزء الثالث والعشرون'),(458,23,'الجزء الثالث والعشرون'),(459,23,'الجزء الثالث والعشرون'),(460,23,'الجزء الثالث والعشرون'),(461,24,'الجزء الرابع والعشرون'),(462,24,'الجزء الرابع والعشرون'),(463,24,'الجزء الرابع والعشرون'),(464,24,'الجزء الرابع والعشرون'),(465,24,'الجزء الرابع والعشرون'),(466,24,'الجزء الرابع والعشرون'),(467,24,'الجزء الرابع والعشرون'),(468,24,'الجزء الرابع والعشرون'),(469,24,'الجزء الرابع والعشرون'),(470,24,'الجزء الرابع والعشرون'),(471,24,'الجزء الرابع والعشرون'),(472,24,'الجزء الرابع والعشرون'),(473,24,'الجزء الرابع والعشرون'),(474,24,'الجزء الرابع والعشرون'),(475,24,'الجزء الرابع والعشرون'),(476,24,'الجزء الرابع والعشرون'),(477,24,'الجزء الرابع والعشرون'),(478,24,'الجزء الرابع والعشرون'),(479,24,'الجزء الرابع والعشرون'),(480,24,'الجزء الرابع والعشرون'),(481,25,'الجزء الخامس والعشرون'),(482,25,'الجزء الخامس والعشرون'),(483,25,'الجزء الخامس والعشرون'),(484,25,'الجزء الخامس والعشرون'),(485,25,'الجزء الخامس والعشرون'),(486,25,'الجزء الخامس والعشرون'),(487,25,'الجزء الخامس والعشرون'),(488,25,'الجزء الخامس والعشرون'),(489,25,'الجزء الخامس والعشرون'),(490,25,'الجزء الخامس والعشرون'),(491,25,'الجزء الخامس والعشرون'),(492,25,'الجزء الخامس والعشرون'),(493,25,'الجزء الخامس والعشرون'),(494,25,'الجزء الخامس والعشرون'),(495,25,'الجزء الخامس والعشرون'),(496,25,'الجزء الخامس والعشرون'),(497,25,'الجزء الخامس والعشرون'),(498,25,'الجزء الخامس والعشرون'),(499,25,'الجزء الخامس والعشرون'),(500,25,'الجزء الخامس والعشرون'),(501,26,'الجزء السادس والعشرون'),(502,26,'الجزء السادس والعشرون'),(503,26,'الجزء السادس والعشرون'),(504,26,'الجزء السادس والعشرون'),(505,26,'الجزء السادس والعشرون'),(506,26,'الجزء السادس والعشرون'),(507,26,'الجزء السادس والعشرون'),(508,26,'الجزء السادس والعشرون'),(509,26,'الجزء السادس والعشرون'),(510,26,'الجزء السادس والعشرون'),(511,26,'الجزء السادس والعشرون'),(512,26,'الجزء السادس والعشرون'),(513,26,'الجزء السادس والعشرون'),(514,26,'الجزء السادس والعشرون'),(515,26,'الجزء السادس والعشرون'),(516,26,'الجزء السادس والعشرون'),(517,26,'الجزء السادس والعشرون'),(518,26,'الجزء السادس والعشرون'),(519,26,'الجزء السادس والعشرون'),(520,26,'الجزء السادس والعشرون'),(521,27,'الجزء السابع والعشرون'),(522,27,'الجزء السابع والعشرون'),(523,27,'الجزء السابع والعشرون'),(524,27,'الجزء السابع والعشرون'),(525,27,'الجزء السابع والعشرون'),(526,27,'الجزء السابع والعشرون'),(527,27,'الجزء السابع والعشرون'),(528,27,'الجزء السابع والعشرون'),(529,27,'الجزء السابع والعشرون'),(530,27,'الجزء السابع والعشرون'),(531,27,'الجزء السابع والعشرون'),(532,27,'الجزء السابع والعشرون'),(533,27,'الجزء السابع والعشرون'),(534,27,'الجزء السابع والعشرون'),(535,27,'الجزء السابع والعشرون'),(536,27,'الجزء السابع والعشرون'),(537,27,'الجزء السابع والعشرون'),(538,27,'الجزء السابع والعشرون'),(539,27,'الجزء السابع والعشرون'),(540,27,'الجزء السابع والعشرون'),(541,28,'الجزء الثامن والعشرون'),(542,28,'الجزء الثامن والعشرون'),(543,28,'الجزء الثامن والعشرون'),(544,28,'الجزء الثامن والعشرون'),(545,28,'الجزء الثامن والعشرون'),(546,28,'الجزء الثامن والعشرون'),(547,28,'الجزء الثامن والعشرون'),(548,28,'الجزء الثامن والعشرون'),(549,28,'الجزء الثامن والعشرون'),(550,28,'الجزء الثامن والعشرون'),(551,28,'الجزء الثامن والعشرون'),(552,28,'الجزء الثامن والعشرون'),(553,28,'الجزء الثامن والعشرون'),(554,28,'الجزء الثامن والعشرون'),(555,28,'الجزء الثامن والعشرون'),(556,28,'الجزء الثامن والعشرون'),(557,28,'الجزء الثامن والعشرون'),(558,28,'الجزء الثامن والعشرون'),(559,28,'الجزء الثامن والعشرون'),(560,28,'الجزء الثامن والعشرون'),(561,29,'الجزء التاسع والعشرون'),(562,29,'الجزء التاسع والعشرون'),(563,29,'الجزء التاسع والعشرون'),(564,29,'الجزء التاسع والعشرون'),(565,29,'الجزء التاسع والعشرون'),(566,29,'الجزء التاسع والعشرون'),(567,29,'الجزء التاسع والعشرون'),(568,29,'الجزء التاسع والعشرون'),(569,29,'الجزء التاسع والعشرون'),(570,29,'الجزء التاسع والعشرون'),(571,29,'الجزء التاسع والعشرون'),(572,29,'الجزء التاسع والعشرون'),(573,29,'الجزء التاسع والعشرون'),(574,29,'الجزء التاسع والعشرون'),(575,29,'الجزء التاسع والعشرون'),(576,29,'الجزء التاسع والعشرون'),(577,29,'الجزء التاسع والعشرون'),(578,29,'الجزء التاسع والعشرون'),(579,29,'الجزء التاسع والعشرون'),(580,29,'الجزء التاسع والعشرون'),(581,30,'الجزء الثلاثون'),(582,30,'الجزء الثلاثون'),(583,30,'الجزء الثلاثون'),(584,30,'الجزء الثلاثون'),(585,30,'الجزء الثلاثون'),(586,30,'الجزء الثلاثون'),(587,30,'الجزء الثلاثون'),(588,30,'الجزء الثلاثون'),(589,30,'الجزء الثلاثون'),(590,30,'الجزء الثلاثون'),(591,30,'الجزء الثلاثون'),(592,30,'الجزء الثلاثون'),(593,30,'الجزء الثلاثون'),(594,30,'الجزء الثلاثون'),(595,30,'الجزء الثلاثون'),(596,30,'الجزء الثلاثون'),(597,30,'الجزء الثلاثون'),(598,30,'الجزء الثلاثون'),(599,30,'الجزء الثلاثون'),(600,30,'الجزء الثلاثون'),(601,30,'الجزء الثلاثون'),(602,30,'الجزء الثلاثون'),(603,30,'الجزء الثلاثون'),(604,30,'الجزء الثلاثون');
/*!40000 ALTER TABLE `quran_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quran_progress`
--

DROP TABLE IF EXISTS `quran_progress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quran_progress` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `student_id` bigint unsigned NOT NULL,
  `halakat_id` bigint unsigned DEFAULT NULL,
  `teacher_id` bigint unsigned DEFAULT NULL,
  `surah_id` bigint unsigned DEFAULT NULL,
  `quran_page_number` smallint unsigned DEFAULT NULL,
  `from_aya` smallint unsigned DEFAULT NULL,
  `to_aya` smallint unsigned DEFAULT NULL,
  `juz_number` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `evaluation` enum('ممتاز','جيد جدا','جيد','اعادة') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `memorize_type` enum('حفظ','مراجعة') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'حفظ',
  `date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `quran_progress_halakat_id_foreign` (`halakat_id`),
  KEY `quran_progress_teacher_id_foreign` (`teacher_id`),
  KEY `quran_progress_surah_id_foreign` (`surah_id`),
  KEY `quran_progress_quran_page_number_foreign` (`quran_page_number`),
  KEY `quran_progress_student_id_teacher_id_index` (`student_id`,`teacher_id`),
  KEY `quran_progress_student_id_halakat_id_index` (`student_id`,`halakat_id`),
  KEY `quran_progress_date_index` (`date`),
  CONSTRAINT `quran_progress_halakat_id_foreign` FOREIGN KEY (`halakat_id`) REFERENCES `halakat` (`id`),
  CONSTRAINT `quran_progress_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`),
  CONSTRAINT `quran_progress_surah_id_foreign` FOREIGN KEY (`surah_id`) REFERENCES `surah` (`id`),
  CONSTRAINT `quran_progress_teacher_id_foreign` FOREIGN KEY (`teacher_id`) REFERENCES `users` (`id`),
  CONSTRAINT `check_ayah_range` CHECK ((`from_aya` <= `to_aya`)),
  CONSTRAINT `quran_progress_chk_1` CHECK (json_valid(`juz_number`))
) ENGINE=InnoDB AUTO_INCREMENT=268 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quran_progress`
--

LOCK TABLES `quran_progress` WRITE;
/*!40000 ALTER TABLE `quran_progress` DISABLE KEYS */;
INSERT INTO `quran_progress` VALUES (4,23,1,2,1,1,1,7,NULL,'جيد جدا','تلاوة واضحة','حفظ','2026-03-05',NULL,NULL),(5,23,1,2,2,2,1,5,NULL,'ممتاز','حفظ متقن','حفظ','2026-03-20',NULL,NULL),(6,24,2,3,36,442,1,10,NULL,'ممتاز','حفظ رائع','حفظ','2026-03-01',NULL,NULL),(7,24,2,3,36,443,11,20,NULL,'جيد جدا','استمر','حفظ','2026-03-18',NULL,NULL),(8,25,2,3,67,562,1,15,NULL,'جيد','تحتاج تحسين','حفظ','2026-03-10',NULL,NULL),(9,25,2,3,67,562,16,30,NULL,'جيد جدا','تحسن ملحوظ','حفظ','2026-04-01',NULL,NULL),(10,26,3,4,113,603,1,5,NULL,'ممتاز','إتقان كامل','حفظ','2026-03-01',NULL,NULL),(11,26,3,4,114,604,1,6,NULL,'ممتاز','أحسنت','حفظ','2026-03-15',NULL,NULL),(12,27,3,4,55,531,1,20,NULL,'جيد','يحتاج تمرين أكثر','حفظ','2026-03-05',NULL,NULL),(13,27,3,4,55,532,21,40,NULL,'جيد','التركيز على المخارج','حفظ','2026-03-22',NULL,NULL),(14,28,4,5,18,293,1,15,NULL,'جيد جدا','أداء جيد','حفظ','2026-03-01',NULL,NULL),(15,28,4,5,18,295,25,40,NULL,'ممتاز','تقدم ممتاز','حفظ','2026-03-20',NULL,NULL),(16,29,4,5,1,1,1,7,NULL,'جيد','يحتاج ممارسة أكثر','حفظ','2026-03-12',NULL,NULL),(17,29,4,5,109,599,1,6,NULL,'جيد جدا','أحسن الحفظ','حفظ','2026-04-05',NULL,NULL),(20,31,5,6,112,602,1,4,NULL,'ممتاز','حفظ ممتاز','حفظ','2026-03-10',NULL,NULL),(21,31,5,6,113,603,1,5,NULL,'ممتاز','استمر','حفظ','2026-04-01',NULL,NULL),(22,32,6,7,2,21,142,150,NULL,'جيد جدا','تقدم جيد','حفظ','2026-03-01',NULL,NULL),(23,32,6,7,2,23,155,162,NULL,'ممتاز','حفظ متقن','حفظ','2026-03-20',NULL,NULL),(24,33,6,7,3,62,1,10,NULL,'جيد','يحتاج تركيز','حفظ','2026-03-15',NULL,NULL),(25,33,6,7,3,63,11,20,NULL,'جيد جدا','تحسن واضح','حفظ','2026-04-01',NULL,NULL),(26,34,7,8,87,591,1,19,NULL,'ممتاز','أحسنت','حفظ','2026-03-05',NULL,NULL),(27,34,7,8,88,592,1,26,NULL,'جيد جدا','عمل ممتاز','حفظ','2026-03-22',NULL,NULL),(28,35,7,8,1,1,1,7,NULL,'اعادة','يحتاج مراجعة الفاتحة','حفظ','2026-03-10',NULL,NULL),(29,35,7,8,1,1,1,7,NULL,'جيد','تحسن بعد المراجعة','حفظ','2026-04-01',NULL,NULL),(30,36,8,9,111,599,1,5,NULL,'ممتاز','حفظ متقن','حفظ','2026-03-01',NULL,NULL),(31,36,8,9,112,602,1,4,NULL,'ممتاز','أداء رائع','حفظ','2026-03-18',NULL,NULL),(32,37,8,9,103,598,1,3,NULL,'جيد جدا','جيد','حفظ','2026-03-25',NULL,NULL),(33,37,8,9,104,598,1,9,NULL,'جيد','يحتاج تحسين النطق','حفظ','2026-04-05',NULL,NULL),(34,38,9,10,56,535,1,30,NULL,'ممتاز','حفظ متقن','حفظ','2026-03-01',NULL,NULL),(35,38,9,10,56,537,31,60,NULL,'جيد جدا','استمر','حفظ','2026-03-20',NULL,NULL),(36,39,9,10,110,600,1,3,NULL,'جيد','بداية جيدة','حفظ','2026-03-28',NULL,NULL),(37,39,9,10,109,599,1,6,NULL,'جيد جدا','أداء جيد','حفظ','2026-04-10',NULL,NULL),(38,40,10,11,14,255,1,15,NULL,'جيد','يحتاج مراجعة','حفظ','2026-03-05',NULL,NULL),(39,40,10,11,14,256,16,30,NULL,'جيد جدا','تحسن','حفظ','2026-03-25',NULL,NULL),(40,41,10,11,1,1,1,7,NULL,'ممتاز','حفظ متقن','حفظ','2026-03-15',NULL,NULL),(41,41,10,11,2,2,1,5,NULL,'جيد جدا','استمر','حفظ','2026-04-01',NULL,NULL),(45,23,1,2,1,1,1,7,NULL,'جيد جدا','تلاوة واضحة','حفظ','2026-03-05','2026-05-13 18:12:25','2026-05-13 18:12:25'),(46,23,1,2,2,2,1,5,NULL,'ممتاز','حفظ متقن','حفظ','2026-03-20','2026-05-13 18:12:25','2026-05-13 18:12:25'),(47,24,2,3,36,442,1,10,NULL,'ممتاز','حفظ رائع','حفظ','2026-03-01','2026-05-13 18:12:25','2026-05-13 18:12:25'),(48,24,2,3,36,443,11,20,NULL,'جيد جدا','استمر','حفظ','2026-03-18','2026-05-13 18:12:25','2026-05-13 18:12:25'),(49,25,2,3,67,562,1,15,NULL,'جيد','تحتاج تحسين','حفظ','2026-03-10','2026-05-13 18:12:25','2026-05-13 18:12:25'),(50,25,2,3,67,562,16,30,NULL,'جيد جدا','تحسن ملحوظ','حفظ','2026-04-01','2026-05-13 18:12:25','2026-05-13 18:12:25'),(51,26,3,4,113,603,1,5,NULL,'ممتاز','إتقان كامل','حفظ','2026-03-01','2026-05-13 18:12:25','2026-05-13 18:12:25'),(52,26,3,4,114,604,1,6,NULL,'ممتاز','أحسنت','حفظ','2026-03-15','2026-05-13 18:12:25','2026-05-13 18:12:25'),(53,27,3,4,55,531,1,20,NULL,'جيد','يحتاج تمرين أكثر','حفظ','2026-03-05','2026-05-13 18:12:25','2026-05-13 18:12:25'),(54,27,3,4,55,532,21,40,NULL,'جيد','التركيز على المخارج','حفظ','2026-03-22','2026-05-13 18:12:25','2026-05-13 18:12:25'),(55,28,4,5,18,293,1,15,NULL,'جيد جدا','أداء جيد','حفظ','2026-03-01','2026-05-13 18:12:25','2026-05-13 18:12:25'),(56,28,4,5,18,295,25,40,NULL,'ممتاز','تقدم ممتاز','حفظ','2026-03-20','2026-05-13 18:12:25','2026-05-13 18:12:25'),(57,29,4,5,1,1,1,7,NULL,'جيد','يحتاج ممارسة أكثر','حفظ','2026-03-12','2026-05-13 18:12:25','2026-05-13 18:12:25'),(58,29,4,5,109,599,1,6,NULL,'جيد جدا','أحسن الحفظ','حفظ','2026-04-05','2026-05-13 18:12:25','2026-05-13 18:12:25'),(61,31,5,6,112,602,1,4,NULL,'ممتاز','حفظ ممتاز','حفظ','2026-03-10','2026-05-13 18:12:25','2026-05-13 18:12:25'),(62,31,5,6,113,603,1,5,NULL,'ممتاز','استمر','حفظ','2026-04-01','2026-05-13 18:12:25','2026-05-13 18:12:25'),(63,32,6,7,2,21,142,150,NULL,'جيد جدا','تقدم جيد','حفظ','2026-03-01','2026-05-13 18:12:25','2026-05-13 18:12:25'),(64,32,6,7,2,23,155,162,NULL,'ممتاز','حفظ متقن','حفظ','2026-03-20','2026-05-13 18:12:25','2026-05-13 18:12:25'),(65,33,6,7,3,62,1,10,NULL,'جيد','يحتاج تركيز','حفظ','2026-03-15','2026-05-13 18:12:25','2026-05-13 18:12:25'),(66,33,6,7,3,63,11,20,NULL,'جيد جدا','تحسن واضح','حفظ','2026-04-01','2026-05-13 18:12:25','2026-05-13 18:12:25'),(67,34,7,8,87,591,1,19,NULL,'ممتاز','أحسنت','حفظ','2026-03-05','2026-05-13 18:12:25','2026-05-13 18:12:25'),(68,34,7,8,88,592,1,26,NULL,'جيد جدا','عمل ممتاز','حفظ','2026-03-22','2026-05-13 18:12:25','2026-05-13 18:12:25'),(69,35,7,8,1,1,1,7,NULL,'اعادة','يحتاج مراجعة الفاتحة','حفظ','2026-03-10','2026-05-13 18:12:25','2026-05-13 18:12:25'),(70,35,7,8,1,1,1,7,NULL,'جيد','تحسن بعد المراجعة','حفظ','2026-04-01','2026-05-13 18:12:25','2026-05-13 18:12:25'),(71,36,8,9,111,599,1,5,NULL,'ممتاز','حفظ متقن','حفظ','2026-03-01','2026-05-13 18:12:25','2026-05-13 18:12:25'),(72,36,8,9,112,602,1,4,NULL,'ممتاز','أداء رائع','حفظ','2026-03-18','2026-05-13 18:12:25','2026-05-13 18:12:25'),(73,37,8,9,103,598,1,3,NULL,'جيد جدا','جيد','حفظ','2026-03-25','2026-05-13 18:12:25','2026-05-13 18:12:25'),(74,37,8,9,104,598,1,9,NULL,'جيد','يحتاج تحسين النطق','حفظ','2026-04-05','2026-05-13 18:12:25','2026-05-13 18:12:25'),(75,38,9,10,56,535,1,30,NULL,'ممتاز','حفظ متقن','حفظ','2026-03-01','2026-05-13 18:12:25','2026-05-13 18:12:25'),(76,38,9,10,56,537,31,60,NULL,'جيد جدا','استمر','حفظ','2026-03-20','2026-05-13 18:12:25','2026-05-13 18:12:25'),(77,39,9,10,110,600,1,3,NULL,'جيد','بداية جيدة','حفظ','2026-03-28','2026-05-13 18:12:25','2026-05-13 18:12:25'),(78,39,9,10,109,599,1,6,NULL,'جيد جدا','أداء جيد','حفظ','2026-04-10','2026-05-13 18:12:25','2026-05-13 18:12:25'),(79,40,10,11,14,255,1,15,NULL,'جيد','يحتاج مراجعة','حفظ','2026-03-05','2026-05-13 18:12:25','2026-05-13 18:12:25'),(80,40,10,11,14,256,16,30,NULL,'جيد جدا','تحسن','حفظ','2026-03-25','2026-05-13 18:12:25','2026-05-13 18:12:25'),(81,41,10,11,1,1,1,7,NULL,'ممتاز','حفظ متقن','حفظ','2026-03-15','2026-05-13 18:12:25','2026-05-13 18:12:25'),(82,41,10,11,2,2,1,5,NULL,'جيد جدا','استمر','حفظ','2026-04-01','2026-05-13 18:12:25','2026-05-13 18:12:25'),(83,39,9,10,1,1,1,7,NULL,'ممتاز',NULL,'مراجعة','2026-04-20','2026-05-13 18:32:59','2026-05-13 18:32:59'),(84,39,9,10,36,440,1,10,NULL,'جيد جدا',NULL,'مراجعة','2026-05-01','2026-05-13 18:32:59','2026-05-13 18:32:59'),(85,26,3,4,1,1,1,7,NULL,'جيد','o','حفظ','2026-05-14','2026-05-14 07:41:19','2026-05-14 07:41:19'),(86,31,5,6,1,1,1,7,NULL,'جيد جدا',NULL,'حفظ','2026-05-14','2026-05-14 07:42:09','2026-05-14 07:42:09'),(88,40,10,11,1,7,1,55,NULL,'ممتاز','o','حفظ','2026-05-14','2026-05-14 07:51:08','2026-05-14 07:51:08'),(89,34,7,8,1,1,1,7,NULL,'ممتاز','rrrr','حفظ','2026-05-14','2026-05-14 07:52:23','2026-05-14 07:52:23'),(90,38,9,10,1,1,1,7,NULL,'ممتاز','[]','حفظ','2026-05-14','2026-05-14 08:10:06','2026-05-14 08:10:06'),(91,40,10,11,2,21,12,125,'1','جيد جدا',';k','حفظ','2026-05-14','2026-05-14 08:16:13','2026-05-14 08:16:13'),(92,40,10,11,11,NULL,1,10,NULL,'ممتاز','god bless you','حفظ','2026-05-14','2026-05-14 08:55:36','2026-05-14 08:55:36'),(93,40,10,11,1,550,1,14,NULL,'جيد جدا','nice','حفظ','2026-05-14','2026-05-14 08:57:33','2026-05-14 08:57:33'),(94,39,9,10,16,552,1,7,NULL,'ممتاز','[[[','حفظ','2026-05-14','2026-05-14 08:58:50','2026-05-14 08:58:50'),(95,33,6,7,12,555,1,7,NULL,'ممتاز','ح','حفظ','2026-05-14','2026-05-14 09:06:29','2026-05-14 09:06:29'),(97,36,8,9,1,1,1,7,NULL,'ممتاز','ghjgj','حفظ','2026-05-14','2026-05-14 09:09:51','2026-05-14 09:09:51'),(98,34,7,8,67,564,27,30,NULL,'جيد جدا','bbb','حفظ','2026-05-14','2026-05-14 09:11:26','2026-05-14 09:11:26'),(99,28,4,5,77,581,20,50,'29','جيد جدا','fffgfgfff','حفظ','2026-05-14','2026-05-14 09:13:19','2026-05-14 09:13:19'),(100,28,4,5,2,1,1,100,NULL,'ممتاز',NULL,'مراجعة','2026-05-14','2026-05-14 09:15:47','2026-05-14 09:15:47'),(101,34,7,8,6,1,1,10,NULL,'ممتاز','thank you for reading','حفظ','2026-05-16','2026-05-16 09:50:55','2026-05-16 09:50:55'),(102,33,6,7,16,267,1,6,NULL,'ممتاز','--','حفظ','2026-05-16','2026-05-16 09:52:46','2026-05-16 09:52:46'),(103,41,10,11,13,1,35,43,NULL,'جيد جدا','good good good','حفظ','2026-05-16','2026-05-16 09:59:14','2026-05-16 09:59:14'),(104,24,2,3,1,NULL,1,7,NULL,'ممتاز','*-----*','حفظ','2026-05-16','2026-05-16 10:35:44','2026-05-16 10:35:44'),(105,40,10,11,113,NULL,NULL,NULL,NULL,'جيد جدا','cff','حفظ','2026-05-16','2026-05-16 10:47:38','2026-05-16 10:47:38'),(111,40,10,11,112,NULL,1,4,NULL,'ممتاز',NULL,'حفظ','2026-05-16','2026-05-16 12:05:16','2026-05-16 12:05:16'),(112,40,10,11,113,NULL,1,5,NULL,'ممتاز',NULL,'حفظ','2026-05-16','2026-05-16 12:05:48','2026-05-16 12:05:48'),(113,40,10,11,114,NULL,1,6,NULL,'جيد جدا',NULL,'حفظ','2026-05-16','2026-05-16 12:07:39','2026-05-16 12:07:39'),(115,40,10,11,1,NULL,NULL,NULL,'[\"1\",\"2\"]','جيد',NULL,'حفظ','2026-05-16','2026-05-16 18:28:35','2026-05-16 18:28:35'),(116,40,10,11,6,NULL,1,150,NULL,'جيد جدا',NULL,'حفظ','2026-05-16','2026-05-16 18:30:30','2026-05-16 18:30:30'),(118,39,9,10,1,NULL,NULL,NULL,'[\"1\",\"2\",\"3\"]','جيد','تمت مراجعة الاجزاء الثلاثه بنجاح بارك الله بك','مراجعة','2026-05-16','2026-05-16 18:50:38','2026-05-16 18:50:38'),(120,39,9,10,19,NULL,NULL,NULL,'[\"26\",\"27\",\"28\"]','جيد جدا','تمت المراجعه','مراجعة','2026-05-16','2026-05-16 18:53:48','2026-05-16 18:53:48'),(121,39,9,10,NULL,NULL,NULL,NULL,'[\"28\",\"29\",\"30\"]','ممتاز','تمت مراجعة الاجزاء بنجاح \r\nجزاك الله كل خير','مراجعة','2026-05-16','2026-05-16 19:07:50','2026-05-16 19:07:50'),(122,40,10,11,106,NULL,1,4,NULL,'جيد جدا','ركز على احكام الايه 4','حفظ','2026-05-16','2026-05-16 19:18:18','2026-05-16 19:18:18'),(124,34,7,8,2,NULL,NULL,NULL,NULL,'جيد','revison first 10 pages','مراجعة','2026-05-19','2026-05-19 09:53:11','2026-05-19 09:53:11'),(127,40,10,11,NULL,NULL,NULL,NULL,'[\"4\"]','ممتاز','تم حفظ الجزء الثالث','حفظ','2026-05-19','2026-05-19 10:41:32','2026-05-19 10:41:32'),(128,40,10,11,2,NULL,25,125,NULL,'ممتاز','تم الوصول للايه 125 بنجاح','حفظ','2026-05-19','2026-05-19 10:43:32','2026-05-19 10:43:32'),(137,41,10,11,6,NULL,1,50,NULL,'جيد',NULL,'حفظ','2026-06-01','2026-06-01 20:46:09','2026-06-01 20:46:09'),(139,49,1,2,99,NULL,1,4,NULL,'ممتاز',NULL,'حفظ','2026-06-01','2026-06-01 20:53:09','2026-06-01 20:53:09'),(140,35,1,2,89,NULL,1,10,NULL,'ممتاز',NULL,'حفظ','2026-06-01','2026-06-01 20:53:31','2026-06-01 20:53:31'),(149,31,5,6,99,NULL,NULL,NULL,NULL,'ممتاز',NULL,'حفظ','2026-06-01','2026-06-01 21:57:16','2026-06-01 21:57:16'),(150,31,5,6,99,NULL,1,5,NULL,'ممتاز',NULL,'حفظ','2026-06-01','2026-06-01 21:57:37','2026-06-01 21:57:37'),(151,39,5,6,7,NULL,NULL,NULL,NULL,'اعادة',NULL,'حفظ','2026-06-01','2026-06-01 21:58:03','2026-06-01 21:58:03'),(152,30,5,6,77,NULL,5,40,NULL,'جيد جدا',NULL,'حفظ','2026-06-01','2026-06-01 21:58:46','2026-06-01 21:58:46'),(159,31,5,6,9,NULL,NULL,NULL,NULL,'جيد جدا',NULL,'حفظ','2026-06-01','2026-06-01 22:08:06','2026-06-01 22:08:06'),(161,23,2,3,12,NULL,1,50,NULL,'جيد جدا',NULL,'حفظ','2026-06-01','2026-06-01 22:33:42','2026-06-01 22:33:42'),(162,32,6,7,10,NULL,1,109,NULL,'ممتاز',NULL,'حفظ','2026-06-01','2026-06-01 22:56:30','2026-06-01 22:56:30'),(164,25,2,3,12,NULL,1,111,NULL,'ممتاز',NULL,'حفظ','2026-06-03','2026-06-03 19:24:52','2026-06-03 19:24:52'),(165,39,5,6,13,NULL,1,43,NULL,'جيد جدا',NULL,'حفظ','2026-06-03','2026-06-03 20:16:14','2026-06-03 20:16:14'),(166,39,5,6,11,NULL,1,123,NULL,'جيد',NULL,'حفظ','2026-06-03','2026-06-03 20:16:50','2026-06-03 20:16:50'),(199,38,9,10,NULL,NULL,NULL,NULL,NULL,'ممتاز',NULL,'حفظ','2026-06-04','2026-06-04 10:16:10','2026-06-04 10:16:10'),(206,38,9,10,9,NULL,1,100,'[10]','ممتاز','أحسنت يا عمران','مراجعة','2026-06-04','2026-06-04 19:19:59','2026-06-04 19:19:59'),(207,23,2,3,NULL,NULL,NULL,NULL,'[9]','ممتاز',NULL,'حفظ','2026-06-04','2026-06-04 19:27:32','2026-06-04 19:27:32'),(208,25,2,3,12,NULL,NULL,NULL,NULL,'جيد',NULL,'مراجعة','2026-06-04','2026-06-04 19:27:43','2026-06-04 19:27:43'),(209,24,2,3,56,NULL,NULL,NULL,'[5]','جيد جدا',NULL,'مراجعة','2026-06-04','2026-06-04 19:28:00','2026-06-04 19:28:00'),(210,24,2,3,7,NULL,1,200,NULL,'ممتاز',NULL,'حفظ','2026-06-04','2026-06-04 19:35:21','2026-06-04 19:35:21'),(211,24,2,3,7,NULL,1,206,NULL,'ممتاز',NULL,'حفظ','2026-06-04','2026-06-04 19:37:17','2026-06-04 19:37:17'),(212,24,2,3,7,NULL,1,206,'[20]','جيد',NULL,'حفظ','2026-06-04','2026-06-04 19:38:14','2026-06-04 19:38:14'),(213,24,2,3,9,NULL,5,10,NULL,'ممتاز','جزاك الله خيرا','حفظ','2026-06-04','2026-06-04 19:49:08','2026-06-04 19:49:08'),(215,50,1,2,7,NULL,1,206,'[27]','جيد جدا',NULL,'حفظ','2026-06-04','2026-06-04 21:00:21','2026-06-04 21:00:21'),(217,50,1,2,12,NULL,1,111,NULL,'ممتاز','برافو عليك','حفظ','2026-06-04','2026-06-04 21:19:13','2026-06-04 21:19:13'),(218,26,3,4,8,NULL,1,75,'[29]','جيد جدا','أحسنت يا طارق','حفظ','2026-06-05','2026-06-05 01:18:23','2026-06-05 01:18:23'),(220,22,1,2,9,NULL,1,129,NULL,'ممتاز',NULL,'حفظ','2026-06-03','2026-06-05 18:41:51','2026-06-05 18:41:51'),(221,40,2,10,3,NULL,5,150,'[4]','جيد','ااااامنلببب','حفظ','2026-06-04','2026-06-05 19:02:07','2026-06-05 19:02:07'),(222,26,3,4,11,NULL,1,123,NULL,'ممتاز','أحسنت يا طارق','حفظ','2026-06-08','2026-06-08 22:25:56','2026-06-08 22:25:56'),(223,26,3,4,11,NULL,NULL,NULL,'[14]','اعادة','ركز أكثر','مراجعة','2026-06-08','2026-06-08 22:28:00','2026-06-08 22:28:00'),(224,27,3,4,62,NULL,1,11,NULL,'ممتاز','أحسنتي الحفظ ثابري','حفظ','2026-06-08','2026-06-08 22:30:46','2026-06-08 22:30:46'),(225,27,3,4,NULL,NULL,NULL,NULL,'[1,2,3,4,5]','جيد جدا',NULL,'حفظ','2026-06-08','2026-06-08 22:32:20','2026-06-08 22:32:20'),(226,50,1,2,NULL,NULL,NULL,NULL,'[10,9,8]','ممتاز','أحسنت يا حمزة','حفظ','2026-06-08','2026-06-08 22:44:10','2026-06-08 22:44:10'),(227,22,1,2,NULL,NULL,NULL,NULL,'[1,2,3,4,5,6]','جيد جدا',NULL,'حفظ','2026-06-08','2026-06-08 22:46:55','2026-06-08 22:46:55'),(228,50,1,2,NULL,NULL,NULL,NULL,'[7]','ممتاز',NULL,'حفظ','2026-06-08','2026-06-08 22:48:09','2026-06-08 22:48:09'),(229,50,1,2,NULL,NULL,NULL,NULL,'[10,9,8,7,6]','جيد جدا',NULL,'مراجعة','2026-06-08','2026-06-08 22:49:19','2026-06-08 22:49:19'),(230,35,1,2,NULL,NULL,NULL,NULL,'[6]','ممتاز',NULL,'حفظ','2026-06-08','2026-06-08 22:50:21','2026-06-08 22:50:21'),(231,27,3,4,NULL,NULL,NULL,NULL,'[8]','ممتاز',NULL,'حفظ','2026-06-08','2026-06-08 22:52:37','2026-06-08 22:52:37'),(232,26,3,4,NULL,NULL,NULL,NULL,'[17]','جيد جدا',NULL,'حفظ','2026-06-08','2026-06-08 22:53:37','2026-06-08 22:53:37'),(233,39,5,6,NULL,NULL,NULL,NULL,'[1,2]','ممتاز','ممتاز جدا حياك الله','حفظ','2026-06-08','2026-06-08 22:58:34','2026-06-08 22:58:34'),(234,26,3,4,NULL,NULL,NULL,NULL,'[5,6]','ممتاز',NULL,'حفظ','2026-06-08','2026-06-08 23:13:52','2026-06-08 23:13:52'),(235,27,3,4,NULL,NULL,NULL,NULL,'[8,9]','ممتاز',NULL,'مراجعة','2026-06-08','2026-06-08 23:15:00','2026-06-08 23:15:00'),(236,26,3,4,NULL,NULL,NULL,NULL,'[9,10]','ممتاز',NULL,'مراجعة','2026-06-08','2026-06-08 23:15:14','2026-06-08 23:15:14'),(237,26,3,4,NULL,NULL,NULL,NULL,'[7]','جيد جدا',NULL,'حفظ','2026-06-08','2026-06-08 23:20:57','2026-06-08 23:20:57'),(238,26,3,4,NULL,NULL,NULL,NULL,'[22,21,20,19,18,17,16,15,14,13]','جيد جدا',NULL,'حفظ','2026-06-08','2026-06-08 23:22:53','2026-06-08 23:22:53'),(239,27,3,4,NULL,NULL,NULL,NULL,'[20,19,18,17]','جيد',NULL,'حفظ','2026-06-08','2026-06-08 23:24:53','2026-06-08 23:24:53'),(240,27,3,4,NULL,NULL,NULL,NULL,'[26,25,24,23]','جيد جدا',NULL,'مراجعة','2026-06-08','2026-06-08 23:26:26','2026-06-08 23:26:26'),(241,27,3,4,NULL,NULL,NULL,NULL,'[26,25,24,23]','جيد جدا',NULL,'مراجعة','2026-06-08','2026-06-08 23:26:45','2026-06-08 23:26:45'),(242,27,3,4,NULL,NULL,NULL,NULL,'[14]','ممتاز',NULL,'حفظ','2026-06-08','2026-06-08 23:29:21','2026-06-08 23:29:21'),(243,27,3,4,NULL,NULL,NULL,NULL,'[10]','ممتاز',NULL,'حفظ','2026-06-08','2026-06-08 23:30:14','2026-06-08 23:30:14'),(244,27,3,4,NULL,NULL,NULL,NULL,'[16]','جيد جدا',NULL,'حفظ','2026-06-08','2026-06-08 23:32:14','2026-06-08 23:32:14'),(245,26,3,4,NULL,NULL,NULL,NULL,'[8]','ممتاز',NULL,'حفظ','2026-06-08','2026-06-08 23:40:21','2026-06-08 23:40:21'),(246,27,3,4,NULL,NULL,NULL,NULL,'[21]','ممتاز',NULL,'حفظ','2026-06-08','2026-06-08 23:48:49','2026-06-08 23:48:49'),(247,27,3,4,NULL,NULL,NULL,NULL,'[25]','ممتاز',NULL,'حفظ','2026-06-08','2026-06-08 23:50:27','2026-06-08 23:50:27'),(248,27,3,4,NULL,NULL,NULL,NULL,'[8]','ممتاز',NULL,'حفظ','2026-06-09','2026-06-09 00:00:28','2026-06-09 00:00:28'),(249,27,3,4,4,NULL,1,8,NULL,'ممتاز','رائع','حفظ','2026-06-09','2026-06-09 00:21:58','2026-06-09 00:21:58'),(250,27,3,4,NULL,NULL,NULL,NULL,'[8]','ممتاز',NULL,'حفظ','2026-06-09','2026-06-09 00:29:36','2026-06-09 00:29:36'),(251,26,3,4,NULL,NULL,NULL,NULL,'[5,4]','ممتاز','جزاك الله خيرا','حفظ','2026-06-09','2026-06-09 00:44:50','2026-06-09 00:44:50'),(252,31,5,6,2,NULL,255,280,NULL,'ممتاز','جزاك الله خيرا','حفظ','2026-06-09','2026-06-09 16:31:06','2026-06-09 16:31:06'),(253,39,5,6,44,NULL,NULL,NULL,NULL,'ممتاز','مراجعة ممتازه حافظ على تقدمك','مراجعة','2026-06-09','2026-06-09 16:32:02','2026-06-09 16:32:02'),(254,31,5,6,NULL,NULL,NULL,NULL,'[17]','جيد جدا',NULL,'حفظ','2026-06-10','2026-06-10 11:23:50','2026-06-10 11:23:50'),(255,49,1,2,1,NULL,1,7,NULL,'جيد جدا','ممتاز جدا جدا','حفظ','2026-06-11','2026-06-11 00:11:28','2026-06-11 00:11:28'),(256,49,1,2,NULL,NULL,NULL,NULL,'[\"1\",\"2\"]','جيد','ركز اكثر','حفظ','2026-06-11','2026-06-11 00:11:52','2026-06-11 00:11:52'),(257,49,1,2,NULL,NULL,NULL,NULL,'[\"2\",\"4\"]','ممتاز','بالتوفيق','مراجعة','2026-06-11','2026-06-11 00:12:17','2026-06-11 00:12:17'),(258,40,2,3,2,NULL,1,200,'[\"27\"]','جيد','رائع','حفظ','2026-06-11','2026-06-11 00:13:02','2026-06-11 00:13:02'),(259,49,1,2,2,NULL,NULL,NULL,NULL,'ممتاز','مراجعة سورة البقره كاملا','مراجعة','2026-06-11','2026-06-11 00:14:29','2026-06-11 00:14:29'),(260,49,1,2,11,NULL,1,120,NULL,'ممتاز','تم الوصول للايه 120 بنجاح','حفظ','2026-06-11','2026-06-11 00:15:21','2026-06-11 00:15:21'),(261,31,5,6,22,NULL,2,10,NULL,'جيد جدا','أحسنت بارك الله بك','حفظ','2026-06-12','2026-06-12 23:48:19','2026-06-12 23:48:19'),(262,39,5,6,11,NULL,25,70,NULL,'اعادة','ركز على المدوود','حفظ','2026-06-12','2026-06-12 23:49:12','2026-06-12 23:49:12'),(263,22,1,2,7,NULL,NULL,NULL,NULL,'ممتاز','أحسنت','حفظ','2026-06-13','2026-06-13 22:50:45','2026-06-13 22:50:45'),(264,22,1,2,8,NULL,NULL,NULL,'[6]','جيد جدا',NULL,'حفظ','2026-06-13','2026-06-13 23:09:04','2026-06-13 23:09:04'),(265,22,1,2,8,NULL,NULL,NULL,'[6]','جيد جدا',NULL,'حفظ','2026-06-13','2026-06-13 23:09:31','2026-06-13 23:09:31'),(266,22,1,2,9,NULL,1,15,NULL,'جيد','ممتاز','حفظ','2026-06-13','2026-06-13 23:15:58','2026-06-13 23:15:58'),(267,22,1,2,9,NULL,1,15,NULL,'جيد','ممتاز','حفظ','2026-06-13','2026-06-13 23:16:12','2026-06-13 23:16:12');
/*!40000 ALTER TABLE `quran_progress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('5eKV3gUbrd7ybM09IEfJiJ9Lpru5GwLZrFl0FiWh',NULL,'172.20.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36','YTo2OntzOjY6Il90b2tlbiI7czo0MDoiWG1JaWN0Q0tSdHRxMzl4Q1Q1dFp6RlMxak9XM1FwcHNTY25paGk5NiI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjQ3OiJodHRwOi8vbG9jYWxob3N0OjgwODAvYWRtaW4vc3R1ZGVudC1hY2hpZXZlbWVudCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTU6ImxvZ2luX2JhY2twYWNrXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjIyOiJwYXNzd29yZF9oYXNoX2JhY2twYWNrIjtzOjYwOiIkMnkkMTIkdktndnNNWEQxNmtTbGZ1QmxNY0hhT0FuVlpNOGgwUkhjb3hLeWxvUUV0YVpWR25KNWxiaTIiO30=',1781354616),('qtkiNXA3NTKxbdo0tb08wIHiFD1Y3N5D0nGsiRAj',NULL,'172.20.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36','YTo2OntzOjY6Il90b2tlbiI7czo0MDoiZ1BJZjdFTlZkaFV4a2Q4dE1iWkhobnVmZ2VGMVFzM2NuTHdkejUybSI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjM3OiJodHRwOi8vbG9jYWxob3N0OjgwODAvYWRtaW4vZGFzaGJvYXJkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1NToibG9naW5fYmFja3BhY2tfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO3M6MjI6InBhc3N3b3JkX2hhc2hfYmFja3BhY2siO3M6NjA6IiQyeSQxMiR2S2d2c01YRDE2a1NsZnVCbE1jSGFPQW5WWk04aDBSSGNveEt5bG9RRXRhWlZHbko1bGJpMiI7fQ==',1781382235);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_achievements`
--

DROP TABLE IF EXISTS `student_achievements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_achievements` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `student_id` bigint unsigned NOT NULL,
  `teacher_id` bigint unsigned NOT NULL,
  `halakat_id` bigint unsigned NOT NULL,
  `type` enum('surah_memorized','juz_memorized') COLLATE utf8mb4_unicode_ci NOT NULL,
  `surah_id` bigint unsigned DEFAULT NULL,
  `juz_number` tinyint unsigned DEFAULT NULL,
  `achieved_at` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_surah_achievement` (`student_id`,`type`,`surah_id`),
  UNIQUE KEY `unique_juz_achievement` (`student_id`,`type`,`juz_number`),
  KEY `student_achievements_halakat_id_foreign` (`halakat_id`),
  KEY `student_achievements_surah_id_foreign` (`surah_id`),
  KEY `student_achievements_student_id_type_index` (`student_id`,`type`),
  KEY `student_achievements_student_id_achieved_at_index` (`student_id`,`achieved_at`),
  KEY `student_achievements_teacher_id_index` (`teacher_id`),
  KEY `achievements_type_achieved_at_index` (`type`,`achieved_at`),
  CONSTRAINT `student_achievements_halakat_id_foreign` FOREIGN KEY (`halakat_id`) REFERENCES `halakat` (`id`),
  CONSTRAINT `student_achievements_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`),
  CONSTRAINT `student_achievements_surah_id_foreign` FOREIGN KEY (`surah_id`) REFERENCES `surah` (`id`),
  CONSTRAINT `student_achievements_teacher_id_foreign` FOREIGN KEY (`teacher_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_achievements`
--

LOCK TABLES `student_achievements` WRITE;
/*!40000 ALTER TABLE `student_achievements` DISABLE KEYS */;
INSERT INTO `student_achievements` VALUES (1,22,2,1,'surah_memorized',1,NULL,'2026-03-01','2026-05-12 13:17:41','2026-05-12 13:17:41'),(2,23,2,1,'surah_memorized',1,NULL,'2026-03-05','2026-05-12 13:17:41','2026-05-12 13:17:41'),(3,25,3,2,'surah_memorized',67,NULL,'2026-04-01','2026-05-12 13:17:41','2026-05-12 13:17:41'),(4,26,4,3,'surah_memorized',113,NULL,'2026-03-01','2026-05-12 13:17:41','2026-05-12 13:17:41'),(5,26,4,3,'surah_memorized',114,NULL,'2026-03-15','2026-05-12 13:17:41','2026-05-12 13:17:41'),(6,29,5,4,'surah_memorized',1,NULL,'2026-03-12','2026-05-12 13:17:41','2026-05-12 13:17:41'),(7,29,5,4,'surah_memorized',109,NULL,'2026-04-05','2026-05-12 13:17:41','2026-05-12 13:17:41'),(8,30,6,5,'surah_memorized',78,NULL,'2026-03-18','2026-05-12 13:17:41','2026-05-12 13:17:41'),(9,31,6,5,'surah_memorized',112,NULL,'2026-03-10','2026-05-12 13:17:41','2026-05-12 13:17:41'),(10,31,6,5,'surah_memorized',113,NULL,'2026-04-01','2026-05-12 13:17:41','2026-05-12 13:17:41'),(11,34,8,7,'surah_memorized',87,NULL,'2026-03-05','2026-05-12 13:17:41','2026-05-12 13:17:41'),(12,34,8,7,'surah_memorized',88,NULL,'2026-03-22','2026-05-12 13:17:41','2026-05-12 13:17:41'),(13,35,8,7,'surah_memorized',1,NULL,'2026-03-10','2026-05-12 13:17:41','2026-05-12 13:17:41'),(14,36,9,8,'surah_memorized',111,NULL,'2026-03-01','2026-05-12 13:17:41','2026-05-12 13:17:41'),(15,36,9,8,'surah_memorized',112,NULL,'2026-03-18','2026-05-12 13:17:41','2026-05-12 13:17:41'),(16,37,9,8,'surah_memorized',103,NULL,'2026-03-25','2026-05-12 13:17:41','2026-05-12 13:17:41'),(17,37,9,8,'surah_memorized',104,NULL,'2026-04-05','2026-05-12 13:17:41','2026-05-12 13:17:41'),(18,39,10,9,'surah_memorized',110,NULL,'2026-03-28','2026-05-12 13:17:41','2026-05-12 13:17:41'),(19,39,10,9,'surah_memorized',109,NULL,'2026-04-10','2026-05-12 13:17:41','2026-05-12 13:17:41'),(20,41,11,10,'surah_memorized',1,NULL,'2026-03-15','2026-05-12 13:17:41','2026-05-12 13:17:41'),(21,22,2,1,'juz_memorized',NULL,30,'2026-03-15','2026-05-12 13:17:41','2026-05-12 13:17:41'),(22,26,4,3,'juz_memorized',NULL,30,'2026-03-20','2026-05-12 13:17:42','2026-05-12 13:17:42'),(23,29,5,4,'juz_memorized',NULL,30,'2026-04-10','2026-05-12 13:17:42','2026-05-12 13:17:42'),(26,39,10,9,'juz_memorized',NULL,30,'2026-04-15','2026-05-13 18:32:59','2026-05-13 18:32:59'),(27,39,8,8,'surah_memorized',78,NULL,'2025-10-01','2026-05-13 18:32:59','2026-05-13 18:32:59'),(28,39,8,8,'surah_memorized',79,NULL,'2025-10-15','2026-05-13 18:32:59','2026-05-13 18:32:59'),(29,39,8,8,'juz_memorized',NULL,29,'2025-11-01','2026-05-13 18:32:59','2026-05-13 18:32:59'),(30,38,10,9,'surah_memorized',1,NULL,'2026-05-14','2026-05-14 08:10:06','2026-05-14 08:10:06'),(31,40,11,10,'juz_memorized',NULL,1,'2026-05-14','2026-05-14 08:16:13','2026-05-14 08:16:13'),(33,36,9,8,'surah_memorized',1,NULL,'2026-05-14','2026-05-14 09:09:51','2026-05-14 09:09:51'),(34,34,8,7,'surah_memorized',67,NULL,'2026-05-14','2026-05-14 09:11:26','2026-05-14 09:11:26'),(35,28,5,4,'surah_memorized',77,NULL,'2026-05-14','2026-05-14 09:13:19','2026-05-14 09:13:19'),(36,28,5,4,'juz_memorized',NULL,29,'2026-05-14','2026-05-14 09:13:19','2026-05-14 09:13:19'),(37,41,11,10,'surah_memorized',13,NULL,'2026-05-16','2026-05-16 09:59:14','2026-05-16 09:59:14'),(38,24,3,2,'surah_memorized',1,NULL,'2026-05-16','2026-05-16 10:35:44','2026-05-16 10:35:44'),(39,40,11,10,'surah_memorized',112,NULL,'2026-05-16','2026-05-16 12:05:16','2026-05-16 12:05:16'),(40,40,11,10,'surah_memorized',113,NULL,'2026-05-16','2026-05-16 12:05:48','2026-05-16 12:05:48'),(41,40,11,10,'surah_memorized',114,NULL,'2026-05-16','2026-05-16 12:07:39','2026-05-16 12:07:39'),(42,40,11,10,'juz_memorized',NULL,2,'2026-05-16','2026-05-16 18:28:35','2026-05-16 18:28:35'),(43,40,11,10,'surah_memorized',106,NULL,'2026-05-16','2026-05-16 19:18:18','2026-05-16 19:18:18'),(44,40,11,10,'juz_memorized',NULL,4,'2026-05-19','2026-05-19 10:41:32','2026-05-19 10:41:32'),(45,22,2,1,'surah_memorized',114,NULL,'2026-05-28','2026-05-28 10:44:50','2026-05-28 10:44:50'),(46,32,7,6,'surah_memorized',10,NULL,'2026-06-01','2026-06-01 22:56:30','2026-06-01 22:56:30'),(47,22,2,1,'surah_memorized',9,NULL,'2026-06-03','2026-06-03 19:23:18','2026-06-03 19:23:18'),(48,25,3,2,'surah_memorized',12,NULL,'2026-06-03','2026-06-03 19:24:52','2026-06-03 19:24:52'),(49,39,6,5,'surah_memorized',13,NULL,'2026-06-03','2026-06-03 20:16:15','2026-06-03 20:16:15'),(50,39,6,5,'surah_memorized',11,NULL,'2026-06-03','2026-06-03 20:16:50','2026-06-03 20:16:50'),(51,22,2,1,'juz_memorized',NULL,1,'2026-06-03','2026-06-03 20:29:37','2026-06-03 20:29:37'),(52,22,2,1,'juz_memorized',NULL,2,'2026-06-03','2026-06-03 20:29:37','2026-06-03 20:29:37'),(53,22,2,1,'juz_memorized',NULL,3,'2026-06-03','2026-06-03 20:39:00','2026-06-03 20:39:00'),(54,40,10,9,'juz_memorized',NULL,3,'2026-06-03','2026-06-03 21:35:46','2026-06-03 21:35:46'),(55,40,10,9,'surah_memorized',79,NULL,'2026-06-03','2026-06-03 21:54:03','2026-06-03 21:54:03'),(56,40,10,9,'juz_memorized',NULL,7,'2026-06-04','2026-06-04 09:58:40','2026-06-04 09:58:40'),(57,40,10,9,'juz_memorized',NULL,10,'2026-06-04','2026-06-04 09:58:40','2026-06-04 09:58:40'),(58,23,3,2,'juz_memorized',NULL,9,'2026-06-04','2026-06-04 19:27:32','2026-06-04 19:27:32'),(59,24,3,2,'surah_memorized',7,NULL,'2026-06-04','2026-06-04 19:37:17','2026-06-04 19:37:17'),(60,24,3,2,'juz_memorized',NULL,20,'2026-06-04','2026-06-04 19:38:14','2026-06-04 19:38:14'),(61,40,10,9,'juz_memorized',NULL,8,'2026-06-04','2026-06-04 20:53:54','2026-06-04 20:53:54'),(62,40,10,9,'juz_memorized',NULL,9,'2026-06-04','2026-06-04 20:53:54','2026-06-04 20:53:54'),(63,50,2,1,'surah_memorized',7,NULL,'2026-06-04','2026-06-04 21:00:21','2026-06-04 21:00:21'),(64,50,2,1,'juz_memorized',NULL,27,'2026-06-04','2026-06-04 21:00:21','2026-06-04 21:00:21'),(65,50,2,1,'surah_memorized',12,NULL,'2026-06-04','2026-06-04 21:19:13','2026-06-04 21:19:13'),(66,26,4,3,'surah_memorized',8,NULL,'2026-06-05','2026-06-05 01:18:24','2026-06-05 01:18:24'),(67,26,4,3,'juz_memorized',NULL,29,'2026-06-05','2026-06-05 01:18:24','2026-06-05 01:18:24'),(68,26,4,3,'surah_memorized',11,NULL,'2026-06-08','2026-06-08 22:25:56','2026-06-08 22:25:56'),(69,27,4,3,'surah_memorized',62,NULL,'2026-06-08','2026-06-08 22:30:46','2026-06-08 22:30:46'),(70,27,4,3,'juz_memorized',NULL,1,'2026-06-08','2026-06-08 22:32:20','2026-06-08 22:32:20'),(71,27,4,3,'juz_memorized',NULL,2,'2026-06-08','2026-06-08 22:32:20','2026-06-08 22:32:20'),(72,27,4,3,'juz_memorized',NULL,3,'2026-06-08','2026-06-08 22:32:20','2026-06-08 22:32:20'),(73,27,4,3,'juz_memorized',NULL,4,'2026-06-08','2026-06-08 22:32:20','2026-06-08 22:32:20'),(74,27,4,3,'juz_memorized',NULL,5,'2026-06-08','2026-06-08 22:32:20','2026-06-08 22:32:20'),(75,50,2,1,'juz_memorized',NULL,10,'2026-06-08','2026-06-08 22:44:10','2026-06-08 22:44:10'),(76,50,2,1,'juz_memorized',NULL,9,'2026-06-08','2026-06-08 22:44:10','2026-06-08 22:44:10'),(77,50,2,1,'juz_memorized',NULL,8,'2026-06-08','2026-06-08 22:44:10','2026-06-08 22:44:10'),(78,22,2,1,'juz_memorized',NULL,4,'2026-06-08','2026-06-08 22:46:55','2026-06-08 22:46:55'),(79,22,2,1,'juz_memorized',NULL,5,'2026-06-08','2026-06-08 22:46:55','2026-06-08 22:46:55'),(80,22,2,1,'juz_memorized',NULL,6,'2026-06-08','2026-06-08 22:46:55','2026-06-08 22:46:55'),(81,50,2,1,'juz_memorized',NULL,7,'2026-06-08','2026-06-08 22:48:09','2026-06-08 22:48:09'),(82,35,2,1,'juz_memorized',NULL,6,'2026-06-08','2026-06-08 22:50:21','2026-06-08 22:50:21'),(83,27,4,3,'juz_memorized',NULL,8,'2026-06-08','2026-06-08 22:52:37','2026-06-08 22:52:37'),(84,26,4,3,'juz_memorized',NULL,17,'2026-06-08','2026-06-08 22:53:37','2026-06-08 22:53:37'),(85,39,6,5,'juz_memorized',NULL,1,'2026-06-08','2026-06-08 22:58:34','2026-06-08 22:58:34'),(86,39,6,5,'juz_memorized',NULL,2,'2026-06-08','2026-06-08 22:58:34','2026-06-08 22:58:34'),(87,26,4,3,'juz_memorized',NULL,5,'2026-06-08','2026-06-08 23:13:52','2026-06-08 23:13:52'),(88,26,4,3,'juz_memorized',NULL,6,'2026-06-08','2026-06-08 23:13:52','2026-06-08 23:13:52'),(89,26,4,3,'juz_memorized',NULL,7,'2026-06-08','2026-06-08 23:20:57','2026-06-08 23:20:57'),(90,26,4,3,'juz_memorized',NULL,22,'2026-06-08','2026-06-08 23:22:53','2026-06-08 23:22:53'),(91,26,4,3,'juz_memorized',NULL,21,'2026-06-08','2026-06-08 23:22:53','2026-06-08 23:22:53'),(92,26,4,3,'juz_memorized',NULL,20,'2026-06-08','2026-06-08 23:22:53','2026-06-08 23:22:53'),(93,26,4,3,'juz_memorized',NULL,19,'2026-06-08','2026-06-08 23:22:53','2026-06-08 23:22:53'),(94,26,4,3,'juz_memorized',NULL,18,'2026-06-08','2026-06-08 23:22:53','2026-06-08 23:22:53'),(95,26,4,3,'juz_memorized',NULL,16,'2026-06-08','2026-06-08 23:22:53','2026-06-08 23:22:53'),(96,26,4,3,'juz_memorized',NULL,15,'2026-06-08','2026-06-08 23:22:54','2026-06-08 23:22:54'),(97,26,4,3,'juz_memorized',NULL,14,'2026-06-08','2026-06-08 23:22:54','2026-06-08 23:22:54'),(98,26,4,3,'juz_memorized',NULL,13,'2026-06-08','2026-06-08 23:22:54','2026-06-08 23:22:54'),(99,27,4,3,'juz_memorized',NULL,20,'2026-06-08','2026-06-08 23:24:53','2026-06-08 23:24:53'),(100,27,4,3,'juz_memorized',NULL,19,'2026-06-08','2026-06-08 23:24:53','2026-06-08 23:24:53'),(101,27,4,3,'juz_memorized',NULL,18,'2026-06-08','2026-06-08 23:24:53','2026-06-08 23:24:53'),(102,27,4,3,'juz_memorized',NULL,17,'2026-06-08','2026-06-08 23:24:53','2026-06-08 23:24:53'),(103,27,4,3,'juz_memorized',NULL,14,'2026-06-08','2026-06-08 23:29:21','2026-06-08 23:29:21'),(104,27,4,3,'juz_memorized',NULL,10,'2026-06-08','2026-06-08 23:30:14','2026-06-08 23:30:14'),(105,27,4,3,'juz_memorized',NULL,16,'2026-06-08','2026-06-08 23:32:14','2026-06-08 23:32:14'),(106,26,4,3,'juz_memorized',NULL,8,'2026-06-08','2026-06-08 23:40:21','2026-06-08 23:40:21'),(107,27,4,3,'juz_memorized',NULL,21,'2026-06-08','2026-06-08 23:48:49','2026-06-08 23:48:49'),(108,27,4,3,'juz_memorized',NULL,25,'2026-06-08','2026-06-08 23:50:28','2026-06-08 23:50:28'),(109,26,4,3,'juz_memorized',NULL,4,'2026-06-09','2026-06-09 00:44:50','2026-06-09 00:44:50'),(110,31,6,5,'juz_memorized',NULL,17,'2026-06-10','2026-06-10 11:23:51','2026-06-10 11:23:51'),(111,49,2,1,'surah_memorized',1,NULL,'2026-06-11','2026-06-11 00:11:28','2026-06-11 00:11:28'),(112,49,2,1,'juz_memorized',NULL,1,'2026-06-11','2026-06-11 00:11:52','2026-06-11 00:11:52'),(113,49,2,1,'juz_memorized',NULL,2,'2026-06-11','2026-06-11 00:11:52','2026-06-11 00:11:52'),(114,40,3,2,'juz_memorized',NULL,27,'2026-06-11','2026-06-11 00:13:02','2026-06-11 00:13:02');
/*!40000 ALTER TABLE `student_achievements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `surah`
--

DROP TABLE IF EXISTS `surah`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `surah` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `number` tinyint unsigned NOT NULL,
  `aya_count` smallint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `surah_number_unique` (`number`)
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `surah`
--

LOCK TABLES `surah` WRITE;
/*!40000 ALTER TABLE `surah` DISABLE KEYS */;
INSERT INTO `surah` VALUES (1,'سورة الفاتحة',1,7),(2,'سورة البقرة',2,286),(3,'سورة آل عمران',3,200),(4,'سورة النساء',4,176),(5,'سورة المائدة',5,120),(6,'سورة الأنعام',6,165),(7,'سورة الأعراف',7,206),(8,'سورة الأنفال',8,75),(9,'سورة التوبة',9,129),(10,'سورة يونس',10,109),(11,'سورة هود',11,123),(12,'سورة يوسف',12,111),(13,'سورة الرعد',13,43),(14,'سورة إبراهيم',14,52),(15,'سورة الحجر',15,99),(16,'سورة النحل',16,128),(17,'سورة الإسراء',17,111),(18,'سورة الكهف',18,110),(19,'سورة مريم',19,98),(20,'سورة طه',20,135),(21,'سورة الأنبياء',21,112),(22,'سورة الحج',22,78),(23,'سورة المؤمنون',23,118),(24,'سورة النور',24,64),(25,'سورة الفرقان',25,77),(26,'سورة الشعراء',26,227),(27,'سورة النمل',27,93),(28,'سورة القصص',28,88),(29,'سورة العنكبوت',29,69),(30,'سورة الروم',30,60),(31,'سورة لقمان',31,34),(32,'سورة السجدة',32,30),(33,'سورة الأحزاب',33,73),(34,'سورة سبأ',34,54),(35,'سورة فاطر',35,45),(36,'سورة يس',36,83),(37,'سورة الصافات',37,182),(38,'سورة ص',38,88),(39,'سورة الزمر',39,75),(40,'سورة غافر',40,85),(41,'سورة فصلت',41,54),(42,'سورة الشورى',42,53),(43,'سورة الزخرف',43,89),(44,'سورة الدخان',44,59),(45,'سورة الجاثية',45,37),(46,'سورة الأحقاف',46,35),(47,'سورة محمد',47,38),(48,'سورة الفتح',48,29),(49,'سورة الحجرات',49,18),(50,'سورة ق',50,45),(51,'سورة الذاريات',51,60),(52,'سورة الطور',52,49),(53,'سورة النجم',53,62),(54,'سورة القمر',54,55),(55,'سورة الرحمن',55,78),(56,'سورة الواقعة',56,96),(57,'سورة الحديد',57,29),(58,'سورة المجادلة',58,22),(59,'سورة الحشر',59,24),(60,'سورة الممتحنة',60,13),(61,'سورة الصف',61,14),(62,'سورة الجمعة',62,11),(63,'سورة المنافقون',63,11),(64,'سورة التغابن',64,18),(65,'سورة الطلاق',65,12),(66,'سورة التحريم',66,12),(67,'سورة الملك',67,30),(68,'سورة القلم',68,52),(69,'سورة الحاقة',69,52),(70,'سورة المعارج',70,44),(71,'سورة نوح',71,28),(72,'سورة الجن',72,28),(73,'سورة المزمل',73,20),(74,'سورة المدثر',74,56),(75,'سورة القيامة',75,40),(76,'سورة الإنسان',76,31),(77,'سورة المرسلات',77,50),(78,'سورة النبأ',78,40),(79,'سورة النازعات',79,46),(80,'سورة عبس',80,42),(81,'سورة التكوير',81,29),(82,'سورة الانفطار',82,19),(83,'سورة المطففين',83,36),(84,'سورة الانشقاق',84,25),(85,'سورة البروج',85,22),(86,'سورة الطارق',86,17),(87,'سورة الأعلى',87,19),(88,'سورة الغاشية',88,26),(89,'سورة الفجر',89,30),(90,'سورة البلد',90,20),(91,'سورة الشمس',91,15),(92,'سورة الليل',92,21),(93,'سورة الضحى',93,11),(94,'سورة الشرح',94,8),(95,'سورة التين',95,8),(96,'سورة العلق',96,19),(97,'سورة القدر',97,5),(98,'سورة البينة',98,8),(99,'سورة الزلزلة',99,8),(100,'سورة العاديات',100,11),(101,'سورة القارعة',101,11),(102,'سورة التكاثر',102,8),(103,'سورة العصر',103,3),(104,'سورة الهمزة',104,9),(105,'سورة الفيل',105,5),(106,'سورة قريش',106,4),(107,'سورة الماعون',107,7),(108,'سورة الكوثر',108,3),(109,'سورة الكافرون',109,6),(110,'سورة النصر',110,3),(111,'سورة المسد',111,5),(112,'سورة الإخلاص',112,4),(113,'سورة الفلق',113,5),(114,'سورة الناس',114,6);
/*!40000 ALTER TABLE `surah` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birth_date` date DEFAULT NULL,
  `role` enum('admin','teacher','student') COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` enum('ذكر','انثى') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ذكر',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_phone_unique` (`phone`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_role_deleted_at_index` (`role`,`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'مدير النظام','0500000000','admin@example.com','$2y$12$vKgvsMXD16kSlfuBlMcHaOAnVZM8h0RHcoxKyloQEtaZVGnJ5lbi2','1980-01-01','admin','ذكر','IXhJrdTupitul8qiNiTjRAYzcPujHmcKwZ8kPYABz9y2EYvG3bEY8NoZcuk2','2026-05-12 13:17:31','2026-05-24 08:27:49',NULL),(2,'أحمد محمد','0997176570','ahmed@example.com','$2y$12$BGAP5WAG5kkun/JJZJpmsOXWt03NXTMm6InwknBGAwv4goslEEdCu','1985-05-15','teacher','ذكر',NULL,'2026-05-12 13:17:31','2026-05-12 13:17:31',NULL),(3,'فاطمة علي','0933967587','fatima@example.com','$2y$12$oySs.S8SartlEXi9Tjw8a.Mf3/UTlEQF01CrvMC3vKvHqDrPzlfp6','1990-08-20','teacher','ذكر',NULL,'2026-05-12 13:17:31','2026-05-12 13:17:31',NULL),(4,'خالد عبدالله','0550000003','khaled@example.com','$2y$12$BAn9XYJj.PfLWSLw9CCuseZxAJNOsfdUaKl6RD7wuvPfLULc7bz.u','1988-12-10','teacher','ذكر',NULL,'2026-05-12 13:17:31','2026-05-12 13:17:31',NULL),(5,'عمر حسن','0550000004','omar@example.com','$2y$12$f0jH8XBVSCoN3.iLCR3r.eVtWMZGlrwxYQhS0dwjUkeWI3MjJLZz6','1992-03-25','teacher','ذكر',NULL,'2026-05-12 13:17:32','2026-05-12 13:17:32',NULL),(6,'سارة أحمد','0550000005','sara@example.com','$2y$12$k8g7H4hI9UlyaJZarlEYhuMuk3N1aocp84kxdw8YIjEyR/pkoyY4O','1991-07-18','teacher','ذكر',NULL,'2026-05-12 13:17:32','2026-05-12 13:17:32',NULL),(7,'ياسر علي','0550000006','yasser@example.com','$2y$12$xv0dUfwpvdkydgFa5T1OtuFnW9Wj.CSKAcOSp07QNRKG6pyZ4a/Aa','1987-11-30','teacher','ذكر',NULL,'2026-05-12 13:17:32','2026-05-12 13:17:32',NULL),(8,'نورة سعد','0550000007','noura@example.com','$2y$12$0na9k8FI5eAHaJ2DO.pGreYyIAHaj4Kmr5l3DJSXDCvkIuABGU9lu','1993-02-14','teacher','ذكر',NULL,'2026-05-12 13:17:32','2026-05-12 13:17:32',NULL),(9,'ماجد فهد','0550000008','majed@example.com','$2y$12$Flnv7VbePq.dflUnWu4LD.dgHZtdMCcF7ryC0LwUZVqKTX407Ddlm','1986-06-22','teacher','ذكر',NULL,'2026-05-12 13:17:33','2026-05-12 13:17:33',NULL),(10,'ليلى عمر','0550000009','laila@example.com','$2y$12$6MRYbYyUiEubAfLZmq7qauj0ExIN6lF5Q60PXzq4qr/WOFEH3gIc6','1994-09-05','teacher','ذكر',NULL,'2026-05-12 13:17:33','2026-05-12 13:17:33',NULL),(11,'عبدالعزيز سعود','0550000010','abdulaziz@example.com','$2y$12$w917thaez2Gv4wye53ENves08XrG5Afjz9a5IdGJGl7iBK.PeNj7q','1989-04-17','teacher','ذكر',NULL,'2026-05-12 13:17:33','2026-05-12 13:17:33',NULL),(12,'محمود إبراهيم','0550000011','mahmoud@example.com','$2y$12$Wud4DLW/sR1SqzQumGpo4enzgQtfjdDPUYENM1H/KF1ELHdtqp34q','1991-01-12','teacher','ذكر',NULL,'2026-05-12 13:17:33','2026-05-12 13:17:33',NULL),(13,'هدى عبدالرحمن','0550000012','huda.t@example.com','$2y$12$5fFEd7I.cKs3Sv5tFnGiFOIOuviq/.VXBUEWkyd1mhrEkMCYCYRs2','1988-08-30','teacher','ذكر',NULL,'2026-05-12 13:17:34','2026-05-12 13:17:34',NULL),(14,'عبدالرحمن خالد','0550000013','abdulrahman.t@example.com','$2y$12$dr6h/0z5gfQW/4kR.5J2fecO/XuyyZUtbBs3bIqKPhrp.cVN.uqbi','1990-11-22','teacher','ذكر',NULL,'2026-05-12 13:17:34','2026-05-12 13:17:34',NULL),(15,'رانيا صالح','0550000014','rania@example.com','$2y$12$LK20GDKQ6yKih1eJB2eVmeF68vPAflQH2sGZh1RC45tutG7nrm.SG','1993-04-08','teacher','ذكر',NULL,'2026-05-12 13:17:34','2026-05-12 13:17:34',NULL),(16,'سلمان فهد','0550000015','salman@example.com','$2y$12$U3dUjqXcBejAEbv.ijm37.57ZSruDfQyV4RIXZoaspG6D2AvIiAd2','1987-07-19','teacher','ذكر',NULL,'2026-05-12 13:17:34','2026-05-12 13:17:34',NULL),(17,'دانة عبدالله','0550000016','dana.t@example.com','$2y$12$42V5zUn1D0Ooy5CyJVoBoOjN59MwWMOcnGZB65EEruO89ImhZyai.','1992-12-03','teacher','ذكر',NULL,'2026-05-12 13:17:35','2026-05-13 18:58:21','2026-05-13 18:58:21'),(18,'محمد العتيبي','0550000017','mohammed@example.com','$2y$12$KG0bpL28Z13Xu00gxrOwaOi0GvekSVIFePdiyOFlvkU3OXk2yqhU2','1989-06-15','teacher','ذكر',NULL,'2026-05-12 13:17:35','2026-05-13 18:58:16','2026-05-13 18:58:16'),(19,'ريم سعد','0550000018','reem@example.com','$2y$12$3.XIAE83nv.9zwWhQ4lt5u1KSdSlf/RfJjn3pi3HiNHv7bL7zwcH.','1991-03-28','teacher','ذكر',NULL,'2026-05-12 13:17:35','2026-05-13 18:58:12','2026-05-13 18:58:12'),(20,'تركي ماجد','0550000019','turki@example.com','$2y$12$TcwWYu0.0JfC7sphXxiXXehrH0DLSl9PBgxfIZzbraSmHpbWWE846','1986-10-11','teacher','ذكر',NULL,'2026-05-12 13:17:35','2026-05-13 18:58:08','2026-05-13 18:58:08'),(21,'سلمى حسن','0550000020','salma@example.com','$2y$12$A9EpXSwnhwcISCFLitabgupDEwKtLHJOBRvhBovsAf0DflEY0Lr9y','1994-02-25','teacher','ذكر',NULL,'2026-05-12 13:17:36','2026-05-13 18:58:04','2026-05-13 18:58:04'),(22,'عبدالرحمن سعيد','0560000001','abdulrahman.s@example.com','$2y$12$Vm67Ui.0OVQG3UG0gm8o3uIy87vVoLbGz3vL5bmGvuli0IKlGXdTK','2010-03-25','student','ذكر',NULL,'2026-05-12 13:17:36','2026-05-12 13:17:36',NULL),(23,'مريم أحمد','0560000002','mariam@example.com','$2y$12$dlizo/uPFszBGefGpygVJO1NyMLIRFgxBPT8.RKsDVuPW8pmePuju','2012-07-18','student','ذكر',NULL,'2026-05-12 13:17:36','2026-05-12 13:17:36',NULL),(24,'يوسف محمد','0560000003','yousef@example.com','$2y$12$/rqRxOYfek4f2aU01Steqe1jUf9o64lEBYizZG.3fwnp5zLF5MeKe','2011-11-30','student','ذكر',NULL,'2026-05-12 13:17:36','2026-05-12 13:17:36',NULL),(25,'هدى خالد','0560000004','huda.s@example.com','$2y$12$tJgP3xLvfi3lbQ2PdKqKUuxXo0VL.Hw9Ynm81xll43uxs9UZMSPwO','2010-05-12','student','ذكر',NULL,'2026-05-12 13:17:37','2026-05-12 13:17:37',NULL),(26,'طارق فهد','0560000005','tareq@example.com','$2y$12$xElxqk2.82ZIULQG3EpsauCYkT0C6ku13Fj5yhp32GKlV0ivgh77W','2011-08-23','student','ذكر',NULL,'2026-05-12 13:17:37','2026-05-12 13:17:37',NULL),(27,'رنا سعد','0560000006','rana@example.com','$2y$12$hjMHjoYC9vU9BajlDsp9gO/pw7MJaCt/7iMYoDcIZPZ5p684Q9vYa','2012-01-15','student','ذكر',NULL,'2026-05-12 13:17:37','2026-05-12 13:17:37',NULL),(28,'سلطان عمر','0560000007','sultan@example.com','$2y$12$O3RSlgoSk66aTN3F2qb/MeatlNee/5pQ3x0yGLYOhREA.HR.rOfkW','2010-09-07','student','ذكر',NULL,'2026-05-12 13:17:37','2026-05-12 13:17:37',NULL),(29,'دانة ماجد','0560000008','dana.s@example.com','$2y$12$GSY/773QWCj//ZjMlCaBHuOv12aVweAlh54NNotux4oBNCIL24ERC','2011-12-19','student','ذكر',NULL,'2026-05-12 13:17:38','2026-05-12 13:17:38',NULL),(30,'فيصل عبدالله','0560000009','faisal@example.com','$2y$12$STRiYQYaI8WRJqnG.FWML.kL0Cra7yqP/SeQ37DLT2wUd/XX5IbW6','2012-04-28','student','ذكر',NULL,'2026-05-12 13:17:38','2026-06-10 10:49:50','2026-06-10 10:49:50'),(31,'جنى ياسر','0560000010','jana@example.com','$2y$12$izohBqwC.Qt8qdJ4pOrVHOv/2DjI.iH1hyPAq8KW2bsAdH3OuPnAi','2010-06-11','student','ذكر',NULL,'2026-05-12 13:17:38','2026-05-12 13:17:38',NULL),(32,'عبدالله حسن','0560000011','abdullah@example.com','$2y$12$g0seEJIeRmEsCf/EWSJI/.wVPa7pd9InydiDOy7q1Viow1HLjuvoy','2011-02-20','student','ذكر',NULL,'2026-05-12 13:17:38','2026-05-12 13:17:38',NULL),(33,'لينا محمد','0560000012','lina@example.com','$2y$12$dJF4u1bBRHzLAKDLLzsytO37hsT3kF5xGA2Rsq2g31CkKS7ki08P2','2012-08-14','student','ذكر',NULL,'2026-05-12 13:17:39','2026-05-12 13:17:39',NULL),(34,'1حمزة علي','0560000013','hamza@example.com','$2y$12$fPA2DawAB9zZuyar3kUFmOD1HGwJ/vmp3Olks3PybImOF8hi7P.n.','2010-11-03','student','ذكر',NULL,'2026-05-12 13:17:39','2026-06-10 01:01:16','2026-06-10 01:01:16'),(35,'نوف سالم','0560000014','nouf@example.com','$2y$12$0CoFAPHIVDUPdjh4JiT21.zNm/rXn6z94h0WjfheNlRPTQZ.wr5JW','2011-04-17','student','ذكر',NULL,'2026-05-12 13:17:39','2026-05-12 13:17:39',NULL),(36,'ماجد الصغير','0560000015','majed.s@example.com','$2y$12$7cEGw.KEkHos9b7uLGwOC.UWfXrFjyesMUQAzD7v/6uYALvyKcuEW','2012-06-09','student','ذكر',NULL,'2026-05-12 13:17:39','2026-05-12 13:17:39',NULL),(37,'شهد إبراهيم','0560000016','shahd@example.com','$2y$12$6PH4bt9RZhHQz/kAU77Am.WcDcjyYFTQ/jr8bXetcirihMzpxVLru','2010-01-28','student','ذكر',NULL,'2026-05-12 13:17:40','2026-05-12 13:17:41','2026-05-12 13:17:41'),(38,'عمران يوسف','0560000017','omran@example.com','$2y$12$/0HMWZxz/8yPxxbw86nVLOcpcRfeovtB2orMin5Ln7fxCeICtZ.VC','2011-09-12','student','ذكر',NULL,'2026-05-12 13:17:40','2026-05-12 13:17:40',NULL),(39,'غادة سعود','0560000018','ghada@example.com','$2y$12$gudjddp3CpaACZMpzc.5mO3e02YeW.yqQB9Vw6MG9T3sgtBz330XS','2012-03-05','student','ذكر',NULL,'2026-05-12 13:17:40','2026-05-12 13:17:40',NULL),(40,'باسل خالد','0560000019','basel@example.com','$2y$12$20jpqom2gzRVnl47t0mAZOxbAmnKv8PPduk.7Vd9iqRyQgNc6bwWW','2010-07-22','student','ذكر',NULL,'2026-05-12 13:17:40','2026-05-12 13:17:40',NULL),(41,'منال عبدالله','0560000020','manal@example.com','$2y$12$50TlZwIBV2gwixRoqzELCeXHHRnXHko8O/YdIjVeMnmn5ls2JgOZy','2011-10-31','student','ذكر',NULL,'2026-05-12 13:17:41','2026-05-12 13:17:41',NULL),(49,'علي موسى','0596666667','ali_mosa@example.com','$2y$12$qLgiUYly0bgY7nvJ4NXqOuLrYej8gX7Xu5tgDQh1XBPGVwhnBYA8m','2006-01-20','student','ذكر',NULL,'2026-05-21 13:36:48','2026-06-10 22:30:26',NULL),(50,'حمزة بسام الصوص10','0936963985','hamaz_alsous@gmial.com','123123','2020-06-10','student','ذكر',NULL,'2026-06-04 19:29:15','2026-06-10 00:42:09','2026-06-10 00:42:09'),(51,'لميس','0936541155','lames@ezaldeen.com','$2y$12$gR8W6PFtq609SjkE0Av0N.1tKll4/VXdUXGq/DFuDE2Ukptc/kylS','2018-02-13','student','انثى',NULL,'2026-06-13 22:14:00','2026-06-13 22:14:00',NULL),(52,'تالا ابراهيم','0976584258','tala_ibrahim@ezaldeen.com','$2y$12$BUztQ7cYuWd9kmOMHLtos.94svx7a2lvMEnUw0Gw182Fq.QPB6zvC','2017-01-19','student','انثى',NULL,'2026-06-13 22:26:16','2026-06-13 22:26:16',NULL),(53,'غريد','0914253669','gareed@ezaldeen.com','$2y$12$H1AIyhKrwUKXD5O9dYDu3eTWm/c91WH2C3RnJEOSf1NbjcHOFPIjC','2016-05-13','student','انثى',NULL,'2026-06-13 22:29:19','2026-06-13 22:29:19',NULL),(54,'سميحة','0147852369','samiha@ezaldeen.com','$2y$12$.PUqvg.Sv5NUZ.EZoYi1y.wpAo0tiyyA6Ak26bU8adx7QdG4F.6NW','2015-02-03','student','انثى',NULL,'2026-06-13 22:53:29','2026-06-13 23:20:13',NULL),(55,'ليلاس','0933962445','lilas@example.com','$2y$12$RmjE3EhLFy2O73dEYx.hQeIfKOTRfsh2T/F6tRXBlaes9EupPsZUO','2020-09-23','student','انثى',NULL,'2026-06-13 23:23:25','2026-06-13 23:23:25',NULL);
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

-- Dump completed on 2026-06-14 14:45:41
