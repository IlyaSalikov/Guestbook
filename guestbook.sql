-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Окт 24 2021 г., 12:02
-- Версия сервера: 5.7.33
-- Версия PHP: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `guestbook`
--

-- --------------------------------------------------------

--
-- Структура таблицы `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL COMMENT 'ID',
  `message` varchar(600) NOT NULL COMMENT 'Сообщение',
  `date` datetime(6) NOT NULL COMMENT 'Дата-время отправки'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Сообщения пользователей';

--
-- Дамп данных таблицы `messages`
--

INSERT INTO `messages` (`id`, `message`, `date`) VALUES
(1, 'Всем привет', '2021-10-12 18:29:34.218377'),
(2, 'Классный сайт!', '2021-10-08 21:31:38.396416'),
(3, 'Посоветуйте зимнюю резину', '2021-10-24 15:58:52.000000'),
(4, 'Советую не покупать', '2021-10-24 15:58:56.000000');

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL COMMENT 'ID',
  `name` varchar(60) NOT NULL DEFAULT 'NO NAME' COMMENT 'Имя',
  `surname` varchar(60) NOT NULL DEFAULT 'NO NAME' COMMENT 'Фамилия',
  `login` varchar(60) NOT NULL COMMENT 'Логин',
  `password_hash` varchar(60) NOT NULL COMMENT 'Хэш пароля'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Пользователи';

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `name`, `surname`, `login`, `password_hash`) VALUES
(1, 'Иван', 'Иванов', 'ivanov', '827ccb0eea8a706c4c34a16891f84e7b'),
(2, 'NO', 'NAME', 'Vasilev', '12323232'),
(3, 'NO', 'NAME', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `usermessage`
--

CREATE TABLE `usermessage` (
  `id_user` int(11) NOT NULL,
  `id_message` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Какие пользователи какие сообщения отправляли';

--
-- Дамп данных таблицы `usermessage`
--

INSERT INTO `usermessage` (`id_user`, `id_message`) VALUES
(1, 1),
(2, 1);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `usermessage`
--
ALTER TABLE `usermessage`
  ADD KEY `fk_user_id` (`id_user`),
  ADD KEY `fk_message_id` (`id_message`) USING BTREE;

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID', AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID', AUTO_INCREMENT=4;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `usermessage`
--
ALTER TABLE `usermessage`
  ADD CONSTRAINT `fk_message_id` FOREIGN KEY (`id_message`) REFERENCES `messages` (`id`),
  ADD CONSTRAINT `fk_user_id` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
