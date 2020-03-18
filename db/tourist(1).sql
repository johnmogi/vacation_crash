-- phpMyAdmin SQL Dump
-- version 4.9.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 18, 2020 at 01:31 PM
-- Server version: 10.3.20-MariaDB
-- PHP Version: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tourist`
--
CREATE DATABASE IF NOT EXISTS `tourist` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `tourist`;

-- --------------------------------------------------------

--
-- Table structure for table `followers`
--

CREATE TABLE `followers` (
  `userID` int(10) NOT NULL,
  `vacationID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `followers`
--

INSERT INTO `followers` (`userID`, `vacationID`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userID` int(10) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `userName` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `isAdmin` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userID`, `firstName`, `lastName`, `userName`, `password`, `isAdmin`) VALUES
(1, 'John', 'Mogi', 'JohnMogi', '1234', 1),
(2, 'pill', 'blue', 'bobby5', '123456', 0),
(3, 'Miagi', 'Mickey', 'MICKYAGI', '123465', 1),
(4, 'mogior', 'ds', 'mogior', '123456', 0),
(5, 'JohnMogi', 'JohnMogi', 'JohnMogi', '1234', 0),
(6, 'ad', 'df', 'sdf', 'sdf', 0),
(8, 'test', '1', '1', '1', 1);

-- --------------------------------------------------------

--
-- Table structure for table `vacations`
--

CREATE TABLE `vacations` (
  `vacationName` varchar(50) NOT NULL,
  `vacationID` int(10) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `destination` varchar(80) NOT NULL,
  `picFileName` varchar(40) NOT NULL,
  `startDate` date NOT NULL,
  `endDate` date NOT NULL,
  `price` decimal(65,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vacations`
--

INSERT INTO `vacations` (`vacationName`, `vacationID`, `description`, `destination`, `picFileName`, `startDate`, `endDate`, `price`) VALUES
('Zanzibar Delights', 1, 'Located in Stone Town within a short walk of Shangani Beach, Garden Lodge is within a few miles (5 km) of other popular sights such as Nakupenda Beach. This 18-room hotel has free breakfast along with conveniences like free in-room WiFi and a rooftop terrace. ', 'zanzibar', '1.jpeg', '2020-04-15', '2020-04-29', '1600'),
('zanziland', 2, 'Located in Stone Town within a short walk of Shangani Beach, Garden Lodge is within a few miles (5 km) of other popular sights such as Nakupenda Beach. This 18-room hotel has free breakfast along with conveniences like free in-room WiFi and a rooftop terrace. ', 'zanzibar', '2.jpeg', '2020-04-15', '2020-04-29', '1579'),
('madagaskar height', 4, 'bug gig me up', 'Madagaskar', '3.jpeg', '2020-03-18', '2020-03-25', '1900'),
('light me up', 6, 'DJ drezland', 'Europe', '4.jpeg', '2018-03-18', '2020-03-25', '3000'),
('kjhiu', 7, 'kjhkjhbknkhnkjnkjcgdfhfgnhmkjhgttr4w4y77655', 'aefsqef', '5.jpeg', '2020-03-17', '2020-03-03', '868685'),
('Zurich Splendor', 8, 'lorem ipsum', 'Germany', '6.jpeg', '2020-03-24', '2020-03-31', '200'),
('Miyanmar', 9, 'lorem ipsum', 'Pacific', '7.jpeg', '2020-03-24', '2020-03-31', '350'),
('Corona City Wuhan', 10, 'lorem ipsum', 'China', '8.jpeg', '2020-03-24', '2020-03-31', '25'),
('Mexico City ', 11, 'Call the police', 'Mexico', '9.jpeg', '2020-03-24', '2020-03-31', '3500'),
('Ashdod ', 12, 'Worst city in the world', 'Israel', '10.jpeg', '2020-03-24', '2020-03-31', '45000');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `followers`
--
ALTER TABLE `followers`
  ADD PRIMARY KEY (`userID`),
  ADD KEY `vacationID` (`vacationID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userID`);

--
-- Indexes for table `vacations`
--
ALTER TABLE `vacations`
  ADD PRIMARY KEY (`vacationID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `vacations`
--
ALTER TABLE `vacations`
  MODIFY `vacationID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `followers`
--
ALTER TABLE `followers`
  ADD CONSTRAINT `followers_ibfk_1` FOREIGN KEY (`vacationID`) REFERENCES `vacations` (`vacationID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `followers_ibfk_2` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
