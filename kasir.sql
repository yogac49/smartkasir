-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 27 Jul 2021 pada 14.57
-- Versi server: 10.4.14-MariaDB
-- Versi PHP: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kasir`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang`
--

CREATE TABLE `barang` (
  `Kode_Barang` varchar(10) NOT NULL,
  `Nama_Barang` text NOT NULL,
  `Stok` int(11) NOT NULL,
  `Satuan` text NOT NULL,
  `Harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `barang`
--

INSERT INTO `barang` (`Kode_Barang`, `Nama_Barang`, `Stok`, `Satuan`, `Harga`) VALUES
('01283', 'Beras cap Sawi', 80, 'Sak', 260000),
('0199223', 'Pepsodent', 73, 'pcs', 22000),
('01992322', 'Surya 12', 95, 'pcs', 197000),
('01992357', 'ZINC', 64, 'pcs', 22000),
('0387232', 'Kapal api', 97, 'pcs', 28000),
('76237887', 'korek', 195, 'pcs', 12000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_barang`
--

CREATE TABLE `detail_barang` (
  `Kode_Detail` varchar(10) NOT NULL,
  `Kode_Barang` varchar(10) NOT NULL,
  `Harga` int(11) NOT NULL,
  `Jumlah` int(11) NOT NULL,
  `Discount` int(11) NOT NULL,
  `Subtotal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `detail_barang`
--

INSERT INTO `detail_barang` (`Kode_Detail`, `Kode_Barang`, `Harga`, `Jumlah`, `Discount`, `Subtotal`) VALUES
('DTRX001', 'CA001', 20000, 1, 0, 20000),
('DTRX002', 'CA001', 20000, 2, 1000, 39000),
('DTRX003', 'B002', 2000, 2, 0, 4000),
('DTRX003', 'CA001', 20000, 1, 500, 19500),
('DTRX004', 'B012', 48000, 2, 2500, 93500),
('DTRX004', 'B001', 24000, 1, 0, 24000),
('DTRX004', 'B002', 2000, 1, 0, 2000),
('DTRX005', 'B001', 24000, 2, 0, 48000),
('DTRX005', 'B002', 2000, 2, 0, 4000),
('DTRX006', 'B002', 2000, 2, 0, 4000),
('DTRX007', 'B012', 48000, 2, 0, 96000),
('DKDBRG008', '2312', 12222, 3, 0, 36666),
('DKDBRG008', '2312', 12222, 4, 0, 48888),
('DKD009', '018', 12000, 4, 0, 48000),
('DKD009', '2312', 12222, 6, 0, 73332),
('DKD009', '2312', 12222, 10, 0, 122220),
('DKD010', '018', 12000, 5, 0, 60000),
('DKD011', '018', 12000, 2, 0, 24000),
('DKD012', '018', 12000, 2, 0, 24000),
('DKD013', '01992322', 197000, 5, 0, 985000),
('DKD013', '01992357', 22000, 6, 0, 132000),
('DKD013', '0199223', 22000, 7, 0, 154000),
('DKD014', '76237887', 12000, 5, 0, 60000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `login`
--

CREATE TABLE `login` (
  `Username` varchar(10) NOT NULL,
  `Password` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `login`
--

INSERT INTO `login` (`Username`, `Password`) VALUES
('admin', 'admin123'),
('karyawan', 'karyawan12');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `Kode_Transaksi` varchar(10) NOT NULL,
  `Kode_Detail` varchar(10) NOT NULL,
  `Tanggal` datetime NOT NULL,
  `Jam` time NOT NULL,
  `Total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `transaksi`
--

INSERT INTO `transaksi` (`Kode_Transaksi`, `Kode_Detail`, `Tanggal`, `Jam`, `Total`) VALUES
('KD009', 'DKD009', '2021-07-09 00:00:00', '20:47:01', 243552),
('KD010', 'DKD010', '2021-07-11 00:00:00', '21:03:35', 60000),
('KD011', 'DKD011', '2021-07-16 00:00:00', '00:28:23', 24000),
('KD012', 'DKD012', '2021-07-22 00:00:00', '18:56:06', 24000),
('KD013', 'DKD013', '2021-07-25 00:00:00', '22:12:02', 1271000),
('KD014', 'DKD014', '2021-07-26 00:00:00', '20:11:29', 60000),
('KDBRG008', 'DKDBRG008', '2021-07-09 00:00:00', '20:27:35', 48000);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`Kode_Barang`),
  ADD UNIQUE KEY `Nama_Barang` (`Nama_Barang`) USING HASH;

--
-- Indeks untuk tabel `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`Username`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`Kode_Transaksi`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
