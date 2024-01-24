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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- Dumping data for table db_cafe-tahura.log_akses: ~40 rows (approximately)
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
	(13, 1, '2023-11-17 01:31:50', '225', 'owner', 'OWNER', '127.0.0.1', 'localhost/cafe-tahura/panel//master/kasir/update', 'Update Data Master-Referensi Barang-Satuan', '{"nama":"Ahmad","kode":"k002","password":"superkasir","password_hash":"$2y$10$\\/m\\/7ZsMaAiNmQvYxGx6c5OqeH8pF9uy11PDzmuWl3X1Tg\\/KaMCTkq","pdam_id":"1"}', 'true', 'App\\Modules\\Defaults\\Master\\ReferensiBarang\\Satuan\\Controller', 'UPDATE'),
	(14, 1, '2023-11-20 08:55:13', '234', 'superadmin', 'Super Admin', '127.0.0.1', 'localhost/cafe-tahura/panel//master/bahan/store', 'Insert Data Master-Referensi Barang-Kategori', '{"nama":"Air","jumlah":"1000","satuan_id":"2","harga":"5000","created_at":"2023-11-20 15:55:13","pdam_id":"1"}', 'true', 'App\\Modules\\Defaults\\Master\\ReferensiBarang\\Kategori\\Controller', 'INSERT'),
	(15, 1, '2023-11-20 08:55:34', '234', 'superadmin', 'Super Admin', '127.0.0.1', 'localhost/cafe-tahura/panel//master/bahan/update', 'Update Data Master-Referensi Barang-Kategori', '{"nama":"Kentang","jumlah":"1000","satuan_id":"1","harga":"15000","updated_at":"2023-11-20 15:55:34","pdam_id":"1"}', 'true', 'App\\Modules\\Defaults\\Master\\ReferensiBarang\\Kategori\\Controller', 'UPDATE'),
	(16, 1, '2023-11-20 08:55:51', '234', 'superadmin', 'Super Admin', '127.0.0.1', 'localhost/cafe-tahura/panel//master/bahan/update', 'Update Data Master-Referensi Barang-Kategori', '{"nama":"Gula","jumlah":"1000","satuan_id":"1","harga":"50000","updated_at":"2023-11-20 15:55:51","pdam_id":"1"}', 'true', 'App\\Modules\\Defaults\\Master\\ReferensiBarang\\Kategori\\Controller', 'UPDATE'),
	(17, 1, '2023-11-20 08:56:00', '234', 'superadmin', 'Super Admin', '127.0.0.1', 'localhost/cafe-tahura/panel//master/bahan/update', 'Update Data Master-Referensi Barang-Kategori', '{"nama":"Coklat","jumlah":"1000","satuan_id":"1","harga":"150000","updated_at":"2023-11-20 15:56:00","pdam_id":"1"}', 'true', 'App\\Modules\\Defaults\\Master\\ReferensiBarang\\Kategori\\Controller', 'UPDATE'),
	(18, 1, '2023-11-20 08:56:23', '234', 'superadmin', 'Super Admin', '127.0.0.1', 'localhost/cafe-tahura/panel//master/bahan/update', 'Update Data Master-Referensi Barang-Kategori', '{"nama":"Cup","jumlah":"1","satuan_id":"3","harga":"500","updated_at":"2023-11-20 15:56:23","pdam_id":"1"}', 'true', 'App\\Modules\\Defaults\\Master\\ReferensiBarang\\Kategori\\Controller', 'UPDATE'),
	(19, 1, '2023-11-20 08:56:31', '234', 'superadmin', 'Super Admin', '127.0.0.1', 'localhost/cafe-tahura/panel//master/bahan/update', 'Update Data Master-Referensi Barang-Kategori', '{"nama":"Boba","jumlah":"1000","satuan_id":"1","harga":"50000","updated_at":"2023-11-20 15:56:31","pdam_id":"1"}', 'true', 'App\\Modules\\Defaults\\Master\\ReferensiBarang\\Kategori\\Controller', 'UPDATE'),
	(20, 1, '2023-11-20 08:56:42', '234', 'superadmin', 'Super Admin', '127.0.0.1', 'localhost/cafe-tahura/panel//master/bahan/update', 'Update Data Master-Referensi Barang-Kategori', '{"nama":"Kopi","jumlah":"1000","satuan_id":"1","harga":"100000","updated_at":"2023-11-20 15:56:42","pdam_id":"1"}', 'true', 'App\\Modules\\Defaults\\Master\\ReferensiBarang\\Kategori\\Controller', 'UPDATE'),
	(21, 1, '2023-11-20 09:10:47', '234', 'superadmin', 'Super Admin', '127.0.0.1', 'localhost/cafe-tahura/panel//master/bahan/store', 'Insert Data Master-Referensi Barang-Kategori', '{"nama":"Tepung Terigu","jumlah":"1000","satuan_id":"1","harga":"15000","created_at":"2023-11-20 16:10:47","pdam_id":"1"}', 'true', 'App\\Modules\\Defaults\\Master\\ReferensiBarang\\Kategori\\Controller', 'INSERT'),
	(22, 1, '2023-11-24 03:49:12', '234', 'superadmin', 'Super Admin', '127.0.0.1', 'localhost/cafe-tahura/panel//master/produk/delete?id=55', 'Delete Data Master-Referensi Barang-Barang', '{"id":"55"}', 'true', 'App\\Modules\\Defaults\\Master\\ReferensiBarang\\Barang\\Controller', 'DELETE'),
	(23, 1, '2023-11-24 03:49:15', '234', 'superadmin', 'Super Admin', '127.0.0.1', 'localhost/cafe-tahura/panel//master/produk/delete?id=51', 'Delete Data Master-Referensi Barang-Barang', '{"id":"51"}', 'true', 'App\\Modules\\Defaults\\Master\\ReferensiBarang\\Barang\\Controller', 'DELETE'),
	(24, 1, '2023-11-24 09:24:09', '234', 'superadmin', 'Super Admin', '127.0.0.1', 'localhost/cafe-tahura/panel//master/produk/delete?id=25', 'Delete Data Master-Referensi Barang-Barang', '{"id":"25"}', 'true', 'App\\Modules\\Defaults\\Master\\ReferensiBarang\\Barang\\Controller', 'DELETE'),
	(25, 1, '2023-11-24 09:24:17', '234', 'superadmin', 'Super Admin', '127.0.0.1', 'localhost/cafe-tahura/panel//master/produk/delete?id=49', 'Delete Data Master-Referensi Barang-Barang', '{"id":"49"}', 'true', 'App\\Modules\\Defaults\\Master\\ReferensiBarang\\Barang\\Controller', 'DELETE'),
	(26, 1, '2023-11-24 09:24:53', '234', 'superadmin', 'Super Admin', '127.0.0.1', 'localhost/cafe-tahura/panel//master/produk/delete?id=43', 'Delete Data Master-Referensi Barang-Barang', '{"id":"43"}', 'true', 'App\\Modules\\Defaults\\Master\\ReferensiBarang\\Barang\\Controller', 'DELETE'),
	(27, 1, '2023-11-24 09:24:59', '234', 'superadmin', 'Super Admin', '127.0.0.1', 'localhost/cafe-tahura/panel//master/produk/delete?id=42', 'Delete Data Master-Referensi Barang-Barang', '{"id":"42"}', 'true', 'App\\Modules\\Defaults\\Master\\ReferensiBarang\\Barang\\Controller', 'DELETE'),
	(28, 1, '2023-11-24 09:25:11', '234', 'superadmin', 'Super Admin', '127.0.0.1', 'localhost/cafe-tahura/panel//master/produk/delete?id=41', 'Delete Data Master-Referensi Barang-Barang', '{"id":"41"}', 'true', 'App\\Modules\\Defaults\\Master\\ReferensiBarang\\Barang\\Controller', 'DELETE'),
	(29, 1, '2023-11-24 09:27:10', '234', 'superadmin', 'Super Admin', '127.0.0.1', 'localhost/cafe-tahura/panel//master/produk/delete?id=45', 'Delete Data Master-Referensi Barang-Barang', '{"id":"45"}', 'true', 'App\\Modules\\Defaults\\Master\\ReferensiBarang\\Barang\\Controller', 'DELETE'),
	(30, 1, '2023-11-24 09:27:21', '234', 'superadmin', 'Super Admin', '127.0.0.1', 'localhost/cafe-tahura/panel//master/produk/delete?id=33', 'Delete Data Master-Referensi Barang-Barang', '{"id":"33"}', 'true', 'App\\Modules\\Defaults\\Master\\ReferensiBarang\\Barang\\Controller', 'DELETE'),
	(31, 1, '2023-11-25 08:14:38', '234', 'superadmin', 'Super Admin', '127.0.0.1', 'localhost/cafe-tahura/panel//master/kasir/store', 'Insert Data Master-Referensi Barang-Satuan', '{"nama":"Hadi","kode":"k009","password":"superkasir","password_hash":"$2y$10$0kfpoyvQV49hziDPfyDkbetTAgmD8VJX5Caj0HKbUOdCGboeAYJua","pdam_id":"1"}', 'true', 'App\\Modules\\Defaults\\Master\\ReferensiBarang\\Satuan\\Controller', 'INSERT'),
	(32, 1, '2023-11-27 03:09:56', '234', 'superadmin', 'Super Admin', '127.0.0.1', 'localhost/cafe-tahura/panel//master/produk/delete?id=56', 'Delete Data Master-Referensi Barang-Barang', '{"id":"56"}', 'true', 'App\\Modules\\Defaults\\Master\\ReferensiBarang\\Barang\\Controller', 'DELETE'),
	(33, 1, '2023-11-27 03:10:01', '234', 'superadmin', 'Super Admin', '127.0.0.1', 'localhost/cafe-tahura/panel//master/produk/delete?id=57', 'Delete Data Master-Referensi Barang-Barang', '{"id":"57"}', 'true', 'App\\Modules\\Defaults\\Master\\ReferensiBarang\\Barang\\Controller', 'DELETE'),
	(34, 1, '2023-11-27 06:54:59', '234', 'superadmin', 'Super Admin', '127.0.0.1', 'localhost/cafe-tahura/panel//master/voucher/store', 'Insert Data Master-Referensi Barang-Barang', '{"kode":"p007","diskon":"0.09","qty":"7","active_at":"2023-11-14","expired_at":"2023-11-30","pdam_id":"1"}', 'true', 'App\\Modules\\Defaults\\Master\\ReferensiBarang\\Barang\\Controller', 'INSERT'),
	(35, 1, '2023-11-27 06:55:52', '234', 'superadmin', 'Super Admin', '127.0.0.1', 'localhost/cafe-tahura/panel//master/kasir/update', 'Update Data Master-Referensi Barang-Satuan', '{"nama":"Jhon","kode":"k005","password":"superkasir","password_hash":"$2y$10$wffDNviC571FqbkHsRPkcON4JcbD8HOPHpeeo7anprh2TFWRbBN86","pdam_id":"1"}', 'true', 'App\\Modules\\Defaults\\Master\\ReferensiBarang\\Satuan\\Controller', 'UPDATE'),
	(36, 1, '2023-11-29 02:18:41', '234', 'superadmin', 'Super Admin', '::1', 'localhost/cafe-tahura/panel//master/voucher/update', 'Update Data Master-Referensi Barang-Barang', '{"kode":"p007","diskon":"0.09","qty":"10","active_at":"2023-11-14","expired_at":"2023-11-30","pdam_id":"1"}', 'true', 'App\\Modules\\Defaults\\Master\\ReferensiBarang\\Barang\\Controller', 'UPDATE'),
	(37, 1, '2023-11-29 04:24:04', '234', 'superadmin', 'Super Admin', '::1', 'localhost/cafe-tahura/panel//master/voucher/update', 'Update Data Master-Referensi Barang-Barang', '{"kode":"p007","diskon":"0.09","qty":"100","active_at":"2023-11-14","expired_at":"2023-11-30","pdam_id":"1"}', 'true', 'App\\Modules\\Defaults\\Master\\ReferensiBarang\\Barang\\Controller', 'UPDATE'),
	(38, 1, '2023-12-04 09:20:48', '234', 'superadmin', 'Super Admin', '::1', 'localhost/cafe-tahura/panel//master/voucher/update', 'Update Data Master-Referensi Barang-Barang', '{"kode":"p007","diskon":"0.09","qty":"88","active_at":"2023-11-14","expired_at":"2023-12-09","pdam_id":"1"}', 'true', 'App\\Modules\\Defaults\\Master\\ReferensiBarang\\Barang\\Controller', 'UPDATE'),
	(39, 1, '2023-12-06 09:13:15', '234', 'superadmin', 'Super Admin', '127.0.0.1', 'localhost/cafe-tahura/panel//master/produk/delete?id=58', 'Delete Data Master-Referensi Barang-Barang', '{"id":"58"}', 'true', 'App\\Modules\\Defaults\\Master\\ReferensiBarang\\Barang\\Controller', 'DELETE'),
	(40, 1, '2023-12-30 17:14:15', '234', 'superadmin', 'Super Admin', '::1', 'localhost/cafe-tahura/panel//master/voucher/store', 'Insert Data Master-Referensi Barang-Barang', '{"kode":"narda","diskon":"0.10","qty":"3","active_at":"2023-12-31","expired_at":"2024-01-10","pdam_id":"1"}', 'true', 'App\\Modules\\Defaults\\Master\\ReferensiBarang\\Barang\\Controller', 'INSERT');

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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table db_cafe-tahura.master_bahan: ~9 rows (approximately)
REPLACE INTO `master_bahan` (`id`, `nama`, `jumlah`, `satuan_id`, `harga`, `pdam_id`) VALUES
	(1, 'Kopi', 1000, 1, 100000, 1),
	(6, 'Boba', 1000, 1, 50000, 1),
	(8, 'Cup', 1, 3, 500, 1),
	(9, 'susu full cream', 1000, 2, 30000, 1),
	(10, 'Coklat', 1000, 1, 150000, 1),
	(11, 'Gula', 1000, 1, 50000, 1),
	(13, 'Kentang', 1000, 1, 15000, 1),
	(14, 'Air', 1000, 2, 5000, 1),
	(15, 'Tepung Terigu', 1000, 1, 15000, 1);

