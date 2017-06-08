<div class="container">
  <div class="row">
      <div id="content" class=""><?php echo $content_top; ?>
          <h1><?php echo $heading_title; ?></h1>
          <?php echo $text_message; ?>
          <div class="buttons">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary" id="success-popup-close-button"><?php echo $button_continue; ?></a></div>
      </div>
        <?php /* GTM dataLayer */
  if (!empty($dataLayer)) { ?>
        <script>
          dataLayer.push(JSON.parse('<?= json_encode($dataLayer) ?>'));
          dataLayer.push({"event": "metrcompl"});
        </script>
        <?php } ?>
          <script>
              $(document).on('click' ,function () {
                  if ($(event.target).closest("#success-popup-close-button").length) return;
                  $(location).attr('href', 'http://budsite.ua')

              });
          </script>
</div>
