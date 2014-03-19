<?php
    
    $mysql_host = "fdb4.biz.nf";
    $mysql_database = "1566088_db";
    $mysql_user = "1566088_db";
    $mysql_password = "n!ck3090";
    
    $link = mysql_connect($mysql_host, $mysql_user, $mysql_password);
    if (!$link) {
        die('Could not connect: ' . mysql_error());
    }
    
   // $_POST["bikeid"] = "0001";
   // $_POST["userid"] = "53211536";
   // $_POST["datetime"] = "2014-03-18 14:52:57";
    mysql_select_db("1566088_db");
    mysql_query("SET NAMES UTF8");
    
    $bikeID = mysql_real_escape_string($_POST["bikeid"]);
    $userID = mysql_real_escape_string($_POST["userid"]);
    $datetime = mysql_real_escape_string($_POST["datetime"]);
    $arr = null;
    // INSERT INTO `1566088_db`.`pending log` ( `user_id`, `bicycle_id`) VALUES ('53211536', '0001');
    $strSQL = "SELECT `pending_status` FROM `pending log` WHERE `user_id` = '".$userID."' AND `bicycle_id` = '".$bikeID."' AND `pending_date_time` = '".$datetime."'" ;
    //'".mysql_real_escape_string($_POST["bikecode"])."'
    $objQuery = mysql_query($strSQL);
    $objResult = mysql_fetch_array($objQuery);
    
    if ($objResult[0] == "Pending") {
        $arr["Status"] = "0";
        $arr["Message"] = "PENDING";
    }else{
        $arr["Status"] = "1";
        $arr["Message"] = "APPROVED";
       // $strSQL = "INSERT INTO `rental log`(`user_id`, `bicycle_id`, `check_out_date_time`) VALUES ('".$userID."','".$bikeID."','".$datetime."')";
        //$objQuery = mysql_query($strSQL);
        //$strSQL = "UPDATE  `bicycle` SET  `bicycle_status` =  'Rented' WHERE  `bicycle`.`bicycle_id` =  '".$bikeID."' LIMIT 1";
        //$objQuery = mysql_query($strSQL);
        $strSQL = "SELECT * FROM `bicycle` INNER JOIN `bicycle model information` ON `bicycle`.`bicycle_model` = `bicycle model information`.`bicycle_model` INNER JOIN `bicycle maintain` ON `bicycle`.`bicycle_id` = `bicycle maintain`.`bicycle_id` WHERE  `bicycle`.`bicycle_id` =  '".$bikeID."' LIMIT 1";
        $objQuery = mysql_query($strSQL);
        $intNumField = mysql_num_fields($objQuery);
        $resultArray = array();
        while($obResult = mysql_fetch_array($objQuery))
        {
            $arrCol = array();
            for($i=0;$i<$intNumField;$i++)
            {
                $arrCol[mysql_field_name($objQuery,$i)] = $obResult[$i];
            }
            array_push($resultArray,$arrCol);
        }
        
        $arr["bikeInfo"] = $resultArray[0];
        
    }
    mysql_close($link);
    
    echo json_encode($arr);
     
    ?>