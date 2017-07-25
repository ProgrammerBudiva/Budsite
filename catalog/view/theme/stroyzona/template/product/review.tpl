<?php if ($reviews) { ?>
<?php foreach ($reviews as $review) { ?>
<div class=" padding col-md-12 col-sm-12 col-xs-12 ">
    <div class="col-md-3 col-sm-3 col-xs-3 " style="width: 7%; color: #444">
      <strong><?php echo $review['author']; ?></strong>
    </div>
  <div class="text-left">
<?php for($i=0; $i < $review['rating']; $i++) { ?>
    <span class="stars">★</span>
<?php } ?>
  </div>
   <!-- <div class="review-date col-md-9 col-sm-9 col-xs-9 text-right"><?php echo $review['date_added']; ?></div>-->

  <div class="review-field ">
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
<style>
  .stars {
    font-size:100%;
    color: gold;
  }
  .review-field {
    width: 70%;
  }
    .padding {
        padding-bottom: 2%;
    }
</style>
