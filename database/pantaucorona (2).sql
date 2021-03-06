-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 28 Mar 2020 pada 12.02
-- Versi server: 10.4.6-MariaDB
-- Versi PHP: 7.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pantaucorona`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `hak_akses`
--

CREATE TABLE `hak_akses` (
  `id_hak_akses` int(11) NOT NULL,
  `hak_akses` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `hak_akses`
--

INSERT INTO `hak_akses` (`id_hak_akses`, `hak_akses`) VALUES
(1, 'superuser');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori_peta`
--

CREATE TABLE `kategori_peta` (
  `kp_id` int(11) NOT NULL,
  `kp_name` varchar(225) NOT NULL,
  `kp_icon` varchar(225) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kategori_peta`
--

INSERT INTO `kategori_peta` (`kp_id`, `kp_name`, `kp_icon`) VALUES
(1, 'ODP', NULL),
(2, 'PDP', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `peta_wilayah`
--

CREATE TABLE `peta_wilayah` (
  `id_peta` int(11) NOT NULL,
  `nama` varchar(225) DEFAULT NULL,
  `jenkel` enum('L','P') DEFAULT NULL,
  `lokasi` text DEFAULT NULL,
  `lon` varchar(225) NOT NULL,
  `lat` varchar(225) NOT NULL,
  `usia` varchar(5) DEFAULT NULL,
  `kp_name` varchar(225) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `peta_wilayah`
--

INSERT INTO `peta_wilayah` (`id_peta`, `nama`, `jenkel`, `lokasi`, `lon`, `lat`, `usia`, `kp_name`, `created_by`, `created_time`) VALUES
(1, 'ROGATE', 'L', 'Medan', '09209', '091209', '20', 'PDP', 1, '2020-03-28 18:00:45');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `username` varchar(225) NOT NULL,
  `email` varchar(225) NOT NULL,
  `password` varchar(225) NOT NULL,
  `alamat` varchar(225) NOT NULL,
  `no_telp` varchar(20) DEFAULT 'NULL',
  `id_hak_akses` int(11) NOT NULL,
  `created_time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`user_id`, `username`, `email`, `password`, `alamat`, `no_telp`, `id_hak_akses`, `created_time`) VALUES
(1, 'superadmin', 'superadmin@mail.com', '72d8f949d00e431239b993f14b70d80d5313efc9', 'Medan Sumatera Utara', 'NULL', 1, '2020-03-27 07:59:49');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `hak_akses`
--
ALTER TABLE `hak_akses`
  ADD PRIMARY KEY (`id_hak_akses`);

--
-- Indeks untuk tabel `kategori_peta`
--
ALTER TABLE `kategori_peta`
  ADD PRIMARY KEY (`kp_id`);

--
-- Indeks untuk tabel `peta_wilayah`
--
ALTER TABLE `peta_wilayah`
  ADD PRIMARY KEY (`id_peta`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `hak_akses` (`id_hak_akses`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `hak_akses`
--
ALTER TABLE `hak_akses`
  MODIFY `id_hak_akses` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `kategori_peta`
--
ALTER TABLE `kategori_peta`
  MODIFY `kp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `peta_wilayah`
--
ALTER TABLE `peta_wilayah`
  MODIFY `id_peta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `hak_akses` FOREIGN KEY (`id_hak_akses`) REFERENCES `hak_akses` (`id_hak_akses`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
