-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 01, 2023 at 08:01 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_catat_keuangan`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_data_pemasukan`
--

CREATE TABLE `tbl_data_pemasukan` (
  `id` int(11) NOT NULL,
  `kode_pemasukan` varchar(60) NOT NULL,
  `pemasukan` bigint(20) DEFAULT NULL,
  `deskripsi_pemasukan` text DEFAULT NULL,
  `sisa_pemasukan` bigint(20) DEFAULT NULL
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
  `jml_pengeluaran` bigint(20) DEFAULT NULL,
  `status_pengeluaran` text DEFAULT NULL,
  `deskripsi_pengeluaran` text DEFAULT NULL,
  `kategori_pengeluaran` text DEFAULT NULL,
  `kode_pemasukan` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_data_pengeluaran`
--

INSERT INTO `tbl_data_pengeluaran` (`id`, `kode_pengeluaran`, `jml_pengeluaran`, `status_pengeluaran`, `deskripsi_pengeluaran`, `kategori_pengeluaran`, `kode_pemasukan`) VALUES
(1, '30-12-2022-1150', 95000, 'Cancel', 'Beras 5kg 55rb, Gula 1kg 13rb, Telur 1kg 27rb', 'Belanja Bulanan', '29-12-2022-1'),
(2, '30-12-2022-1158', 189000, 'Done', 'Beras 5kg 60rb, Minyak Sayur 2lt 30rb, Kecap Manis 15rb, Sarimi Rebus 10bks 30rb, Teh Celup 2bks 10rb, Detergen 1.8kg 25rb, Sabun cp 12rb, Sikat gigi 3pcs 7rb', 'Belanja Bulanan', '29-12-2022-1'),
(3, '30-12-2022-1145', 467000, 'Done', 'Susu dancow 4box 355rb, Sabun Sampo Farfum 51rb, Wafer Tango 2bks 10rb, Susu Tango 6btl 30rb, Ciki Piatos 3bks 21rb', 'Dede Aghnia', '29-12-2022-1'),
(4, '30-12-2022-1205', 30000, 'Done', 'Kapsul daun katuk mami 3bks', 'Belanja Bulanan', '29-12-2022-1'),
(5, '31-12-2022-0909', 37000, 'Done', 'Telor 1kg 30rb, Tepung Aci 7rb', 'Belanja Bulanan', '29-12-2022-1'),
(6, '31-12-2022-0918', 50000, 'Done', 'Kue Pukis 2bks 20rb, Bakso 10rb, Jagung 2kg 20rb', 'Dana Darurat', '29-12-2022-1'),
(7, '31-12-2022-0918', 16000, 'Done', 'Es Krim 2pcs 6rb, Gulali 10rb', 'Dede Aghnia', '29-12-2022-1'),
(8, '31-12-2022-0919', 23000, 'Done', 'Sabun Muka Garnier 23rb', 'Belanja Bulanan', '29-12-2022-1'),
(9, '31-12-2022-0921', 92000, 'Done', 'Jajan Warung 10rb, Roti Croffle 48rb, Jus 29rb, Parkir Mall GPP 5rb', 'Dana Darurat', '29-12-2022-1'),
(10, '01-01-2023-1430', 31400, 'Done', 'Pocari & Masker', 'Sedekah', '29-12-2022-1'),
(11, '01-01-2023-1435', 25000, 'Done', 'Rambutan', 'Sedekah', '29-12-2022-1'),
(12, '01-01-2023-1440', 19000, 'Done', 'Nasi Kuning 2bks 14rb dan Gorengan 3 5rb', 'Sedekah', '29-12-2022-1'),
(13, '01-01-2023-1445', 70500, 'Done', 'Belanja di Alfa Buat di Rumah Rengas Bandung', 'Bensin Abi', '29-12-2022-1'),
(14, '01-01-2023-1450', 18000, 'Done', 'Mi Ayam Pake Bakso', 'Bensin Abi', '29-12-2022-1'),
(15, '01-01-2023-1455', 12000, 'Done', 'Isi Bensin Motor', 'Bensin Abi', '29-12-2022-1'),
(16, '01-01-2023-1500', 24100, 'Done', 'Bakso Urat', 'Bensin Abi', '29-12-2022-1'),
(17, '01-01-2023-1505', 5000, 'Done', 'Gorengan Sotong', 'Dede Aghnia', '29-12-2022-1'),
(18, '02-01-2023-2018', 56000, 'Done', 'Belanja Sayur', 'Belanja Week 1', '29-12-2022-1'),
(19, '02-01-2023-1920', 20000, 'Done', 'Sedekah di Masjid', 'Tagihan', '29-12-2022-1'),
(20, '02-01-2023-1925', 92000, 'Done', 'Konsul Bidan 35rb, Cek HB 30rb, Jus 20rb, Es Krim 5rb, Parkir Klinik 2rb', 'Makanan', '29-12-2022-1'),
(21, '02-01-2023-1613', 91000, 'Done', 'Pempers 2 Ball', 'Dede Aghnia', '29-12-2022-1'),
(22, '02-01-2023-1621', 433000, 'Done', 'Cicilan Meja Tv ke 2', 'Tagihan', '29-12-2022-1'),
(23, '02-01-2023-1625', 589000, 'Done', 'Cicilan Tv ke 2', 'Tagihan', '29-12-2022-1'),
(24, '02-01-2023-1639', 850000, 'Done', 'Kontrakan Januari', 'Tagihan', '29-12-2022-1'),
(25, '02-01-2023-1625', 18000, 'Done', 'Tempe, Kerupuk, Daun Bawang', 'Belanja Week 1', '29-12-2022-1'),
(26, '02-01-2023-1635', 39500, 'Done', 'Roti Tawar, Roti Sandwich 2, Seres 1', 'Dede Aghnia', '29-12-2022-1');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_data_user`
--

CREATE TABLE `tbl_data_user` (
  `id` int(11) NOT NULL,
  `id_user` varchar(60) NOT NULL,
  `username` text DEFAULT NULL,
  `userkey` text DEFAULT NULL,
  `lisensi_user` text DEFAULT NULL,
  `auth_access` text DEFAULT NULL,
  `tanggal_register` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_data_user`
--

INSERT INTO `tbl_data_user` (`id`, `id_user`, `username`, `userkey`, `lisensi_user`, `auth_access`, `tanggal_register`) VALUES
(1, '03012023-110359', 'dev', 'e77989ed21758e78331b20e477fc5582', '2423098432-298349234-293842398-923', 'afe36ef800224f8cc4b11a76aae6b55a', '03 Januari 2023');

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
-- Indexes for table `tbl_data_user`
--
ALTER TABLE `tbl_data_user`
  ADD PRIMARY KEY (`id`,`id_user`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `tbl_data_user`
--
ALTER TABLE `tbl_data_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
