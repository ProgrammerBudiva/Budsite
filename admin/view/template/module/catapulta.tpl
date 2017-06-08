<?php echo $header; ?>
<?php echo $column_left;?>
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
			<div class="buttons"><a href="<?php echo $catapulta; ?>" class="button"><?php echo $text_catapulta; ?></a><a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a onclick="location = '<?php echo $cancel; ?>';" class="button"><?php echo $button_cancel; ?></a></div>
		</div>
		<div class="content">
			<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
				<table class="form">
					<tr>
						<td><?php echo $entry_email; ?></td>
						<td><select name="catapulta_email_status">
								<?php if ($email_status) { ?>
								<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
								<option value="0"><?php echo $text_disabled; ?></option>
								<?php } else { ?>
								<option value="1"><?php echo $text_enabled; ?></option>
								<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
								<?php } ?>
							</select></td>
					</tr>
					<tr>
						<td><?php echo $entry_status; ?></td>
						<td><select name="catapulta_status">
								<?php if ($module_status) { ?>
								<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
								<option value="0"><?php echo $text_disabled; ?></option>
								<?php } else { ?>
								<option value="1"><?php echo $text_enabled; ?></option>
								<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
								<?php } ?>
							</select></td>
					</tr>
					<tr>
						<td><?php echo $entry_phone_text; ?></td>
						<td><?php foreach ($languages as $language) { ?><input type="text" name="catapulta_phone_text[<?php echo $language['language_id']; ?>]" value="<?php echo isset($phone_text[$language['language_id']]) ? $phone_text[$language['language_id']] : ''; ?>" />
<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /><br />
							<?php if (isset($error_phone_text[$language['language_id']])) { ?>
							<span class="error"><?php echo $error_phone_text[$language['language_id']]; ?></span><br />
							<?php } ?>
						<?php } ?>
						</td>
					</tr>
					<tr>
						<td><?php echo $entry_phone_mask_status; ?></td>
						<td><select name="catapulta_phone_mask_status">
								<?php if ($phone_mask_status) { ?>
								<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
								<option value="0"><?php echo $text_disabled; ?></option>
								<?php } else { ?>
								<option value="1"><?php echo $text_enabled; ?></option>
								<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
								<?php } ?>
							</select></td>
					</tr>
					<tr>
						<td><?php echo $text_phone_mask; ?></td>
						<td><input type="text" name="catapulta_phone_mask" value="<?php echo $phone_mask; ?>" />
							<?php if ($error_phone_mask) { ?>
							<span class="error"><?php echo $error_phone_mask; ?></span>
							<?php } ?>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</div>
<?php echo $footer; ?>
