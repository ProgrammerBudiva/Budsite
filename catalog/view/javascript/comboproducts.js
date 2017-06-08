var wishlist_combo = {
	'add': function(product_id) {
        $('.modal-body .alert-success').remove();
        $.ajax({
			url: 'index.php?route=account/wishlist/add',
			type: 'post',
			data: 'product_id=' + product_id,
			dataType: 'json',
			success: function(json) {
				$("#combo-notification .modal-footer").hide();
				$("#combo-notification").modal('show');
				if (json['success']) {
					/*$('#content').parent().before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');*/
					$("#combo-notification .modal-body p").append('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
				}

				if (json['info']) {
					/*$('#content').parent().before('<div class="alert alert-info"><i class="fa fa-info-circle"></i> ' + json['info'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');*/
					$("#combo-notification .modal-body p").append('<div class="alert alert-info"><i class="fa fa-info-circle"></i> ' + json['info'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
				}

				$('#wishlist-total span').text(json['total']);

				$('html, body').animate({ scrollTop: 0 }, 'slow');
			}
		});
	}
}

var cart_combo = {
	'add': function(product_id, quantity) {
        $('.modal-body .alert-success').remove();

        $.ajax({
			url: 'index.php?route=checkout/cart/add',
			type: 'post',
			data: 'product_id=' + product_id + '&quantity=' + (typeof(quantity) != 'undefined' ? quantity : 1),
			dataType: 'json',

			success: function(json) {

				$("#combo-notification .modal-footer").hide();
				$("#combo-notification").modal('show');

				if (json['redirect']) {
					/*$('#content').parent().before('<div class="alert alert-warning"><i class="fa fa-warning"></i> ' + json['warning'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');*/
					$("#combo-notification .modal-body p").append('<div class="alert alert-warning"><i class="fa fa-warning"></i> ' + json['warning'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
				}

				if (json['success']) {
					/*$('#content').parent().before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');*/
					$("#combo-notification .modal-body p").append('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

					setTimeout(function () {
						$('#cart > button').html('<i class="fa fa-shopping-cart"></i><span id="cart-total"> ' + json['total'] + '</span>');
					}, 100);

					$('html, body').animate({ scrollTop: 0 }, 'slow');

					$('#cart > ul').load('index.php?route=common/cart/info ul li');
				}

				$('#cart').addClass("open");

				$('#cart .dropdown-menu').css({"opacity":"1"});
				setTimeout(function () {
					$('#cart .dropdown-menu').animate({
							opacity: 0
						},1000,function(){
							$('#cart').removeClass("open");
							$('#cart .dropdown-menu').css({"opacity":"1"});
						}
					);
				}, 3000);
			}
		});
	}
}