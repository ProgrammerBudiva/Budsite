<?php
// example: 
//$cron->call("module/yourmodulename/method", array ("minute" => "*", "hour" => "*", "day" => "*", "dayofweek" => "*", "dayofmonth" => "*"), array("param" => true));
 
//end file


$file="/home/andriyyy/projects/Budsite/export/out.txt";
$out="works";
file_put_contents($file,$out);
//include 'xmljson.php';
//$cron->call(
      //  "module/helloworld/xmlintegration",
       // array (
       //         "minute" => "*/1",
       //         "hour" => "*",
        //        "day" => "*",
         //       "dayofweek" => "*",
       //         "dayofmonth" => "*"
   //     )

//);
