-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 28, 2022 at 09:43 PM
-- Server version: 8.0.27-0ubuntu0.20.04.1
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pulse_club`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertData` (IN `in_username` VARCHAR(40), IN `in_gender` VARCHAR(8), IN `in_mobile` VARCHAR(20), IN `in_email` VARCHAR(20), IN `in_dob` VARCHAR(10), IN `in_joining_date` VARCHAR(10), IN `in_userid` VARCHAR(20))  BEGIN
INSERT INTO users(username, gender, mobile, email, dob, joining_date, userid) VALUES(in_username,in_gender,in_mobile,in_email,in_dob,in_joining_date,in_userid);
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int NOT NULL,
  `username` varchar(500) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(100) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `contact` varchar(20) NOT NULL,
  `gender` varchar(500) NOT NULL,
  `created_on` date NOT NULL,
  `group_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `email`, `password`, `fname`, `lname`, `contact`, `gender`, `created_on`, `group_id`) VALUES
(1, 'samibaig', 'samibaig@gmail.com', 'sami', 'Sami', 'Baig', '2374982784', 'Male', '2018-04-30', 1);

-- --------------------------------------------------------

--
-- Table structure for table `enrolls_to`
--

CREATE TABLE `enrolls_to` (
  `et_id` int NOT NULL,
  `pid` varchar(8) NOT NULL,
  `uid` varchar(20) NOT NULL,
  `paid_date` varchar(15) DEFAULT NULL,
  `expire` varchar(15) DEFAULT NULL,
  `renewal` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `enrolls_to`
--

INSERT INTO `enrolls_to` (`et_id`, `pid`, `uid`, `paid_date`, `expire`, `renewal`) VALUES
(1, 'VHGRZQ', '1632822240', '2021-09-28', '2021-09-28', 'no'),
(2, 'NQULSK', '1632832743', '2021-09-28', '2022-03-28', 'yes'),
(3, 'NQULSK', '1632889033', '2021-09-29', '2021-09-28', 'no'),
(4, 'VHGRZQ', '1632889033', '2021-09-29', '2021-12-29', 'yes'),
(5, 'OQMFVR', '1632822240', '2021-09-29', '2021-11-29', 'yes'),
(6, 'OQMFVR', '1632935360', '2021-09-29', '2021-09-28', 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` int NOT NULL,
  `userid` varchar(20) NOT NULL,
  `action` varchar(40) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`id`, `userid`, `action`, `date`) VALUES
(1, '1632725629', 'User Deleted Succesfully', '2021-09-28 14:38:47'),
(2, '1632757308', 'User Deleted Succesfully', '2021-09-28 14:38:47'),
(3, '1632822240', 'Data Inserted Succesfully', '2021-09-28 14:44:14'),
(4, '1632832743', 'Data Inserted Succesfully', '2021-09-28 17:39:43'),
(5, '1632889033', 'Data Inserted Succesfully', '2021-09-29 09:18:02'),
(6, '1632822240', 'Data Updated Succesfully', '2021-09-29 22:07:49'),
(7, '1632822240', 'Data Updated Succesfully', '2021-09-29 22:08:08'),
(8, '1632832743', 'Data Updated Succesfully', '2021-09-29 22:08:45'),
(9, '1632935360', 'Data Inserted Succesfully', '2021-09-29 22:09:32');

-- --------------------------------------------------------

--
-- Table structure for table `plan`
--

CREATE TABLE `plan` (
  `pid` varchar(8) NOT NULL,
  `planName` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `description` varchar(200) NOT NULL,
  `validity` varchar(20) NOT NULL,
  `amount` int NOT NULL,
  `active` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `plan`
--

INSERT INTO `plan` (`pid`, `planName`, `description`, `validity`, `amount`, `active`) VALUES
('NQULSK', '6th  month plan', '6th  month plan', '6', 18000, 'yes'),
('OQMFVR', 'Premium', 'hjhdsjhkfjads', '2', 5000, 'yes'),
('VHGRZQ', 'One month for Everyone', 'This plan is for everyone', '3', 6000, 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userid` varchar(20) NOT NULL,
  `username` varchar(40) NOT NULL,
  `gender` varchar(8) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `email` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `city` varchar(20) NOT NULL,
  `joining_date` varchar(10) NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userid`, `username`, `gender`, `mobile`, `email`, `city`, `joining_date`, `status`) VALUES
('1632822240', 'Farhan Faqir1234', 'Male', '3456789', 'farhan@gmail.com', 'Hunza', '2021-09-28', 2),
('1632832743', 'Ali Zahra', 'Female', '787723456789', 'alizahra@gmail.com', 'Gilgit', '2021-09-28', 1),
('1632889033', 'Sami Baig', 'Male', '3456789', 'sami@gmail.com', 'Hunza', '2021-09-29', 1),
('1632935360', 'Farhan Faqir', 'Male', '3456789', 'farhan123@gmail.com', 'Hunza', '2021-09-29', 1);

--
-- Triggers `users`
--
DELIMITER $$
CREATE TRIGGER `deleteUser` BEFORE DELETE ON `users` FOR EACH ROW INSERT INTO logs VALUES(null, OLD.userid, "User Deleted Succesfully", NOW() )
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insertUser` AFTER INSERT ON `users` FOR EACH ROW INSERT INTO logs VALUES(null, NEW.userid, "Data Inserted Succesfully", NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `updateUser` AFTER UPDATE ON `users` FOR EACH ROW INSERT INTO logs VALUES(null, NEW.userid, "Data Updated Succesfully", NOW() )
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `enrolls_to`
--
ALTER TABLE `enrolls_to`
  ADD PRIMARY KEY (`et_id`) USING BTREE,
  ADD KEY `user_ID` (`uid`) USING BTREE,
  ADD KEY `plan_ID_idx` (`pid`) USING BTREE;

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `plan`
--
ALTER TABLE `plan`
  ADD PRIMARY KEY (`pid`) USING BTREE,
  ADD KEY `pid` (`pid`) USING BTREE;

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userid`) USING BTREE,
  ADD UNIQUE KEY `email` (`email`) USING BTREE,
  ADD KEY `userid` (`userid`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `enrolls_to`
--
ALTER TABLE `enrolls_to`
  MODIFY `et_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `enrolls_to`
--
ALTER TABLE `enrolls_to`
  ADD CONSTRAINT `plan_ID` FOREIGN KEY (`pid`) REFERENCES `plan` (`pid`),
  ADD CONSTRAINT `user_ID` FOREIGN KEY (`uid`) REFERENCES `users` (`userid`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