-- Dumping structure for table db_cafe-tahura.master_kasir
CREATE TABLE IF NOT EXISTS `master_kasir` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0',
  `kode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0',
  `password` varchar(50) DEFAULT '0',
  `password_hash` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0',
  `pdam_id` int DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table db_cafe-tahura.master_kasir: ~6 rows (approximately)
REPLACE INTO `master_kasir` (`id`, `nama`, `kode`, `password`, `password_hash`, `pdam_id`) VALUES
	(1, 'Andhika', 'k001', 'superkasir', '$2y$10$nSIeuoLO6.OGV27U4p8umeGufS543ZN17xw62WVcYHLJ6O23I3eQO', 1),
	(2, 'Ahmad', 'k002', 'superkasir', '$2y$10$/m/7ZsMaAiNmQvYxGx6c5OqeH8pF9uy11PDzmuWl3X1Tg/KaMCTkq', 1),
	(3, 'Derral', 'k003', 'superkasir', '$2y$10$k5wFbZ2Vp6YLxeafxe6nYePiL.hq5U7DC33R8xH.O0UuSh3FWomzu', 1),
	(10, 'Jimy Santoso', 'k004', 'superkasir', '0', 1),
	(11, 'Jhon', 'k005', 'superkasir', '$2y$10$wffDNviC571FqbkHsRPkcON4JcbD8HOPHpeeo7anprh2TFWRbBN86', 1),
	(12, 'Hadi', 'k009', 'superkasir', '$2y$10$0kfpoyvQV49hziDPfyDkbetTAgmD8VJX5Caj0HKbUOdCGboeAYJua', 1);

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
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table db_cafe-tahura.master_produk: ~26 rows (approximately)
REPLACE INTO `master_produk` (`id`, `kategori_id`, `nama`, `gambar`, `hpp`, `harga_jual`, `pdam_id`) VALUES
	(1, 1, 'Coffe With Boba', '0f3e652d2f7bda8a47ca2396926e8011.png', 7060, 10590, 1),
	(14, 2, 'Kentang Goreng', '2a8da0af67c16543e377ec37ac3b8d55.png', 3600, 5400, 1),
	(15, 1, 'Coffee Milk', '27316efe75dcb62359dea5f900402abb.png', 3850, 5775, 1),
	(17, 1, 'Teh Manis', 'cbbce47a436d08310d3f0f54e3e9e830.png', 3850, 5775, 1),
	(18, 1, 'Americano', 'bcd07974df57dba4f3026259891e9802.png', 3850, 5775, 1),
	(19, 1, 'Latte', 'ff6448ff2adf1f1f94b0a66237c13f07.png', 5800, 8700, 1),
	(20, 1, 'Cappucino', '154e6a0a696be708ad965b8f74d02b63.png', 8000, 12000, 1),
	(22, 1, 'Mocha', 'c65b28cb51f86934be183d8f80ca27e5.png', 3950, 5925, 1),
	(23, 1, 'Cold Brew', 'a4f7a6bec291f679734881cc308a03dd.png', 5700, 8550, 1),
	(24, 1, 'Affogato', 'b8fc800880659f17a0db26839773fb2a.png', 2760, 4140, 1),
	(26, 2, 'Cake', 'bd8bc6dbab5d7e3fedcbda6196d93aa5.png', 1900, 2850, 1),
	(27, 2, 'Pastry', 'd40573f23ea41e15d1c15c35a0e4eac5.png', 1710, 2565, 1),
	(28, 2, 'Sandwich', 'ef89d9a6c41c349265ff48ca70d2a15b.png', 775, 11625, 1),
	(29, 2, 'Pasta', '9d6729e20c3ae92c630ca9082ec22fc4.png', 6660, 9990, 1),
	(30, 2, 'Muffin', '2cc11053924b60be6d816b4fa79c6bae.png', 1545, 23175, 1),
	(31, 2, 'Pancake', 'e999af7a1984e55760dd259f57132b9e.png', 950, 1425, 1),
	(32, 2, 'Burger', 'bf5c44e5a1a433be217a0ba999b52586.png', 10080, 15120, 1),
	(34, 2, 'Pie', '062daee7623f46ec3f4d189a34258494.png', 25000, 37500, 1),
	(35, 3, 'Es Campur', 'aac451cb6514adf43aef85191f59db14.png', 4000, 6000, 1),
	(36, 3, 'Cendol', 'be57217103e6f0039460e556bd91d48f.png', 6500, 9750, 1),
	(37, 3, 'Es Pisang Ijo', '5a0dc79d345c593b4a814f733c506467.png', 4850, 7275, 1),
	(39, 3, 'Ice Cream', 'f815241f885aff96da8d4a80a43540ea.png', 3100, 4650, 1),
	(40, 3, 'Klepon', '3fe38643ac0127fc42606f0af7fea71e.png', 3200, 4800, 1),
	(44, 3, 'Tiramisu', 'ce2cdf7e1d74ac2cacb7e4736a2104df.png', 3050, 4575, 1),
	(54, 1, 'Jus Alpukat', 'e5ce430c4c53d32f45c4e200245d7a85.png', 6550, 9825, 1),
	(59, 1, 'es cendol hijau', '7bca71e6375e643e18ba3f9e1c161836.png', 1050, 1575, 1);

-- Dumping structure for table db_cafe-tahura.master_produk_detail
CREATE TABLE IF NOT EXISTS `master_produk_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `produk_id` int NOT NULL,
  `bahan_id` int NOT NULL,
  `jumlah` int DEFAULT NULL,
  `harga` int DEFAULT NULL,
  `pdam_id` int DEFAULT '1',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `id` (`id`),
  KEY `FK_master_produk_detail_master_bahan` (`bahan_id`),
  CONSTRAINT `FK_master_produk_detail_master_bahan` FOREIGN KEY (`bahan_id`) REFERENCES `master_bahan` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table db_cafe-tahura.master_produk_detail: ~113 rows (approximately)
