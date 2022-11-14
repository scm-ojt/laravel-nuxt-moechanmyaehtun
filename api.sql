-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: api
-- ------------------------------------------------------
-- Server version	8.0.30

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(4,'2019_12_14_000001_create_personal_access_tokens_table',1),(5,'2022_11_04_013731_create_posts_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
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
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
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
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (5,'Flowersupdate','img/1668048958636c683e551cd_default_product.png',NULL,'2022-11-08 22:04:13','2022-11-09 20:25:58'),(6,'samsungupdate','img/1668048976636c68506f99d_default_product.png',NULL,'2022-11-09 00:31:46','2022-11-09 23:00:53'),(7,'hi','img/1668063845636ca265f2040_default_product.png',NULL,'2022-11-10 00:34:06','2022-11-10 00:34:06'),(8,'hi','img/1668063905636ca2a1f24dd_user.png',NULL,'2022-11-10 00:34:58','2022-11-10 00:35:05'),(9,'mochi','img/1668071088636cbeb0b06ed_default_product.png',NULL,'2022-11-10 02:34:48','2022-11-10 02:34:48'),(16,'Ab velit incidunt','img/1668151644636df95c11b20_images.jpg',NULL,'2022-11-11 00:57:24','2022-11-11 00:57:24'),(17,'llllllll','img/1668151719636df9a701669_images.jpg',NULL,'2022-11-11 00:58:39','2022-11-11 00:59:24'),(18,'Nam ipsum unde neque','img/1668151805636df9fd65847_user.png',NULL,'2022-11-11 01:00:05','2022-11-11 01:00:05'),(19,'aaaa','img/1668151911636dfa6757f12_samsung-galaxy-z-fold-4-6662.jpg',NULL,'2022-11-11 01:01:51','2022-11-11 01:01:51'),(20,'hello','img/1668152284636dfbdc49305_img_7.jpg',NULL,'2022-11-11 01:08:04','2022-11-11 01:08:04'),(21,'aavv','img/1668152742636dfda6a8888_samsung-galaxy-z-fold-4-6662.jpg',NULL,'2022-11-11 01:15:42','2022-11-11 02:00:42'),(24,'vvv','img/1668155932636e0a1c5798b_default_product.png',NULL,'2022-11-11 02:08:52','2022-11-11 02:08:52'),(27,'dog','img/16683923286371a58879d43_img-03.jpg',NULL,'2022-11-13 19:48:48','2022-11-13 19:48:48');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Mochi','mochi@gmail.com',NULL,'$2y$10$UkZbfEmym9Rehv1FRWHj9OgebzVo1g5DWbvknltH5KfB66Efub8.a',NULL,'2022-11-08 21:31:24','2022-11-08 21:31:24'),(2,'moe','moe@gmail.com',NULL,'$2y$10$djSQP0sKdFEwBfw9enHsj.SI7GnFUWs3zhdlM10JjokVJXd.UJTzO',NULL,'2022-11-10 03:17:03','2022-11-10 03:17:03'),(4,'myat','myat@gmail.com',NULL,'$2y$10$QisIhhyc5yWnbK4koExlI.cQxFvRuQ3/0EkLYvGBJov7ZL31D18Gm',NULL,'2022-11-10 03:18:08','2022-11-10 03:18:08'),(6,'kyi','kyi@gmail.com',NULL,'$2y$10$Wh10d8MOGAxsh/0WlmOvBuWW.5f73mD9O6ANYYfdVsztDm8exlVRC',NULL,'2022-11-10 03:22:21','2022-11-10 03:22:21'),(7,'Sybil Stone','gydunacyt@mailinator.com',NULL,'$2y$10$IHieJ6MCAyDvykSCt/jGa.iRni8CI1DodKpjkY4AgNsxzpYrL9lLG',NULL,'2022-11-10 22:39:03','2022-11-10 22:39:03'),(8,'William Fischer','kuqami@mailinator.com',NULL,'$2y$10$UHe1u86ONTdrphYLIadWiuvEEG4f4GVCN8Ro0/0EzQR2iMUcHIAvO',NULL,'2022-11-10 22:40:23','2022-11-10 22:40:23'),(9,'kaung','kaung@gmail.com',NULL,'$2y$10$wqrVJoN9WeGyJYjdV4U5wupk0tekddyWuzZCYtiVCgIIHXQ0nIi/G',NULL,'2022-11-11 02:14:02','2022-11-11 02:14:02'),(10,'Fatima Mcgowan','mijahaval@mailinator.com',NULL,'$2y$10$xaOw2YR0aAcKV32ZgYevQ.9VA1ipFZTwj9Q.xnkb3vS8vEbzetkNi',NULL,'2022-11-11 03:15:00','2022-11-11 03:15:00'),(11,'Odysseus Mcmahon','litajagyr@mailinator.com',NULL,'$2y$10$r/SrMO1mMU5IyFOG42K1fuYWbhwMbcxQwLYCeWOz3b4EDY5buXE.2',NULL,'2022-11-11 03:16:43','2022-11-11 03:16:43'),(12,'Isadora Holman','gedamuki@mailinator.com',NULL,'$2y$10$6wdS3OsZCt7LJDRbDIuKp.wBXCZ2dbgNVcUslbgJsDTb1fyzjOcSq',NULL,'2022-11-11 03:16:50','2022-11-11 03:16:50');
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

-- Dump completed on 2022-11-14 10:17:34
