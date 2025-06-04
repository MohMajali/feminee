-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 25, 2025 at 10:22 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `feminee`
--

-- --------------------------------------------------------

--
-- Table structure for table `advertisements`
--

CREATE TABLE `advertisements` (
  `id` int(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(250) NOT NULL,
  `active` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `advertisements`
--

INSERT INTO `advertisements` (`id`, `title`, `description`, `image`, `active`, `created_at`) VALUES
(1, 'Gees', 'yummmy', 'Advs_Images/Picture1.jpg', 1, '2025-04-05 21:03:21'),
(2, 'mini pot', 'Buy the Best mini plants', 'Advs_Images/Picture24.jpg', 1, '2025-04-13 14:28:06');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` int(11) NOT NULL,
  `buyer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `options` text NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `buyer_id`, `product_id`, `options`, `qty`) VALUES
(54, 32, 85, '{\"color_id\":\"\",\"size_id\":\"\"}', 2),
(57, 14, 119, '{\"color_id\":\"\",\"size_id\":\"\"}', 1);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `image` varchar(250) NOT NULL,
  `active` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `image`, `active`, `created_at`) VALUES
(3, 'food', 'Categories_Images/food.webp', 1, '2025-03-18 07:38:04'),
(5, 'sweets', 'Categories_Images/sweets2.webp', 1, '2025-03-24 18:22:34'),
(6, 'accessories', 'Categories_Images/Picture9.png', 1, '2025-03-24 20:29:39'),
(7, 'cups ,coasters and soaps ', 'Categories_Images/Picture53.jpg', 1, '2025-03-26 19:07:04'),
(8, 'Gifts', 'Categories_Images/gifts catogery.png', 1, '2025-04-12 17:37:29'),
(9, 'Clothes', 'Categories_Images/', 1, '2025-05-11 15:01:05');

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

CREATE TABLE `favorites` (
  `id` int(11) NOT NULL,
  `buyer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `active` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `favorites`
--

INSERT INTO `favorites` (`id`, `buyer_id`, `product_id`, `active`, `created_at`) VALUES
(3, 14, 18, 1, '2025-05-07 19:22:55'),
(4, 14, 8, 1, '2025-05-07 19:22:57');

-- --------------------------------------------------------

--
-- Table structure for table `offers`
--

CREATE TABLE `offers` (
  `id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `price` double NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `offers`
--

INSERT INTO `offers` (`id`, `seller_id`, `product_id`, `title`, `description`, `price`, `active`, `created_at`) VALUES
(2, 12, 80, 'Buy 1 Get 1 Free', 'Buy 1 Get 1 Free colorful cup', 11, 1, '2025-04-13 14:23:24'),
(3, 12, 82, 'Buy 12 get 6 free', 'Buy 12 get 6 free colorful coasters ', 12, 1, '2025-04-13 14:25:01'),
(4, 54, 193, 'Gift Package', 'Gift Package consists of 2 Fruit Jam of your choice and one hot pepper jam', 28, 1, '2025-05-11 15:45:06');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `buyer_id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `offer_id` int(11) DEFAULT NULL,
  `status_id` int(11) NOT NULL DEFAULT 1,
  `total_price` double NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `buyer_id`, `seller_id`, `offer_id`, `status_id`, `total_price`, `created_at`) VALUES
(18, 14, 13, NULL, 3, 316.4099999999999, '2025-05-03 15:12:05'),
(19, 14, 13, NULL, 3, 27, '2025-05-04 14:24:02'),
(20, 32, 12, 2, 3, 11, '2025-05-04 16:51:02'),
(21, 32, 17, NULL, 3, 44, '2025-05-04 16:52:57'),
(22, 32, 25, NULL, 3, 44, '2025-05-04 16:52:59'),
(23, 34, 21, NULL, 3, 15, '2025-05-04 21:24:29'),
(24, 14, 38, NULL, 3, 30, '2025-05-07 19:16:44'),
(25, 14, 13, NULL, 3, 30, '2025-05-07 19:16:48'),
(26, 14, 9, NULL, 3, 7, '2025-05-08 10:05:49'),
(27, 14, 37, NULL, 1, 7, '2025-05-08 10:05:52'),
(28, 32, 9, NULL, 1, 2, '2025-05-14 22:05:54'),
(29, 14, 42, NULL, 3, 10, '2025-05-22 21:00:33'),
(30, 14, 46, NULL, 1, 10, '2025-05-22 21:00:36');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `seller_id` int(11) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `option_id` text DEFAULT NULL,
  `product_price` double NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `seller_id`, `product_id`, `option_id`, `product_price`, `quantity`, `created_at`) VALUES
(15, 18, 13, 8, '{\"color_id\":\"\",\"size_id\":\"\"}', 1.99, 1, '2025-05-03 15:12:05'),
(16, 18, 13, 8, '{\"color_id\":\"\",\"size_id\":\"\"}', 1.99, 1, '2025-05-03 15:12:08'),
(17, 18, 13, 8, '{\"color_id\":\"\",\"size_id\":\"\"}', 1.99, 1, '2025-05-03 15:12:10'),
(18, 18, 13, 8, '{\"color_id\":\"\",\"size_id\":\"\"}', 1.99, 4, '2025-05-03 15:12:12'),
(19, 18, 13, 8, '{\"color_id\":\"\",\"size_id\":\"\"}', 1.99, 4, '2025-05-03 15:12:14'),
(20, 18, 13, 8, '{\"color_id\":\"\",\"size_id\":\"\"}', 1.99, 4, '2025-05-03 15:12:15'),
(21, 18, 13, 8, '{\"color_id\":\"\",\"size_id\":\"\"}', 1.99, 4, '2025-05-03 15:12:18'),
(22, 18, 13, 8, '{\"color_id\":\"\",\"size_id\":\"\"}', 1.99, 4, '2025-05-03 15:12:20'),
(23, 18, 13, 8, '{\"color_id\":\"\",\"size_id\":\"\"}', 1.99, 4, '2025-05-03 15:12:22'),
(24, 18, 13, 8, '{\"color_id\":\"\",\"size_id\":\"\"}', 1.99, 4, '2025-05-03 15:12:24'),
(25, 18, 13, 8, '{\"color_id\":\"\",\"size_id\":\"\"}', 1.99, 4, '2025-05-03 15:12:26'),
(26, 18, 13, 8, '{\"color_id\":\"\",\"size_id\":\"\"}', 1.99, 4, '2025-05-03 15:12:28'),
(27, 18, 13, 8, '{\"color_id\":\"\",\"size_id\":\"\"}', 1.99, 4, '2025-05-03 15:12:29'),
(28, 18, 13, 8, '{\"color_id\":\"\",\"size_id\":\"\"}', 1.99, 4, '2025-05-03 15:12:31'),
(29, 18, 13, 8, '{\"color_id\":\"\",\"size_id\":\"\"}', 1.99, 4, '2025-05-03 15:12:33'),
(30, 18, 13, 8, '{\"color_id\":\"\",\"size_id\":\"\"}', 1.99, 4, '2025-05-03 15:12:35'),
(31, 18, 13, 8, '{\"color_id\":\"\",\"size_id\":\"\"}', 1.99, 4, '2025-05-03 15:12:37'),
(32, 18, 13, 8, '{\"color_id\":\"\",\"size_id\":\"\"}', 1.99, 4, '2025-05-03 15:12:39'),
(33, 18, 13, 8, '{\"color_id\":\"\",\"size_id\":\"\"}', 1.99, 4, '2025-05-03 15:12:41'),
(34, 18, 13, 8, '{\"color_id\":\"\",\"size_id\":\"\"}', 1.99, 4, '2025-05-03 15:12:43'),
(35, 18, 13, 8, '{\"color_id\":\"\",\"size_id\":\"\"}', 1.99, 4, '2025-05-03 15:12:45'),
(36, 18, 13, 8, '{\"color_id\":\"\",\"size_id\":\"\"}', 1.99, 4, '2025-05-03 15:12:47'),
(37, 18, 13, 8, '{\"color_id\":\"\",\"size_id\":\"\"}', 1.99, 4, '2025-05-03 15:12:49'),
(38, 18, 13, 8, '{\"color_id\":\"\",\"size_id\":\"\"}', 1.99, 4, '2025-05-03 15:12:51'),
(39, 18, 13, 8, '{\"color_id\":\"\",\"size_id\":\"\"}', 1.99, 4, '2025-05-03 15:12:53'),
(40, 18, 13, 8, '{\"color_id\":\"\",\"size_id\":\"\"}', 1.99, 4, '2025-05-03 15:12:55'),
(41, 18, 13, 8, '{\"color_id\":\"\",\"size_id\":\"\"}', 1.99, 4, '2025-05-03 15:12:57'),
(42, 18, 13, 8, '{\"color_id\":\"\",\"size_id\":\"\"}', 1.99, 4, '2025-05-03 15:12:59'),
(43, 18, 13, 8, '{\"color_id\":\"\",\"size_id\":\"\"}', 1.99, 4, '2025-05-03 15:13:01'),
(44, 18, 13, 8, '{\"color_id\":\"\",\"size_id\":\"\"}', 1.99, 4, '2025-05-03 15:13:03'),
(45, 18, 13, 8, '{\"color_id\":\"\",\"size_id\":\"\"}', 1.99, 4, '2025-05-03 15:13:05'),
(46, 18, 13, 8, '{\"color_id\":\"\",\"size_id\":\"\"}', 1.99, 4, '2025-05-03 15:13:07'),
(47, 18, 13, 8, '{\"color_id\":\"\",\"size_id\":\"\"}', 1.99, 4, '2025-05-03 15:13:09'),
(48, 18, 13, 8, '{\"color_id\":\"\",\"size_id\":\"\"}', 1.99, 4, '2025-05-03 15:13:11'),
(49, 18, 13, 8, '{\"color_id\":\"\",\"size_id\":\"\"}', 1.99, 4, '2025-05-03 15:13:13'),
(50, 18, 13, 8, '{\"color_id\":\"\",\"size_id\":\"\"}', 1.99, 4, '2025-05-03 15:13:15'),
(51, 18, 13, 8, '{\"color_id\":\"\",\"size_id\":\"\"}', 1.99, 4, '2025-05-03 15:13:17'),
(52, 18, 13, 8, '{\"color_id\":\"\",\"size_id\":\"\"}', 1.99, 4, '2025-05-03 15:13:19'),
(53, 18, 13, 8, '{\"color_id\":\"\",\"size_id\":\"\"}', 1.99, 4, '2025-05-03 15:13:21'),
(54, 18, 13, 8, '{\"color_id\":\"\",\"size_id\":\"\"}', 1.99, 4, '2025-05-03 15:13:23'),
(55, 18, 13, 8, '{\"color_id\":\"\",\"size_id\":\"\"}', 1.99, 4, '2025-05-03 15:13:25'),
(56, 18, 13, 8, '{\"color_id\":\"\",\"size_id\":\"\"}', 1.99, 4, '2025-05-03 15:13:27'),
(57, 19, 13, 9, '{\"color_id\":\"\",\"size_id\":\"\"}', 2, 1, '2025-05-04 14:24:02'),
(58, 19, 13, 21, '{\"color_id\":\"\",\"size_id\":\"\"}', 25, 1, '2025-05-04 14:24:02'),
(59, 20, 12, 80, NULL, 11, 1, '2025-05-04 16:51:02'),
(60, 21, 17, 18, '{\"color_id\":\"\",\"size_id\":\"\"}', 40, 1, '2025-05-04 16:52:57'),
(61, 22, 25, 50, '{\"color_id\":\"\",\"size_id\":\"\"}', 4, 1, '2025-05-04 16:52:59'),
(62, 23, 21, 34, '{\"color_id\":\"\",\"size_id\":\"\"}', 15, 1, '2025-05-04 21:24:29'),
(63, 24, 38, 120, '{\"color_id\":\"\",\"size_id\":\"\"}', 5, 1, '2025-05-07 19:16:44'),
(64, 25, 13, 21, '{\"color_id\":\"\",\"size_id\":\"\"}', 25, 1, '2025-05-07 19:16:48'),
(65, 26, 9, 84, '{\"color_id\":\"\",\"size_id\":\"\"}', 1, 1, '2025-05-08 10:05:49'),
(66, 27, 37, 115, '{\"color_id\":\"\",\"size_id\":\"\"}', 6, 1, '2025-05-08 10:05:52'),
(67, 28, 9, 84, '{\"color_id\":\"\",\"size_id\":\"\"}', 1, 2, '2025-05-14 22:05:54'),
(68, 29, 42, 139, '{\"color_id\":\"\",\"size_id\":\"\"}', 7, 1, '2025-05-22 21:00:33'),
(69, 30, 46, 157, '{\"color_id\":\"\",\"size_id\":\"\"}', 0.75, 4, '2025-05-22 21:00:36');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `sub_category_id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `image` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `price` double NOT NULL,
  `total_rate` double NOT NULL DEFAULT 0,
  `is_customized` tinyint(1) NOT NULL,
  `active` int(11) NOT NULL DEFAULT 1,
  `qty` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `sub_category_id`, `seller_id`, `name`, `image`, `description`, `price`, `total_rate`, `is_customized`, `active`, `qty`, `created_at`) VALUES
