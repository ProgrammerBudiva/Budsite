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
        <div class="pull-right"><a href="<?php echo $checkout; ?>" class="btn btn-primary btn-cart">Оформить мой заказ</a></div>
        <!--<div class="pull-right refresh-total"><a href="javascript:void(0);" class="btn btn-primary"><?php /*echo $button_refresh_total; */?></a></div>-->
        <div class="clear"></div>
      </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>

<?php echo $footer; ?>
