-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 16 Mar 2024, 02:21:02
-- Sunucu sürümü: 10.4.27-MariaDB
-- PHP Sürümü: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `ticketsphere`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `buyer`
--

CREATE TABLE `buyer` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `buyer`
--

INSERT INTO `buyer` (`id`, `name`, `surname`, `phone_number`, `address`) VALUES
(145, 'Oguzhan', 'Erdogan', '8954655335', 'SW15 5PH'),
(162, 'Mohammed', 'Rayan', '8654200221', 'N7 HG'),
(452, 'Samuel', 'Asamoah', '7421522335', 'NW5 5H'),
(523, 'Illias', 'Prevyzis', '6584522665', 'SW14 5TH'),
(785, 'Sanan', 'Ahmed', '4521322552', 'S2 4R');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `festivals`
--

CREATE TABLE `festivals` (
  `festival_id` int(11) NOT NULL,
  `festival_name` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `date` varchar(50) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `festivals`
--

INSERT INTO `festivals` (`festival_id`, `festival_name`, `location`, `date`, `price`) VALUES
(18, 'Glastonbury Festival', 'Glastonbury', 'June 26-30, 2024', '265.00'),
(42, 'Coachella Valley Music and Arts Festival', 'Indio', 'April 15-17, 2024', '399.00'),
(55, 'Fuji Rock Festival', 'Niigata Prefecture', 'July 26-28, 2024', '380.00'),
(73, 'Tomorrowland', 'Boom', 'July 19-21, 2024', '249.00'),
(87, 'Lollapalooza', 'Chicago', 'August 1-4, 2024', '340.00');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `seller`
--

CREATE TABLE `seller` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `seller`
--

INSERT INTO `seller` (`id`, `name`, `surname`, `phone_number`, `address`) VALUES
(126, 'Phil', 'Jones', '8754655421', 'N4 5YH'),
(475, 'Jack', 'Stones', '8754666985', 'NE5 4RT'),
(574, 'Steven', 'Gerard', '7554522112', 'S4 5TG'),
(632, 'Frank', 'Lampard', '8796554525', 'W3 4R'),
(741, 'John', 'Smith', '7584655886', 'SW3 5R');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `sold_tickets`
--

CREATE TABLE `sold_tickets` (
  `order_number` int(11) NOT NULL,
  `buyer_id` int(11) DEFAULT NULL,
  `seller_id` int(11) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `festival_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `sold_tickets`
--

INSERT INTO `sold_tickets` (`order_number`, `buyer_id`, `seller_id`, `price`, `festival_id`) VALUES
(14, 145, 574, '399.00', 42),
(21, 162, 632, '265.00', 18),
(36, 452, 126, '249.00', 73),
(47, 785, 475, '340.00', 87),
(54, 523, 741, '380.00', 55);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `mail` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `buyer_id` int(11) DEFAULT NULL,
  `seller_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `users`
--

INSERT INTO `users` (`id`, `mail`, `password`, `buyer_id`, `seller_id`) VALUES
(126, 'phil.jones@gmail.com', 'panda', NULL, 126),
(145, 'oguzhan.erdogan@gmail.com', 'lionfish', 145, NULL),
(162, 'mohammed.rayan@gmail.com', 'hummingbird', 162, NULL),
(452, 'samuel.asamoah@gmail.com', 'kangaroo', 452, NULL),
(475, 'jack.stones@gmail.com', 'wolf', NULL, 475),
(523, 'illias.prevyzis@gmail.com', 'giraffe', 523, NULL),
(574, 'steven.gerard@gmail.com', 'turtle', NULL, 574),
(632, 'frank.lampard@gmail.com', 'elephant', NULL, 632),
(741, 'john.smith@gmail.com', 'dolphin', NULL, 741),
(785, 'sanan.ahmed@gmail.com', 'cheetah', 785, NULL);

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `buyer`
--
ALTER TABLE `buyer`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `festivals`
--
ALTER TABLE `festivals`
  ADD PRIMARY KEY (`festival_id`);

--
-- Tablo için indeksler `seller`
--
ALTER TABLE `seller`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `sold_tickets`
--
ALTER TABLE `sold_tickets`
  ADD PRIMARY KEY (`order_number`),
  ADD KEY `buyer_id` (`buyer_id`),
  ADD KEY `seller_id` (`seller_id`),
  ADD KEY `festival_id` (`festival_id`);

--
-- Tablo için indeksler `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `buyer_id` (`buyer_id`),
  ADD KEY `seller_id` (`seller_id`);

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `sold_tickets`
--
ALTER TABLE `sold_tickets`
  ADD CONSTRAINT `sold_tickets_ibfk_1` FOREIGN KEY (`buyer_id`) REFERENCES `buyer` (`id`),
  ADD CONSTRAINT `sold_tickets_ibfk_2` FOREIGN KEY (`seller_id`) REFERENCES `seller` (`id`),
  ADD CONSTRAINT `sold_tickets_ibfk_3` FOREIGN KEY (`festival_id`) REFERENCES `festivals` (`festival_id`);

--
-- Tablo kısıtlamaları `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`buyer_id`) REFERENCES `buyer` (`id`),
  ADD CONSTRAINT `users_ibfk_2` FOREIGN KEY (`seller_id`) REFERENCES `seller` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
