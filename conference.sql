-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Хост: MySQL-8.4
-- Время создания: Ноя 20 2026 г., 00:52
-- Версия сервера: 8.4.6
-- Версия PHP: 8.4.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `conference`
--

-- --------------------------------------------------------

--
-- Структура таблицы `bookings`
--

CREATE TABLE `bookings` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `room_id` int NOT NULL,
  `title` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `starts_at` datetime NOT NULL,
  `duration` int NOT NULL DEFAULT '2',
  `hourly_rate` int NOT NULL,
  `payment` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new',
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `bookings`
--

INSERT INTO `bookings` (`id`, `user_id`, `room_id`, `title`, `starts_at`, `duration`, `hourly_rate`, `payment`, `status`, `created_at`, `updated_at`) VALUES
(1, 2, 2, '', '2026-11-28 02:06:00', 2, 2000, 'sbp', 'new', '2026-11-13 02:06:34', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `migration`
--

CREATE TABLE `migration` (
  `version` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apply_time` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1793992002),
('m261106_000001_create_portal', 1793992003);

-- --------------------------------------------------------

--
-- Структура таблицы `reviews`
--

CREATE TABLE `reviews` (
  `id` int NOT NULL,
  `booking_id` int NOT NULL,
  `rating` int NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `rooms`
--

CREATE TABLE `rooms` (
  `id` int NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `capacity` int NOT NULL,
  `area` int NOT NULL,
  `price` int NOT NULL,
  `amenities` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `rooms`
--

INSERT INTO `rooms` (`id`, `name`, `type`, `description`, `capacity`, `area`, `price`, `amenities`, `image`, `active`) VALUES
(1, 'Панорама', 'auditorium', 'Светлая аудитория с панорамными окнами и продуманной акустикой. Идеальное пространство для конференций, лекций и презентаций. Гибкая рассадка поможет адаптировать зал под формат вашего события.', 80, 120, 3500, 'Проектор|Wi-Fi|Микрофоны|Флипчарт', 'room-1.jpg', 1),
(2, 'Точка сборки', 'coworking', 'Открытое пространство для совместной работы, стратегических сессий и небольших деловых встреч. Много естественного света, удобные рабочие места и уютная зона отдыха.', 30, 85, 2000, 'Wi-Fi|Кофе-зона|Флипчарт|Розетки', 'room-2.jpg', 1),
(3, 'Большой экран', 'cinema', 'Просторный зал с профессиональным экраном и звуковой системой. Подходит для масштабных конференций, закрытых показов и презентаций с полным погружением.', 150, 200, 5000, 'Большой экран|Звук 5.1|Микрофоны|Wi-Fi', 'room-3.jpg', 1),
(4, 'Горизонт', 'auditorium', 'Камерный зал для образовательных программ, семинаров и дискуссий. Спокойный интерьер и современное оборудование позволят сосредоточиться на главном.', 40, 65, 2500, 'Проектор|Wi-Fi|Флипчарт', 'hero.jpg', 1),
(5, 'Среда', 'coworking', 'Небольшое пространство для команд, которым важен комфорт. Подходит для воркшопов, брейнштормов и встреч с партнёрами.', 16, 45, 1500, 'Wi-Fi|Кофе-зона|Маркерная доска', 'room-2.jpg', 1),
(6, 'Премьер', 'cinema', 'Кинозал для профессиональных событий и презентаций. Удобные кресла, затемнение и качественная акустика для каждого участника.', 90, 140, 4000, 'Большой экран|Микрофоны|Wi-Fi', 'room-3.jpg', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `support_messages`
--

CREATE TABLE `support_messages` (
  `id` int NOT NULL,
  `ticket_id` int NOT NULL,
  `user_id` int NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `support_tickets`
--

CREATE TABLE `support_tickets` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `subject` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `login` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `auth_key` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `full_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `login`, `password_hash`, `auth_key`, `full_name`, `phone`, `email`, `role`, `created_at`) VALUES
(1, 'Conf2027', '$2y$13$cwFcdBQpsRn5i4ploZXI/egRnZ1ICbbpuOH303QSJK.zIui9Uyjqa', 'SjDlhvcPCj1ke9MLm2QUklys1xwiY9lF', 'Администратор портала', '8(999)123-45-67', 'admin@conference.local', 'admin', '2026-11-06 22:06:42'),
(2, 'Xaron18', '$2y$13$C7jDUuTHIjzD2yJS5yzO/eZ/ZKN/cykipNE0ZzeyVU8MMYIsN2KRu', 'njkM5CbdJP_AYoRKuB8odnEOK4NV8nea', 'Пилюгин Данил Михайлович', '8(918)537-71-86', 'danil.pilyug@yandex.ru', 'user', '2026-11-11 10:28:26'),
(3, 'Support2027', '$2y$13$Q8xAbCdEfGhIjKlMnOpQrStUvWxYz0123456789ABCDEF', 'abc123def456ghi789jkl012mno345pq', 'Сотрудник поддержки', '8(999)765-43-21', 'support@conference.local', 'support', '2026-11-18 06:51:02');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_booking_user_status` (`user_id`,`status`),
  ADD KEY `idx_booking_room_date` (`room_id`,`status`,`starts_at`);

--
-- Индексы таблицы `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Индексы таблицы `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `booking_id` (`booking_id`);

--
-- Индексы таблицы `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `support_messages`
--
ALTER TABLE `support_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_support_message_ticket` (`ticket_id`),
  ADD KEY `fk_support_message_user` (`user_id`);

--
-- Индексы таблицы `support_tickets`
--
ALTER TABLE `support_tickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_support_ticket_user` (`user_id`,`status`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `login` (`login`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `support_messages`
--
ALTER TABLE `support_messages`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `support_tickets`
--
ALTER TABLE `support_tickets`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `fk_booking_room` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_booking_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `fk_review_booking` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `support_messages`
--
ALTER TABLE `support_messages`
  ADD CONSTRAINT `fk_support_message_ticket` FOREIGN KEY (`ticket_id`) REFERENCES `support_tickets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_support_message_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `support_tickets`
--
ALTER TABLE `support_tickets`
  ADD CONSTRAINT `fk_support_ticket_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
