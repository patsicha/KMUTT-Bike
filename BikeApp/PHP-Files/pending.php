<?php
    
    $mysql_host = "fdb4.biz.nf";
    $mysql_database = "1566088_db";
    $mysql_user = "1566088_db";
    $mysql_password = "n!ck3090";
    
    $link = mysql_connect($mysql_host, $mysql_user, $mysql_password);
    if (!$link) {
        die('Could not connect: ' . mysql_error());
    }
    
    //$_POST["bikecode"] = "A0001";
    //$_POST["password"] = "test";
    
    mysql_select_db("1566088_db");
    mysql_query("SET NAMES UTF8");
    $strSQL = "SELECT  `bicycle_id`,`bicycle_status` FROM `bicycle` WHERE `bicycle_code` =  '".mysql_real_escape_string($_POST["bikecode"])."' ";
    $objQuery = mysql_query($strSQL);
    $objResult = mysql_fetch_array($objQuery);
    
    if($objResult)
    {
        if($objResult[1] != "Rented")
        {
        $bikeID = $objResult[0];
        
        $userID = mysql_real_escape_string($_POST["userid"]);
        $arr = null;
        $arr["BikeID"] = $bikeID;
        // INSERT INTO `1566088_db`.`pending log` ( `user_id`, `bicycle_id`) VALUES ('53211536', '0001');
        $strSQL = "INSERT INTO `1566088_db`.`pending log` ( `user_id`, `bicycle_id`) VALUES ('".$userID."', '".$bikeID."')";
        //'".mysql_real_escape_string($_POST["bikecode"])."'
        
        $objQuery = mysql_query($strSQL);
        if (mysql_errno()) {
            $arr["Status"] = "0";
            $arr["Message"] = mysql_errno();
        }else{
            $arr["Status"] = "1";
            $arr["Message"] = "PENDING";
            $strSQL = "SELECT `pending_date_time` FROM `pending log` WHERE `user_id` = '".$userID."' AND `bicycle_id` = '".$bikeID."' ORDER BY  `pending log`.`pending_date_time` DESC LIMIT 0 , 30" ;
            //'".mysql_real_escape_string($_POST["bikecode"])."'
            
            $objQuery = mysql_query($strSQL);
            $objResult = mysql_fetch_array($objQuery);
            $arr["Datetime"] = $objResult[0];
            
        }
        }else{
            $arr["Status"] = "0";
            $arr["Message"] = "BIKENOTAVALIABLE";
        }
    }else{
        $arr["Status"] = "0";
        $arr["Message"] = "BIKENOTFOUND";
    }
    /* $objResult = mysql_fetch_array($objQuery);
     
     
     if(!$objResult)
     {
     
     
     }
     else
     {
     
     }
     */
    mysql_close($link);
    
    echo json_encode($arr);
    
    ?>