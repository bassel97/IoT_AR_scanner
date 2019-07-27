<?php

    //=================== Connecting to the database ===================
    

    //WebsiteName:
    //vuforia-project.000webhostapp.com

    //host:     localhost
    //username: id10256124_vuf
    //password: 123456
    //dbname:   id10256124_vuf_db
    $con = mysqli_connect('localhost', 'id10256124_vuf', '123456', 'id10256124_vuf_db');

    if (mysqli_connect_errno()){
        echo ("error0");
        exit();
    }
    //==================================================================


    //=================== Inputs from Unity 3D =========================
    $devicename = $_POST["Device"];
    //==================================================================


    $sql_query = mysqli_query($con, "SELECT devices_names.type, devices_names.manufacturer, devices_names.iot_app
    FROM devices_names
    WHERE devices_names.name = ('" . $devicename . "')") or die("error1");

    $sql_reslut = $sql_query->fetch_assoc();
    echo $sql_reslut["type"] . " (" . $devicename . ") " . $sql_reslut["manufacturer"]. " Using app " . $sql_reslut["iot_app"];

?>