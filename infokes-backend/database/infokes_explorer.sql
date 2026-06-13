-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 13 Jun 2026 pada 09.16
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `infokes_explorer`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `files`
--

CREATE TABLE `files` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `size` varchar(50) DEFAULT NULL,
  `folder_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `files`
--

INSERT INTO `files` (`id`, `name`, `type`, `size`, `folder_id`, `created_at`) VALUES
(1, 'CV_Rian_Hidayat_Frontend.pdf', 'PDF Document', '1.5 MB', 5, '2026-06-01 02:00:00'),
(2, 'Cover_Letter_Infokes.docx', 'Word Document', '25 KB', 5, '2026-06-05 07:30:00'),
(3, 'VSCode_Installer.exe', 'Executable', '85 MB', 6, '2026-04-10 06:30:00'),
(4, 'Bun_Setup.zip', 'ZIP Archive', '40 MB', 6, '2026-04-11 03:00:00'),
(5, 'bento_zen_grid_layout.fig', 'Figma Design', '15 MB', 7, '2026-06-12 09:45:00'),
(6, 'glassmorphism_bg.png', 'PNG Image', '3.2 MB', 7, '2026-06-12 10:00:00'),
(7, 'admin_dashboard_module.vue', 'Vue Component', '12 KB', 8, '2026-04-15 03:20:00'),
(8, 'database_schema_jtc.pdf', 'PDF Document', '2.4 MB', 8, '2026-04-10 04:00:00'),
(9, 'App.vue', 'Vue Component', '8 KB', 9, '2026-06-13 03:00:00'),
(10, 'folderService.ts', 'TypeScript File', '4 KB', 9, '2026-06-13 04:15:00'),
(11, 'Kanji_N5_to_N1_Flashcards.pdf', 'PDF Document', '8.5 MB', 10, '2026-03-20 01:00:00'),
(12, 'bunpou_notes.txt', 'Plain Text', '120 KB', 10, '2026-05-15 12:30:00'),
(13, 'hiragana_chart.jpg', 'JPEG Image', '1.1 MB', 10, '2026-03-10 13:00:00'),
(14, 'listening_practice_N4.mp4', 'MP4 Video', '45 MB', 10, '2026-04-20 14:00:00'),
(15, 'main.ts', 'TypeScript File', '2 KB', 11, '2026-06-13 05:05:00'),
(16, 'router.ts', 'TypeScript File', '3 KB', 11, '2026-06-13 05:06:00'),
(17, 'FolderItem.vue', 'Vue Component', '5 KB', 12, '2026-06-13 05:12:00'),
(18, 'Breadcrumb.vue', 'Vue Component', '2 KB', 12, '2026-06-13 05:13:00'),
(19, 'Button.vue', 'Vue Component', '1 KB', 14, '2026-06-13 05:25:00'),
(20, 'Tooltip.vue', 'Vue Component', '1.5 KB', 14, '2026-06-13 05:26:00'),
(21, 'explorer.css', 'CSS Style', '4 KB', 13, '2026-06-13 05:16:00'),
(22, 'Technical_Test_Guidelines.pdf', 'PDF Document', '1.2 MB', 16, '2026-06-10 02:15:00'),
(23, 'Infokes_Offer_Letter.pdf', 'PDF Document', '500 KB', 16, '2026-06-12 03:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `folders`
--

CREATE TABLE `folders` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `folders`
--

INSERT INTO `folders` (`id`, `name`, `parent_id`, `created_at`) VALUES
(1, 'Documents', NULL, '2026-01-01 01:00:00'),
(2, 'Downloads', NULL, '2026-01-05 02:00:00'),
(3, 'Projects', NULL, '2026-02-01 03:00:00'),
(4, 'Personal', NULL, '2026-03-01 04:00:00'),
(5, 'Job Applications', 1, '2026-06-01 01:00:00'),
(6, 'Software', 2, '2026-04-10 06:00:00'),
(7, 'Design Assets', 2, '2026-04-12 07:00:00'),
(8, 'JTC Portal', 3, '2026-04-01 01:30:00'),
(9, 'Infokes Explorer', 3, '2026-06-10 02:00:00'),
(10, 'Japanese Study', 4, '2026-03-05 12:00:00'),
(11, 'src', 9, '2026-06-13 05:00:00'),
(12, 'components', 11, '2026-06-13 05:10:00'),
(13, 'assets', 11, '2026-06-13 05:15:00'),
(14, 'ui', 12, '2026-06-13 05:20:00'),
(15, '2026 Archive', 5, '2026-06-05 03:00:00'),
(16, 'Infokes Process', 15, '2026-06-10 02:00:00'),
(17, 'Gallery', NULL, '2026-03-01 04:01:00');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `folder_id` (`folder_id`);

--
-- Indeks untuk tabel `folders`
--
ALTER TABLE `folders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `files`
--
ALTER TABLE `files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT untuk tabel `folders`
--
ALTER TABLE `folders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `files`
--
ALTER TABLE `files`
  ADD CONSTRAINT `files_ibfk_1` FOREIGN KEY (`folder_id`) REFERENCES `folders` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `folders`
--
ALTER TABLE `folders`
  ADD CONSTRAINT `folders_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `folders` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
