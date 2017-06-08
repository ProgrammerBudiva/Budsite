<?php


//$xml=simplexml_load_file("import.xml");
//print_r($xml);

//XMLToArrayFlat($xml, $xmlarray, $file.':', true);
//print_r($xmlarray[:/КоммерческаяИнформация/Классификатор[1]/Наименование[1]]);
//set_time_limit(60);
require 'msql.inc.php';
$import=file_get_contents('/home/andriyyy/projects/Budsite/export/import.xml');
$offers=file_get_contents('/home/andriyyy/projects/Budsite/export/offers.xml');
/*
$import_php='<?php'.PHP_EOL.'$xmlstr = <<<XML'.PHP_EOL.$import.PHP_EOL.'XML;'.PHP_EOL.'?>';
$offers_php='<?php'.PHP_EOL.'$xmlstrof = <<<XML'.PHP_EOL.$offers.PHP_EOL.'XML;'.PHP_EOL.'?>';
$file='/home/andriyyy/projects/Budsite/export/im.php';
file_put_contents($file, $import_php);
$file='/home/andriyyy/projects/Budsite/export/of.php';

include '/home/andriyyy/projects/Budsite/export/im.php';
include '/home/andriyyy/projects/Budsite/export/of.php';
*/
$arr = new SimpleXMLElement($import);
$arrof = new SimpleXMLElement($offers);
$kurs=28.00;



$catsubs=array();
$c="SELECT * FROM oc_category_description";
$r=mysql_query($c);
//$c2=mysql_fetch_assoc($c);
//$n=mysql_num_rows($c);
while ($row = mysql_fetch_assoc($r))
{
    $s="SELECT * FROM oc_category WHERE category_id=".$row['category_id'];
    $r2=mysql_query($s);
    $s2=mysql_fetch_assoc($r2);
    $s3=$s2['parent_id'];
    $catsubs[]=array(name=>$row['name'],id=>$row['category_id'],parent=>$s3);
}



function subcat_id_by_name($name,$arr,$parid)
{
    $rez=0;
    for($t=0;$t<count($arr);$t++) {

        if(($arr[$t][name]==$name)&&($arr[$t][parent]==$parid))
        {
            $rez=$arr[$t][id];
        }

    }
    return $rez;
}

function cat_id_by_name($name,$cats)
{
$rez=0;
for($t=0;$t<count($cats);$t++) {

   if($cats[$t][name]==$name)
   {
     $rez=$cats[$t][id];
   }

}
    return $rez;
}
//$catsubs=array(array(195=>'Скатная кровля',parent=>0),array(196=>'Еврорубероид',parent=>206));
$cid=0;
$scid=0;

//echo cat_id_by_name('Сад и огород',$catsubs);

//TODO category and subcategory listing


$categorygroup=array();
$subcategorygroup=array();
for($k1=0;$k1<count($arr->Классификатор->Группы->Группа);$k1++)
{
    //$categorygroup=$arr->Классификатор->Группы->Группа[$k]->Наименование;


    for($t2=0;$t2<count($arr->Классификатор->Группы->Группа[$k1]->Группы->Группа);$t2++)
    {
        $subcategorygroup[]= array('category'=>"'".$arr->Классификатор->Группы->Группа[$k1]->Наименование."'",'subname'=>"'".$arr->Классификатор->Группы->Группа[$k1]->Группы->Группа[$t2]->Наименование."'",'subid'=>"'".$arr->Классификатор->Группы->Группа[$k1]->Группы->Группа[$t2]->Ид."'");
    }


   //echo $arr->Классификатор->Группы->Группа[$k1]->Наименование;
}

function find_cat_by_xmlcid($idr,$sb)
{

    //return $categ;
}

function find_attr_name($id,&$masiv)
{
    $atrname='';
    for($n=0;$n<count($masiv->Классификатор->Свойства->Свойство);$n++)
    {
        if($masiv->Классификатор->Свойства->Свойство[$n]->Ид==$id)
        {
            $atrname=$masiv->Классификатор->Свойства->Свойство[$n]->Наименование;
        }
    }
  return $atrname;
}
/*
function offeridbytovar($tid,&$aaaa)
{
    //echo $aaaa->ПакетПредложений->Предложения->Предложение[0]->Ид;
    $w=0;
    for($w=0; $w<count($aaaa->ПакетПредложений->Предложения->Предложение);$w++)
    {
      if((string)$aaaa->ПакетПредложений->Предложения->Предложение[$w]->Ид==(string)$tid)
      {
          return $w;
      }
    }
    return (int)-1;
}
*/


$out='';
$out.='<?xml version="1.0" encoding="UTF-8"?>';
$out.= '<products>';
echo count($arrof->ПакетПредложений->Предложения->Предложение)."==".count($arr->Каталог->Товары->Товар);

