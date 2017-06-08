<?php if ($modules && $modules[0] != null) { ?>
<column id="column-left" class="col-sm-3 col-xs-12">
  <?php foreach ($modules as $module) { ?>
  <?php echo $module; ?>
  <?php } ?>
</column>
<?php } ?>