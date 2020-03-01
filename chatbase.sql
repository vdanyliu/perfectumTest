-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Хост: localhost:3306
-- Время создания: Мар 01 2020 г., 09:38
-- Версия сервера: 8.0.17
-- Версия PHP: 7.2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `chatbase`
--

-- --------------------------------------------------------

--
-- Структура таблицы `tbl_dialog`
--

CREATE TABLE `tbl_dialog` (
  `dialog_id` int(11) NOT NULL,
  `user_id_one` int(11) NOT NULL,
  `user_id_two` int(11) NOT NULL,
  `dialog_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dialog_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `tbl_dialog`
--

INSERT INTO `tbl_dialog` (`dialog_id`, `user_id_one`, `user_id_two`) VALUES
(1, 1, 2),
(2, 1, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `tbl_message`
--

CREATE TABLE `tbl_message` (
  `chat_messages_id` int(11) NOT NULL,
  `fk_dialog_id` int(11) NOT NULL,
  `fk_sender_id` int(11) NOT NULL,
  `text_body` text NOT NULL,
  `massage_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `tbl_message`
--

INSERT INTO `tbl_message` (`chat_messages_id`, `fk_dialog_id`, `fk_sender_id`, `text_body`) VALUES
(1, 1, 1, 'qq1'),
(2, 1, 2, 'qq2'),
(3, 1, 1, 'qq3'),
(4, 2, 1, 'qq4'),
(5, 2, 3, 'qq5'),
(6, 2, 3, 'qq6'),
(7, 1, 2, 'qq7'),
(8, 1, 1, 'qq10'),
(9, 2, 1, 'qq1'),
(10, 1, 1, 'qq22');

-- --------------------------------------------------------

--
-- Структура таблицы `tbl_user`
--

CREATE TABLE `tbl_user` (
  `id` int(11) NOT NULL,
  `login` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `tbl_user`
--

INSERT INTO `tbl_user` (`id`, `login`) VALUES
(1, 'vasya'),
(2, 'petya'),
(3, 'masha');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `tbl_dialog`
--
ALTER TABLE `tbl_dialog`
  ADD PRIMARY KEY (`dialog_id`),
  ADD KEY `dialog_id` (`dialog_id`),
  ADD KEY `user_id_one` (`user_id_one`),
  ADD KEY `user_id_two` (`user_id_two`);

--
-- Индексы таблицы `tbl_message`
--
ALTER TABLE `tbl_message`
  ADD PRIMARY KEY (`chat_messages_id`),
  ADD KEY `fk_dialog_id` (`fk_dialog_id`),
  ADD KEY `fk_sender_id` (`fk_sender_id`);

--
-- Индексы таблицы `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `tbl_dialog`
--
ALTER TABLE `tbl_dialog`
  MODIFY `dialog_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `tbl_message`
--
ALTER TABLE `tbl_message`
  MODIFY `chat_messages_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `tbl_dialog`
--
ALTER TABLE `tbl_dialog`
  ADD CONSTRAINT `tbl_dialog_ibfk_1` FOREIGN KEY (`user_id_one`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_dialog_ibfk_2` FOREIGN KEY (`user_id_two`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `tbl_message`
--
ALTER TABLE `tbl_message`
  ADD CONSTRAINT `tbl_message_ibfk_1` FOREIGN KEY (`fk_dialog_id`) REFERENCES `tbl_dialog` (`dialog_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_message_ibfk_2` FOREIGN KEY (`fk_sender_id`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