REPLACE INTO `master_produk_detail` (`id`, `produk_id`, `bahan_id`, `jumlah`, `harga`, `pdam_id`) VALUES
	(1, 1, 8, 7, 3500, 1),
	(2, 1, 1, 8, 800, 1),
	(5, 54, 8, 13, 6500, 1),
	(7, 14, 1, 6, 600, 1),
	(8, 14, 8, 6, 3000, 1),
	(9, 1, 11, 55, 2750, 1),
	(11, 20, 8, 16, 8000, 1),
	(12, 27, 1, 7, 700, 1),
	(13, 27, 8, 2, 1000, 1),
	(14, 27, 11, 51, 2550, 1),
	(15, 32, 1, 7, 700, 1),
	(16, 32, 8, 50, 25000, 1),
	(17, 32, 11, 51, 2550, 1),
	(18, 17, 1, 3, 300, 1),
	(19, 17, 8, 2, 1000, 1),
	(20, 17, 11, 51, 2550, 1),
	(21, 26, 1, 7, 700, 1),
	(22, 26, 8, 2, 1000, 1),
	(23, 26, 11, 51, 2550, 1),
	(24, 30, 1, 1, 100, 1),
	(25, 30, 8, 2, 1000, 1),
	(26, 30, 11, 51, 2550, 1),
	(27, 15, 1, 3, 300, 1),
	(28, 15, 8, 2, 1000, 1),
	(29, 15, 11, 51, 2550, 1),
	(30, 19, 1, 6, 600, 1),
	(31, 19, 8, 5, 2500, 1),
	(32, 19, 11, 54, 2700, 1),
	(33, 18, 1, 3, 300, 1),
	(34, 18, 8, 2, 1000, 1),
	(35, 18, 11, 51, 2550, 1),
	(36, 22, 1, 3, 300, 1),
	(37, 22, 8, 2, 1000, 1),
	(38, 22, 11, 53, 2650, 1),
	(39, 28, 1, 7, 700, 1),
	(40, 28, 8, 2, 1000, 1),
	(41, 28, 11, 51, 2550, 1),
	(42, 29, 1, 1, 100, 1),
	(43, 29, 8, 2, 1000, 1),
	(45, 23, 1, 5, 500, 1),
	(46, 23, 8, 5, 2500, 1),
	(47, 23, 11, 54, 2700, 1),
	(48, 24, 1, 7, 700, 1),
	(49, 24, 8, 50, 25000, 1),
	(50, 24, 11, 51, 2550, 1),
	(54, 40, 1, 2, 200, 1),
	(55, 40, 8, 1, 500, 1),
	(56, 40, 11, 50, 2500, 1),
	(57, 39, 1, 4, 400, 1),
	(58, 39, 8, 1, 500, 1),
	(59, 39, 11, 54, 2700, 1),
	(60, 37, 1, 7, 700, 1),
	(61, 37, 8, 3, 1500, 1),
	(62, 37, 11, 53, 2650, 1),
	(63, 36, 1, 7, 700, 1),
	(64, 36, 8, 7, 3500, 1),
	(65, 36, 11, 60, 3000, 1),
	(66, 35, 1, 7, 700, 1),
	(67, 35, 8, 7, 3500, 1),
	(68, 35, 11, 80, 4000, 1),
	(69, 34, 1, 7, 700, 1),
	(70, 34, 8, 50, 25000, 1),
	(71, 34, 11, 80, 4000, 1),
	(72, 31, 1, 1, 100, 1),
	(73, 31, 8, 2, 1000, 1),
	(74, 31, 11, 51, 2550, 1),
	(75, 1, 14, 2, 10, 1),
	(78, 20, 1, 3, 300, 1),
	(79, 20, 11, 51, 2550, 1),
	(80, 44, 8, 6, 3000, 1),
	(81, 44, 11, 1, 50, 1),
	(82, 54, 11, 1, 50, 1),
	(83, 24, 9, 2, 60, 1),
	(84, 24, 10, 1, 150, 1),
	(85, 32, 9, 2, 60, 1),
	(86, 32, 10, 1, 150, 1),
	(87, 32, 13, 2, 30, 1),
	(88, 32, 15, 15, 7500, 1),
	(89, 26, 9, 2, 60, 1),
	(90, 26, 10, 1, 150, 1),
	(91, 26, 13, 2, 30, 1),
	(92, 26, 15, 50, 750, 1),
	(93, 27, 9, 50, 1500, 1),
	(94, 27, 10, 1, 150, 1),
	(95, 27, 13, 2, 30, 1),
	(96, 27, 15, 50, 750, 1),
	(97, 28, 9, 50, 1500, 1),
	(98, 28, 10, 1, 150, 1),
	(99, 28, 13, 2, 30, 1),
	(100, 28, 15, 50, 750, 1),
	(101, 28, 14, 2, 10, 1),
	(102, 31, 9, 50, 1500, 1),
	(103, 31, 10, 1, 150, 1),
	(104, 31, 13, 50, 750, 1),
	(105, 31, 15, 50, 750, 1),
	(106, 31, 14, 2, 10, 1),
	(107, 31, 6, 2, 100, 1),
	(108, 30, 9, 50, 1500, 1),
	(109, 30, 10, 1, 150, 1),
	(110, 30, 13, 1, 15, 1),
	(111, 30, 15, 2, 30, 1),
	(112, 30, 14, 2, 10, 1),
	(113, 30, 6, 2, 100, 1),
	(114, 29, 11, 51, 2550, 1),
	(115, 29, 9, 50, 1500, 1),
	(116, 29, 10, 1, 150, 1),
	(117, 29, 13, 11, 5500, 1),
	(118, 29, 15, 11, 1100, 1),
	(119, 29, 14, 12, 60, 1),
	(120, 29, 6, 2, 100, 1),
	(124, 59, 8, 0, 500, 1),
	(125, 59, 1, 0, 500, 1),
	(126, 59, 11, 0, 50, 1);

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table db_cafe-tahura.master_voucher: ~8 rows (approximately)
REPLACE INTO `master_voucher` (`id`, `kode`, `diskon`, `qty`, `active_at`, `expired_at`, `pdam_id`) VALUES
	(1, 'p001', 0.03, 4, '2023-10-30', '2023-11-03', 1),
	(3, 'p003', 0.01, 2, '2023-10-30', '2023-11-01', 1),
	(4, 'p004', 0.04, 0, '2023-10-30', '2023-11-30', 1),
	(5, 'p005', 0.03, 4, '2023-10-30', '2023-11-03', 1),
	(6, 'p002', 0.10, -1, '2023-10-30', '2023-11-30', 1),
	(7, 'p006', 0.10, 0, '2023-11-13', '2023-12-13', 1),
	(8, 'p007', 0.09, 80, '2023-11-14', '2024-01-05', 1),
	(9, 'narda', 0.10, 2, '2023-12-31', '2024-01-10', 1);

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

-- Dumping data for table db_cafe-tahura.menu_otorisasi: ~28 rows (approximately)
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
	(43, 1, 43, 1),
	(2368, 1, 44, 1),
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
	(2388, 1, 21, 3);

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

-- Dumping data for table db_cafe-tahura.role: ~20 rows (approximately)
REPLACE INTO `role` (`id`, `pdam_id`, `satuan_kerja_id`, `role`, `status`) VALUES
	(1, 1, 0, 'superadmin', 1),
	(2, 0, 0, 'superadmin', 1),
	(3, 1, 0, 'superadmin', 1),
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
  `grand_total` int DEFAULT NULL,
  `bayar` int DEFAULT NULL,
  `kembalian` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `pdam_id` int DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=198 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table db_cafe-tahura.transaksi: ~166 rows (approximately)
