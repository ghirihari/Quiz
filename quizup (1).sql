-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 31, 2019 at 04:04 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.1.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `quizup`
--
CREATE DATABASE IF NOT EXISTS `quizup` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `quizup`;

DELIMITER $$
--
-- Procedures
--
DROP PROCEDURE IF EXISTS `checker`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `checker` (IN `sno` INT, IN `ans` VARCHAR(50))  NO SQL
BEGIN
	if ans like (SELECT answer from qna where qno = Sno) then
    	insert into sheet (qno,result) values(sno,1);
    ELSE
    	insert into sheet (qno,result) values(sno,0);
    end if;
END$$

DROP PROCEDURE IF EXISTS `insertschedule`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertschedule` (IN `name` VARCHAR(40), IN `nation` VARCHAR(40), IN `fpl` VARCHAR(45))  NO SQL
INSERT INTO schedule (name,nation,fpl) VALUES (name,nation,fpl)$$

DROP PROCEDURE IF EXISTS `registered_cursor`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `registered_cursor` ()  NO SQL
BEGIN
	declare uname TEXT;
    DECLARE EXIT_L BOOLEAN DEFAULT FALSE;
    DECLARE UNAME_CURSOR CURSOR FOR SELECT USERNAME FROM USER_DETAILS;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET EXIT_L = TRUE;
    OPEN UNAME_CURSOR;
    	UNAME_LOOP:LOOP
    	FETCH FROM UNAME_CURSOR INTO UNAME;
    	IF EXIT_L THEN
    		LEAVE UNAME_LOOP;
         ELSE    
            SELECT UNAME;
    	END IF;
    	END LOOP UNAME_LOOP;
	CLOSE UNAME_CURSOR;
   END$$

--
-- Functions
--
DROP FUNCTION IF EXISTS `GET_ANSWER`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `GET_ANSWER` (`SNO` INT) RETURNS VARCHAR(30) CHARSET utf8 NO SQL
BEGIN
 	return (SELECT answer from qna where qno = sno); 
 end$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `gamer_details`
--

DROP TABLE IF EXISTS `gamer_details`;
CREATE TABLE `gamer_details` (
  `gamer_name` varchar(20) NOT NULL,
  `times_played` int(11) NOT NULL,
  `highscore` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gamer_details`
--

INSERT INTO `gamer_details` (`gamer_name`, `times_played`, `highscore`) VALUES
('ghirihari', 1, 0),
('msdhoni', 1, 0),
('steve', 1, 0),
('TONYSTARK', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `qna`
--

DROP TABLE IF EXISTS `qna`;
CREATE TABLE `qna` (
  `question` varchar(100) NOT NULL,
  `answer` varchar(50) NOT NULL,
  `c1` varchar(50) NOT NULL,
  `c2` varchar(50) NOT NULL,
  `c3` varchar(50) NOT NULL,
  `c4` varchar(50) NOT NULL,
  `qno` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `qna`
--

INSERT INTO `qna` (`question`, `answer`, `c1`, `c2`, `c3`, `c4`, `qno`) VALUES
('When did IPL Began?', '2008', '2007', '2008', '2009', '2010', 1),
('Which team won the inaugural IPL in 2008?', 'Rajasthan Royals', 'Deccan Chargers', 'Chennai Super Kings', 'Mumbai Indians', 'Rajasthan Royals', 2),
('Who was the leading run-scorer of the tournament?', 'Suresh Raina', 'Brendon McCullum ', 'Suresh Raina', 'Virat Kholi', 'MS.Dhoni', 3),
('Who was the first batsman to score a century in the IPL', 'Brendon McCullum ', 'MS.Dhoni', 'Chris Gayle', 'Sachin Tendulkar', 'Brendon McCullum ', 4),
('Who was the first bowler to take a hat trick in the IPL', 'Laxmipathy Balaji ', 'Laxmipathy Balaji ', 'Lasith Malinga', 'Sunil Narine', 'Zaheer Khan', 5);

-- --------------------------------------------------------

--
-- Table structure for table `sheet`
--

DROP TABLE IF EXISTS `sheet`;
CREATE TABLE `sheet` (
  `qno` int(11) NOT NULL,
  `result` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sheet`
--

INSERT INTO `sheet` (`qno`, `result`) VALUES
(1, '1'),
(2, '0'),
(3, '0'),
(4, '1'),
(5, '1');

-- --------------------------------------------------------

--
-- Table structure for table `user_details`
--

DROP TABLE IF EXISTS `user_details`;
CREATE TABLE `user_details` (
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `gmail_id` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_details`
--

INSERT INTO `user_details` (`username`, `password`, `gmail_id`) VALUES
('ghirihari', '06071967', 'ghirihari@gmail.com'),
('msdhoni', '12345678', 'ghirihari@gmail.com'),
('steve', 'rogers', 'capamerica@gmail.com'),
('TONYSTARK', 'IAMIRONMAN', 'tony@gmail.com');

--
-- Triggers `user_details`
--
DROP TRIGGER IF EXISTS `user_gamer`;
DELIMITER $$
CREATE TRIGGER `user_gamer` AFTER INSERT ON `user_details` FOR EACH ROW BEGIN
	INSERT INTO gamer_details(gamer_name,times_played,highscore)
    values(NEW.username,1,0);
END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `gamer_details`
--
ALTER TABLE `gamer_details`
  ADD PRIMARY KEY (`gamer_name`),
  ADD UNIQUE KEY `gamer_name` (`gamer_name`);

--
-- Indexes for table `user_details`
--
ALTER TABLE `user_details`
  ADD PRIMARY KEY (`username`),
  ADD UNIQUE KEY `username` (`username`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
