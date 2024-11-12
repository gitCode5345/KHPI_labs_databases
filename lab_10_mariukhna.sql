-- Adminer 4.8.1 MySQL 11.5.2-MariaDB-ubu2404 dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `cities`;
CREATE TABLE `cities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `country_id` (`country_id`),
  CONSTRAINT `cities_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

INSERT INTO `cities` (`id`, `country_id`, `name`) VALUES
(1,	1,	'Харків');

DROP TABLE IF EXISTS `country`;
CREATE TABLE `country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

INSERT INTO `country` (`id`, `name`) VALUES
(1,	'Україна');

DROP TABLE IF EXISTS `lines`;
CREATE TABLE `lines` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subway_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `subway_id` (`subway_id`),
  CONSTRAINT `lines_ibfk_1` FOREIGN KEY (`subway_id`) REFERENCES `subways` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

INSERT INTO `lines` (`id`, `subway_id`, `name`, `color`) VALUES
(1,	1,	'Червона лінія',	'Червоний'),
(2,	1,	'Синя лінія',	'Синій'),
(3,	1,	'Зелена лінія',	'Зелений');

DROP TABLE IF EXISTS `stations`;
CREATE TABLE `stations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `line_id` int(11) NOT NULL,
  `subway_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `position` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `line_id` (`line_id`),
  KEY `subway_id` (`subway_id`),
  CONSTRAINT `stations_ibfk_1` FOREIGN KEY (`line_id`) REFERENCES `lines` (`id`),
  CONSTRAINT `stations_ibfk_2` FOREIGN KEY (`subway_id`) REFERENCES `subways` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

INSERT INTO `stations` (`id`, `line_id`, `subway_id`, `name`, `position`) VALUES
(1,	1,	1,	'Холодна гора',	1),
(2,	1,	1,	'Південний вокзал',	2),
(3,	1,	1,	'Центральний ринок',	3),
(4,	1,	1,	'Майдан Конституції',	4),
(5,	1,	1,	'Проспект Гагаріна',	5),
(6,	1,	1,	'Спортивна',	6),
(7,	1,	1,	'Завод імені Малишева',	7),
(8,	1,	1,	'Турбоатом',	8),
(9,	1,	1,	'Палац Спорту',	9),
(10,	1,	1,	'Армійська',	10),
(11,	1,	1,	'ім. О. С. Масельського',	11),
(12,	1,	1,	'Тракторний завод',	12),
(13,	1,	1,	'Індустріальна',	13),
(14,	2,	1,	'Історичний музей',	1),
(15,	2,	1,	'Університет',	2),
(16,	2,	1,	'Ярослава Мудрого',	3),
(17,	2,	1,	'Київська',	4),
(18,	2,	1,	'Акадаміка Барабашова',	5),
(19,	2,	1,	'Академіка Павлова',	6),
(20,	2,	1,	'Студентська',	7),
(21,	2,	1,	'Героїв Праці',	8),
(22,	3,	1,	'Метробудівників',	1),
(23,	3,	1,	'Захисників України',	2),
(24,	3,	1,	'Арітектора Бекетова',	3),
(25,	3,	1,	'Держпром',	4),
(26,	3,	1,	'Наукова',	5),
(27,	3,	1,	'Ботанічний сад',	6),
(28,	3,	1,	'23 Серпня',	7),
(29,	3,	1,	'Олексіївка',	8),
(30,	3,	1,	'Перемога',	9);

DROP TABLE IF EXISTS `subways`;
CREATE TABLE `subways` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `city_id` int(11) NOT NULL,
  `count_lines` int(11) NOT NULL,
  `number_stations` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `city_id` (`city_id`),
  CONSTRAINT `subways_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

INSERT INTO `subways` (`id`, `name`, `city_id`, `count_lines`, `number_stations`) VALUES
(1,	'Харківський метрополітен',	1,	3,	30);

DROP TABLE IF EXISTS `transitions`;
CREATE TABLE `transitions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `station_from_id` int(11) NOT NULL,
  `station_to_id` int(11) NOT NULL,
  `subway_id` int(11) NOT NULL,
  `type` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `station_from_id` (`station_from_id`),
  KEY `station_to_id` (`station_to_id`),
  KEY `subway_id` (`subway_id`),
  CONSTRAINT `transitions_ibfk_1` FOREIGN KEY (`station_from_id`) REFERENCES `stations` (`id`),
  CONSTRAINT `transitions_ibfk_2` FOREIGN KEY (`station_to_id`) REFERENCES `stations` (`id`),
  CONSTRAINT `transitions_ibfk_3` FOREIGN KEY (`subway_id`) REFERENCES `subways` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

INSERT INTO `transitions` (`id`, `station_from_id`, `station_to_id`, `subway_id`, `type`) VALUES
(1,	4,	14,	1,	'Двійний'),
(2,	15,	25,	1,	'Двійний'),
(3,	6,	22,	1,	'Двійний');

-- 2024-11-12 19:59:01