REPLACE INTO `transaksi` (`id`, `kode_kasir`, `voucher_kode`, `total`, `grand_total`, `bayar`, `kembalian`, `created_at`, `pdam_id`) VALUES
	(2, '0', 'p004', 10080, NULL, NULL, NULL, '2023-11-07 09:04:19', 1),
	(3, '0', 'p004', 23760, NULL, NULL, NULL, '2023-11-07 09:08:19', 1),
	(4, '0', 'p004', 23760, NULL, NULL, NULL, '2023-11-07 09:11:12', 1),
	(6, '0', 'p004', 27360, NULL, NULL, NULL, '2023-11-07 10:24:33', 1),
	(7, '0', 'p004', 5040, NULL, NULL, NULL, '2023-11-07 11:06:21', 1),
	(9, 'k001', 'p004', 5040, NULL, NULL, NULL, '2023-11-07 11:09:15', 1),
	(10, 'k001', NULL, 5040, NULL, NULL, NULL, '2023-11-07 13:36:00', 1),
	(11, 'k001', NULL, 5040, NULL, NULL, NULL, '2023-11-07 13:36:04', 1),
	(12, 'k001', NULL, 23760, NULL, NULL, NULL, '2023-11-07 13:36:28', 1),
	(13, 'k001', 'p004', 23760, NULL, NULL, NULL, '2023-11-07 13:38:42', 1),
	(14, NULL, NULL, 8400, NULL, NULL, NULL, '2023-11-07 14:08:24', 1),
	(15, NULL, NULL, 24750, NULL, NULL, NULL, '2023-11-08 11:31:28', 1),
	(16, NULL, NULL, 15000, NULL, NULL, NULL, '2023-11-08 16:57:49', 1),
	(17, NULL, NULL, 30000, NULL, NULL, NULL, '2023-11-08 17:18:20', 1),
	(18, NULL, NULL, 5250, NULL, NULL, NULL, '2023-11-08 17:20:22', 1),
	(19, NULL, 'p004', 19440, NULL, NULL, NULL, '2023-11-09 15:26:52', 1),
	(20, NULL, 'p004', 19440, NULL, NULL, NULL, '2023-11-09 15:27:11', 1),
	(21, NULL, 'p004', 23760, NULL, NULL, NULL, '2023-11-09 15:28:15', 1),
	(23, 'k001', 'p004', 23760, NULL, 30000, 6240, '2023-11-09 17:09:45', 1),
	(24, 'k001', NULL, 8550, NULL, 10000, 1450, '2023-11-12 17:55:55', 1),
	(25, 'k001', 'p004', 10080, NULL, 100000, 89920, '2023-11-12 17:58:25', 1),
	(26, 'k001', NULL, 24750, NULL, 100000, 75250, '2023-11-12 18:04:58', 1),
	(27, 'k001', NULL, 24750, NULL, 24750, 0, '2023-11-12 21:21:55', 1),
	(28, 'k001', NULL, 5250, NULL, 10000, 4750, '2023-11-12 21:24:23', 1),
	(29, 'k001', NULL, 5250, NULL, 100000, 94750, '2023-11-12 21:35:54', 1),
	(30, 'k001', NULL, 5250, NULL, 10000, 4750, '2023-11-12 21:45:06', 1),
	(31, 'k001', NULL, 5250, NULL, 10000, 4750, '2023-11-12 21:46:02', 1),
	(32, 'k001', NULL, 5250, NULL, 10000, 4750, '2023-11-12 21:46:49', 1),
	(33, 'k001', NULL, 5250, NULL, 10000, 4750, '2023-11-12 21:59:33', 1),
	(34, 'k001', NULL, 5250, NULL, 100000, 94750, '2023-11-12 21:59:58', 1),
	(35, 'k001', NULL, 5250, NULL, 0, -5250, '2023-11-12 23:55:00', 1),
	(36, 'k001', NULL, 9750, NULL, 10000, 250, '2023-11-13 09:29:27', 1),
	(37, 'k001', NULL, 9750, NULL, 0, -9750, '2023-11-13 09:33:44', 1),
	(38, 'k001', NULL, 5250, NULL, 0, -5250, '2023-11-13 09:34:04', 1),
	(39, 'k001', NULL, 5250, NULL, 0, -5250, '2023-11-13 09:34:32', 1),
	(40, 'k001', NULL, 5250, NULL, 0, -5250, '2023-11-13 09:37:04', 1),
	(41, 'k001', NULL, 5250, NULL, 1, -5249, '2023-11-13 09:37:33', 1),
	(42, 'k001', NULL, -5250, NULL, 10000, 15250, '2023-11-13 09:38:25', 1),
	(43, 'k001', NULL, 5250, NULL, 100000, 94750, '2023-11-13 09:41:39', 1),
	(44, 'k001', NULL, 5250, NULL, 100000, 94750, '2023-11-13 09:46:21', 1),
	(45, 'k001', NULL, 5250, NULL, 0, -5250, '2023-11-13 09:57:58', 1),
	(46, 'k001', NULL, 5250, NULL, 100000, 94750, '2023-11-13 10:00:27', 1),
	(47, 'k001', NULL, 5250, NULL, 5400, 150, '2023-11-13 10:02:05', 1),
	(48, 'k001', NULL, 5250, NULL, 0, -5250, '2023-11-13 10:06:01', 1),
	(49, 'k001', NULL, 5250, NULL, 10000, 4750, '2023-11-13 10:07:18', 1),
	(50, 'k001', NULL, 19200, NULL, 20000, 800, '2023-11-13 10:09:43', 1),
	(51, 'k001', NULL, 9750, NULL, 10000, 250, '2023-11-13 10:12:33', 1),
	(52, 'k001', NULL, 5250, NULL, 100000, 94750, '2023-11-13 10:14:15', 1),
	(53, 'k001', NULL, 5250, NULL, 10000, 4750, '2023-11-13 10:16:43', 1),
	(54, 'k001', NULL, 5250, NULL, 100000, 94750, '2023-11-13 10:32:11', 1),
	(55, 'k001', NULL, 5250, NULL, 100000, 94750, '2023-11-13 10:33:07', 1),
	(56, 'k001', NULL, 5250, NULL, 100000, 94750, '2023-11-13 10:33:46', 1),
	(57, 'k001', NULL, 50400, NULL, 100000, 49600, '2023-11-13 11:11:41', 1),
	(58, 'k001', 'p006', 45360, NULL, 100000, 54640, '2023-11-13 11:57:51', 1),
	(59, 'k001', NULL, 50250, NULL, 1000000, 949750, '2023-11-13 13:15:25', 1),
	(60, 'k001', NULL, 24750, NULL, 100000, 75250, '2023-11-13 13:16:48', 1),
	(61, 'k001', 'p006', 43470, NULL, 100000, 56530, '2023-11-13 13:35:17', 1),
	(62, 'k001', 'p006', 45360, NULL, 50000, 4640, '2023-11-13 17:41:08', 1),
	(64, NULL, 'p006', 18900, NULL, 50000, 31100, '2023-11-15 17:16:23', 1),
	(65, NULL, NULL, 9000, NULL, 10000, 1000, '2023-11-15 17:17:19', 1),
	(66, NULL, NULL, 21000, NULL, 30000, 9000, '2023-11-15 17:19:57', 1),
	(67, NULL, NULL, 18300, NULL, 100000, 81700, '2023-11-16 14:59:53', 1),
	(68, NULL, NULL, 15000, NULL, 100000, 85000, '2023-11-17 11:09:11', 1),
	(69, 'k003', 'p006', 13500, NULL, 15000, 1500, '2023-11-17 14:58:32', 1),
	(71, NULL, 'p006', 45360, NULL, 100000, 54640, '2023-11-18 20:35:40', 1),
	(72, 'Owner', NULL, 35250, NULL, 500000, 464750, '2023-11-20 10:04:38', 1),
	(74, 'Owner', NULL, 42450, NULL, 50000, 7550, '2023-11-20 16:29:20', 1),
	(75, 'Super Admin', NULL, 41250, NULL, 50000, 8750, '2023-11-20 16:31:27', 1),
	(77, 'Super Admin', NULL, 229500, NULL, 1, 0, '2023-11-20 17:36:55', 1),
	(78, 'Super Admin', NULL, 55650, NULL, 100000, 44350, '2023-11-21 09:22:37', 1),
	(80, 'Owner', NULL, 9750, NULL, 10000, 250, '2023-11-22 09:12:55', 1),
	(81, 'Owner', NULL, 9750, NULL, 110000, 100250, '2023-11-22 09:15:07', 1),
	(82, 'Owner', NULL, 9750, NULL, 10000, 250, '2023-11-22 09:16:00', 1),
	(83, 'Owner', NULL, 1500, NULL, 2000, 500, '2023-11-22 13:30:12', 1),
	(84, 'Owner', NULL, 171785, NULL, 200000, 28215, '2023-11-22 13:30:54', 1),
	(99, 'k001', NULL, 1000000, NULL, 1000000, 0, '2023-10-17 17:45:54', 1),
	(100, 'Super Admin', NULL, 1000000, NULL, 1000000, 1000000, '2022-09-22 14:10:21', 1),
	(101, 'Super Admin', NULL, 23100, NULL, 30000, 6900, '2023-11-22 18:50:42', 1),
	(102, 'k001', NULL, 160350, NULL, 200000, 39650, '2023-11-23 09:49:26', 1),
	(103, 'k001', NULL, 31050, NULL, 50000, 18950, '2023-11-23 11:47:02', 1),
	(104, 'k001', NULL, 23550, NULL, 100000, 76450, '2023-11-23 15:13:00', 1),
	(105, 'k001', 'p002', 23100, NULL, 50000, 26900, '2023-11-23 15:14:04', 1),
	(106, 'k001', 'p002', 525000, NULL, 600000, 75000, '2023-08-23 15:18:31', 1),
	(107, 'k001', 'p002', 682500, NULL, 700000, 17500, '2023-09-23 15:19:21', 1),
	(108, 'k001', 'p006', 540000, NULL, 600000, 60000, '2023-08-23 15:41:04', 1),
	(109, 'k001', 'p006', 614250, NULL, 700000, 85750, '2023-07-23 15:46:39', 1),
	(110, 'Super Admin', '0', 480000, NULL, 500000, 20000, '2023-05-23 15:49:04', 1),
	(111, 'Super Admin', 'p006', 769500, NULL, 800000, 30500, '2023-06-23 15:50:02', 1),
	(112, 'k001', '0', 18300, NULL, 20000, 1700, '2023-11-23 15:53:21', 1),
	(113, 'k001', '0', 10500, NULL, 11000, 500, '2023-11-23 15:53:33', 1),
	(114, 'k001', '0', 4500, NULL, 5000, 500, '2023-11-23 15:53:50', 1),
	(115, 'Super Admin', '', 8550, NULL, 10000, 1450, '2023-11-23 15:57:43', 1),
	(116, 'Super Admin', '', 14550, NULL, 15000, 450, '2023-11-24 08:37:35', 1),
	(117, 'Super Admin', '', 97500, NULL, 100000, 2500, '2023-11-24 10:37:35', 1),
	(119, 'Super Admin', '', 123000, NULL, 150000, 27000, '2023-11-25 15:01:47', 1),
	(120, 'Super Admin', '', 17250, NULL, 20000, 2750, '2023-11-25 15:11:30', 1),
	(121, 'Super Admin', '', 51750, NULL, 60000, 8250, '2023-11-26 01:12:32', 1),
	(122, 'Super Admin', '', 3600, NULL, 5000, 1400, '2023-11-26 01:15:01', 1),
	(123, 'Super Admin', 'p006', 68202, NULL, 70000, 1798, '2023-11-27 10:16:56', 1),
	(124, 'Super Admin', 'p006', 204120, NULL, 210000, 5880, '2023-11-27 10:18:01', 1),
	(125, 'k009', '', 543229, NULL, 600000, 56771, '2023-11-27 13:59:56', 1),
	(126, 'k009', 'p006', 116442, NULL, 200000, 83558, '2023-11-27 14:22:15', 1),
	(128, 'k001', '', 5775, 5775, 60000, 54225, '2023-11-28 13:59:42', 1),
	(129, 'k005', 'p007', 81788, 74427, 100000, 25573, '2023-11-28 14:07:01', 1),
	(130, 'k005', 'p007', 87166, 79321, 100000, 20679, '2023-11-28 14:23:22', 1),
	(131, 'Super Admin', 'p007', 21765, 19806, 20000, 194, '2023-11-29 09:00:57', 1),
	(132, 'Super Admin', 'p007', 32400, 29484, 29484, 0, '2023-11-29 09:03:59', 1),
	(133, 'Super Admin', 'p007', 17475, 15902, 30000, 14098, '2023-11-29 09:14:32', 1),
	(134, 'Super Admin', 'p007', 17475, 15902, 20000, 4098, '2023-11-29 09:15:02', 1),
	(135, 'Super Admin', 'p007', 16950, 15424, 20000, 4576, '2023-11-29 09:17:59', 1),
	(136, 'Super Admin', 'p007', 22875, 20816, 25000, 4184, '2023-11-29 09:26:25', 1),
	(137, 'Super Admin', 'p007', 11700, 10647, 15000, 4353, '2023-11-29 09:26:54', 1),
	(138, 'Super Admin', 'p007', 16950, 15424, 16000, 576, '2023-11-29 09:34:08', 1),
	(139, 'Super Admin', 'p007', 17475, 15902, 30000, 14098, '2023-11-29 09:35:11', 1),
	(140, 'Super Admin', 'p007', 17100, 15561, 16000, 439, '2023-11-29 09:38:17', 1),
	(141, 'Super Admin', 'p007', 11550, 10510, 11111, 601, '2023-11-29 09:41:46', 1),
	(142, 'Super Admin', '', 11550, 11550, 12222, 672, '2023-11-29 09:42:59', 1),
	(143, 'Super Admin', 'p007', 11550, 10510, 12222, 1712, '2023-11-29 09:43:20', 1),
	(144, 'Super Admin', 'p007', 11550, 10510, 11000, 490, '2023-11-29 10:02:49', 1),
	(145, 'Super Admin', '', 14325, 14325, 15000, 675, '2023-11-29 10:03:15', 1),
	(146, 'Super Admin', 'p007', 39690, 36117, 40000, 3883, '2023-11-29 10:09:01', 1),
	(147, 'k003', 'p007', 5775, 5255, 10000, 4745, '2023-11-29 10:58:05', 1),
	(148, 'k003', '', 11550, 11550, 12000, 450, '2023-11-29 11:04:20', 1),
	(149, 'Super Admin', 'p007', 5775, 5255, 48000, 42745, '2023-11-29 11:27:51', 1),
	(150, 'k003', 'p007', 16950, 15424, 16000, 576, '2023-11-29 11:42:25', 1),
	(151, 'k003', 'p007', 11550, 10510, 11000, 490, '2023-11-29 11:43:04', 1),
	(152, 'k003', 'p007', 11550, 10510, 11100, 590, '2023-11-29 11:43:37', 1),
	(153, 'k003', 'p007', 11550, 10510, 11000, 490, '2023-11-29 11:44:28', 1),
	(154, 'k003', 'p007', 11550, 10510, 11000, 490, '2023-11-29 11:48:28', 1),
	(155, 'Super Admin', 'p007', 5925, 5391, 6000, 609, '2023-11-29 13:22:33', 1),
	(156, 'Super Admin', 'p007', 5775, 5255, 6000, 745, '2023-11-29 13:23:18', 1),
	(157, 'Super Admin', 'p007', 5925, 5391, 6000, 609, '2023-11-29 13:23:52', 1),
	(158, 'Super Admin', 'p007', 5925, 5391, 6000, 609, '2023-11-29 13:30:15', 1),
	(159, 'Super Admin', 'p007', 5925, 5391, 6000, 609, '2023-11-29 13:35:03', 1),
	(160, 'Super Admin', 'p007', 5925, 5391, 6000, 609, '2023-11-29 13:36:44', 1),
	(161, 'Super Admin', '', 27540, 27540, 30000, 2460, '2023-12-04 16:18:54', 1),
	(162, 'Super Admin', 'p007', 201210, 183101, 200000, 16899, '2023-12-03 16:40:35', 1),
	(169, 'Super Admin', '', 5400, 5400, 6000, 600, '2023-12-06 16:34:55', 1),
	(170, 'Super Admin', '', 5400, 5400, 6000, 600, '2023-12-06 16:39:08', 1),
	(171, 'Super Admin', '', 29025, 29025, 30000, 975, '2023-12-07 10:21:29', 1),
	(172, 'Super Admin', '', 29025, 29025, 30000, 975, '2023-12-07 10:21:30', 1),
	(173, 'Super Admin', '', 17925, 17925, 21000, 3075, '2023-12-07 13:12:09', 1),
	(174, 'Super Admin', '', 4650, 4650, 5000, 350, '2023-12-07 13:22:54', 1),
	(175, 'Super Admin', '', 4650, 4650, 5000, 350, '2023-12-07 13:23:18', 1),
	(176, 'k001', 'p007', 11550, 10510, 12000, 1490, '2023-12-07 13:58:48', 1),
	(177, 'Super Admin', 'p007', 46200, 42042, 100000, 57958, '2023-12-09 21:58:30', 1),
	(178, 'k005', 'p007', 21675, 19724, 50000, 30276, '2023-12-15 16:37:20', 1),
	(179, 'Super Admin', 'p007', 46200, 42042, 50000, 7958, '2023-12-21 22:20:21', 1),
	(180, 'k005', 'p007', 24375, 22181, 25000, 2819, '2023-12-22 11:22:10', 1),
	(181, 'k001', 'p007', 16680, 15178, 100000, 84822, '2023-12-22 15:01:43', 1),
	(182, 'Super Admin', 'p007', 46200, 42042, 50000, 7958, '2023-12-22 17:18:15', 1),
	(183, 'Super Admin', 'narda', 11550, 10395, 15000, 4605, '2023-12-31 00:15:02', 1),
	(184, 'Super Admin', '', 5775, 5775, 6000, 225, '2024-01-12 10:56:36', 1),
	(185, 'Super Admin', '', 5775, 5775, 6000, 225, '2024-01-12 10:56:45', 1),
	(186, 'Super Admin', '', 40425, 40425, 50000, 9575, '2024-01-13 08:21:54', 1),
	(187, 'k001', '', 33315, 33315, 100000, 66685, '2024-01-13 10:14:19', 1),
	(188, 'k001', '', 33315, 33315, 100000, 66685, '2024-01-13 10:14:22', 1),
	(189, 'k001', '', 33315, 33315, 100000, 66685, '2024-01-13 10:14:23', 1),
	(190, 'k001', '', 33315, 33315, 100000, 66685, '2024-01-13 10:14:26', 1),
	(191, 'k001', '', 33315, 33315, 100000, 66685, '2024-01-13 10:14:31', 1),
	(192, 'k001', '', 15990, 15990, 100000, 84010, '2024-01-13 10:14:52', 1),
	(193, 'k001', '', 15990, 15990, 100000, 84010, '2024-01-13 10:14:53', 1),
	(194, 'k001', '', 15990, 15990, 100000, 84010, '2024-01-13 10:14:54', 1),
	(195, 'k001', '', 11550, 11550, 100000, 88450, '2024-01-13 10:15:46', 1),
	(196, 'Super Admin', '', 45240, 45240, 50000, 4760, '2024-01-13 14:57:09', 1),
	(197, 'k001', '', 22650, 22650, 50000, 27350, '2024-01-22 19:55:47', 1);

