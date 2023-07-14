-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 19, 2021 at 09:14 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hrmproject`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `Date` date NOT NULL,
  `time out` time DEFAULT NULL,
  `time in` time DEFAULT NULL,
  `P_A` varchar(50) DEFAULT NULL,
  `DepartmentManager_id` int(10) NOT NULL,
  `employeeEmp_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`Date`, `time out`, `time in`, `P_A`, `DepartmentManager_id`, `employeeEmp_id`) VALUES
('2021-06-18', NULL, NULL, 'present', 5, 4),
('2021-06-18', NULL, NULL, 'present', 6, 5),
('2021-06-19', NULL, NULL, 'absent', 5, 4),
('2021-06-19', NULL, NULL, 'present', 6, 5),
('2021-06-20', NULL, NULL, 'absent', 5, 4),
('2021-06-20', NULL, NULL, 'absent', 6, 5);

-- --------------------------------------------------------

--
-- Table structure for table `comment_on`
--

CREATE TABLE `comment_on` (
  `DepartmentManager_id` int(10) NOT NULL,
  `ComplainId` int(10) NOT NULL,
  `comment` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `Representative_id` int(10) NOT NULL,
  `Name` varchar(40) NOT NULL,
  `Email` varchar(40) NOT NULL,
  `password` varchar(100) NOT NULL,
  `price` int(11) NOT NULL,
  `startdate` date NOT NULL,
  `expiredate` date NOT NULL,
  `credit_card` int(11) NOT NULL,
  `PackagePackage_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`Representative_id`, `Name`, `Email`, `password`, `price`, `startdate`, `expiredate`, `credit_card`, `PackagePackage_id`) VALUES
(3, 'Xyz', 'xyz@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 1000, '2021-06-01', '2022-06-30', 12345678, 1),
(4, 'abc', 'abc@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 1000, '2021-07-01', '2022-07-01', 1234567, 1);

-- --------------------------------------------------------

--
-- Table structure for table `complain`
--

CREATE TABLE `complain` (
  `Id` int(10) NOT NULL,
  `Description` varchar(200) NOT NULL,
  `date` datetime NOT NULL,
  `employeeEmp_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `complain`
--

INSERT INTO `complain` (`Id`, `Description`, `date`, `employeeEmp_id`) VALUES
(8, 'I have not got my salary yet.', '2021-06-17 15:23:52', 4),
(9, 'The manager named ****** is not fair to all.', '2021-06-18 14:33:39', 5),
(10, 'The manager named ****** is not fair to all.', '2021-06-18 23:16:50', 4);

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `Manager_id` int(10) NOT NULL,
  `Name` varchar(250) NOT NULL,
  `email` varchar(40) NOT NULL,
  `password` varchar(100) NOT NULL,
  `Dept_id` varchar(255) NOT NULL,
  `phone_no` int(15) DEFAULT NULL,
  `CompanyRepresentative_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`Manager_id`, `Name`, `email`, `password`, `Dept_id`, `phone_no`, `CompanyRepresentative_id`) VALUES
(5, 'Robert', 'robert@gamil.com', '81dc9bdb52d04dc20036dbd8313ed055', 'a1', 1987654321, 3),
(6, 'Sergio Ramos', 'ramos@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 'b1', 123465988, 3);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `Emp_id` int(10) NOT NULL,
  `Email` varchar(40) NOT NULL,
  `Name` varchar(40) NOT NULL,
  `Password` varchar(100) NOT NULL DEFAULT '1234',
  `Address` varchar(60) DEFAULT NULL,
  `Dept id` varchar(10) NOT NULL,
  `Phone no` int(15) DEFAULT NULL,
  `DepartmentManager_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`Emp_id`, `Email`, `Name`, `Password`, `Address`, `Dept id`, `Phone no`, `DepartmentManager_id`) VALUES
(4, 'kante@gmail.com', 'kante', '1234', 'Dhaka, Bangladesh', 'a1', 12345678, 5),
(5, 'clark@gmail.com', 'Clerk Jhon', '1234', 'Khulna, Bangladesh', 'a1', 51456464, 6);

-- --------------------------------------------------------

--
-- Table structure for table `emp_leave`
--

