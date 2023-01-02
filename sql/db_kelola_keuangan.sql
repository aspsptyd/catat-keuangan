-- MEMBUAT DATABASE
CREATE DATABASE IF NOT EXISTS db_kelola_keuangan;

-- AKSES DATABASE
USE db_kelola_keuangan;

-- LIHAT SEMUA TABLE
SHOW TABLES;

-- MEMBUAT TABLE DATA PEMASUKAN
CREATE TABLE tbl_data_pemasukan (
	id INT(11) NOT NULL AUTO_INCREMENT,
	kode_pemasukan VARCHAR(60) NOT NULL,
	pemasukan BIGINT(30),
	CONSTRAINT pk_dt_pemasukan PRIMARY KEY (id, kode_pemasukan)
);

CREATE TABLE tbl_data_pengeluaran (
	id INT(11) NOT NULL AUTO_INCREMENT, 
	kode_pengeluaran VARCHAR(60) NOT NULL,
	jml_pengeluaran BIGINT(30),
	deskripsi TEXT,
	CONSTRAINT pk_dt_pengeluaran PRIMARY KEY (id, kode_pengeluaran)
);

DESC tbl_data_pengeluaran;
DESC tbl_data_pemasukan;

-- ALTER TABLE
ALTER TABLE tbl_data_pemasukan
ADD sisa_pemasukan BIGINT(30) AFTER pemasukan;

ALTER TABLE tbl_data_pemasukan
ADD deskripsi_pemasukan text AFTER pemasukan;

ALTER TABLE tbl_data_pengeluaran
ADD kategori_pengeluaran text AFTER deskripsi;

ALTER TABLE tbl_data_pengeluaran
ADD status_pengeluaran TEXT AFTER jml_pengeluaran;

ALTER TABLE tbl_data_pengeluaran
ADD kode_pemasukan VARCHAR(60) AFTER kategori_pengeluaran;

ALTER TABLE tbl_data_pengeluaran
MODIFY COLUMN kode_pemasukan VARCHAR(60) NOT NULL

-- INPUT DATA KEDALAM TABLE DATA PEMASUKAN
INSERT INTO tbl_data_pemasukan
(kode_pemasukan, pemasukan)
VALUES
('12-2022-29-1', 5510000);

INSERT INTO tbl_data_pemasukan
(kode_pemasukan, pemasukan)
VALUES
('11-2022-29-1', 6452689);

INSERT INTO tbl_data_pengeluaran
(kode_pengeluaran, deskripsi, jml_pengeluaran, kategori_pengeluaran)
VALUES
('30-12-2022-1205', "Kapsul daun katuk mami 3bks", 30000, "Belanja Bulanan");

INSERT INTO tbl_data_pengeluaran
(kode_pengeluaran, deskripsi, jml_pengeluaran)
VALUES
('30-12-2022-1150', "Beras 5kg 55rb, Gula 1kg 13rb, Telur 1kg 27rb", 95000);

INSERT INTO tbl_data_pengeluaran
(kode_pengeluaran, deskripsi, jml_pengeluaran)
VALUES
('30-12-2022-1158', "Beras 5kg 60rb, Minyak Sayur 2lt 30rb, Kecap Manis 15rb, Sarimi Rebus 10bks 30rb, Teh Celup 2bks 10rb, Detergen 1.8kg 25rb, Sabun cp 12rb, Sikat gigi 3pcs 7rb", 189000);

INSERT INTO tbl_data_pengeluaran
(kode_pengeluaran, deskripsi, jml_pengeluaran)
VALUES
('30-12-2022-1158', "Susu dancow 4box 355rb, Sabun Sampo Farfum 51rb, Wafer Tango 2bks 10rb, Susu Tango 6btl 30rb, Ciki Piatos 3bks 21rb", 467000);

INSERT INTO tbl_data_pengeluaran
(kode_pengeluaran, deskripsi_pengeluaran, jml_pengeluaran, kategori_pengeluaran, status_pengeluaran)
VALUES
('31-12-2022-0909', "Telor 1kg 30rb, Tepung Aci 7rb", 37000, "Belanja Bulanan", "Done");