//echo $arrof->ПакетПредложений->ТипыЦен->ТипЦены[0]->Валюта;
//echo $arrof->ПакетПредложений->ТипыЦен->ТипЦены[1]->Валюта;

for($i=0; $i< count($arr->Каталог->Товары->Товар);$i++) {
   // echo $i.'<br>';

    $oid=0;
    $w=0;
    $flag=0;
    for($w=0; $w<count($arrof->ПакетПредложений->Предложения->Предложение);$w++)
    {   $flag=0;
        if((string)$arrof->ПакетПредложений->Предложения->Предложение[$w]->Ид==(string)$arr->Каталог->Товары->Товар[$i]->Ид)
        {
            $oid= $w;$flag=1;
        }
    }
    if($flag==0) $oid=-1;
      $offerid=$oid;
      //  $offerid=(int) offeridbytovar((string)$arr->Каталог->Товары->Товар[$i]->Ид, $arrof);
   // echo "<br>".$offerid."<br>";


            $categ = '';
            $subcateg = '';
            for ($k2 = 0; $k2 < count($subcategorygroup); $k2++) {
                //echo $idr."=".$sb[$k2]['subid']."<br>";
                //echo $sb[$k2]['subid'];
                if ($subcategorygroup[$k2]['subid'] == "'" . $arr->Каталог->Товары->Товар[$i]->Группы[0]->Ид . "'") {
                    $categ = $subcategorygroup[$k2]['category'];
                    $subcateg = $subcategorygroup[$k2]['subname'];
                }
            }

            $categ = str_replace("'", "", $categ);
            $subcateg = str_replace("'", "", $subcateg);


            $categid = cat_id_by_name($categ, $catsubs);
            // Print_r($catsubs);
            //  echo $arr->Каталог->Товары->Товар[$i]->Ид;
            // $out.= $i.'<br>';

                $out.= '<product>';
                $out.= '<main>';

                    $out.= '<category>' . $categ . '</category>';
                    $out.= '<categoryid>' . $categid . '</categoryid>';
                    $out.= '<subcategories>';
                    // for($j=0; $j< count($arr->Классификатор->Группы->Группа[0]->Группы->Группа);$j++){
                    $out.= '<subcategory>' . $subcateg . '</subcategory>';
                    $out.= '<subcategoryid>' . subcat_id_by_name($subcateg, $catsubs, $categid) . '</subcategoryid>';
                    // }
                    $out.= '</subcategories>';
                    $out.= '<tovarid>' . $arr->Каталог->Товары->Товар[$i]->Ид . '</tovarid>';
                    $out.= '<articul>' . $arr->Каталог->Товары->Товар[$i]->Артикул . '</articul>';
                    $out.= '<description>' . $arr->Каталог->Товары->Товар[$i]->Описание . '</description>';
                    $out.= '<name>' . $arr->Каталог->Товары->Товар[$i]->Наименование . '</name>';
                    $image = $arr->Каталог->Товары->Товар[$i]->Картинка;
                    $out.= '<image>' . $image . '</image>';
                    $out.= '<meta-title></meta-title>';
                    $out.= '<metadescription></metadescription>';
                    $out.= '<metakeyword></metakeyword>';
                    $out.= '<metatags></metatags>';
                    $out.= '</main>';
                    $out.= '<data>';
                    $out.= '<model>' . $arr->Каталог->Товары->Товар[$i]->ЗначенияРеквизитов->ЗначениеРеквизита[2]->Значение . '</model>';

    /*
                            if (!empty($offerid))
                            {

                                $valuta='грн';
                                $pricegrn = 0;
                           // $pricegrn = $arrof->ПакетПредложений->Предложения->Предложение[(int)$offerid]->Цены->Цена[0]->ЦенаЗаЕдиницу;
                                $idvaluta=0;

                                /*
                           $idvaluta=0;
                           if($arrof->ПакетПредложений->ТипыЦен->ТипЦены[0]->Ид==$arrof->ПакетПредложений->Предложения->Предложение[(int)$offerid]->Цены->Цена[0]->ИдТипаЦены)
                           { $valuta=$arrof->ПакетПредложений->ТипыЦен->ТипЦены[0]->Валюта;$idvaluta=0;}
                           if($arrof->ПакетПредложений->ТипыЦен->ТипЦены[0]->Ид==$arrof->ПакетПредложений->Предложения->Предложение[(int)$offerid]->Цены->Цена[1]->ИдТипаЦены)
                           { $valuta=$arrof->ПакетПредложений->ТипыЦен->ТипЦены[1]->Валюта;$idvaluta=1;}
                               $pricegrn = $arrof->ПакетПредложений->Предложения->Предложение[(int)$offerid]->Цены->Цена[$idvaluta]->ЦенаЗаЕдиницу;
                              if(($pricegrn=='') && ($idvaluta==1) )
                               {
                                   $pricegrn = $arrof->ПакетПредложений->Предложения->Предложение[(int)$offerid]->Цены->Цена[1]->ЦенаЗаЕдиницу;
                               }

                               // if($valuta=='ROT') $valuta='EUR';
                            $out.= '<currency>' . $valuta . '</currency>';
                            $out.= '<price>' . $pricegrn . '</price>';
                            $out.= '<start-price>' . $pricegrn . '</start-price>';

                            $out.= '<quantity>' . $arrof->ПакетПредложений->Предложения->Предложение[(int)$offerid]->Количество . '</quantity>';
                               }

                            if (empty($offerid))
                            {
                                $pricegrn = 0;
                               // $pricegrn = $arrof->ПакетПредложений->Предложения->Предложение[$i]->Цены->Цена[0]->ЦенаЗаЕдиницу;


                                //$out.= '<currency>' . $arrof->ПакетПредложений->ТипыЦен->ТипЦены[0]->Валюта . '</currency>';
                                $out.= '<price>' . $pricegrn . '</price>';
                                $out.= '<start-price>' . $pricegrn . '</start-price>';

                                $out.= '<quantity>1</quantity>';
                            }
                    */

    //$out.= '<offerid>'.$offerid.'</offerid>';

    $out.= '<minquantity>1</minquantity>';
    $out.= '<date>'.date('Y-m-d h:i:s').'</date>';
    $out.= '<heigth>1</heigth>';
    $out.= '<width>1</width>';
    $out.= '<length>1</length>';
    $out.= '<length-class>'.$arrof->ПакетПредложений->Предложения->Предложение[$i]->Цены->Цена[0]->Единица.'</length-class>';
    $out.= '<weight>'.$arr->Каталог->Товары->Товар[$i]->ЗначенияРеквизитов->ЗначениеРеквизита[3]->Значение.'</weight>';
    $out.= '<weight-class>kg</weight-class>';
    $out.= '<sort-order>1</sort-order>';

    $out.='</data>';
    $out.='<links>';
    $out.= '<manufacturer>'.trim($arr->Каталог->Товары->Товар[$i]->ЗначенияСвойств->ЗначенияСвойства[1]->Значение).'</manufacturer>';
    $out.='</links>';
    $out.='<attributes>';
        for($k=0;$k<count($arr->Каталог->Товары->Товар[$i]->ЗначенияСвойств->ЗначенияСвойства);$k++)
        {
            $out.= '<attribute>';
            $out.= '<attrname>'.find_attr_name((string)$arr->Каталог->Товары->Товар[$i]->ЗначенияСвойств->ЗначенияСвойства[$k]->Ид,$arr).'</attrname>';
            $out.= '<attrvalue>'.trim($arr->Каталог->Товары->Товар[$i]->ЗначенияСвойств->ЗначенияСвойства[$k]->Значение).'</attrvalue>';
            $out.= '</attribute>';
        }

    $out.= '<weight>'.$arr->Каталог->Товары->Товар[$i]->ЗначенияРеквизитов->ЗначениеРеквизита[3]->Значение.'</weight>';
    $out.= '<square></square>';
    $out.= '<color>'.$arr->Каталог->Товары->Товар[$i]->ЗначенияСвойств->ЗначенияСвойства[2]->Значение.'</color>';
    $out.= '<type></type>';
    $out.= '<shape></shape>';
    $out.= '<brand>'.$arr->Каталог->Товары->Товар[$i]->ЗначенияСвойств->ЗначенияСвойства[0]->Значение.'</brand>';
    $out.= '<manufacturer>'.trim($arr->Каталог->Товары->Товар[$i]->ЗначенияСвойств->ЗначенияСвойства[1]->Значение).'</manufacturer>';
    $out.= '<color-description>1</color-description>';
    $out.= '<garanthy>0</garanthy>';

    $out.='</attributes>';

    $out.= '</product>';

    //$out.= '======================'.'<br>';


}

$out.= '</products>';
echo $out;
$file='/home/andriyyy/projects/Budsite/export/openc_imp.xml';
file_put_contents($file, $out);
/*
$file='/home/andriyyy/projects/Budsite/export/opncar_xml.php';
$out='<?php'.PHP_EOL.'$xmlnew = <<<XML'.PHP_EOL.$out.PHP_EOL.'XML;'.PHP_EOL.'?>';
file_put_contents($file, $out);
*/
//echo $out;
//$xml1 = simplexml_load_string($xml, "SimpleXMLElement", LIBXML_NOCDATA);
//$json = json_encode($xml1);
//$array = json_decode($json,TRUE);