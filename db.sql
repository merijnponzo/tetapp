-- -------------------------------------------------------------
-- TablePlus 5.9.8(548)
--
-- https://tableplus.com/
--
-- Database: tetappusr
-- Generation Time: 2024-05-13 16:09:13.0460
-- -------------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


CREATE TABLE `cards` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` bigint unsigned DEFAULT NULL,
  `subcards` json NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `site_id` bigint unsigned DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `handle` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lock` tinyint(1) NOT NULL DEFAULT '0',
  `parent_id` bigint unsigned DEFAULT NULL,
  `visibility` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `categories_parent_id_foreign` (`parent_id`),
  CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

CREATE TABLE `sites` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sites_user_id_foreign` (`user_id`),
  CONSTRAINT `sites_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `cards` (`id`, `created_at`, `updated_at`, `name`, `description`, `category_id`, `subcards`) VALUES
(1, '2024-03-18 09:12:11', '2024-03-18 09:12:11', 'Test', NULL, 5, NULL),
(3, '2024-04-28 15:30:33', '2024-04-28 15:30:33', 'Hamburger', NULL, 15, NULL),
(4, '2024-04-29 12:07:13', '2024-05-01 20:14:02', 'Geert', NULL, 30, NULL),
(5, '2024-04-29 13:16:40', '2024-05-03 19:22:08', 'Koffie', NULL, 41, NULL),
(6, '2024-04-29 15:04:21', '2024-04-29 15:04:21', 'Mirjam', NULL, 28, NULL),
(7, '2024-04-29 15:04:57', '2024-04-29 15:04:57', 'Orbo Jan', NULL, 28, NULL),
(8, '2024-04-29 15:05:13', '2024-04-29 15:05:13', 'Jojan', NULL, 28, NULL),
(9, '2024-04-29 15:05:33', '2024-04-29 15:05:33', 'Peter', NULL, 28, NULL),
(10, '2024-04-29 15:05:47', '2024-04-29 15:05:47', 'Daan', NULL, 28, NULL),
(11, '2024-04-29 15:06:10', '2024-04-29 15:06:10', 'Serge', NULL, 28, NULL),
(12, '2024-04-29 15:07:43', '2024-04-29 15:10:28', 'Sarah', NULL, 28, NULL),
(13, '2024-04-29 15:08:22', '2024-04-29 15:08:22', 'Orbo jr', NULL, 28, NULL),
(14, '2024-04-29 15:08:40', '2024-04-29 15:08:40', 'Elisa', NULL, 28, NULL),
(15, '2024-04-29 15:09:05', '2024-04-29 15:09:05', 'Sterre', NULL, 28, NULL),
(16, '2024-04-29 15:09:18', '2024-04-29 15:09:18', 'Jonas', NULL, 28, NULL),
(17, '2024-04-29 19:18:41', '2024-05-03 18:43:35', 'Visboer', NULL, 48, NULL),
(18, '2024-04-29 19:23:56', '2024-05-03 18:43:50', 'Bloemist', NULL, 48, NULL),
(19, '2024-04-29 19:38:55', '2024-05-01 19:40:13', 'Bep', NULL, 29, NULL),
(20, '2024-04-29 19:41:57', '2024-05-01 19:40:30', 'Ellie', NULL, 29, NULL),
(21, '2024-04-29 19:42:47', '2024-05-01 19:41:15', 'Gert', NULL, 29, NULL),
(22, '2024-04-30 15:58:43', '2024-05-03 18:55:19', 'Washok', NULL, 33, NULL),
(23, '2024-05-01 18:51:20', '2024-05-01 18:51:20', 'Kamer', NULL, 33, NULL),
(24, '2024-05-01 18:51:38', '2024-05-01 18:51:38', 'Keuken', NULL, 33, NULL),
(25, '2024-05-01 18:51:55', '2024-05-01 18:51:55', 'Douch', NULL, 33, NULL),
(26, '2024-05-01 18:52:12', '2024-05-01 18:52:12', 'Slaapkamer', NULL, 33, NULL),
(27, '2024-05-01 18:52:28', '2024-05-01 18:52:28', 'Washok', NULL, 33, NULL),
(28, '2024-05-01 19:42:37', '2024-05-01 19:42:37', 'Henk', NULL, 29, NULL),
(29, '2024-05-01 19:42:55', '2024-05-01 19:42:55', 'Maria', NULL, 29, NULL),
(30, '2024-05-01 19:43:09', '2024-05-01 19:43:09', 'Joke', NULL, 29, NULL),
(31, '2024-05-01 20:09:56', '2024-05-01 20:09:56', 'Vincent', NULL, 29, NULL),
(32, '2024-05-01 20:10:06', '2024-05-01 20:10:06', 'Hidde', NULL, 29, NULL),
(33, '2024-05-01 20:10:23', '2024-05-01 20:10:23', 'Gee', NULL, 29, NULL),
(34, '2024-05-01 20:10:37', '2024-05-01 20:10:37', 'Jolique', NULL, 29, NULL),
(35, '2024-05-01 20:10:47', '2024-05-01 20:11:27', 'Helinde', NULL, 29, NULL),
(36, '2024-05-01 20:11:00', '2024-05-01 20:11:00', 'Jorien', NULL, 29, NULL),
(37, '2024-05-01 20:14:20', '2024-05-01 20:15:02', 'Jeanette', NULL, 30, NULL),
(38, '2024-05-01 20:14:30', '2024-05-01 20:16:36', 'Sonja', NULL, 30, NULL),
(39, '2024-05-01 20:14:47', '2024-05-01 20:16:09', 'Engelien', NULL, 30, NULL),
(40, '2024-05-01 20:15:17', '2024-05-01 20:15:17', 'Coby', NULL, 30, NULL),
(41, '2024-05-01 20:17:03', '2024-05-01 20:17:03', 'Ria', NULL, 30, NULL),
(42, '2024-05-01 20:18:20', '2024-05-01 20:26:24', 'Machteld', NULL, 30, NULL),
(43, '2024-05-01 20:18:32', '2024-05-01 20:18:32', 'Ireen', NULL, 30, NULL),
(44, '2024-05-01 20:18:51', '2024-05-01 20:27:34', 'Nies', NULL, 30, NULL),
(45, '2024-05-01 20:19:33', '2024-05-01 20:19:33', 'Titia', NULL, 30, NULL),
(46, '2024-05-01 20:19:49', '2024-05-01 20:19:49', 'Joke zeist', NULL, 30, NULL),
(47, '2024-05-01 20:20:18', '2024-05-01 20:21:00', 'Maria Smit', NULL, 30, NULL),
(48, '2024-05-01 20:22:07', '2024-05-01 20:22:07', 'Karla', NULL, 31, NULL),
(49, '2024-05-01 20:22:25', '2024-05-01 20:23:02', 'Marjan en Martin', NULL, 31, NULL),
(50, '2024-05-01 20:23:42', '2024-05-01 20:23:42', 'Gilda', NULL, 30, NULL),
(51, '2024-05-01 20:24:08', '2024-05-01 20:24:08', 'Hennie Groen', NULL, 30, NULL),
(52, '2024-05-01 20:26:45', '2024-05-01 20:26:45', 'Adri', NULL, 30, NULL),
(53, '2024-05-01 20:29:40', '2024-05-01 20:29:40', 'Marianne Smith', NULL, 30, NULL),
(54, '2024-05-03 18:39:44', '2024-05-03 18:39:44', 'Huisarts', NULL, 32, NULL),
(55, '2024-05-03 18:40:13', '2024-05-03 18:40:13', 'Tandarts', NULL, 32, NULL),
(56, '2024-05-03 18:40:26', '2024-05-03 18:40:26', 'Careyn', NULL, 32, NULL),
(57, '2024-05-03 18:40:53', '2024-05-03 18:40:53', 'UMC', NULL, 32, NULL),
(58, '2024-05-03 18:41:24', '2024-05-03 18:41:24', 'Antonius', NULL, 32, NULL),
(59, '2024-05-03 18:41:42', '2024-05-03 18:41:42', 'Fysio', NULL, 32, NULL),
(60, '2024-05-03 18:42:02', '2024-05-03 18:42:02', 'Apotheek', NULL, 32, NULL),
(61, '2024-05-03 18:43:07', '2024-05-03 18:43:07', 'Bakker', NULL, 48, NULL),
(62, '2024-05-03 18:44:15', '2024-05-03 18:44:15', 'Boni plus', NULL, 48, NULL),
(63, '2024-05-03 18:45:15', '2024-05-03 18:45:15', 'Hout bij ons in Harmelen', NULL, 48, NULL),
(64, '2024-05-03 18:45:44', '2024-05-03 18:45:44', 'Bank geld halen', NULL, 48, NULL),
(65, '2024-05-03 18:46:12', '2024-05-03 18:46:12', 'Specsavers', NULL, 48, NULL),
(66, '2024-05-03 18:46:31', '2024-05-03 18:46:31', 'Vallen', NULL, 48, NULL),
(67, '2024-05-03 18:50:20', '2024-05-03 18:50:20', 'Primera', NULL, 48, NULL),
(68, '2024-05-03 18:52:04', '2024-05-03 18:52:04', 'Step', NULL, 38, NULL),
(69, '2024-05-03 18:52:52', '2024-05-03 18:52:52', 'Xxxx', NULL, 38, NULL),
(70, '2024-05-08 15:45:35', '2024-05-08 15:45:35', 'Parasol', NULL, 34, NULL),
(71, '2024-05-08 15:48:10', '2024-05-08 15:48:10', 'Bloemen', NULL, 35, NULL),
(72, '2024-05-08 15:48:59', '2024-05-08 15:48:59', 'Vis', NULL, 35, NULL);

