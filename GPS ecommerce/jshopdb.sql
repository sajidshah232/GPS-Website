-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 11, 2021 at 03:14 AM
-- Server version: 8.0.21
-- PHP Version: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jshopdb`
--
create database jshopdb;
use jshopdb;
-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `userid` varchar(30) NOT NULL,
  `prodid` int NOT NULL,
  `qty` int NOT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `catid` int NOT NULL,
  `category` varchar(30) NOT NULL
);

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`catid`, `category`) VALUES
(1, 'Bags'),
(3, 'Beds'),
(4, 'Cloths'),
(5, 'Computers'),
(6, 'Books'),
(7, 'Toys'),
(8, 'Mobiles'),
(9, 'TV'),
(10, 'Shoes');

-- --------------------------------------------------------

--
-- Table structure for table `cust_address`
--

CREATE TABLE `cust_address` (
  `userid` varchar(30) NOT NULL,
  `name` varchar(30) NOT NULL,
  `mobile` char(10) NOT NULL,
  `pin` char(8) NOT NULL,
  `locality` varchar(30) NOT NULL,
  `state` varchar(20) NOT NULL,
  `city` varchar(20) NOT NULL,
  `address` varchar(255) NOT NULL,
  `adtype` varchar(15) NOT NULL
);

--
-- Dumping data for table `cust_address`
--

INSERT INTO `cust_address` (`userid`, `name`, `mobile`, `pin`, `locality`, `state`, `city`, `address`, `adtype`) VALUES
('9811763737', 'Anand Singh', '9811763737', '121103', 'Hathin', 'Haryana', 'Hathin', 'Ward no 2', 'Home'),
('9898989898', 'Anand Singh', '9811763737', '121103', 'Hathin', 'Haryana', 'Hathin', 'Hathin', 'Home'),
('9940915566', 'mohamed', '9940911556', '66646464', 'st', 'tn', 'chennai', 'jdhdjhdjdh', 'Home'),
('9999999999', 'Raju Sharma', '9999999999', '120011', 'No', 'NA', 'NA', 'NA', 'Home'),
('anandsingh', 'Anand Singh', '9811763737', '121103', 'Hathin', 'Haryana', 'Palwal', 'Ward no 2 Bass Mohalla Hathin Distt Palwal', 'Home'),
('anilkapoor', 'Anil Verma', '9992523269', '112252', 'Devi Temple', 'Haryana', 'Faridabad', 'Near Sabji Mandi, Devi temple Faridabad Haryana', 'Home'),
('anilkapoor@gmail.com', 'Anil Kapoor', '9811763737', '121212', 'Main Market', 'New Delhi', 'South Extension', 'Main Market South Extension Part-2 New Delhi', 'Home'),
('annu@gmail.com', 'Annapurna Singh', '9898989898', '222222', 'Aptech', 'Utter Pradesh', 'Noida', 'B-7 4th floor Sector 2 Noida UP India', 'Home'),
('avinash', 'Vinod Kumar', '8053431608', '121103', 'Faridabad', 'Haryana', 'Faridabad', 'Sector-4  Faridabad Haryana India', 'Home'),
('kajay', 'Ajay Kumar', '9988775566', '112525', 'Noida', 'Utter Pradesh', 'Noida', 'Noida', 'Home'),
('kpradeep', 'Pradeep Kumar', '8055454544', '113345', 'Noida', 'Utter Pradesh', 'Noida', 'Jung Khayela Tabela,  Match Fixing ground ke piche San sanati hui gali', 'Home'),
('rajesh', 'Rajesh Kumar', '9999555664', '142425', 'Aptech', 'Utter Pradesh', 'Noida', 'B-7 4th floor Sector 2 Noida UP (India)', 'Home'),
('rmani', 'Mani Rajput', '9811736767', '121103', 'Hathin', 'Haryana', 'Hathin', 'Ward no 3 Hathin Distt Palwal PO Hathin', 'Home'),
('shubham@gmail.com', 'Shubham Vishwakarma', '9999955555', '225252', 'Noida', 'Utter Pradesh', 'Noida', 'B-7 4th floor Sector 2 Noida', 'Home'),
('sijin@gmail.com', 'Sijin Saji', '8855665566', '252525', 'Noida', 'Utter Pradesh', 'Noida', 'B-7 4th floor Aptech Center Noida Sector 2', 'Home'),
('sunil@gmail.com', 'Sunil Sharma', '9811763737', '151515', 'Faridabad', 'Haryana', 'Faridabad', 'Anywhere in the faridabad', 'Home'),
('vidhi', 'Vidhi Rajput', '9010856525', '121103', 'Hathin', 'Haryana', 'Hathin', 'Ward no 3 Hathin PO Hathin Distt Palwal', 'Home');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int NOT NULL,
  `orderdate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `userid` varchar(30) NOT NULL,
  `order_status` varchar(200) NOT NULL DEFAULT 'Pending',
  `remarks` varchar(200) DEFAULT NULL
);

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `orderdate`, `userid`, `order_status`, `remarks`) VALUES
(10, '2019-10-04 14:29:58', 'anandsingh', 'Confirmed', NULL),
(11, '2019-10-04 14:40:22', 'rajesh', 'Confirmed', NULL),
(12, '2019-10-04 14:48:56', 'kajay', 'Confirmed', NULL),
(15, '2019-10-04 16:11:16', 'kpradeep', 'Confirmed', NULL),
(17, '2019-10-04 20:17:16', 'rmani', 'Confirmed', NULL),
(18, '2019-10-05 08:07:13', 'kdev', 'Pending', NULL),
(19, '2019-10-05 08:13:39', 'seema', 'Pending', NULL),
(20, '2019-10-05 08:43:51', 'anivedita', 'Pending', NULL),
(21, '2019-10-05 12:57:45', 'kmanoj', 'Pending', NULL),
(22, '2019-10-05 18:16:25', 'anandsingh', 'Confirmed', NULL),
(23, '2019-10-05 20:04:09', 'rmani', 'Confirmed', NULL),
(24, '2019-10-05 20:29:13', 'vidhi', 'Confirmed', NULL),
(27, '2019-10-06 16:33:12', 'anandsingh', 'Confirmed', NULL),
(28, '2019-10-06 16:54:16', 'rmani', 'Confirmed', NULL),
(29, '2019-10-06 17:04:29', 'vidhi', 'Confirmed', NULL),
(31, '2019-10-07 06:46:43', 'rajesh', 'Confirmed', NULL),
(32, '2019-10-07 08:19:49', 'anilkapoor@gmail.com', 'Confirmed', NULL),
(34, '2019-10-07 09:43:01', 'anilkapoor@gmail.com', 'Confirmed', NULL),
(35, '2019-10-08 05:32:43', 'anandsingh', 'Confirmed', NULL),
(36, '2019-10-08 05:58:09', 'anandsingh', 'Confirmed', NULL),
(37, '2019-10-08 06:25:10', 'avinash', 'Confirmed', NULL),
(38, '2019-10-08 09:21:28', 'anilkapoor', 'Confirmed', NULL),
(39, '2019-10-10 09:08:22', 'sijin@gmail.com', 'Confirmed', NULL),
(40, '2019-10-10 10:15:28', 'annu@gmail.com', 'Confirmed', NULL),
(42, '2019-11-05 15:09:58', 'anandsingh', 'Confirmed', NULL),
(43, '2019-11-05 16:14:07', 'anandsingh', 'Confirmed', NULL),
(44, '2019-11-06 10:32:04', 'kajay', 'Confirmed', NULL),
(45, '2019-11-17 18:43:50', 'anilkapoor@gmail.com', 'Confirmed', NULL),
(46, '2019-11-17 19:18:22', 'anilkapoor@gmail.com', 'Pending', NULL),
(47, '2019-11-17 19:59:10', 'anilkapoor@gmail.com', 'Pending', NULL),
(48, '2019-11-17 20:07:04', 'kpradeep', 'Confirmed', NULL),
(49, '2019-11-18 10:50:48', 'shubham@gmail.com', 'Confirmed', NULL),
(50, '2019-11-18 11:06:54', 'shubham@gmail.com', 'Confirmed', NULL),
(52, '2019-12-03 09:43:11', 'anilkapoor@gmail.com', 'Pending', NULL),
(53, '2019-12-06 15:28:41', 'kajay', 'Pending', NULL),
(54, '2019-12-06 18:09:33', 'sunil@gmail.com', 'Confirmed', NULL),
(55, '2019-12-06 18:16:57', 'sunil@gmail.com', 'Confirmed', NULL),
(56, '2020-06-06 19:08:58', '9811763737', 'Confirmed', NULL),
(57, '2020-06-07 07:39:37', '9811763737', 'Confirmed', NULL),
(58, '2020-06-07 09:08:43', '9999999999', 'Confirmed', NULL),
(59, '2020-06-07 14:51:04', '9940915566', 'Pending', NULL),
(60, '2020-06-07 15:24:14', '9940915566', 'Confirmed', NULL),
(61, '2020-06-07 17:18:00', 'anandsingh', 'Cancelled', 'Product Not Available'),
(62, '2020-06-08 08:02:37', 'anandsingh', 'Cancelled', 'stock not available'),
(63, '2020-06-09 07:39:06', 'anandsingh', 'Pending', NULL),
(64, '2020-11-24 14:23:19', '9898989898', 'Pending', NULL);

