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

-- ALTER TABLE
ALTER TABLE tbl_data_pemasukan
ADD sisa_pemasukan BIGINT(30) AFTER pemasukan;

ALTER TABLE tbl_data_pemasukan
ADD deskripsi_pemasukan text AFTER pemasukan;

ALTER TABLE tbl_data_pengeluaran
ADD kategori_pengeluaran text AFTER deskripsi;

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
SET kategori_pengeluaran = "Belanja Bulanan"
WHERE id = 1;

ALTER TABLE tbl_data_pengeluaran CHANGE COLUMN deskripsi deskripsi_pengeluaran TEXT;

-- QUERY DATA PEMASUKAN
SELECT * FROM tbl_data_pemasukan;
SELECT * FROM tbl_data_pengeluaran;

-- MELIHAT STRUKTUR TABLE
DESC tbl_data_pemasukan;

-- CREATE VIEW
CREATE VIEW view_dashboard 
AS
SELECT SUM(sisa_pemasukan) AS jumlah_income_saatini FROM tbl_data_pemasukan;

CREATE VIEW view_data_pemasukan 
AS
SELECT kode_pemasukan, deskripsi_pemasukan, pemasukan, sisa_pemasukan 
FROM tbl_data_pemasukan;

CREATE VIEW view_data_pengeluaran 
AS
SELECT kode_pengeluaran, deskripsi_pengeluaran, kategori_pengeluaran, jml_pengeluaran  
FROM tbl_data_pengeluaran;

-- UPDATE VIEW, DELETE TERLEBIH DAHULU KEMUDIAN MODIFY VIEW
DROP VIEW view_dashboard;
DROP VIEW view_data_pemasukan;

SELECT * FROM view_dashboard;
SELECT * FROM view_data_pemasukan;
SELECT * FROM view_data_pengeluaran;