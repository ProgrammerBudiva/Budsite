<?php

require 'msql.inc.php';
//include '/home/andriyyy/projects/Budsite/export/opncar_xml.php';
//openc_imp.xml
//INSERT INTO `oc_attribute_group_description` (`attribute_group_id`,`language_id`,`name`) VALUES(13,2,'Сетки')




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

$xmlnew = file_get_contents('openc_imp.xml');
$arr3 = new SimpleXMLElement($xmlnew);
//$i=0;

for($i=0;$i<count($arr3->product);$i++){
//echo $arr3->product[$i]->data->min-quantity;


//oc_product
//$category='\''.mysql_real_escape_string($arr3->product[$i]->main->category).'\'';
$category=$arr3->product[$i]->main->category;
$categoryid=$arr3->product[$i]->main->categoryid;
$subcategories=array();
$subcategoriesid=array();
    for($j=0;$j<count($arr3->product->main->subcategories);$j++) {
        $subcategories[]=array('name'=>$arr3->product->main->subcategories->subcategory[$j],id=>$arr3->product->main->subcategories->subcategoryid[$j]);
       // $subcategoriesid[]=$arr3->product->main->subcategories->subcategoryid;
    }

$tovarid='\''.mysql_real_escape_string($arr3->product[$i]->main->tovarid).'\'';
$sku='\''.mysql_real_escape_string($arr3->product[$i]->main->articul).'\'';
$model='\''.mysql_real_escape_string($arr3->product[$i]->data->model).'\'';
$quantity=(int)$arr3->product[$i]->data->quantity;
$price=(float)$arr3->product[$i]->data->price;
$currency='\''.mysql_real_escape_string($arr3->product[$i]->data->currency).'\'';
$date='\''.mysql_real_escape_string($arr3->product[$i]->data->date).'\'';
$weight='\''.mysql_real_escape_string($arr3->product[$i]->data->weight).'\'';
$length='\''.mysql_real_escape_string($arr3->product[$i]->data->length).'\'';
$width='\''.mysql_real_escape_string($arr3->product[$i]->data->width).'\'';
$heigth='\''.mysql_real_escape_string($arr3->product[$i]->data->heigth).'\'';
$min_quantity='\''.mysql_real_escape_string($arr3->product[$i]->data->minquantity).'\'';

//$heigth='\''.mysql_real_escape_string($arr3->product[$i]->data->heigth).'\'';


//oc_product_description
$name='\''.mysql_real_escape_string($arr3->product[$i]->main->name).'\'';
$desc='\''.mysql_real_escape_string($arr3->product[$i]->main->description).'\'';
$meta_title='\''.mysql_real_escape_string($arr3->product[$i]->main->metatitle).'\'';
$meta_description='\''.mysql_real_escape_string($arr3->product[$i]->main->metadescription).'\'';
$meta_keyword='\''.mysql_real_escape_string($arr3->product[$i]->main->metakeyword).'\'';


$descwo=$arr3->product[$i]->main->description;
$meta_titlewo=$arr3->product[$i]->main->name;
$meta_descriptionwo=$arr3->product[$i]->main->metadescription;
$meta_keywordwo=$arr3->product[$i]->main->metakeyword;
    /*
$brand='\''.mysql_real_escape_string($arr3->product[$i]->attributes->brand).'\'';
$country='\''.mysql_real_escape_string($arr3->product[$i]->attributes->manufacturer).'\'';
$color='\''.mysql_real_escape_string($arr3->product[$i]->attributes->color).'\'';
$weight2='\''.mysql_real_escape_string($arr3->product[$i]->attributes->weight).'\'';
$garanthy='\''.mysql_real_escape_string($arr3->product[$i]->attributes->garanthy).'\'';
*/
$meta_title=$name;

//$model_u=$model;
$model= str_replace('"','',$model);
$model= str_replace('"','',$model);

$name=str_replace('"','',$name);
$name=str_replace('"','',$name);
$meta_title=str_replace('"','',$meta_title);
$meta_title=str_replace('"','',$meta_title);

$mc="SELECT * FROM oc_product WHERE model=".$model;
$pd="SELECT * FROM oc_product_description WHERE name=".$name;
$tvid="SELECT * FROM oc_product WHERE tovarid=".$tovarid;
$tvidq=mysql_query($tvid);
$tvidcount=mysql_num_rows($tvidq);
    //"' OR description='".$arr3->product[$i]->main->description."'";
 $mod=mysql_query($mc);
 $modcnt=mysql_num_rows($mod);
 $prodesc=mysql_query($pd) ;
 $prodesccnt=mysql_num_rows($prodesc);

    $imgname=$arr3->product[$i]->main->image;
    $imgpath='cache/catalog/'.$imgname;


if($tvidcount<=0) { //товар не існує
    $q = "INSERT INTO oc_product (product_id,model,sku,upc,ean,jan,isbn,mpn,location,quantity,stock_status_id,image,manufacturer_id,shipping,price,cost,extra_charge,base_price,base_currency_code,price_currency_id,points,tax_class_id,date_available,weight,weight_class_id,length,width,height,length_class_id,subtract,minimum,sort_order,youtube_code,status,viewed,date_added,date_modified,tovarid)
 VALUES ('', $model, $sku, '', '', '', '', '', '',$quantity,'','" . $imgpath . "',0,1,$price,$price,0,$price,$currency,1,0,0,$date,$weight,1,$length,$width,$heigth,1,0,$min_quantity,1,'',1,0,$date,$date,$tovarid  )";

    mysql_query($q) or die(mysql_error());

    $pid = mysql_insert_id();

    $q2 = "INSERT INTO `oc_product_description` (`product_id`,`language_id`,`name`,`description`,`meta_title`,`meta_description`,`meta_keyword`)
VALUES($pid,2,$name,$desc,$meta_title,$meta_description,$meta_keyword)";
    mysql_query($q2) or die(mysql_error());

//categories

    if (!empty($categoryid)) {

        $ptc = "INSERT INTO oc_product_to_category (product_id,category_id) VALUES($pid,$categoryid)";
        $ptc2 = mysql_query($ptc) or die(mysql_error());
    }
    if (empty($categoryid) || ($categoryid == 0)) {
//

        if ($category = '') {
            $catbrand = '';
            for ($m = 0; $m < count($arr3->product[$i]->attributes->attribute); $m++) {
                if ($arr3->product[$i]->attributes->attribute[$m]->attrname == 'Бренд') {
                    $catbrand = $arr3->product[$i]->attributes->attribute[$m]->attrvalue;
                }
            }
            $category = cat_name_by_brand($catbrand);

            $categoryid = cat_id_by_name($category, $catsubs);
            $ptc = "INSERT INTO oc_product_to_category (product_id,category_id) VALUES($pid,$categoryid)";
            $ptc2 = mysql_query($ptc) or die(mysql_error());
        }

        if (!empty($category)) {

            $categoryid = cat_id_by_name($category);
            $ptc = "INSERT INTO oc_product_to_category (product_id,category_id) VALUES($pid,$categoryid)";
            $ptc2 = mysql_query($ptc) or die(mysql_error());
        }
    }

    if (!empty($pid)) {

        if ($arr3->product[$i]->data->quantity > 0) {
            $pts = "INSERT INTO oc_product_to_store (product_id,store_id) VALUES($pid,'0')";
            $pts2 = mysql_query($pts) or die(mysql_error());
        }

    }

    //subcategories
    //  echo $arr3->product[$i]->main->subcategories->subcategoryid[0]."<br>";
    /*
  if(!empty($arr3->product[$i]->main->subcategories)){
    for($d=0;$d<count($arr3->product[$i]->main->subcategories);$d++) {

        $subid=$subcategories[$d][id];
        echo $subid.'<br>';
        echo $pid.'<br>';
        if($subid!=0){
    */
    $ptd = "INSERT INTO oc_product_to_category (product_id,category_id) VALUES(" . $pid . "," . $arr3->product[$i]->main->subcategories->subcategoryid[0] . ")";
    mysql_query($ptd) or die(mysql_error());

    /*
        echo 'done';
        }

    }
  ;}
    */
    /*
      else{

          $subcategoryid=0;
          $subcatbrand='';
          for( $m=0;$m<count($arr3->product[$i]->attributes->attribute);$m++ )
          {
              if($arr3->product[$i]->attributes->attribute[$m]->attrname=='Бренд')
              {
                  $subcatbrand=$arr3->product[$i]->attributes->attribute[$m]->attrvalue;
              }
          }
          $subcategory=subcat_name_by_brand($subcatbrand);
          $subcategoryid=cat_id_by_name($subcategory,$catsubs);
          echo $subcategory."<br>";
          echo $subcategoryid;
          $ptd2="INSERT INTO oc_product_to_category (product_id,category_id) VALUES(".$pid.",".$subcategoryid.")";
          mysql_query($ptd2) or die(mysql_error());
      }
  */

//for($p=0;$p<count($subcategories))
//atributes


    for ($q = 0; $q < count($arr3->product[$i]->attributes->attribute); $q++) {

        $attrlist = mysql_query("SELECT * FROM oc_attribute_description");
        $attrid = 0;
        while ($attrlistrow = mysql_fetch_assoc($attrlist)) {
            if ($arr3->product[$i]->attributes->attribute[$q]->attrname == $attrlistrow['name']) {
                $attrid = $attrlistrow['attribute_id'];
            }
        }
        if (!empty($attrid) && ($attrid != 0)) {
            $q3 = "INSERT INTO `oc_product_attribute` (`product_id`,`attribute_id`,`language_id`,`text`) VALUES($pid,$attrid,2," . "'" . $arr3->product[$i]->attributes->attribute[$q]->attrvalue . "'" . ")";
            mysql_query($q3) or die(mysql_error());
        }
        if (empty($attrid)) {
            $q25 = "INSERT INTO `oc_attribute` (`attribute_id`,`attribute_group_id`,`sort_order`) VALUES ('',13,0)";
            mysql_query($q25) or die(mysql_error());
            $aid = mysql_insert_id();

            $q27 = "INSERT INTO `oc_attribute_description` (`attribute_id`,`language_id`,`name`) VALUES ($aid,2," . "'" . $arr3->product[$i]->attributes->attribute[$q]->attrname . "'" . ")";
            mysql_query($q27) or die(mysql_error());

            $q3 = "INSERT INTO `oc_product_attribute` (`product_id`,`attribute_id`,`language_id`,`text`) VALUES($pid,$aid,2," . "'" . $arr3->product[$i]->attributes->attribute[$q]->attrvalue . "'" . ")";
            mysql_query($q3) or die(mysql_error());
        }
        /*
            $q25="INSERT INTO `oc_attribute` (`attribute_id`,`attribute_group_id`,`sort_order`) VALUES ('',13,0)";
            mysql_query($q25) or die(mysql_error());
            $aid=mysql_insert_id();

            $q27="INSERT INTO `oc_attribute_description` (`attribute_id`,`language_id`,`name`) VALUES ($aid,2,"."'".$arr3->product[$i]->attributes->attribute[$q]->attrname."'".")";
            mysql_query($q27) or die(mysql_error());

            $q3="INSERT INTO `oc_product_attribute` (`product_id`,`attribute_id`,`language_id`,`text`) VALUES($pid,$aid,2,"."'".$arr3->product[$i]->attributes->attribute[$q]->attrvalue."'".")";
            mysql_query($q3) or die(mysql_error());
        */
    }
    if (!empty($pid)){
    $imgtst1 = mysql_query("SELECT product_image_id FROM oc_product_image WHERE product_id=" . $pid . " AND image='" . "cache/catalog/" . $arr3->product[$i]->main->image1 . "'");
    $imgtst2 = mysql_query("SELECT product_image_id FROM oc_product_image WHERE product_id=" . $pid . " AND image='" . "cache/catalog/" . $arr3->product[$i]->main->image2 . "'");
    $imgtst3 = mysql_query("SELECT product_image_id FROM oc_product_image WHERE product_id=" . $pid . " AND image='" . "cache/catalog/" . $arr3->product[$i]->main->image3 . "'");
    $imgtst4 = mysql_query("SELECT product_image_id FROM oc_product_image WHERE product_id=" . $pid . " AND image='" . "cache/catalog/" . $arr3->product[$i]->main->image4 . "'");
    $imgtst5 = mysql_query("SELECT product_image_id FROM oc_product_image WHERE product_id=" . $pid . " AND image='" . "cache/catalog/" . $arr3->product[$i]->main->image5 . "'");
    $imgtst6 = mysql_query("SELECT product_image_id FROM oc_product_image WHERE product_id=" . $pid . " AND image='" . "cache/catalog/" . $arr3->product[$i]->main->image6 . "'");
    $imgtst7 = mysql_query("SELECT product_image_id FROM oc_product_image WHERE product_id=" . $pid . " AND image='" . "cache/catalog/" . $arr3->product[$i]->main->image7 . "'");
    $imgtst8 = mysql_query("SELECT product_image_id FROM oc_product_image WHERE product_id=" . $pid . " AND image='" . "cache/catalog/" . $arr3->product[$i]->main->image8 . "'");

    $imgtester1 = mysql_fetch_assoc($imgtst1);
    $imgtester2 = mysql_fetch_assoc($imgtst2);
    $imgtester3 = mysql_fetch_assoc($imgtst3);
    $imgtester4 = mysql_fetch_assoc($imgtst4);
    $imgtester5 = mysql_fetch_assoc($imgtst5);
    $imgtester6 = mysql_fetch_assoc($imgtst6);
    $imgtester7 = mysql_fetch_assoc($imgtst7);
    $imgtester8 = mysql_fetch_assoc($imgtst8);

    $imgid1 = $imgtester1['product_image_id'];
    $imgid2 = $imgtester2['product_image_id'];
    $imgid3 = $imgtester3['product_image_id'];
    $imgid4 = $imgtester4['product_image_id'];
    $imgid5 = $imgtester5['product_image_id'];
    $imgid6 = $imgtester6['product_image_id'];
    $imgid7 = $imgtester7['product_image_id'];
    $imgid8 = $imgtester8['product_image_id'];
    //echo $prdid."|"."cache/catalog/".$arr3->product[$i]->main->image1."<br>";
    //echo $imgid1."<br>";

    if ($arr3->product[$i]->main->image1 != '') {
        if (empty($imgid1)) {
            mysql_query("INSERT INTO oc_product_image(product_image_id, product_id, image, sort_order, image_type) VALUES (''," . $pid . ",'" . "cache/catalog/" . $arr3->product[$i]->main->image1 . "'" . ",0,'main'" . ")") or die(mysql_error());
        }

    }

    if ($arr3->product[$i]->main->image2 != '') {
        if (empty($imgid2)) {
            mysql_query("INSERT INTO oc_product_image(product_image_id, product_id, image, sort_order, image_type) VALUES (''," . $pid . ",'" . "cache/catalog/" . $arr3->product[$i]->main->image2 . "'" . ",0,'main'" . ")") or die(mysql_error());
        }

    }

    if ($arr3->product[$i]->main->image3 != '') {
        if (empty($imgid3)) {
            mysql_query("INSERT INTO oc_product_image(product_image_id, product_id, image, sort_order, image_type) VALUES (''," . $pid . ",'" . "cache/catalog/" . $arr3->product[$i]->main->image3 . "'" . ",0,'main'" . ")") or die(mysql_error());
        }

    }

    if ($arr3->product[$i]->main->image4 != '') {
        if (empty($imgid4)) {
            mysql_query("INSERT INTO oc_product_image(product_image_id, product_id, image, sort_order, image_type) VALUES (''," . $pid . ",'" . "cache/catalog/" . $arr3->product[$i]->main->image4 . "'" . ",0,'main'" . ")") or die(mysql_error());
        }

    }

    if ($arr3->product[$i]->main->image5 != '') {
        if (empty($imgid5)) {
            mysql_query("INSERT INTO oc_product_image(product_image_id, product_id, image, sort_order, image_type) VALUES (''," . $pid . ",'" . "cache/catalog/" . $arr3->product[$i]->main->image5 . "'" . ",0,'main'" . ")") or die(mysql_error());
        }

    }

    if ($arr3->product[$i]->main->image6 != '') {
        if (empty($imgid6)) {
            mysql_query("INSERT INTO oc_product_image(product_image_id, product_id, image, sort_order, image_type) VALUES (''," . $pid . ",'" . "cache/catalog/" . $arr3->product[$i]->main->image6 . "'" . ",0,'main'" . ")") or die(mysql_error());
        }

    }

    if ($arr3->product[$i]->main->image7 != '') {
        if (empty($imgid7)) {
            mysql_query("INSERT INTO oc_product_image(product_image_id, product_id, image, sort_order, image_type) VALUES (''," . $pid . ",'" . "cache/catalog/" . $arr3->product[$i]->main->image7 . "'" . ",0,'main'" . ")") or die(mysql_error());
        }

    }

    if ($arr3->product[$i]->main->image8 != '') {
        if (empty($imgid8)) {
            mysql_query("INSERT INTO oc_product_image(product_image_id, product_id, image, sort_order, image_type) VALUES (''," . $pid . ",'" . "cache/catalog/" . $arr3->product[$i]->main->image8 . "'" . ",0,'main'" . ")") or die(mysql_error());
        }

    }
 }

}

 else{//товар існує

  $sort_order=1;

 /* $model_u=$arr3->product[$i]->data->model;
  $model_u= str_replace('"','',$model_u);
  $model_u= str_replace('"','',$model_u);
 */
     $tovarid_u= mysql_real_escape_string($arr3->product[$i]->main->tovarid);
  //(product_id,model,sku,upc,ean,jan,isbn,mpn,location,quantity,stock_status_id,image,manufacturer_id,shipping,price,cost,extra_charge,base_price,base_currency_code,price_currency_id,points,tax_class_id,date_available,weight,weight_class_id,length,width,height,length_class_id,subtract,minimum,sort_order,youtube_code,status,viewed,date_added,date_modified)
  //$u1="UPDATE oc_product SET base_price=".$price.", price=".$price.", base_currency_code='".$arr3->product[$i]->data->currency."'"." , quantity=".$quantity." WHERE model = '".$model_u."'";
     $sku_upd=$arr3->product[$i]->main->articul;
     //if(empty($arr3->product[$i]->main->articul)) $sku_upd=0;

     $tovar_update=mysql_query("SELECT price,base_currency_code,quantity,sku,image,model FROM oc_product WHERE tovarid = '".$tovarid_u."'");
     $tovar_update_a=mysql_fetch_assoc($tovar_update);
     $price_a=$tovar_update_a['price'];
     $currency_a=$tovar_update_a['base_currency_code'];
     $quantity_a=$tovar_update_a['quantity'];
     $sku_a=$tovar_update_a['sku'];
     $image_a=$tovar_update_a['image'];

     $model_a=$tovar_update_a['model'];

     $model_a= str_replace('"','',$model_a);
     $model_a= str_replace('"','',$model_a);
/*
if(($price_a!=(float)$arr3->product[$i]->data->price) || ($currency_a!=$currency_a) ||($quantity_a!=(int)$arr3->product[$i]->data->quantity ) || ($sku_a!=$arr3->product[$i]->main->articul) ||($image_a!=$imgpath))
{

    if(($arr3->product[$i]->main->image!='')&&($price!=0)&&($arr3->product[$i]->data->currency!='')&&($arr3->product[$i]->main->articul!='')) {
        $u1 = "UPDATE oc_product SET base_price=" . $price . ", price=" . $price . ", base_currency_code='" . $arr3->product[$i]->data->currency . "'" . " , quantity=" . $quantity . " , sku='" . $sku_upd . "' , image='" . $imgpath . "'" . " WHERE tovarid = '" . $tovarid_u . "'";
        //echo $u1."<br>";

        // ", price=".$price." , cost=".$cost.", base_price=".$arr3->product[$i]->data->price.", base_currency_code='".$arr3->product[$i]->data->currency."', weight=".$arr3->product[$i]->data->weight.", length=".$arr3->product[$i]->data->length.", width=".$arr3->product[$i]->data->width.", height=".$arr3->product[$i]->data->heigth.", minimum=0, sort_order=".$sort_order.", date_modified=".$arr3->product[$i]->data->date." WHERE model = '".$model_u."'";

        //   ", quantity=".$quantity.", price=".$price.", cost=".$price.", base_price=".$arr3->product[$i]->data->price.
        mysql_query($u1) or die(mysql_error());
    }
}
*/
echo $price_a."==price".$price."data->price".$arr3->product[$i]->data->price;

     if(($model_a!=$arr3->product[$i]->data->model)&&($arr3->product[$i]->data->model!='')){
         $model_upd1 = "UPDATE oc_product SET model='" . mysql_real_escape_string($arr3->product[$i]->data->model) . "'"  . " WHERE tovarid = '" . $tovarid_u . "'";
         mysql_query($model_upd1) or die(mysql_error());
     }



     if(($price_a!=(float)$arr3->product[$i]->data->price)&&($price!=0)) {
         $price_upd1 = "UPDATE oc_product SET base_price=" . $price . ", price=" . $price. " WHERE tovarid = '" . $tovarid_u . "'";
         mysql_query($price_upd1) or die(mysql_error());
     }


     if(($currency_a!=$arr3->product[$i]->data->currency)&&($arr3->product[$i]->data->currency!='')){
         $currency_upd1 = "UPDATE oc_product SET base_currency_code='" . $arr3->product[$i]->data->currency . "'"  . " WHERE tovarid = '" . $tovarid_u . "'";
         mysql_query($currency_upd1) or die(mysql_error());
     }

     if(($arr3->product[$i]->main->articul!='')&&($sku_a!=$arr3->product[$i]->main->articul)){
         $sku_upd1 = "UPDATE oc_product SET  sku='" . $sku_upd . "' WHERE tovarid = '" . $tovarid_u . "'";
         mysql_query($sku_upd1) or die(mysql_error());
     }

     if(($quantity_a!=(int)$arr3->product[$i]->data->quantity )&&(!empty($quantity))){
         $quantity_upd1 = "UPDATE oc_product SET  quantity=" . $quantity .  " WHERE tovarid = '" . $tovarid_u . "'";
         mysql_query($quantity_upd1) or die(mysql_error());
     }

     if(($image_a!=$imgpath)&&($arr3->product[$i]->main->image!='')){
         $image_upd1 = "UPDATE oc_product SET image='" . $imgpath . "'" . " WHERE tovarid = '" . $tovarid_u . "'";
         mysql_query($image_upd1) or die(mysql_error());
     }
         $u2="SELECT product_id FROM oc_product  WHERE tovarid = '".$tovarid_u."'";
         $u3=mysql_query($u2);
         $resu2=mysql_fetch_assoc($u3);
         $prdid=$resu2['product_id'];
         $meta_title=$name;
         if(!empty($prdid)) {
             $desc_upd=mysql_query("SELECT description FROM oc_product_description WHERE product_id=".$prdid);
             $desc_upd1=mysql_fetch_assoc($desc_upd);
             $desc_upd2=$desc_upd1['description'];
             if($desc_upd2!=$arr3->product[$i]->main->description){
                 if($arr3->product[$i]->main->description!=''){
             $pdquery = "UPDATE oc_product_description SET description='" . mysql_real_escape_string($arr3->product[$i]->main->description) . "', meta_title=" . $meta_title . ", meta_description=" . $meta_description . ", meta_keyword=" . $meta_keyword . " WHERE product_id=" . $prdid;

             mysql_query($pdquery) or die(mysql_error());
                 }
             }

             $name_upd=mysql_query("SELECT name FROM oc_product_description WHERE product_id=".$prdid);
             $name_upd1=mysql_fetch_assoc($name_upd);
             $name_upd2=$name_upd1['name'];
             if($name_upd!=$arr3->product[$i]->main->name){
                 if($arr3->product[$i]->main->name!=''){
                     $namequery = "UPDATE oc_product_description SET name='" . mysql_real_escape_string($arr3->product[$i]->main->name) . "'". " WHERE product_id=" . $prdid;

                     mysql_query($namequery) or die(mysql_error());
                 }
             }

             if($arr3->product[$i]->data->odyniciavymiry!=''){
             $edinica=mysql_query("SELECT attribute_id FROM oc_attribute_description WHERE name='Единица измерения'");
             $edinica2=mysql_fetch_assoc($edinica);
             $edinica3=$edinica2['attribute_id'];
             $edinicaupd=mysql_query("UPDATE oc_product_attribute SET text='". mysql_real_escape_string($arr3->product[$i]->data->odyniciavymiry)."'"."WHERE product_id=".$prdid."AND attribute_id=".$edinica3);
             }
/*
             $imgtst1=-1;
             $imgtst2=-1;
             $imgtst3=-1;
             $imgtst4=-1;
             $imgtst5=-1;
             $imgtst6=-1;
             $imgtst7=-1;
             $imgtst8=-1;
*/
             $imgtst1=mysql_query("SELECT product_image_id FROM oc_product_image WHERE product_id=".$prdid." AND image='"."cache/catalog/".$arr3->product[$i]->main->image1."'");
             $imgtst2=mysql_query("SELECT product_image_id FROM oc_product_image WHERE product_id=".$prdid." AND image='"."cache/catalog/".$arr3->product[$i]->main->image2."'");
             $imgtst3=mysql_query("SELECT product_image_id FROM oc_product_image WHERE product_id=".$prdid." AND image='"."cache/catalog/".$arr3->product[$i]->main->image3."'");
             $imgtst4=mysql_query("SELECT product_image_id FROM oc_product_image WHERE product_id=".$prdid." AND image='"."cache/catalog/".$arr3->product[$i]->main->image4."'");
             $imgtst5=mysql_query("SELECT product_image_id FROM oc_product_image WHERE product_id=".$prdid." AND image='"."cache/catalog/".$arr3->product[$i]->main->image5."'");
             $imgtst6=mysql_query("SELECT product_image_id FROM oc_product_image WHERE product_id=".$prdid." AND image='"."cache/catalog/".$arr3->product[$i]->main->image6."'");
             $imgtst7=mysql_query("SELECT product_image_id FROM oc_product_image WHERE product_id=".$prdid." AND image='"."cache/catalog/".$arr3->product[$i]->main->image7."'");
             $imgtst8=mysql_query("SELECT product_image_id FROM oc_product_image WHERE product_id=".$prdid." AND image='"."cache/catalog/".$arr3->product[$i]->main->image8."'");
             
             $imgtester1=mysql_fetch_assoc($imgtst1);
             $imgtester2=mysql_fetch_assoc($imgtst2);
             $imgtester3=mysql_fetch_assoc($imgtst3);
             $imgtester4=mysql_fetch_assoc($imgtst4);
             $imgtester5=mysql_fetch_assoc($imgtst5);
             $imgtester6=mysql_fetch_assoc($imgtst6);
             $imgtester7=mysql_fetch_assoc($imgtst7);
             $imgtester8=mysql_fetch_assoc($imgtst8);
             
             $imgid1=$imgtester1['product_image_id'];
             $imgid2=$imgtester2['product_image_id'];
             $imgid3=$imgtester3['product_image_id'];
             $imgid4=$imgtester4['product_image_id'];
             $imgid5=$imgtester5['product_image_id'];
             $imgid6=$imgtester6['product_image_id'];
             $imgid7=$imgtester7['product_image_id'];
             $imgid8=$imgtester8['product_image_id'];
             //echo $prdid."|"."cache/catalog/".$arr3->product[$i]->main->image1."<br>";
             //echo $imgid1."<br>";

             if($arr3->product[$i]->main->image1!='')
               {
                  if(empty($imgid1)) {
                         mysql_query("INSERT INTO oc_product_image(product_image_id, product_id, image, sort_order, image_type) VALUES (''," . $prdid . ",'" . "cache/catalog/" . $arr3->product[$i]->main->image1 . "'" . ",0,'main'" . ")") or die(mysql_error());
               }

             }

             if($arr3->product[$i]->main->image2!='')
             {
                 if(empty($imgid2)) {
                     mysql_query("INSERT INTO oc_product_image(product_image_id, product_id, image, sort_order, image_type) VALUES (''," . $prdid . ",'" . "cache/catalog/" . $arr3->product[$i]->main->image2 . "'" . ",0,'main'" . ")") or die(mysql_error());
                 }

             }

             if($arr3->product[$i]->main->image3!='')
             {
                 if(empty($imgid3)) {
                     mysql_query("INSERT INTO oc_product_image(product_image_id, product_id, image, sort_order, image_type) VALUES (''," . $prdid . ",'" . "cache/catalog/" . $arr3->product[$i]->main->image3 . "'" . ",0,'main'" . ")") or die(mysql_error());
                 }

             }

             if($arr3->product[$i]->main->image4!='')
             {
                 if(empty($imgid4)) {
                     mysql_query("INSERT INTO oc_product_image(product_image_id, product_id, image, sort_order, image_type) VALUES (''," . $prdid . ",'" . "cache/catalog/" . $arr3->product[$i]->main->image4 . "'" . ",0,'main'" . ")") or die(mysql_error());
                 }

             }

             if($arr3->product[$i]->main->image5!='')
             {
                 if(empty($imgid5)) {
                     mysql_query("INSERT INTO oc_product_image(product_image_id, product_id, image, sort_order, image_type) VALUES (''," . $prdid . ",'" . "cache/catalog/" . $arr3->product[$i]->main->image5 . "'" . ",0,'main'" . ")") or die(mysql_error());
                 }

             }

             if($arr3->product[$i]->main->image6!='')
             {
                 if(empty($imgid6)) {
                     mysql_query("INSERT INTO oc_product_image(product_image_id, product_id, image, sort_order, image_type) VALUES (''," . $prdid . ",'" . "cache/catalog/" . $arr3->product[$i]->main->image6 . "'" . ",0,'main'" . ")") or die(mysql_error());
                 }

             }

             if($arr3->product[$i]->main->image7!='')
             {
                 if(empty($imgid7)) {
                     mysql_query("INSERT INTO oc_product_image(product_image_id, product_id, image, sort_order, image_type) VALUES (''," . $prdid . ",'" . "cache/catalog/" . $arr3->product[$i]->main->image7 . "'" . ",0,'main'" . ")") or die(mysql_error());
                 }

             }

             if($arr3->product[$i]->main->image8!='')
             {
                 if(empty($imgid8)) {
                     mysql_query("INSERT INTO oc_product_image(product_image_id, product_id, image, sort_order, image_type) VALUES (''," . $prdid . ",'" . "cache/catalog/" . $arr3->product[$i]->main->image8 . "'" . ",0,'main'" . ")") or die(mysql_error());
                 }

             }



             for( $attrq=0;$attrq<count($arr3->product[$i]->attributes->attribute);$attrq++ )
             {
                 $attrflag=-1;
                 $spisattr=mysql_query("SELECT * FROM oc_product_attribute WHERE product_id=".$prdid);
                 while($attrow=mysql_fetch_assoc($spisattr))
                 {
                     $selattr1=$attrow['attribute_id'];

                     if(!empty($selattr1))
                     {
                         $attrname=mysql_query("SELECT * FROM oc_attribute_description WHERE attribute_id=".$selattr1);
                         $attrname1=mysql_fetch_assoc($attrname);
                         $attrname2=$attrname1['name'];
                         $attrid=$attrname1['attribute_id'];
                         if($attrname2==$arr3->product[$i]->attributes->attribute[$attrq]->attrname)
                         {
                             $attrflag=1;
                             //echo $arr3->product[$i]->attributes->attribute[$attrq]->attrname."<br>";
                             $testtext=mysql_query("SELECT text FROM oc_product_attribute WHERE attribute_id=".$selattr1." AND product_id=".$prdid );
                             if($testtext!=$arr3->product[$i]->attributes->attribute[$attrq]->attrvalue)
                             {
                                 if($arr3->product[$i]->attributes->attribute[$attrq]->attrvalue!='')
                                 {
                             $updtext="UPDATE oc_product_attribute SET text='".mysql_real_escape_string($arr3->product[$i]->attributes->attribute[$attrq]->attrvalue)."'"." WHERE attribute_id=".$selattr1." AND product_id=".$prdid;
                                    // echo $updtext;
                                     mysql_query($updtext) or die(mysql_error());
                                 }
                             }
                         }

                     }

                 }
/*
                 if($attrflag!=1)
                 {
                     $q25="INSERT INTO `oc_attribute` (`attribute_id`,`attribute_group_id`,`sort_order`) VALUES ('',13,0)";
                     mysql_query($q25) or die(mysql_error());
                     $aid=mysql_insert_id();

                     $q27="INSERT INTO `oc_attribute_description` (`attribute_id`,`language_id`,`name`) VALUES ($aid,2,"."'".mysql_real_escape_string($arr3->product[$i]->attributes->attribute[$attrq]->attrname)."'".")";
                     mysql_query($q27) or die(mysql_error());

                     $q3="INSERT INTO `oc_product_attribute` (`product_id`,`attribute_id`,`language_id`,`text`) VALUES($pid,$aid,2,"."'".mysql_real_escape_string($arr3->product[$i]->attributes->attribute[$attrq]->attrvalue)."'".")";
                     mysql_query($q3) or die(mysql_error());
                 }
                 */
             }






         }//prdid


 }



}
mysql_close($link);