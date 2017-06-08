<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
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
    <div id="content" class="<?php echo $class; ?> checkout"><?php echo $content_top; ?>
      <h1><?php echo $heading_title; ?></h1>
      <div class="row step-menu">
          <span class="active step-1"><?php echo $entry_contacts;?></span><span class="step-2"><?php echo $entry_payment_method;?></span>
      </div>
      <div class="col-md-6 col-sm-6 col-xs-12">
        <div class="checkout-field">
            <div class="menu-wrap account-menu">
                <div class="d-table">
                    <div class="d-table-cell active new-customer-btn">
                        <?php echo (!$logged)?$text_new_customer:$text_customer;?>
                    </div>

                    <?php if(!$logged) { ?>
                    <div class="d-table-cell already-buy-here-btn">
                        <?php echo $text_customer;?>
                    </div>
                    <?php } ?>
                </div>
            </div>

            <div class="form-wrap new-customer">
                <form>
                    <div class="form-group required">
                        <label class="col-lg-4 col-sm-12 control-label rfield" for="input-payment-firstname"><?php echo $entry_firstname;?></label>
                        <div class="col-lg-8 col-sm-12">
                          <input type="text" name="firstname" value="<?php print $firstname ? $firstname : (!empty($full_user_info['firstname']) ? $full_user_info['firstname'] : '');?>" id="input-payment-firstname" class="form-control" />
                        </div>
                    </div>
                    <div class="form-group required">
                        <label class="col-lg-4 col-sm-12 control-label rfield" for="input-payment-lastname"><?php echo $entry_lastname;?></label>
                        <div class="col-lg-8 col-sm-12">
                            <input type="text" name="lastname" value="<?php print $lastname ? $lastname : (!empty($full_user_info['lastname']) ? $full_user_info['lastname'] : '');?>" id="input-payment-lastname" class="form-control" />
                        </div>
                    </div>
                    <div class="form-group required">
                        <label class="col-lg-4 col-sm-12 control-label" for="input-payment-city"><?php echo $entry_city;?></label>
                        <div class="col-lg-8 col-sm-12">
                            <div class="search-wrap">
                                <input type="text" name="city" value="<?php echo $city?>" id="input-payment-city" class="form-control" value=""/>
                            </div>
                        </div>
                    </div>
                    <div class="form-group required">
                        <label class="col-lg-4 col-sm-12 control-label" for="input-payment-telephone"><?php echo $entry_telephone;?></label>
                        <div class="col-lg-8 col-sm-12">
                          <input type="text" name="telephone" value="<?php print $telephone ? $telephone : (!empty($full_user_info['telephone']) ? $full_user_info['telephone'] : '') ;?>" id="input-payment-telephone" class="form-control" />
                        </div>
                    </div>
                    <div class="form-group required">
                        <label class="col-lg-4 col-sm-12 control-label" for="input-payment-email"><?php echo $entry_email;?></label>
                        <div class="col-lg-8 col-sm-12">
                            <input type="text" name="email" value="<?php print $email ? $email : (!empty($full_user_info['email']) ? $full_user_info['email'] : '') ;?>" id="input-payment-email" class="form-control" />

                        </div>
                    </div>

                    <?php if (!$logged) { ?>
                    <div class="form-group">
                        <label class="col-lg-4 col-sm-12 control-label" for="input-payment-register"><?php echo $entry_register;?></label>
                        <div class="col-lg-8 col-sm-12">
                            <input type="checkbox" name="register" value="1" id="input-payment-register" class="form-control"/>
                        </div>
                    </div>
                    <?php } ?>

                    <div class="form-group required" style="clear:both;text-align:center">
                        <label class="col-lg-4 col-sm-12"></label>
                        <button type="button" id="" class="btn btn-primary next-btn register-continue"><i class="list-icon" aria-hidden="true"></i>Оформить заказ</button>
                    </div>
                </form>
                <div class="clear"></div>
            </div>
            <?php if(!$logged) { ?>
            <div class="form-wrap already-buy-here">
                <div id="login-errors" class="ajax-login-error"></div>
                <form action="javascript:void(null);" onsubmit="ajax_login_in_checkout()" method="post" enctype="multipart/form-data">
                  <div class="form-group">
                    <label class="col-sm-12 control-label" for="input-customer-email"><?php echo $entry_email;?></label>
                    <div class="col-sm-12">
                        <input type="text" name="email" value="<?php echo $email; ?>" placeholder="<?php echo $entry_email; ?>" id="input-customer-email" class="form-control" />
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-12 control-label" for="input-password"><?php echo $entry_password;?></label>
                    <div class="col-sm-12">
                        <input type="password" name="password" value="" placeholder="<?php echo $entry_password; ?>" id="input-password" class="form-control" />
                    </div>
                  </div>
                  <div class="clear"></div>
                  <div style="text-align:center" class="form-group form-control-field clearfix">
                    <input style="float:none" type="submit" value="<?php echo $button_login;?>" class="btn btn-primary next-btn" />
                    <a style="float:none" class="forgotten" href="#forgotten-popup" data-effect="mfp-zoom-in" onclick="forgottenLoad()"><i class="fa fa-key"></i><?php echo $entry_forgotten;?></a>
                    <div id="forgotten-popup" class="white-popup mfp-with-anim mfp-hide forgot-wrap">
                        <div class="forgotten-content"></div>
                    </div>
                  </div>

                </form>
            </div>
            <?php } ?>
        </div>
        <div class="clear"></div>

        <div class="pay-field">
            <div class="choose-delivery-field">
                <h3><?php echo $entry_new_post;?></h3>
                <form>
                <?php if ($shipping_methods) { ?>
                <?php foreach ($shipping_methods as $shipping_method) { ?>
                <?php if (!$shipping_method['error']) { ?>
                <?php foreach ($shipping_method['quote'] as $quote) { ?>
                <div class="radio">
                  <label>
                    <?php if ((isset($code) && $quote['code'] == $code) || !isset($code)) { ?>
                      <?php $code = $quote['code']; $explode = explode('.', $code); $class = $explode[0];?>
                      <input type="radio" name="shipping_method" value="<?php echo $quote['code']; ?>" class="<?php echo $class; ?>" checked="checked" />
                      <?php } else {
                      $explode = explode('.', $quote['code']); $class = $explode[0]; ?>
                      <input type="radio" name="shipping_method" value="<?php echo $quote['code']; ?>" class="<?php echo $class; ?>" />
                      <?php } ?>
                      <?php echo $quote['title']; ?> - <?php echo $quote['text']; ?></label>
                </div>
                <?php } ?>
                <?php } else { ?>
                <div class="alert alert-danger"><?php echo $shipping_method['error']; ?></div>
                <?php } ?>
                <?php } ?>
                <?php } ?>

                <div class="new_post_delivery_form">
                    <label class="col-sm-3 control-label" for="input-country-new-post"><?php echo $entry_city; ?></label>
                    <div class="col-sm-9">
                        <select name="config_country_id" id="input-country-new-post" onchange="getPoint(this.value)">
                            <?php foreach ($countries as $country) { ?>
                            <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
                            <?php } ?>
                        </select>
                    </div>
                    <label class="col-sm-3 control-label" for="input-point-new-post-styler"><?php echo $entry_point; ?></label>
                    <div class="col-sm-9">
                        <select name="config_point_id" id="input-point-new-post" onchange="setPoint(this.value)">
                            <?php foreach ($entry_points as $point) { ?>
                            <option value="<?php echo $point['name']?>"><?php echo $point['name']; ?></option>
                            <?php } ?>
                        </select>
                    </div>
                </div>

                <?php if ($delivery_methods_custom) { ?>
                <?php unset($code); ?>
                <?php foreach ($delivery_methods_custom as $delivery_method_custom) { ?>
                <div class="radio">
                    <?php if (strlen($delivery_method_custom) > 0) { ?>
                    <label>
                      <input type="radio" name="shipping_method" value="<?php echo str_replace($exp, '', $delivery_method_custom); ?>" />
                      <?php echo str_replace($exp, '', $delivery_method_custom) ?>
                    </label>
                    <?php } ?>
                </div>
                <?php } ?>
                <?php } ?>
                </form>

            </div>

          <div class="choose-delivery-field">
              <h3><?php echo $entry_payment;?></h3>
              <form>
                  <?php if ($payment_methods) { ?>
                  <?php unset($code); ?>
                    <?php foreach ($payment_methods as $payment_method) { ?>
                    <div class="radio">
                      <label>
                        <input type="radio" name="payment_method" value="<?php echo $payment_method['code']; ?>" />
                        <?php echo $payment_method['title']; ?>
                      </label>
                    </div>
                    <?php } ?>
                  <?php } ?>

                  <?php if ($payment_methods_custom) { ?>
                  <?php unset($code); ?>
                  <?php foreach ($payment_methods_custom as $payment_method_custom) { ?>
                    <?php if ($payment_method_custom) { ?>
                    <div class="radio">
                        <?php if (strlen($payment_method_custom) > 0) { ?>
                        <label>
                          <input type="radio" name="payment_method" value="<?php echo str_replace($exp, '',  $payment_method_custom); ?>" />
                          <?php echo str_replace($exp, '', $payment_method_custom) ?>
                        </label>
                        <?php } ?>
                    </div>
                    <?php } ?>
                  <?php } ?>
                  <?php } ?>
              </form>
              <!--<iframe id="kaznachey_frame" width="508" height="588" style="border: none;" src="https://kaznachey.ua/PaymentForm/ru-RU/MwA0ADcANwA4ACYAMgA4AGEANgBhADMAMAAwAGYANgA3AGUAZQA4ADcANQA0AGUAMAAwAGIAYgA1ADQANAA2ADcAZgAzADIANgBhAA=="></iframe>-->
          </div>

          <div class="form-group">
            <label class="col-lg-4 col-sm-12 control-label" for="textarea-payment-comment"><?php echo $entry_comment;?></label>
            <div class="col-lg-8 col-sm-12" style="clear: both">
              <div class="search-wrap">
                <textarea class="form-control" name="comment" id="textarea-payment-comment" cols="30" rows="7"></textarea>
              </div>
            </div>
          </div>

          <div class="form-group required" style="float: left">
            <button type="button" id=""  style="float: left"class="btn btn-primary next-btn delivery-continue"><?php echo $button_continue;?></button>
            <a href="#succes-popup" id="" class="btn btn-primary next-btn delivery-continue-popup" style="visibility: hidden" data-effect="mfp-zoom-in"><?php echo $button_continue;?></a>
            <div id="succes-popup" class="white-popup mfp-with-anim mfp-hide"></div>
          </div>
        </div>

      </div>

      <div class="col-md-6 col-sm-6 col-xs-12 checkout-cart">

        <div class="title"><?= $entry_order;?></div>

        <div class="cart-all-wrap">
            <?php if($total_discount) { ?>
            <div class="cart-all-row">
                <div class="text-left cart-all-title"><div><?= $text_total_discount;?></div></div>
                <div class="text-left cart-all-total"><?= $total_discount;?></div>
            </div>
            <div class="clear"></div>
            <?php } ?>
            <div class="cart-all-row">
                <?php foreach ($totals as $total) { ?>
                <div class="text-left cart-all-title"><div><?= $total['title']; ?></div></div>
                <div class="text-left cart-all-total total-total"><?= $total['text']; ?></div>
                <?php } ?>
            </div>
            <div class="clear"></div>
        </div>
        <div class="clear"></div>

          <div class="">
            <div class="d-table table">
              <?php foreach ($products as $product) { ?>
              <div class="d-table-row one-item">
                <div class="d-table-cell text-center cart-foto">
                  <a href="<?= $product['href'];?>">
                    <img src="<?= $product['image'];?>" alt="" title="" class="img-thumbnail" />
                  </a>
                </div>
                <div class="d-table-cell text-left cart-description">
                  <a href="<?= $product['href'];?>"><?= $product['name'];?></a>
                  <?php if ($product['option']) { ?>
                  <?php foreach ($product['option'] as $option) { ?>
                  <span class="atributes"><?= $option['name']; ?> <?= $option['value']; ?></span>
                  <?php } ?>
                  <?php } ?>
                  <div class="price-wrap">
                      <div class="cart-amount">
                        <div class="counter-wrap cart-total" data-id="product-<?= $product['product_id'];?>">
                          <div class="minus"><i class="fa fa-minus"></i></div>
                          <input type="text" name="<?= $product['key']; ?>" data-price="<?= $product['price'];?>"
                            class="product_quantity number" value="<?= $product['quantity']; ?>"/>
                          <div class="plus"><i class="fa fa-plus"></i></div>
                        </div>
                      </div>
                      <div class="big-price product-<?= $product['product_id'] ?>"><?= $product['total'];?></div>
                      <div class="clear"></div>
                  </div>
                </div>
                <div class="d-table-cell text-center width15 cart-delete">
                  <button type="button" data-key="<?= $product['key']; ?>" title="<?= $button_remove; ?>" >
                    <i class="fa fa-trash-o"></i>
                  </button>
                </div>
                <div class="clear"></div>
              </div>
              <?php } ?>
            </div>
          </div>
          <!--<div class="text-center">
            <a class="btn btn-primary" href="<?php /*echo $cart; */?>"><sdivong><?php /*echo $button_edit_order;*/?></sdivong></a>
          </div>-->
        </div>
        <div class="clear"></div>
      </div>
        <?php if(!$logged){ ?>
      <?php echo $content_bottom; ?></div>
  <?php } ?>
    <?php echo $column_right; ?></div>