CREATE TABLE `emp_leave` (
  `Token` int(10) NOT NULL,
  `startdate` date NOT NULL,
  `enddate` date NOT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `stationleave` varchar(20) NOT NULL,
  `approval status` varchar(100) DEFAULT NULL,
  `employeeEmp_id` int(10) NOT NULL,
  `DepartmentManager_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `emp_leave`
--

INSERT INTO `emp_leave` (`Token`, `startdate`, `enddate`, `reason`, `stationleave`, `approval status`, `employeeEmp_id`, `DepartmentManager_id`) VALUES
(7, '2021-06-20', '2021-07-05', 'Corona positive', 'No', 'approved', 4, 5),
(8, '2021-06-20', '2021-06-28', 'Mother is sick', 'yes', 'approved', 5, 6);

-- --------------------------------------------------------

--
-- Table structure for table `notice`
--

CREATE TABLE `notice` (
  `id` varchar(7) NOT NULL,
  `time` datetime NOT NULL,
  `notice name` varchar(20) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `DepartmentManager_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `notice`
--

INSERT INTO `notice` (`id`, `time`, `notice name`, `Description`, `DepartmentManager_id`) VALUES
('n1', '2021-06-18 14:17:16', 'Holiday', 'Tomorrow the office will be closed', 5),
('n2', '2021-06-18 14:17:16', 'meeting', 'After 7 days there is an important meeting', 5),
('n7', '2021-06-18 14:31:04', 'meeting', 'Tomorrow we have be an important meeting', 6);

-- --------------------------------------------------------

--
-- Table structure for table `package`
--

CREATE TABLE `package` (
  `Package_id` int(10) NOT NULL,
  `Price` int(10) NOT NULL,
  `Features` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `package`
--

INSERT INTO `package` (`Package_id`, `Price`, `Features`) VALUES
(1, 1000, 'Employee info,leave,salary,attendance,reward etc for 1 year'),
(2, 500, 'Employee info,leave,salary,attendance,reward etc for 6 month'),
(3, 100, 'Employee info,leave,salary,attendance,reward etc for 1 month');

-- --------------------------------------------------------

--
-- Table structure for table `reward`
--

CREATE TABLE `reward` (
  `Title` varchar(10) NOT NULL,
  `description` varchar(50) DEFAULT NULL,
  `amount` double NOT NULL,
  `employeeEmp_id` int(10) NOT NULL,
  `DepartmentManager_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reward`
--

INSERT INTO `reward` (`Title`, `description`, `amount`, `employeeEmp_id`, `DepartmentManager_id`) VALUES
('R1', 'Rewarded for excellent performance', 500, 4, 5),
('R2', 'Rewarded for excellent performance', 700, 5, 6);

-- --------------------------------------------------------

--
-- Table structure for table `salary`
--

CREATE TABLE `salary` (
  `Job_scale` float NOT NULL,
  `total salary` float NOT NULL,
  `bonus` float DEFAULT NULL,
  `DepartmentManager_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `salary_employee`
--

CREATE TABLE `salary_employee` (
  `SalaryJob_scale` float NOT NULL,
  `employeeEmp_id` int(10) NOT NULL,
  `Receive_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `salary_employee`
--

INSERT INTO `salary_employee` (`SalaryJob_scale`, `employeeEmp_id`, `Receive_date`) VALUES
(20000.5, 5, '2021-06-09 15:21:38'),
(25000, 4, '2021-06-09 15:23:58'),
(25000, 5, '2021-07-09 15:21:38'),
(30000.5, 4, '2021-06-09 15:23:37');

-- --------------------------------------------------------

--
-- Table structure for table `training`
--

CREATE TABLE `training` (
  `start_date` date NOT NULL,
  `enddate` date NOT NULL,
  `description` varchar(100) NOT NULL,
  `institute` varchar(30) DEFAULT NULL,
  `employeeEmp_id` int(10) NOT NULL,
  `DepartmentManager_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `training`
--

INSERT INTO `training` (`start_date`, `enddate`, `description`, `institute`, `employeeEmp_id`, `DepartmentManager_id`) VALUES
('2021-06-25', '2021-07-15', 'training for new project', 'abc institute', 4, 5),
('2021-07-01', '2021-07-26', 'training for upcoming mega project', 'dfg institue', 5, 6);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD KEY `takes` (`DepartmentManager_id`),
  ADD KEY `FKattendance4398` (`employeeEmp_id`);

--
-- Indexes for table `comment_on`
--
ALTER TABLE `comment_on`
  ADD PRIMARY KEY (`DepartmentManager_id`,`ComplainId`),
  ADD KEY `FKComment on947424` (`DepartmentManager_id`),
  ADD KEY `FKComment on972352` (`ComplainId`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`Representative_id`),
  ADD UNIQUE KEY `Email` (`Email`),
  ADD KEY `FKCompany783905` (`PackagePackage_id`);

--
-- Indexes for table `complain`
--
ALTER TABLE `complain`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `FKComplain194098` (`employeeEmp_id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`Manager_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `FKDepartment845703` (`CompanyRepresentative_id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`Emp_id`),
  ADD UNIQUE KEY `Email` (`Email`),
  ADD KEY `FKemployee936976` (`DepartmentManager_id`);

--
-- Indexes for table `emp_leave`
--
ALTER TABLE `emp_leave`
  ADD PRIMARY KEY (`Token`),
  ADD KEY `Seeks` (`employeeEmp_id`),
  ADD KEY `approve` (`DepartmentManager_id`);

--
-- Indexes for table `notice`
--
ALTER TABLE `notice`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gives` (`DepartmentManager_id`);

--
-- Indexes for table `package`
--
ALTER TABLE `package`
  ADD PRIMARY KEY (`Package_id`);

--
-- Indexes for table `reward`
--
ALTER TABLE `reward`
  ADD PRIMARY KEY (`Title`,`employeeEmp_id`),
  ADD KEY `view` (`employeeEmp_id`),
  ADD KEY `give` (`DepartmentManager_id`);

--
-- Indexes for table `salary`
--
ALTER TABLE `salary`
  ADD KEY `FKSalary387582` (`DepartmentManager_id`);

--
-- Indexes for table `salary_employee`
--
ALTER TABLE `salary_employee`
  ADD PRIMARY KEY (`SalaryJob_scale`,`employeeEmp_id`),
  ADD KEY `FKSalary_emp750750` (`SalaryJob_scale`),
  ADD KEY `FKSalary_emp815835` (`employeeEmp_id`);

--
-- Indexes for table `training`
--
ALTER TABLE `training`
  ADD KEY `does` (`employeeEmp_id`),
  ADD KEY `FKTraining740694` (`DepartmentManager_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `Representative_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `complain`
--
ALTER TABLE `complain`
  MODIFY `Id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `Manager_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `Emp_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `emp_leave`
--
ALTER TABLE `emp_leave`
  MODIFY `Token` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
