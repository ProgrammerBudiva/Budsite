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
$out.=PHP_EOL.'<Классификатор>'.PHP_EOL;
$out.=PHP_EOL.'<Группы>'.PHP_EOL;

/*
$prtocat2=mysql_query("SELECT * FROM oc_product_to_category");

while($cat=mysql_fetch_assoc($prtocat2))
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
};
*/
$maincat=array();
echo count($catsubs);
for($catcount=0;$catcount<count($catsubs);$catcount++)
{

    if($catsubs[$catcount][parent]==0)
    {
        if(($catsubs[$catcount][id]!=0) && ($catsubs[$catcount][name]!=''))
     $maincat[]=array(mid=>$catsubs[$catcount][id],mname=>$catsubs[$catcount][name]);

    }
};

for($groupcount=0;$groupcount<count($maincat);$groupcount++)
{
$out.='<Группа>'.PHP_EOL;
$out.='<Ид>'.$maincat[$groupcount][mid].'</Ид>'.PHP_EOL;
$out.='<Наименование>'.$maincat[$groupcount][mname].'</Наименование>'.PHP_EOL;

$out.='<Группы>'.PHP_EOL;
    for($catcount2=0;$catcount2<count($catsubs);$catcount2++) {
      if($catsubs[$catcount2][parent]==$maincat[$groupcount][mid])
      {
          $out.='<Группа>'.PHP_EOL;
          $out.='<Ид>'.$catsubs[$catcount2][id].'</Ид>'.PHP_EOL;
          $out.='<Наименование>'.$catsubs[$catcount2][name].'</Наименование>'.PHP_EOL;
          $out.='</Группа>'.PHP_EOL;
      }
    }
$out.='</Группы>'.PHP_EOL;
$out.='</Группа>'.PHP_EOL;
}


				/*
				<Группы>
					<Группа>
						<Ид>e06bfd9b-0224-11e6-80cb-00155dca1902</Ид>
						<Наименование>Битумная черепица SHINGLAS</Наименование>
					</Группа>
					<Группа>
						<Ид>e06bfd9f-0224-11e6-80cb-00155dca1902</Ид>
						<Наименование>Битумная черепица TILERCAT</Наименование>
					</Группа>
					<Группа>
						<Ид>e06bfda4-0224-11e6-80cb-00155dca1902</Ид>
						<Наименование>Комплектация для битумной черепицы</Наименование>
					</Группа>
				*/
$out.='</Группы>'.PHP_EOL;