-- Dumping structure for table db_cafe-tahura.transaksi_detail
CREATE TABLE IF NOT EXISTS `transaksi_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `transaksi_id` int DEFAULT NULL,
  `produk_id` int DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `sub_total` int DEFAULT NULL,
  `pdam_id` int DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=430 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table db_cafe-tahura.transaksi_detail: ~420 rows (approximately)
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
	(113, 71, 14, 3, 25650, 1),
	(114, 72, 17, 3, 15750, 1),
	(115, 72, 15, 2, 19500, 1),
	(116, 74, 14, 1, 8550, 1),
	(117, 74, 15, 2, 19500, 1),
	(118, 74, 1, 3, 14400, 1),
	(119, 75, 15, 1, 9750, 1),
	(120, 75, 14, 2, 17100, 1),
	(121, 75, 1, 3, 14400, 1),
	(122, 77, 17, 1, 5250, 1),
	(123, 77, 15, 23, 224250, 1),
	(124, 78, 17, 2, 10500, 1),
	(125, 78, 15, 2, 19500, 1),
	(126, 78, 14, 3, 25650, 1),
	(127, 79, 15, 1, 9750, 1),
	(128, 80, 15, 1, 9750, 1),
	(129, 81, 15, 1, 9750, 1),
	(130, 81, 15, 1, 9750, 1),
	(131, 82, 15, 1, 9750, 1),
	(132, 83, 55, 1, 750, 1),
	(133, 83, 51, 1, 750, 1),
	(134, 84, 54, 1, 750, 1),
	(135, 84, 55, 1, 750, 1),
	(136, 84, 51, 1, 750, 1),
	(137, 84, 49, 1, 185, 1),
	(138, 84, 45, 1, 12300, 1),
	(139, 84, 44, 1, 10800, 1),
	(140, 84, 40, 1, 4800, 1),
	(141, 84, 41, 1, 6300, 1),
	(142, 84, 42, 1, 7800, 1),
	(143, 84, 43, 1, 9300, 1),
	(144, 84, 39, 1, 3300, 1),
	(145, 84, 37, 1, 1800, 1),
	(146, 84, 36, 1, 13650, 1),
	(147, 84, 35, 1, 12150, 1),
	(148, 84, 31, 1, 6150, 1),
	(149, 84, 32, 1, 7650, 1),
	(150, 84, 33, 1, 750, 1),
	(151, 84, 34, 1, 10650, 1),
	(152, 84, 30, 1, 4650, 1),
	(153, 84, 29, 1, 3150, 1),
	(154, 84, 28, 1, 1650, 1),
	(155, 84, 27, 1, 13500, 1),
	(156, 84, 23, 1, 7500, 1),
	(157, 84, 24, 1, 9000, 1),
	(158, 84, 25, 1, 10500, 1),
	(159, 84, 26, 1, 12000, 1),
	(160, 101, 14, 1, 8550, 1),
	(161, 101, 15, 1, 9750, 1),
	(162, 101, 1, 1, 4800, 1),
	(163, 102, 1, 2, 9600, 1),
	(164, 102, 17, 27, 141750, 1),
	(165, 102, 18, 1, 1500, 1),
	(166, 102, 19, 1, 3000, 1),
	(167, 102, 20, 1, 4500, 1),
	(168, 103, 17, 1, 5250, 1),
	(169, 103, 15, 1, 9750, 1),
	(170, 103, 14, 1, 8550, 1),
	(171, 103, 19, 1, 3000, 1),
	(172, 103, 20, 1, 4500, 1),
	(173, 104, 17, 1, 5250, 1),
	(174, 104, 15, 1, 9750, 1),
	(175, 104, 14, 1, 8550, 1),
	(176, 105, 17, 1, 5250, 1),
	(177, 105, 15, 1, 9750, 1),
	(178, 105, 14, 1, 8550, 1),
	(179, 105, 15, 1, 9750, 1),
	(180, 105, 14, 1, 8550, 1),
	(181, 105, 1, 1, 4800, 1),
	(182, 106, 17, 1, 5250, 1),
	(183, 106, 15, 1, 9750, 1),
	(184, 106, 14, 1, 8550, 1),
	(185, 106, 15, 1, 9750, 1),
	(186, 106, 14, 1, 8550, 1),
	(187, 106, 1, 1, 4800, 1),
	(188, 106, 25, 50, 525000, 1),
	(189, 107, 17, 1, 5250, 1),
	(190, 107, 15, 1, 9750, 1),
	(191, 107, 14, 1, 8550, 1),
	(192, 107, 15, 1, 9750, 1),
	(193, 107, 14, 1, 8550, 1),
	(194, 107, 1, 1, 4800, 1),
	(195, 107, 25, 50, 525000, 1),
	(196, 107, 36, 50, 682500, 1),
	(197, 108, 19, 200, 600000, 1),
	(198, 109, 19, 200, 600000, 1),
	(199, 109, 36, 50, 682500, 1),
	(200, 110, 1, 100, 480000, 1),
	(201, 111, 1, 100, 480000, 1),
	(202, 111, 14, 100, 855000, 1),
	(203, 112, 15, 1, 9750, 1),
	(204, 112, 14, 1, 8550, 1),
	(205, 113, 22, 1, 6000, 1),
	(206, 113, 20, 1, 4500, 1),
	(207, 114, 19, 1, 3000, 1),
	(208, 114, 18, 1, 1500, 1),
	(209, 115, 14, 1, 8550, 1),
	(210, 116, 15, 1, 9750, 1),
	(211, 116, 1, 1, 4800, 1),
	(212, 117, 1, 8, 38400, 1),
	(213, 117, 19, 1, 3000, 1),
	(214, 117, 15, 4, 39000, 1),
	(215, 117, 14, 2, 17100, 1),
	(223, 119, 15, 11, 107250, 1),
	(224, 119, 14, 8, 0, 1),
	(225, 119, 17, 3, 15750, 1),
	(226, 120, 15, 1, 9750, 1),
	(227, 120, 20, 1, 4500, 1),
	(228, 120, 19, 1, 3000, 1),
	(229, 121, 15, 1, 9750, 1),
	(230, 121, 17, 8, 42000, 1),
	(231, 122, 37, 2, 3600, 1),
	(232, 123, 1, 1, 10590, 1),
	(233, 123, 15, 1, 5775, 1),
	(234, 123, 17, 1, 5775, 1),
	(235, 123, 18, 1, 5775, 1),
	(236, 123, 23, 2, 17100, 1),
	(237, 123, 22, 1, 5925, 1),
	(238, 123, 20, 1, 12000, 1),
	(239, 123, 19, 1, 8700, 1),
	(240, 123, 24, 1, 4140, 1),
	(241, 124, 32, 15, 226800, 1),
	(242, 125, 54, 4, 39300, 1),
	(243, 125, 37, 5, 36375, 1),
	(244, 125, 39, 5, 23250, 1),
	(245, 125, 40, 9, 43200, 1),
	(246, 125, 44, 5, 22875, 1),
	(247, 125, 31, 4, 5700, 1),
	(248, 125, 30, 5, 11590, 1),
	(249, 125, 29, 3, 29970, 1),
	(250, 125, 28, 3, 3489, 1),
	(251, 125, 23, 3, 25650, 1),
	(252, 125, 24, 3, 12420, 1),
	(253, 125, 26, 3, 8550, 1),
	(254, 125, 27, 4, 10260, 1),
	(255, 125, 22, 4, 23700, 1),
	(256, 125, 20, 4, 48000, 1),
	(257, 125, 19, 5, 43500, 1),
	(258, 125, 18, 4, 23100, 1),
	(259, 125, 1, 5, 52950, 1),
	(260, 125, 14, 4, 21600, 1),
	(261, 125, 15, 5, 28875, 1),
	(262, 125, 17, 5, 28875, 1),
	(263, 126, 58, 1, 1650, 1),
	(264, 126, 26, 1, 2850, 1),
	(265, 126, 28, 1, 1163, 1),
	(266, 126, 37, 1, 7275, 1),
	(267, 128, 17, 1, 5775, 1),
	(268, 129, 17, 1, 5775, 1),
	(269, 129, 15, 1, 5775, 1),
	(270, 129, 1, 1, 10590, 1),
	(271, 129, 14, 1, 5400, 1),
	(272, 129, 18, 1, 5775, 1),
	(273, 129, 19, 1, 8700, 1),
	(274, 129, 20, 1, 12000, 1),
	(275, 129, 22, 1, 5925, 1),
	(276, 129, 27, 1, 2565, 1),
	(277, 129, 26, 1, 2850, 1),
	(278, 129, 24, 1, 4140, 1),
	(279, 129, 23, 1, 8550, 1),
	(280, 129, 30, 1, 2318, 1),
	(281, 129, 31, 1, 1425, 1),
	(282, 130, 17, 1, 5775, 1),
	(283, 130, 14, 1, 5400, 1),
	(284, 130, 1, 1, 10590, 1),
	(285, 130, 18, 1, 5775, 1),
	(286, 130, 19, 1, 8700, 1),
	(287, 130, 20, 1, 12000, 1),
	(288, 130, 22, 1, 5925, 1),
	(289, 130, 27, 1, 2565, 1),
	(290, 130, 26, 1, 2850, 1),
	(291, 130, 24, 1, 4140, 1),
	(292, 130, 23, 1, 8550, 1),
	(293, 130, 28, 1, 1163, 1),
	(294, 130, 29, 1, 9990, 1),
	(295, 130, 30, 1, 2318, 1),
	(296, 130, 31, 1, 1425, 1),
	(297, 131, 17, 1, 5775, 1),
	(298, 131, 14, 1, 5400, 1),
	(299, 131, 1, 1, 10590, 1),
	(300, 132, 17, 1, 5775, 1),
	(301, 132, 22, 1, 5925, 1),
	(302, 132, 20, 1, 12000, 1),
	(303, 132, 19, 1, 8700, 1),
	(304, 133, 17, 1, 5775, 1),
	(305, 133, 22, 1, 5925, 1),
	(306, 133, 15, 1, 5775, 1),
	(307, 134, 15, 1, 5775, 1),
	(308, 134, 17, 1, 5775, 1),
	(309, 134, 22, 1, 5925, 1),
	(310, 135, 17, 1, 5775, 1),
	(311, 135, 15, 1, 5775, 1),
	(312, 135, 14, 1, 5400, 1),
	(313, 136, 17, 1, 5775, 1),
	(314, 136, 15, 1, 5775, 1),
	(315, 136, 22, 1, 5925, 1),
	(316, 136, 14, 1, 5400, 1),
	(317, 137, 22, 1, 5925, 1),
	(318, 137, 15, 1, 5775, 1),
	(319, 138, 17, 1, 5775, 1),
	(320, 138, 15, 1, 5775, 1),
	(321, 138, 14, 1, 5400, 1),
	(322, 139, 22, 1, 5925, 1),
	(323, 139, 17, 1, 5775, 1),
	(324, 139, 15, 1, 5775, 1),
	(325, 140, 14, 1, 5400, 1),
	(326, 140, 15, 1, 5775, 1),
	(327, 140, 22, 1, 5925, 1),
	(328, 141, 17, 1, 5775, 1),
	(329, 141, 15, 1, 5775, 1),
	(330, 142, 17, 1, 5775, 1),
	(331, 142, 15, 1, 5775, 1),
	(332, 143, 17, 1, 5775, 1),
	(333, 143, 15, 1, 5775, 1),
	(334, 144, 17, 1, 5775, 1),
	(335, 144, 15, 1, 5775, 1),
	(336, 145, 23, 1, 8550, 1),
	(337, 145, 18, 1, 5775, 1),
	(338, 146, 1, 1, 10590, 1),
	(339, 146, 14, 1, 5400, 1),
	(340, 146, 17, 1, 5775, 1),
	(341, 146, 22, 1, 5925, 1),
	(342, 146, 20, 1, 12000, 1),
	(343, 147, 17, 1, 5775, 1),
	(344, 148, 17, 1, 5775, 1),
	(345, 148, 15, 1, 5775, 1),
	(346, 149, 17, 1, 5775, 1),
	(347, 150, 17, 1, 5775, 1),
	(348, 150, 15, 1, 5775, 1),
	(349, 150, 14, 1, 5400, 1),
	(350, 151, 17, 1, 5775, 1),
	(351, 151, 15, 1, 5775, 1),
	(352, 152, 17, 1, 5775, 1),
	(353, 152, 15, 1, 5775, 1),
	(354, 153, 17, 1, 5775, 1),
	(355, 153, 15, 1, 5775, 1),
	(356, 154, 17, 1, 5775, 1),
	(357, 154, 15, 1, 5775, 1),
	(358, 155, 22, 1, 5925, 1),
	(359, 156, 17, 1, 5775, 1),
	(360, 157, 22, 1, 5925, 1),
	(361, 158, 22, 1, 5925, 1),
	(362, 159, 22, 1, 5925, 1),
	(363, 160, 22, 1, 5925, 1),
	(364, 161, 17, 1, 5775, 1),
	(365, 161, 15, 1, 5775, 1),
	(366, 161, 14, 1, 5400, 1),
	(367, 161, 1, 1, 10590, 1),
	(368, 162, 1, 19, 201210, 1),
	(369, 169, 14, 1, 5400, 1),
	(370, 170, 14, 1, 5400, 1),
	(371, 171, 17, 2, 11550, 1),
	(372, 171, 15, 2, 11550, 1),
	(373, 171, 22, 1, 5925, 1),
	(374, 172, 17, 2, 11550, 1),
	(375, 172, 15, 2, 11550, 1),
	(376, 172, 22, 1, 5925, 1),
	(377, 173, 22, 1, 5925, 1),
	(378, 173, 20, 1, 12000, 1),
	(379, 174, 39, 1, 4650, 1),
	(380, 175, 39, 1, 4650, 1),
	(381, 176, 17, 1, 5775, 1),
	(382, 176, 15, 1, 5775, 1),
	(383, 177, 15, 7, 40425, 1),
	(384, 177, 17, 1, 5775, 1),
	(385, 178, 39, 1, 4650, 1),
	(386, 178, 37, 1, 7275, 1),
	(387, 178, 36, 1, 9750, 1),
	(388, 179, 17, 5, 28875, 1),
	(389, 179, 15, 3, 17325, 1),
	(390, 180, 54, 1, 9825, 1),
	(391, 180, 37, 2, 14550, 1),
	(392, 181, 15, 2, 11550, 1),
	(393, 181, 27, 2, 5130, 1),
	(394, 182, 17, 1, 5775, 1),
	(395, 182, 15, 7, 40425, 1),
	(396, 183, 17, 1, 5775, 1),
	(397, 183, 15, 1, 5775, 1),
	(398, 184, 17, 1, 5775, 1),
	(399, 185, 17, 1, 5775, 1),
	(400, 186, 17, 6, 34650, 1),
	(401, 186, 15, 1, 5775, 1),
	(402, 187, 1, 1, 10590, 1),
	(403, 187, 14, 1, 5400, 1),
	(404, 187, 15, 3, 17325, 1),
	(405, 188, 1, 1, 10590, 1),
	(406, 188, 14, 1, 5400, 1),
	(407, 188, 15, 3, 17325, 1),
	(408, 189, 1, 1, 10590, 1),
	(409, 189, 14, 1, 5400, 1),
	(410, 189, 15, 3, 17325, 1),
	(411, 190, 1, 1, 10590, 1),
	(412, 190, 14, 1, 5400, 1),
	(413, 190, 15, 3, 17325, 1),
	(414, 191, 1, 1, 10590, 1),
	(415, 191, 14, 1, 5400, 1),
	(416, 191, 15, 3, 17325, 1),
	(417, 192, 1, 1, 10590, 1),
	(418, 192, 14, 1, 5400, 1),
	(419, 193, 1, 1, 10590, 1),
	(420, 193, 14, 1, 5400, 1),
	(421, 194, 1, 1, 10590, 1),
	(422, 194, 14, 1, 5400, 1),
	(423, 195, 15, 1, 5775, 1),
	(424, 195, 17, 1, 5775, 1),
	(425, 196, 1, 1, 10590, 1),
	(426, 196, 17, 6, 34650, 1),
	(427, 197, 14, 1, 5400, 1),
	(428, 197, 19, 1, 8700, 1),
	(429, 197, 23, 1, 8550, 1);

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
) ENGINE=InnoDB AUTO_INCREMENT=238 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Dumping data for table db_cafe-tahura.user: ~8 rows (approximately)
REPLACE INTO `user` (`id`, `pdam_id`, `satuan_kerja_id`, `username`, `nama`, `password`, `id_role`, `state`, `kasir_kode`) VALUES
	(225, 1, NULL, 'owner', 'Owner', '$2y$10$S1o3HU1rQVLoAZ4fFYjo2evixNAk7gF4qNWKEvtG6M6R49If10Z.e', '1', 1, 'Owner'),
	(226, 1, NULL, 'k001', 'Andhika', '$2y$10$nSIeuoLO6.OGV27U4p8umeGufS543ZN17xw62WVcYHLJ6O23I3eQO', '2', 1, 'k001'),
	(232, 1, NULL, 'k002', 'Ahmad', '$2y$10$/m/7ZsMaAiNmQvYxGx6c5OqeH8pF9uy11PDzmuWl3X1Tg/KaMCTkq', '3', 1, 'k002'),
	(233, 1, NULL, 'k003', 'Derral', '$2y$10$k5wFbZ2Vp6YLxeafxe6nYePiL.hq5U7DC33R8xH.O0UuSh3FWomzu', '2', 1, 'k003'),
	(234, 1, NULL, 'superadmin', 'Super Admin', '$2y$10$jXo2KqbDtZVXj63ItWQ9su.SQ8CAnyOLbxiT5P5HOuFJhUmzR2oSS', '3', 1, 'Super Admin'),
	(235, 1, NULL, 'k004', 'Jimy Santoso', '0', '2', 1, 'k004'),
	(236, 1, NULL, 'k005', 'Jhon', '$2y$10$wffDNviC571FqbkHsRPkcON4JcbD8HOPHpeeo7anprh2TFWRbBN86', '2', 1, 'k005'),
	(237, 1, NULL, 'k009', 'Hadi', '$2y$10$0kfpoyvQV49hziDPfyDkbetTAgmD8VJX5Caj0HKbUOdCGboeAYJua', '2', 1, 'k009');

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
	`nama_satuan` VARCHAR(50) NULL COLLATE 'utf8mb3_general_ci',
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

-- Dumping structure for view db_cafe-tahura.vw_t
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `vw_t` (
	`id` INT(10) NOT NULL,
	`kode_kasir` VARCHAR(50) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`kasir` VARCHAR(50) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`voucher` VARCHAR(50) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`total` INT(10) NULL,
	`bayar` INT(10) NULL,
	`kembalian` INT(10) NULL,
	`created_at` DATETIME NULL,
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
	`id` INT(10) NOT NULL,
	`kode_kasir` VARCHAR(50) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`nama_kasir` VARCHAR(50) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`voucher_kode` VARCHAR(50) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`diskon` VARCHAR(50) NOT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`total` BIGINT(19) NOT NULL,
	`grand_total` BIGINT(19) NOT NULL,
	`bayar` BIGINT(19) NOT NULL,
	`kembalian` BIGINT(19) NOT NULL,
	`created_at` DATETIME NULL,
	`pdam_id` INT(10) NULL
) ENGINE=MyISAM;

-- Dumping structure for view db_cafe-tahura.vw_transaksi_detail
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `vw_transaksi_detail` (
	`id` INT(10) NOT NULL,
	`trans_id` INT(10) NULL,
	`kode_kasir` VARCHAR(50) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`nama_kasir` VARCHAR(50) NOT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`prod_id` INT(10) NULL,
	`nama_produk` VARCHAR(255) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`harga` INT(10) NULL,
	`qty` INT(10) NULL,
	`sub_total` INT(10) NULL,
	`kode_voucher` VARCHAR(50) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`diskon` VARCHAR(50) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`total` BIGINT(19) NULL,
	`tanggal` DATETIME NULL,
	`pdam_id` INT(10) NULL
) ENGINE=MyISAM;

-- Dumping structure for view db_cafe-tahura.vw_user
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `vw_user` (
	`id` INT(10) NOT NULL
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
CREATE TRIGGER `after_delete_master_kasir` AFTER DELETE ON `master_kasir` FOR EACH ROW BEGIN
    DELETE FROM `user` WHERE `username` = OLD.kode; 
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger db_cafe-tahura.after_edit_master_kasir
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `after_edit_master_kasir` AFTER UPDATE ON `master_kasir` FOR EACH ROW BEGIN
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
CREATE TRIGGER `after_insert_master_kasir` AFTER INSERT ON `master_kasir` FOR EACH ROW BEGIN
    INSERT INTO user (pdam_id, username, nama, password, id_role, state, kasir_kode)
    VALUES (NEW.pdam_id, NEW.kode, NEW.nama, NEW.password_hash, '2', 1, NEW.kode);
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger db_cafe-tahura.after_insert_transaksi
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='';
DELIMITER //
CREATE TRIGGER `after_insert_transaksi` AFTER INSERT ON `transaksi` FOR EACH ROW BEGIN
 IF NEW.voucher_kode IS NOT NULL THEN
        UPDATE master_voucher
        SET qty = qty - 1
        WHERE kode = NEW.voucher_kode;
    END IF;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger db_cafe-tahura.master_produk_after_delete
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `master_produk_after_delete` AFTER DELETE ON `master_produk` FOR EACH ROW BEGIN
	    DELETE FROM `master_produk_detail` WHERE `produk_id` = OLD.id; 
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger db_cafe-tahura.transaksi_after_delete
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `transaksi_after_delete` AFTER DELETE ON `transaksi` FOR EACH ROW BEGIN
	 DELETE FROM `transaksi_detail` WHERE `transaksi_id` = OLD.id; 
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for view db_cafe-tahura.vw_detail_produk
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `vw_detail_produk`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vw_detail_produk` AS select `produk`.`id` AS `id`,coalesce(`item`.`produk_id`,`produk`.`id`) AS `id_produk`,`produk`.`nama` AS `nama`,`produk`.`gambar` AS `gambar`,`produk`.`hpp` AS `hpp`,`produk`.`harga_jual` AS `harga`,`produk`.`kategori_id` AS `kategori_id`,`kategori`.`nama` AS `kategori`,`produk`.`pdam_id` AS `pdam_id` from ((`master_produk_detail` `item` left join `master_produk` `produk` on((`item`.`produk_id` = `produk`.`id`))) left join `master_kategori` `kategori` on((`produk`.`kategori_id` = `kategori`.`id`)));

