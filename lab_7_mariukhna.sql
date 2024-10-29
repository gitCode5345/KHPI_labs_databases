-- Adminer 4.8.1 MySQL 11.5.2-MariaDB-ubu2404 dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_category` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

INSERT INTO `category` (`id`, `name_category`) VALUES
(1,	'Спорт'),
(2,	'Політика'),
(3,	'Технології'),
(4,	'Культура'),
(5,	'Здоров\'я');

DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `id_news` int(11) DEFAULT NULL,
  `id_category` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `comment` text NOT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `id_news` (`id_news`),
  KEY `id_category` (`id_category`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`id_news`) REFERENCES `news` (`id_news`),
  CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`id_category`) REFERENCES `category` (`id`),
  CONSTRAINT `comments_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

INSERT INTO `comments` (`id_news`, `id_category`, `comment`, `user_id`) VALUES
(1, 1, 'Чудова стаття!', 1),
(1, 1, 'Цікавий огляд, дякую!', 1),
(2, 2, 'Дуже актуально.', 2),
(3, 3, 'Цікаві прогнози на майбутнє.', 3),
(4, 4, 'Традиції варто зберігати.', 3);

DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `id_news` int(11) NOT NULL AUTO_INCREMENT,
  `id_category` int(11) DEFAULT NULL,
  `name_news` text NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id_news`),
  KEY `id_category` (`id_category`),
  CONSTRAINT `news_ibfk_1` FOREIGN KEY (`id_category`) REFERENCES `category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

INSERT INTO `news` (`id_news`, `id_category`, `name_news`, `description`) VALUES
(1,	1,	'Огляд останніх спортивних подій',	'Сьогодні в спорті відбулися захоплюючі події...'),
(2,	2,	'Вибори 2024: Все, що потрібно знати',	'У цьому матеріалі ми розглянемо основні моменти виборів...'),
(3,	3,	'Новітні технології: Що очікувати в 2024 році',	'Технології, які змінять наше життя в найближчі роки...'),
(4,	4,	'Традиції української культури',	'Культура України — це безмежний океан традицій...'),
(5,	5,	'Здоров\'я в цифрах: Як стежити за своїм станом',	'Поради щодо покращення здоров\'я та самопочуття...');

INSERT INTO `news` (`id_category`, `name_news`, `description`) VALUES
(5,	'Здоров\'я в цифрах: Як стежити за своїм станом (Ще одна частина)',	'Поради щодо покращення здоров\'я та самопочуття...');

DROP TABLE IF EXISTS `rating`;
CREATE TABLE `rating` (
  `rating_id` int(11) NOT NULL AUTO_INCREMENT,
  `id_news` int(11) NOT NULL,
  `ip_address` varchar(15) NOT NULL,
  `rating` tinyint(3) unsigned NOT NULL CHECK (`rating` between 1 and 5),
  PRIMARY KEY (`rating_id`),
  UNIQUE KEY `id_news` (`id_news`,`ip_address`),
  CONSTRAINT `rating_ibfk_1` FOREIGN KEY (`id_news`) REFERENCES `news` (`id_news`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

INSERT INTO `rating` (`rating_id`, `id_news`, `ip_address`, `rating`) VALUES
(1,	1,	'192.168.1.1',	5),
(2,	2,	'192.168.1.2',	4),
(3,	1,	'192.168.1.3',	3),
(4,	3,	'192.168.1.1',	5),
(5,	4,	'192.168.1.2',	2);

-- Помилка в запиті (1062): Duplicate entry '1-192.168.1.1' for key 'id_news'
INSERT INTO `rating` (`id_news`, `ip_address`, `rating`) VALUES
(1, '192.168.1.1', 3);

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(15) NOT NULL,
  `name_user` varchar(255) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `unique_ip` (`ip_address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

INSERT INTO `users` (`user_id`, `ip_address`, `name_user`) VALUES
(1,	'192.168.1.1',	'Користувач 1'),
(2,	'192.168.1.2',	'Користувач 2'),
(3,	'192.168.1.3',	'Користувач 3');

-- 2024-10-29 20:35:22
