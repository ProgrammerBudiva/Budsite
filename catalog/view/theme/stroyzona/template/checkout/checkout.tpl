<?php echo $header; ?>
<link href="catalog/view/theme/stroyzona/stylesheet/checkout.css" rel="stylesheet">
<link href="catalog/view/theme/stroyzona/stylesheet/dd.css" rel="stylesheet">

<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/css/select2.min.css" rel="stylesheet" />

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
      <div class="col-md-6 col-sm-6 col-xs-12 checkout-main-block">
        <div class="checkout-field">

            <h3 id="quick-checkout-header"  class="theme-header" style="padding-bottom: 5px">Хочу быстрое оформление заказа</h3>

        <div class="quick">
            <p class="help-info">Заказ отправится сразу в обработку и все детали вы оговорите с менеджером </p>
            <div class="buy-1-click " style="float: none; width: 326px;">
                <!--<p><?php /*echo $text_buy_one_click; */?></p>-->
                <span><span style="margin-left: auto;width: 200px;margin-right: auto;height: 0;border: none;padding: 0;">
                                            <div><img id="img-pointer" src="image/pointer.png" alt="pointer"></div>
                                            <div id="div-click">Купить в 1 клик</div>
                           </span>             </span>
                <div class="modal-wrap">
                    <p><?php echo $text_callback_you; ?></p>
                    <input id="callback_input_phone_product" name="phone"  />
                    <input type="hidden" value="<?php echo $spec_link; ?>" name="product">
                    <a class="thank-to-call"><input id="callback_input_submit_product" type="submit" value="Жду звонка" class="btn btn-primary" /></a>
                    <i class="fa fa-times"></i>
                    <p class="phone-alert"></p>
                </div>
                <div class="hidden" id="oneclick_success">Жду звонка</div>
            </div>
        </div>
           <!-- <div class="menu-wrap account-menu">
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
            </div> -->

            <div class="form-wrap new-customer">
                <div><h3 class="theme-header" style="display: block; padding-bottom: 0; padding-top: 20px;">Оформление моего заказа</h3></div>
                <form id="order-form">
                    <div class="two-inputs">
                    <div class="form-group custom-form-group-margin custom-margin-bottom width additional-margin-">
                        <label class="control-label custom-label-checkout" for="input-payment-lastname"><strong style="padding-right: 5px;"><?php echo $entry_lastname;?></strong><strong style="color: red;">*</strong></label>
                        <div class="lastname-block">
                            <input type="text" required name="lastname" value="<?php print $lastname ? $lastname : (!empty($full_user_info['lastname']) ? $full_user_info['lastname'] : '');?>" id="input-payment-lastname" class="form-control fio-height" />
                        </div>
                    </div>
                    <div class="form-group custom-form-group-margin custom-margin-bottom width additional-margin-">
                        <label class="control-label custom-label-checkout" for="input-payment-firstname"><strong style="padding-right: 5px;"><?php echo $entry_firstname;?></strong><strong style="color: red;">*</strong></label>
                        <div class="firstname-block">
                            <input type="text" required name="firstname" value="<?php print $firstname ? $firstname : (!empty($full_user_info['firstname']) ? $full_user_info['firstname'] : '');?>" id="input-payment-firstname" class="form-control fio-height" />
                        </div>
                    </div>
                    </div>
                    <div class=" additional-margin custom-margin-bottom mobile-margin additional-margin-">
                        <label class="control-label custom-label-checkout" for="input-payment-telephone"><strong style="padding-right: 5px;"><?php echo $entry_telephone;?></strong><strong style="color: red;">*</strong></label>
                        <div class="one-row-display phone-block">
                            <input type="text" required name="telephone" value="<?php print $telephone ? $telephone : (!empty($full_user_info['telephone']) ? $full_user_info['telephone'] : '') ;?>" id="input-payment-telephone" class="form-control custom-height" />
                        </div>
                    </div>

                 <!--   <div class="form-group required">
                        <label class="col-lg-4 col-sm-12 control-label" for="input-payment-city"><?php echo $entry_city;?></label>
                        <div class="col-lg-8 col-sm-12">
                            <div class="search-wrap">
                                <input type="text" name="city" value="<?php echo $city?>" id="input-payment-city" class="form-control custom-height" value=""/>
                            </div>
                        </div>
                    </div> -->

                    <div id="email" class="form-group custom-form-group-margin custom-margin-bottom padding-10-mobile additional-margin-">
                        <label class="control-label custom-label-checkout" for="input-payment-email"><strong style="padding-right: 5px;"><?php echo $entry_email;?></strong><strong style="color: red;">*</strong></label>
                        <div class="one-row-display email">
                            <input type="email" required name="email" value="<?php print $email ? $email : (!empty($full_user_info['email']) ? $full_user_info['email'] : '') ;?>" id="input-payment-email" class="form-control custom-height" />

                        </div>
                    </div>


                    <div class="form-group test">
                        <label style="display: none;" class="col-lg-4 col-sm-12 control-label" for="input-payment-register"><?php echo $entry_register;?></label>
                        <div class="checkbox-subscribe-position">
                            <input type="checkbox" name="subscribe" value="1" id="input-payment-register" class="form-control"/>
                        </div>
                        <p class="additional-info-subcribe">Получать информацию о выгодных условиях покупки</p>
                    </div>

                    <h4 class="theme-header custom-padding">Оплата моего заказа:</h4>

                    <div id="payment-block" class="font-10">
                        <div class="radio">
                            <label>
                                <input type="radio" checked name="payment" id="payment1" value="Предоплата на карту ПриватБанка" >
                                Предоплата через Приват24
                            </label>
                        </div>

                        <div class="radio">
                            <label>
                                <input type="radio" name="payment" id="payment2" value="Наложенный платеж (доп. +2% от стоимости)" >
                                Наложенный платеж (доп. +2% - услуги Новой Почты)
                            </label>
                        </div>

                        <div class="radio">
                            <label>
                                <input type="radio" name="payment" id="payment4" value="Оплата при самовывозе" >
                                Оплата при самовывозе
                            </label>
                        </div>

                        <div class="radio">
                            <label>
                                <input type="radio" name="payment" id="payment3" value="Безналичный рассчет" >
                                Оплата по счёту (безналичный расчет)
                            </label>
                        </div>

                    </div>

                    <div class="nal-payment" style="display: none; padding-left: 30px; max-width: 600px;">
                        <span style="display: inline-block;color: #ff6600;font-size: 17px;">Все поля заполнять на украинском языке</span>
                        <div class="font-10">
                            <div id="radio-inline" class="two-radio ">
                                <div class="radio">
                                    <label>
                                        <input type="radio" checked name="face" id="ur" value="1" >
                                        Юридическое лицо (ТОВ, ФОП, ...)
                                    </label>
                                </div>

                                <div  class="radio bullshit">
                                    <label>
                                        <input type="radio" name="face" id="fiz" value="2" >
                                        Физическое лицо
                                    </label>
                                </div>
                            </div>
                        </div>

                    <div class="ur-lico" >
                        <label class="padding-20" for="" style="padding-right:20px ">Плательщик НДС</label>
                        <div class="font-10 " style="display: inline-block;">
                            <div class="two-radio ">
                                <div class="radio">
                                    <label>
                                        <input type="radio" checked name="nds" id="nds-yes" value="1" >
                                        Да
                                    </label>
                                </div>

                                <div class="radio">
                                    <label>
                                        <input type="radio" name="nds" id="nds-no" value="2" >
                                        Нет
                                    </label>
                                </div>
                            </div>
                        </div>

                        <div class="form-group custom-form-group-margin">
                            <!-- <label class="control-label custom-label-checkout" for="input-payment-company-name">Название компании на укр.яз.</label> -->
                            <div class="one-row-display ">
                                <input type="text"  name="company-name" value="" id="input-payment-company-name" placeholder="Повна назва організації" class="form-control custom-height" />
                            </div>
                        </div>

                        <div class="form-group custom-form-group-margin">
                         <!--   <label class="control-label custom-label-checkout" for="edrpou">ЕДРПОУ</label> -->
                            <div class="one-row-display ">
                                <input type="text"  name="edrpou" value="" id="edrpou" placeholder="ЄДРПОУ" class="form-control custom-height" />
                            </div>
                        </div>

                        <div class="form-group custom-form-group-margin">
                            <div class="one-row-display ">
                                <input type="text"  name="inn-company" value="" id="inn-company" placeholder="ІПН (індивідуальний податковий номер)" class="form-control custom-height" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label  class="control-label" for="want-contract" style="padding-right: 10px;">Хочу оформить договор</label>

                                <input type="checkbox" name="contract" value="1" id="want-contract" class="form-control"/>
                        </div>
                        <div class="want-contract" style="display: none;">
                        <div class="form-group custom-form-group-margin">
                            <!--<label class="control-label custom-label-checkout" fur-addraddr">Юридический адрес</label> -->
                            <div class="one-row-display ">
                                <input type="text" placeholder="Юридична адреса"  name="ur-addr" value="" id="ur-addr" class="form-control custom-height" />
                            </div>
                        </div>

                        <!--<div class="form-group">
                           <label  class="control-label" for="want-contract" style="padding-right: 10px;">Почтовый адрес совпадает с юридическим</label>

                            <input type="checkbox" placeholder="Почтовый адрес совпадает с юридическим" checked="checked" name="fiz-ur" value="1" id="fiz-ur" class="form-control"/>
                        </div> -->
                            <div class="form-group custom-form-group-margin">
                                <!--<label class="control-label custom-label-checkout" for="fio-boss">ФИО руководителя на укр. яз.</label>-->
                                <div class="one-row-display ">
                                    <input type="text"  name="post-addr" value="" id="post-addr" placeholder="Поштова адреса" class="form-control custom-height" />
                                </div>
                            </div>


                            <div class="form-group custom-form-group-margin">
                            <!--<label class="control-label custom-label-checkout" for="fio-boss">ФИО руководителя на укр. яз.</label>-->
                            <div class="one-row-display ">
                                <input type="text"  name="phone-company" value="" id="phone-company" placeholder="Телефон організації" class="form-control custom-height" />
                            </div>
                        </div>

                        <div class="form-group custom-form-group-margin custom-width no-margin-bottom" style="display: flex;     width: 90%;">
                            <div class="width-50" style="width: 49%;padding-right: 2%;">
                           <!-- <label class="control-label custom-label-checkout" fur-addraddr">Расчетный счет</label> -->
                            <div class="one-row-display ">
                                <input type="text" name="payment-list" value="" id="" placeholder="№ розрахункового рахунку" class="form-control " />
                            </div>
                            </div>
                            <div class="width-50" style="width: 49%;">
                            <!-- <label class="control-label custom-label-checkout" fur-addraddr">МФО</label> -->
                            <div class="one-row-display ">
                                <input type="text"  name="mfo" placeholder="МФО" value="" id="" class="form-control " />
                            </div></div>
                        </div>

                        <div class="form-group custom-form-group-margin">
                            <!--<label class="control-label custom-label-checkout" for="fio-boss">ФИО руководителя на укр.</label>-->
                            <div class="one-row-display ">
                                <input type="text"  name="fio-boss" value="" id="fio-boss" placeholder="ПІБ керівника" class="form-control custom-height" />
                            </div>
                        </div>

                        <div class="form-group custom-form-group-margin">
                            <!--  <label class="control-label custom-label-checkout" for="boss-position">Должность руководителя на укр.</label>-->
                            <div class="one-row-display ">
                                <input type="text"  name="boss-position" value="" id="boss-position" placeholder="Посада керівника" class="form-control custom-height" />
                            </div>
                        </div>

                        <div class="form-group custom-form-group-margin">
                            <!--  <label class="control-label custom-label-checkout" for="ustav">Руководитель действует на основании (устава, доверенности и т.д.)</label>-->
                            <div class="one-row-display ">
                                <input type="text"  name="ustav" value="" id="ustav" placeholder="Керівник діє на підставі (статуту, доручення № і т.д.)" class="form-control custom-height" />
                            </div>
                        </div>
                    </div>
                </div>
                        <div class="fiz-lico" style="display: none;">

                            <div class="form-group custom-form-group-margin">
                              <!--  <label class="control-label custom-label-checkout" for="fio-ukr">ФИО на укр.яз.</label> -->
                                <div class="one-row-display ">
                                    <input type="text"  name="fio-ukr" value="" id="fio-ukr" placeholder="ПІБ" class="form-control custom-height" />
                                </div>
                            </div>

                            <div class="form-group custom-form-group-margin">
                                <!--<label class="control-label custom-label-checkout" for="inn">ИНН</label>-->
                                <div class="one-row-display ">
                                    <input type="text"  name="inn" value="" id="inn" placeholder="ІПН (індивідуальний податковий номер)" class="form-control custom-height" />
                                </div>
                            </div>

                        </div>
                    </div>

                    <h4 class="theme-header no-margin-bottom"  style="padding-top: 20px;">Доставка:</h4>

                    <div class="font-10 ">
                        <div class="two-radio ">
                            <div class="radio">
                                <label>
                                    <input type="radio" checked name="shipping" id="shipping-post" value="Курьерской службой" >
                                    Курьерской службой
                                </label>
                            </div>

                            <div class="radio">
                                <label>
                                    <input type="radio" name="shipping" id="shipping-self" value="Самовывоз" >
                                    Самовывоз
                                </label>
                            </div>
                        </div>
                    </div>

                    <div class="hide-select">
                        <select id="deliviries">
                            <option value="1" name="shipping-company" class="np-img" data-image="image/nova_poshta.jpg">Новая Почта</option>
                            <option value="2" name="shipping-company" class="intime-img" data-image="image/intime.jpg">InTime</option>
                            <option value="3" name="shipping-company" class="delivery-img" data-image="image/delivery.png">Delivery</option>
                        </select>
                    </div>

                    <div class="self-shipping-block">
                        <p><span class="theme-header" >Не для всех товаров.</span> При подтверждении Вашего заказа уточним возможность самовывоза в выбранном городе.</p>
                        <div class="font-10">
                            <div class="radio">
                                <label>
                                    <input type="radio" checked name="self-shipping" id="self-shipping-1" value="Киев" >
                                    <b>Киев</b>, ул. Стройиндустрии, 7
                                </label>
                            </div>

                            <div class="radio">
                                <label>
                                    <input type="radio" name="self-shipping" id="self-shipping-2" value="Одесса" >
                                    <b>Одесса</b>, пер 1-й Промышленный переулок, 9
                                </label>
                            </div>

                            <div class="radio">
                                <label>
                                    <input type="radio" name="self-shipping" id="self-shipping-3" value="Днепр" >
                                    <b>Днепр</b>, ул. Квитки-Основьяненко, 5
                                </label>
                            </div>

                            <div class="radio">
                                <label>
                                    <input type="radio" name="self-shipping" id="self-shipping-4" value="Полтава" >
                                    <b>Полтава</b>, пер. Перспективный, 10
                                </label>
                            </div>

                            <div class="radio">
                                <label>
                                    <input type="radio" name="self-shipping" id="self-shipping-4" value="Кривой Рог" >
                                    <b>Кривой Рог</b>, ул. Волгоградская, 4
                                </label>
                            </div>

                            <div class="radio">
                                <label>
                                    <input type="radio" name="self-shipping" id="self-shipping-4" value="Запорожье" >
                                    <b>Запорожье</b>, ул. Можайская, 63
                                </label>
                            </div>

                            <div class="radio">
                                <label>
                                    <input type="radio" name="self-shipping" id="self-shipping-4" value="Херсон" >
                                    <b>Херсон</b>, ул. Ладычука, 161
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="deliveries-block-all">
                        <div class="new_post_delivery" id="np_block">
                            <div class="label-input np-grid">
                                <label class="col-sm-3" for="input-country-new-post"><strong><?php echo $entry_city; ?></strong></label>
                                <div class="col-sm-9 no-padding-left">
                                    <select name="config_country_id" id="input-country-new-post" data-search="true" onchange="getPoint($(this).find(':selected').data('id'))">
                                        <option selected value="Выберите город">Выберите город</option>
                                        <?php foreach ($countries as $country) { ?>
                                        <option value="<?php echo $country['name']; ?>" data-id="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
                                        <?php } ?>
                                    </select>
                                </div>
                            </div>
                                    <div class="address-shipping">
                                        <label style="padding-right: 3%;">
                                            <input type="radio" checked name="np-sklad" id="np-sklad" value="1" >
                                            На отделение:
                                        </label>

                                        <label class="no-padding-left" style=" ">
                                            <input type="radio"  name="np-sklad" id="np-address" value="2" >
                                            Адресная доставка:
                                        </label>
                                    </div>
                            <div id="np-point">
                            <label class="col-sm-3 control-label" for="input-point-new-post-styler"><strong><?php echo $entry_point; ?></strong></label>
                            <div class="col-sm-9 no-padding-left">
                                <select name="config_point_id" id="input-point-new-post" >
                                    <option value="Выберите отделение">Выберите отделение</option>

                                </select>
                            </div>
                            </div>
                            <div id="np-addr" style="display: none;">
                                <div class="form-group custom-form-group-margin">
                                    <label class="control-label custom-label-checkout" for="input-payment-email"><strong>Адрес:</strong></label>
                                    <div class="one-row-display">
                                        <input type="text" name="addr" value="" placeholder="Укажите адрес для доставки" id="input-addr" class="form-control custom-height" />

                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="new_post_delivery" id="delivery_post_block" style="display: none;">
                            <div class="label-input np-grid">
                                <label class="col-sm-3" for="input-country-delivery"><strong><?php echo $entry_city; ?></strong></label>
                                <div class="col-sm-9 no-padding-left">
                                    <select name="delivery-city" id="input-country-delivery" class="" data-search="true" onchange="getPointDelivery($(this).find(':selected').data('id'))">
                                        <option selected value="Выберите город">Выберите город</option>
                                        <?php foreach ($delivery_cities['data'] as $delivery_city) { ?>
                                        <option value="<?php echo $delivery_city['name'] . ' (' . $delivery_city['regionName'] . ')' ; ?>" data-id="<?php echo $delivery_city['id']; ?>"><?php echo $delivery_city['name']  . ' (' . $delivery_city['regionName'] . ')' ; ?></option>
                                        <?php } ?>
                                    </select>
                                </div>
                            </div>
                            <div class="address-shipping">
                                <label>
                                    <input type="radio" checked name="delivery-sklad" id="delivery-sklad" value="1" >
                                    На отделение:
                                </label>

                                <label style="padding-left: 3%;">
                                    <input type="radio"  name="delivery-sklad" id="delivery-address" value="2" >
                                    Адресная доставка:
                                </label>
                            </div>
                            <div class="delivery-point-subblock" id="delivery-block-show">
                            <label class="col-sm-3 control-label" for="input-point-delivery"><strong><?php echo $entry_point; ?></strong></label>
                            <div class="col-sm-9 no-padding-left">
                                <select name="delivery-point" id="input-point-delivery">
                                    <option value="">Выберите отделение</option>
                                </select>
                            </div>
                            </div>
                            <div id="delivery-addr" style="display: none;">
                                <div class="form-group custom-form-group-margin">
                                    <label class="control-label custom-label-checkout" for="input-payment-email"><strong>Адрес:</strong></label>
                                    <div class="one-row-display">
                                        <input type="text" name="delivery-addr" placeholder="Укажите адрес для доставки" value="" id="delivery-addr" class="form-control custom-height" />

                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="new_post_delivery" id="intime_block" style="display:none;">
                            <div class="label-input np-grid">
                                <label class="col-sm-3" for="input-country-delivery"><strong><?php echo $entry_city; ?></strong></label>
                                <div class="col-sm-9 no-padding-left">
                                    <input type="text" name="intime-city" value="" id="intime-city" class="form-control " />
                                </div>
                            </div>

                            <div class="address-shipping">
                                <label>
                                    <input type="radio" checked name="intime-sklad" id="intime-sklad" value="1" >
                                    На отделение:
                                </label>

                                <label style="padding-left: 3%;">
                                    <input type="radio"  name="intime-sklad" id="intime-address" value="2" >
                                    Адресная доставка:
                                </label>
                            </div>
                            <div id="intime-addr-block" >
                                <div class="form-group custom-form-group-margin">

                                    <div class="one-row-display" style="padding-top: 10px;">
                                        <input type="text" name="intime-addr" placeholder="Укажите адрес для доставки" value="" id="intime-addr" class="form-control" />

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group required" style="clear:both;text-align:center">
                       <!-- <label class="col-lg-4 col-sm-12"></label> -->
                        <button type="button" id="buy" style="margin-left: 0!important;" class="btn btn-primary next-btn register-continue"><i class="list-icon" aria-hidden="true"></i>Оформить мой заказ</button>
                    </div>
                </form>
                <div class="clear"></div>
            </div>
            <?php if(!$logged) { ?>
         <!--   <div class="form-wrap already-buy-here">
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
            </div> -->
            <?php } ?>
        </div>
        <div class="clear"></div>

        <div class="pay-field">







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

       <!-- <div class="title"><?= $entry_order;?></div>-->
        <div class="title">Моя корзина</div>


        <div class="clear"></div>

          <div class=""style="border-bottom: 1px solid #EBEBEB;">
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
          <div class="clear"></div>
          <div class="cart-all-wrap">
              <?php if($total_discount) { ?>
              <div id="discount-row">
                  <div class="cart-all-row">
                      <div class="text-left cart-all-title"><div><?= $text_total_discount;?></div></div>
                      <div class="text-left cart-all-total total-discount"><?= $total_discount;?></div>
                  </div>
              </div>
              <div class="clear"></div>
              <?php } ?>
              <div class="cart-all-row">
                  <?php foreach ($totals as $total) { ?>
                  <div class="text-left cart-all-title"><div><?= $total['title']; ?></div></div>
                  <div class="text-left cart-all-total total-total"><?= $total['text']; ?></div>
                  <?php break;} ?>
              </div>
              <div class="clear"></div>
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

