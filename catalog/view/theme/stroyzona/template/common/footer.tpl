<footer>
  <!-- Social widgets scripts -->
  <!-- Facebook -->
  <div id="fb-root"></div>
  <script>(function(d, s, id) {
      var js, fjs = d.getElementsByTagName(s)[0];
      if (d.getElementById(id)) return;
      js = d.createElement(s); js.id = id;
      js.src = "//connect.facebook.net/ru_RU/sdk.js#xfbml=1&version=v2.8&appId=906511616083280";
      fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));</script>

  <?php /*
  <!-- Vk -->
  <script type="text/javascript" src="//vk.com/js/api/openapi.js?133"></script>
  <script type="text/javascript">
    VK.Widgets.Group("vk_groups", {mode: 3, width: "245", height: "400", color1: 'FFFFFF', color2: '000000', color3: '5E81A8'}, 128770320);
  </script>
  */ ?>

  <div class="container main-shadow-2">
    <div class="row resp-footer">
      <div class="footer-module">
          <div id="vk_groups"></div>
      </div>
      <div class="footer-module">
          <div class="fb-wrapper"><div class="fb-page" data-href="https://www.facebook.com/budsite" data-width="230" data-small-header="false" data-adapt-container-width="false" data-hide-cover="false" data-show-facepile="true"><blockquote cite="https://www.facebook.com/budsite" class="fb-xfbml-parse-ignore"><a href="https://www.facebook.com/budsite">budsite.ua</a></blockquote></div></div>
            </div>
        <div class="footer-module">
          <a rel="nofollow" href="<?php echo $link_about_us;?>"><?php echo $text_about_us;?></a>
          <a rel="nofollow" href="<?php echo $link_shipping;?>"><?php echo $text_shipping;?></a>
          <a rel="nofollow" href="<?php echo $link_blog;?>"><?php echo $text_blog;?></a>
          <a rel="nofollow" href="<?php echo $link_contacts;?>"><?php echo $text_contacts;?></a>
          <a rel="nofollow" href="<?php echo $link_cooperation;?>"><?php echo $text_cooperation;?></a>
          <a rel="nofollow" href="/garantii">Гарантии</a>
        </div>
        <div class="footer-module">
          <a href="/obogrevateli">Обогреватели</a>
          <a href="/bitumnaya-cherepica">Битумная черепица</a>
          <a href="/skatnaya-krovlya">Скатная кровля</a>
          <a href="/evroruberoid">Еврорубероид</a>
          <a href="/teploizolyaciya">Теплоизоляция</a>
          <a href="/instrumenty">Инструменты</a>
        </div>
      <div class="footer-module">
        <div><?php echo $newsletter_subscribe; ?></div>
        <div class="social">
          <div class="box-heading"><p><?php echo $text_socials;?></p></div>
          <ul class="list-unstyled">
            <?php /*<li><a rel="nofollow" target="_blank" href="https://www.vk.com/budsite" class="vk"><i class="fa fa-vk"></i></a></li>*/ ?>
            <li><a rel="nofollow" target="_blank" href="https://www.facebook.com/budsite" class="fb"><i class="fa fa-facebook"></i></a></li>
            <li><a rel="nofollow" target="_blank" href="https://www.youtube.com/c/BudsiteUa" class="you"><i class="fa fa-youtube"></i></a></li>
            <li><a rel="nofollow" target="_blank" href="https://www.instagram.com/budsite_expert" class="ins"><i class="fa fa-instagram"></i></a></li>
          </ul>
        </div>
      </div>
    </div>
    <div class="row footer-bottom">
      <div class="col-sm-4 col-xs-4">
        <a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a>
      </div>
      <div class="col-sm-4 col-xs-4 powered">
        <p><?php echo $powered; ?></p>
      </div>
    </div>
  </div>
</footer>

<!-- Scripts -->
<script async src="//cdnjs.cloudflare.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
<script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="catalog/view/javascript/magnific/jquery.magnific-popup.min.js" type="text/javascript"></script>
<script src="catalog/view/javascript/formstyler/jquery.formstyler.js" type="text/javascript"></script>
<script async src="https://cdnjs.cloudflare.com/ajax/libs/jquery.maskedinput/1.4.1/jquery.maskedinput.min.js" type="text/javascript"></script>
<script async type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/notify/0.4.0/notify.min.js"></script>
<script async src="catalog/view/javascript/slick/slick.js" type="text/javascript"></script>
<script async src="catalog/view/javascript/jquery.elevatezoom.js" type="text/javascript"></script>
<script async src="catalog/view/javascript/jquery/jquery.cookie.js"></script>
<script async src="catalog/view/javascript/front-end.js?v=1.02" type="text/javascript"></script>
<script async src="catalog/view/javascript/common.js?v1.02" type="text/javascript"></script>
<script type="text/javascript">
  /* Скрипт "Перезвоните мне" */
  $(function(){
    $('.callback-ringo').click(function () {
      var $dropdown = $(this).parents('.callback_dropdown').find('.my-dropdown');
      $dropdown.show().find('input').click();
    });
  });
</script>
<?php foreach ($scripts as $script) { ?>
  <script src="<?php echo $script; ?>?<?= time()?>" type="text/javascript"></script>
<?php } ?>

<?php echo $google_analytics; ?>

<!-- END Scripts -->

<!--Binotel in the very very end-->
<!--<script type="text/javascript">
  (function(d, w, s) {
    var widgetHash = '23289', gcw = d.createElement(s); gcw.type = 'text/javascript'; gcw.async = true;
    gcw.src = '//widgets.binotel.com/getcall/widgets/'+ widgetHash +'.js';
    var sn = d.getElementsByTagName(s)[0]; sn.parentNode.insertBefore(gcw, sn);
  })(document, window, 'script');
</script>-->

</body></html>