<?php if($products) { ?>
<div class="panel col-md-12">
  <div class="title-wrap-bord">
                  <a class="title-module"><span><?php echo $heading_title;?></span></a>
              </div>
  <div class="panel-content" style="text-align: center;">
      <div class="row slick-slider">
          <?php foreach ($products as $product) { ?>
          <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                          <div class="product-thumb transition">
                              <div class="image">
                                  <a href="<?php echo $product['href']; ?>">
                                      <div class="img-wrap">
                                          <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" />
                                          <div class="<?php echo $product['label'];?>"></div>
                                          <!-- or class="orange-procent"-->
                                      </div>
                                  </a>
                              </div>
                              <div class="caption">
                                  <p class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></p>
                                  <?php if ($product['price']) { ?>
                                  <p class="price">
                                    <?php if (!$product['special']) { ?>
                                      <?php echo $product['price']; ?>
                                      <?php } else { ?>
                                      <span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
                                      <?php } ?>
                                      <?php if ($product['tax']) { ?>
                                      <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
                                      <?php } ?>
                                  </p>
                                  <?php } ?>
                              </div>
                              <button class="add-to-cart" type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');"><span><i class="fa fa-shopping-cart"></i><?php echo $button_cart; ?></span></button>
                              <div class="tooltips">
                                  <button type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>
                                  <button type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button>
                              </div>

                              <div class="label_pro">
                                 <?php if($product['latest_label']) { ?><div class="pro_sale"><?php echo $text_pro_sale; ?></div><?php } ?>
                                  <?php if($product['specials_label']) { ?><div class="pro_hot"><?php echo $text_pro_hot; ?></div><?php } ?>
                              </div>
                          </div>
                       </div>
          <?php } ?>
      </div>
  </div>
</div>
<?php } ?>