-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 13 Jul 2022 pada 17.52
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tiket`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `kelas`
--

CREATE TABLE `kelas` (
  `idPembeli` char(5) NOT NULL,
  `kelas` varchar(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `kelas`
--

INSERT INTO `kelas` (`idPembeli`, `kelas`) VALUES
('P001', 'Ekonomi'),
('P002', 'Ekonomi'),
('P003', 'Ekonomi'),
('P004', 'Eksekutif'),
('P005', 'Eksekutif');

-- --------------------------------------------------------

--
-- Struktur dari tabel `laporan`
--

CREATE TABLE `laporan` (
  `idLaporan` char(5) NOT NULL,
  `idPembeli` char(5) DEFAULT NULL,
  `nama` varchar(20) DEFAULT NULL,
  `kursi` varchar(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `laporan`
--

INSERT INTO `laporan` (`idLaporan`, `idPembeli`, `nama`, `kursi`) VALUES
('L001', 'P001', 'Sigit Pramono', '1'),
('L002', 'P002', 'Nanda', '2'),
('L003', 'P003', 'Kiki', '3'),
('L004', 'P004', 'Loli', '4'),
('L005', 'P005', 'Alice', '5');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembeli`
--

CREATE TABLE `pembeli` (
  `idPembeli` char(5) NOT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `penumpang` varchar(6) DEFAULT NULL,
  `kelas` varchar(9) DEFAULT NULL,
  `namaPesawat` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pembeli`
--

INSERT INTO `pembeli` (`idPembeli`, `nama`, `penumpang`, `kelas`, `namaPesawat`) VALUES
('P001', 'Sigit Pramono', 'Dewasa', 'Ekonomi', 'Air Joman'),
('P002', 'Nanda', 'Dewasa', 'Ekonomi', 'Air Joman'),
('P003', 'Kiki', 'Dewasa', 'Ekonomi', 'Air Joman'),
('P004', 'Loli', 'Anak', 'Eksekutif', 'Matahari'),
('P005', 'Alice', 'Dewasa', 'Eksekutif', 'Matahari');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pesawat`
--

CREATE TABLE `pesawat` (
  `idPesawat` char(5) NOT NULL,
  `namaPesawat` varchar(20) DEFAULT NULL,
  `berangkat` datetime DEFAULT NULL,
  `tiba` datetime DEFAULT NULL,
  `dari` varchar(30) DEFAULT NULL,
  `ke` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pesawat`
--

INSERT INTO `pesawat` (`idPesawat`, `namaPesawat`, `berangkat`, `tiba`, `dari`, `ke`) VALUES
('P001', 'Air Joman', '2022-07-18 22:39:53', '2022-07-19 22:39:53', 'Aceh', 'Medan'),
('P002', 'Matahari', '2022-07-16 22:39:53', '2022-07-17 22:39:53', 'Sulawesi', 'Papua'),
('P003', 'Singaku', '2022-07-14 22:39:53', '2022-07-15 22:39:53', 'Jogja', 'Sulawesi'),
('P004', 'Bufalo', '2022-07-13 22:39:53', '2022-07-14 22:39:53', 'Jogja', 'Medan'),
('P005', 'Raina', '2022-07-12 22:39:53', '2022-07-13 22:39:53', 'Medan', 'Jogja');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tiket`
--

CREATE TABLE `tiket` (
  `idPembeli` char(5) NOT NULL,
  `noKursi` char(4) DEFAULT NULL,
  `idPesawat` char(5) DEFAULT NULL,
  `kelas` varchar(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tiket`
--

INSERT INTO `tiket` (`idPembeli`, `noKursi`, `idPesawat`, `kelas`) VALUES
('P001', '1', 'P001', 'Ekonomi'),
('P002', '2', 'P002', 'Ekonomi'),
('P003', '3', 'P003', 'Ekonomi'),
('P004', '4', 'P004', 'Eksekutif'),
('P005', '5', 'P005', 'Eksekutif');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`idPembeli`);

--
-- Indeks untuk tabel `laporan`
--
ALTER TABLE `laporan`
  ADD PRIMARY KEY (`idLaporan`),
  ADD KEY `idPembeli` (`idPembeli`);

--
-- Indeks untuk tabel `pembeli`
--
ALTER TABLE `pembeli`
  ADD PRIMARY KEY (`idPembeli`);

--
-- Indeks untuk tabel `pesawat`
--
ALTER TABLE `pesawat`
  ADD PRIMARY KEY (`idPesawat`);

--
-- Indeks untuk tabel `tiket`
--
ALTER TABLE `tiket`
  ADD PRIMARY KEY (`idPembeli`),
  ADD KEY `idPesawat` (`idPesawat`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `kelas`
--
ALTER TABLE `kelas`
  ADD CONSTRAINT `kelas_ibfk_1` FOREIGN KEY (`idPembeli`) REFERENCES `tiket` (`idPembeli`);

--
-- Ketidakleluasaan untuk tabel `laporan`
--
ALTER TABLE `laporan`
  ADD CONSTRAINT `laporan_ibfk_1` FOREIGN KEY (`idPembeli`) REFERENCES `tiket` (`idPembeli`);

--
-- Ketidakleluasaan untuk tabel `tiket`
--
ALTER TABLE `tiket`
  ADD CONSTRAINT `tiket_ibfk_1` FOREIGN KEY (`idPesawat`) REFERENCES `pesawat` (`idPesawat`),
  ADD CONSTRAINT `tiket_ibfk_2` FOREIGN KEY (`idPembeli`) REFERENCES `pembeli` (`idPembeli`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
