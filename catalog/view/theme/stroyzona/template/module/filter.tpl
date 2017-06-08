<div class="panel panel-default">
    <div class="filter-nav col-xs-6">
    <form>
    <ul class="nav">
        <?php if($route) { ?>

        <?php if($section == 'all') $checked_all = 'checked="checked"';
              else $checked_all = '';
              if($section == 'special') $checked_special = 'checked="checked"';
              else $checked_special = '';
              if($section == 'latest') $checked_latest = 'checked="checked"';
              else $checked_latest = '';
         ?>

      <li><label for="nav1"><?php echo $text_all;?></label><input id="nav1" <?php echo $checked_all;?> checked type="radio" name="section" value="all"/></li>
      <li><label for="nav2"><?php echo $text_special;?></label><input id="nav2" <?php echo $checked_special;?> type="radio" name="section" value="special" /></li>
      <li><label for="nav3"><?php echo $text_latest;?></label><input id="nav3" <?php echo $checked_latest;?> type="radio" name="section" value="latest" /></li>
    </ul>
        <?php } ?>

    </form>


  </div>
  <div class="range-filter-wrap col-sm-12 col-xs-6">
    <p class="range-filter">
      <label for="amount"><?php echo $text_range;?></label>
      <input type="text" id="amount" readonly style="border:0; color:#f6931f; font-weight:bold;"
              <?php if (isset($min_price_session)) { ?>
        data-min="<?php echo $min_price_session; ?>"
        data-max="<?php echo $max_price_session; ?>"
        <?php } ?>/>
    </p>
    <div id="slider-range"></div>
  </div>

  <div class="more-filter-title"><?php echo $heading_title;?></div>

  <div class="list-group">
    <div class="category-filter">
      <?php foreach ($filter_groups as $filter_group) { ?>
      <div class="list-group-item">
        <div class="filter-show"><?php echo $filter_group['name']; ?><i class="fa fa-chevron-circle-down"></i></div>
        <div id="filter-group<?php echo $filter_group['filter_group_id']; ?>" class="filter-wrap">
          <?php foreach ($filter_group['filter'] as $filter) { ?>
          <?php if (in_array($filter['filter_id'], $filter_category)) { ?>
          <label class="checkbox">
            <input name="filter[]" type="checkbox" value="<?php echo $filter['filter_id']; ?>" checked="checked" />
            <div class="label-text"><?php echo $filter['name']; ?></div></label>
          <?php } else { ?>
          <label class="checkbox">
            <input name="filter[]" type="checkbox" value="<?php echo $filter['filter_id']; ?>" />
            <div class="label-text"><?php echo $filter['name']; ?></div></label>
          <?php } ?>
          <?php } ?>
        </div>
      </div>
      <?php } ?>
    </div>
    <div class="text-right">
        <button type="button" id="button-filter" class="btn btn-primary"><?php echo $button_filter; ?></button>
      </div>
  </div>

</div>
<script type="text/javascript"><!--
$('#button-filter').on('click', function() {
	filter = [];
	
	$('input[name^=\'filter\']:checked').each(function(element) {
		filter.push(this.value);
	});
    var in_store = $('#nav4:checked').val();
    var min_price = $('#amount').attr('data-min');
    var max_price = $('#amount').attr('data-max');

    if(in_store == undefined) in_store = 'off';

    <?php if($route) { ?>
    var section = $('input[name="section"]:checked').val();
    if(section == undefined) section = 'all';
    if(min_price == undefined) min_price = <?php echo $min_price;?>;
    if(max_price == undefined) max_price = <?php echo $max_price;?>;
    <?php } ?>
    <?php if($route) { ?>
        location = '<?php echo $action; ?>&filter=' + filter.join(',')+'&section='+section+'&in_store='+in_store+'&price='+min_price+'-'+max_price;
    <?php } else { ?>
        location = '<?php echo $action; ?>&filter=' + filter.join(',')+'&in_store='+in_store+'&price='+min_price+'-'+max_price;
    <?php } ?>

});
//--></script>

<script>
  $(function() {
    $( "#slider-range" ).slider({
      range: true,
      min: <?php echo $min_price; ?>,
      max: <?php echo $max_price; ?>,
      values: [ <?php echo $lower_price;?>, <?php echo $upper_price;?> ],
      slide: function( event, ui ) {
          var selector = $('#amount');
          selector.val( "<?php echo $symbol_left;?>" + ui.values[ 0 ] + "<?php echo $symbol_right;?> - <?php echo $symbol_left;?>" + ui.values[ 1 ] + "<?php echo $symbol_right;?>");
          selector.attr('data-min', ui.values[ 0 ]);
          selector.attr('data-max', ui.values[ 1 ]);
      }
    });
    $( "#amount" ).val( "<?php echo $symbol_left;?>" + $( "#slider-range" ).slider( "values", 0 ) +
      "<?php echo $symbol_right;?>  - <?php echo $symbol_left;?>" + $( "#slider-range" ).slider( "values", 1 )+"<?php echo $symbol_right;?>" );
  });
  </script>
