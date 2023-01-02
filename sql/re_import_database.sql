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