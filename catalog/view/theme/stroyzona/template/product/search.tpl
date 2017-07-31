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
      <div class="title-wrap-bord">
          <a class="title-module"><span><?php echo $heading_title;?></span></a>
      </div>
      <label class="control-label" for="input-search"><?php echo $entry_search; ?></label>
      <div class="row search-row">
        <div class="col-sm-4">
          <input type="text" name="search" value="<?php echo $search; ?>" placeholder="<?php echo $text_keyword; ?>" id="input-search" class="form-control" />
          <input type="button" value="<?php echo $button_search; ?>" id="button-search" class="btn btn-primary" />
        </div>
        <div class="col-sm-3 categories-select">
          <select name="category_id">
            <option value="0"><?php echo $text_category; ?></option>
            <?php foreach ($categories as $category_1) { ?>
            <?php if ($category_1['category_id'] == $category_id) { ?>
            <option value="<?php echo $category_1['category_id']; ?>" selected="selected"><?php echo $category_1['name']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $category_1['category_id']; ?>"><?php echo $category_1['name']; ?></option>
            <?php } ?>
            <?php foreach ($category_1['children'] as $category_2) { ?>
            <?php if ($category_2['category_id'] == $category_id) { ?>
            <option value="<?php echo $category_2['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $category_2['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
            <?php } ?>
            <?php foreach ($category_2['children'] as $category_3) { ?>
            <?php if ($category_3['category_id'] == $category_id) { ?>
            <option value="<?php echo $category_3['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $category_3['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
            <?php } ?>
            <?php } ?>
            <?php } ?>
            <?php } ?>
          </select>
        </div>
        <div class="col-sm-5">
             <label class="checkbox-inline moved-top">
              <?php if ($description) { ?>
              <input type="checkbox" name="description" value="1" id="description" checked="checked" />
              <?php } else { ?>
              <input type="checkbox" name="description" value="1" id="description" />
              <?php } ?>
              <?php echo $entry_description; ?></label>
        </div>
      </div>

      <div class="title-wrap-bord">
          <a class="title-module"><span><?php echo $text_search; ?></span></a>
      </div>
      <?php if ($products) { ?>
      <div class="row more-sort">
        <div class="col-lg-2 col-md-3 col-sm-12 hidden-xs">
          <div class="btn-group list-grid-group">
            <button type="button" id="list-view" class="btn btn-primary list-grid" data-toggle="tooltip" title="<?php echo $button_list; ?>"><i class="fa fa-th-list"></i></button>
            <button type="button" id="grid-view" class="btn btn-primary list-grid" data-toggle="tooltip" title="<?php echo $button_grid; ?>"><i class="fa fa-th"></i></button>
          </div>
        </div>
        <div class="col-sm-6 col-xs-8">
          <label class="vertical filter-label" for="input-sort"><?php echo $text_sort; ?></label>
          <div class="filter-head" id="input-sort" onclick="location = this.value">
            <?php foreach ($sorts as $sorts) { ?>
            <a href="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></a>
            <?php } ?>
          </div>
        </div>
        <div class="col-lg-3 col-md-12 col-sm-12 hidden-xs">
          <label class="control-label vertical" for="input-limit"><?php echo $text_limit; ?></label>
          <select onchange="location = this.value;">
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
      <div class="row search-page">
        <?php foreach ($products as $product) { ?>
        <div class="product-layout col-sm-4 col-xs-12">
          <div class="product-thumb" data-id="<?= $product['product_id']; ?>" data-brand="<?= $product['brand']; ?>" data-category="<?= $product['category']; ?>" >
            <div class="image">
              <a href="<?php echo $product['href']; ?>">
                <div class="img-wrap">
                  <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" />
                  <div class="<?=  !empty($product['label']) ? $product['label'] : ''?>"></div>
                  <!-- or class="orange-procent"-->
                </div>
              </a>
              <div class="hovering-info">
                <?php if ($product['price']) { ?>
                <p class="price" data-price="<?= $product['special'] ?: $product['price'] ?>">
                    <?php if (!$product['special']) { ?>
                    <?php echo $product['price']; ?><span class="unit"><?= $product['unit'] ?></span>
                    <?php } else { ?>
                    <span class="price-old">
                      <?php echo $text_old;?><b><?php echo $product['price']; ?><span class="unit"><?= $product['unit'] ?></span></b>
                    </span>
                    <br>
                    <span class="price-new">
                      <?php echo $text_new;?>: <?php echo $product['special']; ?><span class="unit"><?= $product['unit'] ?></span>
                    </span>
                    <?php } ?>
                </p>
                <?php } ?>
                <button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span></button>
                <a href="<?php echo $product['href']; ?>" class="more-about"><?php echo $text_more;?></a>
              </div>
            </div>
            <div class="caption">
              <p class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></p>
              <?php if ($product['price']) { ?>
              <p class="price" >
                 <?php if (!$product['special']) { ?>
                    <?php echo $product['price']; ?><span class="unit"><?= $product['unit'] ?></span>
                 <?php } else { ?>
                 <span class="price-new"><?php echo $product['special']; ?></span><span class="unit"><?= $product['unit'] ?></span>
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
          </div>
        </div>
        <?php } ?>
      </div>
      <div class="row">
        <div class="col-sm-12 text-center"><?php echo $pagination; ?></div>
      </div>
      <?php } else { ?>
      <p><?php echo $text_empty; ?></p>
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
<script type="text/javascript"><!--
$('#button-search').bind('click', function() {
	url = 'index.php?route=product/search';
	
	var search = $('#content input[name=\'search\']').prop('value');
	
	if (search) {
		url += '&search=' + encodeURIComponent(search);
	}

	var category_id = $('#content select[name=\'category_id\']').prop('value');
	
	if (category_id > 0) {
		url += '&category_id=' + encodeURIComponent(category_id);
	}
	
	var sub_category = $('#content input[name=\'sub_category\']:checked').prop('value');
	
	if (sub_category) {
		url += '&sub_category=true';
	}
		
	var filter_description = $('#content input[name=\'description\']:checked').prop('value');
	
	if (filter_description) {
		url += '&description=true';
	}

	location = url;
});

$('#content input[name=\'search\']').bind('keydown', function(e) {
	if (e.keyCode == 13) {
		$('#button-search').trigger('click');
	}
});

$('select[name=\'category_id\']').on('change', function() {
	if (this.value == '0') {
		$('input[name=\'sub_category\']').prop('disabled', true);
	} else {
		$('input[name=\'sub_category\']').prop('disabled', false);
	}
});

$('select[name=\'category_id\']').trigger('change');
--></script>
<script>
    /**
     * Обработка событий расширенной торговли в категории товаров
     */
    $(function(){

      /* Событие AddToCart в списке товаров категории */
        $(' .add-to-cart').click(function () {
            var product = getProductInCategory($(this).parents('div.product-thumb'));
            EEProcessor.addToCart([product]);
        });

      /* Событие productClick в списке товаров категории */
        $(' .product-thumb a').click(function (e) {
            e.preventDefault();
            var product = getProductInCategory($(this).parents('div.product-thumb'));
            var url = $(this).attr('href');
            EEProcessor.productClick([product], url);
        });

      /* Событие productImpressions в списке товаров категории */
        (function(){
            var products = [];
            for (var i = 0; i < $(' .product-thumb').length; i++){
                var elem = $(' .product-thumb')[i];
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
//            price: $pItem.find('p .price').data('price').replace(/[^\d\.]/gi, ''),
            brand: $pItem.data('brand'),
            category: $('.breadcrumb li:last').text().trim(),
            quantity: 1,
            position: $pItem.parent().index() + 1, // индекс с 1 мануалу
            list: "<?= $this->registry->get('request')->get['route'] ?>"
        }
    };


  $(' .add-to-cart').on('click',function()
          {
              $(this).hide();$(this).next().show();
          });
</script>
<?php echo $footer; ?>