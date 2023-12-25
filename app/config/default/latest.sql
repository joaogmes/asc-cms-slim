-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           8.0.35-0ubuntu0.22.04.1 - (Ubuntu)
-- OS do Servidor:               Linux
-- HeidiSQL Versão:              12.5.0.6677
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para AscendingCms
DROP DATABASE IF EXISTS `AscendingCms`;
CREATE DATABASE IF NOT EXISTS `AscendingCms` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `AscendingCms`;

-- Copiando estrutura para tabela AscendingCms.component
DROP TABLE IF EXISTS `component`;
CREATE TABLE IF NOT EXISTS `component` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `config` text COLLATE utf8mb4_general_ci,
  `status` enum('active','inactive') COLLATE utf8mb4_general_ci NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela AscendingCms.component: ~2 rows (aproximadamente)
DELETE FROM `component`;
INSERT INTO `component` (`id`, `name`, `path`, `config`, `status`, `created`, `updated`) VALUES
	(1, 'Hero', 'hero', '', 'active', '2023-10-27 18:32:12', NULL),
	(2, 'Sobre', 'about-us', NULL, 'active', '2023-10-28 00:44:38', NULL),
	(3, 'Serviços', 'services', NULL, 'active', '2023-10-28 15:28:25', NULL);

-- Copiando estrutura para tabela AscendingCms.page
DROP TABLE IF EXISTS `page`;
CREATE TABLE IF NOT EXISTS `page` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_general_ci NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT NULL,
  `userId` int NOT NULL,
  `seoId` int DEFAULT NULL,
  `seoType` enum('global','page','both') COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `userId` (`userId`),
  KEY `seoId` (`seoId`),
  CONSTRAINT `page_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `page_ibfk_2` FOREIGN KEY (`seoId`) REFERENCES `seo` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela AscendingCms.page: ~0 rows (aproximadamente)
DELETE FROM `page`;
INSERT INTO `page` (`id`, `name`, `slug`, `status`, `created`, `updated`, `userId`, `seoId`, `seoType`) VALUES
	(1, 'index', '', 'active', '2023-10-27 18:32:12', NULL, 1, 1, 'page');

-- Copiando estrutura para tabela AscendingCms.pagecomponent
DROP TABLE IF EXISTS `pagecomponent`;
CREATE TABLE IF NOT EXISTS `pagecomponent` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pageId` int NOT NULL,
  `componentId` int NOT NULL,
  `data` text COLLATE utf8mb4_general_ci,
  `order` int DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pageId` (`pageId`),
  KEY `componentId` (`componentId`),
  CONSTRAINT `pagecomponent_ibfk_1` FOREIGN KEY (`pageId`) REFERENCES `page` (`id`) ON DELETE CASCADE,
  CONSTRAINT `pagecomponent_ibfk_2` FOREIGN KEY (`componentId`) REFERENCES `component` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela AscendingCms.pagecomponent: ~15 rows (aproximadamente)
DELETE FROM `pagecomponent`;
INSERT INTO `pagecomponent` (`id`, `pageId`, `componentId`, `data`, `order`, `created`, `updated`) VALUES
	(2, 1, 1, '{"ctaTitle":"Empréstimo para Todos. Liberação Rápida e Sem Complicação! Fale com um consultor","ctaImage":"https://facillitasf.com.br/wp-content/uploads/2023/10/138917-mobile-using-girl-black-phone_600x600-1.png","cards":{"0":{"cardIcon":"fa-regular fa-lightbulb","cardTitle":"Empr&eacute;stimo na Conta de Luz","cardText":"","cardButtonText":"Solicitar agora!","cardButtonLink":"#"},"1":{"cardIcon":"123","cardTitle":"123","cardText":"","cardButtonText":"123","cardButtonLink":"123"}}}', 0, '2023-10-27 18:37:19', NULL),
	(3, 1, 2, '{\r\n  "title": "Sobre a Facillita",\r\n  "subtitle": "Há mais de quatro anos fornecendo soluções financeiras facilitadas!",\r\n  "text": "Buscando atender as necessidades do mercado. Facillita vem com uma proposta de inovação na maneira de ofertar creditos. Atraves de um atendimento consultivo e entendendo a real necessidade de quem nos procura. As suas soluções financeiras estão aqui!",\r\n  "image": "https://facillitasf.com.br/wp-content/uploads/2022/05/Original-1024x1024.png",\r\n  "badges": {\r\n    "0": {\r\n      "icon": "fas fa-money-bill-wave",\r\n      "title": "+7 milhões em empréstimos liberados"\r\n    },\r\n    "1": {\r\n      "icon": "fas fa-money-bill-wave",\r\n      "title": "+7 milhões em empréstimos liberados"\r\n    },\r\n    "2": {\r\n      "icon": "fas fa-money-bill-wave",\r\n      "title": "+7 milhões em empréstimos liberados"\r\n    },\r\n    "3": {\r\n      "icon": "fas fa-money-bill-wave",\r\n      "title": "+7 milhões em empréstimos liberados"\r\n    }\r\n  }\r\n}\r\n', 14, '2023-10-28 00:44:48', NULL),
	(4, 1, 3, '{\r\n  "sectionTitle": "Soluções Financeiras",\r\n  "cards": {\r\n    "0": {\r\n      "cardIcon": "fa-regular fa-lightbulb",\r\n      "cardTitle": "Empréstimo na Conta de Luz",\r\n      "cardText": "Liberado para negativado, sem comprovar renda e pago junto com sua conta de energia.",\r\n      "cardButtonText": "Solicitar agora!",\r\n      "cardButtonLink": "#"\r\n    },\r\n    "1": {\r\n      "cardIcon": "fa-regular fa-lightbulb",\r\n      "cardTitle": "Empréstimo na Conta de Luz",\r\n      "cardText": "Liberado para negativado, sem comprovar renda e pago junto com sua conta de energia.",\r\n      "cardButtonText": "Solicitar agora!",\r\n      "cardButtonLink": "#"\r\n    },\r\n    "2": {\r\n      "cardIcon": "fa-regular fa-lightbulb",\r\n      "cardTitle": "Empréstimo na Conta de Luz",\r\n      "cardText": "Liberado para negativado, sem comprovar renda e pago junto com sua conta de energia.",\r\n      "cardButtonText": "Solicitar agora!",\r\n      "cardButtonLink": "#"\r\n    },\r\n    "3": {\r\n      "cardIcon": "fa-regular fa-lightbulb",\r\n      "cardTitle": "Empréstimo na Conta de Luz",\r\n      "cardText": "Liberado para negativado, sem comprovar renda e pago junto com sua conta de energia.",\r\n      "cardButtonText": "Solicitar agora!",\r\n      "cardButtonLink": "#"\r\n    }\r\n  }\r\n}\r\n', 15, '2023-10-28 15:28:35', NULL),
	(5, 1, 3, NULL, 1, '2023-12-16 19:01:34', NULL),
	(6, 1, 1, NULL, 3, '2023-12-16 19:02:21', NULL),
	(7, 1, 2, NULL, 4, '2023-12-16 19:10:09', NULL),
	(8, 1, 2, NULL, 5, '2023-12-16 19:10:09', NULL),
	(9, 1, 2, NULL, 6, '2023-12-16 19:10:09', NULL),
	(10, 1, 2, NULL, 7, '2023-12-16 19:10:09', NULL),
	(11, 1, 2, NULL, 8, '2023-12-16 19:10:09', NULL),
	(12, 1, 2, NULL, 9, '2023-12-16 19:10:09', NULL),
	(13, 1, 3, NULL, 10, '2023-12-16 19:10:43', NULL),
	(14, 1, 1, NULL, 11, '2023-12-16 19:10:47', NULL),
	(15, 1, 2, NULL, 12, '2023-12-16 19:10:56', NULL),
	(16, 1, 1, NULL, 13, '2023-12-16 19:12:00', NULL),
	(17, 1, 1, NULL, 2, '2023-12-25 14:19:48', NULL);

-- Copiando estrutura para tabela AscendingCms.seo
DROP TABLE IF EXISTS `seo`;
CREATE TABLE IF NOT EXISTS `seo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `metaTitle` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `metaDescription` text COLLATE utf8mb4_general_ci,
  `keywords` text COLLATE utf8mb4_general_ci,
  `type` enum('global','page') COLLATE utf8mb4_general_ci NOT NULL,
  `headerSnippet` text COLLATE utf8mb4_general_ci,
  `bodySnippet` text COLLATE utf8mb4_general_ci,
  `status` enum('active','inactive') COLLATE utf8mb4_general_ci NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela AscendingCms.seo: ~0 rows (aproximadamente)
DELETE FROM `seo`;
INSERT INTO `seo` (`id`, `name`, `metaTitle`, `metaDescription`, `keywords`, `type`, `headerSnippet`, `bodySnippet`, `status`, `created`, `updated`) VALUES
	(1, 'Nome do SEO', 'Meta Title', 'Meta Description', 'Keywords', 'page', 'Header Snippet', 'Body Snippet', 'active', '2023-10-27 18:32:12', NULL);

-- Copiando estrutura para tabela AscendingCms.user
DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `login` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_general_ci NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela AscendingCms.user: ~0 rows (aproximadamente)
DELETE FROM `user`;
INSERT INTO `user` (`id`, `name`, `email`, `login`, `password`, `status`, `created`, `updated`) VALUES
	(1, 'Nome do Usuário', 'email@example.com', 'login_usuario', 'senha_usuario', 'active', '2023-10-27 18:32:12', NULL);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
