-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 19 Jun 2022 pada 16.07
-- Versi Server: 10.1.19-MariaDB
-- PHP Version: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `crud`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_posts`
--

CREATE TABLE tbl_posts (
    id INT(11) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    slug VARCHAR(200) NOT NULL,
    user_id INT(11) NOT NULL,
    content TEXT NOT NULL,
    image VARCHAR(100) DEFAULT 'Noimage.jpg',
    hits INT(11) NOT NULL DEFAULT 0,
    aktif ENUM('Y','N') NOT NULL DEFAULT 'Y',
    status ENUM('publish','draft','archived') NOT NULL DEFAULT 'publish',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_posts`
--

INSERT INTO tbl_posts (title, slug, user_id, content, image, hits, aktif, status, created_at, updated_at) 
VALUES
	('artikel-1', 'post-artikel-1', 1, 'text-1', '122', 'image1.jpg', 10, 'Y', 'publish', NOW(), NOW()),
	('artikel-2', 'post-artikel-2', 2, 'text-2', '122', 'image2.jpg', 20, 'Y', 'publish', NOW(), NOW()),
	('artikel-3', 'post-artikel-3', 3, 'text-3', '122', 'image3.jpg', 30, 'Y', 'draft', NOW(), NOW()),
	('artikel-4', 'post-artikel-4', 4, 'text-4', '122', 'image4.jpg', 40, 'Y', 'publish', NOW(), NOW()),
	('artikel-5', 'post-artikel-5', 5, 'text-5', '122', 'image5.jpg', 50, 'Y', 'publish', NOW(), NOW()),
	('artikel-6', 'post-artikel-6', 6, 'text-6', '122','image6.jpg', 60, 'Y', 'draft', NOW(), NOW());

--
-- Indexes for dumped tables
--

--
-- Indexes for table `peserta`
--
ALTER TABLE `tbl_posts`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `peserta`
--
ALTER TABLE `tbl_posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY, AUTO_INCREMENT=1;

DELIMITER //
CREATE TRIGGER AdjustIdAfterDelete
AFTER DELETE ON tbl_posts
FOR EACH ROW
BEGIN
    UPDATE tbl_posts SET id = id - 1 WHERE id > OLD.id;
END;
//
DELIMITER ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
