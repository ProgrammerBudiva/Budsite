<div class="title-wrap-bord">
    <a class="title-module"><span><?php echo $heading_title;?></span></a>
</div>
<div class="row popular">
    <?php foreach ($categories as $category) { ?>
        <div class="col-md-4 col-sm-6 col-xs-6 col-xxs-12">
        <div class="category-title"><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></div>
        <div class="popular-wrap">
            <div class="blur-img" style="background-image: url(<?php echo $category['image'] ?>)"></div>

            <div class="popular-heading">

                <div class="more-categories">
                <?php if ($category['children']) { ?>
                <?php foreach ($category['children'] as $child) { ?>
                    <a href="<?php echo $child['href']; ?>" class="list-group-item active">
                        <div class="d-table">
                            <div class="d-table-cell">
                                <?php echo $child['name']; ?>
                            </div>
                        </div>
                    </a>
                <?php } ?>
                <?php } ?>
                </div>
                <div class="clear show-all">
                    <a href="<?php echo $category['href']; ?>"><?php echo $see_all; ?><i class="fa fa-chevron-right"></i></a>
                </div>
            </div>
        </div>
        </div>
    <?php } ?>
</div>

<svg version="1.1" xmlns="http://www.w3.org/2000/svg">
 <filter id="blur">
 <feGaussianBlur stdDeviation="3" />
 </filter>
</svg>