INSERT INTO tbl_data_pengeluaran
(kode_pengeluaran, deskripsi_pengeluaran, jml_pengeluaran, kategori_pengeluaran, status_pengeluaran)
VALUES
('31-12-2022-0918', "Kue Pukis 2bks 20rb, Bakso 10rb, Jagung 2kg 20rb", 50000, "Dana Darurat", "Done");

INSERT INTO tbl_data_pengeluaran
(kode_pengeluaran, deskripsi_pengeluaran, jml_pengeluaran, kategori_pengeluaran, status_pengeluaran)
VALUES
('31-12-2022-0918', "Es Krim 2pcs 6rb, Gulali 10rb", 16000, "Dede Aghnia", "Done");

INSERT INTO tbl_data_pengeluaran
(kode_pengeluaran, deskripsi_pengeluaran, jml_pengeluaran, kategori_pengeluaran, status_pengeluaran)
VALUES
('31-12-2022-0919', "Sabun Muka Garnier 23rb", 23000, "Belanja Bulanan", "Done");

INSERT INTO tbl_data_pengeluaran
(kode_pengeluaran, deskripsi_pengeluaran, jml_pengeluaran, kategori_pengeluaran, status_pengeluaran)
VALUES
('31-12-2022-0919', "Jajan Warung 10rb, Roti Croffle 48rb, Jus 29rb, Parkir Mall GPP 5rb", 92000, "Dana Darurat", "Done");

INSERT INTO tbl_data_pengeluaran
(kode_pengeluaran, deskripsi_pengeluaran, jml_pengeluaran, kategori_pengeluaran, status_pengeluaran, kode_pemasukan)
VALUES
('01-01-2023-1430', "Pocari & Masker", 31400, "Sedekah", "Done", "29-12-2022-1"),
('01-01-2023-1435', "Rambutan", 25000, "Sedekah", "Done", "29-12-2022-1"),
('01-01-2023-1440', "Nasi Kuning 2bks 14rb dan Gorengan 3 5rb", 19000, "Sedekah", "Done", "29-12-2022-1"),
('01-01-2023-1445', "Belanja di Alfa Buat di Rumah Rengas Bandung", 70500, "Bensin Abi", "Done", "29-12-2022-1"),
('01-01-2023-1450', "Mi Ayam Pake Bakso", 18000, "Bensin Abi", "Done", "29-12-2022-1"),
('01-01-2023-1455', "Isi Bensin Motor", 12000, "Bensin Abi", "Done", "29-12-2022-1"),
('01-01-2023-1500', "Bakso Urat", 24100, "Bensin Abi", "Done", "29-12-2022-1"),
('01-01-2023-1505', "Gorengan Sotong", 5000, "Dede Aghnia", "Done", "29-12-2022-1");

INSERT INTO tbl_data_pengeluaran
(kode_pengeluaran, deskripsi_pengeluaran, jml_pengeluaran, kategori_pengeluaran, status_pengeluaran, kode_pemasukan)
VALUES
('02-01-2023-2018', "Belanja Sayur", 56000, "Belanja Week 1", "Done", "29-12-2022-1"),
('02-01-2023-1920', "Sedekah di Masjid", 20000, "Tagihan", "Done", "29-12-2022-1"),
('02-01-2023-1925', "Konsul Bidan 35rb, Cek HB 30rb, Jus 20rb, Es Krim 5rb, Parkir Klinik 2rb", 92000, "Makanan", "Done", "29-12-2022-1");

INSERT INTO tbl_data_pengeluaran
(kode_pengeluaran, deskripsi_pengeluaran, jml_pengeluaran, kategori_pengeluaran, status_pengeluaran, kode_pemasukan)
VALUES
('02-01-2023-1613', "Pempers 2 Ball", 91000, "Dede Aghnia", "Done", "29-12-2022-1"),
('02-01-2023-1621', "Cicilan Meja Tv ke 2", 433000, "Tagihan", "Done", "29-12-2022-1"),
('02-01-2023-1625', "Cicilan Tv ke 2", 589000, "Tagihan", "Done", "29-12-2022-1"),
('02-01-2023-1639', "Kontrakan Januari", 850000, "Tagihan", "Done", "29-12-2022-1"),
('02-01-2023-1625', "Tempe, Kerupuk, Daun Bawang", 18000, "Belanja Week 1", "Done", "29-12-2022-1"),
('02-01-2023-1635', "Roti Tawar, Roti Sandwich 2, Seres 1", 39500, "Dede Aghnia", "Done", "29-12-2022-1");

