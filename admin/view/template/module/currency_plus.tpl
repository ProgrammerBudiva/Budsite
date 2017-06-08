<?php echo $header; ?>
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <?php if ($error_warning) { ?>
  <div class="warning"><?php echo $error_warning; ?></div>
  <?php } ?>
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/module.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a onclick="location = '<?php echo $cancel; ?>';" class="button"><?php echo $button_cancel; ?></a></div>
    </div>
    <div class="content">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
        <table id="general" class="form">
            <tr>
                <td width="300"><?php echo $entry_charcode; ?></td>
                <td class="left"><select name="<?php echo $name; ?>_charcode">
                        <option value="RUB" <?php if (!isset(${$name.'_charcode'}) or (isset(${$name.'_charcode'}) and ${$name.'_charcode'} == 'RUB')) { echo 'selected';}?>><?php echo $text_rub; ?></option>
                        <option value="UAH" <?php if (isset(${$name.'_charcode'}) and ${$name.'_charcode'} == 'UAH') { echo 'selected';}?> ><?php echo $text_uah; ?></option>
                        <option value="BYR" <?php if (isset(${$name.'_charcode'}) and ${$name.'_charcode'} == 'BYR') { echo 'selected';}?> ><?php echo $text_byr; ?></option>
                        <option value="KZT" <?php if (isset(${$name.'_charcode'}) and ${$name.'_charcode'} == 'KZT') { echo 'selected';}?> ><?php echo $text_kzt; ?></option>
                    </select>
                </td>
            </tr>
            <tr>
                <td width="300"><?php echo $entry_round; ?></td>
                <td class="left"><select name="<?php echo $name; ?>_round">
                        <option value=""><?php echo $text_noround; ?></option>
                        <option value="digit1" <?php if (isset(${$name.'_round'}) and ${$name.'_round'} == 'digit1') { echo 'selected';}?> ><?php echo $text_digit1; ?></option>
                       <!-- <option value="digit1_plus" <?php if (isset(${$name.'_round'}) and ${$name.'_round'} == 'digit1_plus') { echo 'selected';}?> ><?php echo $text_digit1_plus; ?></option> -->
                        <option value="digit9" <?php if (isset(${$name.'_round'}) and ${$name.'_round'} == 'digit9') { echo 'selected';}?> ><?php echo $text_digit9; ?></option>
                        <option value="digit10" <?php if (isset(${$name.'_round'}) and ${$name.'_round'} == 'digit10') { echo 'selected';}?> ><?php echo $text_digit10; ?></option>
                        <option value="digit50" <?php if (isset(${$name.'_round'}) and ${$name.'_round'} == 'digit50') { echo 'selected';}?> ><?php echo $text_digit50; ?></option>
                        <option value="digit100" <?php if (isset(${$name.'_round'}) and ${$name.'_round'} == 'digit100') { echo 'selected';}?> ><?php echo $text_digit100; ?></option>
                        <option value="digit1000" <?php if (isset(${$name.'_round'}) and ${$name.'_round'} == 'digit1000') { echo 'selected';}?> ><?php echo $text_digit1000; ?></option>
                        <option value="digit10000" <?php if (isset(${$name.'_round'}) and ${$name.'_round'} == 'digit10000') { echo 'selected';}?> ><?php echo $text_digit10000; ?></option>
                        <option value="digit100000" <?php if (isset(${$name.'_round'}) and ${$name.'_round'} == 'digit100000') { echo 'selected';}?> ><?php echo $text_digit100000; ?></option>
                    </select>
                </td>
            </tr>
        </table>
        <h2><?php echo $entry_show_base_price; ?></h2>
        <table class="form">
            <tr>
                <td width="300"><?php echo $entry_show_base_price_product; ?></td>
                <td class="left"><input type="checkbox" name="<?php echo $name; ?>_show_base_price" value="1" <?php if (isset(${$name.'_show_base_price'}) and ${$name.'_show_base_price'}) { ?>checked="checked"<?php } ?> /></td>
            </tr>
            <tr>
                <td width="300"><?php echo $entry_show_base_price_cat; ?></td>
                <td class="left"><input type="checkbox" name="<?php echo $name; ?>_show_base_price_cat" value="1" <?php if (isset(${$name.'_show_base_price_cat'}) and ${$name.'_show_base_price_cat'}) { ?>checked="checked"<?php } ?> /></td>
            </tr>
            <tr>
                <td width="300"><?php echo $entry_show_base_price_search; ?></td>
                <td class="left"><input type="checkbox" name="<?php echo $name; ?>_show_base_price_search" value="1" <?php if (isset(${$name.'_show_base_price_search'}) and ${$name.'_show_base_price_search'}) { ?>checked="checked"<?php } ?> /></td>
            </tr>
            <tr>
                <td width="300"><?php echo $entry_show_base_price_brand; ?></td>
                <td class="left"><input type="checkbox" name="<?php echo $name; ?>_show_base_price_brand" value="1" <?php if (isset(${$name.'_show_base_price_brand'}) and ${$name.'_show_base_price_brand'}) { ?>checked="checked"<?php } ?> /></td>
            </tr>
            <tr>
                <td width="300"><?php echo $entry_show_base_price_special; ?></td>
                <td class="left"><input type="checkbox" name="<?php echo $name; ?>_show_base_price_special" value="1" <?php if (isset(${$name.'_show_base_price_special'}) and ${$name.'_show_base_price_special'}) { ?>checked="checked"<?php } ?> /></td>
            </tr>
        </table>
      </form>
    </div>
  </div>
</div>

<?php echo $footer; ?>