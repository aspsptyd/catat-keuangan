<?php
    
    require "../config/controller.php";

    # Cek Method Req. API
    if ($_SERVER['REQUEST_METHOD'] == "POST") {

        # Cek Parameter Body
        if (ISSET($_POST['username']) && ISSET($_POST['userkey'])) {

            $username = $_POST['username'];
            $userkey = $_POST['userkey'];

            # User Akses ke Aplikasi
            $QUERY_LOGIN_USER = "SELECT COUNT(id) AS user_exist FROM tbl_data_user WHERE username = '".  $username . "' AND userkey = md5('".  $userkey . "');";
            $EXECUTE_LOGIN = mysqli_query($connecting, $QUERY_LOGIN_USER);
            $USER_EXIST = mysqli_fetch_row($EXECUTE_LOGIN);

            if ($USER_EXIST[0]) {
                $message = 'Yay, Anda berhasil melakukan login!';

                # Extract Data User
                $QUERY_AKSES_DATA_USER = "SELECT id, id_user, username, lisensi_user, auth_access, tanggal_register FROM tbl_data_user WHERE username = '" . $username . "' AND userkey = md5('" . $userkey . "');";
                $EXECUTE_AKSES_DATA = mysqli_query($connecting, $QUERY_AKSES_DATA_USER);
                $FETCH_DATA_USER = mysqli_fetch_row($EXECUTE_AKSES_DATA);

                if ($FETCH_DATA_USER[3] == "-" || $FETCH_DATA_USER[3] == "") {
                    # Data Lisensi Tidak ada
                    $message = 'Lisensi akun Anda tidak aktif, harap hubungi tim developer';
    
                    $response['code'] = 405;
                    $response['status'] = false;
                    $response['message'] = $message;
                } else {
                    # Format Kode Random
                    date_default_timezone_set("Asia/Jakarta");
                    $kode_random = date("d") . date("m") . date("Y") . date("H"). date("i"). date("s"); // 03 01 2023 15 42 11

                    # Update Auth Access
                    $QUERY_UPDATE_AUTH_ACCESS = "UPDATE tbl_data_user SET auth_access = ROUND(RAND() * $kode_random) WHERE id = " . $FETCH_DATA_USER[0] . ";";
                    $EXECUTE_SET_NEW_AUTH_ACCESS = mysqli_query($connecting, $QUERY_UPDATE_AUTH_ACCESS);

                    $response['code'] = 200;
                    $response['status'] = true;
                    $response['message'] = $message;
                    $response['data_user'] = [
                        "id" => $FETCH_DATA_USER[0],
                        "id_user" => $FETCH_DATA_USER[1],
                        "username" => $FETCH_DATA_USER[2],
                        "lisensi_akun" => $FETCH_DATA_USER[3],
                        "akses_auth" => $FETCH_DATA_USER[4],
                        "tanggal_register" => $FETCH_DATA_USER[5]
                    ];
                }
            } else {
                # Data User tidak ditemukan
                $message = 'Data user tidak ditemukan di database';

                $response['code'] = 404;
                $response['status'] = false;
                $response['message'] = $message;
            }
        } else {
            # Parameter Login Tidak sesuai
            $message = 'Definisikan parameter Login, sesuaikan dan silahkan coba lagi!';

            $response['code'] = 503;
            $response['status'] = false;
            $response['message'] = $message;
        }
        
        echo json_encode($response);
    } else {
        # Request API tidak Sesuai harusnya POST
        $message = 'Request API ini pakai Method POST, sesuaikan lebih dahulu';

        $response['code'] = 500;
        $response['status'] = false;
        $response['message'] = $message;
        
        echo json_encode($response);
    }
?>