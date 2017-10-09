<?php echo $header; ?>
<link rel="stylesheet" href="/catalog/view/theme/stroyzona/stylesheet/contacts.css">
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
      <h3><?php echo $text_location; ?></h3>
      <div class="panel panel-default">
        <div class="panel-body">
          <div class="content-block-wrapper">
            <div class="content-block">
              <div id="shipping-info" style=""><img class="img-mobile" style="margin-top: -17px;" src="/image/contacts/shipped.png" alt="">
                <div class="text-block" style="margin-left: 20px;display: inline-block;"><b>Минимальной суммы заказа нет!</b>
                  <div>Доставим Ваш заказ в любой населенный пункт Украины!</div>
                </div>
              </div>

              <div style="padding-top: 15px;"><img class="img-mobile" style="margin-top: -17px;" src="/image/contacts/phone-call.png" alt="">
                <div class="text-block" style="margin-left: 20px; display: inline-block;"><b>Для консультаций и заказов:</b>
                  <div>(044) 390 20 40 , (067) 480 72 75</div>
                </div>
              </div>

              <div style="padding-top: 15px;"><img style="margin-top: 8px;vertical-align: top;" src="/image/contacts/stopwatch.png" alt="">
                <div class="text-block" style="margin-left: 20px; display: inline-block;"><b>График работы:</b>
                  <div>ПН - ПТ: 9.00 - 18.00 (без перерыва)</div>
                  <div>СБ - ВС: выходной</div>
                </div>
              </div>

              <div style="padding-top: 15px;"><img style="margin-top: 4px;vertical-align: top;" src="/image/contacts/paper-plane.png" alt="">
                <div class="text-block" style="margin-left: 20px; display: inline-block;"><b>Email адрес</b>
                  <div><a style="color: #EB5D0A;" href="mailto:info@budsite.ua">info@budsite.ua</a> - для заказов,</div>
                  <div><a style="color: #EB5D0A;" href="mailto:info@budsite.ua">info@budsite.ua</a> - для коммерческих предложений</div>
                </div>
              </div>

         </div>
            <div class="content-block">
            <div class="self-shipping"><img style="margin-top: 6px; vertical-align: top;margin-right: -20px;" src="/image/contacts/placeholder.png" alt="">
              <div class="text-block" style="margin-left: 20px;display: inline-block;"><b style="padding-left: 22px;">Пункты самовывоза:</b>
                <div><ul>
                    <li>Киев, ул. Стройиндустрии, 7</li>
                    <li>Одесса, 1-й Промышленный пер., 9</li>
                    <li>Днепр, ул. Квитки-Основьяненко, 5</li>
                    <li>Полтава, Перспективный пер., 10</li>
                    <li>Запорожье, ул Можайская, 63</li>
                    <li>Херсон, ул Ладычука, 161</li>
                    <li>Кривой Рог, ул Волгоградская, 4</li>
                  </ul>
                 </div>
              </div>
              <div style="max-width: 78%;padding-left: 57px;">Самовывоз возможен не для всех групп товаров. При оформлении Вашего заказа уточним информацию по интересующей позиции.</div>
            </div>
          </div>
          </div>
          <br/>
          
          <div id="map" style="width: 100%; height: 400px; border:1px solid #ffcda5 ">
            <script>
                var map;
                function initMap() {
                    map = new google.maps.Map(document.getElementById('map'), {
                        center: {lat: 49.219212, lng: 32.058926},
                        zoom: 6
                    });

                var myLatLng = {lat: 46.4777445, lng: 30.6825581};
                var locations = [
                    ["Одесса, пер 1-й Промышленный переулок, 9", 46.4777445, 30.6825581],
                    ["Киев, ул. Стройиндустрии, 7", 50.3996295,30.56986],
                    ["Днепр, ул. Квитки-Основьяненко, 5", 48.4880644, 34.9623325],
                    ["Полтава, пер. Перспективный, 10", 49.5930694, 34.4819534],
                    ["Кривой Рог, ул. Волгоградская, 4", 47.9169497, 33.3882049],
                    ["Запорожье, ул. Можайская, 63", 47.872637, 35.1202843],
                    ["Херсон, ул. Ладычука, 161", 46.6592246, 32.6226012]
                ];

                var infowindow = new google.maps.InfoWindow();
                var marker, i;
                var image = {
                    url: 'http://budsite.dev/image/marker.png'
                };


                for (i = 0; i < locations.length; i++) {
                    marker = new google.maps.Marker({
                        position: new google.maps.LatLng(locations[i][1], locations[i][2]),
                        map: map,
                        icon: image
                    });

                    google.maps.event.addListener(marker, 'click', (function(marker, i) {
                        return function() {
                            infowindow.setContent(locations[i][0]);
                            infowindow.open(map, marker);
                            map.setZoom(14);
                            map.setCenter(marker.getPosition());
                        }
                    })(marker, i));
                }

                google.maps.event.addListener(infowindow, 'closeclick', function () {
                    map.setCenter({lat: 49.219212, lng: 32.058926});
                    map.setZoom(6);
                });


                }

            </script>
            <script async defer
                    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCVNBG7Mcm5hZ4HYjat58a7AyYAUqtsTP8&callback=initMap">
            </script>
           <!-- <iframe src="https://www.google.com/maps/d/embed?mid=1W24N8VSrunDi2jIji6RxjOdnQLY" width="100%" height="420"></iframe>-->
          </div>
        </div>
      </div>
      <?php if ($locations) { ?>
      <h3><?php echo $text_store; ?></h3>
      <div class="panel-group" id="accordion">
        <?php foreach ($locations as $location) { ?>
        <div class="panel panel-default">
          <div class="panel-heading">
            <h4 class="panel-title"><a href="#collapse-location<?php echo $location['location_id']; ?>" class="accordion-toggle" data-toggle="collapse" data-parent="#accordion"><?php echo $location['name']; ?> <i class="fa fa-caret-down"></i></a></h4>
          </div>
          <div class="panel-collapse collapse" id="collapse-location<?php echo $location['location_id']; ?>">
            <div class="panel-body">
              <div class="row">
                <?php if ($location['image']) { ?>
                <div class="col-sm-3"><img src="<?php echo $location['image']; ?>" alt="<?php echo $location['name']; ?>" title="<?php echo $location['name']; ?>" class="img-thumbnail" /></div>
                <?php } ?>
                <div class="col-sm-3"><strong><?php echo $location['name']; ?></strong><br />
                  <address>
                  <?php echo $location['address']; ?>
                  </address>
                  <?php if ($location['geocode']) { ?>
                  <a href="https://maps.google.com/maps?q=<?php echo urlencode($location['geocode']); ?>&hl=en&t=m&z=15" target="_blank" class="btn btn-info"><i class="fa fa-map-marker"></i> <?php echo $button_map; ?></a>
                  <?php } ?>
                </div>
                <div class="col-sm-3"> <strong><?php echo $text_telephone; ?></strong><br>
                  <?php echo $location['telephone']; ?><br />
                  <br />
                  <?php if ($location['fax']) { ?>
                  <strong><?php echo $text_fax; ?></strong><br>
                  <?php echo $location['fax']; ?>
                  <?php } ?>
                </div>
                <div class="col-sm-3">
                  <?php if ($location['open']) { ?>
                  <strong><?php echo $text_open; ?></strong><br />
                  <?php echo $location['open']; ?><br />
                  <br />
                  <?php } ?>
                  <?php if ($location['comment']) { ?>
                  <strong><?php echo $text_comment; ?></strong><br />
                  <?php echo $location['comment']; ?>
                  <?php } ?>
                </div>
              </div>
            </div>
          </div>
        </div>
        <?php } ?>
      </div>
      <?php } ?>

        <div style="padding-bottom: 15px;" class="review-drop col-md-12 col-sm-12 col-xs-12 " ><a name="form-review"></a>
          <h3 style="color:#FF6600;padding-left:12px;margin-top:0;">Написать нам</h3>
          <div class="form-group">
            <div class="col-sm-6 required">
              <label class=" required control-label"
                     for="name"><?php echo $entry_name; ?></label>
              <input  type="text" name="name" value="" id="name"
                      class="form-control"/>
            </div>
          </div>

          <div class="form-group">
            <div class="col-sm-6 required">
              <label class=" required control-label"
                     for="email">Ваш Email</label>
              <input  type="text" name="email" value="" id="email"
                      class="form-control"/>
            </div>
          </div>


        <div class="reverse-block">
          <div class="form-group required">
            <div class="col-sm-6">
              <label class="control-label"
                     for="review"><?php echo $entry_enquiry; ?></label>
              <textarea name="text" rows="5" id="review"
                        class="form-control"></textarea>

              <div class="help-block"><?php echo $text_note; ?></div>
            </div>
          </div>

        <div class="form-group">
            <div class="col-sm-6 ">
                <label class="control-label"
                       for="phone">Ваш телефон</label>
                <input  type="text" name="phone" value="" id="phone"
                        class="form-control"/>
            </div>
        </div>
        </div>

          <div class="buttons">
            <div class="pull-left" style="padding-bottom: 2%;">
              <button style="border-radius: 10px; height: 45px;margin-left: 15px;margin-top: 17px;" type="button" id="button-review"
                      data-loading-text="<?php echo $text_loading; ?>" data-news="<?php echo $news_id; ?>"
                      class="review-btn btn btn-primary">Жду Вашего ответа</button>
              <a href="#succes-popup" id="" class="btn btn-primary next-btn delivery-continue-popup" style="visibility: hidden" data-effect="mfp-zoom-in"><?php echo $button_continue;?></a>
              <div id="succes-popup" class="white-popup mfp-with-anim mfp-hide"></div>
            </div>
          </div>

        </div>
      </form>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>

