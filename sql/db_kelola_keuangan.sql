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
	deskripsi TEXT
	CONSTRAINT pk_dt_pengeluaran PRIMARY KEY (id, kode_pengeluaran)
);

-- ALTER TABLE
ALTER TABLE tbl_data_pemasukan
ADD sisa_pemasukan BIGINT(30) AFTER pemasukan;

-- INPUT DATA KEDALAM TABLE DATA PEMASUKAN
INSERT INTO tbl_data_pemasukan
(kode_pemasukan, pemasukan)
VALUES
('12-2022-29-1', 5510000);
INSERT INTO tbl_data_pemasukan
(kode_pemasukan, pemasukan)
VALUES
('11-2022-29-1', 6452689);

-- UPDATE DATA
UPDATE tbl_data_pemasukan
SET sisa_pemasukan = 0
WHERE id = 1;

-- QUERY DATA PEMASUKAN
SELECT * FROM tbl_data_pemasukan;

-- MELIHAT STRUKTUR TABLE
DESC tbl_data_pemasukan;

-- CREATE VIEW
CREATE VIEW view_dashboard 
AS
SELECT SUM(sisa_pemasukan) AS jumlah_income_saatini FROM tbl_data_pemasukan;

CREATE VIEW view_data_pemasukan 
AS
SELECT kode_pemasukan, pemasukan, sisa_pemasukan 
FROM tbl_data_pemasukan;

-- UPDATE VIEW, DELETE TERLEBIH DAHULU KEMUDIAN MODIFY VIEW
DROP VIEW view_dashboard;

SELECT * FROM view_dashboard;
SELECT * FROM view_data_pemasukan;