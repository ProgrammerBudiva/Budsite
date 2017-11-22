<?php echo $header; ?>
<div class="container">
    <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
    </ul>
    <div class="row"><?php echo $column_left; ?>
        <?php if ($column_left && $column_right) { ?>
        <?php $class = 'col-sm-6'; ?>
        <?php } elseif ($column_left || $column_right) { ?>
        <?php $class = 'col-sm-9'; ?>
        <?php } else { ?>
        <?php $class = 'col-sm-12'; ?>
        <?php } ?>
        <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
            <h1><?php echo $heading_title; ?></h1>
            <div class="row">
                <?php   $i = 0;
                foreach ($all_news as $news) { ?>
                <?php $i++; if($i == 1){ ?>
                <div class="test"> <?php }?>
                    <div class="col-sm-4">
                        <div class="news-wrap">
                        	<div class="d-table">
								<div class="img-wrap">
									<img src="<?php echo $news['image']; ?>" alt="<?php echo $news['title'];?>, интернет магазин Будсайт" />
								</div>
                            </div>
                            <div class="news-title">
                                <?php echo $news['title']; ?>

                            </div>
                            <div class="news-description">
                                <p><?php echo $news['description']; ?></p>
                            </div>
                            <div class="news-date">
                                <?php echo $news['date_added']; ?>
                            </div>
                            <div class="more-about-news btn-primary">
                                <a href="<?php echo $news['view']; ?>"><?php echo $text_view; ?></a>
                            </div>
                            <div class="clear"></div>
                        </div>
                    </div>
                    <?php if($i == 3 || end($all_news) == $news){ ?>
                </div> <?php   $i = 0; } ?>
                <?php } ?>
            </div>
            <div class="row">
                <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
                <div class="col-sm-6 text-right"><?php echo $results; ?></div>
            </div>
            <?php echo $content_bottom; ?></div>
        <?php echo $column_right; ?></div>
</div>
<style>
    @media screen and (min-width:768px) {
        .test {
            display: inline-flex;
            width: 100%;
        }
    }
</style>
<?php echo $footer; ?>