(8, 5, 16, 13, 'chocolate chip cookies ', 'Product_Images/cooo.jpg', 'cookies filled with chocolate chips ', 1.99, 4, 0, 1, -119, '2025-04-05 20:20:28'),
(9, 5, 17, 13, 'Brownie ', 'Product_Images/brow.jpg', 'chewy brownies ', 2, 0, 0, 1, 29, '2025-04-05 20:23:27'),
(10, 7, 14, 16, 'roses around ', 'Product_Images/around.jpg', 'roses', 5, 0, 0, 1, 30, '2025-04-12 18:34:03'),
(11, 7, 14, 16, 'sunny', 'Product_Images/sunflower.jpg', 'sunflower ', 6, 0, 0, 1, 20, '2025-04-12 18:45:12'),
(12, 7, 14, 16, 'cute', 'Product_Images/bebyoneh.jpg', 'cup with a straw ', 40, 0, 0, 1, 30, '2025-04-12 18:46:11'),
(13, 7, 14, 16, 'المودة', 'Product_Images/Picture4.jpg', 'big cup \r\n', 7, 0, 0, 0, 20, '2025-04-12 18:46:54'),
(14, 7, 14, 16, 'Heart', 'Product_Images/heart.jpg', 'Hearts Cup \r\n', 8, 0, 0, 1, 30, '2025-04-12 18:48:00'),
(15, 7, 15, 16, 'coaster', 'Product_Images/coaster.jpg', 'coaster with flower design', 8, 0, 0, 1, 30, '2025-04-12 18:48:47'),
(16, 8, 18, 17, 'Watermelon bag', 'Product_Images/Picture7.jpg', 'tote bag with watermelon drawing', 6, 0, 0, 1, 30, '2025-04-12 18:53:57'),
(17, 6, 10, 17, 'Osama board', 'Product_Images/osama.jpg', 'board', 10, 0, 0, 1, 30, '2025-04-12 18:54:57'),
(18, 6, 10, 17, 'Eliana board', 'Product_Images/elyana.jpg', 'Eliana board drawing', 40, 4, 0, 1, 19, '2025-04-12 18:55:41'),
(19, 6, 10, 17, 'Sun bag', 'Product_Images/sunbag.jpg', 'big sun drew on the bag', 6, 0, 0, 1, 20, '2025-04-12 18:57:02'),
(20, 5, 19, 13, 'macrone', 'Product_Images/macc.jpg', '6 pc for 6 jd', 6, 0, 0, 1, 60, '2025-04-12 19:01:45'),
(21, 5, 19, 13, 'macrone ', 'Product_Images/maco.jpg', '25 for 21 jd', 25, 5, 0, 1, 48, '2025-04-12 19:02:29'),
(22, 7, 14, 18, '1', 'Product_Images/Picture12.jpg', 'handmade cups \r\n\r\n', 5, 0, 0, 1, 15, '2025-04-12 19:06:59'),
(23, 7, 14, 18, '2', 'Product_Images/Picture13.jpg', 'Couples cups with flower\r\n8 jd \r\n', 8, 0, 0, 1, 20, '2025-04-12 19:07:39'),
(24, 7, 14, 18, '3', 'Product_Images/Picture15.jpg', 'big cup \r\n', 6, 0, 0, 1, 17, '2025-04-12 19:08:08'),
(25, 7, 14, 18, 'Ramadan cups ', 'Product_Images/Picture14.jpg', '6 for 12', 12, 0, 0, 1, 20, '2025-04-12 19:08:51'),
(26, 8, 18, 19, 'Watermelon scarf ', 'Product_Images/water.jpg', 'Watermelon scarf ', 20, 0, 0, 1, 20, '2025-04-12 19:12:58'),
(27, 8, 18, 19, 'Big Hearts scarf', 'Product_Images/biggheart.jpg', 'Big Hearts scarf', 17, 0, 0, 1, 20, '2025-04-12 19:13:28'),
(28, 8, 18, 19, 'Small Hearts scarf', 'Product_Images/heart color.jpg', 'Small Hearts scarf', 14, 0, 0, 1, 20, '2025-04-12 19:13:56'),
(29, 8, 18, 19, 'flower scarf ', 'Product_Images/flowerrr.jpg', 'flower scarf ', 17, 0, 0, 1, 20, '2025-04-12 19:14:28'),
(30, 8, 18, 20, 'Embroidery Big ', 'Product_Images/Picture22.jpg', 'Embroidery Big ', 8, 0, 0, 1, 50, '2025-04-12 19:17:45'),
(31, 8, 18, 20, 'Embroidery meduim', 'Product_Images/Picture23.jpg', 'Embroidery meduim', 6, 0, 0, 1, 50, '2025-04-12 19:18:14'),
(32, 8, 18, 20, 'embroidery small ', 'Product_Images/Picture25.jpg', 'embroidery small ', 5, 0, 0, 1, 50, '2025-04-12 19:18:43'),
(33, 5, 20, 21, 'pops ', 'Product_Images/sweets.jpg', '15 pop for 5', 5, 0, 0, 1, 100, '2025-04-12 19:24:57'),
(34, 5, 20, 21, 'Ramadan Box ', 'Product_Images/Picture28.jpg', '2 boxes for 15', 15, 5, 0, 1, 29, '2025-04-12 19:25:53'),
(35, 5, 20, 21, 'Fruit tarts', 'Product_Images/Picture31.jpg', '20 for 12 jd ', 12, 0, 0, 1, 30, '2025-04-12 19:26:46'),
(36, 5, 17, 21, 'brownies ', 'Product_Images/Picture30.jpg', '25 pieces for 7 jd', 7, 0, 0, 1, 200, '2025-04-12 19:27:38'),
(37, 5, 16, 21, 'cookies', 'Product_Images/Picture32.jpg', '40 pc for 10', 10, 0, 0, 1, 300, '2025-04-12 19:28:18'),
(38, 5, 20, 21, 'protien bars ', 'Product_Images/Picture29.jpg', '1 for .8', 0.8, 0, 0, 1, 300, '2025-04-12 19:29:22'),
(39, 5, 21, 22, 'cheesecake slices', 'Product_Images/Picture39.jpg', '1 pc for 3', 3, 0, 0, 1, 40, '2025-04-12 19:33:15'),
(40, 5, 21, 22, 'Mixed berries ', 'Product_Images/Picture40.jpg', 'Mixed berries cheesecake ', 28, 0, 0, 1, 20, '2025-04-12 19:33:48'),
(41, 5, 21, 22, 'cheesecake bites ', 'Product_Images/Picture36.jpg', '20 pieces for 10 jd ', 10, 0, 0, 1, 50, '2025-04-12 19:34:27'),
(42, 5, 21, 22, 'sambusa ', 'Product_Images/Picture42.jpg', '20 pc for 10 jd ', 10, 0, 0, 1, 200, '2025-04-12 19:35:15'),
(43, 5, 21, 22, 'Tiramisu ', 'Product_Images/Picture38.jpg', 'Tiramisu  cake', 28, 0, 0, 1, 10, '2025-04-12 19:35:51'),
(44, 5, 21, 22, 'classic cheescake ', 'Product_Images/Picture35.jpg', 'classic cheescake ', 24, 0, 0, 1, 10, '2025-04-12 19:36:23'),
(45, 8, 18, 23, 'Candle Bouquet', 'Product_Images/Picture43.jpg', 'Candle Bouquet', 20, 0, 0, 1, 15, '2025-04-12 19:39:30'),
(46, 8, 18, 23, 'Candle Bouquet', 'Product_Images/Picture44.jpg', 'Candle Bouquet', 18, 0, 0, 1, 20, '2025-04-12 19:40:00'),
(47, 8, 18, 23, 'Candle Bouquet', 'Product_Images/Picture45.jpg', 'Candle Bouquet', 18, 0, 0, 1, 14, '2025-04-12 19:40:23'),
(48, 7, 22, 25, 'Soap Box ', 'Product_Images/Picture53.jpg', 'Soap Box ', 20, 0, 0, 1, 40, '2025-04-12 19:47:26'),
(49, 7, 22, 25, 'Natural Lemon Soap ', 'Product_Images/Picture54.jpg', 'Natural Lemon Soap ', 4, 0, 0, 1, 40, '2025-04-12 19:47:52'),
(50, 7, 22, 25, 'Vanilla Soap ', 'Product_Images/Picture56.jpg', 'Vanilla Soap ', 4, 0, 0, 1, 39, '2025-04-12 19:48:37'),
(51, 7, 22, 25, 'Gift set ', 'Product_Images/Picture55.jpg', 'Gift set ', 12, 0, 0, 1, 40, '2025-04-12 19:49:08'),
(52, 5, 20, 26, 'Covered Strawberries box', 'Product_Images/Picture60.jpg', 'Covered Strawberries box', 12, 0, 0, 1, 50, '2025-04-12 19:53:14'),
(53, 5, 20, 26, 'Covered Dates box', 'Product_Images/Picture61.jpg', 'Covered Dates box', 10, 0, 0, 1, 60, '2025-04-12 19:53:46'),
(54, 5, 20, 27, 'cheelush', 'Product_Images/Picture1.jpg', 'ice-cream with caramel', 3.5, 0, 0, 1, 50, '2025-04-13 13:06:02'),
(55, 5, 20, 27, 'Helwo', 'Product_Images/Picture6.jpg', 'cheesecake ice-cream', 3.5, 0, 0, 1, 50, '2025-04-13 13:09:15'),
(56, 5, 20, 27, 'pista-liciouse', 'Product_Images/Picture2.jpg', 'mixed ice cream flavors ', 3.5, 0, 0, 1, 70, '2025-04-13 13:10:39'),
(57, 5, 20, 27, 'Chocolata', 'Product_Images/Picture5.jpg', 'chocolate ice cream', 3.5, 0, 0, 1, 60, '2025-04-13 13:11:29'),
(58, 5, 20, 27, 'Gathering box ', 'Product_Images/Picture3.jpg', '10 for 15 jd', 15, 0, 0, 1, 40, '2025-04-13 13:12:30'),
(59, 5, 20, 27, 'Gathering box', 'Product_Images/Picture4.jpg', '15 for 22 jd', 22, 0, 0, 1, 80, '2025-04-13 13:13:44'),
(60, 8, 18, 28, 'philodendron_green_princess', 'Product_Images/Picture11.jpg', 'green princess', 16, 0, 0, 1, 40, '2025-04-13 13:22:11'),
(61, 8, 18, 28, 'spathiphyllum', 'Product_Images/Picture16.jpg', 'special plant', 18, 0, 0, 1, 30, '2025-04-13 13:22:59'),
(62, 8, 18, 28, 'dracaena_fragrans', 'Product_Images/Picture17.jpg', 'dracaena_fragrans', 16, 0, 0, 1, 20, '2025-04-13 13:23:46'),
(63, 8, 18, 28, 'anthurium', 'Product_Images/Picture18.jpg', 'pink anthurium ', 17, 0, 0, 1, 30, '2025-04-13 13:24:24'),
(64, 8, 18, 28, 'Home Plant', 'Product_Images/Picture19.jpg', 'Home Plant', 10, 0, 0, 1, 35, '2025-04-13 13:24:51'),
(65, 8, 18, 28, 'Home Plant', 'Product_Images/Picture20.jpg', 'yellowish Home Plant', 40, 0, 0, 1, 55, '2025-04-13 13:25:41'),
(66, 5, 16, 29, 'Bites Mix Box ', 'Product_Images/Picture30.jpg', ' Mix Box ', 12, 0, 0, 1, 100, '2025-04-13 13:37:53'),
(67, 5, 16, 29, 'Tutti Frutti ', 'Product_Images/Picture33.jpg', 'strawberries and cookies', 20, 0, 0, 1, 90, '2025-04-13 13:40:05'),
(68, 5, 16, 29, 'cookies bites box ', 'Product_Images/Picture32.jpg', 'cookies bites box ', 12, 0, 0, 1, 40, '2025-04-13 13:40:56'),
(69, 5, 16, 29, 'Brownie Party Bow', 'Product_Images/Picture34.jpg', 'big cookies ', 12, 0, 0, 1, 40, '2025-04-13 13:42:08'),
(70, 5, 16, 29, 'singular cookie ', 'Product_Images/Picture31.jpg', 'singular cookie ', 1, 0, 0, 1, 30, '2025-04-13 13:43:23'),
(71, 5, 16, 29, 'Cookies Cake ', 'Product_Images/Picture35.jpg', 'Cookies cake', 7, 0, 0, 1, 15, '2025-04-13 13:45:04'),
(72, 5, 21, 30, 'Rounded mango tiramisu ', 'Product_Images/mangooooooooo.jpg', ' mango tiramisu ', 35, 0, 0, 1, 40, '2025-04-13 13:54:24'),
(73, 5, 21, 30, 'square  tiramisu ', 'Product_Images/squreee.jpg', 'square original tiramisu ', 30, 0, 0, 1, 30, '2025-04-13 13:55:08'),
(74, 5, 21, 30, 'rectangular tiramisu ', 'Product_Images/mango tiramisso.jpg', 'rectangular white tiramisu ', 15, 0, 0, 1, 23, '2025-04-13 13:56:28'),
(75, 6, 11, 31, 'saber bracelet', 'Product_Images/صبر.png', '\"saber\" word bracelet', 15, 0, 0, 1, 12, '2025-04-13 14:10:40'),
(76, 6, 13, 31, 'Flowered Earnings', 'Product_Images/وردات.png', 'white flowers earings', 7, 0, 0, 1, 12, '2025-04-13 14:11:41'),
(77, 6, 11, 31, 'Palestine map bracelets', 'Product_Images/فلسطين الوان.png', 'Palestine map bracelets', 12, 0, 1, 1, 44, '2025-04-13 14:13:21'),
(78, 6, 12, 31, 'butterfly ring', 'Product_Images/فراشة.png', 'butterfly ring', 6, 0, 0, 1, 12, '2025-04-13 14:14:37'),
(79, 7, 14, 12, 'orange cup', 'Product_Images/Picture9.png', 'orange cup', 9, 0, 0, 1, 12, '2025-04-13 14:16:50'),
(80, 7, 14, 12, 'colorful cups', 'Product_Images/Picture1.png', 'cups', 12, 5, 1, 1, 12, '2025-04-13 14:17:52'),
(81, 7, 14, 12, 'flowers cup', 'Product_Images/Picture7.png', 'flowers cup', 7, 0, 0, 1, 12, '2025-04-13 14:20:07'),
(82, 7, 15, 12, 'colorful coasters', 'Product_Images/Picture5.png', 'colorful coasters', 11, 0, 1, 1, 12, '2025-04-13 14:21:09'),
(84, 3, 23, 9, 'kobbeh', 'Product_Images/kobbeh.png', '1 kobbeh for 1 jd ', 1, 5, 0, 1, 197, '2025-05-04 18:51:14'),
(85, 3, 23, 9, 'Yalanji', 'Product_Images/يلنجي3.png', '1 dish for 5 jds ', 5, 0, 0, 1, 400, '2025-05-04 18:52:07'),
(86, 3, 24, 9, 'Dawalli with meat', 'Product_Images/دوالي لحمة .png', 'Soft green Dawalli with lamb meat ', 10, 0, 0, 1, 100, '2025-05-04 18:56:47'),
(87, 3, 23, 9, 'Taboouleh', 'Product_Images/تبولة2.png', 'Lebanese traditional tabouleh ', 3, 0, 0, 1, 40, '2025-05-04 20:07:59'),
(88, 3, 23, 9, 'Msakhan Rolls', 'Product_Images/رولات مسخن .png', '6 pieces for 4 jds', 4, 0, 0, 1, 150, '2025-05-04 20:08:58'),
(89, 5, 16, 9, ' Circle Kaak', 'Product_Images/كعك مومز.png', 'Palestinian kaak with flour', 3, 0, 0, 1, 30, '2025-05-04 20:10:15'),
(90, 6, 11, 31, 'Bracelet (ه)', 'Product_Images/ه.png', 'سنسال حرف (ه)', 15, 0, 0, 1, 30, '2025-05-04 20:31:03'),
(91, 6, 11, 31, 'Ribbon ', 'Product_Images/ببيونة.png', 'Ribbon bracelet ', 15, 0, 0, 1, 30, '2025-05-04 20:32:12'),
(92, 6, 11, 31, 'Blue Ribbon ', 'Product_Images/زببيونة.png', 'Blue Ribbon ', 15, 0, 0, 1, 40, '2025-05-04 20:33:01'),
(93, 6, 11, 31, 'Bracelets (ي)', 'Product_Images/ي.png', 'سنسال حرف ال ي', 15, 0, 0, 1, 50, '2025-05-04 20:33:56'),
(94, 6, 12, 31, 'Music', 'Product_Images/ميوزك.png', '..', 6, 0, 0, 1, 20, '2025-05-04 20:35:08'),
(95, 6, 12, 31, 'Rock', 'Product_Images/حجرة.png', '..', 5, 0, 0, 1, 15, '2025-05-04 20:36:00'),
(96, 6, 12, 31, 'Leaves Ring', 'Product_Images/ورقة شجر.png', '..', 5, 0, 0, 1, 20, '2025-05-04 20:37:18'),
(97, 6, 13, 31, 'Stars earings', 'Product_Images/نجوم.png', '..', 4, 0, 0, 1, 16, '2025-05-04 20:38:09'),
(98, 6, 13, 31, 'Blue Rock', 'Product_Images/حجرة زرقا.png', '..', 5, 0, 0, 1, 20, '2025-05-04 20:39:19'),
(99, 5, 21, 30, 'Mango and bluberry', 'Product_Images/squuurree.jpg', 'rectangular blueberry and mango Tiramisso', 15, 0, 0, 1, 40, '2025-05-04 20:57:12'),
(100, 5, 21, 30, 'Small Tiramisso', 'Product_Images/small tiramisoo.jpg', 'small circle tiramesso', 30, 0, 0, 1, 50, '2025-05-04 20:58:05'),
(101, 8, 18, 33, 'Green planet', 'Product_Images/gp2.jpg', 'Best gift green plant', 15, 0, 0, 1, 10, '2025-05-04 21:14:51'),
(102, 8, 18, 33, 'Orchid', 'Product_Images/gp3.jpg', 'Orchid plant ', 20, 0, 0, 1, 30, '2025-05-04 21:15:57'),
(103, 8, 18, 33, 'colored plant ', 'Product_Images/gp4.jpg', '..', 18, 0, 0, 1, 40, '2025-05-04 21:16:51'),
(104, 8, 18, 33, 'Flowers', 'Product_Images/gp6.jpg', '...', 20, 0, 0, 1, 40, '2025-05-04 21:17:23'),
(106, 6, 25, 35, 'stickers', 'Product_Images/stic1.png', '6 stickers for 1 JD', 1, 0, 0, 1, 500, '2025-05-06 19:25:17'),
(107, 6, 25, 35, 'Stickers for Laptop', 'Product_Images/stic4.png', '6 stickers for 1 JD', 1, 0, 0, 1, 500, '2025-05-06 19:27:07'),
(108, 6, 25, 35, 'Stickers', 'Product_Images/stic3.png', '15 sticker for 2 JD', 2, 0, 0, 1, 400, '2025-05-06 19:33:02'),
(109, 6, 25, 35, 'Stickers', 'Product_Images/stic2.png', '.25 for each', 0.25, 0, 0, 1, 300, '2025-05-06 19:36:00'),
(110, 5, 21, 36, 'Red cake ', 'Product_Images/bm2.jpg', '14 cm for 6 JD', 6, 0, 1, 1, 20, '2025-05-06 19:46:00'),
(111, 5, 21, 36, 'Cake with Cupcake', 'Product_Images/bm1.jpg', '14cm with 2 cupcakes for 10 jd', 10, 0, 0, 1, 50, '2025-05-06 19:48:52'),
(112, 5, 21, 36, 'Cake ', 'Product_Images/bm5.jpg', '22cm for 15 jd', 15, 0, 0, 1, 20, '2025-05-06 19:50:10'),
(113, 5, 21, 36, 'Cake', 'Product_Images/bm6.jpg', '17cm for 8 jd ', 8, 0, 0, 1, 25, '2025-05-06 19:50:52'),
(114, 5, 21, 36, 'Cupcake', 'Product_Images/bm3.jpg', 'Flavored Cupcake ', 1.5, 0, 0, 1, 50, '2025-05-06 19:52:17'),
(115, 3, 23, 37, 'Mini Pastries', 'Product_Images/m3.jpg', '20 for 6 jd\r\n', 6, 0, 0, 1, 39, '2025-05-06 19:57:37'),
(116, 5, 20, 37, 'Cinnamon Rolls', 'Product_Images/m4.jpg', '12 for 8 jd ', 8, 0, 0, 1, 50, '2025-05-06 19:58:30'),
(117, 5, 17, 37, 'Brownie ', 'Product_Images/m5.jpg', '12 for 15 jd ', 15, 0, 0, 1, 60, '2025-05-06 19:59:08'),
(118, 5, 20, 37, 'Mix Box', 'Product_Images/m6.jpg', 'Cookies and Brownies', 12, 0, 0, 1, 70, '2025-05-06 19:59:49'),
(119, 5, 20, 37, 'Lotus balls ', 'Product_Images/m2.jpg', '25 for 10 jd ', 10, 0, 0, 1, 69, '2025-05-06 20:01:23'),
(120, 8, 18, 38, 'Gift Box', 'Product_Images/s6.jpg', 'Mug , Notebook ,Wallet  ', 5, 2, 0, 1, 59, '2025-05-06 20:07:50'),
(121, 8, 18, 38, 'Mom Gift Box', 'Product_Images/s4.jpg', 'Gypsum incense burner set', 5, 0, 0, 1, 50, '2025-05-06 20:08:41'),
(122, 8, 18, 38, 'Winter box', 'Product_Images/s5.jpg', 'Cup , Scarf , 3 in 1 coffee', 6, 0, 0, 1, 50, '2025-05-06 20:13:43'),
(123, 8, 18, 38, 'Ramadan package ', 'Product_Images/s2.jpg', 'Quraan , colorful coaster , prayer book , star plate ', 5, 0, 0, 1, 40, '2025-05-06 20:15:53'),
(124, 8, 18, 38, 'Blue package ', 'Product_Images/s3.jpg', 'Mug , colorful coaster , photo frame , candle', 5, 0, 0, 1, 40, '2025-05-06 20:17:15'),
(125, 5, 20, 39, 'Mini tarts ', 'Product_Images/l2.jpg', '50 pieces for 14 jd \r\nmulti flavor (strawberry chocolate , kinder , pistachio )', 14, 0, 0, 1, 78, '2025-05-06 20:33:15'),
(126, 5, 20, 39, 'Eid Cookies ', 'Product_Images/l3.jpg', 'Cookies for Eid drawings ', 13, 0, 0, 1, 500, '2025-05-06 20:34:12'),
(127, 5, 20, 39, 'Joozyeh', 'Product_Images/l4.jpg', '50 pieces for 13 jd ', 13, 0, 0, 1, 400, '2025-05-06 20:35:42'),
(128, 5, 20, 39, 'Covered Dates ', 'Product_Images/l5.jpg', '1 KG for 13 jd ', 13, 0, 0, 1, 400, '2025-05-06 20:36:21'),
(129, 5, 21, 40, 'Cupcake', 'Product_Images/b2.jpg', '6 for 10 jd ', 10, 0, 0, 1, 50, '2025-05-06 20:41:54'),
(130, 5, 21, 40, 'Cheesecake Balls ', 'Product_Images/b7.jpg', '16 for 13 ', 13, 0, 0, 1, 200, '2025-05-06 20:43:30'),
(131, 5, 16, 40, 'Customized Cookies ', 'Product_Images/b3.jpg', '50 for 0.65 each ', 0.65, 0, 1, 1, 500, '2025-05-06 20:45:29'),
(132, 5, 21, 40, 'Mini Cupcakes ', 'Product_Images/b6.jpg', '20 for 13', 13, 0, 0, 1, 200, '2025-05-06 20:46:33'),
(133, 5, 20, 40, 'Eclairs ', 'Product_Images/b5.jpg', '20 for 13', 13, 0, 0, 1, 60, '2025-05-06 20:47:15'),
(134, 5, 20, 40, 'Tarts ', 'Product_Images/b4.jpg', '20 for 13', 13, 0, 0, 1, 150, '2025-05-06 20:47:59'),
(135, 5, 16, 41, 'Mini Cookies ', 'Product_Images/f2.jpg', '30 for 10 jd ', 10, 0, 0, 1, 500, '2025-05-06 20:53:42'),
(136, 5, 20, 41, 'Covered Dates ', 'Product_Images/f3.jpg', 'Dates covered with (strawberry ,pistachio ,chocolate )', 10, 0, 0, 1, 400, '2025-05-06 20:55:22'),
(137, 5, 16, 41, 'Caramel chocolate chip cookies', 'Product_Images/f5.jpg', '9 for 3 jd ', 3, 0, 0, 1, 400, '2025-05-06 20:56:00'),
(138, 5, 16, 41, 'Eid Cookies ', 'Product_Images/f4.jpg', 'Cookies designed for Eid ', 16, 0, 0, 1, 500, '2025-05-06 20:57:22'),
(139, 3, 23, 42, 'Sliders ', 'Product_Images/sr3.jpg', '10 for 7jd', 7, 5, 0, 1, 59, '2025-05-06 21:08:52'),
(140, 3, 23, 42, 'kobbeh', 'Product_Images/sr6.png', '10 for 5 jd', 5, 0, 0, 1, 50, '2025-05-06 21:10:59'),
(141, 3, 23, 42, 'Mini Pastries', 'Product_Images/sr8.png', '100 for 20\r\n(potato , zaatar , hotdog,..)', 20, 0, 0, 1, 400, '2025-05-06 21:19:43'),
(142, 3, 23, 42, 'Yalanji', 'Product_Images/sr7.png', '1KG for 7', 7, 0, 0, 1, 600, '2025-05-06 21:20:17'),
(147, 5, 16, 44, 'Baraa’s Cookies', 'Product_Images/Pro11gif.gif', 'Cookies Bites Filled with chocolate', 12, 0, 0, 1, 20, '2025-05-08 11:33:24'),
(148, 5, 16, 44, 'Baraa’s Cookies', 'Product_Images/adad.gif', 'Pistachio Cheesecake', 2, 0, 0, 1, 12, '2025-05-08 11:36:28'),
(149, 5, 17, 44, 'Bookies', 'Product_Images/wwww.gif', 'Cake Dough filled with chocolate chips and cream', 4, 0, 0, 1, 25, '2025-05-08 11:39:54'),
(150, 5, 16, 44, 'Baraa’s Cookies', 'Product_Images/ffff.gif', 'Pistachio Cookies', 2.5, 0, 0, 1, 11, '2025-05-08 11:42:39'),
(151, 5, 21, 44, 'Mixed Berries Cheesecake', 'Product_Images/wew.gif', 'Cheesecake covered with cream and mix berries', 20, 0, 0, 1, 33, '2025-05-08 11:46:48'),
(152, 6, 11, 45, 'Necklace with bracelet ', 'Product_Images/llll.gif', 'Nature’s touch, handcrafted with love', 35, 0, 0, 1, 22, '2025-05-08 11:56:42'),
(153, 6, 11, 45, 'Phone Cover with Bracelet ', 'Product_Images/hhhh.gif', 'all in the details', 20, 0, 0, 1, 33, '2025-05-08 11:59:13'),
(154, 6, 11, 45, 'Bracelets Package', 'Product_Images/aaa.gif', 'stacked and styled', 12, 0, 0, 1, 11, '2025-05-08 12:01:26'),
(155, 6, 11, 45, 'Customized Necklace', 'Product_Images/llll.gif', 'Necklace holding your name', 18, 0, 0, 1, 22, '2025-05-08 12:06:18'),
(156, 3, 23, 46, 'kobbe', 'Product_Images/axa.gif', 'Kobbe filled with Meat', 1, 0, 0, 1, 30, '2025-05-08 12:18:56'),
(157, 3, 23, 46, 'Spring Rolls', 'Product_Images/eee.gif', 'Filled with fresh vegetables', 0.75, 0, 0, 1, 17, '2025-05-08 12:20:57'),
(158, 3, 23, 46, 'Sambosak', 'Product_Images/as.gif', 'Filled with cheese or potato', 1, 0, 0, 1, 12, '2025-05-08 12:23:06'),
(159, 3, 23, 46, 'Potato Kobbe', 'Product_Images/RGRG.gif', 'Crunchy fried Potato balls', 0.5, 0, 0, 1, 12, '2025-05-08 12:26:27'),
(160, 3, 23, 47, 'Corn with mushroom salad', 'Product_Images/Picture9.gif', 'Corn salad with mushrooms made with love', 7, 0, 0, 1, 12, '2025-05-08 12:41:11'),
(161, 3, 23, 47, 'yalanji', 'Product_Images/ada.gif', 'Fresh daily made yalanji', 11, 0, 0, 1, 21, '2025-05-08 12:43:35'),
(162, 3, 23, 47, 'Za’atar Salty Cake', 'Product_Images/ddd.gif', 'Salty cake made from fresh Za’atar', 9, 0, 0, 1, 22, '2025-05-08 12:44:54'),
(163, 6, 11, 48, 'Flower Necklace', 'Product_Images/gggg.gif', 'Sun Flower Necklace', 25, 0, 0, 1, 12, '2025-05-08 12:54:06'),
(164, 6, 11, 48, 'Lock Necklace', 'Product_Images/sass.gif', 'Lock necklace with Versace chains’', 35, 0, 0, 1, 22, '2025-05-08 12:56:40'),
(165, 6, 10, 48, 'Luxury Bracelet', 'Product_Images/rerw.gif', 'Luxury bracelet Turkish design', 40, 0, 0, 1, 22, '2025-05-08 12:58:00'),
(166, 6, 12, 48, 'Heart Ringed Bracelet ', 'Product_Images/ringedd.gif', 'Gold Ring Braclet', 25, 0, 0, 1, 40, '2025-05-09 21:56:50'),
(167, 6, 12, 48, 'Ring Braclet', 'Product_Images/rringeees.gif', 'Trendy Ring Bracelet ', 25, 0, 0, 1, 30, '2025-05-09 21:57:28'),
(168, 8, 18, 49, 'Men’s gift box', 'Product_Images/g1.png', 'men\'s gift box ', 27, 0, 0, 1, 22, '2025-05-11 14:37:15'),
(169, 8, 18, 49, 'Chocolate gift box', 'Product_Images/g2.png', 'Gift box consists of your choice of chocolate ', 23, 0, 0, 1, 31, '2025-05-11 14:38:08'),
(170, 8, 18, 49, 'New born gift box', 'Product_Images/g3.png', 'The perfect gift for you baby', 24, 0, 0, 1, 22, '2025-05-11 14:38:47'),
(171, 8, 18, 49, 'Bride Gift Box', 'Product_Images/g4.png', 'The perfect gift for your bride friend', 26, 0, 0, 1, 22, '2025-05-11 14:39:31'),
(172, 8, 18, 49, 'Winter Gift Box', 'Product_Images/g5.png', 'The warmth gif box ', 21, 0, 0, 1, 22, '2025-05-11 14:40:19'),
(173, 7, 14, 50, 'Steel Bottles', 'Product_Images/dDS.gif', 'A Bottle that keeps your water cold', 20, 0, 0, 1, 22, '2025-05-11 14:48:10'),
(174, 7, 14, 50, '30 OZ Cup', 'Product_Images/O3.gif', '30 OZ cup for day use', 15, 0, 0, 1, 33, '2025-05-11 14:48:50'),
(175, 7, 14, 50, '40 OZ cup', 'Product_Images/O4.gif', '40 OZ cup for day use', 18, 0, 0, 1, 12, '2025-05-11 14:49:58'),
(176, 9, 26, 51, 'Racing Polo Shirts', 'Product_Images/WRWE.png', 'Racing Polo shirts for your favorite teams', 15, 0, 0, 1, 33, '2025-05-11 15:03:43'),
(177, 9, 26, 51, 'Sport Jacket', 'Product_Images/PS2.gif', 'Nike sport jacket', 18, 0, 0, 1, 44, '2025-05-11 15:04:16'),
(178, 9, 27, 51, 'Racing Caps', 'Product_Images/PS3.png', 'Racing cap for your favorite team', 10, 0, 0, 1, 22, '2025-05-11 15:05:17'),
(179, 9, 29, 51, 'Racing Waterproof Jacket', 'Product_Images/PS4.gif', 'Waterproof Red bull Jacket', 30, 0, 0, 1, 21, '2025-05-11 15:06:33'),
(180, 9, 29, 51, 'F1 Ferrari Jacket', 'Product_Images/PS5.gif', 'Ferrari Heavy Jacket', 35, 0, 0, 1, 25, '2025-05-11 15:07:30'),
(181, 6, 30, 52, 'Pet Hair Remover Grooming Glove', 'Product_Images/e3.gif', 'Pet Hair Remover Grooming Glove', 5, 0, 0, 1, 44, '2025-05-11 15:19:09'),
(182, 6, 30, 52, 'Bathing Dog Shower Tool', 'Product_Images/e4.gif', 'Bathing Dog Shower Tool', 9, 0, 0, 1, 44, '2025-05-11 15:19:43'),
(183, 6, 30, 52, 'Dog Nylon Leash', 'Product_Images/e5.gif', 'Nylon Rope Dog Leash with Traffic Handle', 10, 0, 0, 1, 44, '2025-05-11 15:20:14'),
(184, 6, 30, 52, 'Dog Water Feeder', 'Product_Images/e6.gif', 'Dog Water Feeder', 9, 0, 0, 1, 22, '2025-05-11 15:20:55'),
(185, 6, 30, 52, 'LED Retractable Leash', 'Product_Images/e7.gif', 'LED Retractable Leash', 15, 0, 0, 1, 22, '2025-05-11 15:21:59'),
(186, 6, 25, 53, 'Mobile Back Stamps', 'Product_Images/w2.gif', 'Stamps of your choice', 4, 0, 0, 1, 22, '2025-05-11 15:29:20'),
(187, 6, 31, 53, 'Plastic Back Cover', 'Product_Images/w3.gif', 'Write your name on your phone', 9, 0, 0, 1, 22, '2025-05-11 15:31:28'),
(188, 6, 31, 53, 'Car Phone Holder', 'Product_Images/w4.gif', 'Use your phone without getting tickets', 12, 0, 0, 1, 22, '2025-05-11 15:32:29'),
(189, 6, 31, 53, 'Back Cover Wallet', 'Product_Images/w5.gif', 'Your phone can be your wallet too', 10, 0, 0, 1, 23, '2025-05-11 15:34:32'),
(190, 3, 32, 54, 'Apricot Home Made Jam', 'Product_Images/s1.gif', 'Apricot Home Made Jam', 10, 0, 0, 1, 33, '2025-05-11 15:42:31'),
(191, 3, 32, 54, 'Berries Jam', 'Product_Images/s2.gif', 'Berries Jam ', 10, 0, 0, 1, 33, '2025-05-11 15:43:00'),
(192, 3, 32, 54, 'Orange Flavor', 'Product_Images/s3.gif', 'Orange Flavor', 10, 0, 0, 1, 33, '2025-05-11 15:43:27'),
(193, 3, 32, 54, 'Natural Home Made Hot Pepper Jam', 'Product_Images/s4.gif', 'Natural Home Made Hot Pepper Jam', 10, 0, 0, 1, 22, '2025-05-11 15:44:09'),
(194, 7, 15, 55, 'Clothes Basket', 'Product_Images/w3.gif', 'Perfect Clothes Basket', 15, 0, 0, 1, 22, '2025-05-11 15:52:38'),
(195, 8, 18, 55, 'Hand Made Plates', 'Product_Images/w4.gif', 'Perfect Hand Made Plates', 20, 0, 0, 1, 20, '2025-05-11 15:53:30'),
(196, 8, 18, 55, 'Handmade cochins', 'Product_Images/w6.gif', 'Unique Handmade cochins', 12, 0, 0, 1, 22, '2025-05-11 15:54:23'),
(197, 8, 18, 55, 'Handmade Bag', 'Product_Images/w77.gif', 'Beautiful Handmade Bag', 17, 0, 0, 1, 17, '2025-05-11 16:00:39'),
(198, 8, 18, 55, 'Door Bell Medal', 'Product_Images/d33.gif', 'Perfect Door Bell Medal', 13, 0, 0, 1, 22, '2025-05-11 16:01:41'),
(199, 8, 18, 56, 'Banana Plant', 'Product_Images/g2.gif', 'Banana Plant', 22, 0, 0, 1, 55, '2025-05-11 16:12:29'),
(200, 8, 18, 56, 'Indoor BamBoo Plant', 'Product_Images/g3.gif', 'Indoor BamBoo Plant', 15, 0, 0, 1, 67, '2025-05-11 16:13:19'),
(201, 8, 18, 56, 'Outdoor Décor Plant', 'Product_Images/g4.gif', 'Outdoor Décor Plant', 17, 0, 0, 1, 66, '2025-05-11 16:14:03'),
(202, 8, 18, 56, 'Office Plant', 'Product_Images/g6.gif', 'Office Plant', 20, 0, 0, 1, 66, '2025-05-11 16:14:52');

