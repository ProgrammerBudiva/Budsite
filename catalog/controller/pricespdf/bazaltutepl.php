<?php
require_once($_SERVER['DOCUMENT_ROOT'] . '/system/library/dompdf-master/autoload.inc.php');
/**
 * Created by PhpStorm.
 * User: andrey
 * Date: 10.07.17
 * Time: 14:36
 */
class ControllerPricespdfBazaltutepl extends Controller
{
    public function index()
    {
        $data = ['filter_category_id' => 269 ];
        $results = $this->model_catalog_product->getProducts($data);

        $html = '
        <html>
        <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <style>
          body { font-family: DejaVu Sans, sans-serif ;
                font-size: 8pt;
                }
           @page { margin: 100px 25px; }
            header { position: fixed; top: -60px; left: 0px; right: 0px; height: 50px; }
            footer { position: fixed; bottom: -60px; left: 0px; right: 0px;  height: 50px; }
        
            p { page-break-after: always; 
            }
            .main{
                position: relative;
                top:232px;
                width: 766px;
            }
            .main1 {
                position: relative;
        
                width: 766px;
            }
            p:last-child { page-break-after: never; }
            table {
                table-layout: fixed; /* Фиксированная ширина ячеек */
                width: 766px; /* Ширина таблицы */
                margin-bottom: 0px !important;
            }
            table td { word-wrap: break-word;
              }
        </style>
        </head>
        
         <body>
          <header>
         <img width="766" src="system/library/PDF/examples/images/header2.png" alt="">
         <div class="main1">
            <table class="table  table-bordered">
                <tr class="active">
                    <td width="9%">Артикул</td>
                    <td width="11%">Фото</td>
                    <td>Название</td>
                    <td width="10%">Площадь в упаковке, м<sup>2</sup></td>
                    <td width="8%">Плотность, кг/м3</td>
                    <td width="8%">Толщина, мм</td>
                    <td width="7%">Ед. изм.</td>
                    <td width="11%">Цена</td>
                </tr>
        </table></div>
        </header><div class="main">
            <table class="table  table-bordered">
        ';
        foreach ($results as $productId => $product){
            $attr_valid;
            $attrs = $this->model_catalog_product->getProductAttributes($productId);
            foreach ($attrs[0]['attribute'] as $attr) {

                $attr_valid[$attr['attribute_id']] = $attr['text'];
            }

            $query = $this->db->query("SELECT keyword FROM " . DB_PREFIX . "url_alias WHERE query = 'product_id=". $productId."'");

            $test .= '
            <tr class="">
                <td width="9%">' . $product['sku'] . '</td>
                <td width="13%"><img style="max-width: 100%; height: auto; text-align: center;" align="center"  src="image/' . $product['image'] . '"></td>
                <td> <a href="https://budsite.ua/'. $query->row['keyword'] .'">'. $product['name'] . '</td>


                <td width="10%">' . $attr_valid[18] . '</td>
                <td width="8%">' . $attr_valid[17] . '</td>
                <td width="8%">' . $attr_valid[9] . '</td>
                <td width="7%">' . $attr_valid[1] . '</td>
                <td width="11%">'. number_format($product['price'], 2, '.', '') .'</td>

            </tr>
      
            ';
            unset($attr_valid);
        }
        $html .= $test;
        $dompdf = new \Dompdf\Dompdf();
        $dompdf->loadHtml($html, 'UTF-8');
        $dompdf->render();

//        $dompdf->stream("dompdf_out.pdf", array("Attachment" => false));
        file_put_contents('gen_prices/bazaltutepl.pdf', $dompdf->output());
        exit(0);
    }
}