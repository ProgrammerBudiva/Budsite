<?php echo $header?>
<div class="container">
    <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
    </ul>
    <div class="row"><?php echo $column_left; ?>
        <div class="row">
            <div class="col-md-12">
                <div id="content"><?php echo $content_top; ?>
                    <h1><?php echo $text_message; ?></h1>

                    <div class="buttons">
                        <div class="pull-right">
                            <a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a>
                        </div>
                    </div>
                    <div class="clear"></div>
                    <?php echo $content_bottom; ?></div>
            </div>
        </div>
    </div>
<?php echo $column_right; ?>
</div>
<?php /* GTM dataLayer */
  if (!empty($dataLayer)) { ?>
<script>
    dataLayer.push(JSON.parse('<?= json_encode($dataLayer) ?>'));
    dataLayer.push({"event": "metrcompl"});
</script>
<?php } ?>
<?php echo $footer; ?>

<script type="text/javascript">
    $('.slick-slider').slick({
        slidesToShow: 3,
        slidesToScroll: 1,
        asNavFor: '.big-product-slider',
        focusOnSelect: true,
        responsive: [
            {
                breakpoint: 768,
                settings: {
                    slidesToShow: 2,
                    slidesToScroll: 1
                }
            },
            {
                breakpoint: 480,
                settings: {
                    slidesToShow: 1,
                    slidesToScroll: 1
                }
            }
        ]
    });
</script>