-- --------------------------------------------------------

--
-- Table structure for table `product_feedbacks`
--

CREATE TABLE `product_feedbacks` (
  `id` int(11) NOT NULL,
  `buyer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `feedback` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `product_feedbacks`
--

INSERT INTO `product_feedbacks` (`id`, `buyer_id`, `product_id`, `feedback`, `created_at`) VALUES
(3, 14, 8, '', '2025-04-05 20:28:37');

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `image` varchar(250) NOT NULL,
  `active` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `image`, `active`, `created_at`) VALUES
(5, 89, 'Product_Images/يلنجي .png', 1, '2025-05-04 20:12:04'),
(6, 89, 'Product_Images/يلنجي2.png', 1, '2025-05-04 20:12:21'),
(7, 89, 'Product_Images/يلنجي3.png', 1, '2025-05-04 20:12:30');

-- --------------------------------------------------------

--
-- Table structure for table `product_options`
--

CREATE TABLE `product_options` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `value` varchar(250) NOT NULL,
  `active` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `product_options`
--

INSERT INTO `product_options` (`id`, `product_id`, `name`, `value`, `active`, `created_at`) VALUES
(12, 80, 'color', 'Red', 1, '2025-04-13 14:17:52'),
(13, 80, 'color', 'Blue', 1, '2025-04-13 14:17:52'),
(14, 80, 'size', 'M', 1, '2025-04-13 14:17:52'),
(15, 82, 'color', 'Red', 1, '2025-04-13 14:21:09'),
(16, 82, 'size', 'M', 1, '2025-04-13 14:21:09'),
(17, 82, 'size', 'S', 1, '2025-04-13 14:21:09'),
(18, 110, 'color', 'Red', 1, '2025-05-06 19:46:00'),
(19, 110, 'color', 'Blue', 1, '2025-05-06 19:46:00'),
(20, 110, 'size', 'S', 1, '2025-05-06 19:46:00'),
(21, 131, 'color', 'Red', 1, '2025-05-06 20:45:29'),
(22, 131, 'color', 'Blue', 1, '2025-05-06 20:45:29'),
(23, 131, 'size', 'S', 1, '2025-05-06 20:45:29');

-- --------------------------------------------------------

--
-- Table structure for table `product_rates`
--

CREATE TABLE `product_rates` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `buyer_id` int(11) NOT NULL,
  `rate` double NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `product_rates`
--

INSERT INTO `product_rates` (`id`, `product_id`, `buyer_id`, `rate`, `created_at`) VALUES
(2, 8, 14, 4, '2025-05-03 15:14:43'),
(3, 21, 14, 5, '2025-05-04 14:34:09'),
(4, 18, 32, 4, '2025-05-04 16:55:10'),
(5, 80, 32, 5, '2025-05-04 16:56:29'),
(6, 34, 34, 5, '2025-05-04 21:26:13'),
(7, 120, 14, 2, '2025-05-07 19:20:28'),
(8, 84, 14, 5, '2025-05-08 10:08:59'),
(9, 139, 14, 5, '2025-05-22 21:01:58');

-- --------------------------------------------------------

--
-- Table structure for table `seller_feedbacks`
--

CREATE TABLE `seller_feedbacks` (
  `id` int(11) NOT NULL,
  `buyer_id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `feedback` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `seller_rate`
--

CREATE TABLE `seller_rate` (
  `id` int(11) NOT NULL,
  `buyer_id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `rate` double NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `seller_rate`
--

INSERT INTO `seller_rate` (`id`, `buyer_id`, `seller_id`, `rate`, `created_at`) VALUES
(4, 14, 13, 4, '2025-05-03 15:14:40'),
(5, 32, 17, 5, '2025-05-04 16:55:05'),
(6, 32, 12, 4, '2025-05-04 16:56:24'),
(7, 34, 21, 4, '2025-05-04 21:26:08'),
(8, 14, 38, 5, '2025-05-07 19:20:17'),
(9, 14, 9, 4, '2025-05-08 10:08:52'),
(10, 14, 42, 5, '2025-05-22 21:01:48');

-- --------------------------------------------------------

--
-- Table structure for table `seller_subscriptions`
--

CREATE TABLE `seller_subscriptions` (
  `id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `subscription_type` varchar(250) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `price` double NOT NULL,
  `active` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `seller_subscriptions`
--

INSERT INTO `seller_subscriptions` (`id`, `seller_id`, `subscription_type`, `start_date`, `end_date`, `price`, `active`, `created_at`) VALUES
(3, 13, '3 Months Contract (150 JOD)', '2025-04-06 00:00:00', '2025-07-05 00:00:00', 150, 1, '2025-04-05 20:16:59'),
(4, 16, '6 Months Contract (300 JOD)', '2025-04-21 00:00:00', '2025-10-18 00:00:00', 300, 1, '2025-04-12 18:31:34'),
(5, 17, '1 Months Contract (65 JOD)', '2025-04-30 00:00:00', '2025-05-30 00:00:00', 65, 1, '2025-04-12 18:50:34'),
(6, 18, '3 Months Contract (150 JOD)', '2025-04-28 00:00:00', '2025-07-27 00:00:00', 150, 1, '2025-04-12 19:05:10'),
(7, 19, '3 Months Contract (150 JOD)', '2025-04-22 00:00:00', '2025-07-21 00:00:00', 150, 1, '2025-04-12 19:10:43'),
(8, 20, '6 Months Contract (300 JOD)', '2025-04-24 00:00:00', '2025-10-21 00:00:00', 300, 1, '2025-04-12 19:15:45'),
(9, 21, '6 Months Contract (300 JOD)', '2025-04-30 00:00:00', '2025-10-27 00:00:00', 300, 1, '2025-04-12 19:20:48'),
(10, 22, '3 Months Contract (150 JOD)', '2025-04-30 00:00:00', '2025-07-29 00:00:00', 150, 1, '2025-04-12 19:30:42'),
(11, 23, '3 Months Contract (150 JOD)', '2025-04-24 00:00:00', '2025-07-23 00:00:00', 150, 1, '2025-04-12 19:38:37'),
(13, 25, '1 Months Contract (65 JOD)', '2025-04-27 00:00:00', '2025-05-27 00:00:00', 65, 1, '2025-04-12 19:45:33'),
(14, 26, '1 Months Contract (65 JOD)', '2025-04-26 00:00:00', '2025-05-26 00:00:00', 65, 1, '2025-04-12 19:52:08'),
(15, 27, '3 Months Contract (150 JOD)', '2025-04-29 00:00:00', '2025-07-28 00:00:00', 150, 1, '2025-04-13 13:04:41'),
(16, 28, '6 Months Contract (300 JOD)', '2025-04-17 00:00:00', '2025-10-14 00:00:00', 300, 1, '2025-04-13 13:18:33'),
(17, 29, '3 Months Contract (150 JOD)', '2025-04-29 00:00:00', '2025-07-28 00:00:00', 150, 1, '2025-04-13 13:34:50'),
(18, 30, '6 Months Contract (300 JOD)', '2025-04-23 00:00:00', '2025-10-20 00:00:00', 300, 1, '2025-04-13 13:50:51'),
(19, 31, '3 Months Contract (150 JOD)', '2025-04-24 00:00:00', '2025-07-23 00:00:00', 150, 1, '2025-04-13 14:04:01'),
(20, 33, '6 Months Contract (300 JOD)', '2025-05-20 00:00:00', '2025-11-16 00:00:00', 300, 1, '2025-05-04 21:07:52'),
(21, 35, '6 Months Contract (300 JOD)', '2025-05-29 00:00:00', '2025-11-25 00:00:00', 300, 1, '2025-05-06 19:00:52'),
(22, 36, '3 Months Contract (150 JOD)', '2025-05-21 00:00:00', '2025-08-19 00:00:00', 150, 1, '2025-05-06 19:38:17'),
(23, 37, '3 Months Contract (150 JOD)', '2025-05-14 00:00:00', '2025-08-12 00:00:00', 150, 1, '2025-05-06 19:54:29'),
(24, 38, '3 Months Contract (150 JOD)', '2025-05-31 00:00:00', '2025-08-29 00:00:00', 150, 1, '2025-05-06 20:03:44'),
(25, 39, '3 Months Contract (150 JOD)', '2025-05-17 00:00:00', '2025-08-15 00:00:00', 150, 1, '2025-05-06 20:31:00'),
(26, 40, '6 Months Contract (300 JOD)', '2025-05-15 00:00:00', '2025-11-11 00:00:00', 300, 1, '2025-05-06 20:38:28'),
(27, 41, '1 Months Contract (65 JOD)', '2025-05-08 00:00:00', '2025-06-07 00:00:00', 65, 1, '2025-05-06 20:51:55'),
(28, 42, '6 Months Contract (300 JOD)', '2025-05-17 00:00:00', '2025-11-13 00:00:00', 300, 1, '2025-05-06 21:00:12'),
(30, 44, '3 Months Contract (150 JOD)', '2025-05-30 00:00:00', '2025-08-28 00:00:00', 150, 1, '2025-05-08 11:26:07'),
(31, 45, '3 Months Contract (150 JOD)', '2025-05-15 00:00:00', '2025-08-13 00:00:00', 150, 1, '2025-05-08 11:52:51'),
(32, 46, '6 Months Contract (300 JOD)', '2025-05-29 00:00:00', '2025-11-25 00:00:00', 300, 1, '2025-05-08 12:12:51'),
(33, 47, '6 Months Contract (300 JOD)', '2025-05-27 00:00:00', '2025-11-23 00:00:00', 300, 1, '2025-05-08 12:32:36'),
(34, 48, '6 Months Contract (300 JOD)', '2025-05-29 00:00:00', '2025-11-25 00:00:00', 300, 1, '2025-05-08 12:50:27'),
(35, 49, '3 Months Contract (150 JOD)', '2025-05-22 00:00:00', '2025-08-20 00:00:00', 150, 1, '2025-05-11 14:34:49'),
(36, 50, '3 Months Contract (150 JOD)', '2025-05-22 00:00:00', '2025-08-20 00:00:00', 150, 1, '2025-05-11 14:47:00'),
(37, 51, '3 Months Contract (150 JOD)', '2025-05-24 00:00:00', '2025-08-22 00:00:00', 150, 1, '2025-05-11 14:56:45'),
(38, 52, '3 Months Contract (150 JOD)', '2025-05-22 00:00:00', '2025-08-20 00:00:00', 150, 1, '2025-05-11 15:15:56'),
(39, 53, '6 Months Contract (300 JOD)', '2025-05-30 00:00:00', '2025-11-26 00:00:00', 300, 1, '2025-05-11 15:27:01'),
(40, 54, '3 Months Contract (150 JOD)', '2025-05-15 00:00:00', '2025-08-13 00:00:00', 150, 1, '2025-05-11 15:40:02'),
(41, 55, '3 Months Contract (150 JOD)', '2025-05-31 00:00:00', '2025-08-29 00:00:00', 150, 1, '2025-05-11 15:47:24'),
(42, 56, '3 Months Contract (150 JOD)', '2025-05-24 00:00:00', '2025-08-22 00:00:00', 150, 1, '2025-05-11 16:06:51');

-- --------------------------------------------------------

--
-- Table structure for table `statuses`
--

CREATE TABLE `statuses` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `statuses`
--

INSERT INTO `statuses` (`id`, `name`) VALUES
(1, 'Pending'),
(2, 'Delivering'),
(3, 'Delivered'),
(4, 'Canceled');

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `image` varchar(250) NOT NULL,
  `active` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `category_id`, `name`, `image`, `active`, `created_at`) VALUES
(6, 4, 'mix things', 'Categories_Images/appetizer1.jpg', 1, '2025-03-24 18:11:10'),
(7, 4, 'العيد', 'Categories_Images/', 1, '2025-03-24 18:24:56'),
(10, 6, 'custom made ', 'Categories_Images/Picture5.png', 1, '2025-03-24 20:34:19'),
(11, 6, 'Necklace', 'Categories_Images/ه.png', 1, '2025-03-24 20:37:40'),
(12, 6, 'rings', 'Categories_Images/صخرة.png', 1, '2025-03-24 20:39:57'),
(13, 6, 'Earings', 'Categories_Images/غيوم.png', 1, '2025-03-24 20:50:14'),
(14, 7, 'cups', 'Categories_Images/Picture9.png', 1, '2025-03-26 19:09:50'),
(15, 7, 'coasters', 'Categories_Images/Picture5.png', 1, '2025-03-26 19:10:04'),
(16, 5, 'cookies', 'Categories_Images/', 1, '2025-04-05 20:18:44'),
(17, 5, 'brownies ', 'Categories_Images/Picture2.jpg', 1, '2025-04-05 20:22:00'),
(18, 8, 'gifts', 'Categories_Images/gifts catogery.png', 1, '2025-04-12 18:53:09'),
(19, 5, 'macrone', 'Categories_Images/Picture9.jpg', 1, '2025-04-12 19:00:50'),
(20, 5, 'mix', 'Categories_Images/', 1, '2025-04-12 19:24:13'),
(21, 5, 'Cake', 'Categories_Images/Picture39.jpg', 1, '2025-04-12 19:32:19'),
(22, 7, 'soaps', 'Categories_Images/Picture57.jpg', 1, '2025-04-12 19:46:41'),
(23, 3, 'appetizers ', 'Categories_Images/', 1, '2025-05-04 18:48:58'),
(24, 3, 'main courses', 'Categories_Images/', 1, '2025-05-04 18:49:11'),
(25, 6, 'stickers', 'Categories_Images/stic3.png', 1, '2025-05-06 19:22:35'),
(26, 9, 'Blouse', 'Categories_Images/', 1, '2025-05-11 15:01:20'),
(27, 9, 'Hats', 'Categories_Images/', 1, '2025-05-11 15:01:27'),
(28, 9, 'Trouser', 'Categories_Images/', 1, '2025-05-11 15:01:35'),
(29, 9, 'jacket', 'Categories_Images/', 1, '2025-05-11 15:05:46'),
(30, 6, 'Pets accessories', 'Categories_Images/', 1, '2025-05-11 15:18:28'),
(31, 6, 'covers', 'Categories_Images/', 1, '2025-05-11 15:29:46'),
(32, 3, 'Jam', 'Categories_Images/', 1, '2025-05-11 15:41:50');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `user_type_id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `email` varchar(250) NOT NULL,
  `phone` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  `total_rate` double NOT NULL DEFAULT 0,
  `image` varchar(250) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `instagram_link` varchar(250) DEFAULT NULL,
  `active` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_type_id`, `name`, `email`, `phone`, `password`, `total_rate`, `image`, `description`, `instagram_link`, `active`, `created_at`) VALUES
