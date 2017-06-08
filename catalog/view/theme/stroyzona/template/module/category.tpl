<div class="row second-category-wrap">
    <?php foreach ($categories as $category) { ?>
    <?php if ($category['children']) { ?>
    <?php foreach ($category['children'] as $child) { ?>
    <div class="col-sm-3">
            <div class="second-category">
                <div class="category-title"><?php echo $child['name']; ?></div>

                    <div class="img-wrap">
                        <?php if($child['image']) { ?>
                        <a href="<?php echo $child['href']; ?>"><img src="<?php echo $child['image'] ?>"/></a>
                        <?php } ?>
                    </div>
                    <?php if($child['min_price']) { ?>
                    <div class="min-price">
                        <p><?php echo $text_min_price;?></p>
                        <span><?php echo $child['min_price'];?></span>
                    </div>
                    <?php } ?>

            </div>
        </div>
    <?php } ?>
    <?php } ?>
    <?php } ?>
</div>
