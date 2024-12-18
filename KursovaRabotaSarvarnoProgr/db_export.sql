-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 07, 2024 at 01:34 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laptops`
--

-- --------------------------------------------------------

--
-- Table structure for table `favorite_products_users`
--

CREATE TABLE `favorite_products_users` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL COMMENT 'Първичен ключ',
  `title` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`title`, `category_id`, `image`, `price`) VALUES
('Детска количка', 1, 'https://example.com/toy1.jpg', '19.99'),
('Плюшена играчка', 1, 'https://example.com/toy2.jpg', '15.49'),
('Конструктор Lego', 1, 'https://example.com/toy3.jpg', '25.00'),
('Мечка за прегръдки', 1, 'https://example.com/toy4.jpg', '12.99'),
('Робот играчка', 1, 'https://example.com/toy5.jpg', '29.99'),
('Детски пистолет', 1, 'https://example.com/toy6.jpg', '18.99'),
('Моливи за рисуване', 1, 'https://example.com/toy7.jpg', '8.49'),
('Мека играчка динозавър', 1, 'https://example.com/toy8.jpg', '13.99'),
('Детска кукла', 1, 'https://example.com/toy9.jpg', '22.00'),
('Палячо играчка', 1, 'https://example.com/toy10.jpg', '9.99');


INSERT INTO `products` (`title`, `category_id`, `image`, `price`) VALUES
('iPhone 14', 2, 'https://example.com/phone1.jpg', '1099.99'),
('Samsung Galaxy S22', 2, 'https://example.com/phone2.jpg', '899.99'),
('Xiaomi Mi 11', 2, 'https://example.com/phone3.jpg', '499.99'),
('OnePlus 9 Pro', 2, 'https://example.com/phone4.jpg', '999.00'),
('Google Pixel 6', 2, 'https://example.com/phone5.jpg', '799.99'),
('Huawei P50', 2, 'https://example.com/phone6.jpg', '899.99'),
('Realme GT 5G', 2, 'https://example.com/phone7.jpg', '649.00'),
('Oppo Reno 6', 2, 'https://example.com/phone8.jpg', '569.99'),
('Nokia 8.3', 2, 'https://example.com/phone9.jpg', '549.00'),
('Sony Xperia 1 II', 2, 'https://example.com/phone10.jpg', '1299.99');


INSERT INTO `products` (`title`, `category_id`, `image`, `price`) VALUES
('Bluetooth слушалки', 3, 'https://example.com/accessory1.jpg', '49.99'),
('Часовник Garmin', 3, 'https://example.com/accessory2.jpg', '249.99'),
('Зарядно за iPhone', 3, 'https://example.com/accessory3.jpg', '19.99'),
('Калъф за телефон', 3, 'https://example.com/accessory4.jpg', '15.49'),
('Стойка за телефон', 3, 'https://example.com/accessory5.jpg', '12.99'),
('Слушалки Sony', 3, 'https://example.com/accessory6.jpg', '89.99'),
('Безжично зарядно', 3, 'https://example.com/accessory7.jpg', '29.99'),
('Powerbank', 3, 'https://example.com/accessory8.jpg', '35.00'),
('Кабел за Android', 3, 'https://example.com/accessory9.jpg', '5.99'),
('Ръкавици за телефон', 3, 'https://example.com/accessory10.jpg', '8.99');

INSERT INTO `products` (`title`, `category_id`, `image`, `price`) VALUES
('Мъжка риза', 4, 'https://example.com/clothing1.jpg', '49.99'),
('Дамска рокля', 4, 'https://example.com/clothing2.jpg', '59.99'),
('Детски панталони', 4, 'https://example.com/clothing3.jpg', '19.99'),
('Спортни обувки', 4, 'https://example.com/clothing4.jpg', '69.99'),
('Жилетка', 4, 'https://example.com/clothing5.jpg', '39.99'),
('Дънки', 4, 'https://example.com/clothing6.jpg', '49.99'),
('Шапка', 4, 'https://example.com/clothing7.jpg', '15.00'),
('Калъфка за възглавница', 4, 'https://example.com/clothing8.jpg', '12.50'),
('Спортен екип', 4, 'https://example.com/clothing9.jpg', '79.99'),
('Тениска', 4, 'https://example.com/clothing10.jpg', '25.99');

INSERT INTO `products` (`title`, `category_id`, `image`, `price`) VALUES
('Сушилня за коса', 5, 'https://example.com/electronic1.jpg', '29.99'),
('Телевизор Samsung', 5, 'https://example.com/electronic2.jpg', '499.99'),
('Хладилник LG', 5, 'https://example.com/electronic3.jpg', '799.99'),
('Микровълнова фурна', 5, 'https://example.com/electronic4.jpg', '159.99'),
('Смарт часовник', 5, 'https://example.com/electronic5.jpg', '129.99'),
('Прахосмукачка', 5, 'https://example.com/electronic6.jpg', '89.99'),
('Кафемашина', 5, 'https://example.com/electronic7.jpg', '49.99'),
('Пералня', 5, 'https://example.com/electronic8.jpg', '399.99'),
('Готварска печка', 5, 'https://example.com/electronic9.jpg', '299.99'),
('Чайник', 5, 'https://example.com/electronic10.jpg', '24.99');


INSERT INTO `products` (`title`, `category_id`, `image`, `price`) VALUES
('Молив 2B', 6, 'https://example.com/pencil1.jpg', '1.99'),
('Точилка', 6, 'https://example.com/pencil2.jpg', '0.99'),
('Химикал Pilot', 6, 'https://example.com/pencil3.jpg', '2.99'),
('Текст маркер', 6, 'https://example.com/pencil4.jpg', '3.49'),
('Гумка', 6, 'https://example.com/pencil5.jpg', '0.89'),
('Химикал син', 6, 'https://example.com/pencil6.jpg', '1.49'),
('Флумастер', 6, 'https://example.com/pencil7.jpg', '2.99'),
('Терминал за писане', 6, 'https://example.com/pencil8.jpg', '5.99'),
('Писалки за бележки', 6, 'https://example.com/pencil9.jpg', '2.49'),
('Цветни моливи', 6, 'https://example.com/pencil10.jpg', '3.99');


-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `names` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `names`, `email`, `password`) VALUES
(1, 'Иван Петров', 'ivan.p@abv.bg', '$argon2i$v=19$m=65536,t=4,p=1$Zm9oZ0xjVUpWZldwTG9NbA$z2yHpLUFzBHL9ORlKx/ZPQs3kYdfiB1/TDOlNEBvn/4'),
(2, 'Мария Георгиева', 'maria.g@abv.bg', '$argon2i$v=19$m=65536,t=4,p=1$VzRUZzNzYTQ3RDBTYlFBVQ$gFRXXBrbJSO02PpgozFOKQUzqv5bggP5zCKx+ddotAo'),
(3, 'Петър Димитров', 'peter.d@abv.bg', '$argon2i$v=19$m=65536,t=4,p=1$eTZmUG15U2dlXzkvOHZHVw$uHh7kGT+4TRtX1V6hty85zTpmv9bpZZahZPtiDZhclo'),
(4, 'Елена Николова', 'elena.n@abv.bg', '$argon2i$v=19$m=65536,t=4,p=1$QXZmNVlyb0YwRmF5dXZ1Zg$UmkVdHOYlLN04c9u0z6KhxU4W+80gKMJ32v75C7hSvk'),
(5, 'Александър Тодоров', 'alex.t@abv.bg', '$argon2i$v=19$m=65536,t=4,p=1$T0dmY1hpcmhTMDVsRzF5Yg$58ACcxyl+7/tgcloCVpZ5GzWb6G+fSYwnjtw6ONrBggM'),
(6, 'Симона Иванова', 'simona.i@abv.bg', '$argon2i$v=19$m=65536,t=4,p=1$dkdJTFJKcG7HDgJq04gNlw$rbj5qVZyj1aZbtiJ7l0G1ZCnsAF0jpcKRoQIUtRYgBY'),
(7, 'Василена Костова', 'vasilena.k@abv.bg', '$argon2i$v=19$m=65536,t=4,p=1$M0pwczNlU2ZTZXZY7O4X+g$AYPO97rXmUXw/z7T6mVHFYZvEwxl0TEn9JaxqCks1k8'),
(8, 'Георги Марков', 'georgi.m@abv.bg', '$argon2i$v=19$m=65536,t=4,p=1$ZWFtMXV5Wm9GdEpmTXJlXg$V7eZXG3M0Z9VeN9JHo5zxYcZ3j2UPKpsPbs+f1nHgB4'),
(9, 'Таня Петрова', 'tanya.p@abv.bg', '$argon2i$v=19$m=65536,t=4,p=1$akI6ZGxqcmzWYoMFXtcEJw$GTYhkmkdbFhGJz60dx0pIW6F7y71km2XryZn7WYh15g'),
(10, 'Калоян Борисов', 'kaloyan.b@abv.bg', '$argon2i$v=19$m=65536,t=4,p=1$ai9ke21uW1y8FlGjiTgXzQ$D7ixUql59r0fZqZarU1P2fB2vYvcKNlqfmdpLX2yHyE');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `favorite_products_users`
--
ALTER TABLE `favorite_products_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `favorite_products_users`
--
ALTER TABLE `favorite_products_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Първичен ключ', AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;