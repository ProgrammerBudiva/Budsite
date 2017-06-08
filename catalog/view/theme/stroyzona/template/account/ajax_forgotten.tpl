
    <div id="forgotten-errors"></div>
    <div class="forgot-pass"><?php echo $content_top; ?>
      <h4><i class="fa fa-key"></i><?php echo $heading_title; ?></h4>
      <p><?php echo $text_email; ?></p>
      <form action="javascript:void(null);" onsubmit="ajax_forgotten()"  method="post" enctype="multipart/form-data">
        <fieldset>
          <div class="form-group required">
            <label class="control-label" for="input-email"><?php echo $entry_email; ?></label>
            <input type="email" name="email" value="" placeholder="<?php echo $entry_email; ?>" id="input-email-forgotten" class="form-control" />
          </div>
        </fieldset>
        <div class="buttons clearfix">
          <div class="pull-left">
              <a class="btn back-to"><i class="fa fa-angle-left"></i><?php echo $button_back; ?></a>
          </div>
          <div class="pull-right" id="buttonSubmit">
            <input type="submit" value="<?php echo $button_continue; ?>" class="btn btn-primary" />
          </div>
        </div>
      </form>
    </div>



<script type="text/javascript">
    $("#top-links .forgotten").live('click', function(){
        $('.user-forms-restore').show();
    });
    $('.back-to').live('click', function(){
        $('.user-forms-login').show();
        $('.user-forms-restore').hide();
        $('.links-change').show();
    });

    function ajax_forgotten(){
        $('.user-forms-login').hide();
        var action = '<?php echo $action; ?>';
        var email = $('#input-email-forgotten').attr('value');
        var success_link = false;
        $.post(
                action,
                {email: email},
                function(response){
                    var json_response = JSON.parse(response);
                    $('.alert-danger').remove();
                    $('.alert-success').remove();
                    for (var i =0; i < json_response.length; i++){
                        if(json_response[i].warning){
                            $('#forgotten-errors').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle">'+json_response[i].warning+'</i></div>');
                        }
                        if(json_response[i].success_message){
                            $('#forgotten-errors').after('<div class="alert alert-success">'+json_response[i].success_message+'</div>')
                        }
                        if(json_response[i].success){
                                window.success_link = json_response[i].success;
                        }
                    }

                    $("#buttonSubmit").replaceWith();
                }
        );
    }
</script>