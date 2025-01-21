-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 21 Jan 2025 pada 04.48
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_latihan14`
--

DELIMITER $$
--
-- Prosedur
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_datatable` (IN `id` INT(11), IN `jml` INT(11))  DETERMINISTIC COMMENT 'First SP at Expertdeveloper' BEGIN

DECLARE exit handler for sqlexception
BEGIN
-- ERROR
ROLLBACK;
END;

DECLARE exit handler for sqlwarning
BEGIN
-- WARNING
ROLLBACK;
END;

START TRANSACTION;
UPDATE tabel_1 SET jumlah=jumlah-jml WHERE kode=id;
UPDATE tabel_2 SET jumlah=jumlah+jml WHERE kode=id;

COMMIT;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tabel_1`
--

CREATE TABLE `tabel_1` (
  `kode` int(11) NOT NULL,
  `nama_barang` varchar(30) NOT NULL,
  `jumlah` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tabel_1`
--

INSERT INTO `tabel_1` (`kode`, `nama_barang`, `jumlah`) VALUES
(1001, 'Buku', 50),
(1002, 'Pulpen', 12);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tabel_2`
--

CREATE TABLE `tabel_2` (
  `kode` int(11) NOT NULL,
  `nama_barang` varchar(30) NOT NULL,
  `jumlah` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tabel_2`
--

INSERT INTO `tabel_2` (`kode`, `nama_barang`, `jumlah`) VALUES
(1001, 'Buku', 50),
(1002, 'Pulpen', 38);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tabel_1`
--
ALTER TABLE `tabel_1`
  ADD PRIMARY KEY (`kode`);

--
-- Indeks untuk tabel `tabel_2`
--
ALTER TABLE `tabel_2`
  ADD PRIMARY KEY (`kode`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