(1, 1, 'Admin', 'admin@feminee.com', '1234567890', '123456789', 0, NULL, NULL, '', 1, '2024-11-03 21:07:00'),
(6, 1, 'Layan', 'tellawilayan@gmail.com', '07904214340', 'lolo123', 0, '', '', '', 1, '2025-03-24 19:39:14'),
(9, 2, 'Moms kitchen', 'momskithcen@gmail.com', '0789077448', 'momskitchen123', 4, 'Sellers_Images/مومز لوجو.jpg', 'It is store for a Mom that makes home food that will make food with love \r\n', 'https://www.instagram.com/moms_kitchen2025/', 1, '2025-03-24 17:55:39'),
(12, 2, 'Potters Family', 'pottersfamily@gmail.com', '0796633907', 'potters123', 4, 'Sellers_Images/Screenshot 2025-05-22 020437.png', 'نقوم بتنفيذ اجود أنواع الفخارللطلبات الخاصة \r\n\r\nو للانضمام إلى احدى ورشاتنا الاحترافية \r\n\r\nتواصل معنا 0796633907\r\n\r\n\r\n', 'https://www.instagram.com/pottars_family/', 1, '2025-03-26 19:11:01'),
(13, 2, 'Gees', 'gees@gmail.com', '0796254313', 'gees123', 4, 'Sellers_Images/Screenshot 2025-05-22 020723.png', 'Happiness in bites - فرحة بكل لقمة\r\n|Order one day ahead.\r\n| Delivery only.', 'https://www.instagram.com/gees.jo?igsh=bW05NXgxeDg1YjV1', 1, '2025-04-05 20:16:59'),
(14, 3, 'jory jardaneh', 'jory@gmail.com', '0792340446', 'jory123', 0, NULL, NULL, '', 1, '2025-04-05 20:26:03'),
(16, 2, 'sukuon.pottery', 'sukuon.pottery@gmail.com', '0791234563', 'sukuon123', 0, 'Sellers_Images/Screenshot 2025-05-22 020255.png', '- Your customized piece of clay \r\n- Check out Available highlight ✨\r\nللطلبات الخاصة الطلب قبل ٣ أسابيع -\r\nAmman, Jordan', 'https://www.instagram.com/sukuon.pottery?igsh=dzFwbHVrOGNpODIz', 1, '2025-04-12 18:31:34'),
(17, 2, 'Sunshop', 'Sunshop@gmail.com', '0789543263', 'suns123', 5, 'Sellers_Images/Screenshot 2025-05-22 020215.png', 'لوحات استقبال مولود حسب الطلب |Perfect Gifts|\r\n DM for Custom Orders', 'https://www.instagram.com/sunshop.jo?igsh=cGZ2c3hoYzN3YmRy', 1, '2025-04-12 18:50:34'),
(18, 2, 'handmade', 'handmade24@gmail.com', '0785438763', 'handmade123', 0, 'Sellers_Images/Screenshot 2025-05-22 020800.png', 'تجر رَسِم يَدوي على الأَكواب\r\nصُنع بكل حُب خصيصاً لك\r\n+اكثر من ١٠٠ عميل سعيد\r\nالتوصيل لكل مناطق الأردن\r\nالتوصيل مجاناً للجامعة الهاشميه', 'https://www.instagram.com/handmade24s?igsh=M2Jrb3I3dzk3ZzRx', 1, '2025-04-12 19:05:10'),
(19, 2, 'hilanaspieces', 'hilanaspieces@gmail.com', '0783456745', 'hilanaspieces123', 0, 'Sellers_Images/Screenshot 2025-05-22 021042.png', '- You can order and customize your own design .\r\n- Amman , Jordan \r\n- Delivery for all areas in Jordan\r\nOwner : @hilanasamour', 'https://www.instagram.com/hilanaspieces/', 1, '2025-04-12 19:10:43'),
(20, 2, 'mariamah', 'mariamah1604@gmail.com', '0776543456', 'mariamah123', 0, 'Sellers_Images/Screenshot 2025-05-22 020938.png', 'مَريمة\r\n•Hand made || أعمال يَدويّة\r\n•Order your own design ||أطلب تصميمك الخاص\r\n•Delivery || ‏التوصيل متاح لجميع المحافظات\r\n•Based in Jordan || ‏الأردن ', 'https://www.instagram.com/mariamah1604?igsh=MTdvdG1zM2JyeWFmZA==', 1, '2025-04-12 19:15:45'),
(21, 2, 'the.baker19', 'the.baker19@gmail.com', '0798545688', 'the.baker123', 4, 'Sellers_Images/Screenshot 2025-05-22 020858.png', 'Specialized in brownie and American cookies \r\nDM to order\r\nwe cater your needs for parties \r\nwe provide pickup and delivery\r\nAmman-Jordan #cakes', 'https://www.instagram.com/the.baker19?igsh=Zm1iNWxoMXkwZGt5', 1, '2025-04-12 19:20:48'),
(22, 2, 'basque.jo', 'basque@gmail.com', '0775543690', 'basque123', 0, 'Sellers_Images/Screenshot 2025-05-22 021309.png', 'Basque® | باسك تشيز كيك\r\nDessert Shop\r\n-ʙᴀᴋɪɴɢ ꜰᴏʀ ʏᴏᴜ ᴀ ꜰʀᴇꜱʜ ᴛᴀꜱᴛʏ ᴛʀᴇᴀᴛꜱ ᴛʜᴀᴛꜱ ʏᴏᴜ’ʟʟ ꜰᴀʟʟ ɪɴ ʟᴏᴠᴇ ᴡɪᴛʜ.!\r\n-ꜰɪʀꜱᴛ ᴋɪᴛᴄʜᴇɴ ꜱᴘᴇᴄɪᴀʟɪᴢᴇᴅ ɪɴ ᴏʀɪɢɪɴᴀʟ ᴀɴᴅ ꜰʟᴀᴠᴏʀᴇᴅ ꜱᴀɴ ꜱᴇʙᴀꜱᴛɪáɴ ᴄʜᴇᴇꜱᴇᴄᴀᴋᴇ.', 'https://www.instagram.com/basque.jo?igsh=eDVrN2w2Znd2NTBn', 1, '2025-04-12 19:30:42'),
(23, 2, 'candle._house', 'candle._house@gmail.com', '0798543658', 'candle._house123', 0, 'Sellers_Images/Screenshot 2025-05-22 021150.png', 'شمع|Candle\r\nباقات~شمع معطر\r\nاشكال متنوعة... مصنوعة يدويًا بأفضل المواد\r\nتضيف لمسة من الجمال والهدوء إلى أي مكان! \r\nللطلب قبل 48 ساعة\r\nAmman-Jordan', 'https://www.instagram.com/candle._house22?igsh=bWg2cXh2NjZyemsz', 1, '2025-04-12 19:38:37'),
(25, 2, 'thesoapbar', 'thesoapbar@gmail.com', '0798543644', 'thesoapbar123', 0, 'Sellers_Images/Screenshot 2025-05-22 021443.png', 'Beauty, cosmetic & personal care\r\nHandmade natural soaps.Made from natural oils, free from chemicals.\r\n‎صابون طبيعي مصنوع من اجود انواع الزيوت خالي من المواد الكيماوية.\r\nAmman', 'https://www.instagram.com/thesoapbar.jo/', 1, '2025-04-12 19:45:33'),
(26, 2, 'goldenbites ', 'golden.bites@gmail.com', '7996719263', 'goldenbites123', 0, 'Sellers_Images/Screenshot 2025-05-22 021524.png', 'Golden Bites | قولدن بايتس\r\nProduct/service\r\nنقدم لكم أجود التمور المحشيه والفراولة مغطسه بالشوكولا\r\nللطلب على رسائل الصفحة \r\nJordan\r\nتوصيل فوري ', 'https://www.instagram.com/golden.bitesss?igsh=dnUzeGNncmh6azY2', 1, '2025-04-12 19:52:08'),
(27, 2, 'cheelush_jo', 'cheelush@gmail.com', '0795643688', 'cheelus123', 0, 'Sellers_Images/Screenshot 2025-05-22 021657.png', 'Cheelush\r\nProduct/service\r\nFirst cheesecake stick in Jordan ???????? Students at @racajordan', 'https://www.instagram.com/cheelush_jo?igsh=MWlrN2Q3aGE1ZjIxdw==', 1, '2025-04-13 13:04:41'),
(28, 2, 'dimarveljo', 'dimarveljo@gmail.com', '0795678999', 'dimarveljo123', 0, 'Sellers_Images/Screenshot 2025-05-22 021838.png', 'Dimarvel\r\nwhere beauty meets life \r\ndelivery within 24 hours ', 'https://www.instagram.com/dimarveljo/', 1, '2025-04-13 13:18:33'),
(29, 2, 'sprinklebite', 'sprinklebite@gmail.com', '0775577643', 'sprinklebite123', 0, 'Sellers_Images/Screenshot 2025-05-22 021905.png', 'Sprinkle Bite Cookies | سبرنكل بايت كوكيز\r\nBakery\r\n| A bite of HAPPINESS\r\n| Fresh from the oven to your HEART\r\n| متوفر بجامعة البترا، شرق الاوسط، الاردنية ،الاهلية\r\n| Dm for orders', 'https://www.instagram.com/sprinklebite?igsh=aTRpcWRtNmE3YmJx', 1, '2025-04-13 13:34:50'),
(30, 2, 'theduchess.tiramisu', 'Theduchesstiram@gmail.com', '0795435356', 'Theduchesstiram123', 0, 'Sellers_Images/Screenshot 2025-05-22 022053.png', 'Tiramisu by the Duchess\r\nDessert Shop\r\nاكتشف عالم التيراميسو الفاخرة بروح إيطالية، وبنكهات لا مثيل لها\r\nالطلب قبل بيومين\r\nconcept by @ghadaq.alkhatib\r\nJo +962775771128', 'https://www.instagram.com/theduchess.tiramisu?igsh=eDVmNTdiM3AyNHFh', 1, '2025-04-13 13:50:51'),
(31, 2, 'blue_jewelryjo', 'blue_jewelryjo@gmail.com', '0795432654', 'blue_jewelryjo123', 0, 'Sellers_Images/logobb.png', 'silver 925 & Resin\r\nOrders take 3-7 days (not all)\r\n order yours DM\r\nAmman,Jordan\r\nbluejewelryjo.com\r\n', 'https://www.instagram.com/blue_jewelryjo/', 1, '2025-04-13 14:04:01'),
(32, 3, 'laith', 'laith@gmail.com', '0786543546', 'laith123', 0, NULL, NULL, '', 1, '2025-05-04 16:50:16'),
(33, 2, 'farahcreations.jo', 'farahcreations@gmail.com', '0796254316', 'farahcreations123', 0, 'Sellers_Images/Screenshot 2025-05-22 022143.png', 'Online gift shop\r\n\r\nHouseplants\r\n\r\nNesreen  Alkhateeb\r\n\r\nAmman Jordan \r\n\r\nDelivery available within 24 hours \r\n', 'https://www.instagram.com/farahcreations.jo?igsh=dXA4MXplNnJ0Nm83', 1, '2025-05-04 21:07:52'),
(34, 3, 'Amal ', 'Amalbar@gmail.com', '0796777010', 'amal123', 0, NULL, NULL, NULL, 1, '2025-05-04 21:23:31'),
(35, 2, 'Renad stickers', 'renadstickers@gmail.com', '0796462857', 'renadstickers123', 0, 'Sellers_Images/Screenshot 2025-05-22 022230.png', '', 'https://www.instagram.com/st_ick7/', 1, '2025-05-06 19:00:52'),
(36, 2, 'cakee.m', 'Cakee.m@gmail.com', '0795034723', 'cakee.m123', 0, 'Sellers_Images/Screenshot 2025-05-22 022823.png', 'ما شاء الله \r\n0795034723\r\n‏DM for orders.\r\n‏We have delivery.\r\ngo to whatsapp.\r\niwtsp.com/962795034723\r\n\r\n', 'https://www.instagram.com/cakee.m?igsh=dG45ZDN0bW5vbzQx', 1, '2025-05-06 19:38:17'),
(37, 2, 'mistika_store2021', 'mistikastore@gmail.com', '0772488657', 'mistikastore123', 0, 'Sellers_Images/Screenshot 2025-05-22 023002.png', '', 'https://www.instagram.com/mistika_store2021?igsh=NWx5ajhoZzcycjNw', 1, '2025-05-06 19:54:29'),
(38, 2, 'snalt_store', 'snalt_store@yahoo.com', '0782648866', 'snalt_store123', 5, 'Sellers_Images/Screenshot 2025-05-22 023026.png', 'snalt store♡\r\nمنتجاتنا صُنعت لأجل سعادتكم\r\n-أكثر من 700 زبون سعيد وراضي☁️\r\n-نحنُ نُوثّق الحُب على هيئَةِ بَكج...\r\nHandmade products\r\nJordan', 'https://www.instagram.com/snalt_store/', 1, '2025-05-06 20:03:44'),
(39, 2, 'Lgaima.jo', 'Lgaima.jo@yahoo.com', '0797394645', 'Lgaima.jo123', 0, 'Sellers_Images/Screenshot 2025-05-22 023105.png', 'لـــقيــمـة\r\n{گل لقيمة صنعت بگل حب}????\r\n*جوزية/تارت????\r\n*للطلب قبل 2️⃣4️⃣ ساعة ⏱\r\n*للطلب ⬅️واتس اب 0797394645', 'https://www.instagram.com/lgaima.jo?igsh=MXM4MGN2enpsNW1qbA==', 1, '2025-05-06 20:31:00'),
(40, 2, 'bitesbysarahh', 'bitesbysarahh@yahoo.com', '0781188654', 'bitesbysarahh123', 0, 'Sellers_Images/Screenshot 2025-05-22 023143.png', 'Bites by sarah\r\nMini desserts homemade with love \r\nAmman, Jordan\r\nPlace your order 48 hours ahead \r\nOrder your customized cookies a week ahead ', 'https://www.instagram.com/bitesbysarahh/', 1, '2025-05-06 20:38:28'),
(41, 2, 'fayrouzahkitchen', 'fayrouzahkitchen@yahoo.com', '0793386645', 'fayrouzahkitchen123', 0, 'Sellers_Images/Screenshot 2025-05-22 023237.png', 'مطبخ فيروزة\r\n????????????', 'https://www.instagram.com/fayrouzahkitchen/', 1, '2025-05-06 20:51:55'),
(42, 2, 'sugar.rush2023', 'sugar.rush2023@gmail.com', '0783364986', 'sugar.rush2023123', 5, 'Sellers_Images/Screenshot 2025-05-22 023301.png', 'By chef shahed\r\nBased in aqaba\r\n⏰️48 hours pre-order', 'https://www.instagram.com/sugar.rush2023/', 1, '2025-05-06 21:00:12'),
(44, 2, 'Baraa’s Cookies', 'BaraasCookies@gmail.com', '0123456788', 'Baraa’sCookies123', 0, 'Sellers_Images/bra1 (1).jpg', 'Share the love and pass around some cookies', 'https://www.instagram.com/baraacookiess?utm_source=ig_web_button_share_sheet&igsh=ZDNlZDc0MzIxNw==', 1, '2025-05-08 11:26:07'),
(45, 2, 'Leen’s Beads', 'LeensBeads@gmail.com', '0123456783', 'LeensBeads123', 0, 'Sellers_Images/Screenshot 2025-05-22 023346.png', '', 'https://www.instagram.com/leens.beads?utm_source=ig_web_button_share_sheet&igsh=ZDNlZDc0MzIxNw==', 1, '2025-05-08 11:52:51'),
(46, 2, 'Noor Kitchen', 'NoorKitchen@gmail.com', '0795034722', 'NoorKitchen123', 0, 'Sellers_Images/Screenshot 2025-05-22 023427.png', 'Homemade Delicious Appetizers', 'https://www.instagram.com/noorkitchen24?utm_source=ig_web_button_share_sheet&igsh=ZDNlZDc0MzIxNw==', 1, '2025-05-08 12:12:51'),
(47, 2, 'Salma’s Kitchen', 'SalmasKitchen@gmail.com', '0789077443', 'SalmasKitchen123', 0, 'Sellers_Images/Screenshot 2025-05-22 023501.png', 'Homemade food and more', 'https://www.instagram.com/salmakitchen_?utm_source=ig_web_button_share_sheet&igsh=ZDNlZDc0MzIxNw==', 1, '2025-05-08 12:32:36'),
(48, 2, 'Remal Accessories', 'RemalAccessories@gmail.com', '0123456785', 'RemalAccessories123', 0, 'Sellers_Images/Screenshot 2025-05-22 023542.png', 'Turkish Accessories covered with 18k gold', 'https://www.instagram.com/remal_accessories?utm_source=ig_web_button_share_sheet&igsh=ZDNlZDc0MzIxNw==', 1, '2025-05-08 12:50:27'),
(49, 2, 'gifts.boxes.jo', 'gifts.boxes.jo@gmail.com', '0796254317', 'gifts.boxes.jo123', 0, 'Sellers_Images/Screenshot 2025-05-22 024144.png', 'تصميم هدايا حسب الطلب وبأسعار مناسبة\r\n\r\nمتوفر خدمة التوصيل لجميع انحاء المملكة\r\nالدفع عند الإستلام\r\nاو عن طريق الحوالة\r\n', 'https://www.instagram.com/gifts.boxes.jo?utm_source=ig_web_button_share_sheet&igsh=ZDNlZDc0MzIxNw==', 1, '2025-05-11 14:34:49'),
(50, 2, 'The Owl Store ', 'TheOwlStore@gmail.com', '0796254311', 'TheOwlStore123', 0, 'Sellers_Images/Screenshot 2025-05-22 023620.png', 'Refill. Reuse. Refresh \r\nFree Delivery in Joran \r\nDM’S for orders ', 'https://www.instagram.com/theowlstorejo?utm_source=ig_web_button_share_sheet&igsh=ZDNlZDc0MzIxNw==', 1, '2025-05-11 14:47:00'),
(51, 2, 'BSJackets', 'BSJackets@gmail.com', '0795435354', 'BSJackets123', 0, 'Sellers_Images/ER.png', 'Our 3rd page \r\nPalestine,jordan ???????? ????????\r\n-Preview service available\r\n- Worldwide shipping\r\nExchange & Returns Available\r\n-5000+ pleased customer', 'https://www.instagram.com/bs.wearr?utm_source=ig_web_button_share_sheet&igsh=ZDNlZDc0MzIxNw==', 1, '2025-05-11 14:56:45'),
(52, 2, 'Pets Club', 'PetsClub@gmail.com', '0795435352', 'PetsClub123', 0, 'Sellers_Images/Screenshot 2025-05-22 024102.png', ' Pamper Your Pets With Our High Quality Products\r\n Free Delivery Inside Amman \r\nDM For Orders????\r\n', 'https://www.instagram.com/petsclub.jo?utm_source=ig_web_button_share_sheet&igsh=ZDNlZDc0MzIxNw==', 1, '2025-05-11 15:15:56'),
(53, 2, 'Catchy Jo', 'CatchyJo@gmail.com', '0796254312', 'CatchyJo123', 0, 'Sellers_Images/Screenshot 2025-05-22 023820.png', 'CATCHY JO\r\nBrand\r\nمكانك المفضل لشراء كل ما تحتاجه لموبايلك\r\nأول تطبيق أردني مختص ببيع اكسسوارات الموبايل والايباد\r\nالتوصيل متوفر حول العالم ', 'https://www.instagram.com/catchyjo.official?utm_source=ig_web_button_share_sheet&igsh=ZDNlZDc0MzIxNw==', 1, '2025-05-11 15:27:01'),
(54, 2, 'Safarjal Jo', 'Safarjal@gmail.com', '0786543224', 'Safarjal123', 0, 'Sellers_Images/Screenshot 2025-05-22 023746.png', 'Safarjal سفرجل\r\nFlavors that feel like home \r\nمربى طبيعية محضرة منزليًا بدون الوان او مواد حافظة\r\nFor Jams and more \r\nAmman -Jordan ', 'https://www.instagram.com/safarjaljo?utm_source=ig_web_button_share_sheet&igsh=ZDNlZDc0MzIxNw==', 1, '2025-05-11 15:40:02'),
(55, 2, 'DhayShowroom', 'DhayShowroom@gmail.com', '0795435354', 'DhayShowroom123', 0, 'Sellers_Images/Screenshot 2025-05-22 023934.png', 'صالة “ضَي” تعرض إبداعات السيدات المتدربات ضمن مشاريع الهيئة الخيرية الأردنية الهاشمية، وتعزز استدامة المشاريع، وتدعم الاقتصاد المحلي، وتوفر فرص عمل\r\n', 'https://www.instagram.com/dhay_showroom?utm_source=ig_web_button_share_sheet&igsh=ZDNlZDc0MzIxNw==', 1, '2025-05-11 15:47:24'),
(56, 2, 'LusailHome', 'LusailHome@gmail.com', '0795435355', 'LusailHome123', 0, 'Sellers_Images/Screenshot 2025-05-22 023712.png', 'Lusail.home - لوسيل هوم\r\nArtificial tree ????\r\n•Gifts\r\n• To order or inquire:\r\n• Direct message\r\n• Connect-us : 0798202557', 'https://www.instagram.com/lusail.home.jo?utm_source=ig_web_button_share_sheet&igsh=ZDNlZDc0MzIxNw==', 1, '2025-05-11 16:06:51');

