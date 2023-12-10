-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 08, 2023 at 06:06 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `autozone`
--
CREATE DATABASE IF NOT EXISTS `autozone` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `autozone`;

-- --------------------------------------------------------

--
-- Table structure for table `client`
--
-- Creation: Dec 06, 2023 at 03:39 PM
-- Last update: Dec 08, 2023 at 05:01 AM
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `orderid` int(11) NOT NULL AUTO_INCREMENT,
  `total` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`orderid`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELATIONSHIPS FOR TABLE `client`:
--

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`orderid`, `total`, `date`) VALUES
(1, 0, '2023-12-06'),
(2, 0, '2023-12-07'),
(3, 0, '2023-12-07'),
(4, 0, '2023-12-07'),
(6, 19000, '2023-12-07'),
(7, 13000, '2023-12-07'),
(8, 34750, '2023-12-07'),
(9, 31250, '2023-12-07'),
(10, 16500, '2023-12-07'),
(11, 4700, '2023-12-07'),
(12, 19000, '2023-12-07'),
(13, 26299, '2023-12-07'),
(14, 4700, '2023-12-08'),
(15, 5700, '2023-12-08'),
(16, 10700, '2023-12-08');

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--
-- Creation: Dec 01, 2023 at 07:58 PM
--

DROP TABLE IF EXISTS `inventory`;
CREATE TABLE IF NOT EXISTS `inventory` (
  `itemid` char(4) NOT NULL,
  `items` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELATIONSHIPS FOR TABLE `inventory`:
--

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`itemid`, `items`) VALUES
('1', 'Mountain Peak Everest 27.5er'),
('2', 'Mountain Peak Vulcan 29er'),
('3', 'Mountain Peak Ninja 27.5er'),
('4', 'Mountain Peak Titan 48TT'),
('5', 'Mountain Explore 29er'),
('6', 'Bolany Coil Fork 27.5er'),
('7', 'Ragusa R-700 29er'),
('8', 'Roadnado Carbon 700c'),
('9', 'Toseek Carbon 29er'),
('10', 'Sagmit K1 29er'),
('11', 'Shimano Altus'),
('12', 'Shimano Deore'),
('13', 'Shimano SLX'),
('14', 'Shimano Sora'),
('15', 'Shimano Tiagra'),
('16', 'Shimano MT-200'),
('17', 'Merocca Hydraulic'),
('18', 'ZTTO 4 Piston'),
('19', 'Shimano Combo Shifter'),
('20', 'Zoom DB680'),
('21', 'Pasak 700c 40mm'),
('22', 'Sagmit Ultralite'),
('23', 'Sagmit Racing Pro'),
('24', 'Sagmit Evo 27.5'),
('25', 'Agent X 27.5'),
('26', 'Bike Overhaul'),
('27', 'Wheel Alignment'),
('28', 'Re-Pack'),
('29', 'Part Installation'),
('30', 'Bike Tune'),
('31', 'Brake Bleed');

-- --------------------------------------------------------

--
-- Table structure for table `pricelist`
--
-- Creation: Dec 02, 2023 at 04:03 PM
--

DROP TABLE IF EXISTS `pricelist`;
CREATE TABLE IF NOT EXISTS `pricelist` (
  `itemid` char(4) NOT NULL,
  `itemprice` decimal(10,2) NOT NULL,
  `repairid` char(4) NOT NULL,
  `repair_price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELATIONSHIPS FOR TABLE `pricelist`:
--

--
-- Dumping data for table `pricelist`
--

INSERT INTO `pricelist` (`itemid`, `itemprice`, `repairid`, `repair_price`) VALUES
('1', 5700.00, '26', 1000.00),
('2', 5100.00, '27', 300.00),
('3', 4700.00, '28', 100.00),
('4', 13000.00, '29', 50.00),
('5', 19000.00, '30', 50.00),
('6', 999.00, '31', 20.00),
('7', 999.00, 'NULL', 0.00),
('8', 3000.00, 'NULL', 0.00),
('9', 3500.00, 'NULL', 0.00),
('10', 2400.00, 'NULL', 0.00),
('11', 400.00, 'NULL', 0.00),
('12', 6800.00, 'NULL', 0.00),
('13', 10500.00, 'NULL', 0.00),
('14', 14000.00, 'NULL', 0.00),
('15', 18000.00, 'NULL', 0.00),
('16', 1399.00, 'NULL', 0.00),
('17', 1200.00, 'NULL', 0.00),
('18', 2400.00, 'NULL', 0.00),
('19', 200.00, 'NULL', 0.00),
('20', 700.00, 'NULL', 0.00),
('21', 3000.00, 'NULL', 0.00),
('22', 4300.00, 'NULL', 0.00),
('23', 4000.00, 'NULL', 0.00),
('24', 2300.00, 'NULL', 0.00),
('25', 1800.00, 'NULL', 0.00);


--
-- Metadata
--
USE `phpmyadmin`;

--
-- Metadata for table client
--

--
-- Metadata for table inventory
--

--
-- Metadata for table pricelist
--

--
-- Metadata for database autozone
--
SET FOREIGN_KEY_CHECKS=1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
