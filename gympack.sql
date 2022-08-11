-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Aug 11, 2022 at 05:44 AM
-- Server version: 5.7.31
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gympack`
--

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
CREATE TABLE IF NOT EXISTS `customers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  `gender` varchar(6) NOT NULL,
  `email` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  `location` varchar(25) NOT NULL,
  `preferances` varchar(25) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `gender`, `email`, `password`, `location`, `preferances`, `Date`) VALUES
(2, 'Stephen', 'male', 's753@gmail', 'abc', 'Jinja', 'Sports wear', '2022-03-12'),
(3, 'Linda', 'female', 'k7532@gmail', 'abc', 'Jinja', 'Sports wear', '2022-08-06'),
(4, 'Zayne ', 'male', 'k7531@gmail', 'abc', 'Mpigi', 'Nutrition', '2022-08-06');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prodName` varchar(25) NOT NULL,
  `prodAmt` int(11) NOT NULL,
  `prodPrice` int(11) NOT NULL,
  `cstEmail` varchar(25) NOT NULL,
  `location` varchar(25) NOT NULL,
  `totalAmount` int(11) NOT NULL,
  `Category` varchar(25) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `prodName`, `prodAmt`, `prodPrice`, `cstEmail`, `location`, `totalAmount`, `Category`, `date`) VALUES
(1, 'kkks', 15, 11000, 'k753@gmail', 'Sskk', 165000, '', '0000-00-00'),
(2, 'SNKS', 25, 12000, 'k753@gmail', 'Sskk', 300000, '', '0000-00-00'),
(3, 'kkks', 15, 11000, 's753@gmail', 'Sskk', 165000, '', '0000-00-00'),
(4, 'SNKS', 25, 12000, 'k753@gmail', 'Sskk', 300000, '', '0000-00-00'),
(5, 'SNKS', 25, 12000, 'k753@gmail', 'Sskk', 300000, '', '0000-00-00'),
(6, 'SNKS', 25, 12000, 'k753@gmail', 'Sskk', 300000, '', '0000-00-00'),
(7, 'kkks', 15, 11000, 'k753@gmail', 'Sskk', 165000, '', '0000-00-00'),
(8, 'kkks', 15, 11000, 'k753@gmail', 'Sskk', 165000, '', '0000-00-00'),
(9, 'SNKS', 25, 12000, 'k753@gmail', 'Sskk', 300000, 'SHOES', '2022-08-06'),
(10, 'kkks', 5, 11000, 's753@gmail', 'Sskk', 165000, 'snaks', '2022-08-06'),
(11, 'Nike Sneakers ', 3, 25000, 'john@gmail.com', '144 New Way Street', 75000, 'Sports wear', '2022-08-09'),
(12, 'Nesquick Protein Shake ', 5, 10000, 'john@gmail.com', '144 New Way Street', 50000, 'Nutrition', '2022-08-09'),
(13, 'Dumbells  ', 10, 25000, 'fred@gmail.com', 'Nansana', 250000, 'Workout equipment', '2022-07-14'),
(14, 'Samsung Pacemaker ', 1, 45700, 'dan12@gmail.com', 'Kampala', 47500, 'Electronics', '2022-06-08');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prodName` varchar(45) NOT NULL,
  `category` varchar(45) NOT NULL,
  `unitPrice` varchar(45) NOT NULL,
  `ammount` int(11) NOT NULL,
  `image` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `prodName`, `category`, `unitPrice`, `ammount`, `image`) VALUES
(12, 'Mountain Climber bag ', 'Sports wear', '27500', 1, 'bag1.jpg'),
(13, 'Weight Lifts', 'Workout equipment', '12400', 2, 'eqip1.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
CREATE TABLE IF NOT EXISTS `staff` (
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `phoneNo` varchar(12) NOT NULL,
  `address` varchar(25) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`firstName`, `lastName`, `phoneNo`, `address`) VALUES
('Vikesh ', 'Rudrah', '222-456-789', 'Mumbai');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `UserID` int(3) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `Email` varchar(30) NOT NULL,
  `Password` varchar(30) NOT NULL,
  PRIMARY KEY (`UserID`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`UserID`, `Name`, `Email`, `Password`) VALUES
(1, 'John Smith', 'john12@gmail.com', '123456'),
(3, 'Farlock James', 'farlock2@gmail.com', 'qwerty'),
(4, 'Sam', 'samz5@gmail.com', 'samz5'),
(5, 'Danny Greg', 'dannygreg@gmail.com', 'dan12'),
(7, 'Lucky Meena', 'meena@yahoo.com', 'meena'),
(8, 'Dharma Jenkins', 'dharma2@gmail.com', 'jenkins'),
(11, 'Diana Chopra', 'chopra67@gmail.com', 'diana'),
(24, 'Gil Peter', 'gilpeter@yahoo.com', 'gil12'),
(20, 'Tom Dubois', 'tom@gmail.com', '12345'),
(27, 'Kendra Nicole', 'nicole2@gmail.com', 'nicole'),
(28, 'Kiara Polmer', 'kpolmer@gmail.com', 'kp123');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
