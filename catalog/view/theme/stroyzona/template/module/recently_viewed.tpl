<?php if($products) { ?>
<div class="panel col-md-12">
    <div class="title-wrap-bord">
        <a class="title-module"><span><?php echo $heading_title;?></span></a>
    </div>
    <div class="panel-content" style="text-align: center;">
        <div class="recently-viewed">
            <?php foreach ($products as $product) { ?>
            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                <div class="product-thumb transition" data-brand="<?= $product['brand'] ?>" data-category="<?= $product['category'] ?>">
                    <div class="image">
                        <a href="<?php echo $product['href']; ?>">
                            <div class="img-wrap">
                                <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>"
                                     title="<?php echo $product['name']; ?>" class="img-responsive"/>
                                <?php if($product['latest_label']) { ?>
                                <div class="<?php echo $product['latest_label'];?>"></div>
                                <?php }
                            if($product['specials_label']) { ?>
                                <div class="<?php echo $product['specials_label'];?>"></div>
                                <?php } ?>
                                <!-- or class="orange-procent"-->
                            </div>
                        </a>
                    </div>
                    <div class="caption">
                        <p class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></p>
                        <?php if ($product['price']) { ?>
                        <p class="price" data-price="<?= $product['special'] ?: $product['price'] ?>">
                            <?php if (!$product['special']) { ?>
                              <span><?php echo $product['price']; ?></span>
                            <?php } else { ?>
                              <span class="price-old"><?php echo $product['price']; ?></span>
                              <span class="price-new"><?php echo $product['special']; ?></span>
                            <?php } ?>
                            <?php if ($product['tax']) { ?>
                              <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
                            <?php } ?>
                        </p>
                        <?php } ?>
                    </div>
                    <button class="add-to-cart <?php if($product['quantity'] == 0) echo 'disabled' ?>"
                    <?php if($product['quantity'] == 0) { ?> disabled <?php } ?> type="button"
                            onclick="cart.add('<?php echo $product['product_id']; ?>', 1, this);"><span>
                            <?php if ($product['quantity'] == 0) { echo $button_cart_disable; } else { ?> <i
                                    class="fa fa-shopping-cart"></i> <?php echo $button_cart; } ?></span></button>
                    <div class="tooltips">
                        <button type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>"
                                onclick="wishlist.add('<?php echo $product['product_id']; ?>', this);"><i
                                    class="fa fa-heart"></i></button>
                        <button type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>"
                                onclick="compare.add('<?php echo $product['product_id']; ?>', this);"><i
                                    class="fa fa-exchange"></i></button>
                    </div>

                    <div class="label_pro">
                        <?php if($product['latest_label']) { ?>
                        <div class="pro_sale"><?php echo $text_pro_sale; ?></div>
                        <?php } ?>
                        <?php if($product['specials_label']) { ?>
                        <div class="pro_hot"><?php echo $text_pro_hot; ?></div>
                        <?php } ?>
                    </div>
                </div>
            </div>
            <?php } ?>
        </div>
    </div>
</div>

<script>
  /**
   * Обработка событий расширенной торговли в слайдере просмотренных товаров
   */
  $(function(){

    /* Событие AddToCart в viewed слайдере */
    $('.recently-viewed .add-to-cart').click(function () {
      var $pItem = $(this).parents('div.product-thumb');
      var products = [{
        name: $pItem.find('.caption a').text(),
        id: $pItem.find('.add-to-cart').attr('onclick').replace(/[^\d]/gi, ''),
        price: $pItem.find('p.price').data('price').replace(/[^\d\.]/gi, ''),
        brand: $pItem.data('brand'),
        category: $pItem.data('category'),
        list: "product/viewed",
        quantity: 1
      }];

      EEProcessor.addToCart(products);
    });

    /* Событие productClick в viewed слайдере */
    $('.recently-viewed .product-thumb a').click(function (e) {
      e.preventDefault();
      var product = getProductFromViewedSlider($(this).parents('div.product-thumb'));
      var url = $(this).attr('href');
      EEProcessor.productClick([product], url);
    });

    /* Событие productImpressions в viewed слайдере */
    (function(){
      var products = [];
      var previousListedProductsCount = $('.category-products .product-thumb').length;
      $('.recently-viewed .product-thumb').each(function(i, elem){
        var product = getProductFromViewedSlider($(elem));
        // позиция должна начинаться с 1, а также попробуем учесть товары категории, которые выводятся выше в листинге
        product.position = previousListedProductsCount + i + 1;
        products.push(product);
      });
      console.log('/* Событие productImpressions в viewed слайдере */');
      if (products.length > 0) {
        EEProcessor.productImpressions(products);
      }
    })();
  });

  /* Получить объект товара в viewed слайдере */
  getProductFromViewedSlider = function($pItem){
    return {
      name: $pItem.find('.caption a').text(),
      id: $pItem.find('.add-to-cart').attr('onclick').replace(/[^\d]/gi, ''),
      price: $pItem.find('p.price').data('price').replace(/[^\d\.]/gi, ''),
      brand: $pItem.data('brand'),
      category: $pItem.data('category'),
      list: "product/viewed"
    }
  };
</script>

<?php } ?>