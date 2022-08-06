-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 27, 2022 at 01:03 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `medeciel`
--

-- --------------------------------------------------------

--
-- Table structure for table `medeciel_collaboration`
--

CREATE TABLE `medeciel_collaboration` (
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `email` varchar(60) NOT NULL,
  `telephone` int(16) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `medeciel_collaboration`
--

INSERT INTO `medeciel_collaboration` (`nom`, `prenom`, `email`, `telephone`, `description`) VALUES
('salim', 'ada', 'hello@gmail.com', 637034206, 'deuzsgydchziuerkds,'),
('ADAOUMOUM', 'Oussama', 'oussamaadm755@gmail.com', 637034206, 'salam bghit collaboration'),
('Adipisicing ex ut su', 'Quia ut ducimus fac', 'vehaciva@mailinator.com', 1, 'Elit do quibusdam s');

-- --------------------------------------------------------

--
-- Table structure for table `medeciel_login`
--

CREATE TABLE `medeciel_login` (
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `telephone` int(16) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `medeciel_login`
--

INSERT INTO `medeciel_login` (`nom`, `prenom`, `email`, `telephone`, `password`) VALUES
('abraim', 'rachid', 'abraimrachid123@gmail.com', 611223344, 'azerty123'),
('LAZZAR', 'basma', 'basmalazaar@gmail.com', 622115544, 'azerty123'),
('ADAOUMOUM', 'Oussama', 'oussamaadm755@gmail.com', 637034206, 'azerty123'),
('aftys', 'Oussama', 'oussamaadm75@gmail.com', 637034206, '123456789'),
('ADAOUMOUM', 'Oussama', 'oussamaadm@gmail.com', 637034206, '123456'),
('aftys', 'Oussama', 'oussamaaftys@Gmail.com', 625440104, '123456789'),
('ahlan', 'salim', 'salimahlan@gmail.com', 61523569, 'azerty123');

-- --------------------------------------------------------

--
-- Table structure for table `medeciel_rendez_vous`
--

CREATE TABLE `medeciel_rendez_vous` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `medeciel_rendez_vous`
--

INSERT INTO `medeciel_rendez_vous` (`id`, `date`, `description`) VALUES
(1, '2022-06-25', 'hello i have a problem'),

--
-- Indexes for dumped tables
--

--
-- Indexes for table `medeciel_collaboration`
--
ALTER TABLE `medeciel_collaboration`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `medeciel_login`
--
ALTER TABLE `medeciel_login`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `medeciel_rendez_vous`
--
ALTER TABLE `medeciel_rendez_vous`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `medeciel_rendez_vous`
--
ALTER TABLE `medeciel_rendez_vous`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
