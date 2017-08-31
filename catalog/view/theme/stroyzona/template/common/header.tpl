<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
    <?php if ($robots) { ?>
        <meta name="robots" content="<?php echo $robots; ?>" />
    <?php } ?>
    <meta name="yandex-verification" content="a9df9342383762a2" />
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title><?php echo $title; ?></title>
    <base href="<?php echo $base; ?>" />
    <?php if ($description) { ?>
    <meta name="description" content="<?php echo $description; ?>" />
    <?php } ?>
    <?php if ($keywords) { ?>
    <meta name="keywords" content= "<?php echo $keywords; ?>" />
    <?php } ?>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <?php if ($icon) { ?>
    <link href="<?php echo $icon; ?>" rel="icon" />
    <?php } ?>
    <?php foreach ($links as $link) { ?>
    <link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
    <?php } ?>
    <!-- Scripts that must be in head -->
    <script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
    <script src="catalog/view/javascript/slick/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
    <?php foreach ($headScripts as $script) { ?>
      <?php
      $document = $this->registry->get('document');
      $async = $document->isAsync($script);
      ?>
      <script <?= $async ? 'async' : '' ?> src="<?php echo $script; ?>" type="text/javascript"></script>
    <?php } ?>
    <!-- END Scripts that must be in head -->

    <link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
    <link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="//fonts.googleapis.com/css?family=Open+Sans:400,400i,300,700" rel="stylesheet" type="text/css" />
    <link href="catalog/view/javascript/magnific/magnific-popup.css" rel="stylesheet" />
    <link href="catalog/view/javascript/slick/slick.css?v=1.01" rel="stylesheet">
    <link href='//fonts.googleapis.com/css?family=Oswald:400,700,300' rel='stylesheet' type='text/css'>
    <link href="catalog/view/theme/stroyzona/stylesheet/stylesheet.css?v=1.17" rel="stylesheet">
    <link href="catalog/view/javascript/formstyler/jquery.formstyler.css?v=1.03" rel="stylesheet">
    <link rel="icon" href="/favicon.ico">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
    <?php foreach ($styles as $style) { ?>
    <link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
    <?php } ?>

    <?php /*
    <!-- Vk retargeting code -->
    <script type="text/javascript">
      (window.Image ? (new Image()) : document.createElement('img')).src = location.protocol + '//vk.com/rtrg?r=xdBJCOc5f7xBE1uLNpcrccnzisWG4tvuO1kjnxI0kSzmr7n6if1z3Hb*MaozG4qNpozPIjvuzWKUae4g**S*7azJomHecG3rz2LsXy3i*FOHYytLTjPYV*zWhOz3NmZdnM4uPuBighDQDnct7lwNvo5FAwCao1eSu*uBBZRVUIE-&pixel_id=1000024078';
    </script>
    */ ?>

    <!-- Facebook Pixel Code -->
    <script>
      !function(f,b,e,v,n,t,s){if(f.fbq)return;n=f.fbq=function(){n.callMethod?
        n.callMethod.apply(n,arguments):n.queue.push(arguments)};if(!f._fbq)f._fbq=n;
        n.push=n;n.loaded=!0;n.version='2.0';n.queue=[];t=b.createElement(e);t.async=!0;
        t.src=v;s=b.getElementsByTagName(e)[0];s.parentNode.insertBefore(t,s)}(window,
        document,'script','https://connect.facebook.net/en_US/fbevents.js');
      fbq('init', '260299927704047', {
        em: 'marketing@budsite.ua'
      });
      fbq('track', 'PageView');
    </script>
    <noscript>
      <img height="1" width="1" style="display:none" src="https://www.facebook.com/tr?id=260299927704047&ev=PageView&noscript=1"/>
    </noscript>
    <!-- DO NOT MODIFY -->
    <!-- End Facebook Pixel Code -->

    <!-- Enhanced ecommerce processing -->
    <script type="text/javascript" src="/catalog/view/javascript/ee-processor.js?v1.91"></script>