-- Dumping structure for view db_cafe-tahura.vw_master_bahan
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `vw_master_bahan`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vw_master_bahan` AS select `bahan`.`id` AS `id`,`bahan`.`nama` AS `nama`,`bahan`.`jumlah` AS `jumlah`,`satuan`.`id` AS `id_satuan`,coalesce(`satuan`.`nama`,`bahan`.`satuan_id`) AS `nama_satuan`,`bahan`.`harga` AS `harga`,`bahan`.`pdam_id` AS `pdam_id` from (`master_bahan` `bahan` left join `master_satuan` `satuan` on((`satuan`.`id` = `bahan`.`satuan_id`)));

-- Dumping structure for view db_cafe-tahura.vw_master_produk
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `vw_master_produk`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vw_master_produk` AS select `produk`.`id` AS `id`,`produk`.`nama` AS `nama`,`produk`.`gambar` AS `gambar`,`produk`.`hpp` AS `hpp`,`margin`.`margin` AS `margin_untung`,`produk`.`harga_jual` AS `harga`,`produk`.`kategori_id` AS `kategori_id`,`kategori`.`nama` AS `kategori`,`produk`.`pdam_id` AS `pdam_id` from ((`master_produk` `produk` left join `master_kategori` `kategori` on((`kategori`.`id` = `produk`.`kategori_id`))) left join `master_margin` `margin` on((0 <> 1)));

