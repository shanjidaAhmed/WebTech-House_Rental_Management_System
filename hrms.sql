-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 27, 2026 at 04:05 PM
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
-- Database: `hrms`
--

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `bookingID` int(11) NOT NULL,
  `clientID` int(11) NOT NULL,
  `propertyID` int(11) NOT NULL,
  `bookingDate` date NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`bookingID`, `clientID`, `propertyID`, `bookingDate`, `status`) VALUES
(201, 6, 102, '2025-01-01', 'Active'),
(202, 7, 104, '2025-01-05', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `notificationID` int(11) NOT NULL,
  `bookingID` int(11) NOT NULL,
  `managerID` int(11) NOT NULL,
  `clientID` int(11) NOT NULL,
  `message` varchar(1000) NOT NULL,
  `dueDate` date DEFAULT NULL,
  `sentDate` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`notificationID`, `bookingID`, `managerID`, `clientID`, `message`, `dueDate`, `sentDate`) VALUES
(1, 202, 2, 7, 'amount is due.please clear it soon', '2026-09-09', '2026-09-07 19:55:18'),
(2, 201, 2, 6, 'clear it quickly', '2026-09-12', '2026-09-07 20:01:41'),
(3, 202, 2, 7, 'clear it soon', '2026-09-24', '2026-09-14 14:38:36');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `paymentID` int(11) NOT NULL,
  `bookingID` int(11) NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `paymentDate` date NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`paymentID`, `bookingID`, `amount`, `paymentDate`, `status`) VALUES
(301, 201, 2800.00, '2025-01-01', 'Completed'),
(302, 202, 1950.00, '2025-01-15', 'Completed');

-- --------------------------------------------------------

--
-- Table structure for table `property`
--

