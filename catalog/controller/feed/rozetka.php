<?php

class ControllerFeedRozetka extends Controller
{
    public function index(){
        $this->load->model('feed/privat_market');
        $array = $this->model_feed_privat_market->getBudivaProducts();
        $cat_226 = $this->model_feed_privat_market->rozetka_stairs_category();
        $this->createXML($array, $cat_226);

    }

    public function createXML($array, $cat_226){
        //ARS шторы убираем из списка товаров по id
        $ars = [ 3573, 3574, 3575, 3576, 3577];

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

        $category = $dom->createElement('category');
        $category->nodeValue = 'Кровельные материалы';
        $category->setAttribute('id', 1);
        $categories->appendChild($category);

        $category1 = $dom->createElement('category');
        $category1->nodeValue = 'Лестницы, стремянки, подмости';
        $category1->setAttribute('id', 2);
        $categories->appendChild($category1);

        $category = $dom->createElement('category');
        $category->nodeValue = 'Окна';
        $category->setAttribute('id', 3);
        $categories->appendChild($category);

        $category = $dom->createElement('category');
        $category->nodeValue = 'Мастики и праймеры';
        $category->setAttribute('id', 4);
        $categories->appendChild($category);

        $shop->appendChild($categories);
        $offers = $dom->createElement('offers');
        foreach ($array['products'] as $product_self){
            if (array_search($product_self['product_id'], $ars) !== false){
                continue;
            }
            $offer = $dom->createElement('offer');
            $offer->setAttribute('available', 'true');
            $offer->setAttribute('id', $product_self['product_id']);

            $url_product = $dom->createElement('url');
            $url_product->nodeValue = $this->url->link('product/product', 'product_id=' . $product_self['product_id']);
            $offer->appendChild($url_product);

            $price = $dom->createElement('price');
            $price->nodeValue = round((($this->cart->priceForRoll($product_self['product_id'],$product_self['price'])) * 1.15),1,PHP_ROUND_HALF_UP);
            $offer->appendChild($price);

            $currency_id = $dom->createElement('currencyId');
            $currency_id->nodeValue = 'UAH';
            $offer->appendChild($currency_id);

            $category_product = $dom->createElement('categoryId');

            if(strpos($product_self['name'], 'Мансардное окно') !== false || strpos($product_self['name'], 'Окно-люк') !== false
                || strpos($product_self['name'], 'Выход на крышу') !== false || strpos($product_self['name'], 'Гидроизоляционный оклад') !== false){
                $category_product->nodeValue = 3;
            }elseif (strpos($product_self['name'], 'Мастика') !== false ){
                $category_product->nodeValue = 4;
            }elseif(array_search($product_self['product_id'], $cat_226) != false){
                $category_product->nodeValue = 2;
            }else {
                $category_product->nodeValue = 1;
            }

            $offer->appendChild($category_product);

            $picture = $dom->createElement('picture');
            $picture->nodeValue = 'https://budsite.ua/image/' . $product_self['image'];
            $offer->appendChild($picture);

            $images = $this->model_feed_privat_market->getAdditionalImages($product_self['product_id']);
            foreach ($images as $image){
                $picture = $dom->createElement('picture');
                $picture->nodeValue = 'https://budsite.ua/image/' . $image['image'];
                $offer->appendChild($picture);
            }

            $vendor = $dom->createElement('vendor');
            $vendor->nodeValue = $product_self['vendor'];
            $offer->appendChild($vendor);

            $name = $dom->createElement('name');
            $name->nodeValue = $product_self['name'];
            $offer->appendChild($name);

            $attr_test = [];
            $attribute_groups = $this->model_catalog_product->getProductAttributes($product_self['product_id']);
            foreach ($attribute_groups[0]['attribute'] as $attr){
                $attr_test[$attr['attribute_id']] = ['text' => $attr['text'], 'name' => $attr['name']];
            }

            if ($attr_test[1]['text'] == 'кв.м'){
                if ($attr_test[8]){
                    $attr_test[1]['text'] = 'рулон';
                }else{
                    $attr_test[1]['text'] = 'упаковка';
                }
            }

            if(strpos($product_self['name'], 'Гидроизоляционный оклад') !== false && $attr_test[27]['text']){
                $attr_test[27]['text'];
                $size_explode = explode('x',$attr_test[27]['text']);
                $attr_test[] = [
                    'text' => $size_explode[0] * 10,
                    'name' => 'Ширина, мм'
                    ];
                $attr_test[] = [
                    'text' => $size_explode[1] * 10,
                    'name' => 'Высота, мм'
                ];
                unset($attr_test[27]);
            }

            foreach ($attr_test as $value){
                $r='![,]!';
                if (preg_match($r, $value['name'])){

                    $attributes_explode = explode( ', ' , $value['name']);

                    $param_xml = $dom->createElement('param');
                    $param_xml->setAttribute('name', $attributes_explode[0]);
                    $param_xml->setAttribute('unit', $attributes_explode[1]);
                }else{
                    $param_xml = $dom->createElement('param');
                    $param_xml->setAttribute('name', $value['name']);

                }


                $param_xml->nodeValue = $value['text'];
                $offer->appendChild($param_xml);
            }

            $description = $dom->createElement('description');
            $text = preg_replace('#<a.*>.*</a>#USi', '', $product_self['description']);
            $text = preg_replace('/<iframe.*?\/iframe>/i','', $text);
            $text = str_replace('Чтобы купить необходимое количество , заполните онлайн-заявку', '', $text);
            $text = str_replace('<li>Есть возможность приобрести доп. секцию для увеличения высоты лестницы;</li>', '', $text);
            $text = str_replace('<p>В нашем интернет-магазине Вы также найдете шторки, маркизеты, ролеты к мансанрдным окнам любых размеров и видов.</p>', '', $text);
            $text = str_replace('<p>В нашем магазине Вы найдете шторы ARS следующих цветов: белый, серый, светло-серый, бежевый, лимонный, оранжевый.</p>', '', $text);
            $text = str_replace('Если необходимо увеличить высоту лестницы, всегда есть возможность купить ступеньки LSS (при покупке учесть шиирну люка либо ширину ступеньки).', '', $text);
            $text = str_replace('Чтобы купить необходимое количество финской , заполните онлайн-заявку. Также не забывайте следить за выгодными предложениями и новостями проекта.', '', $text);

            $description->nodeValue = '<![CDATA[ ' . $text . ' ]]>';
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