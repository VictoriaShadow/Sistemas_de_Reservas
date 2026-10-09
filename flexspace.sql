-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 09, 2026 at 02:38 AM
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
-- Database: `flexspace`
--

-- --------------------------------------------------------

--
-- Table structure for table `cliente`
--

CREATE TABLE `cliente` (
  `Id` int(11) NOT NULL,
  `Nombre` varchar(25) NOT NULL,
  `Email` varchar(125) NOT NULL,
  `TipoCliente` varchar(10) NOT NULL,
  `SancionesActivas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cliente`
--

INSERT INTO `cliente` (`Id`, `Nombre`, `Email`, `TipoCliente`, `SancionesActivas`) VALUES
(1, 'Maria Lopez', 'lopezzz@gmail.com', 'VIP', 0),
(2, 'Juan Perez', 'juanperez@gmail.com', 'Estandar', 0),
(3, 'Carlos Gomez', 'gomezcarlo34@gmail.com', 'Estandar', 1),
(4, 'Pedro Martinez', 'pedrom@gmail.com', 'VIP', 3),
(5, 'Lucia Fernandez', 'miauchifer@gmail.com', 'VIP', 2),
(6, 'Sofia Ramirez', 'sofitay@gmail.com', 'VIP', 4);

-- --------------------------------------------------------

--
-- Table structure for table `puesto`
--

CREATE TABLE `puesto` (
  `Id` int(11) NOT NULL,
  `Codigo` varchar(5) NOT NULL,
  `TipoPuesto` varchar(21) NOT NULL,
  `TarifaBaseXHora` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `puesto`
--

INSERT INTO `puesto` (`Id`, `Codigo`, `TipoPuesto`, `TarifaBaseXHora`) VALUES
(1, 'P001', 'Escritorio Individual', 2000),
(2, 'P002', 'Escritorio Individual', 2500),
(3, 'P003', 'Sala Reuniones', 6000),
(4, 'P004', 'Sala Reuniones', 8000),
(5, 'P005', 'Cabina Privada', 4000),
(6, 'P006', 'Cabina Privada', 5000);

-- --------------------------------------------------------

--
-- Table structure for table `reserva`
--

CREATE TABLE `reserva` (
  `Id` int(11) NOT NULL,
  `ClienteId` int(11) NOT NULL,
  `PuestoId` int(11) NOT NULL,
  `FechaInicio` datetime NOT NULL,
  `FechaFin` datetime NOT NULL,
  `Estado` varchar(12) NOT NULL,
  `CostoTotal` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reserva`
--

INSERT INTO `reserva` (`Id`, `ClienteId`, `PuestoId`, `FechaInicio`, `FechaFin`, `Estado`, `CostoTotal`) VALUES
(1, 1, 3, '2026-10-09 18:50:00', '2026-10-09 20:00:00', 'Cancelada', 6650),
(2, 5, 1, '2026-10-08 21:02:00', '2026-10-08 22:10:00', 'Confirmada', 2720),
(3, 1, 1, '2026-10-22 20:30:00', '2026-10-22 22:30:00', 'Confirmada', 3800);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `puesto`
--
ALTER TABLE `puesto`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `reserva`
--
ALTER TABLE `reserva`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `ClienteId` (`ClienteId`),
  ADD KEY `PuestoId` (`PuestoId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cliente`
--
ALTER TABLE `cliente`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `puesto`
--
ALTER TABLE `puesto`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `reserva`
--
ALTER TABLE `reserva`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `reserva`
--
ALTER TABLE `reserva`
  ADD CONSTRAINT `reserva_ibfk_1` FOREIGN KEY (`ClienteId`) REFERENCES `cliente` (`Id`),
  ADD CONSTRAINT `reserva_ibfk_2` FOREIGN KEY (`PuestoId`) REFERENCES `puesto` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