<!--<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/js/select2.min.js"></script> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.11/jquery.mask.min.js"></script>
<script src="catalog/view/javascript/jquery.dd.js" type="text/javascript"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.blockUI/2.70/jquery.blockUI.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.colorbox/1.6.4/jquery.colorbox.js" type="text/javascript"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.17.0/jquery.validate.min.js" type="text/javascript"></script>
<script language="javascript" type="text/javascript">

    window.onload = function() {
    $("html, body").scrollTop(0);
    $('#input-payment-telephone').mask("+38 (999) 999 99 99");
    $('#callback_input_phone_product').mask("+38 (999) 999 99 99");
    $('#input-payment-register-styler').trigger('click');
        setTimeout(function () {
            $('#fiz-ur-styler').trigger('click');
            $('#fiz-ur-styler').trigger('click');
        }, 3000);
        var mozilla = $.browser.mozilla;
        console.log(mozilla);
        if(mozilla == true){
            $('.jq-checkbox__div').before().css('left','-10px');
        };
    $('.buy-1-click-new').click(function(){
        var phone = $('#input-payment-telephone').val();
        clearAlertMessages();

        if (phone.length == 0){
            setAlertMessage('Необходимо указать номер телефона!', $('.phone-block'));
            $('html, body').animate({
                scrollTop: $("#content").offset().top
            }, 20);
            return false;
        }
        $.blockUI({ message: '<div class="spinstyle"><img src="/image/spinner.gif" /></div>' });
        $.ajax({
            type: "POST",
            url: "index.php?route=checkout/checkout/buy1clickCustom",
            data: "telephone=" + phone,
            success: function(data){
                $.unblockUI();
                $('#succes-popup').load("https://budsite.ua/index.php?route=checkout/success/success_popup");
                var el = $('#succes-popup').show();

                $('a.delivery-continue-popup').trigger('click');
                $('#succes-popup').load(json.success);
            }
        }) ;
    });



    };

