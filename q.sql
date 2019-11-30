-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 30, 2019 at 03:56 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cat`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertschedule` (IN `name` VARCHAR(40), IN `nation` VARCHAR(40), IN `fpl` VARCHAR(45))  NO SQL
INSERT INTO schedule (name,nation,fpl) VALUES (name,nation,fpl)$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `constructors`
--

CREATE TABLE `constructors` (
  `name` varchar(20) NOT NULL,
  `country` varchar(20) NOT NULL,
  `points` int(11) NOT NULL,
  `wins` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `drivers`
--

CREATE TABLE `drivers` (
  `name` varchar(30) NOT NULL,
  `car_no` int(11) NOT NULL,
  `team` varchar(20) NOT NULL,
  `nation` varchar(20) NOT NULL,
  `wins` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `drivers`
--

INSERT INTO `drivers` (`name`, `car_no`, `team`, `nation`, `wins`) VALUES
('Daniel Ricciardo', 3, 'Redbull', 'Australia', 6),
('Sebastian Vettel', 5, 'Ferrari', 'Germany', 50),
('Sergio Perez', 11, 'Force India', 'Mexico', 0);

-- --------------------------------------------------------

--
-- Table structure for table `driverstand`
--

CREATE TABLE `driverstand` (
  `name` varchar(30) NOT NULL,
  `cname` varchar(20) NOT NULL,
  `points` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

CREATE TABLE `schedule` (
  `name` varchar(20) NOT NULL,
  `nation` varchar(20) NOT NULL,
  `fpl` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `schedule`
--

INSERT INTO `schedule` (`name`, `nation`, `fpl`) VALUES
('Autodrome Monza', 'Italy', '2019-04-05');

-- --------------------------------------------------------

--
-- Table structure for table `tracks`
--

CREATE TABLE `tracks` (
  `name` varchar(20) NOT NULL,
  `country` varchar(20) NOT NULL,
  `m` int(11) NOT NULL,
  `s` int(11) NOT NULL,
  `ms` int(11) NOT NULL,
  `driver` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tracks`
--

INSERT INTO `tracks` (`name`, `country`, `m`, `s`, `ms`, `driver`) VALUES
('Albert Park', 'Australia', 1, 18, 331, 'Lewis Hamilton'),
('Autodrome Monza', 'Italy', 1, 19, 119, 'Sebastian Vettel'),
('Monte Carlo', 'Monaco', 1, 14, 439, 'Daniel Ricciardo');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `constructors`
--
ALTER TABLE `constructors`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `drivers`
--
ALTER TABLE `drivers`
  ADD PRIMARY KEY (`car_no`);

--
-- Indexes for table `schedule`
--
ALTER TABLE `schedule`
  ADD KEY `name` (`name`);

--
-- Indexes for table `tracks`
--
ALTER TABLE `tracks`
  ADD PRIMARY KEY (`name`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `schedule`
--
ALTER TABLE `schedule`
  ADD CONSTRAINT `schedule_ibfk_1` FOREIGN KEY (`name`) REFERENCES `tracks` (`name`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
