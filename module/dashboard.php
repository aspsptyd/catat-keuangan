<?php

    require "../config/controller.php";

    $QUERY_DASHBOARD_APP = mysqli_query($connecting, "SELECT * FROM view_dashboard;");
    $GET_DASHBOARD_APP_DATA = mysqli_fetch_row($QUERY_DASHBOARD_APP);

    #
    # 1. QUERING DATA INCOME
    #
    
    # Query Income
    $QUERYINCOME = "SELECT * FROM view_data_pemasukan;";

    # Eksekusi Query Income
    $EXEC_INCOME = mysqli_query($connecting, $QUERYINCOME);
    
    # Extract Data
    $result = array();

    while($row = mysqli_fetch_array($EXEC_INCOME)){
        array_push($result, 
        array(
            'kode_pemasukan'=>(String)$row[0],
            'deskripsi_pemasukan'=>(String)$row[1],
            'pemasukan'=>(int)$row[2],
            'sisa_pemasukan'=>(String)$row[3],
        ));
    }
    
    # Set Object Data
    $jumlah_saldo_saatini = 0;
    if ($GET_DASHBOARD_APP_DATA[0] == 0) {
        $jumlah_saldo_saatini = "Habis";
    } else {
        $jumlah_saldo_saatini = $GET_DASHBOARD_APP_DATA[0];
    }
    $response['jumlah_saldo_saat_ini'] = $jumlah_saldo_saatini;
    $response['list_data_pemasukan'] = $result;

    # Tampilkan Data
    echo json_encode($response);

?>