//    setTimeout(function() {
//        $.ajax({
//            type: "GET",
//            url: "http://www.delivery-auto.com/api/v4/Public/GetAreasList?culture=ru-RU&fl_all=true&country=1",
//            success: function (data) {
//                var options = '';
//                for (var i = 0; i < data.data.length; i++) {
//                    if(data.data[i].ExtracityPickup === false) {
//                        options += '<option value="' + data.data[i].name + '" data-id="'+ data.data[i].id +'">' + data.data[i].name + '</option>';
//                    }
//                }
//                $('#input-country-delivery').append(options);
//
//                $('#input-country-delivery').trigger('refresh');
//            }
//        });
//    },200);
//    $(document).ready(function(e) {
//        try {
//            $(".msselect").msDropDown();
////            $(".test").msDropDown();
//        } catch(e) {
//            alert(e.message);
//        }
//    });

    //Select NP
//    $(document).ready(function() {
//        $(".test").select2({
//
//            ajax: {
//                url: "http://www.delivery-auto.com/api/v4/Public/GetAreasList?culture=ru-RU&fl_all=true&country=1",
//                type: 'post',
//                dataType: 'json',
//                delay: 250,
//                data: function (params) {
//                    var jsona = {
//                        modelName: "AddressGeneral",
//                        calledMethod: "getSettlements",
//                        apiKey: "78bcd5e342ce167eaa57ad06f4b3c5a4",
//                        methodProperties: {
//                            Page: "1",
//                            Warehouse: "1",
//                            FindByString: params.term
//                        }
//                    };
//                     return JSON.stringify(jsona)
//
//                },
//                processResults: function (json, params) {
//                    // parse the results into the format expected by Select2
//                    // since we are using custom formatting functions we do not need to
//                    // alter the remote JSON data, except to indicate that infinite
//                    // scrolling can be used
//                    params.page = params.page || 1;
//

