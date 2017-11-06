$(document).ready(function () {
    $(function () {
        $('form').submit(function () {
            return false;
        });
    });

    $('.plus').on('click', function () {
        var input = $(this).parent().find('input');
        var input_name = input.attr('name');
        var quantity = parseInt(input.val()) + 1;
        update_cart($(input), quantity);
        $('input[name="' + input_name + '"]').val(quantity);
        $('#cart > ul').load('index.php?route=common/cart/info ul li');
    });

    $('.minus').on('click', function () {
        var input = $(this).parent().find('input');
        var input_name = input.attr('name');
        var quantity = parseInt(input.val()) - 1;
        if (quantity > 0) {
            update_cart($(input), quantity);
            $('input[name="' + input_name + '"]').val(quantity);
            $('#cart > ul').load('index.php?route=common/cart/info ul li');
        }
    });

    $('input.product_quantity').on('keyup', function(){
        var $this = $(this);
        setTimeout(function(){
            update_cart($this, $this.val());
        },300);
    });

    function update_cart(input, quantity) {
        var name = input.attr('name');
        var id = input.parent().parent().parent().parent().find('*.cart-total').attr('data-id');
        var price = parseFloat(input.attr('data-price'));
        var quantity_array = {};
        quantity_array['' + name] = quantity;
        if (quantity > 0) {
            $.post(
                '/index.php?route=checkout/cart/ajax_edit',
                {quantity: quantity_array, price: price},
                function (response) {
                    var json = JSON.parse(response);
                    $('.' + id).text(json.new_price);
                    $('.product-' + id).html(json.new_price);
                    //$('.total-total').html(json.total_total);
                    $('.total-total').html(json.total_sub_total);
                    $('.total-discount').html(json.total_discount + ' грн');
                    $('.total-sub_total').html(json.total_sub_total);
                    $('.total-sum_discounts').html(json.total_discounts_text);
                    $('.title-sum_discounts').html(json.total_discounts_title);
                    $('.total-combo_products').html(json.total_combo_products);
                    $('#cart-total').html(json.total_count);

                    if(!json.total_discount || json.total_discount === 0){
                        $('#discount-row').remove();
                    }
                }
            );
        }
    }

    /* Удаление товара из корзины */
    $('.cart-delete').click(function () {
        var $this = $(this);
        var key = $this.data('key');
        var product = JSON.parse($this.parents().find('meta[data-type="product-info"]').attr('content'));
        cart.remove(key, product);
        if ($this.parents('.d-table-row').length > 0) {
            var $rowContainer = $this.parents('.d-table-row').parent();
            $this.parents('.d-table-row').remove();
            $rowContainer.data('productCount', $rowContainer.find('.d-table-row').length);
            if ($rowContainer.data('productCount') == 0) {
                location = '/shopping-cart';
            }
        }
    });
});