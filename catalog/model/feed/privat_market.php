<?php
class ModelFeedPrivatMarket extends Model {

    /** Метод выборки товаров из бд для импорта в ПриватМаркет
     *
     * @return array [0] => Категории товаров, [1] => Товары с характеристиками
     *
     */
    public function getBudivaProducts(){
        $products = $this->db->query("SELECT p.product_id, p.status, p.model, p.image, p.price, p2c.category_id, cd.name AS category_name,
         GROUP_CONCAT(DISTINCT ad.name SEPARATOR '; ') AS attributes, GROUP_CONCAT(DISTINCT pa.text SEPARATOR '; ') AS attributes_values,  pd.description  FROM ". DB_PREFIX ."product AS p
         LEFT JOIN ". DB_PREFIX ."product_description AS pd ON pd.product_id = p.product_id 
         LEFT JOIN ". DB_PREFIX ."product_to_category AS p2c ON p.product_id = p2c.product_id
         LEFT JOIN ". DB_PREFIX ."category_description AS cd ON p2c.category_id = cd.category_id
         LEFT JOIN ". DB_PREFIX ."product_attribute AS pa ON p.product_id = pa.product_id
         LEFT JOIN ". DB_PREFIX ."attribute_description AS ad ON pa.attribute_id = ad.attribute_id 
         where status = '1' AND (manufacturer_id='74'
         OR manufacturer_id='69'
         OR manufacturer_id='66'
         OR manufacturer_id='53'
         OR manufacturer_id='54'
         OR manufacturer_id='71'
         OR manufacturer_id='63'
         OR manufacturer_id='58'
         OR manufacturer_id='51'
         OR manufacturer_id='65'
         OR manufacturer_id='64'
         OR manufacturer_id='40'
         OR manufacturer_id='48'
         OR manufacturer_id='89') GROUP BY p.product_id");

        $categories_pre = [];
        foreach ($products->rows as $product){
            $categories_pre[] = $product['category_name'];
        }

        $categories_pre = array_unique($categories_pre);
        $categories = [];
        foreach ($categories_pre as $category){
            $categories[] = $category;
        }
//        echo "<pre>"; print_r($categories); echo "</pre>";die;
        return array('categories' => $categories, 'products' => $products->rows);
    }

    public function rozetka_stairs_category(){
        $prod_arr = $this->db->query("SELECT product_id FROM " . DB_PREFIX ."product_to_category WHERE category_id = '226'");
        $arResult = [];
        foreach($prod_arr->rows as $row){
            $arResult[] = $row['product_id'];
        }

        return $arResult;
    }
}

// LEFT JOIN ". DB_PREFIX ."attribute_description AS ad ON pa.attribute_id = ad.attribute_id / pa.product_id  ad.name, pd.description