-- --------------------------------------------------------

--
-- Stand-in structure for view `orderview`
-- (See below for the actual view)
--
CREATE TABLE `orderview` (
`order_id` int
,`orderdate` datetime
,`pname` varchar(30)
,`disc_price` decimal(16,2)
,`qty` int
,`amount` decimal(26,2)
);

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `order_id` int NOT NULL,
  `prodid` int NOT NULL,
  `qty` int NOT NULL
);

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`order_id`, `prodid`, `qty`) VALUES
(7, 108, 1),
(7, 126, 1),
(8, 127, 1),
(8, 129, 1),
(9, 128, 1),
(9, 130, 1),
(9, 131, 1),
(10, 132, 1),
(11, 129, 1),
(11, 131, 1),
(12, 127, 1),
(12, 131, 1),
(15, 137, 1),
(15, 139, 1),
(15, 142, 1),
(17, 130, 1),
(17, 141, 1),
(17, 142, 1),
(18, 127, 1),
(18, 133, 1),
(18, 135, 1),
(19, 149, 1),
(19, 151, 1),
(20, 132, 1),
(20, 149, 1),
(21, 133, 1),
(21, 147, 1),
(22, 129, 1),
(22, 136, 1),
(23, 140, 1),
(23, 141, 1),
(24, 133, 1),
(24, 134, 1),
(24, 141, 1),
(27, 128, 1),
(27, 131, 1),
(27, 136, 1),
(28, 136, 1),
(28, 140, 1),
(29, 138, 1),
(29, 146, 2),
(31, 128, 1),
(31, 142, 1),
(32, 145, 2),
(32, 147, 1),
(34, 136, 1),
(34, 141, 1),
(35, 128, 1),
(35, 156, 1),
(36, 163, 1),
(36, 164, 1),
(36, 165, 1),
(37, 161, 1),
(38, 127, 1),
(38, 165, 1),
(39, 147, 1),
(39, 155, 1),
(40, 141, 1),
(40, 161, 1),
(42, 128, 1),
(42, 133, 2),
(42, 137, 2),
(43, 136, 1),
(43, 143, 1),
(43, 164, 2),
(44, 137, 2),
(44, 169, 1),
(45, 173, 2),
(45, 175, 1),
(46, 153, 1),
(46, 166, 2),
(46, 173, 2),
(47, 173, 2),
(48, 172, 2),
(49, 135, 2),
(49, 170, 1),
(49, 173, 1),
(50, 159, 2),
(52, 141, 2),
(53, 132, 2),
(53, 170, 1),
(53, 173, 1),
(54, 136, 2),
(54, 166, 2),
(55, 161, 1),
(55, 179, 1),
(56, 129, 1),
(56, 144, 1),
(57, 128, 2),
(57, 136, 1),
(58, 170, 2),
(58, 176, 2),
(58, 178, 1),
(59, 133, 1),
(59, 153, 1),
(59, 159, 4),
(60, 136, 1),
(60, 174, 1),
(60, 180, 2),
(61, 165, 1),
(61, 174, 1),
(61, 178, 1),
(62, 129, 1),
(62, 138, 1),
(62, 151, 1),
(62, 165, 1),
(62, 182, 1),
(63, 129, 1),
(63, 137, 1),
(63, 156, 1),
(64, 128, 1);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `prodid` int NOT NULL,
  `pname` varchar(30) NOT NULL,
  `pcat` varchar(20) NOT NULL,
  `price` decimal(15,2) NOT NULL,
  `disc_price` decimal(16,2) NOT NULL,
  `photo` varchar(40) DEFAULT NULL,
  `photo2` varchar(50) DEFAULT NULL,
  `photo3` varchar(50) DEFAULT NULL,
  `remarks` varchar(20) NOT NULL,
  `descr` text NOT NULL,
  `instock` varchar(20) DEFAULT 'In Stock',
  `featured` varchar(5) NOT NULL DEFAULT 'Yes',
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
);

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`prodid`, `pname`, `pcat`, `price`, `disc_price`, `photo`, `photo2`, `photo3`, `remarks`, `descr`, `instock`, `featured`, `create_date`) VALUES
(127, 'Simple Bag', 'Bags', '1500.00', '1400.00', '127.jpg', NULL, NULL, 'Rs. 100 Off', 'Black Bag\r\nDell company\r\nLong Lastiing', 'Out of Stock', 'No', '2019-10-01 20:10:55'),
(128, 'Baby Bag', 'Bags', '2000.00', '1800.00', '128.jpg', NULL, NULL, '10% off', 'Beautiful pink color\r\nNice pictured baby bag\r\nBest in quality\r\nLong lasting\r\nVery popular product', 'In Stock', 'Yes', '2019-10-01 20:10:55'),
(129, 'Spider Man Bag', 'Bags', '2000.00', '1800.00', '129.jpg', NULL, NULL, '10% off', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore.', 'In Stock', 'Yes', '2019-10-02 20:10:55'),
(130, 'Pink Double Bed', 'Beds', '4000.00', '3800.00', '130.jpg', NULL, NULL, 'Rs. 200 Off', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore.', 'Out of Stock', 'Yes', '2019-10-02 20:10:55'),
(131, 'Blue Bed', 'Beds', '5000.00', '4500.00', '131.jpg', NULL, NULL, '10% off', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore.', 'In Stock', 'No', '2019-10-02 20:10:55'),
(132, 'Red Shirt', 'Cloths', '1500.00', '1400.00', '132.jpg', NULL, NULL, 'Rs. 100 Off', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore.', 'In Stock', 'Yes', '2019-10-02 20:10:55'),
(133, 'RAM 8 GB', 'Computers', '3500.00', '3300.00', '133.jpg', NULL, NULL, 'Rs. 200 Off', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore.', 'In Stock', 'No', '2019-10-03 20:10:55'),
(134, 'SSD Hard Drive 250 GB', 'Computers', '3000.00', '2700.00', '134.jpg', NULL, NULL, '10% off', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore.', 'In Stock', 'Yes', '2019-10-03 20:10:55'),
(135, 'Pen Drive 32 GB', 'Computers', '2000.00', '1800.00', '135.jpg', NULL, NULL, '10% off', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore.', 'In Stock', 'No', '2019-10-03 20:10:55'),
(136, 'Computer Fundas', 'Books', '700.00', '750.00', '136.jpg', NULL, NULL, 'Rs 50 Off', 'Very nice book about computer fundamentals\r\nGood example\r\nwith photos\r\nlatest examples and curriculum', 'Out of Stock', 'Yes', '2019-10-03 20:10:55'),
(137, 'Advance Java Book', 'Books', '800.00', '700.00', '137.jpg', NULL, NULL, 'Rs. 100 Off', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore.', 'Out of Stock', 'Yes', '2019-10-03 20:10:55'),
(138, 'Photoshop CS Book', 'Books', '600.00', '540.00', '138.jpg', NULL, NULL, '10% off', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore.', 'In Stock', 'Yes', '2019-10-03 20:10:55'),
(139, 'Java Black Book', 'Books', '400.00', '460.00', '139.jpg', NULL, NULL, '10% off', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore.', 'In Stock', 'No', '2019-10-03 20:10:55'),
(140, 'Pink Teddy Bear', 'Toys', '1200.00', '1100.00', '140.jpg', NULL, NULL, 'Rs. 100 Off', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore.', 'In Stock', 'Yes', '2019-10-03 20:10:55'),
(141, 'Double Teddy', 'Toys', '800.00', '750.00', '141.jpg', NULL, NULL, 'Rs. 50 Off', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore.', 'In Stock', 'Yes', '2019-10-03 20:10:55'),
(142, 'Micky Mouse', 'Toys', '400.00', '360.00', '142.jpg', NULL, NULL, '10% off', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore.', 'Out of Stock', 'No', '2019-10-03 20:10:55'),
(143, 'Fidget Spinner', 'Toys', '150.00', '140.00', '143.jpg', NULL, NULL, 'Rs 10 Off', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore.', 'In Stock', 'Yes', '2019-10-04 20:10:55'),
(144, 'Red Ball', 'Toys', '50.00', '45.00', '144.jpg', NULL, NULL, '10% off', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore.', 'In Stock', 'No', '2019-10-04 20:10:55'),
(145, 'Football', 'Toys', '150.00', '140.00', '145.jpg', NULL, NULL, 'Rs 10 Off', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore.', 'In Stock', 'No', '2019-10-04 20:10:55'),
(146, 'Cabinet Black', 'Computers', '1800.00', '1700.00', '146.jpg', NULL, NULL, 'Rs. 100 Off', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore.', 'In Stock', 'Yes', '2019-10-04 20:10:55'),
(147, 'Super Bike', 'Toys', '600.00', '550.00', '147.jpg', NULL, NULL, 'Rs. 50 Off', 'Super Racing Cycle\r\nThick tyres 22 inch\r\nbest quality\r\nRanger cycle', 'Out of Stock', 'Yes', '2019-10-04 20:10:55'),
(148, 'Blue Car', 'Toys', '1500.00', '1300.00', '148.jpg', NULL, NULL, '&#8377; 200 off', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore.', 'In Stock', 'Yes', '2019-10-04 20:10:55'),
(149, 'Salwar Suit', 'Cloths', '500.00', '450.00', '149.jpg', NULL, NULL, 'Rs 50 Off', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore.', 'In Stock', 'No', '2019-10-04 20:10:55'),
(150, 'Cotton Salwar Suit', 'Cloths', '800.00', '700.00', '150.jpg', NULL, NULL, 'Rs. 100 each', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore.', 'In Stock', 'Yes', '2019-10-05 20:10:55'),
(151, 'Semi Stitched Straight Gown', 'Cloths', '1500.00', '1350.00', '151.jpg', NULL, NULL, '10% off', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore.', 'In Stock', 'Yes', '2019-10-05 20:10:55'),
(152, 'Anarkali Suit', 'Cloths', '800.00', '699.00', '152.jpg', NULL, NULL, 'Rs. 101 Off', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore.', 'In Stock', 'Yes', '2019-10-05 20:10:55'),
(153, 'Nokia 222 Phone', 'Mobiles', '3500.00', '3300.00', '153.jpg', NULL, NULL, 'Rs. 200 Off', 'This phone is best in market and Nokia is one of the most popular brand and reliable company in Mobile world. Just try this phone and enjoy the world of telecommunications.', 'In Stock', 'Yes', '2019-10-05 20:35:41'),
(154, 'Samsung Gold SM', 'Mobiles', '5000.00', '4500.00', '154.jpg', NULL, NULL, '10% off', 'Lorem ipsum', 'In Stock', 'Yes', '2019-10-05 20:41:58'),
(155, 'Redmi Mi Note 6 Pro', 'Mobiles', '18000.00', '12000.00', '155.jpg', NULL, NULL, '33% Off', 'Redmi Mi Note 6 Pro (Rose Gold, 6GB RAM, 64GB Storage)\r\n12MP+5MP dual rear camera \r\n20MP+2MP dual front camera\r\n15.9004 centimeters (6.26-inch) \r\nmulti-touch capacitive touchscreen with 2280 x 1080 pixels resolution', 'Out of Stock', 'Yes', '2019-10-05 20:44:29'),
(156, 'Redmi Note 5 Pro Gold', 'Mobiles', '16000.00', '10940.00', '156.jpg', NULL, NULL, '32% Off', '12MP+5MP dual rear camera with portrait mode PDAF, HDR, flash \r\n20MP front facing camera with portrait mode, flash light\r\n15.2146 centimeters (5.99-inch) with 2160 x 1080 pixels resolution\r\n403 ppi pixel density; \r\nUnlock your phone at a glance with face unlock all completed in under 0.2 seconds\r\nMemory, Storage and SIM: 4GB RAM\r\n64GB internal memory \r\nDual SIM (nano+nano) \r\ndual-standby (4G+4G)', 'In Stock', 'Yes', '2019-10-05 20:57:12'),
(157, 'Sony Smart TV', 'TV', '16000.00', '14400.00', '157.jpg', NULL, NULL, '10% off', 'The most amazing TV \r\nLED Technology', 'In Stock', 'Yes', '2019-10-06 10:26:52'),
(158, 'Samsung HD TV', 'TV', '25000.00', '20000.00', '158.jpg', NULL, NULL, '20% Off', 'Samsung Hi Definition Very very good picture quality\r\nVery nice buttons ok ki report Aaj hi khariden', 'In Stock', 'Yes', '2019-10-06 17:07:15'),
(159, 'Black Leather Shoes', 'Shoes', '2000.00', '1600.00', '159.jpg', NULL, NULL, '20% Off', 'Best Quality Leather Shoes of Red Chief \r\nAaj hi khariden\r\nBest Price\r\nPure leather', 'In Stock', 'Yes', '2019-10-07 08:24:07'),
(160, 'White Sport Shoes', 'Shoes', '3000.00', '2400.00', '160.jpg', NULL, NULL, '20% Off', 'Very nice looking white sport shoes of Reebok\r\nBest in quality and long lasting\r\nMega Discount offer of 20%\r\nPlease hurry up', 'In Stock', 'Yes', '2019-10-07 08:25:19'),
(161, 'Red Chief Shoes', 'Shoes', '2500.00', '2000.00', '161.jpg', NULL, NULL, 'Rs. 500 Off', 'Best quality shoes made by red chief\r\nBest and mega discount offer available', 'In Stock', 'Yes', '2019-10-07 09:48:33'),
(162, 'Red Kurti', 'Cloths', '1500.00', '1350.00', '162.jpg', NULL, NULL, '10% off', 'Beautiful Red Kurti', 'In Stock', 'No', '2019-10-08 05:44:51'),
(163, 'Yellow Kurti', 'Cloths', '1500.00', '1350.00', '163.jpg', NULL, NULL, '10% off', 'Yellow Kurti\r\nBest in quality', 'In Stock', 'No', '2019-10-08 05:54:13'),
(164, 'Black Kurti', 'Cloths', '1500.00', '1350.00', '164.jpg', NULL, NULL, '10% off', 'Black Cotton Kurti\r\nBest quality product', 'In Stock', 'No', '2019-10-08 05:56:02'),
(165, 'Pink Kurti', 'Cloths', '1500.00', '1350.00', '165.jpg', NULL, NULL, '10% off', 'Pink Cotton Kurti\r\nBest quality', 'In Stock', 'Yes', '2019-10-08 05:56:53'),
(166, 'Nokia 1100', 'Mobiles', '2000.00', '1600.00', '166.jpg', NULL, NULL, '20% Off', 'Simple and Sober\r\nHigh battery backup\r\nLess Price and old is gold pattern\r\nWith Torch light', 'In Stock', 'Yes', '2019-10-12 19:17:12'),
(167, 'Checked Shirt', 'Cloths', '1500.00', '1200.00', '167.jpg', NULL, NULL, '20% Off', 'Beautiful checked shirt\r\nAvailable in different colors', 'In Stock', 'Yes', '2019-11-06 10:25:08'),
(168, 'Orange Shirt', 'Cloths', '1500.00', '1200.00', '168.jpg', NULL, NULL, '20% Off', 'Beautiful shirt\r\nOrange color\r\nlong lasting', 'In Stock', 'No', '2019-11-06 10:26:01'),
(169, 'Android Book', 'Books', '800.00', '720.00', '169.jpg', NULL, NULL, '10% off', 'Android Programming Book\r\nBest Example\r\nLatest version\r\nReal Examples', 'In Stock', 'Yes', '2019-11-06 10:27:50'),
(170, 'Core Advance Java', 'Books', '1500.00', '1350.00', '170.jpg', NULL, NULL, '10% off', 'Core and Advance Java Book\r\nLatest Version\r\nAll Example\r\nBlack book', 'In Stock', 'Yes', '2019-11-06 10:29:26'),
(171, 'CSS3 Book', 'Books', '600.00', '540.00', '171.jpg', NULL, NULL, '10% off', 'Good Examples\r\nFully explained\r\nLatest content\r\nLess Price', 'In Stock', 'No', '2019-11-17 17:52:32'),
(172, 'Reebok Shoes Black', 'Shoes', '2500.00', '2000.00', '172.jpg', NULL, NULL, 'Rs. 500 Off', 'Best Quality Shoes\r\nLong lasting', 'In Stock', 'Yes', '2019-11-17 17:53:39'),
(173, 'Caterpillar Black Shoe', 'Shoes', '3000.00', '2400.00', '173.jpg', NULL, NULL, '20% Off', 'Best Quality Shoes', 'In Stock', 'Yes', '2019-11-17 17:57:22'),
(174, 'Carolina Boot', 'Shoes', '2500.00', '2200.00', '174.jpg', NULL, NULL, '300 Off', 'Steel Toe Boot\r\nCarolina Long Lasting Shoes', 'In Stock', 'Yes', '2019-11-17 17:58:05'),
(175, 'Samsung Full HD TV', 'TV', '32000.00', '30000.00', '175.jpg', NULL, NULL, '2000 off', 'Good Quality Picture\r\nFull HD\r\nSamsung TV\r\n3 years warranty', 'In Stock', 'Yes', '2019-11-17 18:40:48'),
(176, 'Large Sony TV Full HD+', 'TV', '45000.00', '42000.00', '176.jpg', NULL, NULL, '3000 Off', 'Sony Color LED Technology\r\nFull HD\r\n60 inch Screen Large Wide\r\nBest Quality\r\n5 years warranty', 'In Stock', 'Yes', '2019-11-17 18:42:01'),
(177, 'Weston HD TV', 'TV', '25000.00', '22500.00', '177.jpg', NULL, NULL, '10% off', 'Weston TV\r\n3 year warranty\r\nFull HD TV', 'In Stock', 'Yes', '2019-11-17 20:26:37'),
(178, 'OTG Cable', 'Computers', '500.00', '450.00', '178.jpg', NULL, NULL, '10% off', 'Best Quality Cable\r\nLong Lasting\r\n3 years warranty', 'In Stock', 'No', '2019-11-18 11:09:23'),
(179, 'Red Carry Bag', 'Bags', '2400.00', '2000.00', '179.jpg', NULL, NULL, 'Rs 400 Off', 'Best in quality\r\nLong lasting\r\n3 year warranty', 'In Stock', 'Yes', '2019-12-06 18:14:38'),
(180, 'Casual Shirt', 'Cloths', '2000.00', '1800.00', '180.jpg', NULL, NULL, '10% off', 'Good Looking\r\nBest Quality\r\nfully silk', 'In Stock', 'Yes', '2020-06-07 15:05:50');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `fname` varchar(20) NOT NULL,
  `lname` varchar(20) NOT NULL,
  `userid` varchar(30) NOT NULL,
  `pwd` varchar(20) NOT NULL,
  `role` varchar(15) DEFAULT 'Customer'
);

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`fname`, `lname`, `userid`, `pwd`, `role`) VALUES
('Ratan', 'Lal', '9898989898', 'anand', 'Customer'),
('Mohmad', 'A', '9940915566', 'anand', 'Customer'),
('Raju', 'Sharma', '9999999999', 'anand', 'Customer'),
('Anand', 'Singh', 'admin', 'anand', 'Administrator'),
('Anand', 'Singh', 'anandsingh', 'anand', 'Customer'),
('Anil', 'Kapoor', 'anilkapoor', 'aptech', 'Customer'),
('Anil', 'Kapoor', 'anilkapoor@gmail.com', 'anand', 'Customer'),
('Nivedita', 'Adhikari', 'anivedita', 'aptech', 'Customer'),
('Annapurna', 'Singh', 'annu@gmail.com', 'anand', 'Customer'),
('Avinash', 'Kumar', 'avinash', 'anand', 'Customer'),
('Ajay', 'Kumar', 'kajay', 'aptech', 'Customer'),
('Devender', 'Kumar', 'kdev', 'aptech', 'Customer'),
('Manoj', 'Kumar', 'kmanoj', 'aptech', 'Customer'),
('Pradeep', 'Kumar', 'kpradeep', 'anand', 'Customer'),
('Rajesh', 'Kumar', 'rajesh', 'aptech', 'Customer'),
('Mani', 'Rajput', 'rmani', 'anand', 'Customer'),
('Seema', 'Sharma', 'seema', 'aptech', 'Customer'),
('Shubham', 'Vishwakarma', 'shubham@gmail.com', 'anand', 'Customer'),
('Sijin', 'Saji', 'sijin@gmail.com', 'anand', 'Customer'),
('Sunil', 'Sharma', 'sunil@gmail.com', 'hello', 'Customer'),
('Vidhi', 'Rajput', 'vidhi', 'anand', 'Customer'),
('Vijay ', 'Kumar', 'vijay', 'aptech', 'Customer');

-- --------------------------------------------------------

--
-- Structure for view `orderview`
--
DROP TABLE IF EXISTS `orderview`;

CREATE VIEW `orderview`  AS SELECT `o`.`order_id` AS `order_id`, `od`.`orderdate` AS `orderdate`, `p`.`pname` AS `pname`, `p`.`disc_price` AS `disc_price`, `o`.`qty` AS `qty`, (`p`.`disc_price` * `o`.`qty`) AS `amount` FROM ((`order_details` `o` join `products` `p` on((`p`.`prodid` = `o`.`prodid`))) join `orders` `od` on((`od`.`order_id` = `o`.`order_id`))) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`userid`,`prodid`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`catid`);

--
-- Indexes for table `cust_address`
--
ALTER TABLE `cust_address`
  ADD PRIMARY KEY (`userid`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`prodid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `catid` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `prodid` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=184;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
