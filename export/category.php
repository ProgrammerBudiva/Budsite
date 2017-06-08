<?php

//TODO oc_product_to_category, oc_product_to_store впливають на відображення в категоріях
//TODO oc_category(parent_id=0 - батьківська, не 0 - дитина)
//TODO oc_category_description
//TODO oc_category_path ??
//TODO oc_category_to_layout ??

require 'msql.inc.php';
/*
function XMLToArrayFlat($xml, &$return, $path='', $root=false)
{
    $children = array();
    if ($xml instanceof SimpleXMLElement) {
        $children = $xml->children();
        if ($root){ // we're at root
            $path .= '/'.$xml->getName();
        }
    }
    if ( count($children) == 0 ){
        $return[$path] = (string)$xml;
        return;
    }
    $seen=array();
    foreach ($children as $child => $value) {
        $childname = ($child instanceof SimpleXMLElement)?$child->getName():$child;
        if ( !isset($seen[$childname])){
            $seen[$childname]=0;
        }
        $seen[$childname]++;
        XMLToArrayFlat($value, $return, $path.'/'.$child.'['.$seen[$childname].']');
    }
}
*/
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

/*
for($i=0;$i<count($catsubs);$i++)
{
   echo $catsubs[$i][name]."-".$catsubs[$i][id]."-".$catsubs[$i][parent]."<br>";
}
$catsubs=array(
    array('Скатная кровля'=>195,parent=>0),
    array('Еврорубероид'=>196,parent=>206),

);
*/

