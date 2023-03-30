<?php

    $switch_server = "LOCAL";

    # Version API
    $versionapp_api                       = "V1.0-alpha";
    $build_version_api                    = "Build 29122022.1109";
    $select_dev_team                      = "B";
 
    switch ($switch_server) {
        case "LOCAL":
            # Server Local Komputer
            $server_db                    = "Lokal Komputer";
            $host_db                      = "127.0.0.1";
            switch ($select_dev_team) {
                case "A":
                    $username_db          = "dev";
                    $key_db               = ">>!!&21Adi";
                    break;
                default:
                    $username_db          = "root";
                    $key_db               = "";
                    break;
            }
            $db_name                      = "db_catat_keuangan";
            break;
    }

    $connecting = mysqli_connect($host_db, $username_db, $key_db, $db_name);

    // if ($connecting) {
    //     $response['code']           = 200;
    //     $response['status']         = true;
    //     $response['server']         = $server_db;
    //     $response['message']        = 'Berhasil terhubung dengan server Database '.$db_name;
    // } else {
    //     $response['code']           = 500;
    //     $response['status']         = false;
    //     $response['server']         = $server_db;
    //     $response['message']        = 'Gagal menghubungkan dengan server Database '.$db_name;
    // }

    // echo json_encode($response);
?>