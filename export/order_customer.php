<?php
require 'msql.inc.php';


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

$out='';
$out.='<?xml version="1.0" encoding="UTF-8"?>';
$orders=mysql_query("SELECT * FROM oc_order");
$out.=PHP_EOL.'<orders>'.PHP_EOL;
while ($row=mysql_fetch_assoc($orders))
{

    $out.='<order>'.PHP_EOL;
    $out.='<orderid>'.$row['order_id'].'</orderid>'.PHP_EOL;
    $out.='<firstname>'.$row['firstname'].'</firstname>'.PHP_EOL;
    $out.='<lastname>'.$row['lastname'].'</lastname>'.PHP_EOL;
    $out.='<telephone>'.$row['telephone'].'</telephone>'.PHP_EOL;
    $out.='<email>'.$row['email'].'</email>'.PHP_EOL;
    $out.='<order_status_id>'.$row['order_status_id'].'</order_status_id>'.PHP_EOL;


    //payment

    $out.='<paymentfirstname>'.$row['payment_firstname'].'</paymentfirstname>'.PHP_EOL;
    $out.='<paymentlastname>'.$row['payment_lastname'].'</paymentlastname>'.PHP_EOL;
    $out.='<paymentcompany>'.$row['payment_company'].'</paymentcompany>'.PHP_EOL;
    $out.='<paymentaddress1>'.$row['payment_address_1'].'</paymentaddress1>'.PHP_EOL;
    $out.='<paymentaddress2>'.$row['payment_address_2'].'</paymentaddress2>'.PHP_EOL;
    $out.='<paymentcity>'.$row['payment_city'].'</paymentcity>'.PHP_EOL;
    $out.='<paymentpostcode>'.$row['payment_postcode'].'</paymentpostcode>'.PHP_EOL;
    $out.='<paymentcountry>'.$row['payment_country'].'</paymentcountry>'.PHP_EOL;
    $out.='<paymentzone>'.$row['payment_zone'].'</paymentzone>'.PHP_EOL;
    $out.='<paymentmethod>'.$row['payment_method'].'</paymentmethod>'.PHP_EOL;
    $out.='<paymentcode>'.$row['payment_code'].'</paymentcode>'.PHP_EOL;
    $out.='<currencycode>'.$row['currency_code'].'</currencycode>'.PHP_EOL;
    $out.='<currencyvalue>'.$row['currency_value'].'</currencyvalue>'.PHP_EOL;

    //shipping
    $out.='<shippingfirstname>'.$row['shipping_firstname'].'</shippingfirstname>'.PHP_EOL;
    $out.='<shippinglastname>'.$row['shipping_lastname'].'</shippinglastname>'.PHP_EOL;
    $out.='<shippingcompany>'.$row['shipping_company'].'</shippingcompany>'.PHP_EOL;
    $out.='<shippingaddress1>'.$row['shipping_address_1'].'</shippingaddress1>'.PHP_EOL;
    $out.='<shippingaddress2>'.$row['shipping_address_2'].'</shippingaddress2>'.PHP_EOL;
    $out.='<shippingcity>'.$row['shipping_city'].'</shippingcity>'.PHP_EOL;
    $out.='<shippingpostcode>'.$row['shipping_postcode'].'</shippingpostcode>'.PHP_EOL;
    $out.='<shippingcountry>'.$row['shipping_country'].'</shippingcountry>'.PHP_EOL;
    $out.='<shippingzone>'.$row['shipping_zone'].'</shippingzone>'.PHP_EOL;
    $out.='<shippingmethod>'.$row['shipping_method'].'</shippingmethod>'.PHP_EOL;


    //products
    $tovars=mysql_query("SELECT * FROM oc_order_product WHERE order_id=".$row['order_id']);
    while ($tv=mysql_fetch_assoc($tovars))
    {
        $id=$tv['product_id'];
        $oc_product=mysql_query("SELECT * FROM oc_product WHERE product_id=".$id);
        $oc_attribute=mysql_query("SELECT * FROM oc_attribute");
        while ($product=mysql_fetch_assoc($oc_product))
        {


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
            $sku = $product['sku'];
            $model = $product['model'];
            $quantity = $product['quantity'];
            $price = $product['price'];
            $currency = $product['base_currency_code'];
            $date = $product['date_added'];
            $weight = $product['weight'];
            $length = $product['length'];
            $width = $product['width'];
            $height = $product['height'];
            $imgpath = $product['image'];
            $min_quantity = $product['minimum'];
            $length_class_id = $product['length_class_id'];

            $oc_product_description = mysql_query("SELECT * FROM oc_product_description WHERE product_id=" . $id);
            $opd = mysql_fetch_assoc($oc_product_description);
            //oc_product_description
            $name = $opd['name'];
            $desc = $opd['description'];
            $meta_title = $opd['meta_title'];
            $meta_description = $opd['meta_description'];
            $meta_keyword = $opd['meta_keyword'];

            $oc_product_attribute = mysql_query("SELECT * FROM oc_product_attribute WHERE product_id= " . $id . " ORDER BY attribute_id ASC");


            $out.= '<products>'.PHP_EOL;

            $out.= '<product>'.PHP_EOL;
            $out.= '<main>'.PHP_EOL;

            $out.= '<category>'.$category.'</category>'.PHP_EOL;
            $out.= '<categoryid>'.$categoryid.'</categoryid>'.PHP_EOL;
            $out.= '<subcategories>'.PHP_EOL;
            for($j=0; $j< count($subcategories);$j++){
                $out.='<subcategory>'.$subcategories[$j][name].'</subcategory>'.PHP_EOL;
                $out.='<subcategoryid>'.$subcategories[$j][id].'</subcategoryid>'.PHP_EOL;
            }
            $out.= '</subcategories>'.PHP_EOL;
            $out.= '<articul>'.$sku.'</articul>'.PHP_EOL;
            $out.= '<description>'.$desc.'</description>'.PHP_EOL;
            $out.= '<name>'.$name.'</name>'.PHP_EOL;
            $out.= '<image>'.$imgpath.'</image>'.PHP_EOL;
            $out.= '<metatitle>'.$name.'</metatitle>'.PHP_EOL;
            $out.=   '<metadescription></metadescription>'.PHP_EOL;
            $out.='<metakeyword></metakeyword>'.PHP_EOL;
            $out.='<meta-tags></meta-tags>'.PHP_EOL;
            $out.= '</main>'.PHP_EOL;
            $out.='<data>'.PHP_EOL;
            $out.= '<model>'.$model.'</model>'.PHP_EOL;
            $out.= '<price>'.$price.'</price>'.PHP_EOL;
            $out.= '<start-price>'.$price.'</start-price>'.PHP_EOL;
            $out.= '<currency>'.$currency.'</currency>'.PHP_EOL;
            $out.= '<quantity>'.$currency.'</quantity>'.PHP_EOL;
            $out.= '<minquantity>'.$min_quantity.'</minquantity>'.PHP_EOL;
            $out.= '<date>'.$date.'</date>'.PHP_EOL;
            $out.= '<heigth>'.$height.'</heigth>'.PHP_EOL;
            $out.= '<width>'.$width.'</width>'.PHP_EOL;
            $out.= '<length>'.$length.'</length>';
            $out.= '<length-class>'.$length_class_id.'</length-class>'.PHP_EOL;
            $out.= '<weight>'.$weight.'</weight>'.PHP_EOL;
            $out.= '<weight-class>kg</weight-class>'.PHP_EOL;
            $out.= '<sort-order>1</sort-order>'.PHP_EOL;

            $out.='</data>'.PHP_EOL;
            $out.='<links>'.PHP_EOL;
            $out.= '<manufacturer>'.trim($country).'</manufacturer>'.PHP_EOL;
            $out.='</links>'.PHP_EOL;
            $out.='<attributes>'.PHP_EOL;
            while($attr=mysql_fetch_assoc($oc_product_attribute))
            {
                $out.='<attribute>'.PHP_EOL;
                $attrvalue=$attr['text'];
                $attrres=mysql_query("SELECT * FROM oc_attribute_description WHERE attribute_id= ".$attr['attribute_id']." ORDER BY attribute_id ASC");
                $attrname1=mysql_fetch_assoc($attrres);
                $attrname=$attrname1['name'];

                $out.= '<attrname>'.$attrname.'</attrname>'.PHP_EOL;
                $out.= '<attrvalue>'.$attrvalue.'</attrvalue>'.PHP_EOL;
                $out.='</attribute>'.PHP_EOL;
            }

            $out.='</attributes>'.PHP_EOL;
            $out.= '</product>'.PHP_EOL;

            $out.= '</products>'.PHP_EOL;
        }
    }

    //end products
    $out.='</order>'.PHP_EOL;
}
$out.='</orders>'.PHP_EOL;
$file="orderout.xml";
file_put_contents($file,$out);