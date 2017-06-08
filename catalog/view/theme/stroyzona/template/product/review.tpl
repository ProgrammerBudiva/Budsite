<?php if ($reviews) { ?>
<?php foreach ($reviews as $review) { ?>
<div class="col-md-12 col-sm-12 col-xs-12 one-review">
  <div class="review-field row bordered">
    <div class="author col-md-3 col-sm-3 col-xs-3 text-right">
      <strong><?php echo $review['author']; ?></strong>
    </div>
    <div class="review-date col-md-9 col-sm-9 col-xs-9 text-right"><?php echo $review['date_added']; ?></div>
  </div>
  <?php if ($review['plus']) { ?>
  <div class="review-field row bordered">
    <div class="col-md-3 col-sm-3 col-xs-3 text-right review-sect"><?php echo $entry_plus;?></div>
    <div class="col-md-9 col-sm-9 col-xs-9 text-left">
      <?php echo $review['plus']; ?>
    </div>
  </div>
  <?php } ?>
  <?php if ($review['minus']) { ?>
  <div class="review-field row bordered">
    <div class="col-md-3 col-sm-3 col-xs-3 text-right review-sect"><?php echo $entry_minus;?></div>
    <div class="col-md-9 col-sm-9 col-xs-9 text-left">
      <?php echo $review['minus']; ?>
    </div>
  </div>
  <?php } ?>
  <div class="review-field row">
    <div class="col-md-3 col-sm-3 col-xs-3 text-right"><?php echo $entry_general;?></div>
    <div class="col-md-9 col-sm-9 col-xs-9 text-left">
      <p><?php echo $review['text']; ?></p>
    </div>
  </div>
</div>
<?php } ?>
<div class="col-sm-12 text-center"><?php echo $pagination; ?></div>
<?php } else { ?>
<p><?php echo $text_no_reviews; ?></p>
<?php } ?>
<div class="clear"></div>
