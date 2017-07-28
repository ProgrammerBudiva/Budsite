<?php echo $header; ?>
<link href="catalog/view/theme/stroyzona/stylesheet/reviewStars.css" rel="stylesheet">
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <div class="row" ><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <div class="title-wrap-bord">
                              <a class="title-module"><h1 style="color: #f60"><?php echo $heading_title;?></h1></a>
                          </div>
	  <?php if ($image) { ?>
	  <div class="text-left news-img-wrap">
	  <img src="<?php echo $image; ?>" alt="<?php echo $heading_title; ?>" />
	  </div>
	  <?php } ?>
	  <p><?php echo $description; ?></p>
	  <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
    <div>
        <div class="review col-sm-12">
            <hr>

            <?php if ($reviews) { ?>
            <?php foreach ($reviews as $review) { ?>
            <div class=" padding col-md-12 col-sm-12 col-xs-12 ">
                <div class="col-md-3 col-sm-3 col-xs-3 " style="width: 7%; color: #444">
                    <strong><?php echo $review['author']; ?></strong>
                </div>
                <!-- <div class="review-date col-md-9 col-sm-9 col-xs-9 text-right"><?php echo $review['date_added']; ?></div>-->

                <div class="review-field ">
                    <div class="col-md-9 col-sm-9 col-xs-9 text-left single-review">
                        <p><?php echo $review['text']; ?></p>
                    </div>
                </div>
            </div>
            <?php } ?>
            <div class="col-sm-12 text-center"><?php echo $pagination; ?></div>
            <?php } else { ?>
            <p style="padding-left: 30px;"><?php echo $text_no_reviews; ?></p>
            <?php } ?>
            <div class="clear"></div>
            <style>
                .review-field {
                    width: 70%;
                }
                .padding {
                    padding-bottom: 2%;
                }
                .news-img-wrap img {
                    width:100%;
                }
            </style>
        </div>

        <form class="form-horizontal">
            <div id="reviewnews" class="col-sm-12"></div>
            <!--  <div class="review-btn btn btn-primary"><?php echo $text_write; ?></div> -->

            <div class="review-drop col-md-12 col-sm-12 col-xs-12 ">

                <div class="form-group">
                    <div class="col-sm-6 required">
                        <label class=" required control-label"
                               for="input-name"><?php echo $entry_name; ?></label>
                        <input  type="text" name="name" value="" id="input-name"
                                class="form-control"/>
                    </div>
                </div>

                <div class="form-group required">
                    <div class="col-sm-6">
                        <label class="control-label"
                               for="input-review"><?php echo $entry_review; ?></label>
                        <textarea name="text" rows="5" id="input-review"
                                  class="form-control"></textarea>

                        <div class="help-block"><?php echo $text_note; ?></div>
                    </div>
                </div>

                <div class="buttons">
                    <div class="pull-left" style="padding-bottom: 2%;">
                        <button style="border-radius: 10px; height: 45px;" type="button" id="button-review"
                                data-loading-text="<?php echo $text_loading; ?>" data-news="<?php echo $news_id; ?>"
                                class="review-btn btn btn-primary"><?php echo $button_send; ?></button>
                    </div>
                </div>

            </div>
        </form>
    </div>
</div>

<style>
    .review {
        padding-left: 0 !important;
    }
</style>
<?php echo $footer; ?>
<script>
    $('#button-review').on('click', function () {
        $('#button-review').button('loading');
        $('.alert-danger').remove();
        var news_id = $('#button-review').data('news');
        $.ajax({
            url: 'index.php?route=information/news/addReview&news_id='+news_id,
            type: 'post',
            dataType: 'json',
            data: 'name=' + encodeURIComponent($('input[name=\'name\']').val()) + '&text=' + encodeURIComponent($('textarea[name=\'text\']').val()) +
            '&email=' + encodeURIComponent($('#input-email').val()),

//            complete: function () {

//            },
            success: function (json) {
                $('#button-review').button('reset');
                $('.alert-success, .alert-danger').remove();

                if (typeof json['error'] != "undefined") {
                    $('#reviewnews').html('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');

                }

                if (typeof json['success'] != "undefined") {
                    $('#reviewnews').html('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');
                    $('.review-drop').hide();
                    $('input[name=\'name\']').val('');
                    $('textarea[name=\'text\']').val('');
                    $('input[name=\'rating\']:checked').prop('checked', false);
//                    $('input[name=\'captcha\']').val('');
                }
            }
        });
    });
</script>