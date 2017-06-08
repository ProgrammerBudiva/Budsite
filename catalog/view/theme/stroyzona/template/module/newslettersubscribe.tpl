<div class="box">
  <div class="box-heading"><?php echo $heading_title; ?></div>
  <div class="box-content" style="text-align: center;">

  <?php
   if($thickbox) { ?>
	<a href="#frm_subscribe" title="Newsletter Subscribe" class="fancybox_sub"> <?php echo($text_subscribe); ?> </a>
  <?php }  ?>
  <?php
   if($thickbox) { ?> <div id="frm_subscribe_hidden" style="display:none;"> <?php } ?>
  <div id="frm_subscribe">
  <form name="subscribe" id="subscribe" method="post"  action="javascript:void(null);" onsubmit="email_subscribe()" >
  <table border="0" cellpadding="2" cellspacing="2">
   <tr>
       <td align="left">
        <div class="required-text"><span class="required">*</span>&nbsp;<?php echo $entry_email; ?><br /></div>
        <div class="subscribe-wrap">
            <input type="text" value="" placeholder="<?php echo $entry_email;?>" name="subscribe_email" id="subscribe_email">
            <a class="button subscribe-email" onclick="email_subscribe()"><i class="fa fa-check"></i><span><?php echo $entry_button; ?></span></a><?php if($option_unsubscribe) { ?>
              <a class="button" onclick="email_unsubscribe()"><span><?php echo $entry_unbutton; ?></span></a>
            <?php } ?>
        </div>
       </td>
   </tr>
   <tr>
     <td align="center" id="subscribe_result"></td>
   </tr>
  </table>
  </form>
  </div>
  <?php if($thickbox) { ?> </div> <?php } ?>
  </div>
  <div class="bottom">&nbsp;</div>
<script language="javascript">
	<?php
  		if(!$thickbox) {
	?>
function email_subscribe(){
	$.ajax({
			type: 'post',
			url: 'index.php?route=module/newslettersubscribe/subscribe',
			dataType: 'html',
            data:$("#subscribe").serialize(),
			success: function (html) {
				eval(html);
			}});
}
function email_unsubscribe(){
	$.ajax({
			type: 'post',
			url: 'index.php?route=module/newslettersubscribe/unsubscribe',
			dataType: 'html',
            data:$("#subscribe").serialize(),
			success: function (html) {
				eval(html);
			}});
}
   <?php }else{ ?>
function email_subscribe(){
	$.ajax({
			type: 'post',
			url: 'index.php?route=module/newslettersubscribe/subscribe',
			dataType: 'html',
            data:$("#subscribe").serialize(),
			success: function (html) {
				eval(html);
			}});
}
function email_unsubscribe(){
	$.ajax({
			type: 'post',
			url: 'index.php?route=module/newslettersubscribe/unsubscribe',
			dataType: 'html',
            data:$("#subscribe").serialize(),
			success: function (html) {
				eval(html);
			}});
}
   <?php } ?>

/*$('.fancybox_sub').fancybox({
	width: 180,
	height: 180,
	autoDimensions: false
});*/
</script>
</div>
