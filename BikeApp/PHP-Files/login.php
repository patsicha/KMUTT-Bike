<?php
    
    $mysql_host = "fdb4.biz.nf";
    $mysql_database = "1566088_db";
    $mysql_user = "1566088_db";
    $mysql_password = "n!ck3090";
    
    $link = mysql_connect($mysql_host, $mysql_user, $mysql_password);
    if (!$link) {
        die('Could not connect: ' . mysql_error());
    }
    
    //$_POST["username"] = "53211536";
    //$_POST["password"] = "test";
    
    mysql_select_db("1566088_db");
    mysql_query("SET NAMES UTF8");
    $strSQL = "SELECT * FROM `apps user` WHERE user_id = '".mysql_real_escape_string($_POST["username"])."'";
    $objQuery = mysql_query($strSQL);
    $objResult = mysql_fetch_array($objQuery);
    $arr = null;
    if(!$objResult)
    {
        $arr["Status"] = "0";
        $arr["Message"] = "UNKNOWN_USER";
    }
    else
    {
        $strSQL = "SELECT * FROM `apps user` WHERE user_id = '".mysql_real_escape_string($_POST["username"])."' and user_password = '".mysql_real_escape_string($_POST["password"])."'";
        $objQuery = mysql_query($strSQL);
        $objResult = mysql_fetch_array($objQuery);
        if(!$objResult)
        {
            //echo "WRONGPASSWORD";
            $arr["Status"] = "1";
            $arr["Message"] = "WRONGPASSWORD";
        }
        else
        {
            //echo "PASS";
            //$arr["MemberID"] = $objResult[0];
            $arr["Status"] = "2";
            $arr["Message"] = "PASS";
            
            $strSQL = "SELECT * FROM `kmutt student` WHERE student_username = '".$objResult[0]."'";
            mysql_query("SET NAMES UTF8");
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
            
            $arr["User"] = $resultArray[0];
        }
    }
    
    mysql_close($link);
    
    echo json_encode($arr);
    ?>