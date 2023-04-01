-- Query 30 Maret 2023

USE db_catat_keuangan;

SHOW DATABASES;

-- Proses Re-Import Database dari File db_kelola_keuangan_020123_2219.sql
-- Ada di folder Database
ALTER TABLE `tbl_data_pemasukan` ADD PRIMARY KEY (`id`,`kode_pemasukan`);
ALTER TABLE `tbl_data_pengeluaran` ADD PRIMARY KEY (`id`,`kode_pengeluaran`);

ALTER TABLE `tbl_data_pengeluaran` CHANGE `id` `id` INT NOT NULL AUTO_INCREMENT;
ALTER TABLE `tbl_data_pemasukan` CHANGE `id` `id` INT NOT NULL AUTO_INCREMENT;

CREATE VIEW overview_pemasukan 
AS
SELECT SUM(sisa_pemasukan) AS jumlah_income_saatini, COUNT(id) AS jml_data_in FROM tbl_data_pemasukan;

CREATE VIEW overview_pengeluaran 
AS
SELECT SUM(jml_pengeluaran) AS jml_pengeluaran, COUNT(id) AS jml_data_out FROM tbl_data_pengeluaran WHERE status_pengeluaran = "Done";

CREATE VIEW list_data_pemasukan 
AS
SELECT kode_pemasukan, deskripsi_pemasukan, pemasukan, sisa_pemasukan 
FROM tbl_data_pemasukan;

CREATE VIEW list_data_pengeluaran 
AS
SELECT tbl_data_pengeluaran.kode_pengeluaran, tbl_data_pengeluaran.jml_pengeluaran, tbl_data_pengeluaran.status_pengeluaran, tbl_data_pengeluaran.deskripsi_pengeluaran, tbl_data_pengeluaran.kategori_pengeluaran, tbl_data_pemasukan.deskripsi_pemasukan
FROM tbl_data_pengeluaran 
JOIN tbl_data_pemasukan ON tbl_data_pemasukan.kode_pemasukan=tbl_data_pengeluaran.kode_pemasukan 
WHERE tbl_data_pengeluaran.status_pengeluaran = "Done";

-- Tambah Table User
CREATE TABLE tbl_data_user (
	id INT(11) NOT NULL AUTO_INCREMENT,
	id_user VARCHAR(60) NOT NULL,
	username TEXT,
	userkey TEXT,
	lisensi_user TEXT,
	auth_access TEXT,
	tanggal_register TEXT,
	CONSTRAINT pk_dt_user PRIMARY KEY (id, id_user)
);

-- Input Data User untuk Test Dev
INSERT INTO tbl_data_user
(id_user, username, userkey, lisensi_user, auth_access, tanggal_register) 
VALUES 
('03012023-110359', 'dev', md5('dev'), '2423098432-298349234-293842398-923', '-', '03 Januari 2023');

SELECT * FROM tbl_data_pemasukan;


-- Query 31 Maret 2023

SELECT * FROM tbl_data_user;

-- Mengosongkan Field Auth Akses Untuk mengecek Login
UPDATE tbl_data_user 
SET auth_access = '-' 
WHERE id = 1;

-- Mengosongkan dan Mengisi Lisensi Akun
UPDATE tbl_data_user
SET lisensi_user = '-'
WHERE id = 1;

UPDATE tbl_data_user
SET lisensi_user = '2423098432-298349234-293842398-923'
WHERE id = 1;

