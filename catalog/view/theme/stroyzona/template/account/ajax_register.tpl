<?php if ($error_warning) { ?>
  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div><?php } ?>
<div class="register-field"><?php echo $content_top; ?>
  <div class="form-wrap">
    <h3><?php echo $heading_title; ?></h3>

    <form action="javascript:void(null);" onsubmit="ajax_register()" method="post" enctype="multipart/form-data">
      <fieldset id="account">
        <div class="form-group required" style="display: <?php echo(count($customer_groups) > 1 ? 'block' : 'none'); ?>;">
          <label class="control-label"><?php echo $entry_customer_group; ?></label>
          <div class="col-sm-12">
            <?php foreach ($customer_groups as $customer_group) { ?><?php if ($customer_group['customer_group_id'] == $customer_group_id) { ?>
              <div class="radio">
                <label>
                  <input type="radio" name="customer_group_id" value="<?php echo $customer_group['customer_group_id']; ?>"
                         checked="checked" /><?php echo $customer_group['name']; ?></label>
              </div><?php }
            else { ?>
              <div class="radio">
                <label>
                  <input type="radio" name="customer_group_id"
                         value="<?php echo $customer_group['customer_group_id']; ?>" /><?php echo $customer_group['name']; ?></label>
              </div><?php } ?><?php } ?>
          </div>
        </div>
        <div class="form-group required">
          <label class="control-label" for="input-register-firstname"><?php echo $entry_firstname; ?></label>
          <input type="text" name="firstname" <?php if (isset($_COOKIE['name'])) { ?> value="<?php echo $_COOKIE['name'] ?>" <?php } ?>
                 placeholder="<?php echo $entry_firstname; ?>" id="input-register-firstname" class="form-control" />
          <div class="text-danger"><?php echo $error_firstname; ?></div>
        </div>
        <div class="form-group required">
          <label class="control-label" for="input-register-email"><?php echo $entry_email; ?></label>
          <input type="email" name="email" <?php if (isset($_COOKIE['email'])) { ?> value="<?php echo $_COOKIE['email'] ?>" <?php } ?>
                 placeholder="<?php echo $entry_email; ?>" id="input-register-email" class="form-control" /> <?php if ($error_email) { ?>
            <div class="text-danger"><?php echo $error_email; ?></div>    <?php } ?>
          <div class="text-necessarily"><?php echo $entry_necessarily; ?></div>
        </div>
        <div class="form-group required">
          <p><?php echo $text_terms_of_use; ?><a class="terms-of-use" data-href="<?php echo $terms_href; ?>" href="#termsOfUse"
                                                 data-effect="mfp-zoom-in"><?php echo $text_terms_of_use_link; ?></a></p>
        </div>
        <div class="form-group captcha-group">
          <label class="control-label capcha-label" for="input-captcha"><?php echo $entry_captcha; ?></label>
          <input type="text" name="captcha" value="" id="input-captcha" class="form-control" />
          <div id="captchaWrap">
            <img src="index.php?route=tool/captcha" alt="" id="captcha" />
          </div>
        </div>
      </fieldset>
      <div class="buttons">
        <div class="pull-right">
          <a class="thanks-popup" href="#thanksPopup" data-effect="mfp-zoom-in"><input id="button_submit_registration" type="submit"
                                                                                       value="<?php echo $button_continue; ?>"
                                                                                       class="btn btn-primary" /></a>
        </div>
        <div class="clear"></div>
      </div>

    </form>
    <div class="row">
      <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
        <div class="well">
          <p><?php echo $text_message_social; ?></p><?php echo $content_bottom; ?>
        </div>
      </div>
    </div>

  </div>
</div></div></div>

<div id="termsOfUse" class="white-popup mfp-with-anim mfp-hide">
  <div id="loadedTerms">

  </div>
</div>

<div id="thanksPopup" class="white-popup mfp-with-anim mfp-hide">
  <div>
    <h3><?php echo $thanks_for_register ?></h3>
    <p><?php echo $thanks_for_register_text ?></p>
  </div>
</div>