-- UPDATE DATA
UPDATE tbl_data_pemasukan
SET sisa_pemasukan = 0
WHERE id = 1;

UPDATE tbl_data_pemasukan
SET deskripsi_pemasukan = "Gaji PT. Global Pristya - Bulan Desember 2022"
WHERE id = 1;

UPDATE tbl_data_pemasukan
SET deskripsi_pemasukan = "Gaji PT. Global Pristya - Bulan November 2022"
WHERE id = 2;

UPDATE tbl_data_pengeluaran 
SET status_pengeluaran = "Done"
WHERE id BETWEEN 2 AND 4;

UPDATE tbl_data_pengeluaran 
SET kode_pemasukan = "29-12-2022-1"
WHERE id BETWEEN 1 AND 9;

UPDATE tbl_data_pengeluaran 
SET kode_pengeluaran = "31-12-2022-0921"
WHERE id = 9;

ALTER TABLE tbl_data_pengeluaran CHANGE COLUMN deskripsi deskripsi_pengeluaran TEXT;

-- QUERY DATA PEMASUKAN
SELECT * FROM tbl_data_pemasukan;
SELECT * FROM tbl_data_pengeluaran;

-- MELIHAT STRUKTUR TABLE
DESC tbl_data_pemasukan;

-- TAHAP 1 : INTEGRASI, DROP VIEWS
-- HAPUS DAN AKSES VIEWS
DROP VIEW overview_pemasukan;
SELECT * FROM overview_pemasukan;

-- TAHAP 2 : SET PRIMARY DAN REIMPORT
-- SET ALTER PRIMARY DAN AUTO_INCREMENT KETIKA RE-IMPORT
ALTER TABLE `tbl_data_pemasukan` ADD PRIMARY KEY (`id`,`kode_pemasukan`);
ALTER TABLE `tbl_data_pengeluaran` ADD PRIMARY KEY (`id`,`kode_pengeluaran`);

ALTER TABLE `tbl_data_pengeluaran` CHANGE `id` `id` INT NOT NULL AUTO_INCREMENT;
ALTER TABLE `tbl_data_pemasukan` CHANGE `id` `id` INT NOT NULL AUTO_INCREMENT;

-- TAHAP 3 : RE-CREATE VIEW
-- CREATE VIEW PEMASUKAN
CREATE VIEW overview_pemasukan 
AS
SELECT SUM(sisa_pemasukan) AS jumlah_income_saatini, COUNT(id) AS jml_data_in FROM tbl_data_pemasukan;

-- CREATE VIEW PENGELUARAN
CREATE VIEW overview_pengeluaran 
AS
SELECT SUM(jml_pengeluaran) AS jml_pengeluaran, COUNT(id) AS jml_data_out FROM tbl_data_pengeluaran WHERE status_pengeluaran = "Done";

-- VIEW LIST DATA PEMASUKAN
CREATE VIEW list_data_pemasukan 
AS
SELECT kode_pemasukan, deskripsi_pemasukan, pemasukan, sisa_pemasukan 
FROM tbl_data_pemasukan;

-- VIEW LIST DATA PENGELUARAN
CREATE VIEW list_data_pengeluaran 
AS
SELECT tbl_data_pengeluaran.kode_pengeluaran, tbl_data_pengeluaran.jml_pengeluaran, tbl_data_pengeluaran.status_pengeluaran, tbl_data_pengeluaran.deskripsi_pengeluaran, tbl_data_pengeluaran.kategori_pengeluaran, tbl_data_pemasukan.deskripsi_pemasukan
FROM tbl_data_pengeluaran 
JOIN tbl_data_pemasukan ON tbl_data_pemasukan.kode_pemasukan=tbl_data_pengeluaran.kode_pemasukan 
WHERE tbl_data_pengeluaran.status_pengeluaran = "Done";