-- Adminer 4.8.1 MySQL 11.5.2-MariaDB-ubu2404 dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

INSERT INTO `category` (`id`, `name`) VALUES
(1,	'Спорт'),
(2,	'Політика'),
(3,	'Технології'),
(4,	'Культура'),
(5,	'Здоров\'я');

DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `news_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `news_id` (`news_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`news_id`) REFERENCES `news` (`id`),
  CONSTRAINT `comments_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

INSERT INTO `comments` (`id`, `news_id`, `comment`, `user_id`) VALUES
(1, 1, 'Чудова стаття!', 1),
(2, 1, 'Цікавий огляд, дякую!', 1),
(3, 2, 'Дуже актуально.', 2),
(4, 3, 'Цікаві прогнози на майбутнє.', 3),
(5, 4, 'Традиції варто зберігати.', 3);

DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `news_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

INSERT INTO `news` (`id`, `category_id`, `name`, `description`) VALUES
(1,	1,	'Огляд останніх спортивних подій',	'Сьогодні в спорті відбулися захоплюючі події...'),
(2,	2,	'Вибори 2024: Все, що потрібно знати',	'У цьому матеріалі ми розглянемо основні моменти виборів...'),
(3,	3,	'Новітні технології: Що очікувати в 2024 році',	'Технології, які змінять наше життя в найближчі роки...'),
(4,	4,	'Традиції української культури',	'Культура України — це безмежний океан традицій...'),
(5,	5,	'Здоров\'я в цифрах: Як стежити за своїм станом',	'Поради щодо покращення здоров\'я та самопочуття...');

INSERT INTO `news` (`category_id`, `name`, `description`) VALUES
(5,	'Здоров\'я в цифрах: Як стежити за своїм станом (Ще одна частина)',	'Поради щодо покращення здоров\'я та самопочуття...');

DROP TABLE IF EXISTS `rating`;
CREATE TABLE `rating` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `news_id` int(11) NOT NULL,
  `ip_address` varchar(15) NOT NULL,
  `rating` tinyint(3) unsigned NOT NULL CHECK (`rating` between 1 and 5),
  PRIMARY KEY (`id`),
  UNIQUE KEY `news_ip_unique` (`news_id`, `ip_address`),
  CONSTRAINT `rating_ibfk_1` FOREIGN KEY (`news_id`) REFERENCES `news` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

INSERT INTO `rating` (`id`, `news_id`, `ip_address`, `rating`) VALUES
(1,	1,  '192.168.1.1',	5),
(2,	2,  '192.168.1.2',	4),
(3,	1,  '192.168.1.3',	3),
(4,	3,	'192.168.1.1',	5),
(5,	4,	'192.168.1.2',	2);

-- Помилка в запиті (1062): Duplicate entry '1-192.168.1.1' for key 'news_id'
INSERT INTO `rating` (`news_id`, `ip_address`, `rating`) VALUES
(1, '192.168.1.1', 3);

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(15) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

INSERT INTO `users` (`id`, `ip_address`, `name`) VALUES
(1,	'192.168.1.1',	'Користувач 1'),
(2,	'192.168.1.2',	'Користувач 2'),
(3,	'192.168.1.3',	'Користувач 3');

-- 2024-10-29 20:35:22
