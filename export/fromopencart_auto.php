<?php
//TODO rewrite if needed(or adapt for opencart module)
require '/home/budsit00/budsite.com.ua/www/export/msql.inc.php';



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



$product=mysql_query("SELECT * FROM oc_product WHERE product_id>150")or die(mysql_error());
//$product=mysql_query("SELECT * FROM product")or die(mysql_error());
$attribute=mysql_query("SELECT * FROM oc_attribute")or die(mysql_error());



//$attribute_description=mysql_query("SELECT * FROM attribute_description")or die(mysql_error());
//$product_attribute_description=mysql_query("SELECT * FROM attribute_description")or die(mysql_error());

$out='';
$out.='<?xml version="1.0" encoding="UTF-8"?>';
$out.= '<products>';

while($row = mysql_fetch_assoc($product)) {
    //product

    $id=$row['product_id'];
    $category='';
    $categoryid=0;
    $subcategories=array();

    $prtocat=mysql_query("SELECT * FROM oc_product_to_category WHERE product_id=".$id);

    while($cat=mysql_fetch_assoc($prtocat))
    {
        if(is_main($cat['category_id'],$catsubs))
        {
            $categoryid=$cat['category_id'];
            $category=cat_name_by_id($categoryid,$catsubs);
        }
        else
        {
            $subcategories[]=array('id'=>$cat['category_id'],'name'=>cat_name_by_id($cat['category_id'],$catsubs));
        }
    }
   // $subcategoryid=0;

    //TODO category and subcategory for product (SELECT FROM DB)
    $sku = $row['sku'];
    $model = $row['model'];
    $quantity = $row['quantity'];
    $price = $row['price'];
    $currency =$row['base_currency_code'];
    $date = $row['date_added']; //
    $weight = $row['weight'];
    $length = $row['length'];
    $width = $row['width'];
    $height = $row['height'];
    $imgpath=$row['image'];
    $min_quantity = $row['minimum'];
    $length_class_id = $row['length_class_id'];

    $product_description=mysql_query("SELECT * FROM oc_product_description WHERE product_id=".$id)or die(mysql_error());
    $opd=mysql_fetch_assoc($product_description);
    //product_description
    $name=$opd['name'];
    $desc=$opd['description'];
    $meta_title=$opd['meta_title'];
    $meta_description=$opd['meta_description'];
    $meta_keyword=$opd['meta_keyword'];

    $product_attribute=mysql_query("SELECT * FROM oc_product_attribute WHERE product_id= ".$id." ORDER BY attribute_id ASC") or die(mysql_error());


 /*
    while($attr=mysql_fetch_assoc($product_attribute))
    {
        $attvalue=$attr['text'];
        $attrres=mysql_query("SELECT * FROM attribute_description WHERE attribute_id= ".$attr['attribute_id']." ORDER BY attribute_id DESC");
        $attrname1=mysql_fetch_assoc($attrres);
        $attrname=$attrname1['name'];
    }
*/
/*
    $color= mysql_fetch_assoc($product_attribute)['text'];
    $weight2= mysql_fetch_assoc($product_attribute)['text'];
    $brand=mysql_fetch_assoc($product_attribute)['text'];
    $country=mysql_fetch_assoc($product_attribute)['text'];
    $garanthy=mysql_fetch_assoc($product_attribute)['text'];
*/




  //  {
        //  echo $arr->Каталог->Товары->Товар[$i]->Ид;
        // $out.= $i.'<br>';

        $out.= '<product>';
        $out.= '<main>';

    $out.= '<category>'.$category.'</category>';
    $out.= '<categoryid>'.$categoryid.'</categoryid>';
    $out.= '<subcategories>';
    for($j=0; $j< count($subcategories);$j++){
        $out.='<subcategory>'.$subcategories[$j][name].'</subcategory>';
        $out.='<subcategoryid>'.$subcategories[$j][id].'</subcategoryid>';
    }
    $out.= '</subcategories>';
        $out.= '<articul>'.$sku.'</articul>';
        $out.= '<description>'.$desc.'</description>';
        $out.= '<name>'.$name.'</name>';
        $out.= '<image>'.$imgpath.'</image>';
        $out.= '<metatitle>'.$name.'</metatitle>';
        $out.=   '<metadescription></metadescription>';
        $out.='<metakeyword></metakeyword>';
        $out.='<meta-tags></meta-tags>';
        $out.= '</main>';
        $out.='<data>';
        $out.= '<model>'.$model.'</model>';
        $out.= '<price>'.$price.'</price>';
        $out.= '<start-price>'.$price.'</start-price>';
        $out.= '<currency>'.$currency.'</currency>';
        $out.= '<quantity>'.$currency.'</quantity>';
        $out.= '<minquantity>'.$min_quantity.'</minquantity>';
        $out.= '<date>'.$date.'</date>';
        $out.= '<heigth>'.$height.'</heigth>';
        $out.= '<width>'.$width.'</width>';
        $out.= '<length>'.$length.'</length>';
        $out.= '<length-class>'.$length_class_id.'</length-class>';
        $out.= '<weight>'.$weight.'</weight>';
        $out.= '<weight-class>kg</weight-class>';
        $out.= '<sort-order>1</sort-order>';

        $out.='</data>';
        $out.='<links>';
        $out.= '<manufacturer>'.trim($country).'</manufacturer>';
        $out.='</links>';
        $out.='<attributes>';
    while($attr=mysql_fetch_assoc($product_attribute))
    {
        $out.='<attribute>';
        $attrvalue=$attr['text'];
        $attrres=mysql_query("SELECT * FROM oc_attribute_description WHERE attribute_id= ".$attr['attribute_id']." ORDER BY attribute_id ASC");
        $attrname1=mysql_fetch_assoc($attrres);
        $attrname=$attrname1['name'];

        $out.= '<attrname>'.$attrname.'</attrname>';
        $out.= '<attrvalue>'.$attrvalue.'</attrvalue>';
        $out.='</attribute>';
    }
    /*
        $out.= '<weight>'.$weight2.'</weight>';
        $out.= '<square></square>';
        $out.= '<color>'.$color.'</color>';
        $out.= '<type></type>';
        $out.= '<shape></shape>';
        $out.= '<brand>'.$brand.'</brand>';
        $out.= '<manufacturer>'.trim($country).'</manufacturer>';
        $out.= '<color-description>1</color-description>';
        $out.= '<garanthy>'.$garanthy.'</garanthy>';
    */
        $out.='</attributes>';
        $out.= '</product>';

        //$out.= '======================'.'<br>';


   // }


}
$out.= '</products>';
$file='/home/budsit00/budsite.com.ua/www/export/openc_exp.xml';
file_put_contents($file, $out);
$out='<?php'.PHP_EOL.'$xmlnew = <<<XML'.PHP_EOL.$out.PHP_EOL.'XML;'.PHP_EOL.'?>';
/*
$file='opncar_xml2.php';
file_put_contents($file, $out);
*/
mysql_close($link);