-- Dumping structure for view db_cafe-tahura.vw_master_produk_detail
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `vw_master_produk_detail`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vw_master_produk_detail` AS select `item`.`id` AS `id`,`item`.`produk_id` AS `produk_id`,`item`.`bahan_id` AS `bahan_id`,`bahan`.`nama` AS `bahan`,`satuan`.`nama` AS `nama_satuan`,`bahan`.`jumlah` AS `jumlah_bahan`,`bahan`.`harga` AS `harga_bahan`,`item`.`jumlah` AS `jumlah`,`item`.`harga` AS `harga`,`item`.`pdam_id` AS `pdam_id` from ((`master_produk_detail` `item` left join `master_bahan` `bahan` on((`item`.`bahan_id` = `bahan`.`id`))) left join `master_satuan` `satuan` on((`bahan`.`satuan_id` = `satuan`.`id`)));

-- Dumping structure for view db_cafe-tahura.vw_produk
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `vw_produk`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vw_produk` AS select `produk`.`id` AS `id`,`produk`.`nama` AS `nama`,`produk`.`gambar` AS `gambar`,`produk`.`hpp` AS `hpp`,`margin`.`margin` AS `margin_untung`,cast(((`produk`.`hpp` * `margin`.`margin`) + `produk`.`hpp`) as signed) AS `harga`,`produk`.`kategori_id` AS `kategori_id`,`kategori`.`nama` AS `kategori`,`produk`.`pdam_id` AS `pdam_id` from ((`master_produk` `produk` left join `master_kategori` `kategori` on((`kategori`.`id` = `produk`.`kategori_id`))) left join `master_margin` `margin` on((0 <> 1)));

