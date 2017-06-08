<footer>
  <div class="container">
    <div class="row">
      <?php if ($informations) { ?>
      <div class="col-sm-3">
        <h5><?php echo $text_information; ?></h5>
        <ul class="list-unstyled">
          <?php foreach ($informations as $information) { ?>
          <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
          <?php } ?>
        </ul>
      </div>
      <?php } ?>
      <div class="col-sm-3">
        <h5><?php echo $text_service; ?></h5>
        <ul class="list-unstyled">
          <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
          <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
          <li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
        </ul>
      </div>
      <div class="col-sm-3">
        <h5><?php echo $text_extra; ?></h5>
        <ul class="list-unstyled">
          <li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>

				<li><a href="<?php echo $news; ?>"><?php echo $text_news; ?></a></li>
			
          <li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
          <li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
          <li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
        </ul>
      </div>
      <div class="col-sm-3">
        <h5><?php echo $text_account; ?></h5>
        <ul class="list-unstyled">
          <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
          <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
          <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
          <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
        </ul>
      </div>
    </div>
    <hr>
    <p><?php echo $powered; ?></p> 
  </div>
</footer>

<!--
OpenCart is open source software and you are free to remove the powered by OpenCart if you want, but its generally accepted practise to make a small donation.
Please donate via PayPal to donate@opencart.com
//--> 

<!-- Theme created by Welford Media for OpenCart 2.0 www.welfordmedia.co.uk -->

<style type="text/css">
.s-sid-pos-con-m{width: 0px;height: 0px;background: #000;position: fixed;z-index:100020}
.s-sid-pos-con-m.left-mid{left: 0;top: 50%}
.s-sid-pos-con-m .s-sid-con-main{position: absolute;}
.s-sid-pos-con-m.left-mid .s-sid-con-main{left:0;}
.s-sid-pos-con-m.left-mid.one-link .s-sid-con-main{top: -20px}
.s-sid-pos-con-m.left-mid.two-link .s-sid-con-main{top: -40px}
.s-sid-pos-con-m.left-mid.three-link .s-sid-con-main{top: -60px}
.s-sid-pos-con-m.left-mid.four-link .s-sid-con-main{top: -80px}
.s-sid-pos-con-m.left-mid.five-link .s-sid-con-main{top: -100px}
.s-sid-pos-con-m.left-mid.six-link .s-sid-con-main{top: -120px}
.s-sid-pos-con-m .s-sid-con-main .every{display: block;float: left;clear: both;position: relative;box-sizing:initial}
.s-sid-pos-con-m.left-mid .s-sid-con-main .every{height: 20px;margin:1px 0px 1px 0;}
.s-sid-pos-con-m .s-sid-con-main .every{padding: 9px 0 9px 32px;background:#33353B;text-decoration: none;}
.s-sid-pos-con-m.left-mid .s-sid-con-main .every{padding: 9px 32px 9px 0}
.s-sid-pos-con-m .s-sid-con-main .every .icon{position: absolute;width: 23px;height: 23px}
.s-sid-pos-con-m.left-mid .s-sid-con-main .every .icon{right: 0;margin-right: 2px;}
.s-sid-pos-con-m .s-sid-con-main .every .text{display: none;color:#fff;margin:0 5px;white-space: nowrap;}
.s-sid-pos-con-m .s-sid-con-main .every:hover .text{width:100px;display: block;}
.s-sid-pos-con-m.left-mid .s-sid-con-main .every .text{text-align: right;}
.s-sid-pos-con-m .s-sid-con-main .every .icon{background-color:#33353B;background-image: url(image/social-icons.png);background-repeat: no-repeat;}
.s-sid-pos-con-m .s-sid-con-main .every .icon.fb{background-position:center 1px}
.s-sid-pos-con-m .s-sid-con-main .every	.icon.tw{background-position:center -45px}
.s-sid-pos-con-m .s-sid-con-main .every	.icon.rss{background-position:center -90px}
.s-sid-pos-con-m .s-sid-con-main .every	.icon.gplus{background-position:center -137px}
.s-sid-pos-con-m .s-sid-con-main .every	.icon.ping{background-position:center -187px}
.s-sid-pos-con-m .s-sid-con-main .every	.icon.ytube{background-position:center -235px}
</style>

<!--For free version: this social bar will take place in left sidebar with 100% centering(from top to bottom) you can add more link here upto 6 links
if you add five link(s) in the social bar then you should declar a class as "five-link" (replace class "four-link" with "five-link" if you use five links)
example: class="s-sid-pos-con-m left-mid five-link"

Note: coming all sidebar positionig and 100% responsive socail sidebar.....
-->
<div class="s-sid-pos-con-m left-mid four-link">
	<div class="s-sid-con-main">
		<a class="every" href="#" target="_blank">
			<div class="icon fb"></div>
			<div class="text">Facebook</div>
		</a>
		<a class="every" href="#" target="_blank">
			<div class="icon tw"></div>
			<div class="text">Twitter</div>
		</a>
		<a class="every" href="#" target="_blank">
			<div class="icon rss"></div>
			<div class="text">RSS</div>
		</a>
		<a class="every" href="#" target="_blank">
			<div class="icon gplus"></div>
			<div class="text">Google Plus</div>
		</a>
	</div>
</div>
</body>
</body></html>