INSERT INTO `categories` (`id`, `created_at`, `updated_at`, `name`, `site_id`, `type`, `handle`, `lock`, `parent_id`, `visibility`) VALUES
(1, '2024-03-18 09:12:03', '2024-04-28 15:29:50', 'Relaties', 1, 'relaties', 'primary', 1, NULL, '1'),
(2, '2024-03-18 09:12:03', '2024-04-28 15:30:12', 'Spullen', 1, 'spullen', 'primary', 1, NULL, '0'),
(3, '2024-03-18 09:12:03', '2024-03-18 09:12:03', 'Handelingen', 1, 'handelingen', 'primary', 1, NULL, '1'),
(4, '2024-03-18 09:12:03', '2024-03-18 09:12:03', 'Locaties', 1, 'locaties', 'primary', 1, NULL, '1'),
(5, '2024-03-18 09:12:03', '2024-03-18 09:12:03', 'Familie', 1, 'familie', 'secondary', 0, 1, '1'),
(6, '2024-03-18 09:12:03', '2024-03-18 09:12:03', 'Vrienden', 1, 'vrienden', 'secondary', 0, 1, '1'),
(7, '2024-03-18 09:12:03', '2024-03-18 09:12:03', 'Collega\'s', 1, 'collega\'s', 'secondary', 0, 1, '1'),
(8, '2024-03-18 09:12:03', '2024-03-18 09:12:03', 'Buren', 1, 'buren', 'secondary', 0, 1, '1'),
(9, '2024-03-18 09:12:03', '2024-03-18 09:12:03', 'Huisdieren', 1, 'huisdieren', 'secondary', 0, 1, '1'),
(10, '2024-03-18 09:12:03', '2024-03-18 09:12:03', 'Telefoon', 1, 'telefoon', 'secondary', 0, 2, '1'),
(11, '2024-03-18 09:12:03', '2024-03-18 09:12:03', 'Kleding', 1, 'kleding', 'secondary', 0, 2, '1'),
(12, '2024-03-18 09:12:03', '2024-03-18 09:12:03', 'Bank', 1, 'bank', 'secondary', 0, 2, '1'),
(13, '2024-03-18 09:12:03', '2024-03-18 09:12:03', 'Stoel', 1, 'stoel', 'secondary', 0, 2, '1'),
(14, '2024-03-18 09:12:03', '2024-03-18 09:12:03', 'Gereedschap', 1, 'gereedschap', 'secondary', 0, 2, '1'),
(15, '2024-03-18 09:12:03', '2024-03-18 09:12:03', 'Eten', 1, 'eten', 'secondary', 0, 3, '1'),
(16, '2024-03-18 09:12:03', '2024-03-18 09:12:03', 'Drinken', 1, 'drinken', 'secondary', 0, 3, '1'),
(17, '2024-03-18 09:12:03', '2024-03-18 09:12:03', 'Slapen', 1, 'slapen', 'secondary', 0, 3, '1'),
(18, '2024-03-18 09:12:03', '2024-03-18 09:12:03', 'Werken', 1, 'werken', 'secondary', 0, 3, '1'),
(19, '2024-03-18 09:12:03', '2024-03-18 09:12:03', 'Aankleden', 1, 'aankleden', 'secondary', 0, 3, '1'),
(20, '2024-03-18 09:12:03', '2024-03-18 09:12:03', 'Thuis', 1, 'thuis', 'secondary', 0, 4, '1'),
(21, '2024-03-18 09:12:03', '2024-03-18 09:12:03', 'Werk', 1, 'werk', 'secondary', 0, 4, '1'),
(22, '2024-03-18 09:12:03', '2024-03-18 09:12:03', 'Vakantie', 1, 'vakantie', 'secondary', 0, 4, '1'),
(23, '2024-03-18 09:12:03', '2024-03-18 09:12:03', 'Onderweg', 1, 'onderweg', 'secondary', 0, 4, '1'),
(24, '2024-03-18 09:58:14', '2024-05-04 07:45:21', 'BELLEN', 2, 'relaties', 'primary', 1, NULL, '1'),
(25, '2024-03-18 09:58:14', '2024-04-29 12:30:59', 'IETS DOEN', 2, 'spullen', 'primary', 1, NULL, '1'),
(26, '2024-03-18 09:58:14', '2024-04-29 12:15:04', 'IETS HALEN', 2, 'handelingen', 'primary', 1, NULL, '1'),
(27, '2024-03-18 09:58:14', '2024-04-29 13:11:51', 'Reserve', 2, 'locaties', 'primary', 1, NULL, '0'),
(28, '2024-03-18 09:58:14', '2024-04-29 15:15:25', 'KINDEREN', 2, 'familie', 'secondary', 0, 24, '1'),
(29, '2024-03-18 09:58:14', '2024-04-30 10:14:14', 'Familie', 2, 'vrienden', 'secondary', 0, 24, '1'),
(30, '2024-03-18 09:58:14', '2024-04-30 10:15:25', 'Vrienden', 2, 'collega\'s', 'secondary', 0, 24, '1'),
(31, '2024-03-18 09:58:14', '2024-03-18 09:58:14', 'Buren', 2, 'buren', 'secondary', 0, 24, '1'),
(32, '2024-03-18 09:58:14', '2024-04-29 12:44:03', 'Medisch', 2, 'huisdieren', 'secondary', 0, 24, '1'),
(33, '2024-03-18 09:58:14', '2024-04-30 16:02:37', 'In huis', 2, 'telefoon', 'secondary', 0, 25, '1'),
(34, '2024-03-18 09:58:14', '2024-04-30 16:02:59', 'In de Tuin', 2, 'kleding', 'secondary', 0, 25, '1'),
(35, '2024-03-18 09:58:14', '2024-04-30 16:03:51', 'In Harmelen', 2, 'bank', 'secondary', 0, 25, '1'),
(36, '2024-03-18 09:58:14', '2024-04-30 16:04:25', 'Bij Mirjam', 2, 'stoel', 'secondary', 0, 25, '1'),
(37, '2024-03-18 09:58:14', '2024-04-30 16:05:12', 'In Woerden', 2, 'gereedschap', 'secondary', 0, 25, '1'),
(38, '2024-03-18 09:58:14', '2024-05-03 19:18:39', 'IPAD', 2, 'eten', 'secondary', 0, 26, '1'),
(39, '2024-03-18 09:58:14', '2024-05-03 19:20:06', 'Zakdoek', 2, 'drinken', 'secondary', 0, 26, '1'),
(40, '2024-03-18 09:58:14', '2024-05-03 19:21:05', 'Avond eten', 2, 'slapen', 'secondary', 0, 26, '1'),
(41, '2024-03-18 09:58:14', '2024-05-03 19:23:05', 'Afstands bediening TV', 2, 'werken', 'secondary', 0, 26, '1'),
(42, '2024-03-18 09:58:14', '2024-05-03 19:23:45', 'Koffie', 2, 'aankleden', 'secondary', 0, 26, '1'),
(43, '2024-03-18 09:58:14', '2024-03-18 09:58:14', 'Thuis', 2, 'thuis', 'secondary', 0, 27, '1'),
(44, '2024-03-18 09:58:14', '2024-03-18 09:58:14', 'Werk', 2, 'werk', 'secondary', 0, 27, '1'),
(45, '2024-03-18 09:58:14', '2024-03-18 09:58:14', 'Vakantie', 2, 'vakantie', 'secondary', 0, 27, '1'),
(46, '2024-03-18 09:58:14', '2024-03-18 09:58:14', 'Onderweg', 2, 'onderweg', 'secondary', 0, 27, '1'),
(47, '2024-04-29 12:09:47', '2024-04-29 12:09:47', 'Winkels', 2, 'winkels', 'secondary', 0, 30, '1'),
(48, '2024-04-29 15:17:51', '2024-04-30 10:26:04', 'Winkels', 2, 'familie', 'secondary', 0, 24, '1'),
(49, '2024-04-29 19:27:10', '2024-04-29 19:27:10', 'Familie', 2, 'familie', 'secondary', 0, 48, '1'),
(50, '2024-04-29 19:38:11', '2024-04-30 10:26:29', 'Reserve', 2, 'familie', 'secondary', 0, 24, '1'),
(51, '2024-05-03 18:56:45', '2024-05-03 18:56:45', 'Xxx', 2, 'xxx', 'secondary', 0, 25, '1'),
(52, '2024-05-03 19:25:16', '2024-05-03 19:25:16', 'Rollator', 2, 'rollator', 'secondary', 0, 26, '1'),
(53, '2024-05-03 19:25:34', '2024-05-03 19:25:34', 'Alarm', 2, 'alarm', 'secondary', 0, 26, '1'),
(54, '2024-05-03 19:25:51', '2024-05-03 19:25:51', 'Was uit droger', 2, 'was uit droger', 'secondary', 0, 26, '1'),
(55, '2024-05-03 19:26:10', '2024-05-03 19:26:10', 'Was uit douche', 2, 'was uit douche', 'secondary', 0, 26, '1'),
(56, '2024-05-03 19:28:45', '2024-05-03 19:28:45', 'Bbbbb', 2, 'bbbbb', 'secondary', 0, 25, '1'),
(57, '2024-05-03 19:29:04', '2024-05-03 19:29:04', 'Ddddd', 2, 'ddddd', 'secondary', 0, 25, '1'),
(58, '2024-05-03 19:29:19', '2024-05-03 19:29:19', 'Bbbbbb', 2, 'bbbbbb', 'secondary', 0, 25, '1'),
(59, '2024-05-03 19:30:19', '2024-05-03 19:30:19', 'Mmmmm', 2, 'mmmmm', 'primary', 0, NULL, '1');

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_12_26_142231_create_sites_table', 1),
(6, '2023_12_26_142232_create_categories_table', 1),
(7, '2023_12_26_150715_add_column_to_table', 1),
(8, '2024_12_26_142232_create_cards', 1),
(9, '2024_12_26_150715_add_column_handle', 1),
(10, '2024_12_26_150715_add_column_lock_bool', 1),
(11, '2024_12_26_150715_add_column_to_categories', 1),
(12, '2024_12_28_150715_add_column_setup', 1),
(13, '2024_04_01_134849_toggle_visibility', 2),
(14, '2024_12_31_150715_add_column_json', 3);

INSERT INTO `sites` (`id`, `user_id`, `name`, `created_at`, `updated_at`, `created`) VALUES
(1, 1, 'tetapp', '2024-03-18 09:12:03', '2024-03-18 09:12:03', 1),
(2, 2, 'tet', '2024-03-18 09:58:14', '2024-03-18 09:58:14', 1);

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Merijn', 'merijn@ponzo.nl', NULL, '$2y$12$IgLxp7.e.hoh/Jqdt3mAlOvTyhBpzaS2DtAjrrZIpvb24l89zybHK', 'Lm566wvjG0PBvj5IFZqPWili9hsFsZjlMljquAgEn1shkKxW2iTcRSIHVZyP', '2024-03-18 09:11:57', '2024-03-18 09:17:22'),
(2, 'orbo', 'j.dverschuur@freeler.nl', NULL, '$2y$12$gGEd7QFw.tacftvD5EG0t.nmteIJglIr3ZfBs2JPwKSF7ryFVRJ8a', 'L8lNcMYZV6nDpLHoq4JDwyU1YC4vJEZfoxpNxtgPpkCigvbxKYQePz4yiX0d', '2024-03-18 09:58:11', '2024-03-18 09:58:11');



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;