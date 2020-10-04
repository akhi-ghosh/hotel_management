-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Oct 02, 2020 at 06:19 PM
-- Server version: 5.7.26
-- PHP Version: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mydb`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `name`, `password`) VALUES
(1, 'akash', '1'),
(2, 'akhi', '1'),
(3, 'puja', '1');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
CREATE TABLE IF NOT EXISTS `customer` (
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `contact` varchar(45) NOT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
CREATE TABLE IF NOT EXISTS `employee` (
  `employee_id` int(11) NOT NULL AUTO_INCREMENT,
  `salary` varchar(45) NOT NULL,
  `Rank` varchar(45) NOT NULL,
  PRIMARY KEY (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `hotel`
--

DROP TABLE IF EXISTS `hotel`;
CREATE TABLE IF NOT EXISTS `hotel` (
  `Hotel_id` int(11) NOT NULL AUTO_INCREMENT,
  `Hotel_name` varchar(45) NOT NULL,
  `Hotel_type` varchar(45) NOT NULL,
  `Address` varchar(45) NOT NULL,
  `Phone_no` varchar(45) NOT NULL,
  PRIMARY KEY (`Hotel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hotel`
--

INSERT INTO `hotel` (`Hotel_id`, `Hotel_name`, `Hotel_type`, `Address`, `Phone_no`) VALUES
(1, 'castle', '3 star', 'khulna', '014568522'),
(2, 'Royal international', '3 star', 'khulna', '01756893256'),
(3, 'city Inn', 'three star', 'khulna', '01456789123'),
(5, 'Tiger garden', '2 star', 'khulna', '01523456789');

-- --------------------------------------------------------

--
-- Table structure for table `market`
--

DROP TABLE IF EXISTS `market`;
CREATE TABLE IF NOT EXISTS `market` (
  `market_id` int(11) NOT NULL,
  `market_name` varchar(45) NOT NULL,
  `location` varchar(45) NOT NULL,
  `contact` varchar(45) NOT NULL,
  PRIMARY KEY (`market_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `price_id`
--

DROP TABLE IF EXISTS `price_id`;
CREATE TABLE IF NOT EXISTS `price_id` (
  `price_id` int(11) NOT NULL,
  `value` float NOT NULL,
  PRIMARY KEY (`price_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(45) NOT NULL,
  `origin` varchar(45) NOT NULL,
  `type` varchar(45) NOT NULL,
  `price_id_idprice_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`price_id_idprice_id`),
  KEY `fk_Product_price_id1_idx` (`price_id_idprice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
CREATE TABLE IF NOT EXISTS `reservation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `check_in` date NOT NULL,
  `check_out` date NOT NULL,
  `roomId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `isAccepted` varchar(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `roomId` (`roomId`),
  KEY `userId` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reservation`
--

INSERT INTO `reservation` (`id`, `check_in`, `check_out`, `roomId`, `userId`, `isAccepted`) VALUES
(11, '2020-09-30', '2020-10-01', 16, 7, '1'),
(12, '2020-09-22', '2020-09-09', 23, 7, '1'),
(13, '2020-09-16', '2020-09-11', 18, 7, '1'),
(14, '2020-10-20', '2020-10-20', 18, 7, '1');

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
CREATE TABLE IF NOT EXISTS `room` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roomId` int(11) NOT NULL,
  `Room_type` varchar(45) NOT NULL,
  `Rate` varchar(45) NOT NULL,
  `Phone_no` varchar(45) NOT NULL,
  `isReserved` varchar(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `roomId` (`roomId`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`id`, `roomId`, `Room_type`, `Rate`, `Phone_no`, `isReserved`) VALUES
(16, 101, 'Economy ', '2500', '45678', 'Rejected'),
(17, 102, 'Economy ', '2500', '111', '0'),
(18, 103, 'Economy ', '2500', '456', 'Accepted'),
(20, 104, 'Economy ', '2500', '456', 'Accepted'),
(21, 205, 'Business', '3500', '222', 'Accepted'),
(22, 208, 'Business', '3500', '208', '0'),
(23, 310, 'Business', '3500', '310', 'Accepted'),
(24, 343, 'economy', '1000', '090', '0');

-- --------------------------------------------------------

--
-- Table structure for table `shop`
--

DROP TABLE IF EXISTS `shop`;
CREATE TABLE IF NOT EXISTS `shop` (
  `shop_id` int(11) NOT NULL,
  `shop_name` varchar(45) NOT NULL,
  `contact` varchar(45) NOT NULL,
  `Market_market_id` int(11) NOT NULL,
  `type` varchar(45) NOT NULL,
  PRIMARY KEY (`shop_id`,`Market_market_id`),
  KEY `fk_Shop_Market1_idx` (`Market_market_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `shop_has_product`
--

DROP TABLE IF EXISTS `shop_has_product`;
CREATE TABLE IF NOT EXISTS `shop_has_product` (
  `Shop_shop_id` int(11) NOT NULL,
  `Shop_Market_market_id` int(11) NOT NULL,
  `Product_product_id` int(11) NOT NULL,
  `Product_price_id_idprice_id` int(11) NOT NULL,
  PRIMARY KEY (`Shop_shop_id`,`Shop_Market_market_id`,`Product_product_id`,`Product_price_id_idprice_id`),
  KEY `fk_Shop_has_Product_Product1_idx` (`Product_product_id`,`Product_price_id_idprice_id`),
  KEY `fk_Shop_has_Product_Shop1_idx` (`Shop_shop_id`,`Shop_Market_market_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  `gender` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `contact` varchar(45) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `user_name`, `address`, `gender`, `password`, `contact`) VALUES
(1, 'Rahim', 'ku', '1', 'a', '1234'),
(2, 'karim', 'khulna', '1', '123', '01756214863'),
(3, 'akhi', 'ku', '1', '1', '0123456788'),
(7, 'akash', 'aa', '1', '1', '111');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `fk_Product_price_id1` FOREIGN KEY (`price_id_idprice_id`) REFERENCES `price_id` (`price_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`roomId`) REFERENCES `room` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shop`
--
ALTER TABLE `shop`
  ADD CONSTRAINT `fk_Shop_Market1` FOREIGN KEY (`Market_market_id`) REFERENCES `market` (`market_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `shop_has_product`
--
ALTER TABLE `shop_has_product`
  ADD CONSTRAINT `fk_Shop_has_Product_Product1` FOREIGN KEY (`Product_product_id`,`Product_price_id_idprice_id`) REFERENCES `product` (`product_id`, `price_id_idprice_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Shop_has_Product_Shop1` FOREIGN KEY (`Shop_shop_id`,`Shop_Market_market_id`) REFERENCES `shop` (`shop_id`, `Market_market_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
