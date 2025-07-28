-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 28, 2025 at 06:19 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `unindra`
--

-- --------------------------------------------------------

--
-- Table structure for table `absensi`
--

CREATE TABLE `absensi` (
  `id` int(11) NOT NULL,
  `mata_kuliah_id` int(11) NOT NULL,
  `mahasiswa_id` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `status` varchar(20) NOT NULL,
  `keterangan` text DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `absensi`
--

INSERT INTO `absensi` (`id`, `mata_kuliah_id`, `mahasiswa_id`, `tanggal`, `status`, `keterangan`, `created_at`) VALUES
(29, 20, 23, '2025-07-26', 'Hadir', '', '2025-07-28 10:57:25'),
(30, 20, 22, '2025-07-26', 'Izin', '', '2025-07-28 10:57:26'),
(31, 18, 23, '2025-07-25', 'Hadir', '', '2025-07-28 11:05:32'),
(32, 18, 22, '2025-07-25', 'Hadir', '', '2025-07-28 11:05:32'),
(33, 19, 23, '2025-07-26', 'Hadir', '', '2025-07-28 11:15:35'),
(34, 19, 22, '2025-07-26', 'Sakit', '', '2025-07-28 11:15:35'),
(35, 21, 23, '2025-07-26', 'Hadir', '', '2025-07-28 11:16:02'),
(36, 21, 22, '2025-07-26', 'Alpha', '', '2025-07-28 11:16:02');

-- --------------------------------------------------------

--
-- Table structure for table `admin_logs`
--

CREATE TABLE `admin_logs` (
  `id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `action` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

CREATE TABLE `articles` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `excerpt` text DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL,
  `status` varchar(20) DEFAULT 'published',
  `featured_image` varchar(255) DEFAULT NULL,
  `published_at` datetime DEFAULT current_timestamp(),
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `articles`
--

INSERT INTO `articles` (`id`, `title`, `content`, `excerpt`, `category`, `author_id`, `status`, `featured_image`, `published_at`, `created_at`, `updated_at`) VALUES
(2, 'Panduan Penggunaan Portal Akademik', 'Portal akademik Universitas Indraprasta PGRI dirancang dengan antarmuka yang user-friendly dan mudah diakses. Artikel ini akan memandu Anda dalam menggunakan berbagai fitur yang tersedia, mulai dari login hingga mengakses nilai dan jadwal perkuliahan.\r\n\r\nSetiap user memiliki dashboard yang disesuaikan dengan perannya masing-masing, baik sebagai mahasiswa, dosen, maupun admin.', 'Portal akademik Universitas Indraprasta PGRI dirancang dengan antarmuka yang user-friendly dan mudah diakses. Artikel ini akan memandu Anda dalam menggunakan berbagai fitur yang tersedia, mulai dari l...', 'Akademik', 1, 'published', 'article_1753620265.jpg', '2025-07-16 22:22:25', '2025-07-16 22:22:25', '2025-07-16 22:22:25'),
(3, 'Kebijakan Akademik Terbaru 2025', 'Universitas Indraprasta PGRI telah mengimplementasikan beberapa kebijakan akademik terbaru yang mulai berlaku pada tahun akademik 2025. Kebijakan ini mencakup sistem penilaian, absensi, dan berbagai prosedur akademik lainnya yang ditujukan untuk meningkatkan kualitas pendidikan.\r\n\r\nSemua civitas akademika diharapkan memahami dan mengikuti kebijakan-kebijakan yang telah ditetapkan.', 'Universitas Indraprasta PGRI telah mengimplementasikan beberapa kebijakan akademik terbaru yang mulai berlaku pada tahun akademik 2025. Kebijakan ini mencakup sistem penilaian, absensi, dan berbagai p...', 'Akademik', 1, 'published', 'article_1753620297.jpg', '2025-07-16 22:22:25', '2025-07-16 22:22:25', '2025-07-16 22:22:25'),
(4, 'Tips Sukses Kuliah Online', 'Menghadapi era digital, Universitas Indraprasta PGRI menyediakan berbagai tips dan strategi untuk mahasiswa agar dapat sukses dalam perkuliahan online. Artikel ini membahas tentang manajemen waktu, teknologi yang dibutuhkan, dan cara efektif mengikuti kuliah virtual.\r\n\r\nKuliah online memerlukan disiplin dan strategi khusus agar dapat mencapai hasil pembelajaran yang optimal.', 'Menghadapi era digital, Universitas Indraprasta PGRI menyediakan berbagai tips dan strategi untuk mahasiswa agar dapat sukses dalam perkuliahan online. Artikel ini membahas tentang manajemen waktu, te...', 'Pengumuman', 1, 'published', 'article_1753620322.jpg', '2025-07-16 22:22:25', '2025-07-16 22:22:25', '2025-07-16 22:22:25'),
(5, 'Prestasi Mahasiswa Universitas Indraprasta PGRI 2024', 'Mahasiswa Universitas Indraprasta PGRI kembali meraih berbagai prestasi gemilang di tingkat nasional dan internasional. Dari kompetisi programming, penelitian ilmiah, hingga inovasi teknologi, mahasiswa kami terus menunjukkan dedikasi dan kemampuan terbaik.\r\n\r\nPrestasi-prestasi ini membuktikan kualitas pendidikan dan pembinaan yang diberikan oleh Universitas Indraprasta PGRI.', 'Mahasiswa Universitas Indraprasta PGRI kembali meraih berbagai prestasi gemilang di tingkat nasional dan internasional. Dari kompetisi programming, penelitian ilmiah, hingga inovasi teknologi, mahasis...', 'Pengumuman', 1, 'published', 'article_1753620358.jpg', '2025-07-16 22:22:25', '2025-07-16 22:22:25', '2025-07-16 22:22:25'),
(6, 'Selamat Datang di Sistem Akademik Universitas Indraprasta PGRI', 'Sistem Akademik Universitas Indraprasta PGRI telah resmi diluncurkan dengan berbagai fitur terdepan untuk mendukung kegiatan akademik mahasiswa, dosen, dan staff administrasi. Sistem ini menyediakan platform terintegrasi untuk manajemen perkuliahan, nilai, absensi, dan berbagai layanan akademik lainnya.\r\n\r\nDengan teknologi terkini, kami berkomitmen memberikan pengalaman terbaik bagi seluruh civitas akademika dalam mengakses informasi dan layanan akademik.', 'Sistem Akademik Universitas Indraprasta PGRI telah resmi diluncurkan dengan berbagai fitur terdepan untuk mendukung kegiatan akademik mahasiswa, dosen, dan staff administrasi. Sistem ini menyediakan p...', 'Akademik', 1, 'published', 'article_1753619977.png', '2025-07-27 19:39:37', '2025-07-27 19:39:37', '2025-07-27 19:39:37');

-- --------------------------------------------------------

--
-- Table structure for table `berita_akademik`
--

CREATE TABLE `berita_akademik` (
  `id` int(11) NOT NULL,
  `judul` varchar(200) NOT NULL,
  `isi` text NOT NULL,
  `tanggal` date NOT NULL,
  `gambar` varchar(255) DEFAULT NULL,
  `ringkasan` text DEFAULT NULL,
  `penulis` varchar(100) DEFAULT NULL,
  `status` varchar(20) DEFAULT 'published',
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `berita_akademik`
--

INSERT INTO `berita_akademik` (`id`, `judul`, `isi`, `tanggal`, `gambar`, `ringkasan`, `penulis`, `status`, `created_at`) VALUES
(1, 'Universitas Indraprasta PGRI Raih Akreditasi Unggul', 'Universitas Indraprasta PGRI berhasil meraih status Akreditasi Unggul dari Badan Akreditasi Nasional Perguruan Tinggi (BAN-PT) untuk periode 2023-2028. Pencapaian ini merupakan hasil dari upaya seluruh civitas akademika dalam meningkatkan kualitas pendidikan tinggi.\r\n\r\nPenilaian akreditasi meliputi sembilan kriteria, termasuk visi misi, tata kelola, mahasiswa, sumber daya manusia, keuangan, pendidikan, penelitian, pengabdian kepada masyarakat, dan luaran-capaian. Universitas Indraprasta PGRI berhasil mendapatkan nilai sangat baik pada semua aspek tersebut.\r\n\r\nRektor Universitas Indraprasta PGRI, Prof. Dr. Ahmad Fauzi, menyampaikan apresiasi kepada seluruh pihak yang telah berkontribusi dalam pencapaian ini. \"Akreditasi Unggul ini menjadi bukti komitmen kami dalam memberikan pendidikan tinggi berkualitas,\" ujarnya.', '2023-07-05', 'akreditasi.jpg', 'Universitas Indraprasta PGRI berhasil meraih status Akreditasi Unggul dari Badan Akreditasi Nasional Perguruan Tinggi (BAN-PT) untuk periode 2023-2028.', 'Tim Humas Unindra', 'published', '2025-07-16 22:22:25'),
(2, 'Program Beasiswa Baru untuk Mahasiswa Berprestasi', 'Universitas Indraprasta PGRI bekerja sama dengan lima perusahaan teknologi terkemuka meluncurkan program beasiswa baru untuk mahasiswa berprestasi di bidang teknologi dan sains. Program beasiswa ini akan mencakup biaya kuliah penuh dan tunjangan bulanan selama masa studi.\r\n\r\nProgram ini terbuka untuk mahasiswa dari Fakultas Teknik, Fakultas Ilmu Komputer, dan Fakultas Sains dengan IPK minimal 3.50. Selain prestasi akademik, seleksi juga akan mempertimbangkan portfolio proyek dan keterlibatan dalam kegiatan pengembangan teknologi.\r\n\r\n\"Kami ingin mendukung talenta-talenta terbaik untuk berkembang tanpa terkendala masalah finansial,\" kata Dr. Siti Rahma, Wakil Rektor Bidang Kemahasiswaan.\r\n\r\nPendaftaran program beasiswa akan dibuka pada 1 Agustus 2023 dan berakhir pada 30 Agustus 2023.', '2023-06-28', 'beasiswa.jpg', 'Universitas Indraprasta PGRI bekerja sama dengan industri terkemuka meluncurkan program beasiswa baru untuk mahasiswa berprestasi di bidang teknologi dan sains.', 'Departemen Beasiswa', 'published', '2025-07-16 22:22:25'),
(3, 'Tim Robotika Universitas Indraprasta PGRI Juara Nasional', 'Tim robotika Universitas Indraprasta PGRI berhasil meraih juara pertama dalam kompetisi robotika nasional yang diselenggarakan di Jakarta. Tim yang terdiri dari 5 mahasiswa Teknik Informatika ini berhasil mengalahkan 50 tim dari universitas terkemuka di Indonesia.\r\n\r\nKompetisi ini menguji kemampuan dalam merancang robot otonom yang dapat menyelesaikan berbagai tantangan. Prestasi ini merupakan yang ketiga kalinya Universitas Indraprasta PGRI meraih juara dalam kompetisi sejenis.', '2024-11-01', 'robotika.jpg', 'Tim robotika Universitas Indraprasta PGRI meraih juara pertama kompetisi robotika nasional', 'Tim Media Unindra', 'published', '2025-07-16 22:22:25'),
(4, 'Kerjasama Internasional dengan Universitas Jepang', 'Universitas Indraprasta PGRI menandatangani MoU dengan Tokyo Institute of Technology untuk program pertukaran mahasiswa dan dosen. Program ini akan memberikan kesempatan bagi mahasiswa terbaik untuk belajar di Jepang selama satu semester.\r\n\r\nSelain itu, akan ada program penelitian bersama di bidang teknologi dan engineering. Kerjasama ini diharapkan dapat meningkatkan kualitas pendidikan dan penelitian di Universitas Indraprasta PGRI.', '2024-10-28', 'kerjasama_jepang.jpg', 'Universitas Indraprasta PGRI menjalin kerjasama dengan Tokyo Institute of Technology', 'Humas Unindra', 'published', '2025-07-16 22:22:25'),
(5, 'Launching Program Studi Cybersecurity', 'Universitas Indraprasta PGRI resmi meluncurkan program studi baru yaitu Cybersecurity yang akan mulai menerima mahasiswa pada tahun akademik 2025/2026. Program studi ini dirancang untuk menjawab kebutuhan industri akan tenaga ahli keamanan siber.\r\n\r\nKurikulum disusun dengan melibatkan praktisi industri dan menggunakan laboratorium berstandard internasional.', '2024-11-05', 'cybersecurity.jpg', 'Program studi Cybersecurity resmi diluncurkan untuk tahun akademik 2025/2026', 'Bagian Akademik', 'published', '2025-07-16 22:22:25');

-- --------------------------------------------------------

--
-- Stand-in structure for view `dashboard_stats`
-- (See below for the actual view)
--
CREATE TABLE `dashboard_stats` (
`metric` varchar(21)
,`value` decimal(25,1)
,`unit` varchar(1)
,`description` varchar(39)
);

-- --------------------------------------------------------

--
-- Table structure for table `dosen`
--

CREATE TABLE `dosen` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `nidn` varchar(20) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `bidang_keahlian` varchar(50) DEFAULT NULL,
  `fakultas_id` int(11) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dosen`
--

INSERT INTO `dosen` (`id`, `user_id`, `nidn`, `nama`, `bidang_keahlian`, `fakultas_id`, `email`, `phone`, `alamat`, `created_at`) VALUES
(13, 35, '197208870132', 'Nandang Suwela M.Kom.', 'Software Engineer', 9, 'nandang@gmail.com', NULL, NULL, '2025-07-17 00:36:24'),
(14, 36, '197208901745', 'Kiki Ismanti S.E., M.Pd.', 'Wirausaha', 9, 'kikiismanti@gmail.com', NULL, NULL, '2025-07-17 00:38:56'),
(16, 38, '197208940611', 'Muhammad Akrom, M.Ag', 'Guru Agama Islam', 9, 'akrom@gmail.com', NULL, NULL, '2025-07-17 00:44:13'),
(18, 40, '197208920389', 'Noor Komari Pratiwi M.Pd.', 'Guru Bahasa Indonesia', 9, 'noor@gmail.com', NULL, NULL, '2025-07-17 00:49:19'),
(20, 48, 'dosen', 'dosen', 'demo', 9, 'dosen@gmail.com', NULL, NULL, '2025-07-18 23:19:47');

-- --------------------------------------------------------

--
-- Table structure for table `fakultas`
--

CREATE TABLE `fakultas` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `dekan` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fakultas`
--

INSERT INTO `fakultas` (`id`, `nama`, `dekan`, `created_at`) VALUES
(6, 'Fakultas Bahasa dan Seni (FBS)', 'Dr. Bambang Sumadyo', '2025-07-16 23:44:44'),
(7, 'Fakultas Matematika dan Ilmu Pengetahuan Alam (FMIPA)', 'Dr. Tatan Zenal Mutakin, M.Pd.', '2025-07-16 23:44:44'),
(8, 'Fakultas Ilmu Pendidikan dan Pengetahuan Sosial (FIPPS)', 'Dr. H. Taufik, M.Hum.', '2025-07-16 23:45:55'),
(9, 'Fakultas Teknik dan Ilmu Komputer (FTIK)', 'Ir. H. Soepardi Harris, MT.', '2025-07-16 23:50:32');

-- --------------------------------------------------------

--
-- Table structure for table `galeri`
--

CREATE TABLE `galeri` (
  `id` int(11) NOT NULL,
  `judul` varchar(100) DEFAULT NULL,
  `gambar` varchar(255) NOT NULL,
  `deskripsi` text DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jadwal`
--

CREATE TABLE `jadwal` (
  `id` int(11) NOT NULL,
  `mata_kuliah_id` int(11) NOT NULL,
  `hari` varchar(10) NOT NULL,
  `jam_mulai` time NOT NULL,
  `jam_selesai` time NOT NULL,
  `ruang` varchar(50) NOT NULL,
  `kelas` varchar(10) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jadwal`
--

INSERT INTO `jadwal` (`id`, `mata_kuliah_id`, `hari`, `jam_mulai`, `jam_selesai`, `ruang`, `kelas`, `created_at`) VALUES
(18, 18, 'Jumat', '18:30:00', '21:00:00', 'Ruang 201', 'TI-5B', '2025-07-17 01:02:41'),
(19, 19, 'Sabtu', '07:30:00', '09:10:00', 'Ruang 201', 'TI-5B', '2025-07-17 01:03:01'),
(20, 20, 'Sabtu', '10:00:00', '11:40:00', 'Ruang 201', 'TI-5B', '2025-07-17 01:03:21'),
(21, 21, 'Sabtu', '12:30:00', '14:10:00', 'Ruang 201', 'TI-5B', '2025-07-17 01:03:56');

-- --------------------------------------------------------

--
-- Table structure for table `kalender_akademik`
--

CREATE TABLE `kalender_akademik` (
  `id` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `judul` varchar(200) NOT NULL,
  `deskripsi` text DEFAULT NULL,
  `kategori` varchar(20) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kalender_akademik`
--

INSERT INTO `kalender_akademik` (`id`, `tanggal`, `judul`, `deskripsi`, `kategori`, `created_at`) VALUES
(1, '2024-08-01', 'Pendaftaran Mata Kuliah Semester Ganjil', 'Pendaftaran mata kuliah untuk mahasiswa angkatan 2024-2025 melalui portal akademik.', 'pendaftaran', '2025-07-16 22:22:25'),
(2, '2024-08-20', 'Orientasi Mahasiswa Baru', 'Pengenalan lingkungan kampus dan sistem akademik untuk mahasiswa baru angkatan 2024.', 'perkuliahan', '2025-07-16 22:22:25'),
(3, '2024-08-28', 'Awal Perkuliahan Semester Ganjil', 'Perkuliahan dimulai untuk semua fakultas dan program studi, baik untuk kelas reguler, kelas sore, maupun non-reguler.', 'perkuliahan', '2025-07-16 22:22:25'),
(4, '2024-10-15', 'Ujian Tengah Semester', 'Periode ujian tengah semester untuk semua mata kuliah semester ganjil.', 'ujian', '2025-07-16 22:22:25'),
(5, '2024-12-15', 'Ujian Akhir Semester', 'Periode ujian akhir semester untuk semua mata kuliah semester ganjil.', 'ujian', '2025-07-16 22:22:25'),
(6, '2024-12-30', 'Batas Akhir Penyerahan Nilai', 'Batas waktu bagi dosen untuk menyerahkan nilai akhir mata kuliah semester ganjil.', 'lainnya', '2025-07-16 22:22:25'),
(7, '2025-01-10', 'Pengumuman Nilai Semester Ganjil', 'Pengumuman nilai semester ganjil dan penerbitan KHS untuk semua mahasiswa.', 'lainnya', '2025-07-16 22:22:25'),
(8, '2025-01-15', 'Pendaftaran Mata Kuliah Semester Genap', 'Pendaftaran mata kuliah semester genap untuk semua mahasiswa.', 'pendaftaran', '2025-07-16 22:22:25'),
(9, '2025-01-25', 'Wisuda Periode I', 'Wisuda periode pertama tahun akademik 2024/2025.', 'wisuda', '2025-07-16 22:22:25'),
(10, '2025-02-05', 'Awal Perkuliahan Semester Genap', 'Perkuliahan dimulai untuk semester genap tahun akademik 2024/2025.', 'perkuliahan', '2025-07-16 22:22:25'),
(11, '2025-11-20', 'MINI BOOTCAMP BATCH 1: ANDROID KOTLIN WITH BELAJAR BARENG COMMUNITY', 'Mini Bootcamp Batch 1: Android Kotlin per tanggal 23, 24, 25 Juni 2025 untuk civitas akademika Unindra. Pemateri: Hendro Purwoko M.Kom.', 'bootcamp', '2025-07-16 22:22:25'),
(12, '2025-11-25', 'TechFair 2025: Pameran Inovasi Teknologi Mahasiswa S1 TI Fakultas Teknik dan Ilmu Komputer', 'TechFair 2025 menjadi ajang bagi mahasiswa untuk memamerkan hasil proyek mereka, mulai dari Internet of Things (IoT) oleh angkatan 2022 hingga pengembangan website oleh angkatan 2024. Acara ini tidak hanya bertujuan untuk memamerkan karya, tetapi juga mendorong mahasiswa untuk terus berinovasi dan memperluas wawasan teknologi.', 'pameran', '2025-07-16 22:22:25'),
(13, '2025-12-01', 'Batas Akhir Pendaftaran Wisuda', 'Batas waktu pendaftaran untuk wisuda periode II', 'pendaftaran', '2025-07-16 22:22:25'),
(14, '2025-12-15', 'Wisuda Periode II', 'Upacara wisuda untuk lulusan periode II tahun 2024', 'wisuda', '2025-07-16 22:22:25'),
(15, '2026-01-08', 'Awal Semester Genap 2025/2026', 'Mulai perkuliahan semester genap', 'perkuliahan', '2025-07-16 22:22:25'),
(16, '2026-01-20', 'Batas Akhir Registrasi Ulang', 'Batas waktu registrasi ulang mahasiswa', 'registrasi', '2025-07-16 22:22:25'),
(17, '2026-12-15', 'Ujian Akhir Semester', 'Periode ujian akhir semester untuk semua mata kuliah semester ganjil.', 'ujian', '2025-07-16 22:22:25');

-- --------------------------------------------------------

--
-- Table structure for table `kelas`
--

CREATE TABLE `kelas` (
  `id` int(11) NOT NULL,
  `mata_kuliah_id` int(11) NOT NULL,
  `mahasiswa_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kelas`
--

INSERT INTO `kelas` (`id`, `mata_kuliah_id`, `mahasiswa_id`, `created_at`) VALUES
(51, 21, 22, '2025-07-19 00:06:03'),
(52, 19, 22, '2025-07-19 00:06:12'),
(53, 21, 23, '2025-07-27 20:54:43'),
(54, 19, 23, '2025-07-27 20:54:50'),
(55, 18, 23, '2025-07-27 20:54:58'),
(56, 20, 23, '2025-07-27 20:55:04'),
(57, 18, 22, '2025-07-28 10:56:10'),
(58, 20, 22, '2025-07-28 10:56:17');

-- --------------------------------------------------------

--
-- Table structure for table `kontak`
--

CREATE TABLE `kontak` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `pesan` text NOT NULL,
  `status` varchar(20) DEFAULT 'baru',
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `nim` varchar(20) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `program_studi_id` int(11) DEFAULT NULL,
  `semester` int(11) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `status` varchar(20) DEFAULT 'Aktif',
  `phone` varchar(20) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`id`, `user_id`, `nim`, `nama`, `program_studi_id`, `semester`, `email`, `status`, `phone`, `alamat`, `created_at`) VALUES
(22, 51, 'mahasiswa', 'password', 24, 6, 'mahasiswa@gmail.com', 'Aktif', NULL, NULL, '2025-07-18 23:59:09'),
(23, 52, '202243500497', 'Alfarobby', 24, 6, 'alfarobby@gmail.com', 'Aktif', NULL, NULL, '2025-07-27 20:43:44'),
(24, 53, '202243500501', 'Abdur Rosyid Fachriansyah', 24, 6, 'abdur@gmail.com', 'Aktif', NULL, NULL, '2025-07-27 20:44:29'),
(25, 54, '202243500500', 'Ahmad Badawi', 24, 6, 'badawi@gmail.com', 'Aktif', NULL, NULL, '2025-07-27 20:45:16');

-- --------------------------------------------------------

--
-- Table structure for table `mata_kuliah`
--

CREATE TABLE `mata_kuliah` (
  `id` int(11) NOT NULL,
  `kode_mk` varchar(10) NOT NULL,
  `nama_mk` varchar(100) NOT NULL,
  `sks` int(11) NOT NULL,
  `semester` int(11) NOT NULL,
  `deskripsi` text DEFAULT NULL,
  `dosen_id` int(11) NOT NULL,
  `program_studi_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mata_kuliah`
--

INSERT INTO `mata_kuliah` (`id`, `kode_mk`, `nama_mk`, `sks`, `semester`, `deskripsi`, `dosen_id`, `program_studi_id`, `created_at`, `updated_at`) VALUES
(18, 'KB43J643', 'Pemrograman Web Lanjut #)', 3, 6, NULL, 13, 24, '2025-07-17 00:46:20', '2025-07-17 00:46:20'),
(19, 'PB43J618', 'Aplikasi Kewirausahaan', 2, 6, NULL, 14, 24, '2025-07-17 00:47:17', '2025-07-17 00:47:17'),
(20, 'PK43J614', 'Penulisan Ilmiah', 2, 6, NULL, 18, 24, '2025-07-17 00:56:37', '2025-07-17 00:56:37'),
(21, 'PK43J617', 'Akhlak dan Etika', 2, 6, NULL, 16, 24, '2025-07-17 00:57:35', '2025-07-17 00:57:35');

-- --------------------------------------------------------

--
-- Table structure for table `nilai`
--

CREATE TABLE `nilai` (
  `id` int(11) NOT NULL,
  `mata_kuliah_id` int(11) NOT NULL,
  `mahasiswa_id` int(11) NOT NULL,
  `tugas1` decimal(5,2) DEFAULT NULL,
  `tugas2` decimal(5,2) DEFAULT NULL,
  `uts` decimal(5,2) DEFAULT NULL,
  `uas` decimal(5,2) DEFAULT NULL,
  `nilai_akhir` decimal(5,2) DEFAULT NULL,
  `grade` char(1) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `nilai`
--

INSERT INTO `nilai` (`id`, `mata_kuliah_id`, `mahasiswa_id`, `tugas1`, `tugas2`, `uts`, `uas`, `nilai_akhir`, `grade`, `created_at`, `updated_at`) VALUES
(16, 20, 23, 100.00, 100.00, 100.00, 100.00, 100.00, 'A', '2025-07-28 10:55:49', '2025-07-28 10:56:53'),
(18, 20, 22, 100.00, 50.00, 80.00, 100.00, 84.00, 'B', '2025-07-28 10:56:53', '2025-07-28 10:56:53'),
(19, 19, 23, 80.00, 30.00, 25.00, 70.00, 50.50, 'D', '2025-07-28 11:02:47', '2025-07-28 11:02:47'),
(20, 19, 22, 85.00, 35.00, 80.00, 100.00, 78.00, 'B', '2025-07-28 11:02:47', '2025-07-28 11:02:47'),
(21, 21, 23, 90.00, 80.00, 34.00, 100.00, 74.20, 'B', '2025-07-28 11:03:41', '2025-07-28 11:03:41'),
(22, 21, 22, 80.00, 85.00, 95.00, 100.00, 91.50, 'A', '2025-07-28 11:03:41', '2025-07-28 11:03:41'),
(23, 18, 23, 100.00, 80.00, 35.00, 89.00, 73.20, 'B', '2025-07-28 11:05:14', '2025-07-28 11:05:14'),
(24, 18, 22, 100.00, 90.00, 68.00, 85.00, 83.90, 'B', '2025-07-28 11:05:14', '2025-07-28 11:05:14');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `recipient_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `type` varchar(50) DEFAULT 'info',
  `is_read` tinyint(1) DEFAULT 0,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `recipient_id`, `title`, `message`, `type`, `is_read`, `created_at`) VALUES
(1, 1, 'Selamat Datang, Administrator!', 'Selamat datang di sistem akademik Universitas Indraprasta PGRI. Anda memiliki akses penuh untuk mengelola semua aspek sistem.', 'welcome', 0, '2025-07-16 22:22:25'),
(2, 1, 'Data Mahasiswa Diperbarui', 'Terdapat 5 data mahasiswa baru yang telah ditambahkan ke sistem.', 'info', 0, '2025-07-16 22:22:25'),
(3, 1, 'Laporan Mingguan Tersedia', 'Laporan aktivitas sistem minggu ini telah tersedia untuk diunduh.', 'report', 0, '2025-07-16 22:22:25');

-- --------------------------------------------------------

--
-- Table structure for table `pengumuman`
--

CREATE TABLE `pengumuman` (
  `id` int(11) NOT NULL,
  `judul` varchar(200) NOT NULL,
  `isi` text DEFAULT NULL,
  `tanggal` date NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pengumuman`
--

INSERT INTO `pengumuman` (`id`, `judul`, `isi`, `tanggal`, `created_at`) VALUES
(1, 'Jadwal Pendaftaran Semester Ganjil 2025/2026', 'Pendaftaran mata kuliah untuk semester ganjil tahun akademik 2025/2026 akan dibuka pada tanggal **1 Agustus 2025** dan ditutup pada tanggal **15 Agustus 2025**. Mahasiswa diharapkan berkonsultasi dengan dosen pembimbing akademik sebelum melakukan pendaftaran.\r\n\r\nProses pendaftaran dilakukan melalui portal akademik dengan menggunakan akun masing-masing.', '2023-07-15', '2025-07-16 22:22:25'),
(2, 'Pembayaran Uang Kuliah Semester Ganjil', 'Batas waktu pembayaran uang kuliah semester ganjil tahun akademik 2025/2026 adalah **25 Juli 2025**. Pembayaran dapat dilakukan melalui transfer bank atau langsung di bagian keuangan universitas.\r\n\r\nMahasiswa yang belum melakukan pembayaran hingga batas waktu yang ditentukan tidak dapat melakukan pendaftaran mata kuliah.', '2023-07-10', '2025-07-16 22:22:25'),
(3, 'Jadwal UAS Semester Genap 2024/2025', 'Ujian Akhir Semester (UAS) untuk semester genap tahun akademik 2024/2025 akan dilaksanakan pada tanggal 19-30 Juni 2025. Jadwal detil untuk setiap mata kuliah dapat dilihat pada portal akademik.\r\n\r\nMahasiswa diwajibkan hadir 30 menit sebelum ujian dimulai dan membawa kartu ujian.', '2023-06-05', '2025-07-16 22:22:25'),
(4, 'Libur Semester Genap 2024/2025', 'Libur semester genap tahun akademik 2024/2025 akan dimulai pada tanggal 1 Juli 2025 hingga 13 Agustus 2025. Selama masa libur, layanan administrasi kampus tetap buka dengan jam operasional khusus.\r\n\r\nSilahkan cek jadwal layanan pada website resmi atau media sosial Universitas Indraprasta PGRI.', '2023-06-20', '2025-07-16 22:22:25'),
(5, 'TechFair 2025: Pameran Inovasi Teknologi Mahasiswa S1 TI Fakultas Teknik dan Ilmu Komputer', 'Diinformasikan kepada seluruh mahasiswa bahwa terdapat perubahan jadwal TechFair 2025: Pameran Inovasi Teknologi Mahasiswa S1 TI Fakultas Teknik dan Ilmu Komputer. Jadwal yang semula pada 5-9 Juni 2025 diundur menjadi 12-16 Juni 2025.\r\n\r\nHarap mahasiswa memperhatikan perubahan jadwal ini.', '2025-06-01', '2025-07-16 22:22:25'),
(6, 'Pendaftaran Beasiswa Prestasi 2024', 'Dibuka pendaftaran beasiswa prestasi untuk mahasiswa dengan IPK minimal 3.5. Pendaftaran dibuka hingga 30 November 2024. Silahkan mengakses portal beasiswa untuk informasi lebih lanjut.', '2024-10-15', '2025-07-16 22:22:25'),
(7, 'Jadwal Wisuda Periode II 2024', 'Wisuda periode II tahun 2024 akan dilaksanakan pada tanggal 15 Desember 2024. Bagi mahasiswa yang akan wisuda mohon melengkapi persyaratan administrasi sebelum 1 Desember 2024.', '2024-11-01', '2025-07-16 22:22:25'),
(8, 'Pembaruan Sistem Portal Akademik', 'Portal akademik akan mengalami pembaruan sistem pada tanggal 20-21 November 2024. Selama periode tersebut, akses portal akan terbatas. Mohon maaf atas ketidaknyamanannya.', '2024-11-10', '2025-07-16 22:22:25'),
(9, 'MINI BOOTCAMP BATCH 1: ANDROID KOTLIN WITH BELAJAR BARENG COMMUNITY', 'Akan diadakan MINI BOOTCAMP BATCH 1: ANDROID KOTLIN WITH BELAJAR BARENG COMMUNITY pada tanggal 25 November 2024. Pendaftaran dibuka untuk civitas akademika Unindra. Tempat terbatas.', '2024-11-12', '2025-07-16 22:22:25');

-- --------------------------------------------------------

--
-- Table structure for table `program_studi`
--

CREATE TABLE `program_studi` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `fakultas_id` int(11) DEFAULT NULL,
  `kaprodi` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `program_studi`
--

INSERT INTO `program_studi` (`id`, `nama`, `fakultas_id`, `kaprodi`, `created_at`) VALUES
(11, 'Pendidikan Bahasa Inggris', 6, ' Dr. Ira Miranti, SS., M.Hum.', '2025-07-16 23:54:03'),
(12, 'Pendidikan Bahasa dan Sastra Indonesia ', 6, 'Yulia Agustin, M.Pd.', '2025-07-16 23:56:25'),
(13, 'Desain Komunikasi Visual (DKV) ', 6, 'Santi Sidhartani, S.T., M.Ds.', '2025-07-16 23:56:25'),
(14, 'Pendidikan Matematika', 7, 'Dr. Nurdeni', '2025-07-16 23:59:27'),
(15, 'Pendidikan Biologi', 7, 'Dr. Yulian Dinihari, M.Pd.', '2025-07-17 00:01:21'),
(16, 'Pendidikan Fisika', 7, 'Dr. H. Purwanto, M.Pd.', '2025-07-17 00:01:21'),
(17, 'Bimbingan dan Konseling', 8, 'Dra. Sumaryati T, M.Pd.', '2025-07-17 00:03:13'),
(18, 'Bisnis Digital', 8, 'Dr. Dona Fitria', '2025-07-17 00:03:13'),
(19, 'Manajemen Ritel', 8, 'Dr. Dellia Mila Vernia', '2025-07-17 00:05:38'),
(20, 'Pendidikan Ekonomi', 8, 'Zainal Abidin, M.Pd.', '2025-07-17 00:05:38'),
(21, 'Pendidikan IPS Sejarah', 8, 'Dr. Widodo', '2025-07-17 00:06:25'),
(22, 'Arsitektur', 9, 'Karya Widyawati, M.T.', '2025-07-17 00:09:47'),
(23, 'Teknik Industri', 9, 'Elfitria Wiratmani, M.T.', '2025-07-17 00:10:51'),
(24, 'Teknik Informatika', 9, 'Mei Lestari, M.Kom.', '2025-07-17 00:12:06'),
(25, 'Sistem Informasi', 9, 'Za\'imatun Niswati, S.Pt., M.Kom.', '2025-07-17 00:13:47');

-- --------------------------------------------------------

--
-- Table structure for table `system_settings`
--

CREATE TABLE `system_settings` (
  `id` int(11) NOT NULL,
  `setting_key` varchar(100) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_description` varchar(255) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `system_settings`
--

INSERT INTO `system_settings` (`id`, `setting_key`, `setting_value`, `setting_description`, `updated_by`, `updated_at`) VALUES
(1, 'site_name', 'Universitas Indraprasta PGRI - Sistem Akademik', 'Nama website sistem akademik', 1, '2025-07-16 22:22:25'),
(2, 'site_description', 'Portal akademik terpadu untuk mahasiswa, dosen, dan administrasi MPD University', 'Deskripsi website', 1, '2025-07-16 22:22:25'),
(3, 'academic_year', '2024/2025', 'Tahun akademik aktif', 1, '2025-07-16 22:22:25'),
(4, 'semester_active', 'Ganjil', 'Semester aktif saat ini', 1, '2025-07-16 22:22:25'),
(5, 'registration_open', 'true', 'Status pendaftaran mata kuliah', 1, '2025-07-16 22:22:25'),
(6, 'max_sks_per_semester', '24', 'Maksimal SKS per semester', 1, '2025-07-16 22:22:25'),
(7, 'min_attendance_percentage', '75', 'Minimal persentase kehadiran', 1, '2025-07-16 22:22:25'),
(8, 'late_payment_fee', '50000', 'Denda keterlambatan pembayaran', 1, '2025-07-16 22:22:25'),
(9, 'contact_email', 'admin@unindra.ac.id', 'Email kontak utama', 1, '2025-07-16 22:22:25'),
(10, 'contact_phone', '021-1234567', 'Nomor telepon kontak', 1, '2025-07-16 22:22:25'),
(11, 'dashboard_refresh_interval', '300', 'Dashboard auto refresh interval in seconds', 1, '2025-07-16 22:22:25'),
(12, 'show_real_time_stats', 'true', 'Enable real-time statistics on dashboard', 1, '2025-07-16 22:22:25'),
(13, 'attendance_tracking', 'true', 'Enable attendance tracking system', 1, '2025-07-16 22:22:25'),
(14, 'grade_notification', 'true', 'Send notifications when grades are updated', 1, '2025-07-16 22:22:25');

-- --------------------------------------------------------

--
-- Table structure for table `tugas`
--

CREATE TABLE `tugas` (
  `id` int(11) NOT NULL,
  `mata_kuliah_id` int(11) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `deskripsi` text DEFAULT NULL,
  `jenis` varchar(50) DEFAULT 'Tugas Individu',
  `deadline` datetime NOT NULL,
  `assigned_date` datetime DEFAULT current_timestamp(),
  `file_tugas` varchar(255) DEFAULT NULL,
  `max_file_size` varchar(10) DEFAULT '10MB',
  `file_types` varchar(100) DEFAULT '.pdf,.doc,.docx,.zip',
  `priority` varchar(20) DEFAULT 'medium',
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tugas_submissions`
--

CREATE TABLE `tugas_submissions` (
  `id` int(11) NOT NULL,
  `tugas_id` int(11) NOT NULL,
  `mahasiswa_id` int(11) NOT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `nilai` decimal(5,2) DEFAULT NULL,
  `feedback` text DEFAULT NULL,
  `submitted_at` datetime DEFAULT current_timestamp(),
  `graded_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(20) NOT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  `nip` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `profile_photo` varchar(255) DEFAULT 'avatar-1.jpg',
  `created_at` datetime DEFAULT current_timestamp(),
  `last_login` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `role`, `full_name`, `nip`, `email`, `phone`, `alamat`, `profile_photo`, `created_at`, `last_login`) VALUES
(1, 'admin', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin', 'Administrator', NULL, 'admin@mpd.ac.id', NULL, NULL, 'avatar-1.jpg', '2025-07-16 22:22:24', NULL),
(35, '197208870132', '$2y$10$ZkkXxV7UMp64oPF4qVOGwucnRtIpK9.xJleBTwKwnnRcXfa5N9xyu', 'dosen', 'Nandang Suwela M.Kom.', NULL, 'nandang@gmail.com', NULL, NULL, 'avatar-1.jpg', '2025-07-17 00:36:24', NULL),
(36, '197208901745', '$2y$10$.9o0stkmHBwYitlqGKhd8uMRK21DpHVUJsp0EJeciKd6yz5OF1knK', 'dosen', 'Kiki Ismanti S.E., M.Pd.', NULL, 'kikiismanti@gmail.com', NULL, NULL, 'avatar-5.svg', '2025-07-17 00:38:56', NULL),
(38, '197208940611', '$2y$10$AVN7kFz/3DY3jNDejHEn1.4.ARwUPsBm0Y/w7kTvxmJLfoI7KKLjC', 'dosen', 'Muhammad Akrom, M.Ag', NULL, 'akrom@gmail.com', NULL, NULL, 'avatar-1.jpg', '2025-07-17 00:44:13', NULL),
(40, '197208920389', '$2y$10$QCVBzPwnPWxRmho2nd7K5eODe2cxufxliJ2FuPUFVy0nsSlzWC8y.', 'dosen', 'Noor Komari Pratiwi M.Pd.', NULL, 'noor@gmail.com', NULL, NULL, 'avatar-1.jpg', '2025-07-17 00:49:19', NULL),
(48, 'dosen', '$2y$10$JLM/8aEtJDo6X9x9LocAp.frstdrLX3iks2M7GxM5VXHQ8LcIviC6', 'dosen', 'dosen', NULL, 'dosen@gmail.com', NULL, NULL, 'avatar-1.svg', '2025-07-18 23:19:47', NULL),
(51, 'mahasiswa', '$2y$10$twtxIN1nBdvVEcd4GTxbY.e8TIQ3FcHO6EtWmYZshbXi8AwIl6AY2', 'mahasiswa', 'password', NULL, 'mahasiswa@gmail.com', NULL, NULL, 'avatar-2.svg', '2025-07-18 23:59:09', NULL),
(52, '202243500497', '$2y$10$4OMM5V0MUmNT.8wTGfJDsO00/GreFRVGFQucQN3CJUGZdTFI8KwDm', 'mahasiswa', 'Alfarobby', NULL, 'alfarobby@gmail.com', NULL, NULL, 'avatar-2.svg', '2025-07-27 20:43:44', NULL),
(53, '202243500501', '$2y$10$DpH3ZhuA3IyK8keUsYk/aubUGQV/KBnW1rmLs3TtnL4CmALqjgl2W', 'mahasiswa', 'Abdur Rosyid Fachriansyah', NULL, 'abdur@gmail.com', NULL, NULL, 'avatar-1.jpg', '2025-07-27 20:44:29', NULL),
(54, '202243500500', '$2y$10$bM29hlsRzPGI53YiqrP.WOlTf9pc./pgQzJ.3qOSsXw6sa9mpprBa', 'mahasiswa', 'Ahmad Badawi', NULL, 'badawi@gmail.com', NULL, NULL, 'avatar-1.jpg', '2025-07-27 20:45:16', NULL),
(60, '3124253464', '$2y$10$vSjH5Fcg/jmQJBPE2eGCj.zhqtl3YwN.HYcLkrhgjMSNSbTtoeg4y', 'dosen', 'tes', NULL, 'tes@gmail.com', NULL, NULL, 'avatar-1.jpg', '2025-07-27 21:42:02', NULL);

-- --------------------------------------------------------

--
-- Structure for view `dashboard_stats`
--
DROP TABLE IF EXISTS `dashboard_stats`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `dashboard_stats`  AS SELECT 'attendance_today' AS `metric`, round((select count(0) from `absensi` where `absensi`.`status` = 'Hadir' and `absensi`.`tanggal` = curdate()) * 100.0 / nullif((select count(0) from `absensi` where `absensi`.`tanggal` = curdate()),0),1) AS `value`, '%' AS `unit`, 'Persentase kehadiran mahasiswa hari ini' AS `description`union all select 'assignment_completion' AS `metric`,round((select count(0) from `nilai` where `nilai`.`tugas1` is not null and `nilai`.`tugas2` is not null) * 100.0 / nullif((select count(0) from `kelas`),0),1) AS `value`,'%' AS `unit`,'Persentase tugas yang telah dikumpulkan' AS `description` union all select 'grades_input' AS `metric`,round((select count(0) from `nilai` where `nilai`.`nilai_akhir` is not null) * 100.0 / nullif((select count(0) from `kelas`),0),1) AS `value`,'%' AS `unit`,'Persentase nilai yang telah diinput' AS `description` union all select 'active_schedule' AS `metric`,round((select count(0) from `jadwal` where `jadwal`.`hari` = dayname(curdate())) * 100.0 / nullif((select count(0) from `jadwal`),0),1) AS `value`,'%' AS `unit`,'Persentase jadwal yang aktif hari ini' AS `description`  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `absensi`
--
ALTER TABLE `absensi`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_attendance` (`mata_kuliah_id`,`mahasiswa_id`,`tanggal`),
  ADD KEY `mahasiswa_id` (`mahasiswa_id`);

--
-- Indexes for table `admin_logs`
--
ALTER TABLE `admin_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_id` (`admin_id`);

--
-- Indexes for table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `author_id` (`author_id`);

--
-- Indexes for table `berita_akademik`
--
ALTER TABLE `berita_akademik`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nidn` (`nidn`),
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD KEY `fakultas_id` (`fakultas_id`);

--
-- Indexes for table `fakultas`
--
ALTER TABLE `fakultas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `galeri`
--
ALTER TABLE `galeri`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jadwal`
--
ALTER TABLE `jadwal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mata_kuliah_id` (`mata_kuliah_id`);

--
-- Indexes for table `kalender_akademik`
--
ALTER TABLE `kalender_akademik`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_enrollment` (`mata_kuliah_id`,`mahasiswa_id`),
  ADD KEY `mahasiswa_id` (`mahasiswa_id`);

--
-- Indexes for table `kontak`
--
ALTER TABLE `kontak`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nim` (`nim`),
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD KEY `program_studi_id` (`program_studi_id`);

--
-- Indexes for table `mata_kuliah`
--
ALTER TABLE `mata_kuliah`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kode_mk` (`kode_mk`),
  ADD KEY `dosen_id` (`dosen_id`),
  ADD KEY `program_studi_id` (`program_studi_id`);

--
-- Indexes for table `nilai`
--
ALTER TABLE `nilai`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_grade` (`mata_kuliah_id`,`mahasiswa_id`),
  ADD KEY `mahasiswa_id` (`mahasiswa_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recipient_id` (`recipient_id`);

--
-- Indexes for table `pengumuman`
--
ALTER TABLE `pengumuman`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `program_studi`
--
ALTER TABLE `program_studi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fakultas_id` (`fakultas_id`);

--
-- Indexes for table `system_settings`
--
ALTER TABLE `system_settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `setting_key` (`setting_key`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `tugas`
--
ALTER TABLE `tugas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mata_kuliah_id` (`mata_kuliah_id`);

--
-- Indexes for table `tugas_submissions`
--
ALTER TABLE `tugas_submissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_submission` (`tugas_id`,`mahasiswa_id`),
  ADD KEY `mahasiswa_id` (`mahasiswa_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `absensi`
--
ALTER TABLE `absensi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `admin_logs`
--
ALTER TABLE `admin_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `articles`
--
ALTER TABLE `articles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `berita_akademik`
--
ALTER TABLE `berita_akademik`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `dosen`
--
ALTER TABLE `dosen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `fakultas`
--
ALTER TABLE `fakultas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `galeri`
--
ALTER TABLE `galeri`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jadwal`
--
ALTER TABLE `jadwal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `kalender_akademik`
--
ALTER TABLE `kalender_akademik`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `kelas`
--
ALTER TABLE `kelas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `kontak`
--
ALTER TABLE `kontak`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `mata_kuliah`
--
ALTER TABLE `mata_kuliah`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `nilai`
--
ALTER TABLE `nilai`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pengumuman`
--
ALTER TABLE `pengumuman`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `program_studi`
--
ALTER TABLE `program_studi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `system_settings`
--
ALTER TABLE `system_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tugas`
--
ALTER TABLE `tugas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tugas_submissions`
--
ALTER TABLE `tugas_submissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `absensi`
--
ALTER TABLE `absensi`
  ADD CONSTRAINT `absensi_ibfk_1` FOREIGN KEY (`mata_kuliah_id`) REFERENCES `mata_kuliah` (`id`),
  ADD CONSTRAINT `absensi_ibfk_2` FOREIGN KEY (`mahasiswa_id`) REFERENCES `mahasiswa` (`id`);

--
-- Constraints for table `admin_logs`
--
ALTER TABLE `admin_logs`
  ADD CONSTRAINT `admin_logs_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `articles`
--
ALTER TABLE `articles`
  ADD CONSTRAINT `articles_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `dosen`
--
ALTER TABLE `dosen`
  ADD CONSTRAINT `dosen_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `dosen_ibfk_2` FOREIGN KEY (`fakultas_id`) REFERENCES `fakultas` (`id`);

--
-- Constraints for table `jadwal`
--
ALTER TABLE `jadwal`
  ADD CONSTRAINT `jadwal_ibfk_1` FOREIGN KEY (`mata_kuliah_id`) REFERENCES `mata_kuliah` (`id`);

--
-- Constraints for table `kelas`
--
ALTER TABLE `kelas`
  ADD CONSTRAINT `kelas_ibfk_1` FOREIGN KEY (`mata_kuliah_id`) REFERENCES `mata_kuliah` (`id`),
  ADD CONSTRAINT `kelas_ibfk_2` FOREIGN KEY (`mahasiswa_id`) REFERENCES `mahasiswa` (`id`);

--
-- Constraints for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD CONSTRAINT `mahasiswa_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `mahasiswa_ibfk_2` FOREIGN KEY (`program_studi_id`) REFERENCES `program_studi` (`id`);

--
-- Constraints for table `mata_kuliah`
--
ALTER TABLE `mata_kuliah`
  ADD CONSTRAINT `mata_kuliah_ibfk_1` FOREIGN KEY (`dosen_id`) REFERENCES `dosen` (`id`),
  ADD CONSTRAINT `mata_kuliah_ibfk_2` FOREIGN KEY (`program_studi_id`) REFERENCES `program_studi` (`id`);

--
-- Constraints for table `nilai`
--
ALTER TABLE `nilai`
  ADD CONSTRAINT `nilai_ibfk_1` FOREIGN KEY (`mata_kuliah_id`) REFERENCES `mata_kuliah` (`id`),
  ADD CONSTRAINT `nilai_ibfk_2` FOREIGN KEY (`mahasiswa_id`) REFERENCES `mahasiswa` (`id`);

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`recipient_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `program_studi`
--
ALTER TABLE `program_studi`
  ADD CONSTRAINT `program_studi_ibfk_1` FOREIGN KEY (`fakultas_id`) REFERENCES `fakultas` (`id`);

--
-- Constraints for table `system_settings`
--
ALTER TABLE `system_settings`
  ADD CONSTRAINT `system_settings_ibfk_1` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `tugas`
--
ALTER TABLE `tugas`
  ADD CONSTRAINT `tugas_ibfk_1` FOREIGN KEY (`mata_kuliah_id`) REFERENCES `mata_kuliah` (`id`);

--
-- Constraints for table `tugas_submissions`
--
ALTER TABLE `tugas_submissions`
  ADD CONSTRAINT `tugas_submissions_ibfk_1` FOREIGN KEY (`mahasiswa_id`) REFERENCES `mahasiswa` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
