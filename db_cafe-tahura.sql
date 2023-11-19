-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for db_cafe-tahura
CREATE DATABASE IF NOT EXISTS `db_cafe-tahura` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_cafe-tahura`;

-- Dumping structure for table db_cafe-tahura.deleted
CREATE TABLE IF NOT EXISTS `deleted` (
  `id` int NOT NULL AUTO_INCREMENT,
  `table_name` varchar(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `data` json DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=204 DEFAULT CHARSET=ascii ROW_FORMAT=DYNAMIC;

-- Dumping data for table db_cafe-tahura.deleted: ~1 rows (approximately)
REPLACE INTO `deleted` (`id`, `table_name`, `data`, `created_at`) VALUES
	(202, 'master_barang', '{"id": 11807, "kode": "BRG_005", "nama": "Barang Usulan 1", "harga": 200000.0, "satuan": "70", "pdam_id": 4, "created_at": "2023-08-03 16:49:39.000000", "created_by": "Super Admin", "updated_at": null, "kategori_id": 33}', '2023-08-09 11:29:28.502201');

-- Dumping structure for table db_cafe-tahura.log
CREATE TABLE IF NOT EXISTS `log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action` varchar(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `table_name` varchar(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `data` json DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `unique` (`id`) USING BTREE,
  KEY `priority` (`table_name`,`created_at`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=ascii ROW_FORMAT=DYNAMIC;

-- Dumping data for table db_cafe-tahura.log: ~0 rows (approximately)

-- Dumping structure for table db_cafe-tahura.log_akses
CREATE TABLE IF NOT EXISTS `log_akses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pdam_id` int DEFAULT NULL,
  `times` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `id_user` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `username` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `name` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `ip` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `url` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `message` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `data` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `response` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `controller` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `action` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- Dumping data for table db_cafe-tahura.log_akses: ~13 rows (approximately)
REPLACE INTO `log_akses` (`id`, `pdam_id`, `times`, `id_user`, `username`, `name`, `ip`, `url`, `message`, `data`, `response`, `controller`, `action`) VALUES
	(1, 1, '2023-11-14 01:50:21', '225', 'owner', 'OWNER', '127.0.0.1', 'localhost/cafe-tahura/panel//master/kasir/update', 'Update Data Master-Referensi Barang-Satuan', '{"nama":"ELIS SUKA MAJU","kode":"k002","password":"superkasir","password_hash":"$2y$10$Ze1zOqLzYheKpNo.tjykGuYZ9aFCOf6lW63BHFyqvM4kV8FzV\\/B4e","pdam_id":"1"}', 'true', 'App\\Modules\\Defaults\\Master\\ReferensiBarang\\Satuan\\Controller', 'UPDATE'),
	(2, 1, '2023-11-14 02:23:14', '225', 'owner', 'OWNER', '127.0.0.1', 'localhost/cafe-tahura/panel//master/kasir/store', 'Insert Data Master-Referensi Barang-Satuan', '{"nama":"Ikbal","kode":"k006","password":"masterplan","password_hash":"$2y$10$uqD7VF\\/dpbyac18NLrXjwO9SqkQslJqHYqbLdcA1HwhQtXyIg6\\/aO","pdam_id":"1"}', 'true', 'App\\Modules\\Defaults\\Master\\ReferensiBarang\\Satuan\\Controller', 'INSERT'),
	(3, 1, '2023-11-14 02:25:19', '225', 'owner', 'OWNER', '127.0.0.1', 'localhost/cafe-tahura/panel//master/kasir/update', 'Update Data Master-Referensi Barang-Satuan', '{"nama":"Ikbal","kode":"k006","password":"superkasir","password_hash":"$2y$10$g34qDopGoRgVuxq7ta7xDeKEQGk.Hpcu6i0vBAtPsH4O45lEpDc7a","pdam_id":"1"}', 'true', 'App\\Modules\\Defaults\\Master\\ReferensiBarang\\Satuan\\Controller', 'UPDATE'),
	(4, 1, '2023-11-14 02:25:47', '225', 'owner', 'OWNER', '127.0.0.1', 'localhost/cafe-tahura/panel//master/kasir/update', 'Update Data Master-Referensi Barang-Satuan', '{"nama":"YANTI SUKA HAJI","kode":"k001","password":"superkasir","password_hash":"$2y$10$nSIeuoLO6.OGV27U4p8umeGufS543ZN17xw62WVcYHLJ6O23I3eQO","pdam_id":"1"}', 'true', 'App\\Modules\\Defaults\\Master\\ReferensiBarang\\Satuan\\Controller', 'UPDATE'),
	(5, 1, '2023-11-14 02:25:55', '225', 'owner', 'OWNER', '127.0.0.1', 'localhost/cafe-tahura/panel//master/kasir/update', 'Update Data Master-Referensi Barang-Satuan', '{"nama":"Kopi Hitman","kode":"k003","password":"superkasir","password_hash":"$2y$10$BAXj2j\\/9ITGTjOByXyGEA.IBymMNhtWoXq2zmwkI4mBlHlnUlDgga","pdam_id":"1"}', 'true', 'App\\Modules\\Defaults\\Master\\ReferensiBarang\\Satuan\\Controller', 'UPDATE'),
	(6, 1, '2023-11-14 02:30:48', '225', 'owner', 'OWNER', '127.0.0.1', 'localhost/cafe-tahura/panel//master/kasir/delete?id=8', 'Delete Data Master-Referensi Barang-Satuan', '{"id":"8"}', 'true', 'App\\Modules\\Defaults\\Master\\ReferensiBarang\\Satuan\\Controller', 'DELETE'),
	(7, 1, '2023-11-14 02:31:41', '225', 'owner', 'OWNER', '127.0.0.1', 'localhost/cafe-tahura/panel//master/kasir/delete?id=5', 'Delete Data Master-Referensi Barang-Satuan', '{"id":"5"}', 'true', 'App\\Modules\\Defaults\\Master\\ReferensiBarang\\Satuan\\Controller', 'DELETE'),
	(8, 1, '2023-11-14 02:40:37', '225', 'owner', 'OWNER', '127.0.0.1', 'localhost/cafe-tahura/panel//master/bahan/store', 'Insert Data Master-Referensi Barang-Kategori', '{"nama":"kentang","jumlah":"1000","satuan_id":"1","harga":"10000","created_at":"2023-11-14 09:40:37","pdam_id":"1"}', 'true', 'App\\Modules\\Defaults\\Master\\ReferensiBarang\\Kategori\\Controller', 'INSERT'),
	(9, 1, '2023-11-14 02:40:46', '225', 'owner', 'OWNER', '127.0.0.1', 'localhost/cafe-tahura/panel//master/bahan/update', 'Update Data Master-Referensi Barang-Kategori', '{"nama":"kentang","jumlah":"1000","satuan_id":"1","harga":"15000","updated_at":"2023-11-14 09:40:46","pdam_id":"1"}', 'true', 'App\\Modules\\Defaults\\Master\\ReferensiBarang\\Kategori\\Controller', 'UPDATE'),
	(10, 1, '2023-11-17 01:26:36', '225', 'owner', 'OWNER', '127.0.0.1', 'localhost/cafe-tahura/panel//master/kasir/update', 'Update Data Master-Referensi Barang-Satuan', '{"nama":"Ahmad","kode":"k002","password":"superkasir","password_hash":"$2y$10$YPGah4qfEjMZWgT584f16.XMKWGU.yWhJITcwh6QSJj7x1tQIEJIi","pdam_id":"1"}', 'true', 'App\\Modules\\Defaults\\Master\\ReferensiBarang\\Satuan\\Controller', 'UPDATE'),
	(11, 1, '2023-11-17 01:27:47', '225', 'owner', 'OWNER', '127.0.0.1', 'localhost/cafe-tahura/panel//master/kasir/store', 'Insert Data Master-Referensi Barang-Satuan', '{"nama":"superadmin","kode":"SP","password":"adminsuper","password_hash":"$2y$10$jXo2KqbDtZVXj63ItWQ9su.SQ8CAnyOLbxiT5P5HOuFJhUmzR2oSS","pdam_id":"1"}', 'true', 'App\\Modules\\Defaults\\Master\\ReferensiBarang\\Satuan\\Controller', 'INSERT'),
	(12, 1, '2023-11-17 01:31:45', '225', 'owner', 'OWNER', '127.0.0.1', 'localhost/cafe-tahura/panel//master/kasir/update', 'Update Data Master-Referensi Barang-Satuan', '{"nama":"Derral","kode":"k003","password":"superkasir","password_hash":"$2y$10$k5wFbZ2Vp6YLxeafxe6nYePiL.hq5U7DC33R8xH.O0UuSh3FWomzu","pdam_id":"1"}', 'true', 'App\\Modules\\Defaults\\Master\\ReferensiBarang\\Satuan\\Controller', 'UPDATE'),
	(13, 1, '2023-11-17 01:31:50', '225', 'owner', 'OWNER', '127.0.0.1', 'localhost/cafe-tahura/panel//master/kasir/update', 'Update Data Master-Referensi Barang-Satuan', '{"nama":"Ahmad","kode":"k002","password":"superkasir","password_hash":"$2y$10$\\/m\\/7ZsMaAiNmQvYxGx6c5OqeH8pF9uy11PDzmuWl3X1Tg\\/KaMCTkq","pdam_id":"1"}', 'true', 'App\\Modules\\Defaults\\Master\\ReferensiBarang\\Satuan\\Controller', 'UPDATE');

-- Dumping structure for table db_cafe-tahura.master_bahan
CREATE TABLE IF NOT EXISTS `master_bahan` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) DEFAULT NULL,
  `jumlah` int DEFAULT NULL,
  `satuan_id` int DEFAULT NULL,
  `harga` int DEFAULT NULL,
  `pdam_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nama` (`nama`),
  KEY `FK_master_bahan_master_satuan` (`satuan_id`),
  CONSTRAINT `FK_master_bahan_master_satuan` FOREIGN KEY (`satuan_id`) REFERENCES `master_satuan` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table db_cafe-tahura.master_bahan: ~7 rows (approximately)
REPLACE INTO `master_bahan` (`id`, `nama`, `jumlah`, `satuan_id`, `harga`, `pdam_id`) VALUES
	(1, 'kopi', 1000, 1, 100000, 1),
	(6, 'boba', 1000, 1, 50000, 1),
	(8, 'cup', 1, 3, 500, 1),
	(9, 'susu full cream', 1000, 2, 30000, 1),
	(10, 'coklat', 1000, 1, 150000, 1),
	(11, 'gula', 1000, 1, 50000, 1),
	(13, 'kentang', 1000, 1, 15000, 1);

-- Dumping structure for table db_cafe-tahura.master_kasir
CREATE TABLE IF NOT EXISTS `master_kasir` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0',
  `kode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0',
  `password` varchar(50) DEFAULT '0',
  `password_hash` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0',
  `pdam_id` int DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table db_cafe-tahura.master_kasir: ~3 rows (approximately)
