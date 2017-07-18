<?php
require_once($_SERVER['DOCUMENT_ROOT'] . '/system/library/dompdf-master/autoload.inc.php');

class ControllerPricespdfBlago extends Controller
{
    public function index()
    {
        $data = ['filter_category_id' => 258 ];
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
                top:193px;
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
                    <td width="7%">Артикул</td>
                    <td width="11%">Фото</td>
                    <td width="20%">Название</td>
                    <td width="10%">Бренд</td>
                    <td width="10%">Вид</td>
                    <td width="10%">Длина, м</td>
                    <td width="5%">Ед. изм.</td>
                    <td width="8%">Цена</td>
                </tr>
        </table></div>
        </header><div class="main">
            <table class="table  table-bordered">
        ';
        foreach ($results as $productId => $product){
            $attr_valid;
            $attrs = $this->model_catalog_product->getProductAttributes($productId);
//            echo "<pre>"; print_r($attrs); echo "</pre>";die;
            foreach ($attrs[0]['attribute'] as $attr) {

                $attr_valid[$attr['attribute_id']] = $attr['text'];
            }

            $query = $this->db->query("SELECT keyword FROM " . DB_PREFIX . "url_alias WHERE query = 'product_id=". $productId."'");

            $test .= '
            <tr class="">
                <td width="7%">' . $product['sku'] . '</td>
                <td width="11%"><img style="max-width: 100%; height: auto; text-align: center;" align="center"  src="image/' . $product['image'] . '"></td>
                <td width="20%"> <a href="https://budsite.ua/'. $query->row['keyword'] .'">'. $product['name'] . '</td>


                <td width="10%">' . $attr_valid[2] . '</td>
                <td width="10%">' . $attr_valid[31] . '</td>
                <td width="10%">' . $attr_valid[38] . '</td>
                <td width="5%">' . $attr_valid[1] . '</td>
                <td width="8%">'. number_format($product['price'], 2, '.', '') .'</td>

            </tr>
      
            ';
            unset($attr_valid);
        }
        $html .= $test;
        $dompdf = new \Dompdf\Dompdf();
        $dompdf->loadHtml($html, 'UTF-8');
        $dompdf->render();

//        $dompdf->stream("dompdf_out.pdf", array("Attachment" => false));
        file_put_contents('gen_prices/sad/blago.pdf', $dompdf->output());
        exit(0);
    }
}