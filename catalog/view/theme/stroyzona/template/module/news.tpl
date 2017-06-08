<div class="panel panel-default news">
<div class="title-wrap-bord">
        <a href="<?php echo $link?>" class="title-module"><span><?php echo $heading_title;?></span></a>
    </div>
  <div class="panel-body news-slider">
  <?php foreach ($all_news as $news) { ?>
	<div class="col-sm-4 col-lg-4 col-xs-12">
	<a class="main-page-news" href="<?php echo $news['view']; ?>">
      <?php if($news['image']){ ?>
        <img src="<?php echo $news['image']; ?>"/>
      <?php } ?>
	  <h3 ><?php echo $news['title']; ?></h3><span class="news-date"><?php echo $news['date_added']; ?></span><br />
	  <?php echo $news['description']; ?>
    </a>
	</div>
  <?php } ?>
  </div>
</div>
