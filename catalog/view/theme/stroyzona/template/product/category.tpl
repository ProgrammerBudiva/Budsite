<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb" itemscope itemtype="http://schema.org/BreadcrumbList">
    <?php foreach ($breadcrumbs as $key => $breadcrumb) { ?>
      <li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem">
        <?php if ($key == count($breadcrumbs)-1) { ?>
          <span itemprop="item">
            <span itemprop="name"><?php echo $breadcrumb['text']; ?></span>
          </span>
        <?php } else { ?>
          <a href="<?php echo $breadcrumb['href']; ?>" itemprop="item">
            <span itemprop="name"><?php echo $breadcrumb['text']; ?></span>
          </a>
        <?php } ?>
        <meta itemprop="position" content="<?= ++$key ?>">
      </li>
    <?php } ?>
  </ul>
  <div class="title-wrap-bord">
    <div class="title-module"><h1><?= empty($h1) ? $heading_title : $h1 ?></h1></div>
  </div>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9 col-xs-12'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <?php if ($products) { ?>
      <div class="row">
        <div class="col-lg-2 col-md-3 col-sm-12 hidden-xs">
          <div class="btn-group list-grid-group">
            <button type="button" id="list-view" class="btn btn-primary list-grid" data-toggle="tooltip" title="<?php echo $button_list; ?>"><i class="fa fa-th-list"></i></button>
            <button type="button" id="grid-view" class="btn btn-primary list-grid" data-toggle="tooltip" title="<?php echo $button_grid; ?>"><i class="fa fa-th"></i></button>
          </div>
        </div>
          <div class="col-lg-7 col-md-9 col-sm-12 hidden-xs">
        <div class="filter-head text-left">
          <label class="control-label" for="input-sort"><?php echo $text_sort; ?></label>
        </div>
        <div class="filter-head text-left">
                <?php foreach ($sorts as $sort) { ?>
                <a href="<?php echo $sort['href']; ?>"><?php echo $sort['text']; ?></a>
                <?php } ?>
        </div>
        </div>
          <div class="col-lg-3 col-md-12 col-sm-12 hidden-xs">
        <div class="filter-head text-left">
          <label class="control-label" for="input-limit"><?php echo $text_limit; ?></label>
        </div>
        <div class="filter-head text-left">
          <select id="input-limit" onchange="location = this.value;">
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

      </div>
      <br />
        <?php if ($tagged_related_categories) { ?>
        <div class="row category-tags">
            <div class="col-lg-12 col-md-12 col-sm-12 ">
                <div class="tags">
                    <span>Быстрый подбор:</span>
                    <?php foreach ($tagged_related_categories as $tag) { ?>
                        <div class="tag">
                            <a href="<?php echo $tag['href']; ?>"><?php echo $tag['name']; ?></a>
                        </div>
                    <?php } ?>
                </div>
            </div>
        </div>
        <?php } ?>
      <div class="row category-products">
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
                        <?php if ($product['quantity'] == 0) { echo $button_cart_disable; } else { ?><i class="fa fa-shopping-cart"></i><?php echo $button_cart; } ?>
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
        <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
        <div class="col-sm-6 text-right"><?php echo $results; ?></div>
      </div>
      <?php } ?>
      <?php if (!$products) { ?>
        <div class="row">
            <div class="col-lg-2 col-md-12 col-sm-12 hidden-xs">
                <div class="btn-group list-grid-group">
                    <button type="button" id="list-view" class="btn btn-primary list-grid" data-toggle="tooltip" title="<?php echo $button_list; ?>"><i class="fa fa-th-list"></i></button>
                    <button type="button" id="grid-view" class="btn btn-primary list-grid" data-toggle="tooltip" title="<?php echo $button_grid; ?>"><i class="fa fa-th"></i></button>
                </div>
            </div>
        <span class="responce-filter-head">
        <div class="filter-head text-left">
            <label class="control-label" for="input-sort"><?php echo $text_sort; ?></label>
        </div>
        <div class="filter-head text-left">
            <div class="filter-head" id="input-sort" onclick="location = this.value">
                <?php foreach ($sorts as $sorts) { ?>
                <a href="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></a>
                <?php } ?>
            </div>
        </div>
        </span>
        <span class="responce-filter-head">
        <div class="filter-head text-left">
            <label class="control-label" for="input-limit"><?php echo $text_limit; ?></label>
        </div>
        <div class="filter-head text-left">
            <select id="input-limit" onchange="location = this.value;">
                <?php foreach ($limits as $limits) { ?>
                <?php if ($limits['value'] == $limit) { ?>
                <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
                <?php } ?>
                <?php } ?>
            </select>
        </div>
        </span>
            <?php $in_store_status = ($in_store == 'on')?'checked="checked"':''; ?>
        </div>
        <div class="row">
            <div class="col-xs-12">
                <p class="empty-product-row"><?php echo $text_empty; ?></p>
                <div class="buttons">
                    <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
                </div>
            </div>
        </div>
      <?php } ?>
      <?php if (!$this->registry->get('request')->hasRestrictedParams()) { ?>
        <div class="desc category-description-field">
          <?php echo $description?>
        </div>
      <?php } ?>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>

<div class="modal-popup" id="wishlist-popup">
    <div class="modal-popup-content">
        <div>
            <span class="modal-close"><i class="fa fa-times" aria-hidden="true"></i></span>
            <div class="modal-product"></div>
            <div class="modal-link">
                <a href="/compare-products">Перейти в список сравнения</a>
            </div>
        </div>
    </div>
</div>

<script>
  /**
   * Обработка событий расширенной торговли в категории товаров
   */
  $(function(){

    /* Событие AddToCart в списке товаров категории */
    $('.category-products .add-to-cart').click(function () {
      var product = getProductInCategory($(this).parents('div.product-thumb'));
      EEProcessor.addToCart([product]);
    });

    /* Событие productClick в списке товаров категории */
    $('.category-products .product-thumb a').click(function (e) {
      e.preventDefault();
      var product = getProductInCategory($(this).parents('div.product-thumb'));
      var url = $(this).attr('href');
      EEProcessor.productClick([product], url);
    });

    /* Событие productImpressions в списке товаров категории */
    (function(){
      var products = [];
      for (var i = 0; i < $('.category-products .product-thumb').length; i++){
        var elem = $('.category-products .product-thumb')[i];
        var product = getProductInCategory($(elem));
        products.push(product);
      }
      console.log('/* Событие productImpressions в списке товаров категории */');
      if (products.length > 0) {
        EEProcessor.productImpressions(products);
      }
    })();
  });

  /* Получить объект товара из списка товаров категории */
  getProductInCategory = function($pItem){
    return {
      name: $pItem.find('.caption .name a').text(),
      id: $pItem.find('.add-to-cart').attr('onclick').replace(/[^\d]/gi, ''),
      price: $pItem.find('p.price').data('price').replace(/[^\d\.]/gi, ''),
      brand: $pItem.data('brand'),
      category: $('.breadcrumb li:last').text().trim(),
      quantity: 1,
      position: $pItem.parent().index() + 1, // индекс с 1 мануалу
      list: "<?= $this->registry->get('request')->get['route'] ?>"
    }
  };
</script>

<?php if (!empty($trackType)) { ?>
  <script>
    dataLayer.push({
      event:'PageCat',
      eventCategory: "<?= $trackType ?>",
      eventAction: "<?= $this->registry->get('document')->getcanonical() ?>"
    });
  </script>
<?php } ?>

<?php echo $footer; ?>