</head>
<body class="<?php echo $class; ?>">
<!-- Google Tag Manager -->
<noscript><iframe src="//www.googletagmanager.com/ns.html?id=GTM-NCKPKL"
height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
'//www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
})(window,document,'script','dataLayer','GTM-NCKPKL');</script>
<!-- End Google Tag Manager -->
<a href="#" class="scrollToTop"><i class="fa fa-chevron-up"></i></a>
<noscript><img height="1" width="1" style="display:none" src="https://www.facebook.com/tr?id=260299927704047&ev=PageView&noscript=1"/></noscript>
<header>
    <div class="container">
        <div class="row">
            <div class="col-md-2 col-sm-4 col-xs-12">
                <div id="logo">
                  <?php if ($logo) { ?>
                    <a href="<?= ($this->registry->get('request')->get['route'] == 'common/home') ? 'javascript:void(0)' : $home; ?>">
                      <img src="<?php echo $logo; ?>" title="<?php echo $title_logo; ?>" alt="<?php echo $alt_logo; ?>" class="img-responsive" />
                    </a>
                  <?php } else { ?>
                    <h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
                  <?php } ?>
                </div>
            </div>
            <div class="col-md-10 col-sm-8 col-xs-12 static">
                <div class="row">
                    <div class="top_menu_list">
                        <a href="<?php echo $link_about_us;?>"><?php echo $text_about_us;?></a>
                        <a href="<?php echo $link_contacts?>"><?php echo $text_contacts;?></a>
                        <a href="<?php echo $link_shipping;?>"><?php echo $text_shipping;?></a>
                        <a href="<?php echo $link_blog;?>"><?php echo $text_blog;?></a>
                        <a href="<?php echo $link_garanthy;?>"><?php echo $text_garanthy;?></a>
                        <!--a href="<?php echo $link_cooperation;?>"><?php echo $text_cooperation;?></a>
                        <a href="<?php echo $link_statement;?>"><?php echo $text_statement;?></a-->
                    </div>
                  <nav role="select" class="mobile_nav">
                    <select onchange="if (this.value) window.location.href = this.value;">
                      <option value="<?php echo $link_about_us;?>"><?php echo $text_about_us;?></option>
                      <option value="<?php echo $link_contacts?>"><?php echo $text_contacts;?></option>
                      <option value="<?php echo $link_shipping;?>"><?php echo $text_shipping;?></option>
                      <option value="<?php echo $link_blog;?>"><?php echo $text_blog;?></option>
                      <option value="<?php echo $link_garanthy;?>"><?php echo $text_garanthy;?></option>
                    </select>
                  </nav>
                    <nav id="top">
                        <?php echo $language; ?>
                        <?php echo $currency; ?>
                        <div id="top-links" class="nav pull-right">
                            <ul class="list-inline">
                                <?php if(!$logged) { ?>
                                <li class="to-drop"><a title="<?php echo $text_account; ?>" class="user-panel first-login" ><i class="fa fa-user"></i> <span class="hidden-sm"><?php echo $text_account; ?></span> <span class="caret"></span></a>
                                    <div class="my-dropdown dropdown-menu-right">
                                        <div class="links-change-wrap">
                                            <div class="link-close-btn"><i class="fa fa-times-circle"></i></div>
                                            <div class="authorization links-change"><?php echo $text_authorization;?></div>
                                            <div class="first-register links-change"><?php echo $text_registration;?></div>
                                        </div>
                                        <div class="user-forms-login"></div>
                                        <div class="user-forms-register"></div>
                                        <div class="user-forms-restore"></div>
                                    </div >
                                </li>
                                <?php } else { ?>
                                <li class="is-log-responce"><i class="fa fa-sign-out"></i><span><?php echo $text_logged;?></span></li>
                                <?php } ?>

                                <!--<li><a href="<?php echo $shopping_cart; ?>" title="<?php echo $text_shopping_cart; ?>"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_shopping_cart; ?></span></a></li>-->
                                <!--<li><a href="<?php echo $checkout; ?>" title="<?php echo $text_checkout; ?>"><i class="fa fa-share"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_checkout; ?></span></a></li>-->

                            </ul>
                        </div>
                    </nav>
                    <div class="clear"></div>
                </div>
                <div class="description row">
                    <!--<?php if($telephones) { ?>
                        <?php foreach($telephones as $phone) { ?> -->
                        <div class="phone">
                          <!--  <span class="<?php echo $phone['operator'] ?>ringo-phone fa-phone"><?php echo $phone['number']; ?></span> -->
                            <span class="kyivsarringo-phone fa-phone">(044) 390-20-40</span>
                        </div>
                 <!--       <?php } ?>
                    <?php } ?> -->
                    <div class="callback_dropdown to-drop">
                        <i class="fa fa-mobile"></i>
                        <span class="callback-ringo"><?php echo $callback_text?></span>
                        <div class="dropdown_field my-dropdown ">
                          <p><?php echo $callback; ?></p>
                          <div class="form-group">
                            <input id="callback_input_phone" name="callback_phone" type="phone" class="form-control"/>
                          </div>
                          <input id="callback_input_submit" type="submit" value="<?php echo $callback_button?>" class="btn btn-primary" />
                        </div>
                    </div>
                    <div class="wish-and-cart">
                        <a href="<?php echo $wishlist; ?>" id="wishlist-total" title="<?php echo $text_wishlist; ?>"><i class="fa fa-heart-o"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_wishlist; ?></span></a>
                        <a href="<?php echo $compare; ?>" id="compare-total-count" title="<?php echo $text_compare; ?>"><i class="fa fa-exchange"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_compare; ?></span></a>
                    </div>
                </div>


            </div>

        </div>
    </div>
