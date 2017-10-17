<?php

class ControllerFeedRozetka extends Controller
{
    public function index(){
        $this->load->model('feed/privat_market');
        $array = $this->model_feed_privat_market->getBudivaProducts();
        $this->createXML($array);

    }

    public function createXML($array){
        $dom = new DOMDocument("1.0", "utf-8");
        $dom->preserveWhiteSpace = false;
        $dom->formatOutput = true;

        $date = date('Y-m-d H:i');
        $root = $dom->createElement('yml_catalog');
        $root->setAttribute('date', $date);

        $shop = $dom->createElement('shop');
        $shop->appendChild($dom->createElement('name','ТОВ "БУДІВА"'));
        $shop->appendChild($dom->createElement('company','ТОВ "БУДІВА"'));
        $shop->appendChild($dom->createElement('url',"budsite.ua"));

        $currencies = $dom->createElement('currencies');
        $currency = $dom->createElement('currency');
        $currency->setAttribute('id', 'UAH');
        $currency->setAttribute('rate', 1);


        $currencies->appendChild($currency);
        $shop->appendChild($currencies);

        $categories = $dom->createElement('categories');
        $i=1;
        foreach ($array['categories'] as $category_self) {

            $category = $dom->createElement('category');
            $category->nodeValue = $category_self;
            $category->setAttribute('id', $i);
            $i++;

            $categories->appendChild($category);
        }

        $shop->appendChild($categories);

        $offers = $dom->createElement('offers');

        foreach ($array['products'] as $product_self){
//            echo "<pre>"; print_r($product_self); echo "</pre>";die;
            $offer = $dom->createElement('offer');
            $offer->setAttribute('available', 'true');
            $offer->setAttribute('id', $product_self['product_id']);

            $url_product = $dom->createElement('url');
            $url_product->nodeValue = $this->url->link('product/product', 'product_id=' . $product_self['product_id']);
            $offer->appendChild($url_product);

            $price = $dom->createElement('price');
            $price->nodeValue = $product_self['price'];
            $offer->appendChild($price);

            $currency_id = $dom->createElement('currencyId');
            $currency_id->nodeValue = 'UAH';
            $offer->appendChild($currency_id);

            $category_product = $dom->createElement('categoryId');
            $key = array_search($product_self['name'], $array['categories']);
            $category_product->nodeValue = $key+1;
            $offer->appendChild($category_product);

            $picture = $dom->createElement('picture');
            $picture->nodeValue = 'https://budsite.ua/image/' . $product_self['image'];
            $offer->appendChild($picture);

            $name = $dom->createElement('name');
            $name->nodeValue = $product_self['model'];
            $offer->appendChild($name);

            $attributes = explode('; ', $product_self['attributes']);
            $attributes_values = explode('; ', $product_self['attributes_values']);
            $count_attributes = count($attributes_values);

            for ($i=0; $i<$count_attributes; $i++){

                $r='![,]!';
                if (preg_match($r, $attributes[$i])){
                    $attributes_explode = explode( ', ' , $attributes[$i]);
//                    echo "<pre>"; print_r($attributes_explode); echo "</pre>";die;
                    $param_xml = $dom->createElement('param');
                    $param_xml->setAttribute('name', $attributes_explode[0]);
                    $param_xml->setAttribute('unit', $attributes_explode[1]);
                }else{
                    $param_xml = $dom->createElement('param');
                    $param_xml->setAttribute('name', $attributes[$i]);

                }


                $param_xml->nodeValue = $attributes_values[$i];
                $offer->appendChild($param_xml);
            }
//            echo "<pre>"; print_r($attributes); echo "</pre>";
//            echo "<pre>"; print_r($attributes_values); echo "</pre>";die;

            $description = $dom->createElement('description');
            $description->nodeValue = '<![CDATA[' . $product_self['description'] . ']]>';
            $offer->appendChild($description);


            $delivery = $dom->createElement('delivery');
            $delivery->nodeValue = 'true';
            $offer->appendChild($delivery);

            $offers->appendChild($offer);
        }

        $shop->appendChild($offers);

        $root->appendChild($shop);
        $dom->appendChild($root);

        header('Content-type: text/xml');
        header('Pragma: public');
        header('Cache-control: private');
        header('Expires: -1');
        echo $dom->saveXML();
    }
}