-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 22, 2019 at 08:51 PM
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
-- Database: `lms2019`
--

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `BookID` varchar(5) NOT NULL,
  `Name` varchar(225) DEFAULT NULL,
  `Author` varchar(225) DEFAULT NULL,
  `MCatID` varchar(10) DEFAULT NULL,
  `SCatID` varchar(10) DEFAULT NULL,
  `PublishYear` varchar(10) DEFAULT NULL,
  `ISBN` varchar(17) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`BookID`, `Name`, `Author`, `MCatID`, `SCatID`, `PublishYear`, `ISBN`) VALUES
('B001', 'Basics Of Java', 'Mark Zug', 'M001', 'S002', '2019', 'ISB-2019-001'),
('B002', 'Algorithms', 'Kim Astrin', 'M001', 'S002', '2019', 'ISB-2019-002'),
('B003', 'Reinsfocement', 'Nivee de costa', 'M001', 'S001', '2006', 'ISB-2019-003'),
('B004', 'Cooking basics', 'Karan Sharma', 'M005', 'S006', '2006', 'ISB-2019-004'),
('B005', 'Open Cv', 'Karan Sharma', 'M007', 'S007', '2018', 'ISB-2019-005');

-- --------------------------------------------------------

--
-- Table structure for table `main_cat`
--

CREATE TABLE `main_cat` (
  `MCatID` varchar(5) NOT NULL,
  `MCatName` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `main_cat`
--

INSERT INTO `main_cat` (`MCatID`, `MCatName`) VALUES
('M003', 'Arts'),
('M002', 'Bussiness'),
('M004', 'Cinimography'),
('M007', 'Data Science'),
('M001', 'Engineering'),
('M005', 'Hotel Management'),
('M006', 'Sports');

-- --------------------------------------------------------

--
-- Table structure for table `sub_cat`
--

CREATE TABLE `sub_cat` (
  `SCatID` varchar(5) NOT NULL,
  `SCatName` varchar(225) NOT NULL,
  `MCatID` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sub_cat`
--

INSERT INTO `sub_cat` (`SCatID`, `SCatName`, `MCatID`) VALUES
('S001', 'Civil Engineering', 'M001'),
('S002', 'Software Engineering', 'M001'),
('S003', 'History', 'M003'),
('S004', 'Cricket', 'M006'),
('S005', 'Geography', 'M003'),
('S006', 'Cooking', 'M005'),
('S007', 'Open Cv', 'M007'),
('S008', 'Deep Learning', 'M007');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`BookID`),
  ADD KEY `MCatID_idx` (`MCatID`),
  ADD KEY `SCatID_idx` (`SCatID`);

--
-- Indexes for table `main_cat`
--
ALTER TABLE `main_cat`
  ADD PRIMARY KEY (`MCatID`),
  ADD UNIQUE KEY `ClassificationName_UNIQUE` (`MCatName`);

--
-- Indexes for table `sub_cat`
--
ALTER TABLE `sub_cat`
  ADD PRIMARY KEY (`SCatID`),
  ADD UNIQUE KEY `SCatName_UNIQUE` (`SCatName`),
  ADD KEY `MCatID_idx` (`MCatID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `AAA` FOREIGN KEY (`MCatID`) REFERENCES `main_cat` (`MCatID`),
  ADD CONSTRAINT `BBB` FOREIGN KEY (`SCatID`) REFERENCES `sub_cat` (`SCatID`);

--
-- Constraints for table `sub_cat`
--
ALTER TABLE `sub_cat`
  ADD CONSTRAINT `MCatSC` FOREIGN KEY (`MCatID`) REFERENCES `main_cat` (`MCatID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
