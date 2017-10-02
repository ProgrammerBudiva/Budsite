<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <h2><?php echo $heading_title; ?></h2>
      <?php if ($products) { ?>
      <p><a href="<?php echo $compare; ?>" id="compare-total"> <?php echo $text_compare; ?></a></p>
      <div class="row">
        <div class="col-sm-3">
          <div class="btn-group hidden-xs">
            <button type="button" id="list-view" class="btn btn-default" data-toggle="tooltip" title="<?php echo $button_list; ?>"><i class="fa fa-th-list"></i></button>
            <button type="button" id="grid-view" class="btn btn-default" data-toggle="tooltip" title="<?php echo $button_grid; ?>"><i class="fa fa-th"></i></button>
          </div>
        </div>
        <div class="col-sm-1 col-sm-offset-2 text-right">
          <label class="control-label" for="input-sort"><?php echo $text_sort; ?></label>
        </div>
        <div class="col-sm-3 text-right">
          <select id="input-sort" class="form-control col-sm-3" onchange="location = this.value;">
            <?php foreach ($sorts as $sorts) { ?>
            <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
            <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
            <?php } ?>
            <?php } ?>
          </select>
        </div>
        <div class="col-sm-1 text-right">
          <label class="control-label" for="input-limit"><?php echo $text_limit; ?></label>
        </div>
        <div class="col-sm-2 text-right">
          <select id="input-limit" class="form-control" onchange="location = this.value;">
            <?php foreach ($limits as $limits) { ?>
            <?php if ($limits['value'] == $limit) { ?>
            <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
            <?php } ?>
            <?php } ?>
          </select>
        </div>
      </div>
      <br />
      <div class="row">
        <?php foreach ($products as $product) { ?>
        <div class="product-layout product-list col-sm-12 col-xs-6">
          <div class="product-thumb transition" data-brand="<?= $product['brand'] ?>">
            <div class="image">
              <a href="<?php echo $product['href']; ?>">
                <div class="img-wrap">
                  <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" />
                  <?php if($product['latest_label']) { ?>
                  <div class="<?php echo $product['latest_label'];?>"></div>
                  <?php }
                            if($product['specials_label']) { ?>
                  <div class="<?php echo $product['specials_label'];?>"></div>
                  <?php } ?>
                </div>
              </a>
            </div>
            <div class="caption">
              <p class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></p>
            </div>
            <div class="caption">
              <?php if ($product['price']) { ?>
              <p class="price" data-price="<?= $product['special'] ?: $product['price'] ?>">
                <?php if (!$product['special']) { ?>
                <?php if ($product['lower_price']) { ?>
                <span class="price-old"><?php echo $product['lower_price']; ?><span class="unit"><?= $product['unit'] ?></span></span>
                <?php } ?>
                <span class="price-new"><?php echo $product['price']; ?><span class="unit"><?= $product['unit'] ?></span></span>
                <?php } else { ?>
                <span class="price-old"><?php echo $product['price']; ?><span class="unit"><?= $product['unit'] ?></span></span>
                <span class="price-new"><?php echo $product['special']; ?><span class="unit"><?= $product['unit'] ?></span></span>
                <?php } ?>
                <?php if ($product['tax']) { ?>
                <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
                <?php } ?>
              </p>
              <?php } ?>
            </div>


            <button <?php if($product['in_cart']) echo "style='display:none'" ?> class="add-to-cart <?php if($product['quantity'] == 0) echo 'disabled' ?>" <?php if ($product['quantity'] == 0) { ?> disabled="disabled" <?php } ?> type="button" onclick="cart.add('<?php echo $product['product_id']; ?>', '1', this);">
            <span>
                        <?php if ($product['quantity'] == 0) { echo $button_cart_disable; } else { ?><i class="fa fa-shopping-cart"></i><?php echo 'Купить'; } ?>
                    </span>
            </button>
            <button <?php if(!$product['in_cart']) echo "style='display:none'" ?> class="go-to-cart" type="button" onclick="location.href='shopping-cart'">
            <span>
                        <i class="fa fa-check-square-o" aria-hidden="true"></i><?php echo 'В корзине' ?>
                    </span>
            </button>

            <div class="tooltips">
              <button type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>', this);"><i class="fa fa-heart"></i></button>
              <button type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>', this);"><?php if($product['in_compared']) echo '<i class="fa fa-check-square"></i>'; else echo '<i class="fa fa-exchange" aria-hidden="true"></i>'; ?></button>
            </div>

            <div class="label_pro">
              <?php if($product['latest_label']) { ?><div class="pro_sale"><?php echo $text_pro_sale; ?></div><?php } ?>
              <?php if($product['specials_label']) { ?><div class="pro_hot"><?php echo $text_pro_hot; ?></div><?php } ?>
            </div>
          </div>
        </div>
        <?php } ?>
      </div>
      <div class="row">
        <div class="col-sm-12 text-center"><?php echo $pagination; ?></div>
      </div>
      <?php } else { ?>
      <p><?php echo $text_empty; ?></p>
      <div class="buttons">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
      </div>
      <?php } ?>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?> 