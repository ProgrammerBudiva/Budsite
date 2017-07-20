<?php $class = ($products)?'btn-full':'btn';?>
<div id="cart" class="btn-group">
    <button type="button" data-toggle="dropdown" data-loading-text="<?php echo $text_loading; ?>" class="<?php echo $class;?> btn-inverse btn-block btn-lg dropdown-toggle"><i class="fa fa-shopping-cart"></i> <span class="hidden-sm" id="cart-total"><?php echo $text_items; ?></span></button>
    <ul class="dropdown-menu pull-right">
        <?php if ($products || $vouchers) { ?>
        <li>
            <div class="d-table table-striped">
                <?php foreach ($products as $product) { ?>
                <div class="d-table-row">
                    <div class="d-table-cell text-center"><?php if ($product['thumb']) { ?>
                        <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-thumbnail" /></a>
                        <?php } ?></div>
                    <div class="d-table-cell text-left"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                        <?php if ($product['option']) { ?>
                        <?php foreach ($product['option'] as $option) { ?>
                        <br />
                        - <small><?php echo $option['name']; ?> <?php echo $option['value']; ?></small>
                        <?php } ?>
                        <?php } ?>
                        <?php if ($product['recurring']) { ?>
                        <br />
                        - <small><?php echo $text_recurring; ?> <?php echo $product['recurring']; ?></small>
                        <?php } ?></div>
                    <div class="d-table-cell text-right">x <?php echo $product['quantity']; ?></div>
                    <div class="d-table-cell text-right"><?php echo $product['total']; ?></div>
                    <div class="d-table-cell text-center">
                      <button type="button" data-key="<?php echo $product['key']; ?>" title="<?php echo $button_remove; ?>" class="btn btn-danger btn-xs cart-module-remove"><i class="fa fa-times"></i></button>
                    </div>
                    <?php $product_info = [
                      'name' => htmlspecialchars($product['name'],ENT_QUOTES),
                      'id' => $product['product_id'],
                      'price' => $product['original_price'],
                      'brand' => $product['brand'],
                      'category' => $product['category'],
                      'quantity' => $product['quantity'],
                    ]; ?>
                    <meta data-type="product-info" content='<?= json_encode($product_info, JSON_UNESCAPED_UNICODE|JSON_UNESCAPED_SLASHES)?>'/>
                </div>
                <?php } ?>
            </div>
        </li>
        <li>
            <div>
                <table class="table">
                    <?php foreach ($totals as $total) { ?>
                    <tr>
                        <td class="text-right"><strong><?php echo $total['title']; ?></strong></td>
                        <td class="text-right"><?php echo $total['text']; ?></td>
                    </tr>
                    <?php } ?>
                </table>
                <p class="text-center cart-resp-btn">
                    <button data-link="<?php echo $cart; ?>"onclick="location.href='index.php?route=checkout/cart'" class="btn-primary text-left shopping-cart-link">
                      <strong><i class="fa fa-shopping-cart"></i><span style="font-family:Arial"><?php echo $text_cart; ?></span></strong>
                    </button>

                    <button data-link="<?php echo $checkout; ?>" class="btn-primary text-right checkout-link">
                      <strong><i class="fa fa-share"></i><span style="font-family:Arial"><?php echo $text_checkout; ?></span></strong>
                    </button>
                </p>
            </div>
        </li>
        <?php } else { ?>
        <li>
            <p class="text-center empty-cart"><?php echo $text_empty; ?></p>
        </li>
        <?php } ?>
    </ul>
</div>
<script>
  $(function () {
    /* Удаление товара из корзины */
    $('#cart').on('click', '.cart-module-remove', function () {
      var $this = $(this);
      var key = $this.data('key');
      var product = JSON.parse($this.parents().find('meta[data-type="product-info"]').attr('content'));
      cart.remove(key, product);
    });
  });
</script>