-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 19, 2019 at 06:37 AM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `xmode`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `sl_no` int(255) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`sl_no`, `user_name`, `password`) VALUES
(1212, 'admin', 'admin'),
(7578, 'mathan', 'pass123');

-- --------------------------------------------------------

--
-- Table structure for table `book_table`
--

CREATE TABLE `book_table` (
  `book_sl_no` varchar(300) NOT NULL,
  `book_title` varchar(300) NOT NULL,
  `category_name` varchar(300) DEFAULT NULL,
  `category_num` varchar(10) DEFAULT NULL,
  `author_name` varchar(300) DEFAULT NULL,
  `author_num` varchar(10) DEFAULT NULL,
  `publisher_name` varchar(300) DEFAULT NULL,
  `publisher_num` varchar(10) DEFAULT NULL,
  `edition` varchar(100) DEFAULT NULL,
  `volume` varchar(100) DEFAULT NULL,
  `ean_code` varchar(300) DEFAULT NULL,
  `isbn` varchar(300) DEFAULT NULL,
  `price` varchar(300) DEFAULT NULL,
  `purchase_date` varchar(300) DEFAULT NULL,
  `language` varchar(300) DEFAULT NULL,
  `total_book_in_library` int(255) DEFAULT NULL,
  `total_book_available` int(255) DEFAULT NULL,
  `description` varchar(10000) DEFAULT NULL,
  `added_on` varchar(100) DEFAULT NULL,
  `edited_on` varchar(100) DEFAULT NULL,
  `added_by` varchar(100) DEFAULT NULL,
  `edited_by` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `book_table`
--

INSERT INTO `book_table` (`book_sl_no`, `book_title`, `category_name`, `category_num`, `author_name`, `author_num`, `publisher_name`, `publisher_num`, `edition`, `volume`, `ean_code`, `isbn`, `price`, `purchase_date`, `language`, `total_book_in_library`, `total_book_available`, `description`, `added_on`, `edited_on`, `added_by`, `edited_by`) VALUES
('', 'React Js', 'programming', '4', 'Mark', '0', 'fb', '0', 'w', '44', 'jggf', 'iugbiu62', '452', NULL, 'Eng', 0, 0, 'n', '19-Feb-2019 12:15:29 AM', NULL, 'ADMIN', NULL),
('1001', 'Java core', 'JavaBasics', '3', 'Mathan', '2', 'Mathan', '2', '4th ', '142', '102gi', '54994', '4200', NULL, 'Eng', 0, 0, 'Hello\r\n', '18-Feb-2019 09:52:11 PM', '18-Feb-2019 10:52:05 PM', 'ADMIN', NULL),
('1002', 'Javascript Basics', 'Programming', '4', 'mathan', '0', 'Mathan', '0', '4th', '125', '994949', 'guyg4489', '452', NULL, 'eng', 0, 0, 'ds', '18-Feb-2019 11:49:16 PM', NULL, 'ADMIN', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `sl_no` int(255) NOT NULL,
  `category_name` varchar(300) NOT NULL,
  `profile` varchar(100) DEFAULT NULL,
  `added_on` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`sl_no`, `category_name`, `profile`, `added_on`) VALUES
(1, 'sdf', '', '18-Feb-2019 03:23:22 PM'),
(2, 'novel', 'All Type of Novels here', '18-Feb-2019 03:35:34 PM'),
(3, 'JavaBasics', '', '18-Feb-2019 09:52:11 PM'),
(4, 'Programming', '', '18-Feb-2019 11:49:16 PM');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`sl_no`);

--
-- Indexes for table `book_table`
--
ALTER TABLE `book_table`
  ADD PRIMARY KEY (`book_sl_no`),
  ADD UNIQUE KEY `book_title` (`book_title`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`sl_no`),
  ADD UNIQUE KEY `category_name` (`category_name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `sl_no` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7579;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `sl_no` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
