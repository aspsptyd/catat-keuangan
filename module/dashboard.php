<?php

    require "../config/controller.php";

    #
    # 1. QUERING DATA INCOME
    #
    
    # Query Jumlah Pemasukan
    $QUERY_JML_INCOME = mysqli_query($connecting, "SELECT SUM(sisa_pemasukan) AS jumlah_income_saatini, COUNT(id) AS jml_data_in FROM tbl_data_pemasukan;");
    $GET_JML_INCOME = mysqli_fetch_row($QUERY_JML_INCOME);

    # Query Income
    $QUERYINCOME = "SELECT kode_pemasukan, deskripsi_pemasukan, pemasukan, sisa_pemasukan FROM tbl_data_pemasukan;";

    # Eksekusi Query Income
    $EXEC_INCOME = mysqli_query($connecting, $QUERYINCOME);
    
    # Extract Data
    $result_income = array();

    while($row = mysqli_fetch_array($EXEC_INCOME)){
        array_push($result_income, 
        array(
            'kode_pemasukan'=>(String)$row[0],
            'deskripsi_pemasukan'=>(String)$row[1],
            'pemasukan'=>(int)$row[2],
            'sisa_pemasukan'=>(String)$row[3],
        ));
    }

    # Query Jumlah Pengeluaran
    $QUERY_JML_OUTCOME = mysqli_query($connecting, "SELECT SUM(jml_pengeluaran) AS jml_pengeluaran, COUNT(id) AS jml_data_out FROM tbl_data_pengeluaran WHERE status_pengeluaran = 'Done';");
    $GET_JML_OUTCOME = mysqli_fetch_row($QUERY_JML_OUTCOME);

    # Query Outcome
    $QUERYOUTCOME = "SELECT tbl_data_pengeluaran.kode_pengeluaran, tbl_data_pengeluaran.jml_pengeluaran, tbl_data_pengeluaran.status_pengeluaran, tbl_data_pengeluaran.deskripsi_pengeluaran, tbl_data_pengeluaran.kategori_pengeluaran, tbl_data_pemasukan.deskripsi_pemasukan FROM tbl_data_pengeluaran JOIN tbl_data_pemasukan ON tbl_data_pemasukan.kode_pemasukan=tbl_data_pengeluaran.kode_pemasukan WHERE tbl_data_pengeluaran.status_pengeluaran = 'Done';";

    # Eksekusi Query Income
    $EXEC_OUTCOME = mysqli_query($connecting, $QUERYOUTCOME);
    
    # Extract Data
    $result_outcome = array();

    while($row = mysqli_fetch_array($EXEC_OUTCOME)){
        array_push($result_outcome, 
        array(
            'kode_pengeluaran'=>(String)$row[0],
            'jumlah_pengeluaran'=>(int)$row[1],
            'status'=>(String)$row[2],
            'keterangan'=>(String)$row[3],
            'kategori_pengeluaran'=>(String)$row[4],
            'pemasukan_dari'=>(String)$row[5],
        ));
    }
    
    # Set Object Data
    $jumlah_saldo_saatini = 0;
    if ($GET_JML_INCOME[0] == 0) {
        $jumlah_saldo_saatini = "Habis";
    } else {
        $jumlah_saldo_saatini = $GET_JML_INCOME[0];
    }
    $jumlah_out_saatini = 0;
    if ($GET_JML_OUTCOME[0] == 0) {
        $jumlah_out_saatini = "Belum ada pengeluaran";
    } else {
        $jumlah_out_saatini = $GET_JML_OUTCOME[0];
    }

    $response['jumlah_saldo_saat_ini'] = $jumlah_saldo_saatini;
    $response['jml_data_in'] = $GET_JML_INCOME[1];
    $response['list_data_pemasukan'] = $result_income;
    $response['jumlah_pengeluaran'] = $jumlah_out_saatini;
    $response['jml_data_out'] = $GET_JML_OUTCOME[1];
    $response['list_data_pengeluaran'] = $result_outcome;

    # Tampilkan Data
    echo json_encode($response);

?>