//                    return {
//                        results:
//
////                        pagination: {
////                            more: (params.page * 30) < data.total_count
////                        }
//                    };
//                },
//                success: function(json){
//                    console.log(json);
//                    setTimeout(function() {
//                        console.log(json);
//                        var options = '';
//                        for (var i = 0; i < json['data'].length; i++) {
////                            options += '<li class="select2-results__options" >' + json['data'][i].DescriptionRu + '</li>';
//                            options += '<li class="select2-results__option" role="treeitem" aria-selected="true">' + json['data'][i].DescriptionRu + '</li>';
//                        }
//                        $(".select2-results__options").html(options);
//                    }, 300);
//                },
//                cache: true
//            },
//
//            minimumInputLength: 2
//        });
//
//    });


    //Search from NP select
//    $(function() {
//        $('.select2-search__field').keyup(function () {
//            var test = $('.select2-search__field').val();
//            var jsona = {
//                modelName: "AddressGeneral",
//                calledMethod: "getSettlements",
//                apiKey: "78bcd5e342ce167eaa57ad06f4b3c5a4",
//                methodProperties: {
//                    Page: "1",
//                    Warehouse: "1",
//                    FindByString: test
//                }
//            };
//
//            $.ajax({
//                type: "POST",
//                url: "http://api.novaposhta.ua/v2.0/json/",
//                headers: "Content-Type": "application/json",
//                data: JSON.stringify(jsona)
//
//            });
//
//        });
//    });


    $(document).ready(function(){
    setTimeout(function(){
        $('#deliviries-styler li').click(function(){
            var shipping_company = $('.jq-selectbox__select-text').eq(1).text();
//            console.log(shipping_company);
            if( shipping_company === 'Новая Почта') {
                $('#delivery_post_block').hide();
                $('#intime_block').hide();
                $('#np_block').show();
            }else{ if(shipping_company === "Delivery") {
                $('#np_block').hide();
                $('#intime_block').hide();
                $('#delivery_post_block').show();
//                console.log(shipping_company);
            }if(shipping_company === "InTime"){
                $('#delivery_post_block').hide();
                $('#np_block').hide();
                $('#intime_block').show();
            }
            }
        });
    }, 20);
    });

