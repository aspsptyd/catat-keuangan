<?php

    require "../config/controller.php";

    #
    # 1. QUERING DATA INCOME
    #
    
    # Query Jumlah Pemasukan
    $QUERY_JML_INCOME = mysqli_query($connecting, "SELECT * FROM overview_pemasukan;");
    $GET_JML_INCOME = mysqli_fetch_row($QUERY_JML_INCOME);

    # Query Income
    $QUERYINCOME = "SELECT * FROM list_data_pemasukan;";

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
    $QUERY_JML_OUTCOME = mysqli_query($connecting, "SELECT * FROM overview_pengeluaran;");
    $GET_JML_OUTCOME = mysqli_fetch_row($QUERY_JML_OUTCOME);

    # Query Outcome
    $QUERYOUTCOME = "SELECT * FROM list_data_pengeluaran;";

    # Eksekusi Query Income
    $EXEC_OUTCOME = mysqli_query($connecting, $QUERYOUTCOME);
    
    # Extract Data
    $result_outcome = array();

    while($row = mysqli_fetch_array($EXEC_OUTCOME)){
        array_push($result_outcome, 
        array(
            'kode_pengeluaran'=>(String)$row[0],
            'deskripsi_pengeluaran'=>(String)$row[1],
            'kategori_pengeluaran'=>(String)$row[2],
            'jml_pengeluaran'=>(int)$row[3],
            'status_pengeluaran'=>(String)$row[4],
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