$out.='</Классификатор>'.PHP_EOL;
//$out2='';
/*
$out2.='<?xml version="1.0" encoding="UTF-8"?>';
$out2.=PHP_EOL.'<Предложения>'.PHP_EOL;
*/
//$out2.='<Предложения>';


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
    $out.='<fax>'.$row['fax'].'</fax>'.PHP_EOL;
    $out.='<order_status_id>'.$row['order_status_id'].'</order_status_id>'.PHP_EOL;
    $out.='<ip>'.$row['ip'].'</ip>'.PHP_EOL;

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
    $out.='<total>'.$row['total'].'</total>'.PHP_EOL;
    $out.='<comment>'.$row['comment'].'</comment>'.PHP_EOL;
    $out.='<marketing_id>'.$row['marketing_id'].'</marketing_id>'.PHP_EOL;
    $out.='<tracking>'.$row['tracking'].'</tracking>'.PHP_EOL;
    $out.='<commision>'.$row['commision'].'</commision>'.PHP_EOL;

    //products
    $out.= '<Товары>'.PHP_EOL;

    $tovars=mysql_query("SELECT * FROM oc_order_product WHERE order_id=".$row['order_id']);
    while ($tv=mysql_fetch_assoc($tovars))
    {

        $id=$tv['product_id'];
        $total=$tv['total'];
        $productquantity=$tv['quantity'];
        $tax=$tv['tax'];
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




            $out.= '<Товар>'.PHP_EOL;


            $out.= '<category>'.$category.'</category>'.PHP_EOL;
            $out.= '<categoryid>'.$categoryid.'</categoryid>'.PHP_EOL;
            $out.= '<subcategories>'.PHP_EOL;
            for($j=0; $j< count($subcategories);$j++){
                $out.='<subcategory>'.$subcategories[$j][name].'</subcategory>'.PHP_EOL;
                $out.='<subcategoryid>'.$subcategories[$j][id].'</subcategoryid>'.PHP_EOL;
            }
            $out.= '</subcategories>'.PHP_EOL;
            $out.= '<articul>'.$sku.'</articul>'.PHP_EOL;
            $out.= '<productquantity>'.$productquantity.'</productquantity>'.PHP_EOL;
            $out.= '<producttotal>'.$total.'</producttotal>'.PHP_EOL;
            $out.= '<tax>'.$tax.'</tax>'.PHP_EOL;
            $out.= '<Наименование>'.$name.'</Наименование>'.PHP_EOL;
            $out.= '<Описание>'.$desc.'</Описание>'.PHP_EOL;

            $out.= '<Картинка>'.$imgpath.'</Картинка>'.PHP_EOL;



            $out.='<Предложение>'.PHP_EOL;

            $out.='<Цены>'.PHP_EOL;
            $out.='<Цена>'.PHP_EOL;
            $out.='<ЦенаЗаЕдиницу>'.$price.'</ЦенаЗаЕдиницу>'.PHP_EOL;
            $out.='<Валюта>'.$currency.'</Валюта>'.PHP_EOL;

            $out.='</Цена>'.PHP_EOL;
            $out.='</Цены>'.PHP_EOL;
            $out.='<Количество>'.$quantity.'</Количество>'.PHP_EOL;
            $out.='</Предложение>'.PHP_EOL;
/*
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
*/
            $out.='<links>'.PHP_EOL;
            $out.= '<manufacturer>'.trim($country).'</manufacturer>'.PHP_EOL;
            $out.='</links>'.PHP_EOL;
            $out.='<ЗначенияСвойств>'.PHP_EOL;
            while($attr=mysql_fetch_assoc($oc_product_attribute))
            {
                $out.='<ЗначенияСвойства>'.PHP_EOL;
                $attrvalue=$attr['text'];
                $attrres=mysql_query("SELECT * FROM oc_attribute_description WHERE attribute_id= ".$attr['attribute_id']." ORDER BY attribute_id ASC");
                $attrname1=mysql_fetch_assoc($attrres);
                $attrname=$attrname1['name'];

                $out.= '<Ид>'.$attrname.'</Ид>'.PHP_EOL;
                $out.= '<Значение>'.$attrvalue.'</Значение>'.PHP_EOL;
                $out.='</ЗначенияСвойства>'.PHP_EOL;
            }

            $out.='</ЗначенияСвойств>'.PHP_EOL;
            $out.= '</Товар>'.PHP_EOL;


        }

    }

    $out.= '</Товары>'.PHP_EOL;
    //end products
    $out.='</order>'.PHP_EOL;
}
//$out.='</Предложения>';
$out.='</orders>'.PHP_EOL;


$out.= '<clients>'.PHP_EOL;
$customers=mysql_query("SELECT * FROM oc_customer");
while ($custrow=mysql_fetch_assoc($customers))
{
    $custadr=mysql_query("SELECT * FROM oc_address WHERE address_id=".$custrow['address_id']);
    $custadr2=mysql_fetch_assoc($custadr);

    $out.='<address>'.PHP_EOL;
    $out.='<company>'.$custadr2['company'].'</company>'.PHP_EOL;
    $out.='<address1>'.$custadr2['address1'].'</address1>'.PHP_EOL;
    $out.='<address2>'.$custadr2['address2'].'</address2>'.PHP_EOL;
    $out.='<city>'.$custadr2['city'].'</city>'.PHP_EOL;
    $out.='<postcode>'.$custadr2['postcode'].'</postcode>'.PHP_EOL;
    $out.='<country>'.$custadr2['country_id'].'</country>'.PHP_EOL;
    $out.='<zone>'.$custadr2['zone_id'].'</zone>'.PHP_EOL;
    $out.='</address>'.PHP_EOL;

   $out.='<store_id>'.$custrow['store_id'].'</store_id>'.PHP_EOL;
   $out.='<firstname>'.$custrow['firstname'].'</firstname>'.PHP_EOL;
   $out.='<lastname>'.$custrow['lastname'].'</lastname>'.PHP_EOL;
   $out.='<email>'.$custrow['email'].'</email>'.PHP_EOL;
   $out.='<telephone>'.$custrow['telephone'].'</telephone>'.PHP_EOL;
   $out.='<fax>'.$custrow['fax'].'</fax>'.PHP_EOL;
   $out.='<cart>'.$custrow['cart'].'</cart>'.PHP_EOL;
   $out.='<wishlist>'.$custrow['wishlist'].'</wishlist>'.PHP_EOL;
   $out.='<newsletter>'.$custrow['newsletter'].'</newsletter>'.PHP_EOL;
   $out.='<ip>'.$custrow['ip'].'</ip>'.PHP_EOL;
}
$out.= '</clients>'.PHP_EOL;
$file="orderout.xml";
file_put_contents($file,$out);

$file="orderout_offers.xml";
file_put_contents($file,$out2);
