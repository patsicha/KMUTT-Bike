<?php
    
    $mysql_host = "fdb4.biz.nf";
    $mysql_database = "1566088_db";
    $mysql_user = "1566088_db";
    $mysql_password = "n!ck3090";
    
    $link = mysql_connect($mysql_host, $mysql_user, $mysql_password);
    if (!$link) {
        die('Could not connect: ' . mysql_error());
    }
    
    mysql_select_db("1566088_db");
    mysql_query("SET NAMES UTF8");
    
    $bikeID = mysql_real_escape_string($_POST["bikeid"]);
    $userID = mysql_real_escape_string($_POST["userid"]);
    $distance = mysql_real_escape_string($_POST["distance"]);
    $code = mysql_real_escape_string($_POST["code"]);
    $durability = mysql_real_escape_string($_POST["durability"]);
    $break = mysql_real_escape_string($_POST["break"]);
    $gear = mysql_real_escape_string($_POST["gear"]);
    $handle = mysql_real_escape_string($_POST["handle"]);
    $pedal = mysql_real_escape_string($_POST["pedal"]);
    $saddle = mysql_real_escape_string($_POST["saddle"]);
    $wheel = mysql_real_escape_string($_POST["wheel"]);
    $arr = null;
    $arr["maintain"] = $break.$gear.$handle.$pedal.$saddle.$wheel;
    
    $strSQL = "UPDATE `bicycle maintain` SET `bicycle_durability`='".$durability."',`maintain_gear`='".$gear."',`maintain_wheel`='".$wheel."',`maintain_break`='".$break."',`maintain_saddle`='".$saddle."',`maintain_padle`='".$pedal."',`maintain_handle`='".$handle."' WHERE `bicycle_id` =  '".$bikeID."'";
    $objQuery = mysql_query($strSQL);
    $strSQL = "INSERT INTO `update log`(`user_id`, `bicycle_id`, `current_distance`, `update_code`) VALUES ('".$userID."','".$bikeID."','".$distance."','".$code."')";
    $objQuery = mysql_query($strSQL);
    if (mysql_errno()) {
        $arr["Status"] = "0";
        $arr["Message"] = mysql_errno();
    }else{
        $arr["Status"] = "1";
        $arr["Message"] = "UPDATED";
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

    echo json_encode($arr);
     
     
    ?>