-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for mahasiswa-api
CREATE DATABASE IF NOT EXISTS `mahasiswa-api` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `mahasiswa-api`;

-- Dumping structure for table mahasiswa-api.failed_jobs
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
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

-- Dumping data for table mahasiswa-api.failed_jobs: ~0 rows (approximately)

-- Dumping structure for table mahasiswa-api.jadwals
DROP TABLE IF EXISTS `jadwals`;
CREATE TABLE IF NOT EXISTS `jadwals` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nama_matakuliah` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal` date NOT NULL,
  `jam` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ruangan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table mahasiswa-api.jadwals: ~2 rows (approximately)
INSERT INTO `jadwals` (`id`, `nama_matakuliah`, `tanggal`, `jam`, `ruangan`, `created_at`, `updated_at`) VALUES
	(1, 'Matematika Distrik', '2025-01-15', '14:00 WITA', 'Ruangan 7D', '2025-01-15 05:10:54', '2025-01-15 05:14:01'),
	(3, 'Pemrograman Web II', '2025-01-16', '14:00 WITA', 'Ruangan 7D', '2025-01-15 05:42:55', '2025-01-15 05:43:02');

-- Dumping structure for table mahasiswa-api.mahasiswa
DROP TABLE IF EXISTS `mahasiswa`;
CREATE TABLE IF NOT EXISTS `mahasiswa` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `npm` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tempat_lahir` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `sex` enum('L','P') COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mahasiswas_npm_unique` (`npm`),
  UNIQUE KEY `mahasiswas_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table mahasiswa-api.mahasiswa: ~6 rows (approximately)
INSERT INTO `mahasiswa` (`id`, `npm`, `nama`, `tempat_lahir`, `tanggal_lahir`, `sex`, `alamat`, `telp`, `email`, `photo`, `created_at`, `updated_at`) VALUES
	(1, '211', 'Tester', '211', '2000-01-01', 'L', '211', '211', '211@gmail.com', NULL, '2024-12-18 06:38:42', '2025-01-08 06:06:50'),
	(2, '212', 'Randy Orton', '212', '2000-01-01', 'L', '212', '212', '212@gmail.com', NULL, '2025-01-07 23:01:55', '2025-01-08 06:02:01'),
	(3, '213', 'Jacob', '213', '2000-01-01', 'L', '213', '213', '213@gmail.com', NULL, '2025-01-07 23:02:14', '2025-01-07 23:02:14'),
	(6, '214', 'Freya', '214', '2000-01-01', 'P', '214', '214', '214@gmail.com', NULL, '2025-01-08 06:33:06', '2025-01-08 06:33:06'),
	(7, '215', 'Asep', '215', '2000-12-01', 'L', '215', '215', '215@gmail.com', NULL, '2025-01-15 06:05:44', '2025-01-15 06:05:44'),
	(8, '216', 'Aulia', '216', '2002-01-01', 'P', '216', '216', '216@gmail.com', NULL, '2025-01-15 06:41:24', '2025-01-15 06:41:24');

-- Dumping structure for table mahasiswa-api.mata_kuliahs
DROP TABLE IF EXISTS `mata_kuliahs`;
CREATE TABLE IF NOT EXISTS `mata_kuliahs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `kode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `matakuliah` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sks` int NOT NULL DEFAULT '0',
  `semester` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table mahasiswa-api.mata_kuliahs: ~5 rows (approximately)
INSERT INTO `mata_kuliahs` (`id`, `kode`, `matakuliah`, `sks`, `semester`, `created_at`, `updated_at`) VALUES
	(1, 'KM001', 'Pemrograman Visual', 3, 5, '2025-01-13 05:03:39', '2025-01-13 05:04:32'),
	(2, 'KM002', 'Statistika', 3, 3, '2025-01-13 05:21:09', '2025-01-13 05:30:12'),
	(3, 'KM003', 'Matematika Distrik', 2, 3, '2025-01-13 05:22:18', '2025-01-13 05:29:37'),
	(4, 'KM004', 'B.Indonesia', 2, 2, '2025-01-13 05:46:21', '2025-01-13 05:46:21'),
	(5, 'KM005', 'B.Arab', 2, 2, '2025-01-13 05:46:57', '2025-01-13 05:46:57');

-- Dumping structure for table mahasiswa-api.migrations
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table mahasiswa-api.migrations: ~7 rows (approximately)
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
	(3, '2019_08_19_000000_create_failed_jobs_table', 1),
	(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(5, '2024_12_18_124900_create_mahasiswas_table', 1),
	(6, '2025_01_13_114557_create_mata_kuliahs_table', 2),
	(7, '2025_01_15_115732_create_jadwals_table', 3);

-- Dumping structure for table mahasiswa-api.password_reset_tokens
DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table mahasiswa-api.password_reset_tokens: ~0 rows (approximately)

-- Dumping structure for table mahasiswa-api.personal_access_tokens
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
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

-- Dumping data for table mahasiswa-api.personal_access_tokens: ~0 rows (approximately)

-- Dumping structure for table mahasiswa-api.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table mahasiswa-api.users: ~0 rows (approximately)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