CREATE TABLE `property` (
  `propertyID` int(11) NOT NULL,
  `ownerID` int(11) NOT NULL,
  `Title` varchar(200) NOT NULL,
  `propertyType` varchar(50) NOT NULL,
  `status` varchar(20) NOT NULL,
  `rent` decimal(12,2) NOT NULL,
  `location` varchar(255) NOT NULL,
  `bedrooms` int(11) NOT NULL DEFAULT 0,
  `bathrooms` int(11) NOT NULL DEFAULT 0,
  `area` int(11) NOT NULL DEFAULT 0,
  `availabilityDate` date DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `images` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `property`
--

INSERT INTO `property` (`propertyID`, `ownerID`, `Title`, `propertyType`, `status`, `rent`, `location`, `bedrooms`, `bathrooms`, `area`, `availabilityDate`, `description`, `images`) VALUES
(101, 4, 'Parkside Modern Villa', '', 'Accepted', 3800.00, 'Seattle, WA', 0, 0, 0, NULL, 'Modern villa with spacious rooms and garden.', NULL),
(102, 5, 'Sunset Luxury Penthouse', '', 'Accepted', 2800.00, 'Seattle, WA', 0, 0, 0, NULL, 'Luxury penthouse with beautiful city views.', NULL),
(103, 4, 'Riverside Cabin Deluxe', '', 'Rejected', 3100.00, 'Denver, CO', 0, 0, 0, NULL, 'Comfortable cabin near the riverside.', NULL),
(104, 5, 'Oakwood Townhouse', '', 'Accepted', 1950.00, 'Portland, OR', 0, 0, 0, NULL, 'Modern townhouse suitable for families.', NULL),
(105, 4, 'Ocean Breeze Cabin', '', 'Accepted', 3400.00, 'Malibu, CA', 0, 0, 0, NULL, 'Beachside cabin with ocean views.', NULL),
(106, 5, 'Golsan Villa', '', 'Rejected', 50000.00, 'Dhaka', 0, 0, 0, NULL, 'This is high class villa', NULL),
(107, 5, 'Uttara', 'Apartment', 'Pending', 20000.00, 'Dhaka', 2, 1, 500, '2026-09-16', 'this is a small apartment', '[\"uploads/property_6a9ecc8327b658.10526639.jpg\"]');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userID` int(11) NOT NULL,
  `userName` varchar(100) NOT NULL,
  `userEmail` varchar(150) NOT NULL,
  `userPassword` varchar(255) NOT NULL,
  `userRole` varchar(20) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `salary` decimal(12,2) DEFAULT NULL,
  `joiningDate` date DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL
) ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userID`, `userName`, `userEmail`, `userPassword`, `userRole`, `phone`, `salary`, `joiningDate`, `address`) VALUES
(1, 'Admin Supervisor', 'admin@rentease.com', '123456', 'ADMIN', '01710000001', 80000.00, '2024-01-01', 'Dhaka, Bangladesh'),
(2, 'Marcus Sterling', 'marcus.s@rentease.com', '123789', 'manager', '01710000002', 60000.00, '2024-02-01', 'Dhaka, Bangladesh'),
(3, 'Daniel Miller', 'daniel.m@rentease.com', '$2y$10$wAfS9cdUR77eKXMIMkZaOuHhPSg5Kg43bcl2OwdeU4DmCtwjAAeqW', 'manager', '01710000003', 58000.00, '2024-03-01', 'Dhaka, Bangladesh'),
(4, 'Alice Henderson', 'alice.h@rentease.com', '123456', 'manager', '01710000004', NULL, NULL, 'Gulshan, Dhaka'),
(5, 'Sarah Jenkins', 'sarah.j@rentease.com', '123456', 'OWNER', '01710000005', NULL, NULL, 'Banani, Dhaka'),
(6, 'Robert Fox', 'robert@rentease.com', '123456', 'CLIENT', '01710000006', NULL, NULL, 'Uttara, Dhaka'),
(7, 'Jenny Wilson', 'jenny@rentease.com', '123456', 'CLIENT', '01710000007', NULL, NULL, 'Mirpur, Dhaka');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`bookingID`),
  ADD KEY `fk_booking_client` (`clientID`),
  ADD KEY `fk_booking_property` (`propertyID`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`notificationID`),
  ADD KEY `fk_notification_booking` (`bookingID`),
  ADD KEY `fk_notification_manager` (`managerID`),
  ADD KEY `fk_notification_client` (`clientID`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`paymentID`),
  ADD KEY `fk_payment_booking` (`bookingID`);

--
-- Indexes for table `property`
--
ALTER TABLE `property`
  ADD PRIMARY KEY (`propertyID`),
  ADD KEY `fk_property_owner` (`ownerID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userID`),
  ADD UNIQUE KEY `userEmail` (`userEmail`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `bookingID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=203;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `notificationID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `paymentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=303;

--
-- AUTO_INCREMENT for table `property`
--
ALTER TABLE `property`
  MODIFY `propertyID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `fk_booking_client` FOREIGN KEY (`clientID`) REFERENCES `users` (`userID`),
  ADD CONSTRAINT `fk_booking_property` FOREIGN KEY (`propertyID`) REFERENCES `property` (`propertyID`);

--
-- Constraints for table `notification`
--
ALTER TABLE `notification`
  ADD CONSTRAINT `fk_notification_booking` FOREIGN KEY (`bookingID`) REFERENCES `booking` (`bookingID`),
  ADD CONSTRAINT `fk_notification_client` FOREIGN KEY (`clientID`) REFERENCES `users` (`userID`),
  ADD CONSTRAINT `fk_notification_manager` FOREIGN KEY (`managerID`) REFERENCES `users` (`userID`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `fk_payment_booking` FOREIGN KEY (`bookingID`) REFERENCES `booking` (`bookingID`);

--
-- Constraints for table `property`
--
ALTER TABLE `property`
  ADD CONSTRAINT `fk_property_owner` FOREIGN KEY (`ownerID`) REFERENCES `users` (`userID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
