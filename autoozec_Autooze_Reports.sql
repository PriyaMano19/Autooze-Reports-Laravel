-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 15, 2022 at 05:18 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `autoozec_rsautosolutions`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(5) NOT NULL,
  `username` varchar(50) COLLATE utf8_bin NOT NULL,
  `password` varchar(50) COLLATE utf8_bin NOT NULL,
  `user_level` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `user_level`) VALUES
(5, 'kodplex', '0192023a7bbd73250516f069df18b500', 1);

-- --------------------------------------------------------

--
-- Table structure for table `advance`
--

CREATE TABLE `advance` (
  `ad_id` int(11) NOT NULL,
  `emp_id` varchar(50) NOT NULL,
  `advance` int(11) NOT NULL,
  `type` tinyint(2) NOT NULL DEFAULT 2 COMMENT '1 => Salary 2=> Advance',
  `status` tinyint(2) NOT NULL DEFAULT 1,
  `date_of_advance` date NOT NULL,
  `updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `bay`
--

CREATE TABLE `bay` (
  `id` int(11) NOT NULL,
  `bay_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bay`
--

INSERT INTO `bay` (`id`, `bay_name`) VALUES
(1, 'bay 1'),
(2, 'bay 2');

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

CREATE TABLE `bill` (
  `bill_type` varchar(100) COLLATE utf8_bin NOT NULL,
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `bill_no` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `bill_date` date DEFAULT NULL,
  `vehicle_no` int(11) DEFAULT NULL,
  `service` varchar(100) COLLATE utf8_bin NOT NULL,
  `service_type` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `unit_price` int(11) DEFAULT NULL,
  `price` int(11) NOT NULL,
  `discount` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `book_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `vehicle_no` varchar(100) NOT NULL,
  `contact_no` varchar(100) NOT NULL,
  `service` varchar(100) NOT NULL,
  `sub_service` varchar(100) NOT NULL,
  `book_date` date NOT NULL,
  `book_time` time NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT 0,
  `action` tinyint(2) NOT NULL DEFAULT 0,
  `cancel` int(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `booking_service`
--

CREATE TABLE `booking_service` (
  `service_id` int(4) NOT NULL,
  `service` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `booking_service`
--

INSERT INTO `booking_service` (`service_id`, `service`) VALUES
(1, 'full service'),
(2, 'oil changing');

-- --------------------------------------------------------

--
-- Table structure for table `booking_sub_service`
--

CREATE TABLE `booking_sub_service` (
  `sub_service_id` int(11) NOT NULL,
  `sub_service_name` varchar(100) NOT NULL,
  `sub_description` varchar(200) NOT NULL,
  `service_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `booking_sub_service`
--

INSERT INTO `booking_sub_service` (`sub_service_id`, `sub_service_name`, `sub_description`, `service_id`) VALUES
(1, 'Brakes ', ' A complete assessment of brake condition and performance will be carried out.', 1),
(2, 'Conventional oil', 'Derived from crude oil pulled from the ground and then refined in a factory. ', 2),
(3, 'Fuel ', 'Mechanics will check the condition of the external fuel system, including the filler cap and fuel lines.', 1),
(4, 'Full-synthetic motor oil', 'Made entirely in a factory but is more refined and known to be better for your engine.', 2);

-- --------------------------------------------------------

--
-- Table structure for table `chat_history`
--

CREATE TABLE `chat_history` (
  `id` int(11) NOT NULL,
  `contact_no` varchar(50) NOT NULL,
  `msg` varchar(255) NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `fname` varchar(100) COLLATE utf8_bin NOT NULL,
  `lname` varchar(100) COLLATE utf8_bin NOT NULL,
  `address` varchar(200) COLLATE utf8_bin NOT NULL,
  `city` varchar(200) COLLATE utf8_bin NOT NULL,
  `mobile` varchar(30) COLLATE utf8_bin NOT NULL,
  `email` varchar(30) COLLATE utf8_bin NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `default_msg`
--

CREATE TABLE `default_msg` (
  `msg_id` int(5) NOT NULL,
  `msg` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `emp`
--

CREATE TABLE `emp` (
  `emp_id` varchar(50) NOT NULL,
  `id` int(11) NOT NULL,
  `emp_name` varchar(50) NOT NULL,
  `emp_loc` varchar(50) NOT NULL,
  `emp_des` tinyint(2) NOT NULL,
  `emp_salary` int(11) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT 1,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `delete_emp` tinyint(2) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `emp`
--

INSERT INTO `emp` (`emp_id`, `id`, `emp_name`, `emp_loc`, `emp_des`, `emp_salary`, `status`, `created`, `updated`, `delete_emp`) VALUES
('Ddd', 1, 'Re', 'Jaffna', 2, 10000, 1, '2021-12-21 09:50:26', '2022-01-03 04:21:17', 1);

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `employee_id` int(11) NOT NULL,
  `employee` varchar(100) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `expense`
--

CREATE TABLE `expense` (
  `id` int(11) NOT NULL,
  `ex_date` date NOT NULL,
  `location` varchar(100) NOT NULL,
  `ref_no` varchar(100) NOT NULL,
  `payee_name` varchar(100) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `catogery` int(11) DEFAULT NULL,
  `method` varchar(100) NOT NULL,
  `check_date` date DEFAULT NULL,
  `amount` int(11) NOT NULL,
  `paid` int(11) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated` timestamp NOT NULL DEFAULT current_timestamp(),
  `entered` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `expense`
--

INSERT INTO `expense` (`id`, `ex_date`, `location`, `ref_no`, `payee_name`, `description`, `catogery`, `method`, `check_date`, `amount`, `paid`, `created`, `updated`, `entered`) VALUES
(1, '2022-01-01', 'Vavuniya', '293', 'J.THUSYANTHAN', 'R.S STAFF LUNCH', 0, 'cash', '0000-00-00', 300, 1, '2022-01-11 09:14:09', '2022-01-11 09:14:09', 1),
(3, '2022-01-02', 'Vavuniya', '295', 'MR THAVARANJITHAN (R.S MANGER)', 'ONE DAY CUP,TRASPORT CHARGE, THIRUPATHY CREAM HOUSE', 0, 'cash', '0000-00-00', 4100, 1, '2022-01-11 09:30:51', '2022-01-11 09:30:51', 1),
(5, '2022-01-02', 'Vavuniya', '294', 'R.S AUTO SOLUTION ', 'R.S STAFF NEW YEAR CELEBRATION (SODA)', 0, 'cash', '0000-00-00', 400, 1, '2022-01-11 11:15:44', '2022-01-11 11:15:44', 1),
(6, '2022-01-02', 'Vavuniya', '297', 'J.GAWASKAR', 'ADVANCE SALARY', 0, 'cash', '0000-00-00', 3000, 1, '2022-01-11 11:17:04', '2022-01-11 11:17:04', 1),
(7, '2022-01-03', 'Vavuniya', '298', 'MR RAMESH (COTTON CLOTH)', 'WASTE CLOTH (COTTON CLOTH)', 0, 'cash', '0000-00-00', 3360, 1, '2022-01-11 11:18:30', '2022-01-11 11:18:30', 1),
(8, '2022-01-02', 'Vavuniya', '296', 'J. THUSYANTHAN ', 'R.S STAFF LUNCH', 0, 'cash', '0000-00-00', 400, 1, '2022-01-11 11:22:45', '2022-01-11 11:22:45', 1),
(9, '2022-01-03', 'Vavuniya', '299', 'J.THUSYANTHAN', '1 1/2 BRUSH (CORNER STONE HARD WARE', 0, 'cash', '0000-00-00', 700, 1, '2022-01-11 11:25:17', '2022-01-11 11:25:17', 1),
(10, '2022-01-11', 'Vavuniya', '300', 'MR K NIRUJAN', 'KUGAN MOTOR STORES(OIL FILTER), ROYAL HARD WARE,LUCKY HARDWARE,TRANSPORT CHARGE', 0, 'cash', '0000-00-00', 2540, 1, '2022-01-11 11:29:36', '2022-01-11 11:29:36', 1),
(11, '2022-01-03', 'Jaffna', '301', 'K. NIRUJAN', 'MUBARAH HAJY (MEDIUM BAG SOPIN)', 0, 'cash', '0000-00-00', 180, 1, '2022-01-11 11:31:23', '2022-01-11 11:31:23', 1),
(12, '2022-01-03', 'Vavuniya', '302', 'J. THUSYANTHAN', 'R.S STAFF LUNCH', 0, 'cash', '0000-00-00', 500, 1, '2022-01-11 11:32:56', '2022-01-11 11:32:56', 1),
(13, '2022-01-03', 'Jaffna', '303', 'R.S AUTO SOLUTION', 'VARNAM PRINTERS (STICKER PRINTER)', 0, 'cash', '0000-00-00', 10000, 1, '2022-01-11 11:35:06', '2022-01-11 11:35:06', 1),
(14, '2022-01-03', 'Vavuniya', '304', 'R. MALARVILI', 'IN-669 CUSTOMER ONLINE TRANSFER SODA CASH', 0, 'cash', '0000-00-00', 200, 1, '2022-01-11 11:36:45', '2022-01-11 11:36:45', 1),
(15, '2022-01-04', 'Vavuniya', '305', 'J THUSYANTHAN', 'RS STAFF LUNCH', 0, 'cash', '0000-00-00', 400, 1, '2022-01-12 10:03:14', '2022-01-12 10:03:14', 1),
(16, '2022-01-04', 'Vavuniya', '306', 'J. THUSYANTHAN ', 'SUPER GULU', 0, 'cash', '0000-00-00', 300, 1, '2022-01-12 10:04:21', '2022-01-12 10:04:21', 1),
(17, '2022-01-04', 'Vavuniya', '307', 'R.S DIRECTOR (RAMESH SIR)', 'DOUPLE TAP', 0, 'cash', '0000-00-00', 2200, 1, '2022-01-12 10:07:41', '2022-01-12 10:07:41', 1),
(18, '2022-01-13', 'Vavuniya', '309', 'M THUSYANTHAN', 'SALARY', 0, 'cash', '0000-00-00', 25000, 1, '2022-01-13 07:59:14', '2022-01-13 07:59:14', 1),
(19, '2022-01-05', 'Vavuniya', '308', 'R.S MANAGER (THAVARANJITHAN)', 'VANNI BABY NEEDS&BOOK CENTER', 0, 'cash', '0000-00-00', 570, 1, '2022-01-13 08:02:35', '2022-01-13 08:02:35', 1),
(20, '2022-01-05', 'Vavuniya', '310', 'MR JOWAN SERVICE ADVICER', 'VAVUNIYA HARDWARE KANDY MOTORS PULENDRAN LANKA L.O.C', 0, 'cash', '0000-00-00', 2510, 1, '2022-01-13 08:35:20', '2022-01-13 08:35:20', 1),
(21, '2022-01-05', 'Jaffna', '311', 'NAVASEELAN', 'SALARY', 0, 'cash', '0000-00-00', 20000, 1, '2022-01-13 08:36:10', '2022-01-13 08:36:10', 1),
(22, '2022-01-05', 'Jaffna', '312', 'J.THUSYANTHAN', 'R.S STAFF LUNCH', 0, 'cash', '0000-00-00', 400, 1, '2022-01-13 08:36:51', '2022-01-13 08:36:51', 1),
(23, '2022-01-05', 'Vavuniya', '313', 'JOWAN (SERVICE ADVICER)', 'WHEEL ALAINGMENT (FORD CAB)', 0, 'cash', '0000-00-00', 1800, 1, '2022-01-13 08:37:47', '2022-01-13 08:37:47', 1),
(24, '2022-01-05', 'Vavuniya', '314', 'R.S AUTO SOLUTION', 'WATER &AUTO CHARGE', 0, 'cash', '0000-00-00', 750, 1, '2022-01-13 08:38:41', '2022-01-13 08:38:41', 1),
(25, '2022-01-06', 'Vavuniya', '315', 'SANTHANAM', ' SALARY', 0, 'cash', '0000-00-00', 15000, 1, '2022-01-13 08:39:38', '2022-01-13 08:39:38', 1),
(26, '2022-01-06', 'Vavuniya', '316', 'K. NIRUJAN', 'VAVUNIYA HARD WARE', 0, 'cash', '0000-00-00', 2000, 1, '2022-01-13 08:41:51', '2022-01-13 08:41:51', 1),
(27, '2022-01-06', 'Vavuniya', '317', 'J.THUSYANTHAN', 'R.S STAFF LUNCH', 0, 'cash', '0000-00-00', 400, 1, '2022-01-13 08:44:23', '2022-01-13 08:44:23', 1),
(28, '2022-01-06', 'Vavuniya', '319', 'R.S MANGER MR THAVARANJITHAN', ' TRANSPORT CHARGE', 0, 'cash', '0000-00-00', 500, 1, '2022-01-13 10:59:26', '2022-01-13 10:59:26', 1),
(29, '2022-01-07', 'Vavuniya', '318', 'J THUSYANTHAN', '3KG SUGAR', 0, 'cash', '0000-00-00', 420, 1, '2022-01-13 11:00:14', '2022-01-13 11:00:14', 1),
(30, '2022-01-07', 'Vavuniya', '320', 'J. THUSYANTHAN ', 'R.S STAFF LUNCH', 0, 'cash', '0000-00-00', 400, 1, '2022-01-13 11:00:47', '2022-01-13 11:00:47', 1),
(31, '2022-01-07', 'Vavuniya', '322', 'RAJA TINKERING', 'SHARAN HARDWARE', 0, 'cash', '0000-00-00', 580, 1, '2022-01-13 11:03:23', '2022-01-13 11:03:23', 1),
(32, '2022-01-07', 'Vavuniya', '323', 'R.S MANAGER (THAVARANJITHAN)', 'STAR HARDWARE, VARNAM PRINTERS', 0, 'cash', '0000-00-00', 21060, 1, '2022-01-13 11:05:07', '2022-01-13 11:05:07', 1),
(33, '2022-01-08', 'Vavuniya', '324', 'THAVASEELAN', 'PETROL& KEROSENE & RATHTHI', 0, 'cash', '0000-00-00', 1180, 1, '2022-01-13 11:07:01', '2022-01-13 11:07:01', 1),
(34, '2022-01-08', 'Vavuniya', '325', 'J. THUSYANTHAN ', 'R.S STAFF LUNCH', 0, 'cash', '0000-00-00', 400, 1, '2022-01-13 11:07:27', '2022-01-13 11:07:27', 1),
(35, '2022-01-09', 'Vavuniya', '326', 'J.THUSYANTHAN', 'R.S STAFF LUNCH', 0, 'cash', '0000-00-00', 300, 1, '2022-01-13 11:07:58', '2022-01-13 11:07:58', 1),
(36, '2022-01-10', 'Vavuniya', '327', 'J.THUSYANTHAN', 'R.S STAFF LUNCH', 0, 'cash', '0000-00-00', 300, 1, '2022-01-13 11:15:43', '2022-01-13 11:15:43', 1),
(37, '2022-01-10', 'Vavuniya', '328', 'R.S AUTO SOLUTION', 'ARULMIKU MUTHTHUMARI AMPAL TEMPLE', 0, 'cash', '0000-00-00', 500, 1, '2022-01-13 11:18:31', '2022-01-13 11:18:31', 1),
(38, '2022-01-10', 'Vavuniya', '329', 'JOWAN (SERVICE ADVICER)', 'RADIATOR TOP CAP', 0, 'cash', '0000-00-00', 3600, 1, '2022-01-13 11:19:44', '2022-01-13 11:19:44', 1),
(39, '2022-01-11', 'Vavuniya', '330', 'MR THAVARANJITHAN (R.S MANGER)', 'SUGANTHANS, TRANSPORT CHARGE', 0, 'cash', '0000-00-00', 900, 1, '2022-01-13 11:21:02', '2022-01-13 11:21:02', 1),
(40, '2022-01-11', 'Vavuniya', '331', 'JOWAN (SERVICE ADVICER)', 'LOGI SPARE PARTS', 0, 'cash', '0000-00-00', 150, 1, '2022-01-13 11:21:48', '2022-01-13 11:21:48', 1),
(41, '2022-01-11', 'Vavuniya', '332', 'J. THUSYANTHAN', 'RS STAFF LUNCH', 0, 'cash', '0000-00-00', 300, 1, '2022-01-13 11:22:33', '2022-01-13 11:22:33', 1),
(42, '2022-01-11', 'Vavuniya', '333', 'RAJINI TRANSPORT', 'HIGH PRESSURE CHEMICALS TRANSPORT CHARGE JAFFANA-VAVUNIYA', 0, 'cash', '0000-00-00', 500, 1, '2022-01-13 11:24:00', '2022-01-13 11:24:00', 1),
(43, '2022-01-11', 'Vavuniya', '334', 'R.S AUTO SOLUTION', 'AUTO & WATER CHARGES', 0, 'cash', '0000-00-00', 750, 1, '2022-01-13 11:25:41', '2022-01-13 11:25:41', 1),
(44, '2022-01-11', 'Vavuniya', '335', 'R.S DIRECTOR (RAMESH SIR)', 'M.K.P MARKETING, LOGI SPARE PARTS', 0, 'cash', '0000-00-00', 12505, 1, '2022-01-13 11:26:48', '2022-01-13 11:26:48', 1),
(45, '2022-01-11', 'Vavuniya', '336', 'JOWAN (SERVICE ADVICER)', 'NEW AYSHA MULTY COMPLEX', 0, 'cash', '0000-00-00', 1650, 1, '2022-01-13 11:27:42', '2022-01-13 11:27:42', 1),
(46, '2022-01-12', 'Vavuniya', '337', 'JOWAN (SERVICE ADVICER)', 'VAVUNIYA HARD WARE', 0, 'cash', '0000-00-00', 500, 1, '2022-01-13 11:28:48', '2022-01-13 11:28:48', 1),
(47, '2022-01-12', 'Vavuniya', '338', 'J. THUSYANTHAN', 'RS STAFF LUNCH', 0, 'cash', '0000-00-00', 580, 1, '2022-01-13 11:29:43', '2022-01-13 11:29:43', 1),
(48, '2022-01-12', 'Vavuniya', '340', 'POSTMASTER', 'IDNTYFY PLACE FOR NEW RESTRURENT', 0, 'cash', '0000-00-00', 1500, 1, '2022-01-13 11:30:51', '2022-01-13 11:30:51', 1),
(49, '2022-01-12', 'Vavuniya', '341', 'J. THUSYANTHAN', 'ANCHOR 250G & TEA LOOSE', 0, 'cash', '0000-00-00', 1310, 1, '2022-01-13 11:31:53', '2022-01-13 11:31:53', 1),
(50, '2022-01-13', 'Vavuniya', '342', 'J. THUSYANTHAN', 'RS STAFF LUNCH', 0, 'cash', '0000-00-00', 620, 1, '2022-01-13 11:32:30', '2022-01-13 11:32:30', 1),
(51, '2022-01-13', 'Vavuniya', '343', 'J. THUSYANTHAN', 'WHITE SUGAR & KEROSENE &HARPIC', 0, 'cash', '0000-00-00', 2480, 1, '2022-01-13 11:34:09', '2022-01-13 11:34:09', 1),
(52, '2022-01-13', 'Vavuniya', '344', 'J.THUSYANTHAN', ' ADVANCE SALARY', 0, 'cash', '0000-00-00', 5000, 1, '2022-01-24 05:32:26', '2022-01-24 05:32:26', 1),
(53, '2022-01-13', 'Vavuniya', '346', 'M.THUSYANTHAN', 'ADVANCE SALARY', 0, 'cash', '0000-00-00', 5000, 1, '2022-01-24 05:33:54', '2022-01-24 05:33:54', 1),
(54, '2022-01-13', 'Vavuniya', '345', 'GAWASKAR & NITHTHI', 'FOOD ALLOWANCE', 0, 'cash', '0000-00-00', 4000, 1, '2022-01-24 05:44:59', '2022-01-24 05:44:59', 1),
(55, '2022-01-16', 'Vavuniya', '347', 'NAGENTHIRAN', 'CONSTRACTIONS WORKERS SALARY', 0, 'cash', '0000-00-00', 4500, 1, '2022-01-24 06:02:32', '2022-01-24 06:02:32', 1),
(56, '2022-01-17', 'Vavuniya', '348', 'MR K NIRUJAN', ' NEW VZVUNIYA HARDWARE, LEENAN TRANDING CO,', 0, 'cash', '0000-00-00', 2380, 1, '2022-01-24 07:40:11', '2022-01-24 07:40:11', 1),
(57, '2022-01-17', 'Vavuniya', '349', 'R.S AUTO SOLUTIONS', 'WATER CHARGE', 0, 'cash', '0000-00-00', 500, 1, '2022-01-24 07:41:06', '2022-01-24 07:41:06', 1),
(58, '2022-01-18', 'Vavuniya', '350', 'R.S DIRECTOR (RAMESH SIR)', 'JOB CARD BOOK TEN (SOORYA PRINTING)', 0, 'cash', '0000-00-00', 3200, 1, '2022-01-24 07:42:47', '2022-01-24 07:42:47', 1),
(59, '2022-01-18', 'Vavuniya', '351', 'K. NIRUJAN', 'SHARAN HARD WARE , MULTI GUM, TAB, PEPPER CUTTER', 0, 'cash', '0000-00-00', 870, 1, '2022-01-24 07:44:36', '2022-01-24 07:44:36', 1),
(60, '2022-01-19', 'Vavuniya', '352', 'VISHVA', 'AT MULTI SHOP , THIRUMHAL STROES', 0, 'cash', '0000-00-00', 1040, 1, '2022-01-24 10:09:07', '2022-01-24 10:09:07', 1),
(61, '2022-01-19', 'Vavuniya', '353', 'MR JOWAN', 'KEROSENE & PETROL CHARGES', 0, 'cash', '0000-00-00', 1000, 1, '2022-01-24 10:10:29', '2022-01-24 10:10:29', 1),
(62, '2022-01-20', 'Vavuniya', '354', 'MR NAGENTHIRAN', ' R. S AUTO SOLUTION CONSTRUCTION WORKERS SALARY', 0, 'cash', '0000-00-00', 7000, 1, '2022-01-24 10:11:38', '2022-01-24 10:11:38', 1),
(63, '2022-01-20', 'Vavuniya', '355', ' MR SANJEEVAN PAINTER HELPER', 'ADVANCE SALARY', 0, 'cash', '0000-00-00', 10000, 1, '2022-01-24 10:12:23', '2022-01-24 10:12:23', 1),
(64, '2022-01-20', 'Vavuniya', '356', 'J.GAWASKAR, K.NITHTHIYANATHAN', 'FOOD ALLOWANCE ADVANCE SALARY', 0, 'cash', '0000-00-00', 1000, 1, '2022-01-24 10:13:19', '2022-01-24 10:13:19', 1),
(65, '2022-01-21', 'Vavuniya', '357', 'R.S AUTO SOLUTIONS', 'GARBERGE DISPOSEL PAYMENT', 0, 'cash', '0000-00-00', 300, 1, '2022-01-24 10:14:12', '2022-01-24 10:14:12', 1),
(66, '2022-01-21', 'Vavuniya', '359', 'MR NOWSHARTH', ' TOOLS WORLD THINGS PAYMENT', 0, 'cash', '0000-00-00', 16500, 1, '2022-01-24 10:15:54', '2022-01-24 10:15:54', 1),
(67, '2022-01-21', 'Vavuniya', '360', 'R.S AUTO SOLUTIONS', 'R.S CONSTRUCTION WORKS', 0, 'cash', '0000-00-00', 7000, 1, '2022-01-24 10:20:21', '2022-01-24 10:20:21', 1),
(68, '2022-01-22', 'Vavuniya', '361', 'R.S AUTO SOLUTIONS', ' COCOLA BALANCES CUSTOMER CARD PAYMENT', 0, 'cash', '0000-00-00', 205, 1, '2022-01-24 10:21:30', '2022-01-24 10:21:30', 1),
(69, '2022-01-22', 'Vavuniya', '362', 'R.S AUTO SOLUTIONS', 'WATER & AUTO CHARGES', 0, 'cash', '0000-00-00', 710, 1, '2022-01-24 10:22:06', '2022-01-24 10:22:06', 1),
(70, '2022-01-22', 'Vavuniya', '363', 'M.THUSYANTHAN', 'ADVANCE SALARY', 0, 'cash', '0000-00-00', 5000, 1, '2022-01-24 10:31:07', '2022-01-24 10:31:07', 1),
(71, '2022-01-23', 'Vavuniya', '364', 'GOWRIDASAN ', 'WATAWALA 500G', 0, 'cash', '0000-00-00', 650, 1, '2022-01-24 10:31:59', '2022-01-24 10:31:59', 1),
(72, '2022-02-10', 'jaffna', '300', 'R.priya', 'test kodplex', 0, 'cash', '2022-02-17', 500, 1, '2022-02-01 05:37:16', '2022-02-01 05:37:16', 1),
(73, '2022-02-10', 'jaffna', '300', 'R.priya', 'test kodplex', 0, 'cash', '2022-02-17', 500, 1, '2022-02-01 05:37:19', '2022-02-01 05:37:19', 1);

-- --------------------------------------------------------

--
-- Table structure for table `int_brand`
--

CREATE TABLE `int_brand` (
  `brand_id` tinyint(4) NOT NULL,
  `catogery` tinyint(4) NOT NULL DEFAULT 0,
  `brand` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `int_brand`
--

INSERT INTO `int_brand` (`brand_id`, `catogery`, `brand`) VALUES
(1, 1, 'sakura'),
(2, 1, 'hxfi'),
(3, 4, 'TOYATA'),
(4, 4, 'SUZUKI'),
(5, 4, 'NISSAN'),
(6, 4, 'HONDA'),
(7, 4, 'MITSUBISHI'),
(8, 4, 'ISUSU'),
(9, 4, 'SUMO'),
(10, 4, 'MAHINDRA'),
(11, 4, 'TATA'),
(12, 4, 'HIGHFIL'),
(13, 4, 'BOSCH'),
(14, 3, 'TOYATA'),
(15, 4, 'MARUTI'),
(16, 4, 'WURTH'),
(17, 12, 'WURTH'),
(18, 12, 'MOBIL SUPER'),
(19, 12, 'MOBIL SUPER'),
(20, 12, 'MOBIL SUPER'),
(21, 12, 'MOBIL SUPER'),
(22, 12, 'HONDA'),
(23, 12, 'HONDA'),
(24, 12, 'TOYOTA B'),
(25, 4, 'J.C.B.B'),
(26, 4, 'M.G.P B'),
(27, 4, 'CLEAN FILTERS'),
(28, 4, 'FORD B'),
(29, 4, 'HYUNDAI B'),
(30, 4, 'KIA B'),
(31, 4, 'SSANG YONG'),
(32, 4, 'GHEELY'),
(33, 4, 'VOLKWAGEN'),
(34, 4, 'G.M.'),
(35, 4, 'MAZDA B'),
(36, 4, 'UNION JAPAN'),
(37, 4, 'SUPRO'),
(38, 4, 'CORNER'),
(39, 4, 'H.K.'),
(40, 4, 'CWORKS'),
(41, 4, 'FULL'),
(42, 4, 'J.S'),
(43, 4, 'MAX'),
(44, 4, 'H.K.'),
(45, 4, 'SANKO'),
(46, 4, 'SUPRO'),
(47, 4, 'LEWEDA'),
(48, 4, 'WON JIN'),
(49, 4, 'FILTON'),
(50, 4, 'OKIYA'),
(51, 4, 'CHINA'),
(52, 4, 'LEYPARTS'),
(53, 4, 'CHINA'),
(54, 4, 'BAJAJ'),
(55, 4, 'LEYPARTS'),
(56, 4, 'C.F'),
(57, 4, 'AUTO PAL'),
(58, 4, 'CORALFLY'),
(59, 4, 'SAKOLA'),
(60, 4, 'WICK'),
(61, 4, 'FILTON'),
(62, 4, 'ISUZU B'),
(63, 4, 'DYNAMAX'),
(64, 4, 'CORALFLY'),
(65, 4, 'MAHINDRA B'),
(66, 13, 'WURTH'),
(67, 14, 'WURTH'),
(68, 15, 'WURTH'),
(69, 16, 'WURTH'),
(70, 18, 'NIPPON'),
(71, 19, 'NIPPON'),
(72, 11, 'MICROSOL'),
(73, 11, 'DASH'),
(74, 11, 'DASH'),
(75, 7, 'DASH'),
(76, 3, 'SERVO'),
(77, 3, 'SERVO'),
(78, 3, 'SERVO'),
(79, 11, 'CASTILE'),
(80, 20, 'WURTH'),
(81, 11, 'WURTH'),
(82, 21, 'WURTH'),
(83, 21, 'WURTH'),
(84, 21, 'WURTH'),
(85, 23, 'WURTH'),
(86, 24, 'WURTH'),
(87, 11, 'wurth'),
(88, 7, 'WURTH'),
(89, 26, ''),
(90, 26, 'WURTH'),
(91, 26, 'WURTH'),
(92, 28, 'WURTH'),
(93, 3, 'MOBIL SUPER'),
(94, 29, 'WURTH'),
(95, 29, 'WURTH'),
(96, 29, 'WURTH'),
(97, 25, 'WURTH'),
(98, 13, 'WURTH'),
(99, 5, 'WURTH'),
(100, 5, 'WURTH'),
(101, 4, 'VIC'),
(102, 4, 'PERADUA'),
(103, 6, 'NIPPON'),
(104, 7, 'DASH'),
(105, 7, 'MICROSOL'),
(106, 7, 'MICROSOL'),
(107, 34, 'NIPPON'),
(108, 3, 'CALTEX'),
(109, 4, 'MAZDA B'),
(110, 4, 'PRIME'),
(111, 4, 'FULL'),
(112, 4, 'HYUNDAI B'),
(113, 4, 'SAKURA'),
(114, 4, 'ELOFIC'),
(115, 4, 'MITSURAMA'),
(116, 4, 'GHEELY'),
(117, 3, 'CALTEX'),
(118, 35, 'MICROSOL'),
(119, 38, 'KLT');

-- --------------------------------------------------------

--
-- Table structure for table `int_catogery`
--

CREATE TABLE `int_catogery` (
  `cat_id` tinyint(4) NOT NULL,
  `catogery` varchar(100) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `int_catogery`
--

INSERT INTO `int_catogery` (`cat_id`, `catogery`) VALUES
(3, 'OIL'),
(4, 'Filter'),
(5, 'WURTH'),
(6, 'PAINT WORK'),
(7, 'SERVICE'),
(8, 'VEHICLE PARTS'),
(9, 'MECHANIC WORK'),
(11, 'SERVICE MATERIAL'),
(12, 'ELECRICAL'),
(13, 'BULB'),
(14, 'HOSE CLAMP'),
(15, 'WIPER'),
(16, 'SANDPAPER'),
(34, 'PAINT'),
(35, 'MICROSOL'),
(36, 'SAMPOO'),
(37, 'AIR FRESHNER POCKERT'),
(38, 'AIR FRESHNER  LIQUID');

-- --------------------------------------------------------

--
-- Table structure for table `int_filter_range`
--

CREATE TABLE `int_filter_range` (
  `filter_range_id` int(11) NOT NULL,
  `filter_range` varchar(50) NOT NULL,
  `catogery` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `int_filter_range`
--

INSERT INTO `int_filter_range` (`filter_range_id`, `filter_range`, `catogery`) VALUES
(1, 'DIESEL ADDITIVE', 7),
(2, 'FHVBK;MV', 13);

-- --------------------------------------------------------

--
-- Table structure for table `int_items`
--

CREATE TABLE `int_items` (
  `item_id` varchar(100) NOT NULL,
  `item_name` varchar(100) NOT NULL,
  `item_catogery` int(11) DEFAULT NULL,
  `item_sub_catogery` int(11) DEFAULT NULL,
  `item_brand` int(11) DEFAULT NULL,
  `filter_range` int(11) DEFAULT NULL,
  `part_number` varchar(100) DEFAULT NULL,
  `capacity` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `int_items`
--

INSERT INTO `int_items` (`item_id`, `item_name`, `item_catogery`, `item_sub_catogery`, `item_brand`, `filter_range`, `part_number`, `capacity`, `created_at`, `updated_at`) VALUES
('001 135', 'C-115', 4, 2, 3, NULL, '', '', '2022-01-11 06:13:15', '2022-01-11 06:13:15'),
('001-028', 'O-584', 4, 2, 45, NULL, '', '', '2021-11-24 05:31:05', '2021-11-24 05:31:05'),
('001-093', 'C-503', 4, 2, 37, NULL, '', '', '2021-11-24 05:31:28', '2021-11-24 05:31:28'),
('001-097', 'O-504', 4, 2, 38, NULL, '', '', '2021-12-12 07:47:19', '2021-12-12 07:47:19'),
('001-100', 'C-516', 4, 2, 41, NULL, '', '', '2021-11-24 05:31:50', '2021-11-24 05:31:50'),
('001-137', 'O-121', 4, 2, 3, NULL, '', '', '2021-11-23 10:49:30', '2021-11-23 10:49:30'),
('001-139', 'O-206', 4, 2, 5, NULL, '', '', '2021-11-23 10:49:52', '2021-11-23 10:49:52'),
('001-142', 'C-218', 4, 2, 5, NULL, '', '', '2021-11-23 10:50:19', '2021-11-23 10:50:19'),
('001-155', 'C-16510 M 65LOO', 4, 2, 26, NULL, '', '', '2021-11-23 10:54:04', '2021-11-23 10:54:04'),
('001-173', 'C-502', 4, 2, 44, NULL, '', '', '2021-11-24 05:32:41', '2021-11-24 05:32:41'),
('001-182', 'O-502', 4, 2, 41, NULL, '', '', '2021-11-24 05:33:03', '2021-11-24 05:33:03'),
('001-184', 'C-303', 4, 2, 110, NULL, '', '', '2021-12-12 07:57:18', '2021-12-12 07:57:18'),
('001-185', 'C-805', 4, 2, 3, NULL, '', '', '2021-12-12 07:57:47', '2021-12-12 07:57:47'),
('001-190', 'JX-85100C', 4, 2, 53, NULL, '', '', '2021-11-24 05:42:06', '2021-11-24 05:42:06'),
('001-193', 'JXO-810Y', 4, 2, 53, NULL, '', '', '2021-11-24 05:42:40', '2021-11-24 05:42:40'),
('001-207', 'TATA 207DI-OLD', 4, 2, 43, NULL, '', '', '2021-11-24 05:44:44', '2021-11-24 05:44:44'),
('001-212', 'TATA-1210', 4, 2, 43, NULL, '', '', '2021-11-24 05:45:20', '2021-11-24 05:45:20'),
('001-242', 'C-306', 4, 2, 7, NULL, '', '', '2021-11-23 11:01:18', '2021-11-23 11:01:18'),
('001-245', 'C-411', 4, 2, 42, NULL, '', '', '2021-11-24 05:21:10', '2021-11-24 05:21:10'),
('001-261', 'O-503', 4, 2, 43, NULL, '', '', '2021-11-24 05:33:25', '2021-11-24 05:33:25'),
('001-279', 'C-15208 8127R', 4, 2, 57, NULL, '', '', '2021-11-24 05:48:50', '2021-11-24 05:48:50'),
('001-307', 'C-101 (A)', 4, 2, 3, NULL, '', '', '2021-11-23 11:02:11', '2021-11-23 11:02:11'),
('001-320', 'C-310', 4, 2, 7, NULL, '', '', '2021-11-23 11:02:44', '2021-11-23 11:02:44'),
('001-327', 'C-809', 4, 2, 45, NULL, '', '', '2021-11-24 05:34:21', '2021-11-24 05:34:21'),
('001-336', 'F7A01500', 4, 2, 55, NULL, '', '', '2021-11-24 05:49:25', '2021-11-24 05:49:25'),
('001-344', 'C-409', 4, 2, 42, NULL, '', '', '2021-11-24 05:22:59', '2021-11-24 05:22:59'),
('001-345', 'C-302', 4, 2, 44, NULL, '', '', '2021-12-12 07:58:15', '2021-12-12 07:58:15'),
('001-367', 'WB-178', 4, 2, 51, NULL, '', '', '2021-11-24 05:50:43', '2021-11-24 05:50:43'),
('001-377', 'P 310 15 40', 4, 2, 55, NULL, '', '', '2021-11-24 05:51:18', '2021-11-24 05:51:18'),
('001-422', 'WO-1110', 4, 2, 43, NULL, '', '', '2021-11-24 05:51:54', '2021-11-24 05:51:54'),
('001-429', 'SUPER ACE', 4, 2, 57, NULL, '', '', '2021-11-24 05:52:31', '2021-11-24 05:52:31'),
('001-439', 'C-604', 4, 2, 41, NULL, '', '', '2021-11-24 05:34:45', '2021-11-24 05:34:45'),
('001-440', 'C-415', 4, 2, 45, NULL, '', '', '2021-11-24 05:25:03', '2021-11-24 05:25:03'),
('001-443', 'C-315', 4, 2, 42, NULL, '', '', '2021-11-24 05:25:54', '2021-11-24 05:25:54'),
('001-445', 'O-362', 4, 2, 7, NULL, '', '', '2021-11-24 05:26:16', '2021-11-24 05:26:16'),
('001-459', 'C-607', 4, 2, 42, NULL, '', '', '2021-11-24 05:35:08', '2021-11-24 05:35:08'),
('001-467', 'C-601', 4, 2, 42, NULL, '', '', '2021-11-24 05:35:31', '2021-11-24 05:35:31'),
('001-478', 'F7A05000', 4, 2, 55, NULL, '', '', '2021-11-24 05:53:26', '2021-11-24 05:53:26'),
('001-493', 'C-529', 4, 2, 38, NULL, '', '', '2021-12-12 07:59:40', '2021-12-12 07:59:40'),
('001-500', 'JOHN DEER', 4, 2, 57, NULL, '', '', '2021-11-24 05:54:22', '2021-11-24 05:54:22'),
('001-508', 'TATA 207DI-NEW', 4, 2, 57, NULL, '', '', '2021-11-24 05:54:56', '2021-11-24 05:54:56'),
('001-509', 'O-671 180 3009', 4, 2, 31, NULL, '', '', '2021-11-24 05:12:04', '2021-11-24 05:12:04'),
('001-512', 'MAHINDRA-575 DI', 4, 2, 57, NULL, '', '', '2021-11-24 05:55:51', '2021-11-24 05:55:51'),
('001-533', 'C-508A', 4, 2, 39, NULL, '', '', '2021-11-24 05:35:59', '2021-11-24 05:35:59'),
('001-571', 'C-112', 4, 2, 47, NULL, '', '', '2021-11-24 05:28:37', '2021-11-24 05:28:37'),
('001-572', 'C-115', 4, 2, 47, NULL, '', '', '2021-11-24 05:29:00', '2021-11-24 05:29:00'),
('001-579', 'C-518', 4, 2, 47, NULL, '', '', '2021-11-24 05:36:48', '2021-11-24 05:36:48'),
('001-583', 'C-306', 4, 2, 47, NULL, '', '', '2021-11-24 05:29:23', '2021-11-24 05:29:23'),
('001-589', 'C-310', 4, 2, 47, NULL, '', '', '2021-11-24 05:29:46', '2021-11-24 05:29:46'),
('001-590', 'C-110', 4, 2, 41, NULL, '', '', '2021-11-24 05:30:20', '2021-11-24 05:30:20'),
('001-622', 'C-606', 4, 2, 42, NULL, '', '', '2021-11-24 05:37:13', '2021-11-24 05:37:13'),
('002-041', 'FC-158', 4, 2, 3, NULL, '', '', '2021-11-24 05:14:02', '2021-11-24 05:14:02'),
('002-042', 'FC-184', 4, 39, 3, NULL, '', '', '2021-12-12 08:01:04', '2021-12-12 08:01:04'),
('002-043', 'FC-226', 4, 39, 5, NULL, '', '', '2021-12-12 08:05:08', '2021-12-12 08:05:08'),
('002-047', 'FC-208A', 4, 39, 41, NULL, '', '', '2021-11-24 05:57:35', '2021-11-24 05:57:35'),
('002-053', 'FC-318', 4, 39, 41, NULL, '', '', '2021-11-24 05:58:14', '2021-11-24 05:58:14'),
('002-062', 'DX-150', 4, 39, 51, NULL, '', '', '2021-11-24 06:04:15', '2021-11-24 06:04:15'),
('002-064', 'FO-0011D', 4, 39, 51, NULL, '', '', '2021-11-24 06:04:45', '2021-11-24 06:04:45'),
('002-066', 'UW-0061', 4, 39, 51, NULL, '', '', '2021-11-24 06:05:54', '2021-11-24 06:05:54'),
('002-067', 'CXO-706', 4, 39, 51, NULL, '', '', '2021-11-24 06:06:29', '2021-11-24 06:06:29'),
('002-068', 'CXO-708', 4, 39, 51, NULL, '', '', '2021-11-24 06:07:06', '2021-11-24 06:07:06'),
('002-069', 'CXO-710', 4, 39, 53, NULL, '', '', '2021-11-24 06:07:38', '2021-11-24 06:07:38'),
('002-080', 'F-8835100', 4, 39, 55, NULL, '', '', '2021-11-24 06:08:32', '2021-11-24 06:08:32'),
('002-090', 'FC-226', 4, 39, 39, NULL, '', '', '2021-11-24 05:58:45', '2021-11-24 05:58:45'),
('002-119', 'TATA ACE-EX2', 4, 39, 57, NULL, '', '', '2021-11-24 06:09:16', '2021-11-24 06:09:16'),
('002-133', 'F-UZTO-13ZA5', 4, 2, 28, NULL, '', '', '2021-11-24 05:14:54', '2021-11-24 05:14:54'),
('002-140', 'MAXIMO', 4, 39, 57, NULL, '', '', '2021-11-24 06:09:47', '2021-11-24 06:09:47'),
('002-154', 'FC-321', 4, 39, 39, NULL, '', '', '2021-11-24 06:00:32', '2021-11-24 06:00:32'),
('002-166', 'F 700/800', 4, 39, 55, NULL, '', '', '2021-11-24 06:10:33', '2021-11-24 06:10:33'),
('002-183', 'FC-321', 4, 39, 7, NULL, '', '', '2021-12-12 08:07:02', '2021-12-12 08:07:02'),
('002-203', 'CAV-296', 4, 39, 45, NULL, '', '', '2021-11-24 06:12:18', '2021-11-24 06:12:18'),
('002-206', 'FHJ00700', 4, 39, 55, NULL, '', '', '2021-11-24 06:13:03', '2021-11-24 06:13:03'),
('002-211', 'FF-5135', 4, 39, 57, NULL, '', '', '2021-11-24 06:13:37', '2021-11-24 06:13:37'),
('002-216', 'MAXI-PLUS', 4, 39, 57, NULL, '', '', '2021-11-24 06:14:17', '2021-11-24 06:14:17'),
('002-230', 'F-513', 4, 39, 44, NULL, '', '', '2021-11-24 06:01:54', '2021-11-24 06:01:54'),
('002-322', 'F-514', 4, 39, 41, NULL, '', '', '2021-11-24 06:02:23', '2021-11-24 06:02:23'),
('002-349', 'FHN 00400', 4, 39, 52, NULL, '', '', '2021-11-24 06:35:46', '2021-11-24 06:35:46'),
('003-274', 'MAXIMO', 4, 3, 65, NULL, '', '', '2021-11-24 06:37:06', '2021-11-24 06:37:06'),
('003-286', 'SUPER ACE', 4, 3, 57, NULL, '', '', '2021-11-24 06:37:32', '2021-11-24 06:37:32'),
('003-295', 'TATA ACE- NEW', 4, 3, 57, NULL, '', '', '2021-11-24 06:38:10', '2021-11-24 06:38:10'),
('003-315', 'A-863', 4, 3, 101, NULL, '', '', '2021-11-27 09:51:44', '2021-11-27 09:51:44'),
('003-389', 'A-2023', 4, 2, 5, NULL, '', '', '2021-11-24 05:15:19', '2021-11-24 05:15:19'),
('003-420', 'TATA XENON-XLT', 4, 3, 57, NULL, '', '', '2021-11-24 06:38:44', '2021-11-24 06:38:44'),
('003-517', 'A-17801-73RO5', 4, 3, 102, NULL, '', '', '2021-11-27 09:52:26', '2021-11-27 09:52:26'),
('005-005', 'AC-105', 4, 197, 3, NULL, '', '', '2021-12-12 08:08:16', '2021-12-12 08:08:16'),
('005-008', 'AC-111', 4, 197, 3, NULL, '', '', '2021-12-12 08:09:25', '2021-12-12 08:09:25'),
('005-009', 'AC-200', 4, 197, 5, NULL, '', '', '2021-12-12 08:10:53', '2021-12-12 08:10:53'),
('005-010', 'AC-201', 4, 197, 5, NULL, '', '', '2021-12-12 08:11:19', '2021-12-12 08:11:19'),
('005-012', 'AC-210', 4, 197, 5, NULL, '', '', '2021-12-12 08:11:44', '2021-12-12 08:11:44'),
('005-017', 'AC-215', 4, 197, 7, NULL, '', '', '2021-12-12 08:12:29', '2021-12-12 08:12:29'),
('005-019', 'AC-321', 4, 197, 7, NULL, '', '', '2021-12-12 08:12:51', '2021-12-12 08:12:51'),
('005-020', 'AC-107', 4, 197, 3, NULL, '', '', '2021-12-12 08:13:12', '2021-12-12 08:13:12'),
('005-022', 'AC-310', 4, 197, 7, NULL, '', '', '2021-12-12 08:13:35', '2021-12-12 08:13:35'),
('005-024', 'AC-805', 4, 197, 6, NULL, '', '', '2021-12-12 08:14:01', '2021-12-12 08:14:01'),
('005-025', 'AC-806', 4, 197, 6, NULL, '', '', '2021-12-12 08:14:35', '2021-12-12 08:14:35'),
('005-026', 'AC-808', 4, 197, 6, NULL, '', '', '2021-12-12 08:15:04', '2021-12-12 08:15:04'),
('005-028', 'AC-934', 4, 197, 4, NULL, '', '', '2021-12-12 08:15:31', '2021-12-12 08:15:31'),
('005-046', 'AC-933', 4, 197, 3, NULL, '', '', '2021-12-12 08:16:39', '2021-12-12 08:16:39'),
('005-060', 'AC-C6900', 4, 197, 29, NULL, '', '', '2021-12-12 08:17:11', '2021-12-12 08:17:11'),
('005-061', 'AC-2E910', 4, 197, 30, NULL, '', '', '2021-12-12 08:17:48', '2021-12-12 08:17:48'),
('005-063', 'AC-07010', 4, 197, 30, NULL, '', '', '2021-12-12 08:18:27', '2021-12-12 08:18:27'),
('005-072', 'AC-53MSO (W/O LOC', 4, 197, 4, NULL, '', '', '2021-12-12 08:19:11', '2021-12-12 08:19:11'),
('0303BC0071N', 'MAHENDRA BOLERO OIL FILTER', 4, 2, 3, NULL, '', '', '2022-01-25 11:03:56', '2022-01-25 11:03:56'),
('04152-38010', 'o-116', 4, 2, 3, NULL, '', '', '2021-11-20 04:42:59', '2021-11-20 04:42:59'),
('04152-YZZA6', 'O-117', 4, 2, 3, NULL, '', '', '2021-11-20 04:45:48', '2021-11-20 04:45:48'),
('053910 16', 'W7,5MM-WS6-(10-16)', 14, 48, 67, NULL, '', '', '2021-11-24 08:21:11', '2021-11-24 08:21:11'),
('0539110120', 'DIN3017-W9MM-(100-120MM)', 14, 48, 67, NULL, '', '', '2021-11-24 08:34:39', '2021-11-24 08:34:39'),
('053911222', 'W9MM-WS7-(12-22)', 14, 48, 67, NULL, '', '', '2021-11-24 08:22:10', '2021-11-24 08:22:10'),
('053911627', 'W9MM-WS7-(16-27)', 14, 48, 67, NULL, '', '', '2021-11-24 08:22:57', '2021-11-24 08:22:57'),
('053912032', 'W9MM-WS7-(20-32)', 14, 48, 67, NULL, '', '', '2021-11-24 08:23:51', '2021-11-24 08:23:51'),
('053912540', 'W9MM-WS7-(25-40)', 14, 48, 67, NULL, '', '', '2021-11-24 08:24:43', '2021-11-24 08:24:43'),
('053913045', 'DIN3017-W9MM-(30-45MM)', 14, 48, 67, NULL, '', '', '2021-11-24 08:26:23', '2021-11-24 08:26:23'),
('053913250', 'W9MM-WS7-(32-50)', 14, 48, 67, NULL, '', '', '2021-11-24 08:27:01', '2021-11-24 08:27:01'),
('053914060', 'W9MM-WS7-(40-60)', 14, 48, 67, NULL, '', '', '2021-11-24 08:27:59', '2021-11-24 08:27:59'),
('053915070', 'W9MM-WS7-(50-70)', 14, 48, 67, NULL, '', '', '2021-11-24 08:28:47', '2021-11-24 08:28:47'),
('053916080', 'W9MM-WS7-(60-80)', 14, 48, 67, NULL, '', '', '2021-11-24 08:32:11', '2021-11-24 08:32:11'),
('053917090', 'W9MM-WS7-(70-90)', 14, 48, 67, NULL, '', '', '2021-11-24 08:33:10', '2021-11-24 08:33:10'),
('053918 16', 'W9MM-WS7-(8-16)', 14, 48, 67, NULL, '', '', '2021-11-24 08:19:44', '2021-11-24 08:19:44'),
('0539180100', 'DIN3017-W9MM-(80-100MM)', 14, 48, 67, NULL, '', '', '2021-11-24 08:33:57', '2021-11-24 08:33:57'),
('05398 12', 'W7,5MM-WS6-(8-12)', 14, 48, 67, NULL, '', '', '2021-11-24 08:18:28', '2021-11-24 08:18:28'),
('0584111000', 'P1000-230X280', 16, 50, 69, NULL, '', '', '2021-11-24 09:07:19', '2021-11-24 09:07:19'),
('0584111200', 'P1200-230X280', 16, 50, 69, NULL, '', '', '2021-11-24 09:08:20', '2021-11-24 09:08:20'),
('0584111500', 'P1500-230X280', 16, 50, 69, NULL, '', '', '2021-11-24 09:07:53', '2021-11-24 09:07:53'),
('058411320', 'P320-230X280', 16, 50, 69, NULL, '', '', '2021-11-24 08:59:57', '2021-11-24 08:59:57'),
('058411400', 'P400-230X280', 16, 50, 69, NULL, '', '', '2021-11-24 09:01:37', '2021-11-24 09:01:37'),
('058411600', 'P600-230X280', 16, 50, 69, NULL, '', '', '2021-11-24 09:02:11', '2021-11-24 09:02:11'),
('058411800', 'P800-230X280', 16, 50, 69, NULL, '', '', '2021-11-24 09:06:41', '2021-11-24 09:06:41'),
('0585025145', 'POLISHING PAD-GREEN-EXTRA-HARD', 5, 149, 99, NULL, '', '', '2021-11-29 10:37:51', '2021-11-29 10:37:51'),
('0585025170', 'POLISHING PAD-GREEN -EXTRA-HARD', 5, 149, 99, NULL, '', '', '2021-11-29 10:38:49', '2021-11-29 10:38:49'),
('0585026090', 'POLISHING PAD-ORANGE-SOFT -D90X25MM', 5, 149, 99, NULL, '', '', '2021-11-29 10:39:57', '2021-11-29 10:39:57'),
('05850261170', 'POLSHING PADS-ORANGE-SOFT-D170X30MM', 5, 149, 99, NULL, '', '', '2021-11-29 10:41:54', '2021-11-29 10:41:54'),
('0585026145', 'POLSHING PAD -ORANGE-SOFT-D145X25MM', 5, 149, 99, NULL, '', '', '2021-11-29 10:40:55', '2021-11-29 10:40:55'),
('0585027090', 'POLSHING PAD-BLUE-HARD-D90X25MM', 5, 149, 99, NULL, '', '', '2021-11-29 10:42:45', '2021-11-29 10:42:45'),
('0585027145', 'POLSHING PAD-BLUE-HARD-D170X30MM', 5, 149, 99, NULL, '', '', '2021-11-29 10:43:44', '2021-11-29 10:43:44'),
('0585126130', 'SOFT MANUAL POLSHING PAD-ORANGE', 5, 149, 99, NULL, '', '', '2021-11-29 10:45:20', '2021-11-29 10:45:20'),
('0585128130', 'EXTRA SOFT MANUAL POLSHING PAD -BLACK', 5, 149, 99, NULL, '', '', '2021-11-29 10:46:24', '2021-11-29 10:46:24'),
('0585135', 'LAMBSKIN PREMIUM-BLACK-D-135MM', 5, 149, 99, NULL, '', '', '2021-11-29 10:47:14', '2021-11-29 10:47:14'),
('0585195', 'LAMBSKIN WHITE-D195MM', 5, 149, 99, NULL, '', '', '2021-11-29 10:47:48', '2021-11-29 10:47:48'),
('058520030', 'POLSHING SPONGE PAD-WHITE-D200X30', 5, 149, 99, NULL, '', '', '2021-11-29 10:48:39', '2021-11-29 10:48:39'),
('05852380', 'LAMBSKIN WHITE-D80MM', 5, 149, 99, NULL, '', '', '2021-11-29 10:49:34', '2021-11-29 10:49:34'),
('05852900', 'WAX PAD-RED-D100MM', 5, 149, 99, NULL, '', '', '2021-11-29 10:50:05', '2021-11-29 10:50:05'),
('0585300150', 'CLEANING PAD CLAY-BLACK-D150MM', 5, 157, 99, NULL, '', '', '2021-11-30 06:01:07', '2021-11-30 06:01:07'),
('0585300210', 'CLEANING GLOVE CLAY', 5, 157, 99, NULL, '', '', '2021-11-30 06:01:50', '2021-11-30 06:01:50'),
('0585300320', 'CLEANING CLOTH CLAY TOWEL', 5, 157, 99, NULL, '', '', '2021-11-30 06:13:00', '2021-11-30 06:13:00'),
('058601 125', 'HOOK AND LOOP SUPPORT PLATE-D125MM', 5, 149, 99, NULL, '', '', '2021-11-29 10:50:43', '2021-11-29 10:50:43'),
('058601 150', 'HOOK AND LOOP SUPPORT PLATE-D150MM', 5, 149, 99, NULL, '', '', '2021-11-29 10:53:03', '2021-11-29 10:53:03'),
('05860180', 'HOOK AND LOOP SUPPORT PLATE-D80MM', 5, 149, 99, NULL, '', '', '2021-11-29 10:53:58', '2021-11-29 10:53:58'),
('07011630', 'HIGH PRESSURE CLEANER HDR 185', 5, 159, 99, NULL, '', '', '2021-11-30 06:18:18', '2021-11-30 06:18:18'),
('0702077', 'AY-LBW400-CLNDEV-52PCS', 5, 145, 99, NULL, '', '', '2021-11-29 09:53:15', '2021-11-29 09:53:15'),
('071458 20 ', 'VACPUL-WNDWREP-2PCS-120MM', 5, 143, 99, NULL, '', '', '2021-11-29 06:23:57', '2021-11-29 06:23:57'),
('071458 23', 'PULLING HANDLE', 5, 143, 99, NULL, '', '', '2021-11-29 06:24:32', '2021-11-29 06:24:32'),
('071458 24', 'WIRE ANCHOR', 5, 6, 99, NULL, '', '', '2021-11-29 06:25:16', '2021-11-29 06:25:16'),
('071458 27', 'WIRE FEEDER', 5, 143, 99, NULL, '', '', '2021-11-29 06:27:44', '2021-11-29 06:27:44'),
('071458 28', 'CUTTING WIRE,5M', 5, 143, 99, NULL, '', '', '2021-11-29 06:28:21', '2021-11-29 06:28:21'),
('071458210', 'WINDSCREEN REMOVAL BLADE', 5, 143, 99, NULL, '', '', '2021-11-29 06:29:09', '2021-11-29 06:29:09'),
('0720118016', 'H16-(PGJ19-3)-12V-19W', 13, 41, 66, NULL, '', '', '2021-11-24 07:32:37', '2021-11-24 07:32:37'),
('0720118027', 'H27-PG13-12V-27W', 13, 41, 66, NULL, '', '', '2021-11-24 07:33:43', '2021-11-24 07:33:43'),
('0720118028', 'H27=PGJ13-12V-27W', 13, 41, 66, NULL, '', '', '2021-11-24 07:56:10', '2021-11-24 07:56:10'),
('072024530', 'POLSHING MACHINE 200-E', 5, 159, 99, NULL, '', '', '2021-11-30 06:19:11', '2021-11-30 06:19:11'),
('07207101', 'AUTO LAMPE H4 AUTO MOTIVE BULB H4', 13, 40, 66, 2, '', '', '2022-01-26 03:09:49', '2022-01-26 03:09:49'),
('0720710110', 'H4-P43T-12V-100/90W', 13, 41, 66, NULL, '', '', '2021-11-24 06:49:56', '2021-11-24 06:49:56'),
('0720710185', 'HS1-ROLLER-PX43T-12V-35/35W', 13, 41, 66, NULL, '', '', '2021-11-24 06:52:07', '2021-11-24 06:52:07'),
('07207102', 'H4-P43T-24V-75/70W', 13, 41, 66, NULL, '', '', '2021-11-24 07:57:11', '2021-11-24 07:57:11'),
('07207103', 'HB3-9005-P20D-12V-60W', 13, 41, 66, NULL, '', '', '2021-11-24 06:56:12', '2021-11-24 06:56:12'),
('07207104', 'HB4-9006-P22D-12V-51W', 13, 41, 66, NULL, '', '', '2021-11-24 07:05:12', '2021-11-24 07:05:12'),
('07207111', 'H1-P14,5S-12V-55W', 13, 41, 66, NULL, '', '', '2021-11-24 06:54:33', '2021-11-24 06:54:33'),
('07207112', 'H1-P14-5S-24V-70W', 13, 41, 66, NULL, '', '', '2021-11-24 08:09:26', '2021-11-24 08:09:26'),
('07207121', 'H3-PK22S-12V-55W', 13, 41, 66, NULL, '', '', '2021-11-24 06:49:09', '2021-11-24 06:49:09'),
('07207122', 'H3-PK22S-24V-70W', 13, 41, 66, NULL, '', '', '2021-11-24 08:10:02', '2021-11-24 08:10:02'),
('07207141', 'H7-PX26D-12V-55W', 13, 41, 66, NULL, '', '', '2021-11-24 06:53:51', '2021-11-24 06:53:51'),
('07207142', 'H7-PX26D-24V-70W', 13, 41, 66, NULL, '', '', '2021-11-24 08:04:56', '2021-11-24 08:04:56'),
('0720718008', ' H8-(PGJ19-1_-12V-35W', 13, 41, 66, NULL, '', '', '2021-11-24 07:29:22', '2021-11-24 07:29:22'),
('0720718009', 'H9-(PGJ19-5)-12V-65W', 13, 41, 66, NULL, '', '', '2021-11-24 07:31:53', '2021-11-24 07:31:53'),
('0720718011', 'H11-(PGJ19-2)-12V-55W', 13, 41, 66, NULL, '', '', '2021-11-24 07:00:18', '2021-11-24 07:00:18'),
('072073210', 'H21W-BAY9S-24V-21W', 13, 41, 66, NULL, '', '', '2021-11-24 08:11:00', '2021-11-24 08:11:00'),
('07207322', 'INDCTR/BRK-P21W-BA15S-24V-21W', 13, 42, 66, NULL, '', '', '2021-11-24 08:06:22', '2021-11-24 08:06:22'),
('072073223', 'INDCTR/BRK-AMBER-BAU15S-24V-21W', 13, 42, 66, NULL, '', '', '2021-11-24 08:07:46', '2021-11-24 08:07:46'),
('07207342', 'INDCTR/BRK-BAY15D-24V-21/5W', 13, 42, 66, NULL, '', '', '2021-11-24 07:58:17', '2021-11-24 07:58:17'),
('07207383', 'BULB-INDCTR/BRK-AMBER-BAU 15S 12V-21WATT', 13, 42, 66, 2, '', '', '2022-01-26 04:24:03', '2022-01-26 04:24:03'),
('07207401', 'AUTO LAMPE R5W AUTO MOTIVE BULB R5W', 13, 44, 66, 2, '', '', '2022-01-26 04:25:44', '2022-01-26 04:25:44'),
('07207402', 'T-16-BA15S-24V-3W', 13, 44, 66, NULL, '', '', '2021-11-24 08:11:42', '2021-11-24 08:11:42'),
('07207611', 'T10-W2,1*9.5D-12V-3W', 13, 40, 66, NULL, '', '', '2021-11-24 06:59:23', '2021-11-24 06:59:23'),
('07207612', 'W,1*9,5D-24V-3W', 13, 40, 66, NULL, '', '', '2021-11-24 08:12:20', '2021-11-24 08:12:20'),
('07207621', 'T10-W2.1*9,5D-12V-5W', 13, 40, 66, NULL, '', '', '2021-11-24 06:45:30', '2021-11-24 06:45:30'),
('07207622', 'W2,1*9,5D-24V-5W', 13, 40, 66, NULL, '', '', '2021-11-24 07:59:03', '2021-11-24 07:59:03'),
('07207631', 'T20-W3*16D-12V-W21W', 13, 42, 66, NULL, '', '', '2021-11-24 06:58:28', '2021-11-24 06:58:28'),
('072076311', 'T15-W2,1*9,5D-12V-W16W', 13, 40, 66, NULL, '', '', '2021-11-24 06:50:56', '2021-11-24 06:50:56'),
('07207632', 'T20-W3X16Q-12V-W21/5W', 13, 40, 66, NULL, '', '', '2021-11-24 06:55:24', '2021-11-24 06:55:24'),
('0848270300', 'HOKMNT-L300MM', 15, 49, 68, NULL, '', '', '2021-11-24 09:11:19', '2021-11-24 09:11:19'),
('0848270350', 'HOKMNT-L350MM', 15, 49, 68, NULL, '', '', '2021-11-24 09:12:02', '2021-11-24 09:12:02'),
('0848270380', 'HOKMNT-L380MM', 15, 49, 68, NULL, '', '', '2021-11-24 09:12:53', '2021-11-24 09:12:53'),
('0848270400', 'HOKMNT-L400MM', 15, 49, 68, NULL, '', '', '2021-11-24 09:13:28', '2021-11-24 09:13:28'),
('0848270425', 'HOKMNT-L425', 15, 49, 68, NULL, '', '', '2021-11-24 09:14:02', '2021-11-24 09:14:02'),
('0848270450', 'HOKMNT-L450MM', 15, 49, 68, NULL, '', '', '2021-11-24 09:15:02', '2021-11-24 09:15:02'),
('0848270475', 'HOKMNT-L475MM', 15, 49, 68, NULL, '', '', '2021-11-24 09:16:11', '2021-11-24 09:16:11'),
('0848270500', 'HOKMNT-L500MM', 15, 49, 68, NULL, '', '', '2021-11-24 08:51:26', '2021-11-24 08:51:26'),
('0848270525', 'HOKMNT-L-525MM', 15, 49, 68, NULL, '', '', '2021-11-24 08:51:58', '2021-11-24 08:51:58'),
('0848270550', 'HOKMNT-L-550MM', 15, 49, 68, NULL, '', '', '2021-11-24 08:53:02', '2021-11-24 08:53:02'),
('0848270600', 'HOKMNT-L600MM', 15, 49, 68, NULL, '', '', '2021-11-24 08:53:44', '2021-11-24 08:53:44'),
('0848270650', 'HOKMNT-L650MM', 15, 49, 68, NULL, '', '', '2021-11-24 08:54:24', '2021-11-24 08:54:24'),
('0848270700', 'HOKMNT-L700MM', 15, 49, 68, NULL, '', '', '2021-11-24 08:55:07', '2021-11-24 08:55:07'),
('08880-83508 SN 10W- 30 1L', 'TOYOTA SN 15W-40 ', 3, 11, 14, NULL, '', '', '2022-01-26 06:00:10', '2022-01-26 06:00:10'),
('08880-83509', 'SN/CF 10W 30 4L PETROL/DIESEL', 3, 11, 14, NULL, '', '', '2021-11-20 10:15:20', '2021-11-20 10:15:20'),
('08880-83509 4L 10W-30', 'TOYOTA 10W -30', 3, 11, 14, NULL, '', '', '2022-01-25 10:44:13', '2022-01-25 10:44:13'),
('08880-83983', 'TOYOTA SN 15W-40 4L', 3, 11, 14, NULL, '', '', '2022-01-26 05:49:23', '2022-01-26 05:49:23'),
('08880-83985', ' CI-4 15W 40 1L DIESEL', 3, 11, 14, NULL, '', '', '2021-11-20 10:03:51', '2021-11-20 10:03:51'),
('08880-83985 CI 15W- 40 1L', 'TOYOTA SN 15W-40', 3, 11, 14, NULL, '', '', '2022-01-26 06:02:21', '2022-01-26 06:02:21'),
('08880-83985 CI-4 15W- 40 1L', 'TOYOTA CI -4 15W-40', 3, 11, 14, NULL, '', '', '2022-01-26 07:01:03', '2022-01-26 07:01:03'),
('08880-83986', 'CI-4 15W 40 5L DIESEL', 3, 11, 14, NULL, '', '', '2021-11-20 10:02:17', '2021-11-20 10:02:17'),
('08880-84106', 'SP 0W -20 GF-6A 4L', 3, 11, 14, NULL, '', '', '2021-11-20 10:11:30', '2021-11-20 10:11:30'),
('08880-84106 4L', 'TOYOTA 0W- 20 ', 3, 11, 14, NULL, '', '', '2022-01-25 08:55:44', '2022-01-25 08:55:44'),
('08886-02305', 'WS  AT 4L', 3, 12, 14, NULL, '', '', '2021-11-20 11:05:33', '2021-11-20 11:05:33'),
('08886-02505 GEAR OIL', 'FE CVT FLUID', 3, 12, 14, NULL, '', '', '2022-01-26 09:42:41', '2022-01-26 09:42:41'),
('08886-81015', 'TYPE T - IV 4L', 3, 12, 14, NULL, '', '', '2021-11-20 11:02:25', '2021-11-20 11:02:25'),
('08886-81016', 'ATF', 3, 11, 14, NULL, '', '', '2022-01-25 07:54:05', '2022-01-25 07:54:05'),
('08886-81016 TYPE  T IV', 'ATF 4L', 3, 12, 14, NULL, '', '', '2022-01-25 08:24:35', '2022-01-25 08:24:35'),
('0890024021', 'VARIOPRIMER SAFE+EASY-20ML', 5, 143, 99, NULL, '', '', '2021-11-29 06:13:04', '2021-11-29 06:13:04'),
('08900241', 'GLASS CLEANER ACTIVE CLEANER -500ML', 5, 143, 99, NULL, '', '', '2021-11-29 06:14:41', '2021-11-29 06:14:41'),
('0890030', 'SKS -BLACK-1000ML', 5, 150, 99, NULL, '', '', '2021-11-30 05:25:48', '2021-11-30 05:25:48'),
('0890100043', 'WINDOW SEALANT,CAN BE DABBED OFF BLACK-310ML', 5, 143, 99, NULL, '', '', '2021-11-29 06:15:42', '2021-11-29 06:15:42'),
('0890102', 'ALUMINIUM WHEEL RIM CLEANER-500ML', 5, 147, 99, NULL, '', '', '2021-11-29 10:16:11', '2021-11-29 10:16:11'),
('08901087150', 'BRAKE CLEANER -5LTR', 5, 6, 99, NULL, '', '', '2021-11-29 09:58:38', '2021-11-29 09:58:38'),
('0890121005', 'TYRE CARE FOAM-500ML', 5, 147, 99, NULL, '', '', '2021-11-29 10:16:50', '2021-11-29 10:16:50'),
('0890132', 'WAX REMOVER-20LTR', 5, 147, 99, NULL, '', '', '2021-11-29 10:17:16', '2021-11-29 10:17:16'),
('089013350', 'ULTRA CLEANER 500-500ML', 5, 145, 99, NULL, '', '', '2021-11-29 09:29:43', '2021-11-29 09:29:43'),
('0890150100', 'TFT/LCD CLEANER -200ML', 5, 156, 99, NULL, '', '', '2021-11-30 05:46:32', '2021-11-30 05:46:32'),
('08902000047', 'ROST-OFF-PLUS-400ML', 5, 146, 99, NULL, '', '', '2021-11-29 10:02:32', '2021-11-29 10:02:32'),
('089021100', 'STAIN REMOVER-1LTR', 5, 156, 99, NULL, '', '', '2021-11-30 05:47:09', '2021-11-30 05:47:09'),
('08902221', 'COCKPIT CLEANING AND CARE SPRAY-400ML', 5, 156, 99, NULL, '', '', '2021-11-30 05:47:50', '2021-11-30 05:47:50'),
('089025', 'ACTIVE GLASS CLEANER-500ML', 5, 147, 99, NULL, '', '', '2021-11-29 10:17:48', '2021-11-29 10:17:48'),
('08902505', 'ACTIVE GLASS CLEANER -5LTR', 5, 6, 99, NULL, '', '', '2021-11-29 10:18:20', '2021-11-29 10:18:20'),
('089026', 'TAR REMOVER-300ML', 5, 147, 99, NULL, '', '', '2021-11-29 10:19:00', '2021-11-29 10:19:00'),
('089026005', 'TAR REMOVER -5LTR', 5, 147, 99, NULL, '', '', '2021-11-29 10:19:32', '2021-11-29 10:19:32'),
('0890324385 85G QUICK DRY', 'RTV HD GASKET SELANT QUICK DRY', 5, 6, 99, NULL, '', '', '2022-01-26 07:41:05', '2022-01-26 07:41:05'),
('0890900100', 'CAR DIRT ABSORBER COMPOUND -100G-BAG', 5, 156, 99, NULL, '', '', '2021-11-30 05:48:38', '2021-11-30 05:48:38'),
('0890900150', 'CAR DIRT ABSORBER COMPOUND -150G-CUP', 5, 156, 99, NULL, '', '', '2021-11-30 05:49:32', '2021-11-30 05:49:32'),
('089100 ', 'MANUAL CARTRIDGE GUN,HIGH-QUALITY -310ML-RED/BLACK', 5, 143, 99, NULL, '', '', '2021-11-29 06:30:27', '2021-11-29 06:30:27'),
('0891001', 'MANUAL CARTRIDGE GUN BASIC -310ML', 5, 143, 99, NULL, '', '', '2021-11-29 06:31:53', '2021-11-29 06:31:53'),
('08911060', 'UNDERSEAL GUN-R1/4IN-BOTTLE-1LTR', 5, 154, 99, NULL, '', '', '2021-11-30 05:34:08', '2021-11-30 05:34:08'),
('08911063', 'UNDERSEAL GUN-R1/4IN-BOTTLE-1LTR', 5, 154, 99, NULL, '', '', '2021-11-30 05:36:01', '2021-11-30 05:36:01'),
('0891156400', 'CATALYTIC CLEANER ADAPTER', 5, 145, 99, NULL, '', '', '2021-11-29 09:54:30', '2021-11-29 09:54:30'),
('0891318', 'CARTGUN-MAN-MAN-MANPRESSURE-310ML', 5, 143, 99, NULL, '', '', '2021-11-29 06:32:47', '2021-11-29 06:32:47'),
('0891350205', 'RUBBER BLADE WIPE-N-SHINE ', 5, 159, 99, NULL, '', '', '2021-11-30 06:24:45', '2021-11-30 06:24:45'),
('0891350211', 'RIM BRUSH-70X170MM', 5, 159, 99, NULL, '', '', '2021-11-30 06:25:28', '2021-11-30 06:25:28'),
('0891350500', 'UPHOLSTERY AND CARPET BRUSH-RED-175X90X110MM', 5, 159, 99, NULL, '', '', '2021-11-30 06:26:28', '2021-11-30 06:26:28'),
('0891350505', 'RUBBER BRUSH-BLACK-L260MM', 5, 159, 99, NULL, '', '', '2021-11-30 06:27:37', '2021-11-30 06:27:37'),
('0891350510', 'HAND AND NAIL BRUSH', 5, 159, 99, NULL, '', '', '2021-11-30 06:28:18', '2021-11-30 06:28:18'),
('0891502003', 'SPRAY BOTTLE-1000ML', 5, 159, 99, NULL, '', '', '2021-11-30 06:28:50', '2021-11-30 06:28:50'),
('0891502360', '360\'SPRAY BOTTLE-500ML', 5, 159, 99, NULL, '', '', '2021-11-30 06:29:45', '2021-11-30 06:29:45'),
('0891503001', 'PUMP SPRAY BOTTLE.SOLVENT-RESISTANT-1000ML', 5, 159, 99, NULL, '', '', '2021-11-30 06:33:07', '2021-11-30 06:33:07'),
('0891650', 'PRIMER BRUSH-BEIGE', 5, 143, 99, NULL, '', '', '2021-11-29 06:13:57', '2021-11-29 06:13:57'),
('08917003140', 'TOP GUN', 5, 159, 99, NULL, '', '', '2021-11-30 06:22:16', '2021-11-30 06:22:16'),
('0891703128', 'FOAM GUN FOR HIHG PRESSURE-SP1', 5, 159, 99, NULL, '', '', '2021-11-30 06:21:39', '2021-11-30 06:21:39'),
('0892070100', 'STONE CHIP PROTECTION AQUA-BLACK-1000ML', 5, 150, 99, NULL, '', '', '2021-11-30 05:24:06', '2021-11-30 05:24:06'),
('0892070200', 'STONE CHIP PROTECTION AQUA-GREY -1000ML', 5, 150, 99, NULL, '', '', '2021-11-30 05:25:12', '2021-11-30 05:25:12'),
('0892072', 'UNDERSEAL-1000ML', 5, 150, 99, NULL, '', '', '2021-11-30 04:27:05', '2021-11-30 04:27:05'),
('0892075250', 'GRAVEL THROW AND UNDERBODY PROTECTION', 5, 150, 99, NULL, '', '', '2021-11-30 04:25:36', '2021-11-30 04:25:36'),
('0892075300', 'GRAVEL THROW AND UNDERBODY PROTECTION', 5, 150, 99, NULL, '', '', '2021-11-30 04:26:33', '2021-11-30 04:26:33'),
('0892082500', 'CAVITY WAX-TRANSPRENT-500ML', 5, 151, 99, NULL, '', '', '2021-11-30 05:27:29', '2021-11-30 05:27:29'),
('0892082502', 'CAVITY WAX-BROWN-500ML', 5, 151, 99, NULL, '', '', '2021-11-30 05:28:05', '2021-11-30 05:28:05'),
('0892333 32 ML ', 'RAPID WINDSCREEN SAMPOO', 5, 6, 99, NULL, '', '', '2022-01-26 05:26:08', '2022-01-26 05:26:08'),
('08923333', 'RAPID WINDSCREEN CLEANER -BLUE 32ML', 5, 142, 99, NULL, '', '', '2021-11-29 06:09:40', '2021-11-29 06:09:40'),
('08923335', 'RAPID WINDSCREEN CLEANER 5LTR', 5, 142, 99, NULL, '', '', '2021-11-29 06:10:37', '2021-11-29 06:10:37'),
('0893011500', 'PRAY SHINE -500ML', 5, 147, 99, NULL, '', '', '2021-11-29 10:13:44', '2021-11-29 10:13:44'),
('0893012370', 'WATERPROOFING SPRAY UNIVERSAL-LEATHER', 5, 158, 99, NULL, '', '', '2021-11-30 06:15:22', '2021-11-30 06:15:22'),
('0893012414', 'WINDOW SEAL-20ML', 5, 158, 99, NULL, '', '', '2021-11-30 06:16:03', '2021-11-30 06:16:03'),
('08930128', 'RUBBER CARE RUBBER FIT-75ML', 5, 156, 99, NULL, '', '', '2021-11-30 05:50:53', '2021-11-30 05:50:53'),
('0893012901', 'LEATHER CARE -SOLVENT-FREE-500ML', 5, 156, 99, NULL, '', '', '2021-11-30 05:51:39', '2021-11-30 05:51:39'),
('0893013001', 'PAINT SEALANT, PERFECT-GLOSS-1LTR', 5, 147, 99, NULL, '', '', '2021-11-29 10:14:27', '2021-11-29 10:14:27'),
('089301305', 'ENGINE CLEANER -5LTR', 5, 147, 99, NULL, '', '', '2021-11-29 10:20:12', '2021-11-29 10:20:12'),
('0893013250', 'PAINT SEALANT,PERFECT-GLOSS-250ML', 5, 147, 99, NULL, '', '', '2021-11-29 10:15:13', '2021-11-29 10:15:13'),
('0893032100', 'WATERPROOFING SPRAY UNIVERSAL -400ML', 5, 147, 99, NULL, '', '', '2021-11-29 10:21:09', '2021-11-29 10:21:09'),
('0893033', 'INTERIOR CLEANER-500ML', 5, 156, 99, NULL, '', '', '2021-11-30 05:52:12', '2021-11-30 05:52:12'),
('0893106', 'HHS2000-500ML', 5, 146, 99, NULL, '', '', '2021-11-29 10:04:25', '2021-11-29 10:04:25'),
('08931063', 'HHS5000-500ML', 5, 146, 99, NULL, '', '', '2021-11-29 10:04:51', '2021-11-29 10:04:51'),
('08931064', 'HHS FLUID-500ML', 5, 146, 99, NULL, '', '', '2021-11-29 10:05:25', '2021-11-29 10:05:25'),
('08931066', 'HHS DRYLUBE-400ML', 5, 146, 99, NULL, '', '', '2021-11-29 10:05:53', '2021-11-29 10:05:53'),
('0893110', 'RUST CONVERTER -1LTR', 5, 153, 99, NULL, '', '', '2021-11-30 05:32:25', '2021-11-30 05:32:25'),
('0893114113027', 'PERFECT ZINC SPRAY-400ML', 5, 152, 99, NULL, '', '', '2021-11-30 05:30:03', '2021-11-30 05:30:03'),
('0893114114027', 'LIGHT PERFECT ZINC SPRAY 400ML', 5, 152, 99, NULL, '', '', '2021-11-30 05:30:49', '2021-11-30 05:30:49'),
('08931182', 'BMF CLEANER -5LTR', 5, 156, 99, NULL, '', '', '2021-11-30 05:50:14', '2021-11-30 05:50:14'),
('0893150012', 'FASTCUT PLUS-P10-250G', 5, 148, 99, NULL, '', '', '2021-11-29 10:27:34', '2021-11-29 10:27:34'),
('0893150020', 'HIGH GLOSS PLUS-P20-1KG', 5, 148, 99, NULL, '', '', '2021-11-29 10:28:14', '2021-11-29 10:28:14'),
('0893150022', 'HIGH GLOSS PLUS-P20-250KG', 5, 148, 99, NULL, '', '', '2021-11-29 10:29:06', '2021-11-29 10:29:06'),
('0893150030', 'ANTI-HOLOGRAMM PLUS-P30-1KG', 5, 148, 99, NULL, '', '', '2021-11-29 10:29:58', '2021-11-29 10:29:58'),
('0893150032', 'ANTI-HOLOGRAMM PLUS-P30-250G', 5, 148, 99, NULL, '', '', '2021-11-29 10:30:38', '2021-11-29 10:30:38'),
('08931571', 'CLAY POLISH AND CLEANER-200G', 5, 157, 99, NULL, '', '', '2021-11-30 06:12:06', '2021-11-30 06:12:06'),
('0893221', 'SILICONE SPRAY-500ML', 5, 146, 99, NULL, '', '', '2021-11-29 10:06:26', '2021-11-29 10:06:26'),
('089322105', 'SILICONE SPRAY-5LTR', 5, 146, 99, NULL, '', '', '2021-11-29 10:06:56', '2021-11-29 10:06:56'),
('0893223500', 'IPA CLEANER -500ML', 5, 156, 99, NULL, '', '', '2021-11-30 05:52:38', '2021-11-30 05:52:38'),
('0893240', 'ROST-OFF-ICE-400ML', 5, 146, 99, NULL, '', '', '2021-11-29 10:11:00', '2021-11-29 10:11:00'),
('08932801', 'PLASTIC DYE-BLACK-75ML', 5, 147, 99, NULL, '', '', '2021-11-29 10:21:57', '2021-11-29 10:21:57'),
('0893285', 'DEEP CLEANER FOR PLASTIC-500ML', 5, 147, 99, NULL, '', '', '2021-11-29 10:22:45', '2021-11-29 10:22:45'),
('0893300250', 'INJECTOR SOLVENT INJETOR-EX', 5, 145, 99, NULL, '', '', '2021-11-29 09:30:29', '2021-11-29 09:30:29'),
('089346601', 'FAST CUT-ULTRA-1000ML', 5, 148, 99, NULL, '', '', '2021-11-29 10:31:18', '2021-11-29 10:31:18'),
('0893467001', 'NEW CAR POLISH (PINK)-1000ML', 5, 148, 99, NULL, '', '', '2021-11-29 10:32:26', '2021-11-29 10:32:26'),
('089346801', 'ENAMEL POLISH/USED CAR POLISH-1000ML', 5, 148, 99, NULL, '', '', '2021-11-29 10:33:26', '2021-11-29 10:33:26'),
('0893470', 'INSECT REMOVER-500ML', 5, 147, 99, NULL, '', '', '2021-11-29 10:23:38', '2021-11-29 10:23:38'),
('0893472', 'VEHICLE CLEANER ACTIVE CLEAN -500ML', 5, 156, 99, NULL, '', '', '2021-11-30 05:57:13', '2021-11-30 05:57:13'),
('0893474', 'LIQUID GREEN-500ML', 5, 156, 99, NULL, '', '', '2021-11-30 05:58:56', '2021-11-30 05:58:56'),
('0893476500', 'PREMIUM RIM CLEANER', 5, 147, 99, NULL, '', '', '2021-11-29 10:24:07', '2021-11-29 10:24:07'),
('0893476505', 'PREMIUM RIM CLEANER -5LTR', 5, 147, 99, NULL, '', '', '2021-11-29 10:24:51', '2021-11-29 10:24:51'),
('0893477', 'PLASTIC CARE-1000ML', 5, 147, 99, NULL, '', '', '2021-11-29 10:25:24', '2021-11-29 10:25:24'),
('0893550', 'DRY LUBRICANT SPRAY PTFE-300ML', 5, 146, 99, NULL, '', '', '2021-11-29 10:11:39', '2021-11-29 10:11:39'),
('08935561017', 'COOLANT-HYBRID CONCENTRATE-BLUE -1LTR', 5, 144, 99, NULL, '', '', '2021-11-29 06:49:12', '2021-11-29 06:49:12'),
('0893556102', 'COOLANT -HYBRID CONCENTRATE-BLUE-500ML', 5, 144, 99, NULL, '', '', '2021-11-29 06:54:18', '2021-11-29 06:54:18'),
('08935561027', 'COOLANT-HYBRID CONCENTRATE-RED-1LTR', 5, 144, 99, NULL, '', '', '2021-11-29 06:52:33', '2021-11-29 06:52:33'),
('08935561037', 'COOLANT-HYBRID CONCENTRATE -GREEN-1LTR', 5, 144, 99, NULL, '', '', '2021-11-29 06:50:28', '2021-11-29 06:50:28'),
('0893556104', 'COOLANT-HYBRID CONCENTRATE-GREEN-500ML', 5, 144, 99, NULL, '', '', '2021-11-29 06:56:05', '2021-11-29 06:56:05'),
('08935561057', 'COOLANT -HYBRID CONCENTRATE-RED-1LTR', 5, 144, 99, NULL, '', '', '2021-11-29 06:51:25', '2021-11-29 06:51:25'),
('0893556106', 'COOLANT -HYBRID CONCENTRATE -RED-500ML', 5, 144, 99, NULL, '', '', '2021-11-29 06:57:22', '2021-11-29 06:57:22'),
('0893556107', 'RADIATOR COOLANT  HYBRID-READYTO USE -5LTR -RED', 5, 144, 99, NULL, '', '', '2021-11-29 06:44:38', '2021-11-29 06:44:38'),
('0893556108', 'RADIATOR COOLANT HYBRID-READY TO USE -5LTR -BLUE', 5, 144, 99, NULL, '', '', '2021-11-29 06:46:03', '2021-11-29 06:46:03'),
('0893556109', 'RADIATOR COOLANT HYBRID -READY TO USE -5LTR-GREEN', 5, 144, 99, NULL, '', '', '2021-11-29 06:47:10', '2021-11-29 06:47:10'),
('089355611', 'COOLANT-READY-PREMIUM-BLUE-5LTR', 5, 144, 99, NULL, '', '', '2021-11-29 06:37:10', '2021-11-29 06:37:10'),
('0893556110', 'RADIATOR COOLANT INVERTOR -READY TO USE -1LTR', 5, 144, 99, NULL, '', '', '2021-11-29 06:48:06', '2021-11-29 06:48:06'),
('08935561111', 'COOLANT -PREMIUM-RED-500ML', 5, 144, 99, NULL, '', '', '2021-11-29 06:40:07', '2021-11-29 06:40:07'),
('089356091', 'LBW 400 -330ML', 5, 145, 99, NULL, '', '', '2021-11-29 09:28:20', '2021-11-29 09:28:20'),
('0893742 002', 'DIESEL SYSTEM CLANER(ALT FOR LBW 10000', 5, 145, 99, NULL, '', '', '2021-11-29 09:43:25', '2021-11-29 09:43:25'),
('0893800', 'COPPER SPRAY CU 800-300ML', 5, 146, 99, NULL, '', '', '2021-11-29 10:12:06', '2021-11-29 10:12:06'),
('0899470102', 'DISPOSABLE NITRILE GLOVE -BLACK L-100PCS-BOX', 5, 159, 99, NULL, '', '', '2021-11-30 06:38:21', '2021-11-30 06:38:21'),
('0899500004', 'PROTECTIVE KIT-5 IN 1', 5, 159, 99, NULL, '', '', '2021-11-30 06:39:36', '2021-11-30 06:39:36'),
('0899700630', 'CAR AN WINDOW CHAMOIS-LEATHER CLOTH-70X45CM', 5, 159, 99, NULL, '', '', '2021-11-30 06:34:12', '2021-11-30 06:34:12'),
('0899710005', 'XXL CLEANING GLOVE \"FUZZY\"-GREEN', 5, 159, 99, NULL, '', '', '2021-11-30 06:35:00', '2021-11-30 06:35:00'),
('0899900131', 'MICROACTIVE CLOTH -BLUE-40X40CM', 5, 159, 99, NULL, '', '', '2021-11-30 06:35:45', '2021-11-30 06:35:45'),
('0899900132', 'MICROACTIVE CLOTH-RED-40X40CM', 5, 159, 99, NULL, '', '', '2021-11-30 06:36:35', '2021-11-30 06:36:35'),
('0899900133', 'MICROACTIVE CLOTH-YELLOW-40X40CM', 5, 159, 99, NULL, '', '', '2021-11-30 06:37:17', '2021-11-30 06:37:17'),
('0997050385', 'AUTOSHAMPOO-GEL-10LTR', 5, 147, 99, NULL, '', '', '2021-11-29 10:26:00', '2021-11-29 10:26:00'),
('135952', 'MOBIL SUPER 10-30 ', 3, 11, 93, NULL, '', '', '2022-01-24 10:52:28', '2022-01-24 10:52:28'),
('13780 M 65LOO', 'MARUTI SUZUKI', 4, 3, 4, NULL, '', '', '2021-11-20 07:00:30', '2021-11-20 07:00:30'),
('13780-64P00', 'SUZUKI A-983', 4, 3, 4, NULL, '', '', '2022-01-25 09:51:06', '2022-01-25 09:51:06'),
('13780-M-53M00', 'AIR FILTER', 4, 3, 4, NULL, '', '', '2021-11-20 08:17:22', '2021-11-20 08:17:22'),
('13870 M 53M10', 'AIR FILTER', 4, 3, 15, NULL, '', '', '2021-11-20 08:16:45', '2021-11-20 08:16:45'),
('15208-43GOA', 'C-209', 4, 2, 5, NULL, '', '', '2021-11-20 04:51:05', '2021-11-20 04:51:05'),
('15208-65F00', 'NISSAN OIL FILTER', 4, 2, 5, NULL, '', '', '2021-11-20 04:52:36', '2021-11-20 04:52:36'),
('15208-BN30A', 'C-206', 4, 2, 5, NULL, '', '', '2021-11-20 04:53:14', '2021-11-20 04:53:14'),
('15400-RTA-003', 'C-809', 4, 2, 6, NULL, '', '', '2021-11-20 04:54:03', '2021-11-20 04:54:03'),
('15400-RTA-003 Genuine', 'C-809', 4, 2, 6, NULL, '', '', '2022-01-25 04:41:47', '2022-01-25 04:41:47'),
('15600-41010', 'C-101', 4, 2, 9, NULL, '', '', '2021-11-20 05:08:12', '2021-11-20 05:08:12'),
('16510-61J00-000', 'SARINGAN OIL FILTER', 4, 2, 4, NULL, '', '', '2021-11-20 05:06:00', '2021-11-20 05:06:00'),
('16510-81404', 'C-932', 4, 2, 4, NULL, '', '', '2021-11-20 05:04:23', '2021-11-20 05:04:23'),
('16510-84MOO', 'C-934', 4, 2, 4, NULL, '', '', '2021-11-20 05:05:01', '2021-11-20 05:05:01'),
('17220-RBJ-000', 'AIR FILTER', 4, 3, 6, NULL, '', '', '2021-11-20 08:15:17', '2021-11-20 08:15:17'),
('17801-0C010', 'TOYOTA AIR FILTER', 4, 3, 3, NULL, '', '', '2021-11-20 07:14:07', '2021-11-20 07:14:07'),
('17801-0L040', 'AIR FILTER', 4, 3, 3, NULL, '', '', '2021-11-20 07:40:19', '2021-11-20 07:40:19'),
('17801-21030', 'VIOS', 4, 3, 3, NULL, '', '', '2021-11-20 07:12:43', '2021-11-20 07:12:43'),
('17801-21050', 'SUB-ASSY,AI', 4, 3, 3, NULL, '', '', '2021-11-20 07:23:15', '2021-11-20 07:23:15'),
('17801-21050 A-1013', 'AIR FITER A-1013', 4, 3, 3, NULL, '', '', '2022-01-26 09:59:21', '2022-01-26 09:59:21'),
('17801-22020', 'ELEMENT SUB-ASSY', 4, 3, 3, NULL, '', '', '2021-11-20 06:56:48', '2021-11-20 06:56:48'),
('17801-37021 ', 'A-1027 TOYOTA GENUNIE', 4, 3, 3, NULL, '', '', '2022-01-26 03:31:21', '2022-01-26 03:31:21'),
('17801-54100', 'AIR FILTER', 4, 3, 3, NULL, '', '', '2021-11-20 08:18:06', '2021-11-20 08:18:06'),
('17801-54100 A-170', 'AIR FITER A-170', 4, 3, 3, NULL, '', '', '2022-01-26 10:38:07', '2022-01-26 10:38:07'),
('17801-67040', 'AIR FILTER', 4, 3, 3, NULL, '', '', '2021-11-20 08:09:56', '2021-11-20 08:09:56'),
('23303-64110', 'FC=158', 4, 9, 9, NULL, '', '', '2021-11-20 05:10:14', '2021-11-20 05:10:14'),
('23390- OL041', 'FC-193', 4, 9, 3, NULL, '', '', '2021-11-20 05:12:04', '2021-11-20 05:12:04'),
('23390-51070', 'PROTO D.F', 4, 9, 3, NULL, '', '', '2021-11-20 05:11:32', '2021-11-20 05:11:32'),
('23390-OL070', 'FC-194', 4, 9, 3, NULL, '', '', '2021-11-20 05:10:49', '2021-11-20 05:10:49'),
('2547.18130102', 'ASSY', 4, 2, 11, NULL, '', '', '2021-11-20 06:33:57', '2021-11-20 06:33:57'),
('500007393', 'CX HAV FORMULA ', 3, 192, 108, NULL, '', '', '2021-12-02 10:19:14', '2021-12-02 10:19:14'),
('500009393', 'CX HAV FORM (SN) 04LTR', 3, 190, 108, NULL, '', '', '2021-12-02 10:05:17', '2021-12-02 10:05:17'),
('500292LPLI', 'CX HAV PRODS FS ECO ', 3, 191, 108, NULL, '', '', '2021-12-02 10:17:40', '2021-12-02 10:17:40'),
('500574', 'DELO GOLD 15W 40 6L', 3, 11, 117, NULL, '', '', '2022-01-23 04:42:47', '2022-01-23 04:42:47'),
('500574NAE', 'CX DELO GOLD ULTRA (01LTR)', 3, 15, 108, NULL, '', '', '2021-12-02 09:58:08', '2021-12-02 09:58:08'),
('500574ZVL', 'CX DELO GOLD ULTRA (06LTR)', 3, 15, 108, NULL, '', '', '2021-12-02 10:01:55', '2021-12-02 10:01:55'),
('510112397', 'CX DELO MTF SAE (05LTR)', 3, 193, 108, NULL, '', '', '2021-12-02 10:20:26', '2021-12-02 10:20:26'),
('510112NAE', 'CX DELO MTF SAE (01LTR)', 3, 193, 108, NULL, '', '', '2021-12-02 10:07:02', '2021-12-02 10:07:02'),
('510134 NAE', 'CXTEXAMATIC 901LTR)', 3, 195, 108, NULL, '', '', '2021-12-02 10:11:56', '2021-12-02 10:11:56'),
('510134PBE', 'CX TEXAMATIC (0.50ML)', 3, 195, 108, NULL, '', '', '2021-12-02 10:11:11', '2021-12-02 10:11:11'),
('510134UIE', 'CX TEXAMATIC (250ML)', 3, 195, 108, NULL, '', '', '2021-12-02 10:23:00', '2021-12-02 10:23:00'),
('510662PBE', 'CX BRAKE/CLUTCH FLD (0.50LTR)', 3, 194, 108, NULL, '', '', '2021-12-02 10:21:57', '2021-12-02 10:21:57'),
('510662PBE BREAK OIL', 'CX BRAKE/CLUTH FIT DOT3 500ML', 3, 17, 117, NULL, '', '', '2022-01-26 06:27:24', '2022-01-26 06:27:24'),
('510662UIE', 'CX BRAKE/CLUTCH FLD (250ML)', 3, 194, 108, NULL, '', '', '2021-12-02 10:09:19', '2021-12-02 10:09:19'),
('510662UIE BREAK OIL', 'CX BRAKE/CLUTH FIT DOT3 250ML', 3, 17, 117, NULL, '', '', '2022-01-26 06:18:15', '2022-01-26 06:18:15'),
('510853VNE', 'CX MARFAK MULTIPIPOSE (500G)', 3, 196, 108, NULL, '', '', '2021-12-02 10:13:50', '2021-12-02 10:13:50'),
('510853VQE', 'CX MARFAK MULTIPURPOSE', 3, 196, 108, NULL, '', '', '2021-12-02 10:23:54', '2021-12-02 10:23:54'),
('57075000', 'ECCENTRIC POKLSHING MACHINE EPM 160-E', 5, 159, 99, NULL, '', '', '2021-11-30 06:20:21', '2021-11-30 06:20:21'),
('5717042150961', 'POLSHING MACHINE-ESSENTRIC', 5, 159, 99, NULL, '', '', '2021-11-30 06:23:52', '2021-11-30 06:23:52'),
('57170433150961', 'POLSHING MACHINE-ROTARY', 5, 159, 99, NULL, '', '', '2021-11-30 06:23:06', '2021-11-30 06:23:06'),
('5861005300', 'DIESEL ADDITIVE CETANE BOOSTER-300ML', 5, 155, 99, NULL, '', '', '2021-11-30 05:41:09', '2021-11-30 05:41:09'),
('5861011300', 'diiecwe', 7, 122, 75, 1, '', '', '2021-11-26 05:12:34', '2021-11-26 05:12:34'),
('5861014500', 'DIESEL PARTICULATE FILTER CLEANER -400ML', 5, 145, 99, NULL, '', '', '2021-11-29 09:52:28', '2021-11-29 09:52:28'),
('58611113030', 'ADD-DISL-ADBLUE-10LTR', 5, 155, 99, NULL, '', '', '2021-11-30 05:43:54', '2021-11-30 05:43:54'),
('5861113500', 'THROTTLE VALUE CLEANER -500ML', 5, 145, 99, NULL, '', '', '2021-11-29 09:29:06', '2021-11-29 09:29:06'),
('58617000', 'DIESEL ADDITIVE,ADBLUE  1,89L', 5, 155, 99, NULL, '', '', '2021-11-30 05:43:07', '2021-11-30 05:43:07'),
('5966105651', 'LBW 400 KIT-7PCS', 5, 145, 99, NULL, '', '', '2021-11-29 09:53:48', '2021-11-29 09:53:48'),
('80291-T5A-J01', 'HONDA', 4, 7, 6, NULL, '', '', '2021-11-20 06:55:39', '2021-11-20 06:55:39'),
('80292-TGO-W02', '1E23', 4, 7, 6, NULL, '', '', '2021-11-20 06:54:44', '2021-11-20 06:54:44'),
('87139-0N010', 'AC-108', 4, 7, 3, NULL, '', '', '2021-11-20 07:21:26', '2021-11-20 07:21:26'),
('88568 -52010 AC -101', 'AC FILTER AC-101', 4, 7, 3, NULL, '', '', '2022-01-26 07:50:02', '2022-01-26 07:50:02'),
('88568 -52010 AC -102', 'AC FILTER AC-102', 4, 7, 3, NULL, '', '', '2022-01-26 09:49:14', '2022-01-26 09:49:14'),
('88568-52010', 'AC-101', 4, 7, 3, NULL, '', '', '2021-11-20 07:22:01', '2021-11-20 07:22:01'),
('893469100', 'AP-10', 5, 148, 99, NULL, '', '', '2021-11-29 10:31:41', '2021-11-29 10:31:41'),
('90915-YZZD2', 'C-111', 4, 2, 3, NULL, '', '', '2021-11-20 04:47:02', '2021-11-20 04:47:02'),
('90915-YZZE1', 'C-110', 4, 2, 3, NULL, '', '', '2021-11-20 04:46:24', '2021-11-20 04:46:24'),
('9500000296', 'COOLANT-READY-PREMIUM-RED-5LTR', 5, 144, 99, NULL, '', '', '2021-11-29 06:36:28', '2021-11-29 06:36:28'),
('950000030', 'COOLANT-PREMIUM-GREEN-1LTR', 5, 144, 99, NULL, '', '', '2021-11-29 06:37:55', '2021-11-29 06:37:55'),
('9500000303', 'COOLANT-PREMIUM-GREEN-500ML', 5, 144, 99, NULL, '', '', '2021-11-29 06:40:50', '2021-11-29 06:40:50'),
('9500000304', 'COOLANT-PREMIUM-BLUE-1LTR', 5, 144, 99, NULL, '', '', '2021-11-29 06:39:16', '2021-11-29 06:39:16'),
('9500000305', 'COOLANT-PREMIUM-BLUE-500ML', 5, 144, 99, NULL, '', '', '2021-11-29 06:41:29', '2021-11-29 06:41:29'),
('9500000306', 'COOLANT-PREMIUM-RED-1LTR', 5, 144, 99, NULL, '', '', '2021-11-29 06:38:35', '2021-11-29 06:38:35'),
('95860-74P00', 'AIR CONDITIONER FILTER', 4, 3, 4, NULL, '', '', '2021-11-20 07:15:19', '2021-11-20 07:15:19'),
('95861-68H00', 'AC FILTER', 4, 7, 4, NULL, '', '', '2021-11-20 07:39:28', '2021-11-20 07:39:28'),
('95861-72M00', 'AC FILTER', 4, 7, 4, NULL, '', '', '2021-11-20 07:38:37', '2021-11-20 07:38:37'),
('95861-82KOO', 'AC FILTER', 4, 7, 4, NULL, '', '', '2021-11-20 07:37:59', '2021-11-20 07:37:59'),
('95861-M68K10', 'AC FILTER', 4, 7, 4, NULL, '', '', '2021-11-20 07:39:03', '2021-11-20 07:39:03'),
('9586172M00', 'AC -938 SUZUKI GENUINE ', 4, 7, 4, NULL, '', '', '2022-01-11 05:46:33', '2022-01-11 05:46:33'),
('97148270', 'C-518', 4, 2, 8, NULL, '', '', '2021-11-20 04:56:02', '2021-11-20 04:56:02'),
('A ', 'ALTO 13780 -M-53M00', 4, 3, 3, NULL, '', '', '2022-01-23 04:30:22', '2022-01-23 04:30:22'),
('AC 983', 'AIR FILTER', 4, 3, 4, NULL, '', '', '2022-01-05 07:32:13', '2022-01-05 07:32:13'),
('AY120-NSO45', 'ELEMENT ASSY', 4, 7, 5, NULL, '', '', '2021-11-20 06:59:07', '2021-11-20 06:59:07'),
('CASTILE 002', 'CAR UNDER WASH 10LT', 11, 19, 79, NULL, '', '', '2021-11-25 07:29:20', '2021-11-25 07:29:20'),
('FG0251N2', 'GLASS CLEANER', 7, 122, 75, 1, '', '', '2021-11-30 10:17:32', '2021-11-30 10:17:32'),
('KW0003243', 'RADIATOR COOLANT RED', 35, 198, 118, NULL, '', '', '2022-01-25 09:30:39', '2022-01-25 09:30:39'),
('MICROSOL 010', 'CAR WASH', 11, 19, 72, NULL, '', '', '2021-11-25 06:43:16', '2021-11-25 06:43:16'),
('MICROSOL 011', 'CAR WASH', 11, 19, 72, NULL, '', '', '2021-11-25 06:43:44', '2021-11-25 06:43:44'),
('MR571476', 'MITSUBISHI', 4, 3, 7, NULL, '', '', '2021-11-20 06:58:03', '2021-11-20 06:58:03'),
('NN2CBNP21007', 'NAX PREMILA MT 2121LT', 34, 175, 107, NULL, '', '', '2021-12-01 06:31:17', '2021-12-01 06:31:17'),
('NN2CBNP51007', 'NAX PREMILA MT 517 1LT', 34, 174, 107, NULL, '', '', '2021-12-01 06:29:10', '2021-12-01 06:29:10'),
('NN2CBNP91007', 'NAX PREMILA MT 914 1LT', 34, 175, 107, NULL, '', '', '2021-12-01 06:33:06', '2021-12-01 06:33:06'),
('NN2KHNAP2005', '2K NAX PREMILA 210 2K HARDENER 500ML', 34, 170, 107, NULL, '', '', '2021-12-01 08:35:40', '2021-12-01 08:35:40'),
('NN2SBS175007', 'GRAPHITE-CB 175 01LT', 34, 178, 107, NULL, '', '', '2021-12-01 06:57:18', '2021-12-01 06:57:18'),
('NNN22GRBA108', 'NAX 2200 2K PRIMER HARDENER 213 ML', 34, 170, 107, NULL, '', '', '2021-12-01 06:14:10', '2021-12-01 06:14:10'),
('NNN2PCLR1124', 'NAX PEMILA 2K POLYESTER PUTTY 1.5KG', 34, 177, 107, NULL, '', '', '2021-12-01 07:38:06', '2021-12-01 07:38:06'),
('NNNSGE IPP007', 'NAX SHOGUN  EP 1 PLASTIC PRIMER 1LT', 34, 174, 107, NULL, '', '', '2021-12-01 06:45:37', '2021-12-01 06:45:37'),
('NNNSGHDN0036', 'NAX SHOGUN E41 CLEAR HARDENER (4:1)250 ML', 34, 170, 107, NULL, '', '', '2021-12-01 06:44:05', '2021-12-01 06:44:05'),
('NNNSMMDTH109', 'NAX SUPEROI MEDIUM THINNER 04LT', 34, 171, 107, NULL, '', '', '2021-12-01 08:54:03', '2021-12-01 08:54:03'),
('NNNSSSTPU109', 'NAX SUPERIO SLOW THINNER PU 04LT', 34, 171, 107, NULL, '', '', '2021-12-01 06:15:08', '2021-12-01 06:15:08'),
('NNRPFWHT007', 'RYO PYLAC 3000NC PRIMER BROWN 01LT', 34, 174, 107, NULL, '', '', '2021-12-01 08:30:48', '2021-12-01 08:30:48'),
('NNRPOBRN1007', 'RYO PYLAC 3000 OIL PRIMER (Q/D)BROWN 1LT', 34, 174, 107, NULL, '', '', '2021-12-01 08:32:54', '2021-12-01 08:32:54'),
('NNRPPBRN1007', 'RYO PYLAC 3000NC PRIMER BROWN 01LT', 34, 174, 107, NULL, '', '', '2021-12-01 06:26:00', '2021-12-01 06:26:00'),
('NNRPUGRY1007', 'RYO PYLAC 3000NC PUTTY GREY 01LT', 34, 177, 107, NULL, '', '', '2021-12-01 08:31:51', '2021-12-01 08:31:51'),
('NNTC2NP96007', 'NAX P:9600(HS)T:COAT CLEAR BASE(2:1) 1LT', 34, 185, 107, NULL, '', '', '2021-12-01 08:53:07', '2021-12-01 08:53:07'),
('NNVLSHDN0005', '2K VELOSITY HARDNER 500ML', 34, 170, 107, NULL, '', '', '2021-12-01 06:00:15', '2021-12-01 06:00:15'),
('NP15SB018135', '15% LATEX (GRIT180)-BLACK', 6, 160, 103, NULL, '', '', '2021-11-30 07:04:11', '2021-11-30 07:04:11'),
('NP15SB022135', '15% LATEX (GRIT 220)-BLACK', 6, 160, 103, NULL, '', '', '2021-11-30 07:06:23', '2021-11-30 07:06:23'),
('NP15SB024135', '15% LATEX(GRIT240)-BLACK ', 6, 160, 103, NULL, '', '', '2021-11-30 07:09:33', '2021-11-30 07:09:33'),
('NP15SB028135', '15%LATEX   (GRIT320)-BLACK', 6, 160, 103, NULL, '', '', '2021-11-30 07:19:52', '2021-11-30 07:19:52'),
('NP15SB060135', '15%LATEX (GRIT600)-BLACK', 16, 50, 69, NULL, '', '', '2021-11-30 11:23:59', '2021-11-30 11:23:59'),
('NP15SB080135', '15%LATEX (GRIT800)-BLACK', 6, 160, 103, NULL, '', '', '2021-11-30 07:21:41', '2021-11-30 07:21:41'),
('NP15SB100135', '15% LATEX(GRIT1000)-BLACK', 6, 160, 103, NULL, '', '', '2021-12-01 06:38:53', '2021-12-01 06:38:53'),
('NP30SW004135', 'ART 102.20 30%(GRIT40)-WHITE', 6, 160, 103, NULL, '', '', '2021-12-01 08:42:45', '2021-12-01 08:42:45'),
('NP30SW008135', 'ART 102.20 30%(GRIT80)-WHITE', 34, 186, 107, NULL, '', '', '2021-12-01 08:45:23', '2021-12-01 08:45:23'),
('R S 002', 'WATER 1000ML', 7, 162, 105, 1, '', '', '2021-11-30 10:21:15', '2021-11-30 10:21:15'),
('R S 008', 'RCR(RED)', 7, 165, 105, 1, '', '', '2021-11-30 10:40:42', '2021-11-30 10:40:42'),
('RS  013', 'SURFACE SHINE 4LTR', 7, 167, 105, 1, '', '', '2021-11-30 10:45:21', '2021-11-30 10:45:21'),
('RS 006', 'COOLANT 4 LTR', 7, 164, 105, 1, '', '', '2021-11-30 10:35:06', '2021-11-30 10:35:06'),
('RS 010', 'CAR WASH', 7, 166, 105, 1, '', '', '2021-11-30 10:41:49', '2021-11-30 10:41:49'),
('RS 011', 'GLASS CLEANER ', 7, 161, 105, 1, '', '', '2021-11-30 10:42:40', '2021-11-30 10:42:40'),
('RS 012', 'GLASS CLEANER 20LTR', 7, 161, 105, 1, '', '', '2021-11-30 10:43:14', '2021-11-30 10:43:14'),
('SERVO 003', '15W-40 4LT (PETORL)', 3, 11, 78, NULL, '', '', '2021-11-25 07:24:26', '2021-11-25 07:24:26'),
('SERVO 004', 'OW 20 4LT (PETORL)', 3, 11, 78, NULL, '', '', '2021-11-25 07:25:12', '2021-11-25 07:25:12'),
('SERVO 005 ', 'HP 90 5LT', 3, 12, 77, NULL, '', '', '2021-11-25 07:25:37', '2021-11-25 07:25:37'),
('SERVO 006', 'TATA 3LT (PETORL)', 3, 11, 78, NULL, '', '', '2021-11-25 07:26:12', '2021-11-25 07:26:12'),
('SERVO 007', 'TATA 1LT', 3, 11, 77, NULL, '', '', '2021-11-25 07:26:49', '2021-11-25 07:26:49'),
('SERVO 008', 'HP 90 1LT ', 3, 12, 77, NULL, '', '', '2021-11-25 07:27:15', '2021-11-25 07:27:15'),
('SN 003435', 'CASTROL 10W-30 ', 3, 11, 117, NULL, '', '', '2022-01-23 10:30:32', '2022-01-23 10:30:32'),
('SN003435', 'CASTROL 10W-30', 3, 11, 117, NULL, '', '', '2022-01-23 10:36:25', '2022-01-23 10:36:25'),
('SPGPTETHN009', 'RYO PYLAC ECONOMY NC THINNER (SP) 4LT', 34, 171, 107, NULL, '', '', '2021-12-01 05:58:55', '2021-12-01 05:58:55'),
('SPGPTTHN009', 'RYO PYLAC ECONOMY NC THIINER (SP) 4LT', 34, 171, 107, NULL, '', '', '2021-12-01 06:27:18', '2021-12-01 06:27:18'),
('SPPYLBRW0007', 'PYLAC 3000 BRILLIANT WHITE (SP) 1LT', 34, 176, 107, NULL, '', '', '2021-12-01 06:40:42', '2021-12-01 06:40:42');

-- --------------------------------------------------------

--
-- Table structure for table `int_setting`
--

CREATE TABLE `int_setting` (
  `id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `item_id` varchar(255) NOT NULL,
  `quantity` float NOT NULL,
  `updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `int_setting`
--

INSERT INTO `int_setting` (`id`, `service_id`, `item_id`, `quantity`, `updated`) VALUES
(1, 2, 'cxcxcffd', 3, '2021-11-30 18:12:50'),
(2, 2, 'abc123', 2, '2021-12-01 09:40:08'),
(3, 3, 'cxcxcffd', 9, '2021-12-01 11:30:44'),
(4, 3, 'abc123', 8, '2021-12-01 11:31:32'),
(5, 3, 'abc123', 6.7, '2021-12-01 11:32:06'),
(6, 3, 'abc123', 12, '2021-12-14 10:01:16'),
(7, 1, '07207621', 3, '2021-12-28 07:41:48'),
(8, 3, '07207621', 25, '2021-12-28 08:57:50'),
(9, 44, 'SERVO 004', 10, '2021-12-30 08:58:07');

-- --------------------------------------------------------

--
-- Table structure for table `int_sub_catogery`
--

CREATE TABLE `int_sub_catogery` (
  `sub_cat_id` mediumint(4) NOT NULL,
  `sub_catogery` varchar(100) NOT NULL,
  `catogery` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `int_sub_catogery`
--

INSERT INTO `int_sub_catogery` (`sub_cat_id`, `sub_catogery`, `catogery`) VALUES
(1, 'sub1', 1),
(2, 'OIL Filter', 4),
(3, 'Air Filter', 4),
(4, 'Toyata', 4),
(5, '10W- 30W', 4),
(6, 'interior clener', 5),
(7, 'AC Filter', 4),
(8, 'Diesel Filter', 4),
(9, 'FUEL', 4),
(10, 'ENGINE OIL', 4),
(11, 'ENGINE OIL', 3),
(12, 'GEAR OIL', 3),
(13, '10W- 30W', 3),
(14, 'DS 40', 3),
(15, '15W-40W', 3),
(16, 'SERVICE OIL', 3),
(17, 'B OIL', 3),
(18, 'DIFFERENTIAL OIL', 3),
(19, 'SAMPOO', 11),
(20, 'UNDER WASH CHEMICAL', 11),
(21, 'GLASS CLEANER', 11),
(22, 'TYRE POLISH', 11),
(23, 'INTERIAL CLEANER', 11),
(24, 'ENGINE CLENER', 11),
(25, 'RADIATOR COOLANT', 11),
(26, 'BODY WAX', 11),
(27, 'CLEANING PRODUCT', 4),
(28, 'POLISH ITEM', 11),
(29, 'OIL Filter', 4),
(30, 'GLASS SOCKET BULB', 12),
(31, 'AUTO GEAR OIL ATF ', 12),
(32, 'AUTO GEAR OIL ATF ', 12),
(33, '', 3),
(34, 'AUTO GEAR OIL ATF ', 12),
(35, 'AUTO GEAR OIL ATF ', 12),
(36, 'AUTO GEAR OIL ATF ', 12),
(37, 'AUTO GEAR OIL ATF ', 12),
(38, 'HYDRAULIC FILTER', 4),
(39, 'DIESEL FILTER', 4),
(40, 'GLASS SOCKET BULB', 13),
(41, 'HALOGEN BULB', 13),
(42, 'INDICATOR/BRAKE LIGHT BULB', 13),
(43, 'FESTOON BULB', 13),
(44, 'METAL SOCKET BULB', 13),
(45, 'PARKING LIGHTBULB', 13),
(46, 'METAL SOCKET BULB', 13),
(47, 'PARKING LIGHTBULB', 13),
(48, 'HOSECLMP  ZEBRA', 14),
(49, 'WINDSCREEN WIPER', 15),
(50, 'SANDPAPER BOW WET ', 16),
(51, 'SANDPAPER DISC DRY', 16),
(52, 'MT 028 1LT', 18),
(53, 'MT 508 1LT', 18),
(54, 'MT 508 1LT', 18),
(55, 'MT 601 1LT', 18),
(56, 'MT302 1LT', 18),
(57, 'MT 301 1LT', 18),
(58, 'MT 401 1LT', 18),
(59, 'MT 012 1LT', 18),
(60, 'MT 134 1LT', 18),
(61, 'MT 136 1LT', 18),
(62, 'MT 067 1LT', 18),
(63, 'MT 066', 18),
(64, 'MT 079 1LT', 18),
(65, 'MT 072 1LT', 18),
(66, 'MT 065 1LT', 18),
(67, 'MT 080 1LT', 18),
(68, 'MT 096 1LT', 18),
(69, 'MT 075  1LT', 18),
(70, 'MT 085 1LT', 18),
(71, 'MT 083 1LT', 18),
(72, 'MT 076 1LT', 18),
(73, 'MT 071 1LT', 18),
(74, 'MT 093 1LT', 18),
(75, 'MT 086 1LT', 18),
(76, 'MT 086 1LT', 18),
(77, 'MT 061 1LT', 18),
(78, 'MT 305 1LT', 18),
(79, 'MT 06M 1LT', 18),
(80, 'MT 06A 1LT', 18),
(81, 'MT 172 1LT', 18),
(82, 'MT 170 1LT', 18),
(83, 'MT 804 1LT', 18),
(84, 'MT 602 1LT', 18),
(85, 'MT 507 1LT', 18),
(86, 'MT 501 1LT', 18),
(87, 'MT 903 1LT', 18),
(88, 'MT 202 1LT', 18),
(89, 'MT 807 1LT', 18),
(90, 'MT 100 4LT', 18),
(91, 'MT 103 1LT', 18),
(92, 'MT 033 1LT', 18),
(93, 'MT 030 1LT', 18),
(94, '(GRIT100)-BLACK', 16),
(95, '(GRIT 180)-BLACK', 19),
(96, '(GRIT 220)-BLACK', 19),
(97, '(GRIT 240)-BLACK', 19),
(98, '(GRIT 320)-BLACK', 19),
(99, '(GRIT 800)-BLACK', 19),
(100, 'MT  607 1LT', 18),
(101, '100 (BD 100) 4LT', 18),
(102, ' 200(BD 200) 4 LT', 18),
(103, 'MT 201 1LT', 18),
(104, 'MT 603 1LT', 18),
(105, 'MT 506 1LT', 18),
(106, 'MT 704 1LT', 18),
(107, 'MT 006 1LT', 18),
(108, 'MT 001 1LT', 18),
(109, 'WATER', 11),
(110, 'WATER 1000ML', 11),
(111, 'ACID  500ML', 11),
(112, 'ACID 100ML', 11),
(113, 'RADIATOR COOLANT 1LT', 11),
(114, 'RADIATOR COOLANT 4LT', 11),
(115, 'RCR (RED)', 11),
(116, 'RCR (RED) 4LT', 11),
(117, 'SUPER HIGH POWER 20LT', 11),
(118, 'GLASS CLEANER 450ML', 11),
(119, 'GLASS CLEANER 4LT', 11),
(120, 'SURFACE SHINE', 11),
(121, 'SURFACE SHINE 4LT', 11),
(122, 'MICRO FRIBER CLOTH ( BLUE)', 7),
(123, 'MICRO FRIBER CLOTH (GREEN)', 7),
(124, 'MICRO FRIBER CLOTH (RED)', 7),
(125, 'MICRO FRIBER CLOTH (YELLOW)', 7),
(126, 'MT 805 1LT', 18),
(127, 'MT 801 1LT', 18),
(128, 'Exterior', 5),
(129, 'HOSE CLAMP RANGE', 13),
(130, 'HOSE CLAMP RANGE', 5),
(131, 'AUTOMOTIVE BULBS', 33),
(132, 'AUTOMOTIVE BULBS', 33),
(133, 'ADDITIVES PETORL', 33),
(134, 'wiper', 5),
(135, 'CB 604 1LT', 18),
(136, 'MT 803 1LTR', 18),
(137, 'CB 081 1LTR', 18),
(138, 'MT 802 1LTR', 18),
(139, 'MT 503 1LTR', 18),
(140, '213ML', 18),
(141, 'BULB', 5),
(142, 'RAPID WINDSCREEN CLEANER', 5),
(143, 'WINDSCREEN BONDING', 5),
(144, 'RADIATOR COOLANT', 5),
(145, 'ENGINE TUNE UP', 5),
(146, 'technicial chemicals', 5),
(147, 'EXTERIOR TREATMENTS', 5),
(148, 'COMPOUNDS', 5),
(149, 'POLISHING PADS', 5),
(150, 'RUST PROOFING RANGE -SOLVENT-BASED UNDERCOAT', 5),
(151, 'WATER-BASED UNDERCOAT', 5),
(152, 'CAVITY WAX', 5),
(153, 'ZINC SPRAYS', 5),
(154, 'APPLICATION TOOLS', 5),
(155, 'ADDITIVES ', 5),
(156, 'INTERIOR TREATMENTS', 5),
(157, 'CLAY SERIES', 5),
(158, 'NANO COATINGS', 5),
(159, 'MACHINE & EQUIPMENTS', 5),
(160, 'SAND PAPER', 6),
(161, 'CLEANER', 7),
(162, 'DISTILED WATER', 7),
(163, 'BATTERY ACID', 7),
(164, 'RADIATOR COOLANT 1LT', 7),
(165, 'RCR (RED)', 7),
(166, 'SHAMPOO', 7),
(167, 'SHINE', 7),
(168, 'HARDENER ', 6),
(169, 'GREY BASE', 34),
(170, 'HARDENER ', 34),
(171, 'THINNER', 34),
(172, 'MASKING TAPE', 34),
(173, 'NC FILLER (PS)GREY 01LT', 34),
(174, 'PRIMER', 34),
(175, 'PREMILA', 34),
(176, 'BRILLIANT WHITE', 34),
(177, 'POLYESTER PUTTY', 34),
(178, 'CB 405', 34),
(179, 'MT 202 1LT', 34),
(180, 'MT 100 4LT', 34),
(181, 'MT  904 1LT', 34),
(182, 'JET BLACK', 34),
(183, 'PREMIUM', 34),
(184, 'PAINT REMOVER', 34),
(185, 'CLEAR', 34),
(186, 'SANDPAPER', 34),
(187, 'SILVER', 34),
(188, 'MT 050 1LT', 34),
(189, 'FASTOGEN MAGENTA', 34),
(190, '15W-40', 3),
(191, 'OW 20', 3),
(192, '10W30', 3),
(193, '80W90', 3),
(194, 'DOT3', 3),
(195, '1888', 3),
(196, 'EP2', 3),
(197, 'CABIN FILTER', 4),
(198, 'COOLANT', 35),
(199, 'WIND SCREEN SAMPOO', 36),
(200, 'AER', 37),
(201, 'STOP O', 37);

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `id` int(11) NOT NULL,
  `location` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`id`, `location`) VALUES
(1, 'Jaffna'),
(2, 'Vavuniya');

-- --------------------------------------------------------

--
-- Table structure for table `login_log`
--

CREATE TABLE `login_log` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `login_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `logout_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `login_log`
--

INSERT INTO `login_log` (`id`, `user_id`, `username`, `login_at`, `logout_at`, `status`) VALUES
(1, 1, 'admin', '2021-11-16 14:33:46', '2021-11-16 14:33:46', 1),
(2, 1, 'admin', '2021-11-17 09:40:11', '2021-11-17 10:34:07', 0),
(3, 1, 'admin', '2021-11-18 06:14:41', '2021-11-18 06:15:45', 0),
(4, 1, 'admin', '2021-11-18 07:38:52', '2021-11-18 07:38:52', 1),
(5, 1, 'Admin', '2021-11-18 10:26:36', '2021-11-18 10:26:36', 1),
(6, 1, 'admin', '2021-11-18 10:30:25', '2021-11-18 10:30:25', 1),
(7, 1, 'admin', '2021-11-18 10:32:09', '2021-11-18 10:33:27', 0),
(8, 1, 'admin', '2021-11-19 01:51:53', '2021-11-19 01:51:53', 1),
(9, 1, 'admin', '2021-11-19 01:52:11', '2021-11-19 01:52:11', 1),
(10, 1, 'admin', '2021-11-19 01:52:11', '2021-11-19 01:52:11', 1),
(11, 1, 'admin', '2021-11-19 01:52:12', '2021-11-19 01:52:12', 1),
(12, 1, 'admin', '2021-11-19 03:39:13', '2021-11-19 03:39:13', 1),
(13, 1, 'admin', '2021-11-19 07:57:48', '2021-11-20 04:18:00', 0),
(14, 1, 'admin', '2021-11-20 04:18:06', '2021-11-20 04:18:06', 1),
(15, 1, 'admin', '2021-11-20 07:31:36', '2021-11-20 16:32:10', 0),
(16, 1, 'admin', '2021-11-22 11:20:49', '2021-11-22 11:20:49', 1),
(17, 1, 'admin', '2021-11-23 10:47:01', '2021-11-23 21:36:49', 0),
(18, 1, 'admin', '2021-11-23 21:36:58', '2021-11-23 21:36:58', 1),
(19, 1, 'admin', '2021-11-24 03:40:53', '2021-11-24 03:40:53', 1),
(20, 1, 'Admin', '2021-11-24 06:00:56', '2021-11-24 06:00:56', 1),
(21, 1, 'admin', '2021-11-25 03:38:10', '2021-11-25 03:38:10', 1),
(22, 1, 'admin', '2021-11-25 09:22:31', '2021-11-25 09:22:31', 1),
(23, 1, 'Admin', '2021-11-25 10:47:11', '2021-11-25 14:12:44', 0),
(24, 1, 'Admin', '2021-11-25 14:13:41', '2021-11-25 14:13:41', 1),
(25, 1, 'Admin', '2021-11-25 14:14:03', '2021-11-25 17:05:09', 0),
(26, 1, 'admin', '2021-11-25 17:05:16', '2021-11-25 17:05:16', 1),
(27, 1, 'admin', '2021-11-26 03:16:52', '2021-11-26 07:19:04', 0),
(28, 1, 'admin', '2021-11-26 07:19:09', '2021-11-26 07:19:09', 1),
(29, 1, 'Admin', '2021-11-26 10:21:03', '2021-11-26 10:21:03', 1),
(30, 1, 'Admin', '2021-11-26 10:50:11', '2021-11-26 10:50:11', 1),
(31, 1, 'Admin', '2021-11-27 02:13:10', '2021-11-27 02:13:10', 1),
(32, 1, 'admin', '2021-11-27 03:09:22', '2021-11-27 06:09:08', 0),
(33, 1, 'Admin', '2021-11-27 07:03:04', '2021-11-27 07:03:04', 1),
(34, 1, 'Admin', '2021-11-27 13:02:17', '2021-11-27 13:02:17', 1),
(35, 1, 'Admin', '2021-11-27 13:02:21', '2021-11-27 13:02:21', 1),
(36, 1, 'admin', '2021-11-27 15:57:13', '2021-11-27 23:47:10', 0),
(37, 1, 'admin', '2021-11-27 23:47:14', '2021-11-28 12:21:16', 0),
(38, 1, 'admin', '2021-11-28 21:29:33', '2021-11-28 21:29:33', 1),
(39, 1, 'Admin', '2021-11-28 21:31:14', '2021-11-28 21:31:14', 1),
(40, 1, 'admin', '2021-11-29 02:39:09', '2021-11-29 02:39:09', 1),
(41, 1, 'admin', '2021-11-29 05:59:04', '2021-11-29 05:59:04', 1),
(42, 1, 'admin', '2021-11-29 09:24:27', '2021-11-29 09:24:27', 1),
(43, 1, 'admin', '2021-11-30 04:17:21', '2021-11-30 04:17:21', 1),
(44, 1, 'Admin', '2021-11-30 06:26:41', '2021-11-30 06:26:41', 1),
(45, 1, 'admin', '2021-11-30 09:58:21', '2021-11-30 09:58:21', 1),
(46, 1, 'admin', '2021-12-01 02:58:00', '2021-12-01 03:48:20', 0),
(47, 1, 'admin', '2021-12-01 03:48:24', '2021-12-01 11:04:22', 0),
(48, 1, 'Admin', '2021-12-01 11:04:26', '2021-12-01 13:24:14', 0),
(49, 1, 'Admin', '2021-12-01 13:24:20', '2021-12-02 00:02:48', 0),
(50, 1, 'admin', '2021-12-02 09:52:40', '2021-12-03 06:14:46', 0),
(51, 1, 'Admin', '2021-12-03 08:56:20', '2021-12-03 17:25:30', 0),
(52, 1, 'admin', '2021-12-04 05:31:21', '2021-12-04 13:32:59', 0),
(53, 1, 'admin', '2021-12-07 06:04:59', '2021-12-07 06:39:20', 0),
(54, 1, 'admin', '2021-12-08 06:12:58', '2021-12-08 06:12:58', 1),
(55, 1, 'admin', '2021-12-08 09:19:25', '2021-12-08 09:19:25', 1),
(56, 1, 'admin', '2021-12-08 09:50:58', '2021-12-08 10:44:48', 0),
(57, 1, 'admin', '2021-12-09 17:06:45', '2021-12-10 03:23:51', 0),
(58, 1, 'admin', '2021-12-10 10:40:44', '2021-12-10 15:07:51', 0),
(59, 1, 'Admin', '2021-12-12 06:19:02', '2021-12-12 06:19:02', 1),
(60, 1, 'admin', '2021-12-12 07:46:17', '2021-12-12 08:51:41', 0),
(61, 1, 'admin', '2021-12-14 09:18:02', '2021-12-14 09:18:02', 1),
(62, 1, 'Admin', '2021-12-14 09:20:57', '2021-12-14 09:20:57', 1),
(63, 1, 'admin', '2021-12-14 10:22:58', '2021-12-14 16:40:45', 0),
(64, 1, 'admin', '2021-12-15 12:34:54', '2021-12-16 17:00:22', 0),
(65, 1, 'Admin', '2021-12-19 17:48:23', '2021-12-19 17:48:23', 1),
(66, 1, 'Admin', '2021-12-20 04:25:42', '2021-12-20 09:03:42', 0),
(67, 1, 'Admin', '2021-12-21 09:47:16', '2021-12-21 11:05:48', 0),
(68, 1, 'admin', '2021-12-21 11:05:53', '2021-12-21 11:05:53', 1),
(69, 1, 'admin', '2021-12-22 06:07:37', '2021-12-22 06:07:37', 1),
(70, 1, 'admin', '2021-12-22 06:09:00', '2021-12-22 06:09:00', 1),
(71, 1, 'Admin', '2021-12-22 08:16:59', '2021-12-22 08:16:59', 1),
(72, 1, 'admin', '2021-12-22 08:31:18', '2021-12-22 08:31:18', 1),
(73, 1, 'Admin', '2021-12-22 08:32:00', '2021-12-22 08:32:00', 1),
(74, 1, 'Admin', '2021-12-22 11:08:10', '2021-12-22 11:08:10', 1),
(75, 1, 'admin', '2021-12-22 12:02:41', '2021-12-22 12:02:41', 1),
(76, 1, 'Admin', '2021-12-22 14:20:17', '2021-12-22 14:20:17', 1),
(77, 1, 'Admin', '2021-12-23 01:46:59', '2021-12-23 01:46:59', 1),
(78, 1, 'admin', '2021-12-23 02:40:16', '2021-12-23 05:09:01', 0),
(79, 1, 'admin', '2021-12-23 05:09:05', '2021-12-23 05:09:05', 1),
(80, 1, 'admin', '2021-12-23 06:19:43', '2021-12-23 06:19:43', 1),
(81, 1, 'Admin', '2021-12-23 06:34:46', '2021-12-23 06:34:46', 1),
(82, 1, 'Admin', '2021-12-24 07:01:30', '2021-12-24 07:35:56', 0),
(83, 1, 'admin', '2021-12-24 07:38:09', '2021-12-24 07:38:13', 0),
(84, 1, 'admin', '2021-12-24 08:19:14', '2021-12-24 15:07:04', 0),
(85, 1, 'admin', '2021-12-27 06:59:33', '2021-12-27 06:59:33', 1),
(86, 1, 'admin', '2021-12-27 10:01:29', '2021-12-27 10:01:29', 1),
(87, 1, 'admin', '2021-12-27 11:56:21', '2021-12-28 02:36:11', 0),
(88, 1, 'admin', '2021-12-28 07:30:49', '2021-12-28 07:30:49', 1),
(89, 1, 'admin', '2021-12-28 08:08:14', '2021-12-28 20:24:33', 0),
(90, 1, 'admin', '2021-12-28 23:55:57', '2021-12-28 23:55:57', 1),
(91, 1, 'Admin', '2021-12-29 04:23:31', '2021-12-29 06:03:59', 0),
(92, 2, 'Staff', '2021-12-30 05:20:26', '2021-12-30 05:20:26', 1),
(93, 1, 'admin', '2021-12-30 06:01:55', '2021-12-30 06:01:55', 1),
(94, 1, 'admin', '2021-12-30 07:25:52', '2021-12-30 10:40:06', 0),
(95, 2, 'staff', '2021-12-30 10:46:07', '2021-12-30 10:47:08', 0),
(96, 1, 'admin', '2021-12-30 10:47:16', '2021-12-30 10:47:16', 1),
(97, 1, 'admin', '2021-12-30 11:04:30', '2021-12-30 11:35:39', 0),
(98, 1, 'admin', '2021-12-31 05:58:41', '2021-12-31 05:58:41', 1),
(99, 1, 'admin', '2021-12-31 06:02:31', '2021-12-31 06:02:31', 1),
(100, 1, 'admin', '2021-12-31 06:50:29', '2021-12-31 07:19:04', 0),
(101, 1, 'admin', '2021-12-31 12:34:03', '2021-12-31 23:49:27', 0),
(102, 1, 'admin', '2022-01-03 04:20:00', '2022-01-03 07:13:51', 0),
(103, 1, 'admin', '2022-01-03 09:29:25', '2022-01-03 09:29:25', 1),
(104, 1, 'admin', '2022-01-03 09:29:25', '2022-01-03 17:05:32', 0),
(105, 1, 'admin', '2022-01-03 17:05:38', '2022-01-04 01:02:50', 0),
(106, 1, 'admin', '2022-01-04 04:27:19', '2022-01-05 02:38:59', 0),
(107, 1, 'Admin', '2022-01-05 05:42:29', '2022-01-05 05:42:29', 1),
(108, 1, 'Admin', '2022-01-05 06:22:47', '2022-01-05 06:22:47', 1),
(109, 1, 'admin', '2022-01-05 07:11:34', '2022-01-05 12:52:01', 0),
(110, 1, 'admin', '2022-01-05 12:52:07', '2022-01-05 12:52:07', 1),
(111, 1, 'admin', '2022-01-05 12:52:09', '2022-01-06 05:21:03', 0),
(112, 1, 'admin', '2022-01-06 05:54:08', '2022-01-06 06:57:35', 0),
(113, 1, 'admin', '2022-01-06 06:57:38', '2022-01-07 01:20:32', 0),
(114, 1, 'admin', '2022-01-11 05:33:08', '2022-01-11 05:33:08', 1),
(115, 1, 'Admin', '2022-01-11 06:58:26', '2022-01-11 08:43:56', 0),
(116, 1, 'Admin', '2022-01-11 08:44:02', '2022-01-11 08:44:08', 0),
(117, 1, 'Admin', '2022-01-11 08:44:11', '2022-01-11 08:44:16', 0),
(118, 1, 'Admin', '2022-01-11 08:44:19', '2022-01-11 08:44:23', 0),
(119, 1, 'Admin', '2022-01-11 08:44:54', '2022-01-11 08:44:54', 1),
(120, 1, 'admin', '2022-01-11 10:19:31', '2022-01-11 11:16:14', 0),
(121, 1, 'admin', '2022-01-11 15:21:05', '2022-01-11 15:21:05', 1),
(122, 1, 'admin', '2022-01-12 05:52:45', '2022-01-12 05:52:45', 1),
(123, 1, 'admin', '2022-01-12 09:51:17', '2022-01-12 14:53:21', 0),
(124, 1, 'admin', '2022-01-13 07:55:28', '2022-01-13 07:55:28', 1),
(125, 1, 'admin', '2022-01-13 07:55:28', '2022-01-13 07:55:28', 1),
(126, 1, 'admin', '2022-01-13 07:55:29', '2022-01-13 07:55:29', 1),
(127, 1, 'admin', '2022-01-13 07:55:29', '2022-01-13 07:55:29', 1),
(128, 1, 'admin', '2022-01-13 10:57:54', '2022-01-13 10:57:54', 1),
(129, 1, 'admin', '2022-01-13 16:47:01', '2022-01-13 19:02:47', 0),
(130, 1, 'admin', '2022-01-15 10:36:57', '2022-01-16 02:54:35', 0),
(131, 1, 'admin', '2022-01-16 05:37:25', '2022-01-16 05:37:25', 1),
(132, 1, 'admin', '2022-01-16 05:40:34', '2022-01-16 05:40:34', 1),
(133, 1, 'admin', '2022-01-16 09:48:31', '2022-01-16 09:48:51', 0),
(134, 1, 'admin', '2022-01-16 09:52:36', '2022-01-17 05:16:21', 0),
(135, 1, 'admin', '2022-01-17 12:20:17', '2022-01-17 12:20:17', 1),
(136, 1, 'ADMIN', '2022-01-18 05:48:25', '2022-01-18 06:06:52', 0),
(137, 1, 'admin', '2022-01-20 16:46:12', '2022-01-22 07:13:27', 0),
(138, 1, 'ADMIN', '2022-01-22 10:48:37', '2022-01-22 10:48:37', 1),
(139, 1, 'admin', '2022-01-22 18:21:09', '2022-01-22 18:21:09', 1),
(140, 1, 'Admin', '2022-01-23 02:23:40', '2022-01-23 02:23:40', 1),
(141, 1, 'admin', '2022-01-23 02:59:07', '2022-01-23 02:59:07', 1),
(142, 1, 'ADMIN', '2022-01-23 03:44:07', '2022-01-23 03:44:07', 1),
(143, 1, 'ADMIN', '2022-01-24 05:30:20', '2022-01-24 05:30:20', 1),
(144, 1, 'ADMIN', '2022-01-24 10:07:45', '2022-01-24 10:07:45', 1),
(145, 1, 'admin', '2022-01-24 13:53:15', '2022-01-24 13:53:15', 1),
(146, 1, 'admin', '2022-01-25 01:45:04', '2022-01-25 01:45:04', 1),
(147, 1, 'admin', '2022-01-25 03:50:36', '2022-01-25 03:50:36', 1),
(148, 1, 'Admin', '2022-01-25 04:23:49', '2022-01-25 04:23:49', 1),
(149, 1, 'ADMIN', '2022-01-25 04:31:34', '2022-01-25 23:37:38', 0),
(150, 1, 'ADMIN', '2022-01-26 03:07:40', '2022-01-26 03:07:40', 1);

-- --------------------------------------------------------

--
-- Table structure for table `main_menu`
--

CREATE TABLE `main_menu` (
  `id` int(11) NOT NULL,
  `menu_name` varchar(100) NOT NULL,
  `menu_icon` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `main_menu`
--

INSERT INTO `main_menu` (`id`, `menu_name`, `menu_icon`) VALUES
(1, 'Orders', 'fa fa-car'),
(2, 'Expense', 'fa fa-caret-down'),
(3, 'Purchase', 'fa fa-caret-up'),
(4, 'Customer', 'fa fa-user'),
(5, 'Employees', 'fa fa-users'),
(6, 'Payments', 'fa fa-credit-card'),
(7, 'Inventory', 'fa fa-server'),
(8, 'Users', 'fa fa-users'),
(9, 'Reports', 'fa fa-server'),
(10, 'Settings', 'fa fa-cogs'),
(11, 'booking', 'fa-bookmark');

-- --------------------------------------------------------

--
-- Table structure for table `make`
--

CREATE TABLE `make` (
  `make_id` int(11) NOT NULL,
  `make` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `make`
--

INSERT INTO `make` (`make_id`, `make`) VALUES
(1, 'Audi'),
(2, 'TOYOTA'),
(3, 'HONDA'),
(4, 'SUZUKI'),
(5, 'NISSAN'),
(6, 'KIA'),
(7, 'TATA'),
(8, 'FORD'),
(9, 'MICRO'),
(10, 'BENZ'),
(11, 'RENOLD'),
(12, 'BMW'),
(13, 'CHERVROLET'),
(14, 'LEXUS'),
(15, 'CAMRY'),
(16, 'LEYLAND'),
(17, 'MITSUBISHI'),
(18, 'MAHINDRA'),
(19, 'HYUNDAI'),
(20, 'RENAULT'),
(21, 'INSIGHT');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oil_brand`
--

CREATE TABLE `oil_brand` (
  `oil_brand_id` int(11) NOT NULL,
  `oil_brand` varchar(100) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `oil_filter`
--

CREATE TABLE `oil_filter` (
  `oil_filter_id` int(5) NOT NULL,
  `oil_filter` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `vehicle_no` varchar(50) COLLATE utf8_bin NOT NULL,
  `customer_name` varchar(50) COLLATE utf8_bin NOT NULL,
  `contact_no` int(11) DEFAULT NULL,
  `bill_no` bigint(50) NOT NULL,
  `bill_date` date NOT NULL,
  `type` varchar(50) COLLATE utf8_bin NOT NULL,
  `make` varchar(50) COLLATE utf8_bin NOT NULL,
  `bay` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `reminder` int(11) DEFAULT NULL,
  `discount` int(8) DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ckm` int(11) DEFAULT NULL,
  `nkm` int(11) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `vehicle_no`, `customer_name`, `contact_no`, `bill_no`, `bill_date`, `type`, `make`, `bay`, `reminder`, `discount`, `image`, `ckm`, `nkm`, `created`, `updated`) VALUES
(1, 'CAA-8956 ', 'S Ramesh ', 772271080, 1000, '2021-11-19', '', '', 'bay 1', 7, 5, NULL, 100000, 105000, '2021-11-19 02:57:18', '2021-11-19 02:57:18'),
(2, 'sen 1234', 'senthoo', 778434368, 1001, '2021-12-09', 'Car', 'Audi', 'bay 2', 15, 0, 'order_1001.jpg', 0, 0, '2021-12-09 17:13:31', '2021-12-09 17:13:32'),
(3, 'sen 1234', 'senthoo', 778434368, 1002, '2021-12-09', 'Car', 'Audi', 'bay 2', 7, 0, 'order_1002.jpg', 0, 0, '2021-12-09 17:19:12', '2021-12-09 17:19:12'),
(4, 'BH1233', 'Vinu', 770280956, 1003, '2021-12-10', 'Car', 'Audi', 'bay 1', 7, 0, NULL, 0, 0, '2021-12-10 10:42:10', '2021-12-10 10:42:10'),
(5, 'we3123', 'Senthoo', 778434368, 1004, '2021-12-22', 'Car', 'Audi', 'bay 2', 7, 200, NULL, 25, 35, '2021-12-22 12:04:45', '2021-12-22 12:04:45'),
(6, 'BH1233', 'Vinu', 770280956, 1005, '2021-12-22', 'Car', 'Audi', 'bay 2', 15, 100, NULL, 25, 35, '2021-12-22 12:11:17', '2021-12-22 12:11:17'),
(7, 'bh1425', 'ninu', 771264444, 1006, '2021-12-22', 'Car', 'Audi', 'bay 1', 7, 0, NULL, 0, 0, '2021-12-22 12:14:48', '2021-12-22 12:14:48'),
(8, 'bh1425', 'ninu', 771264444, 1007, '2021-12-22', 'Car', 'Audi', 'bay 2', 7, 0, NULL, 100, 120, '2021-12-22 12:16:11', '2021-12-22 12:16:11'),
(9, 'NP-KT-9819', 'MR.PARAMESHWRAN', 776701733, 1008, '2021-12-23', 'Car', 'Audi', 'bay 1', 7, 0, NULL, 0, 0, '2021-12-23 03:37:38', '2021-12-23 03:37:38'),
(10, 'NP-KT-9819', 'MR.PARAMESHWRAN', 776701733, 1009, '2021-12-23', 'Car', 'Audi', 'bay 1', 7, 0, NULL, 50152, 0, '2021-12-23 06:20:41', '2021-12-23 06:20:41'),
(11, 'NP-KT-9819', 'MR.PARAMESHWRAN', 776701733, 1010, '2021-12-24', 'Car', 'Audi', 'bay 1', 7, 0, NULL, 50152, 0, '2021-12-24 08:26:05', '2021-12-24 08:26:05'),
(12, 'bh1425', 'ninu', 771264444, 1011, '2021-12-27', 'Car', 'Audi', 'bay 1', 15, 0, NULL, 100, 150, '2021-12-27 12:07:10', '2021-12-27 12:07:10'),
(13, 'WP KU 0096', 'MR SATHTHIYAN', 776845225, 1012, '2021-12-28', 'Car', 'Audi', 'bay 1', 7, 0, NULL, 63933, 68000, '2021-12-28 07:36:36', '2021-12-28 07:36:36'),
(14, 'WP KU 0096', 'MR SATHTHIYAN', 776845225, 1013, '2021-12-30', 'Car', 'Audi', 'bay 1,bay 2', 7, 0, NULL, 0, 0, '2021-12-30 05:22:31', '2021-12-30 05:22:31'),
(15, 'NP-KR-7493', 'MR.RAVINTHRAN', 770782757, 1014, '2021-12-30', 'Car', 'Audi', 'bay 1,bay 2', 7, 0, NULL, 0, 0, '2021-12-30 11:07:08', '2021-12-30 11:07:08'),
(16, 'NP-KR-7493', 'MR.RAVINTHRAN', 770782757, 1015, '2021-12-30', 'Car', 'Audi', 'bay 1,bay 2', 7, 0, NULL, 85692, 0, '2021-12-30 11:08:10', '2021-12-30 11:08:10'),
(17, 'NP-KR-7493', 'MR.RAVINTHRAN', 770782757, 1016, '2021-12-30', 'Car', 'Audi', 'bay 1,bay 2', 7, 0, NULL, 85692, 0, '2021-12-30 11:09:48', '2021-12-30 11:09:48'),
(18, 'NP-HH-1378', 'MR.JOHNSHAN', 776398699, 1017, '2021-12-30', 'Car', 'Audi', 'bay 1,bay 2', 7, 0, NULL, 51520, 0, '2021-12-30 11:11:50', '2021-12-30 11:11:50'),
(19, 'NP-CBL-4227', 'MR.SIVANTHAN', 77503177, 1018, '2021-12-30', 'Car', 'Audi', 'bay 1,bay 2', 7, 0, NULL, 0, 0, '2021-12-30 11:12:42', '2021-12-30 11:12:42'),
(20, 'NP-CBL-4227', 'MR.SIVANTHAN', 775023127, 1019, '2021-12-30', 'Car', 'Audi', 'bay 1,bay 2', 7, 0, NULL, 50451, 0, '2021-12-30 11:14:10', '2021-12-30 11:14:10'),
(21, 'WP CBI 0764', 'MR VINOTH', 778409677, 1020, '2021-12-31', ' HONDA VEZEL', 'Audi', 'bay 1,bay 2', 7, 0, NULL, 45877, 50877, '2021-12-31 07:06:20', '2021-12-31 07:06:20'),
(22, 'DD_100', 'saru', 773148560, 1021, '2022-01-03', ' HONDA VEZEL', 'Audi', 'bay 1,bay 2', 7, 0, NULL, 12, 12, '2022-01-03 04:23:23', '2022-01-03 04:23:23'),
(23, 'NP CAK 1172', 'MR PRASANTH', 764100338, 1022, '2022-01-03', ' HONDA VEZEL', 'Audi', 'bay 1,bay 2', 7, 0, NULL, 65628, 71628, '2022-01-03 09:32:40', '2022-01-03 09:32:40'),
(24, 'WP KV 9073', 'MR DILAN', 777738527, 1023, '2022-01-03', 'Car', 'Audi', 'bay 1,bay 2', 7, 0, NULL, 225793, 0, '2022-01-03 09:39:56', '2022-01-03 09:39:56'),
(25, 'WP KV 9073', 'MR DILAN', 7777, 1024, '2022-01-03', ' HONDA VEZEL', 'Audi', 'bay 1,bay 2', 7, 0, NULL, 0, 0, '2022-01-03 09:42:56', '2022-01-03 09:42:56'),
(26, 'WP KV 9073', 'MR DILAN', 777738527, 1025, '2022-01-03', 'Car', 'Audi', 'bay 1,bay 2', 7, 0, NULL, 0, 0, '2022-01-03 09:44:12', '2022-01-03 09:44:12'),
(27, 'NP CAB-4410', 'MR REGINOLD', 777331303, 1026, '2022-01-03', 'Car', 'Audi', 'bay 1,bay 2', 7, 0, NULL, 0, 0, '2022-01-03 09:46:32', '2022-01-03 09:46:32'),
(28, 'WP PE 9084', 'MR KOKILAN', 774730949, 1027, '2022-01-05', 'VAN', 'Audi', 'bay 1,bay 2', 7, 0, NULL, 259636, 264636, '2022-01-05 07:24:23', '2022-01-05 07:24:23'),
(29, 'NP CAI 9135', 'MR MURTHTHI', 778860885, 1028, '2022-01-11', 'SUZUKI WAGONR', 'Audi', 'bay 1,bay 2', 7, 0, NULL, 45654, 50654, '2022-01-11 05:37:30', '2022-01-11 05:37:30'),
(30, 'NP CAI 9135', 'MR MURTHTHI', 778860885, 1029, '2022-01-11', 'SUZUKI WAGONR', 'Audi', 'bay 1,bay 2', 7, 0, NULL, 45654, 50654, '2022-01-11 05:59:43', '2022-01-11 05:59:43'),
(31, 'NP CAE-3447', 'MR THESIKAN', 779710599, 1030, '2022-01-16', 'TOYOTA PRIUS', 'TOYOTA', 'bay 1,bay 2', 7, 0, NULL, 41106, 0, '2022-01-16 05:43:44', '2022-01-16 05:43:44'),
(32, 'NP-KT-9819', 'MR.PARAMESHWRAN', 776701733, 1031, '2022-01-16', ' HONDA VEZEL', 'Audi', 'bay 1,bay 2', 7, 0, NULL, 51520, 0, '2022-01-16 06:15:29', '2022-01-16 06:15:29'),
(33, 'NP KL 7663', 'MR ANOJ', 776110198, 1032, '2022-01-16', ' HONDA VEZEL', 'TOYOTA', 'bay 1,bay 2', 7, 0, NULL, 119500, 0, '2022-01-16 06:42:54', '2022-01-16 06:42:54'),
(34, 'NP CAR 5560', 'MR SATHEES', 778618658, 1033, '2022-01-16', 'Car', 'TOYOTA', 'bay 1,bay 2', 7, 0, NULL, 74562, 0, '2022-01-16 09:54:40', '2022-01-16 09:54:40'),
(35, 'NP CAQ 5908', 'P.KANNATHASAN', 242223741, 1034, '2022-01-18', ' HONDA VEZEL', 'HONDA', 'bay 1,bay 2', 7, 0, NULL, 109966, 0, '2022-01-18 05:51:04', '2022-01-18 05:51:04'),
(36, 'NP PJ 5750', 'MR ANTONY', 776309683, 1035, '2022-01-18', ' HONDA VEZEL', 'Audi', 'bay 1,bay 2', 7, 0, NULL, 31784, 0, '2022-01-18 07:02:03', '2022-01-18 07:02:03'),
(37, 'sen 1234', 'senthoo', 778434368, 1036, '2022-01-22', ' HONDA VEZEL', 'Audi', 'bay 1,bay 2', 7, 100, NULL, 1000, 1001, '2022-01-22 18:21:53', '2022-01-22 18:21:53'),
(38, 'BH1233', 'Vinu', 770280956, 1037, '2022-01-23', ' HONDA VEZEL', 'Audi', 'bay 1,bay 2', 7, 0, NULL, 0, 0, '2022-01-23 02:27:26', '2022-01-23 02:27:26'),
(39, 'NP CBC 1895', 'MR. R THASEEYTHARAN', 773522376, 1038, '2022-01-01', 'SUZUKI WAGONR', 'SUZUKI', 'bay 1,bay 2', 7, 0, NULL, 0, 0, '2022-01-23 03:52:16', '2022-01-23 03:52:16'),
(40, 'CP KG-7135', 'MR BINU', 741088399, 1039, '2022-01-01', 'Car', 'TOYOTA', 'bay 1,bay 2', 7, 0, NULL, 0, 0, '2022-01-23 04:01:57', '2022-01-23 04:01:57'),
(41, 'CAV-0970', 'MR SARANGAN', 774646846, 1040, '2022-01-01', 'SUZUKI WAGONR', 'SUZUKI', 'bay 1,bay 2', 7, 0, NULL, 0, 0, '2022-01-23 04:03:49', '2022-01-23 04:03:49'),
(42, 'NP CBI 3925', 'MR THULASI', 764450161, 1041, '2022-01-01', 'Car', 'Audi', 'bay 1,bay 2', 7, 0, NULL, 0, 0, '2022-01-23 04:05:21', '2022-01-23 04:05:21'),
(43, 'KS 9432', 'MR RAJU', 772728048, 1042, '2022-01-01', 'Car', 'Audi', 'bay 1,bay 2', 7, 0, NULL, 0, 0, '2022-01-23 04:07:41', '2022-01-23 04:07:41'),
(44, 'NP CAE8543', 'MR PRASANNA', 714879516, 1043, '2022-01-02', 'SUZUKI', 'SUZUKI', 'bay 1,bay 2', 7, 0, NULL, 0, 0, '2022-01-23 05:48:18', '2022-01-23 05:48:18'),
(45, 'NP CBC 1895', 'MR. R THASEEYTHARAN', 773522376, 1044, '2022-01-01', 'SUZUKI WAGONR', 'SUZUKI', 'bay 1,bay 2', 7, 0, NULL, 0, 0, '2022-01-23 06:59:32', '2022-01-23 06:59:32'),
(46, 'NP CBC 1895', 'MR R.THASEEYTHARAN', 773522376, 1045, '2022-01-01', 'SUZUKI WAGONR', 'SUZUKI', 'bay 1,bay 2', 7, 0, NULL, 0, 0, '2022-01-23 07:19:10', '2022-01-23 07:19:10'),
(47, 'NP-KP-0188', 'MR.SURESH', 777821238, 1046, '2022-01-02', 'SUZUKI', 'SUZUKI', 'bay 1,bay 2', 7, 0, NULL, 89961, 94961, '2022-01-23 11:32:11', '2022-01-23 11:32:11'),
(48, 'NP CAU -2234', 'MR.UMAKARAN', 777111151, 1047, '2022-01-02', ' HONDA VEZEL', 'Audi', 'bay 1,bay 2', 7, 0, NULL, 57848, 62848, '2022-01-23 11:43:28', '2022-01-23 11:43:28'),
(49, 'NC CAE 1773', 'MR RISHADY', 716352515, 1048, '2022-01-02', ' HONDA VEZEL', 'Audi', 'bay 1,bay 2', 7, 0, NULL, 0, 0, '2022-01-24 11:03:13', '2022-01-24 11:03:13'),
(50, 'NC CAE 1773', 'MR RISHADY', 716352515, 1049, '2022-01-24', ' HONDA VEZEL', 'Audi', 'bay 1,bay 2', 7, 0, NULL, 0, 0, '2022-01-24 11:08:02', '2022-01-24 11:08:02'),
(51, 'NC CAE 1773', 'MR RISHADY', 716352515, 1050, '2022-01-24', ' HONDA VEZEL', 'Audi', 'bay 1,bay 2', 7, 0, NULL, 0, 0, '2022-01-24 11:26:25', '2022-01-24 11:26:25'),
(52, 'NC CAE 1773', 'MR RISHADY', 716352515, 1051, '2022-01-02', 'Car', 'Audi', 'bay 1,bay 2', 7, 0, NULL, 0, 0, '2022-01-25 04:53:36', '2022-01-25 04:53:36'),
(53, 'NP CAK 1172', 'MR PRASANTH', 764100338, 1052, '2022-01-25', ' HONDA VEZEL', 'Audi', 'bay 1,bay 2', 7, 0, NULL, 0, 0, '2022-01-25 06:52:23', '2022-01-25 06:52:23'),
(54, 'WP KS 4299', 'MR SIVASOTHI', 776517311, 1053, '2022-01-02', 'A STAR', 'Audi', 'bay 1,bay 2', 7, 10, NULL, 0, 0, '2022-01-25 07:12:36', '2022-01-25 07:12:36'),
(55, 'WP KS 4299 	', 'MR SIVASOTHI 	', 776517311, 1054, '2022-01-25', 'A STAR', 'Audi', 'bay 1,bay 2', 7, 750, NULL, 0, 0, '2022-01-25 07:16:37', '2022-01-25 07:16:37'),
(56, 'WP KV 9073', 'MR DILAN', 777738527, 1055, '2022-01-03', 'Car', 'Audi', 'bay 1,bay 2', 7, 0, NULL, 0, 0, '2022-01-25 07:19:35', '2022-01-25 07:19:35'),
(57, 'WP DAH 4991', 'MR VIGI', 763977314, 1056, '2022-01-03', 'DIMO', 'Audi', 'bay 1,bay 2', 7, 145, NULL, 0, 0, '2022-01-25 07:33:16', '2022-01-25 07:33:16'),
(58, 'WP DAH 4991', 'MR VIGI', 763977314, 1057, '2022-01-03', 'DIMO', 'Audi', 'bay 1,bay 2', 7, 195, NULL, 0, 0, '2022-01-25 07:39:09', '2022-01-25 07:39:09'),
(59, 'NP PD 8351', 'MR SUTHARSAN', 774920136, 1058, '2022-01-03', 'Car', 'Audi', 'bay 1,bay 2', 7, 0, NULL, 211888, 251888, '2022-01-25 08:35:04', '2022-01-25 08:35:04'),
(60, 'NP PD 8351', 'MR SUTHARSAN', 774920136, 1059, '2022-01-25', 'Car', 'Audi', 'bay 1,bay 2', 7, 400, NULL, 0, 0, '2022-01-25 08:40:05', '2022-01-25 08:40:05'),
(61, 'NP CAB-4410', 'MR REGINOLD', 777331303, 1060, '2022-01-25', 'Car', 'Audi', 'bay 1,bay 2', 7, 0, NULL, 0, 0, '2022-01-25 08:41:06', '2022-01-25 08:41:06'),
(62, 'EP CAD 5625', 'MR U SARANKAN', 773418804, 1061, '2022-01-04', 'Car', 'Audi', 'bay 1,bay 2', 7, 0, NULL, 0, 0, '2022-01-25 08:43:09', '2022-01-25 08:43:09'),
(63, 'WP CAD 3287', 'MR SUJEE', 772727735, 1062, '2022-01-04', 'Car', 'Audi', 'bay 1,bay 2', 7, 0, NULL, 67558, 72558, '2022-01-25 09:01:38', '2022-01-25 09:01:38'),
(64, 'WP CAD 3287', 'MR SUJEE', 772727735, 1063, '2022-01-25', 'Car', 'Audi', 'bay 1,bay 2', 7, 250, NULL, 67558, 72558, '2022-01-25 09:06:05', '2022-01-25 09:06:05'),
(65, 'NP CBD 2261', 'MR NIROSAN', 714233126, 1064, '2022-01-04', 'Car', 'Audi', 'bay 1,bay 2', 7, 0, NULL, 0, 0, '2022-01-25 09:08:43', '2022-01-25 09:08:43'),
(66, 'WP CAI 0793', 'S.RAJU', 772728048, 1065, '2022-01-04', 'Car', 'Audi', 'bay 1,bay 2', 7, 370, NULL, 0, 0, '2022-01-25 09:11:20', '2022-01-25 09:11:20'),
(67, 'NP CAI 8578', 'MR.BASKARAN', 772831690, 1066, '2022-01-04', 'VXI', 'Audi', 'bay 1,bay 2', 7, 0, NULL, 0, 0, '2022-01-25 09:15:02', '2022-01-25 09:15:02'),
(68, 'WP NA 9001', 'MR.S.JANAKAN', 759525035, 1067, '2022-01-04', 'TATA WINCE', 'Audi', 'bay 1,bay 2', 7, 95, NULL, 97228, 102228, '2022-01-25 09:39:30', '2022-01-25 09:39:30'),
(69, 'CDE 2213', 'MR KUDDY', 740212019, 1068, '2022-01-25', ' HONDA VEZEL', 'Audi', 'bay 1,bay 2', 7, 0, NULL, 0, 0, '2022-01-25 09:41:29', '2022-01-25 09:41:29'),
(70, 'CDE 2213 	', 'MR KUDDY', 745702526, 1069, '2022-01-05', ' HONDA VEZEL', 'Audi', 'bay 1,bay 2', 7, 0, NULL, 0, 0, '2022-01-25 09:43:13', '2022-01-25 09:43:13'),
(71, 'NP PK 6908', 'MR.KABILAN', 775702526, 1070, '2022-01-05', 'Car', 'Audi', 'bay 1,bay 2', 7, 500, NULL, 109966, 114966, '2022-01-25 10:19:30', '2022-01-25 10:19:30'),
(72, 'WP PF-9084', 'MR.KOKILAN', 774730949, 1071, '2022-01-05', 'VAN', 'Audi', 'bay 1,bay 2', 7, 0, NULL, 259636, 264636, '2022-01-25 10:23:21', '2022-01-25 10:23:21'),
(73, 'CK 6162', 'MR.VARATHARAJAN', 770118510, 1072, '2022-01-05', ' HONDA VEZEL', 'Audi', 'bay 1,bay 2', 7, 0, NULL, 0, 0, '2022-01-25 10:26:46', '2022-01-25 10:26:46'),
(74, '251-6352', 'MR.THAVARANJITHAN', 774524032, 1073, '2022-01-05', 'VAN', 'Audi', 'bay 1,bay 2', 7, 4920, NULL, 0, 0, '2022-01-25 10:31:40', '2022-01-25 10:31:40'),
(75, 'WP KO -3591', 'MR PIRASATHPERA', 773136415, 1074, '2022-01-05', ' HONDA VEZEL', 'Audi', 'bay 1,bay 2', 7, 0, NULL, 0, 0, '2022-01-25 10:48:25', '2022-01-25 10:48:25'),
(76, 'NP PI -1997', 'MR SHANTHAN', 774710706, 1075, '2022-01-05', 'Car', 'Audi', 'bay 1,bay 2', 7, 0, NULL, 0, 0, '2022-01-25 10:50:11', '2022-01-25 10:50:11'),
(77, 'WP 251-2898', 'MR KIRISHAN', 771366331, 1076, '2022-01-06', 'VAN', 'Audi', 'bay 1,bay 2', 7, 0, NULL, 0, 0, '2022-01-25 10:51:21', '2022-01-25 10:51:21'),
(78, 'NP CAR-5480', 'MR VIKINESWARAN', 774349113, 1077, '2022-01-06', ' HONDA VEZEL', 'HONDA', 'bay 1,bay 2', 7, 0, NULL, 0, 0, '2022-01-25 10:52:40', '2022-01-25 10:52:40'),
(79, 'NP KR-7089', 'MR KUMAR', 767999520, 1078, '2022-01-06', 'Car', 'TOYOTA', 'bay 1,bay 2', 7, 0, NULL, 0, 0, '2022-01-25 10:54:47', '2022-01-25 10:54:47'),
(80, 'NP CBF-2645', 'MR THEEPAN', 779587922, 1079, '2022-01-06', 'Car', 'Audi', 'bay 1,bay 2', 7, 0, NULL, 0, 0, '2022-01-25 10:55:53', '2022-01-25 10:55:53'),
(81, 'WP CAO 8555', 'MR SHANKAR', 777517102, 1080, '2022-01-06', 'TOYOTA PRIUS', 'TOYOTA', 'bay 1,bay 2', 7, 0, NULL, 0, 0, '2022-01-25 11:01:27', '2022-01-25 11:01:27'),
(82, 'NP DAG-9763', 'MR SRITHARAN', 775140820, 1081, '2022-01-06', 'BOLERO', 'Audi', 'bay 1,bay 2', 7, 675, NULL, 14056, 19056, '2022-01-25 11:14:20', '2022-01-25 11:14:20'),
(83, 'NP KN 2882', 'MR PIRASANTH', 770777738, 1082, '2022-01-06', 'Car', 'Audi', 'bay 1,bay 2', 7, 0, NULL, 0, 0, '2022-01-25 11:15:56', '2022-01-25 11:15:56'),
(84, '59 5890', 'MR KAJANTHAN', 766564888, 1083, '2022-01-06', 'VAN', 'Audi', 'bay 1,bay 2', 7, 0, NULL, 441358, 446358, '2022-01-25 11:17:53', '2022-01-25 11:17:53'),
(85, 'CI 5582', ' SHARAN HARDWARE', 774493124, 1084, '2022-01-06', 'Car', 'Audi', 'bay 1,bay 2', 7, 0, NULL, 0, 0, '2022-01-25 11:19:22', '2022-01-25 11:19:22'),
(86, 'NP KL 3524', 'MR VINOTH', 779443213, 1085, '2022-01-06', 'Car', 'MICRO', 'bay 1,bay 2', 7, 100, NULL, 76881, 81881, '2022-01-26 03:19:49', '2022-01-26 03:19:49'),
(87, 'NP KX 5157', 'MR BRUNTHAPAN', 773268356, 1086, '2022-01-06', 'Car', 'Audi', 'bay 1,bay 2', 7, 100, NULL, 53333, 58333, '2022-01-26 03:42:53', '2022-01-26 03:42:53'),
(88, 'CP CAY 8414', 'MR THUSHARA', 770790881, 1087, '2022-01-06', 'Car', 'MICRO', 'bay 1,bay 2', 7, 0, NULL, 62000, 67000, '2022-01-26 03:45:05', '2022-01-26 03:45:05'),
(89, 'KI 3524', 'MR J VINOTH', 77794213, 1088, '2022-01-06', 'MICRO PANDA', 'MICRO', 'bay 1,bay 2', 7, 0, NULL, 0, 0, '2022-01-26 04:35:29', '2022-01-26 04:35:29'),
(90, 'NP KX 5157', 'MR BRUNTHAPAN', 773268356, 1089, '2022-01-06', 'Car', 'Audi', 'bay 1,bay 2', 7, 0, NULL, 0, 0, '2022-01-26 04:38:53', '2022-01-26 04:38:53'),
(91, 'NC CAA 0464', 'MR PRATHEEPAN', 773136262, 1090, '2022-01-06', 'TOYOTA PRIUS', 'TOYOTA', 'bay 1,bay 2', 7, 100, NULL, 0, 0, '2022-01-26 04:44:47', '2022-01-26 04:44:47'),
(92, 'NP CAB-3435', 'MR JOWAN', 771203083, 1091, '2022-01-06', 'Car', 'TOYOTA', 'bay 1,bay 2', 7, 90, NULL, 0, 0, '2022-01-26 04:48:09', '2022-01-26 04:48:09'),
(93, 'NP HE 9379', 'MR SATHIS', 772354883, 1092, '2022-01-07', 'VAN', 'Audi', 'bay 1,bay 2', 7, 0, NULL, 164000, 169000, '2022-01-26 04:51:16', '2022-01-26 04:51:16'),
(94, 'NP DAF 5476', 'MR J. KARAN', 774487193, 1093, '2022-01-07', 'BOLERO', 'TATA', 'bay 1,bay 2', 7, 0, NULL, 30204, 35204, '2022-01-26 04:54:15', '2022-01-26 04:54:15'),
(95, 'WP PF-9084', 'MR.KOKILAN', 774730949, 1094, '2022-01-07', 'VAN', 'Audi', 'bay 1,bay 2', 7, 0, NULL, 255000, 260000, '2022-01-26 04:57:15', '2022-01-26 04:57:15'),
(96, 'WP CAJ - 7295', 'MR SELVAKUMAR', 764598071, 1095, '2022-01-07', 'Car', 'Audi', 'bay 1,bay 2', 7, 0, NULL, 62502, 67502, '2022-01-26 05:00:27', '2022-01-26 05:00:27'),
(97, 'NW CAI-7966', 'MR KISHOBIKAN', 764334148, 1096, '2022-01-07', 'Car', 'Audi', 'bay 1,bay 2', 7, 1400, NULL, 50248, 55248, '2022-01-26 05:11:45', '2022-01-26 05:11:45'),
(98, 'SP PH 3620', 'MR SUPRA ', 779779963, 1097, '2022-01-07', 'FORD CAB', 'FORD', 'bay 1,bay 2', 7, 0, NULL, 0, 0, '2022-01-26 05:18:50', '2022-01-26 05:18:50'),
(99, 'SP CBF-7057', 'MR SHANTHAN', 774710706, 1098, '2022-01-07', 'Car', 'Audi', 'bay 1,bay 2', 7, 0, NULL, 32238, 37238, '2022-01-26 05:20:27', '2022-01-26 05:20:27'),
(100, 'CP CAV- 2942', 'MR PRASANTH', 764598071, 1099, '2022-01-07', 'Car', 'Audi', 'bay 1,bay 2', 7, 0, NULL, 69918, 74918, '2022-01-26 05:31:11', '2022-01-26 05:31:11'),
(101, 'NP KS 4330', 'MR JATHURSAN', 770512003, 1100, '2022-01-07', ' HONDA VEZEL', 'INSIGHT', 'bay 1,bay 2', 7, 0, NULL, 57993, 62993, '2022-01-26 05:35:18', '2022-01-26 05:35:18'),
(102, '251-8579', 'MR BENJAMIN', 771110453, 1101, '2022-01-07', 'VAN', 'Audi', 'bay 1,bay 2', 7, 0, NULL, 327696, 332696, '2022-01-26 05:41:56', '2022-01-26 05:41:56'),
(103, 'NC CAT 1091', 'MR.KOKILAN', 774730949, 1102, '2022-01-07', 'Car', 'Audi', 'bay 1,bay 2', 7, 0, NULL, 36632, 41632, '2022-01-26 05:44:02', '2022-01-26 05:44:02'),
(104, 'NP PG 7277', 'MR SUTHARSAN', 767676784, 1103, '2022-01-08', 'VAN', 'TOYOTA', 'bay 1,bay 2', 7, 2640, NULL, 68912, 74912, '2022-01-26 07:22:41', '2022-01-26 07:22:41'),
(105, 'NP CAZ 7952', 'MR AJANTHAN', 767454646, 1104, '2022-01-08', 'Car', 'Audi', 'bay 1,bay 2', 7, 0, NULL, 114000, 119000, '2022-01-26 07:25:46', '2022-01-26 07:25:46'),
(106, 'NP CBC-1895', 'MR. R THASEEYTHARAN', 773522376, 1105, '2022-01-08', 'SUZUKI WAGONR', 'SUZUKI', 'bay 1,bay 2', 7, 0, NULL, 0, 0, '2022-01-26 07:31:03', '2022-01-26 07:31:03'),
(107, 'NP DAG 9312', 'MR KIRUSHNAKUMAR', 773834328, 1106, '2022-01-08', 'BOLERO', 'TATA', 'bay 1,bay 2', 7, 400, NULL, 25053, 30053, '2022-01-26 07:35:15', '2022-01-26 07:35:15'),
(108, 'NP DAC 4258', 'MR NITHARSAN', 769486619, 1107, '2022-01-08', 'BOLERO', 'MAHINDRA', 'bay 1,bay 2', 7, 0, NULL, 83414, 88414, '2022-01-26 07:36:50', '2022-01-26 07:36:50'),
(109, 'NP CBA 1335', 'MR KAMTHEEPAN', 778944081, 1108, '2022-01-08', 'Car', 'Audi', 'bay 1,bay 2', 7, 0, NULL, 74035, 79035, '2022-01-26 10:48:32', '2022-01-26 10:48:32'),
(110, 'NP CAE 4322', 'MR SRI', 762929801, 1109, '2022-01-08', 'SUZUKI ALTO', 'SUZUKI', 'bay 1,bay 2', 7, 0, NULL, 80000, 85000, '2022-01-26 10:50:09', '2022-01-26 10:50:09');

-- --------------------------------------------------------

--
-- Table structure for table `order_item`
--

CREATE TABLE `order_item` (
  `id` int(11) NOT NULL,
  `bill_no` int(11) NOT NULL,
  `item_id` varchar(255) NOT NULL,
  `purchase_id` int(11) NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `amount` int(11) DEFAULT NULL,
  `qty` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_item`
--

INSERT INTO `order_item` (`id`, `bill_no`, `item_id`, `purchase_id`, `item_name`, `amount`, `qty`, `status`, `created`) VALUES
(1, 1011, '07207621', 1, 'T10-W2.1*9,5D-12V-5W', 120, 2, 1, '2021-12-27 12:07:10'),
(2, 1011, '072076311', 6, 'T15-W2,1*9,5D-12V-W16W', NULL, 1, 1, '2021-12-27 12:07:10'),
(3, 1012, '07207621', 1, 'T10-W2.1*9,5D-12V-5W', 120, 1, 1, '2021-12-28 07:36:36'),
(6, 1013, '07207621', 1, 'T10-W2.1*9,5D-12V-5W', 120, 10, 1, '2021-12-30 05:22:31'),
(11, 1013, '0720118016', 269, 'H16-(PGJ19-3)-12V-19W', NULL, 2, 1, '2021-12-30 05:22:31'),
(12, 1013, '0720710110', 5, 'H4-P43T-12V-100/90W', 1300, 1, 1, '2021-12-30 05:22:31'),
(13, 1021, '07207111', 9, 'H1-P14,5S-12V-55W', 620, 1, 1, '2022-01-03 04:23:23'),
(16, 1032, '90915-YZZE1', 301, 'C-110', 1100, 1, 1, '2022-01-16 06:42:54'),
(17, 1034, '15400-RTA-003', 307, 'C-809', 800, 1, 1, '2022-01-18 05:51:04'),
(18, 1036, '0720718008', 19, ' H8-(PGJ19-1_-12V-35W', 1950, 1, 1, '2022-01-22 18:21:53'),
(19, 1037, '17801-21050', 315, 'SUB-ASSY,AI', 2450, 1, 1, '2022-01-23 02:27:26'),
(20, 1039, '0848270425', 65, 'HOKMNT-L425', 1200, 1, 1, '2022-01-23 04:01:57'),
(21, 1039, '0848270600', 71, 'HOKMNT-L600MM', 1600, 1, 1, '2022-01-23 04:01:57'),
(26, 1043, '500007393', 230, 'CX HAV FORMULA ', 6375, 1, 1, '2022-01-23 05:48:18'),
(27, 1043, '16510-81404', 310, 'C-932', 1100, 1, 1, '2022-01-23 05:48:18'),
(31, 1047, '0893556110', 79, 'RADIATOR COOLANT INVERTOR -READY TO USE -1LTR', 1700, 1, 1, '2022-01-23 11:43:28'),
(36, 1048, '87139-0N010', 298, 'AC-108', 1800, 1, 1, '2022-01-24 11:03:13'),
(39, 1049, '87139-0N010', 298, 'AC-108', 1800, 1, 1, '2022-01-24 11:08:02'),
(40, 1049, '15400-RTA-003', 307, 'C-809', 800, 1, 0, '2022-01-24 11:15:16'),
(42, 1048, '15400-RTA-003', 307, 'C-809', 800, 1, 0, '2022-01-24 11:23:03'),
(44, 1050, '87139-0N010', 298, 'AC-108', 1800, 1, 0, '2022-01-24 11:27:10'),
(45, 1051, '135952', 325, 'MOBIL SUPER 10-30 ', 6950, 1, 1, '2022-01-25 04:53:36'),
(47, 1051, '15400-RTA-003 Genuine', 326, 'C-809', 1800, 1, 1, '2022-01-25 04:53:36'),
(48, 1051, '87139-0N010', 298, 'AC-108', 1800, 1, 1, '2022-01-25 04:53:36'),
(49, 1053, '0893556107', 327, 'RADIATOR COOLANT  HYBRID-READYTO USE -5LTR -RED', 3750, 2, 1, '2022-01-25 07:12:36'),
(50, 1054, '0893556107', 327, 'RADIATOR COOLANT  HYBRID-READYTO USE -5LTR -RED', 3750, 2, 1, '2022-01-25 07:16:37'),
(52, 1056, '500574ZVL', 328, 'CX DELO GOLD ULTRA (06LTR)', 8695, 1, 1, '2022-01-25 07:33:16'),
(53, 1057, '500574ZVL', 328, 'CX DELO GOLD ULTRA (06LTR)', 8695, 1, 1, '2022-01-25 07:39:09'),
(54, 1058, '08886-81016 TYPE  T IV', 330, 'ATF 4L', 9300, 1, 1, '2022-01-25 08:35:04'),
(55, 1058, '08886-81016 ', 329, 'ATF', 2400, 3, 1, '2022-01-25 08:35:04'),
(56, 1059, '08886-81016 ', 329, 'ATF', 2400, 3, 1, '2022-01-25 08:40:05'),
(57, 1059, '08886-81016 TYPE  T IV', 330, 'ATF 4L', 9300, 1, 1, '2022-01-25 08:40:05'),
(58, 1062, '08880-84106 4L', 331, 'TOYOTA 0W- 20 ', 8450, 1, 1, '2022-01-25 09:01:38'),
(59, 1062, '90915-YZZE1', 301, 'C-110', 1100, 1, 1, '2022-01-25 09:01:38'),
(60, 1063, '90915-YZZE1', 301, 'C-110', 1100, 1, 1, '2022-01-25 09:06:05'),
(61, 1063, '08880-84106 4L', 331, 'TOYOTA 0W- 20 ', 8450, 1, 1, '2022-01-25 09:06:05'),
(63, 1067, 'KW0003243', 332, 'RADIATOR COOLANT RED', 1150, 1, 1, '2022-01-25 09:39:30'),
(64, 1067, '500574ZVL', 328, 'CX DELO GOLD ULTRA (06LTR)', 8695, 1, 1, '2022-01-25 09:39:30'),
(65, 1070, 'SN003435', 324, 'CASTROL 10W-30', 5540, 1, 1, '2022-01-25 10:19:30'),
(66, 1070, '13780-64P00', 336, 'SUZUKI A-983', 2550, 1, 1, '2022-01-25 10:19:30'),
(67, 1070, '16510-81404', 310, 'C-932', 1100, 1, 1, '2022-01-25 10:19:30'),
(68, 1071, '003-389', 128, 'A-2023', 2600, 1, 1, '2022-01-25 10:23:21'),
(69, 1074, '08880-83509 4L 10W-30', 338, 'TOYOTA 10W -30', 6900, 1, 1, '2022-01-25 10:48:25'),
(70, 1074, '90915-YZZE1', 335, 'C-110', 1100, 1, 1, '2022-01-25 10:48:25'),
(71, 1081, '0303BC0071N', 339, 'MAHENDRA BOLERO OIL FILTER', 950, 1, 1, '2022-01-25 11:14:20'),
(72, 1081, '500574ZVL', 328, 'CX DELO GOLD ULTRA (06LTR)', 8695, 1, 1, '2022-01-25 11:14:20'),
(73, 1081, '500574NAE', 228, 'CX DELO GOLD ULTRA (01LTR)', 2175, 1, 1, '2022-01-25 11:14:20'),
(74, 1085, '08880-83509 4L 10W-30', 338, 'TOYOTA 10W -30', 6900, 1, 1, '2022-01-26 03:19:49'),
(75, 1085, '07207101', 340, 'AUTO LAMPE H4 AUTO MOTIVE BULB H4', 1300, 1, 1, '2022-01-26 03:19:49'),
(76, 1086, '08880-83509 4L 10W-30', 338, 'TOYOTA 10W -30', 6900, 1, 1, '2022-01-26 03:42:53'),
(77, 1086, '04152-YZZA6', 341, 'O-117', 1400, 1, 1, '2022-01-26 03:42:53'),
(78, 1086, '88568-52010', 343, 'AC-101', 2200, 1, 1, '2022-01-26 03:42:53'),
(79, 1086, '17801-37021 ', 342, 'A-1027 TOYOTA GENUNIE', 2800, 1, 1, '2022-01-26 03:42:53'),
(80, 1088, '07207611', 14, 'T10-W2,1*9.5D-12V-3W', 110, 4, 1, '2022-01-26 04:35:29'),
(88, 1088, '07207383', 346, 'BULB-INDCTR/BRK-AMBER-BAU 15S 12V-21WATT', 290, 1, 1, '2022-01-26 04:35:29'),
(89, 1088, '07207401', 344, 'AUTO LAMPE R5W AUTO MOTIVE BULB R5W', 210, 1, 1, '2022-01-26 04:35:29'),
(91, 1089, '9500000306', 77, 'COOLANT-PREMIUM-RED-1LTR', 1700, 1, 1, '2022-01-26 04:38:53'),
(92, 1090, '88568-52010', 343, 'AC-101', 2200, 1, 1, '2022-01-26 04:44:47'),
(93, 1096, '16510-81404', 310, 'C-932', 1100, 1, 1, '2022-01-26 05:11:45'),
(94, 1096, '13780-M-53M00', 302, 'AIR FILTER', 2650, 1, 1, '2022-01-26 05:11:45'),
(95, 1096, '08880-83509', 337, 'SN/CF 10W 30 4L PETROL/DIESEL', 6900, 1, 1, '2022-01-26 05:11:45'),
(96, 1099, '08880-83509', 337, 'SN/CF 10W 30 4L PETROL/DIESEL', 6900, 1, 1, '2022-01-26 05:31:11'),
(97, 1099, '16510-81404', 310, 'C-932', 1100, 1, 1, '2022-01-26 05:31:11'),
(98, 1099, '0892333 32 ML ', 347, 'RAPID WINDSCREEN SAMPOO', 250, 2, 1, '2022-01-26 05:31:11'),
(99, 1103, '510662UIE BREAK OIL', 349, 'CX BRAKE/CLUTH FIT DOT3 250ML', 545, 1, 1, '2022-01-26 07:22:41'),
(100, 1103, '510662PBE BREAK OIL', 350, 'CX BRAKE/CLUTH FIT DOT3 500ML', 950, 1, 1, '2022-01-26 07:22:41'),
(101, 1103, '08880-83985 CI-4 15W- 40 1L', 351, 'TOYOTA CI -4 15W-40', 1800, 1, 1, '2022-01-26 07:22:41'),
(102, 1106, '08880-83985 CI-4 15W- 40 1L', 351, 'TOYOTA CI -4 15W-40', 1800, 1, 1, '2022-01-26 07:35:15'),
(103, 1106, '0303BC0071N', 339, 'MAHENDRA BOLERO OIL FILTER', 950, 1, 1, '2022-01-26 07:35:15'),
(104, 1108, '08880-83509 4L 10W-30', 338, 'TOYOTA 10W -30', 6900, 1, 1, '2022-01-26 10:48:32'),
(105, 1108, '08886-02505 GEAR OIL', 354, 'FE CVT FLUID', 16750, 1, 1, '2022-01-26 10:48:32'),
(106, 1108, '88568 -52010 AC -102', 355, 'AC FILTER AC-102', 2200, 1, 1, '2022-01-26 10:48:32'),
(107, 1108, '17801-21050 A-1013', 356, 'AIR FITER A-1013', 2500, 1, 1, '2022-01-26 10:48:32'),
(108, 1108, '0892333 32 ML ', 347, 'RAPID WINDSCREEN SAMPOO', 250, 1, 1, '2022-01-26 10:48:32'),
(109, 1108, '0890324385 85G QUICK DRY', 352, 'RTV HD GASKET SELANT QUICK DRY', 800, 1, 1, '2022-01-26 10:48:32'),
(110, 1108, '90915-YZZE1', 335, 'C-110', 1100, 1, 1, '2022-01-26 10:48:32');

-- --------------------------------------------------------

--
-- Table structure for table `order_service`
--

CREATE TABLE `order_service` (
  `id` int(11) NOT NULL,
  `bill_no` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `service` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_service`
--

INSERT INTO `order_service` (`id`, `bill_no`, `service_id`, `service`, `amount`, `status`, `created`) VALUES
(1, 1002, 1, 'test', 1200, 1, '2021-12-09 17:17:26'),
(2, 1003, 1, 'test', 1200, 1, '2021-12-10 10:41:32'),
(4, 1004, 2, 'abc', 2000, 1, '2021-12-22 08:19:34'),
(5, 1005, 1, 'test', 1200, 1, '2021-12-22 12:10:39'),
(6, 1006, 1, 'test', 1200, 1, '2021-12-22 12:14:05'),
(7, 1007, 1, 'test', 1200, 1, '2021-12-22 12:15:31'),
(8, 1008, 4, 'oil change', 1000, 1, '2021-12-23 02:45:24'),
(9, 1008, 5, 'wash', 1000, 1, '2021-12-23 03:37:16'),
(10, 1009, 7, 'FULL SERVICE', 2900, 1, '2021-12-23 06:20:10'),
(11, 1011, 4, 'oil change', 1000, 1, '2021-12-27 12:04:49'),
(12, 1011, 6, 'BODYWASH', 900, 1, '2021-12-27 12:04:54'),
(13, 1012, 7, 'FULL SERVICE', 2900, 1, '2021-12-28 07:33:27'),
(14, 1013, 9, 'QUICK WASH - CAR/CAB', 500, 1, '2021-12-30 05:21:06'),
(16, 1020, 16, 'FULL SERVICE  CAR / CAB', 2900, 1, '2021-12-31 07:03:42'),
(17, 1020, 21, 'UNDER WASH CAR / CAB', 1500, 1, '2021-12-31 07:03:52'),
(18, 1020, 40, 'OIL FILTER CHANGE', 300, 1, '2021-12-31 07:04:01'),
(19, 1020, 43, 'AC FILTER CHANGE', 150, 1, '2021-12-31 07:04:11'),
(20, 1020, 41, 'AIR FILTER CHANGE', 200, 1, '2021-12-31 07:04:20'),
(21, 1020, 27, 'EXTERIOR DETAILING CAR /CAB', 10500, 1, '2021-12-31 07:04:34'),
(22, 1020, 36, 'GEAR OIL CHANGE', 300, 1, '2021-12-31 07:04:42'),
(23, 1020, 39, 'RADIOTOR COOLANT', 650, 1, '2021-12-31 07:04:47'),
(24, 1020, 23, 'EXTERIOR QUICK WAXING CAR / CAB', 500, 1, '2021-12-31 07:05:06'),
(25, 1020, 32, 'HEAD LIGHT POLISING CAR/ CAB ( ONE SIDE)', 950, 1, '2021-12-31 07:05:13'),
(26, 1021, 18, 'FULL SERVICE  LORRY', 5500, 1, '2022-01-03 04:23:03'),
(27, 1022, 9, 'QUICK WASH - CAR/CAB', 500, 1, '2022-01-03 09:31:49'),
(28, 1025, 12, 'BODY WASH & VACCUM CAR/ CAB', 900, 1, '2022-01-03 09:44:03'),
(29, 1026, 12, 'BODY WASH & VACCUM CAR/ CAB', 900, 1, '2022-01-03 09:46:27'),
(30, 1027, 17, 'FULL SERVICE  VAN / JEEP', 3500, 1, '2022-01-05 07:22:30'),
(31, 1028, 16, 'FULL SERVICE  CAR / CAB', 2900, 1, '2022-01-11 05:35:15'),
(35, 1030, 16, 'FULL SERVICE  CAR / CAB', 2900, 1, '2022-01-16 05:41:39'),
(36, 1030, 33, 'ENGINE CLEANING', 700, 1, '2022-01-16 05:42:11'),
(37, 1031, 16, 'FULL SERVICE  CAR / CAB', 2900, 1, '2022-01-16 06:15:20'),
(38, 1032, 16, 'FULL SERVICE  CAR / CAB', 2900, 1, '2022-01-16 06:38:26'),
(39, 1032, 33, 'ENGINE CLEANING', 700, 1, '2022-01-16 06:38:41'),
(40, 1033, 16, 'FULL SERVICE  CAR / CAB', 2900, 1, '2022-01-16 09:54:37'),
(41, 1034, 16, 'FULL SERVICE  CAR / CAB', 2900, 1, '2022-01-18 05:49:44'),
(42, 1034, 33, 'ENGINE CLEANING', 700, 1, '2022-01-18 05:49:58'),
(43, 1035, 16, 'FULL SERVICE  CAR / CAB', 2900, 1, '2022-01-18 07:01:38'),
(44, 1035, 33, 'ENGINE CLEANING', 700, 1, '2022-01-18 07:01:52'),
(45, 1036, 27, 'EXTERIOR DETAILING CAR /CAB', 10500, 1, '2022-01-22 18:21:35'),
(46, 1037, 26, 'EXTERIORPREMIUM WAXING VAN / JEEP', 1800, 1, '2022-01-23 02:25:22'),
(47, 1040, 12, 'BODY WASH & VACCUM CAR/ CAB', 900, 1, '2022-01-23 04:03:38'),
(48, 1041, 12, 'BODY WASH & VACCUM CAR/ CAB', 900, 1, '2022-01-23 04:05:16'),
(49, 1042, 12, 'BODY WASH & VACCUM CAR/ CAB', 900, 1, '2022-01-23 04:07:37'),
(50, 1043, 16, 'FULL SERVICE  CAR / CAB', 2900, 1, '2022-01-23 04:09:44'),
(51, 1043, 33, 'ENGINE CLEANING', 700, 1, '2022-01-23 04:10:07'),
(55, 1046, 16, 'FULL SERVICE  CAR / CAB', 2900, 1, '2022-01-23 11:28:16'),
(56, 1046, 33, 'ENGINE CLEANING', 700, 1, '2022-01-23 11:28:40'),
(57, 1047, 12, 'BODY WASH & VACCUM CAR/ CAB', 900, 1, '2022-01-23 11:35:30'),
(58, 1047, 33, 'ENGINE CLEANING', 700, 1, '2022-01-23 11:35:40'),
(59, 1047, 51, 'NITRIGEN  FILLUP', 200, 1, '2022-01-23 11:38:23'),
(60, 1047, 52, 'AIR FRESHNER', 150, 0, '2022-01-23 11:45:02'),
(61, 1048, 16, 'FULL SERVICE  CAR / CAB', 2900, 1, '2022-01-23 11:46:27'),
(62, 1048, 33, 'ENGINE CLEANING', 700, 1, '2022-01-24 10:56:24'),
(63, 1049, 16, 'FULL SERVICE  CAR / CAB', 2900, 1, '2022-01-24 11:06:38'),
(64, 1049, 33, 'ENGINE CLEANING', 700, 1, '2022-01-24 11:06:46'),
(65, 1050, 16, 'FULL SERVICE  CAR / CAB', 2900, 1, '2022-01-24 11:25:10'),
(66, 1050, 33, 'ENGINE CLEANING', 700, 1, '2022-01-24 11:25:18'),
(68, 1051, 33, 'ENGINE CLEANING', 700, 1, '2022-01-25 04:51:46'),
(69, 1051, 16, 'FULL SERVICE  CAR / CAB', 2950, 0, '2022-01-25 04:56:39'),
(70, 1052, 9, 'QUICK WASH - CAR/CAB', 500, 1, '2022-01-25 06:52:20'),
(71, 1055, 12, 'BODY WASH & VACCUM CAR/ CAB', 900, 1, '2022-01-25 07:19:23'),
(72, 1056, 16, 'FULL SERVICE  CAR / CAB', 2900, 1, '2022-01-25 07:21:52'),
(73, 1056, 33, 'ENGINE CLEANING', 700, 1, '2022-01-25 07:21:59'),
(74, 1057, 16, 'FULL SERVICE  CAR / CAB', 2900, 1, '2022-01-25 07:36:10'),
(75, 1057, 33, 'ENGINE CLEANING', 700, 1, '2022-01-25 07:39:03'),
(76, 1060, 12, 'BODY WASH & VACCUM CAR/ CAB', 900, 1, '2022-01-25 08:41:02'),
(77, 1062, 16, 'FULL SERVICE  CAR / CAB', 2900, 1, '2022-01-25 08:45:53'),
(78, 1062, 33, 'ENGINE CLEANING', 700, 1, '2022-01-25 08:46:07'),
(79, 1063, 16, 'FULL SERVICE  CAR / CAB', 2900, 1, '2022-01-25 09:02:39'),
(80, 1063, 33, 'ENGINE CLEANING', 700, 1, '2022-01-25 09:02:47'),
(81, 1064, 50, 'SCANNING 12V', 1500, 1, '2022-01-25 09:07:43'),
(82, 1065, 16, 'FULL SERVICE  CAR / CAB', 2900, 1, '2022-01-25 09:10:02'),
(83, 1065, 33, 'ENGINE CLEANING', 700, 1, '2022-01-25 09:10:22'),
(84, 1066, 16, 'FULL SERVICE  CAR / CAB', 2900, 1, '2022-01-25 09:14:31'),
(85, 1066, 33, 'ENGINE CLEANING', 700, 1, '2022-01-25 09:14:50'),
(86, 1070, 50, 'SCANNING 12V', 1500, 1, '2022-01-25 10:17:37'),
(87, 1070, 40, 'OIL FILTER CHANGE', 300, 1, '2022-01-25 10:17:49'),
(88, 1070, 41, 'AIR FILTER CHANGE', 200, 1, '2022-01-25 10:18:03'),
(89, 1070, 35, 'ENGINE OIL CHANGE', 300, 1, '2022-01-25 10:18:27'),
(90, 1071, 17, 'FULL SERVICE  VAN / JEEP', 3500, 1, '2022-01-25 10:21:16'),
(91, 1071, 33, 'ENGINE CLEANING', 700, 1, '2022-01-25 10:21:38'),
(92, 1072, 53, 'GRESE NIPPLE', 120, 1, '2022-01-25 10:25:48'),
(93, 1074, 40, 'OIL FILTER CHANGE', 300, 1, '2022-01-25 10:46:59'),
(94, 1074, 35, 'ENGINE OIL CHANGE', 300, 1, '2022-01-25 10:47:07'),
(95, 1075, 13, 'BODY WASH & VACCUM VAN/JEEP', 1300, 1, '2022-01-25 10:49:51'),
(96, 1076, 17, 'FULL SERVICE  VAN / JEEP', 3500, 1, '2022-01-25 10:51:19'),
(97, 1077, 12, 'BODY WASH & VACCUM CAR/ CAB', 900, 1, '2022-01-25 10:52:31'),
(98, 1079, 12, 'BODY WASH & VACCUM CAR/ CAB', 900, 1, '2022-01-25 10:55:48'),
(100, 1081, 16, 'FULL SERVICE  CAR / CAB', 2900, 1, '2022-01-25 11:14:01'),
(101, 1082, 9, 'QUICK WASH - CAR/CAB', 500, 1, '2022-01-25 11:15:52'),
(102, 1085, 12, 'BODY WASH & VACCUM CAR/ CAB', 900, 1, '2022-01-25 11:20:29'),
(103, 1085, 35, 'ENGINE OIL CHANGE', 300, 1, '2022-01-25 11:21:10'),
(104, 1085, 40, 'OIL FILTER CHANGE', 300, 1, '2022-01-25 11:21:21'),
(107, 1086, 16, 'FULL SERVICE  CAR / CAB', 2900, 1, '2022-01-26 03:39:18'),
(108, 1087, 9, 'QUICK WASH - CAR/CAB', 500, 1, '2022-01-26 03:44:06'),
(109, 1091, 12, 'BODY WASH & VACCUM CAR/ CAB', 900, 1, '2022-01-26 04:47:58'),
(110, 1092, 13, 'BODY WASH & VACCUM VAN/JEEP', 1300, 1, '2022-01-26 04:50:05'),
(111, 1095, 16, 'FULL SERVICE  CAR / CAB', 2900, 1, '2022-01-26 04:59:22'),
(112, 1096, 16, 'FULL SERVICE  CAR / CAB', 2900, 1, '2022-01-26 05:09:57'),
(113, 1096, 33, 'ENGINE CLEANING', 700, 1, '2022-01-26 05:10:03'),
(114, 1098, 12, 'BODY WASH & VACCUM CAR/ CAB', 900, 1, '2022-01-26 05:19:52'),
(115, 1099, 16, 'FULL SERVICE  CAR / CAB', 2900, 1, '2022-01-26 05:29:09'),
(116, 1099, 33, 'ENGINE CLEANING', 700, 1, '2022-01-26 05:29:14'),
(117, 1101, 13, 'BODY WASH & VACCUM VAN/JEEP', 1300, 1, '2022-01-26 05:41:15'),
(118, 1103, 17, 'FULL SERVICE  VAN / JEEP', 3500, 1, '2022-01-26 06:50:42'),
(119, 1103, 45, 'CUT & POLISH VAN & JEEP', 12500, 1, '2022-01-26 06:51:13'),
(120, 1103, 50, 'SCANNING 12V', 1500, 1, '2022-01-26 06:58:08'),
(121, 1104, 16, 'FULL SERVICE  CAR / CAB', 2900, 1, '2022-01-26 07:25:21'),
(122, 1104, 33, 'ENGINE CLEANING', 700, 1, '2022-01-26 07:25:26'),
(123, 1106, 16, 'FULL SERVICE  CAR / CAB', 2900, 1, '2022-01-26 07:32:34'),
(124, 1107, 16, 'FULL SERVICE  CAR / CAB', 2900, 1, '2022-01-26 07:36:31'),
(125, 1108, 16, 'FULL SERVICE  CAR / CAB', 2900, 1, '2022-01-26 10:06:46'),
(126, 1108, 33, 'ENGINE CLEANING', 700, 1, '2022-01-26 10:06:56');

-- --------------------------------------------------------

--
-- Table structure for table `other_service`
--

CREATE TABLE `other_service` (
  `amount` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `service` varchar(255) COLLATE utf8_bin NOT NULL,
  `bill_no` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `other_service`
--

INSERT INTO `other_service` (`amount`, `id`, `service`, `bill_no`, `created`) VALUES
(1000, 1, 'sd', 1036, '2022-01-26 07:07:46'),
(100, 2, 'Hand break Adjustment', 1037, '2022-01-26 07:07:46'),
(200, 3, 'abc', 1037, '2022-01-26 07:07:46'),
(3800, 5, 'REMOVAL & REFITTING ,REPAIRING,PAINTING &RENUWAL PARTS CHARGES TOTAL BALANCE 90650 CUSTOMER PAID', 1038, '2022-01-26 07:07:46'),
(1800, 7, 'AIR FILTER ALTO 13780-M-53MOO', 1043, '2022-01-26 07:07:46'),
(3800, 8, 'MECHANICAL, PANITING& RENUWAL PARTS', 1044, '2022-01-26 07:07:46'),
(3800, 9, 'REMOVEL & REFITTING,REPAIRING, PAINTING & RENEWAL PARTS CHARGES', 1045, '2022-01-26 07:07:46'),
(5540, 10, 'CASTROL10W-30 3L', 1046, '2022-01-26 07:07:46'),
(1850, 11, 'SUZUKI OIL FILTER C-932', 1046, '2022-01-26 07:07:46'),
(1850, 13, 'HONDA OIL FILTER', 1048, '2022-01-26 07:07:46'),
(1800, 14, 'HONDA OIL FILTER C-809', 1049, '2022-01-26 07:07:46'),
(6950, 15, 'MOBILE SUPER 10W- 30 4L', 1050, '2022-01-26 07:07:46'),
(1850, 16, 'HONDA OIL FILTER', 1050, '2022-01-26 07:07:46'),
(2400, 17, 'AUTO GEAR OIL CHANGE CHANGE', 1058, '2022-01-26 07:07:46'),
(600, 18, 'C.V JOINT R/R & GREASING', 1058, '2022-01-26 07:07:46'),
(1450, 19, 'LOWER ARM ASSY', 1058, '2022-01-26 07:07:46'),
(900, 20, 'REAR BRAKE DRUM R/R & CLEANING', 1058, '2022-01-26 07:07:46'),
(80, 21, 'CABILE TITTER', 1058, '2022-01-26 07:07:46'),
(2400, 22, 'AUTO GEAR OIL CHANGE ', 1059, '2022-01-26 07:07:46'),
(600, 23, 'C V JOINT R/R & GREASING', 1059, '2022-01-26 07:07:46'),
(1450, 24, 'LOWER ARM ASSY R/R', 1059, '2022-01-26 07:07:46'),
(900, 25, 'REAR BRAKE DRUM R/R & CLEANING', 1059, '2022-01-26 07:07:46'),
(80, 26, 'CABILE TITTER', 1059, '2022-01-26 07:07:46'),
(1000, 27, 'RADIATER SYSTEM & ENGINE SYSTEM CHEAKUP', 1061, '2022-01-26 07:07:46'),
(200, 28, 'C-110 ', 1062, '2022-01-26 07:07:46'),
(200, 29, 'C-110 OIL FILTER', 1063, '2022-01-26 07:07:46'),
(100, 30, 'WIRE TITTER', 1065, '2022-01-26 07:07:46'),
(3750, 31, 'FRONT BUMBER R/R AND WATER PUMB ASSY REPLACE', 1067, '2022-01-26 07:07:46'),
(1500, 32, 'ENGINE OIL & OIL FILTER, COOLENT FUEL, AIR FILTER REPLACE', 1067, '2022-01-26 07:07:46'),
(280, 33, 'USED OIL', 1068, '2022-01-26 07:07:46'),
(280, 34, 'USED OIL', 1069, '2022-01-26 07:07:46'),
(200, 35, 'AIR FILTER 2023', 1071, '2022-01-26 07:07:46'),
(3500, 36, 'FRONT R/H DOOR', 1073, '2022-01-26 07:07:46'),
(2500, 37, 'FRONT R/H SIDE REAR DOOR PANEL', 1073, '2022-01-26 07:07:46'),
(6500, 38, 'FRONT WIND SCREEN SCREEN PILLER PANEL', 1073, '2022-01-26 07:07:46'),
(3500, 39, 'FRONT R/H FOOD BOARD', 1073, '2022-01-26 07:07:46'),
(2100, 40, 'AIR FILTER', 1073, '2022-01-26 07:07:46'),
(6500, 41, 'FRONT R/H DOOR PAINTING CHARGES', 1073, '2022-01-26 07:07:46'),
(150, 42, 'AIR FRESHNER', 1074, '2022-01-26 07:07:46'),
(150, 43, 'AIR FRESHNER', 1075, '2022-01-26 07:07:46'),
(750, 44, 'AUTO ELACTIRICAL TINKERING JOB', 1078, '2022-01-26 07:07:46'),
(3500, 45, 'FRONT  BUMBER SHELL, FOG LIGHT, FOG LIGHT COVER R/R & AUTO ELACTRICAL', 1080, '2022-01-26 07:07:46'),
(2750, 46, 'INTERIOR CLEANING (HOOD)', 1083, '2022-01-26 07:07:46'),
(400, 47, 'TINKERING WORK REAR DOOR', 1083, '2022-01-26 07:07:46'),
(10500, 48, 'USED OIL 210L', 1084, '2022-01-26 07:07:46'),
(300, 49, 'AUTO ELACTRICAL HEAD LIGHT REPLACE', 1085, '2022-01-26 07:07:46'),
(150, 50, 'AIR FRESHNER ', 1086, '2022-01-26 07:07:46'),
(160, 51, 'CLIP NUT', 1086, '2022-01-26 07:07:46'),
(3500, 52, 'INTERIOR CLEANING & FRONT WIPER PANEL BOARD R/R', 1086, '2022-01-26 07:07:46'),
(250, 53, 'AUTO ELACTRICAL', 1088, '2022-01-26 07:07:46'),
(1500, 54, 'REAR LONG BOX DOORLQUAR TINKERING WORK', 1093, '2022-01-26 07:07:46'),
(7000, 55, 'FRONT BUFFER PAINTING ', 1094, '2022-01-26 07:07:46'),
(1250, 56, 'FRONT BUMBER R/R REMOVING & REFITTING', 1094, '2022-01-26 07:07:46'),
(200, 57, 'BUFFER CLIPS', 1094, '2022-01-26 07:07:46'),
(80, 58, 'WIRE TITTER', 1095, '2022-01-26 07:07:46'),
(100580, 59, 'REMOVEL & REFITTING,REPAIRING,PAINTING,RENEWALL PARTS & CLIPS', 1097, '2022-01-26 07:07:46'),
(150, 60, 'AIR FRESHNER', 1098, '2022-01-26 07:07:46'),
(4000, 61, 'HYBRID BATTERY R/R &INTERIOR CLEANNING &FRONT REAR NET FIXED', 1100, '2022-01-26 07:07:46'),
(150, 62, 'AIR FRESHNER STOP O', 1101, '2022-01-26 07:07:46'),
(7000, 63, 'REAR DOOR PAINTING ', 1102, '2022-01-26 07:07:46'),
(2500, 64, 'REAR DOOR TINKERING', 1102, '2022-01-26 07:07:46'),
(300, 65, 'AIR FERSHNER', 1103, '2022-01-26 07:07:46'),
(1450, 66, 'FRONT BREAK PAD REPLACE', 1103, '2022-01-26 07:07:46'),
(1650, 67, 'REAR BRAKE LINER SET REPLACE', 1103, '2022-01-26 07:07:46'),
(800, 68, 'BRAKE LIGHT WURTH', 1103, '2022-01-26 07:07:46'),
(750, 69, 'AUTO ELACTRICAL', 1103, '2022-01-26 07:07:46'),
(750, 70, 'BODY KITS FIXED', 1103, '2022-01-26 07:07:46'),
(750, 71, 'FRONT RACK END L/ H REPLACE', 1103, '2022-01-26 07:07:46'),
(86850, 72, 'MECHANIC & PAINTING REPAIRES', 1105, '2022-01-26 07:30:36'),
(2700, 74, 'ATF OIL CHANGE', 1108, '2022-01-26 10:25:22'),
(750, 75, 'CLUCH CABLE REPLACE', 1109, '2022-01-26 10:49:57');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `pay_id` int(11) NOT NULL,
  `emp_id` int(11) NOT NULL,
  `type` varchar(50) NOT NULL,
  `amount` int(11) NOT NULL,
  `payfor` int(5) NOT NULL,
  `paid_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `purchase`
--

CREATE TABLE `purchase` (
  `id` int(11) NOT NULL,
  `supplier` int(11) DEFAULT NULL,
  `rec_date` date DEFAULT NULL,
  `location` varchar(100) NOT NULL,
  `notes` varchar(100) DEFAULT NULL,
  `ref_no` varchar(100) DEFAULT NULL,
  `method` varchar(100) DEFAULT NULL,
  `check_date` date DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `purchase`
--

INSERT INTO `purchase` (`id`, `supplier`, `rec_date`, `location`, `notes`, `ref_no`, `method`, `check_date`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, '2021-12-27', 'Vavuniya', '', 'purchasefirst', 'cash', '0000-00-00', 0, '2021-12-27 06:59:54', '2021-12-27 10:06:21'),
(2, 2, '2021-12-15', 'Vavuniya', NULL, 'purchase2', 'cash', NULL, 0, '2021-12-27 10:07:03', '2021-12-27 10:07:03'),
(3, 1, '2021-11-24', 'Vavuniya', NULL, 'purchase3', 'cash', NULL, 0, '2021-12-27 10:09:16', '2021-12-27 10:09:16'),
(7, 1, '2021-12-28', '', 'KHK', 'JG', 'cash', '0000-00-00', 0, '2021-12-28 07:50:24', '2021-12-28 07:50:24'),
(8, 2, '2021-12-28', 'Jaffna', 'HGH', 'HGHGH', 'cash', '0000-00-00', 0, '2021-12-28 08:33:59', '2021-12-28 08:33:59'),
(9, 1, '2022-01-11', 'Vavuniya', 'old', '0001', 'cash', '0000-00-00', 0, '2022-01-11 05:50:44', '2022-01-11 05:50:44'),
(10, 1, '2022-01-11', '', 'old', 'INVC008895', 'cash', '0000-00-00', 0, '2022-01-11 06:14:43', '2022-01-11 06:14:43'),
(11, 1, '2022-01-23', '', '', 'HOD0006673', 'cash', '0000-00-00', 0, '2022-01-23 04:57:22', '2022-01-23 04:57:22'),
(12, 1, '2021-10-21', 'Vavuniya', '', 'OLD', 'cash', '0000-00-00', 0, '2022-01-23 06:09:23', '2022-01-23 06:09:23'),
(13, 1, '2022-01-23', '', 'OLD', '001', 'cash', '0000-00-00', 0, '2022-01-23 06:19:36', '2022-01-23 06:19:36'),
(14, 1, '2021-10-21', 'Vavuniya', '002', '1', 'cash', '0000-00-00', 0, '2022-01-23 09:18:50', '2022-01-23 09:18:50'),
(15, 1, '2021-10-24', 'Vavuniya', 'CASTORL', 'SN003435', 'cash', '0000-00-00', 0, '2022-01-23 10:34:35', '2022-01-23 10:34:35'),
(16, 1, '2021-10-22', 'Vavuniya', 'OIL', '135952', 'cash', '0000-00-00', 0, '2022-01-24 10:53:10', '2022-01-24 10:53:10'),
(17, 1, '2022-01-25', 'Vavuniya', 'OIL', '003', 'cash', '0000-00-00', 0, '2022-01-24 11:21:03', '2022-01-24 11:21:03'),
(18, 1, '2022-01-25', 'Vavuniya', 'Missing', '11', 'cash', '0000-00-00', 0, '2022-01-25 04:26:44', '2022-01-25 04:26:44'),
(19, 1, '2022-01-25', 'Vavuniya', 'missing', '112', 'cash', '0000-00-00', 0, '2022-01-25 04:42:47', '2022-01-25 04:42:47'),
(20, 1, '2022-01-25', 'Vavuniya', 'Missing', '113', 'cash', '0000-00-00', 0, '2022-01-25 07:01:16', '2022-01-25 07:01:16'),
(21, 1, '2022-01-25', 'Vavuniya', 'Missing', '114', 'cash', '0000-00-00', 0, '2022-01-25 07:26:07', '2022-01-25 07:26:07'),
(22, 1, '2022-01-25', 'Vavuniya', 'Missing', '115', 'cash', '0000-00-00', 0, '2022-01-25 07:54:30', '2022-01-25 07:54:30'),
(23, 1, '2022-01-25', 'Vavuniya', 'Missing', '116', 'cash', '0000-00-00', 0, '2022-01-25 08:22:42', '2022-01-25 08:22:42'),
(24, 1, '2022-01-25', 'Vavuniya', 'Missing', '117', 'cash', '0000-00-00', 0, '2022-01-25 08:25:26', '2022-01-25 08:25:26'),
(25, 1, '2022-01-25', 'Vavuniya', 'Missing', '118', 'cash', '0000-00-00', 0, '2022-01-25 08:56:09', '2022-01-25 08:56:09'),
(26, 1, '2022-01-25', 'Vavuniya', 'Missing', '119', 'cash', '0000-00-00', 0, '2022-01-25 09:33:55', '2022-01-25 09:33:55'),
(27, 1, '2022-01-25', 'Vavuniya', 'Missing', '120', 'cash', '0000-00-00', 0, '2022-01-25 09:58:05', '2022-01-25 09:58:05'),
(28, 1, '2022-01-25', 'Vavuniya', 'Missing', '121', 'cash', '0000-00-00', 0, '2022-01-25 10:04:34', '2022-01-25 10:04:34'),
(29, 1, '2022-01-25', 'Vavuniya', 'Missing', '122', 'cash', '0000-00-00', 0, '2022-01-25 10:07:05', '2022-01-25 10:07:05'),
(30, 1, '2022-01-25', 'Vavuniya', 'Missing', '123', 'cash', '0000-00-00', 0, '2022-01-25 10:12:49', '2022-01-25 10:12:49'),
(31, 1, '2022-01-25', 'Vavuniya', 'Missing', '125', 'cash', '0000-00-00', 0, '2022-01-25 10:14:33', '2022-01-25 10:14:33'),
(32, 1, '2022-01-25', 'Vavuniya', 'Missing', '126', 'cash', '0000-00-00', 0, '2022-01-25 10:33:49', '2022-01-25 10:33:49'),
(33, 1, '2022-01-25', 'Vavuniya', 'Missing', '127', 'cash', '0000-00-00', 0, '2022-01-25 10:44:35', '2022-01-25 10:44:35'),
(34, 1, '2022-01-25', 'Vavuniya', 'Missing', '128', 'cash', '0000-00-00', 0, '2022-01-25 11:04:20', '2022-01-25 11:04:20'),
(35, 1, '2022-01-25', 'Vavuniya', 'Missing', '129', 'cash', '0000-00-00', 0, '2022-01-25 11:29:04', '2022-01-25 11:29:04'),
(36, 1, '2022-01-26', 'Vavuniya', 'Missing', '130', 'cash', '0000-00-00', 0, '2022-01-26 03:10:17', '2022-01-26 03:10:17'),
(37, 1, '2022-01-26', 'Vavuniya', 'Missing', '131', 'cash', '0000-00-00', 0, '2022-01-26 03:28:15', '2022-01-26 03:28:15'),
(38, 1, '2022-01-26', 'Vavuniya', 'Missing', '132', 'cash', '0000-00-00', 0, '2022-01-26 03:31:42', '2022-01-26 03:31:42'),
(39, 1, '2022-01-26', 'Vavuniya', 'Missing', '133', 'cash', '0000-00-00', 0, '2022-01-26 03:35:51', '2022-01-26 03:35:51'),
(40, 1, '2022-01-26', 'Vavuniya', 'Missing', '134', 'cash', '0000-00-00', 0, '2022-01-26 04:20:58', '2022-01-26 04:20:58'),
(41, 1, '2022-01-26', 'Vavuniya', 'Missing', '135', 'cash', '0000-00-00', 0, '2022-01-26 04:26:07', '2022-01-26 04:26:07'),
(42, 1, '2022-01-26', 'Vavuniya', 'Missing', '136', 'cash', '0000-00-00', 0, '2022-01-26 04:27:04', '2022-01-26 04:27:04'),
(43, 1, '2022-01-26', 'Vavuniya', 'Missing', '137', 'cash', '0000-00-00', 0, '2022-01-26 04:29:49', '2022-01-26 04:29:49'),
(44, 1, '2022-01-26', 'Vavuniya', 'Missing', '138', 'cash', '0000-00-00', 0, '2022-01-26 05:26:36', '2022-01-26 05:26:36'),
(45, 1, '2022-01-26', 'Vavuniya', 'Missing', '139', 'cash', '0000-00-00', 0, '2022-01-26 05:50:04', '2022-01-26 05:50:04'),
(46, 1, '2022-01-26', 'Vavuniya', 'Missing', '140', 'cash', '0000-00-00', 0, '2022-01-26 06:23:31', '2022-01-26 06:23:31'),
(47, 1, '2022-01-26', 'Vavuniya', 'Missing', '141', 'cash', '0000-00-00', 0, '2022-01-26 06:27:52', '2022-01-26 06:27:52'),
(48, 1, '2022-01-26', 'Vavuniya', 'Missing', '142', 'cash', '0000-00-00', 0, '2022-01-26 07:01:21', '2022-01-26 07:01:21'),
(49, 1, '2022-01-26', 'Vavuniya', 'Missing', '143', 'cash', '0000-00-00', 0, '2022-01-26 07:41:30', '2022-01-26 07:41:30'),
(50, 1, '2022-01-26', 'Vavuniya', 'Missing', '144', 'cash', '0000-00-00', 0, '2022-01-26 07:48:29', '2022-01-26 07:48:29'),
(51, 1, '2022-01-26', '', 'Missing', '145', 'cash', '0000-00-00', 0, '2022-01-26 07:50:38', '2022-01-26 07:50:38'),
(52, 1, '2022-01-26', 'Vavuniya', 'Missing', '146', 'cash', '0000-00-00', 0, '2022-01-26 09:43:28', '2022-01-26 09:43:28'),
(53, 1, '2022-01-26', 'Vavuniya', 'Missing', '147', 'cash', '0000-00-00', 0, '2022-01-26 09:46:29', '2022-01-26 09:46:29'),
(54, 1, '2022-01-26', 'Vavuniya', 'Missing', '148', 'cash', '0000-00-00', 0, '2022-01-26 09:49:41', '2022-01-26 09:49:41'),
(55, 1, '2022-01-26', 'Vavuniya', 'Missing', '149', 'cash', '0000-00-00', 0, '2022-01-26 09:52:39', '2022-01-26 09:52:39'),
(56, 1, '2022-01-26', 'Vavuniya', 'Missing', '150', 'cash', '0000-00-00', 0, '2022-01-26 09:59:44', '2022-01-26 09:59:44'),
(57, 1, '2022-01-26', 'Vavuniya', 'Missing', '151', 'cash', '0000-00-00', 0, '2022-01-26 10:37:20', '2022-01-26 10:37:20'),
(58, 1, '2022-01-26', 'Jaffna', 'Missing', '152', 'cash', '0000-00-00', 0, '2022-01-26 10:38:29', '2022-01-26 10:38:29');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_items`
--

CREATE TABLE `purchase_items` (
  `id` int(11) NOT NULL,
  `purchase_id` int(11) NOT NULL,
  `item_id` varchar(100) NOT NULL,
  `purchase_price` int(11) NOT NULL,
  `selling_price` int(11) NOT NULL,
  `quantity` float NOT NULL,
  `ex_date` date DEFAULT NULL,
  `paid` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `purchase_items`
--

INSERT INTO `purchase_items` (`id`, `purchase_id`, `item_id`, `purchase_price`, `selling_price`, `quantity`, `ex_date`, `paid`, `status`, `created_at`) VALUES
(1, 1, '07207621', 68, 120, -3, NULL, 0, 0, NULL),
(2, 1, '07207101', 669, 1150, 10, NULL, 0, 0, NULL),
(3, 1, '07207383', 166, 290, 10, NULL, 0, 0, NULL),
(4, 1, '07207121', 317, 550, 10, NULL, 0, 0, NULL),
(5, 1, '0720710110', 748, 1300, 8, NULL, 0, 0, NULL),
(6, 1, '072076311', 98, 170, 9, NULL, 0, 0, NULL),
(7, 1, '0720710185', 756, 1300, 10, NULL, 0, 0, NULL),
(8, 1, '07207141', 695, 1200, 10, NULL, 0, 0, NULL),
(9, 1, '07207111', 359, 620, 9, NULL, 0, 0, NULL),
(10, 1, '07207632', 442, 800, 10, NULL, 0, 0, NULL),
(11, 1, '07207103', 714, 1250, 9, NULL, 0, 0, NULL),
(12, 1, '07207711', 94, 160, 10, NULL, 0, 0, NULL),
(13, 1, '07207631', 412, 700, 10, NULL, 0, 0, NULL),
(14, 1, '07207611', 64, 110, 6, NULL, 0, 0, NULL),
(15, 1, '0720718011', 1606, 2760, 10, NULL, 0, 0, NULL),
(16, 1, '07207401', 120, 210, 10, NULL, 0, 0, NULL),
(17, 1, '07207501', 94, 165, 10, NULL, 0, 0, NULL),
(18, 1, '07207104', 721, 1250, 10, NULL, 0, 0, NULL),
(19, 1, '0720718008', 1126, 1950, 9, NULL, 0, 0, NULL),
(20, 1, '0720718009', 1115, 1920, 8, NULL, 0, 0, NULL),
(21, 1, '0720118016', 2131, 3650, 10, NULL, 0, 0, NULL),
(22, 1, '0720118027', 1005, 1750, 10, NULL, 0, 0, NULL),
(23, 1, '0720118028', 1005, 1750, 10, NULL, 0, 0, NULL),
(24, 1, '07207102', 774, 1350, 10, NULL, 0, 0, NULL),
(25, 1, '07207342', 90, 155, 10, NULL, 0, 0, NULL),
(26, 1, '07207622', 68, 116, 10, NULL, 0, 0, NULL),
(27, 1, '07207412', 124, 220, 10, NULL, 0, 0, NULL),
(28, 1, '07207142', 612, 1050, 10, NULL, 0, 0, NULL),
(29, 1, '07207322', 113, 200, 10, NULL, 0, 0, NULL),
(30, 1, '072073223', 200, 350, 10, NULL, 0, 0, NULL),
(31, 1, '07207502', 226, 400, 10, NULL, 0, 0, NULL),
(32, 1, '07207112', 226, 650, 10, NULL, 0, 0, NULL),
(33, 1, '07207122', 347, 600, 10, NULL, 0, 0, NULL),
(34, 1, '072073210', 442, 750, 10, NULL, 0, 0, NULL),
(35, 1, '07207402', 124, 220, 10, NULL, 0, 0, NULL),
(36, 1, '07207612', 68, 116, 10, NULL, 0, 0, NULL),
(37, 2, '05398 12', 106, 145, 50, NULL, 0, 0, NULL),
(38, 2, '053918 16', 116, 160, 50, NULL, 0, 0, NULL),
(39, 2, '053910 16', 116, 160, 50, NULL, 0, 0, NULL),
(40, 2, '053911222', 136, 180, 50, NULL, 0, 0, NULL),
(41, 2, '053911627', 136, 180, 50, NULL, 0, 0, NULL),
(42, 2, '053912032', 140, 190, 50, NULL, 0, 0, NULL),
(43, 2, '053912540', 140, 190, 50, NULL, 0, 0, NULL),
(44, 2, '053913045', 150, 200, 50, NULL, 0, 0, NULL),
(45, 2, '053913250', 150, 200, 50, NULL, 0, 0, NULL),
(46, 2, '053914060', 160, 215, 50, NULL, 0, 0, NULL),
(47, 2, '053915070', 160, 215, 50, NULL, 0, 0, NULL),
(48, 2, '053916080', 184, 250, 50, NULL, 0, 0, NULL),
(49, 2, '053917090', 204, 270, 50, NULL, 0, 0, NULL),
(50, 2, '0539180100', 218, 290, 50, NULL, 0, 0, NULL),
(51, 2, '0539110120', 218, 290, 50, NULL, 0, 0, NULL),
(52, 2, '058411 320', 129, 129, 100, NULL, 0, 0, NULL),
(53, 2, '058411 400', 129, 129, 100, NULL, 0, 0, NULL),
(54, 2, '058411 600', 129, 129, 100, NULL, 0, 0, NULL),
(55, 2, '058411 800', 129, 129, 100, NULL, 0, 0, NULL),
(56, 2, '0584111 000', 129, 129, 100, NULL, 0, 0, NULL),
(57, 2, '0584111500', 129, 129, 100, NULL, 0, 0, NULL),
(58, 2, '0584111200', 129, 129, 100, NULL, 0, 0, NULL),
(59, 2, '0577333010', 86, 86, 100, NULL, 0, 0, NULL),
(60, 2, '0848270280', 708, 1050, 10, NULL, 0, 0, NULL),
(61, 2, '0848270300', 708, 1050, 10, NULL, 0, 0, NULL),
(62, 2, '0848270350', 782, 1150, 9, NULL, 0, 0, NULL),
(63, 2, '0848270380', 782, 1150, 10, NULL, 0, 0, NULL),
(64, 2, '0848270400', 794, 1200, 9, NULL, 0, 0, NULL),
(65, 2, '0848270425', 822, 1200, 9, NULL, 0, 0, NULL),
(66, 2, '0848270450', 82215, 1200, 9, NULL, 0, 0, NULL),
(67, 2, '0848270475', 907, 1300, 10, NULL, 0, 0, NULL),
(68, 2, '0848270500', 907, 1300, 10, NULL, 0, 0, NULL),
(69, 2, '0848270525', 992, 1400, 10, NULL, 0, 0, NULL),
(70, 2, '0848270550', 992, 1400, 10, NULL, 0, 0, NULL),
(71, 2, '0848270600', 1106, 1600, 9, NULL, 0, 0, NULL),
(72, 2, '0848270650', 1191, 1750, 10, NULL, 0, 0, NULL),
(73, 2, '0848270700', 1361, 2000, 10, NULL, 0, 0, NULL),
(74, 3, '950000296', 2362, 2362, 10, NULL, 0, 0, NULL),
(75, 3, '0893556112', 2465, 2465, 10, NULL, 0, 0, NULL),
(76, 3, '9500000302', 1242, 1700, 10, NULL, 0, 0, NULL),
(77, 3, '9500000306', 1242, 1700, 9, NULL, 0, 0, NULL),
(78, 3, '9500000304', 1323, 1750, 10, NULL, 0, 0, NULL),
(79, 3, '0893556110', 1501, 1700, 9, NULL, 0, 0, NULL),
(80, 3, '0890324385', 590, 590, 10, NULL, 0, 0, NULL),
(81, 3, '0893100170', 972, 972, 10, NULL, 0, 0, NULL),
(82, 3, '089356091', 2268, 2268, 10, NULL, 0, 0, NULL),
(83, 3, '5861011001', 3672, 3672, 10, NULL, 0, 0, NULL),
(84, 3, '0890108700', 891, 891, 10, NULL, 0, 0, NULL),
(85, 3, '0890200004', 907, 907, 10, NULL, 0, 0, NULL),
(86, 3, '0893106', 1296, 1296, 10, NULL, 0, 0, NULL),
(87, 3, '0893221', 1728, 1728, 10, NULL, 0, 0, NULL),
(88, 3, '089310011', 864, 864, 10, NULL, 0, 0, NULL),
(89, 3, '08448065525', 1800, 1800, 10, NULL, 0, 0, NULL),
(90, 3, '089002610', 2138, 2138, 10, NULL, 0, 0, NULL),
(91, 3, '0890024021', 2819, 2819, 10, NULL, 0, 0, NULL),
(92, 3, '0892075200', 3011, 3011, 10, NULL, 0, 0, NULL),
(93, 3, '08901001', 1944, 1944, 10, NULL, 0, 0, NULL),
(94, 3, '08901002', 1944, 1944, 10, NULL, 0, 0, NULL),
(95, 3, '08901003', 1944, 1944, 10, NULL, 0, 0, NULL),
(96, 3, '0892077150', 2052, 2052, 10, NULL, 0, 0, NULL),
(97, 3, '0892333', 190, 295, 10, NULL, 0, 0, NULL),
(98, 3, '0890230012', 961, 961, 10, NULL, 0, 0, NULL),
(99, 3, '0893033', 1544, 1544, 10, NULL, 0, 0, NULL),
(100, 3, '0890104', 1296, 1296, 10, NULL, 0, 0, NULL),
(101, 3, '5861001301', 1901, 1901, 10, NULL, 0, 0, NULL),
(102, 3, '5861011300', 1436, 1436, 10, NULL, 0, 0, NULL),
(103, 3, '58617000002', 7290, 7290, 10, NULL, 0, 0, NULL),
(104, 3, '5861103300', 1469, 1469, 10, NULL, 0, 0, NULL),
(105, 3, '9500000307', 2160, 2160, 10, NULL, 0, 0, NULL),
(106, 3, '001-135', 1500, 2100, 2, NULL, 0, 0, NULL),
(107, 3, '001-137', 1500, 2100, 2, NULL, 0, 0, NULL),
(108, 3, '001-139', 1250, 1800, 2, NULL, 0, 0, NULL),
(109, 3, '001-142', 700, 1200, 2, NULL, 0, 0, NULL),
(110, 3, '001-152', 2450, 3450, 1, NULL, 0, 0, NULL),
(111, 3, '001-154', 695, 1050, 6, NULL, 0, 0, NULL),
(112, 3, '001-155', 695, 2250, 6, NULL, 0, 0, NULL),
(113, 3, '001-241', 1650, 2150, 2, NULL, 0, 0, NULL),
(114, 3, '001-242', 1500, 2750, 2, NULL, 0, 0, NULL),
(115, 3, '001-307', 1250, 1800, 2, NULL, 0, 0, NULL),
(116, 3, '001-320', 1500, 2100, 2, NULL, 0, 0, NULL),
(117, 3, '001-337', 1850, 2500, 2, NULL, 0, 0, NULL),
(118, 3, '001-375', 650, 950, 2, NULL, 0, 0, NULL),
(119, 3, '001-380', 1750, 2375, 2, NULL, 0, 0, NULL),
(120, 3, '001-387', 1950, 2750, 2, NULL, 0, 0, NULL),
(121, 3, '001-419', 650, 950, 2, NULL, 0, 0, NULL),
(122, 3, '001-433', 2950, 3950, 1, NULL, 0, 0, NULL),
(123, 3, '001-509', 2250, 3050, 2, NULL, 0, 0, NULL),
(124, 3, '001-554', 1200, 1750, 2, NULL, 0, 0, NULL),
(125, 3, '001-621', 1500, 2100, 2, NULL, 0, 0, NULL),
(126, 3, '002-041', 1750, 2450, 2, NULL, 0, 0, NULL),
(127, 3, '002-133', 1950, 2650, 1, NULL, 0, 0, NULL),
(128, 3, '003-389', 1750, 2600, 0, NULL, 0, 0, NULL),
(129, 3, '004-003', 2250, 3150, 1, NULL, 0, 0, NULL),
(130, 3, '001-028', 950, 1800, 2, NULL, 0, 0, NULL),
(131, 3, '001-093', 600, 850, 2, NULL, 0, 0, NULL),
(132, 3, '001-100', 2250, 3200, 1, NULL, 0, 0, NULL),
(133, 3, '001-171', 850, 1450, 2, NULL, 0, 0, NULL),
(134, 3, '001-173', 750, 1250, 2, NULL, 0, 0, NULL),
(135, 3, '001-182', 650, 1300, 1, NULL, 0, 0, NULL),
(136, 3, '001-261', 750, 1500, 1, NULL, 0, 0, NULL),
(137, 3, '001-314', 450, 800, 2, NULL, 0, 0, NULL),
(138, 3, '001-327', 450, 800, 2, NULL, 0, 0, NULL),
(139, 3, '001-439', 2650, 3550, 1, NULL, 0, 0, NULL),
(140, 3, '001-459', 1650, 2250, 1, NULL, 0, 0, NULL),
(141, 3, '001-467', 2850, 3700, 1, NULL, 0, 0, NULL),
(142, 3, '001-533', 1450, 1900, 2, NULL, 0, 0, NULL),
(143, 3, '001-579', 1400, 2250, 2, NULL, 0, 0, NULL),
(144, 3, '001-622', 2950, 3850, 1, NULL, 0, 0, NULL),
(145, 3, '001-045', 950, 1350, 2, NULL, 0, 0, NULL),
(146, 3, '001-086', 800, 1250, 2, NULL, 0, 0, NULL),
(147, 3, '001-087', 750, 1150, 2, NULL, 0, 0, NULL),
(148, 3, '001-092', 650, 950, 2, NULL, 0, 0, NULL),
(149, 3, '001-158', 550, 850, 6, NULL, 0, 0, NULL),
(150, 3, '001-164', 3950, 5135, 1, NULL, 0, 0, NULL),
(151, 3, '001-165', 1950, 2750, 1, NULL, 0, 0, NULL),
(152, 3, '001-245', 750, 1100, 2, NULL, 0, 0, NULL),
(153, 3, '001-260', 750, 1100, 1, NULL, 0, 0, NULL),
(154, 3, '001-280', 650, 950, 2, NULL, 0, 0, NULL),
(155, 3, '001-344', 850, 950, 2, NULL, 0, 0, NULL),
(156, 3, '001-357', 600, 800, 2, NULL, 0, 0, NULL),
(157, 3, '001-416', 650, 950, 2, NULL, 0, 0, NULL),
(158, 3, '001-440', 450, 650, 2, NULL, 0, 0, NULL),
(159, 3, '001-443', 2250, 2950, 1, NULL, 0, 0, NULL),
(160, 3, '001-445', 2450, 3280, 2, NULL, 0, 0, NULL),
(161, 3, '001-525', 700, 950, 2, NULL, 0, 0, NULL),
(162, 3, '001-532', 950, 1300, 2, NULL, 0, 0, NULL),
(163, 3, '001-558', 1650, 2450, 2, NULL, 0, 0, NULL),
(164, 3, '001-571', 950, 1350, 2, NULL, 0, 0, NULL),
(165, 3, '001-572', 950, 1350, 2, NULL, 0, 0, NULL),
(166, 3, '001-583', 950, 1350, 2, NULL, 0, 0, NULL),
(167, 3, '001-589', 1450, 1900, 2, NULL, 0, 0, NULL),
(168, 3, '001-590', 450, 650, 6, NULL, 0, 0, NULL),
(169, 3, '001-128', 675, 900, 2, NULL, 0, 0, NULL),
(170, 3, '001-188', 850, 1100, 2, NULL, 0, 0, NULL),
(171, 3, '001-190', 775, 1050, 1, NULL, 0, 0, NULL),
(172, 3, '001-193', 775, 1050, 1, NULL, 0, 0, NULL),
(173, 3, '001-201', 230, 400, 2, NULL, 0, 0, NULL),
(174, 3, '001-207', 600, 750, 2, NULL, 0, 0, NULL),
(175, 3, '001-212', 500, 750, 2, NULL, 0, 0, NULL),
(176, 3, '001-221', 650, 800, 2, NULL, 0, 0, NULL),
(177, 3, '001-224', 450, 850, 2, NULL, 0, 0, NULL),
(178, 3, '001-262', 500, 750, 2, NULL, 0, 0, NULL),
(179, 3, '001-267', 1250, 1650, 2, NULL, 0, 0, NULL),
(180, 3, '001-279', 400, 550, 2, NULL, 0, 0, NULL),
(181, 3, '001-336', 2950, 3850, 2, NULL, 0, 0, NULL),
(182, 3, '001-340', 400, 800, 3, NULL, 0, 0, NULL),
(183, 3, '001-367', 700, 1100, 2, NULL, 0, 0, NULL),
(184, 3, '001-377', 550, 900, 2, NULL, 0, 0, NULL),
(185, 3, '001-422', 350, 650, 2, NULL, 0, 0, NULL),
(186, 3, '001-429', 850, 1150, 3, NULL, 0, 0, NULL),
(187, 3, '001-478', 2750, 3570, 2, NULL, 0, 0, NULL),
(188, 3, '001-500', 750, 1200, 2, NULL, 0, 0, NULL),
(189, 3, '001-508', 900, 1350, 2, NULL, 0, 0, NULL),
(190, 3, '001-512', 650, 950, 2, NULL, 0, 0, NULL),
(191, 3, '002-029', 600, 900, 2, NULL, 0, 0, NULL),
(192, 3, '002-047', 850, 1350, 2, NULL, 0, 0, NULL),
(193, 3, '002-053', 750, 1300, 2, NULL, 0, 0, NULL),
(194, 3, '002-090', 950, 1450, 2, NULL, 0, 0, NULL),
(195, 3, '002-142', 950, 1450, 2, NULL, 0, 0, NULL),
(196, 3, '002-152', 750, 1300, 2, NULL, 0, 0, NULL),
(197, 3, '002-154', 975, 1500, 2, NULL, 0, 0, NULL),
(198, 3, '002-182', 2750, 3500, 2, NULL, 0, 0, NULL),
(199, 3, '002-230', 1750, 2350, 2, NULL, 0, 0, NULL),
(200, 3, '002-322', 1950, 2650, 2, NULL, 0, 0, NULL),
(201, 3, '002-329', 850, 1450, 1, NULL, 0, 0, NULL),
(202, 3, '002-062', 950, 1340, 2, NULL, 0, 0, NULL),
(203, 3, '002-064', 1750, 2370, 1, NULL, 0, 0, NULL),
(204, 3, '002-066', 1750, 2370, 1, NULL, 0, 0, NULL),
(205, 3, '002-067', 850, 1100, 2, NULL, 0, 0, NULL),
(206, 3, '002-068', 850, 1100, 2, NULL, 0, 0, NULL),
(207, 3, '002-069', 850, 1100, 2, NULL, 0, 0, NULL),
(208, 3, '002-080', 2250, 2950, 2, NULL, 0, 0, NULL),
(209, 3, '002-119', 850, 1100, 2, NULL, 0, 0, NULL),
(210, 3, '002-140', 850, 1100, 2, NULL, 0, 0, NULL),
(211, 3, '002-166', 600, 900, 2, NULL, 0, 0, NULL),
(212, 3, '002-188', 1250, 1650, 2, NULL, 0, 0, NULL),
(213, 3, '002-203', 500, 950, 4, NULL, 0, 0, NULL),
(214, 3, '002-206', 2250, 2950, 2, NULL, 0, 0, NULL),
(215, 3, '002-211', 950, 1350, 2, NULL, 0, 0, NULL),
(216, 3, '002-216', 950, 1350, 2, NULL, 0, 0, NULL),
(217, 3, '002-229', 850, 1100, 2, NULL, 0, 0, NULL),
(218, 3, '002-344', 2450, 3200, 1, NULL, 0, 0, NULL),
(219, 3, '002-349', 2950, 3750, 2, NULL, 0, 0, NULL),
(220, 3, '003-151', 1450, 1850, 2, NULL, 0, 0, NULL),
(221, 3, '003-274', 950, 1350, 2, NULL, 0, 0, NULL),
(222, 3, '003-286', 2250, 2950, 2, NULL, 0, 0, NULL),
(223, 3, '003-295', 2250, 2950, 2, NULL, 0, 0, NULL),
(224, 3, '003-420', 2450, 3200, 2, NULL, 0, 0, NULL),
(225, 3, '003-315', 3500, 4500, 1, NULL, 0, 0, NULL),
(226, 3, '003-517', 1950, 2550, 2, NULL, 0, 0, NULL),
(227, 3, '500574ZVL', 20400, 20400, 5, NULL, 0, 0, NULL),
(228, 3, '500574NAE', 1925, 2175, 2, NULL, 0, 0, NULL),
(229, 3, '500292LPLI', 6690, 8005, 4, NULL, 0, 0, NULL),
(230, 3, '500007393', 5545, 6375, 3, NULL, 0, 0, NULL),
(231, 3, '500009393', 5545, 7070, 4, NULL, 0, 0, NULL),
(232, 3, '510112397', 8540, 9695, 2, NULL, 0, 0, NULL),
(233, 3, '510112NAE', 1825, 2045, 4, NULL, 0, 0, NULL),
(234, 3, '510662PBE', 725, 950, 4, NULL, 0, 0, NULL),
(235, 3, '510662UIE', 410, 545, 4, NULL, 0, 0, NULL),
(236, 3, '510134UIE', 585, 700, 4, NULL, 0, 0, NULL),
(237, 3, '510134PBE', 965, 1140, 4, NULL, 0, 0, NULL),
(238, 3, '510134NAE', 1670, 2015, 2, NULL, 0, 0, NULL),
(239, 3, '510853VQE', 455, 530, 2, NULL, 0, 0, NULL),
(240, 3, '510853VNE', 735, 825, 2, NULL, 0, 0, NULL),
(241, 3, 'DISTILLED WATER', 25, 50, 25, NULL, 0, 0, NULL),
(242, 3, 'DISTILLED WATER', 50, 100, 25, NULL, 0, 0, NULL),
(243, 3, 'BATTERY ACID', 90, 150, 12, NULL, 0, 0, NULL),
(244, 3, 'BATTERY ACID', 150, 250, 12, NULL, 0, 0, NULL),
(245, 3, 'RADIATOR COOLANT ', 270, 380, 9, NULL, 0, 0, NULL),
(246, 3, 'RADIATOR COOLANT ', 680, 980, 12, NULL, 0, 0, NULL),
(247, 3, 'RCR', 280, 430, 12, NULL, 0, 0, NULL),
(248, 3, 'RCR', 785, 1150, 6, NULL, 0, 0, NULL),
(249, 3, 'SUPER HIGH POWER ', 1100, 1100, 4, NULL, 0, 0, NULL),
(250, 3, 'CAR WASH (N)', 130, 200, 26, NULL, 0, 0, NULL),
(251, 3, 'CAR WASH ', 1875, 1875, 5, NULL, 0, 0, NULL),
(252, 3, 'GLASS CLEANER ', 150, 200, 23, NULL, 0, 0, NULL),
(253, 3, 'GLASS CLEANER ', 550, 800, 12, NULL, 0, 0, NULL),
(254, 3, 'SURFACE SHINE', 185, 225, 24, NULL, 0, 0, NULL),
(255, 3, 'SURFACE SHINE', 260, 3000, 5, NULL, 0, 0, NULL),
(256, 3, 'FG0068N2', 680, 780, 1, NULL, 0, 0, NULL),
(257, 3, 'FGO251N2', 194, 200, 6, NULL, 0, 0, NULL),
(258, 3, 'FGO148N2', 194, 200, 7, NULL, 0, 0, NULL),
(259, 3, 'FGO257N2', 194, 200, 14, NULL, 0, 0, NULL),
(260, 3, 'FGO252N2', 194, 200, 7, NULL, 0, 0, NULL),
(261, 3, 'RS 001', 121000, 121000, 2, NULL, 0, 0, NULL),
(262, 3, 'RS002', 145000, 145000, 1, NULL, 0, 0, NULL),
(263, 3, 'RS003', 4160, 4160, 16, NULL, 0, 0, NULL),
(264, 3, 'RS004', 4085, 4085, 8, NULL, 0, 0, NULL),
(265, 3, 'RS005', 3700, 3700, 4, NULL, 0, 0, NULL),
(266, 3, 'RS006', 2490, 2490, 8, NULL, 0, 0, NULL),
(267, 3, 'RS007', 830, 830, 40, NULL, 0, 0, NULL),
(268, 3, 'RS008', 810, 810, 20, NULL, 0, 0, NULL),
(269, 7, '0720118016', 100, 120, 8, '0000-00-00', NULL, 0, '2021-12-28 07:51:17'),
(270, 2, '0-504', 650, 1200, 5, NULL, 0, 0, NULL),
(271, 2, 'C-303', 400, 650, 5, NULL, 0, 0, NULL),
(272, 2, 'C-805', 650, 900, 5, NULL, 0, 0, NULL),
(273, 2, 'C-302', 650, 900, 5, NULL, 0, 0, NULL),
(274, 2, 'C-529', 750, 975, 5, NULL, 0, 0, NULL),
(275, 2, 'FC-184', 1750, 1450, 5, NULL, 0, 0, NULL),
(276, 2, 'FC -226', 1750, 1450, 5, NULL, 0, 0, NULL),
(277, 2, 'FC-321', 1750, 1500, 5, NULL, 0, 0, NULL),
(278, 2, 'AC-105', 1000, 1800, 5, NULL, 0, 0, NULL),
(279, 2, 'AC-111', 1250, 2200, 5, NULL, 0, 0, NULL),
(280, 2, 'AC-200', 1250, 2200, 5, NULL, 0, 0, NULL),
(281, 2, 'AC-201', 1000, 1800, 5, NULL, 0, 0, NULL),
(282, 2, 'AC-210', 1000, 1800, 5, NULL, 0, 0, NULL),
(283, 2, 'AC-215', 1000, 1600, 5, NULL, 0, 0, NULL),
(284, 2, 'AC-321', 1250, 2400, 5, NULL, 0, 0, NULL),
(285, 2, 'AC-107', 1000, 1800, 5, NULL, 0, 0, NULL),
(286, 2, 'AC-310', 1000, 1800, 5, NULL, 0, 0, NULL),
(287, 2, 'AC-805', 1000, 1800, 5, NULL, 0, 0, NULL),
(288, 2, 'AC-806', 1000, 1800, 5, NULL, 0, 0, NULL),
(289, 2, 'AC-808', 1000, 1800, 5, NULL, 0, 0, NULL),
(290, 2, 'AC-934', 1000, 1800, 5, NULL, 0, 0, NULL),
(291, 2, 'AC-933', 1000, 2250, 5, NULL, 0, 0, NULL),
(292, 2, 'AC- C6900', 1000, 1900, 5, NULL, 0, 0, NULL),
(293, 2, 'AC-2E910', 1000, 2200, 5, NULL, 0, 0, NULL),
(294, 2, 'AC-07010', 1000, 2200, 5, NULL, 0, 0, NULL),
(295, 2, 'AC-53MSO (W/O LOC', 1250, 2250, 5, NULL, 0, 0, NULL),
(296, 2, 'O-116', 1050, 1800, 5, NULL, 0, 0, NULL),
(297, 2, 'O-117', 720, 1400, 5, NULL, 0, 0, NULL),
(298, 2, '87139-0N010', 1050, 1800, 0, NULL, 0, 0, NULL),
(299, 2, '88568-52010', 1050, 1800, 5, NULL, 0, 0, NULL),
(300, 2, '90915-YZZD2', 690, 1100, 5, NULL, 0, 0, NULL),
(301, 2, '90915-YZZE1', 690, 1100, 2, NULL, 0, 0, NULL),
(302, 2, '13780-M-53M00', 1250, 2650, 4, NULL, 0, 0, NULL),
(303, 2, '13870 M 53M10', 1250, 2650, 5, NULL, 0, 0, NULL),
(304, 2, '15208-43GOA', 1050, 1650, 5, NULL, 0, 0, NULL),
(305, 2, '15208-65F00', 920, 1400, 5, NULL, 0, 0, NULL),
(306, 2, '15208-BN30A', 920, 1400, 5, NULL, 0, 0, NULL),
(307, 2, '15400-RTA-003', 450, 800, 4, NULL, 0, 0, NULL),
(308, 2, '15600-41010', 190, 1100, 5, NULL, 0, 0, NULL),
(309, 2, '892333', 189, 250, 5, NULL, 0, 0, NULL),
(310, 2, '16510-81404', 710, 1100, 1, NULL, 0, 0, NULL),
(311, 2, '16510-84MOO', 710, 1100, 5, NULL, 0, 0, NULL),
(312, 2, '17220-RBJ-000', 1250, 2500, 5, NULL, 0, 0, NULL),
(313, 2, '17801-0L040', 1250, 1650, 5, NULL, 0, 0, NULL),
(314, 2, '17801-21030', 1250, 2450, 5, NULL, 0, 0, NULL),
(315, 2, '17801-21050', 1250, 2450, 4, NULL, 0, 0, NULL),
(316, 2, '17801-22020', 1250, 2250, 5, NULL, 0, 0, NULL),
(317, 2, '17801-54100', 1650, 2450, 5, NULL, 0, 0, NULL),
(318, 2, '17801-67040', 1250, 1850, 5, NULL, 0, 0, NULL),
(319, 2, '23303-64110', 720, 1400, 5, NULL, 0, 0, NULL),
(320, 2, '23390- OL041', 1150, 1800, 5, NULL, 0, 0, NULL),
(321, 2, '23390-51070', 1450, 2750, 5, NULL, 0, 0, NULL),
(322, 2, '23390-OL070', 1650, 2650, 5, NULL, 0, 0, NULL),
(323, 9, '9586172M00', 1100, 1800, 1, '0000-00-00', NULL, 1, '2022-01-11 05:54:40'),
(324, 18, 'SN003435', 4150, 5540, 14, '0000-00-00', NULL, 1, '2022-01-25 04:28:55'),
(325, 18, '135952', 5200, 6950, 15, '0000-00-00', NULL, 1, '2022-01-25 04:30:11'),
(326, 19, '15400-RTA-003 Genuine', 710, 1800, 3, '0000-00-00', NULL, 1, '2022-01-25 04:43:19'),
(327, 20, '0893556107', 2361, 3750, 4, '0000-00-00', NULL, 1, '2022-01-25 07:07:58'),
(328, 21, '500574ZVL', 7550, 8695, 4, '2022-01-26', NULL, 1, '2022-01-25 07:27:34'),
(329, 22, '08886-81016 ', 1840, 2400, -4, '2022-01-26', NULL, 1, '2022-01-25 07:55:42'),
(330, 24, '08886-81016 TYPE  T IV', 7200, 9300, 3, '2022-01-26', NULL, 1, '2022-01-25 08:29:20'),
(331, 25, '08880-84106 4L', 6591, 8450, 3, '2022-01-26', NULL, 0, '2022-01-25 08:57:48'),
(332, 26, 'KW0003243', 785, 1150, 5, '2022-01-25', NULL, 1, '2022-01-25 09:34:38'),
(333, 27, '16510-61J00-000', 710, 1100, 29, '2022-01-25', NULL, 1, '2022-01-25 10:04:00'),
(334, 28, '15400-RTA-003', 780, 1600, 5, '2022-01-25', NULL, 1, '2022-01-25 10:06:40'),
(335, 29, '90915-YZZE1', 690, 1100, 25, '2022-01-25', NULL, 1, '2022-01-25 10:10:07'),
(336, 31, '13780-64P00', 1750, 2550, 1, '2022-01-25', NULL, 1, '2022-01-25 10:15:25'),
(337, 32, '08880-83509', 6388, 6900, 6, '2022-01-25', NULL, 1, '2022-01-25 10:35:31'),
(338, 33, '08880-83509 4L 10W-30', 6388, 6900, 4, '2022-01-25', NULL, 1, '2022-01-25 10:45:08'),
(339, 34, '0303BC0071N', 675, 950, 13, '2022-01-25', NULL, 1, '2022-01-25 11:05:39'),
(340, 36, '07207101', 699, 1300, 8, '2022-01-26', NULL, 1, '2022-01-26 03:12:39'),
(341, 37, '04152-YZZA6', 720, 1400, 6, '2022-01-25', NULL, 1, '2022-01-26 03:29:03'),
(342, 38, '17801-37021 ', 1950, 2800, 1, '2022-01-26', NULL, 1, '2022-01-26 03:34:35'),
(343, 39, '88568-52010', 1000, 2200, 0, '2022-01-26', NULL, 1, '2022-01-26 03:37:26'),
(344, 41, '07207401', 120, 210, 9, '2022-01-26', NULL, 1, '2022-01-26 04:26:49'),
(346, 43, '07207383', 166, 290, 7, '0000-00-00', NULL, 1, '2022-01-26 04:30:10'),
(347, 44, '0892333 32 ML ', 190, 250, 61, '2022-01-26', NULL, 1, '2022-01-26 05:27:15'),
(348, 45, '08880-83983', 4900, 6900, 11, '2022-01-26', NULL, 1, '2022-01-26 05:57:24'),
(349, 46, '510662UIE BREAK OIL', 410, 545, 9, '2022-01-26', NULL, 1, '2022-01-26 06:25:19'),
(350, 47, '510662PBE BREAK OIL', 725, 950, 1, '2022-01-26', NULL, 1, '2022-01-26 06:37:17'),
(351, 48, '08880-83985 CI-4 15W- 40 1L', 1429, 1800, 7, '2022-01-26', NULL, 1, '2022-01-26 07:01:51'),
(352, 49, '0890324385 85G QUICK DRY', 740, 800, 16, '2022-01-26', NULL, 1, '2022-01-26 07:46:26'),
(353, 51, '88568 -52010 AC -101', 1000, 2200, 2, '2022-01-26', NULL, 1, '2022-01-26 07:55:42'),
(354, 52, '08886-02505 GEAR OIL', 12400, 16750, 3, '2022-01-26', NULL, 1, '2022-01-26 09:45:02'),
(355, 54, '88568 -52010 AC -102', 1000, 2200, 1, '2022-01-26', NULL, 1, '2022-01-26 09:50:55'),
(356, 56, '17801-21050 A-1013', 1250, 2500, 4, '2022-01-26', NULL, 1, '2022-01-26 10:02:22'),
(357, 58, '17801-54100 A-170', 1450, 2100, 7, '2022-01-26', NULL, 1, '2022-01-26 10:44:28');

-- --------------------------------------------------------

--
-- Table structure for table `reminder`
--

CREATE TABLE `reminder` (
  `id` int(11) NOT NULL,
  `vehicle_no` varchar(255) NOT NULL,
  `contact_no` int(11) NOT NULL,
  `service` varchar(255) NOT NULL,
  `reminder` varchar(255) NOT NULL,
  `last_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reminder`
--

INSERT INTO `reminder` (`id`, `vehicle_no`, `contact_no`, `service`, `reminder`, `last_date`) VALUES
(1, 'CAA-8956 ', 772271080, '', '7', '2021-11-19 02:57:18'),
(2, 'sen 1234', 778434368, '', '7', '2021-12-09 17:19:12'),
(3, 'BH1233', 770280956, '', '7', '2022-01-23 02:27:26'),
(4, 'we3123', 778434368, '', '7', '2021-12-22 12:04:45'),
(5, 'bh1425', 771264444, '', '15', '2021-12-27 12:07:10'),
(6, 'NP-KT-9819', 776701733, '', '7', '2021-12-23 03:37:38'),
(7, 'WP KU 0096', 776845225, '', '7', '2021-12-28 07:36:36'),
(8, 'NP-KR-7493', 770782757, '', '7', '2021-12-30 11:07:08'),
(9, 'NP-HH-1378', 776398699, '', '7', '2021-12-30 11:11:50'),
(10, 'NP-CBL-4227', 77503177, '', '7', '2021-12-30 11:12:42'),
(11, 'NP-CBL-4227', 775023127, '', '7', '2021-12-30 11:14:10'),
(12, 'WP CBI 0764', 778409677, '', '7', '2021-12-31 07:06:20'),
(13, 'DD_100', 773148560, '', '7', '2022-01-03 04:23:23'),
(14, 'NP CAK 1172', 764100338, '', '7', '2022-01-03 09:32:40'),
(15, 'WP KV 9073', 777738527, '', '7', '2022-01-03 09:39:56'),
(16, 'WP KV 9073', 7777, '', '7', '2022-01-03 09:42:56'),
(17, 'NP CAB-4410', 777331303, '', '7', '2022-01-03 09:46:32'),
(18, 'WP PE 9084', 774730949, '', '7', '2022-01-05 07:24:23'),
(19, 'NP CAI 9135', 778860885, '', '7', '2022-01-11 05:37:30'),
(20, 'NP CAE-3447', 779710599, '', '7', '2022-01-16 05:43:44'),
(21, 'NP KL 7663', 776110198, '', '7', '2022-01-16 06:42:54'),
(22, 'NP CAR 5560', 778618658, '', '7', '2022-01-16 09:54:40'),
(23, 'NP CAQ 5908', 242223741, '', '7', '2022-01-18 05:51:04'),
(24, 'NP PJ 5750', 776309683, '', '7', '2022-01-18 07:02:03'),
(25, 'NP CBC 1895', 773522376, '', '7', '2022-01-23 03:52:16'),
(26, 'CP KG-7135', 741088399, '', '7', '2022-01-23 04:01:57'),
(27, 'CAV-0970', 774646846, '', '7', '2022-01-23 04:03:49'),
(28, 'NP CBI 3925', 764450161, '', '7', '2022-01-23 04:05:22'),
(29, 'KS 9432', 772728048, '', '7', '2022-01-23 04:07:41'),
(30, 'NP CAE8543', 714879516, '', '7', '2022-01-23 05:48:18'),
(31, 'NP-KP-0188', 777821238, '', '7', '2022-01-23 11:32:11'),
(32, 'NP CAU -2234', 777111151, '', '7', '2022-01-23 11:43:28'),
(33, 'NC CAE 1773', 716352515, '', '7', '2022-01-24 11:03:13'),
(34, 'WP KS 4299', 776517311, '', '7', '2022-01-25 07:12:36'),
(35, 'WP KS 4299 	', 776517311, '', '7', '2022-01-25 07:16:37'),
(36, 'WP DAH 4991', 763977314, '', '7', '2022-01-25 07:33:16'),
(37, 'NP PD 8351', 774920136, '', '7', '2022-01-25 08:35:04'),
(38, 'EP CAD 5625', 773418804, '', '7', '2022-01-25 08:43:09'),
(39, 'WP CAD 3287', 772727735, '', '7', '2022-01-25 09:01:38'),
(40, 'NP CBD 2261', 714233126, '', '7', '2022-01-25 09:08:43'),
(41, 'WP CAI 0793', 772728048, '', '7', '2022-01-25 09:11:20'),
(42, 'NP CAI 8578', 772831690, '', '7', '2022-01-25 09:15:02'),
(43, 'WP NA 9001', 759525035, '', '7', '2022-01-25 09:39:30'),
(44, 'CDE 2213', 740212019, '', '7', '2022-01-25 09:41:29'),
(45, 'CDE 2213 	', 745702526, '', '7', '2022-01-25 09:43:13'),
(46, 'NP PK 6908', 775702526, '', '7', '2022-01-25 10:19:30'),
(47, 'WP PF-9084', 774730949, '', '7', '2022-01-25 10:23:21'),
(48, 'CK 6162', 770118510, '', '7', '2022-01-25 10:26:46'),
(49, '251-6352', 774524032, '', '7', '2022-01-25 10:31:40'),
(50, 'WP KO -3591', 773136415, '', '7', '2022-01-25 10:48:25'),
(51, 'NP PI -1997', 774710706, '', '7', '2022-01-25 10:50:11'),
(52, 'WP 251-2898', 771366331, '', '7', '2022-01-25 10:51:21'),
(53, 'NP CAR-5480', 774349113, '', '7', '2022-01-25 10:52:40'),
(54, 'NP KR-7089', 767999520, '', '7', '2022-01-25 10:54:47'),
(55, 'NP CBF-2645', 779587922, '', '7', '2022-01-25 10:55:53'),
(56, 'WP CAO 8555', 777517102, '', '7', '2022-01-25 11:01:27'),
(57, 'NP DAG-9763', 775140820, '', '7', '2022-01-25 11:14:20'),
(58, 'NP KN 2882', 770777738, '', '7', '2022-01-25 11:15:56'),
(59, '59 5890', 766564888, '', '7', '2022-01-25 11:17:53'),
(60, 'CI 5582', 774493124, '', '7', '2022-01-25 11:19:22'),
(61, 'NP KL 3524', 779443213, '', '7', '2022-01-26 03:19:49'),
(62, 'NP KX 5157', 773268356, '', '7', '2022-01-26 03:42:53'),
(63, 'CP CAY 8414', 770790881, '', '7', '2022-01-26 03:45:06'),
(64, 'KI 3524', 77794213, '', '7', '2022-01-26 04:35:29'),
(65, 'NC CAA 0464', 773136262, '', '7', '2022-01-26 04:44:47'),
(66, 'NP CAB-3435', 771203083, '', '7', '2022-01-26 04:48:09'),
(67, 'NP HE 9379', 772354883, '', '7', '2022-01-26 04:51:16'),
(68, 'NP DAF 5476', 774487193, '', '7', '2022-01-26 04:54:15'),
(69, 'WP CAJ - 7295', 764598071, '', '7', '2022-01-26 05:00:27'),
(70, 'NW CAI-7966', 764334148, '', '7', '2022-01-26 05:11:45'),
(71, 'SP PH 3620', 779779963, '', '7', '2022-01-26 05:18:50'),
(72, 'SP CBF-7057', 774710706, '', '7', '2022-01-26 05:20:27'),
(73, 'CP CAV- 2942', 764598071, '', '7', '2022-01-26 05:31:11'),
(74, 'NP KS 4330', 770512003, '', '7', '2022-01-26 05:35:18'),
(75, '251-8579', 771110453, '', '7', '2022-01-26 05:41:56'),
(76, 'NC CAT 1091', 774730949, '', '7', '2022-01-26 05:44:02'),
(77, 'NP PG 7277', 767676784, '', '7', '2022-01-26 07:22:41'),
(78, 'NP CAZ 7952', 767454646, '', '7', '2022-01-26 07:25:46'),
(79, 'NP CBC-1895', 773522376, '', '7', '2022-01-26 07:31:03'),
(80, 'NP DAG 9312', 773834328, '', '7', '2022-01-26 07:35:15'),
(81, 'NP DAC 4258', 769486619, '', '7', '2022-01-26 07:36:50'),
(82, 'NP CBA 1335', 778944081, '', '7', '2022-01-26 10:48:32'),
(83, 'NP CAE 4322', 762929801, '', '7', '2022-01-26 10:50:09');

-- --------------------------------------------------------

--
-- Stand-in structure for view `salessummary`
-- (See below for the actual view)
--
CREATE TABLE `salessummary` (
`order_id` int(11)
,`bill_no` int(11)
,`Amount` int(11)
,`item_id` varchar(255)
,`Item_nameOrService` varchar(255)
,`Created_At` timestamp
,`Total_Purchase_Price` double
);

-- --------------------------------------------------------

--
-- Table structure for table `service`
--

CREATE TABLE `service` (
  `service_id` int(11) NOT NULL,
  `service` varchar(100) COLLATE utf8_bin NOT NULL,
  `amount` int(11) NOT NULL,
  `updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `service`
--

INSERT INTO `service` (`service_id`, `service`, `amount`, `updated`) VALUES
(9, 'QUICK WASH - CAR/CAB', 500, '2021-12-28 07:55:46'),
(10, 'QUICK WASH - VAN/JEEP', 700, '2021-12-28 07:56:26'),
(12, 'BODY WASH & VACCUM CAR/ CAB', 900, '2021-12-28 07:57:52'),
(13, 'BODY WASH & VACCUM VAN/JEEP', 1300, '2021-12-28 07:58:57'),
(14, 'ULTIMATE SHINE CAR/ CAB', 1400, '2021-12-28 07:59:45'),
(15, 'ULTIMATE SHINE VAN / JEEP', 1900, '2021-12-28 08:00:55'),
(16, 'FULL SERVICE  CAR / CAB', 2900, '2021-12-28 08:01:37'),
(17, 'FULL SERVICE  VAN / JEEP', 3500, '2021-12-28 08:02:15'),
(18, 'FULL SERVICE  LORRY', 5500, '2021-12-28 08:02:34'),
(19, 'PLATINUM WOR (DETAILING) CAR / CAB', 18500, '2021-12-28 08:03:39'),
(20, 'PLATINUM WOR (DETAILING) VAN / JEEP', 21500, '2021-12-28 08:04:07'),
(21, 'UNDER WASH CAR / CAB', 1500, '2021-12-28 08:04:30'),
(22, 'UNDER WASH VAN / JEEP', 1900, '2021-12-28 08:05:00'),
(23, 'EXTERIOR QUICK WAXING CAR / CAB', 500, '2021-12-28 08:06:24'),
(24, 'EXTERIOR QUICK WAXING VAN / JEEP', 600, '2021-12-28 08:06:59'),
(25, 'EXTERIORPREMIUM WAXING CAR / CAB', 1600, '2021-12-28 08:07:42'),
(26, 'EXTERIORPREMIUM WAXING VAN / JEEP', 1800, '2021-12-28 08:08:15'),
(27, 'EXTERIOR DETAILING CAR /CAB', 10500, '2021-12-28 08:09:06'),
(28, 'EXTERIOR DETAILING VAN / JEEP', 12500, '2021-12-28 08:10:41'),
(30, 'INTERIOR DETAILING CAR / CAB', 8000, '2021-12-28 08:18:30'),
(31, 'INTERIOR DETAILING VAN / JEEP', 9000, '2021-12-28 08:18:59'),
(32, 'HEAD LIGHT POLISING CAR/ CAB ( ONE SIDE)', 950, '2021-12-28 08:19:45'),
(33, 'ENGINE CLEANING', 700, '2021-12-28 08:20:07'),
(34, 'SEAT CLEANING ONE SEAT', 1200, '2021-12-28 08:20:28'),
(35, 'ENGINE OIL CHANGE', 300, '2021-12-28 08:21:11'),
(36, 'GEAR OIL CHANGE', 300, '2021-12-28 08:21:29'),
(37, 'TRANSMISSIN (ATF) NORMAL', 800, '2021-12-28 08:22:02'),
(38, 'TRANSMISSIN (ATF) SUMP ASSY R/ R', 1600, '2021-12-28 08:22:48'),
(39, 'RADIOTOR COOLANT', 650, '2021-12-28 08:26:39'),
(40, 'OIL FILTER CHANGE', 300, '2021-12-28 08:26:59'),
(41, 'AIR FILTER CHANGE', 200, '2021-12-28 08:27:16'),
(42, 'FUEL FILTER CHANGE', 350, '2021-12-28 08:27:35'),
(43, 'AC FILTER CHANGE', 150, '2021-12-28 08:27:53'),
(44, 'CUT & POLISH CAR / CAB', 10500, '2021-12-28 08:28:24'),
(45, 'CUT & POLISH VAN & JEEP', 12500, '2021-12-28 08:29:02'),
(46, 'TUNEUP CAR / CAB', 9500, '2021-12-28 08:29:22'),
(47, 'TUNEUPVAN / JEEP', 12500, '2021-12-28 08:29:41'),
(48, 'BOOTH PAINTING ONE PANEL', 8500, '2021-12-28 08:30:25'),
(49, 'LABOUR HOURS 1H ', 1450, '2021-12-28 08:31:11'),
(50, 'SCANNING 12V', 1500, '2021-12-28 08:31:28'),
(51, 'NITRIGEN  FILLUP', 200, '2022-01-23 11:36:39'),
(52, 'AIR FRESHNER', 150, '2022-01-23 11:44:31'),
(53, 'GRESE NIPPLE', 60, '2022-01-25 10:24:22');

-- --------------------------------------------------------

--
-- Table structure for table `sub_menu`
--

CREATE TABLE `sub_menu` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `icon` varchar(100) NOT NULL,
  `url` varchar(100) NOT NULL,
  `menu_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sub_menu`
--

INSERT INTO `sub_menu` (`id`, `name`, `icon`, `url`, `menu_id`) VALUES
(1, 'Add Order', 'fa fa-plus', 'Orders/insert', 1),
(2, 'Orders', 'fa fa-car', 'Orders', 1),
(3, 'Add Expenses', 'fa fa-plus', 'Expense/AddExpenses', 2),
(4, 'Expenses', 'fa fa-file', 'Expense/Summery', 2),
(5, 'New Purchase', 'fa fa-plus', 'Purchase/AddNew', 3),
(6, 'Purchases', 'fa fa-file', 'Purchase/Summery', 3),
(7, 'Customers', 'fa fa-user', 'Customers', 4),
(8, 'Message', 'fa fa-envelope', 'Customers/Message', 4),
(9, 'Add Employee', 'fa fa-plus', 'Employees/Add', 5),
(10, 'Employees', 'fa fa-users', 'Employees', 5),
(11, 'Summery', 'fa fa-plus', 'Payments/Summery', 6),
(12, 'Add Item', 'fa fa-plus', 'Inventory/Add', 7),
(13, 'Show Items', 'fa fa-eye', 'Inventory/Items', 7),
(14, 'Add New Profile', 'fa fa-plus', 'Users/AddProfile', 8),
(15, 'Add New User', 'fa fa-user-plus', 'Users/AddUser', 8),
(16, 'Users', 'fa fa-users', 'Users', 8),
(17, 'Change Password', 'fa fa-cog', 'Settings/change', 10),
(18, 'Inventory Setting', 'fa fa-file', 'Settings/InventorySetting', 10),
(19, 'Add Service', 'fa fa-file', 'Settings/AddService', 10),
(20, 'pending', 'fa-spinner', 'Booking/pending', 11),
(21, 'confirm', 'fa-check', 'Booking/confirmed', 11),
(22, 'cancel', 'fa-ban', 'Booking/cancelled', 11);

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `id` int(11) NOT NULL,
  `supplier` varchar(100) NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`id`, `supplier`, `created`) VALUES
(1, 'supplier1', '2021-10-30 13:26:48'),
(2, 'supplier2', '2021-10-30 13:27:06');

-- --------------------------------------------------------

--
-- Table structure for table `type`
--

CREATE TABLE `type` (
  `type_id` int(11) NOT NULL,
  `type` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `type`
--

INSERT INTO `type` (`type_id`, `type`) VALUES
(1, 'Car'),
(2, ' HONDA VEZEL'),
(3, 'VAN'),
(4, 'AIR WAVE'),
(5, 'TOYOTA PREMIO'),
(6, 'TOYOTA PRIUS'),
(7, 'TOYOTA VIXZ'),
(8, 'JEEP'),
(9, 'SUZUKI'),
(10, 'SUZUKI ALTO'),
(11, 'HONDA CIVIC'),
(12, 'SUZUKI WAGONR'),
(13, 'A STAR'),
(14, 'DIMO'),
(15, 'VXI'),
(16, 'TATA WINCE'),
(17, 'TOYOTA PRIUS'),
(18, 'BOLERO'),
(19, 'MICRO PANDA'),
(20, 'MAHENDRA BOLERO'),
(21, 'FORD CAB'),
(22, 'KDH');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `user_level` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `user_level`) VALUES
(1, 'admin', 'admin123', 1),
(2, 'staff', 'staff123', 2);

-- --------------------------------------------------------

--
-- Table structure for table `user_menu`
--

CREATE TABLE `user_menu` (
  `id` int(11) NOT NULL,
  `user_level` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_menu`
--

INSERT INTO `user_menu` (`id`, `user_level`, `menu_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 7),
(8, 1, 8),
(9, 1, 9),
(10, 1, 10),
(12, 2, 1),
(13, 2, 2),
(14, 2, 3),
(15, 2, 4),
(16, 2, 5),
(17, 2, 10),
(18, 2, 11);

-- --------------------------------------------------------

--
-- Table structure for table `user_profile`
--

CREATE TABLE `user_profile` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_profile`
--

INSERT INTO `user_profile` (`id`, `name`, `description`) VALUES
(1, 'Admin', 'all'),
(2, 'User', 'some');

-- --------------------------------------------------------

--
-- Table structure for table `user_sub_menu`
--

CREATE TABLE `user_sub_menu` (
  `id` int(11) NOT NULL,
  `user_level` int(11) NOT NULL,
  `sub_menu_id` int(11) NOT NULL,
  `main_menu_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_sub_menu`
--

INSERT INTO `user_sub_menu` (`id`, `user_level`, `sub_menu_id`, `main_menu_id`) VALUES
(1, 1, 1, 1),
(2, 1, 2, 1),
(3, 1, 3, 2),
(4, 1, 4, 2),
(5, 1, 5, 3),
(6, 1, 6, 3),
(7, 1, 7, 4),
(8, 1, 8, 4),
(9, 1, 9, 5),
(10, 1, 10, 5),
(11, 1, 11, 6),
(12, 1, 12, 7),
(13, 1, 13, 7),
(14, 1, 14, 8),
(15, 1, 15, 8),
(16, 1, 16, 8),
(17, 1, 17, 10),
(19, 2, 1, 1),
(20, 2, 2, 1),
(21, 2, 3, 2),
(22, 2, 4, 2),
(23, 2, 5, 3),
(24, 2, 6, 3),
(25, 2, 7, 4),
(26, 2, 8, 4),
(27, 2, 9, 5),
(28, 2, 10, 5),
(29, 2, 17, 10),
(30, 1, 18, 10),
(31, 1, 19, 10),
(32, 2, 20, 11),
(33, 2, 21, 11),
(34, 2, 22, 11);

-- --------------------------------------------------------

--
-- Table structure for table `vehicles`
--

CREATE TABLE `vehicles` (
  `vehicle_id` int(11) NOT NULL,
  `vehicle_no` varchar(100) COLLATE utf8_bin NOT NULL,
  `customername` varchar(100) COLLATE utf8_bin NOT NULL,
  `contact_no` int(10) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `vehicles`
--

INSERT INTO `vehicles` (`vehicle_id`, `vehicle_no`, `customername`, `contact_no`, `status`, `created`, `updated`) VALUES
(1, 'CAA-8956 ', 'S Ramesh ', 772271080, 0, '2021-11-19 02:57:18', '2021-11-20 04:24:40'),
(2, 'sen 1234', 'senthoo', 778434368, 1, '2021-12-09 17:13:32', '2021-12-09 17:13:32'),
(3, 'BH1233', 'Vinu', 770280956, 1, '2021-12-10 10:42:10', '2021-12-10 10:42:10'),
(4, 'we3123', 'Senthoo', 778434368, 1, '2021-12-22 12:04:45', '2021-12-22 12:04:45'),
(5, 'bh1425', 'ninu', 771264444, 1, '2021-12-22 12:14:48', '2021-12-22 12:14:48'),
(6, 'NP-KT-9819', 'MR.PARAMESHWRAN', 776701733, 1, '2021-12-23 03:37:38', '2021-12-23 03:37:38'),
(7, 'WP KU 0096', 'MR SATHTHIYAN', 776845225, 1, '2021-12-28 07:36:36', '2021-12-28 07:36:36'),
(8, 'NP-KR-7493', 'MR.RAVINTHRAN', 770782757, 1, '2021-12-30 11:07:08', '2021-12-30 11:07:08'),
(9, 'NP-HH-1378', 'MR.JOHNSHAN', 776398699, 1, '2021-12-30 11:11:50', '2021-12-30 11:11:50'),
(10, 'NP-CBL-4227', 'MR.SIVANTHAN', 775023127, 1, '2021-12-30 11:12:42', '2021-12-30 11:14:10'),
(11, 'WP CBI 0764', 'MR VINOTH', 778409677, 1, '2021-12-31 07:06:20', '2021-12-31 07:06:20'),
(12, 'DD_100', 'saru', 773148560, 1, '2022-01-03 04:23:23', '2022-01-03 04:23:23'),
(13, 'NP CAK 1172', 'MR PRASANTH', 764100338, 1, '2022-01-03 09:32:40', '2022-01-03 09:32:40'),
(14, 'WP KV 9073', 'MR DILAN', 777738527, 1, '2022-01-03 09:39:56', '2022-01-03 09:44:12'),
(15, 'NP CAB-4410', 'MR REGINOLD', 777331303, 1, '2022-01-03 09:46:32', '2022-01-03 09:46:32'),
(16, 'WP PE 9084', 'MR KOKILAN', 774730949, 1, '2022-01-05 07:24:23', '2022-01-05 07:24:23'),
(17, 'NP CAI 9135', 'MR MURTHTHI', 778860885, 1, '2022-01-11 05:37:30', '2022-01-11 05:37:30'),
(18, 'NP CAE-3447', 'MR THESIKAN', 779710599, 1, '2022-01-16 05:43:44', '2022-01-16 05:43:44'),
(19, 'NP KL 7663', 'MR ANOJ', 776110198, 1, '2022-01-16 06:42:54', '2022-01-16 06:42:54'),
(20, 'NP CAR 5560', 'MR SATHEES', 778618658, 1, '2022-01-16 09:54:40', '2022-01-16 09:54:40'),
(21, 'NP CAQ 5908', 'P.KANNATHASAN', 242223741, 1, '2022-01-18 05:51:04', '2022-01-18 05:51:04'),
(22, 'NP PJ 5750', 'MR ANTONY', 776309683, 1, '2022-01-18 07:02:03', '2022-01-18 07:02:03'),
(23, 'NP CBC 1895', 'MR R.THASEEYTHARAN', 773522376, 1, '2022-01-23 03:52:16', '2022-01-23 07:19:10'),
(24, 'CP KG-7135', 'MR BINU', 741088399, 1, '2022-01-23 04:01:57', '2022-01-23 04:01:57'),
(25, 'CAV-0970', 'MR SARANGAN', 774646846, 1, '2022-01-23 04:03:49', '2022-01-23 04:03:49'),
(26, 'NP CBI 3925', 'MR THULASI', 764450161, 1, '2022-01-23 04:05:22', '2022-01-23 04:05:22'),
(27, 'KS 9432', 'MR RAJU', 772728048, 1, '2022-01-23 04:07:41', '2022-01-23 04:07:41'),
(28, 'NP CAE8543', 'MR PRASANNA', 714879516, 1, '2022-01-23 05:48:18', '2022-01-23 05:48:18'),
(29, 'NP-KP-0188', 'MR.SURESH', 777821238, 1, '2022-01-23 11:32:11', '2022-01-23 11:32:11'),
(30, 'NP CAU -2234', 'MR.UMAKARAN', 777111151, 1, '2022-01-23 11:43:28', '2022-01-23 11:43:28'),
(31, 'NC CAE 1773', 'MR RISHADY', 716352515, 1, '2022-01-24 11:03:13', '2022-01-24 11:03:13'),
(32, 'WP KS 4299', 'MR SIVASOTHI', 776517311, 1, '2022-01-25 07:12:36', '2022-01-25 07:12:36'),
(33, 'WP KS 4299 	', 'MR SIVASOTHI 	', 776517311, 1, '2022-01-25 07:16:37', '2022-01-25 07:16:37'),
(34, 'WP DAH 4991', 'MR VIGI', 763977314, 1, '2022-01-25 07:33:16', '2022-01-25 07:33:16'),
(35, 'NP PD 8351', 'MR SUTHARSAN', 774920136, 1, '2022-01-25 08:35:04', '2022-01-25 08:35:04'),
(36, 'EP CAD 5625', 'MR U SARANKAN', 773418804, 1, '2022-01-25 08:43:09', '2022-01-25 08:43:09'),
(37, 'WP CAD 3287', 'MR SUJEE', 772727735, 1, '2022-01-25 09:01:38', '2022-01-25 09:01:38'),
(38, 'NP CBD 2261', 'MR NIROSAN', 714233126, 1, '2022-01-25 09:08:43', '2022-01-25 09:08:43'),
(39, 'WP CAI 0793', 'S.RAJU', 772728048, 1, '2022-01-25 09:11:20', '2022-01-25 09:11:20'),
(40, 'NP CAI 8578', 'MR.BASKARAN', 772831690, 1, '2022-01-25 09:15:02', '2022-01-25 09:15:02'),
(41, 'WP NA 9001', 'MR.S.JANAKAN', 759525035, 1, '2022-01-25 09:39:30', '2022-01-25 09:39:30'),
(42, 'CDE 2213', 'MR KUDDY', 740212019, 1, '2022-01-25 09:41:29', '2022-01-25 09:41:29'),
(43, 'CDE 2213 	', 'MR KUDDY', 745702526, 1, '2022-01-25 09:43:13', '2022-01-25 09:43:13'),
(44, 'NP PK 6908', 'MR.KABILAN', 775702526, 1, '2022-01-25 10:19:30', '2022-01-25 10:19:30'),
(45, 'WP PF-9084', 'MR.KOKILAN', 774730949, 1, '2022-01-25 10:23:21', '2022-01-25 10:23:21'),
(46, 'CK 6162', 'MR.VARATHARAJAN', 770118510, 1, '2022-01-25 10:26:46', '2022-01-25 10:26:46'),
(47, '251-6352', 'MR.THAVARANJITHAN', 774524032, 1, '2022-01-25 10:31:40', '2022-01-25 10:31:40'),
(48, 'WP KO -3591', 'MR PIRASATHPERA', 773136415, 1, '2022-01-25 10:48:25', '2022-01-25 10:48:25'),
(49, 'NP PI -1997', 'MR SHANTHAN', 774710706, 1, '2022-01-25 10:50:11', '2022-01-25 10:50:11'),
(50, 'WP 251-2898', 'MR KIRISHAN', 771366331, 1, '2022-01-25 10:51:21', '2022-01-25 10:51:21'),
(51, 'NP CAR-5480', 'MR VIKINESWARAN', 774349113, 1, '2022-01-25 10:52:40', '2022-01-25 10:52:40'),
(52, 'NP KR-7089', 'MR KUMAR', 767999520, 1, '2022-01-25 10:54:47', '2022-01-25 10:54:47'),
(53, 'NP CBF-2645', 'MR THEEPAN', 779587922, 1, '2022-01-25 10:55:53', '2022-01-25 10:55:53'),
(54, 'WP CAO 8555', 'MR SHANKAR', 777517102, 1, '2022-01-25 11:01:27', '2022-01-25 11:01:27'),
(55, 'NP DAG-9763', 'MR SRITHARAN', 775140820, 1, '2022-01-25 11:14:20', '2022-01-25 11:14:20'),
(56, 'NP KN 2882', 'MR PIRASANTH', 770777738, 1, '2022-01-25 11:15:56', '2022-01-25 11:15:56'),
(57, '59 5890', 'MR KAJANTHAN', 766564888, 1, '2022-01-25 11:17:53', '2022-01-25 11:17:53'),
(58, 'CI 5582', ' SHARAN HARDWARE', 774493124, 1, '2022-01-25 11:19:22', '2022-01-25 11:19:22'),
(59, 'NP KL 3524', 'MR VINOTH', 779443213, 1, '2022-01-26 03:19:49', '2022-01-26 03:19:49'),
(60, 'NP KX 5157', 'MR BRUNTHAPAN', 773268356, 1, '2022-01-26 03:42:53', '2022-01-26 03:42:53'),
(61, 'CP CAY 8414', 'MR THUSHARA', 770790881, 1, '2022-01-26 03:45:06', '2022-01-26 03:45:06'),
(62, 'KI 3524', 'MR J VINOTH', 77794213, 1, '2022-01-26 04:35:29', '2022-01-26 04:35:29'),
(63, 'NC CAA 0464', 'MR PRATHEEPAN', 773136262, 1, '2022-01-26 04:44:47', '2022-01-26 04:44:47'),
(64, 'NP CAB-3435', 'MR JOWAN', 771203083, 1, '2022-01-26 04:48:09', '2022-01-26 04:48:09'),
(65, 'NP HE 9379', 'MR SATHIS', 772354883, 1, '2022-01-26 04:51:16', '2022-01-26 04:51:16'),
(66, 'NP DAF 5476', 'MR J. KARAN', 774487193, 1, '2022-01-26 04:54:15', '2022-01-26 04:54:15'),
(67, 'WP CAJ - 7295', 'MR SELVAKUMAR', 764598071, 1, '2022-01-26 05:00:27', '2022-01-26 05:00:27'),
(68, 'NW CAI-7966', 'MR KISHOBIKAN', 764334148, 1, '2022-01-26 05:11:45', '2022-01-26 05:11:45'),
(69, 'SP PH 3620', 'MR SUPRA ', 779779963, 1, '2022-01-26 05:18:50', '2022-01-26 05:18:50'),
(70, 'SP CBF-7057', 'MR SHANTHAN', 774710706, 1, '2022-01-26 05:20:27', '2022-01-26 05:20:27'),
(71, 'CP CAV- 2942', 'MR PRASANTH', 764598071, 1, '2022-01-26 05:31:11', '2022-01-26 05:31:11'),
(72, 'NP KS 4330', 'MR JATHURSAN', 770512003, 1, '2022-01-26 05:35:18', '2022-01-26 05:35:18'),
(73, '251-8579', 'MR BENJAMIN', 771110453, 1, '2022-01-26 05:41:56', '2022-01-26 05:41:56'),
(74, 'NC CAT 1091', 'MR.KOKILAN', 774730949, 1, '2022-01-26 05:44:02', '2022-01-26 05:44:02'),
(75, 'NP PG 7277', 'MR SUTHARSAN', 767676784, 1, '2022-01-26 07:22:41', '2022-01-26 07:22:41'),
(76, 'NP CAZ 7952', 'MR AJANTHAN', 767454646, 1, '2022-01-26 07:25:46', '2022-01-26 07:25:46'),
(77, 'NP CBC-1895', 'MR. R THASEEYTHARAN', 773522376, 1, '2022-01-26 07:31:03', '2022-01-26 07:31:03'),
(78, 'NP DAG 9312', 'MR KIRUSHNAKUMAR', 773834328, 1, '2022-01-26 07:35:15', '2022-01-26 07:35:15'),
(79, 'NP DAC 4258', 'MR NITHARSAN', 769486619, 1, '2022-01-26 07:36:50', '2022-01-26 07:36:50'),
(80, 'NP CBA 1335', 'MR KAMTHEEPAN', 778944081, 1, '2022-01-26 10:48:32', '2022-01-26 10:48:32'),
(81, 'NP CAE 4322', 'MR SRI', 762929801, 1, '2022-01-26 10:50:09', '2022-01-26 10:50:09');

-- --------------------------------------------------------

--
-- Table structure for table `viscosity`
--

CREATE TABLE `viscosity` (
  `id` int(11) NOT NULL,
  `Viscosity` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure for view `salessummary`
--
DROP TABLE IF EXISTS `salessummary`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `salessummary`  AS  select `details`.`order_id` AS `order_id`,`details`.`bill_no` AS `bill_no`,coalesce(`details`.`amount`,0) AS `Amount`,`details`.`item_id` AS `item_id`,`details`.`item_name` AS `Item_nameOrService`,`details`.`created` AS `Created_At`,coalesce(`details`.`qty` * `details`.`purchase_price`,0) AS `Total_Purchase_Price` from (select `o`.`order_id` AS `order_id`,`oi`.`bill_no` AS `bill_no`,`oi`.`amount` AS `amount`,`oi`.`item_id` AS `item_id`,`oi`.`item_name` AS `item_name`,`o`.`created` AS `created`,`oi`.`qty` AS `qty`,`pi`.`purchase_price` AS `purchase_price` from ((`orders` `o` left join `order_item` `oi` on(`oi`.`id` = `o`.`order_id`)) left join `purchase_items` `pi` on(`pi`.`item_id` = `oi`.`item_id`)) union select `o`.`order_id` AS `order_id`,`os`.`bill_no` AS `bill_no`,`os`.`amount` AS `amount`,'' AS ``,`os`.`service` AS `service`,`o`.`created` AS `created`,'' AS ``,'' AS `` from (`orders` `o` left join `order_service` `os` on(`os`.`id` = `o`.`order_id`)) union select `o`.`order_id` AS `order_id`,`ose`.`bill_no` AS `bill_no`,`ose`.`amount` AS `amount`,'' AS ``,`ose`.`service` AS `service`,`o`.`created` AS `created`,'' AS ``,'' AS `` from (`orders` `o` left join `other_service` `ose` on(`ose`.`id` = `o`.`order_id`))) `details` order by `details`.`order_id` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `advance`
--
ALTER TABLE `advance`
  ADD PRIMARY KEY (`ad_id`);

--
-- Indexes for table `bay`
--
ALTER TABLE `bay`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`book_id`);

--
-- Indexes for table `booking_service`
--
ALTER TABLE `booking_service`
  ADD PRIMARY KEY (`service_id`);

--
-- Indexes for table `booking_sub_service`
--
ALTER TABLE `booking_sub_service`
  ADD PRIMARY KEY (`sub_service_id`),
  ADD KEY `service_id` (`service_id`),
  ADD KEY `service_id_2` (`service_id`),
  ADD KEY `service_id_3` (`service_id`);

--
-- Indexes for table `chat_history`
--
ALTER TABLE `chat_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `default_msg`
--
ALTER TABLE `default_msg`
  ADD PRIMARY KEY (`msg_id`);

--
-- Indexes for table `emp`
--
ALTER TABLE `emp`
  ADD PRIMARY KEY (`emp_id`),
  ADD UNIQUE KEY `ID` (`id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`employee_id`);

--
-- Indexes for table `expense`
--
ALTER TABLE `expense`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `int_brand`
--
ALTER TABLE `int_brand`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `int_catogery`
--
ALTER TABLE `int_catogery`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `int_filter_range`
--
ALTER TABLE `int_filter_range`
  ADD PRIMARY KEY (`filter_range_id`);

--
-- Indexes for table `int_items`
--
ALTER TABLE `int_items`
  ADD PRIMARY KEY (`item_id`);

--
-- Indexes for table `int_setting`
--
ALTER TABLE `int_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `int_sub_catogery`
--
ALTER TABLE `int_sub_catogery`
  ADD PRIMARY KEY (`sub_cat_id`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login_log`
--
ALTER TABLE `login_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `main_menu`
--
ALTER TABLE `main_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `make`
--
ALTER TABLE `make`
  ADD PRIMARY KEY (`make_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oil_brand`
--
ALTER TABLE `oil_brand`
  ADD PRIMARY KEY (`oil_brand_id`);

--
-- Indexes for table `oil_filter`
--
ALTER TABLE `oil_filter`
  ADD PRIMARY KEY (`oil_filter_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `order_item`
--
ALTER TABLE `order_item`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_service`
--
ALTER TABLE `order_service`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `other_service`
--
ALTER TABLE `other_service`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`pay_id`);

--
-- Indexes for table `purchase`
--
ALTER TABLE `purchase`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase_items`
--
ALTER TABLE `purchase_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reminder`
--
ALTER TABLE `reminder`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`service_id`);

--
-- Indexes for table `sub_menu`
--
ALTER TABLE `sub_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`type_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_menu`
--
ALTER TABLE `user_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_profile`
--
ALTER TABLE `user_profile`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_sub_menu`
--
ALTER TABLE `user_sub_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`vehicle_id`);

--
-- Indexes for table `viscosity`
--
ALTER TABLE `viscosity`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `advance`
--
ALTER TABLE `advance`
  MODIFY `ad_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bay`
--
ALTER TABLE `bay`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `bill`
--
ALTER TABLE `bill`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `book_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `booking_service`
--
ALTER TABLE `booking_service`
  MODIFY `service_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `booking_sub_service`
--
ALTER TABLE `booking_sub_service`
  MODIFY `sub_service_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `chat_history`
--
ALTER TABLE `chat_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `default_msg`
--
ALTER TABLE `default_msg`
  MODIFY `msg_id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `emp`
--
ALTER TABLE `emp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `employee_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expense`
--
ALTER TABLE `expense`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT for table `int_brand`
--
ALTER TABLE `int_brand`
  MODIFY `brand_id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;

--
-- AUTO_INCREMENT for table `int_catogery`
--
ALTER TABLE `int_catogery`
  MODIFY `cat_id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `int_filter_range`
--
ALTER TABLE `int_filter_range`
  MODIFY `filter_range_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `int_setting`
--
ALTER TABLE `int_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `int_sub_catogery`
--
ALTER TABLE `int_sub_catogery`
  MODIFY `sub_cat_id` mediumint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=202;

--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `login_log`
--
ALTER TABLE `login_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=151;

--
-- AUTO_INCREMENT for table `main_menu`
--
ALTER TABLE `main_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `make`
--
ALTER TABLE `make`
  MODIFY `make_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oil_brand`
--
ALTER TABLE `oil_brand`
  MODIFY `oil_brand_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oil_filter`
--
ALTER TABLE `oil_filter`
  MODIFY `oil_filter_id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT for table `order_item`
--
ALTER TABLE `order_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT for table `order_service`
--
ALTER TABLE `order_service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;

--
-- AUTO_INCREMENT for table `other_service`
--
ALTER TABLE `other_service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `pay_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase`
--
ALTER TABLE `purchase`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `purchase_items`
--
ALTER TABLE `purchase_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=358;

--
-- AUTO_INCREMENT for table `reminder`
--
ALTER TABLE `reminder`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT for table `service`
--
ALTER TABLE `service`
  MODIFY `service_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `sub_menu`
--
ALTER TABLE `sub_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `type`
--
ALTER TABLE `type`
  MODIFY `type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_menu`
--
ALTER TABLE `user_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `user_profile`
--
ALTER TABLE `user_profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_sub_menu`
--
ALTER TABLE `user_sub_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `vehicles`
--
ALTER TABLE `vehicles`
  MODIFY `vehicle_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `viscosity`
--
ALTER TABLE `viscosity`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
