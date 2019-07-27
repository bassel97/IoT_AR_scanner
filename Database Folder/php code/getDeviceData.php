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


    $sql_query = mysqli_query($con, "SELECT data_shared.title, devices_names.name, devices_names.type
    FROM data_shared
    INNER JOIN devices_to_data ON data_shared.id = devices_to_data.data_id
    INNER JOIN devices_names ON devices_to_data.devices_id = devices_names.id
    WHERE devices_names.name = ('" . $devicename . "')") or die("error1");

    while($row = $sql_query->fetch_assoc()) {
        echo $row["title"];
        echo "\t";
    }

?>