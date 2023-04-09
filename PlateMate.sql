-- phpMyAdmin SQL Dump
-- version 5.2.1deb1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 09, 2023 at 01:01 PM
-- Server version: 8.0.32-0ubuntu4
-- PHP Version: 8.1.12-1ubuntu4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `PlateMate`
--

-- --------------------------------------------------------

--
-- Table structure for table `food`
--

CREATE TABLE `food` (
  `food_id` int NOT NULL,
  `restaurant_id` int NOT NULL,
  `foodname` varchar(30) NOT NULL,
  `price` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `food`
--

INSERT INTO `food` (`food_id`, `restaurant_id`, `foodname`, `price`) VALUES
(1, 1, 'Pad Thai', 60),
(2, 1, 'Tom Yum Soup', 70),
(3, 1, 'Green Curry', 80),
(4, 2, 'Kung Pao Chicken', 88),
(5, 2, 'Chow Mein', 888),
(6, 2, 'Peking Duck', 99),
(7, 3, 'Beef', 90),
(8, 3, 'Chicken', 80),
(9, 3, 'Fish', 80),
(10, 4, 'Caesar Salad', 45),
(11, 4, 'House Salad', 50),
(12, 5, 'Grill Fish', 100),
(13, 5, 'Burnt Fish', 30),
(14, 6, 'Good Coffee', 30),
(15, 6, 'Expresso', 45),
(16, 6, 'Mocha', 45);

-- --------------------------------------------------------

--
-- Table structure for table `Porder`
--

CREATE TABLE `Porder` (
  `order_id` int NOT NULL,
  `restaurant_id` int NOT NULL,
  `member_id` int NOT NULL,
  `foodname` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Porder`
--

INSERT INTO `Porder` (`order_id`, `restaurant_id`, `member_id`, `foodname`) VALUES
(1, 1, 1, 'Pad Thai'),
(2, 2, 3, 'Chow Mein'),
(3, 4, 1, 'Caesar Salad'),
(7, 1, 4, 'Pad Thai'),
(8, 1, 1, 'Pad Thai'),
(9, 4, 6, 'House Salad'),
(13, 6, 1, 'Expresso'),
(15, 5, 13, 'Good Coffee'),
(16, 2, 1, 'Kung Pao Chicken');

-- --------------------------------------------------------

--
-- Table structure for table `restaurant`
--

CREATE TABLE `restaurant` (
  `restaurant_id` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `category` varchar(20) NOT NULL,
  `address` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `restaurant`
--

INSERT INTO `restaurant` (`restaurant_id`, `name`, `category`, `address`) VALUES
(1, 'Spicy Grove', 'thai', 'East Ocean Center , 98 Granville Road , Tsimshatsui East'),
(2, 'The Golden Chopsticks', 'chinese', 'East Ocean Center , 99 Granville Road , Tsimshatsui East'),
(3, 'Smokehouse Grill', 'western', 'East Ocean Center , 97 Granville Road , Tsimshatsui East'),
(4, 'Garden Table', 'western', 'East Ocean Center , 96 Granville Road , Tsimshatsui East'),
(5, 'Coastal Catch', 'western', 'East Ocean Center , 95 Granville Road , Tsimshatsui East'),
(6, 'Sweet Tooth Cafe', 'more', 'East Ocean Center , 103 Granville Road , Tsimshatsui East');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `member_id` int NOT NULL,
  `username` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `user_address` varchar(80) NOT NULL,
  `email_address` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`member_id`, `username`, `password`, `user_address`, `email_address`) VALUES
(1, 'u1', 'p1', 'a1', 'e1@e'),
(3, 'u2', 'p2', 'a2', 'e2@e'),
(4, 'user4', '123', 'home', 'user@user'),
(6, 'John', '123456', 'somewhere near', 'john@123.com'),
(9, '1', '1', '2', '123@123'),
(11, '123', '456', '123', '5@6'),
(13, 'user1', '123', 'address1', 'user@email');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `food`
--
ALTER TABLE `food`
  ADD PRIMARY KEY (`food_id`),
  ADD KEY `restaurant_id` (`restaurant_id`);

--
-- Indexes for table `Porder`
--
ALTER TABLE `Porder`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `restaurant_id` (`restaurant_id`),
  ADD KEY `member_id` (`member_id`);

--
-- Indexes for table `restaurant`
--
ALTER TABLE `restaurant`
  ADD PRIMARY KEY (`restaurant_id`),
  ADD KEY `category` (`category`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`member_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `food`
--
ALTER TABLE `food`
  MODIFY `food_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `Porder`
--
ALTER TABLE `Porder`
  MODIFY `order_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `restaurant`
--
ALTER TABLE `restaurant`
  MODIFY `restaurant_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `member_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `food`
--
ALTER TABLE `food`
  ADD CONSTRAINT `food_ibfk_1` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`restaurant_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `Porder`
--
ALTER TABLE `Porder`
  ADD CONSTRAINT `Porder_ibfk_1` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`restaurant_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `Porder_ibfk_2` FOREIGN KEY (`member_id`) REFERENCES `user` (`member_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