-- --------------------------------------------------------

--
-- Table structure for table `users_types`
--

CREATE TABLE `users_types` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `users_types`
--

INSERT INTO `users_types` (`id`, `name`) VALUES
(1, 'Admin'),
(2, 'Seller'),
(3, 'Buyer');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `advertisements`
--
ALTER TABLE `advertisements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `buyer_id_cart` (`buyer_id`),
  ADD KEY `product_id_cart` (`product_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `buyer_id_favorit` (`buyer_id`),
  ADD KEY `product_id_favorit` (`product_id`);

--
-- Indexes for table `offers`
--
ALTER TABLE `offers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `seller_offer_id_FK` (`seller_id`),
  ADD KEY `product_offer_id_FK` (`product_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `buyer_id_order` (`buyer_id`),
  ADD KEY `status_id_fk` (`status_id`),
  ADD KEY `offer_id_FK` (`offer_id`),
  ADD KEY `seller_order_id_FK` (`seller_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id_FK` (`order_id`),
  ADD KEY `product_id_order` (`product_id`),
  ADD KEY `option_id_order` (`option_id`(1024)),
  ADD KEY `seller_id_order_item_FK` (`seller_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id_FK` (`category_id`),
  ADD KEY `sub_category_place_FK` (`sub_category_id`),
  ADD KEY `sellet_id_FK` (`seller_id`);

--
-- Indexes for table `product_feedbacks`
--
ALTER TABLE `product_feedbacks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `buyer_id_feedback` (`buyer_id`),
  ADD KEY `product_id_feedback` (`product_id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id_Image_FK` (`product_id`);

--
-- Indexes for table `product_options`
--
ALTER TABLE `product_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id_option_FK` (`product_id`);

--
-- Indexes for table `product_rates`
--
ALTER TABLE `product_rates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `buyer_id_rate` (`buyer_id`),
  ADD KEY `product_id_rate` (`product_id`);

--
-- Indexes for table `seller_feedbacks`
--
ALTER TABLE `seller_feedbacks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `buyer_id_seller_feedback` (`buyer_id`),
  ADD KEY `seller_id_feedback` (`seller_id`);

--
-- Indexes for table `seller_rate`
--
ALTER TABLE `seller_rate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `buyer_id_rate_seller` (`buyer_id`),
  ADD KEY `seller_id_rate` (`seller_id`);

--
-- Indexes for table `seller_subscriptions`
--
ALTER TABLE `seller_subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `seller_id_subs` (`seller_id`);

--
-- Indexes for table `statuses`
--
ALTER TABLE `statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uset_type_FK` (`user_type_id`);

--
-- Indexes for table `users_types`
--
ALTER TABLE `users_types`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `advertisements`
--
ALTER TABLE `advertisements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `favorites`
--
ALTER TABLE `favorites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `offers`
--
ALTER TABLE `offers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=203;

--
-- AUTO_INCREMENT for table `product_feedbacks`
--
ALTER TABLE `product_feedbacks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `product_options`
--
ALTER TABLE `product_options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `product_rates`
--
ALTER TABLE `product_rates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `seller_feedbacks`
--
ALTER TABLE `seller_feedbacks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `seller_rate`
--
ALTER TABLE `seller_rate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `seller_subscriptions`
--
ALTER TABLE `seller_subscriptions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `statuses`
--
ALTER TABLE `statuses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `users_types`
--
ALTER TABLE `users_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `buyer_id_cart` FOREIGN KEY (`buyer_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `product_id_cart` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `favorites`
--
ALTER TABLE `favorites`
  ADD CONSTRAINT `buyer_id_favorit` FOREIGN KEY (`buyer_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `product_id_favorit` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `offers`
--
ALTER TABLE `offers`
  ADD CONSTRAINT `product_offer_id_FK` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `seller_offer_id_FK` FOREIGN KEY (`seller_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `buyer_id_order` FOREIGN KEY (`buyer_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `offer_id_FK` FOREIGN KEY (`offer_id`) REFERENCES `offers` (`id`),
  ADD CONSTRAINT `seller_order_id_FK` FOREIGN KEY (`seller_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `status_id_fk` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`);

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_id_FK` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `product_id_order` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `seller_id_order_item_FK` FOREIGN KEY (`seller_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `category_id_FK` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `sellet_id_FK` FOREIGN KEY (`seller_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `sub_category_place_FK` FOREIGN KEY (`sub_category_id`) REFERENCES `sub_categories` (`id`);

--
-- Constraints for table `product_feedbacks`
--
ALTER TABLE `product_feedbacks`
  ADD CONSTRAINT `buyer_id_feedback` FOREIGN KEY (`buyer_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `product_id_feedback` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `product_id_Image_FK` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `product_options`
--
ALTER TABLE `product_options`
  ADD CONSTRAINT `product_id_option_FK` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `product_rates`
--
ALTER TABLE `product_rates`
  ADD CONSTRAINT `buyer_id_rate` FOREIGN KEY (`buyer_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `product_id_rate` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `seller_feedbacks`
--
ALTER TABLE `seller_feedbacks`
  ADD CONSTRAINT `buyer_id_seller_feedback` FOREIGN KEY (`buyer_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `seller_id_feedback` FOREIGN KEY (`seller_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `seller_rate`
--
ALTER TABLE `seller_rate`
  ADD CONSTRAINT `buyer_id_rate_seller` FOREIGN KEY (`buyer_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `seller_id_rate` FOREIGN KEY (`seller_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `seller_subscriptions`
--
ALTER TABLE `seller_subscriptions`
  ADD CONSTRAINT `seller_id_subs` FOREIGN KEY (`seller_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `uset_type_FK` FOREIGN KEY (`user_type_id`) REFERENCES `users_types` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
