<?php echo $header; ?>
<div class="container cart-container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <?php if ($attention) { ?>
  <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $attention; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <?php if ($success) { ?>
  <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <?php if ($error_warning) { ?>
  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <h1 style="margin-bottom: 30px;margin-top:0;"><?php echo $heading_title; ?></h1>
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
        <div class="table-responsive table-cart">
          <div class="d-table table-bordered">

              <div class="d-table-row d-table-head">
                <div class="d-table-cell text-center"><?php echo $column_image; ?></div>
                <div class="d-table-cell text-left"><?php echo $column_name; ?></div>
                <div class="d-table-cell text-left"><?php echo $column_sku; ?></div>
                <div class="d-table-cell text-left"><?php echo $column_quantity; ?></div>
                <div class="d-table-cell table-resp text-right"><?php echo $column_price; ?></div>
                <div class="d-table-cell text-right"><?php echo $column_total; ?></div>
                <div class="d-table-cell text-right"></div>
              </div>
              <?php foreach ($products as $product) { ?>
              <div class="d-table-row <?php if (!$product['stock']) { ?>product-stok<?php } ?>">
                <div class="d-table-cell text-center">
                <?php if ($product['thumb']) { ?>
                  <a href="<?php echo $product['href']; ?>">
                    <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-thumbnail" />
                  </a>
                <?php } ?>
                </div>
                <div class="d-table-cell cart-description">
                  <a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                  <?php if (!$product['stock']) { ?>
                  <span class="text-danger">***</span>
                  <?php } ?>
                  <?php if ($product['option']) { ?>
                  <?php foreach ($product['option'] as $option) { ?>
                  <br />
                  <small><?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
                  <?php } ?>
                  <?php } ?>
                  <?php if ($product['reward']) { ?>
                  <br />
                  <small><?php echo $product['reward']; ?></small>
                  <?php } ?>
                  <?php if ($product['recurring']) { ?>
                  <br />
                  <span class="label label-info"><?php echo $text_recurring_item; ?></span> <small><?php echo $product['recurring']; ?></small>
                  <?php } ?>
                  <?php /*if (!empty($product['summary'])) { */?><!--
                    <div class="summary"><?/*= preg_replace("/\s+/ui", " ", $product['summary']) */?></div>
                  --><?php /*} */?>
                </div>
                  <?php if($product['sku']) { ?>
                  <div class="d-table-cell text-left cart-description">
                      <span><?php echo $product['sku']; ?></span>
                  </div>
                  <?php } ?>
                <div class="d-table-cell text-left width40">
                    <div class="input-group btn-block cart-amount">
                        <div class="counter-wrap">
                            <div class="minus"><i class="fa fa-minus"></i></div>
                          <input type="text" name="<?php echo $product['key']; ?>" data-price="<?php echo $product['original_price'];?>" class="product_quantity number" value="<?php echo $product['quantity']; ?>"/>
                          <div class="plus"><i class="fa fa-plus"></i></div>

                        </div>
                    </div>
                </div>
                 <?php if(!$product['special']) { ?>
                <div class="d-table-cell table-resp text-right cart-price">
                    <div class="price-wrap">
                        <div class="big-price">
                            <?php echo $product['price']; ?>
                        </div>
                    </div>
                </div>
                <?php } else { ?>
                <div class="d-table-cell table-resp text-right cart-price">
                    <div class="price-wrap">
                        <div class="big-price">
                            <?php echo $product['special']; ?>
                        </div>
                    </div>
                    <div class="big-price">
                        <?php echo $product['price']; ?>
                    </div>
                    <div class="discount">
                        <?php echo $text_economy;?> <?php echo $product['discount'];?>%
                    </div>
                </div>
                <?php } ?>
                <div data-id="product-<?php echo $product['product_id'];?>" class="d-table-cell width40 text-right cart-total product-<?php echo $product['product_id'];?>"><?php echo $product['total']; ?></div>
                <div class="d-table-cell text-center width15 cart-delete"><button type="button" data-key="<?php echo $product['key']; ?>" title="<?php echo $button_remove; ?>" ><i class="fa fa-trash-o"></i></button></div>
                <?php $product_info = [
                  'name' => htmlspecialchars($product['name'],ENT_QUOTES),
                  'id' => $product['product_id'],
                  'price' => $product['original_price'],
                  'brand' => $product['brand'],
                  'category' => $product['category'],
                  'quantity' => $product['quantity'],
                ]; ?>
                <meta data-type="product-info" content='<?= json_encode($product_info, JSON_UNESCAPED_UNICODE|JSON_UNESCAPED_SLASHES)?>'/>
              </div>
              <?php } ?>
          </div>
        </div>
      </form>

      <div class="row" style="margin-top:15px;">
        <div class="col-md-3 col-sm-6 col-md-offset-9 col-sm-offset-6">
          <table class="table cart-total-field" style="margin-bottom:10px;">
              <?php foreach ($totals as $total) { ?>
              <tr>
                  <td class="text-right"><strong class="title-<?php echo $total['code'];?>"><?php echo $total['title']; ?>:</strong></td>
                  <td class="text-left cart-total total-<?php echo $total['code'];?>"><?php echo $total['text']; ?></td>
              </tr>
            <?php } ?>
          </table>
        </div>
      </div>
      <div class="buttons" style="margin-bottom:40px;margin-top:0;">
        <div class="pull-left"><a href="<?php echo $continue; ?>" class="btn btn-primary btn-cart"><?php echo $button_shopping; ?></a></div>
        <div class="pull-right" style="display: flex;">
            <div class="buy-1-click " style="float: none; width: 237px; padding-right: 15px;">
                <!--<p><?php /*echo $text_buy_one_click; */?></p>-->
                <span><span style="margin-left: auto;width: 200px;margin-right: auto;height: 0;border: none;padding: 0;">
                                            <div><img id="img-pointer" src="image/pointer.png" alt="pointer"></div>
                                            <div id="div-click">Купить в 1 клик</div>
                           </span>             </span>
                <div class="modal-wrap" style="width: 222px;z-index: 1;">
                    <p><?php echo $text_callback_you; ?></p>
                    <input id="callback_input_phone_product" name="phone"  />
                    <input type="hidden" value="<?php echo $spec_link; ?>" name="product">
                    <a class="thank-to-call"><input id="callback_input_submit_product" type="submit" value="Жду звонка" class="btn btn-primary" /></a>
                    <i class="fa fa-times"></i>
                    <p class="phone-alert"></p>
                </div>
                <div class="hidden" id="oneclick_success">Жду звонка</div>
            </div>
            <a href="<?php echo $checkout; ?>" class="btn btn-primary btn-cart" style="padding-top: 1px!important;">Оформить мой заказ</a>
        </div>
        <!--<div class="pull-right refresh-total"><a href="javascript:void(0);" class="btn btn-primary"><?php /*echo $button_refresh_total; */?></a></div>-->
        <div class="clear"></div>
      </div>
        <a href="#succes-popup" id="" class="btn btn-primary next-btn delivery-continue-popup" style="visibility: hidden" data-effect="mfp-zoom-in"><?php echo $button_continue;?></a>
        <div id="succes-popup" class="white-popup mfp-with-anim mfp-hide"></div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>

<?php echo $footer; ?>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.colorbox/1.6.4/jquery.colorbox.js" type="text/javascript"></script>
<script>
    $('body').click(function (evt) {
        if ($('.modal-wrap').is(':visible')) {
            console.log($('.modal-wrap').is(':visible'));
            if (!$(evt.target).is('.modal-wrap') && !$(evt.target).is(".buy-1-click>span, .modal-wrap i")
                && !$(evt.target).is("#div-click") && !$(evt.target).is("#img-pointer")
                && !$(evt.target).is("#callback_input_phone_product") && !$(evt.target).is("#callback_input_submit_product")) {
                $('.modal-wrap').hide();
            }
        }
    });

    $('#callback_input_phone_product').mask("+38 (999) 999 99 99");

    $('#callback_input_submit_product').click(function () {
        var phone = $('#callback_input_phone_product').val();
        if (phone){
            $.ajax({
                url: "index.php?route=checkout/checkout/buy1clickCustom",
                method: "POST",
                data: 'telephone=' + phone,
                success: function () {
                    console.log('ok');
                    $('#succes-popup').load("https://budsite.ua/index.php?route=checkout/success/success_popup");
                    $('a.delivery-continue-popup').trigger('click');

                }
            });
        }
    });
</script>
<style>

    @media (max-width:480px){
        .buy-1-click {
            padding-bottom: 10px;
            margin: auto;
            padding-right: 0!important;
        }
        .pull-right {
            display: block!important;
        }

    }
    /*
    Colorbox Core Style:
    The following CSS is consistent between example themes and should not be altered.
*/
    #colorbox, #cboxOverlay, #cboxWrapper{position:absolute; top:0; left:0; z-index:9999; overflow:hidden; -webkit-transform: translate3d(0,0,0);}
    #cboxWrapper {max-width:none;}
    #cboxOverlay{position:fixed; width:100%; height:100%;}
    #cboxMiddleLeft, #cboxBottomLeft{clear:left;}
    #cboxContent{position:relative;}
    #cboxLoadedContent{overflow:auto; -webkit-overflow-scrolling: touch;}
    #cboxTitle{margin:0;}
    #cboxLoadingOverlay, #cboxLoadingGraphic{position:absolute; top:0; left:0; width:100%; height:100%;}
    #cboxPrevious, #cboxNext, #cboxClose, #cboxSlideshow{cursor:pointer;}
    .cboxPhoto{float:left; margin:auto; border:0; display:block; max-width:none; -ms-interpolation-mode:bicubic;}
    .cboxIframe{width:100%; height:100%; display:block; border:0; padding:0; margin:0;}
    #colorbox, #cboxContent, #cboxLoadedContent{box-sizing:content-box; -moz-box-sizing:content-box; -webkit-box-sizing:content-box;}

        /*
            User Style:
            Change the following styles to modify the appearance of Colorbox.  They are
            ordered & tabbed in a way that represents the nesting of the generated HTML.
        */
    #cboxOverlay{background:rgba(0, 0, 0, 0.6); opacity: 0.9; filter: alpha(opacity = 90);}
    #colorbox{outline:0;}
    #cboxContent{margin-top:32px; overflow:visible; background:#000;}
    .cboxIframe{background:#fff;}
    #cboxError{padding:50px; border:1px solid #ccc;}
    #cboxLoadedContent{background:#000; padding:1px;}
    #cboxLoadingGraphic{background:url(images/loading.gif) no-repeat center center;}
    #cboxLoadingOverlay{background:#000;}
    #cboxTitle{position:absolute; top:-22px; left:0; color:#000;}
    #cboxCurrent{position:absolute; top:-22px; right:205px; text-indent:-9999px;}

        /* these elements are buttons, and may need to have additional styles reset to avoid unwanted base styles */
    #cboxPrevious, #cboxNext, #cboxSlideshow, #cboxClose {border:0; padding:0; margin:0; overflow:visible; text-indent:-9999px; width:20px; height:20px; position:absolute; top:-20px; background:url(images/controls.png) no-repeat 0 0;}

        /* avoid outlines on :active (mouseclick), but preserve outlines on :focus (tabbed navigating) */
    #cboxPrevious:active, #cboxNext:active, #cboxSlideshow:active, #cboxClose:active {outline:0;}

    #cboxPrevious{background-position:0px 0px; right:44px;}
    #cboxPrevious:hover{background-position:0px -25px;}
    #cboxNext{background-position:-25px 0px; right:22px;}
    #cboxNext:hover{background-position:-25px -25px;}
    #cboxClose{background-position:-50px 0px; right:0;}
    #cboxClose:hover{background-position:-50px -25px;}
    .cboxSlideshow_on #cboxPrevious, .cboxSlideshow_off #cboxPrevious{right:66px;}
    .cboxSlideshow_on #cboxSlideshow{background-position:-75px -25px; right:44px;}
    .cboxSlideshow_on #cboxSlideshow:hover{background-position:-100px -25px;}
    .cboxSlideshow_off #cboxSlideshow{background-position:-100px 0px; right:44px;}
    .cboxSlideshow_off #cboxSlideshow:hover{background-position:-75px -25px;}
</style>
