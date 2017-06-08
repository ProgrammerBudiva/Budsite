<?php
//TODO якшо треба видавати окрему категорію товарів, то доробити видачу в хмл

if(($_POST['user']=='admin')&&($_POST['auth']=='ocpass'))
{
if($_POST['xml']=='export')
{
    $exp=file_get_contents('/home/andriyyy/projects/Budsite/export/openc_exp.xml');
   echo $exp;
}

if($_POST['xml']=='import')
{
    echo "import command succesfully ";
    if(!empty($_POST['content'])){
    $file='openc_imp.xml';
    $out=$_POST['content'];
    $arr3 = new SimpleXMLElement($out);
        $xml='';
      //
    if(isset($_POST['from'])&&isset($_POST['to'])){
        echo $_POST['from'].":::".$_POST['to'];
        echo PHP_EOL.count($arr3->Каталог->Товары->Товар);
        if(($_POST['from']<=count($arr3->Каталог->Товары->Товар)) && ($_POST['to']<=count($arr3->Каталог->Товары->Товар)) )
        {
        for($i=$_POST['from'];$i<$_POST['to'];$i++) {
        $xml.=$arr3->Каталог->Товары->Товар[$i];
        }
            echo "openc_imp updated succesfully 1";
        file_put_contents($file,$xml);
            }

      else {
          echo "openc_xml updated succesfully 2";
          file_put_contents($file,$out);
      }

    }
        else {
        echo "openc_xml updated succesfully 3";
        file_put_contents($file,$out);
        }

    //run toopencart.php
    //echo "import_test.xml updated succesfully";
    }
}
}

// TODO review this(maybe make category list)