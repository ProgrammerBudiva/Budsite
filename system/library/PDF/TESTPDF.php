<?php
// TCPDF configuration
require_once(dirname(__FILE__).'/tcpdf_autoconfig.php');
// TCPDF static font methods and data
require_once(dirname(__FILE__).'/include/tcpdf_font_data.php');
// TCPDF static font methods and data
require_once(dirname(__FILE__).'/include/tcpdf_fonts.php');
// TCPDF static color methods and data
require_once(dirname(__FILE__).'/include/tcpdf_colors.php');
// TCPDF static image methods and data
require_once(dirname(__FILE__).'/include/tcpdf_images.php');
// TCPDF static methods and data
require_once(dirname(__FILE__).'/include/tcpdf_static.php');

require($_SERVER['DOCUMENT_ROOT'] . '/system/library/PDF/tcpdf.php');
require_once('examples/tcpdf_include.php');
class TESTPDF extends TCPDF
{
  public function Header()
  {

//      $this->Image($_SERVER['DOCUMENT_ROOT'] . 'system/library/PDF/examples/images/header2.png', 0, 0, 188, 50, 'PNG', 'https://budsite.ua', 'C', true, 150, 'C', false, false, 1, false, false, false);

  }

}