-- Dumping structure for view db_cafe-tahura.vw_t
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `vw_t`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vw_t` AS select `trans`.`id` AS `id`,`trans`.`kode_kasir` AS `kode_kasir`,`kasir`.`nama` AS `kasir`,`trans`.`voucher_kode` AS `voucher`,`trans`.`total` AS `total`,`trans`.`bayar` AS `bayar`,`trans`.`kembalian` AS `kembalian`,`trans`.`created_at` AS `created_at`,`trans`.`pdam_id` AS `pdam_id` from ((`transaksi` `trans` left join `transaksi_detail` `detail` on((`trans`.`id` = `detail`.`transaksi_id`))) left join `master_kasir` `kasir` on((`trans`.`kode_kasir` = `kasir`.`kode`)));

-- Dumping structure for view db_cafe-tahura.vw_trans
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `vw_trans`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vw_trans` AS select year(`t`.`created_at`) AS `tahun`,month(`t`.`created_at`) AS `bulan`,sum(`t`.`total`) AS `total` from `transaksi` `t` group by year(`t`.`created_at`),month(`t`.`created_at`);

-- Dumping structure for view db_cafe-tahura.vw_transaksi
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `vw_transaksi`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vw_transaksi` AS select `trans`.`id` AS `id`,`trans`.`kode_kasir` AS `kode_kasir`,coalesce(`kasir`.`nama`,`trans`.`kode_kasir`) AS `nama_kasir`,`trans`.`voucher_kode` AS `voucher_kode`,coalesce(`voucher`.`diskon`,`trans`.`voucher_kode`,'-') AS `diskon`,coalesce(`trans`.`total`,0) AS `total`,coalesce(`trans`.`grand_total`,0) AS `grand_total`,coalesce(`trans`.`bayar`,0) AS `bayar`,coalesce(`trans`.`kembalian`,0) AS `kembalian`,`trans`.`created_at` AS `created_at`,`trans`.`pdam_id` AS `pdam_id` from ((`transaksi` `trans` left join `master_kasir` `kasir` on((`trans`.`kode_kasir` = `kasir`.`kode`))) left join `master_voucher` `voucher` on((`trans`.`voucher_kode` = `voucher`.`kode`)));

-- Dumping structure for view db_cafe-tahura.vw_transaksi_detail
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `vw_transaksi_detail`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vw_transaksi_detail` AS select `detail`.`id` AS `id`,`detail`.`transaksi_id` AS `trans_id`,`kasir`.`kode` AS `kode_kasir`,coalesce(`kasir`.`nama`,`trans`.`kode_kasir`,0) AS `nama_kasir`,`detail`.`produk_id` AS `prod_id`,`item`.`nama` AS `nama_produk`,`item`.`harga_jual` AS `harga`,`detail`.`qty` AS `qty`,`detail`.`sub_total` AS `sub_total`,`trans`.`voucher_kode` AS `kode_voucher`,coalesce(`voucher`.`diskon`,`trans`.`voucher_kode`) AS `diskon`,cast((`detail`.`sub_total` - (coalesce(`voucher`.`diskon`,0) * `detail`.`sub_total`)) as signed) AS `total`,`trans`.`created_at` AS `tanggal`,`detail`.`pdam_id` AS `pdam_id` from ((((`transaksi_detail` `detail` left join `master_produk` `item` on((`detail`.`produk_id` = `item`.`id`))) left join `transaksi` `trans` on((`detail`.`transaksi_id` = `trans`.`id`))) left join `master_kasir` `kasir` on((`trans`.`kode_kasir` = `kasir`.`kode`))) left join `master_voucher` `voucher` on((`trans`.`voucher_kode` = `voucher`.`kode`)));

-- Dumping structure for view db_cafe-tahura.vw_user
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `vw_user`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vw_user` AS select `user`.`id` AS `id` from `user`;

-- Dumping structure for view db_cafe-tahura.vw_voucher
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `vw_voucher`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vw_voucher` AS select `voucher`.`id` AS `id`,`voucher`.`kode` AS `kode`,cast(`voucher`.`diskon` as decimal(20,2)) AS `diskon`,coalesce(`voucher`.`qty`,0) AS `qty`,`voucher`.`active_at` AS `active_at`,`voucher`.`expired_at` AS `expired_at`,(case when ((`voucher`.`qty` > 0) and (curdate() between `voucher`.`active_at` and `voucher`.`expired_at`)) then 'Aktif' else 'Tidak Aktif' end) AS `status`,`voucher`.`pdam_id` AS `pdam_id` from `master_voucher` `voucher`;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
