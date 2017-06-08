    <div class="login-field">
        <div id="login-errors"></div>
        <div class="row">
            <div class="col-sm-12">
              <div class="form-wrap">
                <form action="javascript:void(null);" onsubmit="ajax_login()" method="post" enctype="multipart/form-data">
                  <div class="form-group">
                    <label class="control-label" for="input-email"><?php echo $entry_email; ?></label>
                    <input type="text" name="email" <?php if(isset($_COOKIE['email'])) { ?> value="<?php echo $_COOKIE['email']?>" <?php } ?> placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control" />
                  </div>
                  <div class="form-group">
                    <label class="control-label" for="input-password"><?php echo $entry_password; ?></label>
                    <input type="password" name="password" <?php if(isset($_COOKIE['pass'])) { ?> value="<?php echo $_COOKIE['pass']?>" <?php } ?> placeholder="<?php echo $entry_password; ?>" id="input-password" class="form-control" />
                  </div>
                    <div class="form-group">
                        <label class="control-label" for="input-login-remember"><?php echo $remember_me; ?></label>
                        <input type="checkbox" name="checkbox" id="input-login-remember"/>
                    </div>
                  <div class="form-group form-control-field">
                    <input type="submit" value="<?php echo $button_login; ?>" class="btn btn-primary" />
                    <a class="forgotten"><i class="fa fa-key"></i><?php echo $text_forgotten; ?></a>
                  </div>
                  <?php if ($redirect) { ?>
                  <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
                  <?php } ?>
                </form>
              </div>
            </div>
        </div>
    </div>
    <div class="row">
          <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
              <div class="well">
              <p><?php echo $text_mess_social; ?></p>
                  <?php echo $content_bottom; ?>
              </div>
          </div>
      </div>
    <script type="text/javascript">
    $(document).ready(function(){
        $('input[type=checkbox]').styler();
        $('.dropdown-menu-right').append("<div class='pseudo'></div>");
         $('.user-forms-restore').load('<?php echo $forgotten;?>');
    })
        function ajax_login(){
            var action = '<?php echo $action; ?>';
            var email = $('#input-email').attr('value');
            var password = $('#input-password').attr('value');
            var ischecked = $("#input-login-remember").prop("checked");

            $.post(
                    action,
                    {email: email, password: password},
                    function(response){
                        var json_response = JSON.parse(response);
                        $('.alert-danger').remove();
                        for (var i =0; i < json_response.length; i++){
                            if(json_response[i].warning){
                                $('#login-errors').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle">'+json_response[i].warning+'</i></div>');
                            }

                            if(json_response[i].success){
                                if(ischecked) {
                                    $.removeCookie("email");
                                    $.cookie("email", email, {expires: 10});
                                }
                                console.log(json_response[i].success);
                                window.location.href = json_response[i].success;
                            }
                        }
                    }
            );
        }
        $('.forgotten').live('click', function(){

            $('.user-forms-restore').show();
            $('.links-change').hide();
            $('.user-forms-login').hide();
        });

    </script>
