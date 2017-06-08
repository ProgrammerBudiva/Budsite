<?php
/*
 * Shoputils
 *
 * ПРИМЕЧАНИЕ К ЛИЦЕНЗИОННОМУ СОГЛАШЕНИЮ
 *
 * Этот файл связан лицензионным соглашением, которое можно найти в архиве,
 * вместе с этим файлом. Файл лицензии называется: LICENSE.2.x.RUS.TXT
 * Так же лицензионное соглашение можно найти по адресу:
 * http://opencart.shoputils.ru/LICENSE.2.x.RUS.TXT
 * 
 * =================================================================
 * OPENCART/ocStore 2.x ПРИМЕЧАНИЕ ПО ИСПОЛЬЗОВАНИЮ
 * =================================================================
 *  Этот файл предназначен для Opencart/ocStore 2.x. Shoputils не
 *  гарантирует правильную работу этого расширения на любой другой 
 *  версии Opencart/ocStore, кроме Opencart/ocStore 2.x. 
 *  Shoputils не поддерживает программное обеспечение для других 
 *  версий Opencart/ocStore.
 * =================================================================
*/
?>
<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-shoputils-yk" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i> <?php echo $button_save; ?></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i> <?php echo $button_cancel; ?></a></div>
      <h1><img src="view/image/module/shoputils_mail_order_status.png" width="26" height="26"> <?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <?php if ($success) { ?>
    <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-shoputils-yk" class="form-horizontal">
          <ul class="nav nav-tabs">
            <li class="active"><a href="#tab_new_order" data-toggle="tab"><i class="fa fa-power-off"></i> <?php echo $tab_new_order; ?></a></li>
            <li><a href="#tab_order_statuses" data-toggle="tab"><i class="fa fa-envelope-o"></i> <?php echo $tab_order_statuses; ?></a></li>
            <li><a href="#tab_settings_ft" data-toggle="tab"><i class="fa fa-wrench"></i> <?php echo $tab_settings_ft; ?></a></li>
          </ul>
          <div class="tab-content">
            <div class="tab-pane active" id="tab_new_order">
              <div class="form-group">
                <div class="col-sm-12">
                    <h2><?php echo $entry_new_order; ?></h2>
                </div>
              </div>

              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-mail_order_status_new_status"><span data-toggle="tooltip" title="<?php echo $help_new_status; ?>"><?php echo $entry_status; ?></span></label>
                <div class="col-sm-10">
                  <select name="shoputils_mail_order_status_new_status" id="input-mail_order_status_new_status" class="form-control">
                    <?php if ((isset($shoputils_mail_order_status_new_status)) && ($shoputils_mail_order_status_new_status)) { ?>
                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                    <option value="0"><?php echo $text_disabled; ?></option>
                    <?php } else { ?>
                    <option value="1"><?php echo $text_enabled; ?></option>
                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>

              <div class="form-group required">
                <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_new_subject; ?>"><?php echo $entry_subject; ?></span></label>
                <div class="col-sm-10">
                  <?php foreach ($oc_languages as $language) { ?>
                  <div class="input-group">
                    <span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
                    <input type="text" name="shoputils_mail_order_status_new_subject[<?php echo $language['language_id']; ?>]"
                           value="<?php echo !empty($shoputils_mail_order_status_new_subject[$language['language_id']])
                                  ? $shoputils_mail_order_status_new_subject[$language['language_id']] : $new_subject_default;; ?>"
                                  placeholder="<?php echo $entry_subject; ?>" class="form-control" />
                  </div>
                  <?php } ?>
                </div>
              </div>

              <div class="form-group required">
                <div class="col-sm-4">
                  <label class="control-label"><span data-toggle="tooltip" title="<?php echo $help_new_content; ?>"><?php echo $entry_content; ?></span></label>
                  <div class="help-block"><a class="hidelink"><?php echo $help_list_helper; ?></a></div>
                  <div class="help-block hider"><?php echo $list_helper_new_order; ?></div>
                  <div><a onclick="NewContentDefault();" data-toggle="tooltip" title="<?php echo $help_button_default; ?>" class="btn btn-danger"><i class="fa fa-scissors"></i> <?php echo $button_default; ?></a></div>
                </div>
                <div class="col-sm-8">
                  <div class="help-block" style="text-align: center;"><?php echo $help_on_ckeditor; ?></div>
                  <?php foreach ($oc_languages as $language) { ?>
                  <div class="input-group">
                    <span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
                    <textarea name="shoputils_mail_order_status_new_content[<?php echo $language['language_id']; ?>]" rows="10"
                              id="new-content-<?php echo $language['language_id']; ?>"
                              placeholder="<?php echo $entry_content; ?>"
                              class="form-control on-summernote"><?php echo !empty($shoputils_mail_order_status_new_content[$language['language_id']])
                                                   ? $shoputils_mail_order_status_new_content[$language['language_id']] : $new_content_default; ?></textarea>
                  </div>
                  <?php } ?>
                    <textarea style="display: none;" id="new-content-default"><?php echo $new_content_default; ?></textarea>
                </div>
              </div>

              <div class="form-group">
                <div class="col-sm-12">
                    <h2><?php echo $entry_admin_new_order; ?></h2>
                </div>
              </div>

              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-mail_order_status_admin_new_status"><span data-toggle="tooltip" title="<?php echo $help_admin_new_status; ?>"><?php echo $entry_admin_status; ?></span></label>
                <div class="col-sm-10">
                  <select name="shoputils_mail_order_status_admin_new_status" id="input-mail_order_status_admin_new_status" class="form-control">
                    <?php if ((isset($shoputils_mail_order_status_admin_new_status)) && ($shoputils_mail_order_status_admin_new_status)) { ?>
                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                    <option value="0"><?php echo $text_disabled; ?></option>
                    <?php } else { ?>
                    <option value="1"><?php echo $text_enabled; ?></option>
                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>

              <div class="form-group required">
                <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_new_subject; ?>"><?php echo $entry_subject; ?></span></label>
                <div class="col-sm-10">
                  <?php foreach ($oc_languages as $language) { ?>
                  <div class="input-group">
                    <span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
                    <input type="text" name="shoputils_mail_order_status_admin_new_subject[<?php echo $language['language_id']; ?>]"
                           value="<?php echo !empty($shoputils_mail_order_status_admin_new_subject[$language['language_id']])
                                  ? $shoputils_mail_order_status_admin_new_subject[$language['language_id']] : $new_subject_default;; ?>"
                                  placeholder="<?php echo $entry_subject; ?>" class="form-control" />
                  </div>
                  <?php } ?>
                </div>
              </div>

              <div class="form-group required">
                <div class="col-sm-4">
                  <label class="control-label"><span data-toggle="tooltip" title="<?php echo $help_new_content; ?>"><?php echo $entry_content; ?></span></label>
                  <div class="help-block"><a class="hidelink"><?php echo $help_list_helper; ?></a></div>
                  <div class="help-block hider"><?php echo $list_helper_new_order; ?></div>
                  <div><a onclick="AdminNewContentDefault();" data-toggle="tooltip" title="<?php echo $help_button_default; ?>" class="btn btn-danger"><i class="fa fa-scissors"></i> <?php echo $button_default; ?></a></div>
                </div>
                <div class="col-sm-8">
                  <div class="help-block" style="text-align: center;"><?php echo $help_on_ckeditor; ?></div>
                  <?php foreach ($oc_languages as $language) { ?>
                  <div class="input-group">
                    <span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
                    <textarea name="shoputils_mail_order_status_admin_new_content[<?php echo $language['language_id']; ?>]" rows="10"
                              id="admin-new-content-<?php echo $language['language_id']; ?>"
                              placeholder="<?php echo $entry_content; ?>"
                              class="form-control on-summernote"><?php echo !empty($shoputils_mail_order_status_admin_new_content[$language['language_id']])
                                                   ? $shoputils_mail_order_status_admin_new_content[$language['language_id']] : $new_content_default; ?></textarea>
                  </div>
                  <?php } ?>
                    <textarea style="display: none;" id="admin-new-content-default"><?php echo $new_content_default; ?></textarea>
                </div>
              </div>

            </div><!-- </div id="tab_new_order"> -->
            <div class="tab-pane" id="tab_order_statuses">

              <div class="row">
                <div class="col-sm-2">
                  <ul class="nav nav-pills nav-stacked" id="order_statuses">
                    <?php foreach ($order_statuses as $vtab) { ?>
                    <li><a href="#vtab<?php echo $vtab['order_status_id']; ?>" data-toggle="tab"><?php echo $vtab['name']; ?></a></li>
                    <?php } ?>
                  </ul>
                </div>
                <div class="col-sm-10">
                  <div class="tab-content">
                    <?php foreach ($order_statuses as $vtab) { ?>
                    <div class="tab-pane" id="vtab<?php echo $vtab['order_status_id']; ?>">

                      <div class="form-group">
                        <div class="col-sm-12">
                            <h2><?php echo sprintf($entry_current_order_status, $vtab['name']); ?></h2>
                        </div>
                      </div>

                      <div class="form-group">
                        <label class="col-sm-4 control-label" for="input-mail_order_status_status<?php echo $vtab['order_status_id']; ?>"><span data-toggle="tooltip" title="<?php echo $help_status; ?>"><?php echo $entry_status; ?></span></label>
                        <div class="col-sm-8">
                          <select name="shoputils_mail_order_status_status<?php echo $vtab['order_status_id']; ?>" id="input-mail_order_status_status<?php echo $vtab['order_status_id']; ?>" class="form-control">
                            <?php if ((isset($shoputils_mail_order_status_status[$vtab['order_status_id']])) && ($shoputils_mail_order_status_status[$vtab['order_status_id']])) { ?>
                            <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                            <option value="0"><?php echo $text_disabled; ?></option>
                            <?php } else { ?>
                            <option value="1"><?php echo $text_enabled; ?></option>
                            <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                            <?php } ?>
                          </select>
                        </div>
                      </div>

                      <div class="form-group">
                        <label class="col-sm-4 control-label" for="input-mail_order_status_notify<?php echo $vtab['order_status_id']; ?>"><span data-toggle="tooltip" title="<?php echo sprintf($help_chkbox_notify, $vtab['name']); ?>"><?php echo $entry_chkbox_notify; ?></span></label>
                        <div class="col-sm-8">
                          <label class="radio-inline">
                            <?php if (isset($shoputils_mail_order_status_notify[$vtab['order_status_id']]) && $shoputils_mail_order_status_notify[$vtab['order_status_id']]) { ?>
                            <input type="radio" name="shoputils_mail_order_status_notify<?php echo $vtab['order_status_id']; ?>" value="1" checked="checked" />
                            <?php echo $text_yes; ?>
                            <?php } else { ?>
                            <input type="radio" name="shoputils_mail_order_status_notify<?php echo $vtab['order_status_id']; ?>" value="1" />
                            <?php echo $text_yes; ?>
                            <?php } ?>
                          </label>
                          <label class="radio-inline">
                            <?php if (!isset($shoputils_mail_order_status_notify[$vtab['order_status_id']]) || !$shoputils_mail_order_status_notify[$vtab['order_status_id']]) { ?>
                            <input type="radio" name="shoputils_mail_order_status_notify<?php echo $vtab['order_status_id']; ?>" value="0" checked="checked" />
                            <?php echo $text_no; ?>
                            <?php } else { ?>
                            <input type="radio" name="shoputils_mail_order_status_notify<?php echo $vtab['order_status_id']; ?>" value="0" />
                            <?php echo $text_no; ?>
                            <?php } ?>
                          </label>
                        </div>
                      </div>

                      <div class="form-group required">
                        <label class="col-sm-4 control-label"><span data-toggle="tooltip" title="<?php echo sprintf($help_subject, $vtab['name']); ?>"><?php echo $entry_subject; ?></span></label>
                        <div class="col-sm-8">
                          <?php foreach ($oc_languages as $language) { ?>
                          <div class="input-group">
                            <span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
                            <input type="text" name="shoputils_mail_order_status_subject<?php echo $vtab['order_status_id']; ?>[<?php echo $language['language_id']; ?>]"
                                   placeholder="<?php echo $entry_subject; ?>" class="form-control"
                                   value="<?php echo !empty($shoputils_mail_order_status_subject[$vtab['order_status_id']][$language['language_id']])
                                          ? $shoputils_mail_order_status_subject[$vtab['order_status_id']][$language['language_id']] : ''; ?>" />
                          </div>
                          <?php if ($error_subject[$vtab['order_status_id']]) { ?>
                          <div class="text-danger"><?php echo $error_subject[$vtab['order_status_id']]; ?></div>
                          <?php } ?>
                          <?php } ?>
                        </div>
                      </div>

                      <div class="form-group required">
                        <div class="col-sm-4">
                          <label class="control-label"><span data-toggle="tooltip" title="<?php echo sprintf($help_content, $vtab['name']); ?>"><?php echo $entry_content; ?></span></label>
                          <div class="help-block"><a class="hidelink"><?php echo $help_list_helper; ?></a></div>
                          <div class="help-block hider"><?php echo $list_helper_update_order; ?></div>
                        </div>
                        <div class="col-sm-8">
                          <div class="help-block" style="text-align: center;"><?php echo $help_on_ckeditor; ?></div>
                          <?php foreach ($oc_languages as $language) { ?>
                          <div class="input-group">
                            <span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
                            <textarea name="shoputils_mail_order_status_content<?php echo $vtab['order_status_id']; ?>[<?php echo $language['language_id']; ?>]"
                                      id="content<?php echo $vtab['order_status_id']; ?>-<?php echo $language['language_id']; ?>" rows="10"
                                      placeholder="<?php echo $entry_content; ?>"
                                      class="form-control on-summernote"><?php echo !empty($shoputils_mail_order_status_content[$vtab['order_status_id']][$language['language_id']])
                                                           ? $shoputils_mail_order_status_content[$vtab['order_status_id']][$language['language_id']] : ''; ?></textarea>
                          </div>
                          <?php if ($error_subject[$vtab['order_status_id']]) { ?>
                          <div class="text-danger"><?php echo $error_content[$vtab['order_status_id']]; ?></div>
                          <?php } ?>
                          <?php } ?>
                        </div>
                      </div>

                      <div class="form-group">
                        <div class="col-sm-12">
                            <h2><?php echo sprintf($entry_admin_current_order_status, $vtab['name']); ?></h2>
                        </div>
                      </div>

                      <div class="form-group">
                        <label class="col-sm-4 control-label" for="input-mail_order_status_admin_status<?php echo $vtab['order_status_id']; ?>"><span data-toggle="tooltip" title="<?php echo $help_admin_status; ?>"><?php echo $entry_admin_status; ?></span></label>
                        <div class="col-sm-8">
                          <select name="shoputils_mail_order_status_admin_status<?php echo $vtab['order_status_id']; ?>" id="input-mail_order_status_admin_status<?php echo $vtab['order_status_id']; ?>" class="form-control">
                            <?php if ((isset($shoputils_mail_order_status_admin_status[$vtab['order_status_id']])) && ($shoputils_mail_order_status_admin_status[$vtab['order_status_id']])) { ?>
                            <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                            <option value="0"><?php echo $text_disabled; ?></option>
                            <?php } else { ?>
                            <option value="1"><?php echo $text_enabled; ?></option>
                            <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                            <?php } ?>
                          </select>
                        </div>
                      </div>

                      <div class="form-group required">
                        <label class="col-sm-4 control-label"><span data-toggle="tooltip" title="<?php echo sprintf($help_subject, $vtab['name']); ?>"><?php echo $entry_subject; ?></span></label>
                        <div class="col-sm-8">
                          <?php foreach ($oc_languages as $language) { ?>
                          <div class="input-group">
                            <span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
                            <input type="text" name="shoputils_mail_order_status_admin_subject<?php echo $vtab['order_status_id']; ?>[<?php echo $language['language_id']; ?>]"
                                   placeholder="<?php echo $entry_subject; ?>" class="form-control"
                                   value="<?php echo !empty($shoputils_mail_order_status_admin_subject[$vtab['order_status_id']][$language['language_id']])
                                          ? $shoputils_mail_order_status_admin_subject[$vtab['order_status_id']][$language['language_id']] : ''; ?>" />
                          </div>
                          <?php if ($error_admin_subject[$vtab['order_status_id']]) { ?>
                          <div class="text-danger"><?php echo $error_admin_subject[$vtab['order_status_id']]; ?></div>
                          <?php } ?>
                          <?php } ?>
                        </div>
                      </div>

                      <div class="form-group required">
                        <div class="col-sm-4">
                          <label class="control-label"><span data-toggle="tooltip" title="<?php echo sprintf($help_content, $vtab['name']); ?>"><?php echo $entry_content; ?></span></label>
                          <div class="help-block"><a class="hidelink"><?php echo $help_list_helper; ?></a></div>
                          <div class="help-block hider"><?php echo $list_helper_update_order; ?></div>
                        </div>
                        <div class="col-sm-8">
                          <div class="help-block" style="text-align: center;"><?php echo $help_on_ckeditor; ?></div>
                          <?php foreach ($oc_languages as $language) { ?>
                          <div class="input-group">
                            <span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
                            <textarea name="shoputils_mail_order_status_admin_content<?php echo $vtab['order_status_id']; ?>[<?php echo $language['language_id']; ?>]"
                                      id="content<?php echo $vtab['order_status_id']; ?>-<?php echo $language['language_id']; ?>" rows="10"
                                      placeholder="<?php echo $entry_content; ?>"
                                      class="form-control on-summernote"><?php echo !empty($shoputils_mail_order_status_admin_content[$vtab['order_status_id']][$language['language_id']])
                                                           ? $shoputils_mail_order_status_admin_content[$vtab['order_status_id']][$language['language_id']] : ''; ?></textarea>
                          </div>
                          <?php if ($error_admin_content[$vtab['order_status_id']]) { ?>
                          <div class="text-danger"><?php echo $error_admin_content[$vtab['order_status_id']]; ?></div>
                          <?php } ?>
                          <?php } ?>
                        </div>
                      </div>

                    </div><!-- </div class="tab-pane" id="vtab<?php echo $vtab['order_status_id']; ?>"> -->
                    <?php } ?>
                  </div><!-- </div class="tab-content">  -->
                </div><!-- </div class="col-sm-10">  -->
              </div><!-- <div class="row">  -->

            </div><!-- </div id="tab_order_statuses"> -->
            <div class="tab-pane" id="tab_settings_ft">

              <div class="form-group">
                <div class="col-sm-12">
                  <h2><?php echo $entry_products_ft; ?></h2>
                </div>
              </div>

              <div class="form-group">
                <div class="col-sm-4">
                  <label class="control-label"><span data-toggle="tooltip" title="<?php echo $help_products_ft; ?>"><?php echo $entry_products_ft; ?></span></label>
                  <div class="help-block"><a class="hidelink"><?php echo $help_list_helper; ?></a></div>
                  <div class="help-block hider"><?php echo $products_helper; ?></div>
                  <div><a onclick="ProductsDefault();" data-toggle="tooltip" title="<?php echo $help_button_default; ?>" class="btn btn-danger"><i class="fa fa-scissors"></i> <?php echo $button_default; ?></a></div>
                </div>
                <div class="col-sm-8">
                  <?php foreach ($oc_languages as $language) { ?>
                  <div class="help-block" style="text-align: center;"><input style="margin-left: 10%;" type="text" value="{products_header}" disabled="disabled" /></div>
                  <div class="input-group">
                    <span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
                    <textarea name="shoputils_mail_order_status_products_ft[<?php echo $language['language_id']; ?>]" rows="10"
                              id="products-<?php echo $language['language_id']; ?>"
                              placeholder="<?php echo $entry_products_ft; ?>"
                              class="form-control"><?php echo !empty($shoputils_mail_order_status_products_ft[$language['language_id']])
                                                   ? $shoputils_mail_order_status_products_ft[$language['language_id']] : $products_ft_default; ?></textarea>
                  </div>
                  <div class="help-block" style="text-align: center;"><input style="margin-left: 10%;" type="text" value="{products_footer}" disabled="disabled" /></div>
                  <?php } ?>
                    <textarea style="display: none;" id="products-default"><?php echo $products_ft_default; ?></textarea>
                </div>
              </div>

              <div class="form-group">
                <div class="col-sm-12">
                  <h2><?php echo $entry_products_header_ft; ?></h2>
                </div>
              </div>

              <div class="form-group">
                <div class="col-sm-4">
                  <label class="control-label"><span data-toggle="tooltip" title="<?php echo $help_products_header_ft; ?>"><?php echo $entry_products_header_ft; ?></span></label>
                  <div><a onclick="ProductsHeaderDefault();" data-toggle="tooltip" title="<?php echo $help_button_default; ?>" class="btn btn-danger"><i class="fa fa-scissors"></i> <?php echo $button_default; ?></a></div>
                </div>
                <div class="col-sm-8">
                  <?php foreach ($oc_languages as $language) { ?>
                  <div class="input-group">
                    <span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
                    <textarea name="shoputils_mail_order_status_products_header_ft[<?php echo $language['language_id']; ?>]" rows="10"
                              id="products-header-<?php echo $language['language_id']; ?>"
                              placeholder="<?php echo $entry_products_header_ft; ?>"
                              class="form-control"><?php echo !empty($shoputils_mail_order_status_products_header_ft[$language['language_id']])
                                                   ? $shoputils_mail_order_status_products_header_ft[$language['language_id']] : $products_header_ft_default; ?></textarea>
                  </div>
                  <?php } ?>
                    <textarea style="display: none;" id="products-header-default"><?php echo $products_header_ft_default; ?></textarea>
                </div>
              </div>

              <div class="form-group">
                <div class="col-sm-12">
                  <h2><?php echo $entry_products_footer_ft; ?></h2>
                </div>
              </div>

              <div class="form-group">
                <div class="col-sm-4">
                  <label class="control-label"><span data-toggle="tooltip" title="<?php echo $help_products_footer_ft; ?>"><?php echo $entry_products_footer_ft; ?></span></label>
                  <div><a onclick="ProductsFooterDefault();" data-toggle="tooltip" title="<?php echo $help_button_default; ?>" class="btn btn-danger"><i class="fa fa-scissors"></i> <?php echo $button_default; ?></a></div>
                </div>
                <div class="col-sm-8">
                  <?php foreach ($oc_languages as $language) { ?>
                  <div class="input-group">
                    <span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
                    <textarea name="shoputils_mail_order_status_products_footer_ft[<?php echo $language['language_id']; ?>]" rows="10"
                              id="products-footer-<?php echo $language['language_id']; ?>"
                              placeholder="<?php echo $entry_products_footer_ft; ?>"
                              class="form-control"><?php echo !empty($shoputils_mail_order_status_products_footer_ft[$language['language_id']])
                                                   ? $shoputils_mail_order_status_products_footer_ft[$language['language_id']] : $products_footer_ft_default; ?></textarea>
                  </div>
                  <?php } ?>
                    <textarea style="display: none;" id="products-footer-default"><?php echo $products_footer_ft_default; ?></textarea>
                </div>
              </div>

              <div class="form-group">
                <div class="col-sm-12">
                  <h2><?php echo $entry_totals_ft; ?></h2>
                </div>
              </div>

              <div class="form-group">
                <div class="col-sm-4">
                  <label class="control-label"><span data-toggle="tooltip" title="<?php echo $help_totals_ft; ?>"><?php echo $entry_totals_ft; ?></span></label>
                  <div class="help-block"><a class="hidelink"><?php echo $help_list_helper; ?></a></div>
                  <div class="help-block hider"><?php echo $totals_helper; ?></div>
                  <div><a onclick="TotalsDefault();" data-toggle="tooltip" title="<?php echo $help_button_default; ?>" class="btn btn-danger"><i class="fa fa-scissors"></i> <?php echo $button_default; ?></a></div>
                </div>
                <div class="col-sm-8">
                  <?php foreach ($oc_languages as $language) { ?>
                  <div class="help-block" style="text-align: center;"><input style="margin-left: 10%;" type="text" value="{totals_header}" disabled="disabled" /></div>
                  <div class="input-group">
                    <span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
                    <textarea name="shoputils_mail_order_status_totals_ft[<?php echo $language['language_id']; ?>]" rows="10"
                              id="totals-<?php echo $language['language_id']; ?>"
                              placeholder="<?php echo $entry_totals_ft; ?>"
                              class="form-control"><?php echo !empty($shoputils_mail_order_status_totals_ft[$language['language_id']])
                                                   ? $shoputils_mail_order_status_totals_ft[$language['language_id']] : $totals_ft_default; ?></textarea>
                  </div>
                  <div class="help-block" style="text-align: center;"><input style="margin-left: 10%;" type="text" value="{totals_footer}" disabled="disabled" /></div>
                  <?php } ?>
                    <textarea style="display: none;" id="totals-default"><?php echo $totals_ft_default; ?></textarea>
                </div>
              </div>

              <div class="form-group">
                <div class="col-sm-12">
                  <h2><?php echo $entry_totals_header_ft; ?></h2>
                </div>
              </div>

              <div class="form-group">
                <div class="col-sm-4">
                  <label class="control-label"><span data-toggle="tooltip" title="<?php echo $help_totals_header_ft; ?>"><?php echo $entry_totals_header_ft; ?></span></label>
                  <div><a onclick="TotalsHeaderDefault();" data-toggle="tooltip" title="<?php echo $help_button_default; ?>" class="btn btn-danger"><i class="fa fa-scissors"></i> <?php echo $button_default; ?></a></div>
                </div>
                <div class="col-sm-8">
                  <?php foreach ($oc_languages as $language) { ?>
                  <div class="input-group">
                    <span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
                    <textarea name="shoputils_mail_order_status_totals_header_ft[<?php echo $language['language_id']; ?>]" rows="10"
                              id="totals-header-<?php echo $language['language_id']; ?>"
                              placeholder="<?php echo $entry_totals_header_ft; ?>"
                              class="form-control"><?php echo !empty($shoputils_mail_order_status_totals_header_ft[$language['language_id']])
                                                   ? $shoputils_mail_order_status_totals_header_ft[$language['language_id']] : $totals_header_ft_default; ?></textarea>
                  </div>
                  <?php } ?>
                    <textarea style="display: none;" id="totals-header-default"><?php echo $totals_header_ft_default; ?></textarea>
                </div>
              </div>

              <div class="form-group">
                <div class="col-sm-12">
                  <h2><?php echo $entry_totals_footer_ft; ?></h2>
                </div>
              </div>

              <div class="form-group">
                <div class="col-sm-4">
                  <label class="control-label"><span data-toggle="tooltip" title="<?php echo $help_totals_footer_ft; ?>"><?php echo $entry_totals_footer_ft; ?></span></label>
                  <div><a onclick="TotalsFooterDefault();" data-toggle="tooltip" title="<?php echo $help_button_default; ?>" class="btn btn-danger"><i class="fa fa-scissors"></i> <?php echo $button_default; ?></a></div>
                </div>
                <div class="col-sm-8">
                  <?php foreach ($oc_languages as $language) { ?>
                  <div class="input-group">
                    <span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
                    <textarea name="shoputils_mail_order_status_totals_footer_ft[<?php echo $language['language_id']; ?>]" rows="10"
                              id="totals-footer-<?php echo $language['language_id']; ?>"
                              placeholder="<?php echo $entry_totals_footer_ft; ?>"
                              class="form-control"><?php echo !empty($shoputils_mail_order_status_totals_footer_ft[$language['language_id']])
                                                   ? $shoputils_mail_order_status_totals_footer_ft[$language['language_id']] : $totals_footer_ft_default; ?></textarea>
                  </div>
                  <?php } ?>
                    <textarea style="display: none;" id="totals-footer-default"><?php echo $totals_footer_ft_default; ?></textarea>
                </div>
              </div>

              <div class="form-group">
                <div class="col-sm-12">
                  <h2><?php echo $entry_product_first_ft; ?></h2>
                </div>
              </div>

              <div class="form-group">
                <div class="col-sm-4">
                  <label class="control-label"><span data-toggle="tooltip" title="<?php echo $help_product_first_ft; ?>"><?php echo $entry_product_first_ft; ?></span></label>
                  <div class="help-block"><a class="hidelink"><?php echo $help_list_helper; ?></a></div>
                  <div class="help-block hider"><?php echo $products_helper; ?></div>
                  <div><a onclick="ProductFirstDefault();" data-toggle="tooltip" title="<?php echo $help_button_default; ?>" class="btn btn-danger"><i class="fa fa-scissors"></i> <?php echo $button_default; ?></a></div>
                </div>
                <div class="col-sm-8">
                  <?php foreach ($oc_languages as $language) { ?>
                  <div class="input-group">
                    <span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
                    <textarea name="shoputils_mail_order_status_product_first_ft[<?php echo $language['language_id']; ?>]" rows="10"
                              id="product-first-<?php echo $language['language_id']; ?>"
                              placeholder="<?php echo $entry_product_first_ft; ?>"
                              class="form-control"><?php echo !empty($shoputils_mail_order_status_product_first_ft[$language['language_id']])
                                                   ? $shoputils_mail_order_status_product_first_ft[$language['language_id']] : $product_first_ft_default; ?></textarea>
                  </div>
                  <?php } ?>
                    <textarea style="display: none;" id="product-first-default"><?php echo $product_first_ft_default; ?></textarea>
                </div>
              </div>

              <div class="form-group">
                <div class="col-sm-12">
                  <h2><?php echo $entry_product_last_ft; ?></h2>
                </div>
              </div>

              <div class="form-group">
                <div class="col-sm-4">
                  <label class="control-label"><span data-toggle="tooltip" title="<?php echo $help_product_last_ft; ?>"><?php echo $entry_product_last_ft; ?></span></label>
                  <div class="help-block"><a class="hidelink"><?php echo $help_list_helper; ?></a></div>
                  <div class="help-block hider"><?php echo $products_helper; ?></div>
                  <div><a onclick="ProductLastDefault();" data-toggle="tooltip" title="<?php echo $help_button_default; ?>" class="btn btn-danger"><i class="fa fa-scissors"></i> <?php echo $button_default; ?></a></div>
                </div>
                <div class="col-sm-8">
                  <?php foreach ($oc_languages as $language) { ?>
                  <div class="input-group">
                    <span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
                    <textarea name="shoputils_mail_order_status_product_last_ft[<?php echo $language['language_id']; ?>]" rows="10"
                              id="product-last-<?php echo $language['language_id']; ?>"
                              placeholder="<?php echo $entry_product_last_ft; ?>"
                              class="form-control"><?php echo !empty($shoputils_mail_order_status_product_last_ft[$language['language_id']])
                                                   ? $shoputils_mail_order_status_product_last_ft[$language['language_id']] : $product_last_ft_default; ?></textarea>
                  </div>
                  <?php } ?>
                    <textarea style="display: none;" id="product-last-default"><?php echo $product_last_ft_default; ?></textarea>
                </div>
              </div>

            </div><!-- </div id="tab_settings_ft"> -->
          </div><!-- </div class="tab-content"> -->
        </form>
        <div style="padding: 15px 15px; border:1px solid #ccc; margin-top: 15px; box-shadow:0 0px 5px rgba(0,0,0,0.1);"><?php echo $text_copyright; ?></div>
      </div><!-- </div class="panel-body"> -->
    </div><!-- </div class="panel panel-default"> -->
  </div><!-- </div class="container-fluid"> -->
</div><!-- </div id="content"> -->

<script type="text/javascript" src="view/javascript/ckeditor/ckeditor.js"></script>
<script type="text/javascript"><!--
    $('.panel-body').on('dblclick', '.on-summernote', function () {
        $(this).summernote({
          height: 300
        });
        $(this).parent().prev('.help-block').hide();
    });
  function NewContentDefault() {
    if (confirm('<?php echo $text_confirm; ?>')){
      var value = $('#new-content-default').val();
      <?php foreach ($oc_languages as $language) { ?>
        //CKEDITOR.instances['new-content-<?php echo $language['language_id']; ?>'].setData(value);
        $('#new-content-<?php echo $language['language_id']; ?>').val(value);
      <?php } ?>
    }
  }

  function AdminNewContentDefault() {
    if (confirm('<?php echo $text_confirm; ?>')){
      var value = $('#admin-new-content-default').val();
      <?php foreach ($oc_languages as $language) { ?>
        $('#admin-new-content-<?php echo $language['language_id']; ?>').val(value);
      <?php } ?>
    }
  }

  function ProductsDefault() {
    if (confirm('<?php echo $text_confirm; ?>')){
      var value = $('#products-default').val();
      <?php foreach ($oc_languages as $language) { ?>
        $('#products-<?php echo $language['language_id']; ?>').val(value);
      <?php } ?>
    }
  }

  function ProductsHeaderDefault() {
    if (confirm('<?php echo $text_confirm; ?>')){
      var value = $('#products-header-default').val();
      <?php foreach ($oc_languages as $language) { ?>
        $('#products-header-<?php echo $language['language_id']; ?>').val(value);
      <?php } ?>
    }
  }

  function ProductsFooterDefault() {
    if (confirm('<?php echo $text_confirm; ?>')){
      var value = $('#products-footer-default').val();
      <?php foreach ($oc_languages as $language) { ?>
        $('#products-footer-<?php echo $language['language_id']; ?>').val(value);
      <?php } ?>
    }
  }

  function TotalsDefault() {
    if (confirm('<?php echo $text_confirm; ?>')){
      var value = $('#totals-default').val();
      <?php foreach ($oc_languages as $language) { ?>
        $('#totals-<?php echo $language['language_id']; ?>').val(value);
      <?php } ?>
    }
  }

  function TotalsHeaderDefault() {
    if (confirm('<?php echo $text_confirm; ?>')){
      var value = $('#totals-header-default').val();
      <?php foreach ($oc_languages as $language) { ?>
        $('#totals-header-<?php echo $language['language_id']; ?>').val(value);
      <?php } ?>
    }
  }

  function TotalsFooterDefault() {
    if (confirm('<?php echo $text_confirm; ?>')){
      var value = $('#totals-footer-default').val();
      <?php foreach ($oc_languages as $language) { ?>
        $('#totals-footer-<?php echo $language['language_id']; ?>').val(value);
      <?php } ?>
    }
  }

  function ProductFirstDefault() {
    if (confirm('<?php echo $text_confirm; ?>')){
      var value = $('#product-first-default').val();
      <?php foreach ($oc_languages as $language) { ?>
        $('#product-first-<?php echo $language['language_id']; ?>').val(value);
      <?php } ?>
    }
  }

  function ProductLastDefault() {
    if (confirm('<?php echo $text_confirm; ?>')){
      var value = $('#product-last-default').val();
      <?php foreach ($oc_languages as $language) { ?>
        $('#product-last-<?php echo $language['language_id']; ?>').val(value);
      <?php } ?>
    }
  }

  $(document).ready(function(){
    $('.panel-body h2').css({
        'text-transform': 'uppercase',
        'color': '#FF802B',
        'font-size': '15px',
        'font-weight': 'bold',
        'padding-bottom': '3px',
        'border-bottom': '1px dotted #000'
    });
    $('.hidelink').css('cursor', 'pointer');
    $('.hider').hide();
    $('.alert-success').slideDown().delay(2000).slideUp(1000);
  });

  $('a.hidelink').click(function () {
      $(this).parent().next().toggle("slow");
  });

$('#order_statuses a:first').tab('show');
//--></script>
<?php echo $footer; ?>