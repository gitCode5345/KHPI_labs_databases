-- Adminer 4.8.1 MySQL 11.5.2-MariaDB-ubu2404 dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `files_projects`;
CREATE TABLE `files_projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `link` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `project_id` (`project_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `files_projects_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`),
  CONSTRAINT `files_projects_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

INSERT INTO `files_projects` (`id`, `project_id`, `user_id`, `link`) VALUES
(1,	1,	1,	'http://example.com/file_project1'),
(2,	2,	2,	'http://example.com/file_project2'),
(3,	3,	1,	'http://example.com/file_project3');

DROP TABLE IF EXISTS `files_tasks`;
CREATE TABLE `files_tasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `link` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `task_id` (`task_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `files_tasks_ibfk_1` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`),
  CONSTRAINT `files_tasks_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

INSERT INTO `files_tasks` (`id`, `task_id`, `user_id`, `link`) VALUES
(1,	1,	1,	'http://example.com/file_task1'),
(2,	1,	2,	'http://example.com/file_task1_user2'),
(3,	2,	2,	'http://example.com/file_task2'),
(4,	3,	1,	'http://example.com/file_task3'),
(5,	4,	3,	'http://example.com/file_task4');

DROP TABLE IF EXISTS `projects`;
CREATE TABLE `projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

INSERT INTO `projects` (`id`, `name`, `description`) VALUES
(1,	'Проект 1',	'Опис проекту 1'),
(2,	'Проект 2',	'Опис проекту 2'),
(3,	'Проект 3',	'Опис проекту 3');

DROP TABLE IF EXISTS `tasks`;
CREATE TABLE `tasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `author_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `deadline` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `author_id` (`author_id`),
  KEY `project_id` (`project_id`),
  CONSTRAINT `tasks_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`),
  CONSTRAINT `tasks_ibfk_2` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

INSERT INTO `tasks` (`id`, `name`, `author_id`, `project_id`, `description`, `deadline`) VALUES
(1,	'Задача 1',	1,	1,	'Опис задачі 1',	'2024-12-31 23:59:59'),
(2,	'Задача 2',	2,	1,	'Опис задачі 2',	'2024-11-30 23:59:59'),
(3,	'Задача 3',	1,	2,	'Опис задачі 3',	'2024-12-15 23:59:59'),
(4,	'Задача 4',	3,	3,	'Опис задачі 4',	'2024-12-20 23:59:59');

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

INSERT INTO `users` (`id`, `first_name`, `last_name`) VALUES
(1,	'Іван',	'Петренко'),
(2,	'Олена',	'Сидоренко'),
(3,	'Андрій',	'Коваленко'),
(4,	'Марія',	'Шевченко');

DROP TABLE IF EXISTS `users_projects`;
CREATE TABLE `users_projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_project_unique` (`user_id`,`project_id`),
  KEY `project_id` (`project_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `users_projects_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`),
  CONSTRAINT `users_projects_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

INSERT INTO `users_projects` (`id`, `project_id`, `user_id`) VALUES
(1,	1,	1),
(5,	3,	1),
(2,	1,	2),
(3,	2,	2),
(4,	2,	3),
(6,	3,	4);

DROP TABLE IF EXISTS `users_tasks`;
CREATE TABLE `users_tasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_task_unique` (`user_id`,`task_id`),
  KEY `task_id` (`task_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `users_tasks_ibfk_1` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`),
  CONSTRAINT `users_tasks_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

INSERT INTO `users_tasks` (`id`, `task_id`, `user_id`) VALUES
(1,	1,	1),
(4,	3,	1),
(2,	1,	2),
(3,	2,	2),
(5,	4,	3),
(6,	4,	4);

-- 2024-11-05 20:02:04
