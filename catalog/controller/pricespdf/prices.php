<?php

class ControllerPricespdfPrices extends Controller{

    public function index()
    {


        require_once($_SERVER['DOCUMENT_ROOT'] . '/system/library/dompdf-master/autoload.inc.php');
        $dompdf = new \Dompdf\Dompdf();

        $data = ['filter_category_id' => 214 ];
        $results = $this->model_catalog_product->getProducts($data);





        $html = '
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<style>
  body { font-family: DejaVu Sans, sans-serif ;
        font-size: 10pt;
        }
   @page { margin: 100px 25px; }
    header { position: fixed; top: -60px; left: 0px; right: 0px; height: 50px; }
    footer { position: fixed; bottom: -60px; left: 0px; right: 0px;  height: 50px; }

    p { page-break-after: always; 
    }
    .main{
        position: relative;
        top:204px;
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
            <td width="14%">Основа</td>
            <td width="19%">Верхний слой</td>
            <td width="7%">Ед. изм.</td>
            <td width="9%">Цена</td>
        </tr>
</table></div>
</header><div class="main">
    <table class="table  table-bordered">';

$test;
    foreach ($results as $value) {
        $attr_valid;
        $attrs = $this->model_catalog_product->getProductAttributes($value['product_id']);
        foreach ($attrs[0]['attribute'] as $attr) {
            $attr_valid[$attr['attribute_id']] = $attr['text'];
        }

        $query = $this->db->query("SELECT keyword FROM " . DB_PREFIX . "url_alias WHERE query = 'product_id=". $value['product_id']."'");
//echo "<pre>"; print_r($query); echo "</pre>";die;
        $test .= '
       
            <tr class="">
                <td width="9%">' . $value['sku'] . '</td>
                <td width="11%"><img width="70" align="center" height="60" src="image/' . $value['image'] . '"></td>
                <td> <a href="https://budsite.ua/'. $query->row['keyword'] .'">'. $value['name'] . '</td>


                <td width="14%">' . $attr_valid[23] . '</td>
                <td width="19%">' . $attr_valid[19] . '</td>
                <td width="7%">' . $attr_valid[1] . '</td>
                <td width="9%">'. number_format($value['price'], 2, '.', '') .'</td>

            </tr>';
        unset($attr_valid);
    }

$html .= $test;




$html .= <<<EOT
         </table></div>
EOT;






//echo $html;
        $dompdf->loadHtml($html, 'UTF-8');
        $dompdf->render();
//        $font = $dompdf->getFontMetrics()->get_font("helvetica", "narrow");
//        $dompdf->getCanvas()->page_text(72, 18, "", $font, 10, array(0,0,0));

        $dompdf->stream("dompdf_out.pdf", array("Attachment" => false));

        exit(0);
    }

}
