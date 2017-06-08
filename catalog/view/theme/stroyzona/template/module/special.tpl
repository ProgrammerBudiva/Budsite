<?php if($products) { ?>
<div class="panel">
    <div class="panel-heading"><?php echo $heading_title; ?><span><?php echo $percent;?> %</span></div>
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
                        <div class="hovering-info">
                            <?php if ($product['price']) { ?>
                            <p class="price">
                                <?php if (!$product['special']) { ?>
                                <span>Price: </span>
                                <?php echo $product['price']; ?>
                                <?php } else { ?>
                                <span class="price-old"><?php echo $text_old_price;?>: <b><?php echo $product['price']; ?></b></span><br><span class="price-new"><?php echo $text_new_price;?>: <?php echo $product['special']; ?></span>
                                <?php } ?>
                            </p>
                            <?php } ?>
                            <button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');"><span><?php echo $button_cart; ?></span></button>
                            <a href="<?php echo $product['href']; ?>" class="more-about"><?php echo $text_more;?></a>
                        </div>
                    </div>
                    <div class="caption">
                        <p class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></p>
                        <?php if ($product['price']) { ?>
                        <p class="price">
                            <?php if (!$product['special']) { ?>
                            <?php echo $product['price']; ?>
                            <?php } else { ?>
                            <span class="price-new"><?php echo $product['special']; ?></span>
                            <?php } ?>
                        </p>
                        <?php } ?>
                    </div>
                </div>
            </div>
            <?php } ?>
        </div>
    </div>
</div>
<?php } ?>