-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jul 22, 2021 at 05:31 PM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `category` enum('book','stationary','others') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `category`) VALUES
(1, 'hobbit', 'book'),
(2, 'deception_point', 'book'),
(3, 'harry_potter', 'book'),
(4, 'the_kite_runner', 'book'),
(5, 'animal_farm', 'book'),
(6, 'night_lamp', 'others'),
(7, 'pencil_box', 'stationary'),
(8, 'fountain_pen', 'stationary'),
(9, 'student_bed_table', 'others'),
(10, 'personal_diary', 'stationary'),
(11, 'harry_potter', 'book');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `email` varchar(30) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `phone` bigint(11) NOT NULL,
  `registration_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `first_name`, `last_name`, `phone`, `registration_time`) VALUES
(1, 'venu@xyz.com', 'Venu', 'Sharma', 518904200, '2021-06-16 05:10:19'),
(2, 'Shubham@xyz.com', 'Shubham', 'Khurana', 521397893, '2021-06-16 05:11:47'),
(3, 'Disha@xyz.com', 'jaspreet', 'Kaur ', 512779222, '2021-06-17 08:29:13'),
(4, 'Ankit@xyz.com', 'Ankit', 'Kumar', 5678921453, '2021-06-16 05:13:17'),
(5, 'Mrinal@xyz.com', 'Mrinal', 'Ankit', 5468952156, '2021-06-16 05:14:00'),
(6, 'Abhilash@xyz.com', 'Abhilash', 'Joy', 8965231245, '2021-06-16 05:23:27'),
(7, 'Hardik@xyz.com', 'Hardik', 'Arora', 7896523154, '2021-06-16 05:23:50'),
(8, 'Yesha@xyz.com', 'Yesha', 'Krishna', 4562351245, '2021-06-16 05:24:27'),
(9, 'Rushit@xyz.com', 'Rushit', 'Gaur', 5645231245, '2021-06-16 05:24:59'),
(10, 'Jessy@xyz.com', 'Jenny', 'Joseph', 4569321245, '2021-06-16 05:25:32'),
(14, 'deepanshnigam@gmail.com', 'Deepansh', 'Nigam', 1234567890, '2021-07-11 06:15:37'),
(16, 'abc@gmail.com', 'abc', 'xyz', 1234512345, '2021-07-12 04:46:30'),
(17, 'abc@gmail.com', 'abc', 'xyz', 1234512345, '2021-07-12 04:46:38');

-- --------------------------------------------------------

--
-- Table structure for table `user_products`
--

DROP TABLE IF EXISTS `user_products`;
CREATE TABLE IF NOT EXISTS `user_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_products`
--

INSERT INTO `user_products` (`id`, `user_id`, `product_id`) VALUES
(1, 3, 4),
(5, 2, 5),
(6, 4, 2),
(7, 4, 5);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `user_products`
--
ALTER TABLE `user_products`
  ADD CONSTRAINT `user_products_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `user_products_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
