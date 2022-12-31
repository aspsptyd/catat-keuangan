-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 31, 2022 at 06:32 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_kelola_keuangan`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_data_pemasukan`
--

CREATE TABLE `tbl_data_pemasukan` (
  `id` int(11) NOT NULL,
  `kode_pemasukan` varchar(60) NOT NULL,
  `pemasukan` bigint(30) DEFAULT NULL,
  `deskripsi_pemasukan` text DEFAULT NULL,
  `sisa_pemasukan` bigint(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_data_pemasukan`
--

INSERT INTO `tbl_data_pemasukan` (`id`, `kode_pemasukan`, `pemasukan`, `deskripsi_pemasukan`, `sisa_pemasukan`) VALUES
(1, '29-12-2022-1', 5510000, 'Gaji PT. Global Pristya - Bulan Desember 2022', 5510000),
(2, '29-11-2022-1', 5500000, 'Gaji PT. Global Pristya - Bulan November 2022', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_data_pengeluaran`
--

CREATE TABLE `tbl_data_pengeluaran` (
  `id` int(11) NOT NULL,
  `kode_pengeluaran` varchar(60) NOT NULL,
  `jml_pengeluaran` bigint(30) DEFAULT NULL,
  `deskripsi_pengeluaran` text DEFAULT NULL,
  `kategori_pengeluaran` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_data_pengeluaran`
--

INSERT INTO `tbl_data_pengeluaran` (`id`, `kode_pengeluaran`, `jml_pengeluaran`, `deskripsi_pengeluaran`, `kategori_pengeluaran`) VALUES
(1, '30-12-2022-1150', 95000, 'Beras 5kg 55rb, Gula 1kg 13rb, Telur 1kg 27rb', 'Belanja Bulanan'),
(2, '30-12-2022-1158', 189000, 'Beras 5kg 60rb, Minyak Sayur 2lt 30rb, Kecap Manis 15rb, Sarimi Rebus 10bks 30rb, Teh Celup 2bks 10rb, Detergen 1.8kg 25rb, Sabun cp 12rb, Sikat gigi 3pcs 7rb', 'Belanja Bulanan'),
(3, '30-12-2022-1158', 467000, 'Susu dancow 4box 355rb, Sabun Sampo Farfum 51rb, Wafer Tango 2bks 10rb, Susu Tango 6btl 30rb, Ciki Piatos 3bks 21rb', 'Dede Aghnia'),
(4, '30-12-2022-1205', 30000, 'Kapsul daun katuk mami 3bks', 'Belanja Bulanan');

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_dashboard`
-- (See below for the actual view)
--
CREATE TABLE `view_dashboard` (
`jumlah_income_saatini` decimal(51,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_data_pemasukan`
-- (See below for the actual view)
--
CREATE TABLE `view_data_pemasukan` (
`kode_pemasukan` varchar(60)
,`deskripsi_pemasukan` text
,`pemasukan` bigint(30)
,`sisa_pemasukan` bigint(30)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_data_pengeluaran`
-- (See below for the actual view)
--
CREATE TABLE `view_data_pengeluaran` (
`kode_pengeluaran` varchar(60)
,`deskripsi_pengeluaran` text
,`kategori_pengeluaran` text
,`jml_pengeluaran` bigint(30)
);

-- --------------------------------------------------------

--
-- Structure for view `view_dashboard`
--
DROP TABLE IF EXISTS `view_dashboard`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_dashboard`  AS SELECT sum(`tbl_data_pemasukan`.`sisa_pemasukan`) AS `jumlah_income_saatini` FROM `tbl_data_pemasukan``tbl_data_pemasukan`  ;

-- --------------------------------------------------------

--
-- Structure for view `view_data_pemasukan`
--
DROP TABLE IF EXISTS `view_data_pemasukan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_data_pemasukan`  AS SELECT `tbl_data_pemasukan`.`kode_pemasukan` AS `kode_pemasukan`, `tbl_data_pemasukan`.`deskripsi_pemasukan` AS `deskripsi_pemasukan`, `tbl_data_pemasukan`.`pemasukan` AS `pemasukan`, `tbl_data_pemasukan`.`sisa_pemasukan` AS `sisa_pemasukan` FROM `tbl_data_pemasukan``tbl_data_pemasukan`  ;

-- --------------------------------------------------------

--
-- Structure for view `view_data_pengeluaran`
--
DROP TABLE IF EXISTS `view_data_pengeluaran`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_data_pengeluaran`  AS SELECT `tbl_data_pengeluaran`.`kode_pengeluaran` AS `kode_pengeluaran`, `tbl_data_pengeluaran`.`deskripsi_pengeluaran` AS `deskripsi_pengeluaran`, `tbl_data_pengeluaran`.`kategori_pengeluaran` AS `kategori_pengeluaran`, `tbl_data_pengeluaran`.`jml_pengeluaran` AS `jml_pengeluaran` FROM `tbl_data_pengeluaran``tbl_data_pengeluaran`  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_data_pemasukan`
--
ALTER TABLE `tbl_data_pemasukan`
  ADD PRIMARY KEY (`id`,`kode_pemasukan`);

--
-- Indexes for table `tbl_data_pengeluaran`
--
ALTER TABLE `tbl_data_pengeluaran`
  ADD PRIMARY KEY (`id`,`kode_pengeluaran`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_data_pemasukan`
--
ALTER TABLE `tbl_data_pemasukan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_data_pengeluaran`
--
ALTER TABLE `tbl_data_pengeluaran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
