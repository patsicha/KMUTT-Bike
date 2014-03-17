<?php
    
    $mysql_host = "fdb4.biz.nf";
    $mysql_database = "1566088_db";
    $mysql_user = "1566088_db";
    $mysql_password = "n!ck3090";
    
    $link = mysql_connect($mysql_host, $mysql_user, $mysql_password);
    if (!$link) {
        die('Could not connect: ' . mysql_error());
    }
    
    //$_POST["bikecode"] = "A0099";
    //$_POST["password"] = "test";
    
    mysql_select_db("1566088_db");
    mysql_query("SET NAMES UTF8");
    // SELECT * FROM `bicycle` INNER JOIN `bicycle maintain` ON `bicycle`.`bicycle_id` = `bicycle maintain`.`bicycle_id` WHERE `bicycle`.`bicycle_code` = 'A0001'
    $strSQL = "SELECT * FROM `bicycle` INNER JOIN `bicycle maintain` ON `bicycle`.`bicycle_id` = `bicycle maintain`.`bicycle_id` WHERE `bicycle`.`bicycle_code` = '".mysql_real_escape_string($_POST["bikecode"])."'";
    $objQuery = mysql_query($strSQL);
    $objResult = mysql_fetch_array($objQuery);
    $arr = null;
    if(!$objResult)
    {
        $arr["Status"] = "0";
        $arr["Message"] = "NOTFOUND";
        
    }
    else
    {
        $arr["Status"] = "1";
        $arr["Message"] = "FOUND";
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
        
        $arr["Bike"] = $resultArray[0];    }
    
    mysql_close($link);
    
    echo json_encode($arr);
    ?>