//Class listener
function addClassNameListener(elemId, callback, callback1) {

    var elem = document.getElementById(elemId);
    var lastClassName = elem.className;

    window.setInterval( function() {

        var className = elem.className;

        if (className !== lastClassName) {

            if(className.indexOf('checked') + 1){

                callback();
                lastClassName = className;

            }else callback1();

        }

    },10);

}

    function getPointDelivery(id) {

        $.ajax({
            url: "index.php?route=checkout/checkout/getPointDelivery",
            data: 'id='+id,
            method: 'GET',
            success: function (data) {
                    var obj = jQuery.parseJSON(data);
                    var options = '';
                    $("#input-point-delivery").children().remove();

                    for (var i = 0; i < obj.data.length; i++) {
                        if(obj.data.length > 1) {
                            options += '<option value="' + obj.data[i].name + obj.data[i].address + '">' + obj.data[i].name + ' (' + obj.data[i].address + ')</option>';
                        }else{
                            options += '<option value="' + obj.data[i].address + '">' + obj.data[i].address + '</option>';
                        }
                    }

                    $('#input-point-delivery').append(options);
                    $('#input-point-delivery').trigger('refresh');

            }
        });
    }


    $(window).load(function () {


        addClassNameListener("payment3-styler", function(){
            $('.nal-payment').show();
//                $('#shipping-post-styler').closest('.radio').show();
//                $('#shipping-post-styler').click();
        },
        function(){
            $('.nal-payment').hide();
        });

        addClassNameListener("payment4-styler" , function(){
                $('#shipping-post-styler').closest('.radio').hide();
//                $('#shipping-self-styler').click();
                $('#shipping-self-styler').trigger('click');
//                setTimeout(function() {
//                    $('input, select').trigger('refresh');
//                }, 1)
        },
        function(){
            $('#shipping-post-styler').closest('.radio').show();
//            $('#shipping-post-styler').click();
//            $('#shipping-post-styler').trigger('click');

        });
//
        addClassNameListener("ur-styler", function(){
                $('.ur-lico').show();
                $('.fiz-lico').hide();
            },
            function(){
                $('.fiz-lico').show();
                $('.ur-lico').hide();
            });
//
        addClassNameListener("shipping-post-styler", function(){
            $('.hide-select').show();}, function(){
            $('.hide-select').hide();
            $('.deliveries-block-all').hide();});

        addClassNameListener("shipping-self-styler", function(){
            $('.self-shipping-block').show();}, function(){
            $('.self-shipping-block').hide();
            $('.deliveries-block-all').show();});
//
        addClassNameListener("np-address-styler",  function(){
            $('#np-point').hide();
            $('#np-addr').show()}, function(){
            $('#np-point').show();
            $('#np-addr').hide();
            });
        addClassNameListener("delivery-sklad-styler",  function(){
            $('#delivery-block-show').show();
            $('#delivery-addr').hide();
            $('#np_block').hide();}, function(){
            $('#delivery-block-show').hide();
            $('#delivery-addr').show();
        });
        addClassNameListener("delivery-address-styler",  function(){
            $('.delivery-point-subblock').hide();}, function(){
            $('.delivery-point-subblock').show();
        });
    });