</div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.blockUI/2.70/jquery.blockUI.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function(){
          var ua = navigator.userAgent;
          if (!/android/i.test(ua)) {
            $('#input-payment-telephone').mask('+38(999)-999-99-99');
          }

          // hack
          setTimeout(function(){
            $('#input-payment-register-styler').click();
          },100);
        });

        $(document).ready(function () {
          $('.register-continue').click(function () {
            var name = $('#input-payment-firstname').val();
            var lastname = $('#input-payment-lastname').val();
            var email = $('#input-payment-email').val();
            var telephone = $('#input-payment-telephone').val();
            var city = $('#input-payment-city').val();
            //var address = $('#input-payment-address').val();
            var registerRequired = $('#input-payment-register').prop('checked');

            // register if user required
            if (registerRequired) {
              var action = '<?= $register_action;?>';

              $.post(
                action,
                {
                  firstname: name, lastname: lastname, email: email, telephone: telephone, agree: true, noCaptcha: true
                },
                function (response) {
                  console.log(response);
                });
            }

            // validate step2
            $.post('<?php echo $action_step_2;?>',
              {
                firstname: name, lastname: lastname, email: email, telephone: telephone, city: city
              },
              function (response) {
                var json = JSON.parse(response);

                var zones = $('#input-payment-zones');
                $('.alert').remove();
                $('*.error').removeClass('error');
                for (var i = 0; i < json.length; i++) {
                  if (json[i].success == true) {
                    $('.step-menu span').removeClass("active");
                    $(".account-menu").hide();
                    $(".new-customer").hide();
                    $(".pay-field").show();
                    $(".step-2").addClass("active");
                  }

                  if (json[i].zones) {
                    zones.empty();
                    zones.append(json[i].zones);
                    zones.trigger('refresh');
                  }

                  if (json[i].error_email) {
                    $('#input-payment-email').addClass('error');
                    $('#input-payment-email').after('<div class="alert text-danger">' + json[i].error_email + '</div>');
                  }

                  if (json[i].error_telephone) {
                    $('#input-payment-telephone').addClass('error');
                    $('#input-payment-telephone').after('<div class="alert text-danger">' + json[i].error_telephone + '</div>');
                  }

                  if (json[i].error_firstname) {
                    $('#input-payment-firstname').addClass('error');
                    $('#input-payment-firstname').after('<div class="alert text-danger">' + json[i].error_firstname + '</div>');
                  }

                  if (json[i].error_lastname) {
                    $('#input-payment-lastname').addClass('error');
                    $('#input-payment-lastname').after('<div class="alert text-danger">' + json[i].error_lastname + '</div>');
                  }

                  if (json[i].error_city) {
                    $('#input-payment-city').addClass('error');
                    $('#input-payment-city').after('<div class="alert text-danger">' + json[i].error_city + '</div>');
                  }

                  /*if(json[i].error_address){
                   $('#input-payment-address').addClass('error');
                   $('#input-payment-address').after('<div class="alert text-danger">'+json[i].error_address+'</div>');
                   }*/
                }
                if (json[0].success == true) {
                  $('.step-menu span').removeClass("active");
                  $(".account-menu").hide();
                  $(".new-customer").hide();
                  $(".pay-field").show();
                  $(".step-2").addClass("active");

                  /* Событие перехода на шаг заполнения данных оплаты и доставки в оформлении заказа для Enhanced Ecommerce */
                  var $cartContainer = $('#cart');
                  var products = [];
                  $cartContainer.find('meta[data-type="product-info"]').each(function () {
                      products.push(JSON.parse($(this).attr('content')));
                  });
                  EEProcessor.checkoutSteps(3, 'user_credentials_filled', products);
                }
              }
            );

          });

          $('.delivery-continue').click(function () {
            var $shipping_method = $('input[name="shipping_method"]:checked');
            var $payment_method = $('input[name="payment_method"]:checked');

            clearAlertMessages();
            setAlertMessage = function(msg, $elem){
              $elem.find('h3').after('<span class="checkout-error"><i class="fa fa-chain-broken" style="font-size: 1.2em;margin-right: 10px;"></i>' + msg + '</span>');
            };

            if ($shipping_method.length == 0){
              setAlertMessage('Необходимо выбрать способ доставки!', $('.choose-delivery-field:first'));
              return false;
            }

            if ($payment_method.length == 0){
              setAlertMessage('Необходимо выбрать способ оплаты!', $('.choose-delivery-field:last'));
              return false;
            }

            var method = $shipping_method.val();
            var payment_method = $payment_method.val();
            var comment = $('#textarea-payment-comment').val();

            $.blockUI({ message: '<div class="spinstyle"><img src="/image/spinner.gif" /></div>' });

            var isNewPost = false;
            var city = $("#input-country-new-post option:selected").text();
            var point = $("#input-point-new-post option:selected").text();
            if ($("#new_post_checked").hasClass("checked")) {
              //$("#new_post_checked option:first").attr('selected', 'selected');
              isNewPost = true;
            }
            console.log(city + '  ' + point);
            var error = false;

            if (!$('.input-delivery:checked')) {
              $('.input-delivery').css('border', '1px solid red');
            }
            $.post('<?= $action_step_3;?>',
              {
                method: method, payment_method: payment_method,
                city: city, point: point, isNewPost: isNewPost,
                comment: comment
              },
              function (response) {
                console.log(response);
                $.unblockUI();
                $('.alert').remove();
                $('*.error').removeClass('error');
                var json = JSON.parse(response);
                if (json.success) {
                  /* Событие перехода на подтверждения в оформлении заказа для Enhanced Ecommerce */
                  var $cartContainer = $('#cart');
                  var products = [];
                  $cartContainer.find('meta[data-type="product-info"]').each(function () {
                      products.push(JSON.parse($(this).attr('content')));
                  });
                  EEProcessor.checkoutSteps(4, 'payment_shipping_filled', products);

                  /* Событие выбора опции метода доставки для Enhanced Ecommerce */
                  EEProcessor.checkoutOption(4, method);

                  /* Событие выбора опции метода оплаты для Enhanced Ecommerce */
                  EEProcessor.checkoutOption(4, payment_method);

                  $('a.delivery-continue-popup').trigger('click');
                  $('#succes-popup').load(json.success);
                }
              }
            )
          });

          function payCard() {
            if ($('input[value^="kaznachey"]').is(":checked")) {
              $("#kaznachey_frame").addClass("show-kaznachey");
            } else {
              $("#kaznachey_frame").removeClass("show-kaznachey");
            }
          };

          payCard();

          $(".choose-delivery-field .radio").click(function () {
            payCard();
          });

          function newPostDelivery() {
            if ($('input[value^="newpost2.newpost2"]').is(":checked")) {
              $(".new_post_delivery_form").show();
            } else {
              $(".new_post_delivery_form").hide();
            }
          };

          newPostDelivery();

          $(".choose-delivery-field .radio").click(function () {
            newPostDelivery();
          });

        });

        function forgottenLoad(){
            $(".forgotten-content").load("<?php echo $link_forgotten;?>");
        }

        function clearAlertMessages(){
            $(".checkout-error").remove();
        }

        function ajax_login_in_checkout(){
            var action = '/index.php?route=account/login/ajax_login';
            var email = $('.checkout-field #input-customer-email').attr('value');
            var password = $('.checkout-field #input-password').attr('value');

            $.post(
                    action,
                    {email: email, password: password, callback: 'checkout'},
                    function(response){
                        var json_response = JSON.parse(response);
                        $('.alert-danger').remove();
                        for (var i =0; i < json_response.length; i++){
                            if(json_response[i].warning){
                                $('.ajax-login-error').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle">'+json_response[i].warning+'</i></div>');
                            }

                            if(json_response[i].success){
                                window.location.href = json_response[i].success;
                            }
                        }
                    }
            );
        }

    </script>