function cat_id_by_name($name,$arr)
{
    $rez=0;
    for($t=0;$t<count($arr);$t++) {

        if($arr[$t][name]==$name)
        {
            $rez=$arr[$t][id];
        }

    }
    return $rez;
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
function cat_name_by_id($id,$arr)
{
   $namea='';
    for($t=0;$t<count($arr);$t++) {
        if($arr[$t][id]==$id)
        {
            $namea=$arr[$t][name];
        }
    }
    return $namea;
}

function is_main($id,$arr)
{
    $boo=false;
    for($t=0;$t<count($arr);$t++) {
        if($arr[$t][id]==$id)
        {
           if($arr[$t][parent]==0)
           {$boo=true;} else {$boo=false;}


        }
    }
    return $boo;
}

function cat_id_by_brand()
{

}
function subcat_name_by_brand($brand)
{


 if (($brand=='SHINGLAS')||(strtolower($brand)==strtolower('SHINGLAS')))return 'Битумная черепица SHINGLAS';
 if(($brand=='TILERCAT')||(strtolower($brand)==strtolower('TILERCAT'))) return 'Битумная черепица TILERCAT';
 if(($brand=='TEGOLA')||(strtolower($brand)==strtolower('TEGOLA'))) return 'Комплектация для битумной черепицы';
 if(($brand=='KATEPAL')||(strtolower($brand)==strtolower('KATEPAL'))) return 'Комплектация для битумной черепицы';
 if(($brand=='RUFLEX')||(strtolower($brand)==strtolower('KATEPAL'))) return 'Комплектация для битумной черепицы';

 if(($brand=='PROFiL')||(strtolower($brand)==strtolower('PROFiL'))) return 'Водосточные системы';
 if(($brand=='ASKO')||(strtolower($brand)==strtolower('ASKO'))) return 'Соффиты';
 //if(($brand=='Технониколь')||(strtolower($brand)==strtolower('SHINGLAS'))) return 'Еврорубероид Технониколь';
 if(($brand=='TENAX')||(strtolower($brand)==strtolower('TENAX'))) return 'Сетки';
 if(($brand=='Rockwool')||(strtolower($brand)==strtolower('Rockwool'))) return 'Утеплитель ROCKWOOL';
 if(($brand=='Isover')||(strtolower($brand)==strtolower('Isover'))) return 'Утеплитель ISOVER';
 if(($brand=='Carbon') ||(strtolower($brand)==strtolower('Carbon')))return 'Экструдированный пенополистирол Carbon';
    if(($brand=='Техноплекс')||(strtolower($brand)==strtolower('Техноплекс'))) return 'Экструдированный пенополиcтирол Техноплекс';
    if(($brand=='Аквамаст')||(strtolower($brand)==strtolower('Аквамаст'))) return 'Мастики и праймеры';
    if(($brand=='OMAN')||(strtolower($brand)==strtolower('OMAN'))) return 'Чердачные лестницы OMAN';
    if(($brand=='Planter') ||(strtolower($brand)==strtolower('Planter'))) return 'Дренажная мембрана Planter';
    if(($brand=='Изолит')||(strtolower($brand)==strtolower('Изолит'))) return 'Дренажная мембрана Изолит';
    if(($brand=='Typar')||(strtolower($brand)==strtolower('Typar'))) return 'Геотекстиль Typar';
    if(($brand=='Геопульс')||(strtolower($brand)==strtolower('Геопульс'))) return 'Геотекстиль Геопульс';
    if(($brand=='FaSiding')||(strtolower($brand)==strtolower('FaSiding'))) return 'Cайдинг FaSiding';
    if(($brand=='VOX MAX-3') ||(strtolower($brand)==strtolower('VOX MAX-3'))) return 'Cайдинг VOX MAX-3';
    if(($brand=='VOX Solid')||(strtolower($brand)==strtolower('VOX Solid'))) return 'Фасадные панели VOX Solid';

return '';

}


function cat_name_by_brand($brand)
{


    if (($brand=='SHINGLAS')||(strtolower($brand)==strtolower('SHINGLAS')))return 'Битумная черепица';
    if(($brand=='TILERCAT')||(strtolower($brand)==strtolower('TILERCAT'))) return 'Битумная черепица';
    if(($brand=='TEGOLA')||(strtolower($brand)==strtolower('TEGOLA'))) return 'Битумная черепица';
    if(($brand=='KATEPAL')||(strtolower($brand)==strtolower('KATEPAL'))) return 'Битумная черепица';
    if(($brand=='RUFLEX')||(strtolower($brand)==strtolower('KATEPAL'))) return 'Битумная черепица';

    if(($brand=='PROFiL')||(strtolower($brand)==strtolower('PROFiL'))) return 'Скатная кровля';
    if(($brand=='ASKO')||(strtolower($brand)==strtolower('ASKO'))) return 'Скатная кровля';
    //if(($brand=='Технониколь')||(strtolower($brand)==strtolower('SHINGLAS'))) return 'Еврорубероид Технониколь';
    if(($brand=='TENAX')||(strtolower($brand)==strtolower('TENAX'))) return 'Сад и огород';
    if(($brand=='Rockwool')||(strtolower($brand)==strtolower('Rockwool'))) return 'Теплоизоляция';
    if(($brand=='Isover')||(strtolower($brand)==strtolower('Isover'))) return 'Теплоизоляция';
    if(($brand=='Carbon') ||(strtolower($brand)==strtolower('Carbon')))return 'Теплоизоляция';
    if(($brand=='Техноплекс')||(strtolower($brand)==strtolower('Техноплекс'))) return 'Теплоизоляция';
    if(($brand=='Аквамаст')||(strtolower($brand)==strtolower('Аквамаст'))) return 'Гидроизоляция';
    if(($brand=='OMAN')||(strtolower($brand)==strtolower('OMAN'))) return 'Чердачные лестницы';
    if(($brand=='Planter') ||(strtolower($brand)==strtolower('Planter'))) return 'Дренажные материалы';
    if(($brand=='Изолит')||(strtolower($brand)==strtolower('Изолит'))) return 'Дренажные материалы';
    if(($brand=='Typar')||(strtolower($brand)==strtolower('Typar'))) return 'Дренажные материалы';
    if(($brand=='Геопульс')||(strtolower($brand)==strtolower('Геопульс'))) return 'Дренажные материалы';
    if(($brand=='FaSiding')||(strtolower($brand)==strtolower('FaSiding'))) return 'Фасады';
    if(($brand=='VOX MAX-3') ||(strtolower($brand)==strtolower('VOX MAX-3'))) return 'Фасады';
    if(($brand=='VOX Solid')||(strtolower($brand)==strtolower('VOX Solid'))) return 'Фасады';

    return '';

}


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


function find_attr_name($id,&$masiv)
{
    $atrname='';
    for($n=0;$n<count($masiv->Классификатор->Свойства->Свойство);$n++)
    {
        if("'".$masiv->Классификатор->Свойства->Свойство[$n]->Ид."'"=="'".$id."'")
        {
            $atrname=$masiv->Классификатор->Свойства->Свойство[$n]->Наименование;
        }
    }
    return $atrname;
}
echo $arr->Каталог->Товары->Товар[0]->ЗначенияСвойств->ЗначенияСвойства[0]->Ид;
echo  find_attr_name((string)$arr->Каталог->Товары->Товар[0]->ЗначенияСвойств->ЗначенияСвойства[0]->Ид,$arr)."<br>";
//print_r(is_main(217,$catsubs));