</script>
<script type="text/javascript">
    $(window).load(function () {


        $('#want-contract-styler').click(function () {
            if($('#want-contract').is(':checked') === true){
                $('.want-contract').show();
            }else {
                $('.want-contract').hide();
            }
        });

    });
        setAlertMessage = function (msg, $elem) {
            $elem.before('<span class="checkout-error"><i class="fa fa-chain-broken" style="font-size: 1.2em;margin-right: 10px;"></i>' + msg + '</span>');
        };

        function clearAlertMessages() {
            $(".checkout-error").remove();
        }

        function validateEmail($email) {
            var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,6})?$/;
            return emailReg.test($email);
        }


    $('#buy').click( function() {

        var data = $('#order-form').serialize();
        var shipping_company = $( ".msselect option:selected" ).val();
        var email = $('#input-payment-email').val();
        var phone = $('#input-payment-telephone').val();
        var lastname = $('#input-payment-lastname').val();
        var firstname = $('#input-payment-firstname').val();
        clearAlertMessages();



        if (lastname.length == 0){
            setAlertMessage('Необходимо указать фамилию!', $('.lastname-block'));
            $('html, body').animate({
                scrollTop: $("#content").offset().top
            }, 20);
            $('input[name=lastname]').focus();
            return false;
        }

        if (firstname.length == 0){
            setAlertMessage('Необходимо указать имя!', $('.firstname-block'));
            $('html, body').animate({
                scrollTop: $("#content").offset().top
            }, 20);
            $('input[name=firstname]').focus();
            return false;
        }

        if (phone.length == 0){
            setAlertMessage('Необходимо указать номер телефона!', $('.phone-block'));
            $('html, body').animate({
                scrollTop: $("#content").offset().top
            }, 20);
            $('input[name=telephone]').focus();
            return false;
        }

        if (email.length == 0){
            setAlertMessage('Необходимо указать email!', $('.email'));
            $('html, body').animate({
                scrollTop: $("#input-payment-telephone").offset().top
            }, 20);
            $('input[name=email]').focus();
            return false;
        }else {
            if(!validateEmail(email)){
                setAlertMessage('Указан неправильный email!', $('.email'));
                $('html, body').animate({
                    scrollTop: $("#input-payment-telephone").offset().top
                }, 20);
                $('input[name=email]').focus();
                return false;
            }
        }

//        if (!$('[name=payment]').is('checked')){
//            setAlertMessage('Выберите способ оплаты!', $('#payment-block'));
//            $('html, body').animate({
//                scrollTop: $("#input-payment-telephone").offset().top
//            }, 20);
//            return false;
//        }

//        if ($( ".msselect option:selected" ).val() == 1){
//            if($('#input-country-new-post-styler option:selected').val() === 'Выберите город'){
//                setAlertMessage('Выберите город доставки!', $('.hide-select'));
//                return false;
//            }
//
//        }

        $.blockUI({ message: '<div class="spinstyle"><img src="/image/spinner.gif" /></div>' });
        $.ajax({
            url:  "index.php?route=checkout/checkout/success",
            method: "POST",
            data: data + '&shipping_company=' + shipping_company,
            success: function(response){
                var json = JSON.parse(response);
                if(json.success){
                    $.unblockUI();
                    $('a.delivery-continue-popup').trigger('click');
                    $('#succes-popup').load(json.success);
                }
            }
        });
    });

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


</script>
<?php echo $footer; ?>