<script>
    $('#phone').mask("+38 (999) 999 99 99");
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


  $('#button-review').click(function(){

      clearAlertMessages();

      var name = $('#name').val();
      var email = $('#email').val();
      var phone = $('#phone').val();
      var review = $('#review').val();

      if (name.length == 0){
          setAlertMessage('Необходимо указать имя!', $('#name'));
          $('input[name=name]').focus();
          return false;
      }

      if (email.length == 0){
          setAlertMessage('Необходимо указать email!', $('#email'));
          $('input[name=email]').focus();
          return false;
      }else {
          if(!validateEmail(email)){
              setAlertMessage('Указан неправильный email!', $('#email'));
              $('input[name=email]').focus();
              return false;
          }
      }

      if (review.length == 0){
          setAlertMessage('Напишите ваше сообщение!', $('#review'));
          $('input[name=review]').focus();
          return false;
      }

                $.ajax({
                    url: 'index.php?route=information/contact/validate_form',
                    type: 'POST',
                    data: 'name=' + name +'&email=' + email + '&enquiry=' + review + '&phone=' + phone,
                    success: function (data) {

                        if(data != 1){
                            console.log(data);
                            var errors = JSON.parse(data);

                            if (errors.enquiry){
                                setAlertMessage('Напишите ваше сообщение!', $('#review'));
                                $('input[name=review]').focus();
                            }

                            if (errors.name){
                                setAlertMessage('Необходимо указать имя!', $('#name'));
                                $('input[name=name]').focus();
                            }
                        }else {
                            $('#succes-popup').load("/index.php?route=information/contact/success_popup");
                            $('a.delivery-continue-popup').trigger('click');
                        }
                    }
                });
//            }
//        }
//    });



  });
</script>

