-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 07, 2024 at 01:39 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `carservice`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `booking_id` int(11) NOT NULL,
  `client_id` int(11) DEFAULT NULL,
  `mechanic_id` int(11) DEFAULT NULL,
  `day` date DEFAULT NULL,
  `scheduled_time` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `services` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`booking_id`, `client_id`, `mechanic_id`, `day`, `scheduled_time`, `description`, `services`) VALUES
(4, 1, 101, '2024-10-01', '10:00 AM', 'Engine tune-up', 'Oil change, spark plug replacement'),
(5, 2, 102, '2024-10-02', '14:00 PM', 'Brake inspection', 'Brake pad replacement'),
(6, 3, 103, '2024-10-03', '09:00 AM', 'Tire rotation', 'Tire pressure check');

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id_number` int(11) NOT NULL,
  `full_name` varchar(60) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id_number`, `full_name`, `email`, `phone`, `address`) VALUES
(1, 'John Doe', 'johndoe@example.com', '0712345678', '123 Main Street, Nairobi'),
(2, 'Jane Smith', 'janesmith@example.com', '0723456789', '456 Park Avenue, Mombasa'),
(3, 'Alice Johnson', 'alicejohnson@example.com', '0734567890', '789 Oak Lane, Kisumu'),
(67677, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mechanics`
--

CREATE TABLE `mechanics` (
  `id_number` int(11) NOT NULL,
  `full_name` varchar(60) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `specialty` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mechanics`
--

INSERT INTO `mechanics` (`id_number`, `full_name`, `phone`, `specialty`) VALUES
(101, 'David Kim', '0745678901', 'Engine Repair'),
(102, 'Emily Lee', '0756789012', 'Brake Repair'),
(103, 'Frank Chen', '0767890123', 'Tire Replacement');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `service_id` int(11) NOT NULL,
  `service_name` varchar(100) DEFAULT NULL,
  `service_cost` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`service_id`, `service_name`, `service_cost`) VALUES
(1, 'Oil Change', 3000),
(2, 'Tire Rotation', 1500),
(3, 'Brake Pad Replacement', 5000),
(4, 'Engine Tune-up', 4000);

-- --------------------------------------------------------

--
-- Table structure for table `vehicles`
--

CREATE TABLE `vehicles` (
  `number_plate` varchar(10) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `brand` varchar(30) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `color` varchar(25) DEFAULT NULL,
  `yom` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vehicles`
--

INSERT INTO `vehicles` (`number_plate`, `owner_id`, `brand`, `model`, `color`, `yom`) VALUES
('KBX 123A', 1, 'Toyota', 'Corolla', 'White', 2020),
('KCD 456B', 2, 'Nissan', 'X-Trail', 'Blue', 2018),
('KGH 789C', 3, 'Honda', 'Civic', 'Red', 2022);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `mechanic_id` (`mechanic_id`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id_number`);

--
-- Indexes for table `mechanics`
--
ALTER TABLE `mechanics`
  ADD PRIMARY KEY (`id_number`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`service_id`);

--
-- Indexes for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`number_plate`),
  ADD KEY `owner_id` (`owner_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id_number`),
  ADD CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`mechanic_id`) REFERENCES `mechanics` (`id_number`);

--
-- Constraints for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD CONSTRAINT `vehicles_ibfk_1` FOREIGN KEY (`owner_id`) REFERENCES `clients` (`id_number`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
