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

    <div class="row"><?php echo $column_left; ?>
        <?php if ($column_left && $column_right) { ?>
        <?php $class = 'col-sm-6'; ?>
        <?php } elseif ($column_left || $column_right) { ?>
        <?php $class = 'col-sm-9'; ?>
        <?php } else { ?>
        <?php $class = 'col-sm-12'; ?>
        <?php } ?>
        <div id="content" class="<?php echo $class; ?>"  itemscope itemtype="http://schema.org/Product">
            <?php echo $content_top; ?>
            <div class="row">
                <?php if ($column_left && $column_right) { ?>
                <?php $class = 'col-sm-6 col-xs-12'; ?>
                <?php } elseif ($column_left || $column_right) { ?>
                <?php $class = 'col-sm-6 col-xs-12'; ?>
                <?php } else { ?>
                <?php $class = 'col-sm-4 col-xs-12'; ?>
                <?php } ?>
                <div class="<?php echo $class; ?>">
                    <div class="loader">
                        <img src="image/loading_spinner.gif"/>
                    </div>
                    <?php if ($thumb || $images) { ?>
                    <div class="big-product-slider gallery">
                        <?php if ($thumb) { ?>
                        <div>
                            <a class="img-popup" href="<?php echo $thumb; ?>" data-effect="mfp-zoom-in">
                                <img src="<?php echo $thumb; ?>"
                                     title="<?php echo $heading_title; ?>"
                                     alt="<?php echo $heading_title; ?>"
                                     data-zoom-image="<?php echo $thumb; ?>"/></a>

                        </div>
                        <?php } ?>
                        <?php if ($images) { $i = 1;  ?>
                        <?php foreach ($images as $image) { ?>
                        <div>
                            <a class="img-popup" href="<?php echo $image['thumb']; ?>" data-effect="mfp-zoom-in"><img
                                        src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>"
                                        alt="<?php echo $heading_title; ?>"
                                        data-zoom-image="<?php echo $image['thumb']; ?>"/></a>

                        </div>
                        <?php $i++; } ?>
                        <?php } ?>
                    </div>

                    <div id="succes-popup" class="white-popup" style="display:none">
                        <!--<div><?php /*echo $text_thank_to_call; */?></div>-->
                    </div>

                    <div id="image-popup-0" class="no-bg-popup mfp-with-anim mfp-hide">
                        <div class="big-product-slider-2">
                            <div>
                                <img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>"
                                     alt="<?php echo $heading_title; ?>"/>
                            </div>
                            <?php if ($images) { $i = 1;  ?>
                            <?php foreach ($images as $image) { ?>
                            <div>
                                <img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>"
                                     alt="<?php echo $heading_title; ?>"/>
                            </div>
                            <?php $i++; } ?>
                            <?php } ?>
                        </div>
                    </div>
                    <div class="small-product-slider">
                        <?php if ($thumb) { ?>
                        <div>
                            <img itemprop="image" src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>"
                                 alt="<?php echo $heading_title; ?>"/>
                        </div>
                        <?php } ?>
                        <?php if ($images) { ?>
                        <?php foreach ($images as $image) { ?>
                            <div>
                                <img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>"
                                     alt="<?php echo $heading_title; ?>"/>
                            </div>
                        <?php } ?>
                        <?php } ?>
                    </div>
                    <div class="shares-to-frends">
                        <div class="rating" itemprop="aggregateRating" itemscope itemtype="http://schema.org/AggregateRating">
                            <p>
                                <?php for ($i = 1; $i <= 5; $i++) { ?>
                                <?php if ($rating < $i) { ?>
                                <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
                                <?php } else { ?>
                                <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
                                <?php } ?>
                                <?php } ?>
                                <a class="rating-ref"><?php echo $reviews; ?></a>
                                <meta itemprop="ratingValue" content="<?= $rating ?>"/>
                                <meta itemprop="reviewCount" content="<?= preg_replace('/[^\d]/ui', '', $reviews) ?>"/>
                                <meta itemprop="worstRating" content="0">
                                <meta itemprop="bestRating" content="5">
                            </p>
                        </div>
                        <script type="text/javascript" src="//yastatic.net/share/share.js" charset="utf-8"></script>
                        <div class="yashare-auto-init" data-yashareL10n="ru" data-yashareType="none"
                             data-yashareQuickServices="facebook,gplus"></div>
                    </div>


                    <?php } ?>

                </div>
                <?php if ($column_left && $column_right) { ?>
                <?php $class = 'col-sm-6 col-xs-12'; ?>
                <?php } elseif ($column_left || $column_right) { ?>
                <?php $class = 'col-sm-6 col-xs-12'; ?>
                <?php } else { ?>
                <?php $class = 'col-sm-8 col-xs-12'; ?>
                <?php } ?>
                <div class="<?php echo $class; ?>">
                    <div class="product-info">
                        <div class='col-lg-8 col-md-12'>
                        <h1 itemprop="name"><?= empty($h1) ? $heading_title : $h1 ?></h1>

                        <ul class="list-unstyled">
                            <?php if ($manufacturer) { ?>
                            <li itemprop="brand" itemscope itemtype="http://schema.org/Brand"><?php echo $text_manufacturer; ?>
                                <a href="<?php echo $manufacturers; ?>" itemprop="name" content="<?= $manufacturer; ?>"><?= $manufacturer; ?></a>
                            </li>
                            <?php } ?>
                            <?php if ($sku) { ?>
                            <li><?php echo $text_model; ?> <span itemprop="model"><?php echo $sku; ?></span></li>
                            <?php } ?>
                            <li>
                                <?php if (!is_numeric($stock)) { ?>
                                    <div class="make_order">
                                        <a href="<?php echo $link_make_order?>"><i class="fa fa-hand-o-right"></i><?php echo $button_make_order?></a>
                                    </div>
                                <?php } ?>
                            </li>
                        </ul>
                        <?php if ($price) { ?>
                        <?php
                            $price = preg_split('/\s+/ui', $price);
                            if ($special) {
                              $special = preg_split('/\s+/ui', $special);
                            }
                        ?>
                        <div class="product-price" itemprop="offers" itemscope="" itemtype="http://schema.org/Offer">
                            <div class="instock" itemprop="availability" href="http://schema.org/InStock" >В наличии</div>
                            <?php if (!$special) { ?>
                            <div class="price-wrap">
                                <span><?php echo $text_price;?></span>
                                <?php if ($lower_price) { ?>
                                  <s><?= $lower_price; ?></s>
                                <?php } ?>
                                <span class="new-price">
                                  <b itemprop="price">
                                    <?= $price[0]; ?>
                                  </b>
                                  <b itemprop="priceCurrency" content="UAH">
                                    <?= $price[1]; ?>
                                  </b>
                                </span>
                                <div class="unit"><span>/</span><span><?= $unit ?></span></div>
                                <input type="hidden" name="new-price" value="<?php echo $price[0] ?>">
                            </div>
                            <?php } else { ?>
                            <div class="price-wrap">
                                <span class="title"><?php echo $text_price;?></span>
                                <span class="old-price"><?= $price[0] . ' ' . $price[1]; ?></span>
                                <span class="new-price">
                                  <b itemprop="price">
                                    <?= $special[0]; ?>
                                  </b>
                                  <b itemprop="priceCurrency" content="UAH">
                                    <?= $special[1]; ?>
                                  </b>
                                </span>
                                <div class="unit"><span>/</span><span><?= $unit ?></span></div>
                                <input type="hidden" name="new-price" value="<?= $special[0] ?>">

                                <?php if($special) { ?>
                                <span class="discount"><?php echo $discount_percent;?>%</span>
                                <?php } ?>
                            </div>
                            <?php } ?>
                            <?php if ($tax) { ?>
                            <div class="price-wrap">
                                <?php echo $text_tax; ?> <?php echo $tax; ?>
                            </div>
                            <?php } ?>
                            <?php if ($points) { ?>
                            <div class="price-wrap">
                                <?php echo $text_points; ?> <?php echo $points; ?>
                            </div>
                            <?php } ?>
                            <?php if ($discounts) { ?>
                            <?php foreach ($discounts as $discount) { ?>
                            <div class="price-wrap">
                                <?php echo $discount['quantity']; ?><?php echo $text_discount; ?><?php echo $discount['price']; ?>
                            </div>
                            <?php } ?>
                            <?php } ?>

                            <div class="product-btn-group">
                                <button class="add-to-cart <?php if (!is_numeric($stock)) { ?> disabled <?php } ?>" <?php if (!is_numeric($stock)) { ?> disabled <?php } ?>
                                        type="button" id="button-cart"
                                        data-loading-text="<?php echo $text_loading; ?>"
                                        class="btn btn-primary">
                                    <span>
                                        <div><i class="fa fa-shopping-cart"></i><i style="<?php echo $in_cart ? '':'display:none'; ?>" class="fa fa-check-circle"></i></div>
                                        <div><?= is_numeric($stock) ? ($in_cart ? 'В корзине' : $button_cart) : $button_cart_disable ?></div>
                                    </span>
                                </button>
                                <div class="buy-1-click">
                                    <!--<p><?php /*echo $text_buy_one_click; */?></p>-->
                                    <span>
                                        <div><img src="image/pointer.png" alt="pointer"></div>
                                        <div><?php echo $text_buy_one_click; ?></div>
                                    </span>
                                    <div class="modal-wrap">
                                        <p><?php echo $text_callback_you; ?></p>
                                        <input id="callback_input_phone_product" name="phone" type="phone" />
                                        <input type="hidden" value="<?php echo $spec_link; ?>" name="product">
                                        <a class="thank-to-call"><input id="callback_input_submit_product" type="submit" value="<?php echo $text_waiting_btn?>" class="btn btn-primary" /></a>
                                        <i class="fa fa-times"></i>
                                        <p class="phone-alert"></p>
                                    </div>
                                    <div class="hidden" id="oneclick_success"><?= $text_success_oneclick_order ?></div>
                                </div>
                            </div>
                        </div>

                        <div class="product-to-do">
                            <div class="product-btn-group">
                                <button type="button" data-toggle="tooltip" class="btn btn-default"
                                        title="<?php echo $button_wishlist; ?>"
                                        onclick="wishlist.add('<?php echo $product_id; ?>', this);">
                                    <i class="fa fa-heart"></i></button>
                                <button type="button" data-toggle="tooltip" class="btn btn-default"
                                        title="<?php echo $button_compare; ?>"
                                        onclick="compare.add('<?php echo $product_id; ?>', this);">
                                    <?php if($in_compared) echo '<i class="fa fa-check-square"></i>'; else echo '<i class="fa fa-exchange" aria-hidden="true"></i>'; ?></button>
                                <div class="form-group">
                                </div>
                                <input type="hidden" name="product_id" value="<?php echo $product_id; ?>"/>
                                <input type="hidden" name="quantity" value="1"/>
                            </div>
                        </div>
                        <div class="clear"></div>


                        <?php if ($attribute_groups) { $i = 0; ?>
                          <?php foreach ($attribute_groups as $attribute_group) { ?>
                            <?php foreach ($attribute_group['attribute'] as $attribute) { $i++;
                              if($i < 4) { ?>
                                <div class="attribute-info"><b><?php echo $attribute['name']; ?></b>
                                    <span><?php echo $attribute['text']; ?></span>
                                </div>
                              <?php
                              }
                            }
                          }
                        } ?>
                        
                        <?php if ($options) { ?>
                        <?php foreach ($options as $option) { ?>
                        <?php if ($option['type'] == 'select') { ?>
                        <div class="select-option form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                            <label class="control-label"
                                   for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                            <select name="option[<?php echo $option['product_option_id']; ?>]"
                                    id="input-option<?php echo $option['product_option_id']; ?>">
                                <option value=""><?php echo $text_select; ?></option>
                                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                                <option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                                    <?php if ($option_value['price']) { ?>
                                    (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                                    <?php } ?>
                                </option>
                                <?php } ?>
                            </select>
                        </div>
                        <?php } ?>
                        <?php if ($option['type'] == 'radio') { ?>
                        <form>
                            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                                <label class="control-label"><?php echo $option['name']; ?></label>

                                <div id="input-option<?php echo $option['product_option_id']; ?>">
                                    <?php foreach ($option['product_option_value'] as $option_value) { ?>
                                    <div class="radio">
                                        <label>
                                            <input type="radio"
                                                   name="option[<?php echo $option['product_option_id']; ?>]"
                                                   value="<?php echo $option_value['product_option_value_id']; ?>"/>
                                            <?php echo $option_value['name']; ?>
                                            <?php if ($option_value['price']) { ?>
                                            (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>
                                            )
                                            <?php } ?>
                                        </label>
                                    </div>
                                    <?php } ?>
                                </div>
                            </div>
                        </form>
                        <?php } ?>
                        <?php if ($option['type'] == 'checkbox') { ?>
                        <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                            <label class="control-label"><?php echo $option['name']; ?></label>

                            <div id="input-option<?php echo $option['product_option_id']; ?>">
                                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox"
                                               name="option[<?php echo $option['product_option_id']; ?>][]"
                                               value="<?php echo $option_value['product_option_value_id']; ?>"/>
                                        <?php echo $option_value['name']; ?>
                                        <?php if ($option_value['price']) { ?>
                                        (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>
                                        )
                                        <?php } ?>
                                    </label>
                                </div>
                                <?php } ?>
                            </div>
                        </div>
                        <?php } ?>
                        <?php if ($option['type'] == 'image') { ?>
                        <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                            <label class="control-label"><?php echo $option['name']; ?></label>

                            <div id="input-option<?php echo $option['product_option_id']; ?>">
                                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]"
                                               value="<?php echo $option_value['product_option_value_id']; ?>"/>
                                        <img src="<?php echo $option_value['image']; ?>"
                                             alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>"
                                             class="img-thumbnail"/> <?php echo $option_value['name']; ?>
                                        <?php if ($option_value['price']) { ?>
                                        (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>
                                        )
                                        <?php } ?>
                                    </label>
                                </div>
                                <?php } ?>
                            </div>
                        </div>
                        <?php } ?>
                        <?php if ($option['type'] == 'text') { ?>
                        <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                            <label class="control-label"
                                   for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                            <input type="text" name="option[<?php echo $option['product_option_id']; ?>]"
                                   value="<?php echo $option['value']; ?>" placeholder="<?php echo $option['name']; ?>"
                                   id="input-option<?php echo $option['product_option_id']; ?>" class="form-control"/>
                        </div>
                        <?php } ?>
                        <?php if ($option['type'] == 'textarea') { ?>
                        <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                            <label class="control-label"
                                   for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                <textarea name="option[<?php echo $option['product_option_id']; ?>]" rows="5"
                          placeholder="<?php echo $option['name']; ?>"
                          id="input-option<?php echo $option['product_option_id']; ?>"
                          class="form-control"><?php echo $option['value']; ?></textarea>
                        </div>
                        <?php } ?>
                        <?php if ($option['type'] == 'file') { ?>
                        <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                            <label class="control-label"><?php echo $option['name']; ?></label>
                            <button type="button" id="button-upload<?php echo $option['product_option_id']; ?>"
                                    data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default btn-block">
                                <i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
                            <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value=""
                                   id="input-option<?php echo $option['product_option_id']; ?>"/>
                        </div>
                        <?php } ?>
                        <?php if ($option['type'] == 'date') { ?>
                        <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                            <label class="control-label"
                                   for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>

                            <div class="input-group date">
                                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]"
                                       value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD"
                                       id="input-option<?php echo $option['product_option_id']; ?>"
                                       class="form-control"/>
                <span class="input-group-btn">
                <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                </span></div>
                        </div>
                        <?php } ?>
                        <?php if ($option['type'] == 'datetime') { ?>
                        <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                            <label class="control-label"
                                   for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>

                            <div class="input-group datetime">
                                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]"
                                       value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD HH:mm"
                                       id="input-option<?php echo $option['product_option_id']; ?>"
                                       class="form-control"/>
                <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
                        </div>
                        <?php } ?>
                        <?php if ($option['type'] == 'time') { ?>
                        <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                            <label class="control-label"
                                   for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>

                            <div class="input-group time">
                                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]"
                                       value="<?php echo $option['value']; ?>" data-date-format="HH:mm"
                                       id="input-option<?php echo $option['product_option_id']; ?>"
                                       class="form-control"/>
                <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span>
                            </div>
                        </div>
                        <?php } ?>
                        <?php } ?>
                        <?php } ?>
                        <?php if ($recurrings) { ?>
                        <hr>
                        <h3><?php echo $text_payment_recurring ?></h3>

                        <div class="form-group required">
                            <select name="recurring_id">
                                <option value=""><?php echo $text_select; ?></option>
                                <?php foreach ($recurrings as $recurring) { ?>
                                <option value="<?php echo $recurring['recurring_id'] ?>"><?php echo $recurring['name'] ?></option>
                                <?php } ?>
                            </select>

                            <div class="help-block" id="recurring-description"></div>
                        </div>
                        <?php } ?>

                        <div>
                        </div>
                        <?php if ($minimum > 1) { ?>
                        <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $text_minimum; ?>
                        </div>
                        <?php } ?>
                        <?php } ?>
                            <?php if ($text_minimal_price) { ?>
                            <p class="minimal-order"><?php echo $text_minimal_price; ?></p>
                            <?php } ?>
                        </div>
                        <div class="col-sm-4 col-xs-12 delivery-pay-popup-wrap similar-responce">
                            <div class="delivery-pay-popup">
                                <h4><b>Доставка</b></h4>
                                <ul  style="margin-bottom: 0">
                                    <li>Курьерскими службами:</li>
                                    </ul>
                                        <img width="100"  alt="Доставка строительных материалов Новой Почтой" src="/image/catalog/Info/NewPost/nave-poshta.png">
                                        <img width="100"  alt="Купить стройматериалы с доставкой Интайм" src="/image/catalog/Info/NewPost/intime.png">
                                        <img width="100"  alt="Стройматериалы с доставкой Деливери по Украине" src="/image/catalog/Info/NewPost/delivery.png">
                                        <img width="100"  alt="Интернет магазин строительных и отделочных материалов с доставкой Мист-экспресс" src="/image/catalog/Info/NewPost/meest-express.png">
                                <ul style="padding-top: 2px;">
                                    <li>Курьером budsite в Одессе и  Киеву</li>
                                    <li>Самовывоз в Одессе, Киеве и Днепре</li>
                                </ul>
                                <h4><b>Способы оплаты:</b></h4>
                                <ul>
                                    <li>Перевод на карту ПриватБанка</li>
                                    <li>Оплата наличными при получении</li>
                                    <li>Курьеру budsite в Одессе</li>
                                    <li>Безналичный расчет</li>
                                </ul>
                                <img width="220" src="/image/catalog/Info/cards.png">
                            </div>
                        </div>
                    </div>
                </div>
                <div id="product" class="col-sm-12 col-xs-12">
                    <div class="tabs-wrap">
                        <div class="nav-tabs-wrap">
                            <ul class="nav nav-tabs">
                                <li class="active">
                                    <a href="#tab-specification" data-toggle="tab"><?php echo $tab_attribute; ?></a>
                                </li>
                                <?php if ($images_slider) { ?>
                                <li>
                                    <a href="#tab-photo-slider" data-toggle="tab" class="slick-start"><?php echo $tab_slider; ?></a>
                                </li>
                                <?php } ?>
                                <?php if ($review_status) { ?>
                                <li><a href="#tab-review" data-toggle="tab"><?php echo $tab_review; ?></a></li>
                                <?php } ?>
                                <?php if ($analogs) { ?>
                                <li>
                                    <a href="#tab-related" data-toggle="tab"
                                       class="slick-start"><?php echo $text_analogs; ?></a>
                                </li>
                                <?php } ?>
                            </ul>
                            <div class="clear"></div>
                        </div>
                        <div class="tab-content">
                            <div class="tab-pane active" id="tab-specification">
                                <?php if ($attribute_groups) { ?>
                                <table class="table">
                                    <?php foreach ($attribute_groups as $attribute_group) { ?>
                                    <thead>
                                    <tr>
                                        <td colspan="2"><strong><?php echo $attribute_group['name']; ?></strong></td>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
                                    <tr>
                                        <td><?php echo $attribute['name']; ?></td>
                                        <td><?php echo $attribute['text']; ?></td>
                                    </tr>
                                    <?php } ?>
                                    </tbody>
                                    <?php } ?>
                                </table>
                                <div class="desc product-description-field" itemprop="description">
                                  <?php echo $description; ?>
                                </div>
                                <?php } ?>
                                <div class="clear"></div>
                            </div>
                            <?php if ($review_status) { ?>
                            <div class="tab-pane" id="tab-review">
                                <form class="form-horizontal">
                                    <div id="review"></div>
                                    <div class="review-btn btn btn-primary"><?php echo $text_write; ?></div>
                                    <div class="review-drop">
                                    <?php if ($review_guest) { ?>
                                    <div class="form-group required">
                                        <div class="col-sm-12">
                                            <label class="control-label"
                                                   for="input-name"><?php echo $entry_name; ?></label>
                                            <input type="text" name="name" value="" id="input-name"
                                                   class="form-control"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-6">
                                            <label class="control-label"
                                                   for="input-plus"><?php echo $entry_plus; ?></label>
                                            <textarea name="plus" rows="5" value="" id="input-plus"
                                                   class="form-control"></textarea>
                                        </div>
                                        <div class="col-sm-6">
                                            <label class="control-label"
                                                   for="input-minus"><?php echo $entry_minus; ?></label>
                                            <textarea name="minus" rows="5" value="" id="input-minus"
                                                   class="form-control"></textarea>
                                        </div>
                                    </div>

                                    <div class="form-group required">
                                        <div class="col-sm-12">
                                            <label class="control-label"
                                                   for="input-review"><?php echo $entry_review; ?></label>
                                            <textarea name="text" rows="5" id="input-review"
                                                      class="form-control"></textarea>

                                            <div class="help-block"><?php echo $text_note; ?></div>
                                        </div>
                                    </div>
                                    <div class="form-group required">
                                        <div class="col-sm-4">
                                            <label class="control-label"><?php echo $entry_rating; ?></label>
                                            &nbsp;&nbsp;&nbsp; <?php echo $entry_bad; ?>&nbsp;
                                            <input type="radio" name="rating" value="1" id="rating-1"/><label
                                                    for="rating-1"></label>
                                            &nbsp;
                                            <input type="radio" name="rating" value="2" id="rating-2"/><label
                                                    for="rating-2"></label>
                                            &nbsp;
                                            <input type="radio" name="rating" value="3" id="rating-3"/><label
                                                    for="rating-3"></label>
                                            &nbsp;
                                            <input type="radio" name="rating" value="4" id="rating-4"/><label
                                                    for="rating-4"></label>
                                            &nbsp;
                                            <input type="radio" name="rating" value="5" id="rating-5"/><label
                                                    for="rating-5"></label>
                                            &nbsp;<?php echo $entry_good; ?>
                                        </div>
                                        <div class="col-sm-8">
                                            <label class="control-label"
                                                   for="input-captcha"><?php echo $entry_captcha; ?></label>
                                            <input type="text" name="captcha" value="" id="input-captcha"
                                                   class="form-control"/>
                                           <img src="index.php?route=tool/captcha" alt="" id="captcha"/>
                                        </div>
                                    </div>
                                    <div class="buttons">
                                        <div class="pull-right">
                                            <button type="button" id="button-review"
                                                    data-loading-text="<?php echo $text_loading; ?>"
                                                    class="btn btn-primary"><?php echo $button_send; ?></button>
                                        </div>
                                    </div>
                                    <?php } else { ?>
                                    <?php echo $text_login; ?>
                                    <?php } ?>
                                    </div>
                                </form>
                            </div>
                            <?php } ?>
                            <?php if ($analogs) { ?>
                            <div class="tab-pane slick-slider-related" id="tab-related">
                                <?php foreach ($analogs as $product) { ?>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="product-thumb transition " data-brand="<?= $product['brand'] ?>" data-category="<?= $product['category'] ?>">
                                        <div class="image">
                                            <a href="<?php echo $product['href']; ?>">
                                                <div class="img-wrap">
                                                    <img src="<?php echo $product['thumb']; ?>"
                                                         alt="<?php echo $product['name']; ?>"
                                                         title="<?php echo $product['name']; ?>"
                                                         class="img-responsive"/>
                                                    <?php if($product['latest_label']) { ?>
                                                    <div class="<?php echo $product['latest_label'];?>"></div>
                                                    <?php } ?>
                                                    <?php if($product['specials_label']) { ?>
                                                    <div class="<?php echo $product['specials_label'];?>"></div>
                                                    <?php } ?>
                                                    <!-- or class="orange-procent"-->
                                                </div>
                                            </a>
                                        </div>
                                        <div class="caption">
                                            <p class="name">
                                                <a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                                            </p>
                                            <?php if ($product['price']) { ?>
                                            <p class="price">
                                                <?php if (!$product['special']) { ?>
                                                <?php echo $product['price']; ?>
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
                                        <button class="add-to-cart" type="button"
                                                onclick="cart.add('<?php echo $product['product_id']; ?>', 1, this);">
                                            <span><i class="fa fa-shopping-cart"></i><?php echo $button_cart; ?></span>
                                        </button>
                                        <div class="tooltips">
                                            <button type="button" data-toggle="tooltip"
                                                    title="<?php echo $button_wishlist; ?>"
                                                    onclick="wishlist.add('<?php echo $product['product_id']; ?>', this);">
                                                <i class="fa fa-heart"></i></button>
                                            <button type="button" data-toggle="tooltip"
                                                    title="<?php echo $button_compare; ?>"
                                                    onclick="compare.add('<?php echo $product['product_id']; ?>', this);">
                                                <i class="fa fa-exchange"></i></button>
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
                            <?php } if($images_slider) { ?>
                            <div class="tab-pane " id="tab-photo-slider">
                                <div class="slick-slider-related">
                                    <?php foreach($images_slider as $slider) { ?>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="product-thumb transition ">
                                            <div class="image">
                                                <div class="img-wrap">
                                                    <a data-effect="mfp-zoom-in" href="<?php echo $slider['thumb']; ?>"><img class="img-responsive" src="<?php echo $slider['thumb']; ?>" title="<?php echo $heading_title; ?>"
                                                     alt="<?php echo $heading_title; ?>"/></a>
                                                </div>
                                            </div>
                                         </div>
                                    </div>
                                    <?php } ?>
                                </div>
                            </div>
                            <?php } ?>
                        </div>
                    </div>



                    <?php if ($products) { ?>
                    <div class="related" style="clear: both">
                        <div class="title-wrap-bord">
                            <a class="title-module"><span><?php echo $text_related;?></span></a>
                        </div>
                        <div class="slick-slider">
                            <?php foreach ($products as $product) { ?>
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="product-thumb transition" data-brand="<?= $product['brand'] ?>" data-category="<?= $product['category'] ?>">
                                    <div class="image">
                                        <a href="<?php echo $product['href']; ?>">
                                            <div class="img-wrap">
                                                <img src="<?php echo $product['thumb']; ?>"
                                                     alt="<?php echo $product['name']; ?>"
                                                     title="<?php echo $product['name']; ?>" class="img-responsive"/>

                                                <div class="<?= empty($product['label']) ? '' : $product['label'] ?>"></div>
                                                <!-- or class="orange-procent"-->
                                            </div>
                                        </a>
                                    </div>
                                    <div class="caption">
                                        <p class="name">
                                            <a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                                        </p>
                                        <?php if ($product['price']) { ?>
                                        <p class="price">
                                            <?php if (!$product['special']) { ?>
                                            <?php echo $product['price']; ?>
                                            <?php } else { ?>
                                            <span class="price-new"><?php echo $product['special']; ?></span>
                                            <span class="price-old"><?php echo $product['price']; ?></span>
                                            <?php } ?>
                                            <?php if ($product['tax']) { ?>
                                            <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
                                            <?php } ?>
                                        </p>
                                        <?php } ?>
                                    </div>
                                    <button class="add-to-cart" type="button"
                                            onclick="cart.add('<?php echo $product['product_id']; ?>', 1, this);">
                                        <span><i class="fa fa-shopping-cart"></i><?php echo $button_cart; ?></span>
                                    </button>
                                    <div class="tooltips">
                                        <button type="button" data-toggle="tooltip"
                                                title="<?php echo $button_wishlist; ?>"
                                                onclick="wishlist.add('<?php echo $product['product_id']; ?>', this);">
                                            <i class="fa fa-heart"></i></button>
                                        <button type="button" data-toggle="tooltip"
                                                title="<?php echo $button_compare; ?>"
                                                onclick="compare.add('<?php echo $product['product_id']; ?>', this);">
                                            <i class="fa fa-exchange"></i></button>
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
                    <?php } ?>
                </div>
            </div>
        </div>
        <div class="clear"></div>
        <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>

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

</div>

<script type="text/javascript">
    $("#callback_input_submit_product").on('click', function() {
        $('#error_phone_in_callback').remove();
        const phone_value = $('input[name="phone"]').val();
        if(!phone_value || phone_value.match(/\d/g).length!==10) {
            $('.modal-wrap p.phone-alert').text('Введите корректный номер!').fadeIn().delay(3000).fadeOut();
            return;
        }
        $.ajax({
            type: "POST",
            url: "index.php?route=module/catapulta/write",
            data: $('input[name=\'phone\'], input[name=\'product\'], input[name=\'new-price\']'),
            success: function(response) {
                var json = JSON.parse(response);
                if (json['error']) {
                    $('.modal-wrap').append($('<p>' + json['error']['contact'] + '</p>').fadeIn().delay(3000).fadeOut());
                    return;
                }
                    dataLayer.push({'event': 'buyonclick'});
                console.log(json['link']);
                    $('#succes-popup').load(json['link']);
                    var el = $('#succes-popup').show();
                    $.magnificPopup.open({
                        items: {
                            src: el
                        },
                        type: 'inline',
                        callbacks: {
                            close: function() {
                                $('.modal-wrap').hide();
                            }
                        }
                    });

            }
        });
    })
</script>

<script type="text/javascript"><!--
    $('select[name=\'recurring_id\'], input[name="quantity"]').change(function () {
        $.ajax({
            url: 'index.php?route=product/product/getRecurringDescription',
            type: 'post',
            data: $('input[name=\'product_id\'], input[name=\'quantity\'], select[name=\'recurring_id\']'),
            dataType: 'json',

            success: function (json) {
                $('.alert, .text-danger').remove();

                if (json['success']) {
                    $('#recurring-description').html(json['success']);
                }
            }
        });
    });
    $('.show-size-info-popup').on('click', function () {
        $('.size-info-popup').load('<?php echo $link_load_sizes;?>')
    });

    //--></script>
<script type="text/javascript"><!--
    $('#button-cart').on('click', function () {
        $.ajax({
            url: 'index.php?route=checkout/cart/add',
            type: 'post',
            data: $('.product-info input[type=\'text\'], .product-info input[type=\'hidden\'], .product-info input[type=\'radio\']:checked, .product-info input[type=\'checkbox\']:checked, .product-info select, .product-info textarea'),
            dataType: 'json',

            success: function (json) {
                $('.alert, .text-danger').remove();
                $('.form-group').removeClass('has-error');

                if (json['error']) {
                    if (json['error']['option']) {
                        for (i in json['error']['option']) {
                            var element = $('#input-option' + i.replace('_', '-'));

                            if (element.parent().hasClass('input-group')) {
                                element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
                            } else {
                                element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
                            }
                        }
                    }

                    if (json['error']['recurring']) {
                        $('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
                    }

                    // Highlight any found errors
                    $('.text-danger').parent().addClass('has-error');
                }

                if (json['success']) {
                    $('.breadcrumb').after('<div class="alert alert-success">' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

                    $('#cart-total').html(json['total']);

                    $('html, body').animate({scrollTop: 0}, 'slow');
                    $('#cart > ul').load('index.php?route=common/cart/info ul li');

                    $('#cart').addClass("open");

                    $('#button-cart span div:eq(1)').text('В корзине');
                    $('#button-cart span div:eq(0) i:eq(1)').show();

                    $('#cart .dropdown-menu').css({"opacity":"1"});

                    setTimeout(function () {

                        $('#cart .dropdown-menu').animate({
                            opacity: 0
                        },2000);
                        setTimeout(function () {
                            $('#cart').removeClass("open");
                            $('#cart .dropdown-menu').css({opacity:"1"});
                        }, 2100);
                    }, 3000);
                }
            }
        });

    });
    //--></script>

<script type="text/javascript"><!--
  $(window).on("load", function () {
      $('.date').datetimepicker({
          pickTime: false
      });

      $('.datetime').datetimepicker({
          pickDate: true,
          pickTime: true
      });

      $('.time').datetimepicker({
          pickDate: false
      });
  });

  $(function(){
        $('button[id^=\'button-upload\']').on('click', function () {
        var node = this;

        $('#form-upload').remove();

        $('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

        $('#form-upload input[name=\'file\']').trigger('click');

        timer = setInterval(function () {
            if ($('#form-upload input[name=\'file\']').val() != '') {
                clearInterval(timer);

                $.ajax({
                    url: 'index.php?route=tool/upload',
                    type: 'post',
                    dataType: 'json',
                    data: new FormData($('#form-upload')[0]),
                    cache: false,
                    contentType: false,
                    processData: false,
                    beforeSend: function () {
                        $(node).button('loading');
                    },

                    success: function (json) {
                        $('.text-danger').remove();

                        if (json['error']) {
                            $(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
                        }

                        if (json['success']) {
                            alert(json['success']);

                            $(node).parent().find('input').attr('value', json['code']);
                        }
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                    }
                });
            }
        }, 500);
    });
  });
    //--></script>
<script type="text/javascript"><!--
    $('#review').delegate('.pagination a', 'click', function (e) {
        e.preventDefault();

        $('#review').fadeOut('slow');

        $('#review').load(this.href);

        $('#review').fadeIn('slow');
    });

    $('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

    $('#button-review').on('click', function () {
        $('#button-review').button('loading');
        $.ajax({
            url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
            type: 'post',
            dataType: 'json',
            data: 'name=' + encodeURIComponent($('input[name=\'name\']').val()) + '&text=' + encodeURIComponent($('textarea[name=\'text\']').val()) +
            '&plus=' + encodeURIComponent($('#input-plus').val()) + '&minus=' + encodeURIComponent($('#input-minus').val()) +
            '&rating=' + encodeURIComponent($('input[name=\'rating\']:checked').val() ? $('input[name=\'rating\']:checked').val() : '') +
            '&captcha=' + encodeURIComponent($('input[name=\'captcha\']').val()),
            complete: function () {
                $('#captcha').attr('src', 'index.php?route=tool/captcha#' + new Date().getTime());
                $('input[name=\'captcha\']').val('');
                $('#button-review').button('reset');
            },
            success: function (json) {
                $('.alert-success, .alert-danger').remove();

                if (typeof json['error'] != "undefined") {
                    $('#review').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
                }

                if (typeof json['success'] != "undefined") {
                    $('#review').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

                    $('input[name=\'name\']').val('');
                    $('textarea[name=\'text\']').val('');
                    $('input[name=\'rating\']:checked').prop('checked', false);
                    $('input[name=\'captcha\']').val('');
                }
            }
        });
    });

    $(document).ready(function () {
        $('.thumbnails').magnificPopup({
            type: 'image',
            delegate: 'a',
            gallery: {
                enabled: true
            }
        });
        /*$('.thank-to-call').magnificPopup({
            removalDelay: 500, //delay removal by X to allow out-animation
            callbacks: {
                beforeOpen: function() {
                    this.st.mainClass = this.st.el.attr('data-effect');
                },
                close: function(){
                    $(".modal-wrap .fa-times").click();
                }
            },
            midClick: true
        });*/
    });
    //--></script>

    <script>dataLayer.push({'event': 'idcompl'}, {'idcompl': '<?php echo $sku; ?>'});</script>

    <script>
      /**
      * Обработка событий расширенной торговли в карточке товара
      */
      $(function(){

        /* Событие productDetails в карточке товара */
        EEProcessor.productDetails([getMainProduct()]);

        /* Событие AddToCart в карточке товара */
        $('#button-cart').click(function(){
          var product = getMainProduct();

          EEProcessor.addToCart([product]);
        });

        /* Событие addToCart в слайдерах страницы товара */
        $('.related .add-to-cart, #tab-related .add-to-cart').click(function () {
          var product = getProductFromProductPageSliders($(this).parents('div.product-thumb'));
          EEProcessor.addToCart([product]);
        });

        /* Событие productClick в слайдерах страницы товара */
        $('.related .product-thumb a, #tab-related .product-thumb a').click(function (e) {
          e.preventDefault();
          var product = getProductFromProductPageSliders($(this).parents('div.product-thumb'));
          product.list = "<?= $this->registry->get('request')->get['route'] ?>";
          var url = $(this).attr('href');
          EEProcessor.productClick([product], url);
        });

        /* Событие productImpressions в слайдере сопутствующих товаров */
        (function(){
          var products = [];
          $('.related .product-thumb').each(function(i, elem){
            $(elem).attr("data-list", "product/related");
            var product = getProductFromProductPageSliders($(elem));
            product.position = i+1; // должно начинаться с 1
            products.push(product);
          });
          console.log('/* Событие productImpressions в слайдере сопутствующих товаров */');
          if (products.length > 0) {
            EEProcessor.productImpressions(products);
          }
        })();

        /* Событие productImpressions в слайдере похожих товаров */
        $('[href="#tab-related"]').click(function(){
          var $this = $(this);
          if (!$this.data('impressionsSent')) {
            var products = [];
            $('#tab-related .product-thumb').each(function(i, elem){
              $(elem).attr("data-list", "product/similar");
              var product = getProductFromProductPageSliders($(elem));
              product.position = i+1; // должно начинаться с 1
              products.push(product);
            });
            console.log('/* Событие productImpressions в слайдере похожих товаров */');
            if (products.length > 0) {
              EEProcessor.productImpressions(products);
            }
            $this.data('impressionsSent', true);  // установить флаг что товары уже отправлены
          }
        });
      });

      /* Получить объект товара страницы */
      getMainProduct = function(){
        var product = {
            name: $('h1').text(),
            id: $('[name="product_id"]').val(),
            price: $('[name="new-price"]').val(),
            brand: $('.attribute-info').find(":contains(Бренд)").next().text().trim(),
            category: $('.breadcrumb li:last').prev().text().trim(),
            quantity: 1
          };
          product.list = 'product/product';

        return product;
      };

      /* Получить объект товара из слайдеров */
      getProductFromProductPageSliders = function($pItem){
        return {
          name: $pItem.find('.caption a').text(),
          id: $pItem.find('.add-to-cart').attr('onclick').replace(/[^\d]/gi, ''),
          price: $pItem.find('.caption p.price').text().replace(/[^\d\.]/gi, ''),
          brand: $pItem.data('brand'),
          category: $pItem.data('category'),
          list: $pItem.data('list') ? $pItem.data('list') : "product/common_slider"
        }
      };
    </script>
<?php echo $footer; ?>