REPLACE INTO `master_kasir` (`id`, `nama`, `kode`, `password`, `password_hash`, `pdam_id`) VALUES
	(1, 'Andhika', 'k001', 'superkasir', '$2y$10$nSIeuoLO6.OGV27U4p8umeGufS543ZN17xw62WVcYHLJ6O23I3eQO', 1),
	(2, 'Ahmad', 'k002', 'superkasir', '$2y$10$/m/7ZsMaAiNmQvYxGx6c5OqeH8pF9uy11PDzmuWl3X1Tg/KaMCTkq', 1),
	(3, 'Derral', 'k003', 'superkasir', '$2y$10$k5wFbZ2Vp6YLxeafxe6nYePiL.hq5U7DC33R8xH.O0UuSh3FWomzu', 1);

-- Dumping structure for table db_cafe-tahura.master_kategori
CREATE TABLE IF NOT EXISTS `master_kategori` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `icon` varchar(50) DEFAULT NULL,
  `pdam_id` int DEFAULT '1',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `nama` (`nama`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- Dumping data for table db_cafe-tahura.master_kategori: ~3 rows (approximately)
REPLACE INTO `master_kategori` (`id`, `nama`, `icon`, `pdam_id`) VALUES
	(1, 'Minuman', 'fa fa-glass-martini-alt', 1),
	(2, 'Makanan', 'fa fa-hamburger', 1),
	(3, 'Desert', 'fa fa-ice-cream', 1);

-- Dumping structure for table db_cafe-tahura.master_margin
CREATE TABLE IF NOT EXISTS `master_margin` (
  `id` int NOT NULL DEFAULT '1',
  `margin` decimal(20,6) DEFAULT NULL,
  `pdam_id` int DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table db_cafe-tahura.master_margin: ~1 rows (approximately)
REPLACE INTO `master_margin` (`id`, `margin`, `pdam_id`) VALUES
	(1, 0.500000, 1);

-- Dumping structure for table db_cafe-tahura.master_produk
CREATE TABLE IF NOT EXISTS `master_produk` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kategori_id` int DEFAULT '0',
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `gambar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `hpp` int DEFAULT '0',
  `harga_jual` int DEFAULT '0',
  `pdam_id` int DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `FK_master_produk_master_kategori` (`kategori_id`),
  CONSTRAINT `FK_master_produk_master_kategori` FOREIGN KEY (`kategori_id`) REFERENCES `master_kategori` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table db_cafe-tahura.master_produk: ~33 rows (approximately)
REPLACE INTO `master_produk` (`id`, `kategori_id`, `nama`, `gambar`, `hpp`, `harga_jual`, `pdam_id`) VALUES
	(1, 1, 'Coffe With Boba', NULL, 12800, 1000, 1),
	(14, 2, 'Kentang Goreng', NULL, 5700, 0, 1),
	(15, 1, 'Kopi Susu', NULL, 6500, 0, 1),
	(17, 1, 'Teh Manis', NULL, 3500, 0, 1),
	(18, 1, 'Americano', NULL, 1000, 0, 1),
	(19, 1, 'Latte', NULL, 2000, 0, 1),
	(20, 1, 'Cappucino', NULL, 3000, 0, 1),
	(22, 1, 'Mocha', NULL, 4000, 0, 1),
	(23, 1, 'Cold Brew', NULL, 5000, 0, 1),
	(24, 1, 'Affogato', NULL, 6000, 0, 1),
	(25, 1, 'Macchiato', NULL, 7000, 0, 1),
	(26, 2, 'Kue', NULL, 8000, 0, 1),
	(27, 2, 'Pastry', NULL, 9000, 0, 1),
	(28, 2, 'Sandwich', NULL, 1100, 0, 1),
	(29, 2, 'Pasta', NULL, 2100, 0, 1),
	(30, 2, 'Muffin', NULL, 3100, 0, 1),
	(31, 2, 'Pancake', NULL, 4100, 0, 1),
	(32, 2, 'Burger', NULL, 5100, 0, 1),
	(33, 2, 'Croissant', NULL, 6100, 0, 1),
	(34, 2, 'Quiche', NULL, 7100, 0, 1),
	(35, 3, 'Es Campur', NULL, 8100, 0, 1),
	(36, 3, 'Cendol', NULL, 9100, 0, 1),
	(37, 3, 'Es Goyobod', NULL, 1200, 0, 1),
	(39, 3, 'Ice Cream', NULL, 2200, 0, 1),
	(40, 3, 'Klepon', NULL, 3200, 0, 1),
	(41, 3, 'Bika Ambon', NULL, 4200, 0, 1),
	(42, 3, 'Chocolate Fondue', NULL, 5200, 0, 1),
	(43, 3, 'Panna Cota', NULL, 6200, 0, 1),
	(44, 3, 'Tiramisu', NULL, 7200, 0, 1),
	(45, 3, 'Brownies', NULL, 8200, 0, 1),
	(49, 2, 'aa', NULL, 123, 0, 1),
	(51, 2, 'asd', NULL, 500, 750, 1),
	(54, 1, 'Jus Alpukat', '21845da59d0d32ce0634b04db998ae62.jpg', 500, 750, 1);

-- Dumping structure for table db_cafe-tahura.master_produk_detail
CREATE TABLE IF NOT EXISTS `master_produk_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `produk_id` int NOT NULL,
  `bahan_id` int NOT NULL,
  `jumlah` int DEFAULT NULL,
  `harga` int DEFAULT NULL,
  `pdam_id` int DEFAULT '1',
  PRIMARY KEY (`produk_id`,`bahan_id`) USING BTREE,
  UNIQUE KEY `id` (`id`),
  KEY `FK_master_produk_detail_master_bahan` (`bahan_id`),
  CONSTRAINT `FK_master_produk_detail_master_bahan` FOREIGN KEY (`bahan_id`) REFERENCES `master_bahan` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table db_cafe-tahura.master_produk_detail: ~4 rows (approximately)
REPLACE INTO `master_produk_detail` (`id`, `produk_id`, `bahan_id`, `jumlah`, `harga`, `pdam_id`) VALUES
	(2, 1, 1, 2, 200, 1),
	(1, 1, 8, 1, 500, 1),
	(4, 51, 8, 1, 500, 1),
	(5, 54, 8, 1, 500, 1);

-- Dumping structure for table db_cafe-tahura.master_satuan
CREATE TABLE IF NOT EXISTS `master_satuan` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `pdam_id` int DEFAULT '1',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `nama` (`nama`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- Dumping data for table db_cafe-tahura.master_satuan: ~3 rows (approximately)
REPLACE INTO `master_satuan` (`id`, `nama`, `pdam_id`) VALUES
	(1, 'gram', 1),
	(2, 'ml', 1),
	(3, 'pcs', 1);

-- Dumping structure for table db_cafe-tahura.master_voucher
CREATE TABLE IF NOT EXISTS `master_voucher` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kode` varchar(255) NOT NULL DEFAULT 'p001',
  `diskon` decimal(20,2) DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `active_at` date DEFAULT NULL,
  `expired_at` date DEFAULT NULL,
  `pdam_id` int DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `kode` (`kode`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table db_cafe-tahura.master_voucher: ~6 rows (approximately)
REPLACE INTO `master_voucher` (`id`, `kode`, `diskon`, `qty`, `active_at`, `expired_at`, `pdam_id`) VALUES
	(1, 'p001', 0.03, 4, '2023-10-30', '2023-11-03', 1),
	(3, 'p003', 0.01, 2, '2023-10-30', '2023-11-01', 1),
	(4, 'p004', 0.04, 0, '2023-10-30', '2023-11-30', 1),
	(5, 'p005', 0.03, 4, '2023-10-30', '2023-11-03', 1),
	(6, 'p002', 0.10, 2, '2023-10-30', '2023-11-30', 1),
	(7, 'p006', 0.10, 4, '2023-11-13', '2023-12-13', 1);

-- Dumping structure for table db_cafe-tahura.menu
CREATE TABLE IF NOT EXISTS `menu` (
  `id_menu` int NOT NULL AUTO_INCREMENT,
  `nama_menu` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `jenis` smallint DEFAULT NULL,
  `parent_menu` smallint DEFAULT NULL,
  `link_menu` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `urutan` smallint DEFAULT NULL,
  `is_aktif` tinyint DEFAULT '1',
  `is_tampil` tinyint DEFAULT '1',
  `keterangan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  PRIMARY KEY (`id_menu`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Dumping data for table db_cafe-tahura.menu: ~13 rows (approximately)
REPLACE INTO `menu` (`id_menu`, `nama_menu`, `jenis`, `parent_menu`, `link_menu`, `icon`, `urutan`, `is_aktif`, `is_tampil`, `keterangan`) VALUES
	(1, 'Dashboard', 0, 0, 'dashboard', 'fa fa-tachometer-alt', 1, 1, 1, NULL),
	(2, 'Master', 0, 0, NULL, 'fa-database', 2, 1, 1, NULL),
	(10, 'Pengaturan', 0, 0, NULL, 'fa-cog', 99, 1, 1, NULL),
	(13, 'IPA', 1, 2, NULL, NULL, 3, 1, 0, NULL),
	(14, 'Intake', 1, 2, NULL, NULL, 4, 1, 0, NULL),
	(20, 'Voucher', 1, 2, 'master/voucher', NULL, 2, 1, 1, NULL),
	(21, 'Data Kasir', 1, 2, 'master/kasir', NULL, 3, 1, 1, NULL),
	(22, 'Produk', 1, 2, 'master/produk', NULL, 1, 1, 1, NULL),
	(42, 'User', 1, 10, 'pengaturan/user', NULL, 1, 1, 1, NULL),
	(43, 'Ganti Password', 1, 10, 'pengaturan/ubah-password', NULL, 2, 1, 1, NULL),
	(44, 'Bahan', 1, 2, 'master/bahan', NULL, 5, 1, 1, NULL),
	(45, 'Kasir', 0, 0, 'kasir', 'fa-cash-register', 3, 1, 1, NULL),
	(46, 'Laporan', 0, 0, 'laporan', 'fa-file-alt', 4, 1, 1, NULL);

-- Dumping structure for table db_cafe-tahura.menu_otorisasi
CREATE TABLE IF NOT EXISTS `menu_otorisasi` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pdam_id` int DEFAULT '1',
  `id_menu` int DEFAULT NULL,
  `id_role` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2390 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Dumping data for table db_cafe-tahura.menu_otorisasi: ~31 rows (approximately)
REPLACE INTO `menu_otorisasi` (`id`, `pdam_id`, `id_menu`, `id_role`) VALUES
	(1, 1, 1, 1),
	(2, 1, 2, 1),
	(10, 1, 10, 1),
	(12, 1, 12, 1),
	(13, 1, 13, 1),
	(14, 1, 14, 1),
	(20, 1, 20, 1),
	(21, 1, 21, 1),
	(22, 1, 22, 1),
	(42, 1, 42, 1),
	(43, 1, 43, 1),
	(2368, 1, 44, 1),
	(2369, 1, 45, 2),
	(2371, 1, 46, 1),
	(2372, 1, 47, 1),
	(2373, 1, 1, 3),
	(2374, 1, 2, 3),
	(2375, 1, 10, 3),
	(2376, 1, 12, 3),
	(2377, 1, 13, 3),
	(2378, 1, 14, 3),
	(2379, 1, 20, 3),
	(2380, 1, 22, 3),
	(2382, 1, 42, 3),
	(2383, 1, 43, 3),
	(2384, 1, 44, 3),
	(2385, 1, 45, 3),
	(2386, 1, 46, 3),
	(2387, 1, 47, 3),
	(2388, 1, 21, 3),
	(2389, 1, 45, 1);

-- Dumping structure for table db_cafe-tahura.pdam
CREATE TABLE IF NOT EXISTS `pdam` (
  `pdam_id` int NOT NULL AUTO_INCREMENT,
  `kode` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `nama_pdam` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `alamat` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `direktori` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `pemerintah_kota_kab` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `kota_kab_pdam` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `alamat_pdam` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `no_telp_pdam` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `daerah_pdam` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `file_logo_pdam` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `file_logo_pemerintah_kota_kab` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `usia_pensiun` int DEFAULT NULL,
  `sinkron_akuntansi` tinyint DEFAULT '0',
  PRIMARY KEY (`pdam_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- Dumping data for table db_cafe-tahura.pdam: ~2 rows (approximately)
REPLACE INTO `pdam` (`pdam_id`, `kode`, `nama_pdam`, `alamat`, `direktori`, `pemerintah_kota_kab`, `kota_kab_pdam`, `alamat_pdam`, `no_telp_pdam`, `daerah_pdam`, `latitude`, `longitude`, `file_logo_pdam`, `file_logo_pemerintah_kota_kab`, `usia_pensiun`, `sinkron_akuntansi`) VALUES
	(1, 'panel', 'PDAM TIRTA DEMO', NULL, 'defaults', NULL, 'Kabupaten Nusantara', 'JL. Raya Sumedang-Cirebon, Km. 4, 5, Cimalaka, Kabupaten Sumedang', 'Telp. (022) 7794127', NULL, NULL, NULL, 'logo4270287403_2023-07-27.png', '56', 56, 0),
	(10, 'chpn', 'CHARISMA PERSADA NUSANTARA', NULL, 'chpn', NULL, 'Kabupaten Nusantara', 'JL. Raya Sumedang-Cirebon, Km. 4, 5, Cimalaka, Kabupaten Sumedang', NULL, NULL, NULL, NULL, 'chpn.png', '56', 56, 0);

-- Dumping structure for table db_cafe-tahura.role
CREATE TABLE IF NOT EXISTS `role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pdam_id` int DEFAULT NULL,
  `satuan_kerja_id` int DEFAULT '0',
  `role` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `status` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Dumping data for table db_cafe-tahura.role: ~19 rows (approximately)
REPLACE INTO `role` (`id`, `pdam_id`, `satuan_kerja_id`, `role`, `status`) VALUES
	(1, 1, 0, 'superadmin', 1),
	(2, 0, 0, 'superadmin', 1),
	(9, 1, 0, 'SATKER', 1),
	(10, 8, 0, 'superadmin', 1),
	(11, 8, 0, 'SATKER', 1),
	(12, 2, 0, 'superadmin', 1),
	(13, 4, 0, 'superadmin', 1),
	(14, 4, 0, 'bagian', 1),
	(15, 2, 0, 'superadmin', 1),
	(16, 4, 0, 'anggaran', 1),
	(17, 4, 61, 'spi', 1),
	(18, 4, 62, 'umum', 1),
	(19, 4, 63, 'kepegawaian', 1),
	(20, 4, 64, 'keuangan', 1),
	(21, 4, 65, 'humas', 1),
	(22, 4, 66, 'produksi', 1),
	(23, 4, 67, 'perawatan', 1),
	(24, 4, 68, 'perencanaan', 1),
	(25, 4, 0, 'admin', 1);

-- Dumping structure for table db_cafe-tahura.transaksi
CREATE TABLE IF NOT EXISTS `transaksi` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kode_kasir` varchar(50) DEFAULT NULL,
  `voucher_kode` varchar(50) DEFAULT NULL,
  `total` int DEFAULT NULL,
  `bayar` int DEFAULT NULL,
  `kembalian` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `pdam_id` int DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table db_cafe-tahura.transaksi: ~66 rows (approximately)
REPLACE INTO `transaksi` (`id`, `kode_kasir`, `voucher_kode`, `total`, `bayar`, `kembalian`, `created_at`, `pdam_id`) VALUES
	(1, 'k001', NULL, 1000000, 1000000, 0, '2023-10-17 17:45:54', 1),
	(2, '0', 'p004', 10080, NULL, NULL, '2023-11-07 09:04:19', 1),
	(3, '0', 'p004', 23760, NULL, NULL, '2023-11-07 09:08:19', 1),
	(4, '0', 'p004', 23760, NULL, NULL, '2023-11-07 09:11:12', 1),
	(6, '0', 'p004', 27360, NULL, NULL, '2023-11-07 10:24:33', 1),
	(7, '0', 'p004', 5040, NULL, NULL, '2023-11-07 11:06:21', 1),
	(9, 'k001', 'p004', 5040, NULL, NULL, '2023-11-07 11:09:15', 1),
	(10, 'k001', NULL, 5040, NULL, NULL, '2023-11-07 13:36:00', 1),
	(11, 'k001', NULL, 5040, NULL, NULL, '2023-11-07 13:36:04', 1),
	(12, 'k001', NULL, 23760, NULL, NULL, '2023-11-07 13:36:28', 1),
	(13, 'k001', 'p004', 23760, NULL, NULL, '2023-11-07 13:38:42', 1),
	(14, NULL, NULL, 8400, NULL, NULL, '2023-11-07 14:08:24', 1),
	(15, NULL, NULL, 24750, NULL, NULL, '2023-11-08 11:31:28', 1),
	(16, NULL, NULL, 15000, NULL, NULL, '2023-11-08 16:57:49', 1),
	(17, NULL, NULL, 30000, NULL, NULL, '2023-11-08 17:18:20', 1),
	(18, NULL, NULL, 5250, NULL, NULL, '2023-11-08 17:20:22', 1),
	(19, NULL, 'p004', 19440, NULL, NULL, '2023-11-09 15:26:52', 1),
	(20, NULL, 'p004', 19440, NULL, NULL, '2023-11-09 15:27:11', 1),
	(21, NULL, 'p004', 23760, NULL, NULL, '2023-11-09 15:28:15', 1),
	(23, 'k001', 'p004', 23760, 30000, 6240, '2023-11-09 17:09:45', 1),
	(24, 'k001', NULL, 8550, 10000, 1450, '2023-11-12 17:55:55', 1),
	(25, 'k001', 'p004', 10080, 100000, 89920, '2023-11-12 17:58:25', 1),
	(26, 'k001', NULL, 24750, 100000, 75250, '2023-11-12 18:04:58', 1),
	(27, 'k001', NULL, 24750, 24750, 0, '2023-11-12 21:21:55', 1),
	(28, 'k001', NULL, 5250, 10000, 4750, '2023-11-12 21:24:23', 1),
	(29, 'k001', NULL, 5250, 100000, 94750, '2023-11-12 21:35:54', 1),
	(30, 'k001', NULL, 5250, 10000, 4750, '2023-11-12 21:45:06', 1),
	(31, 'k001', NULL, 5250, 10000, 4750, '2023-11-12 21:46:02', 1),
	(32, 'k001', NULL, 5250, 10000, 4750, '2023-11-12 21:46:49', 1),
	(33, 'k001', NULL, 5250, 10000, 4750, '2023-11-12 21:59:33', 1),
	(34, 'k001', NULL, 5250, 100000, 94750, '2023-11-12 21:59:58', 1),
	(35, 'k001', NULL, 5250, 0, -5250, '2023-11-12 23:55:00', 1),
	(36, 'k001', NULL, 9750, 10000, 250, '2023-11-13 09:29:27', 1),
	(37, 'k001', NULL, 9750, 0, -9750, '2023-11-13 09:33:44', 1),
	(38, 'k001', NULL, 5250, 0, -5250, '2023-11-13 09:34:04', 1),
	(39, 'k001', NULL, 5250, 0, -5250, '2023-11-13 09:34:32', 1),
	(40, 'k001', NULL, 5250, 0, -5250, '2023-11-13 09:37:04', 1),
	(41, 'k001', NULL, 5250, 1, -5249, '2023-11-13 09:37:33', 1),
	(42, 'k001', NULL, -5250, 10000, 15250, '2023-11-13 09:38:25', 1),
	(43, 'k001', NULL, 5250, 100000, 94750, '2023-11-13 09:41:39', 1),
	(44, 'k001', NULL, 5250, 100000, 94750, '2023-11-13 09:46:21', 1),
	(45, 'k001', NULL, 5250, 0, -5250, '2023-11-13 09:57:58', 1),
	(46, 'k001', NULL, 5250, 100000, 94750, '2023-11-13 10:00:27', 1),
	(47, 'k001', NULL, 5250, 5400, 150, '2023-11-13 10:02:05', 1),
	(48, 'k001', NULL, 5250, 0, -5250, '2023-11-13 10:06:01', 1),
	(49, 'k001', NULL, 5250, 10000, 4750, '2023-11-13 10:07:18', 1),
	(50, 'k001', NULL, 19200, 20000, 800, '2023-11-13 10:09:43', 1),
	(51, 'k001', NULL, 9750, 10000, 250, '2023-11-13 10:12:33', 1),
	(52, 'k001', NULL, 5250, 100000, 94750, '2023-11-13 10:14:15', 1),
	(53, 'k001', NULL, 5250, 10000, 4750, '2023-11-13 10:16:43', 1),
	(54, 'k001', NULL, 5250, 100000, 94750, '2023-11-13 10:32:11', 1),
	(55, 'k001', NULL, 5250, 100000, 94750, '2023-11-13 10:33:07', 1),
	(56, 'k001', NULL, 5250, 100000, 94750, '2023-11-13 10:33:46', 1),
	(57, 'k001', NULL, 50400, 100000, 49600, '2023-11-13 11:11:41', 1),
	(58, 'k001', 'p006', 45360, 100000, 54640, '2023-11-13 11:57:51', 1),
	(59, 'k001', NULL, 50250, 1000000, 949750, '2023-11-13 13:15:25', 1),
	(60, 'k001', NULL, 24750, 100000, 75250, '2023-11-13 13:16:48', 1),
	(61, 'k001', 'p006', 43470, 100000, 56530, '2023-11-13 13:35:17', 1),
	(62, 'k001', 'p006', 45360, 50000, 4640, '2023-11-13 17:41:08', 1),
	(64, NULL, 'p006', 18900, 50000, 31100, '2023-11-15 17:16:23', 1),
	(65, NULL, NULL, 9000, 10000, 1000, '2023-11-15 17:17:19', 1),
	(66, NULL, NULL, 21000, 30000, 9000, '2023-11-15 17:19:57', 1),
	(67, NULL, NULL, 18300, 100000, 81700, '2023-11-16 14:59:53', 1),
	(68, NULL, NULL, 15000, 100000, 85000, '2023-11-17 11:09:11', 1),
	(69, 'k003', 'p006', 13500, 15000, 1500, '2023-11-17 14:58:32', 1),
	(71, NULL, 'p006', 45360, 100000, 54640, '2023-11-18 20:35:40', 1);

-- Dumping structure for table db_cafe-tahura.transaksi_detail
CREATE TABLE IF NOT EXISTS `transaksi_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `transaksi_id` int DEFAULT NULL,
  `produk_id` int DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `sub_total` int DEFAULT NULL,
  `pdam_id` int DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table db_cafe-tahura.transaksi_detail: ~111 rows (approximately)
REPLACE INTO `transaksi_detail` (`id`, `transaksi_id`, `produk_id`, `qty`, `sub_total`, `pdam_id`) VALUES
	(3, 6, 17, 2, 10500, 1),
	(4, 6, 22, 3, 18000, 1),
	(5, 7, 17, 1, 5250, 1),
	(6, 8, 17, 1, 5250, 1),
	(7, 9, 17, 1, 5250, 1),
	(8, 10, 17, 1, 5250, 1),
	(9, 11, 17, 1, 5250, 1),
	(10, 11, 17, 1, 5250, 1),
	(11, 12, 17, 1, 5250, 1),
	(12, 12, 17, 1, 5250, 1),
	(13, 12, 17, 1, 5250, 1),
	(14, 12, 15, 2, 19500, 1),
	(15, 13, 17, 1, 5250, 1),
	(16, 13, 15, 2, 19500, 1),
	(17, 14, 37, 1, 1800, 1),
	(18, 14, 39, 2, 6600, 1),
	(19, 15, 17, 1, 5250, 1),
	(20, 15, 15, 2, 19500, 1),
	(21, 16, 17, 1, 5250, 1),
	(22, 16, 15, 1, 9750, 1),
	(23, 17, 17, 2, 10500, 1),
	(24, 17, 15, 2, 19500, 1),
	(25, 18, 17, 1, 5250, 1),
	(26, 19, 15, 1, 9750, 1),
	(27, 19, 17, 2, 10500, 1),
	(28, 20, 15, 1, 9750, 1),
	(29, 20, 17, 2, 10500, 1),
	(30, 20, 15, 1, 9750, 1),
	(31, 20, 17, 2, 10500, 1),
	(32, 21, 17, 1, 5250, 1),
	(33, 21, 15, 2, 19500, 1),
	(34, 23, 17, 1, 5250, 1),
	(35, 23, 15, 2, 19500, 1),
	(36, 24, 17, 0, 0, 1),
	(37, 24, 15, 0, 0, 1),
	(38, 24, 14, 1, 8550, 1),
	(39, 25, 17, 2, 10500, 1),
	(40, 26, 17, 1, 5250, 1),
	(41, 26, 15, 2, 19500, 1),
	(42, 27, 17, 1, 5250, 1),
	(43, 27, 15, 2, 19500, 1),
	(44, 28, 17, 1, 5250, 1),
	(45, 29, 17, 1, 5250, 1),
	(46, 30, 17, 1, 5250, 1),
	(47, 31, 17, 1, 5250, 1),
	(48, 32, 17, 1, 5250, 1),
	(49, 33, 17, 1, 5250, 1),
	(50, 34, 17, 1, 5250, 1),
	(51, 34, 17, 1, 5250, 1),
	(52, 35, 17, 1, 5250, 1),
	(53, 35, 17, 1, 5250, 1),
	(54, 35, 17, 1, 5250, 1),
	(55, 36, 15, 1, 9750, 1),
	(56, 37, 15, 1, 9750, 1),
	(57, 37, 15, 1, 9750, 1),
	(58, 38, 17, 1, 5250, 1),
	(59, 39, 17, 1, 5250, 1),
	(60, 40, 17, 1, 5250, 1),
	(61, 40, 17, 1, 5250, 1),
	(62, 41, 17, 1, 5250, 1),
	(63, 41, 17, 1, 5250, 1),
	(64, 41, 17, 1, 5250, 1),
	(65, 42, 17, -1, -5250, 1),
	(66, 43, 17, 1, 5250, 1),
	(67, 44, 17, 1, 5250, 1),
	(68, 45, 17, 1, 5250, 1),
	(69, 46, 17, 1, 5250, 1),
	(70, 47, 17, 1, 5250, 1),
	(71, 48, 17, 1, 5250, 1),
	(72, 49, 17, 1, 5250, 1),
	(73, 50, 1, 1, 19200, 1),
	(74, 51, 15, 1, 9750, 1),
	(75, 52, 17, 1, 5250, 1),
	(76, 53, 17, 1, 5250, 1),
	(77, 54, 17, 1, 5250, 1),
	(78, 55, 17, 1, 5250, 1),
	(79, 56, 17, 1, 5250, 1),
	(80, 57, 17, 1, 5250, 1),
	(81, 57, 15, 2, 19500, 1),
	(82, 57, 14, 3, 25650, 1),
	(83, 58, 17, 1, 5250, 1),
	(84, 58, 15, 2, 19500, 1),
	(85, 58, 14, 3, 25650, 1),
	(86, 59, 17, 4, 21000, 1),
	(87, 59, 15, 3, 29250, 1),
	(88, 60, 17, 1, 5250, 1),
	(89, 60, 15, 2, 19500, 1),
	(90, 61, 17, 2, 10500, 1),
	(91, 61, 15, 3, 29250, 1),
	(92, 61, 14, 1, 8550, 1),
	(93, 62, 17, 1, 5250, 1),
	(94, 62, 15, 2, 19500, 1),
	(95, 62, 14, 3, 25650, 1),
	(96, 64, 18, 1, 1500, 1),
	(97, 64, 19, 2, 6000, 1),
	(98, 64, 20, 3, 13500, 1),
	(99, 65, 18, 1, 1500, 1),
	(100, 65, 19, 1, 3000, 1),
	(101, 65, 20, 1, 4500, 1),
	(102, 66, 18, 1, 1500, 1),
	(103, 66, 19, 2, 6000, 1),
	(104, 66, 20, 3, 13500, 1),
	(105, 67, 15, 1, 9750, 1),
	(106, 67, 14, 1, 8550, 1),
	(107, 68, 17, 1, 5250, 1),
	(108, 68, 15, 1, 9750, 1),
	(109, 69, 17, 1, 5250, 1),
	(110, 69, 15, 1, 9750, 1),
	(111, 71, 17, 1, 5250, 1),
	(112, 71, 15, 2, 19500, 1),
	(113, 71, 14, 3, 25650, 1);

-- Dumping structure for table db_cafe-tahura.updated
CREATE TABLE IF NOT EXISTS `updated` (
  `id` int NOT NULL AUTO_INCREMENT,
  `table_name` varchar(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `data` json DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=203 DEFAULT CHARSET=ascii ROW_FORMAT=DYNAMIC;

-- Dumping data for table db_cafe-tahura.updated: ~1 rows (approximately)
REPLACE INTO `updated` (`id`, `table_name`, `data`, `created_at`) VALUES
	(202, 'master_barang', '{"id": 11805, "kode": "BRG_0021", "nama": "Peralatan Kantor", "harga": 200000.0, "satuan": "73", "pdam_id": 4, "created_at": "2023-08-03 16:25:35.000000", "created_by": "Super Admin", "updated_at": "2023-08-09 11:29:47.000000", "kategori_id": 53}', '2023-08-09 11:30:53.900201');

-- Dumping structure for table db_cafe-tahura.user
CREATE TABLE IF NOT EXISTS `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pdam_id` int DEFAULT '1',
  `satuan_kerja_id` int DEFAULT NULL,
  `username` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nama` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_role` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '2' COMMENT '1. admin\r\n2. operator general\r\n3. by cabang',
  `state` int DEFAULT '1' COMMENT '0 Non Aktif, 1 Aktif',
  `kasir_kode` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `unq_user` (`username`,`pdam_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=235 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Dumping data for table db_cafe-tahura.user: ~5 rows (approximately)
REPLACE INTO `user` (`id`, `pdam_id`, `satuan_kerja_id`, `username`, `nama`, `password`, `id_role`, `state`, `kasir_kode`) VALUES
	(225, 1, NULL, 'owner', 'OWNER', '$2y$10$S1o3HU1rQVLoAZ4fFYjo2evixNAk7gF4qNWKEvtG6M6R49If10Z.e', '1', 1, NULL),
	(226, 1, NULL, 'k001', 'Andhika', '$2y$10$nSIeuoLO6.OGV27U4p8umeGufS543ZN17xw62WVcYHLJ6O23I3eQO', '2', 1, 'k001'),
	(232, 1, NULL, 'k002', 'Ahmad', '$2y$10$/m/7ZsMaAiNmQvYxGx6c5OqeH8pF9uy11PDzmuWl3X1Tg/KaMCTkq', '3', 1, 'k002'),
	(233, 1, NULL, 'k003', 'Derral', '$2y$10$k5wFbZ2Vp6YLxeafxe6nYePiL.hq5U7DC33R8xH.O0UuSh3FWomzu', '2', 1, 'k003'),
	(234, 1, NULL, 'superadmin', 'Super Admin', '$2y$10$jXo2KqbDtZVXj63ItWQ9su.SQ8CAnyOLbxiT5P5HOuFJhUmzR2oSS', '3', 1, 'SP');

-- Dumping structure for view db_cafe-tahura.vw_detail_produk
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `vw_detail_produk` (
	`id` INT(10) NULL,
	`id_produk` BIGINT(19) NOT NULL,
	`nama` VARCHAR(255) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`gambar` VARCHAR(255) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`hpp` INT(10) NULL,
	`harga` INT(10) NULL,
	`kategori_id` INT(10) NULL,
	`kategori` VARCHAR(255) NULL COLLATE 'utf8mb3_general_ci',
	`pdam_id` INT(10) NULL
) ENGINE=MyISAM;

-- Dumping structure for view db_cafe-tahura.vw_master_bahan
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `vw_master_bahan` (
	`id` INT(10) NOT NULL,
	`nama` VARCHAR(50) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`jumlah` INT(10) NULL,
	`id_satuan` INT(10) NULL,
	`nama_satuan` VARCHAR(50) NULL COLLATE 'utf8mb3_general_ci',
	`harga` INT(10) NULL,
	`pdam_id` INT(10) NULL
) ENGINE=MyISAM;

-- Dumping structure for view db_cafe-tahura.vw_master_produk
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `vw_master_produk` (
	`id` INT(10) NOT NULL,
	`nama` VARCHAR(255) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`gambar` VARCHAR(255) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`hpp` INT(10) NULL,
	`margin_untung` DECIMAL(20,6) NULL,
	`harga` INT(10) NULL,
	`kategori_id` INT(10) NULL,
	`kategori` VARCHAR(255) NULL COLLATE 'utf8mb3_general_ci',
	`pdam_id` INT(10) NULL
) ENGINE=MyISAM;

-- Dumping structure for view db_cafe-tahura.vw_master_produk_detail
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `vw_master_produk_detail` (
	`id` INT(10) NOT NULL,
	`produk_id` INT(10) NOT NULL,
	`bahan_id` INT(10) NOT NULL,
	`bahan` VARCHAR(50) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`jumlah_bahan` INT(10) NULL,
	`harga_bahan` INT(10) NULL,
	`jumlah` INT(10) NULL,
	`harga` INT(10) NULL,
	`pdam_id` INT(10) NULL
) ENGINE=MyISAM;

-- Dumping structure for view db_cafe-tahura.vw_produk
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `vw_produk` (
	`id` INT(10) NOT NULL,
	`nama` VARCHAR(255) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`gambar` VARCHAR(255) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`hpp` INT(10) NULL,
	`margin_untung` DECIMAL(20,6) NULL,
	`harga` BIGINT(19) NULL,
	`kategori_id` INT(10) NULL,
	`kategori` VARCHAR(255) NULL COLLATE 'utf8mb3_general_ci',
	`pdam_id` INT(10) NULL
) ENGINE=MyISAM;

-- Dumping structure for view db_cafe-tahura.vw_trans
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `vw_trans` (
	`tahun` INT(10) NULL,
	`bulan` INT(10) NULL,
	`total` DECIMAL(32,0) NULL
) ENGINE=MyISAM;

-- Dumping structure for view db_cafe-tahura.vw_transaksi
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `vw_transaksi` (
	`pdam_id` INT(10) NULL,
	`id` INT(10) NOT NULL,
	`tanggal` DATETIME NULL,
	`trans_id` BIGINT(19) NULL,
	`kode_kasir` VARCHAR(50) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`nama_kasir` VARCHAR(50) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`produk_id` BIGINT(19) NULL,
	`nama_produk` VARCHAR(255) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`qty` INT(10) NULL,
	`harga` INT(10) NULL,
	`sub_total` INT(10) NULL,
	`kode_voucher` VARCHAR(50) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`diskon` DECIMAL(2,2) NOT NULL,
	`potongan` BIGINT(19) NOT NULL,
	`total` BIGINT(19) NULL
) ENGINE=MyISAM;

-- Dumping structure for view db_cafe-tahura.vw_user
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `vw_user` 
) ENGINE=MyISAM;

-- Dumping structure for view db_cafe-tahura.vw_voucher
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `vw_voucher` (
	`id` INT(10) NOT NULL,
	`kode` VARCHAR(255) NOT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`diskon` DECIMAL(20,2) NULL,
	`qty` BIGINT(19) NOT NULL,
	`active_at` DATE NULL,
	`expired_at` DATE NULL,
	`status` VARCHAR(11) NOT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`pdam_id` INT(10) NULL
) ENGINE=MyISAM;

-- Dumping structure for trigger db_cafe-tahura.after_delete_master_kasir
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE DEFINER=`root`@`localhost` TRIGGER `after_delete_master_kasir` AFTER DELETE ON `master_kasir` FOR EACH ROW BEGIN
    DELETE FROM `user` WHERE `username` = OLD.kode; 
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger db_cafe-tahura.after_edit_master_kasir
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE DEFINER=`root`@`localhost` TRIGGER `after_edit_master_kasir` AFTER UPDATE ON `master_kasir` FOR EACH ROW BEGIN
    UPDATE `user` SET 
        `username` = NEW.kode, 
        `nama` = NEW.nama, 
        `password` = NEW.password_hash, 
        `kasir_kode` = NEW.kode 
    WHERE `username` = OLD.kode;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger db_cafe-tahura.after_insert_master_kasir
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE DEFINER=`root`@`localhost` TRIGGER `after_insert_master_kasir` AFTER INSERT ON `master_kasir` FOR EACH ROW BEGIN
    INSERT INTO user (pdam_id, username, nama, password, id_role, state, kasir_kode)
    VALUES (NEW.pdam_id, NEW.kode, NEW.nama, NEW.password_hash, '2', 1, NEW.kode);
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger db_cafe-tahura.after_insert_transaksi
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='';
DELIMITER //
CREATE DEFINER=`root`@`localhost` TRIGGER `after_insert_transaksi` AFTER INSERT ON `transaksi` FOR EACH ROW BEGIN
 IF NEW.voucher_kode IS NOT NULL THEN
        UPDATE master_voucher
        SET qty = qty - 1
        WHERE kode = NEW.voucher_kode;
    END IF;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for view db_cafe-tahura.vw_detail_produk
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `vw_detail_produk`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_detail_produk` AS select `produk`.`id` AS `id`,coalesce(`item`.`produk_id`,`produk`.`id`) AS `id_produk`,`produk`.`nama` AS `nama`,`produk`.`gambar` AS `gambar`,`produk`.`hpp` AS `hpp`,`produk`.`harga_jual` AS `harga`,`produk`.`kategori_id` AS `kategori_id`,`kategori`.`nama` AS `kategori`,`produk`.`pdam_id` AS `pdam_id` from ((`master_produk_detail` `item` left join `master_produk` `produk` on((`item`.`produk_id` = `produk`.`id`))) left join `master_kategori` `kategori` on((`produk`.`kategori_id` = `kategori`.`id`)));

-- Dumping structure for view db_cafe-tahura.vw_master_bahan
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `vw_master_bahan`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_master_bahan` AS select `bahan`.`id` AS `id`,`bahan`.`nama` AS `nama`,`bahan`.`jumlah` AS `jumlah`,`satuan`.`id` AS `id_satuan`,coalesce(`satuan`.`nama`,`bahan`.`satuan_id`) AS `nama_satuan`,`bahan`.`harga` AS `harga`,`bahan`.`pdam_id` AS `pdam_id` from (`master_bahan` `bahan` left join `master_satuan` `satuan` on((`satuan`.`id` = `bahan`.`satuan_id`)));

-- Dumping structure for view db_cafe-tahura.vw_master_produk
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `vw_master_produk`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_master_produk` AS select `produk`.`id` AS `id`,`produk`.`nama` AS `nama`,`produk`.`gambar` AS `gambar`,`produk`.`hpp` AS `hpp`,`margin`.`margin` AS `margin_untung`,`produk`.`harga_jual` AS `harga`,`produk`.`kategori_id` AS `kategori_id`,`kategori`.`nama` AS `kategori`,`produk`.`pdam_id` AS `pdam_id` from ((`master_produk` `produk` left join `master_kategori` `kategori` on((`kategori`.`id` = `produk`.`kategori_id`))) left join `master_margin` `margin` on((0 <> 1)));

-- Dumping structure for view db_cafe-tahura.vw_master_produk_detail
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `vw_master_produk_detail`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_master_produk_detail` AS select `item`.`id` AS `id`,`item`.`produk_id` AS `produk_id`,`item`.`bahan_id` AS `bahan_id`,`bahan`.`nama` AS `bahan`,`bahan`.`jumlah` AS `jumlah_bahan`,`bahan`.`harga` AS `harga_bahan`,`item`.`jumlah` AS `jumlah`,`item`.`harga` AS `harga`,`item`.`pdam_id` AS `pdam_id` from (`master_produk_detail` `item` left join `master_bahan` `bahan` on((`item`.`bahan_id` = `bahan`.`id`)));

-- Dumping structure for view db_cafe-tahura.vw_produk
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `vw_produk`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_produk` AS select `produk`.`id` AS `id`,`produk`.`nama` AS `nama`,`produk`.`gambar` AS `gambar`,`produk`.`hpp` AS `hpp`,`margin`.`margin` AS `margin_untung`,cast(((`produk`.`hpp` * `margin`.`margin`) + `produk`.`hpp`) as signed) AS `harga`,`produk`.`kategori_id` AS `kategori_id`,`kategori`.`nama` AS `kategori`,`produk`.`pdam_id` AS `pdam_id` from ((`master_produk` `produk` left join `master_kategori` `kategori` on((`kategori`.`id` = `produk`.`kategori_id`))) left join `master_margin` `margin` on((0 <> 1)));

-- Dumping structure for view db_cafe-tahura.vw_trans
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `vw_trans`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_trans` AS select year(`t`.`created_at`) AS `tahun`,month(`t`.`created_at`) AS `bulan`,sum(`t`.`total`) AS `total` from `transaksi` `t` group by year(`t`.`created_at`),month(`t`.`created_at`);

-- Dumping structure for view db_cafe-tahura.vw_transaksi
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `vw_transaksi`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_transaksi` AS select `trans`.`pdam_id` AS `pdam_id`,`detail`.`id` AS `id`,`trans`.`created_at` AS `tanggal`,coalesce(`detail`.`transaksi_id`,`trans`.`id`) AS `trans_id`,coalesce(`kasir`.`kode`,`trans`.`kode_kasir`) AS `kode_kasir`,`kasir`.`nama` AS `nama_kasir`,coalesce(`detail`.`produk_id`,`prod`.`id`) AS `produk_id`,`prod`.`nama` AS `nama_produk`,`detail`.`qty` AS `qty`,`prod`.`harga_jual` AS `harga`,`detail`.`sub_total` AS `sub_total`,`trans`.`voucher_kode` AS `kode_voucher`,cast(coalesce(`voucher`.`diskon`,0) as decimal(2,2)) AS `diskon`,cast(coalesce((`detail`.`sub_total` * `voucher`.`diskon`),0) as signed) AS `potongan`,cast((`detail`.`sub_total` - coalesce((`detail`.`sub_total` * `voucher`.`diskon`),0)) as signed) AS `total` from ((((`transaksi_detail` `detail` left join `transaksi` `trans` on((`detail`.`transaksi_id` = `trans`.`id`))) left join `master_produk` `prod` on((`detail`.`produk_id` = `prod`.`id`))) left join `master_voucher` `voucher` on((`trans`.`voucher_kode` = `voucher`.`kode`))) left join `master_kasir` `kasir` on((`trans`.`kode_kasir` = `kasir`.`kode`)));

-- Dumping structure for view db_cafe-tahura.vw_user
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `vw_user`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_user` AS select `satuan_kerja`.`kelompok_id` AS `satker_kelompok_id`,`satuan_kerja`.`kode` AS `satker_kode`,`satuan_kerja`.`nama` AS `satker_nama`,`satuan_kerja`.`long_kode` AS `satker_long_kode`,`user`.`id` AS `id`,`user`.`pdam_id` AS `pdam_id`,`user`.`satuan_kerja_id` AS `satuan_kerja_id`,`user`.`username` AS `username`,`user`.`nama` AS `nama`,`user`.`password` AS `password`,`user`.`id_role` AS `id_role`,`user`.`state` AS `state`,`role`.`role` AS `role` from ((`user` left join `role` on((`role`.`id` = `user`.`id_role`))) left join `master_satuan_kerja` `satuan_kerja` on((`satuan_kerja`.`id` = `user`.`satuan_kerja_id`)));

-- Dumping structure for view db_cafe-tahura.vw_voucher
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `vw_voucher`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_voucher` AS select `voucher`.`id` AS `id`,`voucher`.`kode` AS `kode`,cast(`voucher`.`diskon` as decimal(20,2)) AS `diskon`,coalesce(`voucher`.`qty`,0) AS `qty`,`voucher`.`active_at` AS `active_at`,`voucher`.`expired_at` AS `expired_at`,(case when ((`voucher`.`qty` > 0) and (curdate() between `voucher`.`active_at` and `voucher`.`expired_at`)) then 'Aktif' else 'Tidak Aktif' end) AS `status`,`voucher`.`pdam_id` AS `pdam_id` from `master_voucher` `voucher`;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
