
-- USED TO CREATE THE COMPLETE DATABASE
-- WITH SOME SAMPLE DEVICES

-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 22, 2019 at 09:08 PM
-- Server version: 10.1.10-MariaDB
-- PHP Version: 7.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `iot_devices`
--

-- --------------------------------------------------------

--
-- Table structure for table `data_shared`
--

CREATE TABLE `data_shared` (
  `id` int(10) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `data_shared`
--

INSERT INTO `data_shared` (`id`, `title`, `description`) VALUES
(1, 'User Name', ''),
(2, 'User Password', ''),
(3, 'User current location', ''),
(4, 'Mobile phone O.S', ''),
(5, 'Smart plug firmware', ''),
(6, 'Smart Cam firmware', ''),
(7, 'Smart lamb firmware', '');

-- --------------------------------------------------------

--
-- Table structure for table `devices_names`
--

CREATE TABLE `devices_names` (
  `id` int(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `type` text NOT NULL,
  `manufacturer` varchar(50) NOT NULL,
  `IoT_app` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `devices_names`
--

INSERT INTO `devices_names` (`id`, `name`, `type`, `manufacturer`, `IoT_app`) VALUES
(1, 'HS110', 'Smart plug', 'TP-Link', 'KASA version 2.11.0'),
(3, 'NC200', 'Smart camera', 'TP-Link', 'TpCamera version 3.1.12'),
(4, 'F7D7601fc', 'NetCam HD', 'Belkin', 'NetCam version 2.0.4'),
(5, 'B22', 'Smart lamp', 'Lifx', 'LIFX version 3.13.0');

-- --------------------------------------------------------

--
-- Table structure for table `devices_to_data`
--

CREATE TABLE `devices_to_data` (
  `id` int(10) NOT NULL,
  `devices_id` int(10) NOT NULL,
  `data_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `devices_to_data`
--

INSERT INTO `devices_to_data` (`id`, `devices_id`, `data_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 3, 1),
(7, 3, 2),
(8, 3, 4),
(9, 3, 6),
(10, 4, 1),
(11, 4, 4),
(12, 4, 6),
(13, 5, 1),
(14, 5, 2),
(15, 5, 4),
(16, 5, 7);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `data_shared`
--
ALTER TABLE `data_shared`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `title` (`title`);

--
-- Indexes for table `devices_names`
--
ALTER TABLE `devices_names`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `devices_to_data`
--
ALTER TABLE `devices_to_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `devices_id` (`devices_id`),
  ADD KEY `data_id` (`data_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `data_shared`
--
ALTER TABLE `data_shared`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `devices_names`
--
ALTER TABLE `devices_names`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `devices_to_data`
--
ALTER TABLE `devices_to_data`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `devices_to_data`
--
ALTER TABLE `devices_to_data`
  ADD CONSTRAINT `devices_to_data_ibfk_1` FOREIGN KEY (`devices_id`) REFERENCES `devices_names` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `devices_to_data_ibfk_2` FOREIGN KEY (`data_id`) REFERENCES `data_shared` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
