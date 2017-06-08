<?php echo $header; ?>
<div class="container">
  <div class="row wrap-top"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-4'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-8'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?></div>
    <?php echo $column_right; ?></div>
    <?php echo $content_bottom; ?>
</div>
<script type="application/ld+json">
{
  "@context": "http://schema.org",
  "@type": "WebSite",
  "url": "https://budsite.ua",
  "potentialAction": {
    "@type": "SearchAction",
    "target": "https://budsite.ua/index.php?route=product/search&search={qr}",
    "query-input": "required name=qr"
  }
}
</script>
<?php echo $footer; ?>