mysqldump: [Warning] Using a password on the command line interface can be insecure.
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: ez_aldeen
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
  CONSTRAINT `attendances_halakat_id_foreign` FOREIGN KEY (`halakat_id`) REFERENCES `halakat` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `attendances_recorded_by_foreign` FOREIGN KEY (`recorded_by`) REFERENCES `users` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `attendances_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendances`
--

LOCK TABLES `attendances` WRITE;
/*!40000 ALTER TABLE `attendances` DISABLE KEYS */;
INSERT INTO `attendances` VALUES (1,'2026-03-01','حاضر',NULL,22,1,2,NULL,NULL),(2,'2026-03-15','حاضر',NULL,22,1,2,NULL,NULL),(3,'2026-04-01','غائب','مرض',22,1,2,NULL,NULL),(4,'2026-03-05','حاضر',NULL,23,1,2,NULL,NULL),(5,'2026-03-20','غائب','ظروف عائلية',23,1,2,NULL,NULL),(6,'2026-03-01','حاضر',NULL,24,2,3,NULL,NULL),(7,'2026-03-18','حاضر',NULL,24,2,3,NULL,NULL),(8,'2026-03-10','غائب','مرض',25,2,3,NULL,NULL),(9,'2026-04-01','حاضر',NULL,25,2,3,NULL,NULL),(10,'2026-03-01','حاضر',NULL,26,3,4,NULL,NULL),(11,'2026-03-15','حاضر',NULL,26,3,4,NULL,NULL),(12,'2026-03-05','حاضر',NULL,27,3,4,NULL,NULL),(13,'2026-03-22','غائب','سفر',27,3,4,NULL,NULL),(14,'2026-03-01','حاضر',NULL,28,4,5,NULL,NULL),(15,'2026-03-20','حاضر',NULL,28,4,5,NULL,NULL),(16,'2026-03-12','حاضر',NULL,29,4,5,NULL,NULL),(17,'2026-04-05','غائب','مرض',29,4,5,NULL,NULL),(18,'2026-03-01','غائب','ظروف عائلية',30,5,6,NULL,NULL),(19,'2026-03-18','حاضر',NULL,30,5,6,NULL,NULL),(20,'2026-03-10','حاضر',NULL,31,5,6,NULL,NULL),(21,'2026-04-01','حاضر',NULL,31,5,6,NULL,NULL),(22,'2026-03-01','حاضر',NULL,32,6,7,NULL,NULL),(23,'2026-03-20','حاضر',NULL,32,6,7,NULL,NULL),(24,'2026-03-15','حاضر',NULL,33,6,7,NULL,NULL),(25,'2026-04-01','غائب','مرض',33,6,7,NULL,NULL),(26,'2026-03-05','حاضر',NULL,34,7,8,NULL,NULL),(27,'2026-03-22','حاضر',NULL,34,7,8,NULL,NULL),(28,'2026-03-10','غائب','ظروف عائلية',35,7,8,NULL,NULL),(29,'2026-04-01','حاضر',NULL,35,7,8,NULL,NULL),(30,'2026-03-01','حاضر',NULL,36,8,9,NULL,NULL),(31,'2026-03-18','حاضر',NULL,36,8,9,NULL,NULL),(32,'2026-03-25','حاضر',NULL,37,8,9,NULL,NULL),(33,'2026-04-05','غائب','سفر',37,8,9,NULL,NULL),(34,'2026-03-01','حاضر',NULL,38,9,10,NULL,NULL),(35,'2026-03-20','حاضر',NULL,38,9,10,NULL,NULL),(36,'2026-03-28','غائب','مرض',39,9,10,NULL,NULL),(37,'2026-04-10','حاضر',NULL,39,9,10,NULL,NULL),(38,'2026-03-05','حاضر',NULL,40,10,11,NULL,NULL),(39,'2026-03-25','حاضر',NULL,40,10,11,NULL,NULL),(40,'2026-03-15','حاضر',NULL,41,10,11,NULL,NULL),(41,'2026-04-01','غائب','ظروف عائلية',41,10,11,NULL,NULL);
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
INSERT INTO `halakat` VALUES (1,'حلقة الفجر','حلقة الصباح الباكر',2,'2026-05-08 21:06:00','2026-05-08 21:06:00',NULL),(2,'حلقة التحفيظ الصباحية','للمبتدئين',3,'2026-05-08 21:06:00','2026-05-08 21:06:00',NULL),(3,'حلقة المراجعة','للمتقدمين',4,'2026-05-08 21:06:00','2026-05-08 21:06:00',NULL),(4,'حلقة التجويد','تجويد وترتيل',5,'2026-05-08 21:06:00','2026-05-08 21:06:00',NULL),(5,'حلقة حفظ المختصر',NULL,6,'2026-05-08 21:06:00','2026-05-08 21:06:00',NULL),(6,'حلقة التميز','طلاب متفوقون',7,'2026-05-08 21:06:00','2026-05-08 21:06:00',NULL),(7,'حلقة النور',NULL,8,'2026-05-08 21:06:00','2026-05-08 21:06:00',NULL),(8,'حلقة الرحمة','للأطفال',9,'2026-05-08 21:06:01','2026-05-08 21:06:01',NULL),(9,'حلقة الفرقان','حفظ القرآن الكريم',10,'2026-05-08 21:06:01','2026-05-08 21:06:01',NULL),(10,'حلقة البركة','للمبتدئين',11,'2026-05-08 21:06:01','2026-05-08 21:06:01',NULL),(11,'حلقة الهدى','تجويد وحفظ',12,'2026-05-08 21:06:01','2026-05-08 21:06:01',NULL),(12,'حلقة الحكمة','للمراجعة المتقدمة',13,'2026-05-08 21:06:01','2026-05-08 21:06:01',NULL),(13,'حلقة الصبر',NULL,14,'2026-05-08 21:06:01','2026-05-08 21:06:01',NULL),(14,'حلقة الشكر','للإتقان',15,'2026-05-08 21:06:01','2026-05-08 21:06:01',NULL),(15,'حلقة الإخلاص','لحفاظ الجزء الثلاثون',16,'2026-05-08 21:06:01','2026-05-08 21:06:01',NULL),(16,'حلقة التوبة','بانتظار مدرس',NULL,'2026-05-08 21:06:01','2026-05-08 21:06:01',NULL),(17,'حلقة الاستقامة',NULL,NULL,'2026-05-08 21:06:01','2026-05-08 21:06:01',NULL),(18,'حلقة التقوى','حلقة جديدة',NULL,'2026-05-08 21:06:01','2026-05-08 21:06:01',NULL),(19,'حلقة الورع','قيد التأسيس',NULL,'2026-05-08 21:06:01','2026-05-08 21:06:01',NULL),(20,'حلقة اليقين',NULL,NULL,'2026-05-08 21:06:01','2026-05-08 21:06:01',NULL);
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
  CONSTRAINT `halakat_students_halakat_id_foreign` FOREIGN KEY (`halakat_id`) REFERENCES `halakat` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `halakat_students_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `halakat_students`
--

LOCK TABLES `halakat_students` WRITE;
/*!40000 ALTER TABLE `halakat_students` DISABLE KEYS */;
INSERT INTO `halakat_students` VALUES (1,22,1,'2025-09-01',NULL,1,'2026-05-08 21:06:01','2026-05-08 21:06:01'),(2,23,1,'2025-09-15',NULL,1,'2026-05-08 21:06:01','2026-05-08 21:06:01'),(3,24,2,'2025-09-01',NULL,1,'2026-05-08 21:06:01','2026-05-08 21:06:01'),(4,25,2,'2025-10-01',NULL,1,'2026-05-08 21:06:01','2026-05-08 21:06:01'),(5,26,3,'2025-09-01',NULL,1,'2026-05-08 21:06:01','2026-05-08 21:06:01'),(6,27,3,'2025-09-20',NULL,1,'2026-05-08 21:06:01','2026-05-08 21:06:01'),(7,28,4,'2025-08-15',NULL,1,'2026-05-08 21:06:01','2026-05-08 21:06:01'),(8,29,4,'2025-10-10',NULL,1,'2026-05-08 21:06:01','2026-05-08 21:06:01'),(9,30,5,'2025-09-01',NULL,1,'2026-05-08 21:06:01','2026-05-08 21:06:01'),(10,31,5,'2025-11-01',NULL,1,'2026-05-08 21:06:01','2026-05-08 21:06:01'),(11,32,6,'2025-09-01',NULL,1,'2026-05-08 21:06:01','2026-05-08 21:06:01'),(12,33,6,'2025-10-05',NULL,1,'2026-05-08 21:06:01','2026-05-08 21:06:01'),(13,34,7,'2025-09-10',NULL,1,'2026-05-08 21:06:01','2026-05-08 21:06:01'),(14,35,7,'2025-09-25',NULL,1,'2026-05-08 21:06:01','2026-05-08 21:06:01'),(15,36,8,'2025-09-01',NULL,1,'2026-05-08 21:06:01','2026-05-08 21:06:01'),(16,37,8,'2025-10-20',NULL,1,'2026-05-08 21:06:01','2026-05-08 21:06:01'),(17,38,9,'2025-09-01',NULL,1,'2026-05-08 21:06:01','2026-05-08 21:06:01'),(18,39,9,'2025-11-15',NULL,1,'2026-05-08 21:06:01','2026-05-08 21:06:01'),(19,40,10,'2025-09-01',NULL,1,'2026-05-08 21:06:01','2026-05-08 21:06:01'),(20,41,10,'2025-10-01',NULL,1,'2026-05-08 21:06:01','2026-05-08 21:06:01'),(21,24,1,'2025-09-01','2025-10-15',0,'2026-05-08 21:06:01','2026-05-08 21:06:01'),(22,27,2,'2025-08-01','2025-09-19',0,'2026-05-08 21:06:01','2026-05-08 21:06:01'),(23,31,4,'2025-09-01','2025-10-31',0,'2026-05-08 21:06:01','2026-05-08 21:06:01'),(24,35,6,'2025-09-01','2025-10-04',0,'2026-05-08 21:06:01','2026-05-08 21:06:01'),(25,39,8,'2025-09-01','2025-11-14',0,'2026-05-08 21:06:01','2026-05-08 21:06:01');
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_01_01_000000_create_users_table',1),(2,'0001_01_01_000001_create_cache_table',1),(3,'0001_01_01_000002_create_jobs_table',1),(4,'2026_04_29_071541_create_personal_access_tokens_table',1),(5,'2026_04_29_072810_create_halakat_table',1),(6,'2026_04_29_072843_create_halakat_students_table',1),(7,'2026_04_29_072856_create_surah_table',1),(8,'2026_04_29_072917_create_quran_pages_table',1),(9,'2026_04_29_072946_create_quran_progress_table',1),(10,'2026_04_29_073024_create_attendances_table',1),(11,'2026_04_29_073034_create_notes_table',1),(12,'2026_04_29_130540_add_email_to_users_table',1),(13,'2026_05_07_072359_make_teacher_id_nullable_in_halakat_table',1),(14,'2026_05_07_134723_remove_unique_student_id_from_halakat_students_table',1),(15,'2026_05_10_143016_add_deleted_at_to_halakat_table',2),(16,'2026_05_12_154520_student_achievements_table',2),(17,'2026_05_12_161704_add_memorize_type_to_quran_progress_table',2),(18,'2026_05_14_103828_make_teacher_id_nullable_in_quran_progress',2),(19,'2026_05_14_104853_make_halakat_id_nullable_in_quran_progress',2),(20,'2026_05_14_111245_add_juz_number_to_quran_progress',2),(21,'2026_05_14_112430_make_quran_page_number_nullable_in_quran_progress',3),(22,'2026_05_16_133224_make_quran_page_number_nullable_in_quran_progress',3),(23,'2026_05_16_212051_change_juz_number_to_json_in_quran_progress',3),(24,'2026_05_16_215939_make_surah_id_nullable_in_quran_progress',3);
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
  CONSTRAINT `notes_sender_id_foreign` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `notes_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT
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
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
INSERT INTO `personal_access_tokens` VALUES (2,'App\\Models\\User',26,'auth_Token','3d3093f47bad1ce8e4851454f96ee2c9e058c9bc725731da3d2d80659e5188bc','[\"*\"]',NULL,NULL,'2026-05-08 21:12:15','2026-05-08 21:12:15'),(14,'App\\Models\\User',21,'auth_Token','c6e596deb7cc09abf7d699b1a87d6b0f1e7a6bdbc507a6055daf70db37666ed8','[\"*\"]',NULL,NULL,'2026-05-09 13:48:20','2026-05-09 13:48:20'),(15,'App\\Models\\User',21,'auth_Token','e8beb60ee7d1d77b977cff1e0c82bcf1dbedcd5ce8f5bc4b2e4017da0fe7efa2','[\"*\"]',NULL,NULL,'2026-05-09 13:48:34','2026-05-09 13:48:34'),(16,'App\\Models\\User',11,'auth_Token','9af373ccc24ab896fdace4fc04e49dfb01e77bc2ce7e82f26eb7d45c24b74fd5','[\"*\"]','2026-05-20 17:17:58',NULL,'2026-05-20 16:21:10','2026-05-20 17:17:58'),(17,'App\\Models\\User',11,'auth_Token','f1a59e5028ee5bebb6ab705ceaeb3ef838e6c258d35c46fcb7836082654f1862','[\"*\"]','2026-05-21 08:51:51',NULL,'2026-05-21 08:33:56','2026-05-21 08:51:51'),(18,'App\\Models\\User',11,'auth_Token','a347cd631ea5cc7a37a17ba5f3cd4c8ba95e5cff2080e41259b4b6a1ee9dd99f','[\"*\"]',NULL,NULL,'2026-05-21 08:56:18','2026-05-21 08:56:18'),(19,'App\\Models\\User',2,'auth_Token','460fd58583ebe3e98b3ec0573d4779148e41c7fe586411cc1be110aada016d49','[\"*\"]','2026-05-21 10:05:47',NULL,'2026-05-21 09:00:11','2026-05-21 10:05:47'),(20,'App\\Models\\User',11,'auth_Token','e539feb945cde8670628fbf8afa4a73e90f324ec80ec9e1acec3091944881ef5','[\"*\"]',NULL,NULL,'2026-05-21 09:48:43','2026-05-21 09:48:43'),(21,'App\\Models\\User',11,'auth_Token','ad31e65fedcc22da73dd3ce55894a46482f0f386071776348ebf60ba828bdfc0','[\"*\"]','2026-05-21 10:49:40',NULL,'2026-05-21 10:04:52','2026-05-21 10:49:40'),(22,'App\\Models\\User',11,'auth_Token','dbd06ccfac68e1529d95c705f8855f9b54ec654fbab0e5224e775acd16792bc7','[\"*\"]',NULL,NULL,'2026-05-21 10:50:23','2026-05-21 10:50:23'),(33,'App\\Models\\User',2,'auth_Token','9a3d378d0ff884ed197fe8963c090b5e52a615474e9d0c4a2c8e3508be10c84a','[\"*\"]','2026-05-21 12:05:32',NULL,'2026-05-21 11:34:51','2026-05-21 12:05:32'),(34,'App\\Models\\User',2,'auth_Token','4fc4556c614b16661f074dda86899be88733c7974c9a8f766260deb5cbebf625','[\"*\"]',NULL,NULL,'2026-05-21 16:43:04','2026-05-21 16:43:04'),(35,'App\\Models\\User',2,'auth_Token','566bc7d2cbd36016356c00af13f146ed5c179912b3dea1985b3a1e493dfb707d','[\"*\"]',NULL,NULL,'2026-05-21 16:43:24','2026-05-21 16:43:24'),(36,'App\\Models\\User',2,'auth_Token','95bd2d046f67ae3820a1ecf0179a358a0a5b98e7ea3c1cd93c3ba3f7b84e324a','[\"*\"]',NULL,NULL,'2026-05-21 16:44:11','2026-05-21 16:44:11'),(37,'App\\Models\\User',2,'auth_Token','cd4acb16b513f3543d30752feda797e63d78e3279a8ec7c2a404b1129f792597','[\"*\"]','2026-05-21 16:59:05',NULL,'2026-05-21 16:44:39','2026-05-21 16:59:05'),(38,'App\\Models\\User',2,'auth_Token','70b8c596037acc9620c23ccad35182190c55df1a14712f882168ee6c24fff2c2','[\"*\"]','2026-05-21 16:58:51',NULL,'2026-05-21 16:48:32','2026-05-21 16:58:51'),(39,'App\\Models\\User',2,'auth_Token','a3eb26d1fb3986a3163949d1bb80a758f9c1db20f8b207c43a594fda24a485c3','[\"*\"]','2026-05-21 16:59:47',NULL,'2026-05-21 16:59:13','2026-05-21 16:59:47');
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
  `juz_number` json DEFAULT NULL,
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
  CONSTRAINT `quran_progress_halakat_id_foreign` FOREIGN KEY (`halakat_id`) REFERENCES `halakat` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `quran_progress_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `quran_progress_surah_id_foreign` FOREIGN KEY (`surah_id`) REFERENCES `surah` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `quran_progress_teacher_id_foreign` FOREIGN KEY (`teacher_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `check_ayah_range` CHECK ((`from_aya` <= `to_aya`))
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quran_progress`
--

LOCK TABLES `quran_progress` WRITE;
/*!40000 ALTER TABLE `quran_progress` DISABLE KEYS */;
INSERT INTO `quran_progress` VALUES (1,22,1,2,1,1,1,7,NULL,'ممتاز','أحسنت','حفظ','2026-03-01',NULL,NULL),(2,22,1,2,2,5,1,5,NULL,'جيد جدا','بداية جيدة','حفظ','2026-03-15',NULL,NULL),(3,22,1,2,2,10,60,65,NULL,'جيد','يحتاج مراجعة التجويد','حفظ','2026-04-01',NULL,NULL),(4,23,1,2,1,1,1,7,NULL,'جيد جدا','تلاوة واضحة','حفظ','2026-03-05',NULL,NULL),(5,23,1,2,2,2,1,5,NULL,'ممتاز','حفظ متقن','حفظ','2026-03-20',NULL,NULL),(6,24,2,3,36,442,1,10,NULL,'ممتاز','حفظ رائع','حفظ','2026-03-01',NULL,NULL),(7,24,2,3,36,443,11,20,NULL,'جيد جدا','استمر','حفظ','2026-03-18',NULL,NULL),(8,25,2,3,67,562,1,15,NULL,'جيد','تحتاج تحسين','حفظ','2026-03-10',NULL,NULL),(9,25,2,3,67,562,16,30,NULL,'جيد جدا','تحسن ملحوظ','حفظ','2026-04-01',NULL,NULL),(10,26,3,4,113,603,1,5,NULL,'ممتاز','إتقان كامل','حفظ','2026-03-01',NULL,NULL),(11,26,3,4,114,604,1,6,NULL,'ممتاز','أحسنت','حفظ','2026-03-15',NULL,NULL),(12,27,3,4,55,531,1,20,NULL,'جيد','يحتاج تمرين أكثر','حفظ','2026-03-05',NULL,NULL),(13,27,3,4,55,532,21,40,NULL,'جيد','التركيز على المخارج','حفظ','2026-03-22',NULL,NULL),(14,28,4,5,18,293,1,15,NULL,'جيد جدا','أداء جيد','حفظ','2026-03-01',NULL,NULL),(15,28,4,5,18,295,25,40,NULL,'ممتاز','تقدم ممتاز','حفظ','2026-03-20',NULL,NULL),(16,29,4,5,1,1,1,7,NULL,'جيد','يحتاج ممارسة أكثر','حفظ','2026-03-12',NULL,NULL),(17,29,4,5,109,599,1,6,NULL,'جيد جدا','أحسن الحفظ','حفظ','2026-04-05',NULL,NULL),(18,30,5,6,78,582,1,20,NULL,'اعادة','يحتاج مزيد من العمل','حفظ','2026-03-01',NULL,NULL),(19,30,5,6,78,582,21,40,NULL,'جيد','تحسن بعد المراجعة','حفظ','2026-03-18',NULL,NULL),(20,31,5,6,112,602,1,4,NULL,'ممتاز','حفظ ممتاز','حفظ','2026-03-10',NULL,NULL),(21,31,5,6,113,603,1,5,NULL,'ممتاز','استمر','حفظ','2026-04-01',NULL,NULL),(22,32,6,7,2,21,142,150,NULL,'جيد جدا','تقدم جيد','حفظ','2026-03-01',NULL,NULL),(23,32,6,7,2,23,155,162,NULL,'ممتاز','حفظ متقن','حفظ','2026-03-20',NULL,NULL),(24,33,6,7,3,62,1,10,NULL,'جيد','يحتاج تركيز','حفظ','2026-03-15',NULL,NULL),(25,33,6,7,3,63,11,20,NULL,'جيد جدا','تحسن واضح','حفظ','2026-04-01',NULL,NULL),(26,34,7,8,87,591,1,19,NULL,'ممتاز','أحسنت','حفظ','2026-03-05',NULL,NULL),(27,34,7,8,88,592,1,26,NULL,'جيد جدا','عمل ممتاز','حفظ','2026-03-22',NULL,NULL),(28,35,7,8,1,1,1,7,NULL,'اعادة','يحتاج مراجعة الفاتحة','حفظ','2026-03-10',NULL,NULL),(29,35,7,8,1,1,1,7,NULL,'جيد','تحسن بعد المراجعة','حفظ','2026-04-01',NULL,NULL),(30,36,8,9,111,599,1,5,NULL,'ممتاز','حفظ متقن','حفظ','2026-03-01',NULL,NULL),(31,36,8,9,112,602,1,4,NULL,'ممتاز','أداء رائع','حفظ','2026-03-18',NULL,NULL),(32,37,8,9,103,598,1,3,NULL,'جيد جدا','جيد','حفظ','2026-03-25',NULL,NULL),(33,37,8,9,104,598,1,9,NULL,'جيد','يحتاج تحسين النطق','حفظ','2026-04-05',NULL,NULL),(34,38,9,10,56,535,1,30,NULL,'ممتاز','حفظ متقن','حفظ','2026-03-01',NULL,NULL),(35,38,9,10,56,537,31,60,NULL,'جيد جدا','استمر','حفظ','2026-03-20',NULL,NULL),(36,39,9,10,110,600,1,3,NULL,'جيد','بداية جيدة','حفظ','2026-03-28',NULL,NULL),(37,39,9,10,109,599,1,6,NULL,'جيد جدا','أداء جيد','حفظ','2026-04-10',NULL,NULL),(38,40,10,11,14,255,1,15,NULL,'جيد','يحتاج مراجعة','حفظ','2026-03-05',NULL,NULL),(39,40,10,11,14,256,16,30,NULL,'جيد جدا','تحسن','حفظ','2026-03-25',NULL,NULL),(40,41,10,11,1,1,1,7,NULL,'ممتاز','حفظ متقن','حفظ','2026-03-15',NULL,NULL),(41,41,10,11,2,2,1,5,NULL,'جيد جدا','استمر','حفظ','2026-04-01',NULL,NULL);
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
INSERT INTO `sessions` VALUES ('5DI1Zwj6qpbOz6EnJGLLa5nRxJ70G325ABmLGGe7',NULL,'172.20.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiVzd2WG93YXd1WGFXcGloSXBQQjZTT1V2VHNjWDRhVmM3UzA2aUpvMiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjM6Imh0dHA6Ly8xNzIuMzAuOTYuMTo4MDgwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1779347882);
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
  CONSTRAINT `student_achievements_halakat_id_foreign` FOREIGN KEY (`halakat_id`) REFERENCES `halakat` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `student_achievements_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `student_achievements_surah_id_foreign` FOREIGN KEY (`surah_id`) REFERENCES `surah` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `student_achievements_teacher_id_foreign` FOREIGN KEY (`teacher_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_achievements`
--

LOCK TABLES `student_achievements` WRITE;
/*!40000 ALTER TABLE `student_achievements` DISABLE KEYS */;
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
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_phone_unique` (`phone`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'مدير النظام','0500000000','admin@example.com','$2y$12$tkc3meJ6zJilZLdckF3TO.KkV3nlW5jPRlO0MSiqID4Kr/DnBgML.','1980-01-01','admin',NULL,'2026-05-08 21:05:49','2026-05-08 21:05:49',NULL),(2,'أحمد محمد','0997176570','ahmed@example.com','$2y$12$InHiA3Wljq/N1mItFLS.P.j4K6oe7kODHUo/wiRMkpA3V3MKzF86e','1985-05-15','teacher',NULL,'2026-05-08 21:05:49','2026-05-08 21:05:49',NULL),(3,'فاطمة علي','0933967587','fatima@example.com','$2y$12$FrhX5gXr/F0zQkxLVL/D5exoXLXzWJolUBg40qYdrMHZWjKzrIKdy','1990-08-20','teacher',NULL,'2026-05-08 21:05:49','2026-05-08 21:05:49',NULL),(4,'خالد عبدالله','0550000003','khaled@example.com','$2y$12$6Rla6AkUeHF1X.9aYBNGduQCVBjI9Y6fIbbY0YBdFFBawyjUjSoLS','1988-12-10','teacher',NULL,'2026-05-08 21:05:50','2026-05-08 21:05:50',NULL),(5,'عمر حسن','0550000004','omar@example.com','$2y$12$O5./l5nfmFHBUvRhvJ46CeQy2GOqH78lhKl0HaVhT.VvMsvCHqF1O','1992-03-25','teacher',NULL,'2026-05-08 21:05:50','2026-05-08 21:05:50',NULL),(6,'سارة أحمد','0550000005','sara@example.com','$2y$12$Eib6dYqaHGTjkTmlm8/noeU8WPcCnahKVPmJu8eBpvBeDG2pR5CJy','1991-07-18','teacher',NULL,'2026-05-08 21:05:50','2026-05-08 21:05:50',NULL),(7,'ياسر علي','0550000006','yasser@example.com','$2y$12$xfFWQOWUevhHogrSL1nGKezuGm3uXPozHMtwHdvRNcUmeOvFcdkjC','1987-11-30','teacher',NULL,'2026-05-08 21:05:50','2026-05-08 21:05:50',NULL),(8,'نورة سعد','0550000007','noura@example.com','$2y$12$j/s8BPAkQekwiVGEn.6ryuy8Rv0MOT4Rpy3fDb3620aiMnypoVDE6','1993-02-14','teacher',NULL,'2026-05-08 21:05:51','2026-05-08 21:05:51',NULL),(9,'ماجد فهد','0550000008','majed@example.com','$2y$12$c3lL7up2fISkG0zRDiIjrepMwjuc0BGMqDn3jLUH5DtTea6JJLmfq','1986-06-22','teacher',NULL,'2026-05-08 21:05:51','2026-05-08 21:05:51',NULL),(10,'ليلى عمر','0550000009','laila@example.com','$2y$12$9S1J1b0wQPLcqjIwZ0qR..JsB7RbfY38pUNZZbMfpEVRtej79Sr16','1994-09-05','teacher',NULL,'2026-05-08 21:05:51','2026-05-08 21:05:51',NULL),(11,'عبدالعزيز سعود','0550000010','abdulaziz@example.com','$2y$12$DD1nsu3j1uAqZd04zlCedeXK.kaCEnXhhNMIqCNyL6rH1b5wR1/Hq','1989-04-17','teacher',NULL,'2026-05-08 21:05:51','2026-05-08 21:05:51',NULL),(12,'محمود إبراهيم','0550000011','mahmoud@example.com','$2y$12$xpNtxpqg49YhdQ9pPqty2u8YS3pRK7JDoAiMhX5hgLH1FCBYb/uKa','1991-01-12','teacher',NULL,'2026-05-08 21:05:52','2026-05-08 21:05:52',NULL),(13,'هدى عبدالرحمن','0550000012','huda.t@example.com','$2y$12$27noDsw8miIp9LbxeTDqWeQ71IgUZyOJe9GacNTo4Ea4mhJ7IUv4e','1988-08-30','teacher',NULL,'2026-05-08 21:05:52','2026-05-08 21:05:52',NULL),(14,'عبدالرحمن خالد','0550000013','abdulrahman.t@example.com','$2y$12$7xekHxNeL4Vg2enYVfBQY.6K4YxFw4EzxQas4PVidtEgC3o.ZKU..','1990-11-22','teacher',NULL,'2026-05-08 21:05:52','2026-05-08 21:05:52',NULL),(15,'رانيا صالح','0550000014','rania@example.com','$2y$12$738As4.f05PaGK62kWACDO6F/bMn6aA/P6Np40lSWP.TUc22iNtQ.','1993-04-08','teacher',NULL,'2026-05-08 21:05:52','2026-05-08 21:05:52',NULL),(16,'سلمان فهد','0550000015','salman@example.com','$2y$12$YG8tviGl0bZdme8ny3Et.Oav409CZMkHeMoU7SeJQWk1x8/gO5P9q','1987-07-19','teacher',NULL,'2026-05-08 21:05:52','2026-05-08 21:05:52',NULL),(17,'دانة عبدالله','0550000016','dana.t@example.com','$2y$12$VRe2DDDypMCuth5jt0bJtu7GWq8U8.kluCNFKOPWlrPtYLbHVmpDe','1992-12-03','teacher',NULL,'2026-05-08 21:05:53','2026-05-08 21:05:53',NULL),(18,'محمد العتيبي','0550000017','mohammed@example.com','$2y$12$5bujnqX9hHaeCUTgNtAB/eomicv5dcXFXychksqQnCuDME.UuH3rq','1989-06-15','teacher',NULL,'2026-05-08 21:05:53','2026-05-08 21:05:53',NULL),(19,'ريم سعد','0550000018','reem@example.com','$2y$12$7/sN6kadzoUidNhlB8KnDu3eO.pC98szYa/0Eq8zeEZ/zBKKGW8jK','1991-03-28','teacher',NULL,'2026-05-08 21:05:53','2026-05-08 21:05:53',NULL),(20,'تركي ماجد','0550000019','turki@example.com','$2y$12$iJrTzSw5ysS7bi7M2/2KEeu65iAi56dR91DrEBBUGI1yufVnFn2c6','1986-10-11','teacher',NULL,'2026-05-08 21:05:53','2026-05-08 21:05:53',NULL),(21,'سلمى حسن','0550000020','salma@example.com','$2y$12$Z9L3wqx9dEvXTsMRMmdhV.lk4jWgmSNE9L20Uj6Tuut.JLs0WdGAe','1994-02-25','teacher',NULL,'2026-05-08 21:05:54','2026-05-08 21:05:54',NULL),(22,'عبدالرحمن سعيد','0560000001','abdulrahman.s@example.com','$2y$12$a3n7PfyasxK4N8s2X39EkOYe/Rc5tulMriJ5hHrFRqrkCKffMyY1u','2010-03-25','student',NULL,'2026-05-08 21:05:54','2026-05-08 21:05:54',NULL),(23,'مريم أحمد','0560000002','mariam@example.com','$2y$12$gaw38flPDldB2LwkASLOa.ft0eMOvy3ZZzq1n2Tvn2PBy.tQneUU6','2012-07-18','student',NULL,'2026-05-08 21:05:54','2026-05-08 21:05:54',NULL),(24,'يوسف محمد','0560000003','yousef@example.com','$2y$12$GhXAyLngAHc0GflBPbSdyOEN7cVpil3kDhhrs6hq4RxmE/1Zm318W','2011-11-30','student',NULL,'2026-05-08 21:05:54','2026-05-08 21:05:54',NULL),(25,'هدى خالد','0560000004','huda.s@example.com','$2y$12$FSrkU16g.EXK6MoVJSfNNO6iDq9Wmg9Ufu9pMYPlFkTBFUGuytrJK','2010-05-12','student',NULL,'2026-05-08 21:05:55','2026-05-08 21:05:55',NULL),(26,'طارق فهد','0560000005','tareq@example.com','$2y$12$RoYwMv2fKmCn/zaGnJ9uCOQgRHnGgvohzYRnJ2OgZgO07pP1yTXZG','2011-08-23','student',NULL,'2026-05-08 21:05:55','2026-05-08 21:05:55',NULL),(27,'رنا سعد','0560000006','rana@example.com','$2y$12$vO.XQCxhGpD1zfZY.yl5tOko.03Y9zWJ9D8x.FMJ3tTQAfhVZgJWa','2012-01-15','student',NULL,'2026-05-08 21:05:55','2026-05-08 21:05:55',NULL),(28,'سلطان عمر','0560000007','sultan@example.com','$2y$12$ChE6MBCO8NYJr0ohRpxZC.x/azurhadPaJom0oAQLzOiZhfzmdX6u','2010-09-07','student',NULL,'2026-05-08 21:05:56','2026-05-08 21:05:56',NULL),(29,'دانة ماجد','0560000008','dana.s@example.com','$2y$12$alphPBm.mEGH4jsKHGQpt.RGzTCovbN9abSKHtuKptcmwYhlQ1t2y','2011-12-19','student',NULL,'2026-05-08 21:05:56','2026-05-08 21:05:56',NULL),(30,'فيصل عبدالله','0560000009','faisal@example.com','$2y$12$64siMZx6l6QWL8YzN/0iSeqyVhoqZq/Xoadc756FvN31EQCIm.Wha','2012-04-28','student',NULL,'2026-05-08 21:05:56','2026-05-08 21:05:56',NULL),(31,'جنى ياسر','0560000010','jana@example.com','$2y$12$CUlrz/.mih8EsR9pr.hAeuwIIE38hnf1yZ9.DS7qm2K8kK2E1fNx.','2010-06-11','student',NULL,'2026-05-08 21:05:57','2026-05-08 21:05:57',NULL),(32,'عبدالله حسن','0560000011','abdullah@example.com','$2y$12$JNZsBFYg12bmGCK4qqWdI.41WiK.JbpfL5L4KPob0P44VrSNaIKLi','2011-02-20','student',NULL,'2026-05-08 21:05:57','2026-05-08 21:05:57',NULL),(33,'لينا محمد','0560000012','lina@example.com','$2y$12$AKhmLRblaNry3Te0.AxnmOjwuytd5.CUdHgGTslZDFq5l2QrzsKOC','2012-08-14','student',NULL,'2026-05-08 21:05:57','2026-05-08 21:05:57',NULL),(34,'حمزة علي','0560000013','hamza@example.com','$2y$12$n75Q8UtG8M8Rroc/MWr1TubktxvRGD53UIIcaPTkRZAJaOMH6HQq.','2010-11-03','student',NULL,'2026-05-08 21:05:58','2026-05-08 21:05:58',NULL),(35,'نوف سالم','0560000014','nouf@example.com','$2y$12$AollWutNeCredp.RktgrdeGAteDh0/bdJ4ojOfrF50YmAcjN0LsK.','2011-04-17','student',NULL,'2026-05-08 21:05:58','2026-05-08 21:05:58',NULL),(36,'ماجد الصغير','0560000015','majed.s@example.com','$2y$12$9NRM35KYdiiVyL0qWpwN4uhXL.yMw4a0ECtuwdq9puHK3nYxMFlaC','2012-06-09','student',NULL,'2026-05-08 21:05:58','2026-05-08 21:05:58',NULL),(37,'شهد إبراهيم','0560000016','shahd@example.com','$2y$12$/FYrQtl71atg9UWKT02Fm.Euq8SDjIHZbcK65G5GlaIszV8.fWC0K','2010-01-28','student',NULL,'2026-05-08 21:05:58','2026-05-08 21:06:00','2026-05-08 21:06:00'),(38,'عمران يوسف','0560000017','omran@example.com','$2y$12$Mq/bz1GeW3vSGDQg2n9CJOfUlgDmV3GHqoPGmExqd3NUmA.K.QnQm','2011-09-12','student',NULL,'2026-05-08 21:05:59','2026-05-08 21:05:59',NULL),(39,'غادة سعود','0560000018','ghada@example.com','$2y$12$14GPpVuyuEdU.Jp/wURKuOIXHk/wz.2mJ8GZAdLv8NuJa6aAZDg7u','2012-03-05','student',NULL,'2026-05-08 21:05:59','2026-05-08 21:05:59',NULL),(40,'باسل خالد','0560000019','basel@example.com','$2y$12$fI9oPjREEXy6aVUqfxC4xuKl.L0nMMT24syRt02kGZsDUN2GMt3b6','2010-07-22','student',NULL,'2026-05-08 21:05:59','2026-05-08 21:05:59',NULL),(41,'منال عبدالله','0560000020','manal@example.com','$2y$12$VXnmKk2mYYb1K0ARZuXvzuDY5pyo0/7rdp20xzAcPYH9VAOEVtM8W','2011-10-31','student',NULL,'2026-05-08 21:06:00','2026-05-08 21:06:00',NULL);
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

-- Dump completed on 2026-05-21 20:10:41
