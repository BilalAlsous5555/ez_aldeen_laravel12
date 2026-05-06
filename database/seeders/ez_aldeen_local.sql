mysqldump: [Warning] Using a password on the command line interface can be insecure.
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: ez_aldeen
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.28-MariaDB

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
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `attendance_date` date NOT NULL,
  `status` enum('present','absent') NOT NULL,
  `excused_reason` varchar(255) DEFAULT NULL,
  `student_id` bigint(20) unsigned NOT NULL,
  `halakat_id` bigint(20) unsigned NOT NULL,
  `recorded_by` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_student_attendance` (`student_id`,`halakat_id`,`attendance_date`),
  KEY `attendances_recorded_by_foreign` (`recorded_by`),
  KEY `attendances_halakat_id_attendance_date_index` (`halakat_id`,`attendance_date`),
  KEY `attendances_student_id_attendance_date_index` (`student_id`,`attendance_date`),
  CONSTRAINT `attendances_halakat_id_foreign` FOREIGN KEY (`halakat_id`) REFERENCES `halakat` (`id`) ON DELETE CASCADE,
  CONSTRAINT `attendances_recorded_by_foreign` FOREIGN KEY (`recorded_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `attendances_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendances`
--

LOCK TABLES `attendances` WRITE;
/*!40000 ALTER TABLE `attendances` DISABLE KEYS */;
INSERT INTO `attendances` VALUES (1,'2026-04-01','present',NULL,12,1,2,NULL,NULL),(2,'2026-04-01','present',NULL,13,2,3,NULL,NULL),(3,'2026-04-02','absent','مرض',14,3,4,NULL,NULL),(4,'2026-04-02','present',NULL,15,4,5,NULL,NULL),(5,'2026-04-03','present',NULL,16,5,6,NULL,NULL),(6,'2026-04-03','absent','ظروف عائلية',17,6,7,NULL,NULL),(7,'2026-04-05','present',NULL,18,7,8,NULL,NULL),(8,'2026-04-05','present',NULL,19,8,9,NULL,NULL),(9,'2026-04-06','present',NULL,20,9,10,NULL,NULL),(10,'2026-04-06','absent','مرض',21,10,11,NULL,NULL);
/*!40000 ALTER TABLE `attendances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
INSERT INTO `cache` VALUES ('laravel_cache_ezaldeen@gmail.com|127.0.0.1','i:1;',1777724601),('laravel_cache_ezaldeen@gmail.com|127.0.0.1:timer','i:1777724601;',1777724601);
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL,
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
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
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
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `teacher_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `halakat_teacher_id_unique` (`teacher_id`),
  CONSTRAINT `halakat_teacher_id_foreign` FOREIGN KEY (`teacher_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `halakat`
--

LOCK TABLES `halakat` WRITE;
/*!40000 ALTER TABLE `halakat` DISABLE KEYS */;
INSERT INTO `halakat` VALUES (1,'حلقة التحفيظ الصباحية','للمبتدئين',2,'2026-05-02 09:19:26','2026-05-02 09:19:26'),(2,'حلقة المراجعة','للمتقدمين',3,'2026-05-02 09:19:26','2026-05-02 09:19:26'),(3,'حلقة التجويد','تجويد وترتيل',4,'2026-05-02 09:19:26','2026-05-02 09:19:26'),(4,'حلقة حفظ المختصر',NULL,5,'2026-05-02 09:19:26','2026-05-02 09:19:26'),(5,'حلقة التميز','طلاب متفوقون',6,'2026-05-02 09:19:26','2026-05-02 09:19:26'),(6,'حلقة النور',NULL,7,'2026-05-02 09:19:26','2026-05-02 09:19:26'),(7,'حلقة الرحمة','للأطفال',8,'2026-05-02 09:19:26','2026-05-02 09:19:26'),(8,'حلقة الفرقان','حفظ القرآن الكريم',9,'2026-05-02 09:19:26','2026-05-02 09:19:26'),(9,'حلقة البركة','للمبتدئين',10,'2026-05-02 09:19:26','2026-05-02 09:19:26'),(10,'حلقة الهدى','تجويد وحفظ',11,'2026-05-02 09:19:26','2026-05-02 09:19:26');
/*!40000 ALTER TABLE `halakat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `halakat_students`
--

DROP TABLE IF EXISTS `halakat_students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `halakat_students` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` bigint(20) unsigned NOT NULL,
  `halakat_id` bigint(20) unsigned NOT NULL,
  `joined_at` date NOT NULL,
  `left_at` date DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_enrollment` (`student_id`,`halakat_id`,`joined_at`),
  KEY `halakat_students_student_id_index` (`student_id`),
  KEY `halakat_students_halakat_id_index` (`halakat_id`),
  CONSTRAINT `halakat_students_halakat_id_foreign` FOREIGN KEY (`halakat_id`) REFERENCES `halakat` (`id`) ON DELETE CASCADE,
  CONSTRAINT `halakat_students_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `halakat_students`
--

LOCK TABLES `halakat_students` WRITE;
/*!40000 ALTER TABLE `halakat_students` DISABLE KEYS */;
INSERT INTO `halakat_students` VALUES (1,12,1,'2025-09-01',NULL,1,NULL,NULL),(2,13,2,'2025-09-01',NULL,1,NULL,NULL),(3,14,3,'2025-10-01',NULL,1,NULL,NULL),(4,15,4,'2025-09-15',NULL,1,NULL,NULL),(5,16,5,'2025-08-15',NULL,1,NULL,NULL),(6,17,6,'2025-10-10',NULL,1,NULL,NULL),(7,18,7,'2025-09-20',NULL,1,NULL,NULL),(8,19,8,'2025-11-01',NULL,1,NULL,NULL),(9,20,9,'2025-10-15',NULL,1,NULL,NULL),(10,21,10,'2025-09-25',NULL,1,NULL,NULL),(11,26,2,'2026-05-03',NULL,1,'2026-05-03 08:06:32','2026-05-03 08:06:32'),(12,22,10,'2026-05-04',NULL,1,NULL,NULL),(13,22,10,'0000-00-00',NULL,1,NULL,NULL),(16,4,10,'2026-05-04',NULL,1,NULL,NULL),(18,2,10,'0000-00-00',NULL,1,NULL,NULL),(19,19,7,'0000-00-00',NULL,1,NULL,NULL);
/*!40000 ALTER TABLE `halakat_students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL,
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
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
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
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_01_01_000000_create_users_table',1),(2,'0001_01_01_000001_create_cache_table',1),(3,'0001_01_01_000002_create_jobs_table',1),(4,'2026_04_29_071541_create_personal_access_tokens_table',1),(5,'2026_04_29_072810_create_halakat_table',1),(6,'2026_04_29_072843_create_halakat_students_table',1),(7,'2026_04_29_072856_create_surah_table',1),(8,'2026_04_29_072917_create_quran_pages_table',1),(9,'2026_04_29_072946_create_quran_progress_table',1),(10,'2026_04_29_073024_create_attendances_table',1),(11,'2026_04_29_073034_create_notes_table',1),(12,'2026_04_29_130540_add_email_to_users_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notes`
--

DROP TABLE IF EXISTS `notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` bigint(20) unsigned NOT NULL,
  `sender_id` bigint(20) unsigned NOT NULL,
  `halakat_id` bigint(20) unsigned DEFAULT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notes_sender_id_foreign` (`sender_id`),
  KEY `notes_halakat_id_foreign` (`halakat_id`),
  KEY `notes_student_id_created_at_index` (`student_id`,`created_at`),
  CONSTRAINT `notes_halakat_id_foreign` FOREIGN KEY (`halakat_id`) REFERENCES `halakat` (`id`) ON DELETE SET NULL,
  CONSTRAINT `notes_sender_id_foreign` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `notes_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notes`
--

LOCK TABLES `notes` WRITE;
/*!40000 ALTER TABLE `notes` DISABLE KEYS */;
INSERT INTO `notes` VALUES (1,12,2,1,'أداء ممتاز في الحفظ، استمر على هذا المستوى',NULL,NULL),(2,13,3,2,'تحتاج إلى مراجعة سورة البقرة',NULL,NULL),(3,14,4,3,'ممتاز! أتممت حفظ سورة يس بإتقان',NULL,NULL),(4,15,1,NULL,'تم ترقية الطالب إلى المستوى المتقدم',NULL,NULL),(5,16,6,5,'النطق يحتاج تحسين في بعض الكلمات',NULL,NULL),(6,17,7,6,'يحتاج مزيد من الجهد في الحفظ',NULL,NULL),(7,18,1,NULL,'تقرر منح الطالب شهادة تقدير',NULL,NULL),(8,19,9,8,'حفظ رائع، استمر على هذا النهج',NULL,NULL),(9,20,10,9,'تحسن ملحوظ في التلاوة والتجويد',NULL,NULL),(10,21,11,10,'يحتاج إلى التركيز على مخارج الحروف',NULL,NULL);
/*!40000 ALTER TABLE `notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `phone` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
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
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` text NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  KEY `personal_access_tokens_expires_at_index` (`expires_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quran_pages`
--

DROP TABLE IF EXISTS `quran_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quran_pages` (
  `page_number` smallint(5) unsigned NOT NULL,
  `juz_number` tinyint(3) unsigned NOT NULL,
  `juz_name` varchar(45) NOT NULL,
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
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` bigint(20) unsigned NOT NULL,
  `halakat_id` bigint(20) unsigned NOT NULL,
  `teacher_id` bigint(20) unsigned NOT NULL,
  `surah_id` bigint(20) unsigned NOT NULL,
  `quran_page_number` smallint(5) unsigned NOT NULL,
  `from_aya` smallint(5) unsigned NOT NULL,
  `to_aya` smallint(5) unsigned NOT NULL,
  `evaluation` enum('excellent','good','average','weak') DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
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
  CONSTRAINT `quran_progress_halakat_id_foreign` FOREIGN KEY (`halakat_id`) REFERENCES `halakat` (`id`) ON DELETE CASCADE,
  CONSTRAINT `quran_progress_quran_page_number_foreign` FOREIGN KEY (`quran_page_number`) REFERENCES `quran_pages` (`page_number`),
  CONSTRAINT `quran_progress_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `quran_progress_surah_id_foreign` FOREIGN KEY (`surah_id`) REFERENCES `surah` (`id`),
  CONSTRAINT `quran_progress_teacher_id_foreign` FOREIGN KEY (`teacher_id`) REFERENCES `users` (`id`),
  CONSTRAINT `check_ayah_range` CHECK (`from_aya` <= `to_aya`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quran_progress`
--

LOCK TABLES `quran_progress` WRITE;
/*!40000 ALTER TABLE `quran_progress` DISABLE KEYS */;
INSERT INTO `quran_progress` VALUES (1,12,1,2,1,1,1,7,'excellent','أحسنت','2026-04-01',NULL,NULL),(2,13,2,3,2,2,1,20,'good','يحتاج مراجعة','2026-04-02',NULL,NULL),(3,14,3,4,1,1,1,7,'excellent','ممتاز','2026-04-03',NULL,NULL),(4,15,4,5,113,603,1,5,'average','تحتاج تحسين','2026-04-04',NULL,NULL),(5,16,5,6,1,1,1,7,'excellent','استمر','2026-04-05',NULL,NULL),(6,17,6,7,36,442,1,30,'good',NULL,'2026-04-06',NULL,NULL),(7,18,7,8,114,604,1,6,'weak','يحتاج مزيد من العمل','2026-04-07',NULL,NULL),(8,19,8,9,67,562,1,15,'excellent','حفظ متقن','2026-04-08',NULL,NULL),(9,20,9,10,55,531,1,20,'good','أداء جيد','2026-04-09',NULL,NULL),(10,21,10,11,18,293,1,31,'average','يحتاج تمرين أكثر','2026-04-10',NULL,NULL);
/*!40000 ALTER TABLE `quran_progress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL,
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
INSERT INTO `sessions` VALUES ('iBVJlt1zIX0wqp4U09VNbAPaqCgBbiwNLnwgfdNe',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36','YTo2OntzOjY6Il90b2tlbiI7czo0MDoibVZEa0tLTHBKaWpiZ0Y1Rm40SDE5ZVRTS2RONDNGczZQdnAxUmNmSSI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjM5OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYWRtaW4vdXNlci9jcmVhdGUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjU1OiJsb2dpbl9iYWNrcGFja181OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7czoyMjoicGFzc3dvcmRfaGFzaF9iYWNrcGFjayI7czo2MDoiJDJ5JDEyJElTZDNyRjcuVG45eE45N2xESEhlbHVYRVJNSVIyaVhaa2VpRFZwZWEucU1VUnVhcFZ3RGFPIjt9',1777804736),('IfdriWaNDg35HkmSHFfkSzx3PrTF7LyZ0RryXM0a',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36','YTo2OntzOjY6Il90b2tlbiI7czo0MDoiU1R5QUQxN2tLd2NZZm51NFY2amxNVkw0MGlaT05NcUZhRFlQeGlUVSI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjM4OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYWRtaW4vYXR0ZW5kYW5jZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTU6ImxvZ2luX2JhY2twYWNrXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjIyOiJwYXNzd29yZF9oYXNoX2JhY2twYWNrIjtzOjYwOiIkMnkkMTIkcUhrWXdNWVdLdUJGQ3VwRXVuU1kvT1M1Z0FYd05SZHZnMzY2ck94d2plRnB6WkphN3d0N0MiO30=',1777894673),('nH2dI9sVQBzFA9AAxLohALE2xX9TRkGnyQMxZ5vy',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoieEFVV1JpaFk0N2twaFBHT1dMajlsNGxJT0lxWUZ2Nmt1WXdVNzM0SSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hZG1pbi9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1777891549),('Oo5cAxFBBIJ8iq4RKgtFGgbIctK5Pshp7cfoDlAF',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36','YToyOntzOjY6Il90b2tlbiI7czo0MDoiT2VaR1NlZGRtSVNtRXVOZ1hsNDJsR3JpVWltRzhBSnNpbUlVeGNJQSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1777843910),('TMsIQY3lC5AimpcPh3eh5TLZw2zLjsVnB38LJ0IX',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiNkxsTVBqenkza2VYUWYyZDFhYkd2dzJtWnBtbjZ5bHp1VlNBeXdMUSI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozMjoiaHR0cDovL2xvY2FsaG9zdDo4MDAwL2FkbWluL3VzZXIiO31zOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czozMzoiaHR0cDovL2xvY2FsaG9zdDo4MDAwL2FkbWluL2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1777822862),('tOFcI54WTwX8APArAbb1EhOH0w0NJsWylM431PWc',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36','YTo3OntzOjY6Il90b2tlbiI7czo0MDoieEszd2VFNjk4WFhjdWFPNlBaQVRTSGJ5d0tkaUlyMlMyRUNKYUR0UyI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjMyOiJodHRwOi8vbG9jYWxob3N0OjgwMDAvYWRtaW4vdXNlciI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTU6ImxvZ2luX2JhY2twYWNrXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjIyOiJwYXNzd29yZF9oYXNoX2JhY2twYWNrIjtzOjYwOiIkMnkkMTIkcUhrWXdNWVdLdUJGQ3VwRXVuU1kvT1M1Z0FYd05SZHZnMzY2ck94d2plRnB6WkphN3d0N0MiO3M6NjoiY3JlYXRlIjthOjE6e3M6MTA6InNhdmVBY3Rpb24iO3M6MTI6InNhdmVfYW5kX25ldyI7fX0=',1777806488),('x2BUbrKd7JHkMvbi6cGvdjlIKNIpHR6pzrRWfD2S',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36','YTo3OntzOjY6Il90b2tlbiI7czo0MDoidWxaTHV0TEVYOTVsQlo1a1NuN0ExcnNVQVVhOUdUS1lNWThXeURPMiI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjQwOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYWRtaW4vdXNlci8xMS9zaG93Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1NToibG9naW5fYmFja3BhY2tfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO3M6MjI6InBhc3N3b3JkX2hhc2hfYmFja3BhY2siO3M6NjA6IiQyeSQxMiRxSGtZd01ZV0t1QkZDdXBFdW5TWS9PUzVnQVh3TlJkdmczNjZyT3h3amVGcHpaSmE3d3Q3QyI7czo2OiJ1cGRhdGUiO2E6MTp7czoxMDoic2F2ZUFjdGlvbiI7czoxMzoic2F2ZV9hbmRfYmFjayI7fX0=',1777824667);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `surah`
--

DROP TABLE IF EXISTS `surah`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `surah` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `number` tinyint(3) unsigned NOT NULL,
  `aya_count` smallint(5) unsigned NOT NULL,
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
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(255) NOT NULL,
  `birth_date` date DEFAULT NULL,
  `role` enum('admin','teacher','student') NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_phone_unique` (`phone`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'مدير النظام','0500000000','admin@example.com','$2y$12$qHkYwMYWKuBFCupEunSY/OS5gAXwNRdvg366rOxwjeFpzZJa7wt7C','1980-01-01','admin',NULL,'2026-05-02 09:19:21','2026-05-03 07:41:06'),(2,'أحمد محمد','0500000001','ahmed@example.com','$2y$12$tBfUmp0fISLw8CygjwNVd.0DkVs8fB7bzewyXmnnV2snv.vVfRPp.','1985-05-15','teacher',NULL,'2026-05-02 09:19:21','2026-05-02 09:19:21'),(3,'فاطمة علي','0500000002','fatima@example.com','$2y$12$gs6cD0hyqZKXrRpafH7qxuRnNFUzgtHDe6/om0Hyw42vkwknBVBV6','1990-08-20','teacher',NULL,'2026-05-02 09:19:22','2026-05-02 09:19:22'),(4,'خالد عبدالله','0500000003','khaled@example.com','$2y$12$0RCZZuRWjmr8g3WYKh0eCeO8koMIUrcf.sMQO3SzSuT4HTwgQPg8S','1988-12-10','teacher',NULL,'2026-05-02 09:19:22','2026-05-02 09:19:22'),(5,'عمر حسن','0500000004','omar@example.com','$2y$12$Pyg8Hi4TzkMB/DD68esQROXfU/A2kITK0ai4rDP4hzjp2wu3pB68y','1992-03-25','teacher',NULL,'2026-05-02 09:19:22','2026-05-02 09:19:22'),(6,'سارة أحمد','0500000005','sara@example.com','$2y$12$Thhi3yGNpkc./YH2Ay.MeeiB2zJoUrVvRALuQ.p2ho2295is3yWqK','1991-07-18','teacher',NULL,'2026-05-02 09:19:22','2026-05-02 09:19:22'),(7,'ياسر علي','0500000006','yasser@example.com','$2y$12$nXwpuzXSMRid6qAzk0FUouu/YI3nCLXn2g1eLNApZ.jS5bOEEks32','1987-11-30','teacher',NULL,'2026-05-02 09:19:23','2026-05-02 09:19:23'),(8,'نورة سعد','0500000007','noura@example.com','$2y$12$6eYT4MXSMcW17WxLoz8Ol.6okEyyvQnEVUy83hsNHQ9ULpxsQB0Pi','1993-02-14','teacher',NULL,'2026-05-02 09:19:23','2026-05-02 09:19:23'),(9,'ماجد فهد','0500000008','majed@example.com','$2y$12$2QnwAdDWxvQTOzZeMpennOYRD/Mzl11weHXgbJaMV1UOpbwR7LdrS','1986-06-22','teacher',NULL,'2026-05-02 09:19:23','2026-05-02 09:19:23'),(10,'ليلى عمر','0500000009','laila@example.com','$2y$12$xASozmDhXIWuFbezW7Je2.QOt8H4KLOtwm14O3XBRfJ4zgFtw7Rlm','1994-09-05','teacher',NULL,'2026-05-02 09:19:23','2026-05-02 09:19:23'),(11,'عبدالعزيز سعود','0500000010','abdulaziz@example.com','$2y$12$7zlwkw71nkAsOm1O8kezTuRzckTabILTM5Xn2uRG.fheUrI2B10P2','1989-04-17','teacher',NULL,'2026-05-02 09:19:23','2026-05-02 09:19:23'),(12,'عبدالرحمن سعيد','0500000011','abdulrahman@example.com','$2y$12$6jZejLN/5d9Llex6Hs6wLek3S.OZUwzML51xUunwXvjQkehXWESHS','2010-03-25','student',NULL,'2026-05-02 09:19:24','2026-05-02 09:19:24'),(13,'مريم أحمد','0500000012','mariam@example.com','$2y$12$Ds/u6tfGUolptDI7dKxHPem2XApOI9tyHveEbEWhrOlyUB4nPjZ.G','2012-07-18','student',NULL,'2026-05-02 09:19:24','2026-05-02 09:19:24'),(14,'يوسف محمد','0500000013','yousef@example.com','$2y$12$VSuVDU8KfnFlA0TcSjIMqeZ6lyZ.qs.jLiHISES6OuS8hkfrUCmWi','2011-11-30','student',NULL,'2026-05-02 09:19:24','2026-05-02 09:19:24'),(15,'هدى خالد','0500000014','huda@example.com','$2y$12$l4VD6/gp35yBpDhX4YQGi..gW6ZR/RdraxeIntSKk3LLWL5hyDpmy','2010-05-12','student',NULL,'2026-05-02 09:19:24','2026-05-02 09:19:24'),(16,'طارق فهد','0500000015','tareq@example.com','$2y$12$.47yMXlbNsYZp84Mdlk2IO3cmdm.SKaWRSex0sS8y0DjpOhm2dY5W','2011-08-23','student',NULL,'2026-05-02 09:19:25','2026-05-02 09:19:25'),(17,'رنا سعد','0500000016','rana@example.com','$2y$12$KACOT68ti0jPi/U61aJsBuJH8P6junjdro9r2T4bPPkTMQDdRAYvS','2012-01-15','student',NULL,'2026-05-02 09:19:25','2026-05-02 09:19:25'),(18,'سلطان عمر','0500000017','sultan@example.com','$2y$12$sKjclsVxfeHqeZxJeWDf4.1YLmiXPzRhNyrkT/Z6IE8b0zELAVcBy','2010-09-07','student',NULL,'2026-05-02 09:19:25','2026-05-02 09:19:25'),(19,'دانة ماجد','0500000018','dana@example.com','$2y$12$mefiii6RYh07r4bsnwg9cuWK/79MlZOyhBuNmvL2eaFieVUU1FT5.','2011-12-19','student',NULL,'2026-05-02 09:19:25','2026-05-02 09:19:25'),(20,'فيصل عبدالله','0500000019','faisal@example.com','$2y$12$MCDl35dMGkfbZkKsZWddXu5l5yufHA7KDUaRJsMIcu0If7F.tjSeS','2012-04-28','student',NULL,'2026-05-02 09:19:26','2026-05-02 09:19:26'),(21,'جنى ياسر','0500000020','jana@example.com','$2y$12$jMKSSwJ8zMEOS5mDom.TCe6XeyRH1BDR2kGFJY8O.OUOn1SttMyS6','2010-06-11','student',NULL,'2026-05-02 09:19:26','2026-05-02 09:19:26'),(22,'ihsan','0933526589','google@gmail.com','123123','2000-06-06','student',NULL,'2026-05-03 07:30:56','2026-05-03 07:30:56'),(23,'طالب تجريبي','0591234567','test.student@example.com','password','2026-05-17','student',NULL,'2026-05-03 07:45:13','2026-05-03 07:45:13'),(24,'طالب تجريبي 2','0599999999','test2@example.com','password',NULL,'student',NULL,'2026-05-03 07:49:12','2026-05-03 07:49:12'),(25,'طالب تجريبي 3','0598888888','test3@example.com','password',NULL,'admin',NULL,'2026-05-03 07:56:19','2026-05-03 07:56:19'),(26,'طالب تجريبي 5','0596666666','test5@example.com','123123','2026-04-30','student',NULL,'2026-05-03 08:06:32','2026-05-03 12:42:27');
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

-- Dump completed on 2026-05-05 15:49:46
