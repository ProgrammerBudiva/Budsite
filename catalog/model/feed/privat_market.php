<?php
class ModelFeedPrivatMarket extends Model {

    /** Метод выборки товаров из бд для импорта в ПриватМаркет
     *
     * @return array [0] => Категории товаров, [1] => Товары с характеристиками
     *
     */
    //GROUP_CONCAT(DISTINCT ad.name SEPARATOR '; ') AS attributes, GROUP_CONCAT(DISTINCT pa.text SEPARATOR '; ') AS attributes_values,
    //OR p.manufacturer_id='48'
    //OR p.manufacturer_id='69' - CARBON
    // OR p.manufacturer_id='64' - Техноплекс
    //OR p.manufacturer_id='58' - Planter
    public function getBudivaProducts(){
        $products = $this->db->query("SELECT p.product_id, p.manufacturer_id, man.name as vendor, p.status, p.model, p.image, p.price, p2c.category_id, cd.name AS category_name,
         pd.name, pd.description  FROM ". DB_PREFIX ."product AS p
         LEFT JOIN ". DB_PREFIX ."manufacturer AS man ON man.manufacturer_id = p.manufacturer_id
         LEFT JOIN ". DB_PREFIX ."product_description AS pd ON pd.product_id = p.product_id 
         LEFT JOIN ". DB_PREFIX ."product_to_category AS p2c ON p.product_id = p2c.product_id
         LEFT JOIN ". DB_PREFIX ."category_description AS cd ON p2c.category_id = cd.category_id
         LEFT JOIN ". DB_PREFIX ."product_attribute AS pa ON p.product_id = pa.product_id
         LEFT JOIN ". DB_PREFIX ."attribute_description AS ad ON pa.attribute_id = ad.attribute_id
         where status = '1' AND (p.manufacturer_id='74'
         OR p.manufacturer_id='66'
         OR p.manufacturer_id='53'
         OR p.manufacturer_id='54'
         OR p.manufacturer_id='71'
         OR p.manufacturer_id='63'
         OR (p.manufacturer_id='51' AND p2c.category_id!='197' AND p2c.category_id!='235' AND p2c.category_id!='237'
         AND p2c.category_id!='314' AND p2c.category_id!='315' AND p2c.category_id!='306' AND p2c.category_id!='307'
         AND p2c.category_id!='305' AND p2c.category_id!='554' AND p2c.category_id!='308' AND p2c.category_id!='311'
         AND p2c.category_id!='302' AND p2c.category_id!='313' AND p2c.category_id!='312' AND p2c.category_id!='304'
         AND p2c.category_id!='303' AND p2c.category_id!='556' AND p2c.category_id!='427' AND p2c.category_id!='308'
         AND p2c.category_id!='309' AND p2c.category_id!='555' AND p2c.category_id!='557')
         OR p.manufacturer_id='65'
         OR (p.manufacturer_id='40' AND p2c.category_id!='196' AND p2c.category_id!='214' AND p2c.category_id!='322'
         AND p2c.category_id!='321' AND p2c.category_id!='320' AND p2c.category_id!='319' AND p2c.category_id!='318'
         AND p2c.category_id!='316' AND p2c.category_id!='317' AND p2c.category_id!='323' AND p2c.category_id!='241'
         AND p2c.category_id!='269' AND p2c.category_id!='211' AND p2c.category_id!='432' AND p2c.category_id!='430'
         AND p2c.category_id!='429' AND p2c.category_id!='430' AND p2c.category_id!='428' AND p2c.category_id!='431'
         AND p2c.category_id!='481' AND p2c.category_id!='482' AND p2c.category_id!='485' AND p2c.category_id!='492')
         ) GROUP BY p.product_id");

        $categories_pre = [];
        foreach ($products->rows as $product){
            $categories_pre[] = $product['category_name'];
        }

        $categories_pre = array_unique($categories_pre);
        $categories = [];
        foreach ($categories_pre as $category){
            $categories[] = $category;
        }
//        echo "<pre>"; print_r($products->rows); echo "</pre>";die;
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

    public function getAdditionalImages($id){
        $images = $this->db->query("SELECT * FROM " . DB_PREFIX ."product_image where product_id='" . $id ."'");
        return $images->rows;
    }
}

// LEFT JOIN ". DB_PREFIX ."attribute_description AS ad ON pa.attribute_id = ad.attribute_id / pa.product_id  ad.name, pd.description