<script type="text/javascript"><!--
$(document).on('change', 'input[name=\'account\']', function() {
	if ($('#collapse-payment-address').parent().find('.panel-heading .panel-title > *').is('a')) {	
		if (this.value == 'register') {
			$('#collapse-payment-address').parent().find('.panel-heading .panel-title').html('<a href="#collapse-payment-address" data-toggle="collapse" data-parent="#accordion" class="accordion-toggle"><?php echo $text_checkout_account; ?> <i class="fa fa-caret-down"></i></a>');
		} else {
			$('#collapse-payment-address').parent().find('.panel-heading .panel-title').html('<a href="#collapse-payment-address" data-toggle="collapse" data-parent="#accordion" class="accordion-toggle"><?php echo $text_checkout_payment_address; ?> <i class="fa fa-caret-down"></i></a>');
		}
	} else {
		if (this.value == 'register') {
			$('#collapse-payment-address').parent().find('.panel-heading .panel-title').html('<?php echo $text_checkout_account; ?>');
		} else {
			$('#collapse-payment-address').parent().find('.panel-heading .panel-title').html('<?php echo $text_checkout_payment_address; ?>');
		}	
	}
});

<?php if (!$logged) { ?> 
$(document).ready(function() {
    $.ajax({
        url: 'index.php?route=checkout/login',
        dataType: 'html',
        success: function(html) {
           $('#collapse-checkout-option .panel-body').html(html);
          
			$('#collapse-checkout-option').parent().find('.panel-heading .panel-title').html('<a href="#collapse-checkout-option" data-toggle="collapse" data-parent="#accordion" class="accordion-toggle"><?php echo $text_checkout_option; ?> <i class="fa fa-caret-down"></i></a>');
			
			$('a[href=\'#collapse-checkout-option\']').trigger('click');
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });
});     
<?php } else { ?>
$(document).ready(function() {
    $.ajax({
        url: 'index.php?route=checkout/payment_address',
        dataType: 'html',
        success: function(html) {
            $('#collapse-payment-address .panel-body').html(html);
            
			$('#collapse-payment-address').parent().find('.panel-heading .panel-title').html('<a href="#collapse-payment-address" data-toggle="collapse" data-parent="#accordion" class="accordion-toggle"><?php echo $text_checkout_payment_address; ?> <i class="fa fa-caret-down"></i></a>');

			$('a[href=\'#collapse-payment-address\']').trigger('click');
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });
});
<?php } ?>

// Checkout
$(document).delegate('#button-account', 'click', function() {
    $.ajax({
        url: 'index.php?route=checkout/' + $('input[name=\'account\']:checked').val(),
        dataType: 'html',
        beforeSend: function() {
        	$('#button-account').button('loading');
		},      
        complete: function() {
			$('#button-account').button('reset');
        },          
        success: function(html) {
            $('.alert, .text-danger').remove();
            
            $('#collapse-payment-address .panel-body').html(html);

			if ($('input[name=\'account\']:checked').val() == 'register') {
				$('#collapse-payment-address').parent().find('.panel-heading .panel-title').html('<a href="#collapse-payment-address" data-toggle="collapse" data-parent="#accordion" class="accordion-toggle"><?php echo $text_checkout_account; ?> <i class="fa fa-caret-down"></i></a>');
			} else {
				$('#collapse-payment-address').parent().find('.panel-heading .panel-title').html('<a href="#collapse-payment-address" data-toggle="collapse" data-parent="#accordion" class="accordion-toggle"><?php echo $text_checkout_payment_address; ?> <i class="fa fa-caret-down"></i></a>');
			}	
			
			$('a[href=\'#collapse-payment-address\']').trigger('click');
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });
});

// Login
$(document).delegate('#button-login', 'click', function() {
    $.ajax({
        url: 'index.php?route=checkout/login/save',
        type: 'post',
        data: $('#collapse-checkout-option :input'),
        dataType: 'json',
        beforeSend: function() {
        	$('#button-login').button('loading');
		},  
        complete: function() {
            $('#button-login').button('reset');
        },              
        success: function(json) {
            $('.alert, .text-danger').remove();
            $('.form-group').removeClass('has-error');
			
            if (json['redirect']) {
                location = json['redirect'];
            } else if (json['error']) {
                $('#collapse-checkout-option .panel-body').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error']['warning'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
           
				// Highlight any found errors
				$('input[name=\'email\']').parent().addClass('has-error');	
				$('input[name=\'password\']').parent().addClass('has-error');	   
		   }
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    }); 
});

// Register
$(document).delegate('#button-register', 'click', function() {
    $.ajax({
        url: 'index.php?route=checkout/register/save',
        type: 'post',
        data: $('#collapse-payment-address input[type=\'text\'], #collapse-payment-address input[type=\'date\'], #collapse-payment-address input[type=\'datetime-local\'], #collapse-payment-address input[type=\'time\'], #collapse-payment-address input[type=\'password\'], #collapse-payment-address input[type=\'hidden\'], #collapse-payment-address input[type=\'checkbox\']:checked, #collapse-payment-address input[type=\'radio\']:checked, #collapse-payment-address textarea, #collapse-payment-address select'),
        dataType: 'json',
        beforeSend: function() {
			$('#button-register').button('loading');
		},  
        complete: function() {
            $('#button-register').button('reset');
        },          
        success: function(json) {
            $('.alert, .text-danger').remove();
            $('.form-group').removeClass('has-error');
			            
            if (json['redirect']) {
                location = json['redirect'];                
            } else if (json['error']) {
                if (json['error']['warning']) {
                    $('#collapse-payment-address .panel-body').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error']['warning'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
                }
                
				for (i in json['error']) {
					var element = $('#input-payment-' + i.replace('_', '-'));
					
					if ($(element).parent().hasClass('input-group')) {
						$(element).parent().after('<div class="text-danger">' + json['error'][i] + '</div>');
					} else {
						$(element).after('<div class="text-danger">' + json['error'][i] + '</div>');
					}
				}
				
				// Highlight any found errors
				$('.text-danger').parent().addClass('has-error');					
            } else {
                <?php if ($shipping_required) { ?>              
                var shipping_address = $('#payment-address input[name=\'shipping_address\']:checked').prop('value');
                
                if (shipping_address) {
                    $.ajax({
                        url: 'index.php?route=checkout/shipping_method',
                        dataType: 'html',
                        success: function(html) {
							// Add the shipping address
                            $.ajax({
                                url: 'index.php?route=checkout/shipping_address',
                                dataType: 'html',
                                success: function(html) {
                                    $('#collapse-shipping-address .panel-body').html(html);
									
									$('#collapse-shipping-address').parent().find('.panel-heading .panel-title').html('<a href="#collapse-shipping-address" data-toggle="collapse" data-parent="#accordion" class="accordion-toggle"><?php echo $text_checkout_shipping_address; ?> <i class="fa fa-caret-down"></i></a>');
                                },
                                error: function(xhr, ajaxOptions, thrownError) {
                                    alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                                }
                            }); 
							
							$('#collapse-shipping-method .panel-body').html(html);
                            
							$('#collapse-shipping-method').parent().find('.panel-heading .panel-title').html('<a href="#collapse-shipping-method" data-toggle="collapse" data-parent="#accordion" class="accordion-toggle"><?php echo $text_checkout_shipping_method; ?> <i class="fa fa-caret-down"></i></a>');
   
   							$('a[href=\'#collapse-shipping-method\']').trigger('click');

							$('#collapse-shipping-method').parent().find('.panel-heading .panel-title').html('<?php echo $text_checkout_shipping_method; ?>');
							$('#collapse-payment-method').parent().find('.panel-heading .panel-title').html('<?php echo $text_checkout_payment_method; ?>');							
							$('#collapse-checkout-confirm').parent().find('.panel-heading .panel-title').html('<?php echo $text_checkout_confirm; ?>');	
                        },
                        error: function(xhr, ajaxOptions, thrownError) {
                            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                        }
                    }); 
                } else {
                    $.ajax({
                        url: 'index.php?route=checkout/shipping_address',
                        dataType: 'html',
                        success: function(html) {
                            $('#collapse-shipping-address .panel-body').html(html);
                            
							$('#collapse-shipping-address').parent().find('.panel-heading .panel-title').html('<a href="#collapse-shipping-address" data-toggle="collapse" data-parent="#accordion" class="accordion-toggle"><?php echo $text_checkout_shipping_address; ?> <i class="fa fa-caret-down"></i></a>');
			
							$('a[href=\'#collapse-shipping-address\']').trigger('click');
							
							$('#collapse-shipping-method').parent().find('.panel-heading .panel-title').html('<?php echo $text_checkout_shipping_method; ?>');
							$('#collapse-payment-method').parent().find('.panel-heading .panel-title').html('<?php echo $text_checkout_payment_method; ?>');							
							$('#collapse-checkout-confirm').parent().find('.panel-heading .panel-title').html('<?php echo $text_checkout_confirm; ?>');	
                        },
                        error: function(xhr, ajaxOptions, thrownError) {
                            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                        }
                    });         
                }
                <?php } else { ?>
                $.ajax({
                    url: 'index.php?route=checkout/payment_method',
                    dataType: 'html',
                    success: function(html) {
                        $('#collapse-payment-method .panel-body').html(html);
                        
						$('#collapse-payment-method').parent().find('.panel-heading .panel-title').html('<a href="#collapse-payment-method" data-toggle="collapse" data-parent="#accordion" class="accordion-toggle"><?php echo $text_checkout_payment_method; ?> <i class="fa fa-caret-down"></i></a>');
						
						$('a[href=\'#collapse-payment-method\']').trigger('click');
						
						$('#collapse-checkout-confirm').parent().find('.panel-heading .panel-title').html('<?php echo $text_checkout_confirm; ?>');					
                    },
                    error: function(xhr, ajaxOptions, thrownError) {
                        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                    }
                });                 
                <?php } ?>

                $.ajax({
                    url: 'index.php?route=checkout/payment_address',
                    dataType: 'html',
                    success: function(html) {
                        $('#collapse-payment-address .panel-body').html(html);
                        
						$('#collapse-payment-address').parent().find('.panel-heading .panel-title').html('<a href="#collapse-payment-address" data-toggle="collapse" data-parent="#accordion" class="accordion-toggle"><?php echo $text_checkout_payment_address; ?> <i class="fa fa-caret-down"></i></a>');
                    },
                    error: function(xhr, ajaxOptions, thrownError) {
                        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                    }
                });
            }    
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    }); 
});

// Payment Address  
$(document).delegate('#button-payment-address', 'click', function() {
    $.ajax({
        url: 'index.php?route=checkout/payment_address/save',
        type: 'post',
        data: $('#collapse-payment-address input[type=\'text\'], #collapse-payment-address input[type=\'date\'], #collapse-payment-address input[type=\'datetime-local\'], #collapse-payment-address input[type=\'time\'], #collapse-payment-address input[type=\'password\'], #collapse-payment-address input[type=\'checkbox\']:checked, #collapse-payment-address input[type=\'radio\']:checked, #collapse-payment-address input[type=\'hidden\'], #collapse-payment-address textarea, #collapse-payment-address select'),
        dataType: 'json',
        beforeSend: function() {
        	$('#button-payment-address').button('loading');
		},  
        complete: function() {
			$('#button-payment-address').button('reset');
        },          
        success: function(json) {
            $('.alert, .text-danger').remove();
            
            if (json['redirect']) {
                location = json['redirect'];
            } else if (json['error']) {
                if (json['error']['warning']) {
                    $('#collapse-payment-address .panel-body').prepend('<div class="alert alert-warning">' + json['error']['warning'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
                }
                				
				for (i in json['error']) {
					var element = $('#input-payment-' + i.replace('_', '-'));
					
					if ($(element).parent().hasClass('input-group')) {
						$(element).parent().after('<div class="text-danger">' + json['error'][i] + '</div>');
					} else {
						$(element).after('<div class="text-danger">' + json['error'][i] + '</div>');
					}
				}
								
				// Highlight any found errors
				$('.text-danger').parent().parent().addClass('has-error');				
            } else {
                <?php if ($shipping_required) { ?>
                $.ajax({
                    url: 'index.php?route=checkout/shipping_address',
                    dataType: 'html',
                    success: function(html) {
                        $('#collapse-shipping-address .panel-body').html(html);
                        
						$('#collapse-shipping-address').parent().find('.panel-heading .panel-title').html('<a href="#collapse-shipping-address" data-toggle="collapse" data-parent="#accordion" class="accordion-toggle"><?php echo $text_checkout_shipping_address; ?> <i class="fa fa-caret-down"></i></a>');
						
						$('a[href=\'#collapse-shipping-address\']').trigger('click');

						$('#collapse-shipping-method').parent().find('.panel-heading .panel-title').html('<?php echo $text_checkout_shipping_method; ?>');
						$('#collapse-payment-method').parent().find('.panel-heading .panel-title').html('<?php echo $text_checkout_payment_method; ?>');
						$('#collapse-checkout-confirm').parent().find('.panel-heading .panel-title').html('<?php echo $text_checkout_confirm; ?>');
                    },
                    error: function(xhr, ajaxOptions, thrownError) {
                        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                    }
                });
                <?php } else { ?>
                $.ajax({
                    url: 'index.php?route=checkout/payment_method',
                    dataType: 'html',
                    success: function(html) {
                        $('#collapse-payment-method .panel-body').html(html);
                    	
						$('#collapse-payment-method').parent().find('.panel-heading .panel-title').html('<a href="#collapse-payment-method" data-toggle="collapse" data-parent="#accordion" class="accordion-toggle"><?php echo $text_checkout_payment_method; ?> <i class="fa fa-caret-down"></i></a>');
						
						$('a[href=\'#collapse-payment-method\']').trigger('click');

						$('#collapse-checkout-confirm').parent().find('.panel-heading .panel-title').html('<?php echo $text_checkout_confirm; ?>');
                    },
                    error: function(xhr, ajaxOptions, thrownError) {
                        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                    }
                }); 
                <?php } ?>
                
                $.ajax({
                    url: 'index.php?route=checkout/payment_address',
                    dataType: 'html',
                    success: function(html) {
                        $('#collapse-payment-address .panel-body').html(html);
                    },
                    error: function(xhr, ajaxOptions, thrownError) {
                        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                    }
                });             
            }     
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    }); 
});

// Shipping Address         
$(document).delegate('#button-shipping-address', 'click', function() {
    $.ajax({
        url: 'index.php?route=checkout/shipping_address/save',
        type: 'post',
        data: $('#collapse-shipping-address input[type=\'text\'], #collapse-shipping-address input[type=\'date\'], #collapse-shipping-address input[type=\'datetime-local\'], #collapse-shipping-address input[type=\'time\'], #collapse-shipping-address input[type=\'password\'], #collapse-shipping-address input[type=\'checkbox\']:checked, #collapse-shipping-address input[type=\'radio\']:checked, #collapse-shipping-address textarea, #collapse-shipping-address select'),
        dataType: 'json',
        beforeSend: function() {
			$('#button-shipping-address').button('loading');
	    },  
        complete: function() {
			$('#button-shipping-address').button('reset');
        },          
        success: function(json) {
            $('.alert, .text-danger').remove();
            
            if (json['redirect']) {
                location = json['redirect'];
            } else if (json['error']) {
                if (json['error']['warning']) {
                    $('#collapse-shipping-address .panel-body').prepend('<div class="alert alert-warning">' + json['error']['warning'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
                }
  								
				for (i in json['error']) {
					var element = $('#input-shipping-' + i.replace('_', '-'));
					
					if ($(element).parent().hasClass('input-group')) {
						$(element).parent().after('<div class="text-danger">' + json['error'][i] + '</div>');
					} else {
						$(element).after('<div class="text-danger">' + json['error'][i] + '</div>');
					}
				}
								
				// Highlight any found errors
				$('.text-danger').parent().parent().addClass('has-error');				
            } else {
                $.ajax({
                    url: 'index.php?route=checkout/shipping_method',
                    dataType: 'html',
                    success: function(html) {
                        $('#collapse-shipping-method .panel-body').html(html);
                        
						$('#collapse-shipping-method').parent().find('.panel-heading .panel-title').html('<a href="#collapse-shipping-method" data-toggle="collapse" data-parent="#accordion" class="accordion-toggle"><?php echo $text_checkout_shipping_method; ?> <i class="fa fa-caret-down"></i></a>');
		
						$('a[href=\'#collapse-shipping-method\']').trigger('click');

						$('#collapse-payment-method').parent().find('.panel-heading .panel-title').html('<?php echo $text_checkout_payment_method; ?>');
						$('#collapse-checkout-confirm').parent().find('.panel-heading .panel-title').html('<?php echo $text_checkout_confirm; ?>');
						
                        $.ajax({
                            url: 'index.php?route=checkout/shipping_address',
                            dataType: 'html',
                            success: function(html) {
                                $('#collapse-shipping-address .panel-body').html(html);
                            },
                            error: function(xhr, ajaxOptions, thrownError) {
                                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                            }
                        });
                    },
                    error: function(xhr, ajaxOptions, thrownError) {
                        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                    }
                }); 
                
                $.ajax({
                    url: 'index.php?route=checkout/payment_address',
                    dataType: 'html',
                    success: function(html) {
                        $('#collapse-payment-address .panel-body').html(html);
                    },
                    error: function(xhr, ajaxOptions, thrownError) {
                        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                    }
                });                 
            }
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    }); 
});

// Guest
$(document).delegate('#button-guest', 'click', function() {
    $.ajax({
        url: 'index.php?route=checkout/guest/save',
        type: 'post',
        data: $('#collapse-payment-address input[type=\'text\'], #collapse-payment-address input[type=\'date\'], #collapse-payment-address input[type=\'datetime-local\'], #collapse-payment-address input[type=\'time\'], #collapse-payment-address input[type=\'checkbox\']:checked, #collapse-payment-address input[type=\'radio\']:checked, #collapse-payment-address input[type=\'hidden\'], #collapse-payment-address textarea, #collapse-payment-address select'),
        dataType: 'json',
        beforeSend: function() {
       		$('#button-guest').button('loading');
	    },  
        complete: function() {
			$('#button-guest').button('reset');
        },          
        success: function(json) {
            $('.alert, .text-danger').remove();
            
            if (json['redirect']) {
                location = json['redirect'];
            } else if (json['error']) {
                if (json['error']['warning']) {
                    $('#collapse-payment-address .panel-body').prepend('<div class="alert alert-warning">' + json['error']['warning'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
                }
                                
				for (i in json['error']) {
					var element = $('#input-payment-' + i.replace('_', '-'));
					
					if ($(element).parent().hasClass('input-group')) {
						$(element).parent().after('<div class="text-danger">' + json['error'][i] + '</div>');
					} else {
						$(element).after('<div class="text-danger">' + json['error'][i] + '</div>');
					}
				}
								
				// Highlight any found errors
				$('.text-danger').parent().addClass('has-error');					
            } else {
                <?php if ($shipping_required) { ?>  
                var shipping_address = $('#collapse-payment-address input[name=\'shipping_address\']:checked').prop('value');
                
                if (shipping_address) {
                    $.ajax({
                        url: 'index.php?route=checkout/shipping_method',
                        dataType: 'html',
                        success: function(html) {
							// Add the shipping address
                            $.ajax({
                                url: 'index.php?route=checkout/guest_shipping',
                                dataType: 'html',
                                success: function(html) {
                                    $('#collapse-shipping-address .panel-body').html(html);
									
									$('#collapse-shipping-address').parent().find('.panel-heading .panel-title').html('<a href="#collapse-shipping-address" data-toggle="collapse" data-parent="#accordion" class="accordion-toggle"><?php echo $text_checkout_shipping_address; ?> <i class="fa fa-caret-down"></i></a>');
                                },
                                error: function(xhr, ajaxOptions, thrownError) {
                                    alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                                }
                            });
                           
						    $('#collapse-shipping-method .panel-body').html(html);
							
							$('#collapse-shipping-method').parent().find('.panel-heading .panel-title').html('<a href="#collapse-shipping-method" data-toggle="collapse" data-parent="#accordion" class="accordion-toggle"><?php echo $text_checkout_shipping_method; ?> <i class="fa fa-caret-down"></i></a>');
							
							$('a[href=\'#collapse-shipping-method\']').trigger('click');
									
							$('#collapse-payment-method').parent().find('.panel-heading .panel-title').html('<?php echo $text_checkout_payment_method; ?>');
							$('#collapse-checkout-confirm').parent().find('.panel-heading .panel-title').html('<?php echo $text_checkout_confirm; ?>');
                        },
                        error: function(xhr, ajaxOptions, thrownError) {
                            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                        }
                    });                 
                } else {
                    $.ajax({
                        url: 'index.php?route=checkout/guest_shipping',
                        dataType: 'html',
                        success: function(html) {
                            $('#collapse-shipping-address .panel-body').html(html);
                             
							$('#collapse-shipping-address').parent().find('.panel-heading .panel-title').html('<a href="#collapse-shipping-address" data-toggle="collapse" data-parent="#accordion" class="accordion-toggle"><?php echo $text_checkout_shipping_address; ?> <i class="fa fa-caret-down"></i></a>');
							
							$('a[href=\'#collapse-shipping-address\']').trigger('click');
						
							$('#collapse-shipping-method').parent().find('.panel-heading .panel-title').html('<?php echo $text_checkout_shipping_method; ?>');
							$('#collapse-payment-method').parent().find('.panel-heading .panel-title').html('<?php echo $text_checkout_payment_method; ?>');
							$('#collapse-checkout-confirm').parent().find('.panel-heading .panel-title').html('<?php echo $text_checkout_confirm; ?>');
                        },
                        error: function(xhr, ajaxOptions, thrownError) {
                            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                        }
                    });
                }
                <?php } else { ?>               
                $.ajax({
                    url: 'index.php?route=checkout/payment_method',
                    dataType: 'html',
                    success: function(html) {
                        $('#collapse-payment-method .panel-body').html(html);
                        
						$('#collapse-payment-method').parent().find('.panel-heading .panel-title').html('<a href="#collapse-payment-method" data-toggle="collapse" data-parent="#accordion" class="accordion-toggle"><?php echo $text_checkout_payment_method; ?> <i class="fa fa-caret-down"></i></a>');
						
						$('a[href=\'#collapse-payment-method\']').trigger('click');
						
						$('#collapse-checkout-confirm').parent().find('.panel-heading .panel-title').html('<?php echo $text_checkout_confirm; ?>');
                    },
                    error: function(xhr, ajaxOptions, thrownError) {
                        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                    }
                });             
                <?php } ?>
            }    
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    }); 
});

// Guest Shipping
$(document).delegate('#button-guest-shipping', 'click', function() {
    $.ajax({
        url: 'index.php?route=checkout/guest_shipping/save',
        type: 'post',
        data: $('#collapse-shipping-address input[type=\'text\'], #collapse-shipping-address input[type=\'date\'], #collapse-shipping-address input[type=\'datetime-local\'], #collapse-shipping-address input[type=\'time\'], #collapse-shipping-address input[type=\'password\'], #collapse-shipping-address input[type=\'checkbox\']:checked, #collapse-shipping-address input[type=\'radio\']:checked, #collapse-shipping-address textarea, #collapse-shipping-address select'),
        dataType: 'json',
        beforeSend: function() {
        	$('#button-guest-shipping').button('loading');
		},  
        complete: function() {
			$('#button-guest-shipping').button('reset');
        },          
        success: function(json) {
            $('.alert, .text-danger').remove();
            
            if (json['redirect']) {
                location = json['redirect'];
            } else if (json['error']) {
                if (json['error']['warning']) {
                    $('#collapse-shipping-address .panel-body').prepend('<div class="alert alert-warning">' + json['error']['warning'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
                }

				for (i in json['error']) {
					var element = $('#input-shipping-' + i.replace('_', '-'));
					
					if ($(element).parent().hasClass('input-group')) {
						$(element).parent().after('<div class="text-danger">' + json['error'][i] + '</div>');
					} else {
						$(element).after('<div class="text-danger">' + json['error'][i] + '</div>');
					}
				}
				
				// Highlight any found errors
				$('.text-danger').parent().addClass('has-error');				
            } else {
                $.ajax({
                    url: 'index.php?route=checkout/shipping_method',
                    dataType: 'html',
                    success: function(html) {
                        $('#collapse-shipping-method .panel-body').html(html);
						
						$('#collapse-shipping-method').parent().find('.panel-heading .panel-title').html('<a href="#collapse-shipping-method" data-toggle="collapse" data-parent="#accordion" class="accordion-toggle"><?php echo $text_checkout_shipping_method; ?> <i class="fa fa-caret-down"></i>');
						
						$('a[href=\'#collapse-shipping-method\']').trigger('click');

						$('#collapse-payment-method').parent().find('.panel-heading .panel-title').html('<?php echo $text_checkout_payment_method; ?>');
						$('#collapse-checkout-confirm').parent().find('.panel-heading .panel-title').html('<?php echo $text_checkout_confirm; ?>');
                    },
                    error: function(xhr, ajaxOptions, thrownError) {
                        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                    }
                });             
            }    
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    }); 
});

$(document).delegate('#button-shipping-method', 'click', function() {
    $.ajax({
        url: 'index.php?route=checkout/shipping_method/save',
        type: 'post',
        data: $('#collapse-shipping-method input[type=\'radio\']:checked, #collapse-shipping-method textarea'),
        dataType: 'json',
        beforeSend: function() {
        	$('#button-shipping-method').button('loading');
		},  
        complete: function() {
			$('#button-shipping-method').button('reset');
        },          
        success: function(json) {
            $('.alert, .text-danger').remove();
            
            if (json['redirect']) {
                location = json['redirect'];
            } else if (json['error']) {
                if (json['error']['warning']) {
                    $('#collapse-shipping-method .panel-body').prepend('<div class="alert alert-warning">' + json['error']['warning'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
                }           
            } else {
                $.ajax({
                    url: 'index.php?route=checkout/payment_method',
                    dataType: 'html',
                    success: function(html) {
                        $('#collapse-payment-method .panel-body').html(html);
                        
						$('#collapse-payment-method').parent().find('.panel-heading .panel-title').html('<a href="#collapse-payment-method" data-toggle="collapse" data-parent="#accordion" class="accordion-toggle"><?php echo $text_checkout_payment_method; ?> <i class="fa fa-caret-down"></i></a>');
						
						$('a[href=\'#collapse-payment-method\']').trigger('click');
						
						$('#collapse-checkout-confirm').parent().find('.panel-heading .panel-title').html('<?php echo $text_checkout_confirm; ?>');
                    },
                    error: function(xhr, ajaxOptions, thrownError) {
                        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                    }
                });                 
            }
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    }); 
});

$(document).delegate('#button-payment-method', 'click', function() {
    $.ajax({
        url: 'index.php?route=checkout/payment_method/save', 
        type: 'post',
        data: $('#collapse-payment-method input[type=\'radio\']:checked, #collapse-payment-method input[type=\'checkbox\']:checked, #collapse-payment-method textarea'),
        dataType: 'json',
        beforeSend: function() {
         	$('#button-payment-method').button('loading');
		},  
        complete: function() {
            $('#button-payment-method').button('reset');
        },          
        success: function(json) {
            $('.alert, .text-danger').remove();
            
            if (json['redirect']) {
                location = json['redirect'];
            } else if (json['error']) {
                if (json['error']['warning']) {
                    $('#collapse-payment-method .panel-body').prepend('<div class="alert alert-warning">' + json['error']['warning'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
                }           
            } else {
                $.ajax({
                    url: 'index.php?route=checkout/confirm',
                    dataType: 'html',
                    success: function(html) {
                        $('#collapse-checkout-confirm .panel-body').html(html);
  						
						$('#collapse-checkout-confirm').parent().find('.panel-heading .panel-title').html('<a href="#collapse-checkout-confirm" data-toggle="collapse" data-parent="#accordion" class="accordion-toggle"><?php echo $text_checkout_confirm; ?> <i class="fa fa-caret-down"></i></a>');
						
						$('a[href=\'#collapse-checkout-confirm\']').trigger('click');
					},
                    error: function(xhr, ajaxOptions, thrownError) {
                        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                    }
                }); 
            }
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    }); 
});
//--></script> 
<script language="javascript" type="text/javascript">
  window.onload = function() {
    $("html, body").scrollTop(0);
  }
</script>
<?php echo $footer; ?>