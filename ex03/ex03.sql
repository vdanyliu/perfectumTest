-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Мар 02 2020 г., 17:36
-- Версия сервера: 10.4.11-MariaDB
-- Версия PHP: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `ex03`
--

-- --------------------------------------------------------

--
-- Структура таблицы `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `nickname` varchar(30) NOT NULL,
  `email` varchar(100) NOT NULL,
  `text_body` text NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `comments`
--

INSERT INTO `comments` (`id`, `nickname`, `email`, `text_body`, `create_date`) VALUES
(1, 'Vasya', 'Vasya@ukr.net', 'asplfjmsidohjisidghidfghndfius', '2020-03-02 11:26:21'),
(2, 'Petya', 'Petya@ukr.net', 'lkfdhbgikdbnfgkfnkvjdnvkjxzbnjcvjhsx\\bvjkhx\\bhvjxcbvhjkxbvjkxcvb', '2020-03-02 11:26:21'),
(3, 'Petya', 'Petya@ukr.net', 'lkfdhbgikdbnfgkfnkvjdnvkjxzbnjcvjhsx\\bvjkhx\\bhvjxcbvhjk', '2020-03-02 11:26:21'),
(4, 'Petya', 'Petya@ukr.net', 'lkfdhbgikdbb', '0000-00-00 00:00:00'),
(5, 'fdsgf', 'sdfsdfsddf', 'sdfsdfsdfsdfsdfsdf', '2020-03-02 13:47:17'),
(6, 'Petya', 'Petya@ukr.net', 'lkfdhbgikdbnfgkfnkvjdnvkjxzbnjcvjhsx\\bvjkhx\\bhvjxcbvhjk', '2020-03-02 11:26:21'),
(7, 'fretalk', 'fretalk@ukr.net', '111111', '2020-03-02 16:33:49'),
(8, 'fretalk', 'fretalk@ukr.net', '111111', '2020-03-02 16:33:59'),
(9, 'fretalk', 'fretalk@ukr.net', '111111', '2020-03-02 16:35:01'),
(10, 'fretalk', 'fretalk@ukr.net', '111111', '2020-03-02 16:35:02'),
(11, 'fretalk', 'fretalk@ukr.net', '1223', '2020-03-02 16:35:12'),
(12, 'fretalk', 'fretalk@ukr.net', '1223', '2020-03-02 16:35:12'),
(13, 'fretalk', 'fretalk@ukr.net', '1223', '2020-03-02 16:35:13'),
(14, 'LtGenFlower', 'fretalk@ukr.net', '1223', '2020-03-02 16:35:22'),
(15, 'LtGenFlower', 'fretalk@ukr.net', '1223', '2020-03-02 16:35:27');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