<script type="text/javascript"><!--
  // Sort the custom fields
  function notRobot() {
    $("#button_submit_registration").removeAttr("disabled");
  }

  $(document).ready(function () {
    $('.terms-of-use').magnificPopup({
      removalDelay: 500,
      callbacks: {
        beforeOpen: function () {
          this.st.mainClass = this.st.el.attr('data-effect');
          var href = this.st.el.attr('data-href');
          if (!this.st.el.hasClass('loaded')) {
            $.ajax({
              url: href,
              success: function (json) {
                $('.terms-of-use').addClass('loaded');
                $('#loadedTerms').html(json);
              },
              error: function (xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
              }
            });
          }
        }
      },
      midClick: true
    });
    $('input[type=checkbox]').styler();

  });


  $('#account .form-group[data-sort]').detach().each(function () {
    if ($(this).attr('data-sort') >= 0 && $(this).attr('data-sort') <= $('#account .form-group').length) {
      $('#account .form-group').eq($(this).attr('data-sort')).before(this);
    }

    if ($(this).attr('data-sort') > $('#account .form-group').length) {
      $('#account .form-group:last').after(this);
    }

    if ($(this).attr('data-sort') < -$('#account .form-group').length) {
      $('#account .form-group:first').before(this);
    }
  });

  $('#address .form-group[data-sort]').detach().each(function () {
    if ($(this).attr('data-sort') >= 0 && $(this).attr('data-sort') <= $('#address .form-group').length) {
      $('#address .form-group').eq($(this).attr('data-sort')).before(this);
    }

    if ($(this).attr('data-sort') > $('#address .form-group').length) {
      $('#address .form-group:last').after(this);
    }

    if ($(this).attr('data-sort') < -$('#address .form-group').length) {
      $('#address .form-group:first').before(this);
    }
  });

  $('input[name=\'customer_group_id\']').on('change', function () {
    $.ajax({
      url: 'index.php?route=account/register/customfield&customer_group_id=' + this.value,
      dataType: 'json',
      success: function (json) {
        $('.custom-field').hide();
        $('.custom-field').removeClass('required');

        for (i = 0; i < json.length; i++) {
          custom_field = json[i];

          $('#custom-field' + custom_field['custom_field_id']).show();

          if (custom_field['required']) {
            $('#custom-field' + custom_field['custom_field_id']).addClass('required');
          }
        }


      },
      error: function (xhr, ajaxOptions, thrownError) {
        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
      }
    });
  });

  $('input[name=\'customer_group_id\']:checked').trigger('change');
  //--></script>
<script type="text/javascript"><!--
  $('button[id^=\'button-custom-field\']').on('click', function () {
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
          complete: function () {
            $(node).button('reset');
          },
          success: function (json) {
            $(node).parent().find('.text-danger').remove();

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
  //--></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.blockUI/2.70/jquery.blockUI.min.js"></script>

<script type="text/javascript">
  function ajax_register() {
    var action = '<?php echo $action;?>';
    var name = $('#input-register-firstname').val();
    var email = $('#input-register-email').val();
    var ischecked = $("#input-register-remember").prop("checked");
    var captcha = $("#input-captcha").val();
    var agree = true;

    $.blockUI({message: '<img src="/image/spinner.gif" /> <br/><h2>Ожидайте завершения регистрации...</h2>'});

    $.post(
      action,
      {
        firstname: name, email: email, captcha: captcha, agree: agree
      },
      function (response) {
        console.log(response);

        $.unblockUI();

        if (ischecked) {
          $.removeCookie("name");
          $.removeCookie("email");
          $.cookie("name", name, {expires: 10});
          $.cookie("email", email, {expires: 10});
        }

        var json_response = JSON.parse(response);
        $('.text-danger').remove();
        if (json_response.captcha) {
          $('#input-captcha').after('<div class="text-danger">' + json_response.captcha + '</div>');
        }
        if (json_response.email) {
          $('#input-register-email').after('<div class="text-danger">' + json_response.email + '</div>');
        }
        if (json_response.email_exist) {
          $('#input-register-email').after('<div class="text-danger">' + json_response.email_exist + '</div>');
        }

        if (json_response.firstname) {
          $('#input-register-firstname').after('<div class="text-danger">' + json_response.firstname + '</div>');
        }

        if (json_response.success == 'ok') {
          $('.thanks-popup').magnificPopup({
            removalDelay: 500, //delay removal by X to allow out-animation
            callbacks: {
              beforeOpen: function () {
                this.st.mainClass = this.st.el.attr('data-effect');
              },
              close: function () {
                location.reload();
              }
            },
            midClick: true
          });
          $(".thanks-popup").click();
          console.log('ok');
        }

        $('#captcha').attr('src', 'index.php?route=tool/captcha#' + new Date().getTime());
        $('input[name=\'captcha\']').val('');

      });
  }

  //--></script>
<script type="text/javascript"><!--
  $('select[name=\'country_id\']').on('change', function () {
    $.ajax({
      url: 'index.php?route=account/account/country&country_id=' + this.value,
      dataType: 'json',
      beforeSend: function () {
        $('select[name=\'country_id\']').after(' <i class="fa fa-circle-o-notch fa-spin"></i>');
      },
      complete: function () {
        $('.fa-spin').remove();
      },
      success: function (json) {
        if (json['postcode_required'] == '1') {
          $('input[name=\'postcode\']').parent().parent().addClass('required');
        } else {
          $('input[name=\'postcode\']').parent().parent().removeClass('required');
        }

        html = '<option value=""><?php echo $text_select; ?></option>';

        if (json['zone'] != '') {
          for (i = 0; i < json['zone'].length; i++) {
            html += '<option value="' + json['zone'][i]['zone_id'] + '"';

            if (json['zone'][i]['zone_id'] == '<?php echo $zone_id; ?>') {
              html += ' selected="selected"';
            }

            html += '>' + json['zone'][i]['name'] + '</option>';
          }
        } else {
          html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
        }

        $('select[name=\'zone_id\']').html(html);
      },
      error: function (xhr, ajaxOptions, thrownError) {
        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
      }
    });
  });

  $('select[name=\'country_id\']').trigger('change');


  //--></script>