</header>
<?php if ($categories) { ?>
<div class="main-nav-wrap">
<div class="container main-shadow">
    <nav>
        <div class="col-lg-3 col-md-3 col-sm-5 col-xs-1 no-padding for-mobile-touch">
            <div class="left-bar-menu to-drop-main">
                <button class="btn btn-link">
                    <i class="fa fa-bars"></i><span class="menu-title hidden-xs"><?php echo $text_catalog;?></span>
                </button>
                <div class="dropdown-menu my-dropdown-menu">
                    <div class="dropdown-inner">
                      <ul class="nav navbar-nav">
                        <?php foreach ($categories as $category) { ?>
                          <li>
                            <a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?>
                                <div class="dropdown-menu-collapse">
                                    <i class="fa fa-angle-right"></i>
                                </div>
                            </a>
                            <ul class="sub-menu">
                              <?php foreach($category['children'] as $cat2) { ?>
                                <li class="sub">
                                  <a href="<?php echo $cat2['href']?>">
                                    <?php echo $cat2['name']; ?>
                                    <?php if ($cat2['children']) { ?>
                                        <div class="dropdown-menu-collapse">
                                            <i class="fa fa-angle-right"></i>
                                        </div>

                                    <?php } ?>
                                  </a>
                                  <?php if ($cat2['children']) { ?>
                                    <ul class="menu-level-3">
                                      <?php foreach($cat2['children'] as $cat3) { ?>
                                        <li>
                                          <a href="<?php echo $cat3['href']?>">
                                            <?php echo $cat3['name']; ?>
                                          </a>
                                        </li>
                                      <?php } ?>
                                    </ul>
                                  <?php } ?>
                                </li>
                              <?php } ?>
                            </ul>
                          </li>
                        <?php } ?>
                      </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-6 col-md-5 col-sm-5 col-xs-8 col-xxs-12 no-padding hidden-xxs">
            <?php echo $search; ?>
        </div>
        <div class="col-lg-3 col-md-4 col-sm-2 col-xs-3 no-padding mob-cart-btn">
            <?php echo $cart; ?>
            <!--div class="menu-ref-wrap">
                <div class="dropdown">
                    <a class="new-ref dropdown-toggle" href="<?php echo $link_latest;?>"><span><?php echo $text_latest;?></span></a>
                    <?php if($latest_categories) { ?>
                    <div class="dropdown-menu">
                        <div class="dropdown-inner">
                            <ul class="list-unstyled">
                                <?php foreach ($latest_categories as $child) { ?>
                                <li><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></li>
                                <?php } ?>
                            </ul>
                        </div>
                    </div>
                    <?php } ?>
                </div>
                <div class="dropdown">
                    <a class="cheep-ref" href="<?php echo $link_specials;?>"><span><?php echo $text_specials;?></span></a>
                    <?php if($specials_categories) { ?>
                    <div class="dropdown-menu">
                        <div class="dropdown-inner">
                            <ul class="list-unstyled">
                                <?php foreach ($specials_categories as $child) { ?>
                                <li><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></li>
                                <?php } ?>
                            </ul>
                        </div>
                    </div>
                    <?php } ?>
                </div>
            </div-->
        </div>
    </nav>
</div>
</div>
<?php } ?>

<script type="text/javascript">
  $("#callback_input_submit").click(function () {
    var $phoneInput = $("#callback_input_phone");
    $phoneInput.parent().removeClass('has-error');
    var phone = $phoneInput.val();
    if (!phone) {
      $phoneInput.parent().addClass('has-error');
      $phoneInput.focus();
      return false;
    }

    $.ajax({
      url: 'index.php?route=common/header/callback',
      method: "POST",
      data: {callback_phone: phone},

      success: function () {
        $phoneInput.parent().addClass('has-success');
        $("#callback_input_submit").attr('disabled', 'disabled').val("Запрос отправлен");
      }
    });
  });
</script>
<script>
  /*$(".dropdown-menu .navbar-nav ul.menu-level-3").css("height","0px");
  $(".sub-menu li").on({
    'mouseenter':function(){
      var heig;
      var count;
      count = ($(this).find(".menu-level-3 li").length);
      heig = count*40;
      $(this).find(".menu-level-3").animate({
        height: heig
      }, count*100 );
      $(".dropdown-menu .navbar-nav ul.menu-level-3").css("height","auto");
    },
    'mouseleave':function(){
      $(this).find(".menu-level-3").animate({
        height: "0px"
      }, 800 );
    }
  });*/
</script>
